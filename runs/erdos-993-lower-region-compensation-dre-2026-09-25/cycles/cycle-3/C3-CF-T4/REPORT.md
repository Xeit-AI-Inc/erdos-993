# C3-CF-T4 critique of C3-T4

## Disposition

**C3-T4-ODD-SHELL-REDUCTION: retained_narrowed.** The order classification and coefficient calculation are correct after adding a necessary first-mark ordering condition and treating the all-isolated-mark case separately. As written, the claim that every residual has order at most `2k+1` is false if the first mark is isolated. The route does not establish a sign for either boundary class, a guarded realization of its matching example, or the selected complete sum.

## Reconstruction and first-mark audit

For a selected original leaf `v`, let `H=T-{v,s_v}` and `W=N_T(s_v)\{v}`. At parent order `n=2p+3`, `|H|=2p+1=2k+3` for `k=p-1`. Distinct vertices in `W` are nonadjacent in `H` (indeed in `T`), since an edge between two neighbors of `s_v` creates a triangle. For any fixed ordering `w_1,...,w_m` of `W`, the first-mark partition is valid:

`q_j(H,W)=sum_i i_(j-1)(J_i)`, with `J_i=H-(N_H[w_i] union {w_1,...,w_(i-1)})`.

The union has size `deg_H(w_i)+i`: earlier marks are distinct and outside `N_H[w_i]`. Thus the route's residual-size bound requires `deg_H(w_1)>=1`. If `w_1` is isolated, the union has size one and `|J_1|=2k+2`, contrary to the unqualified bound in the source claim/report.

This omission is repairable when `W` contains a nonisolated vertex: order a nonisolated mark first, then the remaining marks. The first deletion then has size at least two, as do all later deletions. Under this ordering:

- `|J_i|=2k+1` iff `i=1` and `deg_H(w_1)=1`;
- `|J_i|=2k` iff `(i,deg_H(w_i))=(1,2)` or `(2,1)`; in the latter case the earlier mark is outside the current closed neighborhood;
- all other residuals have order at most `2k-1`.

For those smaller residuals, incidence counting is correct: `k i_k(J) <= (|V(J)|-k+1)i_(k-1)(J) <= k i_(k-1)(J)` when `|V(J)|<=2k-1`. This is a nonpositive contribution to `q_(k+1)-q_k`.

If `W` has no nonisolated vertex, connectedness of the original tree implies that every component of `H` is a singleton rooted at a vertex of `W`; hence `H` is edgeless and `W=V(H)`. This case is outside the route's stated residual reduction. For the primary favorable selector it is harmless at this shell: then `T` is a star and `T-v` has `Delta_p(T-v)=0` (the adjacent binomial coefficients at `p,p+1` are equal), so this leaf is not selected by the strict condition. The route does not state or use this selector-based exclusion in its structural claim.

The bridge to the target summand is exact: with `R=H-W`, `q_j=i_j(H)-i_j(R)` and `q_{k+1}-q_k=Delta_{p-1}(H)-Delta_{p-1}(R)`. It applies only after retaining the fixed original favorable set and summing these per-leaf differences. No replacement selector or support-fiber aggregation is justified.

## Coefficient arithmetic and scope

For a matching of `k` edges plus one isolate, `I(z)=(1+2z)^k(1+z)`. Coefficient extraction gives

`i_k=2^k+k 2^(k-1)`,
`i_(k-1)=k 2^(k-1)+binom(k,2)2^(k-2)`,

so `i_k-i_(k-1)=2^(k-2)(4-binomial(k,2))`. This reproduces the reported values for `k=1,...,5`: `2,3,2,-8,-48`. The expression is valid for `k>=1`, including the half-power notation at `k=1`, which evaluates to the integer 2. This checks the arithmetic, not realizability as a first-mark residual in a tree subject to the rank and selector guards.

## Exact surviving statement and limits

Surviving narrowed statement: at `n=2p+3`, for a leaf with `W` containing a nonisolated mark, put a nonisolated mark first in the first-mark order. The residual order classification above and the small-residual shadow inequality hold; the matching-plus-isolate coefficient formula is exact for that graph subclass. Separately, if `W` has no nonisolated mark in the tree specialization, `H` is edgeless and the leaf fails the strict favorable selector at this shell.

This is useful as a decomposition of each eligible shell summand, but it leaves the odd `2k+1` and even `2k` boundary signs and any compensation between them unresolved. The first-shell candidate concerns the distinct order `2p+2`; it does not supply these order-`2p+3` boundary signs. No standing counterexample or census is either reproduced or contradicted here. In particular, a positive local residual would not refute the global selected sum. No exact guarded ordinary-tree lift of the matching residual, no complete positive `S(T,p)`, and no universal proof is supplied. Therefore the primary lower-region aggregate remains open.

## Limitations

- The source's unqualified residual-size statement needs the ordering/nonisolated-mark repair described above.
- No universal sign bound or global compensation theorem is proved for the order-`2k+1` and order-`2k` residuals.
- The matching calculation is not shown realizable under the ordinary-tree rank and selector guards.
- No full-sum proof or counterexample, census, imported theorem, or formal result is established.
