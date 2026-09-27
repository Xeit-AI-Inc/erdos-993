# Cycle 6 Stage 1 Gate — r30 (controller record, 2026-09-27)

Controller: Claude Fable 5.1. Rulings are numbered and binding on every seat of Cycle 6. The Cycle 1–5 rulings
(`control/C1-STAGE1-GATE.md` 1–12, `C2` 13–20, `C3` 21–28, `C4` 29–37, `C5` 38–44) remain in force verbatim; this gate records the
state change at the Cycle 5 close, the terminal-close-test outcome, and adds the Cycle 6 rulings.

## Current-state check

- Master registry: the live master is 457 identities (Codex's heterogeneous closure, public commit `9e412c1`); the run's frozen
  baseline for alias checks is the 434 snapshot under `sources/authority/`; nothing is published before the terminal close. The
  run-local registry (`control/CLAIM-IDENTITY.run-local.json`) carries the 434 plus every key registered at the Cycle 1–5 closes; the
  exact count and the lint results are stated in `cycles/cycle-5/CYCLE-CLOSE.md` §4 (the pre-seal check of this gate binds the count
  quoted there to the registry at the Cycle 6 Stage 2 seal).
- Key statuses entering Cycle 6: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` OPEN at full scope, with restricted scopes of record:
  every eligible rank of every `G_k` (`k ≥ 3`; the C4-LA1 flow key composed with GK-MONO — `formally_verified` if C5-LA1 closed, else
  `proved_informal`); every eligible rank of every `S(1,2,3^k)` (`k ≥ 5`; `proved_informal`); the five CB rows and `G(8^82,7^2)` at every
  eligible rank (`computer_assisted`). The primary aggregate OPEN; the ten refuted mechanism keys REFUTED; the Cycle 3 conjecture
  "on trees `S ≤ 0` ⇒ saturation" REFUTED at non-eligible ranks (records: `CB(7,1)/6`, `CB(11,2)/16`, `CB(9,2)/13`).
- **Universal-claim counterexample gate for (HALL), Cycle 6:** the Cycle 5 record adds no deficient cut at any eligible row: 223
  switch-necessary eligible CB rows all have full-sector Hall with surplus ≥ 4401×; every free-tree row of order `≤ 19` saturates with
  deletion arcs alone; the 169 eligible `CB(d,m)` rows with `d ≤ 5` hold. The two UNSEARCHED (CUT) sites are F1's and F2's objects.
- **Terminal-close test outcome (C5 gate ruling 39):** letter (b′) was supplied and CONFIRMED by both decisive isolated second reads
  (SR-C5-1; SR-C5-2). Cycle 6 therefore runs. **This is the SIXTH of six cycles; the run proceeds to its terminal close after it
  regardless of outcome** (the charter's ceiling; no further continuation test exists).

## Rulings (Cycle 6; numbered from 45)

45. **Cycle 1–5 records are sources at their recorded grades** (`cycles/cycle-{1,...,5}/CYCLE-CLOSE.md`, the sealed syntheses, the
    award directories, the thirty second reads). Items the reads STRUCK (Cycle 5 close §6) are never cited as evidence. The registered
    E1 rank-threshold key is cited for E1 at the band rank, never re-proved; Darroch and Newton are named dependencies where they enter.
46. **Terminal cycle.** There is no continuation test: the Cycle 6 synthesis's `continue` flag records only whether a SUCCESSOR RUN is
    recommended and with what inheritance; the stop gate is applied as always (a decisive event (a) or (b) is recorded if it occurs).
    The synthesis names every Lean award group for the terminal Stage 7 with its exact statement; the controller funds bounded
    attempts only where the informal DAG is closed at Stage 6.
47. **Lean text of record.** The five closed awards' `Main.lean` files (C1-LA1 `86b59c6c…`, C1-LA2 `7c279f4b…`, C2-LA1 `a9cf3b81…`,
    C3-LA1 `22e3f81c…`, C4-LA1 `66db6c73…`) and, if closed, C5-LA1's (stated in the Cycle 5 close) are the texts of record; a Cycle 6
    award seeds byte-identically through the registrar with each origin's receipt binding, keyed by (origin award, entry, digest);
    the first-interior entry 14 `C5LA1.crossingIndex` (`378868ab…`) is carried, never ported; the registrar accepts an instance only as
    a `def` entry and refuses an entry after the terminal theorem (a terminal theorem may be proved by a call to an identically
    stated lemma — recorded on the face); a count bridge over ℕ is stated in GUARDED form (SR-C5-3's lesson: a display correct over ℤ
    with zero extension is wrong in ℕ where it matters).
48. **Working labels are not names; names are exact predicates.** CD-1, CD-2, E1-R, R3, CT-1, R2′, L2, C1, A7, A5, F-3, GK-MONO, E-1,
    E-2, N1–N7, `(L-S)_top`, `(ELIG-top)`, `𝒞_8` are working labels; none may be a key or an alias. A key names the exact object (a single
    tree by its degree pattern and rank; a family by its parameter and the exact range — SR-C5-4 renamed a key that omitted `d ≥ 6`;
    SR-C5-5 renamed one whose "choke degree" was ambiguous). Registry text names r30 awards by KEY; never "C1-LA1"/"C1-LA2"/"CD-1"/"C5"
    (aliases of other keys), never "favorable-leaf aggregate", "4k" or "deletion injection" (alias patterns of other keys); an
    ALIASES element is a name only (R30-E-i).
49. **Census discipline and literal laboratories.** A census states its order range and covers EVERY tree in it; a "validated on N
    cases" literal is written only when the shipped code runs those cases; every LP/DP certificate is accompanied by a literal
    laboratory on the ACTUAL row (two instruments — the Cycle 5 T2 lesson); the gate-31 lines and two-instrument `S` stand; a
    sector-only argument is never presented as a reduction of (HALL).
50. **Registration and seal timing** (rulings 18, 19, 26, 37, 43) stand: the run-local registry is frozen from the Cycle 6 Stage 2
    seal to the Cycle 6 second-reads packet seal; no seal after a piped check (R30-I-3); the Stage 3 disclosures record is transcribed
    item by item — a process listing mentioned in passing in a hygiene paragraph is an item (R30-N-74) — BEFORE the Stage 4 dispatch;
    controller records describe, never quote, non-durable paths; a path-check record that will be a capsule member is named
    `PATH-CHECK-…` (R30-E-o); a controller fact never asserts what a seat's capsule contains (R30-E-n); a controller record says "of
    record" when the class census is open (R30-N-75).
51. **Clone residue.** Every Cycle 6 protocol and brief was cloned with EVERY 64-hex seal literal replaced by the tool's Stage 2 seal
    placeholder token (patched by the tool after the Stage 2 seal; a protocol quoting a stale seal was errata R30-E-j) and grepped for EVERY earlier cycle token (`c1-`…`c5-`,
    `C1-`…`C5-`, `Cycle 1`…`Cycle 5`, `cycle-1`…`cycle-5`) — R30-E-h, R30-E-j, R30-E-l; each survivor is a historical reference and
    was whitelisted explicitly in `control/C6-CLONE-RESIDUE-WHITELIST.json`; a seat that finds a residue resolves it by the dispatch
    wrapper's path and discloses it.
52. **Terminal-close preparation runs concurrently.** The controller may prepare the additive rebase of r30's keys onto the 457
    master, the publication script and the successor inheritance while Cycle 6 runs; nothing is published, and no master file is
    changed, before the terminal close after the Cycle 6 second reads.
