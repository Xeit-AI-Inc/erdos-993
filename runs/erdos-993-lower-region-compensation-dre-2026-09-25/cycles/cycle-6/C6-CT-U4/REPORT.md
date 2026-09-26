# C6-CT-U4 critique of C6-U4

## Disposition

**C6-U4-MATCHING-DEFICIENCY-BUDGET — retained_narrowed.** The pointwise matching-deficiency identity and the conditional equivalence between the full selected sum and the stated weighted budget are correct. The report's selector calculation has a sign error. Its conclusion that the calculation does not prove the required budget remains appropriate, but the claimed selector-to-budget gap must be read using the corrected selector formula below. This is a proof audit, not a refutation of the primary aggregate.

## Independent algebra check

For a selected original leaf `v`, let `H=H_v`, `W=W_v`, `h=alpha(H)`, `k=p-1`, and let `A` be an independent `k`-set in `H`. Since `H` is a forest, it is bipartite and Konig's theorem gives `h=|V(H)|-nu(H)`. Because `A` is independent, `|N_H[A]|=k+|N_H(A)|`. A vertex is addable to `A` exactly when it is outside `N_H[A]`, so

`e_v(A)=|V(H)|-k-|N_H(A)|`.

Consequently

`d_v(A)=2(h-k)-e_v(A)=|V(H)|-2 nu(H)+|N_H(A)|-k`.

All neighborhoods here are in the local residual graph `H`, as required. The identity also has the expected nonnegative deficit interpretation: the residual graph `H-N_H[A]` has independence number at most `h-k` (otherwise adjoining an independent set there to `A` exceeds `h`); its two bipartition classes are independent, hence each has size at most `h-k`, and so `e_v(A)<=2(h-k)`.

Let `Q=sum_v Q_v`, where the sum is over the fixed selector and each original leaf tag is retained separately, and let `c=2a+1-3p`. Eligibility gives `k=p-1>=1`, and the strict lower-region guard gives `c>0`. Substitution of the pointwise identity into the contract's exact tagged incidence identity

`kS=cQ-sum_v(D_v+C_v)`

gives the report's budget equivalence:

`S<=0` iff `sum_v [ (|V(H_v)|-2nu(H_v))Q_v + sum_{A in M_v(k)} (|N_H_v(A)|-k) + C_v ] >= cQ`.

This handles the empty-selector case as well: both sides of the original budget are zero. It does not turn nonnegativity of `D_v` and `C_v` into the positive lower bound `cQ`.

## Selector sign correction

Deleting the original leaf leaves `H_v` when its support is absent. When the support is present, all vertices of `W_v` are excluded, leaving `R_v`; thus

`I(T-v;z)=I(H_v;z)+z I(R_v;z)`.

For any polynomial `I(G;z)=sum_j i_j(G)z^j`, the contribution of `zI(R_v;z)` to `Delta_p(T-v)` is `i_{p-1}(R_v)-i_p(R_v)=-Delta_{p-1}(R_v)`. Therefore the exact selector condition is

`Delta_p(H_v)-Delta_{p-1}(R_v)<0`,

not the plus-sign expression printed in the source report. This is a mathematical sign error in that auxiliary line. Correcting it does not produce the selected marked-neighborhood budget, and it does not contradict the source claim's narrower statement that its matching rewrite supplies no proof of that budget.

## Scope and limitations

This review verifies the algebraic decomposition and its conditional use of the admitted exact incidence identity; it is not an independent proof of that separate identity. It does not prove the budget from the corrected selector sign, find a counterexample, run a census or flow replay, or review literature. No conclusion about availability of a selector-transfer theorem or the concrete deletion/two-for-one network is made. The primary ordinary-tree aggregate remains unresolved by this case.
