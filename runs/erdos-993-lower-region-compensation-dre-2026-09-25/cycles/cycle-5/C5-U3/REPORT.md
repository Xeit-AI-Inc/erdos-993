# C5-U3 search report — matching slack and first descent

## Scope and source control

The case packet assigns stage `search`, orientation `U`, and no case-listed source files, source workers, or required source claim IDs. I read the common solution contract, protocol, execution policy, neutral handoff, intake reconciliation, and C5 search allocation. The C5 allocation assigns U3 to structural decomposition of matching slack and first-descent data, with a useful inequality and an account of positive T22 arm tags. All 237 common source pins listed in `packets/C5-COMMON.json` were SHA-256 checked; each matched. I did not read prior worker outputs or unlisted research files, and did not use a literature import.

## Exact incidence graph and its alternating-path structure

Fix an ordinary tree `T`, a rank `p` satisfying the contract, and its *fixed* favorable set `F=F(T,p)`. For a leaf `v` in `F`, use the contract's `H_v`, `W_v`, `k=p-1`, `h=a-1`; let `L_v` be the marked independent k-sets of `H_v` (sets meeting `W_v`) and let `R_v` be all independent (k+1)-sets of `H_v` meeting `W_v`. Form the bipartite incidence graph `G_v` with parts `L_v,R_v`, joining `A` to `J` precisely when `A` is a k-subset of `J`.

For `A in L_v`, its degree is its *actual* addability `e(A)`. For `J in R_v`, write `t=|J intersect W_v|`. Its degree in this incidence graph is `k` if `t=1` (the one deletion that removes the unique mark is excluded), and `k+1` if `t>=2`. Summing right degrees gives the exact count

`E_v = k U_v + C_v`,

where `U_v=|R_v|=q_v(k+1)` and `C_v` counts each multiply marked upper set once. This count keeps all original leaf tags separate: `G_v` is constructed separately for every selected original leaf, even when supports coincide. Summing left degrees gives `E_v=sum_{A in L_v}e(A)`.

Here is a structural decomposition that does not assume the desired budget. In any finite bipartite graph `G=(L,R;E)` with a maximum matching `M`, start alternating reachability from any set `S` of unmatched vertices in `L`; traverse nonmatching edges from left to right and matching edges from right to left. Let `X` and `Y` be the reached left and right vertices. No vertex of `Y` can be unmatched on the right, since that would give an augmenting path. Every `y in Y` is therefore matched to a reached vertex of `X`, and every reached `x in X\\S` was reached from its matched partner in `Y`. These matching edges pair `Y` bijectively with `X\\S`. Also `N(X)=Y`: every nonmatching neighbor of a reached left vertex is reached, while its matching neighbor (if it has one) is the predecessor through which it was reached. Thus

`|X|-|N(X)|=|X|-|Y|=|S|`.

Consequently, for any attempt to match additional arm-tag vertices into a resource side, there are exactly two alternatives: an alternating path reaches a free resource and increases the matching by one, or the full alternating closure supplies a Hall-deficient cut whose deficit is the number of reached unmatched tags. This identifies where compensation must cross a proposed cut; a count of positive tags alone cannot establish compensation.

## Relation to the primary sum and the remaining obstruction

Writing `Q=sum_{v in F}q_v(k)` and summing `E_v=kU_v+C_v` over this same fixed selector gives the exact identity `k*S=k(U-Q)=E-C-kQ`. The elementary two-color addability bound gives `e(A)<=h-k` in each color class, hence `D_v=sum_A(2(h-k)-e(A))>=0`; substituting yields the contract's exact rewrite

`k*S=(2a+1-3p)Q-sum_{v in F}(D_v+C_v)`.

The alternating-path lemma is compatible with this incidence graph but does not bound its *weighted degree deficit* `sum(D_v+C_v)`. In particular, its Hall cut is unweighted and does not compare that deficit with the positive lower-region coefficient `(2a+1-3p)Q`. The selector condition `Delta_p(T-v)<0` is a coefficient statement for each selected deletion. The first-descent condition controls `Delta_j(T)` only for the ranks preceding `x(T)` and fixes the gap `p>=x+2`; neither condition, as currently used here, gives a map from the relevant unmatched incidence vertices to free resources or bounds the weights crossing every Hall cut. No local transformation with a global invariant tying these cuts to the first-descent rank was found.

The neutral handoff says an unsigned blockwise injection failed at T22 and flags positive T22 arm tags as needing compensation. It does not provide the graph encoding, weights, or full tree data in the assigned source set. The lemma above specifies a way such a compensation proof could be audited (show augmenting paths, or show that the cut deficit is offset by explicitly weighted boundary exits), but it does not assert that such paths or exits exist for T22. I therefore make no T22-specific numerical or refutational claim.

## Conclusion and limitations

This route yields an exact alternating-reachability cut decomposition for the tagged incidence graph and an audit criterion for a proposed across-tag matching charge. It is not a proof or refutation of the ordinary-tree aggregate. The needed weighted cut inequality, the link from first descent to those cuts, and any concrete T22 compensation certificate remain unresolved. No census or universal conclusion is claimed.
