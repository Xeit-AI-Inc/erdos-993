# T4 probability translation and bridge audit

For one original leaf `v`, let `G=T-v`, `s=s_v`, `H=T-{v,s}`, `W=N_T(s)\\{v}`, and `R=H-W`. Write `i_j(X)` for independent-set counts and `Delta_j(X)=i_(j+1)(X)-i_j(X)`, with zero extension. Since independent sets of `G` either omit `s` or contain `s`,

`i_j(G)=i_j(H)+i_(j-1)(R)`.

Consequently the favorable-leaf test is exactly

`Delta_p(G)=Delta_p(H)+Delta_(p-1)(R)<0`,

or equivalently `i_(p+1)(H)+i_p(R)<i_p(H)+i_(p-1)(R)`.

There is a direct fixed-rank probability interpretation. If `J` is uniform among the independent `p`-sets of `G`, and `e_G(J)` is the number of vertices addable to `J`, double-counting pairs `(J,u)` with `u` addable gives

`E[e_G(J)]=(p+1)i_(p+1)(G)/i_p(G)`.

Thus, whenever `i_p(G)>0`, the favorable test is equivalent to `E[e_G(J)]<p+1`. This is an expectation over *all* rank-`p` independent sets of `G`.

For comparison, put `k=p-1`, `h=a-1`, and let `q_j=i_j(H)-i_j(R)`, the number of rank-`j` independent sets of `H` meeting `W`. Let `A` be uniform among these marked rank-`k` sets, when `q_k>0`, and let `e_H(A)` count actual addable vertices in `H`. The marked-incidence count is

`sum_A e_H(A)=k q_(k+1)+C`,

where `C` counts rank-`k+1` independent sets meeting `W` at least twice, once each. Indeed, a singly marked extension has `k` marked-preserving deletions and a multiply marked extension has `k+1`. In particular,

`E[e_H(A)]=k q_(k+1)/q_k + C/q_k`.

The summand attached to `v` is `q_p-q_(p-1)`. The favorable test bounds the mean addability in the unconditioned rank-`p` measure on `G`; the target requires the selected-leaf sum of adjacent-rank marked counts in `H`. These are different graphs, ranks, and measures. The formulas do not imply a stochastic domination, a conditional expectation bound, or a cross-leaf transport. No such bridge is established here.

Using the admitted specialization, with `D_v=sum_A(2(h-k)-e_H(A))`, the full target is equivalent (for `k>0`) to

`sum_(v in F)(D_v+C_v) >= (2a+1-3p) sum_(v in F) q_v(k)`.

This is a useful probability normalization of the exact deficit obligation, not a proof of it: `Delta_p(T-v)<0` only supplies the unconditioned expectation bound above. The positive coefficient in the strict lower region prevents nonnegativity of the deficits from closing the argument. Establishing a valid relation between these measures, or producing a complete eligible counterexample, remains open.
