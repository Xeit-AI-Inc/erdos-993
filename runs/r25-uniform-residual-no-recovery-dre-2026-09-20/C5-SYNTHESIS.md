# Cycle 5 Neutral Synthesis

Run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery` (r25), Cycle 5,
Stage 6. Neutral synthesis seat; isolated. Child delegation forbidden and none
used (no `Agent`/Task tool was invoked at any point). No network, no package
installs; Python standard library only, exact integers throughout. No Lean
project was built by this seat and no `lake`, `lake clean`, `lake update` or
`elan` was invoked; the shared Mathlib packages tree is write-protected by
design and was not touched. Every computation ran in the foreground; no
background job of this seat existed at any point, and none was alive at this
write. Scratch only under the absolute path `<run root>/scratchpad/S-C5/`; never
the system temporary root, `mktemp` or `TMPDIR`. The only file written outside
that directory is this one.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted by reading
the root constitution `verity.md` and then `identity/startup-protocol.md`. Per
the startup protocol's task-type map ("Controlled optimization or
benchmark-driven improvement → load `experiments/`"), the subsystem loaded is
`experiments/` and, inside it, only this run root, through the sealed Cycle 5
Stage 6 dispatch capsule and run-root authority. No other VerityOS-root
subsystem (`writing/`, `operations/`, `logs/`, `inbox/`, `decisions/`, `memory/`,
`knowledge/`, `projects/`) was loaded; the run's sealed read/write boundary is
the more specific authority. This synthesis is an experiment artifact and
proposes no durable VerityOS record; no `conversations/` record is written by
this seat.

**Model disclosure.** chartered opus/high; transport-resolved model opus
(explicit parameter); the seat cannot self-inspect its runtime model/effort —
stated on dispatch-record authority.

---

## Identity and seal audit

Canonical rule used throughout, by my own instrument
(`scratchpad/S-C5/verify_seals.py`): SHA-256 of the compact key-sorted JSON of
the manifest payload with `seal_sha256` removed, UTF-8,
`separators=(",",":")`, no trailing newline. Every member re-verified on
**SHA-256 and byte count**.

| object | recomputed seal | declared / dispatched | members |
|---|---|---|---|
| **Stage 6 dispatch capsule** `control/C5-STAGE6-DISPATCH-MANIFEST.json` | **`00fabec197871333b961037f6a339bd0f5d8770bdabaabd32e92f84a0a40f992`** | **MATCH** (manifest field and dispatch value) | **21/21 verified, 0 mismatches, 0 missing**; declared `file_count` 21 = observed |
| Stage 5 packet `control/C5-STAGE5-PACKET-MANIFEST.json` | `55c27844a1580d45716c0f6c10132e1fb42383909580181d94a5f54c82825a1d` | **MATCH** | 14/14, 0 mismatches |
| Composition C capsule `control/c5-second-read/COMPOSITION-C-PACKET-MANIFEST.json` | `e0c6015518839f8f1313ca2ac45b7956f5b3c3aa42232ff0d06bfd3dff4d3693` | **MATCH** (manifest field and the value in `control/C5-STAGE6-CONTROLLER-FACTS.json`) | 11/11, 0 mismatches |

**Dispatch seal reported, as duty 1 requires:
`00fabec197871333b961037f6a339bd0f5d8770bdabaabd32e92f84a0a40f992`.** The three
admitted adjudications, the three Stage 5 controller-facts records, the Stage 6
controller-facts record, the second-read protocol, the Composition C capsule
manifest and the second-read report all hash exactly to their capsule entries, so
every artifact I rule on is byte-identical to what its seat wrote. The
second-read report's digest `4ffa57d404bfb32b65ecd2603a2f9a8fac57d05fa5fc7bec8019a31d8182052d`
is carried both by the capsule and by the controller-facts record and matches on
disk.

**Earlier chain.** Stage 4 `7796c1dca2ace487b0b3f8d4b2131e4143c5c570261fa515ba1fa1768a1edcdf`,
Stage 3 `c78af0d5534f0bd0c8a80f0deb51efbf42b4e6a05749db959162781b62b553bc`,
Stage 2 `e868288e0047edd5a6205d251ede7b427fb919b2e4d2787effb775d7b1c98f27`. Those
three manifests are **not members of my capsule**, so I did not recompute them:
all three adjudicators recomputed the Stage 4 packet seal independently and each
reports **MATCH with 39/39 member digests**, and the U adjudicator additionally
recomputed the Stage 4 dispatch seal
`d65db8a806bc76c4f876c9579c174c26b0dc94107ec5e8c9ea944f8cc7371922` and the
Stage 3 and Stage 2 packet seals, each matching. The T adjudicator records that
`control/C5-STAGE3-ADMISSION.json` carries `source_seal = e868288e…` and admits
12 of 12 returns with zero findings. **These are their findings, recorded as
such, not mine.**

**Orientation capsule seals, as reported by their own seats** (not members of my
capsule; recorded, not re-derived): T `d5812f29a26ca0298dfadd8961cf0864a70b28fb18f7ffe06c4916930481aa17`
(24/24), F `253cf5b2a0b4a83d5620656dd511035cd30c8700d48c5b0e84a36e2402beb373`
(24/24), U `ced32b1f1a4068b70e3a60f7be8eefa3c3065c05ab4054163264410004e88fa7`
(24/24).

**Path check.** `control/PATH-CHECK-c5-stage6-dispatch.json` (a capsule member):
20 files scanned, 0 files with findings, 0 findings.

**Registry.** `control/CLAIM-IDENTITY.run-local.json` holds **327 claims, 327
distinct keys** (my own count), as all three adjudicators state. The master
registry is unchanged at 288 and every `E993-R25-…` claim is **run-local**;
"VERIFIED in both registries" is false for all of them. Alias check for the
eighteen keys proposed below (lexical, plus mathematical probes by statement,
scope and certificate text over all 327 claims): **every proposed key is free and
no registered claim states any of the proposed assertions.** The probes
`carry step`, `k^2+k+3`, `thin tree`, `descFactorial`, `scalar core`, `2p-1`,
`step-sign`, `42 - 14d`, `1,612,675` return zero hits; `Hunter` and
`spanning-tree` hit only `E993-R25-KADDITION-CLOSURE-X-LE-4`, the very claim
whose dependency is discharged; `2p+1` hits only
`E993-C3-G1-NECESSARY-COUNTEREXAMPLE-REGION`, which places a lower edge on
counterexamples and is a different assertion.

**Read boundary observed.** The capsule's 21 members and nothing else from the
cycle record; plus run-root authority (`SOLUTION-CONTRACT.md`,
`SOLUTION-CONTRACT-ADDENDUM-1.md`, `SEMANTIC-CONTRACT.md`, `sources/` as needed,
and the run-local registry `control/CLAIM-IDENTITY.run-local.json` for registered
statements). I read **no** raw return, **no** critique, **no** seat or critic
scratch, **no** prior-cycle synthesis, adjudication or return, **no** other
experiment root and **no** external source. Provenance was located by `Read` on
permitted files and by a Python read of the registry restricted to the run root;
no repository-wide search was run. No literal filesystem path outside this run
root appears anywhere in this document.

**Controller facts received and applied.** Cycle 6 is the charter's **last**
cycle; the chartered controller review follows its close; **Ashton has
pre-authorized publication of r25 results at the terminal close**, scoped:
formally verified awards named as such, informal results carrying their grade and
attribution on their face, the vendored paper excluded. Seating: all twelve route
seats Sonnet 5 (xhigh in-prompt); critics, adjudicators, second readers and this
seat Opus 5 (high). The HTTP 529 transport incident interrupted eight wave-1
critics, who resumed on their own transcripts and completed — **nothing is graded
against any critic for it**, and I find no evidentiary effect anywhere in the
three adjudications. All seven controller errata are ruled on below, each
explicitly. This cycle's advances are again predominantly critic- and
adjudicator-derived, and every result below carries its attribution.

---

## Reconciliation

The three adjudications are reconciled claim by claim. **No verdict below is
reached by majority vote**, and no disagreement is resolved by consulting a lower
tier: where two adjudicators differ I decide on the record each of them actually
verified, and I say which. All three report `headline_resolved: no`,
`status: still_open`, `material_progress: yes`, `orientation_plateau: no`; all
twelve returns and all 24 critiques reported `headline_resolved: no` and every
critique was `retained_narrowed`.

### A. Agreements that compose (no adjudicator could state them alone)

**A1. The `d = 5` band's four links.** F rules on the graph-theoretic carry step
and the cover half; U rules on the arithmetic tail; each says explicitly that the
other's object is not its own. They compose without conflict (§ *Exact
established results*, C1).

**A2. The `τ = 5` cell minima — a three-way agreement across two orientations.**
F's exhaustive enumeration over every forest class of orders 9–17 with `τ ≤ 5`
gives `min Δ_{r−1} = 39, 56, 56, 43` at orders 11, 13, 15, 17; U records
C-U4-T's independent isomorphism-class census (710 / 3,073 / 10,648 / 29,915
classes) with **the same four minima**, and C-U4-F's labelled-cover census
(5,877,025 and 13,258,141 configurations) with the same `+56`, `+43` at orders
15 and 17. Three instruments, two orientations, identical figures.

**A3. An apparent numeric conflict that is not one.** F reports `min Δ₃ = 56` at
order 13; U reports `min Δ₃(13) = +45`, as does the registry's `cycle4_note`.
**Both are right and the populations differ**: `+45` is the minimum over **all
3,658 forests of order 13**; `+56` is the minimum over the **`τ ≤ 5` subclass**
(3,073 classes). At order 11 the two coincide (`39`) because every forest of
order 11 has `τ = ν ≤ 5` automatically. At order 9 both give `19`. **Ruling: no
divergence; quote each figure with its population, never bare.**

**A4. `K(1..7) = 0, 2, 3, 4, 6, 12, 70`** (the Catalan-gap thresholds) is
recomputed independently by the F adjudicator, the U adjudicator and, at
`τ = 3`, by the T adjudicator. Agreed, and it is the sufficiency half of a
**formally verified** award.

**A5. Zero recovering forests** anywhere, in any orientation, at any order or
rank examined this cycle — F4's census of 862,327 + 1,300,744 + 551 + 1,301 +
134 thin classes, the ten-guard census of 265,749 tuples, every forest sweep. A
null closes nothing and is recorded as a null.

### B. Disagreements, resolved

**B1. `E993-R25-FOREST-DELTA2-POS-ORDER-9` — the one substantive disagreement
between two adjudicators.** T (E6) rules the registered OPEN claim proved by
C-T4-F, verifies the proof by hand (`i₃ = C(n,3) − |E|(n−2) + Σ_v C(d_v,2)` with
`|E| ≤ n−1`, giving `Δ₂ ≥ (n−1)(n−2)(n−9)/6`, equality impossible in a forest)
and **recommends the controller register the closure**. U rules it **stays
OPEN**, on the ground that "its status turns on the governed gate", while
recording two further independent in-run derivations.

**Ruling: for T, with U's caution carried on the claim's face.** The decisive
point is registry practice, which I read myself: `status: VERIFIED` in this
registry does **not** mean formally verified — `E993-R25-BD-TAIL-NEGATIVE`,
`E993-R25-CLAMPED-GREEDY-OPTIMALITY` and `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`
are all `VERIFIED` with `formal_award: false` and an informal grade, the last
explicitly `proved_informal_adjudicator_verified_no_formal_award`. `SOLUTION-CONTRACT.md`
§4 reserves `formally_verified` for the governed workflow and grades informal
exact theorems `proved_informal`. The claim has an elementary proof verified by
hand by the T adjudicator and two further in-run derivations recorded by the U
adjudicator. **It moves OPEN → VERIFIED at `proved_informal`, `formal_award:
false`, with U's sentence written into its scope: the compiled U3 fragment is
not a governed award and does not raise the grade.** U's substantive point — that
a kernel-checked fragment is not an award — is upheld in full; only its reading
of the `status` field is set aside.

**B2. The five-`τ = 5`-cells erratum (controller erratum b) — two different
"vacuous"s.** F verifies exhaustively that **no forest class of order 9 has
`τ = 5`** and calls the order-9 cell vacuous. U rules that the `cycle4_note`'s
"vacuous" label belongs to **`(3,2,11)`** and that the order-9 cell `(2,1,9)` is
discharged by frozen ENTRY 175, adding that orders 11 and 13 are **also true
cover-free** (`min Δ₂(11) = 39`, `min Δ₃(13) = +45`), so only orders 15 and 17
are cover-essential.

**Ruling: both are right on their own literal, and the controller's
reconciliation "five cells, of which one is vacuous" is ambiguous between them
and must be replaced.** The exact statement of record:

> The scope's **five** cells (`τ = 5`, `r = k+1`, orders 9, 11, 13, 15, 17) are
> correct and the four-cell framing omits order 9. At **orders 9 and 11 the
> hypothesis `τ ≤ 5` is no restriction at all** (`τ = ν ≤ ⌊n/2⌋ ≤ 5`), and the
> order-9 cell is additionally discharged outright by frozen ENTRY 175
> (`forest_delta_one_pos`) and has an empty `τ = 5` class (F, exhaustive; U,
> `min Δ₁ = 19` over all 153 order-9 forests). **Order 13 is true cover-free**
> (`min Δ₃ = +45` over all 3,658 forests of order 13). **Only orders 15 and 17
> are cover-essential** (`P_15`: `τ = 7`, `Δ₄ = −33`; `P_17`: `τ = 8`,
> `Δ₅ = −363`).

**B3. Materiality of an arithmetic core under check 6 — an apparent conflict of
standard.** F refuses extended Corollary F's **arithmetic spine** (nodes
1a + 1b + 2(ℤ) + 7) as an award: "check 6 excludes repackaged identities, and
that is what the spine is". U funds the **positivity lemma's scalar core** as
its rank-1 award candidate: "a uniform inequality over a region that is a proved
two-sided characterisation of the discriminant's sign, not a repackaged identity".

**Ruling: both sustained on their own objects, by an explicit distinction I
adopt and record.** F's spine is a chain of **identities and extremal values of
standard binomial and Catalan functions** (a Pascal recursion; the minimum of a
binomial difference; an empty-fiber Catalan identity) — each true, each
essentially a repackaging, none an inequality with its own hypothesis region.
U's core is a **single uniform inequality** `(P)` whose hypothesis region
`3d ≤ 2m+2` is itself a **proved two-sided characterisation** of the sign of an
explicitly factorised discriminant, holding at every hard index and both
parities with no horizon. **Check-6 materiality distinguishes them: an inequality
uniform over a proved region clears the bar; a chain of identities feeding a
parameterized theorem does not.** Both adjudicators' rulings stand unchanged.

**B4. Where to fund a Lean award at this close.** U ranks four candidates and
says fund rank 1 now, rank 2 "if a slot exists"; F names one candidate and puts
it at Cycle 6; T names one and rules it "not yet Lean-eligible". These are four
different objects, so this is a portfolio question, not a disagreement of fact. I
rule on it under duty 4 (§ *Lean awards*).

**B5. `networkx` (controller erratum d).** F rules F4's import a hygiene breach
of the standard-library rule, not an irreproducibility; the T adjudicator makes a
**new ruling not in its controller facts** that seat **T4 breaches it identically**
(`forest_gen.py`, `d3_band_verify.py`, `verify_witnesses.py`, `run_all.py`), and
charges it the same way, having rebuilt every T4 figure on its own stdlib
instrument. U records F4's as outside its orientation. **Ruling: the controller's
erratum (d) is correct as written — both F4 and T4 — and the T adjudicator's
independent catch is recorded. Hygiene breach, not irreproducibility: nothing was
installed, and every figure reproduced on stdlib instruments (both F4 critics,
both T4 critics and both adjudicators).** T1, T2 and T3 are clean.

**B6. Attribution of the band's carried inputs.** F is explicit that the two
carried links are discharged "on the seat's **algebra** plus the critics' and my
**computation**", and that the seat's own shipped residue closure is **struck**
(wrong rank `Δ_{r−2}` for `Δ_{r−1}`; a generator that omits every forest with an
isolated vertex, 18 %/37 %/49 %/58 % of the `τ = 5` classes at orders 11/13/15/17).
**I adopt that split verbatim and carry it into every registration below.** No
registration may say the finite check is the seat's.

### C. The seven controller errata, ruled on explicitly

- **(a) Corollary F's `d ≤ 11` wording.** **UPHELD.** The `τ = 12` sweep (37 live
  ranks `r = 7..43`, all strictly positive under `Dmax = 6`) was run by both F2
  critics and **re-run by the F adjudicator**; the seat's literal is struck as
  uncertified. With the `τ = 13` refutation this makes `d = 11` a **proved sharp
  ceiling at `k = r−2`**, not a horizon of computation. **Two horizons ride on it
  and must travel on the claim's face**: the degree cap (attained stability at
  `Dmax = 10`, tested `6..10` at `τ = 12, 13`; **not** a proof, and the
  allocation's "provably exact degree cap `2r−2k+2` = 6 at `k = r−2`" is the right
  citation), and the `r > 600` per-fiber tail carried on
  `E993-R25-CATALAN-DOMINANCE-RANK-R-MINUS-2`'s upward closure.
- **(b) Five versus four `τ = 5` cells.** **UPHELD AND REPLACED** by the exact
  wording in B2 above.
- **(c) The attack-brief literal "11 of 12".** **UPHELD.** U counted the shipped
  file itself: 383 lines, 4 definitions, **13 theorems**, 12 of them `sorry`-free,
  one `sorry` at line 381. The correct literal is **12 of 13**, everywhere it is
  carried; the figure is the seat's, not a finding, and both U1 critics have since
  closed the `sorry`.
- **(d) `networkx` in F4 and T4.** **UPHELD**, per B5.
- **(e) T4's alias breach (gate ruling 9).** **UPHELD, and the corrective action
  is exact.** `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` is VERIFIED with the
  statement quoted in § *Exact established results*; at `d = 3` it **is** T4's
  Branch A, **strict** where the return claims weak and **uniform in `r`** where
  the return claims a horizon `r ≤ 24`. I verified by my own registry read that
  the proposed candidate key `E993-R25-D3-LOW-COVER-WEAK-NONDECREASE` **is absent
  from the registry**, so nothing needs withdrawing: **it must simply never be
  registered.** The return's novelty text, its "new, purely in-run mathematical
  gap" and its Remaining-obligation item 1 are struck; the `r ≤ 24` horizon and
  the `τ(F) = 3` residue clause are artefacts of the missed alias and are struck.
  **The chartered deliverable is nonetheless met** (§ *Exact established results*,
  T2). Gate ruling 9 is reaffirmed verbatim for Cycle 6.
- **(f) Population counts (third occurrence of the species).** **UPHELD and
  escalated.** U3's forest "isomorphism class" figures are construction counts
  inflated ×47 to ×1,708 (`14,622 → 153`, `64,865 → 329`, `286,215 → 710`,
  `1,329,765 → 1,601`, `6,248,797 → 3,658`, `3,610 → 76`, `84,315 → 637`), with
  the inflated literals carried into shipped Lean docstrings; F3's residue
  generator omitted every `τ = 5` forest with an isolated vertex and certified
  `Δ_{r−2}` where the cell needs `Δ_{r−1}`. **No mathematical verdict moves in
  either case** — both enumerations are complete on the class they do reach, and
  every minimum was independently re-derived. The species is now recorded in
  Cycles 1, 3, 4 and 5; **a controller erratum of the `C3-CENSUS-ERRATA` kind is
  the right instrument**, and the Cycle 6 brief should require every population
  literal to name its population in the same sentence.
- **(g) `D_unimodal_peak` is a FALSE proposition.** **UPHELD, and this is the
  most dangerous single artifact in the cycle.** U replayed it in its actual
  existential form: **true at exactly 28 of `m = 1..399`, false at 371**, the true
  set being exactly `{1,2} ∪ {C(g,2) : g ≥ 3}`. **It must never be dispatched.**
  The corrected bracket is the **integral** `N(g_c) ≤ 4g_c − 5`, equivalently
  `g_c² + g_c ≤ 2m + 4g_c − 3`; `D` must be typed over **ℤ**; and the charter's
  contract is for `r ≥ 6` while the drafted section states only `15 ≤ r`. The U
  adjudicator also discloses a defect in its **own** instrument on this check
  (`27/372` corrected to `28/371`) and records rather than hides it — a
  disclosure I note approvingly and rely on.

### D. The Composition C second read

`composition_c_verdict: confirmed_with_repairs`, report digest
`4ffa57d404bfb32b65ecd2603a2f9a8fac57d05fa5fc7bec8019a31d8182052d`, capsule seal
`e0c6015518839f8f1313ca2ac45b7956f5b3c3aa42232ff0d06bfd3dff4d3693` (recomputed
by me; 11/11 members). **The report is evidence of the tier of one adjudication's
replay, confined to Composition C, and it is treated as nothing more.** Its five
link verdicts, its two repairs, its census and its two further exact results are
adopted in § *Exact established results* (composition **C2**, and the Tier 2 row
of the duty-3 table) and in § *Lean awards* (registration **R1**). The seat
registers nothing; the ruling is mine.

### E. What no adjudicator claimed, and I do not

No adjudicator claims a uniform-in-`d` mechanism, a Tier 1 or Tier 2 advance, a
verified reduction at schema level, or an exact counterexample to any tier. All
three say so in terms. I find nothing by hand that overturns any of it.

---

## Exact established results

Grades follow `SOLUTION-CONTRACT.md` §4. Every item names what was replayed by
which adjudicator and what was accepted on shipped evidence, and carries its
attribution. **Symbols are defined in § *Cycle 6 route portfolio*, which is the
symbol table of record for the next cycle.**

### Duty-3 verdicts on the named targets

| target | registered key | status | evidence grade | exact residue after Cycle 5 |
|---|---|---|---|---|
| **Tier 1** | `E993-R25-UNR-FOREST-WIDE` | **OPEN** | none (no certificate) | every excess `d ≥ 6`, uniformly in `d`; plus the single band cell `(d,r) = (3,4)` inside the `d = 3` band, which is bounded computation |
| **Tier 2** | `E993-G1WIDE-NO-SIZE-CAP` | **OPEN** | `open_unresolved_no_formal_award` | every residual excess `d' ≥ 6`; plus the single cell `p = 6` (`r = 4`) at `d' = 3`. **Nothing bounds `d'` above** |
| **Tier 3a schema** | `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` | **OPEN** | none (OPEN schema) | the band `d < r < K(d)`, live at `(3,4)` and every `d ≥ 6` |
| **Tier 3b schema** | `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY` | **OPEN** | none (OPEN schema) | the threshold `c(d) = min(d,5)` is an informal theorem; the schema itself is unproved and untouched this cycle |
| **Tier 3c window reduction** | `E993-R25-WINDOW-REDUCTION` | **OPEN** | none | **untouched by every Cycle 5 route**; its value remains the exact width `m(d) − c(d) − 1` |
| **Diagnostic band** | `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` (run-locally `E993-R25-FOURTH-BAND-CLOSE-ALL-R`) | **VERIFIED, run-local only** | **`proved_informal`, fixed-band `d = 5`, weakest link, not awarded** | no un-re-derived link remains; the five-cell finite check is critic-derived and adjudicator-verified |
| `E993-TGT-FOREST` | — | OPEN | — | **no status transfer of any kind** |
| `E993-TGT-TREE` | — | OPEN | — | **no status transfer of any kind** |
| `E993-TGT-TRANSFER` | — | OPEN | — | **no status transfer of any kind**; `E993-TRANSFER-TO-FOREST` stays CONDITIONAL and `E993-UNIV-TREE-TRS2` stays REFUTED (a REFUTED claim never regresses to OPEN) |
| **Erdős #993** | — | untouched | — | **no status transfer of any kind.** Closing G1 alone does not solve Erdős #993 |

The diagnostic band's grade is **unchanged** at `proved_informal`. What changed is
that three of its four links moved from *recorded* to *derived* and the fourth
acquired a second, radically cheaper derivation — the composition is the same
strength, better founded. `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` remains
**OPEN in the frozen master registry** until Ashton authorises publication.

### C. Cross-orientation compositions (assembled here; no adjudicator was permitted to make them)

Per gate ruling 8, a composition first stated by an adjudicator or the synthesis
needs one isolated second reader before registration. **C1–C4 below are stated
for the record and are NOT proposed for registration at this close** (Composition
C is the exception: it has had its second read and is proposed as R1).

**C1. The `d = 5` diagnostic band's closure for every `r`, input by input.**

| link | object | grade after Cycle 5 | attribution |
|---|---|---|---|
| 1 | matching half `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN` (order `2r+5`, a 7-matching, bare) | **`formally_verified`** (Cycle 1 award) | governed gate; cited, not re-derived, by anyone this cycle |
| 2 | cover half, algebraic part: for every finite forest of order `2r+5` with `τ ≤ 5`, `Δ_k ≥ Γ_n(τ,k,n) > 0` for every `k < r` with `r ≥ k+2`, and for every `k < r` outright when `τ ≤ 4` | **`proved_informal`, no horizon** | **seat F3**; independently re-derived by C-F3-T, C-F3-U and the F adjudicator |
| 2b | cover half, finite part: exhaustive closure at exactly **five** cells (`τ = 5`, `r = k+1`, orders 9, 11, 13, 15, 17), corrected minima `min Δ_{r−1} = 39, 56, 56, 43` at orders 11–17 | **bounded computation, complete on a finite class** | **critic-derived (C-F3-T, C-F3-U) and adjudicator-verified; explicitly NOT the seat's** — the seat's shipped closure computed the wrong rank over an incomplete population and is struck as evidence |
| 3 | cover-fiber/Hall carry step `Δ_k − Δ_{k−1} ≤ Bd(r,k)` on the `ν = τ = 6` class of order `2r+5`, ranged `Bd`, every integer `k` | **`proved_informal`, no horizon, graph-general given `ν = τ`** | **seat F3**; exhaustively stress-tested by C-F3-T (51,431 classes at `r = 4,5,6`, every `k`), C-F3-U (`r = 4`, 382,391 instances, plus the `ν < τ` control failing on 2,974 of 25,780 rows) and the F adjudicator (all 585 / 7,469 / 43,377 classes, every integer `k ∈ [−1, order+2]`, 0 violations) |
| 4 | arithmetic tail `E993-R25-BD-TAIL-NEGATIVE`: `Bd(r,r) < 0` for every `r ≥ 6` | **`proved_informal`**, now with **no computational residue at `r ≥ 15`** and 9 exact evaluations at `r ∈ [6,14]` | **seat U2** (chain) with the repairs **critic-derived jointly** (C-U2-T, C-U2-F); U adjudicator replayed it end to end |
| 5 | window reduction; König range `b ≤ 2r−1−a`; Corollary F at `d = 5`; exhaustive `r ≤ 5` | registered, `proved_informal` or better | Cycle 1–4 record; the König range critic-attributed (C-F2-T, C-F2-U, Cycle 4) and now subsumed in link 3's derivation |

**Ruling: yes — `E993-R25-FOURTH-BAND-CLOSE-ALL-R` now rests on derived inputs
throughout.** Exactly one link is formally verified (the matching half); three are
informally proved theorems whose derivations were reconstructed from the
definitions this cycle and exhaustively stress-tested; one is a finite check that
is entirely critic-derived and adjudicator-verified. The weakest-link grade is
unchanged. **Lean readiness of the band**: the matching half is formal; the
arithmetic tail is the Cycle 6 flagship (U); the carry step is the F-orientation
candidate; the cover half's algebra and its five-cell residue are unformalised.
**No status transfers** to Tier 1, Tier 2, `FOREST`, `TREE`, `TRANSFER` or
Erdős #993, and none to any other band.

**C2. The Tier 2 residue, after the `d' = 3` discharge and Composition C.**

| residual excess | object | grade | attribution |
|---|---|---|---|
| `d' = 2` (`|U| = 2p−2`) | `E993-ORDINARY-G1-FIRST-WIDE-SLICE` | **`formally_verified`** | frozen G1 award |
| `d' = 3` (`|U| = 2p−1`) | `Δ_{p−2}(U) ≤ 0` for every `p ≥ 3` | **`proved_informal` at every rank except the single cell `p = 6`**, where it is **bounded computation** | seat T4's chartered deliverable; both halves re-proved uniformly by both T4 critics; T adjudicator verified `Γ(3,k)`, the `k = 2` identity and the `r ≤ 2` vacuity |
| `d' = 4` (`|U| = 2p`) | `E993-ORDINARY-G1-THIRD-WIDE-SLICE` | **`formally_verified`** | frozen G1 award |
| `d' = 5` (`|U| = 2p+1`) | Composition C | **`proved_informal`**, fixed-slice, grade capped by the band | Cycle 4 synthesis; second read `confirmed_with_repairs` |
| `d' ≥ 6` | — | **untouched by anything in the run** | — |

The `d' = 3` entry composes: the `τ(U) ≤ 3` half is the registered **VERIFIED**
`E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` at `d = 3` (strict, uniform in `r`,
forest-only, literature-free), with both T4 critics supplying independent uniform
proofs through `Γ(3,k) > 0` for `k ≥ 3` — a conjunct of the **formally verified**
`E993-R25-CATALAN-GAP-MONOTONE-RATIO` — plus the forest edge bound at `k = 1` and
C-T4-F's cover-free identity at `k = 2`; the `τ(U) ≥ 4 = m(3)` half is the in-run
matching branch (formally verified at `r = 3`; decision procedure at `r = 4`;
theorem at `r ≥ 5`; **vacuous at `r ≤ 2`**, C-T4-U's repair, exhaustively
confirmed by the T adjudicator); and the window `[c(3)+1, m(3)−1] = [4,3]` is
**empty**, so the two cases are exhaustive. **The Basit–Galvin dependency is
DISCHARGED for the forest-restricted `d' = 3` slice at every rank.** The
graph-general `E993-GRAPH-SECOND-WIDE-CROSSING-SIGN` and its admitted literature
dependency are **neither strengthened nor weakened**, and any future citation of
the graph-general claim still carries it.

**Ruling: the exact Tier 2 residue is every `d' ≥ 6`, plus the single cell
`(d', p) = (3, 6)`.** `E993-G1WIDE-NO-SIZE-CAP` **stays OPEN**: it is uniform in
`|U|`, a slice is not the tier at any grade, and **nothing bounds `d'` above**
(guard 9 gives only `d' ≥ 2`; the census's `d' ∈ {2,3,4,5}` is bounded evidence
over trees of order `≤ 19` only). **No status transfer between tiers, between
forests and G1 tuples, or to any headline.** A useful consequence of the second
read that no adjudicator could state: **the load-bearing link of the `d' = 3`
slice is the same link the second reader verified verbatim for `d' = 5`** —
guard 10 *is* `x(U) < r` (same `firstDescent`, same strictness, same ℕ index
convention, no junk-value case, `p ≥ 3` from guard 10 alone) — so that step now
carries an independent second reading on both slices.

**C3. The matching branch's exact status at threshold `m(d) = ⌈3d/2⌉ − 1`.**

- `r = d`, order `3d`: `E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN` —
  **`formally_verified`**, unconditional, bare, uniform in `d`, **rank `r = d`
  only**.
- `r ≥ K(d) = 2m(d) − d`: `E993-R25-MATCHING-LARGE-RANK-SIGN` —
  **`proved_informal`**, second-read, bare, all finite simple graphs; over
  `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY` (VERIFIED, `proved_informal`).
- the band `d < r < K(d)`: **bounded computation**, turned into a decision
  procedure by `E993-R25-CLAMPED-GREEDY-OPTIMALITY` (VERIFIED,
  `proved_informal`, critic-attributed C-T2-F). Attained exact-rational horizon
  **extended this cycle from `d ≤ 300` to `d ≤ 400`** (T adjudicator: 79,600
  cells; 44,700 at `d ≤ 300`, 19,800 at `d ≤ 200`); global band minimum
  **`20149737/53301248`**, attained **uniquely** at `(d,r) = (10,17)` — the top
  cell of `d = 10` — and confirmed to `d ≤ 2500`; **top-cell attainment with zero
  exceptions to `d ≤ 400`**.
- **Newly discharged (critic-derived, C-T1-U; adjudicator-confirmed):** the alive
  `b`-constraint at `j = r+1`, `(r+1)·t_P ≥ 2(m−r)`, which exists whenever
  `m > r` and is formed by neither the recursion, the greedy-optimality induction
  nor the shipped generator. **Zero failures at every band cell with `d ≤ 400`**,
  and **proved** on the binding band-bottom family with exact slacks
  `1 + 3/(d²−4)` (even `d`) and `1 + 1/(d−1)` (odd `d`), minimum slack
  `89999/89996` at `d ≤ 300`.
- **Ruling on the controller's explicit question: the `j = r+1` constraint
  changes no registered statement.** `E993-R25-ALIVE-WINDOW` already registers
  both endpoints correctly, and `E993-R25-CLAMPED-GREEDY-OPTIMALITY` is a
  statement about the **reduced** C1/C2 column system. It takes a **scope note**
  (registration R20).
- **The remaining obligation is now one lemma.** The per-cell margin is strictly
  monotone in `α`: `β_cell(d, α+1) > β_cell(d, α)`, with **zero violations over
  all 79,600 band cells at `d ≤ 400`** (adjudicator; C-T1-F reports 19,800 at
  `d ≤ 200`). Grade: **bounded computation at an attained horizon, critic-derived
  (C-T1-F) — not a theorem.** By induction on `α` it would give top-cell
  attainment outright, with no asymptotics.
- **Honest debt on the same fact:** the argmin stratum `j* = α + i*` is
  `α`-invariant only near the band top (spread 0 over `α ≤ 60` at `d = 100, 400`;
  spread `≤ 1` over `α ≤ 240` at `d = 400`) and **drifts over the full band**
  (range `[400,410]` at `d = 400`, `[200,207]` at `d = 200`). Neither critic's
  invariance statement may be quoted band-wide.
- **EXACT RESIDUE: the schema `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` stays
  OPEN.** Live band cells: `(d,r) = (3,4)` and every `d ≥ 6` with
  `d < r < K(d)`. `d = 2` has an empty band; `d = 4` is owned by C3; `d = 5` is
  owned by the formally verified seven-edge award. **Extending the computed
  horizon by sweeping is not a route** (gate ruling 3). **X-link:** the live cell
  `(3,4)` is *the same object* as the last open rank of the `d' = 3` slice
  (C2) — closing the matching band closes both, and `d' = 3` must therefore not
  be re-chartered as its own Cycle 6 route.

**C4. The cover branch's route to a Lean statement of `c(d) = min(d,5)`.**

Registered state: `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` is **VERIFIED**,
`proved_informal_adjudicator_verified_no_formal_award`, statement *"For every
finite forest `F` of order `2r+d` (`d ≥ 2`, `r ≥ 2`) with `τ(F) ≤ min(d,5)`,
`Δ_k(F) > 0` for every natural `k < r` (hence `x(F) ≥ r`)"*, with the diagonal
refuted for `d ≥ 6` and `c(6) = 5` exactly. After Cycle 5:

1. **General half — derived** (C1 links 2 and 2b above). The finite residue
   **collapses from the registry's cell list to five cells, all at `τ = 5`, all
   at `r = k+1`** (orders 9–17), and the reduction is **exact, not merely
   sufficient**: at each residue order, `k = r−1` is the only `k < r` the
   analytic bound does not close. The honest accounting of the advance is
   **`11 → 5`** by the return's own criterion (the 11 pairs with `Γ(τ,k) ≤ 0` for
   `τ ≤ 5`), or "the registry's three `τ = 4` cells are unnecessary" against the
   registry's accounting; **"8 → 5" is neither** and is struck.
2. **Why acyclicity bites exactly at `τ = 5` — now explained, not observed.** The
   five cells sit precisely where `n = 2r+5−τ = 2r = 2k+2`, the one combination of
   this band's excess and the theorem's threshold at which the slack `5−τ`
   vanishes. Matched by an explicit **general-graph counterexample at the
   identical cell** (13 vertices, `τ = 5`, `x = 3 < r = 4`), constructed
   independently by both F3 critics and rebuilt by the F adjudicator
   (`Δ₃ = −8`; C-F3-T's variant `Δ₃ = −9`). **The theorem is FALSE for graphs and
   no graph-general argument closes it.**
3. **The `k ≥ K(τ)` tail is already carried by a formal award.** `Γ(τ,k) > 0` for
   `k ≥ K(τ)` with `K(1..7) = 0,2,3,4,6,12,70` is a conjunct of the **formally
   verified** `E993-R25-CATALAN-GAP-MONOTONE-RATIO` — **as a theorem about
   Catalan integers, never packaged as a graph statement**, per that award's own
   scope. The **ballot identity** (critic-derived, C-U4-T and C-U4-F
   independently, adjudicator-replayed) shows the size-only card-5 bound at the
   top-rank cell **is `Γ(5,k)` identically**, so `K(5) = 6` and "the size-only
   bound closes every top-rank cell from order 19 up" are **one fact**, and the
   small-rank cell list is exactly `k ∈ {1,…,5}` — the registry's five cells.
4. **What remains between the record and a Lean statement of `c(d) = min(d,5)`**,
   exactly:
   (i) the **card-5 assembly**: instantiate frozen ENTRY 174
   (`cover_singleton_available`, card-free) per cover vertex; four numeral floor
   checks for `t = 2..5` via `avail_le`; ENTRY 178's empty fiber; the budget
   chain ENTRY 172 + 58/59; and the **unstated padding lemma** (`τ ≤ 5` ⟹ a
   card-5 cover exists) — one sentence informally, a required lemma in Lean;
   (ii) the **order ≥ 19 regime**: a card-5 `cover_catalan_bound` plus the
   six-term `Γ(5,k)` telescoping identity (both dependencies of frozen ENTRY 179
   are card-free and liftable verbatim);
   (iii) the **`τ ≤ 4, 3, 2, 1` branches** in Lean — untouched; the frozen card-4
   chain exists and, per the Cycle 5 gate, **cannot compose at card 5**;
   (iv) the **general-`d` statement**: `c(d) = min(d,5)` at every excess `d`, not
   only at `d = 5` — attempted by no route, and the natural first test is whether
   the slack argument survives at `d = 6, 7` (route `F-C6-04`);
   (v) a **name-collision fix**: the U4 seat's card-5 lemma is
   `Erdos993G1.ThirdWide.cover_rank_bound`, the **same fully-qualified name** as
   frozen ENTRY 170's card-4 lemma. This must be renamed before any Stage 7
   dispatch.
5. **Already kernel-checked toward it** (compiled fragments, **not** awards): the
   seat's `powerset_five_sum` and card-5 `cover_rank_bound`; C-U4-T's `joint15`,
   `joint17`, `avail_le` and, decisively, `cover_rank_bound_five_singletons` — **a
   statement about an actual `SimpleGraph` with a cover of card 5**, which the
   return's own DAG marked "OPEN in Lean … not attempted"; C-U4-F's
   `cert_/joint_5_4_15` and `cert_/joint_6_5_17`. All axiom-clean, no `sorry`, no
   `native_decide`, all rebuilt and re-audited by the U adjudicator. **The
   assembly is the one piece that is not plumbing, and C-U4-T attempted exactly
   that and did not land it within budget** — the honest predictor for a Sonnet
   formalizer at repair limit 2.

### T — results from the T orientation

**T1. Hunter's spanning-tree inequality, proved in-run (seat-derived, seat T3).**
For finite sets `A_1..A_m` and any spanning tree `T` on the index set,
`|⋃A_i| ≤ Σ|A_i| − Σ_{(i,j)∈T}|A_i ∩ A_j|`. **`proved_informal`, general, no
horizon, no source vendored.** T adjudicator read the induction line by line and
brute-forced 2,410,945 (system, tree) pairs, zero violations; C-T3-F reports
5,157,120 and C-T3-U 66,519, both zero. **Consequence: the named literature
dependency of `E993-R25-KADDITION-CLOSURE-X-LE-4` is DISCHARGED.**

**T2. The `d' = 3` / `d = 3` band slice** — see C2. Exact statement of record:
*for every finite forest `F` with `|V(F)| = 2r+3` and `x(F) < r`, `Δ_r(F) ≤ 0`* —
**theorem-grade at every rank except `r = 4`**, where it is bounded computation
inherited from the matching band's live cell. Census range tightened by both
critics from `r ≤ 18` to **`r ≤ 6`**: all 110,747 `d' = 3` vertex triples =
94,851 pointed classes sit far inside any verified range.

**T3. Two-sided second-order forest order bounds (critic-derived: C-T3-U,
C-T3-F; adjudicator-rebuilt).** `Δ₄(G) < 0 ⟹ |V(G)| ≤ 19` and
`Δ₅(G) < 0 ⟹ |V(G)| ≤ 29` for every finite forest. **`proved_informal`,
fixed-rank, named as such**; the parameter space `(e, c_e, degree multiset)` is
**proved** complete (a proved superset, so over-inclusion only makes exclusion
harder). Ceilings `4, 8, 12, 19, 29, 40, 53, 69` at `k = 1..8`, reproduced by the
adjudicator at `k ≤ 6` and accepted on shipped evidence at `k = 7, 8`. Margin
literal settled between the two critics by exact recomputation: **`−408`** at
`k = 4, n = 19` (C-T3-U), not `−42`; `+51` at `n = 20`.

**T4. Rank `x ≤ 4` of the `K₁`-addition target CLOSES (critic-derived, on a
replayed in-run census).** Orders 20–25 are excluded pointwise by the two-sided
certificate; orders `n ≥ 26` by the **formally verified**
`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (`Δ₄ < 0 ⟹ n ≤ 25`). Hence every
forest with `x = 4` has order `≤ 19 < 21`, inside the registered order-`≤ 21`
census (**8,355,831 forest classes**, population recomputed independently by the
adjudicator), so **the seat's "residue of exactly two orders, 22 and 23" does not
exist** and neither the un-replayed Cycle 4 cover-fibre scan nor any literature
citation is needed. **`E993-R25-KADDITION-CLOSURE-X-LE-4` moves CONDITIONAL →
VERIFIED at `proved_informal`** (registration R16), with the order-`≤ 21` in-run
census named on its face as its remaining input.
**Tier-1 pricing, stated exactly and no further:** this settles the
**`K₁`-addition target** at `x ≤ 4`; through `E993-R25-NR1-DECOMPOSITION` it
retires the corresponding single rank as a Tier-1 *obligation for that
sub-target*. **It proves no instance of Tier 1 beyond what a finite census
already covers, and Tier 1 stays OPEN.** An order bound is **not** a no-recovery
statement — its contrapositive gives `Δ_k ≥ 0`, the opposite sign — and must
never be bundled with the `x ≤ 4` closure.

**T5. `x = 5` narrows to orders 22–29.** `Δ₅(G) < 0 ⟹ |V(G)| ≤ 29`; against the
census horizon 21 the residue is **eight orders**, down from the seat's 22–33 and
the allocation's cited 22–31. Population **19,343,055,028 forest classes**
(≈1.9 × 10¹⁰, adjudicator-verified against C-T3-F) — a census is unaffordable.

**T6. `N*(k) = k² + k + 3` for `k ≥ 2` (`N*(1) = 4`), with
`Δ_k(G) < 0 ⟹ |V(G)| ≤ N*(k)`.** Uniform in `k`, explicit closed form,
`proved_informal` with one step named open (the argmin at `e = n−1`, `c_e = 1`).
Values `4, 9, 15, 23, 33, 45, 59, 75, 93, 113, 135, 159` at `k = 1..12`
(adjudicator-computed). **It is strictly sharper than the formally verified
`(k+1)²` for every `k ≥ 3`, by exactly `k−2`** — the return's "different, weaker
ceiling" and "grows like ≈9.4k²" are struck as false in both halves, and any
registration must be written on that comparison, **never as a weaker sibling and
never as "improving the award"** (the award's own statement already reads
"`n ≤ (k+1)²` (a fortiori `n ≤ k²+3k`)", and `k²+k+3 ≤ k²+3k` for `k ≥ 2`).

**T7. The pendant Cap Lemma (critic-derived, C-T2-U).** The minimum of `Δ_{r−1}`
over the padding simplex of any connector-only `(7,7,r)` skeleton is attained at
some `p` with `Σp ≤ 45`, **uniformly in `r`**. `proved_informal`; the T
adjudicator checked the Pascal step and the termination bound
`(2t₀+3)(8−t₀) ≤ 45` by hand and accepts the 1,346-move numerical check on
shipped evidence. **Honest limit:** this is the charter's alternative closing
condition **in kind but not in usable strength** — `Σp ≤ 45` still leaves
`C(52,7) ≈ 1.34 × 10⁸` paddings per class. Tightening 45 toward the observed 21
is the exact open step.

**T8. The `(7,7,15)` stratum-exhaustive minimum (critic-derived C-T2-F, C-T2-U;
adjudicator-re-derived exhaustively).** Over all **128** connector-only
isomorphism classes (from 134,808 labelled skeletons; distribution
`{0:1, 1:6, 2:15, 3:29, 4:37, 5:29, 6:11}`) and the whole padding box `[0..5]⁷` at
`r = 15`, the minimum is **`−1,612,675`, attained uniquely by the single hub with
`p ≡ 3`** (ties = 1, no argmin on the boundary); runner-up **`−1,113,530`**.
**Bounded computation at three ranks** (`r = 15` adjudicator-exhaustive;
`r = 20, 100` on the critics' shipped evidence). **The Cycle 4 `r = 15` row is
upgraded from best-found to exact within the connector-only stratum; it is NOT a
full-census cell minimum** — the **954 cover-internal-edge classes** at `r ≥ 15`
are untouched by the seat, both critics and the adjudicator, and are the dominant
residue. The residue population was miscounted against the wrong denominator:
the connector-only stratum is **128 classes**, not 1,082.
**`E993-R25-SINGLE-HUB-NOT-UNIFORMLY-WORST` is untouched** — REFUTED at exactly
three exhaustive cells — and **no "extremality at `τ = 7`" line may appear
anywhere downstream**, since that would be an unlabelled instance of the
restricted converse, which nothing this cycle proves.

**T9. The away-from-criticality convergence theorem** is regraded to
**`proved_informal`-partial, critic-repaired**: as shipped the error decomposition
omits the discretisation term `T_M = B(x_i)(M(x_{i−1}) − M(x_i))` outright.
C-T1-F supplies the missing bound `|T_M| ≤ 18/(25d)` (verified; measured
`max|T_M|·d = 0.5515 < 0.72`) and C-T1-U supplies the `B`-part expansion on both
parities and a proof of the asserted clamp clause. `D₀(ε)` remains unquantified
in `ε`. The crossover profile is narrowed: the minimum sits at `i* = d + Θ(√d)`,
**strictly above `i = d`, on the repelling side where `B(x) > 1`**, so §6 of the
return understates its own obstruction; the exponent `d^{−1/2}` is right and
C-T1-U's measured constant ≈ 0.141 is bounded evidence, not a proof.

### F — results from the F orientation

**F1. REFUTATION (exact, with explicit witnesses; never reopens).** *The
extension of `E993-R25-STRATUM-DEPTH-COROLLARY-F` beyond its registered scope
`d ≤ 11` to `d = 12` (`τ = ν = 13`) is FALSE at `k = r−2` for every
`r ∈ {20,…,28}`.* Witnesses: `r = 20` (order 52, `Δ₁₈ = −442,663,386`) and
`r = 25` (order 62, `Δ₂₃ = −192,621,735,920`), shipped by the seat and **rebuilt
from scratch by both critics and by the F adjudicator** — the adjudicator built
the `r = 25` witness **from the closed-form description alone**, not from the
seat's edge list, and obtained the exact value. `r = 21..28` are
**critic-attributed**: C-F2-T's closed-form single-hub family attaining the joint
bound to the digit, and C-F2-U's exhaustive uncapped profile enumeration
(29,487 / 44,635 / 66,513 / 97,700 / 141,621 / 202,787 / 287,088 profiles at
`r = 21..27`). **Three riders travel with it:** (i) **both halves of the
conclusion fail** — `x(F) = r−2` on both witnesses, which the seat never
computed, so `x(F) ≥ r−1` fails too and the refutation is *stronger* than the
return states; (ii) **neither witness recovers** (`Δ_r < 0`, both sequences
unimodal and log-concave with minimum defects `+779` and `+1225`) — **no Tier 1
contact whatever**; (iii) **the `k = r−2` qualifier is mandatory** — every
`k < r−2` slice is strongly positive. **The registered claim (`d ∈ {2,…,11}`) is
untouched and is not impeached.**

**F2. The refutation widens with `d`.** The seat's conjecture that the negative
band is short and closes is **refuted** (C-F2-U): the band is `r = 21..28` at
`τ = 13` (closes), `r = 22..261` at `τ = 14`, and **does not close by `r = 400`
for `τ = 15..20`; at `τ = 14` a capped exhaustive sweep is negative at every
`r = 21..40`.** The seat's onset formula `r ≈ 5τ/2` is **wrong** and would send
the next seat to the wrong rank band; the correct threshold (C-F2-T) is
`r ≥ (τ(D−1)+2)/2`, i.e. `r ≥ (3τ+2)/2` at `D = 4`, giving 20.5 at `τ = 13` and
matching the observed onset exactly. **`τ = 13`'s short band is the accident, not
the rule.**

**F3. `r = 19` at `τ = 13` stays OPEN and is strictly narrower.** Exhausted over
the entire single-hub family (all 12,199 admissible leaf profiles, minimum
**`+405,520,555`** — a small theorem, not a search), over 37,339 multi-hub block
partitions (minimum `+359,663,088`) and over 3,326 randomised Berge-acyclic
hyperforests (minimum **`+89,857,131`**, independently reproducing the seat's
converged value from different code), **with a control at `r = 20` where the same
machinery finds a counterexample immediately** — so the null is informative, not
blind. **What is missing is an argument, not more search**: `r = 19` is exactly
the rank at which the uniform `(4^13)` profile is label-infeasible
(`1 + 13·3 = 40 > N = 37`).

**F4. Three thin-tree theorems (critic-derived; adjudicator-verified).**
- **Theorem A** (C-F4-U; low band also C-F4-T): *no thin tree with cover number
  `τ ≤ 9` has a log-concavity failure at any rank; a fortiori none has an
  in-window failure and none recovers.* **`proved_informal`, unconditional, no
  horizon** — the band `2τ..3τ−1` is *forced*, so "exhaustive" is a complete case
  analysis, not an attained horizon. Adjudicator reproduced the `τ = 6` and
  `τ = 7` rows by brute force over all free trees with no skeleton machinery
  (526 and 2,860 classes, zero failures) and verified that the only above-25
  slice, `τ = 9` order 26, is exactly Theorem C's 47 top-order classes.
- **Theorem B** (C-F4-U): *no thin tree with `τ ≤ 10` has a log-concavity failure
  at any rank.* **`proved_informal`, CONDITIONAL on the registered order-`≤ 25`
  census** (`E993-UNIV-TREE-TRS2`, `smallest_witness_order: 26`), which must
  travel on its face.
- **Theorem C** (C-F4-U; same closed form derived independently by C-F4-T): *for
  every `τ ≥ 2` the thin trees of cover number exactly `τ` and order exactly
  `3τ−1` are precisely the trees obtained from a free tree `S` on `τ` vertices by
  subdividing every edge once and attaching one pendant leaf to each original
  vertex; the correspondence is a bijection of isomorphism classes, so there are
  exactly `t(τ)` of them.* **THEOREM, `proved_informal`, unconditional, no
  horizon, structurally proved.** Adjudicator implemented the construction and
  verified it at `τ = 4..11`: `t(τ) = 2, 3, 6, 11, 23, 47, 106, 235`, matching
  A000055 and the last column of every one of the seat's five exhaustive rows.
- **Forest-level corollary** (C-F4-T): *every forest all of whose components are
  thin with `τ ≤ 10` is log-concave at every rank, hence has no recovery at any
  rank* — via the two VERIFIED TRS2 claims.

**F5. The counterexample hunt's exact residue.** `τ ≤ 10`: **CLOSED**.
`τ = 11`: orders 22–25 closed by the registered census; **orders 27–32 closed
exhaustively by both critics independently** (1,300,744 classes, agreeing
class-for-class at every order, the order-32 row equalling `t(11) = 235`) —
precisely the region the return's own table records as "zero coverage of any
kind"; **order 26 alone remains open**, and within it only `h ≥ 5` plus the
28.6 % remainder of `h = 4`, costed at ~15.5 million generation events.
`τ = 12`: orders 24–25 closed by the register, order 35 closed (551 classes,
Theorem C); **orders 26–34 remain**, containing both known witnesses.
**Ruling: the chartered question — can an in-window failure occur at `τ ≤ 12` —
is open at exactly nine orders of `τ = 12` plus one order of `τ = 11`. Nothing
larger.** **The standing minimum `τ = 21` for an in-window failure is
UNCHANGED**; nothing this cycle lowers it. The two Galvin fixtures that do carry
in-window failures (`T_{5,5,1}` at `τ = 26`, `T_{8,6,1}` at `τ = 49`) sit far
above 21 and neither recovers; they show the window criterion **does** fire once
`τ` is large enough, so the zero-witness verdict at `τ ≤ 11` is not vacuous
silence. Per the fixtures record, do **not** cite "sixteen" failure ranks for
`T(2^7 1^23)`.

**F6. The joint-budget feasibility audit (route `F-C5-01`), at its corrected
population and cap.** **71**
non-vacuous layer-1 cells (24 of the 95 are vacuous by the theorem's own
hypothesis `2r−1 ≥ τ`, which also exposes why the layer-2 exceptions are five and
not nine); **195,189** sorted degree profiles at the provable cap
`2r−2k+2 = 6`, worst cell **6,188** at `τ = 12, r = 31`; layer 2 **1,185** at
cap 8; largest kernel `Nat` comparison **25 digits**
(`C(85,42) = 3,318,776,542,511,877,736,535,400`), not 14. **The apparent
disagreement between the two critics (195,743 vs 195,189) is not a disagreement:
they price different populations and both are correct**, as the F adjudicator
computed both. The number a formalizer must size a `Decidable` instance against
is **195,189 over 71 cells, worst cell 6,188**.

**F7. The above-threshold reduction (critic-derived, C-F1-U).** For `r ≥ R(τ)`
and every `k ≤ r−2`, `PF(τ,r,k) ≥ 0` reduces to the registered rank-`(r−2)`
theorem plus **95 explicit single-integer evaluations** at `r = R(τ)`, all `≥ 0`
(minimum 86 at `τ = 12, k = 0`). Horizon extension to `r ≤ 300`, `τ = 3..12`,
zero negative cells, critic-derived (C-F1-T). This repairs a node the DAG omitted
and strikes the return's "above the per-fiber threshold no further finite check
is needed" — the registered theorem is **rank-`(r−2)` only**, and the minimum of
`PF(τ,r,·)` over `k ≤ r−2` is attained at `k = 0`, not `k = r−2`.

### U — results from the U orientation

**U1. The positivity lemma's scalar arithmetic core — COMPLETE in Lean, twice
over.** `(P)`: `C(n,s) ≥ 2^s·C(q,s)` with `s = 2n−K−1`, `q = m+n−K−1`, at every
hard index `n ≤ m`, for both parities of `K`, on the region `3d ≤ 2m+2`; together
with `(S) (n+1)(K+1−n) ≥ 4(m+n−K)(m−n)`, the factorisation
`Δ = 3(3d−2(m+1))(d+2(m+1))` and the **two-sided** `Δ ≤ 0 ⟺ 3d ≤ 2m+2`.
**Theorem, uniform in `(m,d)` on the region and in the index; kernel-checked end
to end.** Bases, discriminant and `(S)`: seat U1. **The induction step and the
full induction principle: critic-derived, C-U1-F and C-U1-T independently** —
C-U1-F in ~25 lines from `Nat.succ_descFactorial_succ` using **none** of the
seat's `descProd` toolkit, C-U1-T along the seat's own prescribed route. All
axiom-clean, no `sorry`; **rebuilt and re-audited by the U adjudicator in the
foreground**. Adjudicator's own replay: `(P)` at **1,010,000** in-region hard
indices (`m ≤ 300`), zero failures; the regrouping identity at 4,364 in-region
triples, zero failures and zero negative coefficients. **This does NOT raise
`E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`**, whose object is the
coefficientwise-in-`t` nonnegativity of `N_j`.

**U2. `M_a(r) ≤ Cat_{r−1−a}` for `a = 1..6`, `r ≥ 15`, with NO computational
residue.** **Theorem, no horizon**, fixed-band `d = 5`, uniform in `r`. Seat U2's
chain with the repairs **critic-attributed jointly**: as shipped, Lemma A's
hypothesis did not cover the range its Consequence needs, making the maximiser
step bounded computation to `m = 399`; both critics repair it by the same move in
two forms, and either of two independent sufficient chains
(C-U2-T's `2g_c ≤ m+1` for `m ≥ 9`; C-U2-F's
`(**) 8(2m−1)(g_c−1) ≤ 2^{g_c}(m+1)(m+1−g_c)` for `m ≥ 7`) **removes the
six-pair residue entirely**. `r ≥ 15` is **sharp**, and the obstruction is the
tail, not the interior: at `(a,r) = (6,14)`, `M_6(14) = 3230 > Cat_7 = 429`. The
complete failure profile over `r = 2..400` is **19 cells** (adjudicator's own
enumeration, reconciling C-U2-T's 19 and C-U2-F's 15 + 4), and there is **no
failure at any `r = 15..400`**.

**U3. `Bd(r,r) < 0` for every `r ≥ 6`, by a second and radically cheaper route.**
Via `Bd(r,r) ≤ −Γ(6,r−1)` with the **formally verified** `Γ(6,k) > 0 (k ≥ 12)`
as its only non-elementary input, plus 9 exact evaluations. **A re-derivation of
a registered theorem along a different DAG, not a new registration of the tail.**
**Stage 7 price falls from 13,596 evaluations at ~10²⁶ to 900 kernel evaluations
with largest `|D| = 1,485,800`**, kernel-decidable without `native_decide`.
Adjudicator's own replay: `Bd(4,4) = 48`, `Bd(5,5) = 33`, `Bd(6,6) = −16`,
`Bd(10,10) = −14406`; `Bd(r,r) ≥ 0` exactly at `r ∈ {2,3,4,5}`; `Γ(6,11) = −1563
≤ 0 < 16848 = Γ(6,12)`; `Bd(r,r) ≤ −Γ(6,r−1) < 0` for every `r = 15..400`.

**U4. The unconditional step-sign law (critic-derived, C-U2-T and C-U2-F
independently).** `m(2m−g)(h(g+1) − h(g)) = C(2m−g, m−1)(2m − g² + g)` with
`h(g) = D(2m−g, m)`, whence `sign(h(g+1) − h(g)) = sign(2m − g² + g)` and
`g_c(m) ∈ argmax`, **with no hypothesis on `N(g)`**; and the **integral** bracket
`N(g_c) ≤ 4g_c − 5`. **Theorem, no horizon**; polynomial core kernel-checked.
The adjudicator verified the sign law on the whole interior range `0 ≤ g < m`,
`m ≤ 299`, of which **4,920 cells lie outside the return's declared `N > 0`
domain**. **Registration must use a name that cannot be misread as unimodality of
any independence sequence** — the object is the integer function
`g ↦ D(2m−g, m)`, proved from a sign identity, never a shape premise on any
`i_k`.

**U5. `Δ₃(F) > 0` for every finite forest of order `≥ 12`; sharp at 11, where
`P_11` is the unique minimiser (`−14`).** **Theorem, `proved_informal`**, uniform
in `n` at **fixed rank 3**, no horizon, complete after the edgeless clause. Seat
U3 owns the mechanism and the proof; the **edgeless repair** (`Δ₂(nK₁) =
C(n,3) − C(n,2) > 0` for `n ≥ 6`, **not** `n ≥ 5` — at `n = 5` it is exactly 0, a
plateau, not a descent) and the **uniqueness** are critic-derived. **This is the
first PROOF of an in-run recorded statement, not a new statement** (the registry's
`cycle4_note` and the charter already carry the threshold), and it must **never**
be described as sharpening `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`, whose
scope already records the maxima `4, 8, 11, 15` as an unproven observation with no
tightness wording. Adjudicator's own instrument reproduced A000055 and A005195 at
`n = 1..13`, `min Δ₃ = −16, −20, −21, −14, +6, +45, +110` at orders 8..14, and
the pendant identity at every vertex over every forest of order `≤ 10` (28,710
instances, 0 mismatches). **The excess reading ("order ≥ 12 is `d ≥ 6` at
`r = 3`") is a translation of a fixed-rank fact and must never be quoted
downstream as a `d`-band result.**

**U6. The pendant identity `i_k(G) = i_k(G−v) + i_{k−1}(G−N[v])` and its
`Δ`-form — kernel-checked twice, critic-derived** (C-U3-T's declaration
`#check`s to a type character-for-character identical to the seat's draft;
C-U3-F's `indepCount_deleteVerts`, `pendant_identity` and the reindexed
`pendant_delta` with no natural subtraction). The seat's "cross-carrier subtype
bookkeeping" obstruction diagnosis is **struck**: a single transport lemma back
onto the original carrier dissolves it. **The order-12 base case is unnecessary**
(C-U3-T): `min Δ₃(11) + min Δ₂(10) = −14 + 20 = 6 = min Δ₃(12)`, exactly tight,
and the algebraic chain seeded off an exhaustive base at order `≤ 8` (**76
classes**, not 1,601 and certainly not 1,329,765) reproduces the minima.

**U7. The `τ = 5` cells close, all five.** For every finite forest of order 15
with `τ ≤ 5`, `Δ₄ ≥ +21 > 0`; of order 17 with `τ ≤ 5`, `Δ₅ ≥ +42 > 0`; by the
same argument all five registered cells close with `+9, +5, +9, +21, +42` at
orders 9, 11, 13, 15, 17. **Theorem, `proved_informal`, fixed-cell** — one
`(r,k,order)` triple each, **not uniform in `d`** — and a second, non-census
derivation of instances of a registered VERIFIED claim, whose status it does not
change. True minima `+56` and `+43` (both critics' censuses, different
populations, same minima), so the bounds are sound and the `(6,5,17)` bound is
within 1 of tight. Two cells seat U4; **the five-cell reach critic-derived
(both)**; the **LP-dual certificate `f(d) ≥ 42 − 14d`, exactly tight at both
cells, replacing 11,348 / 20,069 profiles by 11 / 13 numeral checks, is
critic-derived jointly and formalised independently by both critics**.
**Acyclicity is load-bearing at exactly one point** (`Σ crossdeg ≤ |E| ≤ order −
1`); removing it degenerates the refinement **exactly** to the size-only bound,
so the mechanism cannot prove the REFUTED graph-side shapes.

---

## Refuted or narrowed mechanisms

**REFUTED (never reopens).**

1. **Corollary F's extension to `d = 12`** — refuted with explicit witnesses at
   nine consecutive ranks, in **both halves** of its conclusion; no Tier 1
   contact. (F1 above.)
2. **"The `τ = 13` negative band closes, so the failure is a narrow window"** —
   refuted; the failure **widens** monotonically with `d`.
3. **The seat's onset formula `r ≈ 5τ/2`** — wrong; the correct threshold is
   `r ≥ (τ(D−1)+2)/2`.
4. **"Thin trees never fail log-concavity"** — FALSE at `τ = 12`: `T(3,4,4)`
   (order 26, `τ = 12`, `α = 14`, `x = 8`, a unique log-concavity failure at rank
   13 with margin `−378`, **one rank above the window**) and `W2` are both thin,
   and C-F4-T shows they are *generated* by the thin generator. **Any proof of
   the `τ ≤ 10` null must use the cover bound essentially; no structural property
   of thinness alone will do.** The thin family's threshold lies between `τ = 11`
   and `τ = 12`, and if `τ = 11` is clean it is exactly `τ = 12` — the sharpest
   available statement of the frontier, and it is new (C-F4-T).
5. **The single-constant trapping shortcut for `β(d)`** — refuted **on one
   witness only**: `inf A_i/(1−B_i) = 0` over steps with `B_i < 1`, attained at
   `(d,r,i) = (3,3,1)` where `A_1 = 0`, `B_1 = 3/4` force `L ≤ 0`. **The seat's
   stated reason is not the reason**: of the 26,100 steps with `A_i < 0` and
   `B_i ≥ 1` at `d ≤ 60`, **all 26,100 admit some `L ∈ (0,1]` and `B_i` is never
   exactly 1** (adjudicator's replay, ruling for C-T1-F and striking C-T1-U's
   sentence). Any successful uniform-bound proof needs a `d`- or `i`-dependent
   invariant, not a fixed number.
6. **"The 2nd-order Hunter/Bonferroni method cannot go below `N*(k)`"** — the
   seat's Theorem-graded structural claim rests on conflating "two bounds agree on
   paths" with "the bound equals the truth"; a strictly 2nd-order, degree-aware,
   cover-free and matching-free certificate reaches 19 and 29. **Never to be
   re-asserted**, and the routing of the remaining work to a 3rd-order-or-cover
   argument "as the only route" is void — though a 3rd-order term remains the
   natural *next* lever.
7. **The drafted Lean contract `D_unimodal_peak`** — a FALSE proposition
   (erratum g).
8. **The seat U3 claim that its forest populations are isomorphism-class counts**
   — false; **the seat U4 kernel-feasibility comparison** — false by measurement
   (`Fin 5 → Fin 11` `decide` killed for memory after 239 s at
   `maxHeartbeats 0`); **the claim that `(P)`'s induction step "resists"** —
   false, closed by both critics.

**NARROWED / FENCED.**

9. **Pointwise domination across ranks** (`t_i(α) ≥ t_i(1)`) is false (312,292
   violating steps at `d ≤ 120`; smallest witness `d = 3, α = 2, i = 1`), and
   window truncation is not the mechanism either: top-cell attainment must compare
   **minima over windows of different length**.
10. **Within-class balance on the padding simplex** — the lemma's
    strong-interchangeability hypothesis fails for four of seven catalog
    skeletons; the justification is struck and the optima survive only because
    both critics and the adjudicator redid the searches **without** the
    restriction.
11. **"`ν = τ = 7` holds automatically once every cover vertex has degree ≥ 1"**
    — false (the hub with `p = 0` has `ν = τ = 1`). The searched space is not the
    cell; every future `(7,7,r)` search must test the predicate per configuration.
12. **The naive `Fin τ → Fin cap` `Decidable` encoding** for the joint budget's
    finite check — infeasible (`8¹² ≈ 6.87 × 10¹⁰` at the cap-8 cells); narrowed
    to sum-bounded sorted tuples, which are small everywhere.
13. **Both of F2's chartered levers** ("raw vs. truncated"; "`e_C = 0` is the
    worst case") — correct and **inert**, zero improvement to the analytic bound;
    C-F2-T explains why (at the adversary's own optimum every term is already
    `≤ 0`). The question was settled by exact real-graph construction instead —
    the bound treats each `ρ_S` as free to range independently, while one real
    graph must realise all of them simultaneously.
14. **The size-only card-5 rank bound and the single-sparse-vertex
    (ENTRY-171) improvement** remain insufficient at every cell (`−10, −16, −18,
    −14`; `−16 → −9`), exactly as the charter warned. What closes the cells is the
    **joint budget-constrained** refinement.
15. **An unranged `Bd`** — confirmed useless (`≥ 0` on every `r ∈ [2,34]`); the
    **ranged** object is and remains the object of record (erratum C4-E-c).
16. **F4's debt diagnosis** ("skeleton enumeration is the bottleneck past
    `τ ≈ 10`") — refuted by construction: the attachment sweep dominates by
    `≥ 11×` at `τ = 11`, and `τ = 12`'s 1,721,756 skeletons enumerate in 151 s.
    The debt is a property of **that implementation**, not of the thin generator,
    and must be recorded that way.
17. **F3's shipped residue closure** and **F4's `τ = 10` payload** — struck as
    evidence (wrong rank / incomplete population; a payload the shipped generator
    cannot regenerate). Figures retained on critic-independent evidence.
18. **Extended Corollary F as a whole is NOT a responsible Stage 7 contract** —
    see § *Lean awards*.

**FENCES: no breach anywhere, in any orientation.** All three adjudicators
checked every route against `SOLUTION-CONTRACT.md` §3 and each reports the
registered fences **instantiated rather than merely asserted absent**: the
comparator `(1+2z)^m(1+z)^{n−2m}` appears only as a labelled consistency check
(and C-F2-T showed it is wrong-signed at the counterexample's own parameters, so
no comparator reasoning could have produced F2's refutation); `6K₂ ∪ (2r−7)K₁`
was instantiated by four critics across three routes with `Δ_r > 0`, `x = r+1`
and no recovery each time; `P_8`, C2 (`d = 2`) and C3 (`d = 4`) were reproduced
independently on at least four separate instruments; the nine registered
refutation witnesses have **zero instantiations** in the matching band; no
log-concavity premise, no convolution closure of unimodal sequences, no pointwise
addability, no every-vertex SR2, no edge-addition monotonicity, no factor-two
margin, no bare `d = 3` matching-2/3 or cover-3 claim, no imported forest
unimodality. The Kadrawi–Levit order-26 witnesses and Galvin's non-log-concave
trees are used only as fixtures and stress tests. **No mechanism in this cycle
collapses to a registered refuted one, and no REFUTED claim regresses to OPEN.**

---

## Headline verdicts

I inspected the headline by hand rather than by tally, as a
`headline_resolved: yes` would require. **Nothing in the cycle establishes a
uniform Tier 1 or Tier 2 theorem, a verified reduction strictly shrinking the
remaining class at schema level, or an exact counterexample to any tier.**

- **Tier 1 `E993-R25-UNR-FOREST-WIDE`: OPEN.** Its bands: `d = 2` formally
  verified (all graphs), `d = 3` informal theorem at every rank but `(3,4)`,
  `d = 4` formally verified (forests), `d = 5` informal for every `r`,
  **`d ≥ 6` open**. Zero recovering forests exist anywhere in the run's record and
  none was produced this cycle.
- **Tier 2 `E993-G1WIDE-NO-SIZE-CAP`: OPEN.** Residue: every `d' ≥ 6` plus the
  single cell `(d',p) = (3,6)`. It is uniform in `|U|`; a slice is not the tier at
  any grade.
- **Tier 3a `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`: OPEN.** Tier 3b
  `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY`: **OPEN**. Tier 3c
  `E993-R25-WINDOW-REDUCTION`: **OPEN and untouched this cycle**.
- **Diagnostic band `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`: VERIFIED
  run-locally at `proved_informal`, fixed-band `d = 5`, weakest link, not
  awarded**; OPEN in the frozen master registry until publication is authorised.
- **`E993-TGT-FOREST`, `E993-TGT-TREE`, `E993-TGT-TRANSFER`, Erdős #993: no
  status transfer of any kind, at any grade, in any direction.** `OB-G1` is a
  different claim and is not engaged. **Closing G1 alone does not solve
  Erdős #993.**

F2's refutation refutes an **extension beyond a registered scope**, never the
registered claim, and carries nothing to any tier: both witnesses are unimodal
and log-concave and neither recovers.

```text
headline_resolved: no
```

---

## Lean awards

Check 6 applied: a stable statement, a **closed** dependency DAG, and sufficient
materiality; a uniform theorem, a parameterized theorem with explicit threshold
functions, or a reduction theorem in honest conditional form qualifies; a
fixed-band result qualifies **only if named as fixed-band**; repackaged
identities and null searches do not. Every candidate is weighed against a
**Sonnet 5 formalizer with a repair limit of 2**. Governed-gate hygiene binds any
award: Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, axioms
exactly `propext`, `Classical.choice`, `Quot.sound`, no
`sorry`/`admit`/`native_decide`, shared Mathlib **bound by symlink and never
copied**, never `lake clean` / `lake update` / `elan`, foreground builds.

### AWARD GROUP A — funded at THIS close (Cycle 5 Stage 7)

**Proposed key `E993-R25-MATCHING-DUAL-SCALAR-CORE`** (alias-checked free).

**Exact statement to contract.** For all `m K : ℕ` with `m ≤ K+1`, `K ≤ 2m` and
`3(2m−K) ≤ 2m+2`, and for every hard index `n` (`K+1 < 2n`, `n ≤ m`):
`Nat.descFactorial n s ≥ 2^s · Nat.descFactorial q s` with `s = 2n−K−1`,
`q = m+n−K−1` — i.e. `(P)` at every hard index, **for both parities of `K`** —
together with `discriminant_factorization` (`Δ = 3(3d−2(m+1))(d+2(m+1))`,
`d = 2m−K`), `discriminant_nonpos_iff` (the **two-sided** `Δ ≤ 0 ⟺ 3d ≤ 2m+2`)
and `S_holds_of_discriminant_nonpos` (`(S) (n+1)(K+1−n) ≥ 4(m+n−K)(m−n)` on the
region).

**Hypotheses.** `m K : ℕ`; `m ≤ K+1`; `K ≤ 2m`; `3(2m−K) ≤ 2m+2`; index `n` with
`K+1 < 2n` and `n ≤ m`. Nothing else.

**Scope.** Pure arithmetic of the stratified matching-incidence certificate's
greedy dual. **Uniform in `(m,d)` on the region and in the index; no horizon.**
`m` is a matching **size** as a numeral parameter and `d = 2m−K` an excess as a
numeral; **no `SimpleGraph`, no `Δ_k`, no `indepCount` occurs**, and `ν`, `τ` and
`x(F) < r` enter nowhere. The route therefore specializes to none of C2, C3,
`P_8` or the diagnostic band and could not contradict them — **a restraint, not a
gap**.

**Excluded conclusions (mandatory scope lines on the award).**
(i) **This is the SCALAR core and does NOT raise
`E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`**, whose object is the
coefficientwise-in-`t` nonnegativity of `N_j`; (ii) it is not the large-rank
theorem and not the Tier 3a schema; (iii) no statement about any graph, any
forest, any G1 tuple, any tier, `FOREST`, `TREE`, `TRANSFER` or Erdős #993;
(iv) no sharpness claim and no claim that a certificate exists for any particular
graph; (v) **the induction step and the induction principle are
CRITIC-ATTRIBUTED** (C-U1-F and C-U1-T independently) and the attribution travels
on the award's face.

**Dependency DAG — CLOSED; every node kernel-checked; nothing unproved.**

| node | status | author |
|---|---|---|
| Mathlib `Nat.descFactorial`, `Nat.succ_descFactorial_succ`, `Nat.le_induction` | Mathlib | — |
| `discriminant_factorization` | kernel-checked (`[propext, Quot.sound]`) | seat U1 |
| `discriminant_in_K_matches_in_d` | kernel-checked (`[propext, Quot.sound]`) | seat U1 |
| `discriminant_nonpos_iff` (two-sided region characterisation) | kernel-checked | seat U1 |
| `S_quadratic_nonneg_of_discriminant_nonpos` | kernel-checked | seat U1 |
| `S_holds_of_discriminant_nonpos`, `S_holds_on_region` | kernel-checked | seat U1 |
| `P_base_s1` (even `K`, literally `3d ≤ 2m+2`) | kernel-checked (`[propext, Quot.sound]`) | seat U1 |
| `P_base_s2` (odd `K`) | kernel-checked | seat U1 |
| `P_induction_step` | **kernel-checked TWICE** | **C-U1-F** (`P_induction_step_critic`, ~25 lines, toolkit-free) and **C-U1-T** (same name, seat's route, needs `descProd_nonneg`) |
| induction principle over hard indices, both parities | **kernel-checked TWICE** | **C-U1-F** (`P_all_hard_even`, `P_all_hard_odd`), **C-U1-T** (`P_holds_critic`, `P_holds_critic'`) |

All of it was **rebuilt and re-audited by the U adjudicator** in the foreground
with the shared Mathlib bound by symlink.

**Pricing against Sonnet 5 at repair limit 2.** The unformalised mathematical
work is **nil**: the formalizer transcribes two independent, already
kernel-checked proof scripts into one governed project and runs the governed
workflow (frozen theorem contract, independent informal audit, kernel/axiom
receipt, independent fidelity attestation, canonical close). **Repair limit 2 is
ample.** Dispatch instructions: hand **C-U1-F's toolkit-free proof as primary**
and C-U1-T's as fallback; the seat's `descProd` toolkit is correct,
self-contained and **not load-bearing**, so it must not be a dependency; the
correct shipped-file literal is **12 of 13**, and the `sorry` at line 381 is
closed by both critics; the axiom sentence must read "**within** the three
standard axioms" (three declarations use only `[propext, Quot.sound]`).

### CYCLE 6 TERMINAL STAGE 7 AWARD CANDIDATES (named as such; not funded at this close)

**Candidate B — the `Bd` tail via the Catalan gap, corrected form (route
`U-C6-02`); the Cycle 6 FLAGSHIP.** *Statement*: `Bd(r,r) < 0` for every `r ≥ 6`,
with the **ranged** `Bd(r,k) = D(2r−1,k) + Σ_{a=1}^{6} C(6,a)·max(0,
max_{0≤b≤2r−1−a} D(b,k−a))` and `D` typed over **ℤ**. Thirteen-node DAG: node (12)
`Γ(6,k) > 0 (k ≥ 12)` is an **imported governed formal award**; C-U2-T's twelve
kernel-checked theorems cover the polynomial core of the sign law, the real form
of the peak bracket, the `g_c` jump bound, the `(*)` step scaling and the three
precondition lemmas. **Not kernel-checked** (the U adjudicator's own list): the
closed form (1), the `Nat.choose`-ratio half of (2), the argmax (3), the row
ratio (5), the Catalan identity (6), the `(**)` form of (7), the assembly
(8)–(10) and the finite layer (13) — the majority of the chain. *Why not now*:
the risk is concentrated in (1)+(3), the assembly is real work, and a Sonnet
formalizer at repair limit 2 facing that many unproved nodes is a poor bet for a
single close, whereas route `U-C6-02` can
pre-build the fragments and hand the gate a near-closed DAG. **Mandatory: never
dispatch `D_unimodal_peak`; use `N(g_c) ≤ 4g_c − 5`; the sign law is
unconditional; the contract is for `r ≥ 6`, not `15 ≤ r`.** *What it would buy*:
**a second formally verified input of `E993-R25-FOURTH-BAND-CLOSE-ALL-R`**, at
900 kernel evaluations, largest `|D| = 1,485,800`, no `native_decide`. (Candidates
B and C are the two contenders for that second link; whichever lands first is the
first one other than the matching half.)

**Candidate C — the cover-fiber/Hall carry step, standalone (route `F-C6-03`).**
*Statement*: for every finite simple graph `F` of order `2r+5` with a vertex cover
of size 6 and `ν(F) = 6`, `Δ_k(F) − Δ_{k−1}(F) ≤ Bd(r,k)` for **every integer
`k`**. Stable statement — yes. Closed DAG — yes: the cover-fiber partition
identity, the König saturation lemma, the clamp; **no finite check and no
horizon**. Materiality: a **fixed-band ingredient, named as such**, which would
take the band's closure from one verified link to two. *Why not now*: **zero Lean
fragments exist** — the entire DAG is proved informally and unformalised, and
Mathlib's Hall/matching plumbing is the kind of work that exhausts repair limit 2
without a prepared project. *Debt to name*: whether the ranged `max` inside `Bd`
admits a kernel-decidable form at the ranks the band needs, without
`native_decide`.

**Candidate D — the sharpened uniform forest order bound (route `T-C6-02`).**
*Statement*: for every finite forest `G` and every `k ≥ 2`,
`Δ_k(G) < 0 ⟹ |V(G)| ≤ k² + k + 3` (`N*(1) = 4`). **Uniform in `k` with an
explicit closed-form threshold**, and it **strictly sharpens a formally verified
award** for every `k ≥ 3`, so materiality is not in doubt and the Lean
infrastructure for the weaker award already exists in this run's corpus. DAG:
Hunter's inequality (T1, proved in-run, elementary and Lean-sized) → the exact
adjacent/disjoint pair values → the `(e,c_e)` admissible-range and monotonicity
lemmas → the reduction to `c_e = min(e, n−e)` → the closed form. **Closed except
one step**: that `min_e H(n,k,e,min(e,n−e))` is attained at `e = n−1`, `c_e = 1`.
C-T3-U supplies a cubic `g(n,k)` evaluated symbolically at `k²+k+3` and `k²+k+4`
with a monotonicity argument above, verified `k = 2..20`, `n = k+3..400` with zero
mismatches; C-T3-F verifies the argmin only to `k = 12` and explicitly does not
prove it. **Not Lean-eligible today; the missing step is exact and small.**
Mandatory scope: an order bound is **not** a no-recovery statement, and this must
never be bundled with the `x ≤ 4` closure or described as improving the existing
award (it sharpens it).

**Candidate E — the `τ = 5` small-rank closure (route `U-C6-03`).** *Statement*:
for every finite forest `F` of order 15 (resp. 17) with a vertex cover `C`,
`|C| = 5`: `21 ≤ Δ₄(F)` (resp. `42 ≤ Δ₅(F)`); with the padding lemma, the same
under `τ(F) ≤ 5`; the five-cell version adds orders 9, 11, 13 with `+9, +5, +9`.
Frozen card-free ENTRIES 165–168, 172, 58/59, **174**, **177**, **178** are
liftable verbatim; the seat's two card-5 lemmas and **both critics' finite cores**
are kernel-checked. **Remaining: assembly plumbing (i)–(vi) of C4 above, plus the
padding lemma and the `cover_rank_bound` rename.** *Why not now*: C-U4-T
attempted exactly the assembly and did not land it within budget — the honest
predictor for Sonnet 5 at repair limit 2. At the **Cycle 6 close** it is
responsible **provided** the dispatch pre-specifies (i)–(vi) by frozen ENTRY
number, hands over both critics' files, and states the padding lemma. It is the
most material forest-side statement available: it formalises the small-rank half
of `c(5) = 5`, which the registry's own `cycle4_note` names as the only open part.

### REFUSED — no award attempted, with the reason

- **Extended Corollary F as a whole.** Refused, sustaining the F adjudicator.
  Stable statement yes (and after F1 its `d ≤ 11` hypothesis is known **sharp**
  rather than heuristic), **closed DAG no**: two unwritten proof nodes (the valley
  minimum's minimality half; the above-threshold lower-rank node 8b), four
  untouched standard graph-theory nodes, an unwritten reduction at node 8, and a
  finite check with **no `Fintype`/`Decidable` instance** over 71 cells and up to
  6,188 profiles per cell with the `min(0,·)` clamp baked in. **A Sonnet
  formalizer at repair limit 2 would exhaust its budget on node 3 alone.**
- **The arithmetic spine** (valley Pascal step + valley minimum + the `ℤ`-form
  empty-fiber identity + the termwise domination). Its DAG is closed today but for
  one sign lemma and every other piece is already kernel-checked by the seat or a
  critic — **but it is a chain of binomial and Catalan identities with no
  statement about forests of its own. Materiality fails (B3 above).** It is
  **Stage 7 input material** and must be handed to whoever takes the larger
  contract.
- **Theorem C (the top-order thin classification).** Stable statement, closed
  self-contained DAG, unconditional, and genuinely a statement about trees — it
  clears two of check 6's three tests. **Materiality is modest: it classifies one
  order of one family. I rule it does not clear the bar for a governed award**
  and name it as input material.
- **`Δ₃(F) > 0` for forests of order `≥ 12`.** **Do not fund as an award at either
  close.** The obstruction is not unfinished proof work but an open **design**
  question: encoding "every forest of order `n` up to isomorphism" as a
  kernel-checkable object, even at 76 classes. Fund the design question as a route
  (`U-C6-04`). The pendant identity alone is folklore and would be a repackaged
  lemma.
- **F2's refutation.** A refutation is an exhibited graph with its hypotheses
  reproduced by exact counts; the run's practice is to **register** refutations,
  not formalise them. No gate needed.

### Registrations and registry scope updates the controller should make at the close

Every `E993-R25-…` key is **run-local**; `formal_award: false` unless stated. Per
gate ruling 8, **nothing first composed by an adjudicator or by this synthesis is
proposed for registration** except R1, which has had its second read.

| # | key / target | statement (exact) | scope | status | grade | attribution |
|---|---|---|---|---|---|---|
| **R1** | **NEW `E993-R25-G1-RESIDUAL-D5-SLICE`** (Composition C) | Every exact ordinary G1 tuple with residual order `\|U\| = 2p+1` satisfies `Δ_{p−2}(U) ≤ 0`. | The second reader's proposed scope **verbatim**, with **two amendments of mine**: (a) the consequence sentence now reads *"with the registered `d' = 2` and `d' = 4` slices and the `d' = 3` slice, the Tier 2 residue is every `d' ≥ 6` plus the single cell `p = 6` at `d' = 3`"* — the `d' = 3` conditionality on an unformalised external hypothesis is **DISCHARGED** by this cycle's T-orientation ruling; (b) the two repairs travel on the face: **finiteness of `U` comes from guard 9, not guard 1**, and **`p ≥ 3` comes from guard 10 alone**. Register by the **equation `\|U\| = 2p+1`**, not by a subtraction. `FIXED-SLICE d' = 5` only; guards 2–8 inert; no part of the grade may be sourced to `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`. | VERIFIED | `proved_informal`, capped by the band's weakest link | Composition first stated by the Cycle 4 synthesis; **independent second read `confirmed_with_repairs`** (report digest `4ffa57d4…`) |
| **R2** | **NEW `E993-R25-BAND-CARRY-STEP-HALL`** | For every finite simple graph `F` of order `2r+5` with a vertex cover `C`, `\|C\| = 6`, and `ν(F) = 6`: `Δ_k(F) − Δ_{k−1}(F) ≤ Bd(r,k)` for **every integer `k`**, with `Bd` the **ranged** object. | `ν` enters once, as the numeric equality producing the `C → B` bijection; `τ = 6` fixes `C(6,a)` and `\|B\| = 2r−1`; `d = 5` enters only through the order; **`x(F) < r` enters nowhere; acyclicity enters nowhere**; `ν = τ` is proved load-bearing by an explicit `ν < τ` control. No horizon. | VERIFIED | `proved_informal` | derived by **seat F3**; exhaustively corroborated by C-F3-T, C-F3-U and the F adjudicator; the `ν = τ` control is C-F3-U's |
| **R3** | **NEW `E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`** (Lemma T) | With `E(n,k) = C(n,k+1) − C(n,k)` (zero-extended): for every `k ≥ 0` and every `n ≥ 2k+2`, `E(n,k) ≥ Cat_{k+1}`, with **equality exactly at `n = 2k+2`** and `E(·,k)` strictly increasing on `n ≥ 2k+2`. | Binomial/Catalan integers; **no graph content**; the return's "increment `> 0` for `n ≥ 2k−1`" is wrong (exactly 0 at `n = 2k−1` by symmetry; strictness begins at `n = 2k`) — not load-bearing, but the stated threshold is corrected. | VERIFIED | `proved_informal` | seat **F3**; verified independently by both F3 critics and the F adjudicator (`k = 0..79`, `n = 2k+2..2k+41`; 0 violations, exact equality 80/80) |
| **R4** | **NEW `E993-R25-G1-RESIDUAL-D3-SLICE`** | Every exact ordinary G1 tuple with residual order `\|U\| = 2p−1` satisfies `Δ_{p−2}(U) ≤ 0`, for every `p ≥ 3`. | `FIXED-SLICE d' = 3` only. **Theorem-grade at every `p` except `p = 6`**, where it is **bounded computation** inherited from the matching band's live cell `(d,r) = (3,4)`. Forest-restricted and **literature-free**: the Basit–Galvin dependency is DISCHARGED for this slice at every rank; the graph-general `E993-GRAPH-SECOND-WIDE-CROSSING-SIGN` still carries it and any citation of it must. Guard 10 is `x(U) < p−2` verbatim (the same link the Composition C second read verified). No transfer to Tier 2. | VERIFIED | `proved_informal` (bounded computation at `p = 6`) | seat **T4**'s chartered deliverable; both halves re-proved uniformly by **both T4 critics**; T adjudicator verified `Γ(3,k)`, the `k = 2` identity, the `r ≤ 2` vacuity and the full forest sweep to order 15 |
| **R5** | **NEW `E993-R25-HUNTER-SPANNING-TREE-INEQUALITY`** | For finite sets `A_1..A_m` and any spanning tree `T` on the index set: `\|⋃A_i\| ≤ Σ\|A_i\| − Σ_{(i,j)∈T}\|A_i ∩ A_j\|`. | General set systems; no graph, no horizon; **no source vendored**. | VERIFIED | `proved_informal` | **seat T3** (seat-derived); adjudicator read the induction line by line and brute-forced 2,410,945 pairs |
| **R6** | **NEW `E993-R25-SECOND-ORDER-TWO-SIDED-CEILING`** | For every finite forest `G`: `Δ₄(G) < 0 ⟹ \|V(G)\| ≤ 19` and `Δ₅(G) < 0 ⟹ \|V(G)\| ≤ 29`. | **FIXED-RANK, named as such**; the `(e, c_e, degree multiset)` parameter space is **proved** complete (a proved superset); the tail is supplied by the formally verified `(k+1)²` award. **Not a no-recovery statement.** | VERIFIED | `proved_informal` | **critic-derived** (C-T3-U, C-T3-F); adjudicator built the certificate independently and reproduced every margin at `k = 4, 5` |
| **R7** | **NEW `E993-R25-FOREST-ORDER-BOUND-SHARPENED`** | For every finite forest `G` and every `k ≥ 2`: `Δ_k(G) < 0 ⟹ \|V(G)\| ≤ k² + k + 3` (with `N*(1) = 4`). | Uniform in `k`, explicit closed form; **one step named open** (the argmin at `e = n−1, c_e = 1`). **Strictly sharper than the formally verified `(k+1)²` for every `k ≥ 3`, by exactly `k−2`** — write it on that comparison, **never as a weaker sibling and never as "improving the award"**. An order bound is **not** a no-recovery statement; never bundle with the `x ≤ 4` closure. | VERIFIED | `proved_informal` with one named open step | seat T3's computation; **closed form and termination critic-derived** (C-T3-U, C-T3-F); adjudicator recomputed `k = 1..12` |
| **R8** | **NEW `E993-R25-MA-CATALAN-COMPARISON`** | `M_a(r) ≤ Cat_{r−1−a}` for `a = 1..6` and every `r ≥ 15`, with **no computational residue**; `r ≥ 15` is sharp (`M_6(14) = 3230 > Cat_7 = 429`). | Binomial/Catalan integers; fixed-band `d = 5` through the range `2r−1`; uniform in `r`; **never uniform in `d`**. | VERIFIED | **theorem, `proved_informal`, no horizon** | seat **U2** (chain); the two repairs **critic-derived jointly** (C-U2-T, C-U2-F); U adjudicator replayed end to end |
| **R9** | **NEW `E993-R25-D-ROW-STEP-SIGN-LAW`** | With `h(g) = D(2m−g, m)`: `m(2m−g)(h(g+1) − h(g)) = C(2m−g, m−1)(2m − g² + g)` for `0 ≤ g < m`, hence `sign(h(g+1) − h(g)) = sign(2m − g² + g)` **with no hypothesis on `N(g)`**; and the **integral** peak bracket `N(g_c) ≤ 4g_c − 5` at the argmax `g_c`. | Arithmetic of the integer function `g ↦ D(2m−g, m)`. **The name must not be read as unimodality of any independence sequence**: this is proved from a sign identity and imports no shape premise on any `i_k`. No horizon. | VERIFIED | **theorem, `proved_informal`** | **critic-derived** (C-U2-T and C-U2-F independently); adjudicator verified on 4,920 cells outside the return's declared domain |
| **R10** | **NEW `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`** | `Δ₃(F) > 0` for every finite forest `F` of order `≥ 12`; sharp at 11, where `P_11` is the **unique** minimiser (`Δ₃ = −14`). | **FIXED-RANK (`k = 3`), uniform in order, no horizon**; `ν`, `τ` enter nowhere; acyclicity at exactly two points; `x(F) < r` never assumed (`x ≥ 4` is a corollary). **Register as the FIRST PROOF of an in-run recorded statement, NOT as a new statement, and NEVER as a sharpening of `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`.** The excess reading is a translation of a fixed-rank fact and is **not** a `d`-band result. | VERIFIED | `proved_informal` | seat **U3** (mechanism and proof); the **edgeless repair** and the **uniqueness** critic-derived (both U3 critics); the pendant identity kernel-checked twice by the critics |
| **R11** | **NEW `E993-R25-CARD5-JOINT-BUDGET-CELLS`** (key verified absent) | For every finite forest of order 15 with `τ ≤ 5`: `Δ₄ ≥ +21 > 0`; of order 17 with `τ ≤ 5`: `Δ₅ ≥ +42 > 0`; and by the same argument all **five** registered `τ = 5` cells close with `+9, +5, +9, +21, +42` at orders 9, 11, 13, 15, 17. Operative form: the **affine certificate `f(d) ≥ 42 − 14d`**, exactly tight at both chartered cells. | **FIXED-CELL** (one `(r,k,order)` triple each), **not uniform in `d`**; `τ ≤ 5` load-bearing and **cover-essential at orders 15 and 17 only**; the constraint `Σ crossdeg ≤ order − 1` named **load-bearing** (removing it degenerates the refinement exactly to the size-only bound); the unstated **padding lemma** (`τ ≤ 5 ⟹ a card-5 cover exists`) named as required. Carries the **ballot identity**: the size-only card-5 bound at the top-rank cell **is `Γ(5,k)` identically**, so `K(5) = 6` and "size-only closes from order 19 up" are one fact and the small-rank list is exactly `k ∈ {1,…,5}`. A second, non-census derivation of instances of a registered VERIFIED claim, whose status it does **not** change. | VERIFIED | `proved_informal` | two cells **seat U4**; the **five-cell reach critic-derived** (both); the **LP-dual certificate critic-derived jointly** (C-U4-F, C-U4-T) and formalised independently by both |
| **R12** | **NEW `E993-R25-PENDANT-CAP-TAU-7`** | The minimum of `Δ_{r−1}` over the padding simplex of any connector-only `(7,7,r)` skeleton is attained at some `p` with `Σp ≤ 45`, **uniformly in `r`**. | Fixed-band `d = 7`, `τ = ν = 7`, connector-only stratum. **Honest limit on its face: this is the charter's alternative closing condition in kind, NOT in usable strength** (`Σp ≤ 45` still leaves `C(52,7) ≈ 1.34 × 10⁸` paddings per class). | VERIFIED | `proved_informal` | **critic-derived (C-T2-U)**; adjudicator checked the Pascal step and the termination bound by hand; the 1,346-move check accepted on shipped evidence |
| **R13** | **NEW `E993-R25-THIN-TREE-LOGCONCAVE-TAU-LE-9`** | No thin tree with cover number `τ ≤ 9` has a log-concavity failure at any rank; a fortiori none has an in-window failure and none recovers. | Unconditional, **no horizon** — the band `2τ..3τ−1` is *forced*, so the case analysis is complete. | VERIFIED | `proved_informal` | **critic-derived (C-F4-U)**, low band also C-F4-T; adjudicator reproduced two rows by brute force and the whole above-25 slice |
| **R14** | **NEW `E993-R25-THIN-TREE-LOGCONCAVE-TAU-LE-10`** | No thin tree with `τ ≤ 10` has a log-concavity failure at any rank. | **CONDITIONAL on the registered order-`≤ 25` census** (`E993-UNIV-TREE-TRS2`, `smallest_witness_order: 26`), which must travel on its face. | CONDITIONAL | `proved_informal` modulo the named census | **critic-derived (C-F4-U)** |
| **R15** | **NEW `E993-R25-THIN-TREE-TOP-ORDER-CLASSIFICATION`** (Theorem C) + **`E993-R25-THIN-FOREST-NO-RECOVERY-TAU-LE-10`** | (C) For every `τ ≥ 2`, the thin trees of cover number exactly `τ` and order exactly `3τ−1` are exactly the once-subdivided free trees on `τ` vertices with one pendant leaf per original vertex; the correspondence is a bijection of isomorphism classes, so there are exactly `t(τ)` of them. (Forest corollary) Every forest all of whose components are thin with `τ ≤ 10` is log-concave at every rank, hence has **no recovery at any rank**. | (C) unconditional, structural, no horizon. (Corollary) rests on the two VERIFIED TRS2 claims and inherits R14's conditionality through `τ ≤ 10`. | VERIFIED / VERIFIED-with-named-input | `proved_informal` | **critic-derived**: (C) C-F4-U with C-F4-T deriving the same closed form independently, adjudicator-verified at `τ = 4..11`; the corollary C-F4-T |
| **R16** | **STATUS `E993-R25-KADDITION-CLOSURE-X-LE-4`** | statement unchanged | **CONDITIONAL → VERIFIED.** Both undischarged dependencies addressed: Hunter's inequality **proved in-run** (R5) and the finite scan replaced by a certificate whose parameter space is **proved** complete. **Remaining input named on its face: the order-`≤ 21` in-run forest census** (8,355,831 classes; established in Cycle 4, replayed byte-identically by both Cycle 4 critics; **not re-run this cycle by anyone**). Smallest open rank is now `x = 5`, residue **orders 22–29** (≈1.9 × 10¹⁰ classes), down from 22–31/22–33. | VERIFIED | `proved_informal` | **critic-derived** (C-T3-U's composition, C-T3-F concurring); Hunter's half seat-derived; adjudicator re-derived end to end |
| **R17** | **STATUS `E993-R25-FOREST-DELTA2-POS-ORDER-9`** | statement unchanged | **OPEN → VERIFIED** (ruling B1). Certificate: C-T4-F's cover-free identity `i₃ = C(n,3) − \|E\|(n−2) + Σ_v C(d_v,2)` with `\|E\| ≤ n−1`, giving `Δ₂ ≥ (n−1)(n−2)(n−9)/6` with the equality case impossible in a forest; T adjudicator verified by hand; two further independent in-run derivations (seat U3 and both U3 critics) belong on the certificate. **On its face: `formal_award: false`; the compiled U3 fragment is NOT a governed award and does not raise the grade; the U adjudicator's contrary reading of the status field is recorded and set aside on registry practice.** | VERIFIED | `proved_informal` | **critic-derived (C-T4-F)**, with seat U3 and both U3 critics independently |
| **R18** | **SCOPE ERRATUM `E993-R25-STRATUM-DEPTH-COROLLARY-F`** (controller erratum a) | statement unchanged | Replace *"the `d ≤ 11` boundary is a horizon of computation"* with: **`d ≤ 11` is a PROVED SHARP ceiling at `k = r−2`** — the `τ = 12` joint budget is strictly positive at all 37 live ranks `r = 7..43` and `τ = 13` fails at nine consecutive ranks. **Two horizons ride on the sharpness and must appear on the face**: (a) the degree cap — the sweep enumerates profiles with `d_c ≤ 6` while the edge budget permits `≈ 2r+11`; stability **attained** at `Dmax = 10`, **not proved**; the allocation's "provably exact degree cap `2r−2k+2`" (= 6 at `k = r−2`) is the right citation; (b) the `r > 600` per-fiber tail carried on `E993-R25-CATALAN-DOMINANCE-RANK-R-MINUS-2`. Also record the **corrected feasibility pricing**: 71 non-vacuous layer-1 cells, **195,189** sorted profiles at cap 6, worst cell **6,188**; layer 2 **1,185** at cap 8; largest kernel `Nat` **25 digits** (`C(85,42)`). | VERIFIED (unchanged) | unchanged | sweep **critic-established** (C-F2-T, C-F2-U) and **adjudicator-verified**; pricing C-F1-T/C-F1-U with the F adjudicator resolving the two populations |
| **R19** | **NEW `E993-R25-STRATUM-COROLLARY-F-D12-REFUTED`** | The extension of `E993-R25-STRATUM-DEPTH-COROLLARY-F` beyond `d ≤ 11` to `d = 12` (`τ = ν = 13`) is **FALSE at `k = r−2` for every `r ∈ {20,…,28}`**, with explicit witness forests at every one of those nine ranks; on the witnesses `x(F) = r−2`, so the conclusion `x(F) ≥ r−1` **also fails**; neither recovers. | Witness-backed refutation of an **EXTENSION beyond a registered scope**; **the registered claim (`d ∈ {2,…,11}`) is untouched and is not impeached**. **The `k = r−2` qualifier is mandatory.** **No Tier 1 contact**: both witnesses are unimodal and log-concave. The failure **widens** with `d` (band `r = 22..261` at `τ = 14`; open past `r = 400` at `τ = 15..20`); the correct onset threshold is `r ≥ (τ(D−1)+2)/2`. `r = 19` at `τ = 13` stays **OPEN**, narrowed to `≥ +89,857,131` under two controlled null searches with an informative `r = 20` control. | **REFUTED** | exact witnesses | seat **F2** for `r = 20, 25`; `r = 21..28` **critic-attributed** (C-F2-T closed-form family; C-F2-U exhaustive profiles); both witnesses rebuilt by both critics and by the F adjudicator, the `r = 25` one from the closed form alone |
| **R20** | **SCOPE `E993-R25-CLAMPED-GREEDY-OPTIMALITY`** | statement unchanged | Record that the **`j = r+1` column lies outside the reduced C1/C2 system** and is separately discharged: the alive `b`-constraint `(r+1)·t_P ≥ 2(m−r)` exists whenever `m > r`, is formed by neither the recursion, the optimality induction nor the shipped generator, holds with **zero failures at every band cell with `d ≤ 400`**, and is **proved** on the binding band-bottom family with exact slacks `1 + 3/(d²−4)` (even `d`) and `1 + 1/(d−1)` (odd `d`). **No registered statement is impeached.** Also record the extended attained horizon `d ≤ 400` (79,600 cells). | VERIFIED (unchanged) | unchanged | **critic-derived (C-T1-U)**; adjudicator-confirmed in full |
| **R21** | **SCOPE `E993-R25-BD-TAIL-NEGATIVE`** | statement unchanged | The recorded finite residue `r ∈ [6,49]` is **superseded**: `r ≥ 15` is a theorem with **no computational residue** (R8) and `r ∈ [6,14]` is **900 exact evaluations**, largest `\|D\| = 1,485,800`, kernel-decidable without `native_decide`. Add the second, Lean-lighter DAG via `Bd(r,r) ≤ −Γ(6,r−1)` with the **formally verified** `Γ(6,k) > 0 (k ≥ 12)` as its only non-elementary input. | VERIFIED (unchanged) | unchanged | seat **U2**; repairs critic-derived jointly; U adjudicator replayed to `r = 400` |
| **R22** | **SCOPE `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`** (controller erratum b) | statement unchanged | Replace the five-vs-four inconsistency with the **exact wording of ruling B2**. Add: the finite residue **collapses to five cells, all at `τ = 5`, all at `r = k+1`**, and the reduction is **exact, not merely sufficient**; the corrected cell minima of record are `min Δ_{r−1} = 39, 56, 56, 43` at orders 11, 13, 15, 17 (and `min Δ₁ = 19` at order 9); the honest accounting of the Cycle 5 advance is **`11 → 5`**, never "8 → 5"; the general half's algebra is now **derived** (R2, R3) and its finite check is **critic-derived and adjudicator-verified, NOT the seat's**; acyclicity is load-bearing **exactly at the five `τ = 5` cells and nowhere else**, matched by the 13-vertex general-graph counterexample at the identical cell. | VERIFIED (unchanged) | unchanged | as recorded in C4 |
| **R23** | **SCOPE `E993-R25-SINGLE-HUB-NOT-UNIFORMLY-WORST`** | statement unchanged | **Untouched**: REFUTED at exactly three exhaustive cells, "no wording beyond three exhaustive cells", all three re-confirmed and no restricted converse proposed. **An "extremality at `τ = 7`" line in any downstream text would be an unlabelled instance of the restricted converse and is forbidden.** | REFUTED (unchanged) | unchanged | — |
| **R24** | **CANONICAL FIGURES (allocation, not the registry)** | — | Upgrade the `(7,7)` table's `r = 15` row from **best-found** to **exact within the connector-only stratum**: `−1,612,675`, hub `p ≡ 3` the strict unique minimiser over all **128** connector-only classes (134,808 labelled), runner-up `−1,113,530`; rows `r = 8..14` stand as full-census cell minima; rows `r ≥ 16` remain best-found; **the 954 cover-internal-edge classes at `r ≥ 15` are the residue** and the connector-only stratum is **128**, not 1,082. | — | bounded computation at three ranks | **critic-derived (C-T2-F, C-T2-U)**; `r = 15` **adjudicator-re-derived exhaustively** |
| **R25** | **HYGIENE ERRATA** | — | (i) The name collision `Erdos993G1.ThirdWide.cover_rank_bound` (U4's card-5 lemma) with frozen **ENTRY 170**'s card-4 lemma — rename before any Stage 7 dispatch. (ii) `control/C5-STAGE3-READ-BOUNDARY-DISCLOSURES.json` is incomplete with respect to one self-disclosed boot read; the Cycle 6 brief should **enumerate the authorized boot reads exhaustively** rather than leaving "boot VerityOS first" to the root task-type map. (iii) A grant/dispatch conflict allowed one critic to read material restricted to another lineage; the critic disclosed it and nothing depends on it — a **controller-side drafting matter**, not a critic defect. (iv) The species "a `find`/`grep` rooted above a seat's grant" has occurred twice; the Cycle 6 brief must forbid it in terms. (v) An inventoried payload carrying **float wall-clock fields** must be re-emitted without them (its digest cannot otherwise be regenerated by replay). (vi) The construction-count-as-isomorphism-class species (erratum f, third occurrence) warrants a `C3-CENSUS-ERRATA`-style record. (vii) `E993-R25-D3-LOW-COVER-WEAK-NONDECREASE` was never registered and **must never be**. | — | — | — |

---

## Progress and stop-gate ruling

**The stop gate is armed at this close and I apply it explicitly, condition by
condition.**

**Decisive event 1 — a verified Tier 1 or Tier 2 theorem. NO.** Tier 1 and Tier 2
are both OPEN and both untouched by all twelve routes. Every advance this cycle
is fixed-band, fixed-rank, fixed-cell, fixed-slice or stratum-exhaustive, and
each is named as such above. Nothing is uniform in `d`. **The `d' = 3` discharge
and Composition C are `proved_informal`, not verified, and a slice is not the
tier at any grade.**

**Decisive event 2 — a verified reduction strictly shrinking the remaining class.
NO.** The cycle does produce **real reductions**: the Tier 2 residue narrows from
`{d' = 3 conditional on an unformalised external hypothesis, d' = 5
unregistered, d' ≥ 6}` to `{d' ≥ 6, plus one cell}`; the `c(5) = 5` finite
residue collapses to five cells and the reduction is exact; the above-threshold
Corollary F region collapses to 95 explicit evaluations; the `x = 5` residue
narrows from twelve orders to eight; the `τ ≤ 12` in-window question narrows to
ten orders. **But every one of them is `proved_informal` or bounded computation,
and the gate's word is *verified*.** None of them qualifies.

**Decisive event 3 — an exact counterexample. NO.** The nine `τ = 13` witnesses
are exact counterexamples to an **EXTENSION beyond a registered scope**, not to
any tier: both computed witnesses are unimodal and log-concave with minimum
log-concavity defects `+779` and `+1225`, neither recovers (`Δ_r < 0`), and
neither sits near the Kadrawi–Levit / Galvin fence. **No Tier 1 contact
whatever.** Zero recovering forests exist anywhere in the run's record.

**The `x = 4` closure, weighed exactly.** It closes one rank of a **Tier 1
sub-target** (the `K₁`-addition target) unconditionally and discharges a
literature dependency by proof. It is a genuine closure and it is
`proved_informal` with an in-run census input. **It is not a Tier 1 theorem and
not a decisive event.**

**Plateau. NO — and the condition could not be met on this record.** A plateau
requires **evidence of no material progress over two consecutive cycles**, never
the absence of a headline proof. Cycles 3 and 4 both made material progress by
the gate's own finding, so the two-cycle window cannot close at this cycle even
in principle. Independently, all three adjudicators record
`material_progress: yes` and `orientation_plateau: no`, each on evidence it
**verified itself** rather than accepted on report: a named literature dependency
discharged by proof; a registered CONDITIONAL claim's residue emptied; a
registered OPEN claim proved; a Tier 2 slice regraded from conditional to
informal theorem at every rank but one and its external hypothesis gone; a
refutation with explicit witnesses at nine consecutive ranks converting a
registry "horizon" into a proved sharp ceiling; two carried links of the `d = 5`
band moved from recorded to derived with the reason acyclicity bites *explained*
rather than observed; three new thin-tree theorems and a frontier localised
between `τ = 11` and `τ = 12`; a previously open Lean node closed twice over so
that an award-ready contract exists; a registered theorem's Stage 7 price cut from
13,596 evaluations at ~10²⁶ to 900 at ~1.5 × 10⁶; five registered cells moved from
census to algebra with the finite core kernel-checked twice; a new sharp forest
theorem with its enabling identity formalised twice.

**Against that, honestly:** two Theorem-graded claims fell, one strategy was
refuted, one shipped Lean contract was a false proposition, one route's entire
population reporting was wrong, and **the orientations' own headline objects did
not move** — the Tier 3 schemas, the band `d < r < K(d)`, Tier 1 and Tier 2 are
exactly where Cycle 4 left them. That is the counterweight, and it is why the
Cycle 6 portfolio below is aimed at closures that are now one step away rather
than at the schemas.

```text
material_progress: yes
plateau: no
```

**The gate's continuation conditions are met on (b) and (c).** (b) new proved
reductions of the remaining class — the `c(5) = 5` residue collapse, the
above-threshold reduction, the Tier 2 residue narrowing; (c) a candidate **ready
for the Lean gate** — Award Group A, whose DAG is closed and every node
kernel-checked. **(a) is NOT met**, and I say so plainly: **no new actual-graph
uniform mechanism whose unresolved dependency is strictly weaker than Tier 1 was
produced by any of the twelve routes.**

---

## Cycle 6 route portfolio

**Cycle 6 is the charter's LAST cycle.** Twelve routes, 4T / 4F / 4U,
deduplicated against one another, consistent with the three adjudicators'
next-route allocations. The controller's own terminal obligations (the
publication packet under Ashton's pre-authorization; the chartered controller
review) are **not routes**.

### Symbol table of record (every symbol used above and below)

`i_k(F)` = the number of independent `k`-subsets, `i_0 = 1`, zero beyond the
independence number, zero-extended to negative integer indices.
`Δ_k(F) = i_{k+1}(F) − i_k(F)` for integer `k`; `Δ_{−1} = 1`.
`x(F)` = the least natural `k` with `Δ_k(F) < 0` — the **first strict descent**
(a plateau is not a descent).
`ν(F)`, `τ(F)` = matching and vertex-cover numbers; `τ = ν` for forests (König),
`α = |V| − ν`.
`d = |V(F)| − 2r` = the excess; bands `d = 2, 3, 4, 5`.
A **recovery** at rank `r` means `x(F) < r` and `Δ_r(F) > 0`.
`Cat_n` = Catalan numbers.
`C(n,k)` = binomial coefficient, zero-extended.
`E(n,k) = C(n,k+1) − C(n,k)` (zero-extended) — the empty-fiber/edgeless
difference.
`D(b,m) = C(b,m+1) − 2C(b,m) + C(b,m−1)` (zero-extended).
`Γ(τ,k) = Cat_{k+1} − Σ_{j=1}^{τ} C(τ,j)·Cat_{k−j}` (zero-extended).
**Ranged** `Bd(r,k) = D(2r−1,k) + Σ_{a=1}^{6} C(6,a)·max(0, max_{0 ≤ b ≤ 2r−1−a}
D(b,k−a))` — the range `b ≤ 2r−1−a` is the König/Hall consequence on the
`ν = τ = 6` class and is **load-bearing**; an unranged `Bd` is never the object of
record.
`M_a(r) = max_{0 ≤ b ≤ 2r−1−a} D(b, r−a)`.
`m(d) = ⌈3d/2⌉ − 1` (the matching threshold); `c(d) = min(d,5)` (the cover
threshold).
**`K` names THREE different things in this run and the overload is flagged, not
resolved:** (i) `K(d) = 2m(d) − d` (`= 2d−2` for even `d`, `2d−1` for odd `d`) —
the matching branch's upper band endpoint; (ii) `K(τ)` — the Catalan-gap
threshold, `K(1..7) = 0,2,3,4,6,12,70`; (iii) `K = 2m − d` — the certificate
system's stratum parameter, where `m` is a matching **size**. **Never read one
against another.**
`β(d)` = the `a`-budget margin of the clamped-greedy certificate minimised over
the small-rank band `d ≤ r < K(d)`; `β_cell(d, α)` = the same minimum restricted
to the cell at band offset `α` (`α = 1` is the band top); `i*` = the crossover
index; `j* = α + i*` = the argmin stratum.
`R(τ)` = the least rank from which the per-fiber Catalan-dominance criterion holds
at rank `r−2` (`R(3..12) = 2,2,5,6,7,8,10,12,19,44`); `R_joint(τ)` = the same for
the JOINT cross-fiber budget; `PF(τ,r,k)` = the per-fiber budget at rank `k`;
`JB` = the joint cross-fiber budget; `ρ_S` = the Hall surplus of `S ⊆ C`.
`N*(k)` = the one-sided Hunter/Bonferroni order ceiling; `H(n,k,e,c_e)` = the
one-sided bound at `n` vertices, `e` edges, `c_e` components.
`g_c(m)` = the argmax of `g ↦ D(2m−g,m)`; `N(g) = g² + g − 2m − 2`;
`h(g) = D(2m−g,m)`.
A **thin** tree of cover number `τ` carries at most one pendant leaf per cover
vertex and has order in `[2τ, 3τ−1]`; `t(τ)` = the free-tree counting sequence
(A000055).
**G1 tuple**: `(T,v,s,g,p)` with `T` a finite tree, `v` a leaf, `s` its
degree-two support, `g ≠ v` the other neighbour of `s`, `p = x(T)+1`;
`A = T − N_T[v]`, `H = A − g`, `U = T − (N_T[v] ∪ N_T[g])` in **original closed**
neighbourhoods; **residual excess** `d' = |U| − 2(p−2)`, and `r := p−2`.

### T routes (prove)

**`T-C6-01 TOP-CELL-ONE-STEP-LEMMA`.** Prove the one-step comparison
`β_cell(d, α+1) > β_cell(d, α)`, which by induction on `α` gives top-cell
attainment outright with **no asymptotics anywhere**. The mechanism is in hand:
`j*` is `α`-invariant on the near-top range, and at the band top the trajectory
has the most steps to accumulate descent before reaching that critical stratum.
*Closes in one cycle*: **top-cell attainment as a theorem**, which with the
`j = r+1` constraint and any explicit uniform lower bound on the top-cell margin
closes the band `d < r < K(d)` — **the whole matching branch at threshold
`m(d)`**, and with it the live cell `(3,4)` and hence the last open rank of the
`d' = 3` slice. *Hands to the terminal close*: the exact `α` at which stratum
invariance fails (it does fail — spread 10 over the full band at `d = 400`) and
whether the induction survives past it.

**`T-C6-02 SHARPENED-ORDER-BOUND-TO-LEAN`.** Prove the single missing step of
Candidate D (that `e = n−1, c_e = 1` minimises `H(n,k,e,min(e,n−e))`), then take
`Δ_k(G) < 0 ⟹ |V(G)| ≤ k²+k+3` to the governed gate with Hunter's inequality as
its enabling lemma: frozen theorem contract, exact Lean statement, DAG with each
node's status, compiled fragments. *Closes in one cycle*: **a formal award that
strictly sharpens one of this run's own awards** — the first time the run's Lean
corpus would supersede itself. *Hands to the terminal close*: the `(n,k)` profile
at which the argmin argument or the Lean induction resists.

**`T-C6-03 RANK-5-RESIDUE-AT-THIRD-ORDER`.** Close `x = 5`, whose residue is
now exactly **orders 22–29** (≈1.9 × 10¹⁰ forest classes — a census is
unaffordable). The 2nd-order pairwise level is exhausted at 29 (margin `−585` at
`n = 29`, attained at the spanning tree). The named lever is a genuine
**3rd-order** Bonferroni term on triples of edge events, where acyclicity
constrains `|A_f ∩ A_{f'} ∩ A_{f''}|` far more than the pairwise level sees; the
cover-fibre/Hall sandwich is the fallback. *Closes in one cycle*: **`x ≤ 5`
closed**, leaving `x = 6` the smallest open rank of the `K₁`-addition target.
*Hands to the terminal close*: the smallest order at which the 3rd-order
certificate stops excluding, with the binding `(e, c_e, degree multiset)`.

**`T-C6-04 COVER-EDGE-STRATUM-AT-TAU-7`.** Attack the dominant residue of the
`(7,7,r)` cell: the **954 cover-internal-edge classes** at `r ≥ 15`, untouched by
the seat, both critics and the adjudicator. Two levers, both sharpened this
cycle: extend the pendant Cap Lemma from connector-only to cover-edge skeletons
(the Pascal step does not obviously use `F[C] = ∅`), and tighten the constant 45
toward the observed 21 by summing the `t = 1..7` marginal contributions in closed
form instead of forcing every term to one sign. Every object called a forest must
pass an acyclicity test in code, and the cell predicate `ν = τ = 7` must be tested
per configuration. *Closes in one cycle*: the `(7,7,r)` minima as **exact
full-census values** at `r = 15` and beyond, and the `(7,7,34)` closed-form sign
endpoint. *Hands to the terminal close*: the smallest `r` at which the cover-edge
stratum's minimum is not dominated by the connector-only one, with the competing
class.

### F routes (falsify)

**`F-C6-01 TAU-12-IN-WINDOW-DECISION`.** Finish the chartered `τ ≤ 12` question.
The residue is exactly **nine orders of `τ = 12` (26–34) plus order 26 of
`τ = 11`**, and every instrument exists: the transversal-matroid acceptance test
(so no rejected tree is ever built), two independent stdlib skeleton enumerators
(`τ = 12`'s 1,721,756 skeletons in 151 s), the base bound `τ + ⌊(τ−1)/2⌋`, and
Theorem C collapsing the top order to a closed form. Add attachment-orbit
deduplication by the skeleton's colour-automorphism group — the lever both critics
name and neither built. *Closes in one cycle*: a **complete** answer, which either
**lowers the standing `τ = 21` minimum — the single most consequential event
available to orientation F** — or closes the whole thin band and pins the frontier
at `τ ≥ 13`. *Hands to the terminal close*: the smallest `τ` at which
orbit-deduplicated attachment becomes unaffordable, and whether the
forest-of-several-thin-components case (untouched by anyone, and where
`6K₂ ∪ (2r−7)K₁` lives) is reachable by the same instrument.

**`F-C6-02 STRATUM-CEILING-AT-TAU-14-AND-THE-R19-CELL`.** Two objects on one
mechanism. (i) **Prove the `r = 19`, `τ = 13` cell** — exactly the rank at which
the uniform `(4^13)` profile is label-infeasible (`1 + 13·3 = 40 > N = 37`); the
structural identity `ρ_S = Σ_{c∈S} d_c − Σ_i (|H_i ∩ S| − 1)^+` with the surplus
constraint `Σ_i(|H_i| − 1) ≤ τ−1` is the right instrument and neither critic
completed it. A proof closes the last open cell **and** explains why `r = 20` is
the onset. (ii) **Settle the shape at `τ ≥ 14`**: whether the negative band ever
closes, and whether `Δ_k < 0` also occurs at ranks `k < r−2` on those strata —
slices nobody has tested. *Closes in one cycle*: the nine-rank refutation becomes
a **complete description of the stratum theorem's exact domain**. *Hands to the
terminal close*: the `τ` at which the closed-form single-hub family stops
attaining the joint bound, with the competing profile.

**`F-C6-03 BAND-CARRY-STEP-TO-LEAN`.** Take Candidate C to the governed gate:
the carry step as a standalone graph-general theorem, with the cover-fiber
partition identity and the König saturation lemma as its two nodes and the clamp
as a three-line lemma. Mathlib carries the matching/Hall infrastructure; the
`D`/`E` binomial algebra was exercised in the Cycle 1 Catalan award; there is no
finite check and no horizon. **State it as a fixed-band ingredient, never as
progress toward any tier.** *Closes in one cycle*: **a second formally verified
link of `E993-R25-FOURTH-BAND-CLOSE-ALL-R`** (this route and `U-C6-02` are the two
contenders; whichever lands first is the first other than the matching half),
leaving the cover half's five-cell residue and whichever of the two does not land.
*Hands
to the terminal close*: whether the ranged `max` inside `Bd` admits a
kernel-decidable form without `native_decide`.

**`F-C6-04 SLACK-REDUCTION-BEYOND-D-5`** *(re-scoped for deduplication against
`U-C6-03`, which owns the Lean formalisation of the five `τ = 5` cells)*. Two
deliverables, both informal. (i) **Harden and register what F3 actually
produced**: Lemma T with its exact tightness (R3) and Lemma H's tightness half
`b ∈ {2j−1, 2j}`, each with a shipped digested generator and an adversarial break
attempt with explicit forests — the part of the Cycle 5 charter that was left
undone (§1.5 was corroboration and §2.3 a confirmation sweep, not an attempt to
break either input). (ii) Because the mechanism of the cover half is stated
generally in `τ` while only the slack step is `d = 5`-specific, **test whether the
reduction survives at `d = 6, 7`**. *Closes in one cycle*: a first decision on
whether the slack argument is a `d = 5` accident or a **method** — the only
route in the portfolio that probes the cover branch's uniformity in `d`. *Hands
to the terminal close*: the excess `d` at which the slack `5−τ` stops isolating a
single rank, with the cell that breaks it.

### U routes (formal / structural)

**`U-C6-01 E1-COEFFICIENTWISE-IN-LEAN`.** Build on the now-complete scalar core
(Award Group A): formalise `N_j` (or its closed form) as a `Polynomial ℤ`-valued
object, the reflection identity **inside** it, the region fact `m ≤ K+1` as a
proved hypothesis rather than a side condition, the pairing bijection from hard
indices onto a subset of easy ones, and the term-sign lemma. *Closes in one
cycle*: `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY` itself as a Stage 7
submission; failing the polynomial layer, the strictly smaller **pairing half**
(identity + term signs), already settled numerically over 23,055 cells by a critic
and 4,364 in-region triples by the adjudicator. *Hands to the terminal close*: the
exact layer at which the polynomial encoding resists.

**`U-C6-02 BD-TAIL-LEAN-GATE`** *(the Cycle 6 flagship)*. Take Candidate B's
corrected DAG — **integral** bracket, **unconditional** sign law, `D` over ℤ,
`(**)` at `m ≥ 7` — import the `Γ` award, and discharge the `[6,14]` layer by 900
`norm_num`-scale evaluations. **The dispatch must not carry `D_unimodal_peak`.**
*Closes in one cycle*: a governed formal award for the band's arithmetic tail —
**a second formally verified input of `E993-R25-FOURTH-BAND-CLOSE-ALL-R`**, in a
race with `F-C6-03` for the first one other than the matching half — and with it a
reduction of that composition's weakest-link exposure. *Hands to the terminal
close*: whether the closed form and
the argmax reduce comfortably, and whether the 900-evaluation layer is
kernel-affordable without `native_decide`.

**`U-C6-03 CARD5-COVER-ASSEMBLY`.** Finish Candidate E with both critics' files
in hand: the padding lemma, ENTRY 174 per cover vertex, the `t = 2..5` numeral
floors via `avail_le`, ENTRY 178's empty fiber, the ENTRY 172 + 58/59 budget
chain, then `21 ≤ Δ₄` and `42 ≤ Δ₅`; then the other three cells; then, if budget
remains, the six-term `Γ(5,k)` telescoping identity and a card-5
`cover_catalan_bound` (both dependencies of frozen ENTRY 179 are card-free and
liftable verbatim). **Rename the colliding `cover_rank_bound` first.** *Closes in
one cycle*: the Lean formalisation of the five `τ = 5` small-rank cells — the part
the registry's own `cycle4_note` names as the only open part of `c(5) = 5` at
small rank — and, with the `Γ(5,k)` half, the whole `d = 5`, `τ ≤ 5` branch.
*Hands to the terminal close*: the exact remaining distance to a Lean statement of
`c(d) = min(d,5)` (items (iii) and (iv) of C4).

**`U-C6-04 FOREST-DELTA3-BASE-ENCODING`.** Settle the base-case **design**
question, in this order: (a) decide whether plain `decide` reaches a 76-class
order-8 base **without `native_decide`**, using the `L₂`/`L₃` algebraic chain; if
it does not, (b) prove the joint `S₃`/`T₂` lower bound from the `i₄` closed form
`i₄ = C(n,4) − m·C(n−2,2) + S₂(n−4) + C(m,2) − S₃ − T₂` (`3S₃ ≤ (n−3)S₂` is free;
any decoupled bound is dead), which removes the finite base entirely. Then
formalise `Δ₂ > 0` (order ≥ 9) and `Δ₃ > 0` (order ≥ 12) on the critics' pendant
identity, with the edgeless clause. *Closes in one cycle*: **the run's first
formally verified unconditional forest theorem**, and en route the now-VERIFIED
`E993-R25-FOREST-DELTA2-POS-ORDER-9`. *Hands to the terminal close*: whether a
kernel-checkable "every forest of order `n` up to isomorphism" object exists at
all at this toolchain, which is the standing obstacle to every forest-side award
in this program.

**Deduplication check.** `F-C6-04` originally proposed encoding the five-cell
residue as a `Decidable` finite check; that object is `U-C6-03`'s and has been
**removed from `F-C6-04`**, which keeps the informal hardening and the
`d = 6, 7` generalisation test. `F-C6-03` (graph-theoretic carry step) and
`U-C6-02` (arithmetic tail) are disjoint objects on the same composition.
`T-C6-01` (band margin `β(d)`) and `U-C6-01` (the dual's polynomial layer) are
disjoint objects on the matching branch. `T-C6-03` and `F-C6-01` are the two
Tier 1 seats by different mechanisms (order-bound certificate; counterexample
hunt). **`d' = 3` is deliberately NOT re-chartered**: its last open rank is
`T-C6-01`'s object. **Extending any computed horizon by sweeping is not a route.**

---

## Continuation ruling

The stop gate found **no decisive event** — no verified Tier 1 or Tier 2 theorem,
no verified reduction strictly shrinking the remaining class, no exact
counterexample to any tier — and **no plateau**, which on this record could not be
met even in principle, since the gate itself found material progress in Cycles 3
and 4 and all three Cycle 5 adjudicators independently verify material progress
now. Two of the gate's three continuation conditions are met ((b) proved
reductions; (c) a Lean-gate-ready candidate); the third, (a) a new actual-graph
uniform mechanism, is **not**, and that is the honest shape of this cycle.

**Proceed to Cycle 6 — the charter's last — under the twelve-route portfolio
above, with Award Group A dispatched to Stage 7 at this close.**

**Earliest honest continuation obligations**, in order of what a terminal close
depends on:

1. **Dispatch Award Group A now**, with C-U1-F's toolkit-free proof primary, the
   critic attribution on the award's face, and the mandatory scope line that it is
   the scalar core and does not raise the coefficientwise claim.
2. **Make the registrations and scope updates R1–R25 at the close**, including the
   two registry errata and Composition C, each carrying its grade and attribution
   on its face — Ashton's pre-authorized publication at the terminal close depends
   on the registry being honest about which results are formal and which are not.
3. **Correct the record where this synthesis has struck it**: the `d ≤ 11`
   "horizon of computation" wording, the five-versus-four cell inconsistency, the
   `(7,7)` residue denominator, the population literals, and the false
   `D_unimodal_peak` contract, which must never reach a formalizer.
4. **Carry the two named horizons** of the `d = 11` sharpness (the attained
   `Dmax = 10` degree cap; the `r > 600` per-fiber tail) on every statement of it.
5. **Name, at the terminal close, which of the charter's four outcomes the
   experiment achieved** — a uniform advance, a proved structural reduction,
   another fixed-band result, or a refutation — with no claim that closing G1
   alone solves Erdős #993. On the present record the honest answer is **a proved
   structural reduction plus fixed-band and fixed-rank results, and no uniform
   advance**; Cycle 6 can move that.
6. **Record the seating finding once more and act on it**: for the sixth cycle
   running, the decisive steps came from the critic stage. Three of this cycle's
   four U routes had Lean produced by critics that the seat did not produce, and
   every Award Group A node that was open is closed by a critic.

```text
continue: yes
```

chartered opus/high; transport-resolved model opus (explicit parameter); the seat
cannot self-inspect its runtime model/effort — stated on dispatch-record
authority.

---

## Artifact inventory

All paths are relative to the run root. **No literal filesystem path outside the
run root appears anywhere in this document.** Python standard library only; exact
integers; no floating point in any computation of record; no network; no package
installs. No hashed artifact carries a wall-clock, PID or host field. No system
temporary root, `mktemp` or `TMPDIR` path was used. Every job ran in the
**foreground**; **no background job of this seat existed at any point and none
was alive at this write**. No Lean project was built and no `lake`/`elan`
command was issued. No
file outside `scratchpad/S-C5/` and this `SYNTHESIS.md` was created or modified
by this seat; nothing under any seat's, critic's, adjudicator's or second
reader's scratch was read or written.

| file | SHA-256 | role |
|---|---|---|
| `cycles/cycle-5/stage6/SYNTHESIS.md` | (this file) | the neutral synthesis |
| `scratchpad/S-C5/verify_seals.py` | `7154969690331794c4bfa462d8bf5c3513806177a1cc884e267fddbd0dd50c04` | canonical seal recomputation for the Stage 6 dispatch capsule, the Stage 5 packet and the Composition C capsule, with per-member SHA-256 **and** byte-count verification; run-local registry count and key-presence probes |
| `scratchpad/S-C5/seal-audit.json` | `2ecb58cf4a5a082fcf4f860c30cd1e843cfc46588fca7ca4d12df56e1cadd19d` | its digested output: 21/21, 14/14, 11/11 members verified, three seals matching their declared and dispatched values, 0 mismatches, 0 missing; 327 claims / 327 distinct keys |

**Replay** (from the run root, foreground, standard library only):

```sh
python3 scratchpad/S-C5/verify_seals.py
```

**Counts and their populations.** 21/21 Stage 6 dispatch capsule members,
14/14 Stage 5 packet members and 11/11 Composition C capsule members re-hashed by
this seat, 0 mismatches, 0 missing. Run-local registry: **327 claims, 327 distinct
keys**. Alias probe: **18 proposed keys, all free**; zero registered claims state
any proposed assertion. Every other numeric literal in this document is
attributed to the adjudication or the second-read report that established it,
with its own population named — forest **isomorphism-class** counts are never
construction counts, and where two figures differ (A3 above) the population is
stated in the same sentence.

**Reread before close.** This file was re-read in full after writing and before
the Stage 6 close. The eleven required headings appear exactly once each and in
the prescribed order; each of the four typed lines (`headline_resolved`,
`material_progress`, `plateau`, `continue`) appears exactly once; the model
disclosure line appears twice, at the head and at the close, by design; this
inventory is present. No background job of this seat was alive at the write.
