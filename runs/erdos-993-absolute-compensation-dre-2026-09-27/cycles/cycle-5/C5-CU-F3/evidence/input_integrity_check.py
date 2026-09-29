#!/usr/bin/env python3
"""Verify the sealed common manifest and this critic packet's input hashes."""
import hashlib
import json
from pathlib import Path

B = Path("/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27")
manifest = json.loads((B / "manifests/C5-COMMON-DISPATCH.json").read_text())
packet = json.loads((B / "packets/C5-CU-F3.json").read_text())


def check(entries):
    bad = []
    for entry in entries:
        path = B / entry["path"]
        actual = hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else None
        if actual != entry["sha256"]:
            bad.append({"path": entry["path"], "expected": entry["sha256"], "actual": actual})
    return bad


common_bad = check(manifest["members"])
packet_bad = check(packet["allowed_source_files"])
result = {
    "common_manifest_members": len(manifest["members"]),
    "common_missing_or_hash_mismatched": [x["path"] for x in common_bad],
    "packet_sources": len(packet["allowed_source_files"]),
    "packet_missing_or_hash_mismatched": [x["path"] for x in packet_bad],
    "packet_required_covered_claim_ids": packet["required_covered_claim_ids"],
}
out = Path(__file__).with_name("input_integrity.json")
out.write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
if common_bad or packet_bad:
    raise SystemExit(1)
