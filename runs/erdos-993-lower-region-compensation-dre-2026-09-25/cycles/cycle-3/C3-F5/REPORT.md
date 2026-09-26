# C3-F5 search report — heterogeneous branch capacity cuts

## Scope and result

This route tested the literal deletion-plus-two-for-one weighted transport proposed in the C3 handoff on a bounded family of hub trees with heterogeneous rooted branches. In the tested family, I found no deficient weighted Hall cut. This is a finite mechanism result, not a proof that such a cut cannot occur in other trees and not a proof of the primary aggregate.

The exact sweep generated 633 canonical branch-multiset recipes: each tree has a hub and 2–5 branches; a branch is either a path of 1–4 vertices off the hub (`P_l`) or a hub-adjacent center with 2–4 terminal leaves (`C_t`); total order is at most 18. For each recipe, the script computed the independence polynomial, terminal first strict descent `x`, and every integer `p` satisfying `x+2<=p` and `3p<2 alpha+1`. All 138 eligible rows had nonempty favorable selector `F`. It then enumerated the independent sets at ranks `p` and `p+1`, assigned the exact weights

`w_F(B) = #{v in F intersect B : (B - {v}) intersect W_v is nonempty}`, where `W_v=N_T(s_v)\{v}`,

and included every one-vertex deletion and every literal move `B -> (B - (N_T(s) intersect B)) union {s}` with absent `s` and exactly two neighbors in `B`. The max-flow calculation uses integer capacities. Its residual cut was checked against `supply - flow` for each row; all 138 flows saturated their full upper supply, so the largest computed deficiency was zero. Direct evaluation of all original selected leaf summands agreed row by row with upper supply minus lower capacity. The bounded full sums ranged from `-9828` to `-224`.

## Heterogeneous example

The evidence file includes a complete exact row for branch recipe `P2,C3,C4`. It has 12 vertices with edges

`(0,1),(1,2),(0,3),(3,4),(3,5),(3,6),(0,7),(7,8),(7,9),(7,10),(7,11)`.

Its independence polynomial is `[1,12,55,130,184,172,107,43,10,1]`, so `alpha=9` and `x=4`. At `p=6`, the guards hold: `x+2=6` and `3p=18<19=2 alpha+1`. The favorable leaves are `{2,4,5,6,8,9,10,11}`; their exact `Delta_6(T-v)` values are respectively `-35,-27,-27,-27,-25,-25,-25,-25`. Their original-tree aggregate summands are `-14,-35,-35,-35,-39,-39,-39,-39`, giving `S=-275`. The weighted upper supply is 259, lower capacity is 534, and the literal move network routes all 259 units. The direct aggregate and `supply-capacity` agree.

The script also tests every absent vertex for each upper independent set and applies the exact two-neighbor condition, so root, path, support, and claw-center insertions are included whenever legal. No convexification of full sums or nonrealizable branch coefficients is used.

## Reproduction and limitations

Run `python3 FLOW_SEARCH.py` from this worker directory. It deterministically regenerates the family, exact selector rows, integer flow networks, residual cuts, and `EVIDENCE.json`. The implementation uses exact integer tree-polynomial dynamic programming and literal independent-set enumeration on the generated graphs; it imports no outside source code.

The search only covers the stated hub-and-branch family and order horizon. It does not prove a general cut reduction, explain why these cuts saturate, or establish the lower-region theorem beyond this finite family. No primary-literature theorem was needed. Packet common-source hashes were checked before reading the assigned sources (115 of 115 matched).
