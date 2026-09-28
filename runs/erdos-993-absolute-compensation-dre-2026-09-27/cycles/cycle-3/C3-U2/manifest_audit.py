from hashlib import sha256
import json
from pathlib import Path

ROOT = Path("/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27")


def check(manifest_path):
    data = json.loads((ROOT / manifest_path).read_text())
    results = []
    for member in data["members"]:
        path = ROOT / member["path"]
        actual = sha256(path.read_bytes()).hexdigest()
        results.append({
            "path": member["path"],
            "expected": member["sha256"],
            "actual": actual,
            "match": actual == member["sha256"],
        })
    return {"manifest": manifest_path, "members_checked": len(results), "all_match": all(r["match"] for r in results), "members": results}


out = {
    "common_dispatch": check("manifests/C3-COMMON-DISPATCH.json"),
    "transport_clarification": check("manifests/C3-TRANSPORT-CLARIFICATION.json"),
    "packet": {
        "path": "packets/C3-U2.json",
        "sha256": sha256((ROOT / "packets/C3-U2.json").read_bytes()).hexdigest(),
        "allowed_source_files": json.loads((ROOT / "packets/C3-U2.json").read_text())["allowed_source_files"],
        "packet_contains_member_hashes": False,
    },
}
Path("manifest_audit.json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps({
    "common_dispatch_members": out["common_dispatch"]["members_checked"],
    "common_dispatch_all_match": out["common_dispatch"]["all_match"],
    "transport_members": out["transport_clarification"]["members_checked"],
    "transport_all_match": out["transport_clarification"]["all_match"],
    "packet_sha256": out["packet"]["sha256"],
    "packet_allowed_source_files": out["packet"]["allowed_source_files"],
}, indent=2))
