# C2-SYNTHESIS: independent neutral synthesis

## Scope and evidence integrity

The target is the registered exact-ratio selected payment on ordinary path-stars with `m>=1` distinct branches of arities `r_i in {2,3,4}`. Set `N=sum r_i`, `q=N+1`, `alpha=N+2`, `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `F_r=sum_(h=0)^(r-2)L^h`, `Q=prod B_ri`, `H_i=prod_(h!=i)B_rh`, `C=GQ`, `T_i=GF_ri H_i`, `P=C+zL^q`. Coefficients and forward differences are integer zero-extended. `x` is the *least* natural strict descent of `P`, including its terminal difference. Every eligible natural `p` obeys `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`; put `j=p-2`, `delta=q-j`, and `D_j=binom(N,j+1)-binom(N,j)`. At this actual `p`, `e0=1[Delta_p(LQ+zL^N)<0]` and `ei=1[Delta_p(GB_(ri-1)H_i+zL^N)<0]`. Original tags retain multiplicities `1,r_i`: `b=e0+sum r_i ei`, `A=sum r_i ei T_i[j]`. Empty selection is included. The signed target is `M=(delta C[j]-(delta-1)C[j+1])A-b delta D_j C[j]`.

I verified the bytes of all 12 packet-listed adjudication files against the packet SHA-256 entries and all 55 common-dispatch members against `manifests/C2-COMMON-DISPATCH.json`; every comparison passed. I read only the three sealed adjudications and neutral sources, not raw search/critique cases. `independent_check.py` separately constructs exact polynomials for five controls, checks all three eligibility guards, actual strict deletion flags, original tag weights, first zero-extended descent, the occupancy identity on a `(2,3,4)` block family, and finite rational cutoff constants. Replay from `cycles/cycle-2/C2-SYNTHESIS/`:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_check.py
```

Its exact data are `cycles/cycle-2/C2-SYNTHESIS/independent_evidence.json`. This is bounded arithmetic; no Lean build or formal award was attempted.

## Universal mathematics retained or corrected

For disjoint blocks `V_l` of positive sizes `s_l`, total `M`, and a uniform `k`-subset `S` (`0<=k<=M`), put `X_l=1[|S intersect V_l|=1]`. Expanding over marked block sets `I` gives

`H[k]/binom(M,k)=E prod_l(1+X_l/s_l)`, where `H=prod_l(L^s_l+z)`, because `Pr(X_l=1 for all l in I)=prod_(l in I)s_l * binom(M-sum_(l in I)s_l,k-|I|)/binom(M,k)`. This is joint fixed-size counting, with no independence assumption. Finite Jensen or AM-GM gives the exact rational-power inequality. With `y=sum_l (2s_l/(2s_l+1))*binom(M-s_l,k-1)/binom(M,k)`, `log(1+1/s)>=2/(2s+1)` and the nonnegative Taylor terms give `H[k]>=binom(M,k) E_d(y)`, `E_d(y)=sum_(a=0)^d y^a/a!`. The scaled floor `binom(M,k) E_4(y/256)^256` is valid too, since `E_4(y/256)<=exp(y/256)`. These inequalities zero-extend outside `0..M`; the AM-GM power assertion uses `binom(M,k)>0` and thus stays in range. The additive floor `H[k]>=binom(M,k)+sum_l binom(M-s_l,k-1)` follows directly from `prod(1+X_l/s_l)>=1+sum X_l/s_l`.

The correct coefficient bridge is `T_i[j]=sum_(epsilon=0)^1 g_epsilon sum_(h=0)^(r_i-2) f_(ri,h) H_i[j-epsilon-h]`, with `g=(1,2)` and `f_(r,h)=sum_(a=h)^(r-2)binom(a,h)`. Thus `GF_2=(1,2)`, `GF_3=(2,5,2)`, `GF_4=(3,9,7,2)`. An F3 auxiliary display omitted these `F_r` weights; the coefficient bound survives with this repair. The full center-choice expansion `Q[k]=sum_J binom(M-sum_(i in J)r_i,k-|J|)` is another direct product expansion. None of these coefficient bounds contains selector information.

The selector identity is exact: `A0-Ai=z^3 F_ri H_i`. With `u=Delta_p A0` and `d_i=Delta_(p-3)(F_ri H_i)`, `e0=1 iff u<0`, while `ei=1 iff d_i>u`; equality turns the strict flag off. Endpoint-only selection is exactly `u<0` and every represented `d_i<=u`. If it occurs at an eligible row, `A=0,b=1` and `M=-delta D_j C[j]<0` because the contract gives `delta,D_j,C[j]>0`. The finite selector scans do not prove that this case is impossible.

For `G,B_2,B_3,B_4`, direct coefficient inspection gives `3(k+1)f[k+1]>=2(deg(f)-k)f[k]`. The product derivative identity yields `3(j+1)C[j+1]>=2(N+1-j)C[j]`; thus `Delta_j C>=0` whenever `5j<=2N-1`. The shifted binomial term of `P` rises strictly there, so the actual first descent satisfies `5x>2N-1` for every `m>=1`. The eligible guards imply `j>=x` and `2j<=N-2`. Log-concavity of `C` and descent at `x` give `t=C[j+1]/C[j]<=C[x+1]/C[x]<1-v`, where `v=(binom(q,x)-binom(q,x-1))/C[x]`. Hence the **correct** factor is `kappa=1-t+t/delta>v+(1-v)/delta`. The earlier `v+1/delta` lower bound is false; `independent_evidence.json` reproduces an eligible all-arity-3 `m=38` row with `kappa<v+1/delta` and positive full payment. The repaired scalar sufficient test is `(v+(1-v)/delta)sum_(i:ei=1)r_i ell_i[j]>=bD_j` for valid cofactor lower bounds `ell_i[j]<=T_i[j]`, or `b=0`. Its premise remains unproved universally.

The large-`m` local coefficient theorem survives with a corrected singleton probability. For a cofactor with `M=N-r_i` and another block of size `s`, it is `p_s=s(j/M)prod_(a=0)^(s-2)(M-j-a)/(M-1-a)`; the source numerator `M-j-1-a` was too small. For `m>=238` in the rank band `5j>2N-1`, `2j<=N-2`, we have `N>=476`, `j/M>39/100`, and each displayed factor `>48/100`; hence `p_s>17/100` for `s=2,3,4`. Also `binom(M,j)/binom(N,j)>(49/100)^4>1/18`. Jensen therefore gives `H_i[j]/binom(M,j)>exp(17(m-1)/450)`. The exact degree-20 Taylor value at `m=238` exceeds `(162/5)*238`, and `exp(17(m-1)/450)/m` increases thereafter. Since `N<=4m` and `T_i[j]>=H_i[j]`, this proves `T_i[j]>(9/20)N binom(N,j)`. Meanwhile `delta D_j/binom(N,j)=(N+1-j)(N-2j-1)/(j+1)<3(N-3)/10`, using `5j>2N-1`. Thus **every represented branch** satisfies `T_i[j]>3delta D_j/2` on this band. The rational constant and local-factor checks are independently replayed in our script. This is an informal universal proof, not formal verification.

If any branch is selected, `w=sum_i r_i ei>=2`. The local threshold gives `A>(3/2)w delta D_j>=(w+e0)delta D_j=b delta D_j`: strict MASS, hence payment because `kappa>=1/delta` with `0<t<1`. If `w=e0=0`, both targets hold by equality. For `m>=238`, this covers all eligible rows **except** endpoint-only. No branch saturation is needed. The corresponding all-`m` statement and the exact-ratio payment remain OPEN.

## Bounded controls and claim dispositions

All numerical rows named below use actual first descent, all three guards, current-`p` strict flags, zero extension and original tip multiplicities. Exact `n,N,alpha,x,p,j,delta`, selectors, `C[j],C[j+1],D_j,T_i[j],A`, and signed margins for the independently reproduced controls are in `independent_evidence.json`. The all-r4 `m=173` row has `n=868,N=692,alpha=694,x=336,p=338,j=336,delta=357,e0=ei=1,b=693`: its empty-plus-singleton floor has **negative** payment margin while true payment and MASS have **positive** margins. The all-r3 `m=38` row has `n=155,N=114,alpha=116,x=55,p=57,j=55,delta=60,e0=ei=1,b=115`: its false normalization is refuted while full payment is positive. At counts `(0,12,10)`, `x=37,p=39`, both represented cofactor slopes are negative and selected. The pair `(0,10,13)->(1,8,14)` has a decreasing normalized payment quotient at `p=42` despite positive margins. These disprove the respective auxiliary shortcuts only.

The following table is the disposition for **every** required claim ID. `P` means a complete informal argument at the displayed scope, `B` a bounded exact/rational check, and `O` an unmet universal obligation. All dispositions are proposed worker assessments.

| Claim ID | Disposition and grade | Exact finding / dependency |
|---|---|---|
| C2-CF-T2-ENDPOINT-PAYMENT-OBSTRUCTION | retained, P | Eligible endpoint-only implies `M=-delta D_j C[j]<0`; conditional only. |
| C2-CF-T3-NORMALIZATION-COUNTEREXAMPLE | retained, B | Independent all-r3 `m=38` replay refutes `kappa>v+1/delta`, not payment. |
| C2-CT-U2-ALL-INTERACTION-OCCUPANCY-EXPANSION | retained, P | Exact factor expansion for all natural indices, with zero extension. |
| C2-CU-F1-OCCUPANCY-COEFFICIENT-BOUND | retained, P | Scaled degree-four floor follows from occupancy, Jensen and `E_4(y/256)^256<=exp(y)`. |
| C2-CU-F3-PERIODIC-MIXED-EXACT-PILOT | retained narrowed, B | 360 specified profiles, 227 eligible rows, 10,606 true-`T_i` threshold tests; no Jensen-floor test was made. |
| C2-F1-JENSEN-FIRST-RANK-BOUNDED | retained, B | 521 specified profiles, 615 rational branch-type tests at only `p=x+2`; no universal threshold. |
| C2-F1-LOCAL-BOUND-GAP-BOUNDED | retained, B | 747 specified interval profiles, 3,931 eligible rows, no true local-threshold failure. |
| C2-F1-PRIMARY-TARGETED-REPLAY | retained, B | 750 profiles and 3,934 eligible rows including three controls; no negative full payment or MASS. |
| C2-F2-HOMOGENEOUS-EMPTY-SINGLETON-TRUNCATION-OBSTRUCTION | retained, B | Independently reproduced `m=173` floor failure with full payment and MASS positive. |
| C2-F3-FIXED-SIZE-OCCUPANCY-JENSEN-LOWER | retained narrowed, P | Core inequality valid; use corrected `GF_r` convolution weights. |
| C2-F3-HOMOGENEOUS-R4-FIRST-ELIGIBLE-PILOT | retained, B | 51 specified homogeneous profiles, least eligible rank only. |
| C2-F3-LOCAL-JENSEN-PAYMENT-CONDITIONAL | retained narrowed, P | Requires a selected branch and its true local threshold; repaired convolution for estimated threshold. |
| C2-T1-ADVERSARIAL-CONTROLS | retained, B | Named slope, spread and truncation controls only; independent exact spot checks. |
| C2-T1-FIXED-SIZE-OCCUPANCY-JENSEN | retained, P | Joint fixed-size count and finite Jensen, no independence. |
| C2-T1-RATIONAL-COFACTOR-CONVOLUTION-BOUND | retained, P | Occupancy plus log/Taylor bound and nonnegative `GF_r` convolution. |
| C2-T2-ENDPOINT-ONLY-FINITE-EXCLUSION-SCAN | retained, B | Sealed grid through `m=80`: 91,880 profiles, 133,194 eligible rows; no universal selector lemma. |
| C2-T2-NEGATIVE-COFACTOR-SLOPE-SELECTED-CONTROL | retained, B | Independent `(0,12,10),p=39` exact replay. |
| C2-T2-SELECTOR-THRESHOLD-IDENTITY | retained, P | `ei=1 iff d_i>u`, strict equality handled. |
| C2-T3-DESCENT-OCCUPANCY-SCALAR-SUFFICIENT-TEST | retained narrowed, P | Replace false `v+1/delta` factor by `v+(1-v)/delta`; premise open. |
| C2-T3-OCCUPANCY-RATIONAL-SELECTED-COEFFICIENT-BOUND | retained, P | Same valid occupancy/cofactor convolution bound, any finite Taylor degree. |
| C2-T3-UNIVERSAL-FIRST-DESCENT-AND-RATIO-SHARPENING | retained narrowed, P+B | `5x>2N-1` and corrected ratio survive; `m=38` refutes overstated factor. |
| C2-U1-EXACT-TARGETED-OBSTRUCTION-CONTROLS | retained narrowed, B | Eight sealed producer profiles only; our independent replay covers the named controls. |
| C2-U1-FIXED-SUBSET-COFACTOR-BOUND | retained, P | Degree-four occupancy/Jensen floor for every cofactor, including empty. |
| C2-U1-LOCAL-SELECTED-MASS-SUFFICIENCY | retained, P | `w>0` plus every selected `T_i[j]>=3delta D_j/2` implies MASS. |
| C2-U2-DISJOINT-BLOCK-OCCUPANCY-IDENTITY | retained, P | Exact subset-weight count, even for positive sizes outside `{2,3,4}`. |
| C2-U2-ELEMENTARY-FLOOR-PAYS-SELECTED-PAYMENT | rejected, B | At eligible all-r4 `m=173,p=338`, floor payment margin is negative. |
| C2-U2-OCCUPANCY-TO-TI-COEFFICIENT-BRIDGE | retained, P | Additive cofactor floor convolved with nonnegative `GF_r`. |
| C2-U2-RATIONAL-POWER-AMGM-AND-ELEMENTARY-FLOOR | retained, P | Power bound in range; additive floor zero-extends. |
| C2-U3-BRANCH-SELECTION-CONDITIONAL-MASS | retained, P | Repaired local cutoff plus `w>0`, or empty selection; endpoint-only excluded from premise. |
| C2-U3-ENDPOINT-ONLY-EXCLUSION-OPEN | retained open, O | No independent selector-only proof at all actual eligible rows. |
| C2-U3-LOCAL-MASS-CUTOFF-238 | retained narrowed, P | Correct singleton probability; informal `m>=238` local theorem on derived rank band. |
| E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-EXACT-RATIO-PAYMENT | retained open, O | Full registered `M>=0` lacks universal proof or eligible negative full-margin witness. |
| E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-MARK-MASS-COMPENSATION | retained open, O | Stronger all-`m` `A>=b delta D_j` remains distinct and unproved. |

## Exact remaining obligations and formal candidates

The structural route needs (1) an independent theorem excluding `e0=1,w=0` at every actual eligible row, and (2) payment or local mass for the finite parameter prefix `m<=237` at **every** eligible rank and all arity-count profiles, or a different universal argument. The existing selected aggregate is computer-assisted evidence for its own weaker sign and cannot certify these stronger inequalities. Bounded pilots are neither a prefix certificate nor a counterexample. The formally verified relative main-mark margin is a separate theorem and does not close the absolute debt.

Three small formal candidates have closed mathematical dependency DAGs and need no unproved payment premise: (i) disjoint-block occupancy identity -> finite AM-GM/Jensen rational cofactor bound -> corrected `GF_r` convolution; (ii) local factor ratios -> first-descent band -> corrected `kappa>v+(1-v)/delta`; (iii) corrected singleton probability -> rational rank-band estimates -> degree-20 constant -> `m>=238` branchwise local threshold. Formalizing any one is progress, not a primary award. Endpoint-only exclusion and finite-prefix payment are research obligations, not ready formal candidates.
