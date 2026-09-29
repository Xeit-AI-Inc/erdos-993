"""Validate the frozen C6-U2 prefix result against the reviewed count table."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).parent
result_path = ROOT / "final-run-1-99" / "RESULT.json"
expected_path = ROOT / "C6-SURPLUS-PREFIX-EXPECTED-COUNTS.json"
receipt_path = ROOT / "final-run-1-99" / "TRANSPORT-RECEIPT.json"

result = json.loads(result_path.read_text())
expected = json.loads(expected_path.read_text())
receipt = json.loads(receipt_path.read_text())
lookup = {row["m"]: row for row in expected["layers"]}

assert result["status"] == "complete_exact_prefix"
assert result["evidence_grade"] == "bounded_computation"
assert result["scope"] == {"min_m": 1, "max_m": 99}
assert len(result["rows"]) == 99
assert result["profile_count"] == 171699
assert result["represented_type_rank_tests"] == 56245000
assert all(control["passed"] for control in result["controls"])
assert len(result["controls"]) == 3
for row in result["rows"]:
    want = lookup[row["m"]]
    assert row["profile_count"] == want["profiles"]
    assert row["represented_type_rank_tests"] == want["represented_tip_rank_tests"]
    assert row["failure_count"] == 0
    assert row["failures"] == []
    assert int(row["minimum_signed_surplus"]) >= 0
assert int(result["minimum_signed_surplus"]) == min(
    int(row["minimum_signed_surplus"]) for row in result["rows"]
)
assert receipt["exit_code"] == 0 and not receipt["timed_out"] and receipt["source_unchanged"]
assert receipt["min_m"] == 1 and receipt["max_m"] == 99
assert receipt["elapsed_seconds"] <= 1800
print(json.dumps({
    "result": "PASS",
    "profiles": result["profile_count"],
    "represented_type_rank_tests": result["represented_type_rank_tests"],
    "minimum_signed_surplus": result["minimum_signed_surplus"],
    "rows": len(result["rows"]),
    "failures": 0,
    "source_sha256": receipt["source_sha256_before"],
    "result_sha256": hashlib.sha256(result_path.read_bytes()).hexdigest(),
}, sort_keys=True))
