# C3-CU-T2 critique of C3-T2

## Disposition

**Claim `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: retained_narrowed.** The exact rooted product decomposition, the stated tag-weight formula, and the stated root-boundary switch descriptions are valid for an arbitrary finite ordinary tree and any fixed selected-leaf set. They provide an exact decomposition of states and weights, but no weighted Hall theorem, complete-sum inequality, or eligible counterexample. The stronger universal transport conclusion remains open.

## Independent audit

Let `r` be the chosen root, with branches `T_i` rooted at its neighbors `u_i`, and `T_i^- = T_i-u_i`. Every independent set either omits `r` and is a tuple of independent sets `A_i` of `T_i`, or contains `r` and is `{r}` together with independent sets `A_i` of `T_i^-`. These cases are disjoint and exhaustive; ranks are respectively `sum |A_i|` and `1+sum |A_i|`. This includes the one-vertex tree and empty branches.

For a selected original leaf `v` in branch `i` whose original support is not `r`, all vertices of `W_v=N_T(s_v)\\{v}` lie in branch `i`, except possibly `r` when `s_v=u_i`. Thus the branch contribution is active exactly when `A_i` contains `v` and either it contains a vertex in `W_v\\cap V(T_i)`, or the root is present and `r in W_v`. This is the claimed `w_i^epsilon` boundary term. If `s_v=r`, then `v` is a root neighbor `u_i`; its tag can be active only with `r` absent and with at least one *other* root neighbor occupied. Hence the cross-branch term is precisely `sum_{i in J} z_i 1_{sum_{ell != i} z_ell>0}` on the root-absent slice. The same-support case is counted once per selected leaf through the sum over `J`; it is not collapsed into one support tag.

For legal switches, a center `r` requires `r` absent and exactly two occupied neighbors `u_i,u_j`; the operation removes those two and inserts `r`, so exactly those two branch-root occupancies change. For any other center, its closed neighborhood is within one branch unless the center is `u_i` and `r` is one of the two occupied neighbors. That exceptional switch removes `r` and one occupied child of `u_i`, inserts `u_i`, and crosses the root-state boundary. These descriptions use the original tree and correctly require an absent switch center and exactly two actual occupied neighbors.

The decomposition is useful for representing the state space and locating boundary interactions. It does not factor the weighted Hall problem into independent branch problems: arbitrary subsets of rank-`p+1` states may select only some interior branch tuples; multiple root-switch demands can compete for shared rank-`p` capacities; and the root-state/support-boundary weights must be preserved by any compression. No compression, matching, capacity proof, or scalar-sum comparison is supplied. In particular, failure of Hall for this proposed relation would only refute this certificate, not the primary inequality.

## Scope checks and limitations

The primary target still requires the original fixed strict-selector set `F(T,p)`, terminally verified first descent `x(T)`, `x+2<=p`, `3p<2a+1`, and the full sum over every selected original leaf with original support and neighborhood. The route makes no claim that verifies those selector values on a tree, sums the route's weights into `S(T,p)`, proves the global capacity inequality, or supplies a positive eligible full-sum counterexample. Its unconditional structural identities apply to any fixed `F`, so they do not rely on eligibility; conversely, this cannot discharge any primary-target guard.

I independently checked packet hashes: 115 common entries plus the three case entries, 118 total, all matched. The source report's count of 115 common hashes is consistent with the packet. I did not replay code or rely on any unlisted source. No exhaustive computation, literature bridge, or formal proof was used. No status beyond proposed open is warranted.
