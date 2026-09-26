# C6-U4 search report: matching deficiency and selected neighborhood expansion

## Scope and conclusion

I investigated the U4 route for the registered lower-region ordinary-tree aggregate. I obtain an exact matching-deficiency decomposition of the tagged addability deficit and an equivalent selected-rank neighborhood-expansion condition sufficient (indeed necessary through the admitted deficit identity) for the primary inequality. The decomposition exposes a concrete missing bridge from the first-descent selector to a neighborhood-expansion average. I do not prove that bridge and do not produce an eligible counterexample to the complete aggregate. The primary remains unresolved by this route.

## Exact setup

Let `T` be an eligible finite ordinary tree, `a=alpha(T)`, `p` satisfy `x(T)+2<=p` and `3p<2a+1`, and let `F={v original leaf: Delta_p(T-v)<0}` be the fixed selector. For each selected original leaf `v`, use its original support `s_v` and put

- `H_v=T-{v,s_v}`,
- `W_v=N_T(s_v)\\{v}`,
- `R_v=T-N_T[s_v]=H_v-W_v`,
- `h=a-1=alpha(H_v)`, `k=p-1`,
- `M_v(k)={A subset V(H_v): A independent, |A|=k, A intersects W_v}` and `Q_v=|M_v(k)|`.

The distinct leaf tags remain distinct even when supports coincide. For `A in M_v(k)`, let `e_v(A)` be the number of actual vertices of `H_v` addable to `A`, and set `d_v(A)=2(h-k)-e_v(A)`. Let `C_v` count independent `(k+1)`-sets of `H_v` meeting `W_v` at least twice, once per set.

## Matching-deficiency identity

Write `n_v=|V(H_v)|`, `nu_v=nu(H_v)`, and let `N_{H_v}(A)` denote the open neighborhood. Since `H_v` is a forest, it is bipartite; König's theorem gives `h=n_v-nu_v`. Also, because `A` is independent, its closed neighborhood has size `k+|N_{H_v}(A)|`. The actual addable vertices are exactly the complement of this closed neighborhood, so

`e_v(A)=n_v-k-|N_{H_v}(A)|`.

Consequently, with `delta_v=n_v-2 nu_v` (the number of unmatched vertices in a maximum matching of `H_v`),

`d_v(A)=2(h-k)-e_v(A)=delta_v+|N_{H_v}(A)|-k`.

This is an exact identity for each tagged marked set; it uses the local residual graph `H_v`, not a neighborhood in `T`. Summing over the fixed tags gives

`sum_v sum_{A in M_v(k)} d_v(A) = sum_v [delta_v Q_v + sum_{A in M_v(k)} (|N_{H_v}(A)|-k)]`.

Combining this with the contract's exact identity `k S=(2a+1-3p)Q-sum_v(D_v+C_v)`, where `Q=sum_v Q_v` and `D_v=sum_A d_v(A)`, yields the following explicit matching/neighborhood form. Put `c=2a+1-3p>0`. Then `S<=0` is equivalent to

`sum_v [delta_v Q_v + sum_{A in M_v(k)} (|N_{H_v}(A)|-k) + C_v] >= c sum_v Q_v`.

Equivalently, when `Q>0`, take a random tagged pair `(v,A)` by choosing uniformly from the disjoint union of all `M_v(k)`. Then the needed bound is

`E[delta_v + |N_{H_v}(A)| - k] + (sum_v C_v)/Q >= c`.

The weighting is by distinct selected leaf tags and marked sets, exactly as in the primary sum. Empty `M_v(k)` contributes zero; the expectation formulation is used only when `Q>0`.

## Relation to the selector and the precise gap

The selector has a different rank expression. In `T-v`, either the support `s_v` is absent, leaving `H_v`, or it is present, forcing all of `W_v` absent and leaving `R_v`. Therefore

`I(T-v;z)=I(H_v;z)+z I(R_v;z)`

and strict favorability is exactly

`Delta_p(H_v)+Delta_{p-1}(R_v)<0`.

This sign is a first-descent condition on coefficients. The matching decomposition shows that the target instead requires a lower bound on the *selected marked rank-k mean* of `|N_{H_v}(A)|`, augmented by the double-mark correction `C_v/Q`. I found no argument that transfers the displayed coefficient sign to that lower bound. Nonnegativity of `d_v(A)` and `C_v` only gives a zero lower bound and does not establish the positive amount `cQ`.

Thus a useful sufficient bridge would be a theorem proving, for this exact fixed selector and original-tag measure,

`sum_v [delta_v Q_v + sum_{A in M_v(k)} (|N_{H_v}(A)|-k) + C_v] >= (2a+1-3p) sum_v Q_v`.

Stated this way, it is the full missing budget, not an independent proof. A genuinely new proof must exploit the strict coefficient signs to establish this rank-k expansion estimate, or give another argument controlling the same deficit. This prevents mistaking the exact rewrite for progress on the primary verdict.

## Evidence grade and limitations

The per-set matching-deficiency identity above is proved directly from the definitions and König's theorem for bipartite graphs. The budget reduction is exact conditional on the contract's tagged incidence identity. I did not run a tree census, audit a finite-flow artifact, or search literature for a selector-transfer theorem. There is no new graph witness, complete eligible positive sum, or universal aggregate proof here. This report distinguishes those unperformed reviews from mathematical defects: I found a missing implication, not a counterexample.
