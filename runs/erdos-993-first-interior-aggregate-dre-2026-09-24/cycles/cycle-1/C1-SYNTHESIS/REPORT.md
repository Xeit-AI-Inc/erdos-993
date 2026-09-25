# Cycle 1 neutral synthesis — first interior favorable-leaf aggregate

**Proposed worker synthesis only.** The unrestricted primary claim `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` remains **OPEN**. The three sealed adjudications provide exact deletion and tagged-count identities, a negative theorem for one constructed tree family, and finite negative examples. They provide neither an all-eligible-tree proof nor an eligible tree with a positive **complete** favorable-leaf sum. No Lean gate was assigned or run. No status award or novelty claim is made here.

## Source boundary and definitions

This synthesis uses only `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `WORKER-PROTOCOL.md`, `EXECUTION-POLICY.md`, the synthesis case and review protocol, and the three case-pinned adjudications `cycles/cycle-1/C1-AT/{REPORT.md,RETURN.json}`, `cycles/cycle-1/C1-AF/{REPORT.md,RETURN.json,audit.json,audit.py}`, and `cycles/cycle-1/C1-AU/{REPORT.md,RETURN.json,independent_audit_copy.py,independent_audit_replay.json}`. All ten case-listed files match their case SHA-256 values. Historical files, raw routes and critiques, controller notes, and later-cycle material were not inspected. Adjudication references to them are reported only through the adjudicators' self-contained findings.

For a finite simple ordinary tree `T`, let `i_j(G)` count independent `j`-sets with zero extension to all integer `j`, `Delta_j(G)=i_(j+1)(G)-i_j(G)`, `alpha=alpha(T)`, and `x(T)=min{j>=0:Delta_j(T)<0}`. Put the **integer** `p=alpha-2`; eligibility is `x(T)+2<=p`, hence `p>=2`. Every original degree-one vertex `v` is a separate leaf tag, even if several leaves have the same support `s_v`. Put `H_v=T-{v,s_v}`, `R_v=T-N_T[s_v]`, and select `v` only when `Delta_p(T-v)<0`. Its term is `g_v=Delta_(p-1)(H_v)-Delta_(p-1)(R_v)`. The complete target sum `S(T,p)` includes every selected original leaf tag. Residuality means every original leaf belongs to every maximum independent set; it is not a primary hypothesis.

## Shared exact mathematics and its limit

Partition independent sets of `T-v` according to whether they contain the original support `s_v`. This proves at every integer rank, including boundary ranks,

`I_(T-v)(z)=I_(H_v)(z)+z I_(R_v)(z)`,

`Delta_p(T-v)=Delta_p(H_v)+Delta_(p-1)(R_v)`.

Partitioning independent sets of `T` by membership of `v` also gives `I_T=(1+z)I_H+z I_R` and `alpha(H_v)=alpha(T)-1`. The latter follows alternatively by extending any `H_v` set with `v` and removing at most one of `v,s_v` from a `T` set. Rearrangement gives the T2/AF identity

`g_v+Delta_p(T-v)=i_(p+1)(H_v)-i_(p-1)(H_v)`.

Thus for a selected leaf at `p=alpha-2`, the proposed inequality `g_v<=0` is equivalent to the **unproved** pointwise budget `i_(alpha-3)(H_v)-i_(alpha-1)(H_v)>=-Delta_p(T-v)`. It would suffice for the primary sum if it held on every selected tag, but the adjudications establish no such bound; an aggregate proof need not pass through it.

There is a more directly aggregate form. Let `W_v=N_T(s_v)\{v}` inside `H_v` and `q_v(j)=i_j(H_v)-i_j(R_v)`. Since `R_v=H_v-W_v`, `q_v(j)` counts independent `j`-sets of `H_v` meeting `W_v`. Then `g_v=q_v(p)-q_v(p-1)`. If `A_j(T,p)` counts pairs `(v,J)` where `v` is a **favorable original leaf tag** and `J` is an independent `j`-set of `H_v` meeting `W_v`, the complete identity is

`S(T,p)=A_p(T,p)-A_(p-1)(T,p)`.

Selection is controlled separately by `Delta_p(H_v)+Delta_(p-1)(R_v)<0`. This exact equation does not compare the two selected tagged shells. The missing implication is `A_p(T,p)<=A_(p-1)(T,p)` under the eligibility guard, or a counterexample to that inequality. An algebraic rewriting alone is not a sign proof.

At a support `s` with `lambda_s` original leaf neighbors and non-leaf branches `C_(s,u)` rooted at neighbors `u`, define `H_s=(1+z)^(lambda_s-1) product_u I(C_(s,u))` and `R_s=product_u I(C_(s,u)-u)`, using empty products `1`. For every tag at `s`, `I(H_v)=H_s`, `I(R_v)=R_s`, and `I(T-v)=H_s+zR_s`. Consequently all `lambda_s` tags have the same strict selector and term, and support regrouping weights that selected term by **`lambda_s`**. This unifies the T1/T3/U1 identities without discarding multiplicity. For an individual leaf, `alpha(R_v)<=alpha-2` exactly when it is residual; otherwise `alpha(R_v)=alpha-1`. The 12-vertex example below shows that residual and non-residual selected tags can coexist in one eligible tree. The separately described r26 result has both a residual hypothesis and rank `alpha-1`, so the adjudications do not transfer it to the unrestricted rank `alpha-2` target.

## Reconciled family theorem and arithmetic correction

All three adjudications discuss the **same** `T_m` family: a root `r`, one marked length-two arm `r-s_0-v_0`, and `m>=1` additional root-adjacent star centers, each with three original leaf neighbors. It has `4m+3` vertices and `3m+1` original leaf tags. Write `n=3m`, `A=1+z`, and `B=A^3+z=1+4z+3z^2+z^3`. Root conditioning gives

`I(T_m)=(1+2z)B^m+zA^(n+1)`, `alpha(T_m)=n+2`, `p=n`.

For the marked leaf, `I(T_m-v_0)=A B^m+zA^n`, its selector is `1-2n<0`, and `g_0=n-binomial(n,2)`. For each of the `n` star leaves, `I(T_m-v)=(1+2z)(1+3z+z^2)B^(m-1)+zA^n`, its selector is `-(n+1)<0`, and the **correct** term is

`g_star=3-n-binomial(n,2)=3-3m-binomial(3m,2)`.

Hence every original tag is favorable at the target rank and the complete sum is

`S(T_m,n)=g_0+n*g_star=-n(n^2+2n-9)/2=-(9m/2)(3m^2+2m-3)<0` for `m>=1`.

The F-origin adjudication's narrative and `C1-CT-F2-FAMILY-SIGN` return statement instead print `3-6m-binomial(3m,2)` for `g_star`. That isolated expression is false. Its own `audit.json` gives, for `m=2`, `g_star=-18`, equal to `3-6-binomial(6,2)`, whereas the printed `3-12-binomial(6,2)` would give `-24`. The F-origin report's complete-sum formula, its audit rows, and the T- and U-origin coefficient proofs all agree with the corrected term above. Therefore this synthesis **narrows and corrects** that single incoming claim rather than carrying forward the false expression. For `m=1`, `(alpha,x,p,S)=(5,2,3,-9)`, so it misses `x+2<=p`. The F-origin coefficient argument proves `Delta_(3m-2)(T_m)<0` for all `m>=2`, hence all those family members are eligible. This is an exact informal theorem for a restricted family, not an all-tree result. Representative adjudicated eligible rows are `(m,alpha,x,p,S)=(22,68,32,66,-147807)`, `(60,182,87,180,-2947590)`, and `(100,302,145,300,-13588650)`; larger negative rows do not expand the theorem's graph class.

## Finite evidence and provenance reconciliation

The F-origin non-residual certificate must use its pinned JSON graph, whose edges are `{0-3,1-6,1-9,2-6,3-5,3-7,3-8,4-6,6-7}`. The AF subset audit reports `I(T)=(1,10,36,62,61,37,13,2)`, `(alpha,x,p)=(7,3,5)`, six favorable tags and terms `(-15,-13,-13,-15,-15,-1)`, yielding **`S=-72`**. Two maximum sets are `{0,1,2,4,5,7,8}` and `{0,2,4,5,7,8,9}`; leaf `9` is absent from the first. The different edge list printed in the F2 origin prose is residual, with `S=-62`, and cannot support the non-residual claim. AF gives an explicit relabeling showing that the F3 `S=-72` certificate is the **same structural tree**, not a second independent obstruction. Both are negative-sum scope witnesses, not primary counterexamples.

The U-origin mixed certificate is a separate 12-vertex tree with edges `01,12,23,04,45,46,47,08,89,8(10),8(11)`. AU's pinned replay gives `I(T)=(1,12,55,127,167,138,72,22,3)`, `(alpha,x,p)=(8,4,6)`. Leaf `3` is selected and non-residual, with selector `-25` and term `-11`; six selected residual star leaves each have selector `-17` and term `-32`. The complete sum is `-203`. Its three listed maximum sets verify the mixed classification. AU's replay copies a critic's code, so byte equality is reproduction, not a third independent method.

Other exact bounded findings remain at their stated scopes: `P60` has `(alpha,x,p,S)=(30,17,28,-331702)`, and `P501` has `(251,139,249,-322849250)`; these are two path instances, not a path-family proof. The F1 `T_22` marked leaf at **broader rank 34** has a positive selected term `212336130412243110`, but `alpha-2=66` and its rank-34 complete sum is `-498754180547001418536`. It defeats a rank-unqualified pointwise shortcut, not the frozen primary statement. At rank 66 the same tree's marked/star terms are `-2079/-2208` and its complete sum is `-147807`.

The AF correction to the exhaustive small-tree total is `280392` labeled Prüfer trees of orders 2 through 8, with **zero eligible** trees; orders 2 through 7 are also eligibility-empty. A source `n=1` row actually constructs `K_2`, while `K_1` is directly ineligible. The F2 seeded sample has 4560 draws, 3840 eligible, no positive complete sum; its family sweep claim is limited to `m=1..60` (59 eligible), despite a 100-row source file. The F3 seeded sequence has 1500 trees, 1466 eligible, no positive complete sum; its maximum sum is `-210` and maximum selected term `0`. The T-origin directed probe has 123 rows, 94 eligible, no positive eligible local or complete sum; three *ineligible* rows do have positive local terms. T2's six specified eligible fixtures have negative sums and no positive selected term; four order-260 Prüfer fixtures come from one continuous seed stream. The U-origin additional `m=75,100,150` rows and `m=120` row are family corroboration. These exact computations and seeded sequences are finite. The small exhaustive range offers no eligible sign tests, and no finite negative collection implies a universal bound.

## Every incoming ID, once

The statuses below are synthesis proposals. All 27 case-required IDs appear once; repeated family and identity statements are reconciled above rather than counted as independent general theorems.

| Incoming claim ID | Proposed disposition | Synthesis reading |
|---|---|---|
| `C1-CF-T2-TARGETED-T22-RANK` | `proposed_retained_narrowed` | Exact negative T22 target row and 123-row directed probe; three positive local probe rows are ineligible. |
| `C1-CF-T3-01` | `proposed_retained` | Exact negative `T_m` family formula; family only. |
| `C1-CF-U2-ELIGIBLE-MIXED-TAGS` | `proposed_retained` | One eligible mixed-tag 12-vertex tree, complete `S=-203`. |
| `C1-CT-F1-001` | `proposed_retained` | `T_m` eligibility for every `m>=2`, all tags selected, negative sum. |
| `C1-CT-F2-FAMILY-SIGN` | `proposed_retained_narrowed` | Family sign and eligibility retained with `g_star=3-3m-binomial(3m,2)`; the adjudication return's `3-6m` term is rejected. |
| `C1-CT-F3-01` | `proposed_retained` | Exact pendant-deletion and telescoping identities, with no sign. |
| `C1-CT-U2-T-FAMILY-FIRST-INTERIOR` | `proposed_retained` | Same `T_m` negative family theorem, not an all-tree theorem. |
| `C1-CU-F1-001` | `proposed_retained` | Same family selector/sum formula for `m>=1`; `m=1` is ineligible. |
| `C1-CU-T1-INDEPENDENT-FINITE-REPLAY` | `proposed_retained` | Exactly P60 and T60 negative target rows. |
| `C1-CU-T3-01` | `proposed_retained` | Same exact `T_m` family formula as CF-T3. |
| `C1-F1-001` | `proposed_retained` | Positive marked term only at off-target T22 rank 34; complete sum remains negative. |
| `C1-F1-002` | `proposed_unresolved` | Primary sign open; corrected 280392 small labeled trees are all ineligible. |
| `C1-F2-NEGATIVE-BOUNDED-SEARCH` | `proposed_retained_narrowed` | Exact 4560-tree sample, first 60 family rows and small census, with source range corrections. |
| `C1-F2-RESIDUAL-SCOPE-GAP` | `proposed_retained_narrowed` | Use the pinned non-residual JSON graph with `S=-72`; reject its mismatched prose graph as certificate. |
| `C1-F3-01` | `proposed_retained` | T22/T60/T100 negative target rows only. |
| `C1-F3-02` | `proposed_retained_narrowed` | The exact seeded 1500-tree sequence only, without a probability or census claim. |
| `C1-F3-03` | `proposed_retained` | The F2 non-residual witness under another labeling, `S=-72`. |
| `C1-T1-LEAF-BRANCH-IDENTITY` | `proposed_retained` | Exact all-rank leaf branch partition; no sign. |
| `C1-T2-ALG-IDENTITY` | `proposed_retained` | Exact `g+selector` and independence-number identities. |
| `C1-T2-ALPHA2-BUDGET` | `proposed_retained_narrowed` | Conditional equivalence to pointwise sign; budget inequality remains unproved. |
| `C1-T2-BOUNDED-POINTWISE-CHECK` | `proposed_retained_narrowed` | Six specified negative eligible fixtures only; copied evaluator and one RNG stream. |
| `C1-T3-01` | `proposed_retained` | Exact selector and support-fibre regrouping with leaf multiplicity. |
| `C1-T3-02` | `proposed_unresolved` | Unrestricted primary complete-sum inequality remains open. |
| `C1-U1-PRIMARY-INTERIOR-AGGREGATE-STATUS` | `proposed_unresolved` | Same unrestricted primary status, open. |
| `C1-U1-SUPPORT-FIBRE-POLYNOMIAL-IDENTITY` | `proposed_retained` | Exact branch products, selector and multiplicity, all integer ranks. |
| `C1-U2-LOCAL-TOPSHELL-REDUCTION` | `proposed_retained` | Exact tagged-shell and per-leaf residual split; no count comparison. |
| `C1-U3-EXACT-COUNT-OBSTRUCTION` | `proposed_retained_narrowed` | Exact `A_p-A_(p-1)` identity; “obstruction” means only an unclosed implication, with no novelty claim for family rows. |

## Closeout and useful next obligation

There is **no centrally decisive exact Lean candidate with a closed dependency chain for the primary claim** in these adjudications. The deletion, support-fibre and tagged-shell identities have closed elementary proofs and could be formalized as infrastructure, and the `T_m` family has a closed informal coefficient proof, but none resolves the unrestricted sign or supplies a positive complete-sum witness. Nominating any of them as a primary Lean success would confuse a reduction or restricted example with the target. The next mathematical obligation is a tree-wide, eligibility-sensitive comparison of `A_p(T,p)` with `A_(p-1)(T,p)` that preserves strict selection and every original leaf tag, including mixed residual classes; alternatively, construct and independently verify an eligible positive **complete** sum with exact graph, coefficients, first descent, selectors, and all terms.

For reproduction from the run root, the admitted adjudication audit commands are `python3 cycles/cycle-1/C1-AF/audit.py > scratchpad/C1-SYNTHESIS/af-replay.json` and `python3 cycles/cycle-1/C1-AU/independent_audit_copy.py > scratchpad/C1-SYNTHESIS/au-replay.json`; compare their JSON values with the corresponding case-pinned adjudication JSON. The AF script also checks its own larger pinned input set; synthesis did **not** execute it or inspect that set. The quantified family proof is the displayed coefficient argument; sampled replays are not substitutes for it. No owned background job was started, and all synthesis writes completed before return.
