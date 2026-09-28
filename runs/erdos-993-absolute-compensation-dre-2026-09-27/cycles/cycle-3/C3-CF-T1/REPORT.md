# C3-CF-T1 — adversarial review of the m≥120 branchwise MASS route

## Findings and dispositions

I found no counterexample or gap in C3-T1's analytic argument on `m≥120`. It proves the strict branchwise estimate

`2 T_i[j] > 3 delta D_j`

for every represented branch and every actual eligible lower-half rank in that range. This is a restricted informal proof, dependent on the accepted coefficient-only strict-descent rank lemma `5x≥2N` and on the shared fixed-size occupancy/Jensen identity. It is not a formal verification.

For the selected MASS consequence, let `w=Σ_i r_i e_i` be the selected branch-tip weight. If `w≥2`, the local estimate gives `A>(3/2)w delta D_j ≥ (w+e0)delta D_j=b delta D_j`; if no tag is selected, both sides are zero. Thus MASS holds for `m≥120` except the endpoint-only case. The current accepted lower-half full-selection composition (common handoff and registered selector claim) excludes endpoint-only selection, so **in combination with that source-dependent selector result** this yields the restricted `m≥120` MASS and exact-ratio payment. It does not give a census-free selector proof. The all-m branchwise claim, all-m MASS and all-m exact-ratio payment remain unresolved here, including every profile with `m<120`.

The full-selector premise is the precise accepted claim `E993-PATH-STAR-ARITY-2-4-ALL-M-LOWER-HALF-FULL-SELECTION`, at its source-dependent complete-finite-census plus informal-analytic-tail grade. No aggregate-sign statement is used. MASS implies exact-ratio payment because `0<t=C[j+1]/C[j]<1`, `delta≥1`, and `delta(1-t+t/delta)=delta(1-t)+t≥1`.

## Audit of the universal `m≥120` proof

All coefficients remain zero-extended and `x` is the actual first strict descent, including the terminal difference. The accepted coefficient-only rank lemma gives `5x≥2N`, hence `5x>2N-1`. From `x+2≤p`, `j=p-2≥x`; from `2p≤alpha=N+2`, `2j≤N-2`. For a branch of arity `r`, every GF shift `s=0,…,r-1` has `k=j-s`. The sufficient lower bound `k≥M/3`, `M=N-r`, follows from `N≥10r-12`; this is checked by arity (thresholds 8, 18, 28 for `r=2,3,4`) and holds since `N≥2m≥240`. Also `k≤j≤(N-2)/2≤M/2+1` and `M≥236`. Thus all occupancy estimates are used in their stated band.

For the other `m-1` blocks, `H_i=∏_{h≠i}((1+z)^{r_h}+z)`. Under a uniform `k`-subset of the `M` labeled elements, a singleton block of size `a` contributes the multiplicative weight `1+1/a`; other blocks contribute one. Therefore

`H_i[k]/binom(M,k) = E ∏_h (1+X_h/r_h) ≥ exp(Σ_h Pr(X_h=1) log(1+1/r_h))`.

Here `Pr(X_h=1)=p_a=a binom(M-a,k-1)/binom(M,k)`, and `log(1+1/a)≥2/(2a+1)`. On `M/3≤k≤M/2+1`, the three uniform bounds are `p_2≥1/8`, `p_3≥7/40`, and `p_4≥9/40`, so each block contributes at least `1/20` to the exponent. For `a=2`, `p_2=2k(M-k)/(M(M-1))` is concave in `k`; its endpoint values are `4M/(9(M-1))` and `(M²-4)/(2M(M-1))`, both above `1/8`. For `a=3`, factor `p_3=3(k/M)((M-k)/(M-1))((M-k-1)/(M-2))`; the last two factors are at least `(M-2)/(2(M-1))` and `(M-4)/(2(M-2))`, giving `p_3≥(M-4)/(4(M-1))≥7/40`. For `a=4`, the exact consecutive ratio and the real logarithmic derivative are nonpositive on the band, reducing to the upper endpoint. At `M≥44`, its value is at least `9/40`, since the cleared polynomial is `(M-44)^3+88(M-44)^2+1949(M-44)+1052≥0`. Hence `H_i[k]≥exp((m-1)/20)binom(M,k)` for every required shift. This also checks the complete cofactor convolution, not a single central coefficient.

Because `F_r` contains `L^(r-2)`, nonnegative convolution gives

`T_i[j] ≥ exp((m-1)/20) [z^j](G L^(N-2))`.

The coefficient ratio to `B=binom(N,j)` is `1-j(j-1)/(N(N-1))≥3/4` from `2j≤N-2`. The exact debt ratio is

`delta D_j/B = (N+1-j)(N-2j-1)/(j+1) < 3(N-3)/10 < 6m/5`.

For the first strict inequality, clearing positive denominators gives `f(j)>0`, where `f(j)=-20j²+(33N+1)j-10N²+3N+1`; it is concave, vanishes at `(2N-1)/5`, and is positive at `(N-2)/2` (value `(3N²-19N-40)/2`). The actual rank band places `j` strictly between these endpoints. Finally, with `a=119/20`, `t=(m-120)/20≥0`, nonnegative expansion gives `E_8(a+t)≥E_8(a)+tE_7(a)`. Exact fractions give `E_8(a)>288` and `E_7(a)>48`, so `exp((m-1)/20)≥E_8((m-1)/20)>12m/5`. Combining yields `T_i[j]/B>(3/4)(12m/5)=9m/5>(3/2)delta D_j/B`.

No strict flag was weakened: the conditional selected-mass step uses the exact current-`p` flags and original multiplicities. With at least one selected branch, `w≥2` and `(3/2)w≥w+1≥w+e0`; with no selected branch, the only unpaid nonempty case is endpoint-only, which requires the separate accepted selector composition above.

## Independent evidence and replay

The packet's four source hashes match. Actual member bytes were checked against all 86 entries in `manifests/C3-COMMON-DISPATCH.json`, all three entries in each of `manifests/C3-TRANSPORT-CLARIFICATION.json` and `manifests/C3-CRITIQUE-TRANSPORT.json`; there were no mismatches. The two clarifications authorize reading the common neutral sources and require this shared-instrument audit; they do not dictate a mathematical disposition.

The producer audit script was copied into this scratch before execution. Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 audit_m120.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_checks.py
```

The copied producer script independently reran exact Taylor checks, 64,095 singleton-probability rows for `44≤M≤500`, 198,780 debt-ratio rows for `28≤N≤2000`, and literal polynomial/first-descent probes on five `m=120` profiles. The all-arity-2 profile has no actual eligible ranks; the other four generated 2,400 branch rows and all passed. My separate exact-rational checker reproduced the constants and bounded inequality checks, reporting minimum probability margin `263/3490740`. These are bounded corroboration only; the universal conclusion comes from the inequalities above.

The known empty/singleton center-layer payment failure at homogeneous arity 4, `m=172`, is outside this route: this proof retains the full `H_i` convolution and does not infer payment from that truncation. The known spread and selector-threshold obstructions are likewise not used. No census expansion, Lean build, source edit, installation, or background process was used.
