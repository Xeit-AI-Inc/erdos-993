# C3-AT neutral adjudication (proposed, nonauthoritative)

## Scope and evidence

I reviewed C3-T1/T2/T3 and precisely their six C3-CF/CU cross critiques, the neutral sources in `C3-COMMON-DISPATCH`, and the two transport clarifications. Actual SHA-256 bytes match all 86 common members, all 63 packet members, and all three members of each clarification manifest; see `C3-AT-evidence-audit.json`. Source documents and worker cases were treated as evidence. No aggregate-sign theorem is used to pay MASS or the primary inequality.

Throughout, the tree has path 0–1–2 and distinct branches of arity `r_i∈{2,3,4}`. Write `N=Σr_i`, `q=N+1`, `α=N+2`, `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `F_r=Σ_{h=0}^{r-2}L^h`, `Q=∏B_{r_i}`, `H_i=Q/B_{r_i}`, `C=GQ`, `T_i=GF_{r_i}H_i`, `P=C+zL^q`. All coefficients are integer zero-extended, including terminal differences. `x` is the **least** natural `k` with `Δ_kP=P[k+1]-P[k]<0`. Every row below has a natural `p` satisfying **all** `x+2≤p`, `3p<2α+1`, `2p≤α`; put `j=p-2`, `δ=q-j`, `D_j=binom(N,j+1)-binom(N,j)>0`. At this actual `p`, `e0=1[Δ_p(LQ+zL^N)<0]`, `ei=1[Δ_p(GB_{r_i-1}H_i+zL^N)<0]`, `b=e0+Σr_i ei`, `A=Σr_i ei T_i[j]`. The endpoint is one original tag; branch `i` retains all `r_i` original tip tags. Empty selection remains in scope.

## The dependency chain I accept at a nonformal grade

**Branchwise local bound, all `m`.** The cases below support the registered statement `2T_i[j]≥3δD_j` for every represented branch; the computations and analytic bounds actually give `>` on every nonempty actual eligible row. The finite pieces are exact computer-assisted evidence, while the full-domain conclusion uses the proved bridges and case split. It is **not** a Lean award.

* `1≤m≤69`: I inspected and copied the neutral evaluator, reran it, and wrote a separate evaluator with direct arity-factor powers and direct cofactor reconstruction. Both enumerate every nonzero count triple `a2+a3+a4≤69`, compute `P` and its least strict descent through the terminal difference, impose all three guards, reconstruct deletion polynomials at current `p`, and use actual `GF_2=(1,2)`, `GF_3=(2,5,2)`, `GF_4=(3,9,7,2)`. The 59,639 profiles yield 68,129 eligible rows; there are zero local, MASS, payment, or non-full-selection failures. All 69 layer counts and exact minimum ratios agree with the neutral output. The global local minimum is the exact ratio `2663052002126307638904521189299036/1556037137933531019602894141029375 > 1` at `m=32`, counts `(1,1,30)`, `x=61,p=63`. The exhaustive finite scope is a computation, never an analytic extrapolation.
* `70≤m≤119`: The accepted coefficient-only strict-descent rank theorem gives `2N≤5x`; hence `5j>2N-1`, while the lower-half guard gives `2j≤N-2`. For each branch `r`, `M=N-r`, each `GF_r` shift `0≤s≤r-1`, and `k=j-s`, one has `M≥10` and `3k≥M`: indeed `N≥2m≥140≥10r-12` makes `(2N-1)/5-r+1≥(N-r)/3`. Also `0≤k≤M`. The fixed-size occupancy identity gives `H_i[k]/binom(M,k)=E∏_{h≠i}(1+X_h/r_h)`, where `X_h` marks exactly one selected tip in a block. Finite Jensen and `log(1+1/r)≥2/(2r+1)` give `H_i[k]≥binom(M,k) exp(E_i)`, with `E_i=Σ_{h≠i}g_{r_h}(M,k)`. The balancing proof below gives `E_i≥E_bal(m-1,M,k)`. Downward flooring to thousandths and the positive degree-12 Taylor polynomial preserve a lower bound. The exact relaxed scan checks the full feasible domain `m=70..119`, `2m≤N≤4m`, `r=2,3,4`, `2(m-1)≤M=N-r≤4(m-1)`, `5j>2N-1`, `2j≤N-2`, every `GF_r` shift, and proves the convolved lower bound `2T_i[j]>3δD_j`. My copied producer replay and the copied critic's separately implemented `Fraction`/binomial evaluator agree on all 799,895 states, zero exclusions, all 50 layer minima and minimizers. The smallest exact tested lower-bound ratio is `112684538106937462073347997540188623037695726373663717/81619490325542400000000000000000000000000000000000000>1`, at `(m,N,r,j)=(70,278,2,112)`. This finite check alone is only bounded scalar evidence; its application here uses the occupancy, balancing, rank and convolution proofs.
* `m≥120`: The C3-T1 proof survives both critiques and my algebra audit. With `M=N-r`, every shift satisfies `M/3≤k≤M/2+1`; the lower inequality follows arity by arity from `N≥10r-12` (thresholds 8, 18, 28), and `M≥236`. The singleton probability `p_a=a binom(M-a,k-1)/binom(M,k)` gives `2p_a/(2a+1)≥1/20` for `a=2,3,4`. For `a=2`, concavity of `2k(M-k)/(M(M-1))` reduces to the two band endpoints, both at least `1/8`. For `a=3`, factorization gives `p_3≥(M-4)/(4(M-1))≥7/40`. For `a=4`, the real extension decreases on the band because its logarithmic derivative is at most `1/k-3/(M-k)≤0`; its upper-endpoint bound `p_4≥9/40` is equivalent to `(M-44)^3+88(M-44)^2+1949(M-44)+1052≥0`. Jensen at every shift and the full `GF_r` convolution yield `T_i[j]≥exp((m-1)/20)[z^j]GL^{N-2}`. The quotient of the last coefficient by `binom(N,j)` is `1-j(j-1)/(N(N-1))≥3/4`. The debt quotient is `(N+1-j)(N-2j-1)/(j+1)<3(N-3)/10<6m/5`; clearing denominators gives `f(j)=-20j²+(33N+1)j-10N²+3N+1>0`, a concave quadratic zero at `(2N-1)/5` and equal to `(3N²-19N-40)/2>0` at `(N-2)/2`, exactly the rank band. Finally `E_8(119/20)=48232104261912983/147456000000000>288` and `E_7(119/20)=265545425322997/921600000000>48`; positive binomial expansion gives `exp((m-1)/20)>12m/5` for every `m≥120`. Thus `2T_i[j]>3δD_j`. This is an informal universal proof dependent on the accepted rank lemma and occupancy bridge, not on finite tail sampling.

**Balancing claim.** For `M≥10`, `0≤k≤M`, `3k≥M`, define `g_r=(2r/(2r+1))binom(M-r,k-1)/binom(M,k)`. At `k=M` all vanish. Otherwise, with `u=M-k-1≥0`, `v=3k-M≥0`, cancellation gives

`g2-2g3+g4 = 4k(M-k)f/[315M(M-1)(M-2)(M-3)]`,

`9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v²>0`.

Replacing one size-2 and one size-4 block by two size-3 blocks preserves `m'` and `M` and lowers only `Σa_rg_r`. Iteration gives the two adjacent-arity endpoint formulas in the registered claim. It does **not** order actual cofactor coefficients, parent modes, selector flags, or payment. The false spread-quotient mechanism is not invoked.

**Selected MASS and primary payment.** The already registered `E993-PATH-STAR-ARITY-2-4-ALL-M-LOWER-HALF-FULL-SELECTION` independently supplies `e0=ei=1` at every actual eligible row, at its complete-finite-plus-analytic-tail nonformal grade. Its proof does not use the aggregate sign. Thus `b=N+1` and the local bound gives `A>(3/2)NδD_j≥(N+1)δD_j=bδD_j`, since `N≥2`. This closes the all-`m` selected MASS predicate at a **proposed source-dependent computer-assisted/informal** grade. Ordinary log-concavity of `C` and the increasing binomial summand at the actual `x` give `0<t=C[j+1]/C[j]<1`; hence `δ(1-t+t/δ)=δ-(δ-1)t≥1`. MASS therefore implies the exact cross-multiplied primary payment. This is a proposed nonformal verification under `STATUS-GRADE-CLARIFICATION.md`; it is not the governed formal proof or decisive positive stop required by the original contract. No graph-generic or Erdős993 conclusion follows from this review.

The accepted relative margin is a separate formally verified coefficient theorem. The finite prefix is not called a universal proof by itself, and the scalar scan is not a tree census. The dependency chain is: accepted rank lemma → shifted cofactor band; fixed-size occupancy/Jensen + balancing + exact scalar scan → local bound on 70–119; direct complete profile scan → local bound through 69; analytic inequalities → local bound from 120; accepted selector composition → selected MASS; `0<t<1` → exact-ratio payment. None of these arrows reverses an accepted aggregate sign into a payment premise.

## Selector route and adversarial control

The C3-T2 identity is exact for every represented branch and integer rank: `LB_r-GB_{r-1}=z³F_r`, so `A0-Ai=z³F_{r_i}H_i` and `Δ_pA0-Δ_pAi=Δ_{p-3}(F_{r_i}H_i)=d_i`. Therefore `ei=1 ⇔ d_i>Δ_pA0`, with equality unselected. The proposed C3-T2-S2 is retained only as this conditional threshold reduction. No census-free theorem asserting that some branch crosses the threshold was produced. The literal endpoint-only predicate is already excluded at the accepted nonformal grade through full selection; a structural proof remains a method/formalization obligation.

I independently reconstructed the exact obstruction row `(a2,a3,a4)=(0,12,10)`, `m=22`, `n=101`, `N=76`, `α=78`, actual first descent `x=37`, `p=39`, `j=37`, `δ=40`; the guards read `39≥37+2`, `117<157`, `78≤78`. The endpoint and both represented tip classes are selected, so `e0=e3=e4=1`, `b=77`. Exact data:

| coefficient/difference | value |
|---|---:|
| `Δ_pA0` | `-11319302108154726892710` |
| `Δ_pA3`, `d3` | `-10424062636794201349994`, `-895239471360525542716` |
| `Δ_pA4`, `d4` | `-10078464575583477845814`, `-1240837532571249046896` |
| `C[j]`, `C[j+1]`, `D_j` | `157478041951335331301454`, `156199033032808625559120`, `176733862787006701400` |
| `T_3[j]`, `T_4[j]`, `A` | `52490861809690993350452`, `64566367527362107996110`, `4472325726243360080460672` |
| signed MASS margin `A-bδD_j` | `3927985428859379440148672` |
| signed payment margin | `841657089276596927110510442162384388444656818560` |

Both `d3,d4<0`, so “some cofactor slope is nonnegative” is refuted on an actual eligible selected row. Each still exceeds `Δ_pA0`; the true threshold works. This is neither endpoint-only selection nor a MASS/payment counterexample. The known all-arity-4 `m=172` empty/singleton-layer failure targets a dropped-layer bound, whereas this composition uses the **full** cofactor. The previously false factor `1-t+1/δ` is not used; the exact factor is `1-t+t/δ`.

## Claim dispositions and limits

The exact ten required IDs are covered in `RETURN.json`. `C3-T1-M120-SELECTED-MASS-CONDITIONAL` is retained: the local theorem pays selected branches, empty selection is equality, and endpoint-only needs the separate selector claim. `C3-T2-S1` and `C3-CF-T2-NEGATIVE-SLOPE-SELECTED-ROW` are retained; `C3-T2-S2` is retained narrowly as a conditional equivalence. The balanced scalar replay is retained as exact **bounded** evidence; the balancing theorem is retained as an informal proof at its exponent-only scope. `C3-CF-T3-M70-119-MASS-PAYMENT` is retained with the occupancy and accepted selector dependencies. The all-`m` branchwise, MASS, and exact-ratio claims are proposed retained at the expressly nonformal computer-assisted/informal grade described above. These are adjudicator proposals, not registry edits or authoritative verdicts.

Remaining work for a decisive positive stop is a governed Lean award for the exact primary predicate or an equivalent theorem with the graph and selector bridges discharged. A census-free proof of selection/local mass remains useful to reduce finite dependencies but is not a reason to reopen the literal predicate at its accepted grade. No Lean build was run, and no broad census beyond the frozen prefix was performed.

## Replay (from the eventual admitted `cycles/cycle-3/C3-AT/` directory)

All output artifacts are top-level files. The producer scripts were copied here before execution; each was run with `PYTHONDONTWRITEBYTECODE=1`. Run these commands from the admitted case directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 C3-AT-prefix-producer.py > C3-AT-prefix-producer.log
PYTHONDONTWRITEBYTECODE=1 python3 C3-AT-independent-audit.py > C3-AT-independent-audit.log
PYTHONDONTWRITEBYTECODE=1 python3 C3-AT-scalar-producer.py > C3-AT-scalar-producer.log
PYTHONDONTWRITEBYTECODE=1 python3 C3-AT-scalar-independent-copy.py > C3-AT-scalar-independent-copy.json
PYTHONDONTWRITEBYTECODE=1 python3 C3-AT-selector-audit.py > C3-AT-selector-audit.log
PYTHONDONTWRITEBYTECODE=1 python3 C3-AT-selector-producer.py > C3-AT-selector-producer.json
PYTHONDONTWRITEBYTECODE=1 python3 C3-AT-verify-evidence.py ../../.. > C3-AT-verify-evidence.log
```

`C3-AT-prefix-producer.py`, `C3-AT-scalar-producer.py`, and `C3-AT-selector-producer.py` are byte copies of the sealed producer inputs. `C3-AT-scalar-independent-copy.py` is a byte copy of the critic's separately implemented exact evaluator, inspected and replayed here. `C3-AT-independent-audit.py`, `C3-AT-selector-audit.py`, and `C3-AT-verify-evidence.py` are my own scripts. All processes completed before this report.
