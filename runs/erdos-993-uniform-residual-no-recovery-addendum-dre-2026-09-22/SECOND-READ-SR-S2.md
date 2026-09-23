# Second Read — SR-S2 (Composition S2, the band's input ledger)

Isolated second reader `SR-S2`, lane C of the r25 ADDENDUM (Erdős #993 uniform residual
no-recovery). Object: **Composition S2** — the input ledger of
`E993-R25-FOURTH-BAND-CLOSE-ALL-R` at the r25 terminal close.

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot
self-inspect its runtime model/effort — stated on dispatch-record authority.

**VerityOS boot.** Operating within VerityOS. Loaded exactly the two files the protocol
enumerates: `/Users/ashtonsperry/VerityOS/verity.md` (root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (identity subsystem, startup
protocol). The startup protocol's own task-type map into `memory/`, `conversations/`,
`modules/`, `skills/`, `logs/` and `decisions/` was **not** followed, as the protocol
directs. No other VerityOS file was read this session.

---

## Identity and seal audit

**Inner seal of the capsule manifest — MATCH.** Recomputing SHA-256 over the canonical
JSON of `control/lane-c/SR-S2-PACKET-MANIFEST.json` with the `seal_sha256` field removed
(`sort_keys=True`, `separators=(",",":")`, UTF-8) gives

```text
declared   8eb6b711364f9c3a577ba5ec00da6da4faaad5fa9ac972614fffd40955afa028
recomputed 8eb6b711364f9c3a577ba5ec00da6da4faaad5fa9ac972614fffd40955afa028
```

`file_count` 55 equals the length of `files` (55). `run_id`
`erdos-993-math-dre-20260922-r25-addendum`; `stage` `lane-c-second-read-SR-S2`;
`schema_version` `verityos.math-dre.packet-manifest.v1`. Generator
`gen_seal_audit.py`, output `seal-audit.json` (digests in `## Artifact inventory`).

**Member digests — 18 of 18 MATCH**, on both SHA-256 and byte count, for every member
this seat opened or hashed:

`control/lane-c/SR-S2-PROTOCOL.md`, `control/lane-c/PATH-CHECK-SR-S2.json`,
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `SOLUTION-CONTRACT-ADDENDUM-1.md`,
`control/A1-STAGE1-GATE.md`, `control/C4-CONTROLLER-ERRATA.json`,
`control/C5-CONTROLLER-ERRATA.json`,
`control/snapshots/CLAIM-IDENTITY.run-local.a1-stage2.json` (360 claims; the run-local
registry of record for this read), `sources/r25-terminal/second-read-inputs/C4-SYNTHESIS.md`,
`…/C5-SYNTHESIS.md`, `…/C5-CYCLE-CLOSE.md`, `sources/r25-terminal/C6-SYNTHESIS.md`,
`sources/r25-terminal/C6-CYCLE-CLOSE.md`, `sources/r25-terminal/C6-LEAN-GATE-CLOSEOUT.md`,
`sources/r25-terminal/C6-ADJUDICATION-U.md`, `sources/r25-terminal/C6-ADJUDICATION-F.md`,
`sources/authority/LEDGER.md`.

`sources/authority/LEDGER.md` was **hashed only** for this audit; its content was not
examined and nothing in this report rests on it. The manifest itself is not one of its
own 55 members (a manifest carries no self-digest); reading it is the protocol's own
instruction, not a boundary exception. `control/lane-c/PATH-CHECK-SR-S2.json` reports
`files_scanned: 53`, `finding_count: 0`.

**Read boundary.** Capsule members only. No r25-root read (this is a documentary read;
the protocol grants no r25 scratch — `SR-S2-PROTOCOL.md` line 69 reads
"none (no scratch grant; this is a documentary read)").
No Cycle A1 material, no `cycles/`, no other experiment root, no network, no
package install, no `find`/`rg`/`ls -R`/recursive listing. Every search was a `grep -n`
naming explicit capsule member files, never a directory or a glob. Writes confined to
`second-reads/SR-S2/` and `scratchpad/lane-c-SR-S2/`. No child agent was delegated. No
background job was started, so none needed killing before the final write.

**Quotation discipline.** Every quotation below was machine-checked **both ways** by
`gen_quote_check.py`: each occurs verbatim in its cited capsule member, at the 1-based
line given, **and** occurs verbatim in this report. 53 of 53 pass in both directions; 0
missing in either. Every number below ships in `gen_ledger_arithmetic.py`.

---

## The eight inputs, traced through Cycles 4, 5 and 6

**Eight is the right count, and the two enumerations agree row for row.** The registered
certificate of `E993-R25-FOURTH-BAND-CLOSE-ALL-R` (snapshot line 35994 — one line, quoted
here in its two end fragments) enumerates

> window reduction; cover half c(5) = 5 (registered, proved_informal); matching half

> exhaustive r <= 5 (0 / 585 / 7,469 class members, one crossing instance at x = 4 with Delta_5 = -235)

That enumeration is the Cycle 4 synthesis's Composition B table (`C4-SYNTHESIS.md` lines
638–647), item for item, in the same order. Its row 1 (line 640) and its row 8's grade
(line 647) read:

> Window reduction: `c(5) = 5` and `m(5) = 7` leave the window `{6}`, so only `ν = τ = 6` needs work

> bounded computation, **exhaustive at a fixed order, therefore mathematically settling those cells**

The composition's own registry face calls it an eight-input composition; so does the band
claim's face at snapshot line 35284, so does the F adjudicator (`C6-ADJUDICATION-F.md`
line 1687), and so does R4 (`C6-SYNTHESIS.md` line 1681):

> the eight-input composition registered as E993-R25-FOURTH-BAND-CLOSE-ALL-R

> `E993-R25-FOURTH-BAND-CLOSE-ALL-R` composes eight inputs and is graded at its weakest

**Cycle 5 re-partitions the same content into six links; it does not change the list.**
`C5-SYNTHESIS.md` §C bundles and splits, and says so. Its line 363 heads the table:

> **C1. The `d = 5` diagnostic band's closure for every `r`, input by

and its link 5 (line 372) reads

> window reduction; König range `b ≤ 2r−1−a`; Corollary F at `d = 5`; exhaustive `r ≤ 5`

with the annotation "`now subsumed in link 3's derivation`" on the same line. The exact
correspondence:

| Cycle 5 link (C1) | registered input(s) |
|---|---|
| 1 matching half | 3 |
| 2 cover half, algebraic part | 2 (general half) |
| 2b cover half, finite part — "`cover half, finite part: exhaustive closure at exactly **five** cells (`τ = 5`, `r = k+1`, orders 9, 11, 13, 15, 17)`" (line 369) | 2 (finite half) |
| 3 cover-fiber/Hall carry step | 6, and it absorbs 4 |
| 4 arithmetic tail | 7 |
| 5 (bundle) | 1, 4 (also listed here), 5, 8 |

So the Cycle 5 derivation **redistributes** the eight registered inputs into six links by
splitting input 2 and bundling inputs 1, 4, 5, 8. It adds nothing and removes nothing.
What it does change is the grade of input 6, which Cycle 4 had recorded (line 645) as

> `proved_informal`, **carried from the Cycle 3 record and re-derived by no Cycle 4 route**

and Cycle 4's own ruling on the composition's residue (line 649) is unaffected by any of
this and still stands:

> **The exact residue: there is no rank residue.**

Its ruling is that the carried links are gone (line 374, continuing "throughout.**" on
line 375):

> **Ruling: yes — `E993-R25-FOURTH-BAND-CLOSE-ALL-R` now rests on derived inputs

echoed at the Cycle 5 close, "`now rests on derived inputs throughout`"
(`C5-CYCLE-CLOSE.md` line 105).

**Cycle 6 lands two Lean awards, neither of them a ninth input.** `C6-LEAN-GATE-CLOSEOUT.md`
records C6-LA2's registry effect (line 27) and C6-LA5's (line 69):

> the band's SECOND formal input, not a closure

> formally_verified at the five cells (fixed-cell; novelty four cells; cover hypothesis vacuous at 9 and 11; top rank only)

The Cycle 6 synthesis's funding text is explicit that the first is an input of the eight
and the second is not (lines 1022 and 1158–1159):

> an award here gives the band a **SECOND formally verified

> it does **not** discharge

> `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`, because each `cell_n` proves **one** rank

The registered carry step even carries the alias `"Composition B input 6"` (snapshot line
36046); the five-cell award carries no such alias (its aliases are `"tau = 5 small-rank
closure"`, `"U-C5-04"`).

**Arithmetic re-derived here** (`gen_ledger_arithmetic.py`, exact integers, stdlib only):
`c(5) = min(5,5) = 5`, `m(5) = 7`, window `[c+1, m−1] = [6,6] = {6}`; at `τ = 6` and order
`2r+5`, `|B| = 2r−1`. `Γ(5,·) = 1, −3, −10, −16, −18, −14, 18, 183, 902` so `K(5) = 6`,
whence the `τ = 5` small-rank residue is exactly `k = 1..5` at `r = k+1`, i.e. orders
`2r+5 = 9, 11, 13, 15, 17`, **every one of them at the top rank `k = r−1`**. Ranged
`Bd(r,r) = 24, 31, 48, 33, −16, −210` at `r = 2..7` and `−14406` at `r = 10`; ranged
`Bd(r,r) ≥ 0` exactly at `r ∈ {2,3,4,5}` and `< 0` from `r = 6` up; the unranged variant
is `≥ 0` on all of `r ∈ [2,33]`, confirming the registry's phrase at snapshot line 35877
and the load-bearing range:

> the unranged object is >= 0 on r in [2,33]

---

## Grade of each input at the r25 close

Grade words are `SOLUTION-CONTRACT.md` §4's: `formally_verified` only through the
governed workflow; informal exact theorems are `proved_informal`; and, at lines 113–114,

```text
computation is bounded evidence at
its stated finite horizon and never universal proof
```

Every `status` below is quoted from the Stage 2 snapshot.

**Input 1 — window reduction** (`d = 5` window is `{6}`; only `ν = τ = 6` survives).
*Key:* none grades it. The lexically nearest key, at snapshot line 35338,

> "claim_key": "E993-R25-WINDOW-REDUCTION"

has `"status": "OPEN"` and, at line 35343,

> "certificate": "none; OPEN"

and it and is the general, all-`d` reduction over the bare branch —
`SOLUTION-CONTRACT-ADDENDUM-1.md` §A4, line 64:

> `E993-R25-WINDOW-REDUCTION` is stated over the BARE matching branch.

What grades input 1 is the standing ruling two lines above it (line 62):

> The `d = 5` residual window is exactly `{6}` (`c(5) = 5`, `m(5) = 7`)

which the Cycle 4 table grades "unconditional logic given 2 and 3" (line 640).
*Grade:* derived logic, conditional on inputs 2 and 3. *Uniform in `r`:* yes (no `r`
occurs). *Formal:* **no**.

**Input 2 — cover half `c(5) = 5`.** *Key:* `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`
(line 35501), `"status": "VERIFIED"`, evidence grade
`proved_informal_adjudicator_verified_no_formal_award`, `"formal_award": false`; the
scope ends "Not formally verified." Its finite part is now formal at the top rank only;
the same face records, at line 35521:

> the lower ranks k < r-1 remain informal; this claim's grade is unchanged

*Grade:* `proved_informal`. *Uniform in `r`:* yes (`r ≥ 2`). *Formal:* **no** (see the
next section for the sub-part that is).

**Input 3 — matching half** (order `2r+5` with a 7-matching, bare).
*Key:* `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN` (line 35417), status `VERIFIED`,
evidence grade `formally_verified_lean_kernel_plus_independent_fidelity`,
`"formal_award": true`. *Grade:* `formally_verified` (Cycle 1 award C1-LA1).
*Uniform in `r`:* yes (`r ≥ 1`). *Formal:* **yes**.

**Input 4 — König range `b ≤ 2r−1−a` inside `Bd`.** *Key:* none of its own; the Cycle 4
table attributes it to C-F2-T and C-F2-U, F-adjudicator-verified (line 643), and Cycle 5
records it "`now subsumed in link 3's derivation`" (line 372). Its content is load-bearing
inside input 6's formal statement — `E993-R25-BAND-CARRY-STEP-HALL`'s certificate, line
36043, says

> RANGED Bd with range b <= 2r-1-a load-bearing

— and it is load-bearing again inside input 7's informal object.
*Grade:* `proved_informal` as a standalone link. *Uniform in `r`:* yes (the range is a
function of `r`). *Formal:* **no** as an input in its own right.

**Input 5 — Corollary F at `d = 5`** (`x < r ⟹ x = r−1` exactly).
*Key:* `E993-R25-STRATUM-DEPTH-COROLLARY-F` (line 35562), `"status": "VERIFIED"`,
certificate opening with the grade word `proved_informal`. The
`d = 5` census half was deleted in Cycle 4, but the scope (line 35564) carries two named
unproved horizons:

> Two horizons ride on the sharpness and are on the face: (a) the degree cap — the sweep enumerates profiles with d_c <= 6 while the edge budget permits about 2r+11; stability attained at Dmax = 10, not proved; the provable cap is 2r-2k+2 (= 6 at k = r-2); (b) the r > 600 per-fiber tail carried on E993-R25-CATALAN-DOMINANCE-RANK-R-MINUS-2.

*Grade:* `proved_informal`, with horizons on the face. *Uniform in `r`:* yes, over
`2r−1 ≥ τ = 6` (so `r ≥ 4`; at `r ≤ 3` input 8 empties the class). *Formal:* **no**.

**Input 6 — cover-fiber/Hall carry step** `Δ_k − Δ_{k−1} ≤ Bd(r,k)` on the `ν = τ = 6`
class. *Key:* `E993-R25-BAND-CARRY-STEP-HALL` (line 36038), `"status": "VERIFIED"`,
certificate opening with the grade word `formally_verified` and naming award C6-LA2;
scope (line 36040) ends:

> The graph-theoretic carry step of the d = 5 band's closure, now DERIVED (it was carried from the Cycle 3 record in Cycle 4).

The same scope says "No horizon." *Grade:* `formally_verified` (Cycle 6 award C6-LA2).
*Uniform in `r`:* yes (`r ≥ 4` derived inside the proof). *Formal:* **yes**.

**Input 7 — arithmetic tail** `Bd(r,r) < 0` for every `r ≥ 6`.
*Key:* `E993-R25-BD-TAIL-NEGATIVE` (line 35875), `"status": "VERIFIED"`, certificate
opening with the grade word `proved_informal`; Cycle 4 graded it
"`proved_informal`, no horizon" (line 646). The Cycle 6 note on the face (line 35892)
reads:

> The top-level statement for every r >= 6 was NOT funded at the terminal close

Grade unchanged. *Grade:* `proved_informal`. *Uniform in `r`:* yes (`r ≥ 6`), with the
`r ∈ [6,14]` layer as exact evaluations and `r ≥ 15` a theorem. *Formal:* **no**.

**Input 8 — exhaustive `r ≤ 5`** (class empty at `r ≤ 3`; `585` and `7,469` members at
`r = 4, 5`; one crossing instance at `x = 4` with `Δ_5 = −235`).
*Key:* none of its own; it sits inside the composition's own certificate (line 35994) and
inside the historical predecessor `E993-R25-FOURTH-BAND-CLOSE-R-LE-260`. *Grade:*
bounded computation — and, uniquely among bounded computations, settling, because the
Cycle 4 table grades it (line 647):

> bounded computation, **exhaustive at a fixed order, therefore mathematically settling those cells**

*Uniform in `r`:* **no** — fixed cells `r ≤ 5`. *Formal:* **no**.

---

## The formal count and the weakest link

**The five-cell award is an input OF input 2, not a ninth input and not an input in its
own right.** `E993-R25-CARD5-JOINT-BUDGET-CELLS` formalises the **finite part of the
cover half `c(5) = 5`** — Cycle 5's link 2b (`C5-SYNTHESIS.md` line 369) —

> cover half, finite part: exhaustive closure at exactly **five** cells (`τ = 5`, `r = k+1`, orders 9, 11, 13, 15, 17)

and it formalises it at the top rank only. Three independent faces say so. The award's own
scope (snapshot line 36189):

> FIXED-CELL (one (r,k,order) triple each, top rank k = r-1 only)

The funding text (`C6-SYNTHESIS.md` lines 1158–1159) and Composition S1's own caveat
(line 1676, the second line carrying the source's blockquote marker):

```text
it does **not** discharge
`E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`, because each `cell_n` proves **one** rank
```

```text
**the Lean side discharges only the top rank
> `k = r−1` at each cell**
```

And the U adjudicator (`C6-ADJUDICATION-U.md` lines 1320–1321):

```text
no Lean
object in this run discharges the lower ranks
```

**Therefore "three formally verified inputs" is corrected to two, with the third formal
award named as a part.** Against the eight registered inputs, exactly **two** are
`formally_verified` at the r25 terminal close: input 3 (matching half) and input 6 (carry
step). The third formal object, `E993-R25-CARD5-JOINT-BUDGET-CELLS`, sits **inside**
input 2 and leaves input 2 at `proved_informal`, because input 2's general/algebraic half
is informal and, at the five cells, only `k = r−1` is kernel-checked.

This is not a quarrel with R4 so much as a repair of its arithmetic, and the Cycle 6
synthesis itself already states the careful version two places earlier, at lines
1319–1320:

> with one formally verified input entering this cycle

> and a second (and, with dispatch 5, the finite part) contract-ready at this close.

There the carry step is *a second input* and the five-cell result is *the finite part*,
not a third input. The loose count appears in exactly two places and both must carry the
repair — R4 itself (`C6-SYNTHESIS.md` line 1683 and the sentence following it) and the
Cycle 6 cycle-close's summary line (`C6-CYCLE-CLOSE.md` line 107):

> verified. At this close the **carry step** and the **five-cell finite part** are

> at its weakest link with three formal inputs (Composition S2, stated not

Gate ruling 1's baseline is unaffected — `C6-SYNTHESIS.md` line 144 reads

> gate ruling 1 records exactly one formally verified link entering

which is about the count *entering* Cycle 6, and it is right.

**The weakest link.** The grade `proved_informal` is set jointly by the three informal
inputs R4 names — input 2's general half, input 5, input 7 — and R4's reason is correct
and is confirmed. Asked for the single weakest, I name **input 5, Corollary F at
`d = 5`**: it is the only one of the eight whose registry face carries *named, unproved
horizons* (the `Dmax = 10` degree-cap stability "not proved", and the `r > 600` per-fiber
tail), whereas input 6's face says "No horizon", input 7 is graded "no horizon"
(`C4-SYNTHESIS.md` line 646) and Cycle 5 graded input 2's algebraic part
"**`proved_informal`, no horizon**" (`C5-SYNTHESIS.md` line 368). I record one honest
limit: the registry attaches those two horizons to the sharpness of the `d ≤ 11` ceiling,
and whether horizon (b) also bears on the `d = 5` instance is **not decidable inside this
capsule**. The ledger must therefore carry the registry's words for input 5 and must not
assert horizon-freedom for it.

**The grade is confirmed.** `E993-R25-FOURTH-BAND-CLOSE-ALL-R` is `VERIFIED` at
`proved_informal`, fixed-band `d = 5`, every `r`, graded at its weakest link. The
F adjudicator's fence holds verbatim (`C6-ADJUDICATION-F.md` line 1693):

> Corollary F at `d = 5` and the five-cell finite part are all

---

## Consistency with the registered scope

**The carried-links sentence is superseded — confirmed, and it sits on two faces, not
one.** The composition's scope (snapshot line 35991) still reads

> TWO LINKS CARRIED FROM THE RECORD WITHOUT A CYCLE 4 RE-DERIVATION

It is superseded by the Cycle 5 derivation, on the run's own authority in four places:
the Cycle 5 ruling (`C5-SYNTHESIS.md` line 374), the Cycle 5 close
(`C5-CYCLE-CLOSE.md` line 105), the carry step's registered scope (snapshot line 36040,
"now DERIVED (it was carried from the Cycle 3 record in Cycle 4)") and the cover half's
registered scope at snapshot line 35503:

> The general half's algebra is now DERIVED

The protocol reports that r25 Cycle 6 gate ruling 1 rules it superseded; the gate document itself
(`control/C6-STAGE1-GATE.md` in the r25 root) is **not** a member of this capsule, so I
confirm the supersession on the four sources above and record the gate citation as
unverified-in-capsule rather than asserting it.

**Repair the protocol did not name.** The identical sentence appears a second time, on
the band claim `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`. Its `scope_r25_note`
(snapshot line 35282) says

> its two un-re-derived carries (the cover-fiber/Hall bound into Bd; the general half of c(5) = 5)

and its certificate (line 35284) says

> with two inputs carried from the Cycle 3 record without a Cycle 4 re-derivation

A repair applied only to
`E993-R25-FOURTH-BAND-CLOSE-ALL-R` leaves the superseded wording standing on the band's
own face. **Both faces must take the replacement.**

**Second alias/status hazard.** A ledger row that names `E993-R25-WINDOW-REDUCTION` as
input 1's key would put an `OPEN` claim (`"certificate": "none; OPEN"`) in the grading
column of a `VERIFIED` composition. Input 1 is not that key's `d = 5` instance being
cited as established; it is unconditional logic from inputs 2 and 3 plus the standing
ruling of `SOLUTION-CONTRACT-ADDENDUM-1.md` §A4. The row must say so in terms.

**No other inconsistency found.** Statement, status, fixed-band naming, the
supersession of `E993-R25-FOURTH-BAND-CLOSE-R-LE-260` (kept as the historical record),
the "Not awarded" sentence and the Tier 1 consequence sentence are all consistent with
the Cycle 4, 5 and 6 records. The only stale word in the composition's scope besides the
carried-links sentence is its final clause, snapshot line 35991:

> Not awarded (no input beyond the matching half is formalised).

The Cycle 6 awards falsify it; it is repaired below.

---

## Verdict and the exact scope note

verdict: confirmed_with_repairs

Confirmed: the count of **eight**; the identity of all eight inputs; the grade
`proved_informal` at the weakest link; that the two Cycle 6 awards landed
`formally_verified`; that a count of formal inputs is not a grade. Repaired: **three → two**
formally verified inputs of the eight, with the third formal award named as the finite part
of input 2 at top rank only; the superseded carried-links sentence, on **both** registry
faces; the stale "no input beyond the matching half is formalised" clause; and the
`E993-R25-WINDOW-REDUCTION` status hazard on input 1's row.

**(a) Exact replacement for the superseded scope sentence** (replaces "TWO LINKS CARRIED
FROM THE RECORD WITHOUT A CYCLE 4 RE-DERIVATION: … and the general half of c(5) = 5." and
the clause "Not awarded (no input beyond the matching half is formalised).", on
`E993-R25-FOURTH-BAND-CLOSE-ALL-R` and, mutatis mutandis, on
`E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`):

> NO INPUT IS CARRIED WITHOUT A DERIVATION. The two links carried in Cycle 4 were derived
> in Cycle 5: the cover-fiber/Hall carry step (seat F3; stress-tested by C-F3-T, C-F3-U
> and the F adjudicator), now also formally verified as E993-R25-BAND-CARRY-STEP-HALL
> (Cycle 6 award C6-LA2); and the general half of c(5) = 5, derived from
> E993-R25-BAND-CARRY-STEP-HALL and E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING and
> still proved_informal. Two of the eight inputs are formally verified at the r25
> terminal close — the matching half and the carry step. A third formal award,
> E993-R25-CARD5-JOINT-BUDGET-CELLS (C6-LA5), discharges the FINITE PART of the cover
> half at the top rank k = r-1 of its five cells (orders 9, 11, 13, 15, 17) and does NOT
> raise that input: the general half and the ranks k < r-1 remain informal. Grade
> unchanged: proved_informal at the weakest link.

**(b) The exact ledger scope note** — a scope note only, recording the eight inputs with
their keys and grades at the r25 close:

> LEDGER OF INPUTS AT THE r25 TERMINAL CLOSE (scope note; no status change). The band's
> status is VERIFIED at proved_informal, fixed-band d = 5, every r, graded at its weakest
> link, and stays so.
>
> | # | input | registry key | grade at the r25 close | formal |
> |---|---|---|---|---|
> | 1 | Window reduction: c(5) = 5 and m(5) = 7 leave the window {6}, so only nu = tau = 6 needs work | none; the general all-d key E993-R25-WINDOW-REDUCTION is OPEN (certificate "none; OPEN") and does NOT grade this input | unconditional logic given inputs 2 and 3; standing ruling SOLUTION-CONTRACT-ADDENDUM-1 A4 | no |
> | 2 | Cover half c(5) = 5: forests of order 2r+5 with tau <= 5 have Delta_k > 0 for every k < r | E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST | proved_informal (scope: "Not formally verified"); general half derived in Cycle 5; finite part formally verified at top rank k = r-1 only, as E993-R25-CARD5-JOINT-BUDGET-CELLS; ranks k < r-1 informal | no |
> | 3 | Matching half: order 2r+5 with a 7-matching, bare | E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN | formally_verified (Cycle 1 award C1-LA1) | yes |
> | 4 | Koenig range b <= 2r-1-a inside Bd | none; critic-attributed C-F2-T, C-F2-U; since Cycle 5 subsumed in input 6's derivation and load-bearing inside its formal statement | proved_informal as a standalone link | no |
> | 5 | Corollary F at d = 5 (x < r implies x = r-1 exactly) | E993-R25-STRATUM-DEPTH-COROLLARY-F, d = 5 instance | proved_informal; the d = 5 census half deleted in Cycle 4; two named horizons on the claim's face (Dmax = 10 degree-cap stability, not proved; the r > 600 per-fiber tail) | no |
> | 6 | Cover-fiber/Hall carry step Delta_k - Delta_{k-1} <= Bd(r,k) on the nu = tau = 6 class | E993-R25-BAND-CARRY-STEP-HALL (alias "Composition B input 6") | formally_verified (Cycle 6 award C6-LA2); no horizon | yes |
> | 7 | Arithmetic tail Bd(r,r) < 0 for every r >= 6, ranged Bd | E993-R25-BD-TAIL-NEGATIVE | proved_informal, no horizon; top-level statement NOT funded at the terminal close | no |
> | 8 | Exhaustive r <= 5: class empty at r <= 3; 585 and 7,469 members at r = 4, 5; one crossing instance at x = 4 with Delta_5 = -235 | none; inside this composition's certificate and inside E993-R25-FOURTH-BAND-CLOSE-R-LE-260 | bounded computation, exhaustive at a fixed order, therefore mathematically settling those cells | no |
>
> Uniform in r: inputs 1-7 yes (input 1 vacuously; input 5 over 2r-1 >= 6; input 6 with
> r >= 4 derived inside the proof; input 7 for r >= 6). Input 8 is NOT uniform in r: it
> is the fixed cells r <= 5.
>
> Formal count: TWO of the eight inputs are formally verified (3 and 6). A third formal
> award, E993-R25-CARD5-JOINT-BUDGET-CELLS, is an input OF input 2 (its finite part, top
> rank only) and is not an input of the composition in its own right. A COUNT OF FORMAL
> INPUTS IS NOT A GRADE, and the publication packet must not present it as one.
>
> Weakest link: the grade is set jointly by inputs 2 (general half), 5 and 7; input 5 is
> the only one of the eight carrying named unproved horizons on its registry face.

---

## What it is not

* **Not a status change and not a grade change.** `E993-R25-FOURTH-BAND-CLOSE-ALL-R` and
  `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` stay VERIFIED at `proved_informal`,
  fixed-band `d = 5`. Nothing here moves a status in either direction.
* **Not an award, and not a registration.** This seat registers nothing. The controller
  registers, and registers only what this read confirms, at the grade it confirms,
  additively, in the `E993-R25-…` namespace. r25 is terminal; nothing written here
  changes an r25 record.
* **A count of formal inputs is not a grade.** Two of eight formal is not "closer to
  formally verified"; the composition is graded at its weakest link and that link is
  informal. R4's own closing sentence (`C6-SYNTHESIS.md` line 1687) governs the ledger:

> is not a grade, and the publication packet must not present it as one.**

* **Not a registration of Composition S2 itself**, nor of Composition S1, nor of Lemma
  H's uniqueness half, nor of the `τ ≤ 5` residue count with `s*(τ)`. Those remain stated
  and not registered.
* **Not a closure and not a transfer.** No status moves to Tier 1, Tier 2, Tier 3a/3b,
  `FOREST`, `TREE`, `TRANSFER`, `E993-BETA-AGG` or Erdős #993; the band closes no tier and
  explains no uniform mechanism. Tier 1's remaining region is the excesses `d ≥ 6`,
  restated and not proved.
* **Not a statement about the frozen master registry.** The read of record is the
  run-local Stage 2 snapshot (360 claims). The master's own state is outside this read.
* **Not a census.** No population was enumerated; the shipped arithmetic is closed-form
  and exact.

---

## Artifact inventory

All under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22/`.
Generators are standard-library only (`hashlib`, `json`, `os`, `math`), exact-integer,
with no wall-clock, PID or host field in any hashed output.

| artifact | SHA-256 | what it establishes |
|---|---|---|
| `scratchpad/lane-c-SR-S2/gen_seal_audit.py` | `20fbb08b07ccbfeacc85d401a2b1673013c6f124fc92c95f76f2ba65c3b28c03` | capsule inner seal by canonical-JSON recomputation; per-member SHA-256 and byte count for all 18 members read |
| `scratchpad/lane-c-SR-S2/seal-audit.json` | `58694d66513dac22fb6825eafd0092ca58ecce49c3c50861a28107b48eae990c` | seal MATCH; 55/55 entries; 18/18 member digests and byte counts MATCH |
| `scratchpad/lane-c-SR-S2/gen_ledger_arithmetic.py` | `94afe0b49886c69f120e9267fd46c42983b9f937af06227a70bd03f4e257d05e` | window `{6}`; `Γ(5,·)`, `K(5) = 6`, the five cells and their top ranks; ranged and unranged `Bd`; the ledger's input counts |
| `scratchpad/lane-c-SR-S2/ledger-arithmetic.json` | `a56027b824544ae7d0bd9d2aa364b7b6e66ceb1d34d84e1d082b97ef05a63ae0` | every number quoted in this report |
| `scratchpad/lane-c-SR-S2/gen_quote_check.py` | `4400ad902c96ccfae0a64a2c954fef19b424112a12fe63060dc1d0c596e02ddd` | two-way verbatim-occurrence and line check for every quotation (source member and this report) |
| `scratchpad/lane-c-SR-S2/quote-check.json` | `e681a6179063a8abf93cc4dd24277b29730e215c6be97c072058436154bc5678` | 53/53 found in source and 53/53 found in this report, 0 missing either way, with 1-based source lines |
| `second-reads/SR-S2/SECOND-READ.md` | this file | the record |

**Replay.** `python3 scratchpad/lane-c-SR-S2/gen_seal_audit.py`,
`python3 scratchpad/lane-c-SR-S2/gen_ledger_arithmetic.py`,
`python3 scratchpad/lane-c-SR-S2/gen_quote_check.py`, each from the run root.

**Disclosures.** (i) Boot reads were exactly `verity.md` and
`identity/startup-protocol.md`; no other VerityOS file was read. (ii) No read outside the
sealed capsule; no r25-root read; no `cycles/` or `scratchpad/a1-*` read; no network, no
package install, no recursive listing; every `grep` named explicit capsule member files.
(iii) `sources/authority/LEDGER.md` was hashed for the seal audit and not read. (iv) The
capsule manifest is not one of its own members; reading it is the protocol's instruction.
(v) r25 Cycle 6 gate ruling 1's text on the supersession is **not** in this capsule
(`control/C6-STAGE1-GATE.md` lives in the r25 root); the supersession is confirmed on
four in-capsule sources instead and the gate citation is carried as unverified-in-capsule.
(vi) Whether Corollary F's `r > 600` horizon bears on the `d = 5` instance or only on the
`d ≤ 11` sharpness is not decidable inside this capsule; the ledger carries the registry's
words unchanged. (vii) No child agent was delegated; no background job was started; this
file was re-read before close.

headline_resolved: no
