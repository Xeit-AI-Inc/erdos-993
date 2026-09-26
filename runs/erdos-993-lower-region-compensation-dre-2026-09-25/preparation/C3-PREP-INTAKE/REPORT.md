# C3-PREP-INTAKE — proposal to the controller

## Boundary and result

I read `control/C3-PREP-INTAKE-BRIEF.json` first and recomputed SHA-256 for all 34 listed sources; every hash matched. I used only those sources and this scratch. `IDENTITY-REVIEW.json` records an explicit `not_same_claim` decision for each of the 3 proposed identities against each of the 415 current r29 keys (1,245 decisions), plus a separate 92-row transitive-refutation crosscheck. There is no exact key or statement collision. The 92 refuted keys and statements agree with r29, and all remain REFUTED. Three refuted scopes (`E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`, `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`) have additional r29 scope notes; use the current r29 wording, not the shorter transitive-list wording.

**Proposed gate:** identity distinctness passes for all three. Prospective **OPEN** intake passes for the changed weighted-Hall claim and the exact pointwise shell claim. Evidence-backed intake of the rank-at-most-seven consequence fails on this packet until its direct census manifests and the scheduled C2-F1 disposition are pinned and reviewed. No proof promotion or refutation award passes here. The primary lower-region aggregate and governed `E993-BETA-AGG` remain unresolved; six cycles and fixed worker models remain as authorized.

## Exact identity decisions and refutation fences

| Proposal | Closest registered keys | `not_same_claim` reason |
| --- | --- | --- |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | Every-cut clone saturation is a sufficient assertion stronger than the scalar selected sum. The scalar inequality alone does not imply Hall cuts. |
| Same | REFUTED `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-R23-LITERAL-DELETE-ONLY-HALL`, `E993-R23-TAG-CLOSED-CUT-HALL`, `E993-R23-HOT-TAG-SINGLETON-HALL`, `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG`, `E993-C3-COMPLETE-TAG-DEFICIENCY-EQUALS-CONTRIBUTION` | Old literal edges retain tag compatibility and project to deletions; the new graph completes clone fibers and adds actual non-subset two-for-one outputs. The old cut and local-sign counterexamples retain their verdicts. |
| Same | OPEN `E993-R19-FIXED-GAMMA-HALL`, `E993-R19-R2-HALL-UNIVERSAL`, `E993-BETA-AGG` | Governed `RTree` data and old relations have no proved ordinary-to-governed bridge here. |
| `E993-FIRST-ORDER-SHELL-POINTWISE-EARLY-DESCENT` | OPEN `E993-LOWER-REGION-FIRST-ORDER-SHELL` | The registered claim is the favorable selected **sum** with the strict alpha guard. The proposal gives **each** original leaf's sign at `n=2p+2`, with early descent and no alpha/favorability guard. |
| Same | OPEN `E993-ORDINARY-LEAF-ORDER-BAND`; VERIFIED `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` | The first stops at `n<=2p+1`. The second uses `3p>=2alpha+1`, while the proposed shell also covers ranks below that threshold. |
| Same | REFUTED `E993-BETA-TARGET`, `E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE` | The former is an unrestricted governed pointwise claim. The latter is a graph cover-three strict sign at order `2r+3`; the shell proof needs the larger parent order `2(p-2)+6` and ranks through `p-2`. Neither exact counterexample falls under the proposed assertion. |
| `E993-LOWER-REGION-AGGREGATE-RANK-LE-SEVEN` | OPEN lower-region and broader r23 ordinary aggregates | This is their strict lower-region complete sum restricted to `p<=7`, with a census-dependent proof route. It is neither the all-rank target nor a separate pointwise statement. |
| Same | OPEN ordinary-leaf order band and first-order shell; VERIFIED r27 `M(1..5)` census | These are proper order slices or order-bound inputs, not the full rank-limited selected sum. |
| Same | VERIFIED r29 high-tail aggregate | The guards `3p<2alpha+1` and `3p>=2alpha+1` are complementary. |

The registry's other keys concern different graph domains, coefficient statistics, ranks, residuals, local terms, conditional reductions, or bounded instances; the evidence matrix ties each actual key and status to its individual decision. A `not_same_claim` decision says only that the proposed exact assertion is not the registered assertion. It does not establish truth, novelty, or counterexample absence. In particular the r29 boundary record has positive **local** terms below the high-tail guard, without a positive complete eligible sum or an early-descent shell counterexample.

## Independent mathematical scope audit

**Changed relation.** With the original strict `F(T,p)` held fixed, adjoining each selected leaf `v` bijects the `H_v` independent `j`-sets meeting `W_v` with the `(j+1)`-sets counted by its incidence in `w_F`. Summing over distinct leaf tags, including shared supports, gives

`S(T,p) = sum_{|B|=p+1} w_F(B) - sum_{|D|=p} w_F(D)`.

The draft's two-for-one move removes *exactly* the two occupied neighbors of an absent `s` and inserts `s`; the output is independent, drops rank by one, and is not a subset of `B`. Complete clone compatibility also adds deletion arcs unavailable to the old tagged relation. Thus a saturating integral flow implies `S<=0`, but total capacity alone cannot establish every Hall cut. The supplied positive-weight order-14 arc `B={1,3,5,8,9,10,11}` to `D={0,3,5,8,9,10}` is a concrete non-deletion move with weights 3 on both ends. The independent orbit audit validates switch saturation for the three specified `T_m` cases; the p6 audit checks 241 saved literal flows (33,426 positive arcs), relative to its pinned census. These are finite certificates, not a universal theorem. The old T22 center-free deletion deficit is preexisting refuted-mechanism evidence; its changed-relation flow is reported feasible. For `CB(8,92)`, the supplied negative *lower bound* on a cut deficit comes from an upper envelope of neighbors and decides neither a deficient cut nor feasibility. The switch review's isolated sentence saying the equivalence “proves no flow exists in general” conflicts with its detailed conclusion; the listed reading note correctly limits it to “does not prove universal existence.”

**First shell.** I find the candidate proof mathematically coherent at its stated informal scope, conditional on the exact first-wide graph theorem recorded by the listed audit. For a graph `G` of order `2k+2`, `k>=2`, with cover number at least 3 and a nonisolated mark, partition marked sets by first mark. Every residual deletes at least two vertices. At order at most `2k-1`, independent-set incidence gives `i_k<=i_(k-1)`. At exact order `2k`, if the residual had at most one edge, the other deleted vertex together with at most one residual endpoint would cover `G` with two vertices. Therefore it has at least two edges and the first-wide sign applies at `r=k-1`. This handles an isolated *later* mark as well as a nonisolated first mark.

For a shell parent `n=2p+2`, a cover of size at most 3 can be enlarged to 3, leaving an independent outside set of size `2p-1`. Its exact cover-intersection partition and the Catalan floor yield, at **every** `0<=r<=p-2`,

`Delta_r(T) >= E(2p-1,r) - 3 Cat_(r-1) - 3 Cat_(r-2) - Cat_(r-3) > 0`.

Here negative Catalan indices are zero; a shifted binomial difference at `-1` is actually `1`, so it causes no negative exception. The endpoint margins at `r=0,1` are 2; for `r>=2`, `E(2r+3,r)>=2 Cat_(r+1)>=8 Cat_(r-1)` while the subtraction is at most `7 Cat_(r-1)`. Hence early descent excludes a three-cover. For each original leaf, any two-cover of `H=T-{v,s}` would extend by `s` to a three-cover of `T`; consequently `H` has cover number at least 3. Connectivity places a nonisolated `W=N_T(s)\{v}` mark in a nontrivial component of `H`. Apply the marked graph lemma at `k=p-1` to get each term nonpositive. This proof needs the prior first-wide result at **exact** cardinality and at least two edges. I did not inspect or build the saved Lean module, because it is outside this packet. The listed formal intake also reports 31 duplicate declaration names among three saved snapshots; collision-free extraction, bridge lemmas, a new Lean build, and terminal contract review remain future work. No formal award follows from this audit.

The C2 synthesis correction is substantive: an isolated second mark at shell order leaves a second possible `2k` residual. The valid older first-mark bound has both `L_root` and `L_iso`, and needs a fixed-selector global budget to prove the sum. The candidate cover proof bypasses that unpaid budget by ruling out every positive boundary residual for eligible shell trees. Do not reinstate the rejected first-root-only classification or claim that C2 alone closed the shell.

**Ranks at most seven.** The composition is arithmetically sound if its cited order maxima and censuses are complete. For nontrivial trees, `Delta_0=|T|-1>0`, so eligibility implies `p>=3` and `x<=p-2`. Since `Delta_x<0`, the r27 forest maxima `M(1..5)=4,8,11,15,18` bound parent orders at `p=3,4,5,6,7` by `4,8,11,15,18`, respectively. The ordinary-leaf order band `n<=2p+1` covers every eligible `p=3,4,5`; residual orders are exactly `p=6: n=14,15` and `p=7: n=16,17,18`. The cited residual counts are `240+1=241` and `1696+2955+340=4991`, all with negative complete sums according to the listed composition and C2 synthesis. The p6 switch audit rechecks 241 rows but explicitly does **not** independently generate the census; it verifies a stronger flow only for those rows. This packet lacks the direct n17/18 census instruments and the eventual C2-F1 adjudication. Thus I can check the logical partition and source-reported counts, not independently certify full residual coverage or award a universal rank-limited theorem. Every eventual statement must retain bounded-census dependence; the formal rank ceiling does not upgrade a census to a kernel theorem.

## Recommended Cycle3 allocation amendments

Keep six T, six F, six U routes, their 36 cross-orientation critics, three adjudicators and one synthesis. Send a common frozen intake only after controller review. The direct target in every route remains the strict lower-region **complete** original-leaf sum; a Hall failure is a separate mechanism result.

| Lens | Concrete amendment and minimum usable output |
| --- | --- |
| T1 | Use the audited shell lemma as a pinned premise; target `n>=2p+3` with a new selector-dependent inequality or an explicit obstruction. Do not repeat its 13-step audit. |
| T2 | State a nontrivial sufficient family of weighted Hall cuts for the changed relation and prove it from tree structure; include clone capacities and all actual switches. |
| T3 | Give an actual cross-support injection, exchange path, or capacity-preserving obstruction at fixed `F`; a qualitative Morse analogy is insufficient. |
| T4 | Start at `n=2p+3`; classify its positive marked residual shapes and quantify the remaining cover-three/four case. The shell itself is already an informal proof candidate. |
| T5 | Derive coefficient bounds for the full `T_m` selected sum at all eligible parameters from its displayed polynomial; verify `x`, alpha and selector rather than assuming log-concavity. |
| T6 | Produce a rooted recurrence with an invariant that transports `x`, every original selector decision and the signed deficit; test a root change on exact small examples. |
| F1 | Test the changed literal flow on the cited 4,991 p7 residual rows only after pinning the adjudicated census; output the first exact deficient cut if found, otherwise a bounded certificate summary. |
| F2 | Decide the actual `CB(8,92)` switch neighborhood or flow, then test a larger perturbation; the current negative envelope deficit is inconclusive. |
| F3 | Search beyond the exhausted small orders with actual original-tree encoding, terminal `x`, complete `F` and full `S`; distinguish cut failure from `S>0`. |
| F4 | Test which shell hypotheses are necessary using actual trees with the dropped guard and exact local terms; a star that misses early descent is not a shell counterexample. |
| F5 | Build heterogeneous support-capacity cuts with exact weighted neighbor sets; report both cut deficit and independent complete aggregate. |
| F6 | Under growth/gluing, recompute every old and new leaf's strict selector and original support; seek a full eligible positive sum, not a persistent local term. |
| U1 | Use the 415-by-3 identity table and all 92 refutation fences; record only genuinely new edges and never reverse an old verdict. |
| U2 | Freeze the order partition above and obtain direct p6/p7 census manifests, selector conventions, complete class counts and C2-F1 disposition before rank-seven evidence intake. |
| U3 | Maintain the exact marked A/B/C and cover proof DAG and collision-free formal bridge plan; any future formal award requires a separate authorized Lean verification. |
| U4 | Derive a restricted cut family with a proof that it suffices for every upper subset, or exhibit a cut outside it; an LP dual restatement alone is not progress. |
| U5 | Turn `x<=p-2` into a quantitative fixed-selector budget at the next order, retaining all earlier ranks; state each missing implication. |
| U6 | Require a concrete rank-filtered relative complex or cross-support capacity lemma with checked hypotheses and a test on known refuted local-sign controls; otherwise redirect to U4/U5. |

The largest mathematical opportunities are T2/T3/U4/U5 and falsification of their exact sufficient mechanisms by F2/F3/F5. T1/T4 should spend no cycle repeating shell analysis. U6 needs a concrete deliverable before dispatch. All routes may return a partial theorem or obstruction at a sharply stated scope.

## Intake recommendation and limits

1. **PASS, proposed OPEN registration:** weighted-Hall successor with the draft's complete clone-pair deletion and exact two-neighbor switch relation. Record its implication to the scalar aggregate and its non-equivalence to every old tagged Hall claim. Ask for a fresh larger actual-tree falsification attempt; the known T22 obstruction is already spent.
2. **PASS, proposed OPEN registration:** pointwise early-descent first shell at `p>=3`, `n=2p+2`. Its informal proof may be carried as a candidate, conditional on the exact first-wide dependency. Do not register an unrestricted pointwise claim or mark this one formally verified.
3. **FAIL current evidence-backed intake:** rank-at-most-seven aggregate as a reviewed consequence. Its logical reduction is clear, but this bounded packet does not contain the direct p7 census and C2-F1 adjudication needed to certify the residual cases. A claim may be recorded as an OPEN hypothesis with `bounded_computation` dependency labels after those pins are admitted; no universal proof grade is justified by the current materials.

No expensive census, full flow solve, Lean run, external literature import, source edit, registry action, or other agent was used. Source-reported finite results were assessed at their stated boundaries. A positive local term, a failed sufficient Hall cut, and a negative bounded census do not decide the unrestricted primary.
