# Cycle 6 Close — r30 (the SIXTH and LAST cycle; controller record, 2026-09-27)

Controller: Claude Fable 5.1. Run `erdos-993-math-dre-20260926-r30-weighted-transport`. Cycle 6 ran under the C5 gate's ruling 39
((b′) supplied) and the C6 gate rulings 45–52 as the terminal cycle of the six-cycle charter. Date labels of record: the Stage 7 and
second-read records of this cycle carry the label `2026-09-28` written by controller error (erratum R30-E-w); every step happened on
2026-09-27 by the clock, as the receipts show; the labels are identifiers inside sealed capsules and are kept as written.

## 1. Headline

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN at full scope** — neither proved uniformly nor refuted. The terminal
  synthesis applied the stop gate explicitly: decisive event (a) (a full-scope formal or uniform proof) did not occur; decisive event
  (b) (a confirmed deficient cut) did not occur — no (CUT) candidate exists anywhere; no plateau (new `proved_informal` lemmas and new
  adversarial findings this cycle). The run ends at the charter's six-cycle ceiling with a SUCCESSOR RUN recommended (`continue: yes`
  records only that).
- **Restricted scopes of record at close:** every eligible rank of every `G_k`, `k ≥ 3` (`formally_verified`, C5-LA1); the spider
  `S(1,2,3^k)`, `k ≥ 5`, at every rank `p ≥ k+2` (`proved_informal`) and at rank `k+3` **`formally_verified` (C6-LA2, this cycle)**;
  the six closed trees (`computer_assisted`); and, new this cycle, TEN first-eligible-rank CB rows with switch arcs load-bearing
  (`computer_assisted`): `CB(8,m)/⌊(16m+4)/3⌋` for `m ∈ {95, 98, 101, 104, 107}` and `CB(7,m)/⌊(14m+4)/3⌋` for `m ∈ {109, 112, 115, 118, 121}`.
  The uncertified switch-necessary frontier falls 218 → 208 of the 223-row census (`d ≤ 13`). `CB(8,95)/508` leaves the (CUT) site list.
- **Smallest unproved lemma (uniform):** `(L-S)_top` — a closed-form choke-local sector certificate at the top sector-deficient rank of
  `CB(8,m)`, `m ≡ 2 (mod 3)` (with `θ*_8(m) = 288/(200m²+82m+5)` as its conjectured law), composed with the registered E1 threshold key and
  the now-proved favorability lemma; alongside, `(ELIG-top)(a)` for `m ≥ 2396`. **Instance level:** the 208 uncertified rows of the 223-row census, the smallest by order being `CB(7,124)/580` (`n = 1863`), `CB(8,110)/588` and `CB(8,111)/593`
  (controller derivation `control/controller-facts/C6-UNCERTIFIED-FRONTIER.json` from the Cycle 5 census replay; the next rows in the two
  certified residue classes are `CB(8,110)/588` and `CB(7,124)/580`).
- **Primary aggregate:** no status change (scope note S-7: a full-scope (HALL) proof would imply it through the formally verified
  FLOW⇒SIGN key resting on (WID)).

## 2. Seals of record

Stage 2 `29a3aeb7…` (2016 members); Stage 3 dispatch `dd399798…`; Stage 3 `32452609…`; Stage 4 dispatch `74be1845…`; critic capsules T1
`bba67d9c…` T2 `57d8551c…` F1 `1fab8090…` F2 `63a626d9…` U1 `355e287d…` U2 `eed3c4e8…`; Stage 4 `0e5fc7b4…`; adjudicator capsules T
`a6a4d411…` F `92f832bd…` U `d6dcf86f…`; Stage 5 `2335726c…`; Stage 6 dispatch `6dddbc32…`; Stage 6 `18e7c6ae…`; award capsule C6-LA2
`0433f214…` (1500 members); second-read capsules SR-C6-1..8 `3c66a7fa…`, `868b61a6…`, `6e72a1e5…`, `842d96f1…`, `123b57cf…`, `e134b4a3…`,
`6325adbe…`, `7024d1d8…` (`control/c6-second-read/SEALS.json`); **Stage 7 packet `d458657a2765803a3a38c69141561298c5cb0bc8821ea09376732610a46b4833`**
(1154 members; path check 1135 text files clean under the C6 quotation records incl. the new
`control/C6-CLOSE-PATH-LITERAL-QUOTATION-RECORD.json`); **second-reads packet `d266d5a3a11adbfabe22e8b9f53304d9209e7cfdb9c6326d2689d37cbc03d28b`**
(43 members; 33 files path-checked clean). Every seal ran with an explicit exit test after every seat's completion (R30-I-1).

## 3. Lean award (governed `lean-proof-workflow`; `formally_verified`)

**C6-LA2** — `E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3`, run `runs/lean-2026-09-28-c6-la2-spider-tree-weighted-hall-rank-k-plus-3`:
for every `k ≥ 5` the spider `S(1,2,3^k)` is a tree, `crossingIndex + 2 ≤ k+3`, `3(k+3) < 2·indepNum + 1`, and a saturating flow exists
at rank `k+3` at the favorable-leaf selector. 173 entries (66 carried byte-identically — C4-LA1's graph-generic 1–21, 25–37, 45–75 and
first-interior entry 14 — plus 107 new); `Main.lean` `df5e2870…`; kernel receipt `ce9dbc19…` (11 checks; axioms exactly the three on
every declaration); informal audit passed `0a5f27d1…`; fidelity `match` `b9683ede…`; `VERIFICATION-REPORT.md` `c79a3792…`; zero repair
rounds. Key `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5` registered VERIFIED
`formally_verified` (ledger row `R30-C6-LA2`). FLOW is proved in Lean at every `p ≥ k+2` for every `F ⊆ leafSet` (the registered spider
key's flow clause; entry 165) and N3a by the Newton-free root split. Full record: `cycles/cycle-6/stage7/LEAN-GATE-CLOSEOUT.md`.
Incident R30-I-4: the harness refused the formalizer's write of `FORMALIZER-REPORT.md`; the controller filed the seat's text verbatim
under a filing note. SR-C6-8 (the alternative proofs as scope notes) was not dispatched: the award closed.

## 4. Registrations applied (run-local registry; the terminal close rebases them additively onto the 457 master)

`control/register_c6_close.py` (whitelist with list values for the split-row keys; renames; `merge_parts`), then
`c6_close_field_normalize.py` (nothing to normalise) and `c6_close_residue_repair.py` (19 Cycle 5 `terminal_history` entries `cycle: 4`
→ 5; 15 ledger provenance strings `synthesis C2` → the row's cycle on C3–C5 rows; 3 alias fragments re-joined — errata R30-E-t/u/v).
Registry 460 → **468**; ledger 388 → **414** rows; distinctions 75 → **102**. Snapshots `control/snapshots/*.c6-{pre-close,close}.*`.
- **New keys (8).** `formally_verified`: the spider award key. `proved_informal`: the favorability lemma
  `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (modulo Darroch and Newton on
  products of linear factors; SR-C6-1); the CB exactness lemma with s-isolation
  `E993-R30-CB-ARM-SUPPORT-FREE-POSITIVE-SOURCE-FAMILY-DEFICIENCY-EQUALS-AGGREGATE-MINUS-ARM-SUPPORT-CLASS-EXCESS-SUPPLY-AT-RANKS-UP-TO-DM`
  (renamed by SR-C6-5; scope `1 ≤ p ≤ dm`, "every leaf favorable" not needed); A1
  `E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-ALL-CONTAIN-ARM-LEAF-OR-ALL-CONTAIN-ARM-SUPPORT-HAS-DEFICIENCY-AT-MOST-ITS-ROOT-AND-ARM-LEAF-SECTOR-PART`
  (renamed by SR-C6-6); A3 `E993-R30-CB-FIXED-POSITIVE-WEIGHT-ROOT-FREE-CONFIGURATION-STRATUM-DELETION-NETWORK-HALL-IFF-THREE-R-PLUS-ONE-AT-LEAST-TWICE-FREE-STAR-COUNT`
  (renamed by SR-C6-6; hypotheses `g ≥ 1`, `t + g ≤ p + 1` added — the synthesis's form was false without them); the arm-tag identity
  `E993-R30-LEAF-ON-DEGREE-TWO-SUPPORT-TAGGED-COUNT-EQUALS-INDEPENDENT-COUNT-ONE-LOWER-OFF-FAR-NEIGHBOUR-CLOSED-NEIGHBOURHOOD-AND-LEAF`
  (SR-C6-7; the master's `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION` already holds it at tree scope — distinction row,
  no novelty claimed there). `computer_assisted`: the two row-family keys
  `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` and
  `E993-R30-CB-7-M-109-TO-121-CONGRUENT-1-MOD-3-RANK-14M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`, each assembled from
  SR-C6-2's rows (T2's) and SR-C6-3's rows (the critics'); dependency: the registered mark-clone criterion key only (no Darroch, no
  threshold key, no "CD-1"); the integral step is the kernel-checked companion `exists_saturatingFlow_of_weightedHall`.
- **Scope notes** on (HALL) (SR-C6-2: `CB(8,95)/508` off the cut list; C6-LA2: the formal rank-`k+3` scope), the registered spider key
  (superseded at `k+3` only), the E1 threshold key (S-3 by SR-C6-1; Darroch hygiene by SR-C6-4), the `d ≤ 6` sector key (S-6: Darroch
  and Newton only on the summands `T_q`, `E` — NO regression), GK-SIGN (its proof of record is Darroch-free), `E993-TREE-REAL-ROOTED`
  (minimal witness `K_{1,3}`, order 4; forest wording), `R30-CB-RECORD` (S-2 bounded facts; the 218 → 208 arithmetic), the primary
  aggregate (S-7). **Alias repairs:** `E993-TREE-REAL-ROOTED` gains forest / only-real-roots alias patterns (the wording T1's struck lemma
  used slipped every screen); the Cycle 5 keys' comma-fragment aliases re-joined.
- **Distinction rows (27)** and **ledger records (26)**: the six per-row certificate records, the census record S-5 (orders 20–23), the
  Darroch hygiene census, SR-C6-1's three records, SR-C6-5's four, SR-C6-6's two, SR-C6-7's one, the per-key rows.
- **Lint.** Master lint (`control/CLAIM-STATUS-LINT-c6-close.json`): 434 claims, 0 findings, 1 warning (`SEARCH_BELOW_WITNESS` on
  `E993-TREE-REAL-ROOTED`: the hygiene census's horizon 7 is below the key's recorded witness order 26 — EXPECTED: the recorded 26 is the
  log-concavity route's order; the direct minimal witness is order 4, recorded in the scope note; whether to correct the master key's
  field is an open decision for Ashton). Run-local lint (`control/CLAIM-STATUS-LINT-c6-close.run-local.json`): 468 claims, the one
  inherited `R21-C1-T6` false match (as in every cycle) and the same warning.

## 5. Isolated second reads (seven Opus 5.5 high seats dispatched; SR-C6-8 held and not needed)

| Read | Statements | Verdicts | Outcome |
|---|---|---|---|
| SR-C6-1 | favorability lemma; closed forms; citation fact S-3; the name | 2 confirmed, 2 with repairs | K-2 registered; wording repairs (leaf set, support bounds, "product descent step"); `p* − 2 − μ_1 = (d−5−2ε)/6` on the face |
| SR-C6-2 | T2's four rows; naming | 5 with repairs | rows confirmed with the reader's own instruments; dependency narrowed to the criterion key |
| SR-C6-3 | six critic rows; the key blocks | 7 with repairs | all six confirmed; the reader is the second instrument for `CB(7,121)/566`, `CB(8,107)/572` |
| SR-C6-4 | Darroch hygiene (the `d ≤ 6` key, the threshold key, every Darroch/Newton face) | 4 confirmed | NO regression; findings on `E993-TREE-REAL-ROOTED` and three Cycle 5 residues |
| SR-C6-5 | exactness lemma L1, (a), (c), (d), (e); boundary; general `F`; name | 2 confirmed, 4 with repairs | renamed; scope `p ≤ dm`; three closed forms one polynomial; `g`-form needs integer indices |
| SR-C6-6 | A1; A3; names | 1 confirmed, 2 with repairs | A3's missing hypotheses added; both renamed |
| SR-C6-7 | arm-tag identity; name | 1 confirmed, 1 with repairs | tree-scope predecessor found in the master; distinction row |

Thirty-seven isolated second reads in the run (30 in Cycles 1–5, 7 here), 0 rejected.

## 6. Standing facts of record at the terminal close

- `formally_verified`: C1-LA1 (WID), C1-LA2, C2-LA1, C3-LA1, C4-LA1, C5-LA1, C6-LA2. `proved_informal`: the Cycle 1–5 keys as recorded in
  the Cycle 5 close §6 plus K-2, K-5, K-6, K-7, K-8. `computer_assisted`: the five-row keys, the two `G(8^82,7^2)` keys, K-3, K-4.
- Struck this cycle (never evidence): T1's forest real-rootedness citation and every uniform claim drawn from it; T2's "≥ 31×",
  "structurally unrelated", "tables shipped as data"; F1's `7.90 × 10^49`, digit literals, "verified by WID", "proven obstruction"; F2's
  self-test literal and successor hint; U1's "theorem" grades, "N5-general not formalized", N7 as terminal, the `E-1`/`E-2` citations;
  U2's "compression CONFIRMED", `da7d1d3d…`, "43", "8 points", the C2-LA1 citation, the window upper ends; the controller's CF-T2 `θ*`
  literals (R30-E-q) and CF-T1 grade (E-2 → R30-E-x below).
- Refuted (STATED lemmas): the all-families compression lemma (`CB(2,2)/4`); CHAR at `m = 1`; T1's `m`-independent certificate plan;
  "deficient mixed families from sector plus arm-`{v}` sources" wherever the sector is Hall (A1).
- Records: (ELIG-top) exact on `[106, 2395]`; the `θ*` laws (conjecture); laboratory maxima incl. `CB(12,2)/17`; structured-class
  exclusions; the census to order 23; `T_22/34` the smallest known eligible positive summand (order 91).

## 7. Errata, incidents and process record

- **R30-I-4** the harness-refused formalizer report (filed verbatim by the controller; rule recorded).
- **R30-E-t** Cycle 5 registrations' `terminal_history` carried `cycle: 4` (clone residue in `register_c5_close.py`'s `hist`); repaired.
- **R30-E-u** ledger provenance "synthesis C2 registrations" on C3–C5 rows (setrow residue); repaired.
- **R30-E-v** alias fragments: the C3–C5 scripts split a rename alias on ";"; re-joined; the C6 script uses a comma.
- **R30-E-w** the controller's date labels `2026-09-28` for this cycle's Stage 7 and second-read records (the clock read 2026-09-27);
  labels kept as identifiers; rule: read the clock before writing a date label.
- **R30-E-x** (the synthesis's E-2): controller fact CF-T1 graded T1's Claim 1 `proved_informal` for `m ≥ 246` without flagging the false
  real-rootedness lemma; the grade was struck by the critics before registration. **R30-E-y** (E-3): CF6-3(iii) and allocation
  obligation 5 named N5's finite-product iteration as open; it was in C4-LA1's verified text (entries 25–37, 55–72). **R30-E-z** (E-5):
  the Stage 6 protocol clone proposed "C6-LA1 (WID)" although WID has been `formally_verified` since Cycle 1. The synthesis's E-1 is
  R30-E-q (already recorded); E-4 extends R30-E-r (`CB(10,2)/14` and `CB(12,2)/17` also have `S > 0`); E-6 is the Stage 7 repair applied
  in the brief (carries verified against the C4-LA1 text of record); E-7 is a seat citation error (T1: SR-C5-4 is in the allocation, not
  SEMANTIC-CONTRACT §2). SR-C6-4's wording note on CF6-6 ("data of `I`" where the binomial split's summands are meant) is recorded here.
- Process: 6 route returns (T1 bounded_evidence; T2 proved_conditional; F1 blocked → not_completed; F2 bounded_evidence; U1 compiled; U2
  bounded_evidence), 12 critiques (every pair concordant; 72/72 in the run), 3 adjudications, 1 terminal synthesis, 1 award (zero repair
  rounds), 7 second reads; every seat's runtime reported `claude-opus-5-5[1m]` (Opus seats) or the Sonnet 5 id (routes); no background job
  survived any seat's final write; the read-boundary deviations of every seat are in the agents records and were judged not to affect any
  verdict.

## 8. What follows

There is no Cycle 7. The terminal close (`control/build_r30_close.py terminal`; `control/build_r30_publication.py master` then `public`)
rebases the 34 `E993-R30-*` keys (26 from Cycles 1–5 + 8 from this cycle) additively onto the 457-identity master, publishes the seven
Lean packages and the run records, and hands the successor inheritance (synthesis `## Next-cycle portfolio` (A) and (B)) to Ashton as
open decisions in `control/CONTROLLER-REVIEW-R30.md`.
