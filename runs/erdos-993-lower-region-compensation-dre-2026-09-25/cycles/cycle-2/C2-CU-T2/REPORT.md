# C2-CU-T2 critique — fixed-selector rank coordinates and cross-tag transport

## Disposition

**retained_narrowed.** The route's exact rank-coordinate identity and its matching criterion are correct at the contract scope. They reduce the target to a concrete capacity obligation; they do not prove that obligation or the sign of the aggregate. The primary remains proposed open.

## Independent algebra check

Fix a contract instance and its one selector `F=F(T,p)`. For each selected original leaf `v`, let `s=s_v`, `H=T-{v,s}`, `R=T-N_T[s]`, and `W=N_T(s)\{v}`. Since `R=H-W`, the independent sets counted by `q_v(j)=i_j(H)-i_j(R)` are exactly the independent `j`-sets of `H` meeting `W`. Therefore, with `k=p-1`,

`Delta_k(H)-Delta_k(R) = [q_v(k+1)-q_v(k)]`.

Summing over the fixed selected leaves gives `S(T,p)=sum_F(q_v(p)-q_v(p-1))`. This is valid with distinct leaf tags even when supports coincide; no support-fibre collapse occurs.

For each independent set `A` of `H` meeting `W`, adjoining `v` gives an independent set `B=A union {v}` in the original tree: its only neighbor is the omitted support `s`. Conversely, every independent `B` counted by the `v`-tag in `w_F(B)` omits `s`, and deleting `v` recovers exactly such an `A`. This proves, rank by rank,

`sum_F q_v(j)=sum_{B independent in T, |B|=j+1} w_F(B)`.

At `j=p` and `j=p-1`, the two global ranks are respectively `p+1` and `p`, so the route's final weighted-rank difference is indexed correctly. The selector is the same `F(T,p)` at both ranks; it is not recomputed at `p+1`. This agrees with the permitted `C2-GLOBAL-WEIGHT-COORDINATES.md` derivation.

## Transport check and proof gap

The token sets `U_r={(B,v): |B|=r, v in F, and v is counted in w_F(B)}` have cardinalities equal to the corresponding weighted rank totals. An edge from `(B,v)` to `(A,u)` only when `A=B-{z}` for a vertex `z` and `u` is counted in `w_F(A)` is a well-defined bipartite graph on those tokens. A matching saturating `U_{p+1}` uses each lower token at most once and implies `|U_{p+1}|<=|U_p|`, hence `S<=0`. A unit-capacity fractional flow with every upper token routed implies the same inequality; for this finite bipartite network, its feasibility is equivalent to the same Hall capacity conditions.

That implication is only sufficient. The route gives no argument that every upper token has a neighbor, or that Hall's inequality holds for every subset of upper tokens under the tree structure and all strict selector tests `Delta_p(T-v)<0`. Eligibility (`x(T)+2<=p`, including terminal zero-extended descent, and `3p<2a+1`) is recorded but is not used to prove transport capacity. Nor do the rank identities themselves use the favorable selector beyond fixing `F`. Thus they are valid reformulations for eligible instances, not a sign estimate.

There is no unrealizable object in the construction: for any actual eligible `(T,p)`, its selected leaf tags and independent sets instantiate these token sets. But the criterion's usefulness remains conditional until a capacity proof is supplied. A failed matching for some tree would refute only this certificate, not the aggregate. A positive weighted local rank contribution likewise would not refute the complete sum. The cited standing controls against universal within-tag matching do not rule out this cross-tag construction, but they also provide no capacity result for it.

## Scope and evidence grade

No finite witness, selector list, complete-sum arithmetic, external theorem, or census is claimed by the source route; no replay is needed. I checked the identities directly from the deletion definitions. The required common and case source hashes matched their packet pins. No conclusion follows about whether an eligible tree with positive full `S` exists. The exact primary assertion remains unresolved.

## Limitation

A proof still needs a tree-specific Hall inequality, a fractional-capacity bound, or another rank-comparison argument establishing `sum_F q_v(p)<=sum_F q_v(p-1)` for every instance under the fixed favorable selector and both lower-region guards. A refutation still needs one fully specified eligible ordinary tree and its exact positive complete selected sum.
