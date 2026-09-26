# C6-CF-U4 independent critique (orientation F)

## Reviewed source claim

`C6-U4-MATCHING-DEFICIENCY-BUDGET` from the pinned C6-U4 report and return. Disposition: **retained**.

## Independent check

Fix any eligible tree and one selected original leaf tag `v`. Deleting `v` and its original support `s_v` leaves the forest `H_v`; `R_v=H_v-W_v` with `W_v=N_T(s_v)\{v}`. For an independent `k`-set `A` in `H_v` meeting `W_v`, its actual addable vertices are precisely the vertices outside `N_{H_v}[A]`. Since `A` is independent, `|N_{H_v}[A]|=k+|N_{H_v}(A)|`, so

`e_v(A)=n_v-k-|N_{H_v}(A)|`, where `n_v=|V(H_v)|`.

Every finite forest is bipartite, and the bipartite matching-cover equality gives `alpha(H_v)=n_v-nu(H_v)`, including disconnected forests. Thus, writing `h=alpha(H_v)`,

`2(h-k)-e_v(A)=n_v-2nu(H_v)+|N_{H_v}(A)|-k`.

All neighborhoods in this calculation are in `H_v`. In particular, replacing them with neighborhoods in `T` would be a different identity. The equality applies tag by tag, so summing it over selected leaves preserves distinct tags even when their supports agree.

For completeness, let `Q=sum_v q_v(k)`, `U=sum_v q_v(k+1)`, `D=sum_v sum_A(2(h-k)-e_v(A))`, and let `C` count upper independent sets with at least two marks, once per tag and set. Count extension pairs `(A,w)` by their upper set: a set with exactly one mark contributes `k` marked parents, and a set with at least two marks contributes `k+1`. Hence `E=kU+C`; by definition `D=2(h-k)Q-E`. Also the tagged summand is `q_v(k+1)-q_v(k)`, so `S=U-Q`. Substitution gives

`kS=(2h-3k)Q-D-C=(2a+1-3p)Q-D-C`,

using `h=a-1`, `k=p-1`. Eligibility gives `p>=2`, hence `k>0`; therefore `S<=0` is equivalent to the stated budget. This derivation also confirms the sign and coefficient.

## Scope, usefulness, and limits

The identities concern exactly the fixed favorable set of original-leaf tags and the local residual forests specified in the contract. Empty marked families cause no problem in the summed identities; the source correctly restricts its expectation formulation to `Q>0`.

The rewrite does not derive the positive lower bound on `D+C` from `Delta_p(T-v)<0`. The selector condition is a coefficient sign in `I(T-v;z)=I(H_v;z)+zI(R_v;z)`, whereas the rewritten obligation is a selected rank-`k` neighborhood-expansion average plus the multiply-marked correction. The source identifies this missing implication rather than claiming to prove it. Thus the result is a sound diagnostic/equivalent formulation, not a resolution of the primary aggregate. It presents no counterexample and does not conflict with the standing T22 positive-tag control or other fences.

I did not run a census, inspect a flow certificate, or search external literature; those are review limitations, not mathematical counterexamples. The bipartite matching-cover equality is used only with its standard finite-bipartite-graph hypotheses, satisfied by `H_v`; no stronger theorem is imported.

## Disposition

**retained** — the stated pointwise identity and conditional equivalence are correct at the stated scope. The claim correctly leaves the selector-to-budget implication open.
