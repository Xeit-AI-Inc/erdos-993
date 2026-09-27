# Orientation Adjudication

**Seat:** Stage 5 adjudicator, orientation **T** (prove), Cycle 3, r30 (Erdős #993; correctly weighted mixed-boundary
transport for the remaining ordinary-tree favorable-leaf aggregate). Date 2026-09-26.
**Portfolio:** `T1` (`C3-T-01 CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION`), `T2` (`C3-T-02 GENERAL-SECTOR-SELF-COVERING`), and
their critiques `C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem (memory, decisions, logs,
conversations, modules, skills, operations).

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

**Dispatch and capsule.**

- **Dispatch.** `control/dispatch/c3-stage5/DISPATCH-ADJ-T.md`. I recomputed its SHA-256 before reading it:
  `6c04ffb7779dbe1cde5291bac718d4e9997c9ab9eb5156f4d78f506ca3190ef5`. It matches the wrapper's value.
- **Capsule seal.** `control/c3-adjudicator-capsules/T-PACKET-MANIFEST.json`, recomputed as the SHA-256 of the key-sorted
  compact JSON with `seal_sha256` removed and no trailing newline:
  **`da60346e94630deb9f6ddd13f60c92d3b324a2e96b185cf23351598300c95edd`**. It matches.
- **Capsule members.** All 20 match their recorded bytes and SHA-256 (`scratchpad/c3-adj-T/seal_check.py`).

**Stage packet seals.** I recomputed each inner seal the same way (`stage_seals.py`).

| Manifest | Recomputed seal | Members | Binds |
|---|---|---|---|
| Stage 2 | `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` | 1,051 | (the value every seat cites) |
| Stage 3 | `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797` | 35 | T1 return `f7da309f…`, T2 return `b3256e40…` (both match) |
| Stage 4 | `25f6f51a07ff8427379ef50c03c5e172dc260cafa72f1def8afb6dc67424d495` | 53 | the four T critiques (all match the capsule digests) |

**Admissions.**

- Stage 3 admitted 6 of 6 returns with 0 findings. Both T returns carry `headline_resolved: no`.
- Stage 4 admitted 12 of 12 critiques with 0 findings. All four T critiques carry verdict `retained_narrowed` and
  `headline_resolved: no`.
- `control/SOURCE-DIGESTS.json` matches its capsule digest. I read no `sources/` file, so no source entry needed checking.

**Inventoried scratch.** I checked 100 artifacts listed by the two returns and four critiques against their stated
digests, with 0 mismatches (`digest_check.py`). C-T2-U lists 8-hex prefixes for its non-library files, and I matched
those as prefixes.

**Identities and models.**

- Returns: both report `claude-sonnet-5` (chartered sonnet/xhigh).
- Critics: all four report `claude-opus-5-5[1m]` (chartered opus/medium).
- This agrees with controller fact CF-4.

**Read-boundary disclosures from the portfolio, weighed without penalty.**

- **T1.** A boot-order deviation, plus nine non-recursive `ls` calls inside `cycles/`.
- **T2.** One `ls scratchpad/` (names only).
- **Critics.**
  - C-T1-F killed a harness-backgrounded job by literal PID `88718`; none of its output was used.
  - C-T1-U ran a single-file `grep` on its brief.
  - C-T2-F ran two name-only `ls` calls above its grant and read one T2 output in place before copying it out.
  - C-T2-U ran one `ls` on `c3-T2/`.
- **Process defect in T2's replay** (found by both T2 critics). T2's scripts hard-code `sys.path` to `c3-T2/`, so its
  "copy-out-first" replay imported the original modules. The files are byte-identical, so no number changes, but the
  replay-isolation claim is qualified.

**My own read-boundary disclosures.**

1. **Harness context.** The host injected the project `CLAUDE.md` and the auto-memory index into context before my first
   action. I did not open either file, and neither is evidence here.
2. **Order.** I verified the dispatch digest, read the dispatch, then booted, as the wrapper directed. The dispatch's own
   text says to boot first. I also created my scratch directory before reading the capsule.
3. **Harness spill.** The harness saved the T1 return's display output to a tool-results file outside the run root, and I
   read the return through that file. Its content is the capsule member (digest-verified in place).
4. **Listings and in-place reads inside the grant.** One non-recursive `ls` of eight granted scratch directories
   (`c3-T1`, `c3-T2`, `c3-crit-T1-F`, `c3-crit-T1-F/own`, `c3-crit-T1-U`, `c3-crit-T2-F`, `c3-crit-T2-U`,
   `c3-crit-T2-U/own`), names only. Read-only `head`, `wc` and single-file `grep` on `c3-T1/out_gap_probe.txt`, two
   T2 scripts and two T2 outputs. I executed no seat or critic script. My replays are my own code, so no copy-out was
   needed.
5. **Not read.** The controller replay files `control/controller-facts/CF-REPLAY-c3*.json` and the Stage 3 disclosures
   addendum (both are referenced by CF-0 and CF-2 but are not capsule members). Also not read: `sources/`, either
   registry, any other orientation's portfolio or adjudication, any synthesis, any other experiment root, the network.
6. **No installs, no Lean.** No background job was started, so none was running at the final write.

## Route-by-route decisions

Paired-critic disagreements are resolved claim by claim. Where the critics concur, the concordance and my replay are
recorded. "Critic-attributed" marks advances derived at Stage 4. Every such advance is STATED and needs an isolated second
read before registration.

### T1 — `C3-T-01 CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION`: **retained_narrowed**

**T1-a. Choke-forest model (Step 1).** For r-free sources, `w_F(B)` is the number of present private leaves whose choke is
present, because `W_{c_ij} = {u_i}` and `W_v = {r}`. Sector members have weight 1; R0 members have weight 0.
- Both critics confirm it on literal instruments.
- My rows replay is consistent: WID holds at every eligible rank, using this class formula on one side and literal DP on
  the other.
- **Retained, `proved_informal`** (elementary).

**T1-b. Lemma 2.1 (the ternary-leg threshold).**
- The statement is correct.
- Both critics find it is the (NM) inequality `|∂X| ≥ |X|·t/(2(N−t+1))` on `I(N·K_2)`, plus the threshold arithmetic and
  whole-layer tightness.
- T1's distinguishing premise, "the sector is non-uniformly weighted", is **struck**. Sector weight is identically 1
  (SEMANTIC-CONTRACT §1.2), and T1's own `verify_model.py` confirms it.
- **Ruling:** not a new key. At most a corollary line on (NM).

**T1-c. Lemma 2.2.** Classical LYM rescaled by the rank weight; both critics concur. **Correct; not a new key.**

**T1-d. q = 1 ratios and the 82.8% coverage.**
- T1's own evidence is struck for fidelity. `F` is hard-coded as all leaves, and no script asserts
  `supply − capacity = S` (both critics; ruling 24; SOLUTION-CONTRACT §3.3).
- The numbers are re-backed on both critic instruments (`bounded_computation`).
- My own instrument independently re-establishes the fidelity basis at all 177 eligible ranks. `F_p` = all leaves is
  derived from `Δ_p(T−v)` and `Δ_p(T−c)`, and WID is asserted from independent sides.
- The 82.8% figure itself was not recomputed by me. It is superseded (T1-f).

**T1-e. Certification literals.**
- "26 (N,t) pairs" is **struck**; it is 23. Both critics say so, and I counted 23 result lines in the shipped
  `out_gap_probe.txt`.
- "Genuinely new elementary technique" is **struck** as to novelty.
- "bounded_evidence" used as a grade (C-T1-F) is a verdict term, not a §4 grade; noted.
- The `gap_weight.py` threshold-0 treatment of `N = 0` is harmless, because those strata are covered by Lemma 2.2 at
  these rows. Both critics concur.

**T1-f. "The middle t-range gap needs switch arcs or a joint argument".** **Refuted as a network claim** by the concordant
critic advances (C-T1-F A1/A2; C-T1-U A-6). Joint deletion (in-choke-leaf deletions plus leg deletions) closes it.

**T1-g. "Capacity may be double-claimed across covered strata".** **Unfounded.**
- Both critics show the covered-strata certificates are pairwise target-disjoint.
- The only possible collision is with `t = 1` strata, which Lemma 2.1 never covers.
- C-T1-F states the threshold is at least 6 at these rows; C-T1-U states at least 2 in general. Both are correct at
  their stated generality.

**T1-h. (CF-HALL), (O1), (O2) "not proved".** Correct at the route's own evidence. (CF-HALL) and (O1) are superseded by
T1-A2 below. (O2) is narrowed below.

**Critic-attributed advances on T1's object**

**T1-A1. Mark-clone / tag-lift reduction (C-T1-F A1; the same reduction derived independently as C-T1-U (TL)).**
- **Construction.** Take an r-free `(p+1)`-source `B` and an active private tag `x` (its choke `u_i ∈ B`). The pair
  `(B, x)` corresponds bijectively to rank `j = p − q` of `P_q = B_{qd−1} × Λ^{d(m−q)+1}`, where:
  - `Q` is the in-choke set, with `|Q| = q ≥ 1`;
  - `Λ` is the 2-atom claw (for a leg: ∅, `b` or `c`; for the arm: ∅, `s` or `v`, with `v` inactive when `r ∉ B`);
  - deletions that keep `x` and every choke are exactly the cover relations of `P_q`.
- **Transport.** Cover arcs between types `(a, j−a)` and `(a−1, j−a)`, and between `(a, j−a)` and `(a, j−a−1)`, are
  biregular. So the type-symmetric flow is a transport on a path.
  - It is nonnegative iff, for every `a`: `r_j·T_{<a} ≥ r_{j−1}·S_{<a}` and `r_{j−1}·S_{≤a} ≥ r_j·T_{<a}`.
  - With `ρ_q = r_j / r_{j−1} ≤ 1`, every source clone sends 1 and every target clone receives `ρ_q`.
  - Summing over `(Q, x)`: every r-free source `B` sends `w_F(B)`, and every r-free target `A` receives
    `ρ_q·w_F(A) ≤ w_F(A)`. Sector and R0 targets receive nothing.
- **My own check by hand.**
  - The bijection holds: `N(x) = {b_ij}`, and `b_ij ∉ B` because `u_i ∈ B`. `r ∉ B`, so the arm is a free 2-atom
    factor.
  - The biregular degrees are `(a, n1 − a + 1)` on Boolean deletions and `(j − a, 2(n2 − j + a + 1))` on ternary
    deletions.
  - The path conditions are exactly the prefix conditions of a path transport. A saturating fractional flow gives
    (HALL-COND) for every `X`.
- **Grade: `proved_informal`, critic-attributed (C-T1-F; C-T1-U concordant), STATED.**
- **Hypotheses consumed.** The literal CB tree, with connectivity and acyclicity checked separately in all three
  instruments. `F ⊇` all private leaves. The rank `p`. The criterion. Eligibility is not needed for the lemma itself.

**T1-A2. (CF-HALL) and (O1): (HALL-COND) for every `X ⊆ I_{p+1} ∖ sec`, deletion arcs only, at every eligible `p` of
`CB(8,86)`, `CB(8,89)`, `CB(8,92)` (177 ranks).**
- **Replay.** My own implementation of the criterion (`adj_clone_criterion.py`, independent code) holds at all 177 ranks.
- **Worst `ρ` is always at `q = 1`, at the first rank,** with exact fractions identical to C-T1-F's:
  - `CB(8,86)/460`: `460421124882845/462938713343604`
  - `CB(8,89)/476`: `1698319298589907/1707291739633300`
  - `CB(8,92)/492`: `4838946572060835/4863675235331932`
  - The largest `ρ` over the window is `0.99491564`.
- **Literal validation.** On 9 small CB trees at every rank (literal layers, literal `w_F`, literal (D) arcs, Dinic;
  `adj_literal_validate.py`):
  - the criterion fired at 26 instances;
  - it was never unsound for the r-free subnetwork;
  - it was never unsound for the full deletion network whenever the sector condition also held.
- **Grade: `computer_assisted`, critic-attributed (C-T1-F primary), STATED; replicated by the adjudicator.**

**T1-A3. Full (HALL) with deletion arcs only at 174 of the 177 eligible ranks (C-T1-F A3).**
- **Sector piece.** Sector members are `{r, v} ∪ C` with `C` of rank `K = p − 1` in `{∅, b, c}^{dm}`, all of weight 1.
  Their deletion graph onto sector targets is biregular with degrees `K` down and `2(dm − K + 1)` up; this is the (NM)
  double count. The uniform flow therefore saturates the sector into sector targets whenever `K ≥ 2(dm − K + 1)`.
- **Combination.** The A1 flow never touches sector targets, so the two flows add.
- **Replay.** I reproduced the rank lists: the sector condition fails only at `p = 460, 476, 492`, so 56 + 58 + 60 = 174
  ranks are certified.
- **Grade: `computer_assisted`, restricted scope, critic-attributed (C-T1-F), STATED.** If registered it is a SEPARATE
  key; (HALL) stays OPEN.
- **Fence (controller fact CF-T5, not replayed by me).** Switch-necessary rows exist elsewhere, including a non-CB tree of
  order 1427 from the F portfolio. So A3 is rank-specific and never a "deletion arcs suffice" claim beyond its 174
  `(T, p)`.

**T1-A4. The first ranks (C-T1-F A4; C-T1-U `secv_prior`).**
- The aggregate slack figures (33.33× / 34.49× / 35.65×) are **priors, not evidence**.
- So are the switch-free-family ratios (16.52 / 17.07 / 17.61) and the "sector deficit ≈ 5% of V block-0 slack" figure.

**Adjudicator-derived extension (STATED at Stage 5; `computer_assisted`; needs an isolated second read).** The same
criterion together with the sector condition holds at `CB(8,108)` (eligible 577–648) and `CB(7,144)` (673–768):

| Row | Criterion holds | Max `ρ` | Sector fails at | Ranks certified (deletion arcs only) |
|---|---|---|---|---|
| `CB(8,108)` | all 72 ranks | 0.99739585 | 577 | 71 |
| `CB(7,144)` | all 96 ranks | 0.99851025 | 673 | 95 |

At every one of those ranks `F_p` = all leaves is derived and WID is asserted. The remaining ranks 577 and 673 are
exactly T2's (O3) rows.

### T2 — `C3-T-02 GENERAL-SECTOR-SELF-COVERING`: **retained_narrowed**

**T2-a. Proposition 2 and the G1 reduction.** Correct; both critics re-derive them. G1 needs only Proposition 2's
hypotheses: (A4), and star-forest witnesses outside `Q`. **Retained, `proved_informal`.**
- The word "private" means private **within the sector**. A `Q`-exit is also a deletion target of non-sector sources
  (both critics).
- Its scope is narrowed by T2-A1 below.

**T2-b. Proposition 1 (the weight formula).**
- It needs the unstated hypothesis **`P ⊆ F`** (both critics).
- The "unique attachment edge" justification is **false**: take the path `a–x–c–y–b` with `Q = {a, b}` (both critics).
- Proposition 1 survives, because attachment vertices lie in `N(Q)` and are therefore absent from every sector member.
- **Retained with `P ⊆ F_p(T)`, (A4) and (H-attach) stated on its face.**

**T2-c. The Corollary's general formula `max(0, (K − (|Q|−1)β)·[…])`.** **Struck outside `c = β = 1`.**
- C-T2-F: on `R*`, `φ = c|X| − β|∂X|`.
- C-T2-U: a counterexample where the formula gives 96 and the true deficit is 0 (`c = −2`, bracket `−48`). I checked the
  arithmetic.
- "Fully closed for any `|Q|`, `β`, `K`" is struck.

**T2-d. G2 and G2b.**
- G2 is a correct generic chain-measure LYM. It is not used downstream; both critics concur, and the grade-table phrase
  "G2b … from G2" is wrong.
- G2b is correct, one-directional and non-sharp.
- "Hundreds of subfamilies" is **114** (both critics).

**T2-e. G3 — the paired disagreement.**
- **Algebra.** Both critics find the same error. The correct rearrangement is `|Q|(1+q) − 4q ≥ Q_tot(3−q)`, which is false
  at `|Q| = 2`, `q = 3`.
- **Repairs reconciled.** C-T2-U uses `|N[Q]| ≥ 3` and gets `(q−3)(Q_tot−1) ≥ 0`. C-T2-F uses `|N[Q]| ≥ 4` and gets
  `Q_tot(q−3) + 4 ≥ 0`, or alternatively the slack from `k = p − 1 ≥ x + 1`. Both are valid: I re-derived each.
  - I adopt C-T2-U's form: its hypothesis is weaker, and it holds in every live instance (`r, s, v ∈ N[Q]`).
  - C-T2-F's form is the same theorem with a stronger but satisfied hypothesis.
  - "`k = p − 1`" in general should read `k = p + 1 − |Q|` (C-T2-F F-9). The `|Q| ≠ 2` cases are rescued by T2-A1.
- **Vacuity.** C-T2-F finds the residual layer `R*_k` empty at every eligible rank on every tested `t_min ≥ 2` row. C-T2-U
  calls T2's scale remark (`k_min = 702 > 517`) "agreed".
  - **Resolution: C-T2-F is correct.** At `CBstar(8,86,2)` I compute `n = 2153`, `α = 1463`, `x = 701`, window
    `[703, 975]` and `M = 688`, so `k ≥ 702 > M` and the layer is empty.
  - C-T2-U's arithmetic is true but shows nothing. T2's "real margin at the scale that matters" is **struck**.
  - My replay finds `R*` empty at every eligible rank on six rows: `CBstar(8,86,2)`, `(8,86,3)`, `(2,40,2)`, `(1,60,2)`,
    `(3,30,2)` and `(8,20,2)`. The minimum `k_min − M` is 4, at `(8,20,2)`.
- **Grade.** G3 stands at `proved_informal` **as repaired**, with `P ⊆ F`, (A4) and (H-attach) on its face. Its content is
  so far empty, and it is superseded by T2-A2 once that import is discharged.

**T2-f. G3's end-to-end check.** **Struck**: it was run at charter `p = 9`, which is not eligible (both critics agree).
- At the eligible `p = 10` both critics give the same corrected row: 404 sector members, supply 3368, deletion deficit 0,
  `F` = all 13 leaves, WID `74154 − 127390 = −53236 = S`.
- At that rank `R*` is empty.

**T2-g. Fidelity.** `F` is hard-coded in every generator, and no generator computes `S`. The return's sentence
"(WID) … asserted on every generator's own instances" is **false and struck** (both critics). Every G1/G3 row survives
only as an identity check for the stated `F`, never as a row of the charter network.

**T2-h. The §5 third-instrument table.**
- `n`, `α`, `x`, the first eligible ranks and the digit counts at `CB(8,108)/577` and `CB(7,144)/673` are reproduced by
  both critics and by my rows replay.
- `Z′`, `δ`, `λ₂` and `x₀` are rank-`k` arithmetic from these values.
- **Retained, `bounded_computation`.**

**T2-i. "No dead end for d = 1..8 (own exhaustive search)" — a certification disagreement.**
- C-T2-F strikes it as unbacked. I confirmed that `classify_states` is defined in `o3_shadow_experiment.py` but never
  called, and that no dead-end output is shipped.
- C-T2-U calls the fact "backed", but on its own `d = 2, 5` check, not T2's.
- **Resolution:** T2's computational certification is struck. The fact is true for every `d` by C-T2-F's two-line proof
  (CD-3), which I checked. Take a good state with an empty branch: if it has no `S`, extend by `L`; if it has at least two
  `S`, extend by anything; if it has exactly one `S`, it has no `L` (else it would be bad), so extend by `S`.
- **CD-3: `proved_informal`, critic-attributed (C-T2-F).**

**T2-j. The §6 small-scale shadow signal.**
- C-T2-U strikes it as evidence: all 6 trees have empty eligibility, which SEMANTIC-CONTRACT §1.1 forbids for reported
  instances.
- C-T2-F calls it "backed as shipped", never presented as target-scale evidence.
- **Resolution:** the output is authentic, but it carries **zero evidential weight** for (O3).

**T2-k. (O3) is not resolved.** Honest; both critics agree. It remains open.

**Critic-attributed advances on T2's object**

**T2-A1. CD-1 (C-T2-F) = L1 (C-T2-U): the collapse of G1's generality.** The two critics derived it concordantly and
independently.
- Under (A4), (H-attach), `M ≥ 1` and `T ≠ K_2, P_3`:
  - `F_Q ⊆ Q` and `K ≤ 2β`;
  - `c = K − (|Q|−1)β ≤ 0` whenever `|Q| ≥ 3`.
- The only case with a positive deficit is `Q = {r, v}` with a pendant `P_3` arm `r–s–v` (`N(s) = {v, r}`), `β = 1` and
  `K = 2`. That is the heterogeneous CB pattern.
- I checked each step.
- **`proved_informal`, critic-attributed (jointly), STATED.**

**T2-A2. CD-2 (C-T2-F) = L2 (C-T2-U): the exact heterogeneous sector deletion deficit.**
- **Statement.** In the live class with `P ⊆ F`, `q_i = t_i + 1` and `k = p − 1`:
  `max_X[Σ_X w − Σ_{N_D(X)} w] = max(0, e_k(q) − e_{k−1}(q))`.
- **Shared dependency.** Both critics rest it on the same classical product theorem (Harper 1974; Hsieh–Kleitman 1973),
  cited from memory and not a run source. That is **one shared undischarged dependency, not two independent proofs.**
- **Grade: `conditional`**, the §4 grade of a statement resting on an uncarried import. C-T2-U's label "proved_informal
  conditional" is reconciled to this.
- **Corroboration.**
  - My exact bipartite matching on 27 claw-product layers (7 `q`-tuples) reproduces the formula every time, including
    T2's heterogeneous fixed point `(3,4,5)`: 11, 35, 13.
  - C-T2-F's 81 abstract rows and C-T2-U's 21 tree rows also agree.
- It supersedes G2b/G3 as the exact criterion, `e_{p−1}(q) ≤ e_{p−2}(q)`.

**T2-A3. C-T2-U's analogue quotient signal.** `X''` is deletion-Hall at the last deletion-deficient rank `k*` on 19 of 21
small `(d, m)`. It is `bounded_computation` on analogues, with (LIFT) used at its stated hypotheses. **A prior for (O3), not
evidence at `m = 108/144`.**

## Cross-route reconciliation

**1. Where each route's object stands.**
- T1's object, the choke forest plus (O1), is **closed at the three rows at `computer_assisted`** by critic-attributed
  advances that T1 did not find. T1's own lemmas register nothing new.
- T2's object, the self-covering generalization, narrows to the heterogeneous CB pattern (T2-A1). Its exact deficit is
  T2-A2 (`conditional`).
- The two routes meet at one structure. The `{r, v}` sector is the only deletion-deficient source family on CB-pattern
  trees, and everything off the sector is carried by deletion arcs at the tested rows (T1-A2 plus the adjudicator
  extension).

**2. Where the remaining obligation sits.** C-T1-U places its sufficient residual (O2′) "at every eligible `p`"; C-T1-F
places it at the first rank only. **C-T1-F is correct** (T1-A3, replayed), so the open part of (HALL) at the three rows is:

> (HALL-COND) at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, with `F = F_p` (all leaves, derived), for every family
> `X` that meets both `sec` and the positive-weight V sources.

This follows from three inputs: T1-A2, the registered `computer_assisted` sector Hall at the three rows, and the repaired
(R-ii) (C3-ALLOCATION standing state).

Two sufficient forms are on record, and neither is necessary:
- C-T1-U's (O2′) restricts V sources to `v`-containing targets. That is stronger than needed, because each V source also
  has the `v`-free exit `B − v` of equal weight (S3).
- C-T1-F's reduced-capacity sector Hall is
  `|X| ≤ |N_D(X) ∩ sec_p| + (1 − ρ_1)·Σ_{A ∈ N_S(X)} w_F(A)` for every sector `X`.

At `CB(8,108)/577` and `CB(7,144)/673` the open part is larger: sector Hall under (D) ∪ (S) itself is (O3), and the
coupling comes on top of it.

**3. Two-instrument question (controller fact CF-T4).**
- **Same reduction.** A2 (C-T1-F) and A-6 (C-T1-U) rest on the **same** reduction: per-active-tag cloning with
  choke-preserving deletions. The bijection `(B, c) ↦ B ∖ {u_i, c} ∈ I(G_c)` is the `P_q` correspondence in other
  notation.
- **Different certifying criteria.**
  - C-T1-F: an explicit, self-contained type-path transport on `B_{qd−1} × Λ^{d(m−q)+1}` (arm merged; O, S and V in one
    poset).
  - C-T1-U: normalized matching of blocks `Λ^{d(m−1−j)} × B_1^{d−1+dj}` (O, S and V separated), via the imported product
    theorem, plus the rank monotonicity `N_{r−1} ≥ N_r`.
  - The differing minimum ratios (C-T1-U: 1.0099 for O, 1.0033 for S/V; C-T1-F: `1/ρ_1 ≈ 1.0055` merged) reflect the
    different slicing.
- **Standing.** The finite verification is replicated by two independent codes on one criterion (C-T1-F and the
  adjudicator; identical exact fractions) and corroborated by a distinct criterion (C-T1-U). The reduction lemma is one
  lemma, derived twice independently and checked by me by hand, so it is a single logical point. Its soundness is further
  supported by literal max-flow validation: C-T1-F on 69 instances, C-T1-U on 5 trees, and my 26 firing instances.
- The two-instrument rule governs cuts. For this positive `computer_assisted` record, the Stage 5 standing is as stated,
  and an isolated second read is still required.

**4. No cross-route contradiction on grades of record.** No Cycle 1–2 key is contradicted. Controller replay CF-T2(b) finds
sector deficits only at NON-eligible ranks, consistent with the registered CBstar key and with CD-2 (the formula is
rank-general; the deficits it predicts at eligible ranks are 0 on every tested `t ≥ 2` tree).

## Established results

**Fidelity first.** Every number below is computed with:
- the weight `w_F` (active tags, `W_v = N(s_v) ∖ {v}`);
- the relation (D), or (D) ∪ (S) where stated;
- `F = F_p(T)` derived at the original rank `p` (all leaves at every rank quoted);
- `x` computed through rank `α`, including the terminal difference;
- `supply − capacity = S` asserted from independent sides at every eligible rank of the five CB rows (my `adj_rows.py`:
  literal-graph DP for `q_v`; class-count generating function for the weighted layers).

Counts are **labelled** (independent sets of labelled trees). C-T2-F's "2,237 shapes" are CB-pattern parameter tuples, not
isomorphism classes.

**Exact theorems (informal)**

| # | Statement | Hypotheses consumed | Grade | Attribution |
|---|---|---|---|---|
| E1 | Mark-clone reduction: on `CB(d,m)` with `F ⊇` all private leaves, if at rank `p` and every `q ∈ [1, m]` `ρ_q ≤ 1` and the type-path inequalities hold, then there is a fractional flow saturating every r-free source with target load `ρ_q·w_F(A)`; hence (HALL-COND) for every `X ⊆ I_{p+1} ∖ sec` using (D) only | literal CB tree (`IsTree`: connectivity and acyclicity checked separately), finiteness; no eligibility; no invariance | `proved_informal`, STATED | C-T1-F (A1); C-T1-U (TL) concordant |
| E2 | Sector deletion NM: `sec_{p+1} → sec_p` is biregular (`K` down, `2(dm−K+1)` up), so it is deletion-Hall into sector targets iff `3K ≥ 2dm + 2` (`K = p − 1`) | CB tree; sector weight 1 | registered (NM) plus arithmetic; nothing new | (NM) key; C-T1-F |
| E3 | G1 self-covering reduction (Proposition 2; the `φ` identity; restriction to `R* = {w < K/(|Q|−1)}`) | (A4); star-forest witnesses outside `Q`; `|Q| ≥ 2` | `proved_informal` | T2 (narrowed) |
| E4 | CD-1 = L1 collapse: a positive sector deletion deficit requires `Q = {r, v}` with a pendant `P_3` arm, `β = 1`, `K = 2` | (A4), (H-attach), `M ≥ 1`, `T ≠ K_2, P_3` | `proved_informal`, STATED | C-T2-F / C-T2-U (joint) |
| E5 | G3, as repaired: `t_min ≥ 2` implies no deletion-deficient sector subfamily at any eligible `p` | E3, E4, `P ⊆ F`, (A4), (H-attach), (LB) at its registered statement | `proved_informal` (repair: C-T2-U form); content empty on every tested row | T2; repair critic-attributed |
| E6 | CD-3: the per-choke good (switch-dead) state poset has no dead end below the top, for every `d` | definition of `X''` | `proved_informal` | C-T2-F |

**Conditional**

| # | Statement | Condition | Grade |
|---|---|---|---|
| C1 | CD-2 = L2: exact heterogeneous sector deletion deficit `max(0, e_{p−1}(q) − e_{p−2}(q))` in the live class with `P ⊆ F` | normalized matching of `C_{q_1} × … × C_{q_M}` between consecutive ranks (Harper; Hsieh–Kleitman; not a run source) | `conditional`, STATED; C-T2-F / C-T2-U |

**Bounded computations** (attained horizons; the relation and the weight are stated in each row)

| # | Record | Relation | Grade | Attribution |
|---|---|---|---|---|
| B1 | (CF-HALL) and (O1): (HALL-COND) for every `X ⊆ I_{p+1} ∖ sec` at all 177 eligible ranks of `CB(8,86)`, `CB(8,89)`, `CB(8,92)`; max `ρ = 0.99491564` | (D) only | `computer_assisted`, STATED | C-T1-F (A2); C-T1-U corroborating (conditional on the product theorem); replicated by the adjudicator |
| B2 | **Full (HALL)** at `CB(8,86)`, `p ∈ [461, 516]`; `CB(8,89)`, `p ∈ [477, 534]`; `CB(8,92)`, `p ∈ [493, 552]` (174 `(T, p)` instances) | (D) only | `computer_assisted`, restricted scope, STATED; separate key if registered | C-T1-F (A3); replicated by the adjudicator |
| B3 | Full (HALL) at `CB(8,108)`, `p ∈ [578, 648]`, and `CB(7,144)`, `p ∈ [674, 768]` (166 instances) | (D) only | `computer_assisted`, STATED | **adjudicator-derived** (Stage 5) |
| B4 | Fidelity at five CB rows (`n`, `α`, `x`, windows, `F_p` = all leaves, WID, `S < 0` at every eligible rank; `Δ_x` / `Δ_{x−1}` digits 326/337/349/408/479 and 327/338/350/411/482) | — | `bounded_computation` | three instruments (C-T1-F, C-T1-U, adjudicator) |
| B5 | T2 §5 table at `CB(8,108)/577` and `CB(7,144)/673` | — | `bounded_computation` | T2; both T2 critics |
| B6 | `R*` empty at every eligible rank on every tested `t_min ≥ 2` row (C-T2-F: 304 small shapes and 74 family rows; adjudicator: 6 rows) | — | `bounded_computation` | C-T2-F; adjudicator |
| B7 | C-T2-U's `X''` analogue signal (19/21 at `k*`) | (D) | `bounded_computation` on analogues; a prior | C-T2-U |

**Compiled scratch declarations:** none in orientation T.

**Imported informal results used at their grades.**
- (NM): `proved_informal`, in E2.
- (LB) `E993-R27-FOREST-DESCENT-LINEAR-BOUND`: `formally_verified`, used at its exact statement in E5.
- The repaired (R-ii) and the Cycle 2 sector Hall at the three rows (`computer_assisted`): both used only in the
  obligation statement.

**Record corrections.**
- T1: "26" becomes 23; the sector-weight premise is struck; the novelty claims are struck.
- T2: the WID claim is struck; the G3 end-to-end row is struck and replaced by the eligible `p = 10` row; the "real margin"
  sentence is struck; "hundreds" becomes 114; the dead-end certification is struck (CD-3 replaces it); the Corollary is
  struck off `c = β = 1`.

**Open bridges.**
- The first-rank coupling at 460/476/492.
- (O3) at 577/673.
- A self-contained proof of NM for heterogeneous claw products (C1).
- Whether `x ≥ M` holds on every `t_min ≥ 2` CB-pattern tree (E5's vacuity).
- (H-attach) variants: `t ≥ 2` stars attached through a leaf.

## Rejected and narrowed mechanisms

**Rejected as new keys.**
- T1's `E993-R30-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD`: an alias of (NM); at most a scope note on it.
- T1's `E993-R30-CHOKE-IN-BLOCK-RANK-WEIGHTED-LYM-THRESHOLD`: classical LYM.
- T1's `E993-R30-CHOKE-FOREST-SAFE-STRATUM-DELETION-HALL`: superseded by B1. The 82.8% figure is a record of T1's method,
  not of the network.

**Refuted as a claim.** T1's "the middle `t`-range needs switch arcs" (T1-f).

**Narrowed.**
- T2's "arbitrary tree, arbitrary `Q`, general `β`, `K`" becomes the heterogeneous CB pattern (E4).
- The Corollary is valid only at `c = β = 1`, where it is the registered `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`
  restated.
- G3 is true only as repaired, and empty so far.
- G2 is a generic LYM, unused.

**Fences confirmed on every retained item.**
- Mechanism ≠ aggregate: nothing bounds `S(T, p)` except through the formal (WID) and FLOW⇒SIGN companion, and no
  (HALL) instance is promoted to the aggregate.
- Finite ≠ universal: B1–B3 hold at their stated `(T, p)` only.
- No RTree wording.
- No census value inside a proof. The E1 criterion is an exact finite check per rank; it is a hypothesis of E1, not a
  proof step.
- No closed region is re-proved: every rank lies in the lower region, and CB is not a settled family.
- No refuted mechanism is revived:
  - Every deletion-only statement is scoped to stated families and ranks, and the sector's own first-rank deletion
    deficit is on its face. So none of this is `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  - E1 is a fractional clone transport with capacity `ρ_q·w_F(A) ≤ w_F(A)`. It is not an injection, not a per-leaf unit
    map, and not an own-support rule. It never handles the arm tag `v`, whose sector deficit is exactly what stays open.
  - C-T1-F's request stands: the **second reader must check E1 against the registered text** of
    `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` and `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`. That text is
    outside my capsule.

## Lean readiness

No return or critique in orientation T authored or compiled Lean, so there are no fragments, no build logs and no
`#print axioms` outputs to confirm. (WID) is already `formally_verified` (governed award C1-LA1) at SOLUTION-CONTRACT §2's
statement. It is not an object of this cycle's T awards, and nothing in the T portfolio touches its Lean.

**Ruling: no award group in orientation T is contract-ready for the Cycle 3 Stage 7.** Per candidate:

| Candidate | (a) Complete informal proof, closed DAG | (b) Compiled fragments | (c) Named open nodes / why not ready |
|---|---|---|---|
| B1–B3 (full or partial (HALL) at specific CB ranks) | the reduction is complete; the verification is a finite check over integers of about 350 digits | none | a **bounded result never qualifies**; a kernel check of about `10^6–10^7` big-integer inequalities is outside the contract (no `decide` over an enumeration for a universal step) |
| E1 in abstract form (a type-path transport on `B_{n1} × Λ^{n2}` implies a saturating clone flow, plus the CB clone correspondence) | yes. DAG: clone bijection → type biregularity → path transport → fractional flow ⇒ (HALL-COND) | none | no Lean text; needs a CB-tree construction over `E993Transport` definitions and a product-poset correspondence. Formalizable, not started |
| E3 (G1) | yes. DAG: Prop 2 → private exits within sector → `φ` identity → removal monotonicity | none | no Lean text; needs (A4) and (H-attach) formalized on the frozen `activeWeight` / `transportRel` definitions |
| E4 (L1) | yes | none | as E3 |
| C1 (CD-2 / L2) | **no**: the NM import is undischarged | none | **smallest unproved lemma:** for every `X` in layer `k` of `C_{q_1} × … × C_{q_M}`, `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)` |

**Smallest unproved lemma for a T-orientation award of real weight.** Take the E1 criterion **uniformly**:

> For every `d ≥ 1`, `m ≥ 1` and every eligible `p` of `CB(d,m)`: `ρ_q ≤ 1` and the type-path inequalities hold for every
> `q ∈ [1, m]`.

This would follow from log-concavity of the rank sequence of `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}` and from the position of
`p − q` relative to its mode.

Proved informally, it would give a parameter-uniform restricted-scope theorem, a candidate for a SEPARATE key:

> (HALL) holds with deletion arcs alone at every eligible `p` of every `CB(d,m)` with `3(p−1) ≥ 2dm + 2`.

That statement is pure finite combinatorics with no census input, so it would be formalizable at a Cycle 4 Stage 7. It is
not ready now.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Material progress, on shipped and replayed evidence.**
- On the three switch-necessary `CB(8,·)` rows, the open part of (HALL) shrank from "(CF-HALL), (O1), (O2) at every eligible
  rank" to **the coupled sector-plus-V⁺ families at the three first ranks only**.
- Full (HALL) is established at 174 of 177 eligible ranks (B2, `computer_assisted`, critic-attributed). The adjudicator
  extends this to 166 more ranks of the two (O3) rows (B3).
- New lemmas at `proved_informal` or better: E1, E3 (narrowed), E4, E5 (repaired) and E6. C1 is `conditional`.
- This advance is **critic-attributed**. The routes' own contributions are E3, a corrected E5, and the T1 model. T1's
  proposed keys are aliases or classical.

**Stop gate.**
- No decisive event: there is no formal (HALL) award and no confirmed deficient cut.
- The plateau condition fails, because new `proved_informal` lemmas exist.
- The gate stays ARMED and is not triggered by this orientation.

## Headline assessment

headline_resolved: no
status: still_open

**(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: still_open.**
- There is no complete informal proof at full scope and no deficient cut.
- At this orientation's grade it holds at 174 specific `(T, p)` instances (B2; critic-attributed), plus 166 more
  (B3; adjudicator-derived), all `computer_assisted`.
- None of this is a universal statement.

**(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: proved.** It is `formally_verified` by governed award C1-LA1 and
unchanged here. It was asserted numerically at every eligible rank of five CB rows as a fidelity check, not as a
contribution.

**Outcome-B candidates in this portfolio.** Each is STATED and needs an isolated second read before any registration.

| Candidate | Grade |
|---|---|
| E1 (mark-clone reduction) | `proved_informal` |
| E3 (G1, narrowed) | `proved_informal` |
| E4 (L1 collapse) | `proved_informal` |
| E5 (G3 repaired) | `proved_informal`; empty so far |
| E6 (no dead end) | `proved_informal` |
| C1 (CD-2 / L2) | `conditional` |
| B1–B3 | `computer_assisted`, restricted scope |

**Primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: untouched and OPEN.

## Next-route allocation

**Exact remaining obligation for orientation T.** At `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, with
`F = F_p(T)` (all leaves, derived), prove (HALL-COND) for every family meeting both `sec` and the positive-weight V
sources. Then extend to `CB(8,108)/577` and `CB(7,144)/673`, where sector Hall under (D) ∪ (S) (O3) must be settled first.
Together with B1–B3, this would give full (HALL) at every eligible rank of all five CB rows.

**Route T-A — `CB-FIRST-RANK-COUPLED-ALLOCATION` (prove).**
- **Method.** Start from the E1 flow. It leaves residual `(1 − ρ_1)·w_F(A)` on every `q = 1` r-free target, which includes
  every sector switch image.
- **The overload to remove.** The uniform sector deletion flow overloads each sector target by the factor
  `2(dm−K+1)/K = (K+1)/K`.
- **The construction to find.** An explicit fractional repair:
  1. Switch-live sector sources shift an `ε`-share onto their `u_i`-switch targets. These are V-type, `q = 1`, with weight
     equal to the choke's `c`-count.
  2. That share is routed so as to unload exactly the sector targets whose up-neighbourhoods are dominated by switch-dead
     members (C-T2-U's redistribution lemma for targets with at most one switch-live up-neighbour).
  3. V sources may be rebalanced through their equal-weight `v`-free exits `B − v`.
- **Verification.** By exact summation over branch-type generating functions (no orbit enumeration), validated first on
  small CB rows by literal max-flow.
- **Could close in one cycle:** full (HALL) at all 177 eligible ranks of the three rows (`computer_assisted`; the first
  full-network Hall with switch arcs load-bearing on a whole tree), and possibly the two (O3) first ranks.

**Route T-B — `CB-FAMILY-UNIFORM-CLONE-TRANSPORT` (outcome B, parameter-uniform).**
- **Method.**
  1. Prove the E1 criterion analytically for every `CB(d,m)` at every eligible `p`, via log-concavity and the mode of the
     rank sequence of `B_{qd−1} × Λ^{d(m−q)+1}`. Extend it to the heterogeneous CB pattern.
  2. Determine exactly which eligible ranks fail `3(p−1) ≥ 2dm + 2`; on these rows only the first.
  3. Discharge C1's import, by a self-contained NM proof for heterogeneous claw products or an authorized classical
     citation, so the sector side is exact on the whole class.
- **Could close in one cycle:** a `proved_informal` parameter-uniform restricted-scope (HALL) theorem on the infinite CB
  family, "every eligible rank except the first (`3(p−1) < 2dm + 2`) ranks", registered as a SEPARATE key. It would be a
  pure combinatorial statement, suitable as a Cycle 4 Lean target on the frozen `E993Transport` definitions.

Low-priority residue, folded into T-B only if time allows: prove or refute `x ≥ M` on `t_min ≥ 2` CB-pattern trees (E5's
vacuity), and treat (H-attach) variants.

## Artifact inventory

All adjudicator scratch is under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-adj-T/`. It uses the
standard library only (`sys`, `json`, `math`, `fractions`, `itertools`, `collections`, `hashlib`), with exact integers
throughout. Every script was run with `python3 -B` in the foreground. No `__pycache__` was written, no background job was
started, and nothing was written under `sources/` or outside this scratch directory and this file.

| File | SHA-256 | Purpose |
|---|---|---|
| `seal_check.py` | `0785ff458debe12a37da493f16ed18d51f7f091d1658713631aeb1bec9918116` | capsule seal and 20 member digests |
| `stage_seals.py` | `d2c1106690652fd64a5a11a2c15658a8ab24d669d40ee958171eaa7e715d7d7c` | Stage 2/3/4 seals; binds the returns and critiques |
| `digest_check.py` | `071c15e92f0878750ceb5366dfae9f7f4566c404dbb240b19be5806ede630563` | 100 inventoried return and critic artifacts (0 mismatches) |
| `adj_lib.py` | `088b7ec2013f9c37cfe293428038033d6df5ed8d1b650535d07e6487fd59727f` | literal CB / CBstar builder; `IsTree` (BFS connectivity and union-find acyclicity, separately); forest DP; `x` through `α` |
| `adj_rows.py` | `5c067dab7e26235f4e8c87c779eea31c3e0518563f9cc29f57c4a5ad8ed18df3` | five CB rows: derived `F_p`; WID from independent sides at every eligible rank |
| `out_adj_rows.json` | `106518024ef363db6e842797825eb5635ddaea0de21069f60b13c06061aaddb0` | output of `adj_rows.py` |
| `adj_clone_criterion.py` | `8a570b37086fac16831d522341ee3d5bcbdb9e8a2fd08fd790cd249627be1401` | own implementation of the E1 path-transport criterion and the E2 sector condition |
| `out_adj_clone_8x86.json` | `588c8e871a0641380d9a2cf98c86cfb1fecb679f614eed80c73589cc8b701763` | `CB(8,86)`: 57 ranks, criterion at all, sector fails at 460 |
| `out_adj_clone_8x89_8x92.json` | `00de9fcefd48316b3dc09afe9e6197bf14195be3e2c4c202f8524400d415c6a5` | `CB(8,89)`, `CB(8,92)` |
| `out_adj_clone_8x108_7x144.json` | `8dbee02a19f48a858558dd4a3922e83dbae3065c381d738de20a811f45502935` | B3 (adjudicator-derived) |
| `adj_literal_validate.py` | `2e9acdfa7d3cf2752b05cf4aade8886c5f1a2a6ecbf7b31e0d3fd17211f68ae7` | literal layers, `w_F`, (D) and (S), Dinic; soundness of E1 + E2 on 9 small CB trees |
| `out_adj_literal_validate_small.json` | `7b3c7b3d4eee9510fc3eccd42fe7d2d6f86e139ce411cdf59ac6f0f8d0820dbc` | `CB(1,2)`, `(2,2)`, `(1,4)`, `(3,2)`, `(2,3)`, `(1,6)` |
| `out_adj_literal_validate_mid.json` | `75d877730761694f470a12267a9c23790a3846eebea1a7dc4c23c644c20c79fe` | `CB(4,2)`, `(2,4)`, `(3,3)` |
| `adj_t2_checks.py` | `7dc36171c86ae28b2d3ab9c833fb932b198c0710751c8bf1217474fd6c826114` | CBstar vacuity (6 rows); CD-2 formula by exact matching (27 layers) |
| `out_adj_t2_checks.json` | `ebfd8406f9a688504f215616dac3d80fac289062ab17dadf404c4b86c71bf778` | output of `adj_t2_checks.py` |

**Replay.** From `scratchpad/c3-adj-T/`, run these in order (about 2.5 minutes total):

1. `python3 -B seal_check.py`
2. `python3 -B stage_seals.py`
3. `python3 -B digest_check.py`
4. `python3 -B adj_rows.py`
5. `python3 -B adj_clone_criterion.py 8,86`
6. `python3 -B adj_clone_criterion.py 8,89 8,92`
7. `python3 -B adj_clone_criterion.py 8,108 7,144`
8. `python3 -B adj_literal_validate.py 1,2 2,2 1,4 3,2 2,3 1,6`
9. `python3 -B adj_literal_validate.py 4,2 2,4 3,3`
10. `python3 -B adj_t2_checks.py`

`adj_literal_validate.py` writes `out_adj_literal_validate.json`; the two shipped copies are the renamed outputs of the two
invocations.

**Portfolio artifacts relied on** (digests verified, not executed): C-T1-F `own/*`, C-T1-U `*`, C-T2-F `*` and C-T2-U
`own/*`, as listed in their critiques; T1 `c3-T1/*` and T2 `c3-T2/*`, as listed in their returns.
