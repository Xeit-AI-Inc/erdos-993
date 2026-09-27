# Cycle 1 Neutral Synthesis

Run r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993: correctly weighted mixed-boundary transport for the
remaining ordinary-tree favorable-leaf aggregate. Cycle 1, Stage 6 (neutral synthesis). Date 2026-09-26.

**Boot.** I am operating within VerityOS. For the boot I read exactly the constitution `verity.md` and the startup protocol
(`identity/startup-protocol.md`), as the dispatch directs. The subsystem loaded is `experiments/`, limited to this run's sealed
Stage 6 capsule. I read no other VerityOS file. The harness injected the root `CLAUDE.md` and the user auto-memory index into
context at session start. I did not open either as a source, and nothing below relies on them.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

**Dispatch capsule.** `control/C1-STAGE6-DISPATCH-MANIFEST.json`. I recomputed SHA-256 over the canonical JSON without
`seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline). The result is
**`6ab566af95c1c0464fad55bd90e2be8fbc62c192d9a5401db5c2e47f44923e2a`**, equal to the dispatched value. All 12 listed members
match their SHA-256 and byte counts, with 0 mismatches:

| member | sha256 (prefix) | bytes |
|---|---|---|
| `SEMANTIC-CONTRACT.md` | `ee7ca2e2…` | 17018 |
| `SOLUTION-CONTRACT.md` | `3168e7a1…` | 13035 |
| `control/C1-ALLOCATION.md` | `fa8b5c18…` | 16577 |
| `control/C1-STAGE1-GATE.md` | `9925d820…` | 6889 |
| `control/C1-STAGE5-PACKET-MANIFEST.json` | `96646590…` | 7716 |
| `control/C1-STAGE6-CONTROLLER-FACTS.json` | `91546889…` | 7074 |
| `control/C1-SYNTHESIS-PROTOCOL.md` | `48ba02be…` | 5263 |
| `control/PATH-CHECK-c1-stage6-dispatch.json` | `92a54806…` (0 findings) | 528 |
| `control/SOURCE-DIGESTS.json` | `e82494df…` | 232777 |
| `cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md` | `74c0f37f…` | 38823 |
| `cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md` | `44f0fe81…` | 38907 |
| `cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md` | `e461798e…` | 47515 |

**Stage 5 packet manifest.** Recomputed the same way, its seal is
**`3e2b73b64f3de6abbd0629013c6181d0c1afca2bf68fb6660aeede19953352e4`**, equal to the recorded value. Of its 41 members, I verified
the 21 that fall inside my grant: the two contracts, the allocation, the Stage 1 gate, `SOURCE-DIGESTS.json`, the three
adjudications and the 13 frozen `sources/` files. All 21 match. The other 20 members lie outside my read grant (Stage 5 capsules,
dispatches, controller facts per orientation, `control/r30_tool.py`), so I did not hash them.

**Frozen sources.** All 981 entries of `control/SOURCE-DIGESTS.json` re-hash with **0 mismatches**. For the WID award carry
plan I also checked the frozen first-interior source
`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`:
- it has SHA-256 `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9` and 61,296 bytes;
- for entries 1–14, 18 and 42, the `Snippets/` fragment SHA-256 equals the digest on the entry's `BEGIN` marker;
- entry 42's helpers (`support_spec`, `support_adj`, `support_unique`, `H_subset_R`, `leaf_insert_indep`, `tagged_count_split`, …)
  are `private` and live inside the entry;
- entry 42 takes the shadow bound as a hypothesis (`hShadow`), not by reference to entry 41. This confirms that entry 41 need
  not travel.

**Adjudicator identities.** All three adjudications disclose "chartered opus/high; transport-resolved model opus (explicit
parameter); runtime-reported model id: claude-opus-5-5[1m]". Each reports its own capsule seal as matching:
- T: `f12bc8b8…8d73`;
- F: `bd7e09ee…6e6c`;
- U: `359a5264…d5ab7`.

Each also reports the Stage 2, 3 and 4 seals (`886ece6b…`, `da784de8…`, `94bd9f13…`) as matching. I take these from their faces;
the capsules are outside my grant.

**Process record weighed** (CF6-2, CF6-6; none touches a number relied on below):
- Incident R30-I-1: Stage 4 was sealed while C-U1-F was still writing. The sealed text carries two placeholders, and a
  background job outlived the text's claim that none remained. The U adjudicator weighs the late sweep as a self-report only.
  I note the validator gap for the controller.
- Seat deviations: F1's `ps aux` listings; F2's `__pycache__` under `sources/` (981/981 intact, re-confirmed here);
  non-recursive listings above grant by T2, F2 and the U adjudicator; transient copies deleted unread; C-T1-F's boot-order slip;
  orphaned critic wrappers killed by PID.

**My own read boundary.**
- Read: the dispatch file, the protocol, the 12 capsule members, and frozen files under `sources/`. I read the first-interior
  `Main.lean` and its `Snippets/` directory, and ran one non-recursive `ls` and one `grep` inside that directory, within my grant.
- Not read: `control/controller-facts/CF-REPLAY-c1.json` (cited by CF6-0, not a capsule member), any raw return, critique,
  scratch directory other than my own, or any other experiment root.
- **Disclosure 1.** I wrote one transient copy of the F adjudication, a capsule member, into the harness's session scratchpad,
  which is outside the run root. I read only its line count, deleted it, and then read the member in place.
- **Disclosure 2.** The harness saved the oversized T adjudication output into its session tool-results store, and I read it
  from there. The content is the capsule member.
- No network, no installs, no Lean invocation, no background job.

## Reconciliation

I reconcile claim by claim, with no majority vote and no appeal to lower tiers. For each claim the grade given is the lowest
across the adjudications that rule on it, unless one adjudication holds a replay that the others lack.

**R1. (WID): all three agree.**
- Scope: every finite simple graph, every finite `F` of degree-one vertices, `p ≥ 1`.
- Status: proved at `proved_informal`, re-derived independently by the T, F and U adjudicators.
- U additionally rebuilt the scratch Lean. All 18 new declarations compile, with axioms exactly `{propext, Classical.choice,
  Quot.sound}`. The `hpk2` warning is harmless.
- No disagreement.
- My own spot-check (`scratchpad/c1-S/s_check.py`) is one more replay, not evidence: 1,293 random general-graph `(G, F, p)`
  instances with 0 failures, and the `K_{1,3}`, `p = 0` guard witness `(0, 6)`.

**R2. The `p ≥ 1` guard: resolved, and consistent across F and U.**
- F rules for C-F2-U: the guard is load-bearing for the Δ-form (`K_{1,3}`, `p = 0`: 0 against 6).
- U rules that both U2 critics are right at their scopes:
  - the general-`F` lemma needs `hp`;
  - the terminal theorem at `F = F_p(G)` holds unguarded, because `F_0(G) = ∅`. This is compiled as
    `activeWeightAggregateIdentity_unguarded`.
- Ruling: the frozen terminal theorem keeps `hp`, as SOLUTION-CONTRACT §2 has it. The unguarded form may ride as a companion.
  The draft contract's `hp_guard` sentence must be rewritten.

**R3. (HALL⇒FLOW) formal status: an apparent disagreement, resolved by capsule scope.**
- F records the formal node as "OPEN", but explicitly defers compiled status to U because U2's build was outside F's capsule.
- U rebuilt it: `exists_saturatingFlow_of_weightedHall` compiles via `Fintype.all_card_le_filter_rel_iff_exists_injective`
  (pinned `Mathlib/Combinatorics/Hall/Basic.lean:196`, spot-checked by U) on the clone expansion.
- Ruling: kernel-checked in scratch, with no grade until an award closes. The informal proof is `proved_informal` once C-F2-U's
  completion sentence is on the face.

**R4. Carry set for the WID award: resolved.**
- CF6-4 and both U2 critics give entries 1–6, 8–13, 18 plus the whole of entry 42.
- The controller's CF-U-2, as reported by U, gave 1–14, 18.
- Ruling: U's minimal set (entries 1–6, 8–13, 18, 42). My marker check is above.
- Entries 7 and 14 are harmless extras. Entry 14 (`crossingIndex`) will be needed by any (HALL) award.
- Entry 41 is not needed. I confirmed that entry 42 uses `hShadow`, not `taggedShadowBound`.

**R5. Is "(HALL) strictly stronger than `S ≤ 0`"? A terminological disagreement between T and F, resolved.**
- T's position (C-T2-U): "strictly stronger in general" is struck, because no separating instance exists. That is, no
  eligible row has `S ≤ 0` while (HALL) fails.
- F's position (C-F2-T, C-F2-U, E4): on eligible rows from order 14, a positive-weight target unreachable by any arc exists. So
  the (HALL-COND) inequality at `X = I_{p+1}` has a strictly smaller right side than `S ≤ 0`.
- Both are right:
  - (HALL) is **strictly stronger as a statement** on the eligible domain, on two exhibited counts: the subfamily quantifier,
    and unreachable positive capacity at the whole-layer cut.
  - **No instance separates them in truth value.** (HALL) saturates on every such row.
- Registered wording: "(HALL) ⇒ `S ≤ 0`; the (HALL) inequality is strictly stronger on exhibited eligible rows; no separating
  instance is known".

**R6. Where switch arcs become load-bearing: T, F and U agree, and the pieces compose.**
- The criterion "the root-plus-arm sector `X_sec` of `CB(d, m)` is deletion-only deficient iff `3p < 2dm + 5`":
  - stated by C-F1-T and C-F1-U;
  - re-derived by the F and U adjudicators;
  - the same threshold appears as C-T1-U A1 and C-T1-F Lemma C (i) (`δ ≥ 1` iff `3p ≥ 2N + 5`, `N = dm`).
- The exact scans (F and U, `n ≤ 1600`) find exactly three eligible sector-deficient rows. My arithmetic replay confirms
  `n = 3 + m(2d + 1)`, the strict inequality and the ratios.

  | row | `p` | `n` | ratio |
  |---|---|---|---|
  | `CB(8, 86)` | 460 | 1465 | 460/459 |
  | `CB(8, 89)` | 476 | 1516 | 476/475 |
  | `CB(8, 92)` | 492 | 1567 | 492/491 |

- **Composition, first stated here (STATED; isolated second read required).** T's E1 (sector normalized matching, every
  sector subfamily) combined with F's E5 gives: deletion-only Hall holds on every subfamily of the `CB(d, m)` root-plus-arm
  sector **iff** `3p ≥ 2dm + 5`. E1 gives sufficiency; E5's `X_sec` gives necessity.
- F says "no tested instance needs a switch arc". T's E3/E4 is a PROOF that the switch exits cover every sector subfamily at
  `CB(8, 92)`, `p = 492`, and T's item 4 says Lemma C (ii) covers `CB(8, 86)`, `p = 460`. These do not conflict:
  - F's statement is about computed flows;
  - T's is a proof over sector subfamilies only (STATED, critic-attributed).
- Ruling: at the three rows, the mixed relation is proved (STATED) to cover the root-plus-arm **sector subfamilies**.
  - `CB(8, 89)`, `p = 476` is not individually replayed in any capsule. It presumably lies in T's B3 class (ii), but this
    synthesis does not assert that.
  - (HALL-COND) for `X` not inside the sector is open at all three rows.

**R7. The first uncovered sector rows: an internal literal ambiguity in T.**
- T's B3 says "the first at `CB(7, 144)`, `p = 673`".
- T's item 4 names `CB(8, 108)`, `p = 577` as well. Its order (`n = 1839`) is smaller than `CB(7, 144)`'s (`n = 2163`).
- Neither F nor U rules on this. Ruling: both rows are recorded as uncovered by Lemma C, and "first" is not asserted. The
  Cycle 2 T1 route must state its ordering (by `n`).

**R8. Registration form of U1's invariant-cut reduction (INV).**
- C-U1-T proposes a companion to (LIFT); C-U1-F proposes a predicate-form key.
- U rules for the predicate-form key `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, with scope widened to every finite
  simple graph, every `p` and every `Γ`-invariant `F`, and with a limited novelty claim.
- CF6-5(ii) asks the synthesis to choose ONE key. **I choose C-U1-F's predicate key**, with a `CLAIM-DISTINCTIONS` row against
  (LIFT):
  - the (⇐) half is (LIFT)'s content;
  - the new content is the (⇒) summation converse, the automatic `Aut(G)`-admissibility and invariance of `F_p(G)`, and the
    canonical invariant cuts `X_min`, `X_max`.
- U1's noun-phrase candidate `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION` is retired.

**R9. D8 (`E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`).**
- Both F2 critics and the F adjudicator (three instruments) find the literal inequality failing at order 11 (4/5 rows).
- The frozen registry says witness minimality is "Not asserted or tested", so there is no conflict with the registered order-14
  witness.
- (HALL) saturates on every D8-failing row. A scope note, not a correction.

**R10. The fixed selector never binds.** T (orders 11–14, and `CB`), F (orders 11–18) and C-T2-U (13,867 census rows plus
27,824 family rows) agree: on every eligible row computed, `F_p(T)` is the whole leaf set. This is a coverage fact, not a
theorem. It means no instrument has exercised the fixed-selector rule.

**R11. Controller facts, weighed as one more replay each.**
- CF6-0 (the factor `m`; margin 7012) agrees with both T1 critics and the T adjudicator.
- CF6-1 (errata R30-E-a, R30-E-b) is confirmed by all three orientations. No portfolio number is struck under R30-E-b: every
  instrument implements `(B ∖ {v}) ∩ W_v ≠ ∅`.
- CF6-3 agrees with the per-order counts in T and F.
- CF-F-1's phrase "F1's independently derived cumulative counts match" is **corrected** by the F adjudicator: F1's shipped
  files start at order 13. The numbers themselves are true.

**No disagreement is left unresolved.** R7 is recorded as an open literal to be fixed by a Cycle 2 route. None of these
reconciliations consulted a return, a critique or scratch outside my grant.

## Exact established results

"STATED" means first stated at a review stage (Stage 4, 5 or 6). A STATED item needs an isolated second read before
registration.

**Proved at statement level (`proved_informal`):**

| # | Statement (exact scope) | Hypotheses | Grade / status | Attribution |
|---|---|---|---|---|
| P1 | **(WID)**: `Σ_{I_{p+1}} w_F − Σ_{I_p} w_F = Σ_{v∈F} [Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v)]` for every finite simple graph `G`, every finite `F` of degree-one vertices and every `p ≥ 1`. With `F = F_p(G)`, the right side is `C5LA1.aggregate G p`, so supply − capacity = `S(G, p)`. | `deg v = 1` for `v ∈ F`; finiteness; `p ≥ 1` (general form only). No `IsTree`, no eligibility. | `proved_informal` (three adjudicators); kernel-checked in scratch (U2; U rebuild). Status OPEN until C1-LA1. | Mechanism and active-tag weight: Codex GPT-6, lower-region run. Proof: r30 F2 and U2 (Sonnet 5). Critics C-F2-T, C-F2-U, C-U2-T, C-U2-F. |
| P2 | (FLOW⇒SIGN): a saturating flow gives `S(G, p) ≤ 0` on every finite simple graph. It uses (HALL-COND) only at `X = I_{p+1}`. | P1 | `proved_informal`; kernel-checked in scratch | F2; U2 |
| P3 | (HALL⇒FLOW) and its converse: (HALL-COND) for every `X` ⇔ a saturating integral flow exists, on every finite simple graph, every `F` and every `p`. Also: both arc types land in `I_p` (`transportRel_mem_indepFamily`). | finiteness; target weights `≥ 0` | `proved_informal`; kernel-checked in scratch. The iff and the layer closure are critic-first, so STATED as keys. | F2; U2; C-U2-T and C-U2-F (converse, iff, layer closure) |
| P4 | **(INV)**: `φ(X) = Σ_X w − Σ_{N(X)} w` is supermodular. Its maximizers form a lattice. `X_min` and `X_max` are fixed by every network automorphism. Every `Γ ≤ Aut(G)` is admissible, and `F_p(G)` is `Aut(G)`-invariant. Hall ⇔ Hall on unions of `Γ`-orbits ⇔ quotient Hall. If (HALL) fails at `(T, p)`, it fails on an `Aut(T)`-invariant family of positive-weight sources. | finiteness; target weights `≥ 0`; a group preserving the relation and both weights | `proved_informal`, STATED | U1; C-U1-T, C-U1-F (canonical cuts, the omitted step); (LIFT) for (⇐) (Codex) |
| P5 | **Sector pair-product normalized matching (E1).** Let `Q` be independent with `G − N_G[Q]` an induced perfect matching on `N` edges. Then for every `X ⊆ S^Q_{\|Q\|+k}` (`k ≥ 1`): `k·\|X\| ≤ 2(N − k + 1)·\|∂_Q X\|`. | finiteness; independence of `Q`; the induced-matching hypothesis. No tree, weight or eligibility. | `proved_informal`; the corrected hypothesis is STATED | T1 (Lemma 1); C-T1-F, C-T1-U (corrected hypothesis) |
| P6 | Switch-image weight on the `CB` sector: `w_F(A) = ℓ_i(B)` for a choke switch, with exactly `d − ℓ` sector preimages. The `s`-switch and the deletions of `r` and `v` give weight 0. | literal (S); `F` fixed | `proved_informal` | T1; both T1 critics |
| P7 | **Lemma C** (conditional sector Hall on `CB(d, m)`): (i) `δ ≥ 1` ⇒ deletion-only sector Hall; (ii) the `x₀ > 0` branch, with its stated conditions. | `v ∈ F_p`; private leaves in `F_p` (for (ii)); literal (D) ∪ (S) | `proved_informal` modulo ONE cited classical node, the second-eigenvalue bound `λ₂(BBᵀ) = 2(k−1)(N−k+1)` on the rank-`k` layer of `{0,1,2}^N` (exact PSD replay on 13 `(N, k)` pairs by T). STATED. | C-T1-F; C-T1-U (A1 = (i)) |
| P8 | Sector criterion: `X_sec` is a deletion-only deficient cut iff `3p < 2dm + 5`, for `v ∈ F_p` and `2 ≤ p ≤ dm + 1`. Its positive-weight deletion shadow is exactly `R_{p−2}`. | as stated | `proved_informal`, STATED | C-F1-T, C-F1-U; F and U adjudicators (re-derivations) |
| P9 | Composition of P5 and P8 (R6): deletion-only Hall on every sector subfamily iff `3p ≥ 2dm + 5`. | as P5, P8 | `proved_informal`, STATED (by this synthesis) | T1 and C-T1-F/U; C-F1-T/U; synthesis |
| P10 | Reachability lemma: on triangle-free graphs, a target `A` has no in-arc iff `A` is maximal independent and no `u ∈ A` has two private neighbours. On general graphs, read "two non-adjacent private neighbours". | triangle-free for the short form | `proved_informal`, STATED per CF6-5 | F2; C-F2-T (general), C-F2-U |
| P11 | Unreachable positive-weight targets on the families `G_k` and `T(m, k)`: the targets are independent and maximal, with no two private neighbours, for all parameters. | P10 | `proved_informal` for unreachability. Eligibility and favorability are bounded only (`3 ≤ k ≤ 1500`; `4 ≤ m ≤ 60`). STATED. | C-F2-T, C-F2-U; F adjudicator |
| P12 | Necessary structure: an unreachable target on an eligible row forces `min(\|P\|, \|M\|) ≥ p/2`. | König; bipartiteness | candidate `proved_informal`, STATED | C-F2-T; F adjudicator (checked argument) |
| P13 | §B1 literal-weight identity: `Σ_B \|F∩B\| − Σ_A \|F∩A\| = Σ_v Δ_{p−1}(H_v)`. The allocation's suggested `Σ_v Δ_{p−1}(T − v)` is false (−1715 against −1406). | degree one | `proved_informal` | F2; both F2 critics |
| P14 | Hierarchy (E6): for eligible `(T, p)`, `D + C − (2α+1−3p)Q_{p−1} = −(p−1)S`. So budget ⟺ `Q_p ≤ Q_{p−1}` ⟺ `S ≤ 0`, instance by instance. | DCB (VERIFIED `proved_informal`); `α(H_v) = α − 1`; `k ≥ 1` | `proved_informal`, STATED as a relation | T2; C-T2-U |
| P15 | Chain (E7): `CT_x` ⇒ FLAT ⇒ CURRENT-RANK ⇒ budget, with CURRENT-RANK ⟺ `kS ≤ −C`. | eligibility | `proved_informal`, STATED (a relation among OPEN keys; alias check required) | C-T2-U |
| P16 | Support-move lemma: (a) `(B ∖ {v}) ∪ {s_v}` is independent iff `v` is inactive in `B`. (b) If so, the weight change is `#{t ∈ (F∩B)∖{v} : t inactive, s_t ~ s_v} ≥ 0`. | finite simple graph | `proved_informal`, STATED (route record, not a key) | C-U1-T, C-U1-F; U adjudicator (2,493-case check) |
| P17 | `α(H_v) = α(T) − 1` for every original leaf; `D ≥ 0`; the `C_v` indicator identity for all `m`, with `W_v` independent (true in a tree). | degree one; bipartiteness; acyclicity | `proved_informal` (re-proofs supporting the VERIFIED DCB; nothing new to register) | C-T2-F, C-T2-U |

**Bounded computation (`bounded_computation`; never proof):**
- **B-a. Eligible-row census.** Free trees up to isomorphism (canonical forms named; A000055 asserted):
  - rows per order: 5 at 11, 34 at 12, 163 at 13, 313 at 14, 528 at 15, 2,763 at 16, 10,061 at 17, 37,295 at 18 (51,162
    through order 18), and 144,521 at 19 (C-F1-T only);
  - every row has nonempty `F`, (WID) asserted, and saturates **with deletion arcs alone**;
  - instruments: F adjudicator, C-F1-T, C-F1-U, and the controller to order 16;
  - 0 eligible rows at orders ≤ 10 (erratum R30-E-a).
- **B-b. Unreachable positive-weight targets on eligible rows.**
  - order 14: 11 rows, gap 2;
  - order 17: 24 rows, gap 2;
  - order 18: 43 rows, gaps 3 (24 rows) and 1 (19 rows);
  - none at orders 11–13, 15 or 16;
  - every such row saturates.
- **B-c. `CB(d, m)` orbit-quotient rows** (`n ≤ 114`: C-F1-T 162 rows, C-F1-U 211 rows; C-U1-F 115 rows, a post-seal
  self-report) and brute-force rows `CB(1, 7)`, `CB(1, 8)`, `CB(2, 5)`: all saturate deletion-only.
  - `CB(1, 7)`, `p = 10`, is the smallest eligible `CB`: 29190/58002, `S = −28812`, 124,593 mixed arcs. Five instruments agree.
- **B-d. `CB(8, 92)` record** (see Headline verdicts).
- **B-e. Sector switch exits.** Their weight is 6,128.8×, 6,563.1× and 7,012.3× the deletion deficit at the three sector-deficient
  rows (F adjudicator, brute-validated on three small `CB`). This replays C-F1-T.
- **B-f. T's `CB` coverage sweep** (`d ≤ 12`, `m ≤ 400`, critic): 551,129 rows in class (i), 391 in class (ii), 2,724
  uncovered. No deficit row has an unfavorable private leaf.
- **B-g. `Q_j` monotonicity and log-concavity.** No failures on all 515 rows to order 14 (controller) and on T2's 1,047 rows.
  This is a strictly stronger sufficient condition with vanishing slack, and is not registrable.
- **B-h. The order-11 double broom**: `α = 9`, `x = 4`, `p = 6`, 255/516, `S = −261`, saturating.
- **B-i. D8 literal failures** at orders 11–13: 4/5, 33/34, 161/163 (three instruments).

## Refuted or narrowed mechanisms

**Refuted steps.** All are route records, not registered mechanism keys; exact finite witnesses exist, with two instruments each.
- "`φ(C(X)) ≥ φ(X)` for all `X`", for the leaf→support shift and the cross-support leaf shift, is refuted by singleton
  witnesses on eligible saturating instances (C-U1-T, C-U1-F; U replay). The obstruction is capacity growth through `s_v`.
- U1 §6, "support compression weakly decreases the active weight", is **false**: its proof conflates presence with activity,
  and the truth is the reverse (P16).
- "Tag-by-tag induction through the deg-2 collapse" is refuted. The `T_22` marked arm has
  `q_v(j) = C(66, j − 1)`, with per-leaf term `+212336130412243110` (C-T2-U; T replay).
- T1 §4 under `H ≤ Aut(T)` swapping `b_i ↔ c_i` is vacuous (`deg b_i ≥ 2 > 1 = deg c_i`). It is re-stated as P5.
- A sector-Hall failure despite a positive whole-sector margin (abstract sector `(7, 1, 5)`: max-flow 651 against 672,
  deficiency 21). It is non-eligible, so it is not a (HALL) cut. It shows any sector lemma must use `m` and eligibility.

**Narrowed.**
- **"Deletion arcs suffice"** (active weight, no switches). No one proposes it as a key. It holds on every eligible tree of
  order ≤ 19 and on every computed `CB` quotient row, and **fails** at `CB(8, 86)`, `p = 460` (P8). So the switch arcs (S) are
  necessary to the mechanism.
  - It is **not** `E993-R23-LITERAL-DELETE-ONLY-HALL`, which has a different weight and a different sector object and stays
    REFUTED at its scope.
- **T2's scalar budget as a (HALL) route** is closed: by P14 the budget IS the primary aggregate, instance by instance.
- **The `Q_j` lead** is demoted.
- **F1's horizon** is narrowed to 3,296 open-band rows (the closed-band rows were skipped by citing sign theorems, which say
  nothing about flow existence). Its adversarial section is self-report only, and its "caterpillars with pendant pairs" is
  relabelled "pendant leaves".
- **U1 §4 as a generalization of (LIFT)**: the novelty claims are struck and it is narrowed to P4.
- **"`CB(1, 7)` is an instance of (HALL)"** is struck as worded. It is a single (HALL-COND) row at `bounded_computation`, with
  no switch exercised.
- **T1 §3 whole-sector switch numbers**: struck and corrected (the factor `m` was missing; the ratio is 7012, not 76). The
  conclusion `R_491 ≤ combined` survives. It is demoted to a single-`X` record.

**No refuted key is revived.** All three orientations rule this, and I concur. None of the ten keys of SOLUTION-CONTRACT §3.2 and
none of the C6-F4 own-support unit-capacity rule reappears:
- no per-leaf injectivity, domination, covariance or unit capacity;
- deletion-only statements appear only at active weight and sector scope.

F2's D-table stands at the categorical level once D5, D6, D7 and D11 are corrected; each of those four was an inverted or
misattributed reading, struck by both F2 critics.

**Fences held.**
- No closed region is re-proved: the `T_m` rows are self-checks only.
- No census value enters a proof. P7 at `p = 492` uses one exact coefficient as a numeric certificate, so it is graded
  `computer_assisted`.
- There is no RTree wording.
- (LIFT) is never used to supply feasibility, and `D, C ≥ 0` is never used as the budget.

## Headline verdicts

**(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: still open.**
- It is not proved at full scope and not proved at any restricted scope: no restricted-scope Hall theorem exists in any
  portfolio.
- It is not refuted: there is no deficient cut, and none has even a single instrument.
- **Smallest unproved lemma:** a switch-capacity (SW) statement covering the deletion deficit of every `X ⊆ I_{p+1}` where
  deletion-only Hall fails. Its first concrete instance is **(HALL-COND) at `CB(8, 86)`, `p = 460`, for every `X ⊆ I_461` not
  contained in the root-plus-arm sector.** Sector subfamilies there are covered by P7 (ii) (STATED).
- The next instances are `CB(8, 89)`/476 (sector coverage not individually replayed) and `CB(8, 92)`/492, where sector
  subfamilies are covered at every eligible `p` by P7 (STATED; `computer_assisted` at 492).
- Parallel smallest node on the sector side: sector Hall at the Lemma C-uncovered rows `CB(8, 108)`/577 and `CB(7, 144)`/673.
- Scope note for the controller:

  > r30 C1: bounded — every eligible row of free trees of orders 11–18 (51,162; order 19 by one critic) saturates with deletion
  > arcs alone; switch arcs first necessary at `CB(8, 86)`, `p = 460` (sector criterion `3p < 2dm + 5`, STATED); the (HALL)
  > inequality at `X = I_{p+1}` is strictly stronger than `S ≤ 0` on exhibited eligible rows (unreachable positive targets from
  > order 14), with no separating instance known; no deficient cut known; (HALL-COND) ⇔ saturating flow compiled in scratch
  > (critic, STATED); if (HALL) fails, it fails on an `Aut(T)`-invariant positive-weight family (P4, STATED).

**(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: proved (`proved_informal`) at full statement scope.**
- It is kernel-checked in scratch, sorry-free and axiom-clean.
- It changes OPEN → VERIFIED `formally_verified` **only** by award C1-LA1.
- Scope note: "graph-generic; no sign content; `p ≥ 1` load-bearing for the general-`F` form and not for the `F_p` form".

**Outcome-B lemmas proved or refuted this cycle.**
- **Proved `proved_informal`:**
  - P4 (INV), STATED;
  - P5 (sector normalized matching), corrected hypothesis STATED;
  - P6;
  - P7 (conditional, one cited classical node), STATED;
  - P8 and P9, STATED;
  - P10–P12, STATED;
  - P16, STATED.
- **Negative results** are in the section above.
- **Not attempted:** the NMP, SW, REC and BUD templates at parameter-uniform scope (P5 and P7 are NMP-type on one sector class).

**(CUT): none.** No candidate exists at any instrument count. Outcome C did not occur.

**`CB(8, 92)` record (`R30-CB-RECORD`, Tier 3; `bounded_computation`, with the proved sector facts noted).** Replayed by the T
adjudicator and both T1 critics by literal DP:
- tree data: `n = 1567`, `α = 829`, `x = 490` through `α`, eligible window `[492, 552]` (61 ranks), all 737 leaves favorable
  at every eligible `p`;
- the sector has constant weight 1, ratio `492/491`, and deletion-only shortfall `|R_490|/491` (the struck `493/491` stays
  struck);
- switch exits are 7,012.3× the deficit (T1's 76 is corrected; CF6-0);
- sector Hall holds for every root-plus-arm subfamily at every eligible `p`: `proved_informal` for `p ≥ 493`,
  `computer_assisted` at `p = 492` (margin 18,328; STATED);
- this is **not (HALL) on `CB(8, 92)`**. Subfamilies outside the sector are open.

**The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: OPEN, untouched.**
- A proof of (HALL) would imply it on every eligible `(T, p)`, by this certificate chain:
  1. a governed (HALL) award, i.e. `WeightedHall T (favorableLeaves T p) p` or the saturating-flow form;
  2. composed with (HALL⇒FLOW)/(FLOW⇒SIGN), or directly with `aggregate_nonpos_of_weightedHall` (C1-LA2 below), which rest on
     (WID) (C1-LA1);
  3. giving `C5LA1.aggregate T p ≤ 0`.
- That implication must then be registered as a scope note with its own composed certificate.
- Scope note now: "r30 C1: the scalar budget `D + C ≥ (2α+1−3p)Q` is equivalent to this key instance by instance (P14, STATED);
  (HALL) ⇒ this key via (WID)+(FLOW⇒SIGN); no status change".

**Other keys: unchanged by construction.** No r30 certificate bears on any of these, and I propose no scope note for them:
- `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (unchanged at its registered status);
- `E993-BETA-AGG`;
- TREE, FOREST, TRANSFER;
- **Erdős #993** itself.

**Fidelity corrections this cycle made to predecessor and controller records** (records only; sealed roots untouched):
1. **C6-F5.** The struck −1406/−6717 against the correct −1218/−5434 is localized: the original audit computed `S` correctly
   but used `w′ = |F ∩ B|` and never asserted supply − capacity = `S` (line 81 of the frozen `direct_audit.py`).
2. **C6-U5.** The struck `493/491` is localized against the correct `492/491`.
3. **SEMANTIC-CONTRACT errata.**
   - R30-E-a: the smallest eligible trees have order 11 (five trees; `α = 9`, `x = 4`, `p = 6`), not 13.
   - R30-E-b: the active test is `B ∩ W_v ≠ ∅`, not `B ∩ N(s_v) ≠ ∅`.
4. **Allocation item 4(a).** The suggested presence identity `Σ_v Δ_{p−1}(T − v)` is false. The correct form is P13.
5. **SOLUTION-CONTRACT §2 Lean draft.** It does not compile verbatim (four errors: noncomputable `support`, and two
   `DecidablePred` instances). The frozen award text must be the compiled phrasing, with C-U2-T's `CriticContract.lean`
   equivalence proofs (`rfl`/`congr`/`Iff.rfl`) on the face.
6. **Controller fact CF-F-1.** Its phrase about F1's independent cumulative counts is corrected (F adjudicator).
7. **D12 naming collision.** r28's order-22 "T22" differs from this program's `T_22` of order 91. Record the distinction.

## Lean awards

Awards are made only for stable declarations with closed dependency DAGs at their exact scope. Toolchain: Lean 4.32.2, Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, manual symlink of `.lake/packages`, `cd` into the pinned project before any `lake`
or `lean` call.
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`.
- Not permitted: `sorry`, `admit`, `native_decide`, `axiom`, and `decide` over an enumeration for a universal step.
- One terminal `theorem` per award. Companions are `lemma`s and carry no certificate (R29-N-12).

### C1-LA1: (WID), key `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`. **FUNDED (primary).**

**Expected statement** (namespace `E993Transport`, under `variable {V : Type*} [Fintype V] [DecidableEq V]` and the frozen
classical decidability):

```lean
theorem activeWeightAggregateIdentity (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) :
    (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) - layerWeight G (favorableLeaves G p) p =
      C5LA1.aggregate G p
```

**Hypotheses:** `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]` and `hp : 1 ≤ p`. `hp` is kept as in §2. It is not needed
for this form, since `F_0 = ∅`, and the face must say so.

**Face lemmas (companions, no certificate):**
- `layerWeight_sub_eq_sum`: the general form with `hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v` and `hp : 1 ≤ p`. `hp` is
  load-bearing here: `K_{1,3}`, `p = 0` gives 0 against 6, replayed by F, U and this synthesis.
- `card_active_eq_tagged`, the bijection `B ↦ B.erase v`.
- `layerWeight_eq_sum_card`.
- `tagWitnesses_subset_R`.
- `indepFamily_eq_indepSetsAvoiding`.
- `isGraphLeaf_of_mem_favorableLeaves`.
- `activeWeightAggregateIdentity_unguarded` (C-U2-F), optional.

**Carried fragments** (byte-identical transport only; entry number, name, fragment SHA-256, all checked here against the
frozen `Main.lean` markers and `Snippets/`):

| entry | name | fragment sha256 |
|---|---|---|
| 1 | `C4LA1.vertexDeletionIndepSetCount` | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` |
| 2 | `C4LA1.vertexDeletionForwardDifference` | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` |
| 3 | `C4LA1.IsFavorableAt` | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` |
| 4 | `C4LA1.IsGraphLeaf` | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` |
| 5 | `C5LA1.support` | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` |
| 6 | `C5LA1.leafSet` | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` |
| 8 | `C5LA1.H` | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` |
| 9 | `C5LA1.R` | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` |
| 10 | `C5LA1.indepSetsAvoiding` | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` |
| 11 | `C5LA1.indepSetCount` | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` |
| 12 | `C5LA1.forwardDifferenceDel` | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` |
| 13 | `C5LA1.aggregate` | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` |
| 18 | `E993Interior.taggedFamily` | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` |
| 42 | `E993Interior.highTailAggregateFromShadow`, whole fragment including its private `Leaf.*` helpers | `972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d` |

- Optional harmless extras: 7 (`C5LA1.leafDegree`, `ccfc9b2f…`) and 14 (`C5LA1.crossingIndex`, `378868ab…`). Entry 14 is needed
  by any later (HALL) award.
- Not carried: 41, 15–17.
- Alternative: re-author the four helpers publicly in `E993Transport` with a stated equivalence, and drop 42.

**New declarations the formalizer must author**, in `E993Transport`, from U2's compiled text:
- `indepFamily`, `indepFamily_eq_indepSetsAvoiding`;
- `tagWitnesses`, `activeWeight`, `layerWeight`, `favorableLeaves`, `isGraphLeaf_of_mem_favorableLeaves`;
- `tagWitnesses_subset_R`, `card_active_eq_tagged`, `layerWeight_eq_sum_card`, `layerWeight_sub_eq_sum`;
- `activeWeightAggregateIdentity`.

The network definitions `transportRel`, `IsSaturatingFlow` and `WeightedHall` are also frozen here so that they freeze once;
C1-LA2 consumes them.

**Fences on the face.**
- Graph-generic: no `IsTree`, no eligibility.
- No sign content: it does not imply (HALL), the primary aggregate, or anything about `S ≤ 0`.
- `activeWeight` tests `B.erase v` against `tagWitnesses G v = (N(s_v)).erase v`, never `|F ∩ B|`. The informal statement
  uses "another neighbour of `s_v`" (erratum R30-E-b).
- `F` is fixed at `p`.
- The `hp` reason is stated.
- No RTree wording.

**Excluded conclusions:**
- any claim about (HALL) or (HALL-COND);
- the sign of `S`;
- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`;
- any tree-only statement.

**Repairs required at freeze** (administrative; no mathematical change):
1. `layerWeight_sub_eq_sum` and `exists_saturatingFlow_of_weightedHall` become `lemma`.
2. Remove the unused simp argument `hpk2` (`Main.lean:1704`).
3. Freeze `noncomputable` and the classical decidability. Prefer `open Classical in` on `favorableLeaves` and `WeightedHall`,
   mirroring entry 13.
4. Node N8 needs a filter-congruence step (`Finset.filter_congr_decidable` or `convert`), not bare `rfl`, if the instances
   differ. U reports that the closing `rfl` is kernel-accepted in U2's phrasing; keep whichever compiles.
5. Record the explicit `G` binder of `layerWeight_sub_eq_sum` as the frozen phrasing, or restore the implicit one.
6. Rebuild the contract (`THEOREM-CONTRACT`), since the draft is not award-ready. It needs:
   - an `expected_statement` equal to the block above;
   - the full definition list;
   - correct dependency edges;
   - a correct `hp` note;
   - the signature deviation attributed correctly;
   - "Gate ruling 9", not "SOLUTION-CONTRACT ruling 9".
7. Mint entries 46+ through the registrar.
8. Exclude `Main.lean.bak1` and `Check.lean` from the capsule.
9. Carry C-U2-T's `CriticContract.lean` equivalences to the §2 draft text on the face.

**Attribution:**
- the active-tag weight, the mechanism and its corrections: Codex (GPT-6 Astra/Sol/Luna), lower-region run;
- definitions of record, entries 1–18 and 42: the first-interior run (Codex), on the r24/r25/r26 definition layers (`C4LA1`,
  `C5LA1`);
- the r29 high-tail certificates: context only; not on this face except as the closed region;
- the informal proof: r30 F2 (Claude Sonnet 5);
- the Lean proofs: r30 U2 (Claude Sonnet 5);
- companions and fidelity findings: C-U2-T, C-U2-F, C-F2-T and C-F2-U (Claude Opus 5.5);
- reconciliation: the T, F and U adjudicators and this synthesis (Claude Opus 5.5).

### C1-LA2: the network interface, (HALL-COND) ⇒ `S ≤ 0`. **FUNDED as a bounded attempt, after C1-LA1.**

Every node is kernel-checked in scratch over proved mathematics, so any open node is Lean engineering only.
- **Proposed key** (predicate form): `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`.
- The statement is a composition of the contract-stated companions (FLOW⇒SIGN) and (HALL⇒FLOW). It was first compiled as one
  declaration by a critic (C-U2-T), so it is **STATED**. It needs an isolated second read before registration, which the
  controller should fund alongside Stage 7.
- **Expected statement (draft):**

  ```lean
  theorem aggregate_nonpos_of_weightedHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
      (hp : 1 ≤ p) (h : WeightedHall G (favorableLeaves G p) p) :
      C5LA1.aggregate G p ≤ 0
  ```

  The Stage 7 formalizer freezes the compiled binder text. The meaning is fixed as above.
- **Companions on its face:**
  - `aggregate_nonpos_of_saturatingFlow` (FLOW⇒SIGN);
  - `exists_saturatingFlow_of_weightedHall` (HALL⇒FLOW);
  - `card_sigma_fiber_filter`;
  - `weightedHall_of_saturatingFlow`;
  - `weightedHall_iff_exists_saturatingFlow`;
  - `transportRel_mem_indepFamily`.

  The last three are critic-attributed and register only `proved_informal`, per R29-N-12.
- **Carried fragments:** as C1-LA1, plus C1-LA1's frozen `E993Transport` definitions. Mathlib:
  `Fintype.all_card_le_filter_rel_iff_exists_injective` (pinned `Mathlib/Combinatorics/Hall/Basic.lean:196`).
- **Fences:**
  - valid on every finite simple graph;
  - the hypothesis is (HALL-COND) for EVERY `X`. The proof uses it at `X = I_{p+1}` only; the face states this and states
    that the converse is false as a statement (R5);
  - `transportRel` is (D) ∪ (S) literally (exactly two neighbours, `u ∉ B`), neither wider nor narrower.
- **Excluded conclusions:**
  - (HALL) itself;
  - any tree or eligible-row instance of (HALL-COND);
  - the primary aggregate. This theorem is only the implication, and the aggregate key moves only when a (HALL) award
    composes with it.
- **Attribution:** as C1-LA1, plus C-U2-T and C-U2-F for the converse, the iff and the layer closure.
- **If Stage 7's budget ends before it closes:** it rides as companions on C1-LA1 at `proved_informal`, and the key is not
  registered.

### C1-LA3: (INV) quotient-free canonical cut. **No award attempted.**

- The informal DAG is closed (P4), but the statement is STATED and awaits its second read. An award would run ahead of its key.
- **Smallest unproved formal node:**
  `favorableLeaves_map_aut : (favorableLeaves G p).map γ.toEmbedding = favorableLeaves G p` for `γ : G ≃g G`. It feeds
  `exists_aut_invariant_deficient_of_not_weightedHall`, as drafted in the U adjudication.
- Routed to Cycle 2 route U1.

### C1-LA4: sector pair-product normalized matching (P5). **No award attempted.**

- The DAG is closed informally (biregular double counting; `Finset.card_mul_le_card_mul`).
- The corrected hypothesis is STATED, awaiting its second read. Priority is low: C-T1-U calls it a textbook lemma, and it
  closes no part of (HALL).
- Eligible for a Cycle 2 Stage 7 after the second read.

### Lemma C / sector Hall at `CB(8, 92)` (P7). **No award attempted.**

Not every open node is Lean engineering:
- (n1) the second-eigenvalue bound is cited, not proved on the face;
- (n2) is a certificate for `|X''|` at `N = 736`;
- (n3) is `F_492(CB(8, 92))`, which is all 737 leaves.

Smallest unproved lemma: (n1).

### Restricted-scope (HALL) theorem. **None exists.**

No award is possible. (HALL) at §2's statement is not Lean-ready. By P3, `WeightedHall T (favorableLeaves T p) p` on eligible
trees is the exact open object, and the interface to the flow and the sign needs no further glue.

## Progress and stop-gate ruling

**Stop gate (SOLUTION-CONTRACT §5).** Recorded, and **not armed** in Cycle 1: it arms from the Cycle 2 close under the
unarmed-early rule. Only decisive events halt now.
- (a) (HALL) is **not** `proved_informal` at full scope, and not formally verified. No uniform compensation theorem exists.
- (b) (HALL) is **not REFUTED**: there is no (CUT) with any instrument, so no second read is to be funded.
- (HALL) is **still open**, with smallest unproved lemma the (SW) instance at `CB(8, 86)`, `p = 460` for `X ⊄ X_sec`.
- No decisive event occurred.

**Material progress: yes.** Measured against the plateau test (a new lemma at `proved_informal` or better, or a new adversarial
finding):
- The prerequisite (WID) is proved at full scope and kernel-checked in scratch, ready for a governed award. So is the full
  Hall/flow/sign interface.
- New `proved_informal` lemmas: P4, P5, P7, P8, P10, P11 and P16 (several STATED).
- Adversarial findings:
  - the switch-necessary threshold and its first instance, `CB(8, 86)`, `p = 460`;
  - unreachable positive capacity on eligible rows from order 14;
  - the fact that every census to order 19 tests only the deletion half of the mechanism;
  - the non-binding selector.

**Plateau: no.** All three adjudications report `orientation_plateau: no`, and I concur. Much of the advance is critic-attributed
and STATED, which bears on registration timing, not on progress.

I would not invoke the stop gate even if it were armed. There is neither a decisive event nor a plateau.

## Next-cycle portfolio

Cycle 2 has six routes, two per orientation. No target is closed. Every route must:
- keep `w_F`, (D) ∪ (S) and `F_p` literal;
- compute `x` through `α`;
- assert supply − capacity = `S` before other output;
- apply the SOLUTION-CONTRACT §3 fences;
- report every eligible row with the full row data.

- **T1 `C2-T-01 CB-FAMILY-FULL-NETWORK-HALL`** (prove).
  - *Object:* (HALL-COND) for every `X ⊆ I_{p+1}` on eligible `CB(d, m)` rows, in three parts:
    - (O2) subfamilies not inside the root-plus-arm sector at `CB(8, 86)`/460, `CB(8, 89)`/476 and `CB(8, 92)`/492, with the
      sources `r ∉ B` competing for the choke-switch targets counted exactly (using P4 to restrict to
      `S_d ≀ S_m`-invariant families);
    - (O1) sector Hall at the Lemma C-uncovered rows (`x₀ ≤ 0`; `CB(8, 108)`/577, `CB(7, 144)`/673, ordered by `n`), by an
      expansion bound on the switch-dead family;
    - a proof of the spectral node (n1) on the face.
  - *Could close in one cycle:* the outcome-B lemma "sector Hall for every eligible `(CB(d, m), p)`" at `proved_informal`, and
    either a restricted-scope (HALL) theorem on the `CB` family (a separate key) or a statement-level plan with named open
    nodes.
- **T2 `C2-T-02 WEIGHTED-SECTOR-LYM-BEYOND-PAIRS`** (prove).
  - *Object:* generalize P5 from induced perfect matchings to sectors where `T − N[Q]` is a star forest, under the active
    weight. Characterize exactly which sectors of eligible trees are deletion-deficient, generalizing P9. State an (SW)
    lemma template of the form "the switch exits of a deficient sector carry its deficit", cross-tag, since E8 forbids
    tag-by-tag.
  - *Could close:* a star-forest weighted-LYM lemma at `proved_informal`, and the deficient-sector characterization. Any
    deletion-only statement must say on its face why it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`.
- **F1 `C2-F-01 SWITCH-NECESSARY-REGIME CUT SEARCH`** (falsify).
  - *Object:* the smallest tree of ANY shape on which active-weight deletion-only Hall fails. It is currently between order 20
    and 1465. Search structured families: unequal branch sizes, several arms, pendant-pair caterpillars (untested),
    generalized chokes.
  - At every such row: exact mixed max-flow, full or by a brute-validated quotient. A quotient deficit gives an invariant
    original cut via P4 and must be exhibited, with two instruments.
  - *Could close:* a confirmed (CUT), which is decisive (then an isolated second read). Otherwise, the first
    brute-force-checkable row where the switch arcs are load-bearing and saturate.
- **F2 `C2-F-02 SELECTOR-BINDING AND UNREACHABLE-CAPACITY`** (falsify).
  - *Object:* prove, or refute by construction, "on every eligible `(T, p)`, `F_p(T)` = the whole leaf set". No instrument has
    ever exercised the fixed selector (R10). If it is refuted, test (HALL) on the binding rows.
  - Also: prove uniform eligibility and favorability for `G_k` (`k ≥ 3`) or `T(m, 2)` (`m ≥ 4`), and carry the second-read
    material for P10–P12.
  - *Could close:* a parameter-uniform `E993-R30-…` family key at `proved_informal`. Either a selector lemma (which would
    simplify every (HALL) statement) or the first selector-binding eligible rows with exact flows.
- **U1 `C2-U-01 LEAN-INV-AND-SECTOR-FORMALIZATION`** (formal).
  - *Object:* in a scratch project on C1-LA1's frozen definitions:
    - `favorableLeaves_map_aut`, `activeWeight_map_aut`, `transportRel_map_aut`;
    - supermodularity and the maximizer lattice over `Finset (Finset V)`;
    - `exists_aut_invariant_deficient_of_not_weightedHall`;
    - then P5 (`sectorPairProductNormalizedMatching`) after its second read.
  - *Could close:* a kernel-checked (INV) and (NM), ready for Cycle 2 Stage 7 awards once their keys register.
- **U2 `C2-U-02 EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-NETWORK`** (structural and computational).
  - *Object:* prove on the face a lift for **equitable** partitions: a quotient flow spreads to a fractional saturating flow,
    and max-flow integrality then gives an integral one. This is coarser than orbits and is not (LIFT).
  - Apply it to the FULL networks of `CB(8, 86)`/460, `CB(8, 89)`/476 and `CB(8, 92)`/492. `S_d ≀ S_m` orbit quotients are out
    of reach (54 branch types).
  - Validate equitability by brute force on small `CB`.
  - *Could close:* the first exact saturation with switch arcs load-bearing on a whole tree (`bounded_computation`, plus a
    `proved_informal` lift lemma), or a quotient deficit that yields a candidate cut for F1's two-instrument confirmation.

## Registrations

Each item carries its grade and attribution. **STATED** items need an isolated second read before registration.

1. **(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`**: OPEN → VERIFIED `formally_verified` **only** on C1-LA1's governed
   close. Until then, scope note: "`proved_informal` (r30 F2; T/F/U adjudicators); kernel-checked in scratch (U2)".
   - Attribution: Codex (mechanism, weight); first-interior (entries); r30 F2, U2 and critics.
   - Promote from run-local to master at the close.
2. **`E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`** (new), **STATED**. Register at `formally_verified` only
   after the isolated second read AND C1-LA2's close. Otherwise, do not register; it rides as companions.
   - Attribution: r30 F2, U2; C-U2-T, C-U2-F.
3. **`E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`** (INV, P4), `proved_informal`, **STATED**.
   - `novelty_claimed` only for the (⇒) converse, automatic `Aut`-admissibility, the invariance of `F_p` and the canonical cuts.
   - Add a `CLAIM-DISTINCTIONS` row against `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`, which gets a matching scope note:
     "(⇐) direction; see the r30 INV key for the converse".
   - Attribution: r30 U1; C-U1-T, C-U1-F; Codex for (LIFT).
4. **`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`** (P5), `proved_informal`, **STATED** (the corrected
   hypothesis).
   - Attribution: r30 T1; C-T1-F, C-T1-U.
5. **`R30-CB-RECORD`** (Tier 3; `bounded_computation`) with scope notes:
   - the `CB(8, 92)` facts as in Headline verdicts;
   - the sector criterion P8 and its composition P9 (`proved_informal`, **STATED**: critic plus this synthesis);
   - the three sector-deficient rows for `n ≤ 1600`;
   - switch-exit multiples 6,128.8×, 6,563.1× and 7,012.3×;
   - Lemma C (P7; `proved_informal` modulo the cited node (n1), **STATED**);
   - sector Hall at `CB(8, 92)` for every eligible `p` (**STATED**; `computer_assisted` at 492);
   - T1's factor-`m` correction.

   It is registered as a record, not as a key on (HALL). Attribution: Codex (sector facts), r30 T1, C-T1-F, C-T1-U, C-F1-T,
   C-F1-U, the adjudicators.
6. **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`**: status stays OPEN. Add the scope note in Headline verdicts. The
   STATED parts (the unreachable-target finding and P10–P12; the CB threshold) are marked pending second read.
   - Attribution: r30 F1 and F2 and their critics; the controller prior as prior.
7. **`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`**: status stays OPEN. Add the scope note in Headline verdicts. P14
   is **STATED**.
   - Attribution: r30 T2; C-T2-U; DCB (Codex).
8. **`E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY`**: status stays VERIFIED `proved_informal`. Scope note: "re-derived in
   r30 (T2; C-T2-F, C-T2-U: `α(H_v) = α − 1`, `D ≥ 0`, König form); the budget is instance-equivalent to `S ≤ 0` (P14,
   **STATED**)".
9. **P15 relation among OPEN keys** (`E993-LOWER-REGION-EARLY-MARKED-OCCUPANCY-TRANSFER` ⇒ … ⇒ budget): **STATED**. Register
   the relation rows only after an alias check and a second read. Attribution: C-T2-U.
10. **`E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`**: stays REFUTED. Scope note: "literal failures already at
    order 11 (4/5 rows), 12 (33/34), 13 (161/163); minimality was never asserted; (HALL) saturates on each"
    (`bounded_computation`, three instruments: C-F2-T, C-F2-U, F adjudicator).
11. **`CLAIM-DISTINCTIONS` rows**:
    - against `E993-R23-LITERAL-DELETE-ONLY-HALL`: active-weight deletion-only transport is a different object, and it fails
      at `CB(8, 86)`/460 on `X_sec`;
    - `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION`: T2's deg-2 collapse is `subclaim_of` (a corollary of its
      second conjunct), with nothing new registered;
    - the r28 "T22" against this program's `T_22` naming distinction.
12. **Errata and corrections on record** (records, not keys):
    - R30-E-a and R30-E-b;
    - the C6-F5 and C6-U5 localizations;
    - the SOLUTION-CONTRACT §2 draft non-compilation;
    - the allocation's false presence identity (P13 is the correct form);
    - CF-F-1's corrected phrase;
    - the validator gap that admitted placeholders (R30-I-1).
13. **Not registered:** P16 (support-move lemma; route record), the compression refutations (route record), P11's families (the
    uniform eligibility is still open), B-g (`Q_j`; not registrable), and E8 (route record).

## Continuation ruling

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

Cycle 2 runs unless Stage 7 closes the run. Stage 7 cannot close it here: the only funded awards are C1-LA1 (WID) and the
bounded C1-LA2 (the implication). Neither is a decisive event. The stop gate arms at the Cycle 2 close. Controller actions
before Cycle 2 dispatch:
- fund the isolated second reads for the STATED items: registrations 2–7 and 9, and P10–P12;
- run Stage 7 for C1-LA1, then C1-LA2;
- fix the admission validator gap (placeholders).

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-S/`
(standard library, exact integers).

| file | sha256 | role |
|---|---|---|
| `s_check.py` | `27d93f49955cdbbbe6454259cc3cf3e564438935607dbc4ed0dfa61898226590` | spot-check: (WID) on 1,293 random general-graph instances (0 failures); `K_{1,3}`, `p = 0` guard (0 against 6); `CB` order formula, sector criterion and ratios at the three rows |
| `s_check.out` | `ec9dc39f9f0262a0cbf9bc0e57b7c30d74fced13c3b601c6e261c9dfd0b7f9d7` | its output |

- Replay: `cd` into the scratch root and run `python3 -B s_check.py`.
- No background job was started, so none remains to kill.
- Deliverable: `cycles/cycle-1/stage6/SYNTHESIS.md` (this file).
- Sealed inputs relied on:
  - the dispatch capsule (seal `6ab566af…2e2a`);
  - the Stage 5 packet manifest (seal `3e2b73b6…52e4`);
  - the 981 frozen `sources/` digests (0 mismatches);
  - the frozen first-interior `Main.lean` (`8d864da2…a7d9`) and its fragment digests.
