#!/usr/bin/env python3
"""Stage a reviewable Cycle 5 intake bundle. Never dispatch or edit canonical files.

The output is a fresh directory *inside this scratchpad directory*. Its control/,
ledgers/, and packets/ paths are proposed final paths, not installed authority.
"""

import argparse
import csv
import hashlib
import io
import json
import os
from pathlib import Path, PurePosixPath


BUILDER_DIR = Path(__file__).resolve().parent
PRIMARY = "E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE"
TM = "E993-ORDINARY-TM-LOWER-REGION-AGGREGATE"
ORIENTATIONS = "TFU"


def demand(ok, message):
    if not ok:
        raise ValueError(message)


def json_bytes(data):
    return (json.dumps(data, indent=2, sort_keys=True, ensure_ascii=False,
                       allow_nan=False) + "\n").encode("utf-8")


def member(root, raw):
    """Resolve an explicit regular source below root, rejecting symlink components."""
    value = str(raw)
    if Path(value).is_absolute():
        path = Path(value)
        demand(path.is_relative_to(root), f"source outside root: {value}")
        rel = path.relative_to(root)
        demand(".." not in rel.parts, f"unsafe absolute source: {value}")
    else:
        demand("\\" not in value and "\x00" not in value, f"unsafe source: {value}")
        pure = PurePosixPath(value)
        demand(not pure.is_absolute() and all(x not in ("", ".", "..") for x in value.split("/")),
               f"unsafe source: {value}")
        rel = Path(*pure.parts)
        path = root / rel
    for part in (path, *path.parents):
        if part == root:
            break
        demand(not part.is_symlink(), f"symlink source: {value}")
    demand(path.is_file(), f"missing regular source: {value}")
    return rel.as_posix(), path


def directory_files(root, raw, expected_worker):
    value = str(raw)
    path = Path(value) if Path(value).is_absolute() else root / value
    demand(path.is_relative_to(root) and not path.is_symlink() and path.is_dir(),
           f"invalid worker directory: {value}")
    demand(path == root / "cycles" / "cycle-4" / expected_worker,
           f"expected admitted cycles/cycle-4/{expected_worker}: {value}")
    names = sorted(p.name for p in path.iterdir() if p.is_file() and not p.is_symlink())
    demand("RETURN.json" in names and "REPORT.md" in names,
           f"missing return/report: {value}")
    for p in path.iterdir():
        demand(not p.is_symlink(), f"symlink in worker directory: {p}")
        demand(p.is_file(), f"nested or special worker output: {p}")
    ret = json.loads((path / "RETURN.json").read_text(encoding="utf-8"))
    demand(ret.get("worker_id") == expected_worker and ret.get("cycle") == 4,
           f"worker return identity mismatch: {value}")
    expected_stage = "synthesis" if expected_worker == "C4-SYNTHESIS" else "adjudication"
    demand(ret.get("stage") == expected_stage and ret.get("orientation") == "N",
           f"worker return stage mismatch: {value}")
    demand(ret.get("report_path") == str((path / "REPORT.md").relative_to(root)),
           f"worker report path mismatch: {value}")
    demand(ret.get("status_authority") == "proposed_worker_only",
           f"worker return has unexpected authority: {value}")
    return [str((path / name).relative_to(root)) for name in names]


def check_snapshot(identity_bytes, ledger_bytes):
    identity = json.loads(identity_bytes)
    rows = identity.get("claims")
    demand(isinstance(rows, list) and rows, "identity has no claim list")
    statuses = {}
    for row in rows:
        key, status = row.get("claim_key"), row.get("status")
        demand(isinstance(key, str) and key not in statuses and isinstance(status, str),
               "identity has duplicate or malformed claim")
        statuses[key] = status
    reader = csv.DictReader(io.StringIO(ledger_bytes.decode("utf-8")))
    demand(reader.fieldnames is not None and {"claim_id", "status"}.issubset(reader.fieldnames),
           "ledger lacks claim_id/status columns")
    ledger = {}
    for row in reader:
        key = row["claim_id"]
        demand(key not in ledger and key, "ledger has duplicate or blank claim")
        ledger[key] = row["status"]
    demand(statuses == ledger, "identity and ledger claim statuses differ")
    demand(statuses.get(PRIMARY) == "OPEN", "ordinary lower-region aggregate must remain OPEN")
    demand(statuses.get(TM) == "OPEN", "T_m family must await C5 review as OPEN")
    return len(statuses)


def fixed_sources():
    """Explicit C4 corrections and C5 proposal inputs; no private transport."""
    return {
        "historical_control": [
            "SOLUTION-CONTRACT.md", "WORKER-PROTOCOL.md", "EXECUTION-POLICY.md",
            "packets/C4-COMMON.json", "control/C4-SEARCH-ALLOCATION.json",
            "control/C4-INTAKE-RECONCILIATION.md",
            "control/C4-REGISTERED-CLAIM-IDENTITY.json",
            "ledgers/C4-OBLIGATIONS.csv",
            "control/C4-NEUTRAL-HANDOFF.md",
            "control/C4-GENERAL-SHELL-MATCHING-THRESHOLD.md",
            "control/C4-THIRD-SHELL-LOW-COVER-REDIRECTION.md",
            "control/C4-THIRD-SHELL-SMALL-RANK-FOLLOWUP.md",
            "control/C4-THIRD-SHELL-SMALL-RANK-SINGLETON-DP.json",
            "control/C4-TM-COEFFICIENT-PERTURBATION-PLAN.md",
            "control/C4-TM-DERIVATIVE-IDENTITY-DIRECTION.md",
            "control/C4-OCCUPANCY-BRIDGE-HIERARCHY.md",
            "inputs/C4-first-shell-frozen-intake/BASE.lean",
        ],
        "c4_corrections_proposal": [
            "preparation/C4-PREP-TECHNICAL-CORRECTIONS-AUDIT/REPORT.md",
            "preparation/C4-PREP-TECHNICAL-CORRECTIONS-AUDIT/RESULTS.json",
            "preparation/C4-PREP-TECHNICAL-CORRECTIONS-AUDIT/EVIDENCE.json",
            "preparation/C4-PREP-TECHNICAL-CORRECTIONS-AUDIT/F1-CORRECTION.md",
            "preparation/C4-PREP-TECHNICAL-CORRECTIONS-AUDIT/U2-CORRECTION.md",
            "preparation/C4-PREP-TECHNICAL-CORRECTIONS-AUDIT/U3-CORRECTION.md",
            "preparation/C4-PREP-SIGNED-MAP-AUDIT/REPORT.md",
            "preparation/C4-PREP-SIGNED-MAP-AUDIT/RESULTS.json",
        ],
        "tm_candidate_unawarded": [
            "control-proposals/C5-TM-CENTRAL-LC-CANDIDATE.md",
            "control-proposals/C5-TM-CENTRAL-LR-CANDIDATE.md",
            "control-proposals/C5-TM-BINOMIAL-NORMALIZED-RATIO-LEAD.md",
            "control-proposals/C5-TM-CENTRAL-LC-BASE.json",
            "control-proposals/C5-TM-CENTRAL-LR-BASE.json",
            "preparation/C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT/REPORT.md",
            "preparation/C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT/RESULTS.json",
            "preparation/C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT/EVIDENCE.json",
            "preparation/C5-PREP-TM-UNIFORM-CANDIDATE-AUDIT/REPLAY.py",
            "preparation/C5-PREP-TM-LEAN-READINESS/REPORT.md",
            "preparation/C5-PREP-TM-LEAN-READINESS/RESULTS.json",
            "preparation/C5-PREP-TM-LEAN-READINESS/FORMALIZATION-CHECKLIST.md",
        ],
        "heterogeneous_and_matching_directions_proposal": [
            "control-proposals/C5-HETEROGENEOUS-STAR-EXTENSION-DIRECTION.md",
            "preparation/C5-PREP-DIRECTION-AUDIT/REPORT.md",
            "preparation/C5-PREP-DIRECTION-AUDIT/RESULTS.json",
        ],
        "allocation_source_draft": ["control-proposals/C5-SEARCH-ALLOCATION-DRAFT.json"],
    }


def make_bundle(args):
    root = Path(args.run_root)
    demand(root.is_absolute() and root.is_dir() and not root.is_symlink(),
           "--run-root must be an absolute regular directory")
    root = root.resolve(strict=True)
    demand(BUILDER_DIR == root / "scratchpad" / "C5-PREP-PACKET-BUILDER",
           "builder is outside the intended run scratchpad")
    out = Path(args.output_dir)
    demand(out.is_absolute() and out.parent == BUILDER_DIR and not out.exists() and not out.is_symlink(),
           "--output-dir must be a fresh immediate child of this builder directory")

    groups = fixed_sources()
    for worker, raw in (("C4-AT", args.c4_at_dir), ("C4-AF", args.c4_af_dir),
                        ("C4-AU", args.c4_au_dir), ("C4-SYNTHESIS", args.c4_synthesis_dir)):
        groups["c4_selfcontained_portfolio" if worker != "C4-SYNTHESIS" else "c4_synthesis_proposed"] = (
            groups.get("c4_selfcontained_portfolio" if worker != "C4-SYNTHESIS" else "c4_synthesis_proposed", [])
            + directory_files(root, raw, worker))
    groups["current_authority_snapshot"] = [args.current_identity, args.current_ledger]
    groups["c4_controller_closeout"] = [args.c4_closeout]

    source_bytes = {}
    grades = {}
    for grade, paths in groups.items():
        for raw in paths:
            rel, path = member(root, raw)
            demand("/transport/" not in f"/{rel}/" and not rel.startswith("scratchpad/"),
                   f"private or live source forbidden: {rel}")
            demand(rel not in source_bytes, f"source repeated across grades: {rel}")
            source_bytes[rel] = path.read_bytes()
            grades[rel] = grade
    ident_rel = member(root, args.current_identity)[0]
    ledger_rel = member(root, args.current_ledger)[0]
    claim_count = check_snapshot(source_bytes[ident_rel], source_bytes[ledger_rel])
    closeout = source_bytes[member(root, args.c4_closeout)[0]]
    demand(b"C4" in closeout or b"Cycle 4" in closeout or b"Cycle4" in closeout,
           "C4 closeout does not identify Cycle 4")

    draft = json.loads(source_bytes["control-proposals/C5-SEARCH-ALLOCATION-DRAFT.json"])
    routes = draft.get("routes")
    expected_routes = {f"{o}{n}" for o in ORIENTATIONS for n in range(1, 7)}
    demand(draft.get("cycle") == 5 and isinstance(routes, dict) and set(routes) == expected_routes,
           "allocation must have exactly six T, six F, six U routes")
    demand(all(isinstance(v, str) and v.strip() for v in routes.values()), "blank allocation route")
    demand(sum("shell" in routes[f"{o}{n}"].lower() for o in ORIENTATIONS for n in range(1, 7)) <= 3,
           "allocation exceeds three shell seats")

    allocation = {
        "cycle": 5, "status_authority": "draft_intake_only",
        "common_rule": draft["common_rule"], "routes": routes,
        "source_draft_sha256": hashlib.sha256(source_bytes["control-proposals/C5-SEARCH-ALLOCATION-DRAFT.json"]).hexdigest(),
    }
    search_ids = [f"C5-{o}{n}" for o in ORIENTATIONS for n in range(1, 7)]
    critics = [f"C5-C{c}-{o}{n}" for o in ORIENTATIONS for n in range(1, 7)
               for c in ORIENTATIONS if c != o]
    topology = {
        "cycle": 5, "status_authority": "draft_intake_only",
        "max_simultaneous_worker_seats": 3,
        "stages": [
            {"stage": "search", "worker_ids": search_ids, "model": "gpt-6-luna", "reasoning_effort": "high"},
            {"stage": "critique", "worker_ids": critics, "model": "gpt-6-luna", "reasoning_effort": "high",
             "rule": "two independently opposing orientations per search return"},
            {"stage": "adjudication", "worker_ids": [f"C5-A{o}" for o in ORIENTATIONS],
             "model": "gpt-6-sol", "reasoning_effort": "high"},
            {"stage": "synthesis", "worker_ids": ["C5-SYNTHESIS"],
             "model": "gpt-6-sol", "reasoning_effort": "high"},
        ],
        "stage_gate": "Use worker_ops/controller_ops_v2 only after prior-stage admission and controller approval; this bundle does not dispatch.",
    }
    artifacts = {
        "control/C5-REGISTERED-CLAIM-IDENTITY.json": source_bytes[ident_rel],
        "ledgers/C5-OBLIGATIONS.csv": source_bytes[ledger_rel],
        "control/C5-SEARCH-ALLOCATION.json": json_bytes(allocation),
        "control/C5-WORKER-TOPOLOGY.json": json_bytes(topology),
    }
    grades.update({"control/C5-REGISTERED-CLAIM-IDENTITY.json": "current_authority_snapshot_copy",
                   "ledgers/C5-OBLIGATIONS.csv": "current_authority_snapshot_copy",
                   "control/C5-SEARCH-ALLOCATION.json": "draft_control",
                   "control/C5-WORKER-TOPOLOGY.json": "draft_control"})
    brief = f"""# Cycle 5 intake — staged draft

This bundle is a controller-review proposal. The current canonical identity and ledger
were copied byte for byte from `{ident_rel}` and `{ledger_rel}` and reconciled across
{claim_count} claim keys. The source closeout is `{member(root, args.c4_closeout)[0]}`.
No claim is registered, awarded, or dispatched by this builder.

The ordinary original-leaf lower-region aggregate `{PRIMARY}` remains OPEN.
The all-parameter ordinary `T_m` candidate `{TM}` remains OPEN pending C5
independent route review. The C5 preparation audit is computer-assisted evidence,
not Lean verification or controller authority. Historical C4 sources retain their
original grades; the C4 synthesis and three adjudication portfolios are proposed
worker outputs unless separately incorporated in the approved snapshot.

Use strict original favorable-leaf selection, original supports, full selected
sum, exact guards, and one tag per original leaf. The corrected C4 U3 polynomial
uses the product over centers `c not in I`; U2 uses `Delta_(j-2)`; C4 F1's actual
CT_x gap differs from its flat gap. The signed-map kernel defeats its exact map,
not the ordinary aggregate. Heterogeneous branches and selected matching-slack
charging are C5 research directions, not imported theorems.

The attached six-axis allocation has 18 searches, 36 opposing critics, three
adjudicators, and one synthesis. Search and critic seats use Luna high; the other
stages use Sol high. No more than three workers may run simultaneously. Case
packets must be generated only after each preceding stage is admitted.
"""
    artifacts["control/C5-INTAKE-BRIEF.md"] = brief.encode("utf-8")
    grades["control/C5-INTAKE-BRIEF.md"] = "draft_control"
    pins = {rel: hashlib.sha256(data).hexdigest() for rel, data in source_bytes.items()}
    pins.update({rel: hashlib.sha256(data).hexdigest() for rel, data in artifacts.items()})
    inventory = {"schema": "e993.c5.intake-source-inventory.draft.v1", "cycle": 5,
                 "status_authority": "draft_intake_only",
                 "sources": [{"path": rel, "sha256": pins[rel], "grade": grades[rel]}
                             for rel in sorted(grades)]}
    artifacts["control/C5-INTAKE-SOURCE-INVENTORY.json"] = json_bytes(inventory)
    pins["control/C5-INTAKE-SOURCE-INVENTORY.json"] = hashlib.sha256(
        artifacts["control/C5-INTAKE-SOURCE-INVENTORY.json"]).hexdigest()
    common = {
        "schema": "e993.lower.common.v1", "cycle": 5,
        "authority": "Current canonical snapshot copy only after controller review; all other material keeps its source grade.",
        "source_access": "Exact pinned sources only. Historical C4 common packet is a provenance pointer, not current authority. Case files are stage-gated.",
        "read_first": ["SOLUTION-CONTRACT.md", "WORKER-PROTOCOL.md", "EXECUTION-POLICY.md",
                       "control/C5-INTAKE-BRIEF.md", "control/C5-REGISTERED-CLAIM-IDENTITY.json",
                       "ledgers/C5-OBLIGATIONS.csv", "control/C5-SEARCH-ALLOCATION.json"],
        "allowed_source_files": [{"path": rel, "sha256": pins[rel]} for rel in sorted(pins)],
    }
    artifacts["packets/C5-COMMON.json"] = json_bytes(common)
    demand(len(search_ids) == 18 and len(critics) == 36, "topology construction error")

    # All reads and checks precede the first write. O_EXCL preserves every earlier bundle.
    out.mkdir(mode=0o755)
    for rel, data in sorted(artifacts.items()):
        target = out / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        with os.fdopen(os.open(target, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o444), "wb") as stream:
            stream.write(data)
    print(json.dumps({"staged": str(out), "claims": claim_count,
                      "sources": len(source_bytes), "routes": len(search_ids),
                      "critics": len(critics), "adjudicators": 3, "synthesis": 1}))


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for flag in ("run-root", "output-dir", "current-identity", "current-ledger",
                 "c4-closeout", "c4-at-dir", "c4-af-dir", "c4-au-dir", "c4-synthesis-dir"):
        p.add_argument("--" + flag, required=True)
    make_bundle(p.parse_args())


if __name__ == "__main__":
    main()
