# C5-CF-T1 critique: guarded weighted tip-deck comparison

## Scope and disposition

I reviewed the single required claim, `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR`, against the registered identity, the sealed contract, the neutral handoff, and the assigned C5-T1 case. The case's `proposed_open` disposition is appropriate. Its recurrence is algebraically correct, but the recurrence and finite checks do not prove the universal guarded comparison and supply no guarded counterexample. I propose keeping the claim OPEN. This is a mathematical disposition, not an authoritative status update.

The registered predicate is exactly `M_k(W)=W[k]C[k]-W[k+1]C[k-1] >= 0` for nonempty arity-2/3/4 profiles and `1<=k`, `2k<=N+2`, with zero-extended coefficients and `W=sum_i r_i A_i`. The original multiplicity `r_i` is essential. This coefficient claim does not itself assert actual first-descent eligibility or selector facts. Any application to payment still has to use the actual least descent `x` (zero differences do not count), `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`, and the current-`p` strict flags `Delta_p A0<0`, `Delta_p Ai<0`; it cannot change the tags' original multiplicities or infer a branchwise or aggregate payment from a different rank.

## Independent algebra check

With `E=zL^N`, `U=sum_i r_i G B_(r_i-1)H_i`, `C=GQ`, adding an arity-`r` branch gives exactly

`C'=B_r C`, `U'=B_r U+r B_(r-1)C`, `E'=L^r E`, `N'=N+r`.

Substituting `W=U+NE` gives

`W'=B_r W+rB_(r-1)C+(rL^r-Nz)E`.

The residual is `((N+r)L^r-N(L^r+z))E`; thus the `-NzE` term is real. Since `N>=0` and `E` has nonnegative coefficients, its coefficient contribution is nonpositive, and dropping it cannot establish a lower bound on `W'` or its minors. The other displayed polynomial factors have nonnegative coefficients, but that fact alone does not control their shifted minors. The guard endpoint is `g(N)=floor((N+2)/2)`; its new strips are one rank for `r=2`, one or two for `r=3` according as `N` is even or odd, and two for `r=4`. An induction needs those strips as well as control of the signed term.

I also checked the ULC-surplus direction. Write `M_k(V)=V[k]C[k]-V[k+1]C[k-1]` and `d=(k+1)(h-k+1)`. The stated main-product bound is `M_k(U)>=((h+1)/d)U[k]C[k]`. Since `W=U+NE`, linearity gives `M_k(W)=M_k(U)+N M_k(E)`. Therefore the displayed sufficient condition `(h+1)U[k]C[k]+d N M_k(E)>=0` implies `M_k(W)>=0`: multiplication by `d` preserves order because `k+1>0` and `h-k+1>0` on the guarded band (`h>=N`, `k<=(N+2)/2`). This remains valid when `M_k(E)<0`; a negative `M_k(E)` is a deficit to absorb, not a term whose sign can be ignored. If an inequality is multiplied or divided by a negative quantity such as `-N` for `N>0`, its direction reverses. The T1 report correctly treats the surplus as a sufficient condition, not as already proved.

## Exact checks and obstruction controls

The producer's copied recurrence script was run only after copying it into this scratch. It reproduced its stated five profiles, 19 additions, and 32 guarded ranks. Separately, `independent_guard_audit.py` reconstructs monomial coefficient lists directly from binomial expansions, sums each original tip with multiplicity `r_i`, and checks rank 1, a middle rank where distinct, and the guard boundary on eight profiles (21 exact integer rank checks). All sampled weighted minors and ULC sufficient margins are nonnegative. This is bounded evidence only.

The independent check also reproduces the important distinction in the neutral handoff: for all-arity-3, `m=22`, `N=66`, `k=27` (inside guard `k<=34`), `M_k(E)=-518620474811633289768751398606375936`, while `M_k(W)=51309658488638313875592489085548619091328>0`. Thus the E-only negative control refutes an assumption that the E minor is always nonnegative, not the weighted target. For counts `(38,0,1)`, `N=80`, graph order `n=3+39+80=122`; `k=77` is outside the target guard `k<=41`. It cannot refute this guarded claim. The observed positive `M_k(W)` there is not offered as a test of the separate all-rank control mentioned in the handoff.

No broad profile census was needed for this critique. The exact C5 common-dispatch manifest has 237 members and every listed byte hash matched; all four packet-listed case-source hashes matched. The replayable result is `dispatch_hash_audit.json`. No polynomial was read in the `L` basis as though it were in the `z` basis: the independent implementation explicitly uses `[binom(r,j)+1_{j=1}]` for `B_r` and `E[k]=binom(N,k-1)`.

## Conclusion and limits

The T1 recurrence is a valid identity and its derivation explicitly exposes the signed term and guard-strip obligation. The ULC surplus is a correctly directed sufficient reduction with positive denominator, but no universal estimate for it is established here. Finite successes, including the boundary checks above, do not prove the registered comparison. No actual first-descent selector, payment, stronger MASS, or graph-level conclusion follows from this critique. The exact universal weighted comparison remains OPEN.

Replay the independent checks from this scratch directory with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_guard_audit.py > independent_guard_audit.json
```
