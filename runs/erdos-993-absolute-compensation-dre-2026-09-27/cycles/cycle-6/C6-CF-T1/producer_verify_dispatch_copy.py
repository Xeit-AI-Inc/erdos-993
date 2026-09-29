#!/usr/bin/env python3
"""Recheck every C6 common-dispatch member and this seat's packet hash."""
import hashlib
import json
from pathlib import Path

B = Path("/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27")
m = json.loads((B / "manifests/C6-COMMON-DISPATCH.json").read_text())
bad = []
for row in m["members"]:
    p = B / row["path"]
    actual = hashlib.sha256(p.read_bytes()).hexdigest() if p.is_file() else "MISSING"
    if actual != row["sha256"]:
        bad.append({"path": row["path"], "expected": row["sha256"], "actual": actual})
packet_path = B / "packets/C6-T1.json"
packet = json.loads(packet_path.read_text())
print(json.dumps({
    "manifest": "manifests/C6-COMMON-DISPATCH.json",
    "manifest_member_count": len(m["members"]),
    "mismatches": bad,
    "packet_sha256": hashlib.sha256(packet_path.read_bytes()).hexdigest(),
    "packet_allowed_source_files": packet["allowed_source_files"],
}, sort_keys=True))
