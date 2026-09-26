# Critique of C1-T4-1

**Disposition: retained.** The probability reformulation is correct on the assigned lower-region scope, and the route correctly treats it as a partial result. It establishes neither the aggregate inequality nor its negation.

Let `v` be an original leaf, `s=s_v`, `G=T-v`, `H=T-{v,s}`, `W=N_T(s)\\{v}`, and `R=H-W`. Partitioning independent sets of `G` according to whether they contain `s` gives

`i_j(G)=i_j(H)+i_(j-1)(R)`.

Subtracting adjacent ranks yields

`Delta_p(G)=Delta_p(H)+Delta_(p-1)(R)`.

For the favorable selector, `Delta_p(G)<0` is equivalent to `i_(p+1)(G)<i_p(G)`. In particular, a favorable leaf automatically has `i_p(G)>0`: its right-hand count is nonnegative and its left-hand count is strictly smaller. Thus the route's stated positive-denominator condition is always met for selected leaves. Double-counting pairs `(J,u)` with `J` an independent `p`-set of `G` and `u` addable to `J` gives `sum_J e_G(J)=(p+1)i_(p+1)(G)`. Dividing by `i_p(G)` proves the uniform-rank expectation formula and the threshold `<p+1` exactly.

The target summand is also identified correctly. Since `q_j=i_j(H)-i_j(R)` counts independent `j`-sets meeting `W`,

`Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1)`.

This is a marked adjacent-rank difference in `H`, not the unconditioned rank-`p` addability average on `G`. The route does not infer a coupling or inequality between them. Its further incidence identity is consistent: for `k=p-1`, each singly marked rank-`k+1` extension contributes `k` marked-preserving deletions and each extension with at least two marks contributes `k+1`, so `sum_A e_H(A)=kq_(k+1)+C`. With `D=sum_A(2(h-k)-e_H(A))`, substitution gives `kS=(2a+1-3p)sum_F q_v(k)-sum_F(D_v+C_v)`; here `k>0` follows from `p>=x+2` and `x>=0`. The strict lower-region hypothesis makes the coefficient positive. Nonnegativity of `D_v,C_v` alone therefore does not prove the required aggregate budget.

The stated scope preserves the registered ordinary-tree target: original leaves retain separate tags, selector values use the fixed `F(T,p)`, and the sum is global. The common controls reinforce why a local term cannot decide it: eligible `T22` and `T60` have positive marked/local terms but negative complete sums. No new tree, coefficient vector, or full-sum replay is claimed here; none is needed for this algebraic audit. No source computation was executed, and no evidence is offered for the global budget or a counterexample.

The auxiliary bipartite identity, even when valid, is only an exact accounting reformulation. The missing step remains a lower bound on the selected sum of deficits by `(2a+1-3p)sum_F q_v(k)` (or a different proof of the target). Accordingly the evidence supports retaining this one partial reformulation with proposed status `proposed_open`, not a verdict on the registered target.
