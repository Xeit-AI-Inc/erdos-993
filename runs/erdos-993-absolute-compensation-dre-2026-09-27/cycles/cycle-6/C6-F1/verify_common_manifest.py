#!/usr/bin/env python3
"""Verify every actual C6 common-dispatch member against its sealed SHA-256."""
import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
manifest_path = ROOT / "manifests" / "C6-COMMON-DISPATCH.json"
manifest = json.loads(manifest_path.read_text())
bad = []
for member in manifest["members"]:
    path = ROOT / member["path"]
    if not path.is_file():
        bad.append((member["path"], "missing"))
        continue
    actual = hashlib.sha256(path.read_bytes()).hexdigest()
    if actual != member["sha256"]:
        bad.append((member["path"], actual, member["sha256"]))
if bad:
    for row in bad:
        print(*row)
    raise SystemExit(f"FAIL: {len(bad)} manifest member(s) differ")

packet = ROOT / "packets" / "C6-F1.json"
packet_hash = hashlib.sha256(packet.read_bytes()).hexdigest()
print(f"OK: {len(manifest['members'])} common members match")
print(f"C6-F1 packet observed sha256: {packet_hash}")
