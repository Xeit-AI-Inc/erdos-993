#!/usr/bin/env python3
"""Proposed, inactive DRE file/return/case checks. No registry authority."""

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path, PurePosixPath


HEX = re.compile(r"[0-9a-f]{64}\Z")
CLAIM_ID = re.compile(r"[A-Za-z0-9][A-Za-z0-9._:-]*\Z")
WORKER = re.compile(r"C([1-6])-(?:([TFU])([1-3])|C([TFU])-([TFU])([1-3])|A([TFU])|(SYNTHESIS))\Z")
BAD_KEYS = {"timestamp", "created_at", "updated_at", "wallclock", "wall_clock", "claim_hash", "claim_sha256"}


class CheckError(ValueError):
    pass


def fail(message):
    raise CheckError(message)


def pairs_unique(pairs):
    result = {}
    for key, value in pairs:
        if key in result:
            fail(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json(path):
    try:
        return json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=pairs_unique,
                          parse_constant=lambda value: fail(f"non-finite JSON number: {value}"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        fail(f"cannot read JSON {path}: {exc}")


def root_path(value):
    root = Path(value)
    if not root.is_absolute() or not root.is_dir() or root.is_symlink():
        fail("--root must be an existing absolute, non-symlink directory")
    return root.resolve(strict=True)


def member(root, value, *, existing=True):
    if not isinstance(value, str) or not value or "\\" in value or "\x00" in value:
        fail(f"invalid relative path: {value!r}")
    pure = PurePosixPath(value)
    if pure.is_absolute() or any(part in ("", ".", "..") for part in value.split("/")):
        fail(f"unsafe relative path: {value!r}")
    path = root.joinpath(*pure.parts)
    if not path.is_relative_to(root):
        fail(f"path escapes root: {value}")
    for part in (path, *path.parents):
        if part == root:
            break
        if part.is_symlink():
            fail(f"symlink in path: {value}")
    if existing and not path.is_file():
        fail(f"missing or non-file source: {value}")
    if not existing and (path.exists() or path.is_symlink()):
        fail(f"output already exists: {value}")
    return path


def digest(path):
    hasher = hashlib.sha256()
    with path.open("rb") as source:
        for block in iter(lambda: source.read(1024 * 1024), b""):
            hasher.update(block)
    return hasher.hexdigest()


def pin(root, item):
    if not isinstance(item, dict) or set(item) != {"path", "sha256"}:
        fail("pin requires exactly path and sha256")
    if not isinstance(item["sha256"], str) or not HEX.fullmatch(item["sha256"]):
        fail(f"invalid SHA-256 for {item.get('path')}")
    path = member(root, item["path"])
    if digest(path) != item["sha256"]:
        fail(f"SHA-256 mismatch: {item['path']}")
    return item["path"]


def fresh_json(root, rel, data):
    target = member(root, rel, existing=False)
    if not target.parent.is_dir():
        fail(f"output parent is missing: {rel}")
    with target.open("x", encoding="utf-8", newline="\n") as output:
        json.dump(data, output, sort_keys=True, indent=2, ensure_ascii=False, allow_nan=False)
        output.write("\n")


def seal(root, paths, output):
    if not paths or len(set(paths)) != len(paths):
        fail("seal needs distinct explicit source paths")
    members = [{"path": rel, "sha256": digest(member(root, rel))} for rel in sorted(paths)]
    if output in paths:
        fail("manifest cannot seal itself")
    fresh_json(root, output, {"schema": "e993.worker-ops.seal.v1", "members": members})


def verify(root, manifest):
    data = load_json(member(root, manifest))
    if not isinstance(data, dict) or set(data) != {"schema", "members"} or data["schema"] != "e993.worker-ops.seal.v1":
        fail("invalid seal schema")
    rows = data["members"]
    if not isinstance(rows, list) or not rows:
        fail("seal has no members")
    paths = [pin(root, row) for row in rows]
    if paths != sorted(set(paths)) or manifest in paths:
        fail("seal members must be sorted, distinct, and exclude the seal")
    return paths


def worker_spec(worker_id):
    match = WORKER.fullmatch(worker_id) if isinstance(worker_id, str) else None
    if not match:
        fail(f"worker is outside the 9/18/3/1 topology: {worker_id}")
    cycle = int(match[1])
    if match[2]:
        return cycle, "search", match[2], []
    if match[4]:
        critic, origin, index = match[4], match[5], match[6]
        if critic == origin:
            fail("critic must have a cross orientation")
        return cycle, "critique", critic, [f"C{cycle}-{origin}{index}"]
    if match[7]:
        origin = match[7]
        routes = [f"C{cycle}-{origin}{i}" for i in range(1, 4)]
        critics = [f"C{cycle}-C{other}-{origin}{i}" for i in range(1, 4)
                   for other in "TFU" if other != origin]
        return cycle, "adjudication", "N", routes + critics
    return cycle, "synthesis", "N", [f"C{cycle}-A{origin}" for origin in "TFU"]


def text_field(value, label):
    if not isinstance(value, str) or not value.strip():
        fail(f"{label} must be nonempty text")


def no_authority_keys(value):
    if isinstance(value, dict):
        for key, nested in value.items():
            if key.lower() in BAD_KEYS or key.lower() in {"registry_status", "authoritative_status"}:
                fail(f"worker return contains forbidden authority/time/hash key: {key}")
            no_authority_keys(nested)
    elif isinstance(value, list):
        for nested in value:
            no_authority_keys(nested)


def validate_return(root, rel, worker_id, expected=None):
    cycle, stage, orientation, _ = worker_spec(worker_id)
    data = load_json(member(root, rel))
    if not isinstance(data, dict):
        fail("worker return must be a JSON object")
    no_authority_keys(data)
    required = {"worker_id", "cycle", "stage", "orientation", "claims", "report_path", "limitations", "status_authority"}
    if stage != "search":
        required.add("covered_claim_ids")
    if not required.issubset(data) or data["worker_id"] != worker_id or type(data["cycle"]) is not int or data["cycle"] != cycle or data["stage"] != stage or data["orientation"] != orientation:
        fail(f"return identity/schema mismatch: {worker_id}")
    if data["status_authority"] != "proposed_worker_only":
        fail("worker status must be marked proposed_worker_only")
    if not isinstance(data["claims"], list) or not isinstance(data["limitations"], list):
        fail("claims and limitations must be arrays")
    for limitation in data["limitations"]:
        text_field(limitation, "limitation")
    member(root, data["report_path"])
    claim_ids = []
    for claim in data["claims"]:
        if not isinstance(claim, dict) or set(claim) != {"claim_id", "statement", "scope", "status", "evidence_paths", "reason"}:
            fail("claim must have exactly claim_id, statement, scope, status, evidence_paths, reason")
        claim_id = claim["claim_id"]
        if not isinstance(claim_id, str) or not CLAIM_ID.fullmatch(claim_id):
            fail("invalid claim_id")
        claim_ids.append(claim_id)
        for key in ("statement", "scope", "reason"):
            text_field(claim[key], key)
        if not isinstance(claim["status"], str) or not claim["status"].startswith("proposed_") or len(claim["status"]) <= len("proposed_"):
            fail(f"claim status is not explicitly proposed: {claim_id}")
        evidence = claim["evidence_paths"]
        if not isinstance(evidence, list) or len(evidence) != len(set(evidence)):
            fail(f"invalid evidence_paths: {claim_id}")
        for path in evidence:
            member(root, path)
    if len(claim_ids) != len(set(claim_ids)):
        fail("duplicate claim_id")
    covered = data.get("covered_claim_ids", [])
    if not isinstance(covered, list) or len(covered) != len(set(covered)) or any(not isinstance(x, str) or not CLAIM_ID.fullmatch(x) for x in covered):
        fail("invalid covered_claim_ids")
    if stage == "search" and covered:
        fail("search return must not claim review coverage")
    if stage != "search":
        if expected is not None and set(covered) != set(expected):
            fail(f"incomplete or extra claim coverage for {worker_id}: expected {sorted(expected)}, got {sorted(covered)}")
        if not set(covered).issubset(claim_ids):
            fail(f"covered claims lack dispositions in {worker_id}")
    return data


def inventory(root, rel):
    data = load_json(member(root, rel))
    if not isinstance(data, dict) or set(data) != {"schema", "workers"} or data["schema"] != "e993.worker-ops.inventory.v1" or not isinstance(data["workers"], dict):
        fail("invalid inventory schema")
    return data["workers"]


def source(root, workers, worker_id, *, synthesis=False):
    worker_spec(worker_id)
    row = workers.get(worker_id)
    if not isinstance(row, dict) or set(row) != {"return_path", "files"} or not isinstance(row["files"], list) or not row["files"]:
        fail(f"missing source inventory: {worker_id}")
    paths = [pin(root, item) for item in row["files"]]
    if len(paths) != len(set(paths)) or row["return_path"] not in paths:
        fail(f"duplicate or unpinned return: {worker_id}")
    data = validate_return(root, row["return_path"], worker_id)
    referenced = {row["return_path"], data["report_path"]}
    for claim in data["claims"]:
        referenced.update(claim["evidence_paths"])
    if not referenced.issubset(paths):
        fail(f"return names unpinned report/evidence: {worker_id}")
    parent = PurePosixPath(row["return_path"]).parent
    if parent == PurePosixPath("."):
        fail(f"source return needs a dedicated output directory: {worker_id}")
    if any(not PurePosixPath(path).is_relative_to(parent) for path in paths):
        fail(f"source inventory escapes its worker output directory: {worker_id}")
    if synthesis and any(PurePosixPath(path).parent != parent for path in paths):
        fail(f"synthesis admits only top-level adjudicator output: {worker_id}")
    return data, row["files"]


def dependencies(root, workers, worker_id):
    _, stage, _, source_ids = worker_spec(worker_id)
    claims = set()
    files = []
    for source_id in source_ids:
        data, source_files = source(root, workers, source_id, synthesis=stage == "synthesis")
        claims.update(claim["claim_id"] for claim in data["claims"])
        files.extend(source_files)
    paths = [item["path"] for item in files]
    if len(paths) != len(set(paths)):
        fail("same source path pinned twice")
    return sorted(claims), sorted(files, key=lambda item: item["path"]), source_ids


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", required=True, help="absolute run root")
    sub = parser.add_subparsers(dest="command", required=True)
    p = sub.add_parser("seal")
    p.add_argument("--output", required=True)
    p.add_argument("files", nargs="+")
    p = sub.add_parser("verify")
    p.add_argument("--manifest", required=True)
    p = sub.add_parser("validate-return")
    p.add_argument("--worker", required=True)
    p.add_argument("--return-path", required=True)
    p.add_argument("--inventory")
    p = sub.add_parser("case")
    p.add_argument("--worker", required=True)
    p.add_argument("--inventory", required=True)
    p.add_argument("--output", required=True)
    args = parser.parse_args()
    try:
        root = root_path(args.root)
        if args.command == "seal":
            seal(root, args.files, args.output)
        elif args.command == "verify":
            verify(root, args.manifest)
        elif args.command == "validate-return":
            _, stage, _, _ = worker_spec(args.worker)
            if stage != "search" and not args.inventory:
                fail("review-stage validation requires --inventory")
            expected = dependencies(root, inventory(root, args.inventory), args.worker)[0] if args.inventory else None
            validate_return(root, args.return_path, args.worker, expected)
        else:
            cycle, stage, orientation, _ = worker_spec(args.worker)
            expected, files, source_ids = dependencies(root, inventory(root, args.inventory), args.worker)
            fresh_json(root, args.output, {
                "schema": "e993.worker-ops.case.v1", "worker_id": args.worker,
                "cycle": cycle, "stage": stage, "orientation": orientation,
                "model": "gpt-6-luna" if stage == "search" else "gpt-6-sol",
                "reasoning_effort": "high", "source_worker_ids": source_ids,
                "allowed_source_files": files, "required_covered_claim_ids": expected,
                "status_authority": "proposed_worker_only",
            })
        print("ok")
    except (CheckError, OSError, TypeError) as exc:
        print(f"worker_ops: {exc}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
