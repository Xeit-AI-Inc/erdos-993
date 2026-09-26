# C4-T1 independent critique (orientation U)

## Source integrity and method

All 179 common packet source hashes and all 8 case source hashes matched their pinned SHA-256 values. I read the assigned common first-read sources and `control/C4-CRITIC-BRIEF.md`.

I replayed the route's `COMPUTE.py` from a copy in this scratch directory; the output is `SOURCE-REPLAY.json`. Separately, `REPLAY.py` uses a minimum-induced-degree deletion recurrence for independence polynomials, rather than the source program's maximum-degree choice. It also checks connectivity and the 23-edge tree boundary, reconstructs all degree-one vertices, and recalculates every leaf selector and selected summand. For the marked-addability witness at leaf 0, it literally enumerates the rank-9 independent subsets of H and their addable vertices. Results are in `INDEPENDENT-EVIDENCE.json`.

## C4-T1-CTx-SUFFICIENT-REDUCTION — retained

For each selected tag, let `q_v(j)` count the independent j-sets of H meeting W. Counting pairs `(A,z)` where A is a marked independent k-set and z is addable gives E. Each marked upper set B of size k+1 with exactly one W-vertex contributes k pairs, while a B with at least two W-vertices contributes k+1. If C counts the latter upper sets once, then `E=kU+C`. Since `S=U-Q`, summing over the fixed selector gives `kS=E-C-kQ`.

The proposed bridge is sufficient under the contract hypotheses. The zero-extended terminal difference is negative, so the first descent x exists with `i_x>i_(x+1)` and `i_x>0`; also `k=p-1>=x+1`. If Q>0, the bridge yields `E <= (x+1)i_(x+1)Q/i_x < (x+1)Q <= kQ`. With C nonnegative, `kS<0`, hence S<0. If Q=0, no marked independent (k+1)-set can exist: deleting a suitable unmarked vertex when there is one, or any vertex when all are marked, would yield a marked independent k-set. Here k>=x+1>=1. Thus U=0 and S=0. This proves the conditional reduction with the fixed selector and all tags counted separately.

The universal `CT_x` premise is not established. Accordingly this is a valid sufficient implication, not a resolution of the primary aggregate.

## C4-T1-ORDER24-POSITIVE-MARKED-ADDABILITY-COVARIANCE — retained

Independent reconstruction confirms the 23-edge graph is connected, hence is a tree; its full degree-one vertex set is `(0,3,5,6,12,14,15,20,21,22,23)`. The independently computed polynomial has alpha 15 and first negative difference x=8; its terminal zero-extended difference is -2. With p=10, both guards hold: x+2=p and 30<31. All eleven degree-one vertices have strictly negative `Delta_10(T-v)`, so this is the complete favorable selector. The recalculated summands, preserving separate tags at shared supports, total S=-51095. The exact values and all leaf rows are in `INDEPENDENT-EVIDENCE.json`.

For v=0, W={7,9,21,22}. Direct rank-9 subset enumeration gives q_9=13232 and actual marked addability E_v=58429; the independent polynomial recurrence gives i_9(H)=13677 and i_10(H)=6026. Therefore the covariance numerator is

`58429*13677 - 13232*10*6026 = 1773113 > 0`,

with positive denominator `13677^2`. This verifies the stated positive covariance witness in an eligible instance. It is local: the complete selected aggregate is negative, so the witness does not refute the target.

The route replay also reproduces aggregate `Q=97144`, `U=46049`, `E=436389`, `C=21948`; numerically `E=9U+C` and `9S=E-C-9Q`. The displayed `CT_x` difference is negative for this example. The positive covariance therefore challenges a universal nonpositive-covariance shortcut only; it does not challenge `CT_x` or the target.

## Limitations

- No proof or refutation of the universal `CT_x` budget or primary aggregate is provided.
- The independent recurrence verifies all polynomial counts, selectors, and the complete S. Direct subset enumeration of E_v was performed for v=0; per-tag E and C values for the other tags were checked in the source-copy replay, not by a second enumeration implementation.
- The labeled-tree census through order 8 and seeded random search are bounded computations only and establish no universal statement.
- No literature theorem was imported.
