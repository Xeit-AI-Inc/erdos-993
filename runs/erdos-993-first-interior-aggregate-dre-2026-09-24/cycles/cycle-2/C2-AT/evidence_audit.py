"""Read-only consistency audit of C2-AT's sealed source packet.

Run from the run root: python3 scratchpad/C2-AT/evidence_audit.py > scratchpad/C2-AT/evidence_audit.json
This checks source digests and arithmetic in existing finite certificates. It does
not execute origin scripts or turn bounded calculations into a universal proof.
"""

import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
packet = json.loads((ROOT / "packets/C2-AT.json").read_text())
for entry in packet["allowed_source_files"]:
    actual = hashlib.sha256((ROOT / entry["path"]).read_bytes()).hexdigest()
    assert actual == entry["sha256"], entry["path"]


def load(path):
    return json.loads((ROOT / path).read_text())


origin_claims = []
for worker in ("C2-T1", "C2-T2", "C2-T3"):
    origin_claims.extend(
        claim["claim_id"]
        for claim in load(f"cycles/cycle-2/{worker}/RETURN.json")["claims"]
    )
assert len(origin_claims) == len(set(origin_claims)) == 6
assert set(origin_claims) == set(packet["required_covered_claim_ids"])

for worker, origin in (
    ("C2-CF-T1", "C2-T1"),
    ("C2-CU-T1", "C2-T1"),
    ("C2-CF-T2", "C2-T2"),
    ("C2-CU-T2", "C2-T2"),
    ("C2-CF-T3", "C2-T3"),
    ("C2-CU-T3", "C2-T3"),
):
    critique = load(f"cycles/cycle-2/{worker}/RETURN.json")
    incoming = load(f"cycles/cycle-2/{origin}/RETURN.json")
    ids = [c["claim_id"] for c in incoming["claims"]]
    assert critique["covered_claim_ids"] == ids
    assert [c["claim_id"] for c in critique["claims"]] == ids

small = load("cycles/cycle-2/C2-T2/checks.out.json")["orders_7_8"]
assert small["7"]["labeled_trees_checked"] == 7**5
assert small["8"]["labeled_trees_checked"] == 8**6
assert small["7"]["minimum_delta2_among_alpha_6_trees"] >= 5
assert small["8"]["minimum_delta2_among_alpha_6_trees"] >= 2

large = load("cycles/cycle-2/C2-T3/check_m200.json")
assert large["n"] == len(large["edges"]) + 1 == 404
assert large["p"] == large["alpha_from_exact_tree_dp"] - 2 == 200
assert large["first_strict_descent_x"] + 2 <= large["p"]
assert len(large["original_leaves"]) == len(large["leaf_terms"]) == 201
assert set(large["favorable_leaves"]) == {
    row["leaf"] for row in large["leaf_terms"] if row["favorable"]
}
assert all(
    row["term"] == row["delta_p_minus1_H"] - row["delta_p_minus1_R"]
    for row in large["leaf_terms"]
)
assert sum(row["term"] for row in large["leaf_terms"] if row["favorable"]) == large["complete_favorable_sum"]
shadow = large["tagged_shadow"]
assert shadow["lhs"] == shadow["k"] * shadow["q_k_plus_1"]
assert shadow["rhs"] == 2 * (201 - shadow["k"]) * shadow["q_k"]
assert shadow["rhs"] - shadow["lhs"] == shadow["difference_rhs_minus_lhs"] == 0

aug = load("cycles/cycle-2/C2-CF-T3/check_augmented_m201.json")
assert aug["order"] == aug["edge_count"] + 1 == 407
assert aug["p"] == aug["alpha"] - 2 == 202
assert aug["x"] + 2 <= aug["p"]
assert sum(row["multiplicity"] for row in aug["leaf_orbits"]) == aug["original_leaf_count"] == 203
assert sum(
    row["multiplicity"] * row["term"]
    for row in aug["leaf_orbits"] if row["favorable"]
) == aug["complete_sum"]
assert all(row["q_p"] - row["q_p_minus_1"] == row["term"] for row in aug["leaf_orbits"])

multi = load("cycles/cycle-2/C2-CU-T3/replay_246.json")
assert multi["n"] == multi["edge_count"] + 1 == 246
assert multi["p"] == multi["alpha"] - 2 == 122
assert multi["x"] + 2 <= multi["p"]
rows = [row for support_rows in multi["by_support"].values() for row in support_rows]
assert len(rows) == multi["original_leaf_count"] == 123
assert sum(row[2] for row in rows if row[1] < 0) == multi["complete_sum"]

print(json.dumps({
    "pinned_sources_verified": len(packet["allowed_source_files"]),
    "incoming_claim_ids_verified": origin_claims,
    "critique_coverage_verified": 6,
    "finite_consistency": {
        "small_tree_prufer_orders": [7, 8],
        "order_404_full_tagged_sum": large["complete_favorable_sum"],
        "order_407_orbit_sum": aug["complete_sum"],
        "order_246_full_tagged_sum": multi["complete_sum"],
    },
    "scope": "Digest and internal arithmetic checks only; no origin script execution or Lean build.",
}, indent=2))
