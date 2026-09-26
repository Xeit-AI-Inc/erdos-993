#!/usr/bin/env python3
"""Exact independent replay of the C4-T4 signed-map star obstruction.

Reads only the task's pinned brief and pinned inputs. Writes RESULTS.json and
EVIDENCE.json beside this script; it does not modify a source or registry.
"""

from collections import Counter
from itertools import combinations
from math import comb
from pathlib import Path
import hashlib
import importlib.util
import json
import sys

sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
BRIEF = ROOT / "control/C4-PREP-SIGNED-MAP-AUDIT.json"


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


brief = json.loads(BRIEF.read_text())
pins = {}
for row in brief["allowed_source_files"]:
    path = ROOT / row["path"]
    actual = digest(path)
    assert actual == row["sha256"], (row["path"], actual)
    pins[row["path"]] = actual

helper_path = ROOT / "inputs/ordinary_tree_checked.py"
spec = importlib.util.spec_from_file_location("ordinary_tree_checked", helper_path)
helper = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = helper
spec.loader.exec_module(helper)

T = helper.star_graph(12)
p = 8
k = p - 1
vertices = sorted(T.vertices)
edges = [[0, v] for v in range(1, 13)]
assert sorted([sorted(edge) for edge in edges]) == sorted(
    [sorted(edge) for edge in json.loads(
        (ROOT / "control-proposals/C4-T4-STAR-BOUNDARY-OBSTRUCTION.json").read_text()
    )["edges"]]
)
tree_poly = T.forest_independence_polynomial()
assert tree_poly == [1] + [comb(12, j) + (j == 1) for j in range(1, 13)]
alpha = len(tree_poly) - 1
x = helper.first_strict_descent(tree_poly)
assert (alpha, x, p) == (12, 6, 8)
assert x + 2 <= p and 3 * p < 2 * alpha + 1
F = helper.favorable_leaves(T, p)
assert F == list(range(1, 13))
selector = {}
leaf_rows = []
for v in T.leaves():
    support = T.support(v)
    Tv = T.remove({v})
    H = T.remove({v, support})
    W = set(T.adjacency[support]) - {v}
    R = T.remove(T.closed_neighborhood({support}))
    tv_poly = Tv.forest_independence_polynomial()
    h_poly = H.forest_independence_polynomial()
    r_poly = R.forest_independence_polynomial()
    selector[v] = helper.delta(tv_poly, p)
    assert Tv.vertices == frozenset(range(13)) - {v}
    assert H.vertices == frozenset(range(1, 13)) - {v}
    assert W == H.vertices
    assert not R.vertices
    assert tv_poly == [1] + [comb(11, j) + (j == 1) for j in range(1, 12)]
    assert h_poly == [comb(11, j) for j in range(12)]
    assert r_poly == [1]
    q7 = helper.coefficient(h_poly, k) - helper.coefficient(r_poly, k)
    q8 = helper.coefficient(h_poly, p) - helper.coefficient(r_poly, p)
    summand = helper.delta(h_poly, k) - helper.delta(r_poly, k)
    assert (selector[v], q7, q8, summand) == (-110, 330, 165, -165)
    leaf_rows.append({"leaf": v, "support": support, "W": sorted(W),
                      "T_minus_leaf_counts": tv_poly, "H_counts": h_poly,
                      "R_counts": r_poly, "selector_delta_p": selector[v],
                      "q7": q7, "q8": q8, "summand": summand})
S = sum(row["summand"] for row in leaf_rows)
assert S == -1980
assert S == helper.aggregate_row(T, p)["aggregate"]


def target_tag(v, face, contexts, favored):
    H, W = contexts[v]
    if set(face) & W:
        return v
    for w in favored:
        Hw, Ww = contexts[w]
        if set(face) <= Hw.vertices and set(face) & Ww and Hw.is_independent(face):
            return w
    return None


contexts = {}
for v in F:
    s = T.support(v)
    contexts[v] = (T.remove({v, s}), set(T.adjacency[s]) - {v})


def signed_map_on_vector(vector):
    out = Counter()
    branches = Counter()
    for (v, A), coefficient in vector.items():
        assert len(A) == p and contexts[v][0].is_independent(A)
        assert set(A) & contexts[v][1]
        for position, u in enumerate(A):
            B = A[:position] + A[position + 1:]
            w = target_tag(v, B, contexts, F)
            if w is None:
                branches["omitted"] += 1
            else:
                branches["retagged" if w != v else "retained"] += 1
                out[(w, B)] += coefficient * (-1 if position % 2 else 1)
    return out, branches


v = 1
C = tuple(range(2, 11))  # nine vertices: 2,...,10
z = {(v, C[:j] + C[j + 1:]): (-1 if j % 2 else 1)
     for j in range(len(C))}
assert len(z) == 9 and all(c != 0 for c in z.values())
image, branches = signed_map_on_vector(z)
assert len(image) == comb(9, 7)
assert all(value == 0 for value in image.values())
assert branches == {"retained": 72}
unsigned_image = Counter()
for (tag, A), coefficient in z.items():
    for j in range(len(A)):
        unsigned_image[(tag, A[:j] + A[j + 1:])] += coefficient
assert unsigned_image[(v, (3, 5, 6, 7, 8, 9, 10))] == 2
assert any(value != 0 for value in unsigned_image.values())

# Verify all single columns on the star remain in their own tag block.
sources = [(v, A) for v in F for A in combinations(sorted(contexts[v][0].vertices), p)]
assert len(sources) == 12 * comb(11, 8) == 1980
all_branches = Counter()
for source in sources:
    column, branch = signed_map_on_vector({source: 1})
    assert len(column) == 8 and all(c in (-1, 1) for c in column.values())
    all_branches.update(branch)
assert all_branches == {"retained": 15840}

# Each source has eight 7-face neighbors, and each destination has four
# possible 8-face extensions. Double counting proves Hall for every source
# subfamily, even though the fixed signed matrix has the nonzero kernel z.
assert comb(11 - 7, 1) == 4
assert 8 * comb(11, 8) == 4 * comb(11, 7)

# General two-mark criterion, including a face that loses both marks and is
# actually retagged. This small abstract configuration is a direct test of the
# face-only tag rule, separate from the eligible star counterexample.
abstract_C = (1, 2, 3, 4)
abstract_marks = {1, 2}
abstract_z = {abstract_C[:j] + abstract_C[j + 1:]: (-1 if j % 2 else 1)
              for j in range(4)}
abstract_image = Counter()
for A, coeff in abstract_z.items():
    assert set(A) & abstract_marks
    for j, u in enumerate(A):
        B = A[:j] + A[j + 1:]
        tag = "v" if set(B) & abstract_marks else "w"  # face-only retag
        abstract_image[(tag, B)] += coeff * (-1 if j % 2 else 1)
assert all(value == 0 for value in abstract_image.values())
assert ("w", (3, 4)) in abstract_image

registry = json.loads((ROOT / "control/C4-REGISTERED-CLAIM-IDENTITY.json").read_text())
claims = registry["claims"]
relevant_keys = [
    "E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY",
    "E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL",
    "E993-R23-LITERAL-DELETE-ONLY-HALL",
    "E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL",
    "E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE",
]
relevant = {}
for key in relevant_keys:
    records = [c for c in claims if c.get("claim_key") == key]
    assert len(records) == 1, key
    relevant[key] = {"status": records[0].get("status"),
                     "statement": records[0].get("statement"),
                     "scope": records[0].get("scope")}
assert not [c for c in claims if "CROSS-TAG" in str(c.get("claim_key", ""))
            and "INJECT" in str(c.get("claim_key", ""))]

results = {
    "worker": brief["worker_id"], "authority": "proposed_worker_only",
    "star": {"vertices": vertices, "edges": edges, "T_counts": tree_poly,
             "alpha": alpha, "first_strict_descent": x, "p": p,
             "guards": {"x_plus_2_le_p": True, "3p_lt_2alpha_plus_1": True},
             "F": F, "leaves": leaf_rows, "S": S,
             "K8_dimension": 1980, "K7_dimension": 3960},
    "signed_map": {"kernel_tag": v, "C": list(C),
                   "kernel_vector": [{"tag": tag, "A": list(A), "coefficient": c}
                                     for (tag, A), c in z.items()],
                   "kernel_nonzero": True, "image_support_size": len(image),
                   "image_coefficients": sorted(set(image.values())),
                   "unsigned_local_map_of_same_vector_nonzero": True,
                   "unsigned_example": {"tag": v, "B": [3, 5, 6, 7, 8, 9, 10],
                                        "coefficient": 2},
                   "kernel_action_branches": dict(branches),
                   "all_star_columns_branches": dict(all_branches),
                   "source_degree": 8, "destination_degree": 4,
                   "hall_all_subfamilies": True},
    "general_two_mark_test": {"C": list(abstract_C),
                              "marked_vertices": sorted(abstract_marks),
                              "image_coefficients": sorted(set(abstract_image.values())),
                              "retagged_face": [3, 4]},
    "registry_comparison": relevant,
}
evidence = {
    "brief": str(BRIEF.relative_to(ROOT)),
    "source_sha256": pins,
    "method": "exact integer tree-DP counts, combinatorial cross-checks, explicit signed deletion action over integer coefficients, full star-column branch enumeration, registry exact-statement comparison",
    "replay": "python3 REPLAY.py",
    "assertions_passed": True,
    "limitations": ["No claim of positive full aggregate", "No theorem for arbitrary modified cross-tag operators", "No Lean build or authoritative status update"],
}
(HERE / "RESULTS.json").write_text(json.dumps(results, indent=2) + "\n")
(HERE / "EVIDENCE.json").write_text(json.dumps(evidence, indent=2) + "\n")
print(json.dumps({"pins_verified": len(pins), "alpha": alpha, "x": x,
                  "p": p, "F_count": len(F), "S": S,
                  "kernel_terms": len(z), "image_support": len(image),
                  "image_values": sorted(set(image.values())),
                  "all_branches": dict(all_branches)}, indent=2))
