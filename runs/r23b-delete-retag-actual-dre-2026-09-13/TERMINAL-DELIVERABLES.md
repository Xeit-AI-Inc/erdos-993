# TERMINAL-DELIVERABLES.md — STAGED (C6-U1)

**Status: STAGED in this route's tree, per `control/CYCLE6-ALLOCATION.md`
§C6-U1 ("Assemble the terminal deliverables document ...at the run root,
staging in your route tree until the gate"). This route does not write to
the run root; the controller installs this document (or its
gate-adjudicated successor) at `TERMINAL-DELIVERABLES.md` at the run root
only after C6 adjudication, per the C6 TERMINAL STOP-TEST clause 1.**

Every item below is one of the eight semicolon-delimited clauses of
SOLUTION-CONTRACT §9 ("Deliverables (terminal)"), numbered in the order
they appear in that section — the same numbering `R23B-C5-U1-05` and this
cycle's charge text use ("§9 item 2", "item 3", "item 4", "item 8").
**Honest fidelity label** on each row states what THIS SEAT verified
directly versus what it cites by reference to a sibling C6 seat's
not-yet-read product (isolation: per `control/c6-route-brief.md`, only
C6-F2 and C6-U3 receive sibling C6 products as declared consumption; this
seat, U1, reads no sibling C6 material and so cannot independently confirm
C6-T1/T2/T3/F1/F3/U2/U3's own outputs — only their C1–C5 predecessor
state, which this seat did read and did verify).

| # | §9 item | location | state | honest fidelity label |
|---|---|---|---|---|
| 1 | `SEMANTIC-CONTRACT.md` (complete definitions, source versions, domain, exact intended theorems) | run root, `SEMANTIC-CONTRACT.md`; current live sha `024410566405f25007f36d3ab3995e2ac9758715204129943045e2b4c8000b74` (re-verified by this seat's instrument against `control/STAGE2-SEAL-C6.json`, member match confirmed) | COMPLETE through amendments A1.1–A1.3, A2.1–A2.4; C1's source-to-definition map and definitions/proved/assumed partition executed | **definitions complete; one premise explicitly flagged, not silently normalized** — A1.1's RTree-transfer convention is stated as unproved on every actual-tree sentence, and is exactly the RTree horn this handoff (item 6 below) hands to Ashton, not resolved here |
| 2 | executable exact evaluators, independent validation suite, single reproducible entry point | evaluators/validation: C1–C2 products, re-affirmed C4 ("OB-R23-EVAL: closed and hardened"); entry point: `control/replay_all.py --root <run root> --out <dir>`, chartered to **C6-F3** | evaluators/validation: CLOSED AND HARDENED (C1–C4 predecessor state, read and cited by this seat). Entry point: chartered, **not independently confirmed by this seat** | **STAGED-CITED, not verified** — this seat has no read access to C6-F3's evidence tree under the route brief's sibling-isolation rule; the controller/C6-F2 (which does receive F3's product) must confirm the entry point actually lands and reproduces its manifest before this row is upgraded past STAGED-CITED |
| 3 | at least one fully inspectable actual row + the six mandatory controls (edges, coefficients, favorable-leaf list, signed summands, relation data, any failing cut) | `cycles/cycle-4/C4-GATE-RECORD.md` §0 (order-1567, CB(8,92)); C2/AUTHORIZATION digest + `proposed/CLAIM-UPDATE-PROPOSALS.md` RC-15b (order-91, T22); full enumeration table in `C6-TERMINAL-CLOSE-INPUT-LIST-REPAIRED.md` Repair 2 | **TWO** fully inspectable rows on record (order-91, order-1567), both DISCHARGED AT SCALE (OB-R23-ROWS, C4) | **directly verified by this seat**: the order-1567 signed-summand figure (`S = −748810430710227858618987…557120`, 351 digits) was byte-checked against the sealed `cycles/cycle-4/C4-LEDGER.csv` row `R23B-C4-F1-01` by this seat's own instrument (not merely quoted from an adjudication); all six controls enumerated explicitly for both rows (repair 2) |
| 4 | Lean correspondence package at the pinned toolchain, with honest fidelity labels | package: C4 grand merge (181 constants, 0 sorryAx) + C5 `RelationTransport.lean` (297 constants, 0 sorryAx) + whatever C6-T1/T2/T3 land this cycle; **fidelity label table is C6-T3's product** (`control/CYCLE6-ALLOCATION.md` §C6-T3, "the §9-item-4 HONEST FIDELITY LABEL TABLE... a §9 deliverable") | C4/C5 state CLOSED and read by this seat; **C6-T1/T2/T3's own state NOT read by this seat** (sibling isolation) | **STAGED-CITED, named by owner, not content** — this row exists specifically to repair the C5 defect of leaving the fidelity table unnamed (`C6-TERMINAL-CLOSE-INPUT-LIST-REPAIRED.md` Repair 4); the controller must fold in C6-T3's actual table at the gate, this seat did not produce or verify it |
| 5 | the rank-two filter finding | `proposed/CLAIM-UPDATE-PROPOSALS.md` RC-04 (sealed C1 finding, `cycles/cycle-1/C1-LEDGER.csv` row `R23-C1-RANK2-IDENTITY`) | sealed, C1–C2, carried forward unchanged; Ashton-gated proposal PENDING | `proved_informal` tier (0-mismatch on 999,736/999,736 labeled-tree leaf-pair instances, orders 3–8; independently re-derived twice per RC-04's provenance chain) — **never `formally_verified`**, per §10 |
| 6 | handoff to the mathematics agent (established identities, weakest remaining compensation inequality, structural obstructions) | `HANDOFF-TO-MATHEMATICS-AGENT.md`, this evidence directory (this seat's own product, this cycle) | DRAFT, staged, pending controller gate installation | **this seat's own product; self-assessed** — every cited figure re-verified against its C1–C5 sealed source by this seat directly (§1–§3 of the handoff document cite adjudicated ledger rows by id, each spot-checked against the cited CSV/gate-record where this seat had read access); the RTree horn is stated as ASHTON'S DECISION, not resolved by this seat, with both horns' consequences given |
| 7 | proposed claim corrections | `proposed/CLAIM-UPDATE-PROPOSALS.md` (RC-04b, RC-04, RC-08, RC-15, RC-15b, RC-16+mapping, RC-17-done) + `RC-18-REVISED.md` (this evidence directory, supersedes the C5 RC-18 draft) + `CLAIM-DISTINCTIONS-DRAFT-ENTRIES.md` (this evidence directory) | C4-U1 items: FINALIZED DRAFT, Ashton-gated, unchanged this cycle. RC-18: REVISED this cycle (registration-blocked pending the distinctions ruling, §5 of `RC-18-REVISED.md`) | **RC-18's C5 draft REGISTRATION-BLOCKED status is preserved, not silently cleared** — this seat's revision repairs the false §2 certification (`R23B-C5-U1-03`) and discloses the W4-vocabulary collision with an explicit escalation trigger (`R23B-C5-U1-04`); it does NOT resolve the registrar's distinctions question, which stays with Ashton |
| 8 | final status: construction proved / construction contradicted / specific unresolved correspondence debt | this document, §"Final status" below; verbatim phrase restored per `C6-TERMINAL-CLOSE-INPUT-LIST-REPAIRED.md` Repair 3 | drafted this cycle from the C1–C5 sealed record; **the exact debt statement (R-1…R-5 residual) is C6-T2's charge to finalize**, not read by this seat | **STAGED, phrase-verbatim, content-provisional** — the debt named below is the C5 state of record (`C5-GATE-RECORD.md` §1/§4); the controller must fold in C6-T2's actual C6 outcome before this row ships as final |

## Final status (item 8, restored verbatim phrasing)

Per-object, at exact scope (mirrors `C6-TERMINAL-CLOSE-INPUT-LIST-REPAIRED.md`
§7's inputs, restated here with the verbatim SOLUTION-CONTRACT §9 category
names):

- **Construction contradicted** (mechanism kill, never a target
  counterexample; O14 untouched in every instance): literal all-cut Hall
  on the actual relation — REFUTED, order-91 witness T22
  (`E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`). Delete-only universal
  Hall — REFUTED a fortiori, same witness family. Tag-closed-cut Hall
  (W4) — REFUTED, order-1567 witness CB(8,92) (`R23B-C4-F1-01`, proposed
  `E993-R23-TAG-CLOSED-CUT-HALL`, registration-blocked per §7 above).
- **Construction proved** (sorry-free at the pin, or `proved_informal`
  with independent re-derivation, never `formally_verified`): r19 Thm 3.1
  (`2p ≥ n`); F1-EXT-1 (`2p ≥ n−1`, all-multi-witness); THM-R23-C as a
  conditional; the T5/`R23B-C5` identity family (§1 of the handoff
  document); the rank-two exact identity (RC-04, item 5 above); six
  relation-family transport lemmas at graph-general scope
  (`R23B-C5-T2-01`).
- **Specific unresolved correspondence debt** (verbatim phrase, not
  softened to "open" — the repair this row exists to make): the
  relation-family transport lemma — `P`, `N`, `Delete`, `Retag`, `C_r(v)`
  have no abstract-side referent as of the C5 close; the union remainder
  R-1…R-5 (`C5-GATE-RECORD.md` §1). **C6-T2 is charged with stating the
  exact C6 outcome of this residual** (discharged, or the earliest
  precise unproved sub-lemma) — this seat has not read that outcome and
  the figure above is the C5 state of record, to be superseded by C6-T2's
  product at the gate, not by this document.
- **OPEN, untouched throughout**: the per-row demand `|P| ≤ |N|` — the O14
  row itself, via BRIDGE-2 (standing duty 13: no r23 seat claims O14 or a
  universal `S ≤ 0`). `E993-R19-FIXED-GAMMA-HALL`, `E993-R19-R2-HALL-UNIVERSAL`,
  `E993-TGT-TREE` — all three re-confirmed OPEN this cycle by this seat's
  own reverse-census instrument (`RC-18-REVISED.md` §2 REVISED).

## Ceiling honesty (verbatim, SOLUTION-CONTRACT §10)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open; candidate invariants are
mechanisms — mechanism kills are never target counterexamples; computation
is evidence, never proof; no bounded zero is evidence of anything; nothing
is ever `formally_verified`.

## Evidence and verification

Every figure in this document that this seat could verify against a
sealed source it has read access to was verified by
`scratchpad/c6-u1/c6_u1_verify.py` (receipt:
`c6-u1-verify-receipt.json`, this directory) or by direct `grep`/read
against the cited CSV/gate-record file, not copied from an adjudication's
paraphrase alone. Items marked STAGED-CITED above are exactly those this
seat could not independently verify under this cycle's sibling-isolation
rule, and are named as such rather than silently presented as verified.


---
**[CONTROLLER GATE-INSTALL NOTE, 2026-09-16]** r23's consolidated six-cycle ledger is installed at the run root as `R23-TERMINAL-LEDGER.csv` (208 registered rows = 168 C1-C5 + 40 C6). The pre-existing run-root `TERMINAL-LEDGER.csv` is a PROGRAM-WIDE cross-experiment registry (r18/r19/r20/hg2/beta-remainder/six-cycle-math + this run) and was PRESERVED UNTOUCHED to avoid destroying cross-experiment state; the C6-U2 charge's 'install into TERMINAL-LEDGER.csv' was written before the controller observed that name collision. The single reproducible entry point (SOLUTION-CONTRACT sec9 item 2) is installed at `control/replay_all.py`. Agreement matrix installed at run root with the 6197 duty-22 figure filled (ADJ-U MAJOR). Flagged to Ashton.
