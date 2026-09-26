"""Verify a published snapshot, including its declared historical cache omission.

Read-only; does not run archived research code or award mathematical statements.
Usage: python3 scripts/verify_public_archive.py [archive_root]
"""
from pathlib import Path, PurePosixPath
import hashlib
import json
import sys


def verify(root):
    root = root.resolve()

    def path_for(relative):
        p = PurePosixPath(relative)
        if p.is_absolute() or ".." in p.parts or not p.parts:
            raise ValueError(f"Unsafe archive path: {relative}")
        result = root.joinpath(*p.parts)
        if result.is_symlink() or any(x.is_symlink() for x in result.parents if x != root.parent):
            raise ValueError(f"Symlink path: {relative}")
        return result

    def digest(relative):
        return hashlib.sha256(path_for(relative).read_bytes()).hexdigest()

    manifest = json.loads((root / "PUBLICATION-MANIFEST.json").read_text())
    omissions_doc = json.loads((root / "PUBLICATION-OMISSIONS.json").read_text())
    omissions = {r["path"]: r for r in omissions_doc["omissions"]}
    allowed_cache = "preparation/C3-PREP-NEXT-SHELL-AUDIT/__pycache__/verify_lift.cpython-311.pyc"
    if set(omissions) != {allowed_cache}:
        raise ValueError("Unexpected omission set")
    included = {}
    for row in manifest["members"]:
        rel = row["path"]
        if rel in included or rel in omissions:
            raise ValueError(f"Duplicate or omitted included member: {rel}")
        if digest(rel) != row["sha256"]:
            raise ValueError(f"Publication hash mismatch: {rel}")
        included[rel] = row["sha256"]

    seen_omissions = set()
    historical_references = 0
    historical_seals = 0
    for seal_path in sorted((root / "manifests").glob("*.json")):
        rel = seal_path.relative_to(root).as_posix()
        if rel not in included:
            raise ValueError(f"Unlisted historical seal: {rel}")
        seal = json.loads(seal_path.read_text())
        if seal.get("schema") not in {"e993.worker-ops.seal.v1", "e993.lower.preparation-seal.v1"}:
            raise ValueError(f"Unexpected seal schema: {rel}")
        historical_seals += 1
        for row in seal["members"]:
            historical_references += 1
            member = row["path"]
            if member in omissions:
                if path_for(member).exists() or omissions[member]["sha256"] != row["sha256"]:
                    raise ValueError(f"Invalid declared omission: {member}")
                seen_omissions.add(member)
            elif included.get(member) != row["sha256"]:
                raise ValueError(f"Missing or changed historical member: {member}")
    if seen_omissions != set(omissions):
        raise ValueError("Omission has no historical seal")

    actual = {p.relative_to(root).as_posix() for p in root.rglob("*") if p.is_file()}
    if actual != set(included) | {"PUBLICATION-MANIFEST.json"}:
        raise ValueError(f"Unexpected archive members: {sorted(actual ^ (set(included) | {'PUBLICATION-MANIFEST.json'}))[:20]}")
    state = json.loads((root / "RUN-STATE.json").read_text())
    if state["completed_cycles"] != list(range(1, 7)) or state["max_cycles"] != 6:
        raise ValueError("Archive does not represent the six-cycle terminal run")
    print(json.dumps({"verified": True, "publication_members": len(included),
                      "historical_seals": historical_seals,
                      "historical_member_references": historical_references,
                      "explicit_cache_omissions": len(omissions),
                      "mathematical_award_authority": False}, indent=2))


if __name__ == "__main__":
    verify(Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).resolve().parents[1])
