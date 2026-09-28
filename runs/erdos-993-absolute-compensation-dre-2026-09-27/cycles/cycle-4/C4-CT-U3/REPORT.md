# C4-CT-U3 independent critique

## Scope and integrity

Reviewed the sealed protocol, contract, status clarification, neutral handoff, allocation, registered identities, common neutral cycle-4 shifted-ratio sources and predecessor structural/main-mark sources, plus only the C4-U3 packet inputs. All 174 common-manifest members and all four packet files matched their declared SHA-256 hashes (zero mismatches). The producer script was copied here before execution. No sibling case, private proposal, Lean build, source modification, or controller operation was used.

The two universal guarded LR claims are auxiliary coefficient comparisons, not the exact-ratio payment. The known profile `(a2,a3,a4)=(38,0,1)`, `N=80`, first strict descent `x=41`, `k=77` has individual shifted margin `-49,239,834,336`, but `2k<=N+2` is false. It refutes only the unguarded comparison and is not a guarded or actual-eligible counterexample.

## Dispositions and independent checks

**Individual shifted-C LR — open; retain the exact guarded claim.** For every nonempty profile and every original deletion polynomial `Av` (`A0` or an `Ai`), the proposed inequality is `Av[k+1] C[k-1] <= Av[k] C[k]` for `1<=k` and `2k<=N+2`, with integer zero extension. The copied producer replay and an independent integer-multiplication replay both found no negative margins over 1,329 profiles through 18 branches: 406,977 individual comparisons. This is bounded evidence only. My separate tree-DP check for profile `(2,3,4)` verified the parent formula and each endpoint/tip deletion formula against the literal tree.

**Weighted tip-deck LR — open; retain original multiplicities.** With `W=sum_i r_i Ai`, the exact candidate is `W[k+1] C[k-1] <= W[k] C[k]` under the same guards. Independent replay found no negative margin in 27,954 weighted comparisons over those profiles. The rank-77 unguarded refutation above does not bear on this guarded statement. No universal proof or guarded counterexample was established.

**Weighted LR implies a strict selected tip — retain as an informal conditional proof at the stated scope.** Let `p` satisfy the actual guards `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`, where `x` is the actual least strict descent of `P`; assume `Delta_x C<0`, positive interval support and log-concavity of `C`, and the weighted LR inequality at this same `p`. Since `C` is log-concave, its adjacent ratios are nonincreasing. Thus

`C[p]/C[p-1] <= C[x+1]/C[x] < 1`.

All divisions below preserve order: `W[p]>0`, `C[p-1]>0`, and `C[p]>0` in this guarded domain. Dividing `W[p+1]C[p-1] <= W[p]C[p]` by the positive `W[p]C[p-1]` gives

`W[p+1]/W[p] <= C[p]/C[p-1] < 1`,

so `Delta_p W<0`. But `Delta_p W=sum_i r_i Delta_p Ai`; every `r_i` is a positive original tip multiplicity. If every branch had `Delta_p Ai>=0`, this sum would be nonnegative, a contradiction. Hence some current-`p` strict tip selector is one. The argument does not require endpoint selection, does not imply all branches are selected, and does not prove the assumed weighted LR inequality or any payment claim.

For a concrete exact interior check, at `(a2,a3,a4)=(0,22,0)`, `N=66`, `alpha=68`, the actual first strict descent is `x=32`, and `p=34` satisfies all three guards. Here `Delta_x C=-2,430,733,093,207,932,707`; the weighted LR margin is `232296700581653155847056681562532686593824`; `W[p]`, `C[p-1]`, and `C[p]` are all positive; and `Delta_p W=-1,487,457,400,844,219,699,268` with all 22 branch slopes strictly negative. At boundary/interior ranks `k=1,17,34` for this profile, the minimum individual margins are respectively `4,184`, `533526956487772820390719995323142`, and `3519646978509896300712980023674737675664`; weighted margins are respectively `276,144`, `35212779128193006145787519691327372`, and `232296700581653155847056681562532686593824`. These are sign/direction checks, not universal evidence.

## Replay and limits

From this directory run:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 C4-U3-shifted_audit-copy.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_critique.py
```

The independent evidence is `cycles/cycle-4/C4-CT-U3/independent_critique.json`; the replay code is `cycles/cycle-4/C4-CT-U3/independent_critique.py`. The first command reproduces the worker's bounded counts in the copied script and output file. These finite scans establish neither universal LR predicate. The conditional bridge relies on the actual first-descent ratio fact and the weighted LR premise; it establishes neither selected MASS nor the exact-ratio payment, aggregate, or primary universal claim. No formal verification was attempted and no authoritative status is asserted.
