# C3-PREP-C4-INTAKE — proposal to controller

## Boundary and verdict

All 34 files named in the exact brief matched their SHA-256 pins. I read only those files and this scratch. The canonical identity snapshot has 418 distinct keys: 253 VERIFIED, 92 REFUTED, 47 OPEN, and 26 CONDITIONAL. The separate 92-record refutation ledger matches all 92 REFUTED keys and their statement texts; three corresponding registry scope fields add later annotations. None of the six draft keys is an exact collision. `IDENTITY-REVIEW.json` gives one scoped decision per proposed key. I recommend them as **distinct OPEN obligations**, with the current-rank budget optional if the controller wants a separately tracked fallback. This is an intake proposal, not registration, a verdict, or a proof award.

The C3 synthesis and Astra interlude leave the ordinary lower-region selected aggregate and expanded weighted Hall OPEN. The first-shell pointwise/aggregate pair is selected for a separate governed gate and is still OPEN in the registry snapshot. The second-shell and high-rank third-shell preparation reports are informal mathematical audits outside the C3 synthesis. Their exact assertions can be tracked, but their status cannot be silently promoted. No evidence here closes the universal lower-region target or supplies a positive complete eligible sum.

## Independently checked mathematical relations

For an eligible ordinary tree and fixed original selector, put `k=p-1`, `Q=sum_F q_v(k)`, `U=sum_F q_v(k+1)`, and let `E` count *actual* addable vertices over every selected tagged marked `k`-set. For each leaf tag, an independent upper `(k+1)`-set meeting its marks once has exactly `k` deletions that retain a mark; one meeting at least two marks has `k+1`. If `C` counts each such multiply marked upper set once **per leaf tag**, then

`E = k U + C`, `S = U-Q`, and therefore `S<=0 iff E-C<=kQ`.

This is a direct incidence count, with no forest or bipartite theorem needed. It explains why `E<=kQ` is sufficient but stronger than the primary scalar assertion. With `mu_x=(x+1)i_(x+1)(T)/i_x(T)`, first strict descent gives `i_x>0` and `mu_x<x+1<=k`. Thus the proposed numeric thresholds form `E<=mu_x Q => E<=(x+1)Q => E<=kQ => S<=0`. At the boundary `p=x+2`, the flat and current-rank thresholds coincide; the word “strictly” should not be used as a universal separation claim without a separating witness. Failure of any of the three stronger budgets does not refute `S<=0`, since `C` may pay the difference.

For an independent `p`-set `B` of `T`, define `w_F(B)` as the number of selected leaves `v` in `B` for which `B` also meets `W_v=N_T(s_v)\{v}`. The bijection `(v,A) -> (v,A union {v})` gives `Q=sum_B w_F(B)`. A vertex addable to `A` inside `H_v` is exactly a vertex addable to `B` in `T`: the deleted support is blocked by `v`, and `v` has no other neighbor. Hence `E=sum_B w_F(B)e_T(B)`. For `Q>0`, `E/Q=mu_p+Cov_p(w_F,e_T)/E_p[w_F]`. The eligible order-14 example recorded in the transfer diagnostic has `Q=715`, `E=1905`, `mu_p=553/218`, `E/Q=381/143`, and positive covariance cross-product `19895`. The tempting `E/Q<=mu_p` shortcut is false; the exact CT_x challenge is to bound the positive tilt by `mu_x-mu_p`. The 2230 diagnostic rows in the listed selector audit all had the full original leaf selector, so they do not stress selector conditioning.

The six-cover obstruction was independently replayed from its **edges**, using a separate deletion/contraction independence-polynomial evaluator in `verify_intake.py`. The graph is a connected 24-vertex tree with 23 edges, an explicit cover and disjoint matching of size six, so `tau=6`. Its polynomial has `alpha=18`, first strict descent `x=8`, and `p=10` meets `x+2<=p` and `30<37`. Deriving every degree-one vertex from the edges yields all 17 leaves in the strict selector. Fifteen terms are `-7537`, two are `-4875`, and `S=-122805`. This **refutes the attempted low-rank `tau>=7` step**, while supporting neither a pointwise nor primary refutation. It is one tree, not a six-cover census. The shell margin arithmetic was also independently recalculated: second-shell cover-five margins at `p=6` are `[9,38,81,90,1]`, at `p=7` are `[11,58,167,295,284,0]`; third-shell six-cover `N=26` margins through `r=12` are positive, ending at `16848`. These numbers check calculations in the source reports, not their universal injections or all graph reductions.

The controller generic-shell note has a sound *arithmetic reduction* on its stated symbols: for `d=s+2-ell>=2` and `ell>=2`, `ell-1+m(d)=s+ceil(d/2)<=ceil(3s/2)` when `m(d)=ceil(3d/2)-1`. Applying the registered r25 large-rank theorem still requires `r=p-2>=K(d)=2m(d)-d` for every actual residual. More importantly, a separate cover-exclusion argument is required before the reduction applies. At `s=5`, a cover of size eight leaves `N=2p-3=2r+1` at `r=p-2`, where the empty-fiber difference is zero and Catalan loss terms cannot prove positive prehistory. This is a **method obstruction**, not a refutation of a fifth-shell theorem. I treat both controller notes as unreviewed research directions.

For the low-cover redirection, if a six-vertex cover `C` is fixed in a tree, its complement is independent and every outside vertex has positive degree. Writing `e_CC` for edges inside `C`, tree edge counting gives `sum_{u outside C}(deg(u)-1)=5-e_CC<=5`. Thus at most five outside vertices have degree at least two. This validates the stated connector-excess compression, but a complete skeleton parameterization must still include all cover-internal edges, every outside connector neighborhood, connectivity, acyclicity, original cover vertices that become leaves, and every strict selector. The six-center single-hub probe checked sorted profiles only: 163, 235, 331, and 454 profiles at `p=10..13`; just one eligible row, at `p=10`. It is not a census of arbitrary six-cover trees.

For `T_m`, write `L=1+z`, `B=L^3+z=1+4z+3z^2+z^3`. Splitting on root 0 gives the exact ordinary polynomial `P=(1+2z)B^m+zL^(3m+1)` and `alpha(T_m)=3m+2`. The arm and claw deletions have different polynomials:

`P_arm_removed=L B^m+zL^(3m)`;

`P_claw_removed=(1+2z)B^(m-1)(L^2+z)+zL^(3m)`.

Each orbit must pass its own `Delta_p<0` test. The corresponding marked polynomials are `q_arm=zL^(3m)` and `q_claw=zL^(3m)+z(2+z)(1+2z)B^(m-1)`. If **both** orbits are selected, their weighted sum is

`Q_all=(3m+1)zL^(3m)+3m z(2+z)(1+2z)B^(m-1)`.

Differentiating `P` and using `B'=4+3z(2+z)` gives the listed identity `Q_all=P'-2B^m-4m(1+2z)B^(m-1)-L^(3m+1)`. This is exact algebra, not a sign theorem. In general the complete selected `S` is the arm indicator times `([z^p]-[z^(p-1)])q_arm`, plus `3m` times the claw indicator times the same coefficient difference of `q_claw`. The registered r19 four-ratio package names four sufficient inequalities on its own ranges; their formulas and an ordinary/governed interpretation are not included here, so the new family target cannot be equated with that package or awarded from it.

## Eighteen prospective lenses

The 6 T, 6 F, 6 U layout gives genuine role diversity. Its substantive balance is about five transfer/budget seats (T1,T2,F1,F2,U1), three mixed-Hall/colored seats (T3,F3,U4), one cross-tag operator (T4), two `T_m` seats (T5,F5), three recurrence/selector seats (T6,F4,U5), and four shell/formal seats (F6,U2,U3,U6). This places most effort on global mechanisms, as Astra requested, but four shell/formal seats are near the upper acceptable limit. Every route should deliver a finite, checkable lemma, exact obstruction, or well-specified failed bridge rather than a survey.

| Lens | Intake judgment and concrete amendment |
|---|---|
| T1 | Central. Prove the CT_x weighted tilt inequality for the **actual fixed selector**, or a stated subclass with a proved selector characterization. Report `Q,E,i_x,i_(x+1),C,S` on every example. |
| T2 | Central fallback. Attempt flat first, then current-rank or direct `E-C<=kQ`. State which rung each lemma reaches and where `C` enters. |
| T3 | Valuable hard-family Hall task. Freeze the complete CB(8,92)/(8,93) clone relation and prove an arbitrary-subset mixed-boundary cut inequality, or give a full deficient cut; a routed subfamily is insufficient. |
| T4 | High-value exploratory. Supply an actual cross-tag map/relation with domains, degrees, and collisions, then test its proposed injectivity against the eligible selected T22 local dimension obstruction. |
| T5 | Good independent analytic route. Use the two deletion polynomials above to decide both selector indicators at every endpoint; prove a uniform coefficient inequality or isolate a precise open ratio lemma. Do not assume log-concavity of `P`. |
| T6 | Useful if sharply scoped. Specify one gluing operation and an invariant containing boundary occupancy, polynomial coefficients, and selector changes, including root-as-leaf effects. A bare recurrence is not closure. |
| F1 | Needed hostile transfer check. Seek **proper-selector** eligible trees, since existing 2230 rows had all leaves selected; use a modest frozen family, complete leaves, and independent polynomial check. |
| F2 | Needed separate rung attack. Report exact `Q,E,C,U,S` for each eligible row and classify the first failed rung; a failed CT_x comparison must not be called a failed flat/current budget. |
| F3 | Needed Hall attack. A cut certificate must use the **expanded** two-for-one relation, all clone arcs and capacities, with independently checked conservation/deficiency. Negative `S` says nothing about cuts. |
| F4 | Strong protocol control. Reconstruct leaves and selectors from edges independently of any producer list; include a proper-selector and a changed-selector graft, original supports, shared-support tags, and terminal zero extension. |
| F5 | Distinct from T5 if adversarial. Search orbit-boundary and endpoint ranks, record both favorability tests and exact coefficient margins; unequal-claw variants test mechanism only, not the `T_m` claim. |
| F6 | Keep bounded. Target `n=2p+4`, `p=10..13`; distinguish actual pointwise failure from failure of the known cover-exclusion step. Reproduce the p10 six-cover control. |
| U1 | Central. Derive the exact covariance identity and a quantitative sufficient tilt bound with all hypotheses; explicitly check that early descent alone supplies only `mu_x<x+1`, not ratio monotonicity. |
| U2 | Limit to one reusable shell lemma. Audit the `ell,d,m,K` arithmetic and the r25 application, then exhibit the first unmet cover/selector bridge; at `s=5` retain the empty-fiber obstruction. |
| U3 | Useful bounded low-cover plan. Prove six-cover skeleton completeness and count manageable skeletons **before** a run. The single-hub probe is a control, not coverage; include cover vertices that are leaves. |
| U4 | Complementary to T3. State the exact colored-shadow/normal-poset theorem and its hypotheses, then prove or disprove preservation of *both* deletion and support-insertion boundaries and selector capacities under one proposed compression. |
| U5 | Valuable independent recurrence audit. Give a minimal sufficient state proposal or two boundary-equivalent rooted trees whose aggregate/selector behavior diverges after a specified gluing; show exact coefficients and supports. |
| U6 | Currently under-sourced for its formal-helper wording. Supply the exact pinned first-shell integration files before dispatch, or rewrite as an informal bridge audit using listed canonical theorem statements; cap shell work and spend the remainder on a global dependency. |

## Evidence completeness and dispatch gates

The draft has no dispatch-ready source inventories or frozen independent test recipes. Before freezing Cycle4 cases, the controller should pin the refreshed claim snapshot, the common handoff, the evaluator and terminal-descent erratum for any computational route, the original matching-certificate rows and Lean/receipt files for any route asked to audit those proofs, and U6's formal integration helpers. These files were **not** in this brief, so I did not read them. The second-shell report's 48-row matching certificate and pinned forest-bound source, and the third-shell report's 80/192-row certificates and first-wide source, are described and arithmetically summarized in listed reports; their raw rows/signatures were unavailable for independent replay here. No formal proof fidelity or kernel assertion follows from this intake. Likewise, U4 can investigate the named primary literature in its own authorized packet, but the controller note alone imports no colored-shadow theorem into the mixed weighted-Hall graph.

For every finite candidate or critic, require edge-derived original leaves, treehood, exact zero-extended `x`, `alpha`, both strict guards, all selected tags including shared supports, every `H/R` term, and the full `S`. A second count method or an independently grounded polynomial identity is needed for semantic completeness. C3's missed path leaf 2 in T4/graft and the repaired sums `-10089/-17280` show why rerunning copied code is insufficient. Positive local terms at T22/T67, a deficient old Delete/Retag cut, or the p10 six-cover obstruction are mechanism evidence only. All allocations and identity decisions remain proposals to the controller.

## Limitations

I did no Lean build, literature retrieval, large census, source edit, registry change, or proof award. The independent computation here covers one encoded low-cover tree, source integrity and inventory checks, and shell margin arithmetic; it does not certify any universal shell proof or any proposed universal transfer budget. The r19 four ratio formulas, raw formal artifacts, and a fresh post-C3/Code snapshot were not supplied to this seat. The exact final allocation and registration depend on controller review of those materials.
