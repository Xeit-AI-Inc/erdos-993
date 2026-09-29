# C6-TAIL-INFORMAL repair note

The original audit remains unchanged at SHA-256 `279fb17365b5935e41a9cca1261ae36c886b6cd2a0bd4959bf62a6e1432895f7`. This note accompanies the complete corrected `INFORMAL-AUDIT.md`. All 18 members of `C6-TAIL-INFORMAL-REPAIR1-INPUTS.json` matched their declared SHA-256 hashes.

## Exact error and correction

The original Exact deficit payment paragraph claimed that

`1-3(N+1-k)/(2(N+2-k)) > -1/2`

is equivalent to `2k<N+3`. That algebraic equivalence is false. Set `D=N+2-k`. Direct simplification gives

`1-3(N+1-k)/(2(N+2-k)) = -1/2+3/(2D)`.

The strict bound is therefore true whenever `D>0`. For example, `N=10, k=7` gives `D=5` and a lower bound of `-1/5>-1/2`, while `2k<N+3` is false. This example is outside the theorem guard and serves only to disprove the claimed equivalence.

On the exact theorem guard, `N>=200` and `1<=k<=floor((N+2)/2)`, so `D>=(N+2)/2>0`, `k<=N`, and all binomial and coefficient denominators used in this step are positive. The coefficientwise operator bound gives `C[k]/C[k-1]>=2D/(3k)>0`. With `e=binom(N,k-1)>0` and `b=binom(N,k)/e=(N+1-k)/k>0`, reciprocation yields

`M/(e C[k]) = 1-b C[k-1]/C[k] >= -1/2+3/(2D) > -1/2`.

The guard also gives `lambda>1/(k+1)>=2/(N+4)` and `b>=N/(N+2)`. The Jensen and Taylor estimate gives `U_i[k]>e b(m+2)`, so

`lambda U_i[k]/e > 2N(m+2)/((N+4)(N+2)) > 1/2`.

The last strict inequality follows because `N<=4m` and `4N(m+2)-(N+4)(N+2)>=2N-8>0`. Adding the two strict half bounds and multiplying by the positive `e C[k](k+1)(h-k+1)` gives exactly the contract's strict surplus. This multiplication uses real `h-k+1`, which is positive because `h>=N+1`.

## Other corrections and review result

- The original input paragraph said 17 files. The repair manifest has 18 members, including the original audit; the corrected audit gives the right count and manifest name.
- The corrected audit states the final positive multiplication as an identity and records a fresh exact integer check of every guarded rank in five representative profiles. The checks corroborate the universal argument; they are not a substitute for it.
- I rechecked the low-band support crossings and binomial log concavity, the literal Jensen blocks and exponent, both parity midpoint bounds, the Taylor inequalities, the ratio operator, all positivity conditions, and the final payment. I found no other mistaken derivation in the original audit that undermines the exact theorem. `C6-SYNTHESIS.md` repeats the same false equivalence in its prose; no source was edited.

**Verdict: passed as an independent informal audit.** No theorem hypothesis, conclusion, binding frontmatter field, claim text, or scope changed. This repair does not claim a new Lean verification or a formalization fidelity award.
