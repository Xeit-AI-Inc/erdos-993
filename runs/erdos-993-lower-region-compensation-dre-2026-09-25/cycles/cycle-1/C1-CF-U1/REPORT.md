# C1-CF-U1 critique of C1-U1

## Dispositions

- **C1-U1-1 — retained.** The tagged-incidence identity and the two nonnegativity claims follow by direct counting under the stated assumptions. The result is an exact auxiliary identity, not a proof of the primary tree aggregate.
- **C1-U1-2 — retained_narrowed.** The displayed budget margin is exactly `-k S`, so proving the budget is equivalent to proving the selected aggregate. More precisely, the identity together with `D,C >= 0` does not by itself establish the budget when its coefficient is positive and `sum_F q_v(k)>0`; this is a missing comparison, not a counterexample to any additional structural implication.

## Claim 1 audit: tagged incidence identity

Let `A` be an independent `k`-set meeting `W`, and let `E(A)` be the actual vertices outside `A` that can be added while preserving independence. Fix a bipartition `L,R` of `H`. For either side, `A union (E(A) intersect L)` or `A union (E(A) intersect R)` is independent: each added vertex is nonadjacent to all of `A`, and vertices on the same color side are mutually nonadjacent. Each union has size at most `alpha(H) <= h`. Thus each color side has at most `h-k` addable vertices and

`2(h-k)-e(A) = (h-k-|E(A) intersect L|) + (h-k-|E(A) intersect R|) >= 0`.

Summing over marked `A` proves `D >= 0`. The argument is valid for any `h >= alpha(H)`; it does not assume tightness.

Count incidences `(A,y)` with marked independent `k`-set `A` and `y` actually addable. An independent `(k+1)`-set meeting `W` exactly once contributes `k` incidences, one for each deletion of an unmarked vertex. A set meeting `W` at least twice contributes `k+1`, since every deletion leaves a marked `k`-set. Counting the baseline `k` for every marked `(k+1)`-set and the one extra incidence for each multiply marked set gives `k q_(k+1)+C`; the correction counts each set once, as defined. Counting by `A` instead gives `sum_A e(A)=2(h-k)q_k-D`. This proves the claimed equality, and `C >= 0` follows from its definition.

At `k=h`, the color-side bounds force every addable set to be empty; there are no independent `(h+1)`-sets since `h >= alpha(H)`. Hence `D=C=q_(h+1)=0` and the identity reduces to `0=0`. If `q_k=0`, both sides' incidence sums vanish and the same proof applies. These edge cases are covered. The argument requires the simple graph/bipartite meaning of the stated finite graph and actual addability, all of which are in the registered definition.

## Claim 2 audit: ordinary-tree specialization and scope

For a selected original leaf `v`, `H_v` is an induced forest and hence bipartite. A maximum independent set of `T` can be chosen to contain `v`: if it contains `s_v`, replace `s_v` by its leaf `v`; if it excludes both, adding `v` would contradict maximal cardinality. Removing `v` gives an independent set of size `a-1` in `H_v`. Conversely, any independent set in `H_v` can be enlarged by `v` in `T`. Therefore `alpha(H_v)=a-1`, so the auxiliary identity applies with `h=a-1`.

Eligibility supplies `p>=2`. Since `3p<2a+1` and the quantities are integers, `3p<=2a`, hence `p<a`; with `k=p-1`, this gives `1<=k<=a-1=h` (in fact `k<h`). `W_v=N_T(s_v)\{v}` is a subset of `H_v`, `R_v=H_v-W_v`, and `q_v(j)=i_j(H_v)-i_j(R_v)` counts exactly the independent `j`-sets meeting `W_v`. The uses of original support and original neighborhood are preserved.

For each tag, its summand is `q_v(k+1)-q_v(k)`. Summing the exact identity over the **same fixed** original-leaf selector `F(T,p)` gives

`k S = (2a+1-3p) sum_F q_v(k) - sum_F(D_v+C_v)`.

Consequently

`sum_F(D_v+C_v) - (2a+1-3p)sum_F q_v(k) = -kS = k sum_F(q_v(k)-q_v(k+1))`.

This is algebraically correct and preserves multiplicity when several original leaves share a support: equal deletion data give equal summands, but each tag is still included. The strict lower-region condition makes `2a+1-3p` positive. Nonnegativity of `D_v,C_v` supplies only a zero lower bound, and the identity does not supply the required comparison with the positive coefficient times `sum_F q_v(k)`. The proposed budget is equivalent to the primary assertion here; it is not an independent derivation of it. Equivalently, the outstanding statement is selector-level monotonicity `sum_F q_v(k+1) <= sum_F q_v(k)`. No universal proof or eligible counterexample for that statement is provided by this route.

## Controls, usefulness, and limitations

The common admitted controls are consistent with the warning against inferring a full aggregate sign from a marked positive term. In the order-91 `T_22` record, `(a,x,p)=(68,32,34)`, 67 leaves are favorable, the recorded marked term is `+212336130412243110`, and the full aggregate is `-498754180547001418536`. In the order-243 `T_60` record, `(a,x,p)=(182,87,90)`, 181 leaves are favorable, the marked term is `+2935177632783649903488454322226807645411570590073000`, and the full aggregate is `-1058142362147652597702654588268394677176033202323316960380`. Both lie in the strict lower region. They do not refute the target or the auxiliary identity. I read the packet-listed control records but did not independently replay their tree arithmetic; they are used only as supplied scope fences, not as proof evidence for either claim.

The order-91 support-fibre refutation and governed pointwise `E993-BETA-TARGET` refutation listed in the admitted fence are different scopes and do not decide this ordinary-tree global sum. Nor does this review infer a slot-matching/transport theorem or transfer from the governed model. The exact identity is useful as an audit decomposition and pinpoints the missing global budget, but no external theorem, bounded search, source replay, or new tree witness establishes that bridge. The primary lower-region aggregate therefore remains unresolved. The separate high-tail extraction obligation is outside this route claim.

## Verification boundaries

All packet-listed hashes matched before review. This review is a direct mathematical audit of the two source claims, with exact rank/domain checks above. I did not execute a source script, run bounded generation, or independently recompute the large control trees. No claim beyond the identity and exact conditional reformulation is supported here.
