# C3-CT-U3 critique (orientation T)

## Audit basis and result

I audited both claims in the sealed C3-U3 return against the case source, the solution contract, the common handoff, and the listed Cycle 3 scope controls. I checked SHA-256 for all 118 unique source paths listed across the case and common packets: no listed file was missing and no digest differed. No source replay or computation was needed; no sealed file was modified.

Both claims are **retained** at their stated scopes, as informal mathematical claims. Claim 1 uses the first-wide classification only at exact order `2r+2` with `r=k-1>=1`; its other rank comparisons follow from deletion-extension incidence counts. Claim 2 follows from the cover contradiction, marked-graph inequality, and exact leaf specialization. Neither claim proves the primary aggregate outside the parent order `2p+2` shell, and neither earns a status award.

## Claim audit: `C3-U3-MARKED-COVER-SHELL`

For an arbitrary marked set, write `q_j(G,W)` for the independent `j`-sets meeting `W`, with zero extension. The split at `w in W` is exact and disjoint:

`q_j(G,W) = i_(j-1)(G-N[w]) + q_j(G-w,W\\{w}).`

The first term contains `w`; the second omits it. No earlier closed neighborhoods are removed. At `j=k+1`, the desired difference splits into the unmarked difference `i_k(J)-i_(k-1)(J)` and the marked difference on `G-w`.

The auxiliary bound for order at most `2k` is valid: count incidences between marked independent `(k+1)`-sets and their mark-preserving `k`-subsets. Each upper set supplies at least `k` incidences; each lower set has at most `|V|-k<=k` extensions. Thus `q_(k+1)<=q_k` (and zero-extension handles impossible ranks).

For the arbitrary-mark order-at-most-`2k+1` step, if `W` is empty both counts vanish. Otherwise split at any `w`. The second residual has order at most `2k`, so the incidence bound applies. For the first residual `J=G-N[w]`, its order is at most `2k`. If it is at most `2k-1`, ordinary deletion-extension counting gives `i_k(J)<=i_(k-1)(J)`: each independent `k`-set has `k` deletions, while a `(k-1)`-set has at most `|V|-k+1<=k` extensions. If `|J|=2k`, then `|G|=2k+1` and `w` is isolated, so every edge of `G` lies in `J`; the assumed two edges let the exact first-wide classification apply with `r=k-1>=1`.

For the claimed order `2k+2`, the selected mark `w` is non-isolated. Hence `|G-N[w]|<=2k`. If that residual has order `2k`, exactly two vertices were deleted: `w` and its sole neighbor `z`. Every edge outside the residual meets `z`. Were the residual to have at most one edge, `z` and one endpoint of that edge would cover all of `G`, contrary to `tau(G)>=3`; so the exact first-wide classification again applies. If the residual is smaller, ordinary counting applies. The second residual `G-w` has order `2k+1`; if it had at most one edge, `w` and an endpoint of that edge (or just `w`) would cover `G` with at most two vertices. Thus it has at least two edges and the arbitrary-mark reduction applies. This proves the marked inequality.

The graph, rank, and edge hypotheses are met at every first-wide invocation. The registered first-wide result is for finite simple graphs of exact order `2r+2` and `r>=1`; here `r=k-1` and `k>=2`. The Catalan-floor source used in the following claim is only needed as an informal exact arithmetic inequality, with its specified zero-extension cases. No universal tree log-concavity, real-rootedness, or unbounded order claim is used. The result is consistent with the inherited refutation fences because it is a marked inequality under a cover/order restriction.

**Disposition: retained.** The report's two-part split and auxiliary reduction are checkable; I found no missing case or scope expansion in this claim.

## Claim audit: `C3-U3-FIRST-SHELL-POINTWISE`

Let `n=2p+2`, `p>=3`, and suppose `x(T)+2<=p`. The route's cover argument is valid. If `tau(T)<=3`, extend a cover to a 3-set `C`; `U=V(T)\\C` is independent of size `2p-1`. Partition independent sets by `X=I intersect C` to obtain

`I(T,z)=sum_(X subset C, X independent) z^|X| (1+z)^b_X.`

At rank `r`, the empty-`X` contribution is `E(2p-1,r)=binom(2p-1,r+1)-binom(2p-1,r)`. Each nonempty `X` of size `a` contributes at least `-Cat_(r-a)`; there are at most `3,3,1` choices at sizes `1,2,3`. For `0<=r<=p-2`, `2p-1>=2r+3`, and the stated monotonicity of `E` gives the lower bound

`E(2r+3,r)-3Cat_(r-1)-3Cat_(r-2)-Cat_(r-3)`.

The route's positivity check is sound: for `r=0,1` the margins are `2`; for `r>=2`, `E(2r+3,r)=2(2r+3)/(r+3) Cat_(r+1)>=2Cat_(r+1)`, `Cat_(r+1)>=4Cat_(r-1)`, and the subtractions total at most `7Cat_(r-1)`. Therefore every `Delta_r(T)>0` through `r=p-2`, contradicting `x(T)<=p-2`. So `tau(T)>=4`.

For an original leaf `v` with original support `s`, put `H=T-{v,s}` and `W=N_T(s)\\{v}`. Since any independent set in `H` extends by `v`, while an independent set using `s` has no larger size than one in `H`, `alpha(T)=alpha(H)+1`. Consequently `tau(H)=tau(T)-1>=3`. Each component of the forest `H` contains its original neighbor of `s` in `W`; since `tau(H)>=3`, at least one component has an edge, and its root mark in `W` is non-isolated. Thus the marked inequality applies to `H`, whose order is `2p=2k+2` for `k=p-1>=2`.

The exact specialization is

`q_j(H,W)=i_j(H)-i_j(H-W)`, with `H-W=T-N_T[s]`.

Therefore `q_p-q_(p-1)=Delta_(p-1)(H)-Delta_(p-1)(T-N_T[s])`, the original tagged leaf summand. This holds for every original leaf, so it holds for the fixed favorable subset selected by `Delta_p(T-v)<0`; the selector is not recomputed, and leaves sharing a support remain separate terms. Pointwise nonpositivity proves the selected sum for this shell. No favorable-selector premise is needed to establish the pointwise fact, which makes the route statement stronger without changing its validity.

The statement does not establish the primary target at orders other than `2p+2`, nor the strict alpha-region aggregate in general. The source report's closing sentence claiming that the sealed case has “no allocated claim IDs” is inconsistent with its own RETURN, which lists the two claims audited here; this is a clerical statement and does not affect the mathematical reasoning. No proof gap or arithmetic error requiring narrowing was found.

**Disposition: retained.** Informal only; no formal award.

## Limitations

- The audit establishes correctness only for the two proposed claims and their exact scopes; it does not settle the all-order lower-region aggregate.
- The first-wide theorem's exact registered scope was checked; this critique does not reconstruct its separate formal proof.
- No new source replay, exhaustive computation, Lean build, or external-literature search was performed.
- The route source contains a clerical claim-ID sentence inconsistent with its own return, noted above.
