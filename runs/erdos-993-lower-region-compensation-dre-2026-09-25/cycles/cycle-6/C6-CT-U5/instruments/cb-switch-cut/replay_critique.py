from math import comb
import hashlib, json
from pathlib import Path

here = Path(__file__).resolve().parent
result_path = here / "RESULTS.json"
r = json.loads(result_path.read_text())
q = 736
source_rank, target_rank = 491, 490
card_s = lambda s: 2**s * comb(q, s)
weight_s = lambda s: card_s(s) * (2+s) // 2
N1, N0 = card_s(source_rank), card_s(target_rank)
W1, W0 = weight_s(source_rank), weight_s(target_rank)
assert N1 * 491 == N0 * 492
assert W1 * 491 == W0 * 493
assert (W1 - W0) * 491 == 2 * W0
assert r["d"] == 8 and r["m"] == 92 and r["p"] == 492
assert r["order"] == 1567 and r["alpha"] == 829 and r["x"] == 490
assert r["eligible"] is True and r["favorable_count"] == 737
assert r["aggregate"] == -748810430710227858618987651910033216703683417838216925198717803643429976026528835780589934131455008160734961984872181554253955973926828360343593801420958157569217597856332648092871718535396544094741662493496052937502544011852450401845369604971012815876222562893394568771491235318210974656559260615999226971281962526260215590753741136119108496073557120
cut = r["test_cut"]
assert cut["upper_weight"] - cut["neighbor_weight_upper_bound"] == cut["lower_bound_on_deficit"]
assert cut["lower_bound_on_deficit"] < 0 and cut["certificate_of_failure"] is False
out = {
  "evidence_type": "independent_exact_integer_replay_and_scope_audit",
  "source_copy": "instruments/cb-switch-cut/run.py",
  "evaluator_copy": "inputs/ordinary_tree_checked.py",
  "sector": {
    "pair_count": q, "source_rank": source_rank, "target_rank": target_rank,
    "source_cardinality": str(N1), "target_cardinality": str(N0),
    "cardinality_ratio": "492/491",
    "source_selected_tag_weight": str(W1), "target_selected_tag_weight": str(W0),
    "weighted_mass_ratio": "493/491",
    "weighted_shortfall": str(W1-W0),
    "shortfall_over_target_mass": "2/491",
    "identities_checked_by_integer_cross_multiplication": True
  },
  "graph_replay": {
    "recipe": "CB(8,92), as pinned in source-copy run.py",
    "order": r["order"], "alpha": r["alpha"], "x": r["x"], "p": r["p"],
    "eligible": r["eligible"], "favorable_original_leaf_count": r["favorable_count"],
    "complete_selected_aggregate": str(r["aggregate"]),
    "result_sha256": hashlib.sha256(result_path.read_bytes()).hexdigest()
  },
  "switch_cut": {
    "upper_weight": str(cut["upper_weight"]),
    "conservative_neighbor_weight_upper_bound": str(cut["neighbor_weight_upper_bound"]),
    "lower_bound_on_deficit": str(cut["lower_bound_on_deficit"]),
    "interpretation": "inconclusive upper envelope; not an exact Hall neighborhood or flow"
  },
  "limitation": "The computed sector ratio compares only rank-lowering deletion targets that remain in the fixed hub-plus-arm sector. It does not count deletion targets that leave that sector, and therefore alone does not establish a deficit for the full deletion neighborhood."
}
Path(__file__).resolve().parents[2].joinpath("EVIDENCE.json").write_text(json.dumps(out, indent=2)+"\n")
print("exact replay and integer checks passed")
