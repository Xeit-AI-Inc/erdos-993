# Cycle 4 Neutral Synthesis

Run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`, Cycle 4,
Stage 6. Neutral synthesis seat over the sealed Stage 6 dispatch capsule: the
three admitted orientation adjudications (T, F, U), the controller-commissioned
second read of the adjudicator-identified result E2, the Stage 5 packet
manifest, the contracts, the Stage 1 gate, the allocation, the three Stage 5
controller-facts records, the Stage 6 controller-facts record, the census and
witness records, the path evidence, and run-root authority under `sources/`,
`SOLUTION-CONTRACT-ADDENDUM-1.md` and `control/CLAIM-IDENTITY.run-local.json`.
No raw return, no critique, no scratch of any seat or critic, no prior-cycle
synthesis, no other experiment root and no external source was read.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted by reading
`verity.md` (root constitution) and `identity/startup-protocol.md` (default
operating sequence), then loading, per the startup protocol's task-type map,
only the `experiments/` subsystem — this run root, under the sealed capsule and
the run-root authority named above. No `writing/`, `operations/`, `projects/`,
`decisions/`, `logs/`, `memory/`, `knowledge/` or `inbox/` subsystem was
opened; none is needed for a mathematics-only synthesis seat, and this file
proposes no durable VerityOS change. Child delegation: forbidden by charter,
and none used — every derivation, computation and audit below was performed
directly by this seat, in the foreground.

chartered opus/high; transport-resolved model opus (explicit parameter); the
seat cannot self-inspect its runtime model/effort — stated on dispatch-record
authority.

---

## Identity and seal audit

Canonicalisation throughout: SHA-256 of the compact key-sorted JSON of the
manifest minus `seal_sha256` (`json.dumps(obj, sort_keys=True,
separators=(",",":"))`, UTF-8, no trailing newline). Instrument:
`scratchpad/S-C4/syn_c4_seals.py`, written by this seat; it re-verifies every
member on disk by **both** SHA-256 and byte count.

**Dispatch capsule.** `control/C4-STAGE6-DISPATCH-MANIFEST.json`, stage
`cycle-4-stage6-dispatch`, `file_count = 20`. Recomputed canonically:

```
85f46b29871ebd8e34ebb271381ac086760a2d50c8bcbc7ee5ed9341dcc6707a    MATCH
```

equal to the manifest's own `seal_sha256` and to the value carried on my
dispatch record. **The seal to report is
`85f46b29871ebd8e34ebb271381ac086760a2d50c8bcbc7ee5ed9341dcc6707a`.** All
**20/20** member digests and byte counts verify: zero missing, zero mismatched,
and `file_count` equals the member-list length.

**Sibling capsules and the Cycle 4 chain**, each seal recomputed canonically by
the same instrument and each member re-verified on disk:

| manifest | seal | members |
|---|---|---|
| `control/C4-STAGE5-PACKET-MANIFEST.json` | `5a97195e22177e44290f7d0ac68a94354eef4b817c6fd4d31cdb791e53385536` | 14/14 |
| `control/c4-second-read/E2-PACKET-MANIFEST.json` | `b67356aa027442508dae857d682b8d21f3ebf8a7cae82a73583b359f4dbe04f0` | 13/13 |
| `control/c4-adjudicator-capsules/T-PACKET-MANIFEST.json` | `ddb191e7cd0590e95be6753caa09b8cab33079d4738a142d6a26265d9aff4d28` | 23/23 |
| `control/c4-adjudicator-capsules/U-PACKET-MANIFEST.json` | `7452cf1a7b4270d99d64621c7aa47ffe2315ca3f4be5d8f16621bbaaabcfd65d` | 23/23 |
| `control/c4-adjudicator-capsules/F-PACKET-MANIFEST.json` | `56d4074f21f0f3d18dd6787c61a436b28385bf374164044ddd38154507a25f15` | 23/23 |
| `control/C4-STAGE4-PACKET-MANIFEST.json` | `efdc4f007694e0d1c23723ede4a84fe16036388ae89a0ab68907ea518e116adb` | 38/38 |
| `control/C4-STAGE3-PACKET-MANIFEST.json` | `b5d112cdf999dc26554eaaaacb8d80db44904af20a8f165bcd96bb218dbe6fc8` | 23/23 |
| `control/C4-STAGE2-PACKET-MANIFEST.json` | `36a38fb9ec783a3224c3e936249ffd29de5c5d73e9bf967170d96c3d82434b59` | 80/80 |

Every one matches its own declared value **and** the value carried on my
dispatch record; total members re-verified this session: 257, zero missing,
zero mismatched. Three audit facts follow that no single adjudicator could
establish, because each saw only its own capsule: the **three orientation
capsule seals are exactly the values the three adjudications report**
(`ddb191e7…`, `7452cf1a…`, `56d4074f…`), so the three adjudications were
written over byte-identical evidence sets; the Stage 4 packet's 38 members
verify in full (the F adjudicator deliberately hashed only the 22 inside its
boundary and said so — correct conduct, and the remaining 16 are now verified
here); and the earlier chain values that all three adjudications recorded on
concurrence rather than recomputation are recomputed and matched here.

**Path evidence.** `control/PATH-CHECK-c4-stage6-dispatch.json`: 19 files
scanned, 0 files with findings, 0 findings, 0 pruned roots, denied root
declared.

**The three adjudications and the second read, at the digests my capsule
lists** (each re-verified): T `ecf43c7a…` (92,251 B), F `1d3c997b…`
(63,444 B), U `7caece0f…` (100,703 B), second read `4e4edb02…` (27,559 B).
All four carry the required disclosure line, the required headings, one typed
verdict set, and a boot acknowledgment.

**Controller errata, ruled on explicitly.** All six of
`control/C4-STAGE6-CONTROLLER-FACTS.json`:

1. *(a) the U2 grant.* The Cycle 3 critic Lean files sit in the `-replay`
   sibling directories that `control/C4-ALLOCATION.md` item 10 did not name.
   **Ruling: a controller grant erratum, charged to no seat.** U2's reported
   provenance gap is accurate for its granted paths, does not impeach the
   Cycle 3 record, and nothing in U2's deliverable turns on it — its cap-form
   bridge is proved fresh from the frozen declarations, which both its critics
   confirmed by reading the proof text. I concur with the U adjudicator.
2. *(b) the non-existent read-boundary disclosures record.* Eight critics
   across the three orientations reported it independently. **Ruling: nothing
   is missing from any capsule; charged to no seat and no critic**, and the
   reporting critics are credited for capsule hygiene. One consequence must be
   carried: no Stage 3 read-boundary disclosure existed to weigh against any
   return, so every return's reading-discipline paragraph is self-reported and
   is treated as such throughout this synthesis.
3. *(c) the unranged `Bd`.* Confirmed as a record defect and it is
   load-bearing. My own exact recomputation (`syn_c4_checks.py`): with the
   König/Hall range `0 ≤ b ≤ 2r−1−a` the object is `≥ 0` at **exactly**
   `r ∈ {2,3,4,5}` and `< 0` at every `r ∈ [6,520]`; with the range relaxed to
   `b ≤ 2r−1` it is `≥ 0` at **exactly** `r ∈ [2,33]` (checked to `r = 199`),
   and `Bd_wide(6,6) = +2225` against `Bd(6,6) = −16`. **Ruling: the ranged
   definition is the object of record; `control/C4-ALLOCATION.md` item 9 must
   be repaired at the record, and every downstream statement of `Bd` must
   carry the range on its face.** Both U1 critics and both F2 critics found
   this independently; the F and U adjudicators both confirm; I confirm on my
   own instrument.
4. *(d) the second order-26 Kadrawi–Levit witness.* **DISCHARGED by the
   controller** (W2, `τ = ν = 12`, `x = 8`, unimodal, imported as a fixture for
   the Cycle 5 Stage 2 packet). **Ruling: it is not a counterexample to any
   tier**, it does not disturb `E993-UNIV-TREE-TRS2` (already REFUTED — a
   refutation never regresses to OPEN), and its absence during Cycle 4 is
   charged to no seat and no critic. The F adjudicator's independent sweep is
   consistent: at order 26 the only non-log-concave member of the single-hub
   spider family is `T(3,4,4)` (margin −378), so the −68 witness lies outside
   that family and its cover number was unknown to Cycle 4 beyond `τ ≤ 12`.
5. *(e) the protocol's cycle number.* Read as **Cycle 5**; the portfolio below
   is for Cycle 5, consistent with all three next-route allocations.
6. *(f) the diagnostic band's key.* The registered key is
   `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` (the `C3` is the frozen G1
   program's third result, not a cycle number). I use that key throughout, and
   I confirm from `control/CLAIM-IDENTITY.run-local.json` that it is the key
   carrying the statement "`|V(F)| = 2r+5` and `x(F) < r` imply `Δ_r(F) ≤ 0`".

**Census conventions, quoted with both conventions as the gate requires.**
Ten-guard census: over the 522,934 trees of order 8..19 there are **265,749**
ordinary-G1 ten-guard tuples (vertex triples `(v,s,g)`), forming **224,403**
pointed isomorphism classes `(T; v,s,g)`; zero recoveries in either count;
`d'` distribution in vertex triples `2 → 103,036`, `3 → 110,747`,
`4 → 51,073`, `5 → 893`. Cover census: **45 closed / 28 refuted / 0
undetermined**. No superseded figure (8/28/37; 66/7/0; 5/68; "eleven cells";
`min(d,7)`; `min(d,6)`; "−192 is the minimum"; 285/1,097) is used anywhere in
this synthesis, and none appears in any of the three adjudications or the
second read — I checked each.

**Independent instrument.** Every figure below that I mark as mine was produced
by four scripts written by this seat from `SEMANTIC-CONTRACT.md`, the record's
definitions and the dispatch-record recursions alone, importing no seat's, no
critic's and no adjudicator's code: `syn_c4_seals.py`, `syn_c4_checks.py`,
`syn_c4_regions.py`, `syn_c4_clamp.py`. Exact `int`/`Fraction` arithmetic
throughout; no floating point in any decisive figure; no wall-clock, PID or
host field in any hashed payload; every job ran in the foreground; **no
background job was started by this seat and none was running at this write**
(verified by process listing). No `lake clean`, `lake update` or `elan` was
invoked; this seat built no Lean project and makes no Lean claim of its own.
Scratch is confined to `scratchpad/S-C4/`; no system temporary directory was
used at any point.

---

## Reconciliation

The three adjudications are reconciled claim by claim, never by majority vote.
Where two orientations touch one object I say which ruling governs and why;
where they do not touch, I say so and transfer nothing. **All three
adjudications and the second read return the run's headline unresolved, status
`still_open`, material progress yes, orientation plateau no**, and all twelve
returns and all twenty-four critiques did the same. I inspected the headline
question by hand rather than inheriting it (see `## Headline verdicts`).

### Where the orientations agree, and it is genuine corroboration

* **The four recurring defect species dominate the struck literals in all
  three orientations**, and the three adjudicators struck them independently:
  quotations not occurring in the cited file, counts against the wrong
  population, horizons stated beyond the attained one, "reproduced" claims for
  values no shipped generator produces. Nothing struck this cycle changed any
  mathematical conclusion in any orientation; in three places (U3's cell
  grading, U4's own remaining-obligation (ii), F1's route-level verdict) the
  narrowing ran **upward** — the critics established more than the seat
  claimed.
* **The König consequence on forests with `τ = ν`** — a minimum cover is
  saturated by a matching with one private `B`-neighbour per cover vertex — is
  derived independently by four critics across two orientations (C-F1-T,
  C-F1-U, C-F2-T, C-F2-U) and is the single most load-bearing elementary fact
  of the cycle: it supplies F1's `d_c ≥ 1` and emptiness rule `2r−1 ≥ τ` **and**
  F2's Hall range `b ≤ 2r−1−a`, which is the one step that makes `Bd` negative
  and therefore the one step that makes U1's theorem non-vacuous. Two
  orientations needed the same lemma and neither seat derived it.
* **The record tension around `E993-R25-MATCHING-CERTIFICATE-SOUNDNESS` is
  resolved the same way from two disjoint capsules.** The T adjudicator
  (through C-T2-U's F8) rules that the conditionality in the bottom-rank claim
  is settled mathematically and that what remains is a formalisation-DAG
  bookkeeping item; the U adjudicator, reasoning from the soundness lemma's own
  `scope` field, rules that the lemma's "unconditional in `(m,d,r)`"
  registration does not overreach and that the standing state's "Open" entry
  should read "open in Lean at general `(m,d)`". **These are the same ruling
  reached twice independently, and I adopt it**: the informal incidence
  inequalities were inside the soundness lemma's derivation at full generality;
  what was open was their status as a separately established, formally verified
  record item. The controller should re-word the standing state accordingly.
* **The fences hold in all three orientations and in the second read.** No
  registered refuted mechanism is instantiated anywhere; the comparator
  `(1+2z)^m(1+z)^{n−2m}` is used only as a declared control; `6K₂ ∪ (2r−7)K₁`
  is instantiated by at least seven critics, three adjudicators, the second
  reader and by me, and collides with nothing (it has `x = r+1`, so it fails
  every crossing hypothesis, and at `(m,d) = (6,5)` it sits one edge below
  `m(5) = 7`); no log-concavity premise, no convolution closure, no imported
  forest unimodality, no edge-addition monotonicity, no factor-two margin, no
  bare `d = 3` threshold, no cover-3 prehistory. I reproduce the fixed points
  on my own instrument: `P_8` with `I = [1,8,21,20,5]`, `Δ = [7,13,−1,−15,−5]`,
  `x = 2`, `Δ_3 = −15`; `K_{1,3}` with `I = [1,4,3,1]` and `P_4` with
  `I = [1,4,3]`; `P_11` with `Δ_3 = −14`; `P_15` with `Δ_4 = −33`; `P_17` with
  `Δ_5 = −363`; `6K₂ ∪ (2r−7)K₁` with `Δ_r > 0` at every `r = 4..39` and
  `3K₂ ∪ (2r−3)K₁` with `Δ_r > 0` at every `r = 2..39`.

### Disagreements, surfaced and ruled

1. **Whether the dual-sign lemma is supplied (inside orientation T).** C-T1-F
   says supplied on the region, C-T1-U says untouched. The T adjudicator rules
   for C-T1-F on the substance, using C-T1-U's own `(P)`. **I uphold that
   ruling** and note that the second read independently re-derives the same
   reduction *before* reading the adjudication and reaches the same place: with
   the greedy construction the `b`-rows and the `a`-rows at `j ≤ m−1` hold
   identically, so the theorem reduces to exactly two facts — `μ_j ≥ 0` for
   `j ≤ m−1`, and the terminal row. That is three independent arrivals at one
   reduction.
2. **Where E1 enters E2 (adjudication versus second read).** The T
   adjudication's link (iii) reads "`coef_a(j) = 1` for `j ≤ m−1` because E1
   removes the only possible `μ`-clamp". The second read rules
   `confirmed_with_repairs` and states the repair: `coef_a(j) = 1` holds
   identically **by construction**, with or without E1; what E1 supplies is
   `μ_j ≥ 0`, i.e. the admissibility of the dual. **Ruling: the second read
   governs on the wording, the adjudication governs on the substance, and the
   statement of E2 is unchanged.** Registration must carry the repaired
   sentence.
3. **The Lean-readiness DAG of E2 (adjudication versus second read).** The T
   adjudication lists the generalised incidence lemmas inside E2's DAG; the
   second read rules that for the *informal* grade this over-includes, because
   E2 needs only the elementary stratum double-count already absorbed into the
   unconditional soundness lemma, while the sharper generalised lemmas are U4's
   object and gate the *small-rank* bottom-rank claim. **Ruling: the second
   read governs. E2's informal DAG does not contain the generalised incidence
   lemmas; a Lean formalisation of E2 would have to build them, and that
   remark is correct as a statement about formalisation only.**
4. **The registry's "`d ≥ 7`" scope note on
   `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`.** The note says the greedy
   dual "has negative multipliers for `d ≥ 7`". The T adjudicator, finding zero
   negative `g_j` over 4,505 in-region chains at `d ≥ 7`, rules that the note
   must concern the region complement `3d > 2m+2` or a different dual object.
   **I narrow that ruling, on evidence the T adjudicator did not have and on my
   own exact computation** (`syn_c4_clamp.py`, exact `Fraction`, cells
   `d = 2..120`, `t = 0..30` at `m = m(d)`: 3,689 cells): **3,541 cells carry a
   clamp, 3,433 carry an *interior* clamp (`j < m`), exactly 0 cells have a
   negative `μ_j`, and the set of clamped cells is exactly the set of cells
   whose *unclamped* `λ` goes negative somewhere.** The first clamp of any kind
   appears at `d = 5` and is harmless (it sits at `j = m`, where `λ_m = 0`
   gives `coef_a(m) = 0 ≤ 1`); **the first interior clamp appears at exactly
   `d = 7`**. These figures reproduce the second read's clamp census
   (3,689 / 3,541 / 3,433, first interior clamp at `d = 7`) independently.
   **Ruling: the note is a true statement about the UNCLAMPED greedy chain's
   `λ`-multipliers, whose first interior negativity inside the region occurs at
   exactly `d = 7`. It is not about `μ` — E1 proves `μ_j ≥ 0` on the whole
   region — and it is not about the region complement. It is repaired, not
   contradicted, by the clamp, which is itself registered
   (`E993-R25-CLAMPED-DUAL-DOMINATION`, clamp persistence, VERIFIED). The
   registered statement and its "iff" are untouched.** The controller should
   record this reading in the claim's scope; it supersedes the T adjudicator's
   reading and it explains, rather than sets aside, an annotation the record
   has carried since Cycle 2.
5. **The `(7,7,10)` minimiser count (inside orientation T).** One critic says
   1, the other 5; the T adjudicator canonicalizes: minimum `Δ_9 = −4,333`
   attained by exactly **one isomorphism class**, realized by 5 labelled
   paddings. **Upheld**; the registered convention is isomorphism classes and
   every downstream text must name the population.
6. **The two non-log-concave spider families (inside orientation F).** C-F3-U's
   "failure at `α−1`, never near `x`" and C-F3-T's "398 in-window failures" look
   opposed and are not: the two families are different regions of one object,
   and the F adjudicator's closed criterion (a failure at offset `o` on an
   `s`-arm spider lies in the window iff `s−1−o ≤ ⌊(s−3)/2⌋`) reconciles them.
   **Upheld.** Neither "never near `x`" nor "failure at `α−1`" may be carried
   forward as a family property.
7. **U2's Tier 2 reading.** Both U2 critics and the U adjudicator refuse it;
   the refusal rests on the registered scope of
   `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`, which forbids transfer to
   residuals, G1 tuples and Tier 2 in terms. **I uphold the refusal without
   qualification.** Instantiating a universally quantified verified theorem at
   a particular graph is licit and yields a distinct statement, but that
   statement is a fixed-band dispatch at three values of `|U|`, not a theorem
   uniform in `|U|`, and it must never be registered under the band claim's key.

### The seven controller attention items, each ruled

**(1) Matching branch.** Ruled in full under `## Exact established results`,
Composition A. In summary: at threshold `m(d) = ⌈3d/2⌉−1` the branch is now a
theorem at `proved_informal` on **two** of its three rank regions — the bottom
rank `r = d` (U) and the large-rank half `r ≥ K(d) = 2m(d)−d` (T's E2, second
read `confirmed_with_repairs`) — and **bounded computation at `d ≤ 300`** in
between. The exact residue is the band `d < r < K(d)`, uniformly in `d`.
Registration keys: E1 and E2 each require their own key under the OPEN schema
`E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`, which stays OPEN as a schema; E2's
genuinely new content is `d = 3` and every `d ≥ 6` (`d = 2`, `4`, `5` are owned
by stronger registered claims, which must be named and not counted as new).
E1's registration must disclose that its mechanism is an **extension of the
registered `j = m` reflection-pairing mechanism to all indices, not a new
mechanism** — the registry certificate names that mechanism verbatim. Gate
ruling 5's "dual existence is bounded evidence (`d ≤ 70` `t`-uniform)" is
**superseded for the nonnegativity half** by E1, which is uniform in `d`, in
`j` and in real `t ≥ 0` with no horizon; gate ruling 5's "the bottom-rank
theorem is CONDITIONAL" is **superseded** by U's discharge; gate ruling 5's
"T1's Theorem 1 is false at its stated generality" stands unchanged. The
"`d ≥ 7`" scope-note reading is item 4 above.

**(2) Diagnostic band.** **Ruling: `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`
is now closed informally for EVERY `r`, at `proved_informal` (the grade of its
weakest link), as a fixed-band `d = 5` result.** The exact input list, with the
grade and attribution of each input, and the exact residue, are given under
`## Exact established results`, Composition B. It is **not awarded**: no input
is formalised, and the U adjudicator's Stage 7 sizing shows the arithmetic half
alone is not currently Lean-tractable without `native_decide`, which the
contract forbids.

**(3) Corollary F.** **Ruling: the registration update is the extended
statement** — for every `d ∈ {2,…,11}` (`τ = d+1 ∈ {3,…,12}`) and every `r`
with `2r−1 ≥ τ`, every forest `F` with `τ(F) = ν(F) = d+1` and
`|V(F)| = 2r+d` has `Δ_k(F) ≥ 0` for every `k ≤ r−2`, hence `x(F) ≥ r−1`;
`x(F) < r` is not a hypothesis; **the finite-census half is deleted** at
`d = 5, 6`. Grade `proved_informal`, critic-derived (C-F1-T and C-F1-U
jointly), F-adjudicator-verified and extended — including the closure of the
last live cell `τ = 12, r = 7` at `+2013` by composing the two critics'
constraint sets, which is the F adjudicator's own contribution. **It must be
named as parameterized over a finite `d`-range, never as uniform in `d`**: the
`d ≤ 11` boundary is a horizon of computation, not a proved ceiling, and the
per-fiber Catalan criterion `(5/4)^τ − 1 < 16` provably does not govern the
joint budget. **On the F adjudicator's naming it the Cycle 5 Stage 7 candidate:
I concur and do not award it this cycle** — see `## Lean awards`.

**(4) Cover branch.** **Ruling: the `45 closed / 28 refuted / 0 undetermined`
partition is unchanged, `c(7) ∈ {5,6}` is unchanged, and `5 ≤ c(d) ≤ 7` for
`d ≥ 8` is unchanged.** What changes is evidential standing and scope detail,
not status: (i) the Cycle 3 arithmetic certificate's last conditionality is
discharged by a proof — the `NCAP = 12` box is lossless at every census cell
under the side condition `τ ≤ 10−c`, so its 37 `(7,7)` cells at `r = 34..70`
stand (controller computation, F-adjudicator-replayed and independently
re-derived); (ii) two cells that rested on parametrisation, `(6,6)` at `r = 11`
and `r = 12`, now rest on direct exhaustive evidence with exact minima
`+1,474` and `+11,690`, and all eight closed classes are verified at the
**full** Tier 3b predicate `Δ_k > 0` for every `k < r`, not only at `k = r−1`;
(iii) exact `(7,7,r)` cell minima now exist at `r = 10..14`
(`−4,333, −17,458, −52,899, −163,075, −509,875`) over the complete 1,082-class
parametrisation and the full padding simplex; (iv) the `(6,7)` cells are closed
in the full registered predicate for `r = 3..15` with `min Δ_{r−1} > 0` exactly
for `r = 3..20` — bounded evidence **consistent with `c(7) = 6` and containing
no evidence for `c(7) = 5`**, which does not resolve `c(7)`; (v) the single-hub
refutation's cell list grows to three, `(7,7,8)`, `(7,7,9)`, `(7,7,10)`, the
third unconditional; (vi) the four `τ = 5` cells of `c(d) = min(d,5)` are
mathematically settled over **all forests**, not only trees, with `(3,2,11)`
vacuous, `(4,3,13)` true cover-free, and `(5,4,15)`, `(6,5,17)`
cover-essential — an upward correction of the U3 return's own grading, and the
Lean obstruction relocated correctly for the first time. T's and F's cell lists
are disjoint (`(7,7)` and `(6,7)` versus `(6,6)`, `(7,8)`); no status transfers
between them.

**(5) Tier 1.** **Ruling: Tier 1 and Tier 2 remain OPEN**, and U2's composition
is refused a Tier 2 reading. T4's residue is priced exactly and I adopt the
pricing: NR1 is the union of the registered VERIFIED
`E993-INDEPENDENCE-POSITIVE-DELTA-SIZE` on the band `|V| ≤ 2x+3` with the
single rank `r = x(F)+1` of Tier 1 on the complementary band `|V| ≥ 2x+4`, the
two bands being complementary, so the whole remaining content of the `T-C4-04` target is one
rank of Tier 1 and "strictly weaker than Tier 1" is struck in favour of
"incomparable as stated". The `x ≤ 4` closure is `proved_informal` with **two
dependencies named and not discharged** — Hunter's spanning-tree inequality
cited but neither proved inside the run nor vendored under `sources/`, and the
asserted completeness of a finite `(e, c_e, ν, z, degree multiset)` parameter
scan; `x ≤ 3` is free of both. `E3` (`Δ_k(G) < 0 ⟹ |V| ≤ (k+1)²` for forests)
is uniform in `k` and in `G`; I verified its closing algebra symbolically for
`k = 1..400` (`q((k+1)²) = −k(k+1) < 0` and `q((k+1)²+1) = 2 > 0`). F3's
necessary condition — a forest with `x(F) < r` and `Δ_r(F) > 0` must have a
log-concavity failure at a rank in `(x, r]` — is `proved_informal`,
critic-attributed to C-F3-T, F-adjudicator-verified, and **valid for every
finite graph**, acyclicity entering nowhere; every in-window failure in the
multi-arm family sits at `τ ≥ 21` (order ≥ 46), so that family speaks to the
property and not to the `τ ∈ {8,…,11}` band; zero recoveries exist anywhere in
the evidence, which is bounded evidence and never a proof.

**(6) Lean awards.** Ruled in full under `## Lean awards`: **two award groups
are named**, and three named candidates are refused this cycle with reasons.

**(7) Portfolio.** Ruled in full under `## Cycle 5 route portfolio`: twelve
routes, 4T/4F/4U, deduplicated across orientations, with three of the
adjudicators' own proposals struck as already discharged and replaced.

---

## Exact established results

Grades follow `SOLUTION-CONTRACT.md` §4. For every theorem I state where `d`,
`ν`, `τ` and `x(F) < r` enter. **Symbols.** `d = |V| − 2r` (excess); `r` (rank);
`Δ_k = i_{k+1} − i_k` with `i_k` the number of independent `k`-sets and integer
zero extension; `x(F)` the first strict descent; `ν`, `τ` the matching and
vertex-cover numbers; `α` the independence number;
`m(d) = ⌈3d/2⌉−1`; `K(d) = 2m(d)−d`; `c(d) = min(d,5)` for forests;
`Cat_n` the Catalan numbers; `Γ(τ,k) = Cat_{k+1} − Σ_{j=1}^{τ} C(τ,j)·Cat_{k−j}`
zero-extended; `D(b,m) = C(b,m+1) − 2C(b,m) + C(b,m−1)` zero-extended;
`Bd(r,k) = D(2r−1,k) + Σ_{a=1}^{6} C(6,a)·max(0, max_{0 ≤ b ≤ 2r−1−a} D(b,k−a))`;
`M_a(r) = max_{0 ≤ b ≤ 2r−1−a} D(b, r−a)`; `(T,v,s,g,p)` the ordinary G1 tuple
with `A = T − N_T[v]`, `H = A − g`, `U = T − (N_T[v] ∪ N_T[g])`, `p = x(T)+1`,
and `d' = |U| − 2(p−2)` the residual excess.

I verified on my own instrument that `m(d)` is **precisely** the least `m`
satisfying the positivity-iff hypothesis `3d ≤ 2m+2` for every `d ∈ [2,4000]`
(the sole exception in `[0,4000]` is the degenerate `d = 0`), and that
`K(d) = 2d−2` for even `d`, `2d−1` for odd `d`, with `3d ≤ 2m(d)+2`
throughout — so the threshold is forced by the algebra, not chosen.

### Uniform theorems (no horizon)

**S1 — All-index greedy-dual positivity (E1).** For every `m ≥ 1` and every
`d ≥ 0` with `3d ≤ 2m+2`, the unclamped polynomials `N_j(t)` of the stratified
matching-incidence certificate's greedy dual are coefficientwise nonnegative
for every `j ≤ m`; consequently `μ_j^g(t) ≥ 0` for every `j = 0,…,m−1` and
every real `t ≥ 0`, for the unclamped chain and, via clamp persistence, for the
true clamped chain. *Grade* `proved_informal`; **critic-attributed to C-T1-U**
for the coefficientwise form and **to C-T1-F** for the independent pointwise
endpoint reduction (which rests on a different dependency and is carried
separately); T-adjudicator-verified on an independent instrument and
re-verified by the second reader (`e1_dependency: confirmed`; 600 in-region
cells, 0 negative coefficients; `(P)` 300,763 instances, 0 failures; `(S)`
1,845,312 instances, 0 failures; and the decisive step re-derived as an
**algebraic factorisation** `Δ = 3(3d−2(m+1))(d+2(m+1))`, not a census).
*Entry points:* `d` and `m` only through `K = 2m−d`, `r = t+K`; the hypothesis
`3d ≤ 2m+2` enters three times — as `K ≥ m−1` (denominator positivity), as
`m ≤ K+1` (every hard index has a reflection partner), and literally as the
base case of `(P)` and the vanishing of `(S)`'s discriminant. `ν`, `τ` and
`x(F) < r` enter nowhere. *Corroboration of mine:* over 3,689 cells at
`m = m(d)`, `d = 2..120`, `t = 0..30`, **zero** cells carry a negative `μ_j`.

**S2 — Large-rank matching-branch sign (E2).** For every `d ≥ 2` and every
`r ≥ K(d)`, every finite simple graph `G` of order `2r+d` carrying a matching
of size at least `m(d)` satisfies `Δ_r(G) ≤ 0`; bare, `x(G) < r` is not
assumed. *Grade* `proved_informal`; **adjudicator-identified composition (T),
independently second-read** (`e2_verdict: confirmed_with_repairs`;
`e1_dependency: confirmed`), statement surviving verbatim and unnarrowed with
two documentation repairs required at registration (reconciliation items 2 and
3 above). *Dependencies:* `E993-R25-MATCHING-CERTIFICATE-SOUNDNESS` (VERIFIED,
unconditional in `(m,d,r)`), `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`
(VERIFIED) on the unclamped branch, `E993-R25-CLAMPED-DUAL-DOMINATION`
(VERIFIED) on the clamped branch, and S1. *Entry points:* `ν` once, as
`ν(G) ≥ m(d)` (truncation to a sub-matching of size exactly `m(d)` is sound and
preserves the order and every hypothesis — the second read checked this
explicitly); `τ` never; `d` through `m(d)` and `K`; `x(G) < r` never.
*Falsification pressure it survived, at the second read's attained horizons:*
all 32,768 labelled graphs of order 6 at `d = 2`, `r = 2` (156 isomorphism
classes, 32,576 carrying a 2-matching), 0 violations; 188,569 exhaustive
perturbations of the extremal comparator over 9 cells, 0 violations, with the
comparator itself the maximiser in every cell; 255 structured instances across
17 families; 2,850 random graphs; a steepest-ascent adversarial search whose
best attainable value is exactly 0; and 3,689 + 261 certificate-feasibility
cells, 0 infeasible. *Two sharpness facts established by the second reader and
independently reproduced by me:* `m(d)` **cannot be lowered** —
`(m(d)−1)K₂ ⊔ pK₁` keeps `Δ_r > 0` at every `r ∈ [K(d), K(d)+59]` for every
`d = 2..40` — and `K(d)` is **not sharp** at the extremal graph, where the sign
turns at `2⌈d/2⌉−1 = K(d) − (d−1)`, a full `d−1` ranks below `K(d)`
(verified `d = 2..40`, 0 exceptions, on my own instrument).

**S3 — Bottom-rank matching sign, unconditional.** For every `d ≥ 3` and every
finite simple graph `G` of order `3d` carrying a matching of size `m(d)`:
`Δ_d(G) ≤ 0`, by an explicit nonnegative rational certificate. *Grade*
`proved_informal`, uniform in `d`, no horizon, bare. *Attribution:* the
generalised `(m,d)` primal incidence family is seat-derived (U4) on the
informal side — graded by the U adjudicator as a **re-derivation of material
already inside the soundness lemma's proof**, not as a new informal theorem —
and **new** on the Lean side (12 kernel-clean declarations); the `r = d` dual,
which the return explicitly declined to construct, is **critic-attributed
jointly to C-U4-T and C-U4-F**, the even branch being the identical vector from
both and the odd branch two distinct constructions; U-adjudicator-verified at
every `d = 3..400` against the full column system. **This discharges
`E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN` from CONDITIONAL to
unconditional.** It is **not** `formally_verified` and must never be quoted as
such. *Entry points:* `d` is the single family parameter; `ν` only as the lower
bound carried by the matching witness; `τ` nowhere; `x(F) < r` nowhere. *Margin
literals:* the registered terminal margins `3/(d²−4)` (even `d`) and `1/(d−1)`
(odd `d`) are corroborated under the reading "relative slack on the binding
`a`-row"; "terminal margin" is defined nowhere in the Cycle 4 record, so **the
controller must supply a definition of record or drop the margin literals from
the registration — the margin literal, never the sign theorem, is what needs
the definition.**

**S4 — Sharp forest descent order bound (E3).** For every finite forest `G` on
`n` vertices and every integer `k ≥ 1`: `Δ_k(G) < 0 ⟹ n ≤ (k+1)²`, a fortiori
`n ≤ k²+3k`. *Grade* `proved_informal`; the `k²+3k` form is seat T4's, the
sharp `(k+1)²` form is **critic-attributed jointly to C-T4-F and C-T4-U**, who
derived it independently; T-adjudicator-verified. *Entry points:* only the
forest edge bound `e ≤ n−1`, the level-one Bonferroni bound and quadratic
algebra; `ν`, `τ`, `d`, `x(F) < r` nowhere. Tight at `k = 1` only — the true
maxima are `4, 8, 11, 15` at `k = 1..4` against ceilings `4, 9, 16, 25`, so
"TIGHT" is struck and the word may not be used.

**S5 — Recovery necessary condition.** If `x(F) < r` and `Δ_r(F) > 0` then
`I(F)` has a log-concavity failure at some rank `k ∈ (x(F), r]`. *Grade*
`proved_informal`; **critic-attributed to C-F3-T**, F-adjudicator-verified and
**scope-extended to every finite graph** — acyclicity enters at no step. It is
necessary, never sufficient: 398 in-window failures exist in one spider family
alone and **not one of the 6,936 + 3,505 spiders across three populations is a
recovery**.

**S6 — Per-fiber Hall invariance and upward closure.** The per-fiber worst term
at fiber size `s` is attained at `ρ_S ∈ {2s+3, 2s+4}` with value `−Cat_{r−2−s}`,
clearing the Hall floor by `s+3`, so Hall-restricting the per-fiber domain
leaves every `R(τ)` unchanged, uniformly in `s` and `r` (seat F1,
adjudicator-verified; **must carry the scope word "per-fiber" on its face**);
and `PF(τ,r,r−2)/Cat_r` is strictly increasing in `r` for `r ≥ τ+2` with limit
`1 − ((5/4)^τ − 1)/16`, so a finite exact check to `max(R(τ), τ+2)` proves
upward closure (**critic-attributed to C-F1-T**, adjudicator-verified).

**S7 — The certificate tail lemma and the lossless box.** `[φ_t]^+` is unimodal
with a monotone non-increasing tail; `n*(r,d,τ,t) = 2t+c+1` **exactly** (the
return's correction term is identically zero); the integer argmax is the
universal tie `{2t+c+1, 2t+c+2}`; a box `N` on `n_T` is lossless iff
`2t+c+1 ≤ N`; and for entries beyond any finite cap `g_t(S−1) ≥ g_t(S)`
whenever `a_t ≤ S−1`, which at `v_i ≥ 13` reads `τ ≤ 10−c` and holds at
`(6,6)`, `(7,7)` and `(7,8)`. *Grade* `proved_informal`; Steps 1–2
seat-derived, the closed form **critic-corrected (C-F4-T and C-F4-U)**, the box
argument a controller computation graded correct by the F adjudicator after
replay and independent re-derivation. **Consequence: the `NCAP = 12` box is
lossless at every census cell and the Cycle 3 certificate's 37 `(7,7)` cells at
`r = 34..70` stand.**

### Parameterized theorems over a finite range

**S8 — Extended Corollary F.** Exactly as ruled at attention item (3):
`d ∈ {2,…,11}`, every `r` with `2r−1 ≥ τ = d+1`, every rank `k ≤ r−2`, on the
`τ(F) = ν(F) = d+1` stratum of forests of order `2r+d`; `x(F) < r` is not a
hypothesis; census half deleted at `d = 5, 6`. *Grade* `proved_informal`,
critic-derived (C-F1-T + C-F1-U), F-adjudicator-verified and extended. *Entry
points:* `ν, τ` through `τ = ν` (perfect matching `C → B`, `d_c ≥ 1`, emptiness
rule); `d` through `τ = d+1` and `N = |B| = 2r−1`; `r` through the rank index
and the global forest edge budget `Σ d_c ≤ 2r+τ−2`; acyclicity twice (the
subforest edge bound and the global budget); Hall as `ρ_S ≥ |S|`; the Catalan
thresholds only through the domination lemma and the upward-closure limit.

**S9 — `Bd(r,r) < 0` for every integer `r ≥ 6`.** A statement about binomial
integers on the **ranged** definition of record; threshold sharp. *Grade*
`proved_informal`, unconditional, no horizon; seat-derived (U1) with three
written-proof repairs and the threshold strengthening **critic-attributed
jointly to C-U1-T and C-U1-F**, U-adjudicator-verified. The strengthening is
material: the return's machinery closes every `r ≥ 50`, so the finite residue
is `r ∈ [6,49]` — 44 exact evaluations, not 255 — and **the dependence on
`E993-R25-FOURTH-BAND-CLOSE-R-LE-260` disappears from the DAG entirely.** My
own exact recomputation: `Bd(r,r) ≥ 0` at exactly `r ∈ {2,3,4,5}` and `< 0` at
every `r ∈ [6,520]`; `Bd(4,4) = +48`, `Bd(5,5) = +33`, `Bd(6,6) = −16`,
`Bd(10,10) = −14406`; `D(2r−1,r) = −Cat_r` for `r = 1..200`. The three
mandatory repairs are: carry the region `0 ≤ b ≤ m−1` where `D(m−1,m) = 1`
lives; invert Lemma 3.2's Case-2 threshold to `m²(m+1) ≤ 16·2^{m/2}` (the
seat's chosen threshold 17 is exactly right and the chain survives only because
it is 17 and not 16); and correct Lemma 4.1's index slip to
`CB(n)/CB(n+1) = A(n)`.

### Bounded computations (never universal)

**B1 — the small-rank band sweep.** For every `d ∈ [3,300]` and every
`r ∈ [d, K(d)−1]`, a nonnegative rational clamped-greedy dual is feasible,
hence `Δ_r(G) ≤ 0` for every finite simple graph of order `2r+d` with
`ν(G) ≥ m(d)`. Band-exhaustive at the attained horizon `d ≤ 300`; 44,700 cells,
of which **44,694** carry evidence not already owned by an award (the two
`d = 4` cells and the four `d = 5` cells are award-owned). Upgraded from a
witness search to a **decision procedure** by C-T2-F's greedy-optimality lemma
(clamped-greedy maximises `μ_j` pointwise among nonnegative feasible partial
assignments, so the system is feasible iff clamped-greedy is).

**B2 — cover-cell evidence.** `(7,7,r)` exact cell minima at `r = 10..14` and
24 explicit refutation witnesses at `r = 10..33`; `(6,7)` cells closed at the
full predicate for `r = 3..15`; the eight `(6,6)`/`(7,7)`/`(7,8)` closed cells
on shipped exhaustive evidence at the full predicate with minima
`+141, +57, +78, +1474, +11690, +430, +322, +755`; the four `τ = 5` cells of
`c(d) = min(d,5)` over all forests with minima `Δ₂ = 39`, `Δ₃ = 56`,
`Δ₄ = 56`, `Δ₅ = 43`; cover-free forest thresholds `Δ₂ > 0` from order 9,
`Δ₃ > 0` from order 12, `Δ₄ > 0` from order 16.

**B3 — Tier 1 censuses.** 8,355,831 forests to order 21 with zero violations of
the `K₁`-addition target, NR1 at attained horizon 18 (515,786 forests); 62,667
out-of-horizon instances with zero recoveries; 307,199 order-18 forest
isomorphism classes and 148,035 across the six band orders; the `d = 5` band at
`r = 6` end to end (43,377 class members, 4,065 crossing, **every** crossing
member at `x = 5 = r−1`, `max Δ_6 = −490`); 1,075,759 trees and 109 spiders in
the non-log-concave null at `τ ∈ {8,…,11}`, extended by the critics to every
tree with `τ = 8` at orders 16–22 (2,987,135 trees, 0 witnesses). **A null
census closes nothing**, and nothing universal rests on any of these.

### The cross-orientation compositions the adjudicators were forbidden to make

Each composition below states every input's grade and attribution and the exact
residue. **No status transfers between tiers, between forests and G1 tuples, or
to FOREST, TREE, TRANSFER or Erdős #993 in any of them.**

#### Composition A — the matching branch at threshold `m(d)`, assembled across three rank regions

| rank region | status | grade | attribution |
|---|---|---|---|
| `r = d` (bottom rank, order `3d`, `d ≥ 3`) | **theorem** | `proved_informal`, uniform in `d`, bare | S3: primal lemmas seat U4 (informal half a re-derivation; Lean half new and kernel-clean); dual **critic-attributed** C-U4-T + C-U4-F; U-adjudicator-verified `d = 3..400` |
| `d < r < K(d)` (the band above the bottom cell) | **bounded computation only** | exhaustive at `d ≤ 300`; a decision procedure, not a proof | B1: seat T2 for the sweep, **critic-attributed** C-T2-F for the greedy-optimality upgrade and C-T2-U for the structural reduction; T-adjudicator-verified |
| `r ≥ K(d)` (large-rank half, `d ≥ 2`) | **theorem** | `proved_informal`, uniform in `d`, bare | S2 = E2: **adjudicator-identified** (T) over S1 (**critic-attributed** C-T1-U) plus three registered VERIFIED claims; **independently second-read** |

The three regions are disjoint and exhaustive on `r ≥ d`, and the two theorems
were produced in two different orientations that each explicitly declined to
compose (T's R5 and U's cross-orientation section). The T adjudicator's own
structural finding — that T1 and T2 are the **same recursion** in different
coordinates, T1 owning `t ≥ 0` and T2 owning `t < 0`, verified on 2,155 index
comparisons with zero mismatches — is what makes the three regions one object
rather than three.

**The exact residue.** `{(d,r) : d < r < K(d)}`, uniformly in `d`. It is empty
at `d = 2`, and for every `d ≥ 3` its size is exactly **`d−3` ranks at even `d`
and `d−2` ranks at odd `d`** (verified for every `d ∈ [2,4000]` on my own
instrument, the count being `max(·,0)` at `d = 2`): one rank at
`d = 3` (`r = 4`) and at `d = 4` (`r = 5`), three at `d = 5` and `d = 6`, and
growing linearly thereafter. Of that residue, `d = 4` and `d = 5` are owned
outright by registered awards (`E993-C3-GRAPH-MATCHING5-THIRD-BAND-SIGN` for
every `r ≥ 3`; the formally verified `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`
for every `r ≥ 1`), so **the genuinely live residue is the single cell
`(d,r) = (3,4)` together with the bands `d ≥ 6`**, and even those are covered
by exhaustive bounded computation up to `d = 300`. **Nothing in this
composition is a proof at any `d` in the residue**, and the schema
`E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` stays OPEN.

**Owned slices, named and not counted as new.** `d = 2` (C2 fixed point, all
`r`); `d = 4` (VERIFIED, all `r ≥ 3`, strictly stronger than S2 there);
`d = 5` (formally verified, all `r ≥ 1`, strictly stronger than S2 there); and
at every even `d` the perfect-matching sub-class is partly owned by
`E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN`. The new content of the
composition is `d = 3` and every `d ≥ 6`.

#### Composition B — the `d = 5` diagnostic band, for every `r`

**Ruling: `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` — "for every finite
ordinary forest `F` and natural `r ≥ 1`, `|V(F)| = 2r+5` and `x(F) < r` imply
`Δ_r(F) ≤ 0`" — is closed informally for EVERY `r`, at `proved_informal`, as a
fixed-band `d = 5` result.** The exact input list:

| # | input | grade | attribution |
|---|---|---|---|
| 1 | Window reduction: `c(5) = 5` and `m(5) = 7` leave the window `{6}`, so only `ν = τ = 6` needs work | unconditional logic given 2 and 3 | registered (`E993-R25-WINDOW-REDUCTION` over the bare matching branch); re-confirmed by F2 and both its critics |
| 2 | Cover half `c(5) = 5`: forests of order `2r+5` with `τ ≤ 5` have `Δ_k > 0` for every `k < r` | `proved_informal` (registered VERIFIED run-local; the registry scope says in terms "Not formally verified") | registered Cycle 1–3; **re-derived this cycle only in its numeric consequence**, F-adjudicator-confirmed structure-agnostic with a finite residue of exactly five `τ = 5` cells at orders 9,11,13,15,17, all inside F2's complete census |
| 3 | Matching half: forests with `ν ≥ 7` | **`formally_verified`** (`E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`, every `r ≥ 1`, bare) | Cycle 1 governed award |
| 4 | König on forests with `τ = ν`, giving the Hall range `b ≤ 2r−1−a` in `Bd` | `proved_informal` | **critic-attributed** (C-F2-T's König derivation and C-F2-U's (D1); C-F1-T and C-F1-U derive the same consequence), F-adjudicator-verified, corroborated on 8,500,215 cover subsets |
| 5 | Corollary F at `d = 5` (`x < r ⟹ x = r−1` exactly) | `proved_informal` | now a corollary of **S8**, whose extension deletes the finite-census half at `d = 5`; critic-derived C-F1-T + C-F1-U, F-adjudicator-verified |
| 6 | The cover-fiber/Hall bound `Δ_k − Δ_{k−1} ≤ Bd(r,k)` on the `ν = τ = 6` class of order `2r+5` — the only step carrying the arithmetic into graph theory | `proved_informal`, **carried from the Cycle 3 record and re-derived by no Cycle 4 route** | registered inside `E993-R25-FOURTH-BAND-CLOSE-R-LE-260`; corroborated exhaustively by C-U1-F at `r = 4..8` over 723,245 class members — bounded evidence, not a proof |
| 7 | `Bd(r,r) < 0` for every `r ≥ 6` | `proved_informal`, no horizon | **S9**: seat U1, three repairs and the `[6,49]` strengthening **critic-attributed** C-U1-T + C-U1-F, U-adjudicator-verified |
| 8 | `r ≤ 3` (class empty), `r = 4` and `r = 5` (where `Bd(4,4) = +48` and `Bd(5,5) = +33` do **not** cover the class) | bounded computation, **exhaustive at a fixed order, therefore mathematically settling those cells** | F adjudicator's independent census `0 / 585 / 7,469` class members with `0 / 0 / 1` crossing, the unique crossing instance at `x = 4 = r−1` with `Δ_5 = −235`; C-U1-F's `r = 4..8` enumeration |

**The exact residue: there is no rank residue.** The closure holds for every
`r ≥ 1`. What it carries instead are two links that no Cycle 4 route derived —
input 6, which is the load-bearing carry from binomial arithmetic into graph
theory, and the general half of input 2, re-derived only in its numeric
consequence. The grade is the weakest link, `proved_informal`. **It is not
awardable**: no input is formalised, and the U adjudicator's Stage 7 sizing
puts the arithmetic half alone at 13,596 kernel evaluations at ~10²⁶ under the
`native_decide` prohibition. **It is a fixed-band `d = 5` result and must be
named as such**; it transfers nothing to Tier 1, Tier 2, the Tier 3 schemas,
FOREST, TREE, TRANSFER or Erdős #993.

**The consequence for Tier 1's remaining region, stated exactly and claimed no
further.** Tier 1 ranges over excess `d ≥ 2`. The bands `d = 2` and `d = 3` are
registered VERIFIED for **all finite simple graphs**
(`E993-GRAPH-FIRST-WIDE-CROSSING-SIGN`, `E993-GRAPH-SECOND-WIDE-CROSSING-SIGN`
— the latter carrying an admitted literature dependency on the record, which
must travel with any citation of it); `d = 4` is registered VERIFIED for
forests (`E993-FOREST-THIRD-WIDE-CROSSING-SIGN`); and `d = 5` is closed by this
composition at `proved_informal`. **Therefore the remaining region of Tier 1 is
exactly the excesses `d ≥ 6`.** This is a restatement of where the open class
lives, not a proof of anything about it, and it is graded at the weakest link
of its weakest band.

#### Composition C — the `d' = 5` slice of the Tier 2 band (synthesis-identified; requires a second read before registration)

The U adjudicator states the exact statement a Tier 2 reading at `d' ≤ 5` would
need and names its third missing ingredient as "the `d = 5` diagnostic band
itself on that window class, which is exactly `U-C4-01`'s object composed with
two further `proved_informal` inputs". Composition B supplies precisely that,
and the arithmetic of the guards closes the gap: `U` is an induced subgraph of
a tree, hence a **forest**; `d' = |U| − 2(p−2) = 5` means `|U| = 2p+1 = 2r+5`
with `r := p−2`; the guards force `p ≥ 3`, so `r ≥ 1`; and guard 10 is exactly
`x(U) < r`. Hence, by Composition B, `Δ_{p−2}(U) ≤ 0` at every tuple with
`|U| = 2p+1`, at `proved_informal`, **for the whole slice and not only for the
`ν(U) ≥ 7` half that U2's Lean covers**.

**What this is and is not.** It is one slice of the Tier 2 band, at
`proved_informal`, informal throughout. `E993-G1WIDE-NO-SIZE-CAP` requires
`Δ_{p−2}(U) ≤ 0` **uniformly in `|U|`** and **remains OPEN, moved by nothing**.
No status transfers to the Tier 2 key, to Tier 1, or to any headline. Combined
with the slices already owned — `d' = 2` (`|U| = 2r+2`, C2 / the registered
first-wide slice) and `d' = 4` (`|U| = 2r+4`, the registered third-wide slice
and `E993-ORDINARY-G1-THIRD-WIDE-SLICE`) — **the exact Tier 2 residue is
`d' = 3` and every `d' ≥ 6`**: `d' = 3` carried today only by a Cycle 2 result
conditional on an unformalised external hypothesis and accounting for
110,747 of 265,749 vertex triples (41.67%) of the canonical census, and
`d' ≥ 6` untouched by anything in the run. Nothing in the record bounds `d'`
above: the width guard gives `d' ≥ 2` and no upper bound, and the ten-guard
census's `d' ∈ {2,3,4,5}` is bounded evidence over trees of order 8..19 only.

**Discipline.** This composition is mine, made by no seat, no critic, no
adjudicator and no second reader. Following the precedent the T adjudicator set
for E2 and the controller honoured, **it must be given an independent second
reader before any registration**, and the controller should treat it as a
candidate, not a close.

---

## Refuted or narrowed mechanisms

**Refuted or settled this cycle** (a refutation never regresses to OPEN):

* The **per-fiber** Hall/acyclicity tightening of the rank-`(r−2)` budget
  cannot improve `R(τ)` at any `τ` — a theorem, and it is the F1 route's real
  yield; what the route declared unreachable (driving `R(6)`, `R(7)` to 2,
  deleting Corollary F's census half, extending the stratum theorem toward
  `d = 11`) was reached by both its critics and extended by the adjudicator.
* **Lemma 2 of the T1 return at its advertised generality**: the stated *iff*
  at `j ≥ (2m+2)/3` "for every `K, t ≥ 0`" is false, smallest witness
  `(m,d,t) = (4,8,1/2)`; correct on `3d ≤ 2m+2`.
* **Lemma 0's corollary "unconditionally whenever `K ≥ 0`"**: false; the chain
  is undefined on a large sub-region (576 of 1,344 chains in the T
  adjudicator's own sweep). It cannot occur inside E2's regime, where
  `K(d) ≥ m(d)` for every `d ≥ 2` — the second read verified this to
  `d = 20,000` and I confirm the inequality symbolically.
* **"The alive window is nonempty iff `r ≤ K−1`"**: false; the correct
  statement is that the **lower cut** is active iff `r ≤ K−1`.
* **The single-hub-worst conjecture at a third cell**, `(7,7,10)`,
  unconditionally: exhaustive single-hub optimum `−4,320` against exhaustive
  cell minimum `−4,333`. Cell list of record: `(7,7,8)`, `(7,7,9)`,
  `(7,7,10)`; no wording beyond three exhaustive cells.
* **The T3 return's cover-edge spot-check**: computed on objects that are not
  forests — the shipped `Skeleton` class has no acyclicity test and no shipped
  generator constructs a cover-edge skeleton — and its `+71` lies below the
  exhaustive cover-edge minimum `+280`. Both spot-check figures struck.
* **U3's diagnosis of why the rank-4 closed form resists**: false as written.
  `3S₃ ≤ (n−3)S₂` is structure-free and absorbs `S₃`; and no decoupled upper
  bound on `S₃ + T₂` can close cell `(4,3,13)`, the best possible decoupled
  value being `−165` against a true minimum of `+45`.
* **U4's stated structural reason for the piecewiseness of the residue
  windows**: false for four of the five residue `d`; the column system's shape
  is constant for every `r ≥ K+1`.
* **The critics' box-shortfall tables as applied to the Cycle 3 certificate**:
  they cap `n_T` where the certificate caps the singleton entries `n_i`. The
  underlying `φ`-analysis is retained in full; neither critic is at fault, the
  construction sitting outside both read boundaries.
* **"The two target cover cells resist combinatorially"**: they do not; the
  return's parametrisation does. Canonical-core deduplication cuts 10,066
  skeletons to 274 and closes both cells in seconds.
* **"The running minimum has been stable since the first checkpoint" as
  evidence**: at the two target cells the stable running minimum was 4.15× and
  2.32× off the truth.

**Narrowed:** T2's obligation (a) to the monotonicity of the indicator
`1[r ≥ m(d)]` (the terminal margin is a 0/1 step function, histogram exactly
`{0: 22350, 1: 22350}` over 44,700 cells) and its obligation (b) to a
horizon-bounded minimum, the recorded bottom-rank certificate being a
**provably different object** (margin `0` versus `3/(d²−4)`, `1/(d−1)`); the
even-`d` exception count to **eight**, the count of record over even `d ≤ 300`;
T3's `r = 10..35` to "best-found" outside `r = 10..14` and its endpoint
conclusion to corroboration of the **refuted side** only; T4's NR1 horizon from
21 to 18 and "strictly weaker than Tier 1" to the exact reduction; U1's
"`r = 20..519`" to a 204-rank sampled grid topping at 515 and "VERIFIED in both
registries" to "VERIFIED in the run-local registry; not present in the frozen
master"; U2's "Tier 2's formal statement at `d' ≤ 5`" to a partial fixed-band
dispatch covering 58.32% of the canonical census; U3's "42 declarations" to 44;
U4's "only the two fixed instances" to three (frozen ENTRY 117 at `(2,2,2)` is
a third) and its §6.5 sample certificate struck outright, the shipped row
passing every column; F1's route-level refutation to the per-fiber statement;
F2's `AUDIT CLEAN` to a verdict about the record's inputs rather than a claim
to have re-derived the general half of the cover branch; F3's `α−1` regularity
to the 3-arm subfamily; F4's population labels to construction counts
(28,111,290 constructions with `τ ≤ 6`; 15,302,619 of them with `ν` exactly 6;
**88,657** true isomorphism classes at `ν = 6`, order 18).

**Instrument defects that must be repaired before any reuse of this cycle's
code**, carried up from the T and F adjudications: the skeleton class must
acquire an acyclicity test before any `cover_edges` is passed to it, and any
cover-edge figure produced by the present code is unusable; the skeleton
optimiser's restart count and its `improved` test are both wrong (the flag
compares against the cross-restart global optimum, so a later restart can
regress while improving locally); and the cover-cell search's `len(poly) ≤ r`
guard is a latent trap, inert at every cell used here but wrong against the
contract's zero extension at any cell with `τ > r+d`.

---

## Headline verdicts

Exact evidence-grade verdicts for every target of duty 3, each stated
separately and with **no status transfer between them**.

**Tier 1 — `E993-R25-UNR-FOREST-WIDE` (for every finite forest `F` and `r ≥ 1`
with `|V(F)| ≥ 2r+2` and `x(F) < r`, `Δ_r(F) ≤ 0`): OPEN.** No proof exists at
any grade. The strongest material touching it is: S4 (uniform,
`proved_informal`), S5 (uniform, graph-general, `proved_informal`, necessary
only), the `x ≤ 4` rank closure (`proved_informal`, two undischarged
dependencies), and the exact reduction pricing the `T-C4-04` target at **one
rank** of Tier 1. Its remaining region, after Composition B, is exactly the
excesses `d ≥ 6` — a relocation of the open class, at the weakest link's grade,
not a proof about it. Bounded evidence: zero recovering forests anywhere, at
every horizon reached. Tier 1 is a **proper subclaim of `E993-TGT-FOREST`** and
nothing this cycle bears on the superclaim.

**Tier 2 — `E993-G1WIDE-NO-SIZE-CAP`: OPEN, and moved by nothing at the tier
level.** Formally, `U-C4-02` delivers a fixed-band dispatch at
`d' ∈ {2,4,5}` covering 154,997 of 265,749 vertex triples (58.32%), whose
`d' = 5` branch draws only `1 ≤ p−2` from the ten guards and is empty below
`p = 7`, and whose imported theorem's registered scope forbids the Tier 2
reading. Informally, Composition C closes the `d' = 5` slice at
`proved_informal` (candidate; second read required). **The exact Tier 2 residue
is `d' = 3` — conditional on an unformalised external hypothesis, 41.67% of the
canonical census — and every `d' ≥ 6`, which nothing in the run has touched and
which no record bounds away.**

**Tier 3a — `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`: OPEN as a schema.** At
threshold `m(d)` the branch is now a `proved_informal` theorem on `r = d` and
on `r ≥ K(d)`, both uniform in `d` and bare, and bounded computation at
`d ≤ 300` on `d < r < K(d)`. The residue is the band `d < r < K(d)` uniformly
in `d` (`d−3` ranks even, `d−2` odd), of which the live part is the cell
`(d,r) = (3,4)` and the bands `d ≥ 6`. Each concrete instantiation registers
its own key; the schema does not close until the band closes uniformly.

**Tier 3b — `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY`: OPEN.** The threshold
function of record is `c(d) = min(d,5)` for forests (`proved_informal`, VERIFIED
run-local, not formally verified); the diagonal is REFUTED at every `d ≥ 6`;
`c(7) ∈ {5,6}` and `5 ≤ c(d) ≤ 7` for `d ≥ 8` stand unchanged; the 73-cell
census remains 45/28/0. What advanced is the `τ = ν = d+1` **stratum** theorem
(S8), a proper sub-stratum of the schema, now parameterized over `d = 2..11`.

**Tier 3c — `E993-R25-WINDOW-REDUCTION`: OPEN, and materially sharper than at
the cycle's start.** With `c(d) = min(d,5)` and `m(d) = ⌈3d/2⌉−1` the window is
`[min(d,5)+1, ⌈3d/2⌉−2]`, of width `m(d) − c(d) − 1` (`{6}` at `d = 5`,
`{6,7}` at `d = 6`, and growing). The reduction's upper end now has a proof
**on an infinite rank region uniformly in `d` for the first time in this run**
— `r ≥ K(d)` by S2, and `r = d` by S3 — with the band between them resting on
bounded computation to `d = 300`. Its lower end is `c(d) = min(d,5)` at
`proved_informal`. The claim stays OPEN because the reduction is only as strong
as both ends together and the band is not proved.

**Diagnostic band — `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`: CLOSED
informally for every `r`, at `proved_informal`, as a fixed-band `d = 5`
result.** Input list, grades, attributions and the two un-re-derived carries are
in Composition B. Registry action: the claim moves from OPEN to VERIFIED in the
run-local registry at `proved_informal` grade, with the closure's weakest links
named on its face; `E993-R25-FOURTH-BAND-CLOSE-R-LE-260` is superseded and kept
as the historical record. **Not awarded.**

**FOREST (`E993-TGT-FOREST`), TREE (`E993-TGT-TREE`), TRANSFER
(`E993-TGT-TRANSFER` / `E993-TRANSFER-TO-FOREST`), Erdős #993: all OPEN,
untouched, and receive nothing.** Every theorem established this cycle is
either bare and matching-only (S1, S2, S3, S6, S7 — no acyclicity, no `x(F)`,
no cover), or a fixed-band or finite-range forest statement (S8, S9,
Composition B), or an elementary forest bound with no unimodality content (S4,
S5). Tier 1 is a proper subclaim of FOREST and remains open; TRANSFER's
universal antecedent stays REFUTED (`E993-UNIV-TREE-TRS2`), and the controller's
import of the second order-26 witness is a fixture, not a counterexample to any
tier. **No status transfers between tiers, between forests and G1 tuples, or to
any of these four, anywhere in this synthesis.**

---

## Lean awards

Judged against the contract's §4 gate and the protocol's duty 4: award only
stable, materially useful declarations with closed dependency DAGs at their
exact scopes; a fixed-band result only if named as fixed-band; repackaged
identities and null searches do not qualify. The governed Stage 7 seat is a
Claude Sonnet 5 formalizer with a **repair limit of 2 per candidate** and an
Opus 5 auditor/fidelity reviewer, so the unformalised work each candidate still
carries is weighed explicitly. **Two award groups are named.** More than one is
permitted and both are justified: one carries the cycle's materiality, the
other carries its certainty.

### Award group 1 — `BOTTOM-RANK-UNIFORM-MATCHING-SIGN` (the run's first uniform-in-`d` formal theorem, if it lands)

**Exact statement**, in the idiom of the formally verified
`sevenMatching_delta_nonpos`:

```lean
theorem bottomRank_delta_nonpos {X : Type u} [Finite X]
    (d : ℕ) (hd : 3 ≤ d) (G : SimpleGraph X)
    (hn : Nat.card X = 3 * d)
    (f : Fin ((3 * d + 1) / 2 - 1) × Bool → X) (hf : Function.Injective f)
    (he : ∀ i, G.Adj (f (i, false)) (f (i, true))) :
    Erdos993G1.delta G (d : ℤ) ≤ 0
```

(`(3*d+1)/2 − 1` is `⌈3d/2⌉−1` in ℕ division, checked at both parities by the U
adjudicator.)

**Hypotheses:** `X` finite; `d ≥ 3`; order exactly `3d`; an injective
`f : Fin m(d) × Bool → X` whose images are adjacent in pairs (a matching of
size `m(d)`). Nothing else — no crossing hypothesis, no acyclicity, no cover.

**Scope:** rank `r = d` only; order `3d` only; uniform in `d` with no horizon;
all finite simple graphs.

**Excluded conclusions, to be carried on the claim's face:** it is **not** the
Tier 3a schema `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`; it says nothing at any
rank other than `r = d`, nothing about the band `d < r < K(d)`, nothing about
`r ≥ K(d)` (that is S2, informal); no transfer to `firstDescent`/`x(G)`,
forests, residuals, G1 tuples, Tier 1, Tier 2, the diagnostic band, FOREST,
TREE, TRANSFER or Erdős #993; no sharpness claim beyond the recorded comparator
fact that `m(d)−1` fails; the terminal-margin literals are **excluded from the
award** until the controller supplies a definition of record for "terminal
margin".

**Dependency DAG for Stage 7:**

```
frozen G1 definitions (indepCount, coeff, delta, FirstWide.stratum)   KERNEL-CHECKED (transcribed)
 ├─ the nine FirstWide structural lemmas                              KERNEL-CHECKED (transcribed)
 ├─ generalised (m,d) incidence family, 12 declarations               KERNEL-CHECKED (new this cycle)
 │    partition over Finset.range (m+1); three emptiness facts;
 │    outside incidence (r+1−j)b_j ≤ (r+j−K)a_j; inside incidence
 │    (j+1)b_{j+1} ≤ 2(m−j)a_j; ℕ and ℤ forms; re-centring at j ≤ K+1
 ├─ B1 soundness summation  Σ coef_b·b_j ≤ Σ coef_a·a_j ⟹ Δ_r ≤ 0     TO BUILD at general (m,K,r)
 │    (exists at FIXED m in the (7,5) award as the template)
 ├─ the r = d alive-set shape, uniform in d                           derived; TO BUILD
 └─ the parity-split dual at r = d (even/odd closed forms)            derived; two cells COMPILED
       ⟹ Δ_d(G) ≤ 0 for every d ≥ 3
```

**Unformalised work weighed against a Sonnet 5 formalizer with repair limit 2.**
Twenty-six declarations are already kernel-clean with the contract's exact
axiom footprint, rebuilt and audited by the U adjudicator rather than accepted
by report; two cells of the target theorem (`d = 3` odd branch, `d = 4` even
branch) are already compiled end to end from the general lemmas plus the dual.
Two items remain: the variable-length summation chain at general `(m,K,r)` with
the multipliers carried as functions, and the even/odd instantiation of the
dual, whose feasibility reduces to `d²−4 ≤ d²−1` and `d−1 ≤ d`. The second is
cheap. The first is the risk, and it is a known pattern rather than new
machinery, because it exists at fixed `m` in a formally verified award. Two
fidelity items must go into the contract so a reviewer does not read them as
gaps: the `[Finite X] → [Fintype X] [DecidableEq X]` bridge, which the award's
own file already uses in two lines; and the widening of the informal
outside-incidence text to an arbitrary `M` of card `2m`, matching the Lean
statement and strengthening the informal result. **Verdict: award, ranked first
by value, with the summation chain named as the single point of failure.**

### Award group 2 — `FOREST-DESCENT-ORDER-BOUND-SHARP`

**Exact statement.** For every finite forest `G` on `n` vertices and every
integer `k ≥ 1`: `Δ_k(G) < 0 ⟹ n ≤ (k+1)²`. In the frozen idiom:

```lean
theorem forest_descent_order_bound {X : Type u} [Finite X]
    (G : SimpleGraph X) (hG : G.IsAcyclic) (k : ℕ) (hk : 1 ≤ k)
    (hneg : Erdos993G1.delta G (k : ℤ) < 0) :
    Nat.card X ≤ (k + 1) ^ 2
```

**Hypotheses:** `X` finite; `G` acyclic; `k ≥ 1`; a strict descent at rank `k`.

**Scope:** all finite forests including disconnected ones and the empty forest;
every `k ≥ 1`; uniform in `k` and in `G`, no horizon.

**Excluded conclusions:** no tightness claim beyond `k = 1` — the word "TIGHT"
is struck, the true maxima being `4, 8, 11, 15` at `k = 1..4`; no linear
ceiling; it is **not** a no-recovery statement and implies none; no transfer to
Tier 1, to the `K₁`-addition target, to NR1, to FOREST, TREE, TRANSFER or
Erdős #993; and the `x ≤ 4` rank closure must **not** be bundled with it, since
that result carries an undischarged external dependency.

**Dependency DAG for Stage 7:**

```
Mathlib binomial algebra (Nat.choose, Finset.card_biUnion_le)
 ├─ forest edge bound  e(G) ≤ n − 1        (edges + components = n, components ≥ 1)
 ├─ level-one Bonferroni  i_{k+1} ≥ C(n,k+1) − e·C(n−2,k−1)
 │    (every non-independent (k+1)-set contains an edge; union bound over edges)
 ├─ i_k ≤ C(n,k)
 ├─ the two exact binomial ratios
 ├─ the quadratic q(n) = n² − (k²+3k+1)n + k²(k+1),
 │    q((k+1)²) = −k(k+1) < 0 and q((k+1)²+1) = 2 > 0, with the vertex left of (k+1)²+1
 └─ the n ≥ k+1 case split (n < k gives Δ_k = 0; n = k forces an edgeless forest)
       ⟹ Δ_k(G) < 0 ⟹ n ≤ (k+1)²
```

**Unformalised work weighed.** The DAG is closed, elementary, and contains
**nothing registered-but-unformalised** — the single reason this candidate is
safe for a repair-limited formalizer. The only non-trivial Lean step is the
union bound over edges; Mathlib carries the binomial algebra, and I verified the
closing algebra symbolically for `k = 1..400`. It must be submitted in the
**sharp** `(k+1)²` form with critic attribution for the sharpening. **Verdict:
award, ranked first by certainty.**

### Candidates refused this cycle, with reasons

* **`Bd(r,r) < 0` for every `r ≥ 6` (S9).** Stable statement, sharp threshold,
  fully self-contained arithmetic DAG with no registered predecessor — and
  **zero Lean exists for any node of it**. Under the `native_decide`
  prohibition the finite residue is 13,596 kernel evaluations at ~10²⁶ on the
  best currently-proved threshold (255 ranks / 401,625 evaluations at ~10¹⁵²
  as the return shipped it). For a Sonnet 5 formalizer with two repairs that is
  not a responsible contract. **Refused this cycle; it becomes the better-value
  target the moment `M_a(r) ≤ Cat_{r−1−a}` is proved, which collapses the
  residue to 9 ranks / 891 evaluations at ~10⁶ and makes the tail a corollary
  of an already formally verified theorem.** I verified that bridge's
  ingredients myself: the identity
  `Cat_r − Σ_{a=1}^{6} C(6,a)·Cat_{r−1−a} = Γ(6,r−1)` holds for `r = 1..400`;
  `Γ(6,k) > 0` for every `k ∈ [12,400]` with `Γ(6,11) = −1563`, so `K(6) = 12`
  is sharp; and `M_a(r) ≤ Cat_{r−1−a}` holds at **every** `r = 15..400` and
  fails only at `r ≤ 14`. That lemma is allocated a Cycle 5 route.
* **Extended Corollary F (S8).** Stable statement, closed DAG after the F
  adjudication, high materiality — but informal, critic-derived, established
  within this cycle, and its `τ`-indexed finite check over a "provably
  exhausted" profile space is not yet in Lean-friendly form; the exhaustion
  proof is exactly what a repair-limited formalizer would not finish. **I
  concur with the F adjudicator: Cycle 5 Stage 7 candidate, not a Cycle 4
  award**, and it must be named as parameterized over a finite `d`-range.
* **E2 (S2).** Material and uniform, and now second-read — but its DAG runs
  through the positivity-iff, which the record already judges not Lean-ready,
  and through a general-`(m,d)` stratum decomposition that exists in Lean only
  at `(7,5)`. The second reader concurs: not a Cycle 4 Stage 7 candidate.
* **E1 (S1) as a whole.** Its arithmetic core `(P)` plus the discriminant
  factorisation is Lean-sized and is allocated a Cycle 5 route; the chartered
  statement is about the coefficientwise nonnegativity of a polynomial family
  and needs the `N_j/D_j` recursion in Lean. **Carry `(P)` as a sub-target,
  not as this cycle's award.**
* **The `x ≤ 4` rank closure.** An undischarged external dependency (Hunter's
  spanning-tree inequality, cited and not vendored under `sources/`) plus an
  asserted-complete parameter scan **disqualify it from the governed workflow**
  until the dependency is proved inside the run or vendored.
* **`ordinaryG1_band_2_4_5modWindow`, the cap-form bridge, `forest_delta_two_pos_ge_nine`,
  the alive-window lemma, the greedy-optimality lemma, and every bounded
  computation.** Respectively: a packaging of existing claims (excluded by the
  gate), sign-free infrastructure registering no claim (worth contracting
  separately as a reusable asset, not as an award), a single-rank forest lemma
  of modest materiality (register as a candidate claim carrying its refuted
  general-graph adjacency), an elementary lemma, a decision procedure, and
  finite censuses. **None qualifies.**

### Registrations and registry scope updates the controller should make at the close

**New registrations.** Each with exact statement, scope, status, grade and
attribution; all in the run-local `E993-R25-…` namespace (which is the
candidate namespace — no Cycle 4 result is present in the frozen master, and
"VERIFIED in both registries" is struck wherever it appears).

| key (proposed) | statement | scope | status / grade | attribution |
|---|---|---|---|---|
| `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY` | S1 | region `3d ≤ 2m+2`; every `j ≤ m`; real `t ≥ 0`; no horizon | VERIFIED / `proved_informal` | **critic-derived** C-T1-U (coefficientwise) and C-T1-F (pointwise), T-adjudicator-verified, second-reader-confirmed. **Must disclose: extension of the registered `j = m` reflection-pairing mechanism, not a new mechanism** |
| `E993-R25-MATCHING-LARGE-RANK-SIGN` | S2 | `d ≥ 2`, `r ≥ K(d)`, order `2r+d`, matching `≥ m(d)`; bare; an instantiation of the OPEN Tier 3a schema, which stays OPEN | VERIFIED / `proved_informal` | **adjudicator-identified** (T) over C-T1-U's lemma and three registered VERIFIED claims; **independently second-read**. Record the two repairs, the owned slices `d = 2, 4, 5`, that the new content is `d = 3` and `d ≥ 6`, and that `K(d)` is **not** sharp |
| `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` | S4 | all finite forests; every `k ≥ 1`; uniform | VERIFIED / `proved_informal` (award group 2 pending) | seat T4 for `k²+3k`; **critic-attributed** C-T4-F + C-T4-U for the sharp form |
| `E993-R25-RECOVERY-LOGCONCAVITY-NECESSARY` | S5 | every finite graph; necessary, never sufficient | VERIFIED / `proved_informal` | **critic-attributed** C-F3-T, F-adjudicator-verified and scope-extended |
| `E993-R25-RANK-R-MINUS-2-HALL-INVARIANCE` | S6, first half | **per-fiber** (the word must be on its face); uniform in `s` and `r` | VERIFIED / `proved_informal` | seat F1, F-adjudicator-verified |
| `E993-R25-PER-FIBER-BUDGET-UPWARD-CLOSURE` | S6, second half | `τ = 3..13` computed; limit `1 − ((5/4)^τ − 1)/16` | VERIFIED / `proved_informal` | **critic-attributed** C-F1-T |
| `E993-R25-CERTIFICATE-TAIL-ARGMAX-AND-BOX` | S7 | `n* = 2t+c+1` exactly; box lossless iff `2t+c+1 ≤ N`; side condition `τ ≤ 10−c` | VERIFIED / `proved_informal` | seat F4 Steps 1–2; **critic-corrected** C-F4-T + C-F4-U; box argument a controller computation graded correct by the F adjudicator |
| `E993-R25-BD-TAIL-NEGATIVE` | S9, on the **ranged** definition | binomial integers; `r ≥ 6`, threshold sharp; no graph content | VERIFIED / `proved_informal` | seat U1; three repairs and the `[6,49]` strengthening **critic-attributed** C-U1-T + C-U1-F |
| `E993-R25-GENERALISED-MD-INCIDENCE` | the `(m,d)` primal incidence family | `d ≤ 2m`; `j ≤ K+1` on the re-centring | VERIFIED / informal half graded a **re-derivation** of material inside the soundness lemma; Lean half new and kernel-clean | seat U4 (Lean), with C-U4-F's and C-U4-T's independent derivations and 1,239,542 exact graph checks |
| `E993-R25-FOREST-DELTA2-POS-ORDER-9` | `0 < Δ₂(F)` for every finite forest of order `≥ 9`; threshold sharp at `P_8` | forests; rank 2 only | candidate claim / compiled, axiom-clean | seat U3. **Must carry the REFUTED general-graph adjacency `E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE` and its order-9 plateau witness on its face** — the witness contains a cycle, so the refutation does not refute the forest lemma; acyclicity is load-bearing in the strongest available sense |
| `E993-R25-CLAMPED-GREEDY-OPTIMALITY` | clamped-greedy maximises `μ_j` pointwise among nonnegative feasible partial assignments, so the certificate system at `(d,r)` is feasible **iff** clamped-greedy is | the reduced C1/C2 column system | VERIFIED / `proved_informal` | **critic-attributed** C-T2-F |
| `E993-R25-ALIVE-WINDOW` | `a_j ≠ 0 ⟹ j ∈ [max(0,K−r), min(m,r)]`, `b_j ≠ 0 ⟹ j ∈ [max(0,K−r+1), min(m,r+1)]` | elementary, unconditional in `d`; fixes the band's **upper** endpoint at `K(d)−1` | VERIFIED / `proved_informal` | seat T2 with both critics' repaired proof; the **lower** endpoint `r = d` is C-T2-F's cardinality/award account |
| `E993-R25-NR1-DECOMPOSITION` | NR1 is the union of the registered VERIFIED `E993-INDEPENDENCE-POSITIVE-DELTA-SIZE` on the band of order at most `2x+3` with the single rank `r = x(F)+1` of Tier 1 on the complementary band of order at least `2x+4`; hence Tier 1 ⟹ NR1 ⟹ the `T-C4-04` target | a reduction, honest conditional form; the two bands are complementary, so there is no gap | VERIFIED / `proved_informal` | **critic-attributed** C-T4-U, T-adjudicator-verified |
| `E993-R25-KADDITION-CLOSURE-X-LE-4` | `x(G ⊔ K₁) ≤ x(G)+1` for every finite forest with `x(G) ≤ 4`, no order bound in the hypothesis | fixed-rank, named as such | CONDITIONAL / `proved_informal` | **critic-attributed** C-T4-F. **Two dependencies must appear on its face and are not discharged:** Hunter's spanning-tree inequality (cited, not proved, not under `sources/`) and the asserted completeness of a finite parameter scan. The `x ≤ 3` half is free of both |
| `E993-R25-FOURTH-BAND-CLOSE-ALL-R` | Composition B's closure | fixed-band `d = 5`, every `r`; **named as fixed-band** | VERIFIED / `proved_informal` (weakest link) | composed at this synthesis from the eight inputs above, each separately attributed; supersedes `E993-R25-FOURTH-BAND-CLOSE-R-LE-260`, which is kept as the historical record |
| *(candidate, second read required)* `E993-R25-G1-RESIDUAL-D5-SLICE` | Composition C | the `d' = 5` slice of the Tier 2 band only; **not Tier 2** | candidate / `proved_informal` | synthesis-identified; **must be independently second-read before registration**, on the precedent the T adjudication set for E2 |

**Scope and status updates.**

1. `E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN`: **CONDITIONAL → VERIFIED
   (run-local) at `proved_informal`**, unconditional, uniform in `d ≥ 3`, bare;
   the `r = d` dual **critic-attributed**; never to be quoted as
   `formally_verified`; margin literals gated on a definition of record for
   "terminal margin".
2. `E993-R25-STRATUM-DEPTH-COROLLARY-F`: scope extended to `d ∈ {2,…,11}`,
   every `r` with `2r−1 ≥ τ`, every rank `k ≤ r−2`; census half deleted;
   **named as parameterized over a finite `d`-range, never uniform in `d`**;
   the `d ≤ 11` boundary recorded as a horizon of computation.
3. `E993-R25-SINGLE-HUB-NOT-UNIFORMLY-WORST`: cell list → three cells,
   `(7,7,8)`, `(7,7,9)`, `(7,7,10)`, the third unconditional; no wording
   beyond three exhaustive cells.
4. `E993-R25-COVER-DIAGONAL-D7-SIGN`: record the exact `(7,7,r)` cell minima at
   `r = 10..14`; the `(6,7)` closures at the full predicate for `r = 3..15`
   with `min Δ_{r−1} > 0` for `r = 3..20`; and that the `NCAP = 12` box is
   **lossless by proof**, so the 37 cells at `r = 34..70` stand on an argument
   rather than a scan. `c(7) ∈ {5,6}` and 45/28/0 unchanged.
5. `E993-R25-CLAMPED-DUAL-DOMINATION`: its scope sentence "the existence of a
   fully nonnegative greedy dual is NOT established beyond bounded evidence
   (coefficientwise `d ≤ 70` …)" is **superseded** by S1 and must be re-worded.
6. `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`: add the reading of the
   "`d ≥ 7`" annotation established at reconciliation item 4 — it concerns the
   **unclamped** chain's `λ`-multipliers, whose first interior negativity
   inside the region is at exactly `d = 7`, and it is repaired by the
   registered clamp. Statement and "iff" untouched.
7. The standing state's Open entry "the primal generalised incidence lemmas"
   → **"open in Lean at general `(m,d)`"**; `E993-R25-MATCHING-CERTIFICATE-SOUNDNESS`'s
   "unconditional in `(m,d,r)`" needs no correction.
8. `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`: record that the four `τ = 5`
   cells are mathematically settled **over all forests, not only trees** —
   `(3,2,11)` hypothesis vacuous, `(4,3,13)` true cover-free with a sharp
   cover-free threshold at order 12, `(5,4,15)` and `(6,5,17)`
   cover-**essential** (`P_15`: `Δ₄ = −33`, `τ = 7`; `P_17`: `Δ₅ = −363`,
   `τ = 8`) — and that only the Lean formalization is open; record also that
   the transcribed card-4 cover/Catalan chain is card-4 specific and **cannot
   compose at card 5**.
9. `E993-R25-CATALAN-DOMINANCE-RANK-R-MINUS-2`: record that the per-fiber
   Catalan criterion does **not** govern the joint budget (bounded evidence at
   `τ = 13`), so the `τ ≤ 12` ceiling of the joint method is a computation
   horizon, not a proved ceiling.
10. `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`: **OPEN → VERIFIED (run-local)
    at `proved_informal`**, with Composition B's input list and its two
    un-re-derived carries named on the claim's face, and with the fixed-band
    scope word retained.
11. Gate corrections to be carried into the Cycle 5 gate: ruling 4's `r ≥ 261`
    residue is **discharged**; ruling 5's "dual existence is bounded evidence"
    and "the bottom-rank theorem is CONDITIONAL" are **superseded**;
    `control/C4-ALLOCATION.md` item 9's unranged `Bd` is repaired at the
    record; the protocol's `C4`-prefixed band key is corrected to the
    registered key.

---

## Progress and stop-gate ruling

**What moved this cycle, by orientation and without averaging.** T closed its
chartered all-index positivity obligation uniformly in `d` with no horizon,
identified and (through the controller's second read) confirmed the first
uniform-in-`d`, no-horizon matching-branch sign statement the run has produced,
advanced the Tier 1 foothold one full rank and priced its residue exactly at
one rank of Tier 1, sharpened the forest order bound to its method's exact
threshold, and added five exhaustive `(7,7,r)` cell minima and thirteen `(6,7)`
closures at the full predicate. U turned a registered CONDITIONAL claim
unconditional, closed a named residue of record unconditionally with its finite
residue cut from 255 ranks to 44, delivered a kernel-clean general `(m,d)`
incidence family and one cover cell in Lean, and corrected the mathematical
status of three more cells **upward**. F inverted its own strongest route,
doubling the stratum theorem's reach from `d ≤ 6` to `d ≤ 11` and deleting a
131,848-forest census half, closed both target cover cells exactly, discharged
the Cycle 3 arithmetic certificate's last conditionality by a proof rather than
a wider scan, and repaired the band's analytic step at the record level.
Assembled across orientations, the matching branch at threshold `m(d)` is now a
theorem on two of its three rank regions and the `d = 5` diagnostic band is
closed for every `r`.

**What did not move.** Tier 1, Tier 2, the Tier 3 schemas as schemas, the
small-rank band uniformly in `d`, `c(7)`, the `(7,7)` band's closed side, the
`d' = 3` residual band (41.67% of the canonical census), the `d' ≥ 6` region of
Tier 2, and the headline. Two more routes missed their chartered deliverable
and had it delivered by their critics instead — the seating finding now
recorded for the fifth time, and a fact the controller should weigh rather than
repeat.

**The armed stop gate, applied to each candidate decisive event in turn.**

* **Is E2 plus E1 a decisive event? No.** E2 is a genuine new theorem, uniform
  in `d`, with no horizon, and it does shrink the region a Tier 1
  counterexample can occupy — but only through the window reduction, whose
  other end is the `proved_informal` `c(d) = min(d,5)`, and only on the rank
  region `r ≥ K(d)`. It is a **Tier 3a** statement, bare and matching-only, at
  `proved_informal`, not a verified Tier 1 or Tier 2 theorem, and not a
  *verified* reduction. It is exactly what the contract's §6 **continuation**
  limbs (a) and (c) describe: a new actual-graph uniform mechanism whose
  unresolved dependencies are registered VERIFIED results rather than Tier 1.
* **Is the band's closure for every `r` a decisive event? No.** It is a
  **fixed-band `d = 5`** result, and the contract says in terms that a band
  theorem alone is a fixed-band result graded as such. Its grade is its weakest
  link, `proved_informal`, and two of its links were carried from the record
  without a Cycle 4 re-derivation. Its most consequential effect — relocating
  Tier 1's remaining region to `d ≥ 6` — removes one band from an infinite
  family at the grade of its weakest band, which is material progress and is
  not decisive.
* **Is extended Corollary F a decisive event? No.** It is a parameterized
  theorem over a finite `d`-range on the `τ = ν = d+1` stratum only — a proper
  sub-stratum of Tier 3b — at `proved_informal`, and its `d ≤ 11` boundary is a
  horizon of computation rather than a proved ceiling. It strictly shrinks the
  remaining class on that stratum and for those `d`, which is real and is not
  the gate's "verified reduction strictly shrinking the remaining class".
* **Is there an exact counterexample? No.** Zero recovering forests exist
  anywhere in this cycle's evidence, across every family swept and at every
  horizon reached, and a null census closes nothing.
* **Is there a verified Tier 1 or Tier 2 theorem? No.** Both remain OPEN.
* **Plateau? No.** All three orientations report material progress and no
  orientation plateau; Cycle 3 closed with a formal award and a continuation;
  a plateau requires evidence of no material progress over two consecutive
  cycles, and at Cycle 4 the gate additionally requires that evidence to be
  overwhelming. It is the opposite of overwhelming.

**Early finish is therefore not permitted**: the gate allows it only on a real
result at Tier 1 or Tier 2, or on a decisive event as defined, and neither has
occurred. The run continues under the ceiling of six cycles.

**The exact earliest honest continuation obligations**, in the order they
should be discharged:

1. Register S1, S2 and the bottom-rank discharge with the second read's two
   repairs, the owned-slice accounting, and the `K(d)`-not-sharp note.
2. Commission an independent second read of **Composition C** before any
   registration of the `d' = 5` Tier 2 slice, on the precedent set for E2.
3. Repair `control/C4-ALLOCATION.md` item 9's unranged `Bd` at the record and
   carry the ranged form into every downstream statement.
4. Re-word the standing state's "primal generalised incidence lemmas: Open" to
   "open in Lean at general `(m,d)`", and record the "`d ≥ 7`" scope-note
   reading.
5. Supply a definition of record for "terminal margin" or drop the margin
   literals from the bottom-rank registration.
6. Carry "per-fiber" on the Hall-invariance registration and the refuted
   general-graph adjacency on the forest rank-2 lemma.
7. Repair the three named instrument defects before any reuse of this cycle's
   code.
8. Record erratum (d) as discharged: the second order-26 witness is imported as
   a fixture for the Cycle 5 Stage 2 packet and is not a counterexample to any
   tier.

---

## Cycle 5 route portfolio

Twelve routes, four per orientation, deduplicated across orientations and
consistent with the three next-route allocations except where a proposal is
struck as already discharged. **Every symbol a route uses is defined in
`## Exact established results` above**; each route states what it can close in
one cycle, or the debt it must honestly name.

**Struck from the adjudicators' own proposals, and why.** T's `N1`
(second-read-and-register the large-rank theorem) is **discharged** by the
controller-commissioned second read and must not be re-chartered; what remains
of it is a controller registration action. F's `F-C5-03` (ranged `Bd` and the
band tail, "the cheapest unconditional result still available") is
**discharged** by S9 and Composition B and must not be re-chartered. U's
`U-C5-01` (the bottom-rank summation chain) is **the Cycle 4 Stage 7 contract**
of award group 1 and must not also be a Cycle 5 route. Three replacements are
supplied below. Also not to be re-chartered: extending the `d ≤ 300` band
horizon (explicitly not the plan of record); re-attacking `Q_{m,d}`'s positivity
or the `(7,5)` incidence fit (fenced); the settled block-substitution family;
the `(6,7)` and `(7,7)` cells already exhausted; the `128 ⊂ 1,082` /
`50 ⊂ 274` census reconciliation (discharged).

### T routes (prove)

**`T-C5-01 SMALL-RANK-BAND-UNIFORM-BOUND-VIA-THE-TOP-CELL`.** The band minimum
of the `a`-budget margin `β(d)` is attained at the **band top** `r = K(d)−1` at
every `d = 3..300` (both T2 critics, exact, zero exceptions), and the
quasi-fixed point `M(x) = (6−4x)/(6−x)` with linearised multiplier
`x²/((3−2x)(2−x))` crossing 1 at `x = 1` pins the minimum at `M(1) = 2/5`.
Prove the top-cell attainment rather than sweeping it, then prove
`|β(d) − 2/5| ≤ C·d^{−1/2}` with an explicit `C` and finish with a finite check
below the crossover. *Closes in one cycle:* the chartered uniform positive
lower bound, with `inf_d β(d) = 20149737/53301248` (attained uniquely at
`d = 10`) as a **proved** constant — which, with the greedy-optimality decision
procedure, retires the `d ≤ 300` horizon and closes the band `d < r < K(d)`
uniformly in `d`. Together with the two theorems already in hand that is the
**whole** matching branch at threshold `m(d)`. *Debt:* the exact `d` and index
at which the error bound fails, with the profile. Note that `3/8` is a
candidate uniform lower bound and `2/5` is the limit; they are bounds on and
the limit of different things and may not be exchanged (`β(d) ≥ 3/8` holds for
every `d ≤ 300`; `β(d) ≥ 2/5` fails).

**`T-C5-02 SINGLE-HUB-EXTREMALITY-AT-TAU-7`.** The exhaustive `(7,7,r)`
minimiser is the single hub with `p ≡ 3` for every `r = 11..14`, and the
single-hub family's exact optimum matches the reported row at
`r = 20, 32, 33, 34, 35`. Prove the single hub is extremal in the `(7,7,r)`
cells for every `r ≥ 11`, by a dominance/exchange argument on the padding
simplex or by a proved cap on extremal pendant counts that makes exhaustion
affordable past `r ≈ 15`. *Closes:* the whole `r = 10..35` table converted to
exact cell minima at one stroke, the band endpoint reduced to a closed-form
sign question in one parameter, and the `(7,7,34)` cell — the one object on
which the registered band endpoint still rests entirely on an arithmetic
certificate. *Debt:* the smallest `r` at which the exchange argument fails,
with the competing class.

**`T-C5-03 RANK-5-CLOSURE-AND-THE-ONE-RANK-OF-TIER-1`.** Two halves, both
priced exactly by Cycle 4. (i) Discharge the external dependency: prove
Hunter's spanning-tree inequality inside the run or have the controller vendor
it under `sources/`, and re-derive the `(e, c_e, ν, z, degree multiset)` scan
with a proof that its parameter space is complete — which also makes the rank
closure Lean-eligible. (ii) Close rank `x = 5`: its certificate ceiling is 31
and the attained census horizon is 21, so the residue is exactly the forests of
order 22–31 with `x = 5`; a census of that range is ≈10¹⁰ classes, so the
prune-plus-tightened-certificate route is the only affordable one. *Closes:*
ranks `x ≤ 5` unconditionally, plus a clean statement of the residue as the
single rank `r = x(F)+1` of Tier 1 on `|V| ≥ 2x+4`, the narrow band being
already closed by registered VERIFIED material. *Debt:* the smallest order at
which the tightened certificate stops excluding.

**`T-C5-04 D3-RESIDUAL-BAND-EXTERNAL-HYPOTHESIS`** *(replaces the discharged
`N1`; named by the U adjudicator as a T- or F-orientation obligation, not a
Lean one).* The `d' = 3` residual band is the single largest gap between the
Cycle 4 artifacts and any Tier 2 reading: 110,747 of 265,749 vertex triples
(41.67%) of the canonical census, carried today only by a Cycle 2 result
conditional on an **unformalised external hypothesis**. Discharge that
hypothesis — prove it inside the run, or vendor its source under `sources/`
with the controller's approval, or replace the result with an in-run proof of
`Δ_{p−2}(U) ≤ 0` at `|U| = 2p−1` under the ten guards. Note the adjacent
registered material: `E993-GRAPH-SECOND-WIDE-CROSSING-SIGN` is VERIFIED for all
finite simple graphs at order `2r+3` and itself carries an admitted literature
dependency on the record, which must travel with any citation. *Closes:* the
`d' = 3` slice informally, which with `d' = 2`, `d' = 4` (owned) and `d' = 5`
(Composition C) would leave the Tier 2 residue at exactly `d' ≥ 6`. *Debt:*
precisely which hypothesis resists, and whether it is a literature dependency
or a genuine mathematical gap.

### F routes (falsify)

**`F-C5-01 JOINT-BUDGET-LEAN-SHAPING`.** Put extended Corollary F into
Lean-friendly form for a Cycle 6 Stage 7 award: the valley lemma from Pascal,
the König perfect matching, the subforest edge bound, the global forest edge
budget, the domination lemma `JB ≥ PF`, the upward-closure lemma, and — the
part needing care — a Lean-friendly reformulation of the per-`(τ,r)` finite
check, whose profile space is a finite multiset enumeration with a provably
exact degree cap `2r−2k+2`. *Closes:* the first cover-branch parameterized
theorem in a shape a repair-limited formalizer can take, and the first award
candidate in this run whose statement is about forests rather than about
Catalan integers. *Debt:* the part of the finite check that resists a
Lean-friendly reformulation.

**`F-C5-02 JOINT-BUDGET-BEYOND-THE-CATALAN-CEILING`.** Decide whether
`R_joint(τ) = 2` persists at `τ ≥ 13`, where the per-fiber criterion
`(5/4)^τ − 1 < 16` provably does **not** govern. Two levers neither critic
used: the union bound and the acyclicity bound applied *simultaneously* on
nested chains, and the cover's own internal edges (`F[C]` acyclic bounds how
many `S ⊆ C` are independent at all, entering today only as a sound-but-lossy
term). The bounded evidence localises where to look: positive at `τ = 13` at
`r = 15, 40, 80, 160, 320`, negative at `r = 19, 25`. *Closes:* the true ceiling
of the joint method, and with it whether the cover branch extends to all `d` or
stops at an identifiable obstruction. *Debt:* the `τ` and rank at which the
joint budget first goes negative with both levers applied.

**`F-C5-03 BAND-CARRY-STEP-AUDIT`** *(replaces the discharged ranged-`Bd`
route).* Composition B closes the `d = 5` band for every `r` but carries two
links no Cycle 4 route derived. Independently **derive** — not re-run — (a) the
cover-fiber/Hall inequality `Δ_k − Δ_{k−1} ≤ Bd(r,k)` on the `ν = τ = 6` class
of order `2r+5`, the only step carrying binomial arithmetic into graph theory,
today corroborated exhaustively only at `r = 4..8`; and (b) the **general** half
of `c(5) = 5`, re-derived in Cycle 4 only in its numeric consequence. *Closes:*
the band's closure for every `r` on derived rather than recorded inputs — the
precondition for any formal band result and for any citation of the band in a
Tier 2 composition. *Debt:* any input whose derivation diverges from the record,
stated with the exact divergence.

**`F-C5-04 IN-WINDOW-FAILURE-AT-SMALL-TAU`.** The necessary condition is now
exact: a recovery needs a log-concavity failure at a rank in `(x, r]`. In-window
failures exist in quantity, but the **minimum `τ` among them is 21** (order
≥ 46). Build the thin `τ`-capped generator (at most one pendant leaf per cover
vertex — the shape of every known witness, finite at fixed `τ`, spanning every
order from `2τ` to `3τ−1` at once, and the one form of the chartered instrument
measured as affordable), decide whether an in-window failure can occur at
`τ ≤ 12`, settle the `τ = 11` order-24 slot the fixture geometry points at, and
pin the now-imported second order-26 witness. *Closes:* the non-log-concave
cover floor at `τ = 8..11`, and the first principled — rather than exhaustive —
Tier 1 counterexample search. *Debt:* the smallest `τ` at which the thin
generator becomes unaffordable.

### U routes (formal/structural)

**`U-C5-01 E1-ARITHMETIC-CORE-IN-LEAN`** *(replaces the bottom-rank summation
chain, which is award group 1's Stage 7 contract; named as the right Cycle 5
sub-target by both the T adjudicator and the second reader).* Formalise the
arithmetic core of S1: the inequality `(P)` `C(n,s) ≥ 2^s·C(q,s)` with
`s = 2n−K−1` and `q = m−K−1+n`, its two bases (`s = 1` when `K` is even,
`s = 2` when `K` is odd, the first being **literally** `3d ≤ 2m+2`), the
induction step `(S)` `(n+1)(K+1−n) ≥ 4(m+n−K)(m−n)`, and the identity that
makes the region exact, `Δ = 3(3d−2(m+1))(d+2(m+1))`, so that
`Δ ≤ 0 ⟺ 3d ≤ 2m+2` is an algebraic factorisation rather than a census. Add
the reflection identity `A_iB_i = A_{K+1−i}B_{K+1−i}` and the pairing
bookkeeping. *Closes:* S1's arithmetic core kernel-checked, which is the
enabling step for any later formalisation of S1 or S2 and is pure integer
algebra. *Debt:* the index at which the induction resists in Lean, with the
`(m,d,n)` profile.

**`U-C5-02 BD-TAIL-VIA-THE-CATALAN-GAP`.** Prove
`M_a(r) ≤ Cat_{r−1−a}` for `a = 1..6` and `r ≥ 15` (exact computation: holds at
every `r = 15..400`, fails only at `r ≤ 14`, and there only at `a = 5,6` — I
verified both halves). With the identity
`Cat_r − Σ_{a=1}^{6} C(6,a)·Cat_{r−1−a} = Γ(6,r−1)` and the already
`formally_verified` `Γ(6,k) > 0` for `k ≥ K(6) = 12`, this turns the whole tail
into a corollary of a registered theorem and collapses the finite residue from
44 ranks / 13,596 evaluations at ~10²⁶ to **9 ranks / 891 evaluations at
~10⁶** — comfortably kernel-decidable without `native_decide`. Fall back to
formalising the repaired envelope at threshold 50 if the comparison resists.
*Closes:* S9 as a Stage 7 candidate with a tractable finite residue. *Debt:* the
`(a,r)` profile at which the comparison resists, and whether the failure at
`r ≤ 14` is intrinsic or an artifact of `a = 5,6`.

**`U-C5-03 DELTA-3-FOREST-THRESHOLD`.** Prove and formalise `Δ₃(F) > 0` for
every finite forest of order `≥ 12`, sharp (`P_11` attains `−14`) — the exact
structural analogue of the already-shipped rank-2 lemma. Two pieces: the rank-4
closed form `i₄ = C(n,4) − m·C(n−2,2) + S₂(n−4) + C(m,2) − S₃ − T₂` in Lean by
a quadruple-local identity over the 0/1/2/3-edge shape split (exact on every
forest of order ≤ 12 on three independent instruments); and a **joint** lower
bound on `A − (S₃ + T₂)` coupling `S₃` and `T₂` back to `m` and `S₂` — the
absorption `3S₃ ≤ (n−3)S₂` is free, but any **decoupled** bound is dead on
arrival (best possible `−165` at order 13 against a true `+45`). Alias-check
against `E993-C13-I4-GT-I3` (the tree case of the same statement) before
registration. *Closes:* cell `(4,3,13)` in Lean with no cover hypothesis, and a
forest generalisation of a registered tree claim. *Debt:* the smallest order at
which the joint bound resists.

**`U-C5-04 CARD-5-COVER-CHAIN`.** The shipped card-4 chain provably cannot
compose at card 5, and `(5,4,15)` and `(6,5,17)` provably need the cover. Build,
in order: `powerset_five_sum` and a card-5 `cover_rank_bound`
(`b₀ + 5b₁ + 10b₂ + 10b₃ + 5b₄ + b₅ ≤ Δ_k`); a card-5 pigeonhole giving
cross-degree `≤ 2` at orders 11/13/15 and `≤ 3` at order 17 (the charter's
"given" bounds, which are `⌊(n−1)/5⌋` and are true); and the card-5 Catalan gap
`Γ(5,k)` for `k ≥ K(5) = 6`. **Warning to carry into the brief so a third dead
end is not funded:** the size-only card-5 rank bound is insufficient at all four
cells (`−10, −16, −18, −14`) and per-vertex sparsity alone moves `(4,3,13)` only
from `−16` to `−9`; a **joint constraint on the cover-degree profile** is
required. *Closes:* the Lean route to `c(d) = min(d,5)`'s last two small-rank
cells, or a precise statement of why the cover-degree profile resists. *Debt:*
the exact form of the joint cover-degree constraint that fails.

**Deduplication check.** `T-C5-01` (band margins) is disjoint from `U-C5-01`
(E1's arithmetic core) and from `U-C5-02` (`Bd`'s tail): three different
objects on two different branches. `F-C5-01` (the `τ = ν = d+1` stratum budget
in Lean) is disjoint from `U-C5-04` (`c(d) = min(d,5)`'s small-rank cells):
different theorems, different chains, no shared declaration. `F-C5-03` (the
band's graph-theoretic carry step) is disjoint from `U-C5-02` (the band's
arithmetic tail). `T-C5-04` (a mathematical obligation at `d' = 3`) is
disjoint from every U Lean route, and the U adjudicator's own allocation says
it must be discharged **before** any U route is sent to formalise it.
`T-C5-02` and `F-C5-02` touch the cover branch at different objects (cell
extremality at `τ = 7` versus the joint budget above `τ = 12`). No route
re-derives another's object.

---

## Continuation ruling

The run continues to Cycle 5 under the portfolio above. The stop gate is armed
and was applied candidate by candidate: no verified Tier 1 or Tier 2 theorem
exists, no verified reduction strictly shrinking the remaining class exists, no
exact counterexample exists, and the plateau condition is not met on either
limb. Early finish is not permitted. Cycle 4 delivered the run's first
uniform-in-`d` matching-branch theorems on two of three rank regions, the
unconditional closure of the `d = 5` diagnostic band for every `r`, the
discharge of a registered CONDITIONAL claim, and the doubling of the cover
stratum theorem's reach — all at `proved_informal`, none at Tier 1 or Tier 2,
and two award groups are sent to the Stage 7 Lean gate.

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

chartered opus/high; transport-resolved model opus (explicit parameter); the
seat cannot self-inspect its runtime model/effort — stated on dispatch-record
authority.

---

## Artifact inventory

Written by this synthesis — exactly one file under `cycles/`:
`cycles/cycle-4/stage6/SYNTHESIS.md` (this file; its own SHA-256 is reported in
the final message). All scratch is confined to `scratchpad/S-C4/` under the run
root; **no system temporary directory (`/tmp`, `mktemp`, `TMPDIR`) was used at
any point**, no in-place redirection onto any inventoried artifact, and no
edit to any return, critique, adjudication, second read, frozen source, award
run, sealed control record or any other seat's scratch. Every script is pure
Python standard library with exact `int`/`Fraction` arithmetic; no script reads
or writes a wall-clock, PID or host field, so each script's own text is its
hashed payload. Every computation ran in the **foreground**; **no background
job was started by this seat and none was running at this write**, verified by
process listing. **No `lake clean`, `lake update` or `elan` was invoked**; this
seat built no Lean project.

**Instruments and outputs written by this synthesis** (paths relative to the
run root):

| file | SHA-256 | produces |
|---|---|---|
| `scratchpad/S-C4/verify_seal.py` | `bcb31be2019c01eb35219935b72abf2c71d09610527428adbe84d53ce5bdcdcb` | first-pass canonical seal and member verification of the dispatch capsule |
| `scratchpad/S-C4/syn_c4_seals.py` | `b7a61faede58917f7e845a5e0b2922ce8fd98c68bc886154d824f36876c0d539` | canonical seals and full member verification of all nine manifests in the audit table (257 members, digest **and** byte count) |
| `scratchpad/S-C4/syn_c4_seals.out` | `278ec41ea178732b511bc34dda6b48f6baf3ecb2cb14e10654be1e6c793e2068` | its transcript: 9/9 MATCH, 0 mismatches |
| `scratchpad/S-C4/syn_c4_checks.py` | `770031f8c08088608686a9411f18859678f5144893f348486f83b9d7ea8bed95` | thresholds `m(d)`/`K(d)` to `d = 4000`; `Bd(r,r)` ranged on `[2,520]` and unranged on `[2,199]`; `D(2r−1,r) = −Cat_r`; the `Γ(6,·)` identity, `K(6) = 12` sharpness and the `M_a ≤ Cat_{r−1−a}` bridge on `[2,400]`; comparator fences and threshold sharpness; the contract fixed points on my own independence-polynomial instrument; the sharp order bound's closing algebra for `k ≤ 400` |
| `scratchpad/S-C4/syn_c4_checks.out` | `67fca3a250fce9e095e1b1a6e8ec8d4fd27e21f45abc89dfe57db2ecc51518a0` | its transcript |
| `scratchpad/S-C4/syn_c4_regions.py` | `c0098d7d4a01efe2b805f26ce43f10cd81e9827366bcda5cc754bae66af922b0` | the three rank regions of Composition A; the exact band residue and its `d−3`/`d−2` count to `d = 4000`; the window-reduction widths; the extremal comparator's sign-turn rank `2⌈d/2⌉−1 = K(d)−(d−1)` for `d = 2..40` |
| `scratchpad/S-C4/syn_c4_regions.out` | `e1377f07c6351d5a0d86ee1a811570862f293016993ca496142de8ba64aa8515` | its transcript |
| `scratchpad/S-C4/syn_c4_clamp.py` | `ef459f091a4e1758a4ab225786b5ea6b5061a84e502d740f1a942ce64ff66f06` | the clamped-greedy chain at `m = m(d)`: the clamp census over 3,689 cells (3,541 clamped, 3,433 interior, 0 negative `μ`), the equality of the clamped set with the unclamped-`λ`-negative set, and the first interior clamp at `d = 7` — the evidence for the "`d ≥ 7`" scope-note ruling |
| `scratchpad/S-C4/syn_c4_clamp.out` | `80d3c18e2284485b8cb13d2acbe2460150c81924b95db9af563b415a8e50ecdb` | its transcript |

**Sealed and audited objects cited** (each seal recomputed canonically this
session and each member re-verified on disk):

| object | SHA-256 |
|---|---|
| `control/C4-STAGE6-DISPATCH-MANIFEST.json` (seal) | `85f46b29871ebd8e34ebb271381ac086760a2d50c8bcbc7ee5ed9341dcc6707a` |
| `control/C4-STAGE5-PACKET-MANIFEST.json` (seal) | `5a97195e22177e44290f7d0ac68a94354eef4b817c6fd4d31cdb791e53385536` |
| `control/c4-second-read/E2-PACKET-MANIFEST.json` (seal) | `b67356aa027442508dae857d682b8d21f3ebf8a7cae82a73583b359f4dbe04f0` |
| `control/c4-adjudicator-capsules/T-PACKET-MANIFEST.json` (seal) | `ddb191e7cd0590e95be6753caa09b8cab33079d4738a142d6a26265d9aff4d28` |
| `control/c4-adjudicator-capsules/U-PACKET-MANIFEST.json` (seal) | `7452cf1a7b4270d99d64621c7aa47ffe2315ca3f4be5d8f16621bbaaabcfd65d` |
| `control/c4-adjudicator-capsules/F-PACKET-MANIFEST.json` (seal) | `56d4074f21f0f3d18dd6787c61a436b28385bf374164044ddd38154507a25f15` |
| `control/C4-STAGE4-PACKET-MANIFEST.json` (seal) | `efdc4f007694e0d1c23723ede4a84fe16036388ae89a0ab68907ea518e116adb` |
| `control/C4-STAGE3-PACKET-MANIFEST.json` (seal) | `b5d112cdf999dc26554eaaaacb8d80db44904af20a8f165bcd96bb218dbe6fc8` |
| `control/C4-STAGE2-PACKET-MANIFEST.json` (seal) | `36a38fb9ec783a3224c3e936249ffd29de5c5d73e9bf967170d96c3d82434b59` |
| `cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md` | `ecf43c7ae9a2e69864ecc7ba3a02bc3df58d374d91a681af0d6878bb4d927bb5` |
| `cycles/cycle-4/stage5/adjudicators/F/ADJUDICATION.md` | `1d3c997bba4bdd79dc9d1f479ded2f52cbcea812a08bc0d6577cd98202d45a77` |
| `cycles/cycle-4/stage5/adjudicators/U/ADJUDICATION.md` | `7caece0f2e18c77e8fee373cdd35d398828e4267f9bf14297794f7f8c011cd0a` |
| `cycles/cycle-4/stage5/second-read/E2/SECOND-READ.md` | `4e4edb02c6dd3f55a4a2ffbb19817875e2f348eeaf6740ed35aeb53890036db6` |
| `control/C4-STAGE6-CONTROLLER-FACTS.json` | `c24650e96378dac15b8627613cc4eb121223bafdd131d2b5f698f1fc2b777d5b` |
| `control/C4-SYNTHESIS-PROTOCOL.md` | `6e71c997afc98df18d9b3efe4d882415217d65e39ccd35b2ff0f6918a3d1cbc9` |
| `control/C4-SECOND-READ-PROTOCOL.md` | `1d817a2d4d6c7993c4195baeec13ede4d5ed6e13deec71fdbe26dbebcc5916f9` |
| `control/PATH-CHECK-c4-stage6-dispatch.json` | `0619ac28b7d1b5308e0c5def27843eb190357cf585fe818e501be7b155562b55` |

**Replay commands** (each run in the foreground from the run root):

```text
python3 scratchpad/S-C4/syn_c4_seals.py
python3 scratchpad/S-C4/syn_c4_checks.py
python3 scratchpad/S-C4/syn_c4_regions.py
python3 scratchpad/S-C4/syn_c4_clamp.py
```

**Read boundary observed.** The twenty capsule members; and, as run-root
authority, `SOLUTION-CONTRACT-ADDENDUM-1.md` and
`control/CLAIM-IDENTITY.run-local.json` (312 claims — read for the registered
statements and scopes quoted above, by a Python query restricted to that single
permitted file, never repository-wide). For the seal audit I additionally
recomputed the canonical seals of the three orientation capsule manifests and
the Stage 4, Stage 3 and Stage 2 packet manifests and re-hashed their members;
no member's **content** was read except where it is itself a capsule member. I
opened no return, no critique, no seat, critic or adjudicator scratch, no
prior-cycle return, critique, adjudication or synthesis, no other experiment
root and no external source. Child delegation: none used, none permitted. This
file was reread before close.
