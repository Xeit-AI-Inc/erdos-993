# C6-AU: U-origin adjudication, cycle 6

This is a proposed origin adjudication of exactly six U routes and their twelve opposing T/F critiques. It makes no registry award. All 81 case-pinned and 237 common-pinned file hashes matched SHA-256. I used the common contract and its `read_first` files and the exact listed U case files; no other current worker source was used. `independent_checks.py` and its JSON result are local, foreground, exact-integer checks of the post-critique ULC, selector-sign, and active-weight questions. Controller-origin appendices are mathematical input to challenge, not votes or authority.

The unchanged primary asks, for a finite ordinary tree `T`, every integer `p` with `x(T)+2<=p` and **strict** `3p<2alpha(T)+1`, whether the complete sum over `F(T,p)={v original leaf: Delta_p(T-v)<0}` is nonpositive. Here `x` is the first strict descent, including terminal zero extension, and each original leaf retains its own tag and original support. The exact marked-incidence identity, with `a=alpha(T)`, `k=p-1>=1`, `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, `R_v=H_v-W_v`, `q_v(j)=i_j(H_v)-i_j(R_v)`, `Q=sum_F q_v(k)`, actual-addability deficit `D`, and multiply marked correction `C`, is

`k S(T,p)=(2a+1-3p)Q-D-C`.

The coefficient is positive in this region. Thus even `D,C>=0` does not supply the required `D+C >= (2a+1-3p)Q`. No route here proves that budget or gives an eligible tree with positive **complete** selected sum. The arbitrary-tree primary remains OPEN at this worker's proposed evidence grade.

## C6-U1-TM-LEAN-DECOMPOSITION — retained_narrowed

The U1 result is a **formalization roadmap** for the already retained homogeneous `T_m` family, not a new proof or a completed Lean declaration DAG. The graph is the path `a-b-r` with `m>=1` claw centers at `r`, three private leaves per center. It has order `4m+3`, independence number `3m+2`, one path-tip original leaf and `3m` private original leaves. All `3m` tags must remain distinct. Let `L=1+z`, `B=L^3+z=1+4z+3z^2+z^3`. The proposed graph/count bridge must establish

`P=(1+2z)B^m+zL^(3m+1)`,
`A_0=LB^m+zL^(3m)`,
`A_*= (1+2z)(1+3z+z^2)B^(m-1)+zL^(3m)`,
`Q=zR`, with `R=3m(2+5z+2z^2)B^(m-1)+(3m+1)L^(3m)`.

Here `A_0,A_*` are the two literal leaf-deletion polynomials and `Q` is the **all-tag** marked difference. One may use `R` for the selected sum only after proving both deletion orbits satisfy `Delta_p(A)<0` at every eligible `p`. The proposed direct descent argument gives `x(T_m)>=m+1` for `m>=2`: for `M=(1+2z)B^m`, `D=3m+1`, coefficientwise factor inequalities imply `(j+1)M_(j+1)>=(2/3)(D-j)M_j`; for `j<=m` the ratio is at least `(4m+2)/(3m+3)>1`. The `zL^(3m+1)` term also rises through these ranks. The strict guard gives `p<=2m+1`. `m=1,2` have `(x,a)=(2,5),(4,8)` and no eligible rank. These are candidate formalization steps, not family Lean declarations.

The C5 exact finite base cited by U1 is `m=3..999`, `j=m..2m+2`, for three auxiliary sequences, giving `3 sum_(m=3)^999(m+3)=1,507,464` LC and the same number of mixed-minor checks. Python exact arithmetic and matching digests are not kernel evidence. A Lean proof still needs the graph/count and integer/natural-rank bridges, coefficient recurrence correctness, exact finite checker, central mixed-minor identities and boundary signs, analytic tail, selector propagation, kernel build, axiom probe, and semantic fidelity audit. The main scale gates are a formal ULC-convolution interface and a kernel-acceptable finite base, but they are not the only missing declarations. The separate cutoff-400 certificate would be an alternative for the same family claim, not a new scope.

The critics disagreed about the normalization. CT-U1 correctly noted that finite-order binomial ULC allows an order above degree; CF-U1 correctly demanded the **quantitative Poisson curvature** needed downstream but incorrectly made Poisson-only phrasing compulsory. The root-origin U1 appendix proposed two interfaces. My direct rational check gives `B` degree 3, failing binomial ULC at order 3 but satisfying it at order 4; the factor orders for `L`, `1+2z`, `B`, `1+3z+z^2`, and `2+5z+2z^2` are respectively `1,1,4,2,2`. For nonnegative interval-supported coefficients, finite-order ULC at order `d>=degree` gives

`j(d-j)a_j^2 >= (j+1)(d-j+1)a_(j-1)a_(j+1)`, hence `j a_j^2 >= (j+1)a_(j-1)a_(j+1)` and `a_j^2-a_(j-1)a_(j+1)>=a_j^2/(j+1)` at interior positive ranks; zero extension handles support boundaries separately. A formal finite-order convolution theorem with additive orders, followed by this implication, is one valid interface. Direct Poisson-ULC closure is another if formally proved. Neither has been kernel-certified here. The appendix is credited as root-origin clarification; the inequalities above were independently checked.

## C6-U2-CENSUS-M1-40 — retained at bounded scope

For the ordinary path `0-1-2` with `m` centers attached to `0`, each having `r_i in {2,3,4}` private leaves, U2 covered every unordered arity multiset for `1<=m<=40`: `sum_m binom(m+2,2)=12,340` profiles. Set `N=sum r_i`, `L=1+z`, `B_r=L^r+z`, `Q=prod_i B_(r_i)`, and `H_r=Q/B_r` as a polynomial product over the other branches. The exact graph split gives `alpha=N+2` and

`P=(1+2z)Q+zL^(N+1)`, `A_0=LQ+zL^N`, `A_r=(1+2z)B_(r-1)H_r+zL^N`.

`A_0` is deletion of endpoint 2 and `A_r` deletion of one private leaf of arity `r`. Strict favorability uses `Delta_p(A_0)<0` or `Delta_p(A_r)<0` **at p**, not a sign inferred from the summand. For the endpoint `H_v-R_v=zL^N`; for a private leaf `H_v-R_v=zZ_r`, where `F_r=(L^(r-1)-1)/z` and `Z_r=(1+2z)F_rH_r+L^N`. The corresponding per-tag summand is `Z[p-1]-Z[p-2]`, with the endpoint using `Z=L^N`. If an arity `r` occurs `c_r` times, its selected private-leaf contribution is multiplied by `r c_r`; this preserves same-support leaves separately. The first descent is scanned through the terminal zero-extended rank. The exact eligible interval is `x+2<=p<=floor(2alpha/3)`.

The producer and both critics' scratch replays agree: 191,016 eligible profile/rank pairs, all with strictly negative **complete** `S`; zero nonnegative rows; endpoint selected in all 191,016; 18,940,012 selected private tags and 19,131,028 selected tags overall. Six actual graph-DP samples gave 164 polynomial comparisons with no mismatch. The additional 5,253,954 central LC checks on the named polynomials and interval had no negative margin, but did not check every mixed minor. I checked the recurrence and loop boundaries in the pinned program and the evidence totals, including `sum by_m=191,016`; the exact per-m counts are carried in `SOURCE-SUMMARY.json`. The two critics performed full independent replays. This is an exact finite result only. It does not cover `41<=m<2000`, all heterogeneous parameters, or arbitrary trees.

## C6-U3-ABSORB-BOUNDED-20 — retained at bounded factor scope

For `2<=r,s<=20`, U3 tested all `q=1..4` in `G_(r,s,q)=F_r B_s^q`, with `F_r=(L^(r-1)-1)/z`, `B_s=L^s+z`. There are 361 parameter pairs and 1,444 positive-coefficient polynomials. For coefficients `a_0..a_n` and integer order `d>=n`, normalized LC of `a_j/binom(d,j)` is equivalent at each interior `j` to `(d-j)A_j>=R_j`, where `A_j=j a_j^2-(j+1)a_(j-1)a_(j+1)` and `R_j=(j+1)a_(j-1)a_(j+1)>0`. Hence some finite order exists iff all interior `A_j>0`; the least is `max(n, max_j [j+ceil(R_j/A_j)])`. Degree-one cases have no interior obstruction. This criterion permits orders far above the degree.

Producer data and two independent full replays agree: the least successful `q` is 1 for 273 pairs, 2 for 80, 3 for 7, and 4 for 1. The individual failure counts at `q=1,2,3,4` are `88,8,1,0`. All pairs succeed by four equal-type factors; the unique pair needing four is `(20,2)`, whose `q=4` least finite order is 117. My separate binomial convolution and rational test recovers `(20,2)` failing at interior index 1 for `q=1,2,3` and passing at order 117 for `q=4`. The full replay also matched the pinned 121 one-factor rows for `r,s<=12`.

This is a finite coefficient certificate, not a uniform bound in `r,s`, a result for mixed absorbed arities, a universal convolution application, or a tree result. In particular finite factor repair alone does not establish graph identities, perturbation margins, selector propagation, or the primary aggregate. CT-U3's `proposed_verified` describes only the finite arithmetic; CF-U3's `proposed_open` emphasizes the absent universal theorem. These are compatible scopes, not contrary mathematical findings.

## C6-U4-MATCHING-DEFICIENCY-BUDGET — retained, corrected selector sign

Fix the original selected tags and `k=p-1`. For `A` an independent `k`-set of `H_v` meeting `W_v`, write `n_v=|V(H_v)|`, `nu_v` for maximum matching size, and `e_v(A)` for the number of **actual** addable vertices in `H_v`. Since `A` is independent, `e_v(A)=n_v-k-|N_(H_v)(A)|`. The residual forest is bipartite, so König's equality gives `h=alpha(H_v)=n_v-nu_v`. Therefore the exact pointwise identity is

`d_v(A)=2(h-k)-e_v(A)=(n_v-2nu_v)+|N_(H_v)(A)|-k`.

All neighborhoods in this equation are local to `H_v`; `n_v-2nu_v` is the maximum-matching deficiency. Summing over marked sets and distinct selected leaf tags, and using `E=kU+C`, `D=2(h-k)Q-E`, `S=U-Q`, yields `kS=(2a+1-3p)Q-D-C`. Consequently the primary `S<=0` is equivalent to

`sum_(v in F)[(n_v-2nu_v)q_v(k)+sum_(A marked k-set in H_v)(|N_(H_v)(A)|-k)+C_v] >= (2a+1-3p) sum_(v in F) q_v(k)`.

The empty-selector case is `0>=0`; an expectation reformulation requires `Q>0`. Nonnegativity of `d_v,C_v` does **not** prove the positive required amount. The strict selector itself has the exact graph/rank expression `I(T-v)=I(H_v)+zI(R_v)` and

`Delta_p(T-v)=Delta_p(H_v)+Delta_(p-1)(R_v)<0`.

CT-U4 reversed the subtraction in the `zR` contribution and printed a minus sign; CF-U4 left the source's plus sign intact. The root-origin sign appendix agrees with direct extraction: `[zR]_(p+1)-[zR]_p=R_p-R_(p-1)=Delta_(p-1)(R)`. My independent coefficient check reproduces the plus sign. Thus the source's selector formula is retained, the CT-U4 correction is rejected, and the missing selector-to-budget implication remains a genuine universal proof gap. This route provides an exact equivalent budget, not an independent estimate establishing it.

## C6-U5-CB-sector-deficit — retained_narrowed with active-weight correction

The bounded graph is `CB(8,92)`: path `0-1-2` with 92 chokes attached to root 0; each choke has eight support vertices, each with one private leaf. The pinned exact graph replay gives order 1567, `a=829`, `x=490`, `p=492`, so `x+2=p` and `3p=1476<1659=2a+1`. All 737 original leaves are favorable and the **complete** selected aggregate is negative. The prospective mixed switch-cut envelope has a nonpositive lower bound on deficit and is inconclusive.

In the root-plus-arm sector, fix root 0 and arm leaf 2. Every choke is then absent. The remaining choices lie in `8*92=736` disjoint support-leaf pairs, at most one endpoint per pair. Thus the residual rank-`s` layer has `|R_s|=2^s binom(736,s)`. An upper whole-graph set of size `p+1=493` has residual `s=491`; a lower set of size `p=492` retaining the fixed vertices has `s=490`. Exact cross-multiplication gives `|R_491|/|R_490|=492/491`, a deletion-only unit-capacity shortfall `|R_490|/491`. `SOURCE-SUMMARY.json` carries the exact negative full aggregate and inconclusive conservative-cut integer, along with their graph guards.

The route and both critics additionally weighted each member by `1 + number of private leaves present`, obtaining `W_491/W_490=493/491` and shortfall `2W_490/491`. Those equations are true for **that artificial weight**, but it is not the canonical active-tag weight of the CB mixed network. A private original leaf has its support at its support vertex and is active only when another neighbor of that support, namely its choke, is in the independent set. Root presence excludes every choke, so all private tags are inactive even when their leaves are present. The arm tag is active because the root is present. Therefore each member of this sector has exact canonical active weight **one**, as independently checked from original supports and the CB edge recipe. Deleting root or arm leaf gives zero active-tag capacity; positive-capacity ordinary-deletion neighbors are exactly the `R_490` layer. The **correct whole-sector deletion-only** ratio and deficit are `492/491` and `|R_490|/491`. This verifies the root-origin active-weight correction independently and rejects CT-U5's outside-sector objection for the canonical active weight. CF-U5's proposed switch surplus uses the erroneous weight. The two critiques' agreement on the artificial mass is not validation of the network claim.

This corrected deletion-only obstruction is a narrow combinatorial fact. It does not establish a deficient cut in the mixed deletion-plus-two-for-one graph: a switch can exit the sector, insert a choke, and activate private tags. Its usable capacity, overlap with deletion images, competition from other upper sources, and arbitrary-subfamily Hall inequalities are all unproved. The eligible CB graph has negative complete `S`, so this is not an aggregate counterexample.

## U6-MARKED-RECURRENCE-TRANSPORT — retained_narrowed

Keep `F(T,p)` fixed at every rank. For each original selected leaf, `q_v(j)` counts independent `j`-sets in `H_v` meeting `W_v`; adjoining `v` bijects them with independent `(j+1)`-sets of `T` that contain `v` **and** another vertex of `W_v`. It is not a bijection onto all sets containing `v`. Since each contracted summand is `q_v(p)-q_v(p-1)`, the exact complete target is

`S(T,p)=Q_p-Q_(p-1)`, where `Q_j=sum_(v in F(T,p))q_v(j)`.

If `C_i` are the components of `H_v`, each has exactly one attachment `w_i` to the removed support: connectivity gives one and acyclicity forbids two. Put `A_i=I(C_i)`, `B_i=I(C_i-w_i)`. Then `q_v(z)=prod_i A_i-prod_i B_i=sum_i(A_i-B_i)prod_(r<i)A_r prod_(r>i)B_r`, and `A_i-B_i=zI(C_i-N_(C_i)[w_i])`. These are positive-polynomial identities, not coefficient-decrease theorems. Also `I(T-v)=I(H_v)+zI(R_v)`, so if `delta_v=Delta_p(T-v)<0`, then

`q_v(p)-q_v(p-1)=i_(p+1)(H_v)-i_(p-1)(H_v)-delta_v`.

The required summed two-rank drop of `H_v` is merely an equivalent missing bridge. Strict negative `delta_v` alone does not give it. The route and both critics' replays agree on 280,393 labeled trees through order 8, with **zero eligible rows**; this census has no eligible sign content. For `T_m`, `m<=8`, there are 13 eligible rows (none at `m=1,2`), all with negative complete sums; for `m=3`, `(order,a,x,p)=(15,11,5,7)`, `Q_6=2601`, `Q_7=1434`, `S=-1167`. These finite examples neither prove a universal rank transport nor refute the primary. CT-U6's qualification of the bijection is adopted; CF-U6's identity audit is consistent with it.

## Evidence boundary

The case has exactly the six IDs listed in `RETURN.json`; each gets one disposition there. `INDEPENDENT-CHECKS.json` records the small post-critique checks, and `independent_checks.py` is its replay. `SOURCE-SUMMARY.json` preserves bounded totals, U2 counts by m, the exact CB aggregate and cut result, and all 13 compact U6 family rows for downstream synthesis. The full U2/U3/U6 finite outputs and opposing replay claims are source evidence, not copied or promoted to universal status. No Lean build, external theorem import, full arbitrary-tree search, or mixed-flow proof was performed in this seat. The unresolved universal obligation is still the original fixed-selector selected-sum sign, equivalently the positive global `D+C` budget or fixed marked-rank nonincrease at the eligible rank.
