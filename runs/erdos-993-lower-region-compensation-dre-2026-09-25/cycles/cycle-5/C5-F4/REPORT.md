# C5-F4 — bounded proper-selector search

## Question and method

I targeted a tree/rank pair in the strict lower region for which the original-leaf selector is proper: at least one original leaf has `Delta_p(T-v)<0` and at least one has `Delta_p(T-v)>=0`. The target selector is evaluated on the original tree at the same rank for every leaf. This search does not assume log-concavity or any transfer rule from the first descent.

I used exact integer forest independence-polynomial dynamic programming from the hash-pinned common source `inputs/ordinary_tree_checked.py`. For each generated tree I computed the full polynomial, `alpha`, and the first negative `Delta_j` using integer zero-extension through the terminal rank. I then tested every integer `p` satisfying `x+2<=p` and `3p<2alpha+1`, and evaluated `Delta_p(T-v)` for every original leaf. The replayable generator and all outcomes are in `F4_SEARCH.py` and `EVIDENCE.json`.

The bounded constructions were:

- KL `T(k1,k2,k3)` spiders, canonical `1<=k1<=k2<=k3<=20`: 1,540 trees. None has an eligible rank (`x+2` exceeds the strict lower-region ceiling throughout this box).
- Centered path spiders with 3–5 arms, each arm length 1–8, up to arm permutation: 1,242 trees and 166 eligible tree-rank pairs.
- Each of the five named KL fixtures `(3,4,4)`, `(3,4,5)`, `(3,5,5)`, `(3,5,6)`, `(3,6,6)`, with a new path of length 1–5 attached at every nonleaf vertex: 425 attachment constructions and 142 eligible tree-rank pairs.

Across the 308 eligible tree-rank pairs, the exact evaluation found zero proper selectors. The KL triples contribute no eligible pairs, so their zero is a guard result, not evidence about the selector. The construction recipes are explicit; this is not a census of all trees or a universal leaf-selection result.

## Exact eligible control

For the centered path spider with arm lengths `(7,7,7)`, the edge list is recorded in `EVIDENCE.json`. Its independence polynomial is

`(1, 22, 210, 1141, 3891, 8661, 12684, 12028, 7086, 2401, 409, 30, 1)`,

so `alpha=12`. The first strict descent is `x=6`; take `p=8`. The guards hold: `x+2=8` and `3p=24<25=2alpha+1`. Its original leaves are `7,14,21`, and all three have `Delta_8(T-v)=-2483`; thus this eligible example has the all-leaf selector rather than a proper selector. For each selected leaf, the exact summand is `900-1815=-915`; hence the complete selected sum is `S=-2745`. The full selector and each deletion summand are listed in the evidence JSON. This supplies a rank/selector arithmetic check, not a refutation or proof of the primary inequality.

The KL constructions are motivated by the non-log-concave tree constructions of Kadrawi and Levit, *The independence polynomial of trees is not always log-concave starting from order 26* ([arXiv:2305.01784](https://arxiv.org/abs/2305.01784)). I import no theorem from that paper; all finite claims here come from the explicit graph recipes and exact recurrence computation above.

## Disposition and gap

No proper-selector witness was found in these bounded families. This leaves F4's requested witness unresolved. In particular, the result gives no implication that all leaves are favorable in the eligible lower region, and says nothing about trees outside the stated constructions and parameter bounds. No universal theorem, counterexample to the primary aggregate, or claim status change is proposed.
