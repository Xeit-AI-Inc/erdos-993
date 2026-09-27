# Cycle 3 Close — r30 (controller record, 2026-09-27)

Run `erdos-993-math-dre-20260926-r30-weighted-transport`. Controller: Claude Fable 5.1. This record closes Cycle 3. Every grade
below is the grade of record as fixed by the sealed synthesis (`cycles/cycle-3/stage6/SYNTHESIS.md`), the governed Stage 7 close
(`cycles/cycle-3/stage7/LEAN-GATE-CLOSEOUT.md`) and the seven isolated second reads (`second-reads/SR-C3-*/SECOND-READ.md`).
Where a second read repaired a statement or a name, the repaired text is the text of record.

## 1. Headline

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, unchanged.** Not proved at any scope containing a switch-necessary
  row; not refuted (no deficient cut at any eligible row; every deficit found is deletion-only, or at a non-eligible rank).
  **Smallest unproved lemma** (SR-C3-4's narrowing of R1): (HALL-COND) at `CB(8,86)/460` (likewise 476, 492), `F = F_p` derived,
  for every `X ⊆ I_{p+1}` meeting the root-plus-arm sector, a positive-weight V source AND a positive-weight S or O source — exactly
  Cycle 2's (O2); families with no positive S/O member are settled by (R-i) with the registered sector Hall. At `CB(8,108)/577` and
  `CB(7,144)/673` the open part is every family meeting the sector (sector Hall under (D) ∪ (S) is itself open there); at
  `G(8^82, 7^2)/448` likewise. Full (HALL) with deletion arcs alone holds at 174 of the 177 eligible ranks of the three rows and at
  166 ranks of the two others (`computer_assisted`, separate key below).
- **Standing-state sentence replaced (SR-C3-6).** "Switch arcs have never been load-bearing on any computed tree row" is
  withdrawn. Deletion-only Hall fails at six eligible rows (the sector; ratios 460/459, 476/475, 492/491, 289/288, 337/336,
  448/447), so any saturating flow there must use switch arcs; whole-tree saturation needing switch arcs is exhibited only at
  non-eligible ranks (the order-8 tree at `p = 3`; `CB(4,1)/4`); at no eligible row has saturation with switch arcs been exhibited
  or proved where deletion alone fails.
- **New key, `formally_verified` (award C3-LA1):** `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` —
  for every finite simple graph and every `p`, weighted Hall for the fixed selector holds iff Hall holds on the `Aut(G)`-orbit
  quotient (orbit totals; an arc between orbits iff some member pair is related by (D) ∪ (S)). An equivalence of Hall conditions;
  (INV)'s (ii)(a)⇔(c) clause at `Γ = Aut(G)`, `F = F_p(G)`. (INV) itself is wider and stays `proved_informal` (SR-C3-1).
- **Four new keys** (all critic-first or critic-completed; each second-read confirmed; three renamed by their readers):
  `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` (`proved_informal`; `S(G_k, k+3) < −2` for every `k ≥ 1`, all leaves
  favorable), `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`; E1, the mark-clone
  reduction — a sufficient, not necessary, criterion: `CB(1,7)/10` fails it yet saturates),
  `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` (`computer_assisted`; D1–D3, 340 instances),
  `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM` (`proved_informal`; E4 with G1 —
  the "arbitrary tree, arbitrary `Q`" generality collapses to the CB pattern; holds at every rank).
- **Outcome A: not reached. Outcome B: the lemmas above plus records B5, B7, B8, B9. Outcome C: did not occur.** The primary
  aggregate is untouched; GK-SIGN adds sign content only for `k ≥ 4` at rank `k + 3`.
- **Stop gate (SOLUTION-CONTRACT §5): ARMED, ruled on, nothing decisive.** Material progress `yes`, plateau `no`, `continue: yes`.
  The controller checkpoint (ruling 28) is filed as `control/CONTROLLER-CHECKPOINT-C3.md`; its §4 rules on Cycle 4.

## 2. Seals of record

| Stage | Seal (SHA-256) | Members |
|---|---|---|
| Stage 2 packet | `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` | 1051 |
| Stage 3 dispatch | `ac67bd84671422927a1a1388185aec212e28ef1f84efa0761de5b2b90910f5ff` | 7 |
| Stage 3 packet | `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797` | 35 |
| Stage 4 dispatch | `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7` | 13 |
| Stage 4 packet | `25f6f51a07ff8427379ef50c03c5e172dc260cafa72f1def8afb6dc67424d495` | 53 |
| Stage 5 packet | `ac35166ca9a9f0b4de7e86aa7aeeada8dd133c51728e46c1520cf8028c4648ec` | 41 |
| Stage 6 dispatch | `d1c4b43e0b0a039613de160ee807af938fff87a625d3eb1aa452c753702463d1` | 12 |
| Stage 6 packet | `114b4ab43886c0dfa05372f0fca19ca26cd988da4a0bdff33e78db60e2539af7` | 28 |
| Award capsule C3-LA1 | `35ab7998bbbf5bf58226cc79f7a5020b1bd884f3a62df6995e5d93487d400f88` | 472 |
| Stage 7 packet | `89b4405f94517fcc02d7838c96a1c0ffec794adbd11029ec728c963b0cce6838` | 267 |
| Second-read capsules | SR-C3-1 `42ab732c…`, SR-C3-2 `a806c0d0…`, SR-C3-3 `ad192325…`, SR-C3-4 `885d048e…`, SR-C3-5 `12095fd7…`, SR-C3-6 `d8883657…`, SR-C3-7 `166d84fd…` (`control/c3-second-read/SEALS.json`) | — |
| Second-reads packet | `68d0f89953fc306ca9c5038cdfca981f675665e682a2fb10f293c2fcb2899b6f` | 28 |

A first Stage 7 manifest (`a0c6f3c8…`, kept as `control/C3-STAGE7-PACKET-MANIFEST.superseded-a0c6f3c8.json`) is NOT a seal of
record: it was written while its path-check member reported four findings (incident R30-I-3, §7). The seal of record `89b4405f…`
carries the passing path check (236 files, 0 findings) and the Stage 7 path-literal quotation record.

## 3. Lean award (governed `lean-proof-workflow`; `formally_verified`)

| Award | Terminal theorem | `Main.lean` | Contract | Kernel receipt | Verification report |
|---|---|---|---|---|---|
| C3-LA1 `runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall` | `E993Transport.weightedHall_iff_autOrbitQuotientHall` | `22e3f81c…` | `6dd62fb3…` | `9c7d8434…` | `ffa04977…` |

Definitions of record: C1-LA1's `Main.lean` (`86b59c6c…`) and C2-LA1's `Main.lean` (`a9cf3b81…`), both receipt-bound, carried
byte-identically (76 fragments; all 76 compared by the fidelity reviewer). Axioms exactly the three on all 89 entries; repair rounds
0; informal audit passed (`ffc27197…`; receipt `23a37b29…`), fidelity `match` (32/0/0; receipt `0fddd522…`). The terminal statement
is C-U1-T's frozen text with the name changed and nothing else. Companions on the face carry no certificate (U1's four orbit lemmas,
C-U1-T's partition and class-union lemmas, the carried (a)⇔(b) clause). Details and rulings: `cycles/cycle-3/stage7/LEAN-GATE-CLOSEOUT.md`.

## 4. Registrations applied (run-local registry only; master untouched until the terminal close)

Applied by `control/register_c3_close.py` (config `control/C3-CLOSE-CONFIG.json`; both sealed in the second-reads packet) after
that packet's seal (ruling 26), then `control/c3_close_field_normalize.py` (two field-level corrections, R30-N-50). Run-local
registry 443 → 448 claims (snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c3-close.json`); `OBLIGATIONS.csv` 336 → 351 rows
(snapshot `control/snapshots/OBLIGATIONS.c3-close.csv`). Lint: master `control/CLAIM-STATUS-LINT-c3-close.json` (434 identity claims, 0
findings, 0 warnings); run-local with ledger and distinctions `control/CLAIM-STATUS-LINT-c3-close.run-local.json` (448 claims, 0
warnings, 1 finding — the INHERITED false alias match of (INV)'s pattern `orbit.quotient.*hall` against the r21 ledger row
`R21-C1-T6` ("valid orbit quotient inequalities lift to literal-leaf Hall feasibility", `still_open`), present at the Cycle 2 close
snapshot too; not a regression; SR-C3-1 flagged the pattern's breadth — to be narrowed at the terminal close).

| Key | Change | Grade | Source |
|---|---|---|---|
| `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` | new, VERIFIED, `formal_award` | `formally_verified` | C3-LA1; U1; C-U1-T, C-U1-F; U adjudicator; SR-C3-1 (aliases, fences; ruling separate key) |
| `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` | new, VERIFIED | `proved_informal` | C-F2-T, C-F2-U (F2 the family); F adjudicator (checked to `k = 40`); SR-C3-2 (repairs) |
| `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` | new, VERIFIED; RENAMED from `…-CB-MARK-CLONE-TYPE-PATH-DELETION-TRANSPORT` (alias) | `proved_informal` | C-T1-F (A1), C-T1-U (reduction part); T1 (weight model); T adjudicator; SR-C3-3 (criterion in cleared integer form; ℕ guard; load scoped) |
| `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` | new, VERIFIED; RENAMED from `…-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-AWAY-FROM-FIRST-RANK` (alias) | `computer_assisted` | C-T1-F (D1, D2); T adjudicator (D3); SR-C3-4 (sum-of-two-flows argument; attribution incl. C-T1-U's memory-cited corroboration) |
| `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM` | new, VERIFIED; RENAMED from `…-POSITIVE-SECTOR-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM` (alias) | `proved_informal` | C-T2-F (CD-1), C-T2-U (L1) jointly; T2 (G1); SR-C3-5 (hypotheses on the face; F ⊇ P dropped; every rank) |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | scope notes: R1 open part narrowed (SR-C3-4); switch-arcs replacement sentence with the six rows and E-a (SR-C3-6); E1 by pointer (SR-C3-3); GK-SIGN pointer (SR-C3-2); Lemma U = P10, Lean text of record (SR-C3-7) | OPEN unchanged | SR-C3-2, -3, -4, -6, -7 |
| `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL` (INV) | scope note: C3-LA1 certifies (ii)(a)⇔(c) at `Aut(G)`, `F_p`; the rest stays `proved_informal` | unchanged | SR-C3-1 |
| `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` | scope notes: the exact formula is registered at every `p ≥ 2` (deficits exist at non-eligible ranks: `CBstar(1,1,2)/2`, `(1,2,2)/3`, `(2,1,2)/3`, `(1,1,3)/2`), only the `t ≥ 2` corollary is limited to `p ≥ x+2`; the pendant-P3-arm key as its extension; alias field repaired (R30-N-50) | unchanged | SR-C3-7, SR-C3-5 |
| `E993-R30-GK-TREE-K-GE-3-…-ACTIVE-WEIGHT-TWO`, `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM) | scope notes (GK-SIGN's reach; the (NM) poset half compiled, no grade) | unchanged | SR-C3-2, SR-C3-7 |
| `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` | alias fields repaired (R30-E-f) | unchanged | SR-C3-1 |
| `CLAIM-DISTINCTIONS.json` | 13 rows: C3-LA1 vs (INV) / equitable lift / (LIFT) / C2-LA1; GK-SIGN vs the `G_k` key / r29 high tail / first-order shell; E1 vs the three refuted mechanism keys; the five-row key vs `E993-R23-LITERAL-DELETE-ONLY-HALL`; the pendant-arm key vs `CBstar` and vs `E993-R23-LITERAL-DELETE-ONLY-HALL` | — | SR-C3-1..5 |
| `OBLIGATIONS.csv` | R30-C3-LA1, R30-C3-SR-C3-{1..5}; records R30-CB-RECORD-C3-EA-G8x82-7x2-P448, -R3-CB8x108-P577, -R3-CB7x144-P673, -EF-ORDER8-P3, -EF-CB4x1-P4 (SR-C3-6), R30-C3-B5-CB-GOOD-STATE-POSET, R30-C3-B7-RATIONAL-FLOW-VERIFICATION-LEMMA, R30-CB-RECORD-C3-B8-CB1M-SECTOR-SWITCH-TARGETS-WEIGHT-ZERO, R30-CB-RECORD-C3-B9-CBD1-WHOLE-SECTOR-SUMS (SR-C3-7) | — | — |

Controller text repair (R30-N-45): SR-C3-4's key block cited E1 by its Stage 6 name four times; the registered name was
substituted (logged per hit; the old name is an alias on the E1 key). Not registered (by ruling): Lemma U as a key (= P10 by
negation; `compiled`); C1 the exact heterogeneous deficit (`conditional` on the claw-product normalized-matching theorem cited from
memory — the undischarged lemma `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)` named on SR-C3-5's face); G3 (empty content on every tested row —
record only); the conjecture (C-U2-F) "on trees `S ≤ 0 ⇒` saturation" (conjecture grade only); T2's "no dead end for `d = 1..8`"
computation (unshipped, struck).

## 5. Isolated second reads (seven Opus 5.5 high seats; 26 statements)

| Read | Statements | Verdicts |
|---|---|---|
| SR-C3-1 | binder diff C3-LA1 vs (INV); the mathematics; the two formalizations | 1a confirmed_with_repairs; 1b, 1c confirmed — ruling: separate key |
| SR-C3-2 | GK-SIGN; its key; the (HALL)/aggregate scope notes | 2a, 2c confirmed_with_repairs; 2b confirmed |
| SR-C3-3 | E1 the mark-clone reduction; distinctions from three refuted keys; the key | 3a, 3c confirmed_with_repairs; 3b confirmed |
| SR-C3-4 | D1; D2–D3; R1 and (R-i); the key | 4a confirmed; 4b, 4c, 4d confirmed_with_repairs |
| SR-C3-5 | G1; E4 the collapse; G3 repaired and C1 conditional; the key | 5a, 5b, 5d confirmed_with_repairs; 5c confirmed |
| SR-C3-6 | the order-1427 tree; the replacement sentence; the `3p = 2M+3` rows | 6a, 6c confirmed; 6b confirmed_with_repairs |
| SR-C3-7 | B5; B7; B8, B9; the `CBstar` paraphrase; P10 / Lemma U; the (NM) note | 7b confirmed; 7a, 7c, 7d, 7e, 7f confirmed_with_repairs |

Zero rejections, zero unresolved; every reader recomputed its capsule seal before reading. **Record corrections surfaced by the
reads:** (i) three key names were not predicates of their statements (E1's asserted the transport unconditionally; the D1–D3 name
read as every CB tree; the pendant-arm name is false without its hypotheses — `K_{1,3}` with `Q` one leaf has deficit 4 and no
arm) — renamed, old names as aliases; (ii) the D2/D3 argument is a sum of two flows with disjoint targets, using neither (R-i) nor
(R-ii); "Hall for non-sector families plus Hall for sector families" is invalid as stated (the pattern that sank the original
(R-ii)); (iii) the synthesis's R1 wording and its "smallest unproved lemma" were too wide — narrowed to (O2); (iv) the synthesis's
`CB(8,92)` paragraph calls 15.25 the "switch-image ratio" — 15.25 is the whole mixed-neighbourhood ratio, the switch image alone is
14.2526 (advisory; the record row carries both); (v) the `CBstar` correction's "holds at eligible ranks as registered" understated
the key; (vi) B9's range `1 ≤ k ≤ d` and B7's `f ≥ 0` / support-on-arcs hypotheses are load-bearing and now on the face; (vii) A2
credits Lemma U to U1 alone — the mathematics is F2's and the Cycle 1–2 critics', U1 wrote the Lean text; (viii) the E1 criterion is
sufficient, not necessary; (ix) `SEMANTIC-CONTRACT.md` §1.1's "smallest eligible trees have order 13" is false (eligible trees at
orders 11 and 12, all inside the closed band; erratum R30-E-g); (x) the equitable-lift key's alias fields were a serialized string
(R30-E-f); (xi) `C3-ALLOCATION.md`'s "the whole (INV) key" wording is struck (one clause at one instance). New observation
(SR-C3-6): on the choke class the sector deletion deficit equals the arm tag's own summand of `S` on all six rows.

## 6. Standing facts of record entering Cycle 4

- (HALL) with deletion arcs alone holds at every eligible rank of `CB(8,86)`, `CB(8,89)`, `CB(8,92)` except the first
  (174 of 177) and at 166 ranks of `CB(8,108)` (578–648) and `CB(7,144)` (674–768) — `computer_assisted`, contiguous. Sector
  Hall under (D) ∪ (S) for every `X ⊆ X_sec` at every eligible `p` of the three `CB(8,·)` rows (Cycle 2). Open at the six first
  ranks as stated in §1.
- E1: on `CB(d,m)` at rank `p`, if the type-path inequalities hold (cleared integer form; requires `p ≥ m+1`), every family of
  non-sector sources satisfies deletion-only Hall (`proved_informal`); the worst ratio is at `q = 1`; first-rank fractions 460/459,
  476/475, 492/491 exact. The criterion fails at `CB(1,7)/10` although the row saturates.
- E4 + G1: a positive deletion deficit of a self-witnessed star-forest sector requires `Q = {r, v}` with a pendant `P_3` arm,
  baseline count 1, `K = 2`, at every rank (`proved_informal`); exhaustive to order 12 (309,106 rows in class, 2,001 positive
  deficits, all pendant-arm).
- GK-SIGN: `S(G_k, k+3) = −g(k+1) − 2^k − (k+2)A(k) < −2` for every `k ≥ 1`, all leaves favorable; deletion arcs alone saturate
  `G_3..G_8`; (INV)'s quotient clause and the invariant half both `formally_verified`; equitable lift and (LIFT) `proved_informal`.
- Switch-necessary rows (deletion-only Hall fails on the sector at an eligible rank): the five CB first ranks and `G(8^82, 7^2)/448`
  (order 1427, the first non-CB tree and the first below order 1465 on record; not a proved minimum); whole-tree switch necessity
  only below the window (order 8 at `p = 3`; `CB(4,1)/4`; C-U2-F's 1,292-row census, single-instrument).
- `CBstar` exact sector deficit at every `p ≥ 2`; `t ≥ 2` corollary for `p ≥ x+2`; `CB(1,m)` sector switch targets all weight 0
  (any tag set); `CB(d,1)` whole-sector sums `2^k C(d,k)` vs `C(d,k−1)(2^{k−1}+k−1)` for `1 ≤ k ≤ d`.
- Struck (do not cite as evidence): the Cycle 2 standing-state sentence on switch arcs; the synthesis's R1 wording and T's wide
  form; "Hall(sector) ∧ Hall(non-sector) ⇒ Hall"; T2's `d = 1..8` search; the three Stage 6 key names; F1's and U2's central
  obligations (not executed — adjudicators' candid note); the 15.25 "switch-image" label; §1.1's order-13 sentence.

## 7. Errata, incidents and process record

- **R30-E-e**: the C3 clone's bare substitution rewrote the frozen first-interior path in the sealed critic protocol (recorded at
  dispatch); **R30-E-f**: the equitable-lift key's alias fields (Cycle 2 close) — repaired; **R30-E-g**: `SEMANTIC-CONTRACT.md`
  §1.1 order-13 sentence — false, sealed file not edited, correction carried here and in the checkpoint.
- **R30-I-3 (controller incident, Stage 7 seal).** The first Stage 7 packet manifest was written although its path-check member
  reported four findings: the controller's shell pipeline (`… | tail -2 && seal …`) took `tail`'s exit status, masking the
  checker's non-zero exit. The four findings were the seats' own read-boundary disclosures quoting the harness scratch roots (the
  auditor's `INFORMAL-AUDIT.md` and its `EVIDENCE/` copy; the formalizer's report and its draft) — legitimate quotations, handled by
  `control/C3-STAGE7-PATH-LITERAL-QUOTATION-RECORD.json` as in Cycle 2 Stages 4/5. The invalid manifest is kept under a
  `superseded-a0c6f3c8` name and is cited nowhere as a seal; the seal of record is `89b4405f…`. Rule adopted: a seal command never
  follows a check through a pipe; the check's exit code is tested directly (`set -o pipefail` plus an explicit test).
- **R30-N-45** (documented text substitution in SR-C3-4's block); **R30-N-46** (close-script grammar fixes: heading at line start,
  single-line `/ FIELD:` notation, RECORD status normalisation, record-id map, award-key supplement route); **R30-N-50** (two
  post-registration field normalisations by `control/c3_close_field_normalize.py`).
- Stage 3 disclosures record transcribed from summaries for two seats (addendum filed at Stage 4); Stage 5 admission exception
  (a quoted prose line matching the flag pattern; third documented tool change). Path-literal quotation records: Stage 2, Stage 7.
- Seat process (Stage 7 and second reads): every seat recomputed its capsule seal before reading; deviations disclosed and
  transcribed from the returns into `control/C3-STAGE7-AGENTS.json` and `control/C3-SECOND-READ-AGENTS.json` (directory listings
  outside read lists; harness-saved copies read back; one grep glob that displayed lines of sibling briefs; one mistyped redirect
  refused by the OS; brute force beyond a brief's enumeration clause used only for instrument validation). None supplied evidence.
- Controller replays as third instruments: `control/controller-facts/CF-REPLAY-c3{a..e}.json` (the order-1427 tree; the order-8
  tree; the `G_k` rows; the `CBstar` small rows; the (R-ii) witness).

## 8. Cycle 4 portfolio (binding text in `control/C4-ALLOCATION.md`; ruled on in the checkpoint §4)

| Seat | Route |
|---|---|
| T1 | `C4-T-01 CB-FIRST-RANK-COUPLED-ALLOCATION` |
| T2 | `C4-T-02 CB-PATTERN-UNIFORM-CLONE-TRANSPORT` |
| F1 | `C4-F-01 POSITIVE-PART-FEATURE-REFINED-CLASS-UNION-CUT-SEARCH` |
| F2 | `C4-F-02 GK-UNIFORM-HALL-OR-CUT-AND-THE-SATURATION-CONJECTURE` |
| U1 | `C4-U-01 LEAN-GK-SIGN-AND-NM-ENCODING` |
| U2 | `C4-U-02 SWITCH-SHARE-ALLOCATION-LEMMA` |
