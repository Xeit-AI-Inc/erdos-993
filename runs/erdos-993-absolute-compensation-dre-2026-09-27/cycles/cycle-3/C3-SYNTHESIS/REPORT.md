# C3-SYNTHESIS neutral review (proposed, nonauthoritative)

## Scope and independent checks

I read the three sealed adjudications C3-AT, C3-AF, C3-AU, the neutral shared sources, and the 54 packet-listed additional files; no raw search or critique cases were inspected. Actual SHA-256 bytes match all 86 common-dispatch members, all three members of each transport clarification, and all 54 packet files (`audit.json`). The registered identity snapshot still marks the primary, all-m MASS, branchwise three-halves bound, exponent balancing, and profile-sensitive rank OPEN at dispatch. This report proposes evidence-grade dispositions only.

The ordinary tree has path 0–1–2 and `m>=1` distinct centers at 0, each with `r_i∈{2,3,4}` private tips. Set `N=Σr_i`, `q=N+1`, `α=N+2`, `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `F_r=Σ_{h=0}^{r-2}L^h`, `Q=∏B_{r_i}`, `H_i=∏_{h≠i}B_{r_h}`, `C=GQ`, `T_i=GF_{r_i}H_i`, and `P=C+zL^q`. All coefficients and forward differences are integer zero-extended. `x` is the **least** `k` with `Δ_kP<0`, including the terminal difference. An actual eligible natural `p` satisfies all three guards `x+2≤p`, `3p<2α+1`, `2p≤α`. Put `j=p-2`, `δ=q-j`, `D_j=binom(N,j+1)-binom(N,j)>0`. At this same `p`, `e0=1[Δ_p(LQ+zL^N)<0]`, `ei=1[Δ_p(GB_{r_i-1}H_i+zL^N)<0]`, `b=e0+Σr_i ei`, and `A=Σr_i ei T_i[j]`. There is one original endpoint tag and `r_i` distinct original tip tags per branch; empty selection is included. None of these flags is recomputed after deletion.

I inspected the neutral scalar and prefix algorithms, their loop endpoints, binomial normalization, zero extension, floor direction, Taylor weights, full `GF_r` rows, and strict selectors. The neutral scalar instrument tests every feasible `70≤m≤119`, `2m≤N≤4m`, `r∈{2,3,4}`, `2(m-1)≤M=N-r≤4(m-1)`, `5j>2N-1`, `2j≤N-2`; its `s` loop includes all shifts of `GF_2=(1,2)`, `GF_3=(2,5,2)`, `GF_4=(3,9,7,2)`. My independent domain enumeration gives **799,895** states, zero excluded shifts, minimum `3(j-s)-M=24`. A copied, separately written direct-binomial evaluator passed every strict exact rational comparison and reproduced all 50 counts, minima and minimizers, including ratio `112684538106937462073347997540188623037695726373663717/81619490325542400000000000000000000000000000000000000>1` at `(m,N,r,j)=(70,278,2,112)`. This is an exhaustive **finite scalar certificate**, conditional on its analytic coefficient bridge; it is not a tree or selector census.

The independent prefix replay gives 59,639 profiles, 68,129 actual eligible rows and 196,623 represented-branch local tests through `m=69`, with no local failures. A second complete evaluator gives zero nonfull-selection rows and zero selected MASS/payment failures on the same rows. The neutral prefix's count-triple loops enumerate every profile with `1≤m≤69`; it reconstructs the least strict descent from `P`, all three guards, deletions at current `p`, full cofactors and original multiplicities. The finite output does not extrapolate beyond 69. My separate direct polynomial reconstruction checks six boundary rows in `audit.json`.

## Universal mathematics and composition

**Occupancy bridge.** For disjoint positive blocks of sizes `s_l` and total `M`, let `S` be a uniform `k`-subset, `0≤k≤M`, and `X_l=1[|S∩V_l|=1]`. Expanding a product over marked block sets counts each marked set `I` in exactly `(∏_{l∈I}s_l)binom(M-Σ_{l∈I}s_l,k-|I|)` ways. Cancellation proves

`H[k]/binom(M,k)=E∏_l(1+X_l/s_l)` for `H=∏_l(L^{s_l}+z)`.

Finite AM–GM/Jensen and `log(1+1/s)≥2/(2s+1)` therefore give `H[k]≥binom(M,k) E_d(y_k)`, where `E_d(y)=Σ_{h=0}^d y^h/h!` and `y_k=Σ_l (2s_l/(2s_l+1))binom(M-s_l,k-1)/binom(M,k)`. The binomial denominator is used only in range; outside, the coefficient floor is zero. Convolution with the entire nonnegative `GF_r` row transfers the floor to `T_i[j]`. At `k=M`, singleton probabilities vanish for sizes 2–4; the more general claim for arbitrary positive block sizes would be false for size one, but the occupancy theorem itself remains valid.

**Exponent balancing.** For `M≥10`, `M/3≤k<M`, write `g_r=(2r/(2r+1))binom(M-r,k-1)/binom(M,k)`, `h=M-k-1`, `v=3k-M`, `d=M-10`. Exact factorial cancellation gives

`g_2-2g_3+g_4 = 4k(M-k)f/[315M(M-1)(M-2)(M-3)]`, with

`9f=37d²+290d+217+v(125M-585)+70v²>0`.

At `k=M` all three `g_r` vanish. Replacing a `(2,4)` pair by `(3,3)` thus lowers only the Jensen exponent at fixed block count and `M`, yielding the two adjacent-arity formulas in the registered claim. The original F1/critic proof used `uv≤u²` in the wrong direction for a positive `uv` coefficient; the displayed exact polynomial repairs it. My rational check over `10≤M<180` is corroboration, not the universal proof. Balancing does **not** order actual cofactor coefficients, parent modes, strict flags or payment.

**Branchwise bound.** The already governed coefficient rank theorem `2N≤5x` gives `5j>2N-1` at an actual eligible row; `2p≤α` gives `2j≤N-2`. For `m≥70`, all `GF_r` shifts `k=j-s` have `0≤k≤M=N-r`, `3k≥M`: integer strictness gives `5j≥2N`, so `3k≥6N/5-3(r-1)≥N-r` whenever `N≥10r-15`; here `N≥140`. This closes the shift guard for **each** arity and every shift. The exact 70–119 scalar certificate, occupancy floor and exponent balancing then give `2T_i[j]>3δD_j` for every represented branch. The complete direct prefix gives the same strict inequality for `m≤69`.

For `m≥120`, `M≥236` and `M/3≤k≤M/2+1`. The lower guard follows arity by arity from the stronger sufficient thresholds `N≥10r-12` (`8,18,28` for `r=2,3,4`), and the upper guard follows from `2j≤N-2`. The singleton probability `p_a=a binom(M-a,k-1)/binom(M,k)` satisfies `2p_a/(2a+1)≥1/20` for each `a=2,3,4`: direct product bounds handle 2 and 3; for 4, the real extension decreases on this band and its upper-endpoint bound is equivalent to `(M-44)^3+88(M-44)^2+1949(M-44)+1052≥0`. Thus every cofactor exponent is at least `(m-1)/20`. The full convolution and `F_r≥L^{r-2}` coefficientwise give

`T_i[j]≥exp((m-1)/20)[z^j]GL^{N-2}≥(3/4)exp((m-1)/20)binom(N,j)`.

The last ratio is exactly `1-j(j-1)/(N(N-1))≥3/4`. On the rank band, `δD_j/binom(N,j)<3(N-3)/10≤6m/5`. Exact rational checks give `E_8(119/20)>288` and `E_7(119/20)>48`; positive binomial expansion yields `E_8((m-1)/20)>12m/5` for every integer `m≥120`. Hence `2T_i[j]>3δD_j` there too. This is an informal all-parameter proof with exhaustive finite certificates in the two lower intervals, not a Lean theorem.

**Selection and payment.** The previously registered all-m lower-half full-selection result has its own complete finite/analytic source composition: selectors on `1..80`, overlapping `42..265`, then analytic `266+`. The cited selector clauses precede and do not depend on the known aggregate-sign conclusion. At every actual eligible row they give `e0=ei=1`, `b=N+1`. The branchwise bound gives `A>(3/2)NδD_j≥(N+1)δD_j=bδD_j` because `N≥2`. More generally, if selected branch weight `w=Σr_i ei≥2`, the same bound pays `w+e0`; if `b=0`, both sides vanish. Only endpoint-only selection would be unpaid without the separate selector theorem.

The accepted first-descent/ordinary-log-concavity argument gives `C[j]>0`, `0<t=C[j+1]/C[j]<1`, `δ>1`; the exact factor is `κ=1-t+t/δ`, so `δκ=δ-(δ-1)t>1`. MASS implies `κA≥bD_j`, exactly the primary cross-multiplied payment. The formally verified relative main-mark margin then bounds the selected aggregate, but **the known aggregate sign is not a premise** anywhere in this payment chain. Under `STATUS-GRADE-CLARIFICATION.md`, I propose the branchwise, selected MASS and primary predicates as verified at source-dependent computer-assisted/informal grade. The unchanged governed Lean criterion for a decisive positive stop is unmet; no formal or graph-generic award is claimed.

## Exact controls, disagreements and remaining obligations

The selector identity `LB_r-GB_{r-1}=z³F_r` gives `A0-Ai=z³F_{r_i}H_i` and `ei=1 ⇔ Δ_{p-3}(F_{r_i}H_i)>Δ_pA0`. Equality leaves a branch unselected. At `(a2,a3,a4)=(0,12,10)`, `m=22,n=101,N=76,α=78,x=37,p=39,j=37,δ=40`, all guards and all 77 original-tag flags hold, yet the arity-3 and arity-4 cofactor slopes are respectively `-895239471360525542716` and `-1240837532571249046896`. `Δ_pA0=-11319302108154726892710`, `C[j]=157478041951335331301454`, `C[j+1]=156199033032808625559120`, `D_j=176733862787006701400`, `T_3[j]=52490861809690993350452`, `T_4[j]=64566367527362107996110`, `b=77`, `A=4472325726243360080460672`, and the signed payment margin is `841657089276596927110510442162384388444656818560>0`. Thus the nonnegative-cofactor-slope shortcut is refuted, while the exact threshold and payment survive. A census-free proof of the already established literal selector predicate is still a useful *method* obligation.

The alternate differential rank claim is also supported independently: for `D_d(f)=(5+4z)f'-4df` and `h=2a2/3+a3/2`, the local nonnegative rows `D_1(G)=6`, `D_2(B2)+(2/3)B2=23/3+(2/3)z²`, `D_3(B3)+(1/2)B3=17/2+(9/2)z²+(1/2)z³`, and `D_4(B4)=9+12z²+4z³` prove `D_q(P)+hP≥0` coefficientwise. At any strict descent `k`, including terminal, this implies `9k+1-4N+h>0`, equivalently `54k≥24N-4a2-3a3-5`. The fixed-`(m,N)` maximum of `h=(4m-N)/2-a2/3`, using `a2≥max(0,3m-N)`, gives the registered count-relaxed corollary. This new rank lemma is optional for the current mass proof; the governed `2N≤5x` lemma suffices. U1's separate operator identity survives, but its proposed nonnegative cone fails at two arity-4 branches on a **rising** rank; that does not refute the strict-descent theorem.

The center-layer expansion is exact and nonnegative, but U3's numerical evaluator used `F_4=(1,1,1)` instead of `(3,3,1)`. With correct `GF_4=(3,9,7,2)`, at all-4 `m=40,n=203,N=160,α=162,x=78,p=80,j=78,δ=83`, all guards and all 161 strict original-tag flags hold, `D_j=3325930472040984210531608420501465726832040800`, `T_i[j]=1276384236266955407404589199530667958725386358334`, `U_i^(2)[j]=775440571492371572584463489650444160238649555370`, and `2U_i^(2)[j]-3δD_j=722724455446538076746556482596023354496120951540>0`. The reported depth-2 failure there is false; depth 1 also passes. At all-4 `m=172,n=863,N=688,α=690,x=334,p=336,j=334,δ=355`, all 689 tags are strict, the empty/singleton (`d=1`) exact-ratio payment margin is negative, while full MASS/payment are positive (`audit.json`). This refutes the truncation shortcut only. The previously false factor `1-t+1/δ` is excluded.

The complete dependency DAG for the proposed nonformal result is: governed coefficient descent rank + exact profile definitions → shifted rank band; occupancy/Jensen + repaired exponent balancing + exact 70–119 scalar certificate → middle local bound; complete 1–69 profile certificate → small local bound; occupancy/Jensen + per-arity shift guards + rational tail constants → 120+ local bound; the three intervals → all-m branchwise bound; independently registered selector composition + original tag multiplicities → selected MASS; accepted `0<t<1` ratio lemma → exact-ratio payment. No edge uses the known aggregate sign. The profile-sensitive rank and center-layer identity are auxiliary, not hidden dependencies.

Two central formal candidates remain: (1) the **branchwise local theorem** at actual eligible rows, with formal finite certificates for 1–69 and 70–119 and formal occupancy/balancing/tail bridges as its closed prerequisites; (2) the **exact primary payment**, with (1), a formal all-m selector theorem (or formal endpoint-only exclusion), formal graph-to-polynomial/original-tag bridge, and formal `0<t<1`/MASS-to-payment algebra as closed prerequisites. The accepted relative margin is already formal but is downstream of payment, not a substitute. A census-free replacement for either finite dependency would be useful but is not required to state the current evidence grade. No Lean build was run.

## Replay from eventual `cycles/cycle-3/C3-SYNTHESIS/`

The two prefix scripts and scalar evaluator were copied into this case before execution from separately written sealed adjudicator/critic code. `audit.py` is my own reconstruction. Run with bytecode disabled:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 audit.py
PYTHONDONTWRITEBYTECODE=1 python3 scalar_independent_replay.py > scalar_independent_replay.json
PYTHONDONTWRITEBYTECODE=1 python3 prefix_independent_replay.py > prefix_independent_replay.log
PYTHONDONTWRITEBYTECODE=1 python3 full_prefix_replay.py > full_prefix_replay.log
```

The last two scripts write `AF_prefix_local_evidence.json` and `C3-AT-independent-prefix.json` respectively in this case. All finite certificates are exact integer/rational computations. No background process remains at completion.
