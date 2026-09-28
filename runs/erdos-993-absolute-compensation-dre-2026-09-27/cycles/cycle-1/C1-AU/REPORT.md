# C1-AU neutral adjudication of the U-origin routes

The registered exact-ratio selected lower-half payment remains **OPEN**. The U-origin cases supply two exact decompositions, a literal eligible counterexample to one proposed spread monotonicity, and finite positive checks. None supplies an all-parameter proof or a negative primary witness. The formally verified relative margin and the computer-assisted aggregate have separate scopes and do not certify the payment.

## Predicate and evidence standard

Throughout, the ordinary tree has path `0-1-2`, distinct centers at `0`, and `r_i` original private-tip tags per branch, with `r_i in {2,3,4}`. Use `N=sum r_i`, `q=N+1`, `alpha=N+2`, `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `F_r=sum_(h=0)^(r-2)L^h`, `Q=prod B_(r_i)`, `H_i=prod_(h!=i)B_(r_h)`, `C=GQ`, `T_i=GF_(r_i)H_i`, and `P=C+zL^q`. Coefficients are integer zero-extended. The rank `x` is the *least* natural `k` with `Delta_k P<0`, including the terminal difference. Every tested `p` obeys `x+2<=p`, `3p<2alpha+1`, and `2p<=alpha`; put `j=p-2`, `delta=q-j`. The flags `e0=1[Delta_p A0<0]`, `ei=1[Delta_p Ai<0]` are strict and evaluated on the actual current profile at this `p`, with `A0=LQ+zL^N` and `Ai=G B_(r_i-1)H_i+zL^N`. Then `A=sum_i r_i ei T_i[j]`, `b=e0+sum_i r_i ei`, and `D_j=binom(N,j+1)-binom(N,j)>0`. The endpoint has one original tag; each branch has `r_i`. The payment margin is

`M = K_j A - b delta D_j C[j]`, where `K_j=delta C[j]-(delta-1)C[j+1]`.

The neutral structural source proves at the informal level that `C[j]>0`, `delta>0`, and `0<t=C[j+1]/C[j]<1` in this domain: `Delta_x P<0` while the binomial parent term still rises, so `Delta_x C<0`; positive-interval log-concavity of `C` makes its adjacent ratios nonincreasing, and `j>=x`. Thus `K_j/(delta C[j])=kappa=1-t+t/delta>0`; the integer predicate is exactly `kappa A>=bD_j`. Empty selection has `A=b=0`. Endpoint-only selection has `A=0,b=1` and would fail payment; its absence in scans is not a census-free exclusion. Selected MASS `A>=b delta D_j` and occupation payment `(1-t)A>=bD_j` are distinct, stronger sufficient predicates.

## Claim dispositions

| Required claim | Disposition and grade | Dependency, use, and limit |
|---|---|---|
| `C1-U1-RELATIVE-MARGIN-SLACK-IDENTITY` | **retained**, exact algebra conditional on the formally verified relative coefficient margin | Gives the exact residual between the sufficient payment and the selected aggregate. It supplies no absolute lower bound. |
| `C1-CT-U1-SLACK-COVERAGE-EQUIVALENCE` | **retained_narrowed**, exact algebraic equivalence only | `R >= (bD_j-kappa A)_+` is just `S<=0` rewritten, given `R>=0`; it is not an independent coverage theorem or payment bound. |
| `C1-U1-EXACT-RATIO-BOUNDED-SCANS` | **retained_narrowed**, bounded exact computation | Pure arities through 180 branches and all count triples through 60 branches report no payment failure; 35,477 mixed-scan eligible rows. Critic T replayed source scripts and independently checked one row; critic F checked the code and one row. This is finite evidence only. |
| `C1-U2-SPREAD-NORMALIZED-PAYMENT-MONOTONE` | **rejected**, exact realizable literal-tree counterexample to universal nondecrease | The fixed-`(m,N)` spread below has `Q_new<Q_old` with both payments positive. It proves neither primary failure nor the opposite global monotonicity. |
| `C1-U2-SPREAD-DESCENT-SELECTOR-BOUNDED` | **retained_narrowed**, bounded exact computation | The reported `m<=40` scan covers 10,660 directed profile pairs and 3,756 common eligible rows, with no earlier descent or loss of endpoint/shared-arity flags; four `m=120` pairs were also targeted. Critic T replayed the declared scan; critic F audited its scope and independently checked the profile count. One large pair has no common eligible rank. No universal transfer follows. |
| `C1-U3-BRANCH-DEBT-DECOMPOSITION` | **retained**, exact algebraic identity | Splits selected branch debt from the endpoint's unit debt, preserving all original tip multiplicities and the exact `K_j`. The local selector-to-surplus sign and endpoint coverage are unproved. |
| `C1-CT-U3-CONDITIONAL-LOCAL-PAYMENT` | **retained_narrowed**, exact conditional consequence of the preceding identity | If selected local surpluses are nonnegative and `e0=0`, payment follows. If `e0=1`, payment is equivalent to their sum covering the endpoint debt. The second equivalence itself does not require individual nonnegativity. |
| `C1-U3-FINITE-LOCAL-SURPLUS-CHECKS` | **retained_narrowed**, bounded exact computation | No negative selected local or primary margin in the declared controls, small mixed scan, selector neighborhood, or large stress. Correct counts and replay limits appear below. No universal local implication follows. |
| `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-EXACT-RATIO-PAYMENT` | **open**, registered universal target | Neither exact identity pays the absolute debt; the spread counterexample targets an auxiliary quotient and both its primary margins are positive. No all-parameter proof or eligible negative primary witness is established. |

For the U1 identity, define `epsilon_i=((delta-1)/delta)t T_i[j]-T_i[j+1]` and `R=sum_i r_i ei epsilon_i`. The registered relative margin is `((delta-1)T_i[j]C[j+1]-delta T_i[j+1]C[j])>=0`, hence `epsilon_i>=0`. Direct subtraction gives `Delta_j T_i=-kappa T_i[j]-epsilon_i`. The selected aggregate expression `S=bD_j+sum_i r_i ei Delta_j T_i` therefore equals `bD_j-kappa A-R`. Since `R>=0`, `S<=0` if and only if `R>=(bD_j-kappa A)_+`: when the parenthesis is nonpositive, both conditions are automatic; when positive, this is direct rearrangement. That is the full content of the new critic claim. A lower bound on `R` derived independently from descent and selector geometry would be new work; this equivalence alone is tautological relative to the aggregate sign. It cannot reverse the implication from payment to aggregate.

For U3, group equal-arity branches using counts `a_r`, common `T_r`, and common current-`p` flag `e_r`. Let `W_r=K_jT_r[j]-delta D_jC[j]`. Substituting `A=sum_r a_r e_r r T_r[j]` and `b=e0+sum_r a_r e_r r` yields exactly

`M=sum_(r=2)^4 a_r e_r r W_r - e0 delta D_jC[j]`.

The term `r` is the count of original private-tip tags, and the endpoint has no corresponding `T_r` contribution. If `e0=0`, nonnegative selected `W_r` suffice. If `e0=1`, payment requires exactly `sum_r a_r e_r r W_r>=delta D_jC[j]`, whether or not each `W_r` is nonnegative. The missing all-parameter obligations are a selector-to-local-surplus implication and quantitative endpoint compensation. The relative-margin minor in U1 is a different quantity from `W_r`; its nonnegativity does not settle these obligations.

## Exact spread witness and what it excludes

The directed move `(a2,a3,a4)=(0,10,13)->(1,8,14)` replaces two distinct arity-3 branches by arities 2 and 4. It fixes `m=23,N=82,q=83,alpha=84`. The literal-tree dynamic-program replay in `cycles/cycle-1/C1-AU/spread_replay.py` checks parent and leaf-deletion polynomials against the stipulated formulas, scans *all* earlier differences, and finds `x=40` on both profiles. At `p=42`, `x+2=p`, `3p=126<169=2alpha+1`, and `2p=84=alpha`; thus `j=40,delta=43,D_j=10113918591637898134020`. The endpoint and every represented arity's private-tip selector have strictly negative deletion difference on each side: old `(e0,e3,e4)=(1,1,1)`, new `(e0,e2,e3,e4)=(1,1,1,1)`. Hence `b=1+10*3+13*4=83` and `b=1+1*2+8*3+14*4=83`. No original leaf selector loss is exhibited.

| profile | `C[j]` | `C[j+1]` | `A` | signed integer `M` |
|---|---:|---:|---:|---:|
| old | 9174387001688025349964921 | 9077270504712199590955106 | 286323059871701687885575254 | 3463555694405780523228670120945814749048313397994374 |
| new | 9615805819800729232372463 | 9539566812359057411855005 | 301474854879381240690246642 | 3517160039345853058148436236636758533834269835505818 |

The normalized exact quotient is `Q=M/(b delta D_j C[j])+1=K_j A/(b delta D_jC[j])`. Exact cross multiplication of the replay's reduced fractions gives the signed `Q_new-Q_old` cross product

`-121231367143124300697151513722751169007529823441333312373687087560102262673755402682258271760 < 0`.

Both `M` values are positive. This rules out **nondecrease** of `Q` along every spread, including at full selection; it does not prove universal **nonincrease**, threshold preservation, or a primary counterexample. The algebra `B_2B_4-B_3^2=z^3L^2` gives `P_new-P_old=Gz^3L^2K` for the unchanged-factor product `K`. Its coefficients are nonnegative, but its forward differences need not be. To prove first-descent nondecrease one would need `Delta_kP_old+Delta_k(Gz^3L^2K)>=0` for every `k<x_old`; a finite no-failure scan does not prove this. A qualified extremal-chain approach would still need this descent transfer, an exact *threshold* transfer with flags recomputed at each step, and independent payment at each maximal-`a3` base. None is supplied.

## Finite scope and provenance

U1's mixed scan records 35,477 eligible rows through total branch count 60, and its pure scans run each arity through 180 branches; no selected pure-arity-2 row occurred there. The pure and mixed minima are bounded observations, not universal extrema. U2's bounded directed spread scan visits `sum_(m=2)^40 binom(m,2)=10660` candidate pairs; only 3,756 common eligible rows test simultaneous flags. Its four `m=120` stress pairs do not all have a common eligible row.

U3's small loop visits 2,599 **candidate** triples with `2<=m<=24,a3>=1`; only 65 fresh profiles have eligible rows. With three standing controls, the saved artifact has 68 profiles with eligible rows and 75 eligible rows total. The selector perturbation consists of the center `(0,12,10)` plus five valid one-coordinate neighbors; decrementing `a2=0` is invalid. Six profiles were tested, three have eligible rows, and four eligible rows occur when the center is included. The large selected stress consists of 828 candidate profiles, 646 with eligible rows and 2,738 eligible rows. Critic F replayed its producer evaluators; critic T independently checked the small rows, the large candidate count, and one large minimum row, but did not independently replay all 2,738 large rows. These scans use contracted polynomial formulas, except for the separate literal-tree spread witness. They establish no all-parameter implication.

The standing `(0,12,10)` control has negative shifted cofactor slopes despite endpoint and tips being selected, so no `d_i>=0` selector premise is imported. The homogeneous arity-4 `m=150` control defeats a truncated two-layer MASS estimate; the full `T_i` local and primary margins checked here remain positive. Those controls test the proposed shortcuts, not the universal payment.

The common dispatch seal (39 files), this worker's own dispatch seal (4 files), and all 78 packet-listed permitted artifacts matched their SHA-256 entries. Verification compared hashes without displaying inventory contents. The copied literal replay was run from this worker's top-level directory with bytecode writes disabled:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-1/C1-AU/spread_replay.py > cycles/cycle-1/C1-AU/spread_replay.json
```

Two critic provenance incidents are disclosed in their reports. `C1-CT-U2` imported a sealed producer script once and generated a `__pycache__` in that source directory; its packet-listed hashes stayed unchanged and the cache was quarantined. `C1-CT-U3` accidentally displayed an inventory containing sibling *metadata* and stopped; it reports no sibling case-content read. These are protocol concerns for the controller. Neither changes an arithmetic identity, and no concrete mathematical contamination is identified in the allowed reports. The U3 algebra is independently confirmed by the separate F critic; the U2 witness has independent literal-tree replay. This adjudication does not award provenance validity or alter source seals.

No Lean build, external theorem, controller command, arbitrary-tree inference, or all-parameter inference from finite data was used. The exact target and selected MASS remain OPEN at their separate registered scopes.
