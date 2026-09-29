# Cycle 1 Neutral Synthesis

Neutral Stage 6 synthesis, Cycle 1 of r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`): a parameter-uniform switch-using
Hall certificate on CB(8,m) at the top sector-deficient rank. Written 2026-09-28 (the session began 2026-09-27).

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly the constitution `verity.md` and
`identity/startup-protocol.md` at the VerityOS root, as the dispatch requires. My first combined print failed on a zsh `=====`
separator, so I re-read the startup protocol and the span of `verity.md` that the tool display had truncated. Subsystems loaded:
the constitution and the startup protocol only. The controller owns conversation logging and durable updates. This seat writes only
this file and scratch under `scratchpad/c1-S/`.

## Identity and seal audit

- **Dispatch** `control/dispatch/c1-stage6/DISPATCH-SYNTHESIS.md`: SHA-256
  `50464ff67fa3266497fe1d696bc26dca88bad36d03917b5af7d438c4ce9da5bf`. I recomputed it before any other action. **MATCH.**
- **Dispatch capsule** `control/C1-STAGE6-DISPATCH-MANIFEST.json`, stage `cycle-1-stage6-dispatch`. I recomputed the inner seal as the
  SHA-256 of the canonical JSON without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline):
  **`b9cdc875023832d0e025b2e7ceb11b61efdb5a7ae983be1e7f3a784e5b618d2f`. MATCH.** All **12/12** listed members match both byte count
  and SHA-256:
  - `SEMANTIC-CONTRACT.md` `7cc0bf43…`, `SOLUTION-CONTRACT.md` `480ba2dd…`;
  - `control/C1-ALLOCATION.md` `497beb92…`, `control/C1-STAGE1-GATE.md` `84365a8e…`;
  - `control/C1-STAGE5-PACKET-MANIFEST.json` `b5d84153…`, `control/C1-STAGE6-CONTROLLER-FACTS.json` `802f8252…`;
  - `control/C1-SYNTHESIS-PROTOCOL.md` `f9577fa4…`, `control/PATH-CHECK-c1-stage6-dispatch.json` `993c1b97…` (0 findings);
  - the three adjudications: T `f59a5bba…`, F `682a6ec4…`, U `cbe1f222…`;
  - `sources/SOURCE-DIGESTS.json` `1508f7dd…`.
- **Stage 5 packet manifest** inner seal, recomputed by the same rule: **`ea1b03462fcdcd4e092fd11710144577f6fa829e61930184d1b9a9226c2d51ea`.
  MATCH.** Its entries for the three adjudications equal the capsule's. I read no other member of that packet.
- **Seals cited by the adjudicators** (not recomputed by me, because the manifests are outside my capsule):
  - T capsule `1ed0f67a…`, F capsule `b03f4a63…`, U capsule `5a40d393…`;
  - Stage 2 `e747e52e…`, Stage 3 `e6cb6647…`, Stage 4 packet `40f2e216…`.
  The three adjudicators recomputed the last three independently and agree.
- **Adjudicator disclosures.** Each adjudication carries the two-part line with runtime id `claude-opus-5-5`. Each reports no background
  job, no network and no install. U ran Lean only inside pinned projects with a manual `.lake/packages` symlink.
- **Controller facts** (CF6-1..7): I read them as facts, never authority. CF6-7 is a controller prior, and my own replay agrees with its
  margins (34.90, 35.88, 36.85).
- **Instruction conflict (surfaced, ruled).** The dispatch asks for "6 routes: T1, T2, F1, F2, U1, U2". The protocol (§6, "binding in
  full"), CF6-6 and `C1-ALLOCATION.md` (Ashton's 9/18/3/1 topology) ask for **nine**.
  - **Ruling:** I write nine routes, because Ashton's topology instruction outranks a dispatch line.
  - The six routes the dispatch names are marked as the **priority subset**, so the controller can seat six or nine without a new
    synthesis.
- **My read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch or use either, and I
     wrote no conversation log, because the dispatch confines my writes.
  2. **Within `sources/` (authorized):**
     - `SOURCE-DIGESTS.json`, parsed programmatically for the `Snippets/` fragment digests of r30's C1-LA1, C1-LA2 and C6-LA2;
     - `authority/CLAIM-IDENTITY.json`, parsed for the names, statuses and grades of the CB-related keys;
     - a non-recursive `ls` of `sources/authority/` and of three `Snippets/` directories (the latter filtered through `grep`);
     - `diff`s of fragment pairs 0014, 0015, 0020 and 0021 between r30's C1-LA1 and C6-LA2, and of 0014 and 0020 between r30's
       C1-LA1 and C1-LA2.
  3. **Outside `sources/`:**
     - one non-recursive `ls` of `cycles/cycle-1/` and `cycles/cycle-1/stage6`, to check that my output directory existed. It printed
       only the stage directory names;
     - a name-scoped `pgrep -fl scratchpad/c1-S`, which matched nothing.
  4. The harness saved one oversized listing to its own tool-results file outside the run root. I did not read it back; I re-ran the
     query to a scratch file instead.
  5. I read no raw return, critique, scratch or other experiment root. I used no network, installed nothing, invoked no Lean and started
     no background job. Every computation was foreground Python standard library with exact integers and `Fraction`s.

## Reconciliation

The three orientations never read each other's portfolios. I reconcile claim by claim, weighing replays and derivations over
self-reports, with no majority vote.

**Headline flags (CF6-2).** T says `still_open`, U says `still_open`, and F says `proved`.

- **Ruling:** this is a disagreement of scope and grade, not of mathematics.
  - F rules at "`proved_informal` modulo the carried keys, STATED", having verified the composition on its face (F E2).
  - T and U withhold Tier 1 because the composition, respectively the (L-S)_top allocation and the (ELIG-top)(a) proof, lie outside
    their capsules.
- No orientation reports a mathematical error in another's object. The synthesis verdict (below) is F's statement, with the grade
  and STATED status that T and U insist on.

| # | Claim | T | F | U | Ruling |
|---|---|---|---|---|---|
| 1 | **(L-S)_top at template level** (closed-form allocation, `θ = 288/L`, `L = 200m²+82m+5`) | Proved (R1): T1's allocation; adjudicator derived all 72 intercepts from the frozen `m = 95` row and reproduced `98…107` out of sample; exact all-splitting DP at 107/110/113 | Proved (E1): C-F2-U and C-F1-T each found an allocation independently; adjudicator verified both symbolically; DP at fresh rows 137 and 263 | None in U (U built no allocation) | **Upheld, `proved_informal`, STATED.** Three distinct feasible closed-form optima share `θ = 288/L`, as F's non-uniqueness finding (E4) predicts. They differ only in five `pc(0,·)` cells and in `σ(7)`: T1 uses `(7/2)θ`, with slack; F uses `7θ`, tight. U's silence is absence, not dissent. |
| 2 | **Residual** `θ ≤ 1 − ρ_1` on the class | R2: C-T1-F and C-T1-U; degree-9 positivity after shifting to `m = 107` | Three critics (C-F1-T, C-F2-T, C-F2-U); adjudicator's degree-16 form holds for real `m ≥ 3` | Reproduces `ρ_1(95)` and `ρ_1(107)` | **Upheld, `proved_informal`, STATED; Darroch/Newton-free.** Five critic instruments and two adjudicator instruments agree. Degree 9 against 16 is only a matter of normalization. My exact check at 107, 110, 113, 161 and 302 passes, with margins 34.90, 35.88, 36.85, 52.48 and 98.38 and `m(1−ρ_1) ↑ 15/32`. |
| 3 | **Composition / per-state reduction** (template ⇒ literal network) | STATED, outside capsule; adopts the complete arc-class list (reconciliation 2) | Verified on the face (E2); literal lab of 330,775 arcs, 0 mismatches | U2 narrowed: Lemma 2′, Lemma 3′, E1-R (i) and (ii) with CD-2, H2 quantified, "sufficient"; exhaustive lab at 50 rank rows, 0 failures | **Concordant. `proved_informal` candidate, STATED.** U2 is the origin; the repairs belong to C-U2-T and C-U2-F; the provenance is r30's structural argument. F's face-check covers each target class, including the shared-capacity case: a switch image carries `ρ_1γ + (8−γ)σ(γ) ≤ (ρ_1+θ)γ ≤ γ`. |
| 4 | **E1 condition (i) at `p*`, every `q`** | Via the threshold key (modulo Darroch); `q = 1` Darroch-free as R2's corollary; route T-C proposed | Bounded at rows (F3 and its critics) | **Lemma A** (C-U3-T): recurrence (R), elementary LC, closing step `6t ≤ 3a+4b+1`, gap `2q+1` | **Lemma A adopted, `proved_informal` candidate, STATED, Darroch- and Newton-free.** I re-derived (R) from `(1+y)(1+2y)f′ = ((a+2b)+(2a+2b)y)f`, the closing step and the gap `6t_q − (3a_q+4b_q) = 2q+1`. My instrument confirms (R) on an 11×11 grid and strict (i) at every `q` at five rows, with 0 failures. T's route T-C is superseded for E1(i). |
| 5 | **(ELIG-top)(a)** | `proved_informal` **modulo Darroch/Newton** on `P_j`, `j ≥ 6` (R3, C-T3-F and C-T3-U). Smallest open lemma: *Darroch-free descent of `P_j` at `l_j` for `j ≥ 6`* | Same, with independent `J = 5, 6, 10` certificates. Smallest open lemma: *the same* | `still_open`. Lemma B gives exact block signs, with the closing step for `j ≥ 5`. Smallest open lemma: *the cross-block domination* | **Each orientation holds the other's missing piece.** Details below the table. |
| 6 | **Restricted allocation families** (T2 and its critics) | Upheld as template failures: F-2, Theorem N, `θ_budget` | Out-of-class failures only (`m = 2` affine; vertex below `m = 26.725`) | — | **Concordant.** No in-class failure of the r30 template or of any feasible closed form. T2's gate line `template_failure_found` is admissible only in the qualified sense T rules. |
| 7 | **`θ*` law as the exact optimum** | Conjecture in T; CF-T-1 not graded | C-F2-U F-9 replayed byte-identically; integer-hull step not re-derived; not load-bearing | — | **Stays `conjecture`** at registry level. F-9 is STATED on one critic. Feasibility never uses it. |
| 8 | **F3's favorability evidence** | — | Struck: the loop evaluates `G^{m−1}`, `G^{m−2}`; the conclusion is re-established at rows | Favorability unchanged | **Struck** (F's reading of the code is decisive). The favorability key keeps its registered grade. |
| 9 | **Record facts** | `x = p*−2` at 107–116; `p*−x = 8` by 584 | First eligible residue-2 row `m = 86`; first-descent transition `m = 161`; parent descent at 832 rows `107–2600` | `x = p*−2` at 107, 110, 113 | **Concordant** (`bounded_computation`). |
| 10 | **Carry sources** | — | — | "C1-LA1 and C6-LA2 entries 1–21 byte-identical"; U1's own file strips entries 15, 123 and 124 | **Confirmed**, with a new caution below the table. |

**Row 5: how the (ELIG-top)(a) pieces fit.**
- **(i) Blocks `j ≥ 6`.** U's Lemma B closing step (C-U3-T) applies to `P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}`, with `a = 8j`,
  `b = 8(m−j)+1` and `t = l_j = p*−2−j`.
  - The gap is `6t − (3a+4b) = 2j − 8`, so strict descent `[x^{l_j}]P_j > [x^{l_j+1}]P_j` holds for every `j ≥ 5`.
  - It needs no Darroch and no Newton.
  - Side conditions: `1 ≤ l_j ≤ a+b` for `0 ≤ j ≤ m`, because `m < p*−3`.
- **(ii) Blocks `j ≤ 5` and the tail.** T's and F's `S_5` certificate is exactly U's missing domination: `S_5(t) > 0` for real
  `t ≥ 35`, through a degree-50 polynomial with 51 positive coefficients.
  - Four instruments agree, two of them coefficient-identical.
- **Composition.** `Δ = S_5 + Σ_{j≥6} C(m,j)·(descent of P_j) > 0`.
- **Result: (ELIG-top)(a) holds for every class `m`, Darroch- and Newton-free, with no `M_0`.**
- **Grade.** First assembled here, so STATED, `proved_informal` candidate.
- **My check** at five rows:
  - the gap identity holds for all `j`;
  - every `j ≥ 5` block descends;
  - the block pattern is `+++---------`;
  - the block identity agrees with the direct closed form `(1+2x)G^m + x(1+x)(1+2x)^{8m}` at `k` and `k+1`;
  - parent descent holds, with 0 failures.

**Row 10: a new carry-source caution.**
- In `sources/SOURCE-DIGESTS.json`, r30's **C1-LA2** fragments 0014–0021 have different bytes from C1-LA1's and C6-LA2's.
- They are the pre-freeze text: `open scoped Classical`, with no header and no docstrings.
- C1-LA1 = C6-LA2 for entries 1–21. I checked all 21 digests.
- **Rule:** carry definitions only from C1-LA1 or C6-LA2 entries 1–21. Take only C1-LA2's *lemma* entries 30 and 31, whose bytes U
  checked against the compiled chain.

**Fidelity across the cycle.**
- (WID) is asserted from independent sides only by instruments that do it genuinely: C-T2-U, C-F1-T, C-F1-U, C-U2-F and U's
  adjudicator lab. F1's own assertion is struck as tautological.
- `F_{p*} = leafSet` is derived literally at 107, 110 and 113.
- `x` is computed through `α` on literal trees.
- Darroch and Newton appear only on real-rooted blocks and the `r_q`, and after this synthesis they appear nowhere on (ELIG-top)(a)
  or E1(i). Nothing applies either to `I`, `G` or `G^m`.

## Exact established results

Scope throughout: `T = CB(8,m)`, `m ≥ 107`, `m ≡ 2 (mod 3)`, rank `p* = (16m+4)/3` only. "STATED" means first made at a review stage
(Stage 4, Stage 5 or here); it needs an isolated second read before registration (SOLUTION-CONTRACT §4). The labels "finite
certificate", "informal dependency", "conditional result" and "governed award" are kept separate.

**S1. (L-S)_top, template level: closed-form allocation.** Grade `proved_informal`, STATED.
- *Origin and attribution.* Allocation by T1 (r31, seat of origin). Independent allocations by C-F2-U and C-F1-T. Template method:
  r30.
- *Allocation.* Let `D = L/3`. Then:
  - `pb(β,γ) = (25m/2 + B_pb(β,γ))/D` and `pc(β,γ) = (25m/2 + B_pc(β,γ))/D`;
  - `σ(γ) = c_γ·θ`, with `c = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2)`;
  - `θ = 288/L`.
- *Intercept table of record:* the T adjudicator's `adj_alloc_out.json`
  (`7d63580526f84c48434b832353298bdba97c6a9cdce2a1bb95be9540870d4b13`), which equals C-T1-U's `crit_alloc_out.json` (`da76863d…`).
- *Statement.* The allocation satisfies, over every assignment of choke states:
  - nonnegativity, from `m ≥ 689/200`;
  - **Out:** `Σ Out ≥ 1` over every assignment with total `K = p*−1`;
  - **In:** `Σ In ≤ 1` over every assignment with total `K−1`;
  - **Switch.**
- *`M_0`.* None. LP optimality and the `θ*` law are not used.

**S2. Residual.** Grade `proved_informal`, STATED, Darroch/Newton-free.
- *Attribution.* Critics C-T1-F, C-T1-U, C-F1-T, C-F2-T and C-F2-U.
- *Statement.* `288/L ≤ 1 − ρ_1(m)` with `ρ_1 = r_1(p*−1)/r_1(p*−2)` and `r_1(k) = [y^k](1+y)^7(1+2y)^{8m−7}`.
- *Human-checkable bounds.* `1−ρ_1 ≥ 9/(20m)`, and `15/32 − 1/(8m) ≤ m(1−ρ_1) ≤ 15/32`.
- *Consequence.* **S1 ∧ S2 is (L-S)_top at template level on the whole class.**

**S3. Sector-certificate composition** (narrowed U2 lemma). Grade `proved_informal` candidate, STATED.
- *Attribution.* Origin U2. Repairs, including Lemmas 2′ and 3′, by C-U2-T and C-U2-F. Provenance: r30's structural argument and
  r30's "B7" rational-to-integral principle.
- *Hypotheses.* On the class:
  - `F_{p*}(T) = leafSet(T)`;
  - E1-R's criterion (i) and (ii) hold at every `q ∈ [1,m]`;
  - nonnegative `pb`, `pc`, `σ`, `θ` satisfy Out, In, Switch and Residual, quantified over state assignments.
- *Conclusion.* The literal active-tag (D) ∪ (S) network at `p*` has a nonnegative rational flow saturating every source within
  capacity, hence (HALL) and an integral `IsSaturatingFlow`.
- The lemma is sufficient, not an equivalence.
- *Consequence.* With S1 and S2, **(L-S)_top holds as the contract defines it** (proved against the literal network through a
  written reduction), at the same STATED grade.

**S4. E1 condition (i) at `p*`, every `q`: Lemma A.** Grade `proved_informal` candidate, STATED.
- *Attribution.* C-U3-T. U3's `q = 1` case is seat-attributed. C-U3-F's `q ≤ 63` certificates are `computer_assisted` corroboration.
- *Statement.* `r_q(p*−q) < r_q(p*−q−1)` for every `q ∈ [1,m]`, with no Darroch and no Newton.
- *Generic mechanism (a companion tool, not a registered claim).* For `r(k) = [y^k](1+y)^a(1+2y)^b`, if `1 ≤ t ≤ a+b` and
  `6t ≥ 3a+4b+2`, then `r(t+1) < r(t)`.
- *Scope note (C-U3-T).* Lemma A covers the threshold key's (a) only at `p*` on the class.

**S5. (ELIG-top)(a) and (E).** Grade `proved_informal` candidate, STATED, Darroch- and Newton-free, with no `M_0` and no omitted
range.
- *Statement.* `i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))` for every class `m`.
- *Proof: the Row 5 composition.* Four inputs:
  - the exact block identity (T3 step 1);
  - the `S_5` certificate (C-T3-F and C-T3-U, independently C-F3-T and C-F3-U, replayed by both adjudicators);
  - the closing-step descent of `P_j` for `j ≥ 6` (Lemma B, C-U3-T);
  - the composition itself (this synthesis).
- *(E) follows.* `x ≤ p*−2` because `x` is the least descent, `α = 9m+1`, and `3p* = 16m+4 < 18m+3 = 2α+1`.
- *Alternative route.* T's and F's proof modulo Darroch/Newton for `j ≥ 6` stands as a second route.

**S6. Lemma B: exact block signs.** Grade `computer_assisted` (universal on the class; three fixed Taylor-shift certificates at
`j = 2, 3, 4`), STATED.
- *Attribution.* C-U3-T and C-U3-F, concordant.
- *Statement.* `P_j` ascends at `l_j` exactly for `j ∈ {0,1,2}` and descends for every `j ≥ 3`. The tail ascends.
- *Role.* A node of S5. The `j ≥ 5` part is `proved_informal`.

**S7. Template-failure theorems** (not cuts). Grade `proved_informal`, STATED.
- *Statements, attributed as the T adjudicator rules:*
  - C-T2-F F-2: every allocation with `pb = f_b(β+γ)` and `pc = f_c(β+γ)` is infeasible, for any `σ` and `θ`;
  - C-T2-U Theorem N: a lone-`b` discount at some `γ` is necessary for any template satisfying Out and In.
- *Not registrable here:* the switch-budget floor `θ ≥ θ_budget ≈ 1.21/m²`. Its "≈" leaves it without an exact form on any face I
  hold.
- *Per-row certificates, `computer_assisted`:* C-T2-F's β/γ-separated Farkas certificates at `m = 107, 110, 113`.

**S8. Compiled scratch** (no grade until a governed award closes). U replayed each item, and each has the three standard axioms:
- U1's CB(8,m) layer, with C-U1-T's `cb_leafSet_card` and terminal reduction;
- C-U1-F's `favorableLeaves_eq_leafSet_of_all` and neighbourhood lemmas;
- the rational ⇒ WeightedHall ⇒ integral chain (U2, C-U2-T, C-U2-F);
- C-U3-T's `descent_of_recurrence_logconcave` and `r31_gap`;
- U's integration probe `AdjIntegration.lean`.

**S9. Bounded record** (`bounded_computation`, priors only):
- parent descent at every class row 107–2600, with 69 rows beyond the 2395 record;
- template feasibility by exact DP at 107–125, 137, 170, 200, 263 and 1001;
- dual-certified `θ* = 288/L` to `m = 1000001`;
- E1(i) at every `q` at 107–122, 302, 500, 1001 and 2000;
- first eligible residue-2 row `m = 86`; first-descent transition `m = 161`;
- favorability of both leaf classes at the F adjudicator's rows.

**Imported, cited at their grades (Tier 3, never upgraded):**
- the criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, `proved_informal`, with (ii) by
  scope note CD-2 `[r30 C4; SR-C4-6]`;
- the threshold key `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`, `proved_informal`
  modulo Darroch on the `r_q`;
- the favorability key `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`,
  `proved_informal` modulo Darroch/Newton;
- the row key `E993-R30-CB-8-M-95-TO-107-…`, `computer_assisted`.

## Refuted or narrowed mechanisms

**No refutation of any registered key, and no cut.** No REFUTED key regresses.

**Mechanisms not revived:**
- Darroch or Newton on `I`, `G` or `G^m`;
- forest real-rootedness;
- the `m`-independent per-choke certificate (the allocations here depend on `m`);
- deletion-only allocations (the registered deficit key);
- the compression lemma.

**Template failures (not cuts):**
- *Every `m` in the class:* allocations whose rates depend only on leg type and choke leg count, including T2's flat and
  symmetric-quadratic families (S7).
- *`m = 107, 110, 113` only:* β/γ-separated rates.
- *Outside the class, record only:*
  - at `m = 2`, the affine separation is infeasible while the exact system is feasible;
  - the closed-form vertex family is negative below `m = 1069/40`, and T1's table below `m = 689/200`.
- **No in-class failure** of the r30 template or of any feasible closed form.

**Struck or narrowed on the returns** (records, not edits):
- *T1:*
  - the intercept table is not in its generator output;
  - the aggregate literal is struck;
  - "for every `m ≥ 4`" and "FOR-EVERY-M" are struck;
  - "degree ≈50+" is wrong: the Residual polynomial has degree 9.
- *T2:*
  - "both sides worse" is struck;
  - its §7 alias statement is struck;
  - Proposal 2 is not registrable.
- *T3:*
  - the identity check is tautological;
  - the float "EXACTLY" is struck;
  - the replay recipes are defective;
  - the omitted `τ` is added;
  - the `√j` heuristic is superseded.
- *F1:*
  - the (WID) independence claim is struck as tautological;
  - the laboratory is narrowed;
  - the digit range is corrected to 363–432;
  - the `256m/20451` gloss is struck.
- *F2:*
  - candidates 1 and 2 are struck: out of class, and a vertex artifact;
  - corrections: 7 in-class rows, `margin/m = 0.325528` and the limit `125/384`.
- *F3:*
  - the favorability evidence is struck (wrong polynomials);
  - "descending mass" is re-labelled, and the ratio becomes 3.4655;
  - `256m/20451` is narrowed to its 69 rows, and fails at 479, 1358 and 1997;
  - the "m = 1000" horizon is not a class row;
  - the numpy breach is recorded.
- *U1:*
  - the carry literal for entries 15, 123 and 124 is struck;
  - the seat's axiom literal is struck and reinstated on U's replay;
  - the cell-bound caution is struck;
  - α's grade wording is struck.
- *U2:*
  - Lemma 3 ("single preimage") is replaced by Lemma 3′;
  - "exactly" becomes "sufficient";
  - the scope is narrowed to the class;
  - the entry provenance is re-cited to r30 C1-LA2 entries 31 and 33;
  - the grade labels are struck;
  - the `CB(8,1)` check is struck as vacuous.
- *U3:*
  - the fixed-`Q_0` "immediate" extension is struck;
  - §5.6 is struck and must never be used as input;
  - the degree is 7, not 8;
  - `ELIG_top: advanced` is struck;
  - the candidate key is not registrable as named.
- **Seat grade words.** Every seat grade word (`proved`, `formally_verified` on scratch) is renormalized to contract grades.

**Corrections to predecessor records:**
- None mathematical.
- One carry-source record: r30's C1-LA2 `Snippets/` 0014–0021 are the pre-freeze bytes and must not be used as definition carry
  sources.
- The (ELIG-top)(a) bounded record to 2395 is superseded **as proof** on the class once S5 is second-read. It stays valid as bounded
  evidence.

## Headline verdicts

| Target | Verdict (SOLUTION-CONTRACT §1 category) | Grade | Smallest open item |
|---|---|---|---|
| **Tier 1** (E) ∧ (H), every `m ≥ 107`, `m ≡ 2 (mod 3)`, at `p*` | **Proved at full scope** (no `M_0`, no omitted range) by the assembled chain S1 ∧ S2 ∧ S3 ∧ S4 ∧ S5 plus the carried criterion and favorability keys | `proved_informal` **modulo Darroch/Newton through the carried favorability key only**; STATED; **not registered**; not `formally_verified`; **not decisive** | *Informal:* isolated second reads SR-1..SR-5. *Classical:* favorability at `p*` Darroch-free. *Formal:* Lemma 0 over `cbGraph` (AG-U-D) |
| **(L-S)_top** | Proved at full scope: template (S1, S2) and literal network (via S3) | `proved_informal`, STATED | SR-1 and SR-3; formal: C1-LA1 below |
| **(ELIG-top)(a)** | Proved at full scope (S5) | `proved_informal`, Darroch/Newton-free, STATED | SR-4; formal: the `S_5` degree-50 certificate and the block identity over the closed form |
| E1 condition (i) at `p*` (Tier 3) | Dependency reduced (S4): Darroch-free at `p*` on the class | `proved_informal` candidate, STATED | SR-2. **Not counted as Tier 2 progress** (contract §1, Tier 3) |
| Favorability at `p*` (Tier 3) | Unchanged; cited | `proved_informal` modulo Darroch/Newton | A Darroch-free integer proof (Cycle 2 route T2) |
| Outcome C | **No cut.** None proposed by any seat, critic or adjudicator | — | — |
| **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, full scope | **OPEN.** No status transfer | — | — |
| **Primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | **OPEN, unchanged by construction.** A family theorem gives `S(T_m, p*) ≤ 0` on its own rows only (FLOW ⇒ SIGN) and transfers nothing | — | — |

TREE, FOREST, TRANSFER, governed beta and Erdős #993 all stay **OPEN**. `E993-TREE-REAL-ROOTED` stays **REFUTED**.

**Scope notes for the controller to add at the close** (each STATED item after its read):
- **(HALL) key.** "r31 C1: at `(CB(8,m), p*)` on the class, (HALL) has an assembled informal proof (STATED, pending SR-1..5). No
  status transfer."
- **Primary aggregate.** No note beyond "unchanged by construction".
- **Criterion key.** "At `d = 8`, `m ≥ 107`, `m ≡ 2 (mod 3)`, `p = p*`: condition (i) holds strictly at every `q` without
  Darroch/Newton (r31 C1 Lemma A, C-U3-T); (ii) by CD-2."
- **Threshold key.** "At `p*` on the r31 class the statement (a) has a Darroch- and Newton-free proof (Lemma A). The method covers
  `p − q − 1 ≥ μ_q + 1/3` only."
- **Favorability key.** "Sole remaining Darroch/Newton dependency of the r31 Tier 1 chain. r31 C1 F3's rows 107–2396 are struck as
  evidence (wrong polynomials); the conclusion is re-established at the adjudicators' rows (bounded)."
- **`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`.** "r31 C1 T2's deletion-only infeasibility statements are instances of this key,
  not new keys."
- **Row key `…M-95-TO-107…`.** "Its `m = 107` row is the r31 class's first member. r31 S1 covers template feasibility uniformly from
  107 and does not replace the row's literal certificate."
- **The `θ*` law (conjecture).** "The dual-certified optimum equals `288/L` at rows to `m = 1000001` (bounded, C-F2-U). An optimality
  proof (C-F2-U F-9) is STATED on one critic. The LP optimum is not unique: at least three closed-form optimal allocations exist.
  Feasibility never depends on the law."
- **The (ELIG-top)(a) bounded record.** "Extended to every class row 107–2600 (C-F3-U; 832 rows). Superseded as proof on the class by
  S5 once SR-4 confirms."

## Lean awards

Toolchain: Lean v4.32.2, with the Mathlib commit pinned in SOLUTION-CONTRACT §2, used through the governed `lean-proof-workflow`.
- The shared project is bound read-only by a manual `.lake/packages` symlink, always from inside a pinned project.
- No `lake update` and no `lake clean`.
- No `native_decide` in any universal step.
- The pinned Mathlib has **no** Darroch mode theorem, Newton inequalities or log-concavity API (T adjudicator's search). Every funded
  DAG therefore avoids them.

"Do not substitute already known identities for the missing uniform result": each group states below whether it is Tier 2 progress.

### C1-LA1 (r31) — (L-S)_top template arithmetic. **FUNDED: a bounded attempt, first priority.**

This is T's LA-T-1 and F's G-F1: the same object.

- **Exact statement** (Stage 7 freezes the Lean text; the meaning here is binding):
  - For `m : ℕ` with `107 ≤ m` and `m % 3 = 2`, put `K := (16m+1)/3`, `L := 200m²+82m+5` and `D := L/3` over ℚ.
  - Let `State8 := {(β,γ) : ℕ×ℕ // β+γ ≤ 8}`.
  - Put `pb m (β,γ) := (25m/2 + B_pb(β,γ))/D`, `pc m (β,γ) := (25m/2 + B_pc(β,γ))/D`, `θ m := 288/L` and `σ m γ := c_γ·θ m` with
    `c = (1/7,1/3,3/5,1,5/3,3,7/2)`.
    - `B_pb` and `B_pc` are the 72 rational intercepts of the table of record (S1), entered literally.
  - Put `Out m (β,γ) := β·pb + γ·pc + [β = 1 ∧ 1 ≤ γ]·σ(γ)`.
  - Put `In m (β,γ) := (8−β−γ)·(pb(β+1,γ) + pc(β,γ+1))` for `β+γ ≤ 7`, and `0` at `β+γ = 8`.
  - Put `r1 m k := Σ_{i=0}^{min(7,k)} C(7,i)·C(8m−7, k−i)·2^{k−i}`.
- **Conclusions:**
  - (i) `0 ≤ pb`, `0 ≤ pc` and `0 ≤ σ` on every state;
  - (ii) `∀ c : Fin m → State8`, `Σ_i (β_i+γ_i) = K → 1 ≤ Σ_i Out m (c i)`;
  - (iii) `∀ c`, `Σ_i (β_i+γ_i) = K − 1 → Σ_i In m (c i) ≤ 1`;
  - (iv) `(8−γ)·σ m γ ≤ θ m·γ` for `γ = 1..7`;
  - (v) `θ m ≤ 1 − r1 m (K) / r1 m (K − 1)`.
    - Here `K = p*−1` and `K−1 = p*−2`, so the right side is `1 − ρ_1`.
- **Hypotheses.** The class only.
- **Informal DAG, closed:**
  - 45 `m`-free rational state inequalities;
  - two aggregate polynomial identities;
  - summation of affine per-state bounds over any assignment;
  - linear nonnegativity;
  - finite Switch;
  - the `Nat.choose` ratio lemma normalizing `ρ_1`;
  - one shifted positivity certificate (degree 9 in T's normalization, or 16 in F's).
- **Open nodes.** Lean engineering only: the choose-ratio lemma (smallest) and the explicit shift with `norm_num`/`ring`.
- **Carried fragments.** None. It is pure arithmetic and does not touch the network layer.
- **NEW declarations:** `State8`, `cb8Pb`, `cb8Pc`, `cb8Sigma`, `cb8Theta`, `cb8Out`, `cb8In`, `cb8R1`,
  `cb8_sectorTemplate_nonneg_out_in_switch`, `cb8_sectorTemplate_residual`, and the terminal of the group,
  `cb8_topRank_sectorTemplate_feasible`.
- **Fences.**
  - Template level: **not** a flow on the literal network and **no** (HALL) claim.
  - The network bridge is S3, informal.
  - One rank `p*`, the class only.
  - No optimality; the `θ*` law is never a hypothesis.
- **Excluded conclusions.** (H), (HALL), eligibility, any statement at other `m`, residues, ranks or `d`, and uniqueness or optimality
  of the allocation.
- **Repairs carried in.** Use the table of record, not T1's generator output. Every out-of-class literal is struck.
- **Attribution (on the face):**
  - allocation: r31 T1 (seat of origin), independently C-F2-U and C-F1-T;
  - Residual: C-T1-F and C-T1-U, with C-F1-T, C-F2-T and C-F2-U;
  - table shipped by C-T1-U and the T adjudicator;
  - template method and certificate: r30, the Cycle 6 certificate method of record and its named seats as registered;
  - mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run;
  - Lean: the Stage 7 seat.
- **Tier 2 progress?** **Yes.** It is the formal template content of (L-S)_top, not a registered identity.

### C1-LA2 (r31) — CB(8,m) definition layer. **FUNDED: a bounded attempt, infrastructure.**

This is U's AG-U-A.

- **Exact statement set** (all over the carried definitions):
  - `cbGraph_isTree (m)`;
  - `cbGraph_indepNum_eq (m) (hm : 0 < m) : (cbGraph m).indepNum = 9*m+1`;
  - `mem_leafSet_cbGraph_iff`;
  - `cb_leafSet_card (m) (hm : 0 < m) : (C5LA1.leafSet (cbGraph m)).card = 8*m+1`;
  - `mem_cb_tagWitnesses_v_iff`, which is `W_v = {r}`, with the unused `hm` dropped;
  - `mem_cb_tagWitnesses_leaf_iff`, which is `W_{c_ij} = {u_i}`;
  - `cb_lowWindow (m) (hm : 0 < m)`, which is `3p* < 2α+1`;
  - `cb8_topRank_of_descent_and_flow`, which reduces the SOLUTION-CONTRACT §2 terminal to its conjuncts 2 and 4.
- **Frozen labelling.** `0 = r`, `1 = s`, `2 = v`, `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`.
- **Carried fragments** (byte-identical transport only; digests from `sources/SOURCE-DIGESTS.json`; the full list is in scratch
  `carry_digests.txt`). All come from r30's **C6-LA2** `Snippets/`:
  - entries 1–21, identical to r30 C1-LA1's; for example 0001 `7e0a588e…`, 0014 `73df20a8…`, 0015 `113d9521…`, 0018 `16b0c767…`,
    0019 `b1b9ac6c…`, 0020 `a9d81c26…`, 0021 `63534ffb…`;
  - 0035 `C5LA1.crossingIndex` `378868ab2e660af8…`;
  - 0123 `support_eq_of_isGraphLeaf_of_adj` `16687f86fa9b55f6…`;
  - 0124 `mem_tagWitnesses_iff_of_adj` `772a13c0522f1c4b…`.
- **Carry rules.**
  - **Never** take definitions from r30 C1-LA2 0014–0021 (pre-freeze bytes).
  - **Never** take them from U1's own file, which stripped comment lines in 15, 123 and 124.
  - The verified assembly is C-U1-T's `CriticAdvance.lean` (`c94ef3bd…`).
- **NEW declarations:**
  - `cbEdge`, `cbGraph`, `cbGraph_decAdj`, `cbVertex`, `cbVertex_val`, `eq_cbVertex_iff`;
  - the lemmas above;
  - `favorableLeaves_eq_leafSet_of_all`, `mem_neighborFinset_choke_iff`, `mem_neighborFinset_root_iff`, `choke_degree`.
- **Preconditions.** Ship an axiom log with fully qualified names.
- **Fences.** Structural facts only: no rank claim, no (HALL), no favorability, no descent.
- **Excluded conclusions.** Everything beyond the listed structural facts.
- **Attribution:**
  - structural content: r30's CB record (`R30-CB-RECORD`) and its seats;
  - Lean layer: r31 U1;
  - leaf-card and terminal reduction: C-U1-T;
  - interface lemmas: C-U1-F;
  - the integration check: the U adjudicator;
  - the network definitions: r30 awards.
- **Tier 2 progress?** **No.** It is infrastructure that every later formal award consumes. It proves no Tier 2 lemma, and it is not
  counted as material progress.

### C1-LA3 (r31) — two-binomial descent, with E1(i) at `p*` and the block-descent node of (ELIG-top)(a). **FUNDED: a bounded attempt.**

This is U's AG-U-C, widened by the synthesis's Row 5 ruling.

- **Exact statements:**
  - **(G), a companion tool with no certificate of its own.** For `a b t : ℕ` with `1 ≤ t`, `t ≤ a+b` and `3a+4b+2 ≤ 6t`:
    `((1+X)^a·(1+2X)^b).coeff (t+1) < ((1+X)^a·(1+2X)^b).coeff t` over ℤ.
  - **(E1i).** For `107 ≤ m`, `m % 3 = 2`, `1 ≤ q ≤ m`:
    `((1+X)^(8q−1)·(1+2X)^(8(m−q)+1)).coeff ((16m+4)/3 − q) < ((1+X)^(8q−1)·(1+2X)^(8(m−q)+1)).coeff ((16m+4)/3 − q − 1)`.
  - **(BD).** For `107 ≤ m`, `m % 3 = 2`, `5 ≤ j ≤ m`, `l := (16m+4)/3 − 2 − j`:
    `((1+X)^(8j)·(1+2X)^(8(m−j)+1)).coeff (l+1) < ((1+X)^(8j)·(1+2X)^(8(m−j)+1)).coeff l`.
- **Informal DAG, closed:**
  - (R), from the derivative identity;
  - positivity of the coefficients on `[0,a+b]`;
  - LC, by induction on linear factors;
  - the closing step;
  - the gap identities `2q+1` and `2j−8`, which are `omega` and `ring` facts.
- **Compiled scratch.** `descent_of_recurrence_logconcave` and `r31_gap` (C-U3-T; U replay).
- **Open nodes, smallest first:**
  1. (R) as a `Polynomial.coeff` identity;
  2. positivity;
  3. LC by factor induction.
  All are Lean engineering over proved mathematics.
- **Carried fragments.** None: pure polynomial coefficients.
- **NEW declarations:** `twoBinomCoeff_recurrence`, `twoBinomCoeff_pos`, `twoBinomCoeff_logConcave`,
  `twoBinom_coeff_strictAnti_of_gap`, `cb8_E1_conditionI_topRank`, `cb8_block_descent_topRank`.
- **Fences.**
  - (E1i) is an instance of the registered threshold key's (a) at `p*` on the class. It is a **Tier 3 dependency reduction, never Tier
    2 progress**.
  - (BD) is a **node** of (ELIG-top)(a), not (ELIG-top)(a).
  - (G) makes no family or tree claim. It is a tool on the face.
- **Excluded conclusions:**
  - (ELIG-top)(a) itself, which also needs the `S_5` certificate and the block identity;
  - E1-R's flow;
  - favorability;
  - any rank other than `p*`;
  - the threshold key's (a) off `p*`.
- **Repairs carried in.**
  - U3's "any fixed `Q_0` immediate" and §5.6 are never inputs.
  - U3's degree is 7, not 8.
  - Nothing from U3's Lean atoms is on this DAG.
- **Attribution:**
  - Lemma A and the closing step: C-U3-T;
  - the `q = 1` case: r31 U3;
  - corroboration: C-U3-F;
  - the (BD) instance and its role in (ELIG-top)(a): the synthesis, from C-U3-T's Lemma B;
  - the E1 criterion, threshold and `r_q`: r30;
  - the mechanism: Codex GPT-6.
  - Codex's heterogeneous-closure binomial-block mechanisms are cited as templates only, not as carried fragments.
- **Tier 2 progress?** Partly. (BD) is the formal node of (ELIG-top)(a) that T and F named as their smallest open lemma. (E1i) is not
  progress. Both are required by the formal terminal, because the pinned Mathlib lacks Darroch and Newton.

**Order at Stage 7:** C1-LA1, then C1-LA3, then C1-LA2. Each is independent, so none blocks another.

### Groups with `no award attempted`

- **(ELIG-top)(a) as a full formal award** (T's LA-T-2, F's G-F2).
  - *Informal DAG.* Now closed (S5), but STATED at Stage 6 by this synthesis.
  - *Open formal nodes:*
    - the block identity for the coefficients of `(1+2x)G^m + x(1+x)(1+2x)^{8m}`;
    - the `S_5` degree-50 shifted-positivity certificate, with its product-of-linear-forms normalization;
    - (BD), from C1-LA3.
  - *Smallest unproved formal lemma:* the `S_5` certificate. Its formal home is Cycle 2 route U1, after SR-4.
- **AG-U-D, the CB sector composition instantiated on `cbGraph`.** Smallest unproved formal lemma: **Lemma 0 over `cbGraph`** (the
  weight dichotomy). After that:
  - choke-state extraction;
  - Lemma 2′ and Lemma 3′;
  - the target case split;
  - the E1-R flow, as a hypothesis or formalized.
  The informal lemma (S3) awaits SR-3. Route U2.
- **AG-U-B, the rational ⇒ integral chain.**
  - It is a companion lemma, r30's "B7" principle, with no certificate of its own.
  - It appears on AG-U-D's face when that group is funded.
  - Carried fragments: r30 C1-LA2 entries 0030 `e8c6b0d1…` and 0031 `ec521065…`.
- **Favorability at `p*` in Lean.** No Darroch-free informal proof exists yet. Smallest unproved lemma: favorability of `v` and of the
  `c_ij` at `p*` on the class, as integer statements (route T2).
- **The Tier 1 terminal.** Not ready. It needs all of the above, plus the link `indepSetCount (cbGraph m) = [x^k]` of the closed form
  (route U3).
- **`θ*` optimality and the no-go theorems.** Not award targets.
- **Bounded results.** Never.

## Progress and stop-gate ruling

**Material progress: yes.**
- Both Tier 2 lemmas reached `proved_informal` content at full scope this cycle: (L-S)_top (S1–S3) and (ELIG-top)(a) (S5).
- New `proved_informal` lemmas exist: S3, S4 and S7.
- There are new adversarial findings: F3's defective favorability evidence, the non-uniqueness of the LP optimum, and the
  carry-source caution.
- Tier 1 has an assembled informal proof at full scope.

**Decisive event (a).** Did not occur. Nothing is `formally_verified`. A `proved_informal` Tier 1, even after second reads, is
explicitly not decisive (SOLUTION-CONTRACT §5).

**Decisive event (b).** Did not occur. No eligible deficient cut was proposed anywhere. Once S3 is read, it excludes any cut on the
class at `proved_informal` modulo the carried keys.

**Plateau.** The stop gate is recorded and **unarmed** for plateaus in Cycle 1 (unarmed-early rule; CF6-1). In any case the cycle is
not a plateau cycle.

**Ceiling.** Cycle 1 of 6. The Claude Fable 5.1 checkpoint follows the Cycle 3 close.

## Next-cycle portfolio

Nine routes, three per orientation, the standard topology. The dispatch's **priority subset of six** is marked ★: T1, T2, F1, F2, U1
and U2. The third route of each orientation is seated only under the nine-route topology. All routes are inside the charter: the class
only, one rank `p*`, no aggregate transfer.

**T (prove)**
- ★ **`C2-T-01` `TIER1-ASSEMBLED-INFORMAL-PROOF-ON-ONE-FACE`**
  - *Object:* write (E) ∧ (H) on one face, with every node and dependency named:
    - S1, S2, S3 with its repaired arc-class census, S4, S5 and the `S_5` certificate;
    - the criterion key with CD-2;
    - the favorability key at its grade.
  - Then test the face exactly at the new rows `m = 116` and `119`, using its own literal verifier: (WID) from two sides, derived
    `F`, and the total load on every target class.
  - *Could close:* Tier 1 at `proved_informal` modulo favorability, in registration-ready form for SR-5.
- ★ **`C2-T-02` `FAVORABILITY-AT-TOP-RANK-INTEGER-ROUTE`**
  - *Object:* prove `Δ_{p*}(T−v) < 0` and `Δ_{p*}(T−c_ij) < 0` on the class without Darroch or Newton.
  - *Method:* the block decompositions of `I(CB−v) = (1+x)G^m + x(1+2x)^{8m}` and `I(CB−c)`, plus the recurrence and closing-step
    tool (G) plus a finite shifted certificate for the small blocks.
  - This is a Tier 3 dependency reduction, needed by the formal terminal. It is not claimed as Tier 2 progress.
  - *Could close:* the last Darroch/Newton dependency of Tier 1 on the class.
- **`C2-T-03` `E1-R-FLOW-EXPLICIT-AT-TOP-RANK`**
  - *Object:* state E1-R's deletion flow at `p*` on the class as an explicit, quantified lemma for AG-U-D to consume:
    - the arc values;
    - the `ρ_q` loads;
    - the type-path inequalities (ii) proved on the face;
    - (i) from S4.
  - *Could close:* E1-R at `p*` as a self-contained statement, ready for formalization or for use as a named hypothesis.

**F (falsify)**
- ★ **`C2-F-01` `ASSEMBLED-CHAIN-LITERAL-NETWORK-ADVERSARY`**
  - *Object:* literal-network laboratories at `m = 116, 119` and one larger row, such as `m = 137`.
    - Fidelity comes first: (WID) from independent sides, derived `F_{p*}`, and `x` through `α`.
    - Load the frozen C1-LA1 allocation plus E1's loads, and compute the exact load on every target class, including shared-capacity
      switch images and the scaling step.
    - Search structured source families for a deficient cut.
  - *Could close:* adversarial confirmation of S1 ∧ S3 at fresh rows, or a verified cut or template failure.
- ★ **`C2-F-02` `ELIG-AND-CERTIFICATE-RANGE-ADVERSARY`**
  - *Object:* attack S5's cross-orientation composition:
    - the side conditions `1 ≤ l_j ≤ a_j+b_j` up to `j = m`;
    - the `u ≥ 35` shift ranges;
    - the `J` split;
    - the tail sign.
  - Also re-derive S2 and the `S_5` certificate by a third method (direct symbolic expansion rather than interpolation), and stress
    T2's favorability proposals at their sharp points.
  - *Could close:* third-method confirmation of S2 and S5, or the exact defect.
- **`C2-F-03` `E1-R-LOAD-AND-TYPE-PATH-ADVERSARY`**
  - *Object:* attack E1-R on the literal network at fresh rows:
    - the `ρ_q·w` loads on targets with two or more chokes;
    - the (ii) type-path inequalities at `p*`;
    - Lemma A's edge cases `q = 1` and `q = m`.
  - *Could close:* bounded confirmation of E1-R's loads at fresh rows, or an exact failure.

**U (formal / structural)**
- ★ **`C2-U-01` `FORMAL-ELIG-TOP-PARENT-DESCENT`**
  - *Object:* after SR-4, formalize (ELIG-top)(a) as an integer theorem about the closed-form polynomial:
    - the block identity;
    - the `S_5` degree-50 certificate (explicit shift, `norm_num`, no `native_decide` in the universal step);
    - C1-LA3's (BD).
  - Name the link to `cbGraph` as the remaining node.
  - *Could close:* (ELIG-top)(a) `formally_verified` on the closed form, which is Tier 2 progress.
- ★ **`C2-U-02` `FORMAL-CB-SECTOR-COMPOSITION-INSTANTIATION`** (AG-U-D, carrying C1-LA2's layer and AG-U-B)
  - *Object:*
    - Lemma 0 over `cbGraph`;
    - choke-state extraction;
    - Out, Lemma 2′ and Lemma 3′;
    - the target case split.
    The E1 flow and the per-state inequalities enter as hypotheses, and the conclusion is terminal conjunct 4.
  - *Could close:* the conditional conjunct-4 theorem, which leaves the terminal dependent only on named hypotheses.
- **`C2-U-03` `FORMAL-CB-INDEPENDENCE-POLYNOMIAL-CLOSED-FORMS`**
  - *Object:* prove in Lean that the layer counts of `cbGraph m`, `cbGraph m − v` and `cbGraph m − c` are the coefficients of the
    closed forms of record.
  - This is infrastructure. The closed forms are a registered `proved_informal` node, so this is not Tier 2 progress; conjunct 2 and
    favorability need it.
  - *Could close:* the formal link from `C5LA1.crossingIndex (cbGraph m)` to the closed-form coefficients.

## Registrations

Every item was first stated at Stage 4, 5 or 6, so each is **STATED** and needs the named isolated second read before registration.
The controller funds and seats the reads (Opus 5.5, high). Key names are predicates, class-scoped, never "FOR-EVERY-M".

| # | Proposed registration or update | Grade on registration | Attribution (on the face) | Read |
|---|---|---|---|---|
| R-1 | NEW `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107` (S1 ∧ S2, template level, intercept table on the face) | `proved_informal`. It becomes `formally_verified` at template scope if C1-LA1 closes | T1 (allocation); C-F2-U, C-F1-T (independent); C-T1-F, C-T1-U, C-F1-T, C-F2-T, C-F2-U (Residual); r30 template; Codex GPT-6 mechanism | **SR-1** |
| R-2 | NEW `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-E1-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107` (S3, sufficient). This is the row-free extraction of r30's row-key certificate paragraph, which the U adjudicator ruled is not an alias; r30 attribution travels | `proved_informal` | U2; C-U2-T, C-U2-F (repairs); r30 structural argument and B7 | **SR-3** |
| R-3 | SCOPE NOTES on the criterion and threshold keys (S4, Lemma A); **no new key** (CF6-5) | `proved_informal` | C-U3-T; U3 (`q = 1`); C-U3-F (corroboration) | **SR-2** |
| R-4 | NEW `E993-R31-CB-8-TOP-RANK-PARENT-DESCENT-HOLDS-AND-TOP-RANK-IS-ELIGIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107` (S5, with Lemma B S6 as a node) | `proved_informal` (Darroch/Newton-free) | T3 (block identity and steps); C-T3-F, C-T3-U, C-F3-T, C-F3-U (`S_5`/`J` certificates); C-U3-T (closing step, Lemma B), C-U3-F (block signs); r31 synthesis (composition) | **SR-4** |
| R-5 | NEW `E993-R31-CB-8-TOP-RANK-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL-ON-THE-RESIDUE-2-CLASS-FROM-107` (Tier 1). Register **only after** SR-1..4 pass | `proved_informal` modulo Darroch/Newton via the favorability key; not decisive | All of the above; favorability and criterion keys at their grades (r30) | **SR-5** (the assembly read: every hypothesis of R-2 discharged) |
| R-6 | NEW `E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-WITH-RATES-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-LEG-COUNT-IS-INFEASIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107` (S7: F-2 with Theorem N as a node; a template failure, not a cut). Optional | `proved_informal` | C-T2-F, C-T2-U; T2 (flat case) | **SR-6** (optional) |
| R-7 | SCOPE NOTES listed under `## Headline verdicts`: (HALL), favorability, deficit, row key, `θ*` law, bounded record | as stated there | as stated there | with the read of the item each note cites |
| R-8 | RECORD: the carry-source caution (r30 C1-LA2 0014–0021 are pre-freeze bytes) | record | this synthesis | none (digest fact from `SOURCE-DIGESTS.json`) |

**Not proposed.**
- The `θ*`-law optimality (C-F2-U F-9): one critic, not load-bearing. **SR-7** is optional and only if the controller wants the r30
  conjecture settled.
- The `θ_budget` floor: no exact form on any face.
- The fresh-row candidate key of F1: subsumed by R-1, and recorded as a scope note on it.
- U3's method-named key: not registrable.
- T2's Jensen proposal: not registrable.
- The CB structural layer: r30 content.

**Suggested read seating.** SR-1..SR-4 are independent and can run concurrently. SR-5 runs after them. The award receipts of
C1-LA1 and C1-LA3 can serve as inputs to SR-1 and SR-2, but do not replace them.

## Continuation ruling

No decisive event occurred. Tier 1 is not `formally_verified`, the formal chain (C1-LA1..3, then AG-U-D, (ELIG-top)(a) formal,
favorability, the closed-form link and the terminal) is the run's remaining work toward decisive event (a), and the ceiling allows five
more cycles. Cycle 2 should run.

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-S/`. It uses the Python
standard library only (`fractions`, `math`, `json`), run with `python3 -B` in the foreground. The instrument's one run took about 81 s.

| File | SHA-256 | Role |
|---|---|---|
| `syn_check.py` | `b001285fdcb4255058548b333f0700ce246416be86828e5e247c335b0c41317f` | Recurrence (R) on a grid; at `m = 107, 110, 113, 161, 302`: E1(i) and gap `2q+1` at every `q`; block gap `2j−8` and descent for every `j ≥ 5`; block pattern; block identity against the direct closed form; parent descent; Residual and margins |
| `syn_check_out.json` | `e162a2511a94533180aaa40dfe575443a303897b866681256037795d1e668d3f` | 0 failures throughout; margins 34.90, 35.88, 36.85, 52.48, 98.38 |
| `carry_digests.txt` | `0daead7b4a7053dadf13bbacb291f157e58679c0deef4e4d5cfde5d1410bf644` | Full SHA-256 of r30 C1-LA1 entries 1–21, C6-LA2 entries 1–21, 35, 123, 124 and C1-LA2 entries 30, 31 (from `SOURCE-DIGESTS.json`) |

To replay: `cd` into the scratch root and run `python3 -B syn_check.py > syn_check_out.json`.

**Jobs.** No background job was started. A name-scoped `pgrep` before the final write matched nothing. The only file written outside
the scratch root is this `SYNTHESIS.md`.
