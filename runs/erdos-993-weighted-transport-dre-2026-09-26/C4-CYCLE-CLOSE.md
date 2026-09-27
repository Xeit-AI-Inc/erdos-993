# Cycle 4 Close — r30 (controller record, 2026-09-27)

Run `erdos-993-math-dre-20260926-r30-weighted-transport`. Controller: Claude Fable 5.1. This record closes Cycle 4. Every grade
below is the grade of record as fixed by the sealed synthesis (`cycles/cycle-4/stage6/SYNTHESIS.md`), the governed Stage 7 close
(`cycles/cycle-4/stage7/LEAN-GATE-CLOSEOUT.md`) and the eight isolated second reads (`second-reads/SR-C4-*/SECOND-READ.md`).
Where a second read repaired a statement or a name, the repaired text is the text of record.

## 1. Headline

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN at full scope, unchanged.** Not proved at full scope; not refuted (no
  deficient cut at any eligible row). TWO restricted scopes are now of record as SEPARATE keys:
  - (HALL) on the infinite eligible family `{(G_k, p) : k ≥ 3, p ≥ k+3 eligible}` with deletion arcs alone — the `G_k` flow key
    (`formally_verified`, award C4-LA1) composed with the registered eligibility key (`proved_informal`); the composition confirmed
    by SR-C4-1 (Theorem CT-1 by critic `C-F2-T`; the rank extension R2′ by the F adjudicator). The first (HALL) statement on an
    infinite eligible family; every `k ≥ 4` lies in the unresolved band.
  - Full (HALL) with switch arcs load-bearing at the five sector-deficient CB first ranks `CB(8,86)/460`, `CB(8,89)/476`,
    `CB(8,92)/492`, `CB(8,108)/577`, `CB(7,144)/673` (`computer_assisted`; critic `C-T1-U`'s choke-local sector certificate composed
    with the registered E1 flow; SR-C4-3 and SR-C4-4), and with the D2/D3 parts of the five-row deletion key, (HALL) at EVERY
    eligible rank of those five trees (177 + 168 ranks) — the first eligible whole trees proved to satisfy (HALL) with switch arcs
    load-bearing at their first ranks. The five CB switch-necessary rows are CLOSED as rows.
  - **Smallest unproved lemma** (SR-C4-3's repair of the synthesis's item (iv)): the REDUCED-capacity sector flow at
    `G(8^82, 7^2)/448` — a choke-local flow saturating every sector source with every switch image capped at `(1 − ρ_{Q(A)})·w` —
    which composes with E1-R (criterion verified at all 56 eligible ranks) to whole-row (HALL) at the only known switch-necessary
    eligible row without a certificate. Uniformly: (L-i) and (L-S) on an infinite CB class.
- **Pre-armed plateau test (C4 gate ruling 30): NOT a plateau.** Letters (a) and (b) were admitted by the synthesis and CONFIRMED by
  isolated second reads (SR-C4-1; SR-C4-3 with SR-C4-4); letter (d) is supplied too (C4-LA1 closed together with (a)); letter (c) is
  not (no cut). The run continues into Cycle 5 (the fifth of six).
- **New key, `formally_verified` (award C4-LA1):**
  `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET` — for every `k`, every
  `p ≥ k+3` and every leaf tag set `F` of `G_k`, an ℕ-valued saturating flow supported on single-deletion arcs exists (companions
  `WeightedHall` and `S(G_k, p) ≤ 0` on the face, `proved_informal`).
- **Four new keys** (each second-read confirmed): `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
  (`computer_assisted`); `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` (`proved_informal`; CD-1 — both critic proofs are
  one construction in two parametrizations; C1 promotes `conditional → proved_informal` as a record);
  `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`; E1-R with CD-2: E1's
  criterion is exactly condition (i) in cleared form); `E993-R30-ACTIVE-WEIGHT-DELETION-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE`
  (`proved_informal`; sharp).
- **Conjecture refuted (record).** The Cycle 3 conjecture "on trees, `S ≤ 0` ⇒ saturation" fails at the NON-eligible `CB(7,1)/6`
  (`S = −21`, max-flow 903 of 924, a 546-source cut against capacity 525); found by three critics, replayed by two adjudicators and the
  controller, confirmed by SR-C4-7. Not a (CUT); (HALL) untouched.
- **Outcome A: not reached. Outcome B: the keys above. Outcome C: did not occur.** The primary aggregate is untouched (restricted
  `G_k` consequence `S(G_k, p) ≤ 0` at every `p ≥ k+3` as a scope note).
- **Stop gate (SOLUTION-CONTRACT §5): ARMED, ruled on, nothing decisive.** Material progress `yes`, plateau `no`, `continue: yes`.

## 2. Seals of record

| Stage | Seal (SHA-256) | Members |
|---|---|---|
| Stage 2 packet | `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684` | 1116 |
| Stage 3 dispatch | `023b386a64a1a60fe6a6faa5d630bc4569559ee15a5d1b55f28b633f9021ba32` | 7 |
| Stage 3 packet | `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9` | 40 |
| Stage 4 dispatch | `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229` | 13 |
| Stage 4 packet | `c68d4df426b21094774866159814a0dea3c6b6bc16dc437f2b08d869fffa4365` | — |
| Stage 5 packet | `226fab46489a270e1687b652a4c231472c900bc9959f2addfeb75e7171c3392e` | 51 |
| Stage 6 dispatch | `4bc8c868f44b71133e25b45359173772b35de79addb6b65948fb4879f5f5b1c7` | 12 |
| Stage 6 packet | `b6970ca930cc67436f138c5c8907e33b2f1b62b5c0fc2433caf0ac3e30f0f8b7` | 41 |
| Award capsule C4-LA1 | `c67742f0ead0447fe2ed8847884717ca3602fae5dab7d8cb4249b6073eacee0a` | 484 |
| Stage 7 packet | `bb1e0647c9c72cd824c627065dc95594610e0a3571c9b77d57d403113d45f137` | 527 |
| Second-read capsules | SR-C4-1 `8d4f8d53…`, SR-C4-3 `187d7c43…`, SR-C4-4 `36ced5fc…`, SR-C4-5 `aa06a963…`, SR-C4-6 `44382225…`, SR-C4-7 `9e0195f8…`, SR-C4-8 `e8137c3f…`, SR-C4-9 `b9378eda…` (`control/c4-second-read/SEALS.json`) | — |
| Second-reads packet | `868262589dba599d7a2c3872420d54d1f4992a6dfb61a9578fa844e412000640` | 32 |

Every seal this cycle ran with an explicit exit test on its path check (rule R30-I-3); no superseded manifest.

## 3. Lean award (governed `lean-proof-workflow`; `formally_verified`)

| Award | Terminal theorem | `Main.lean` | Contract | Kernel receipt | Verification report |
|---|---|---|---|---|---|
| C4-LA1 `runs/lean-2026-09-27-c4-la1-gk-deletion-saturating-flow-every-rank` | `E993Transport.gk_deletionSaturatingFlow_of_rank_ge` | `66db6c73…` | `4b71b7ca…` | `dd9c21f7…` | `37083e4c…` |

Definitions of record: C1-LA1's `Main.lean` (`86b59c6c…`) and C1-LA2's (`7c279f4b…`), both receipt-bound, carried byte-identically
(31 fragments; entry 22 added beyond the brief's list — accepted; entry 36 keyword only). 113 entries; axioms exactly the three; repair
rounds 0; informal audit passed (`ab5de3b6…`; receipt `8c4b064e…`), fidelity `match` (28/0/0; receipt `cb1e50a4…`). The instance
`gkGraph_decAdj` is a genuine decidable instance registered as a `def` (registrar rule); the terminal theorem is proved by a call to the
identically stated N6 lemma (registrar order). A bounded attempt that closed. Details and rulings: `cycles/cycle-4/stage7/LEAN-GATE-CLOSEOUT.md`.

## 4. Registrations applied (run-local registry only; master untouched until the terminal close)

Applied ONCE by `control/register_c4_close.py` (config `control/C4-CLOSE-CONFIG.json`; both sealed in the second-reads packet) after
that packet's seal and the award close (rulings 26, 37), then `control/c4_close_field_normalize.py` (three documented corrections,
R30-N-67). Run-local registry 448 → 453 claims (snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c4-close.json`); `OBLIGATIONS.csv`
351 → 376 rows (snapshot `control/snapshots/OBLIGATIONS.c4-close.csv`). Lint: master tool `control/CLAIM-STATUS-LINT-c4-close.json`
(434 identity claims, 0 findings); run-local with ledger and distinctions `control/CLAIM-STATUS-LINT-c4-close.run-local.json`
(453 claims, 0 warnings, the one INHERITED false alias match of (INV)'s pattern on the r21 row `R21-C1-T6` — not a regression; to be
narrowed at the terminal close).

| Key | Change | Grade | Source |
|---|---|---|---|
| `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET` | new, VERIFIED, `formal_award` | `formally_verified` | C4-LA1; `C-F2-T` (CT-1); F adjudicator (R2′); F2, `C-F2-U`; SR-C4-1 (aliases, fences, seven distinction rows) |
| `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` | new, VERIFIED (the three-row and two-row names dropped: mechanism SR-C4-3, rows 577/673 SR-C4-4) | `computer_assisted` | `C-T1-U` (certificate); controller CF-T2/CF6-4 (composition, per-class bound repaired by SR-C4-3); T adjudicator; SR-C4-3, SR-C4-4 |
| `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` | new, VERIFIED | `proved_informal` | `C-T2-F`, `C-T2-U` (one construction, two parametrizations); T adjudicator; SR-C4-5 |
| `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` | new, VERIFIED | `proved_informal` | T adjudicator (E1-R); `C-T2-U` (CD-2); SR-C4-6 (CD-1 dependency removed — a likelihood-ratio proof of CD-2) |
| `E993-R30-ACTIVE-WEIGHT-DELETION-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE` | new, VERIFIED | `proved_informal` | `C-F2-U`; F adjudicator; SR-C4-8 (sharpness; `α(G_k) = 2k+3` for every `k`) |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | scope notes: the `G_k` family (SR-C4-1); the five-row 345-rank statement and the new smallest unproved lemma (SR-C4-3/4); the conjecture's fall (SR-C4-7) | OPEN unchanged | SR-C4-1, -3, -4, -7 |
| `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` (GK-SIGN), the `G_k` eligibility key, `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, E1, (NM), the five-row deletion key | scope notes as the synthesis listed, each on its read | unchanged | SR-C4-1, -6, -8, -3 |
| GK-SIGN, the `G_k` eligibility key, the five-row deletion key, E1 | alias fields repaired (R30-E-i: `["none"]`; comma-split fragments) | unchanged | SR-C4-1 |
| `CLAIM-DISTINCTIONS.json` | +19 rows (the `G_k` flow key ×7; the switch-arcs key; CD-1 ×2; E1-R ×4; R3 ×4; the C1 record vs the refuted r23 key) | — | SR-C4-1, -3, -4, -5, -6, -8; controller |
| `OBLIGATIONS.csv` | R30-C4-LA1, R30-C4-SR-C4-{1,4,5,6,8}; the C1 record `R30-C1-HETEROGENEOUS-CB-PATTERN-SECTOR-DELETION-DEFICIT-EXACT` (promoted `proved_informal`); `R30-CB-RECORD-C4-CB71-RANK6-NON-ELIGIBLE-SATURATION-FAILURE`; the 577/673 criterion and certificate records; the five sector-certificate records; the `CB(d,1)` records (`R30-CB-RECORD-C4-B9X-…`, `R30-CB-RECORD-C4-CBD1-…`) and the `m = 2` rows; B9 annotated; R3 records | — | — |

Not registered (by ruling): the three-row and two-row CB Hall names (mutually exclusive with the five-row key); the GK fallback name
(R2′ confirmed); U2's `CB(d,1)` results as a KEY (records: no eligible rank for `d ≤ 300`); T1's uniform-deletion lemma; T2's
chain-product theorems and universal E1 claim; F1's relaxed-model saturation; U1's compiled scratch (25 declarations; Lean inventory
for Cycle 5); the labels CD-1, CD-2, L2, C1 as aliases (CD-1 and L2 are already aliases of other keys).

## 5. Isolated second reads (eight Opus 5.5 high seats; 28 statements)

| Read | Statements | Verdicts |
|---|---|---|
| SR-C4-1 (DECISIVE, letter (a)) | CT-1; R2′; the composition to (HALL) on the `G_k` family; the key | 1a, 1b, 1d confirmed; 1c confirmed_with_repairs — CT-1 CONFIRMED |
| SR-C4-3 (DECISIVE, letter (b)) | the sector certificate; the composition with E1; EST-5; the key | 3a, 3c, 3d confirmed; 3b confirmed_with_repairs — EST-4 CONFIRMED |
| SR-C4-4 | the E1 criterion at 577/673; the sector certificates there; the whole-row composition | 4a, 4b, 4c confirmed |
| SR-C4-5 | CD-1; T2's chain discharge struck; C1's promotion; the key | 5b confirmed; 5a, 5c, 5d confirmed_with_repairs |
| SR-C4-6 | CD-2; E1-R; the criterion at `G(8^82,7^2)`; the key | 6c confirmed; 6a, 6b, 6d confirmed_with_repairs |
| SR-C4-7 | the conjecture refutation record | 7a confirmed; 7b confirmed_with_repairs |
| SR-C4-8 | R3; on `G_k`; the key | 8c confirmed; 8a, 8b confirmed_with_repairs |
| SR-C4-9 | U2's `CB(d,1)` key 1 and corrected key 2; scope and naming | 9a, 9b, 9c confirmed_with_repairs |

Zero rejections, zero unresolved; every reader recomputed its capsule seal before reading. **Record corrections surfaced by the
reads:** (i) CF-T2 / CF6-4's "every target ≤ (ρ_1 + θ*)·w" is per-class — in-sector targets are loaded up to their full weight
(SR-C4-3); the margin at 476 is 29.04; (ii) the synthesis's frontier item (iv) repaired: the combining lemma at `G/448` is the
REDUCED-capacity sector flow, not full-capacity sector Hall; (iii) the synthesis (R-7) and T's R8 said the E1 criterion at 577/673
rested on one instrument — the registered D-key's certificate already states it (SR-C4-4); (iv) the synthesis (R-16) inverted a
count — U2's unclamped statement holds on 35 of 54 rows and fails on 19 (SR-C4-9); record B9 needs no correction; (v) both CD-1 proofs
are one construction; the classical theorem is named only; guards `N_{k−2} = 0` at `k = 1` and `p ≥ 2` (SR-C4-5); (vi) CD-2 has a
proof independent of CD-1 (SR-C4-6); (vii) only the "`S ≤ 0` ⇒ saturation" direction of the two-way Cycle 3 conjecture falls
(SR-C4-7); (viii) `α(G_k) = 2k+3` proved for every `k` (SR-C4-8); (ix) registry defects R30-E-i (SR-C4-1); (x) the labels CD-1, CD-2,
L2, C1 must not become aliases (SR-C4-5); (xi) the synthesis's "the other eligible ranks" narrowed to eligible `p ≥ k+4` (exist for
`k ≥ 6`), r30 awards named by key in registry text, no "4k" token (SR-C4-1).

## 6. Standing facts of record entering Cycle 5

- (HALL) with deletion arcs alone on `{(G_k, p) : k ≥ 3, p ≥ k+3 eligible}` (the flow key `formally_verified`; eligibility
  `proved_informal`); "every eligible rank of `G_k`" needs `x(G_k) ≥ k+1` (bounded `k ≤ 400`; `α(G_k) = 2k+3` proved).
- (HALL) at every eligible rank of `CB(8,86)`, `CB(8,89)`, `CB(8,92)`, `CB(8,108)`, `CB(7,144)` (`computer_assisted`; switch arcs
  load-bearing at the first ranks; certificates `θ* = 96/495419, 96/530501, 96/566783, 16/65097, 16/138633`). The open
  switch-necessary eligible row on record: `G(8^82, 7^2)/448` alone (obstruction R8: some sector targets have all 448 preimages
  switch-dead — no uniform one-hop share rule; the reduced-capacity sector flow is the lemma to prove).
- E1 = condition (i) in cleared form (CD-2); E1-R on heterogeneous CB-pattern trees (criterion at all 56 eligible ranks of
  `G(8^82,7^2)`, max `ρ` 0.995530 at 448; fails at eligible rows with `d ≤ 5`, first `CB(1,7)/10`); CD-1 on claw products; C1 exact
  and `proved_informal` (record); R3 sharp; the `G_k` tight family `C(L′, p+1)` with margin `≈ 1 + 2/k`.
- The conjecture "on trees `S ≤ 0` ⇒ saturation" REFUTED at `CB(7,1)/6` (non-eligible); `CB(d,1)` laboratory theorems (records);
  `m = 2` sector deficiencies at non-eligible rows with `S > 0`.
- Struck (do not cite as evidence): T1's uniform-deletion lemma and obstruction hierarchy as Hall evidence; T2's chain theorems as
  C1's discharge and its universal E1 claim; F1's relaxed-model saturation and "exact arcs"; F2's "no local rule" and "not close to
  tight" and its census (orders ≥ 18 skipped); U1's "(N1) in full" / "18 declarations"; U2's unclamped `j`-threshold statement and
  any "DEFICIENT-CUT" name; the synthesis's original item (iv) and R-16 count; the "one instrument at 577/673" sentences.

## 7. Errata, incidents and process record

- **R30-E-h**: clone residue in the Cycle 4 protocols (the sealed adjudicator protocol's `c3-adjudicator-capsules`; the sealed
  synthesis protocol's "Cycle 4 runs" and "(WID) award"; three unsealed protocols corrected before dispatch) — every seat resolved
  it by the dispatch wrapper. **R30-E-i**: registry alias-field defects (GK-SIGN `["none"]`; three comma-split aliases) — repaired at
  this close. **R30-E-g** carried (SEMANTIC-CONTRACT §1.1's order-13 sentence).
- **Controller lapses:** R30-N-56 (F2's filtered process listing omitted from the Stage 3 disclosures record — addendum embedded in
  the Stage 4 record); R30-N-57 (a controller check-in wrongly told C-F2-T its job had exited — a macOS `Python` process name missed
  by a `python3` grep; the critic stopped its deletion-only run at `k = 56`; `k = 56..60` rest on C-F2-U's instrument); CF-F6 wrongly
  said the F adjudicator held the run-local registry (neither adjudicator nor synthesis capsule carries it — the controller runs the
  alias check, R30-N-61); the first `stage5` attempt failed its path check because the controller's own records transcribed a
  critic's `/tmp/…` literal (reworded — controller records describe, never quote, non-durable paths).
- **Seat process flags:** T2's prohibited full process listing (sibling command lines seen; no content used); F2's `pkill -f`
  once; U1's OS-refused stray write; C-U1-T's zero-byte temp file (deleted at once); C-T2-U's `pgrep -f` query then a literal-PID
  kill; several seats' harness-copy reads; C-U2-F's "file reworded on disk after writing" statement (its final bytes are the sealed
  member). None affected any number or grade.
- Path-literal quotation records: Stages 2, 4, 5, second reads (none needed at Stages 3, 6, 7). Controller replays as third
  instruments: `CF-REPLAY-c4a/b` (the `CB(7,1)/6` sector and whole-network flows), `CF-REPLAY-c4c` (`G_k` rows `k = 3..5` incl. every
  tag set at `k = 3, 4`).
- Close tooling: `register_c4_close.py` (clone of C3's with the ledger-annotation grammar for scope notes on record rows, the
  award-key supplement route and the deterministic informal fallback); `c4_close_field_normalize.py` (three corrections). Lesson for
  the terminal-close validator: a verified-class RECORD row may not contain a refuted key's literal name (the master lint's
  `REFUTED_MARKED_VERIFIED` rule has no distinction override) — write "the refuted … key" and add a distinction row.

## 8. Cycle 5 portfolio (binding text in `control/C5-ALLOCATION.md`; C5 gate ruling 39 is the terminal-close test)

| Seat | Route |
|---|---|
| T1 | `C5-T-01 CB-CLASS-UNIFORM-SWITCH-HALL` |
| T2 | `C5-T-02 HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE` |
| F1 | `C5-F-01 CB-SMALL-SWITCH-CAPACITY-SECTOR-CUT-SEARCH` |
| F2 | `C5-F-02 PER-TAG-INJECTION-FRONTIER` |
| U1 | `C5-U-01 LEAN-CLAW-NM-AND-GK-TREE-LAYER` |
| U2 | `C5-U-02 CB-PATTERN-THRESHOLD-REDUCTION` |
