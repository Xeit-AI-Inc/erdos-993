# Cycle 5 Stage 1 Gate — r30 (controller record, 2026-09-27)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 5. The Cycle 1 rulings
(`control/C1-STAGE1-GATE.md`, 1–12), the Cycle 2 rulings (`control/C2-STAGE1-GATE.md`, 13–20), the Cycle 3 rulings
(`control/C3-STAGE1-GATE.md`, 21–28) and the Cycle 4 rulings (`control/C4-STAGE1-GATE.md`, 29–37) remain in force verbatim; this
gate records the state change at the Cycle 4 close, the plateau-test outcome, and adds the Cycle 5 rulings.

## Current-state check

- Master registry unchanged at 434 identities, list format, byte-identical to the public mirror at
  `0411905ff601d07f2e79b03a07c31d708dc04efd`. Nothing is published before the terminal close. The run-local registry
  (`control/CLAIM-IDENTITY.run-local.json`) carries the master's 434 plus every key registered at the Cycle 1–4 closes; the exact
  count and the lint results are stated in `cycles/cycle-4/CYCLE-CLOSE.md` §4 (the pre-seal check of this gate binds the count
  quoted there to the registry at the Cycle 5 Stage 2 seal).
- Key statuses entering Cycle 5: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` OPEN at full scope — with TWO restricted scopes now of
  record as SEPARATE keys: (HALL) on the infinite eligible family `{(G_k, p) : k ≥ 3, p ≥ k + 3 eligible}` with deletion arcs alone
  (`E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET` composed with the registered
  eligibility key; the flow key's grade is the Cycle 4 close's — `formally_verified` if C4-LA1 closed, else `proved_informal`), and
  full (HALL) with switch arcs load-bearing at the five sector-deficient CB first ranks and hence at every eligible rank of those five
  trees (`E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`, `computer_assisted`, with the D2/D3 parts of
  the five-row deletion key). `formally_verified`: C1-LA1, C1-LA2, C2-LA1, C3-LA1 (and C4-LA1 if closed). `proved_informal`: (INV),
  (NM), the second-eigenvalue theorem, the `CBstar` deficit, the `G_k` eligibility key, the equitable lift, GK-SIGN, E1, E4+G1, CD-1
  (`E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`), E1-R
  (`E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`), R3
  (`E993-R30-ACTIVE-WEIGHT-DELETION-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE`). `computer_assisted`: the five-row
  deletion key and the five-row switch-arcs key. The primary aggregate OPEN; the ten refuted mechanism keys REFUTED; the Cycle 3
  conjecture "on trees `S ≤ 0` ⇒ saturation" REFUTED at a non-eligible rank (a record, never a key).
- **Universal-claim counterexample gate for (HALL), Cycle 5:** the Cycle 4 record adds no deficient cut at any eligible row. The
  five CB switch-necessary rows are CLOSED as rows; the one open switch-necessary eligible row on record is `G(8^82, 7^2)/448`
  (T2's object). The open question for Cycle 5's F1: is there an eligible row anywhere on the CB pattern at which the sector's switch
  rescue is too small (the `CB(7,1)/6` mechanism at an eligible rank)?
- **Plateau test outcome (C4 gate ruling 30; checkpoint §4.5):** letters (a) and (b) were both supplied by the Cycle 4 synthesis and
  CONFIRMED by isolated second reads (SR-C4-1; SR-C4-3 with SR-C4-4). Cycle 4 was therefore not a plateau and the run continues.
  This is the FIFTH of six cycles.

## Rulings (Cycle 5; numbered from 38)

38. **Cycle 1–4 records are sources at their recorded grades** (`cycles/cycle-{1,2,3,4}/CYCLE-CLOSE.md`, the sealed syntheses, the
    award directories, the twenty-five second reads). Items the reads STRUCK (Cycle 4 close §6) are never cited as evidence. E1 is
    cited with CD-2 as exactly condition (i) in cleared form; a relaxed class model certifies nothing.
39. **Terminal-close test for Cycle 5 (the successor of ruling 30).** Cycle 6 runs only if the Cycle 5 synthesis admits, and an
    isolated second read confirms, at least one of: (a′) a parameter-uniform (HALL) with switch arcs load-bearing on an infinite
    switch-necessary class at `proved_informal` or better (T1's object); (b′) whole-row (HALL) at `G(8^82, 7^2)/448`
    (`computer_assisted`; T2's object) together with a second infinite eligible family at `proved_informal` (F2's object); (c′) a
    (CUT) candidate surviving two instruments; (d′) a Lean award beyond U1's seeds (CD-1 or the `G_k` (HALL) corollary) together with
    one of (a′)–(c′). Otherwise the run proceeds to its terminal close after Cycle 5. The synthesis rules letter by letter; the
    controller's ruling is mechanical at the close from the decisive reads, as in Cycle 4. The six-cycle ceiling stands regardless.
40. **Lean text of record.** C1-LA1's `Main.lean` (`86b59c6c…`), C1-LA2's (`7c279f4b…`), C2-LA1's (`a9cf3b81…`), C3-LA1's
    (`22e3f81c…`) and, if closed, C4-LA1's (`66db6c73…`; `gkGraph` the `G_k` of record) are the texts of record; a Cycle 5 award
    seeds byte-identically through the registrar with each origin's receipt binding, keyed by (origin award, entry, digest); the
    registrar accepts an instance only as a `def` entry (C4-LA1 precedent) and refuses an entry after the terminal theorem (a terminal
    theorem may be proved by a call to an identically stated lemma — recorded on the face).
41. **Working labels are not names.** CD-1, CD-2, E1-R, R3, CT-1, R2′, L2, C1 and their like are working labels; none may be a key
    or an alias (CD-1 and L2 are already aliases of other keys). Registry text names r30 awards by KEY, never "C1-LA1"/"C1-LA2"
    (aliases of r25 keys), never writes "favorable-leaf aggregate" or the token "4k" (alias patterns of other keys), and an ALIASES
    element is a name only (no `:`, `[`, `,`-split fragments, never the literal "none") — lesson R30-E-i.
42. **Census discipline.** A census states its order range and covers EVERY tree in it (Cycle 4 F2 silently skipped orders ≥ 18);
    a "validated on N cases" literal is written only when the shipped code runs those cases; the gate-31 lines and two-instrument
    `S` stand.
43. **Registration and seal timing** (rulings 18, 19, 26, 37) stand: the run-local registry is frozen from the Cycle 5 Stage 2 seal to
    the Cycle 5 second-reads packet seal; no seal after a piped check (R30-I-3); the Stage 3 disclosures record is transcribed from
    the returns' own disclosure sections, item by item (R30-N-56), BEFORE the Stage 4 dispatch; controller records describe, never
    quote, non-durable paths; a controller check-in never tells a seat the state of its own jobs (R30-N-57).
44. **Clone residue.** Every Cycle 5 protocol and brief was grepped for `C4-`/`c4-`/`Cycle 4`/`cycle-4` tokens after cloning and each
    survivor whitelisted explicitly (R30-E-h); a seat that finds a residue resolves it by the dispatch wrapper's path and discloses it.
