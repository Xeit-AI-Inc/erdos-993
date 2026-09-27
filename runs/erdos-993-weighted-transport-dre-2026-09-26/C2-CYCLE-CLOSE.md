# Cycle 2 Close — r30 (controller record, 2026-09-26)

Run `erdos-993-math-dre-20260926-r30-weighted-transport`. Controller: Claude Fable 5.1. This record closes Cycle 2. Every grade
below is the grade of record as fixed by the sealed synthesis (`cycles/cycle-2/stage6/SYNTHESIS.md`), the governed Stage 7 close
(`cycles/cycle-2/stage7/LEAN-GATE-CLOSEOUT.md`) and the five isolated second reads (`second-reads/SR-C2-*/SECOND-READ.md`).
Where a second read repaired a statement, the repaired text is the text of record.

## 1. Headline

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, unchanged.** Not proved at any scope containing a switch-necessary
  row; not refuted (no deficient cut, no candidate; deficits appeared only at non-eligible validation ranks). Smallest unproved
  lemma: Hall on the choke forest `T′ = T − {r, s, v}` at `CB(8,86)/460` (also 476, 492) plus the coupled allocation for source
  families mixing the root-plus-arm sector with positive-weight V and positive-weight S/O sources. Switch arcs have never been
  load-bearing on any computed tree row.
- **New key, `formally_verified` (award C2-LA1):** `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` —
  if weighted Hall fails on any finite simple graph at any rank, an `Aut(G)`-invariant, all-positive-weight, strictly deficient
  source family exists (existential statement; the proof's witness is `X_min`). The invariant-family half of (INV).
- **Four new keys, `proved_informal`** (all critic-first or critic-completed; each second-read confirmed):
  `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`, `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`,
  `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`, `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`.
- **Outcome A: not reached. Outcome B: the five lemmas above. Outcome C: did not occur.** The primary aggregate is untouched.
- **Stop gate (SOLUTION-CONTRACT §5): ARMED, ruled on, nothing decisive.** Material progress `yes`, plateau `no`, `continue: yes`.
  Cycle 3 proceeds; the controller checkpoint falls after Cycle 3.

## 2. Seals of record

| Stage | Seal (SHA-256) | Members |
|---|---|---|
| Stage 2 packet | `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da` | 1027 |
| Stage 3 dispatch | `746ed4551397ee08fc8b39b33b1e46164953eee8a7940d82a3fe8c4c1d5cc6d6` | 7 |
| Stage 3 packet | `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d` | — |
| Stage 4 dispatch | `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383` | — |
| Stage 4 packet | `025bf11c94064441d2792f39513d96fc16dc12f39f6e1aac8df5c5e4d8fe45ff` | — |
| Stage 5 packet | `3e11f843322588ab77f1ee38d3c2885dd9b94fcf5f94900803ae0dceb788975e` | — |
| Stage 6 dispatch | `cc229405dccd5bfd985cdb2a998691930eb291128aee49faf4b8d4be38626a09` | 10 |
| Stage 6 packet | `76c6aa52ed3116cb7e28388b90a603ee8a1d119ffabfe9584adc72bcde11bf6d` | — |
| Award capsule C2-LA1 | `920048e72b5cbd85caa5bfa2f0eefb33e63e564ccde4d576e908157086a0a1dd` | 370 |
| Stage 7 packet | `a0ed8777ddd9811e232b37da73fb6f5a006d4193150ddac250bd30acb1df8eba` | 263 |
| Second-read capsules | SR-C2-1 `980cf151…`, SR-C2-2 `54e77785…`, SR-C2-3 `47246307…`, SR-C2-4 `c7659cda…`, SR-C2-5 `5d494d3c…` (`control/c2-second-read/SEALS.json`) | — |
| Second-reads packet | `19699318f898f54907b9041a54ef0211a43723ee099b2eb80c6785da6cd3e014` | 21 |

Stage verdicts: Stage 3 6/6 admitted (two cosmetic exceptions: U1, U2 model-disclosure wording); Stage 4 12/12, every critique
`retained_narrowed`, every critic pair concordant on its seat's strongest finding; Stage 5 T/F/U `still_open` / progress `yes` /
plateau `no`; Stage 6 `headline_resolved: no`, `material_progress: yes`, `plateau: no`, `continue: yes`.

## 3. Lean award (governed `lean-proof-workflow`; `formally_verified`)

| Award | Terminal theorem | `Main.lean` | Contract | Kernel receipt | Verification report |
|---|---|---|---|---|---|
| C2-LA1 `runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family` | `E993Transport.exists_aut_invariant_deficient_of_not_weightedHall` | `a9cf3b81…` | `f0f50c2a…` | `2313f959…` | `efd7c11a…` |

Definitions of record: C1-LA1's `Main.lean` (`86b59c6c…`, receipt-bound) carried byte-identically (entries 1–21; lemma 24). Axioms
exactly the three on all 77 entries; repair rounds 0; informal audit passed (`4739c9c7…`), fidelity `match` (35/0/0). Companions on
the face carry no certificate: `weightedHall_iff_invariant`, `weightedHall_iff_phi_nonpos`, the `*_map_aut` lemmas,
`phi_supermodular`, `canonMin_*`, `filter_eq_covered`. Details and rulings: `cycles/cycle-2/stage7/LEAN-GATE-CLOSEOUT.md`.

## 4. Registrations applied (run-local registry only; master untouched until the terminal close)

Applied by `control/register_c2_close.py` after the second-reads packet seal (ruling 18); lint `control/CLAIM-STATUS-LINT-c2-close.json`
434 identity claims, 0 findings. Run-local registry 438 → 443 claims (snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c2-close.json`);
`OBLIGATIONS.csv` 327 → 336 rows.

| Key | Change | Grade | Source |
|---|---|---|---|
| `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` | new, VERIFIED | `formally_verified` | C2-LA1; U1; C-U1-T, C-U1-F; U adjudicator |
| `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE` | new, VERIFIED | `proved_informal` | C-T1-F, C-T1-U (T1 the attaining family); SR-C2-1 (repairs: exact `λ₂`, multiplicity `N`, operator/layer wording) |
| `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` | new, VERIFIED | `proved_informal` | C-T2-U (T2's T-A, T-D-R1; r27 (LB)); SR-C2-3 (repairs: `F` = whole leaf set on the face; `F = {v}` fence) |
| `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` | new, VERIFIED (renamed from the synthesis's proposal, which claimed eligibility for every `k`) | `proved_informal` | F2; C-F2-T, C-F2-U; Cycle 1 C-F2-T (constructed `G_k`); SR-C2-4 |
| `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` | new, VERIFIED | `proved_informal` | U2; C-U2-T, C-U2-F; SR-C2-5 (repairs: weights in ℕ; generalizes (LIFT); contains (INV)(ii)) |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | five scope notes (three CB rows; `G_k`; selector reduction; Lemma U = P10; `CBstar` clause) | OPEN unchanged | SR-C2-2, SR-C2-3, SR-C2-4 |
| `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (INV) | scope notes (C2-LA1 = its invariant half; (ii) ⊂ equitable lift) | unchanged | C2-LA1; SR-C2-5 |
| `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (LIFT) | scope note (orbit special case of the equitable lift) | unchanged | SR-C2-5 |
| `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM) | scope note (T-D-R1, q-ary at uniform `t`); record-text correction R30-E-d | unchanged | SR-C2-3 |
| `CLAIM-DISTINCTIONS.json` | rows R30-CBSTAR-SECTOR-DEFICIT-VS-R23-DELETE-ONLY-HALL, R30-C2-EQLIFT-VS-{LIFT, INV, C2-LA1}, R30-C2-SPEC-VS-NM | — | SR-C2-3, SR-C2-5, SR-C2-1 |
| `OBLIGATIONS.csv` | R30-C2-LA1, R30-C2-SR-C2-{1,3,4,5}, R30-CB-RECORD (Cycle 2 update), R30-C2-STRIKE-RII, R30-C2-S12-XMAX, R30-C2-TM2-CONDITIONAL, R30-C2-COLOUR-REFINEMENT | — | — |

Not registered (by ruling): the `T(m,2)` family (conditional; premises bounded to `m ≤ 400`, `x = m` exactly for `3 ≤ m ≤ 18`);
Lemma U as its own key (it is P10 re-derived); the `X_max` finding as a key (a record: `X_max` contains every tag-free source, so it
is never the all-positive witness WHENEVER a tag-free `(p+1)`-independent set exists — `P_6` at `p = 2` and `K_{1,5}` at `p = 2`
are the exceptions found by SR-C2-5 and the C2-LA1 auditor); Candidate 2's minimality headline (refuted); T2's T-B (false for
`t ≥ 2`).

## 5. Isolated second reads (five Opus 5.5 high seats; 20 statements)

| Read | Statements | Verdicts |
|---|---|---|
| SR-C2-1 | the second-eigenvalue theorem; the flip characters; the key | 1a, 1b confirmed; 1c confirmed_with_repairs |
| SR-C2-2 | sector Hall at the three CB rows (conditional on S1); the CB reductions; the record and (HALL) scope note | 2a, 2b, 2c confirmed_with_repairs |
| SR-C2-3 | the `CBstar` theorem; its corollary; T2's inputs and the T-B strike; the key and distinction | 3a, 3c confirmed; 3b, 3d confirmed_with_repairs |
| SR-C2-4 | F2's `G_k` theorem; Lemma F / Lemma U / Corollary G; the selector reduction; the key | 4a–4d confirmed_with_repairs |
| SR-C2-5 | the equitable lift; class-union Hall; the bounded records; the `X_max` finding; the key | 5a–5e confirmed_with_repairs |

Zero rejections, zero unresolved. **Record corrections surfaced by the reads:** (i) the synthesis's reduction **(R-ii)** ("if `X ∩ V`
has no positive-weight member then `Hall(X ∩ sec) ∧ Hall(X ∖ sec) ⇒ Hall(X)`") is FALSE — weight-0 V sources reach positive-weight
`v`-containing targets through switches; witness `CB(3,2)` at `p = 5` (non-eligible), an inclusion-minimal family of 457 sources
with `Hall(X ∩ sec)` 204 ≤ 226, `Hall(X ∖ sec)` 488 ≤ 488, `Hall(X)` 692 > 691 (SR-C2-2; controller replay identical digit for
digit); the critics' hypothesis `X ∩ V = ∅` is correct; the weakening entered at the T adjudication (E3); registered only in the
repaired form (`Hall(X ∩ (R0 ∪ S ∪ O))` in place of `Hall(X ∖ sec)`). (ii) S12's "`X_max` is never the positive witness" holds only
when a tag-free source exists. (iii) The registered (NM) statement had lost a `>` ("`k > N`") to the Cycle 1 register script's
blockquote stripping — erratum R30-E-d, restored. (iv) The synthesis's `## Headline verdicts` wording calls the companion iff
`formally_verified`; it is `proved_informal`. (v) The synthesis's fidelity question on the whole-leaf check at orders 17–18 is
answered: SR-REACH's own table ran it (SR-C2-4).

## 6. Standing facts of record entering Cycle 3

- Sector Hall under (D) ∪ (S) holds for every `X ⊆ X_sec` at every eligible `p` of `CB(8,86)`, `CB(8,89)`, `CB(8,92)` (`computer_assisted`;
  margins 6863.256 / 11209.544 / 18328.277 at the first rank via Lemma C(ii) with the second-eigenvalue theorem; NM/P9 above).
  The open part of (HALL) at those rows is exactly the coupled families (sector + positive-weight V + positive-weight S/O).
- Exact `CBstar` sector deficit `max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})` for `F` = all leaves; for `t ≥ 2` no sector subfamily
  is deletion-deficient at any eligible rank (via (LB)); `t = 1` recovers `3p < 2dm + 5`.
- `G_k` (`k ≥ 3`, `p = k+3`): eligible, tags 3 and 4 favorable, unique unreachable target of weight 2, gap exactly 2; deletion
  arcs alone saturate on every computed row (`G_3/6`, `G_4/7`, `G_5/8`). `T(m,2)`: conditional (bounded premises to `m ≤ 400`).
- The equitable-partition flow lift (iff) and class-union Hall; the coarsest equitable partition equals the orbit partition on the
  positive-weight network of every `d ≥ 2` CB row tested (so no reduction beyond orbits there; ≈ 3·10^37 orbits per layer at the
  three rows); on `d = 1` rows it is far coarser (11/13/15 classes vs 147/224/324 orbits of sources and targets together).
- Bounded (all saturate, deletion arcs alone): every eligible free-tree row to order 19; `CB(1,7)/10`, `CB(2,5)/10`, `CB(3,5)/13–14`,
  `CB(4,4)/14`; `PPC(7,2)/12` (`n` 35; 7,801,728 / 11,469,576 / −3,667,848; four instruments + controller layer weights); no
  deletion-deficient pendant-pair sector to `n ≤ 600`; `F_p(T)` = all leaves on every computed row (leaf deletion shifts `x` by 0 or
  −1 on every free tree to order 16); the first sector-deficient CB rows: `d = 7 → m = 109`, `d = 8 → m = 86`, none for `d ≤ 6`.
- Struck (do not cite as evidence): T2's T-B and its §7 search; T1's and U2's non-falsifiable `S` checks; U1's `X_max` witness;
  U2's Candidate 2 headline and its "not (LIFT)" framing; F1's "no deletion-deficient CB row below 1465" beyond the root-plus-arm
  sector; T1's "formally_verified-grade" wording; the synthesis's (R-ii) wording.

## 7. Errata, incidents and process record

- **R30-E-c**: the sealed Cycle 2 worker brief carried a clone residue (`C1-ALLOCATION.md`), unqualified r29 award labels (the
  probable source of U1's "C1-LA4"), and the R30-E-b weight shortcut in prose; fixed in the Cycle 3 brief.
- **R30-E-d**: the (NM) registered statement lost `>` in "`k > N`" (register-script blockquote stripping); restored at this close.
- **R30-N-18** (controller lapse): the Stage 3 read-boundary disclosures record was written after the Stage 4 dispatch.
- Path-literal quotation records: `control/C2-STAGE{2,4,5}-PATH-LITERAL-QUOTATION-RECORD.json`. Seals waited for every completion
  notification (lesson R30-I-1 applied); the run-local registry was frozen from the Stage 2 seal to the second-reads packet seal
  (lesson R30-I-2 applied; readers' capsules carried the Stage 2 snapshot).
- Seat process: forbidden `ps aux` by F1 (two), F2, T2; stray bytecode under `sources/` written and deleted by U2 (also F2);
  controller re-hash 981/981. Tooling: `control/r30_tool_c2.py` (two documented changes from the sealed Cycle 1 tool).
- Controller replays as third instruments on every orientation's headline numbers: `control/controller-facts/CF-REPLAY-c2*.json`.

## 8. Cycle 3 portfolio (binding text in `control/C3-ALLOCATION.md`)

| Seat | Route |
|---|---|
| T1 | `C3-T-01 CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION` |
| T2 | `C3-T-02 GENERAL-SECTOR-SELF-COVERING` |
| F1 | `C3-F-01 INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS` |
| F2 | `C3-F-02 UNREACHABLE-CAPACITY-FAMILY-CLOSURE` |
| U1 | `C3-U-01 LEAN-INV-QUOTIENT-NM-AND-LEMMA-U` |
| U2 | `C3-U-02 PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS` |
