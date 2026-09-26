# C6-CT-U6 critique (orientation T)

## Disposition

**U6-MARKED-RECURRENCE-TRANSPORT — retained_narrowed.** The exact fixed-selector reduction and the explicitly bounded calculations are sound as stated below. One sentence in the route report can be read too broadly: a set counted by `q_v(j)` maps to a set containing the tagged leaf `v` **and** at least one member of `W_v`; it is not a bijection onto all independent sets containing `v`. This restriction does not invalidate the route's identities or final open-status conclusion.

## Independent algebra check

Fix the original `F=F(T,p)` at every rank, and put `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, `R_v=H_v-W_v`, and `q_v(j)=i_j(H_v)-i_j(R_v)`. Since `R_v` is obtained by deleting `W_v`, `q_v(j)` counts independent `j`-sets of `H_v` meeting `W_v`. Adjoining `v` preserves independence because its sole neighbor `s_v` was deleted. Conversely, deleting `v` from a set containing `v` and a member of `W_v` gives such an `H_v`-set. The bijection retains a separate tag for every original selected leaf, including leaves sharing a support.

For each tag, its summand is

`Delta_(p-1)(H_v)-Delta_(p-1)(R_v) = q_v(p)-q_v(p-1)`.

Summing over the unchanged selected set gives exactly `S(T,p)=Q_p-Q_(p-1)`. This is a useful reformulation of the complete sum; it is not a sign argument. In particular the first strict descent of `I(T;z)` and the selector inequalities `Delta_p(T-v)<0` have not been shown to force this fixed marked measure to be nonincreasing from rank `p-1` to `p`.

The component recurrence is also valid: after deleting `v,s_v`, each nonempty component has exactly one neighbor of `s_v` as its marked root, by connectivity and acyclicity. Writing `A_i=I(C_i)` and `B_i=I(C_i-w_i)`, `I(H_v)=prod A_i`, `I(R_v)=prod B_i`; telescoping the product difference gives the stated sum of nonnegative-polynomial terms. This proves coefficient nonnegativity of `q_v`, not adjacent-rank monotonicity.

The route's selector identity follows from `I(T-v)=I(H_v)+zI(R_v)`: if `delta_v=Delta_p(T-v)`, then `q_v(p)-q_v(p-1)=i_(p+1)(H_v)-i_(p-1)(H_v)-delta_v`. Thus the proposed summed two-rank drop in the `H_v` coefficients is equivalent to the desired marked comparison after using the fixed selector; strict negativity of each `delta_v` alone does not establish that drop.

## Replay and bounded scope

I verified both packet-listed route hashes and all common packet hashes. I replayed local copies of both route scripts with a local copy of the pinned `inputs/ordinary_tree_checked.py`; only import/output path setup was changed. The two generated JSON objects match the route JSON objects exactly. Commands used the pinned Python 3.11 executable. Details and artifacts are in `REPLAY-RESULTS.json`, the two replay scripts, and their generated JSON files.

The Prüfer census generation boundary is exact for labeled trees of orders 1–8 (280,393 total), but there are zero eligible `(T,p)` rows. It therefore contributes no target sign evidence. The `T_m` computation has 13 eligible rows for `m<=8`, all with negative `S` from `-1,167` to `-58,083,912`; this is bounded family evidence only. These computations neither prove the arbitrary-tree assertion nor refute it.

## Proposed status and limitations

Keep the source claim open. No imported theorem was used. No eligible positive complete sum was found, and no proof of the required marked-rank transport was established. The route's exact identities are useful because they isolate the unresolved obligation without changing the selected leaf tags; the unresolved inequality remains the decisive gap.
