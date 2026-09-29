#!/usr/bin/env python3
"""Hash every file member named by the sealed common dispatch manifest."""
import hashlib
import json
from pathlib import Path

B = Path("/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27")
manifest = json.loads((B / "manifests/C5-COMMON-DISPATCH.json").read_text())
packet = json.loads((B / "packets/C5-U2.json").read_text())
missing = []
mismatched = []
for member in manifest["members"]:
    path = B / member["path"]
    if not path.is_file():
        missing.append(member["path"])
        continue
    actual = hashlib.sha256(path.read_bytes()).hexdigest()
    if actual != member["sha256"]:
        mismatched.append({"path": member["path"], "expected": member["sha256"], "actual": actual})
result = {
    "manifest_schema": manifest.get("schema"),
    "manifest_member_count": len(manifest["members"]),
    "missing": missing,
    "mismatched": mismatched,
    "packet_worker_id": packet["worker_id"],
    "packet_allowed_source_files": packet["allowed_source_files"],
    "packet_separate_hash_list": False,
}
assert not missing and not mismatched
Path(__file__).with_suffix(".json").write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result))
