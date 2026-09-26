# C4-CF-U1 critique report

## Reviewed claim

`C4-U1-COVARIANCE-DECOMPOSITION` is **retained** as an exact algebraic reformulation in the route's stated scope. Its tag-bijection, addability identity, expectation calculation, covariance decomposition, and vertex-neighborhood expansion are valid for each eligible finite ordinary tree and its fixed original selector. No covariance sign or universal CT_x bound follows from these identities.

## Independent audit

Fix an eligible `(T,p)` and its selector `F`. Write `k=p-1`, `H_v=T-{v,s_v}`, and `W_v=N_T(s_v)-{v}`. A counted object on the marked side is a tag `v` together with an independent `k`-set `A` of `H_v` meeting `W_v`. Its image `B=A union {v}` is independent: the only neighbor of the original leaf `v` is `s_v`, which is absent from `H_v`. Conversely, any `p`-set counted by the tag contribution to `w(B)` yields `A=B-{v}`. These two constructions are inverse, preserving the tag even when several selected leaves share a support. Thus `Q=sum_B w(B)`.

For `u` in `H_v`, adjacency to `v` is impossible because `v` has only neighbor `s_v`; consequently `A union {u}` is independent in `H_v` exactly when `B union {u}` is independent in `T`. The support `s_v` is not addable to `B`, since `A` meets `W_v`. The omitted leaf `v` is already in `B`. These account for every vertex of `T`, and give `e_Hv(A)=e_T(B)`, hence `E=sum_B w(B)e(B)`.

Let `N=i_p(T)` and use the uniform distribution on the independent `p`-sets. Eligibility gives `p<a=alpha(T)`: the strict integer inequality `3p<2a+1` implies `3p<=2a`, hence `p<a`. Therefore `N>0`; also `i_x(T)>0` because `Delta_x<0` can first occur no later than `x=a`, where `i_a>0` and `i_{a+1}=0`. Double-counting pairs `(B,u)` with `|B|=p` and `B union {u}` independent gives `sum_B e(B)=(p+1)i_(p+1)(T)`, so `E_p[e]=mu_p`. Since `E_p[w]=Q/N` and `E_p[we]=E/N`, for `Q>0`:

`E/Q = E_p[we]/E_p[w] = E_p[e] + Cov_p(w,e)/E_p[w] = mu_p + Cov_p(w,e)/E_p[w]`.

For the neighborhood form, define `I_u(B)=1` iff `B cap N_T[u]` is empty. This is precisely the indicator that `u` is addable, so `e(B)=sum_u I_u(B)`. Also `sum_B I_u(B)=i_p(T-N_T[u])`. Expanding covariance linearly over these indicators yields exactly the report's displayed sum. The term is zero for `w(B)I_{s_v}(B)` from tag `v`, since that tag requires `v in B` while `I_{s_v}=1` requires `v notin B`; this individual tag observation does not determine the other terms or their total.

Finally, for `Q>0`, dividing the CT_x inequality `i_x E <= (x+1)i_(x+1)Q` by `i_x Q` gives `E/Q<=mu_x`, which is equivalent to the stated covariance budget. At `Q=0`, the undivided inequality is `0<=0`; the divided expression is undefined and is properly excluded.

## Scope and gaps

The proof is algebraic and does not depend on the favorable predicate beyond fixing the tag set, so it preserves the exact original selector and distinct-tag convention required by the contract. It establishes no sign for the full covariance and no order between `mu_p` and `mu_x`. In particular, the support-neighborhood terms do not control the remaining vertex terms. No graph-specific bounded diagnostic was replayed; the route's cited order-14 example is not needed for this claim and is not treated as a premise. The primary aggregate and CT_x remain unresolved by this route.

## Disposition

**retained** — exact identities and tag correspondence verified. Proposed status: `proposed_verified` for this algebraic claim only.
