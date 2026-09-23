# Cycle 3 Neutral Synthesis

Run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`, Cycle 3,
Stage 6. Neutral synthesis seat; origin orientation: none.

**VerityOS boot.** Operating within VerityOS. Booted before any substantive work
by reading `verity.md` (root constitution) and `identity/startup-protocol.md`
(startup sequence), per the mandatory-boot rule in the repository `CLAUDE.md`.
Per the startup protocol's task-type map this is bounded work inside an
already-chartered controlled experiment, so the only subsystem loaded beyond the
two boot files is `experiments/` — this run root's `control/`, `cycles/`,
`sources/` and `scratchpad/`. No durable VerityOS memory, knowledge, decision,
module, skill, project, identity or writing-system change is proposed, so no
`inbox/` routing applies; this seat writes exactly one file under `cycles/` plus
its own scratch.

**Model disclosure.**

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

**Child delegation.** None. Forbidden by the dispatch and not used. No subagent,
no network, no external source at any point.

**Background jobs.** One extension computation (the sign of `Bd(r,r)` beyond the
mandated horizon `r = 260`) exceeded the harness's foreground window and was
moved to the background by the harness. It was polled on its own task id in a
bounded loop and its result retrieved before this write; it is recorded below as
bounded evidence only and nothing in this synthesis depends on it. A process
check immediately before the final write shows no job belonging to this seat.

---

## Identity and seal audit

Every seal below was **recomputed canonically** — SHA-256 of the compact
key-sorted JSON of the manifest with `seal_sha256` removed (`sort_keys=True`,
`separators=(",",":")`, no trailing newline) — never compared from the dispatch
message alone.

| object | recomputed | dispatched / recorded | result |
|---|---|---|---|
| **Stage 6 dispatch capsule** `control/C3-STAGE6-DISPATCH-MANIFEST.json` | `68b2b4a3b43853340b8a7bb414a116170c9518589ebf8f183872e920c55bdbc5` | identical | **MATCH** |
| **Stage 5 packet** `control/C3-STAGE5-PACKET-MANIFEST.json` (a capsule member) | `4a1172145a6dcd7bc4489ec309edb106a71807431d4fc4570c14a64517b6c199` | identical | **MATCH** |

**Dispatch seal of record, cited in full:**
`68b2b4a3b43853340b8a7bb414a116170c9518589ebf8f183872e920c55bdbc5`.

**Member digests: 12 of 12 verify**, on SHA-256 **and** byte count against disk;
`file_count: 12` equals `len(files)`; zero missing, zero mismatched. The three
admitted adjudications are byte-identical to their sealed digests, so each is
what its seat wrote:

| member | bytes | SHA-256 |
|---|---|---|
| `SEMANTIC-CONTRACT.md` | 4,261 | `3bbeae0777006c9a4479f9976881f597373867782fe71157166dc75cb306aab3` |
| `SOLUTION-CONTRACT.md` | 8,321 | `129225220caacf942bea2ad4d8e56548924897f3ab7a910b55e715c2e8c4c00f` |
| `control/C2-REFUTATION-WITNESSES.json` | 14,082 | `6dfd4a38559204bed0d02e4986fec79f1441b115e92fc52fab978f0d6f4a634a` |
| `control/C3-ALLOCATION.md` | 18,727 | `5e490cb881e6c649ed22366c0fe0ce69cd0379d87a50783b337e483d230dc604` |
| `control/C3-CENSUS-CONVENTION-RECONCILIATION.json` | 6,063 | `557ed4b5f14389fc8221fc7f1a83774ad0226114508c4e86c368ff08a24b1d5c` |
| `control/C3-STAGE1-GATE.md` | 7,040 | `d24ffe204e0bd751053f3663ff6feaec8be8f485797d4d7a9fd40ad8bb659d79` |
| `control/C3-STAGE5-PACKET-MANIFEST.json` | 2,740 | `e32371d3fd3dcedb40fb0d00b995cd6f0ffa1a5e8733dad7fa929b778aef9b75` |
| `control/C3-SYNTHESIS-PROTOCOL.md` | 3,402 | `f287d7daa9721dbb4a6b0e1f6c8b17e4554ce3319b233e81bcb878062048f1e5` |
| `control/PATH-CHECK-c3-stage6-dispatch.json` | 538 | `e442ee688c3bb06d8701f9ec428311a53a06a571865cb69e71008c186bceca43` |
| `cycles/cycle-3/stage5/adjudicators/F/ADJUDICATION.md` | 86,716 | `504cfa41a1edd213ac0c4feeae91f72c108c0fd85b5f8a942b4d3e03371e9f49` |
| `cycles/cycle-3/stage5/adjudicators/T/ADJUDICATION.md` | 69,751 | `297ba12d2d549dbb37953bfd2a155106f9ed03f0a7b41f9c0b71612da588672b` |
| `cycles/cycle-3/stage5/adjudicators/U/ADJUDICATION.md` | 72,686 | `ba45a0569312d5c5b7d338e591ade134a02b5d3f6d208b114984c8d3bf9c4c36` |

The Stage 5 packet manifest declares `file_count: 14` with 14 entries and seals
to the dispatched value; its three adjudication members carry the same digests
as my capsule, so the Stage 5 → Stage 6 hand-off is digest-continuous.

**Earlier chain**, carried on dispatch-record authority and corroborated inside
my boundary by the adjudications that recomputed it:

| stage | value | standing here |
|---|---|---|
| Stage 4 packet | `553da6b9504faf4f9d580cfe221a4cb6b4d64f874a68970d9d1041ba80f2bc71` | **recomputed independently by all three adjudicators**, all MATCH |
| Stage 3 | `cc3dc592cd52bec73234e06591167e42de563f335c3053da4eb9b49a417b0f68` | dispatch-record authority; T and F both record `control/C3-STAGE3-ADMISSION.json` consistent with it |
| Stage 2 | `22f0bf85472a6da12a230bbf23cbc16b655968c86b646caf9a3ef39692142881` | dispatch-record authority; carried as `source_seal` in `control/C3-STAGE3-ADMISSION.json` (T and F both verify) |

**Orientation capsule seals of record**, as each adjudication reports its own
canonical recomputation (not capsule members here, so not re-recomputed):
T `5b3d17b63ab150e61ccf8adda5d42e57f4f78237e70c089ed67dccfe235e602e`,
F `ee22e1d1c50ad034ba9f6851dd49fe1913b45b2d9b7898db66e41f340852cd18`,
U `34a53f19e9f2ed36da01d059e1e3909f82e5b21611c61b8130d10db4407c5689`.
Each reports **21/21** member digests exact.

**Chain observation carried up, not acted on.** The U adjudication reports a
post-seal drift on `control/C3-STAGE4-AGENTS.json` (37/38 Stage 4 members
re-hash exactly; that one file no longer matches its sealed digest
`ef262f18a435c626358ecf3e6440a87fe985cbb4b984d4aa06b6f61ac2f58df7`). That file
is not a member of my capsule and I did not read it. Every Stage 4 member that
intersects any Stage 5 capsule verified exactly in all three orientations, so no
adjudicated artifact is affected. Recorded as a controller item.

**Path evidence.** `control/PATH-CHECK-c3-stage6-dispatch.json`: 11 files
scanned, **0 findings**, 0 pruned roots, run root correct, and the
non-durable VerityOS temporary subsystem denied.

**Read boundary honoured.** Read: the capsule's 12 members; run-root authority
`SOLUTION-CONTRACT-ADDENDUM-1.md` and the directory structure under `sources/`.
**Not read:** any Cycle 3 return or critique; any seat, critic or adjudicator
scratch; any prior-cycle synthesis, return, critique, adjudication or scratch;
any failed lineage; any manuscript, repository state, other experiment root or
external source; no network. Every command was confined to named permitted
paths; no repository-wide search was run. All scratch is under the ABSOLUTE path
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20/scratchpad/S-C3/`;
no system temporary directory, no `mktemp` and no `TMPDIR`; no in-place
redirection onto any inventoried artifact. Exact integer and exact rational arithmetic throughout; no floating
point in any decision; no wall-clock field in any output listed in the inventory.

**Census convention, quoted as the reconciliation record requires.** Over the
**522,934** trees of order 8..19 there are **265,749** ordinary-G1 ten-guard
tuples (**vertex triples**), forming **224,403** **pointed isomorphism classes**
`(T; v, s, g)`; **zero recoveries in either count**. Neither figure is quotable
alone. `control/C3-CENSUS-CONVENTION-RECONCILIATION.json` is `RECONCILED` with
exact agreement in every per-order and per-`d'` cell, and it lifts
`control/C3-STAGE1-GATE.md` ruling 5's quoting embargo. No Cycle 3 route
depended on either figure, and all three adjudicators record that none of the
twelve returns quotes either.

**Canonical figures used unchanged throughout this synthesis.** `K(1..7) = 0, 2,
3, 4, 6, 12, 70`; the window table under `c(d) = min(d,5)` with `m(d) =
⌈3d/2⌉−1` (so the `d = 5` window is exactly `{6}` and the `d = 6` window is
`{6,7}`); `control/C1-CENSUS-ERRATA.json` as the canonical census errata. The
superseded figures forbidden by `control/C3-ALLOCATION.md` — `66/7/0`, `5/68`,
the "eleven cells", `min(d,6)` and `min(d,7)` — are used nowhere in this file as
figures of record; they are named in this sentence only to record their
exclusion, as the allocation itself names them. I re-derived `K(1..7)`, the Catalan-dominance thresholds
and the whole window table myself from `SEMANTIC-CONTRACT.md` and
`SOLUTION-CONTRACT-ADDENDUM-1.md` before using any of them (see
`## Artifact inventory`).

---

## Reconciliation

Claim by claim, T against F against U, **without majority vote**. Where two
orientations touch the same object I rule on the object; where they touch
different objects I say so rather than manufacturing an agreement. Where a
ruling turns on arithmetic I recomputed it here rather than inheriting it, and
say which. No disagreement is resolved by consulting any lower tier.

### 0. What all three orientations agree on, unprompted

Each adjudicator inspected its own orientation by hand rather than inheriting
the question, and all three report `headline_resolved: no`, `status:
still_open`, `material_progress: yes`, `orientation_plateau: no`. All 12 returns
reported `headline_resolved: no` and all 24 critiques returned
`retained_narrowed`. All three record the same seating finding (below). All
three record zero recovering forests at every horizon reached, the largest being
F's own exhaustive census of all **515,786** forests of order ≤ 18 at every
valid rank plus every forest of order ≤ 20 with `τ ≤ 7`. All three record the
registered fences intact: the comparator `6K₂ ∪ (2r−7)K₁` is reproduced with
`Δ_r > 0` **and `x = r+1`** (so it is not a crossing instance and is never
offered as a counterexample to a crossing statement); no pointwise addability,
every-vertex SR2, edge-addition monotonicity, factor-two margin, log-concavity
premise, convolution closure or imported forest unimodality appears in any of
the twelve chains. I accept all of this; it is concordant and independently
warranted three times over.

### 1. `k₀(r)` — the controller defect, fixed here by definition

`k₀(r)` is used in `control/C3-ALLOCATION.md` item 9 and
`control/C3-STAGE1-GATE.md` ruling 4 and is **defined in neither**, nor in any
other capsule member. The U adjudication identifies this as the sole cause of
the one substantive paired-critic disagreement in its orientation. I fix it
here, in the reading the record forces, and I use no other.

Under `SEMANTIC-CONTRACT.md`'s integer zero extension, for integers `b ≥ 0` and
`m`, put

```text
D(b,m) = C(b, m+1) − 2·C(b, m) + C(b, m−1)          (C(n,k) = 0 unless 0 ≤ k ≤ n)
```

and, for the `ν = τ = 6` class of order `2r+5` (so `α = |V| − τ = 2r−1`),

```text
Bd(r,k) = D(2r−1, k) + Σ_{a=1}^{6} C(6,a) · max( 0, max_{0 ≤ b ≤ 2r−1−a} D(b, k−a) )
```

the `S = ∅` fiber taken exactly (it is forced: `b(∅) = 2r−1`, and
`D(2r−1, r) = −Cat_r`, which I verify for every `r = 1..60`), every other level
over-counted by its own maximum and clamped at zero. `Bd(r,k)` is then an
analytic upper bound on the second difference `Δ_k − Δ_{k−1}` over the
Hall-constrained class. **Definition:**

> **`k₀(r)` is the least `k` such that `Bd(r,k′) < 0` for every `k′ ∈ [k, r]`** —
> the bottom of the *proved* concavity window. If no such `k ≤ r` exists the
> window is empty and `k₀(r)` is undefined at that rank.

This is the reading that makes the record's residue (`the band closes iff no
crossing forest in the class has x ≤ k₀(r) − 2`) the right object: if
`x ≥ k₀(r) − 1` then `x+1 ≥ k₀(r)`, so chaining `Δ_k ≤ Δ_{k−1}` from `k = x+1`
to `k = r` gives `Δ_r ≤ Δ_x < 0`. It is C-U1-T's reading; C-U1-F's `k₀` (the
dominant fiber's own sign change) is a cruder proxy lying systematically below
it, and both critics' computations are correct about their own function. **I
recomputed both `Bd(r,k)` and `k₀(r)` from binomials directly, on my own
instrument, and reproduce the U adjudication's table exactly:**

| `r` | 4 | 5 | 6 | 7 | 8 | 9 | 12 | 17 | 40 | 60 | 100 | 150 | 200 | 260 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `r − k₀(r)` | — | — | **0** | **0** | **0** | 1 | 1 | 2 | 3 | 4 | 6 | 7 | 9 | **10** |

with the window **empty** at `r = 4, 5` (`Bd(4,4) = +48`, `Bd(5,5) = +33`) and
`Bd(r,r) < 0` for **every** `r ∈ [6, 260]` (255/255), `Bd(6,6) = −16`,
`Bd(10,10) = −14406` — all four of the record's quoted values reproduced.
`k₀(r) ≤ r` whenever the window is non-empty, by construction.

**Ruled and carried to the controller:** adopt this definition verbatim in the
Cycle 4 gate. Note also that `r − k₀(r)` is `Θ(√r)` as the record says, but
`Θ(√r)` alone does not identify the function; two different `Θ(√r)` candidates
were in play this cycle and only one is record-faithful.

### 2. The diagnostic band — the one composition neither adjudicator could perform

This is the cycle's principal cross-orientation ruling, and it is mine to make
because the two halves sat in different read boundaries.

**F's half.** C-F4-T's **Corollary F** — for every forest `F` with
`τ(F) = ν(F) = d+1`, `|V(F)| = 2r + d` and `d ∈ {2,…,6}`: `x(F) ≥ r−1`,
equivalently `Δ_k(F) ≥ 0` for every `k ≤ r−2` — is established at
`proved_informal`, critic-attributed, and adjudicator-verified end to end
(thresholds `R(τ) = 2,2,5,6,7,8,10,12,19,44` for `τ = 3..12` reproduced; the
bound validated on 6,197,079 `(forest,k)` pairs with zero violations; the
small-`r` residues `r ∈ {3,4,5}` at `d = 5` closed by exhaustive census; `x(F) <
r` is **not** a hypothesis). The F adjudicator ruled that at `d = 5` this **is**
the second lemma of the recorded two-lemma plan, and then declined to compose,
for three exactly stated reasons: Lemma (L) is recorded exact only on
`6 ≤ r ≤ 260` with three undischarged tail repairs; the proofs of the `d = 5`
window reduction and of the `ν = τ = 6` reduction lie outside the F boundary;
and C-F4-T itself declined for the same reason. **I endorse that restraint and
record that it was correct at that seat.**

**U's half.** The U orientation, which could not see Corollary F, reconstructed
Lemma (L)'s top-rank step in closed form — `Bd(r) < 0` on the whole mandated
range `6 ≤ r ≤ 260`, with per-level maxima and **no cross-level consistency
constraint** (the U1 return's contrary thesis is refuted) — and measured the
residue as tight: `r − k₀(r) = 0` at `r = 6, 7, 8`, so at those ranks the
residue reads exactly `x ≥ r−1`, attained with **zero margin** and unresisted
across 723,245 enumerated `ν = τ = 6` forests at `r = 4..8`, every one of the
239,471 crossing instances sitting at `x = r−1`. U then chartered its
highest-value Cycle 4 route (`U-C4-01`) to prove exactly the statement F had
already proved.

**I now recompose, on the gate's record, and I audit each input.**

1. **The `d = 5` window reduction is unconditional and both its halves are
   registered.** Cover half: `c(5) = 5`, i.e. `τ ≤ 5 ⟹ Δ_k > 0` for every
   `k < r`, hence `x ≥ r` — `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`, VERIFIED
   at `proved_informal`. Matching half: `ν ≥ 7 ⟹ Δ_r ≤ 0` at order `2r+5` —
   `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`, **formally verified** in
   Cycle 1. Since `m(5) = ⌈15/2⌉ − 1 = 7` and `c(5) = 5`, the Tier-3c window at
   `d = 5` is exactly `{6}` (I recomputed the whole table), and for forests
   `τ = ν` by König. **Therefore every counterexample to the band has
   `ν = τ = 6`** — with no horizon and no unproved input.
2. **Corollary F at `d = 5` pins the crossing depth.** On that class,
   `x ≥ r−1`; with `x < r` this forces `x = r−1` exactly. Corollary F holds at
   every `r`: for `r ≥ R(6) = 6` by the rank-`(r−2)` Catalan budget (graph-scoped
   there), and for `r ∈ {3,4,5}` by complete enumeration of forests of order
   ≤ 15. **No horizon.**
3. **Lemma (L)'s top-rank step closes it.** With `x = r−1` the whole `k₀`
   apparatus collapses to the *single* step `Δ_r ≤ Δ_{r−1}`, i.e. to
   `Bd(r,r) < 0`. That is exactly Lemma (L) at `k = r`, reconstructed in closed
   form and verified — by two U critics, by the U adjudicator, and **again
   independently here** — for every `r ∈ [6, 260]`.
4. **The ranks below the window.** The `ν = τ = 6` class is **empty** for
   `r ≤ 3` (six disjoint edges need order ≥ 12, and `2r+5 ≥ 12 ⟺ r ≥ 4`), so
   the window reduction alone closes `r ≤ 3`. At `r = 4` and `r = 5` the
   concavity window is empty and the ranks rest on **complete enumeration of the
   class**: 585 members at order 13 with **0 crossing**, and 7,469 members at
   order 15 with exactly **1 crossing**, that one having `Δ_5 = −235 < 0`. A
   complete enumeration of a finite class at a fixed rank is a case check, not
   an extrapolation, and closes those two ranks outright.

**RULING.** `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` — for every forest `F`
with `|V(F)| = 2r+5` and `x(F) < r`, `Δ_r(F) ≤ 0` — **is closed informally for
every `r ≤ 260`** (equivalently, for every forest of order ≤ 525), at grade
`proved_informal`, and is **not closed for all `r`**. The answer to the
chartered question is therefore **"for `r ≤ 260`", not "for all `r`" and not
"neither"**.

**The residue, stated exactly.** For `r ≥ 261` the only missing input is Lemma
(L)'s tail, and the residue rests on **exactly the three repairs of record** and
on nothing else:

> (i) the `m = b+1` boundary case of the closed form for `D(b,m)`;
> (ii) the bound `C(b,m) ≤ 2^{2r−1−ρ}`;
> (iii) the `max_{ρ ≥ j} D ≥ 0` step.

No other input carries a horizon: the window reduction is unconditional, its
matching half is formally verified, and Corollary F is uniform in `r`. Bounded
evidence beyond the horizon, recorded as such and **load-bearing for nothing**:
on my own instrument `Bd(r,r) < 0` at **every** `r ∈ [6, 1200]` without a
single exception. That is bounded computation at an attained horizon of 1,200
and is never a proof of the tail; the three repairs are what a proof needs.

**Two consequences I must record.** (a) The composition's grade is its weakest
link, `proved_informal`; it is **not** `formally_verified` and must never be
quoted as such. (b) Two inputs I cannot audit from inside this capsule are the
*proofs* of the cover half `c(5) = 5` and of Lemma (L) as originally argued;
what I can audit is the gate's record of them, the registry status of the first,
and — for Lemma (L)'s top-rank step — an independent closed-form reconstruction
that I ran myself. Cycle 4 must audit the two proofs directly; that obligation
is chartered below.

**Correction to the record of Lemma (L)'s repairs.** The U orientation located a
**fourth** singular family of the closed form for `D(b,m)`: over
`0 ≤ b ≤ 60`, `−4 ≤ m ≤ b+4` the form is undefined on exactly 122 cells —
**61 at `m = b+1` and 61 at `m = −1`** — and only the first is among the three
recorded repairs. The true zero-extended value at the new cell is
`D(b,−1) = +1`, not `0`. The cell is live in any statement quantifying over
`k ≤ k₀(r) − 2` (where `m = k − |S|` reaches `−1`). It does **not** touch the
composition above, because the composition needs only `Bd(r,r)` with indices
`r − a ≥ 0` for `r ≥ 6`, and because I evaluated `D` directly from binomials
under the contract's integer zero extension rather than through any closed form,
which is immune to both families. I confirm both singular values directly:
`D(b,−1) = D(b,b+1) = +1` at every `b` checked. **Carried to the controller as
an amendment: Lemma (L) has four singular families, not three.**

### 3. The 73-cell census — T and F disagree on standing, and F governs

**T** rules the 37 `(7,7)` cells at `r = 34..70` "formally undetermined", and
rules that T3's 37-row sweep attaches **no direction of evidence** because the
searched single-hub family is proved non-extremal on the same diagonal. **F**
rules the partition moved to **45 closed / 28 refuted / 0 undetermined**.

These are not contradictory statements about one body of evidence; they are
statements about two bodies of evidence, and neither adjudicator could read the
other's. **Ruling: F governs on the census; T governs on the single-hub family.
The canonical partition entering Cycle 4 is `45 closed / 28 refuted / 0
undetermined`,** at exactly the grade F states — *bounded computation,
exhaustive per cell over the complete cover-shape parametrisation, conditional
on the structure lemma* — with two strengthenings on F's own record: four of the
eight originally-closed cell minima (`+141` at `(6,6) r=6`, `+57` at
`(6,6) r=7`, `+430` at `(7,7) r=6`, `+755` at `(7,8) r=5`) are established by
**direct exhaustive forest enumeration with no parametrisation at all**, and the
37 `(7,7)` cells are additionally carried by a `proved_informal` arithmetic
certificate that certifies no refuted cell (the consistency check passes) and
whose crossover sits strictly between `r = 33` (margin `−3.243e−05`) and
`r = 34` (margin `+7.548e−05`). T's separate ruling stands untouched and is not
weakened by this: **T3's 37-row sweep carries no evidentiary direction**, and
the cells are closed by F1's branch-and-bound plus three corroborating
instruments, not by the single-hub sweep.

**The `D7` registry scope line is retirable cellwise**, subject to F's three
conditions, all of which I adopt as mandatory in the retirement text: (1) state
that the decision is over the cell predicate as `control/C2-REFUTATION-WITNESSES.json`
defines it — the sign of `Δ_{r−1}`; (2) attribute the extension from `Δ_{r−1}`
to the registered consequent `Δ_k > 0` for **every** `k < r` at all 45 surviving
cells (1,986 rank decisions, zero exceptions) to **C-F1-U**, not to the return;
(3) supply positivity at `r ≥ 71` explicitly from the registered Catalan
dominance `Γ(7,k) > 0` for `k ≥ K(7) = 70` — which I reconfirm by direct
computation. **The claim `E993-R25-COVER-DIAGONAL-D7-SIGN` itself remains
REFUTED and is not reopened; only its open-scope sentence retires.** A census
status change is a registry status update, **not** an award.

### 4. The `(7,7) r = 8` cell minimum — how many minimisers

**T** ran an independent exhaustive instrument on the contract's own cover-fiber
partition (1,082 skeleton classes up to relabelling of `C`; 28,111,996
configurations with `ν = τ = 7`, both figures reproducing C-T3-U exactly) and
found the minimum `Δ_7 = −202` attained by **exactly two** configurations, which
it rebuilt as explicit order-23 trees and re-verified with a structurally
independent rooted forest DP: witness A (`i_7, i_8, i_9 = 31051, 30849, 23476`,
`Δ_8 = −7373`) and witness B (`30712, 30510, 23274`, `Δ_8 = −7236`),
non-isomorphic, both carrying a degree-≥3 connector, neither single-hub. **F**
rebuilt both from edge lists on its own instrument, confirmed `τ = ν = 7`
(exhaustive non-existence of a 6-cover), `x = 7 = r−1`, no recovery, distinct
free-tree canonical forms, and ruled "**at least** two", explicitly declining to
name a canonical witness.

**Ruling: exactly two**, on T's exhaustive enumeration — F's "at least two" is
the weaker statement available from rebuilds alone and is subsumed, not
contradicted. F's prohibition stands: **no canonical witness may be named**, and
the registered `−192` witness is a third, distinct order-23 tree at the same
cell with a strictly weaker margin (`Δ_8 = −7109`). T's strike of "`−192` is the
true minimum" is **sustained**: the registered claim certifies only that `−192`
is *attained*; minimality was a property the certificate never carried. The
refutation of the single-hub conjecture is **unaffected and strengthened** — it
needs only attainment, and the gap from the single-hub minimum `+699` widens
from 891 (to the registered witness) to **901** (to the true minimum), and is
478 over the wider disconnected single-hub core class.

**Second cell.** T independently computed the exhaustive minimum at `(7,7,9)`,
order 25: 71,596,865 configurations with `ν = τ = 7` (again exactly C-T3-U's
figure), **minimum `Δ_8 = −1035`** against the registered `−777`, unique
minimiser with `Δ_9 = −20584`, extremal skeleton carrying a **degree-4
connector**. And T reproduced C-T3-F's exhaustive single-hub minimum at that
cell, **`−252`**, which is negative — so **the single-hub family does refute
`(7,7,9)`**. **Ruling: the single-hub-worst conjecture is REFUTED at exactly two
cells, `(7,7,8)` and `(7,7,9)`; it survives against the published family only on
`r = 10..33`; T3's debt entry naming `(7,7,8)` as "the exact cell that resists"
is incomplete and is corrected here.** F's independent observation that neither
`−202` minimiser is single-hub corroborates this from the other orientation, and
F's addition — that the conjecture is therefore not uniform in `r` across
`r = 8,9,10` — is adopted.

### 5. `D_m(t)` — the name collision T and U both flagged and neither could resolve

U explicitly declined to compose its `D_m(t)` with `T-C3-01`'s, the latter being
outside its read boundary, and asked that the reconciliation be made at the
synthesis. **I make it: these are two different objects sharing one name.**

- **T1's `D_m(t)`** is the clearing denominator of the greedy dual chain in the
  unclamped regime; T1's own `K ≥ m−1` argument supplies `D_m(t) > 0`, and the
  T adjudication rules the step sound while striking the return's disclaimer
  that it "is not re-derived here" as an inaccurate self-description.
- **U2's `D_m(t)`** is the divisor of the block-substitution multipliers at
  cutoff `c`. The U adjudication struck "`D_m(t) ∝ K+1−m+t`, manifestly `> 0`
  for `t ≥ 0` exactly when `K ≥ m−1`" on two grounds: it is not strict at
  `t = 0, K = m−1`, and `K+1−j+t` is a divisor only in the low branch `j ≤ c`.
  The exact well-definedness condition for the block family is **`c ≤ K`**
  (C-U2-T); C-U2-F's corrected binding divisor is `t + K + 2 − m`.

**Ruling: no contradiction exists. `K ≥ m−1` is sufficient for both and
necessary for neither; the exact side condition for the block-substitution
family is `c ≤ K`, and it must be carried on the face of any statement about
that family. The shared name is the defect.** Cycle 4 must use distinct symbols
— the greedy-chain denominator and the block-family divisor at cutoff `c` — and
no seat may transport a positivity fact about one to the other.

### 6. Where acyclicity enters — three orientations converge on one answer

Independently, and with no shared evidence, the three orientations located the
same boundary, and I record the convergence because it is the most useful
structural fact of the cycle.

- **T (T4/C-T4-F).** The isolated-addition upper bound `x(G ⊔ K_1) ≤ x(G)+1` is
  **false for general graphs**, by an exhibited order-16 witness (the complete
  multipartite graph with parts `(6,1,…,1)`, `i = [1,16,15,20,15,6,1]`,
  `x(G) = 1`, `x(G ⊔ K_1) = 4` — false by an excess of 3). Acyclicity is
  **necessary**, not convenient. By contrast the *lower* bound
  `x(G ⊔ H) ≥ max(x(G), x(H))` needs nothing at all and holds for every finite
  simple graph (critic-attributed to C-T4-U).
- **U (U1).** At `r = 4` the exhaustive `ν = τ = 6` **forest** class has **0**
  crossing instances (`min x = 4 = r`), while the graph-scope
  complete-attachment cell at the same rank has **118** crossing instances at
  `x = 3 = r−1` (and `K_{6,7}` alone has `x = 3 < 4`, `Δ_4 = −23`). Acyclicity
  bites on the **first** difference where it demonstrably does not bite on the
  second.
- **F (C-F4-T).** Corollary F uses acyclicity exactly **twice**: König, to
  identify the stratum defined by `ν = d+1` with the one defined by `τ = d+1`
  (a bipartiteness use, not an acyclicity use — the pin `|B| = α = |V| − τ` is
  **Gallai**, true of every finite graph); and the small-`r` half, discharged by
  complete enumeration of forests. Its large-`r` half is **graph-scoped**.

**Ruled and carried forward as a design constraint on Cycle 4:** every remaining
Tier 1 approach must make forest structure do work on a **first** difference
under the crossing hypothesis; the second-difference route on the band class is
closed (U's convexity surrogate is refuted at the top of its own range), and
`x(F) < r` — not acyclicity alone, and not a comparator — must carry the sign.

### 7. Seating — a unanimous finding, not a plateau

All three adjudicators record that the load-bearing advances came predominantly
from the Opus 5 critics rather than the Sonnet 5 route seats. U records it
absolutely: *not one* load-bearing U advance came from a route seat. F records
that six of its seven new results are critic-derived and that the only seat that
produced theorems (F1, the criterion and the ceiling) is the one seat seated on
Opus 5 — by Ashton's ruling, after two Sonnet 5 dispatches were terminated by an
API-side classifier. T records the asymmetry as substantial but **not**
exclusive: T1's persistence and unconditional-bound lemmas and T3's central
refutation are seat results that survived hostile re-derivation intact.

`control/C3-STAGE1-GATE.md` §6 is explicit that a third cycle with material
progress arising predominantly from critics is **a seating finding, not a
plateau**. I so record it, and I record the nuance T supplies: the correlation
is with seat model, and the one Opus 5 route seat is the one that produced route
theorems. Also carried: the C-U3-T transport observation (the critique records
observing `--model claude-fable-5 --effort high` on its own harness process),
which no seat can verify by self-inspection and which is carried verbatim to the
controller for reconciliation against the dispatch record, exactly as the U
adjudication asked. Nothing in this synthesis turns on it.

### 8. The remaining controller attention items, ruled one by one

- **T1's typed `THEOREM`.** Downgraded, sustained: a **domination theorem** (every
  nonnegative feasible `(λ,μ)` has `μ_j ≤ μ_j^g`, doubling as an infeasibility
  criterion) plus two unconditional lemmas (persistence: a clamp at `j` forces
  `j > (2m+2)/3` and then `μ_{m−1}^g = 1/2`; and `m² > 2(d−1)` at
  `m = ⌈3d/2⌉−1` in both parities, which I re-verified for `d = 1..5000`), plus
  a **conditional** existence statement. The "exact maximiser in full
  generality" is false — at `(m,d,t) = (1,4,2)` and `(3,4,0)` the nonnegative
  feasible set is empty, so no maximiser exists — and every counterexample found
  has `3d > 2m+2`, leaving the chartered `m = ⌈3d/2⌉−1` untouched. The two
  critics' "smallest counterexample" disagreement is a search-domain artifact
  (`(1,4,2)` has `K = −2 < m−1`), not a contradiction; T ruled it so and I
  sustain. Existence is established `t`-uniformly only for `d ≤ 70` (C-T1-F,
  coefficientwise `N_j`) and, by index prefix plus clamped tail, completely for
  `d ≤ 5` (C-T1-U, with no violation to `d = 800`, `t = 10⁶`). The open index
  band grows like `d/2` from `d = 6` — precisely the region the route exists to
  cover.
- **T2's maximality warrant.** Sustained: the §3.6 quotation attributed to
  `control/C3-ALLOCATION.md` ("C2-6") **does not occur in that file, which has no
  section so labelled and contains no first-person text** — I confirmed this
  myself against the capsule copy. What the file contains at that point is
  `T-C3-01`'s *open* obligation. Two further quotations attributed to the same
  sealed member are likewise absent. The completeness claim nevertheless
  survives on **critic proofs**: both T2 critics re-proved chain optimality in
  the small-rank regime from the path structure of the constraint system, and
  C-T2-U identified the unstated lemma that rescues the greedy rule ("`a_j` dead
  ⟹ `b_{j+1}` dead"). **Credit for chain optimality in that regime belongs to
  the critics.**
- **T's near-ready Lean candidate.** The bottom-rank uniform theorem (terminal
  margin exactly `3/(d²−4)` for even `d`, `1/(d−1)` for odd `d`, strictly
  increasing in `r`) composed with the Certificate Soundness Lemma. Ruled under
  `## Lean awards`: **hold**, blocked on the generalised incidence lemmas — and
  the blocker is **not** cleared by U2 this cycle (see the next item).
- **F2's Galvin clause.** Sustained exactly as F ruled: the arXiv family is
  vendored nowhere in the run root, the seat's refusal to reconstruct it from
  memory is **correct and creditable** under this run's intolerance for
  fabricated mathematics, and an F critic located the *citation* inside the run
  root in `sources/public-docs/assessment-2026-09-20.md`. The restated controller
  item is adopted: **the vendoring request must name the property, not the
  paper** — a family whose log-concavity failure sits near `x` rather than at
  `α − 1`, which is precisely the regime the route needed and precisely what
  every failure it observed lacked.
- **The C1 errata sentence on the `d = 4` split.** The pending controller
  erratum is **confirmed**, and the canonical replacement is F's exhaustive
  `ν`-histogram over all 307,199 forests of order 18: exactly **9,532** have
  `x = 5 = r−2` at `(d,r) = (4,7)`, with `ν = 7` (344), `ν = 8` (6,958),
  `ν = 9` (2,230) — **none at `τ = ν = 5 = d+1`, none with `τ ≤ 6`**, minimum
  `ν` over the deep-crossing population `= 7 = d+3`. The errata sentence "the
  exact split is `τ ≤ d` versus `τ = d+1`" is **not supported at that cell**. The
  decisive test the brief set is thereby answered **in the route's favour**: the
  band one over supplies no counterexample to the general-`d` statement, and the
  344 forests at `ν = 7` are literally the same objects as the 344 crossing
  forests of the `(d,r) = (6,6)` stratum cell read at a different `(r,d)`.
- **`control/C2-REFUTATION-WITNESSES.json` published after the Stage 2 seal.**
  Sustained as a **packet-scope item, not a seat fault**: the Stage 2 packet is
  the worker packet the Stage 3 seats verified (71/71), the Stage 3 packet is the
  critics' packet sealed after the returns were written, so no Stage 3 seat could
  read the edge lists. C-F3-U's strike C-2 is **overturned** and both the F3 and
  F4 seats are exonerated; C-F3-T's carefully scoped version of the same finding
  is sustained. **Cycle 4 fix: the witnesses record, or an equivalent entry under
  `sources/fixtures/`, must be a Stage 2 worker-packet member**, since the worker
  brief made those fixed points mandatory while the packet did not carry them.
- **The digest-marked pointer record to the Cycle 2 compiled fragments
  (`Gamma`/`D2`, `guardTranslation`).** Recorded as discharging, for Cycle 4, the
  source-availability gap U4 correctly refused to close by reconstruction. **U4's
  refusal is ruled the most creditable judgment in the U portfolio** — a
  seat-authored reconstruction would not be a re-declared copy of anything, could
  silently invert a guard or an inequality direction, and would import an
  unverifiable premise into a project whose whole value is that every non-new
  line is digest-traceable. The conditions both U4 critics specify are adopted:
  the excerpt must state its hypothesis as frozen ENTRY 12 `ordinaryG1Guards`
  verbatim, and must disambiguate **which** `Gamma` is meant, the token occurring
  187 times in `control/CLAIM-IDENTITY.run-local.json` as an unrelated claim
  family.
- **`F-C3-01`'s successor naming.** Recorded: the Cycle 4 portfolio below names
  the cover-cell falsification successor with changed vocabulary and does not
  reuse `DRIFT-DIRECTED-COVER-CELL-FALSIFIER`.

### 9. Disjointness, and what does *not* reconcile because it does not meet

T3/T4, F1/F2/F3, and U3/U4 touch objects no other orientation touched this
cycle, and I record their independence rather than inventing agreement: T4 has
no rank index, no excess, no matching and no cover hypothesis; T3 is the cover
branch at `τ = d = 7` with no matching object; U3's compiled content is a
statement about Catalan integers with no graph in it; U4's is infrastructural
and sign-free. **No status transfers between tiers, between forests and G1
tuples, or to FOREST / TREE / TRANSFER / Erdős #993 anywhere in this synthesis.**
`OB-G1` is a different claim and is untouched.

---

## Exact established results

Grades follow `SOLUTION-CONTRACT.md` §4. Critic-derived results are marked
**[critic]** with their attribution. For each theorem I state exactly where `d`,
`ν`, `τ` and `x(F) < r` enter. Everything below is at `proved_informal` or
better unless explicitly graded as bounded computation.

### A. New this cycle, composed at the synthesis

**A1. The diagnostic band at `d = 5`, for `r ≤ 260`.** For every forest `F` with
`|V(F)| = 2r+5` and `x(F) < r`, and every `r ≤ 260`: `Δ_r(F) ≤ 0`. Grade
**`proved_informal`** (the weakest link; never `formally_verified`). Dependency
DAG, every edge named: the `d = 5` window reduction [cover half
`E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`, VERIFIED `proved_informal`; matching
half `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`, **formally verified**;
König for `τ = ν`] + **Corollary F at `d = 5`** [`proved_informal`, **[critic,
C-F4-T]**] + **Lemma (L)'s top-rank step `Bd(r,r) < 0` on `6 ≤ r ≤ 260`**
[`proved_informal`; closed-form reconstruction **[critic, C-U1-T and C-U1-F,
concurring]**, adjudicator-verified, re-verified here] + complete enumeration of
the `ν = τ = 6` class at `r = 4, 5` [585/0 and 7,469/1, the single crossing
instance having `Δ_5 = −235`] + emptiness of the class for `r ≤ 3`. *Entry:*
`d = 5` fixes the order; `ν` and `τ` enter as `ν = τ = 6`, forced by the window
reduction; **`x(F) < r` is load-bearing and does the work** — it is the
hypothesis, Corollary F converts it to `x = r−1` exactly, and the top-rank
concavity step converts `Δ_{r−1} < 0` into `Δ_r ≤ 0`. Open for `r ≥ 261` on the
three named repairs.

### B. Exact theorems, uniform in `d` (matching branch)

**B1. Certificate Soundness Lemma (T2).** If nonnegative `λ_j, μ_j` make
`coef_b(j) ≥ 1` on every alive `b_j` and `coef_a(j) ≤ 1` on every alive `a_j`,
then `Δ_r(G) ≤ 0`. **Unconditional in `(m,d,r)`.** `proved_informal`;
dependencies named — the outside/inside incidence inequalities generalised
through `K = 2m−d`, **plus the ℕ/ℤ reconciliation [critic, C-T2-F]**, which
`SEMANTIC-CONTRACT.md` makes binding and without which the summation step is not
licensed. *Entry:* `m` through `2(m−j)` and `j ≤ m`; `d` **only** through
`K = 2m−d`; `r` through `|X| = 2r−K`, `(r+1−j)` and the alive ranges; `ν` beyond
`m`, `τ` and `x(F) < r` **do not enter at all** — this is the **bare** branch.

**B2. Matching branch at rank `r = d`, uniform in `d`** **[critic, C-T2-U]**.
For every `d ≥ 3` and every finite simple graph of order `3d` carrying a
matching of size `m(d) = ⌈3d/2⌉−1`: `Δ_d(G) ≤ 0`, by an explicit nonnegative
rational certificate with terminal (mode-A) margin exactly **`3/(d²−4)` for even
`d`** and **`1/(d−1)` for odd `d`**, every intermediate `coef_a ≤ 1` by
inspection. **No horizon.** `proved_informal`. *Entry:* as B1 with `r = d`;
bare, no crossing hypothesis. This is the run's first uniform-in-`d`
matching-branch sign statement.

**B3. Domination, persistence, and the unconditional bound (T1).** (i) For every
`m ≥ 1`, `t ≥ 0`, `K = 2m−d`, `r = t+K ≥ m−1`: every nonnegative feasible
`(λ,μ)` has `μ_j ≤ μ_j^g` at every `j`; hence `μ_j^g < 0` **certifies
infeasibility**. (ii) A genuine clamp at `j` forces `j > (2m+2)/3`, and from the
first clamp `δ_j = 0` persists to `j = m−1`, giving `μ_{m−1}^g = 1/2` exactly.
(iii) At `m = ⌈3d/2⌉−1`, `m² > 2(d−1)` for every `d ≥ 1` in both parities, hence
`m(t+m) > 2(d−1)` for every `t ≥ 0`. All `proved_informal`. *Entry:* `d` only
through `K`; no `ν`, `τ`, `x(F) < r`. I re-verified (iii) for `d = 1..5000` and
the whole window table.

**B4. LP fidelity, dual side** **[critic, C-T1-F]**. The closing inequality
`μ_{m−1} ≥ (d−1)/(m(t+m))` is exactly the feasibility of the omitted `j = m`
column pair, so the reduced `C1/C2` system plus the closing inequality is
**exactly equivalent to the full column system**. `proved_informal`. The
**primal** side — that the generalised `A_j, B_j, E_j` incidence lemmas hold for
arbitrary `(m,d)` — is explicitly left open and no T route may claim it.

**B5. Block-substitution fidelity at the rational-function level (U2
obligation (i)).** For `m ≥ 1`, `0 ≤ d ≤ 2m`, `K = 2m−d`, cutoff `c ≤ K`: the
block-substitution multipliers satisfy `coef_b(j) ≡ 1` for every `j` and
`coef_a(j) ≡ 1` on the high stratum, identically in `t`, with `λ_m = 1/(t+m)`
and `μ_{m−1} = (d−1)/(m(t+m))`; and at `(m,d,c) = (7,5,3)` they are **termwise
the Cycle 1 award certificate**, confirmed by a third independent instrument.
`proved_informal`, **with the structural caveat `E_m ≡ 0` on its face** [critic,
C-U2-F]: because `λ_m := 1/(t+m)` by construction, the family can never express
a certificate whose slack sits on the top stratum — which is exactly the shape
of the frozen C3 `(5,4)` certificate. Obligation (i) is fidelity to the `(7,5)`
**encoding**, not to the LP or to the run's certificate family of record, and
must be graded as such. It does **not** reach the cleared nonnegative-integer
`A_j, B_j, E_j` polynomials the Lean encoding consumes.

### C. Exact theorems, parameterized with explicit thresholds (cover branch and stratum)

**C1. Corollary F** **[critic, C-F4-T]**. For every forest `F` with
`τ(F) = ν(F) = d+1`, `|V(F)| = 2r+d`, `d ∈ {2,…,6}`: `x(F) ≥ r−1`, equivalently
`Δ_k(F) ≥ 0` for every `k ≤ r−2`. `proved_informal`, adjudicator-verified end to
end. *Entry:* `τ` through `τ = d+1` only, fixing the number of fibers and hence
the negative budget `Σ_{s} C(τ,s)·Cat_{k−s}`; `ν` through `ν = τ` only, the pin
`|B| = α = |V| − τ = 2r−1` being **Gallai** and König being needed only to
identify the two strata; `d` through `τ = d+1` only, which is why it is uniform
in `d` — **but only to the Catalan ceiling `τ ≤ 12`**, so any claim of unlimited
uniformity in `d` is unsupported; **`x(F) < r` is NOT a hypothesis** — the
conclusion constrains crossing depth, it never assumes a crossing. Acyclicity
enters exactly twice (König; the small-`r` census). DAG closed, with the census
half named as an enumeration obligation.

**C2. The Catalan-dominance bound at rank `r−2` (Theorem D)** **[critic,
C-F4-T]**. Thresholds `R(τ) = 2, 2, 5, 6, 7, 8, 10, 12, 19, 44` for `τ = 3..12`,
ceiling `τ ≤ 12` from `(5/4)^τ − 1 < 16`, upward closure in `r`.
`proved_informal`; an extension of registered machinery
(`E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` + `E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR`)
to one rank lower and to `τ ≤ 12`, not a new object. **I reproduced all ten
thresholds exactly and confirmed `τ = 13` never holds (scanned to `r = 400`),
and that the criterion is the rank-`(r−2)` analogue of the rank-`(r−1)`
criterion of record: two Catalan steps instead of one, threshold `4 → 16`,
ceiling `7 → 12`.**

**C3. The exact finite-rank criterion (F1, seat-originated).**
`Δ_{r−1}(F) < 0 ⟺ drift_r(F) > (d − τ + 1)/2`, **with the hypothesis `r > τ` in
the statement** — load-bearing, not cosmetic: form I divides by `r − |T|` and
`|T| = r` is reachable exactly when `r ≤ τ`, and four of the eight
originally-closed cells have `r ≤ τ`. Every sentence reasoning in drift terms
about those four cells is struck. `proved_informal`, twice independently
re-derived. DAG closed on the VERIFIED
`E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` (form II is that statement verbatim at
`k = r−1`; only form I needs Pascal) plus the structure lemma and Hall
equivalence, the latter used only for exhaustiveness of the parametrisation.

**C4. The drift ceiling (F1, seat-originated).** `λ·4^λ = ((5/4)^τ − 1)/(2e ln 2)`,
hence `drift(F) < λ*(τ)` strictly, **stated as a bound on `lim_r drift_r` and
not as a finite-rank bound**, and carrying the Addendum §A2 relation.
`proved_informal`; strictness supplied by C-F1-T's irrationality argument.
Roots: `λ*(6) = 0.41827085570…`, `λ*(7) = 0.50000257126957448354…`,
`λ*(8) = 0.58500851234…`; the knife edge is `λ*(τ) > 1/2 ⟺ (5/4)^τ − 1 > 2e ln 2`
with `u_6 = 2.814697265625 < 3.768338770727… < u_7 = 3.76837158203125`, which I
reconfirm. **Both amendments are mandatory in any registration.**

**C5. `sup{drift(F) : F a finite forest with τ(F) = 7} < 1/2`** **[critic,
C-F1-U]**. `proved_informal`, adjudicator-verified (tail lemma at `M = 12`;
exhaustive maximum `−474217/8388608` over 19,448 multisets; controls at `τ = 6`
and `τ = 8` confirm the method does not over-prove). Strictly stronger than C4
at `τ = 7`, where the ceiling is inconclusive by `2.57e−6`. Closes F1's knife
edge.

### D. Exact theorems with no `d`, `ν`, `τ` or crossing hypothesis

**D1. Disjoint-union lower bound** **[critic, C-T4-U]**.
`x(G ⊔ H) ≥ max(x(G), x(H))` for **all finite simple graphs** — two lines from
`I(G ⊔ H) = I(G)·I(H)`, using only nonnegativity of coefficients. The T4 seat's
`x(G ⊔ K_1) ≥ x(G)` is the `H = K_1` instance; the restriction to forests
needlessly narrows the seat's own theorem. **Not** the fenced convolution
closure (`E993-TRANSFER-TO-FOREST`): no closure property of a sequence class is
assumed. Register at the general altitude, critic-attributed, with the seat's
form as corollary.

**D2. Isolated-vertex stratum (T4).** `x(nK_1) = ⌈n/2⌉` at every order; the
odd-`n` plateau correctly excluded as a non-descent. `proved_informal`.

**D3. `(★) ⟹ the leaf crossing-shift bound` (T4).** Complete informal proof,
using `(★)` only at order `n−1`. `proved_informal`.

**D4. Theorem 1 — drift is padding-invariant (F3, seat-originated).** `drift` is
additive over disjoint union for every finite graph and `drift(K_1) = 0`, hence
`drift(F ⊔ mK_1) = drift(F)`. `proved_informal`, **with `α` read as `deg I`**
(the return's `α = |V| − ν` differs off the König–Egerváry class; `C_5` separates
them). **Tier-relevance nil:** it touches no `Δ_r`, no `x`, and no crossing
hypothesis. Any registration must claim padding invariance only and make **no**
near-miss, threshold or `Δ_r`-proximity claim.

**D5. Lemmas C1–C4** **[critic, C-F2-T, with C4 independently and identically
proved by C-F2-U]**: disjoint-union multiplicativity; no internal zeros;
log-concave ⟹ single crossing ⟹ the cell consequent collapses to `Δ_{r−1} > 0`
with no recovery possible; isolated-vertex padding preserves log-concavity. C3
is the bridge the F2 return needed and never supplied. `proved_informal`.

**D6. `F-C3-03` obligation (a) ⟺ strict Tier 1**, in both directions **[critic,
C-F3-T and C-F3-U jointly]**. `proved_informal`. On the crossing class,
"unattained supremum of `i_{r+1}/i_r`" means `Δ_r < 0` throughout, which is
`E993-R25-UNR-FOREST-WIDE` with `≤` replaced by `<`; and `sup ≥ 1` is discharged
by the explicit crossing family `P_8 ⊔ pK_1` (crossing with `x = r−1` on all 21
rows, ratio rising strictly from `1/4` to `99727/110480`).

**D7. The corrected fiber trichotomy and the empty-fiber identities** **[critic,
C-F4-T and C-F4-U]**. With support guards `|S| ≤ r−t` and `ρ_S ≤ r+t+|S|`:
positive `⟺ ρ_S ≤ 2|S|+2t−1`; zero `⟺ ρ_S = 2|S|+2t`; negative
`⟺ ρ_S ≥ 2|S|+2t+1`. And `term_∅(r−1) = C(2r−1,r) − C(2r−1,r−1) = 0` while
**`term_∅(r−2) = C(2r−1,r−1) − C(2r−1,r−2) = Cat_r`** — I verified both
identities for every `r ≤ 79`. Elementary; the corrected statement is an
instance of the registered `E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR` and is not
new.

### E. Compiled, kernel-verified Lean fragments

**E1. The monotone-ratio group (U3 obligation (1)).** For every `τ, k : ℕ` with
`1 ≤ τ ≤ k`: `Γ(τ,k)·Cat_{k+2} < Γ(τ,k+1)·Cat_{k+1}`; hence from any base
`0 < Γ(τ,K)` with `τ ≤ K`, `0 < Γ(τ,k)` for every `k ≥ K`; with the seven bases
`K(1..7) = 0, 2, 3, 4, 6, 12, 70`; and `Γ(τ,k) < 0` for every `τ ≥ 8`, `k ≥ τ`.
**Compiled fragment, kernel-verified**, 33/33 declarations axiom-clean, closed
compiled DAG, clean copy-out replay by the U adjudicator. *Entry:* `τ` as the
cover cardinality in the extensional `τ = ν` form; **`d`, `ν` and `x(F) < r` do
not enter at all** — it is a statement about Catalan integers, not about any
graph. Not fixed-band; not uniform in `d` because `d` is absent. **Awarded
below.** I independently reconfirmed every numeric: `K(1..7)`; the ceiling
(`Γ(τ,k) < 0` for `τ = 8..16`, `k = τ..300`); the minimality witnesses
`Γ(2,1) = 0` (a **plateau**, not a strict negative), `Γ(3,2) = −1`,
`Γ(4,3) = −4`, `Γ(5,5) = −14`, `Γ(5,6) = +18`, `Γ(6,11) = −1563`,
`Γ(7,69) = −799363812466329793611557404284949737`; and the Addendum §A2
criterion `(5/4)^τ − 1 < 4 ⟺ τ ≤ 7`.

**E2. The shared-base bridge (U4).** `Σ_{j ∈ range(M.card+1)} |stratum G M k j|
= coeff G k` for every finite graph `G`, every `M : Finset X`, every `k : ℕ`.
**Theorem, kernel-verified, new, infrastructural** — hypothesis-free, uniform in
`M.card`, needing no cover, matching or connectivity hypothesis; sign-free, so
it cannot by itself imply any `Δ_k` sign statement. Confirmed on 21,870 exact
cases including 18,347 disconnected instances and 20,555 with `M` not a cover
[critic, C-U4-F], and re-proved in Lean by a different Mathlib route [critic,
C-U4-T]. **Its practical reach is the cap form**, which is critic-attributed and
**not yet folded in** — until it is, the clause "removes the standing
prerequisite from every award path" is **not discharged**.

### F. Bounded computations, at their attained horizons, never universal

| # | statement | horizon / grade |
|---|---|---|
| F1 | **73-cell partition `45 closed / 28 refuted / 0 undetermined`** | exhaustive per cell over the complete cover-shape parametrisation, conditional on the structure lemma; four independent instruments; four of the eight closed-cell minima established parametrisation-free; the 37 `(7,7)` cells additionally carried by a `proved_informal` arithmetic certificate. **A registry status update inside two REFUTED claims and one OPEN schema, not a new claim and not an award.** |
| F2 | Cell minima `−202` at `(7,7) r=8` (**exactly two** non-isomorphic order-23 tree minimisers, `Δ_8 = −7373` and `−7236`) and `−1035` at `(7,7) r=9` (unique minimiser, `Δ_9 = −20584`, degree-4 connector) | exhaustive at orders 23 and 25 only; **not** a universal statement about the diagonal |
| F3 | Single-hub exhaustive minima: `+699` at `(7,7,8)` (arms `(3,2,2,2,2,2,2)`), `−252` at `(7,7,9)` (arms `(3,3,3,2,2,2,2)`) | exhaustive over the single-hub family; 111 of 1,002 arity classes have `τ = ν = 7` ("exhaustive over arities 1..21" — the class count is 1,002 at order 23, the omitted class having `τ = 1`) |
| F4 | **Zero forests with `x ≤ r−2` on any `τ = ν = d+1` stratum cell of order ≤ 18** across `d = 2..8`, and none at the `(6,7)` cell of order 20 (619,095 forests); every crossing instance at `x = r−1`; at `r < d+1` the stratum does not cross | exhaustive to order 18 (order 20 at one cell) |
| F5 | The `ν = τ = 6` window census at `d = 5`: `585/0`, `7,469/1`, `43,377/4,065`, `167,717/43,390`, `504,097/192,015` at `r = 4..8`, **every crossing instance at `x = r−1`** | exhaustive, `r ≤ 8`; the canonical 4,065 and 192,015 hit exactly by independent instruments |
| F6 | `Bd(r,r) < 0` for every `r ∈ [6,260]`, `Bd(r,r) ≥ 0` exactly on `r ∈ {2,3,4,5}` | closed-form reconstruction, exact integers; re-verified here |
| F7 | `t`-crossover thresholds `t*(d) = 24, 32, 42, 3, 49` at `d = 9, 14, 15, 17, 20`; the `d = 2..20` diagonal feasible-cutoff table | exact, `d ≤ 20` |
| F8 | T2's 44,700-cell band sweep, `d ∈ [2,300]`, band-exhaustive, zero resistance; byte-identical replay under two independent critic instruments | `d ≤ 300`; **2 of the cells (`d = 4`) are unannounced replays of the VERIFIED `E993-C3-GRAPH-MATCHING5-THIRD-BAND-SIGN`, which owns the entire `d = 4` matching branch** |
| F9 | Leaf crossing-shift bound at orders ≤ 18, by composing D3 with the exhaustive order-≤17 census of `(★)` — 3,397,265 vertex instances, 0 violations, max deficit exactly 1, identical deficit histograms from both critics | order 18; **re-certified as critic-attributed**, the return's own citation having been unbacked at the seat |
| F10 | Intermediate-multiplier nonnegativity: coefficientwise for `d ≤ 70` at every `t ≥ 0` [C-T1-F]; `t`-uniform for an index prefix plus the clamped tail, hence complete for `d ≤ 5`, no violation to `d = 800`, `t = 10⁶` [C-T1-U] | `d ≤ 70` exact in `t`; open on an index band growing like `d/2` from `d = 6` |
| F11 | No non-log-concave forest with `τ ≤ 7` at any order ≤ 21, none with `τ ≤ 6` at any order ≤ 24; `τ = 12` the smallest **observed** cover, attained by `T(3,4,4)` **and its six padded variants `T(3,4,4) ∪ jK_1`, `j = 1..6`**; open band `τ ∈ {8,…,11}` | as stated; "only `T(3,4,4)`" is struck over forests |
| F12 | Exhaustive forest closure of the cover cells `(7,8) r=5`, `(6,6) r=6,7,8` on the **actual** cell predicate, with `min x = r` exactly at each | critic-attributed jointly to C-F2-T and C-F2-U; adjudicator-corroborated at three of four |
| F13 | **Zero recovering forests anywhere**, every route, every critic, every adjudicator; largest single census all 515,786 forests of order ≤ 18 at every valid rank, plus every forest of order ≤ 20 with `τ ≤ 7` | bounded evidence; **a null census is insufficient for any tier** |
| F14 | T4's stress sample: 84 objects, 6,599 vertex checks, **attained horizon 1,771** (not 2,200); max deficit 1 | a sample, graded as one |

### G. Open bridges (named, not graded as results)

Corollary F's finite-census half; the extension of the rank-`(r−2)` bound past
`τ = 12`, where `(5/4)^τ − 1 ≥ 16` and fiber counting provably cannot close the
stratum; the uniform-in-`r` form of the arithmetic certificate at `(7,7)` with an
explicit `r₀ ≤ 34`; the monotone tail lemma for the certificate's `NCAP` box; the
`τ ∈ {8,…,11}` non-log-concave band; Lemma (L)'s three tail repairs (plus the
newly located fourth singular family); the all-index dual positivity lemma; the
primal-side generalised incidence lemmas; the `indepCount` closed forms at ranks
4–6; the `Gamma`/`D2` and `guardTranslation` composition (source-availability,
now controller-discharged for Cycle 4); and strict Tier 1 itself.

---

## Refuted or narrowed mechanisms

**Refuted outright, with exhibited witnesses or exact computations.**

1. **The single-hub-worst-case conjecture** — refuted at `(7,7,8)` and
   `(7,7,9)`, and under every broadening tested (all paddings, depth 3,
   disconnected cores, arbitrary arity, the narrow degree-`τ` reading). Any
   future "worst skeleton" ansatz must reach skeletons carrying a **connector of
   degree ≥ 3**; the extremal object at both cells lies outside both the
   single-hub and connector-tree families.
2. **`x(G ⊔ K_1) ≤ x(G)+1` for general graphs** — false by an excess of 3 on an
   exhibited order-16 witness. Acyclicity is necessary.
3. **The Schur-convexity conjecture** — regraded from `conjecture` to
   **REFUTED** [critic, C-F4-U], three exact majorization-decreasing transfers
   exhibited and the violation counts reproduced exactly by the adjudicator
   (`τ = 6`: 15 at `r = 10`, 68 at `r = 11`, 186/15 at `r = 12`, 720/135 at
   `r = 14`). **The Lemma-(L) Hall machinery must not be spent generalising it.**
4. **The `4/9 (mod 1)` reformulation of the `c(d) ≠ d` transitions** — refuted:
   every one of the nine controller-verified witnesses has drift strictly below
   `4/9`, and the modular dressing is vacuous by construction.
5. **The convexity surrogate for the band's head** (U1 §4.3/§8) — false **at the
   top of its own stated range**, at every rank exhaustively tested (`r = 4..8`),
   under the record-faithful `k₀`. With it falls the accompanying thesis that
   acyclicity supplies the missing constraint on realizable profiles: on the
   narrow range Hall alone suffices, and on the record's range the statement is
   false, so no constraint on realizable profiles can prove it.
6. **"Cross-level consistency is needed for `Bd(r)`"** — refuted by an explicit
   per-level reconstruction matching the record at all four quoted values (I
   reproduced it).
7. **The two-block substitution dual** — 0 survivors at
   `d = 5, 9, 14, 15, 17, 20` [critic, C-U2-F], closing U2's own debt item 3
   negatively.
8. **Drift as a near-miss statistic** — refuted by an exhibited witness pair at
   the same order, same rank and same drift `−1/6` with **opposite signs of
   `Δ_4`**; drift is rank-free by construction and cannot resolve the sign of
   `Δ_r`. What is earned is padding invariance (D4) and nothing more.
9. **The claim that all sign at rank `r−2` comes from the nonempty fibers** —
   false: `term_∅(r−2) = Cat_r`, whose share of `Δ_{r−2}` is 133 % at `(8,20)`
   and 106 % at `(12,60)`; at large `d` the nonempty fibers are net **negative**
   and the positivity is carried entirely by the fiber the F4 return said
   contributes nothing.
10. **The `(7,8)` cell closed by the ceiling alone** — struck twice over: the
    criterion's own hypothesis `r > τ` fails there (`r = 5 ≤ τ = 7`), and a bound
    on `lim_r drift_r` cannot close a finite-rank cell (the extremal crossovers
    `drift_10 > 1/2 > drift_11` at `τ = 6` and `drift_33 > 1/2 > drift_34` at
    `τ = 7` are exactly the empirical cell boundaries). The cell nevertheless
    survives, on the exhaustive minimum `+755` and on the arithmetic certificate.

**Narrowed, not struck.**

- **T1's existence claim** — from "proved uniformly in `d`" to "`t`-uniform for
  `d ≤ 70`, plus a `t`-uniform index prefix and the clamped tail at every `d`;
  open on a band growing like `d/2` from `d = 6`". **T1's Theorem 1** — from
  "maximiser" to "upper bound / domination", the maximiser reading valid only
  where the chain is itself nonnegative, the empirical dividing line `3d ≤ 2m+2`.
- **T2's completeness warrant** — from a non-existent citation to a
  critic-supplied proof on the path structure of the constraint system plus the
  unstated "`a_j` dead ⟹ `b_{j+1}` dead" lemma. **T2's slack lead** — the
  `Θ(1/d)` fit is struck (implied exponents 1.28 and 2.59 from the return's own
  three points), the binding quantity is the **mode-A** margin, and the hardest
  rank is `r = d`, the **bottom** of the band, not the top.
- **T3's 37-cell evidence** — from "consistent with eventual closure" to "no
  refutation inside a family proved non-extremal on the same diagonal"; **no
  direction of evidence attaches.** (The cells are nevertheless closed, by F.)
- **T4's lower bound** — to the `K_1` instance of a graph-general two-line lemma
  (D1). **T4's upper-bound candidate** — to "the surviving `K_1` residue of the
  REFUTED `E993-FOREST-FIRST-DESCENT-DISJOINT-UNION-UPPER-ADDITIVITY`, implied by
  the OPEN `E993-TGT-FOREST`, and **exactly** the two-term condition
  `i_{x+1}(G) < i_{x−1}(G)` or `i_{x+2}(G) < i_x(G)` [critic, C-T4-F]" — a
  rank-`(x+1)` no-recovery condition, **not** an independent foothold.
- **F1's criterion** — to `r > τ`. **F1's ceiling** — to a bound on the limit,
  carrying the §A2 relation and C-F1-T's strictness argument. **F1's eight
  closed-cell minima** — correct, but critic-attributed and
  adjudicator-corroborated rather than backed by shipped evidence (no generator
  ships for that row). **F1's disconnected skeleton counts** — `274 / 1,082`, not
  `285 / 1,097`; the over-count is duplication, never omission, so no
  `exhaustive` verdict weakens, but "every count computed up to isomorphism" is
  false for those entries.
- **F2's "certified"** — to exhaustive-over-trees to order 18 plus bounded
  computation over forests; the cells are nevertheless closed, on critic
  evidence, on the **actual** cell predicate. **F2's `τ = 12`** — to smallest
  *observed* cover, not a floor, with the open band `τ ∈ {8,…,11}` named. **The
  route's chartered premise is void**: on every non-log-concave object the run
  possesses, `x = mode_first = mode_last` and the single log-concavity failure
  sits at rank `α − 1`, so `x` and the mode never separate.
- **F3's interpretive headline** — "the near-miss is entirely a padding
  artifact" is **false as stated**: the near-miss is real (the supremum is
  genuinely approached on the crossing class) and a statistic blind to `r` is not
  evidence that the movement is spurious. **F3 option (a) is retired, not
  re-chartered** — it is a restatement of strict Tier 1 and cannot yield a Tier 3
  reduction; its chartered debt ("the exact family where the supremum argument
  fails") is **ill-posed**, since no family fails.
- **F4's family claim** — struck, with its "material reduction within an
  explicit, well-motivated sub-family" verdict: not one of the 4,410 crossing
  stratum forests to order 18 lies inside the return's leaf-vector family.
- **U1's "REDERIVATION COMPLETE"** — two of four mandatory items delivered;
  `Bd(r)` and the tail chain absent from the return and discharged by the
  critics. **U1's graph-scope probe** — graded **non-evidence**: it cannot
  express the `r = 5` witness of record, excludes every padded configuration, and
  its null result is false of the cell it was chartered to test.
- **U2's headline negative** — **overturned**: the two negativity sets are
  exactly complementary, so at every one of the five failing `d` the
  single-contiguous-block family supplies a **fully nonnegative dual at every
  rank `t ≥ 0`** (cutoff `j*+1` below `t*(d)`, cutoff `j*` at and above). What
  survives is only "*no `t`-constant cutoff is feasible at those five `d`*" — a
  restriction the obligation never imposed. "Exact refutation" is not earned.
  The `(m,d)` plane the obligation names **remains unsearched**; the diagonal
  restriction is a self-narrowing.
- **U3's obligation-(2) diagnosis** — struck: the "resisting node" (the
  edges-plus-components identity) is **already proved and sealed** as frozen
  ENTRY 58, in a strictly more general `[Finite V]`/`Nat.card` form; the work
  there is transcription, not derivation. **The real obstruction is the
  `indepCount` closed-form machinery at ranks 4–6** (the frozen file supplies
  closed forms only through `i_3`). `K(1..7)` are certified on the
  **sufficiency** half only; minimality is in no declaration.
- **U4's specialization claim** — struck: frozen entries 108 and 157 and award
  entry 19 are hypothesised on **incidence caps**, not cardinalities, and at the
  real use sites `M.card` is 4, 10 and 14, never 2, 5 or 7. The bridge is
  `M.card`-indexed where every real use site is **cap**-indexed; the cap form is
  the correct generalization and both critics supplied it kernel-checked.

**Mechanism-equivalence and fences.** All three adjudicators instantiated the
mechanisms against the registered refuted families rather than reasoning about
them abstractly, and none collapses. The fenced comparator `6K₂ ∪ (2r−7)K₁` is
**correctly excluded by the threshold rather than colliding with it** (`ν = 6 <
m(5) = 7`; the LP is infeasible at `(m,d) = (6,5)` at every rank tested in three
independent oracles) and is reproduced with `x = r+1` throughout, so it is never
a counterexample to a crossing statement. The `d = 3` bare-matching fences are
respected (`m(3) = 4 > 3`). The three `SOLUTION-CONTRACT.md` §3 fixed points are
reproduced by exact counts — `P_8` (`x = 2`, `Δ_3 = −15`), C2 (`Δ_r > 0 ⟺ ≤ 1
edge`), C3 (`d = 4`, both halves, exhaustive over all 329 forests of order 10,
and over 367,729 `(forest,r)` instances to order 18, zero violations on both
branches). **A recurring seat-side defect** is recorded for the controller: all
twelve returns between them shipped certification literals contradicted by their
own artifacts — absent citations, counts against the wrong population, horizons
overstated beyond the attained value, a minimality property imported into a
certificate that never carried it, and three instances of a **wall-clock field
inside hashed evidence**. In every case the mathematics survived and the
certification did not. **Adopt the F adjudicator's rule: when an artifact carries
an unhashed block, only payload digests may be certified.**

---

## Headline verdicts

Exact evidence-grade verdicts, per target, with **no status transfer between
them**.

**Tier 1 — `E993-R25-UNR-FOREST-WIDE` (for every finite forest `F` and `r ≥ 1`
with `|V(F)| ≥ 2r+2` and `x(F) < r`, `Δ_r(F) ≤ 0`): OPEN. Unmoved.** No route
proved it, no route refuted it, and no route reduced it. The nearest approach in
the whole cycle — `F-C3-03` option (a) — is proved to be a **restatement** of
Tier 1's strict form, not a reduction of it, which if anything measures how far
the headline remains. The strongest supporting evidence is negative and bounded:
**zero recovering forests anywhere**, at every horizon reached (largest single
census: all 515,786 forests of order ≤ 18 at every valid rank, plus every forest
of order ≤ 20 with `τ ≤ 7`). Per `SOLUTION-CONTRACT.md` §4 **a null census is
insufficient for any tier** and this is not offered as evidence for one. The
Tier 1 crossing lead `(★)` (`x(H−w) ≥ x(H) − 1` for every finite forest `H` and
every vertex `w`) is **OPEN**, verified exhaustively to order 17 (3,397,265
vertex instances, max deficit exactly 1) with the smallest all-vertex break at
**order 7, with exactly five witnesses**.

**Tier 2 — `E993-G1WIDE-NO-SIZE-CAP`: OPEN. Untouched this cycle.** The G1
ambient coupling was deliberately unallocated and deferred to Cycle 4; no Cycle 3
route is a Tier 2 route and none quotes a ten-guard figure. The one Tier 2-adjacent
movement is administrative and real: the ten-guard census convention is
**RECONCILED** with exact agreement in every per-order and per-`d'` cell
(265,749 vertex triples / 224,403 pointed isomorphism classes over 522,934 trees
of order 8..19, zero recoveries in either count), which lifts the gate's quoting
embargo. The standing structural facts are unchanged: every ordinary G1
counterexample has `d' ≥ 5` (`d' = 3` conditional on the `(4,3)` certificate); at
`d' = 5` the residual has `ν ≥ 6` with `ν = τ = 6` the unique unresolved profile;
guard 8 never binds.

**Tier 3a — the matching-branch schema `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`:
OPEN, materially advanced, with the residue now reduced to three named items.**
Advanced by B1 (Certificate Soundness, unconditional in `(m,d,r)`), B2 (the
**first uniform-in-`d` sign statement of the run**, at rank `r = d`, no horizon),
B3 and B4. The residue, exactly: **(i)** the all-index dual positivity lemma
(`N_j` coefficientwise nonnegative for every `j ≤ m` whenever `3d ≤ 2m+2`) —
open on an index band growing like `d/2` from `d = 6`, established for all
`t ≥ 0` at every `d ≤ 70` and completely for `d ≤ 5`; **(ii)** T2's half, bounded
to `d ≤ 300`, **except at `r = d` where B2 closes it for every `d` in closed
form**; **(iii)** the **primal-side** LP-encoding fidelity — the generalised
`A_j, B_j, E_j` incidence lemmas for arbitrary `(m,d)`, verified in the record
only at `(7,5)`. Item (iii) is **not** cleared by U2 this cycle: B5 reaches only
the rational-function level for one family, and that family has `E_m ≡ 0`, so it
cannot express a certificate whose slack sits on the top stratum. The
unconstrained relaxation `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF` is
**re-confirmed VERIFIED** and was used, never re-derived, at every T route
(audited line by line by both T1 critics).

**Tier 3b — the cover branch: `c(d) = min(d,5)` for forests remains VERIFIED at
`proved_informal`; the diagonal remains REFUTED at every `d ≥ 6`; `c(6) = 5`
exactly; `c(7) ∈ {5,6}` and `5 ≤ c(d) ≤ 7` for `d ≥ 8` are UNCHANGED.** The
chartered deliverables "determine `c(7)`" and "the exact endpoints of the
`(7,7)` exceptional band" were **not** delivered. What moved is the census: the
73-cell partition is now **45 closed / 28 refuted / 0 undetermined**, a registry
status update at the grade stated above, with the `D7` scope line retirable
cellwise on three mandatory conditions. Also established: the single-hub-worst
conjecture is refuted at exactly two cells, and the true cell minima at
`(7,7) r = 8, 9` are `−202` (exactly two minimisers) and `−1035` (unique).

**Tier 3c — the window reduction `E993-R25-WINDOW-REDUCTION`: OPEN as a schema;
its `d = 5` instance is unconditional and the table is DELIVERED and correct at
every row.** Under `c(d) = min(d,5)` and `m(d) = ⌈3d/2⌉−1` the window is
`[c(d)+1, m(d)−1]`: **empty at `d ≤ 4`; exactly `{6}` at `d = 5`; `{6,7}` at
`d = 6`; `{6,…,9}` at `d = 7`; `{6,…,10}` at `d = 8`**, and widening at every
`d ≥ 6`. I recomputed the whole table. It is stated over the **BARE** matching
branch, per Addendum §A4. The schema does not close because its cover half is
`c(d) = min(d,5)` rather than the true `c(d)`, and because the matching half is
uniform only at `r = d`.

**The diagnostic band — `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`: CLOSED
INFORMALLY for every `r ≤ 260` (every forest of order ≤ 525), at
`proved_informal`; OPEN for `r ≥ 261`.** The composition and its full DAG are in
`## Reconciliation` §2 and `## Exact established results` A1. The residue for
`r ≥ 261` rests on **exactly** Lemma (L)'s three recorded tail repairs — the
`m = b+1` boundary case, `C(b,m) ≤ 2^{2r−1−ρ}`, and the `max_{ρ ≥ j} D ≥ 0` step
— **and on nothing else**; every other input is horizon-free, and the matching
half of the window reduction is formally verified. This is the largest single
movement of the cycle, and it is a **fixed-horizon** close of a **diagnostic**,
graded as such: it is not a headline, it transfers to no tier, and a band result
remains a band result.

**FOREST (`E993-TGT-FOREST`), TREE, TRANSFER (`E993-TRANSFER-TO-FOREST`), and
Erdős #993 — ALL UNCHANGED. NO STATUS TRANSFER, in either direction.** FOREST
(weak unimodality of every forest) is **OPEN** and is untouched: Tier 1 is a
proper subclaim of it and Tier 1 did not move. TREE is **OPEN** and untouched;
`E993-UNIV-TREE-TRS2` remains REFUTED at Kadrawi–Levit order 26 and is not
reopened. TRANSFER remains **REFUTED** — no convolution closure of unimodal
sequences — and nothing in this cycle reopens it; D1 in particular is **not** a
closure claim, assuming no closure property of a sequence class, only
nonnegativity of coefficients and a sign computation. **Erdős #993 itself is
unchanged**, and nothing here bears on it: closing G1 alone would not solve it,
the diagnostic band is a diagnostic, and the run's own headline is Tier 1, which
is open. The typed verdict for the run appears once, in the stop-gate block
below.

---

## Lean awards

Judged under the protocol's duty 4: **award only stable, materially useful
declarations with closed dependency DAGs at their exact scopes** — a uniform
theorem, a parameterized theorem with explicit threshold functions, or a
reduction theorem in honest conditional form; a fixed-band theorem only if named
as fixed-band; repackaged identities, null searches and finite exhaustive
decisions do not qualify. Each of the four candidates on the table is reconciled.
No orientation contested another's Lean recommendation: T recommends no T award,
F recommends no F award, U recommends exactly one.

### Award group 1 — AWARDED. `E993-R25-CATALAN-GAP-MONOTONE-RATIO` (working key; the controller assigns the registry key)

**Scope: a theorem uniform in `τ` with explicit thresholds, about Catalan
integers. It is not a graph theorem, not fixed-band, and not uniform in `d`
because `d` does not occur in it.** It must never be packaged, quoted or
registered as `c(d) = min(d,5)`.

**Exact statements and hypotheses for the Stage 7 contract** (namespace
`Erdos993G1.U3`; elaborated types as read off a clean copy-out build by the U
adjudicator):

```lean
noncomputable def Gamma : ℕ → ℕ → ℤ :=
  fun τ k => ↑(catalan (k+1)) − ∑ j ∈ Finset.Icc 1 τ, ↑(τ.choose j) * (if j ≤ k then ↑(catalan (k−j)) else 0)

theorem Gamma_unfold {τ k : ℕ} (hk : τ ≤ k) :
    Gamma τ k = ↑(catalan (k+1)) − ∑ j ∈ Finset.Icc 1 τ, ↑(τ.choose j) * ↑(catalan (k−j))

theorem monotone_ratio (τ k : ℕ) (hτ : 1 ≤ τ) (hk : τ ≤ k) :
    Gamma τ k * ↑(catalan (k+2)) < Gamma τ (k+1) * ↑(catalan (k+1))

theorem gamma_pos_of_base (τ K : ℕ) (hτ : 1 ≤ τ) (hK : τ ≤ K) (hbase : 0 < Gamma τ K) :
    ∀ k : ℕ, K ≤ k → 0 < Gamma τ k

theorem gamma_pos_1 … gamma_pos_7    -- the seven bases K(1..7) = 0, 2, 3, 4, 6, 12, 70

theorem gamma_neg_of_ge_eight (τ k : ℕ) (hτ : 8 ≤ τ) (hk : τ ≤ k) : Gamma τ k < 0
```

**Hypotheses, stated as load-bearing.** `(hτ : 1 ≤ τ)` and **`(hk : τ ≤ k)`** are
necessary, not decorative: 25 violations of the denominator-free monotonicity
occur at `k < τ`. The integer zero-extension guard `if j ≤ k` is a **convention
of record** and must be declared as one — Addendum §A2 is silent on `Cat_{k−j}`
for `k < j`, and the guard is exactly what decides `K(1) = 0` (truncated natural
subtraction would give `K(1) = 1`). The `K(1..7)` literals are certified on the
**sufficiency** half only unless the minimality witnesses are added.

**Dependency DAG for Stage 7 — closed, every edge compiled, zero `sorry`,
depending on pinned Mathlib alone:**

```
Mathlib (succ_mul_catalan_eq_centralBinom, Nat.succ_mul_centralBinom_succ,
         catalan_eq_centralBinom_div, add_pow)
  ├─ catalan_pos, catalan_mul_recurrence
  │    ├─ catalan_strict_logConvex  [RENAMED — see condition (i)]
  │    │     └─ catalan_cross_strict ───────────────────────┐
  │    ├─ catalan_le_succ ─ catalan_strict_two_step ─ gamma_one_pos   (τ = 1)
  │    └─ catalan_succ_lt_four_mul ─ catalan_pow_bound ─ catalan_cross_lower
  │                                                          │
  └─ Gamma, Gamma_unfold, Gamma_zero                         │
       ├─ monotone_ratio  ◄──────────────────────────────────┘
       │    └─ gamma_pos_of_base ─┬─ gamma_base_{2..7} (kernel `decide` via centralBinom) ─ gamma_pos_{2..7}
       │                          └─ gamma_pos_1 (via gamma_one_pos)
       └─ binom_five_pow_split, five_pow_ge ─ gamma_neg_of_ge_eight
```

**Artifact receipt.** Lean 4.32.2, Mathlib pinned
`905b95818eb32af7874a58b427f50c1711a5e96c`, shared Mathlib bound **by symlink**
and never copied, no `lake update`/`lake clean`; `Build completed successfully
(8657 jobs)`, exit 0; **33/33 declarations report exactly `[propext,
Classical.choice, Quot.sound]`**; no `sorry`, `admit` or `native_decide`.
`LeanProof/Main.lean` digest
`e5785f1c707e28fc4190a159ac8f5d5b10914ce619857c821bdd28db9fe43a18`. This meets
`SOLUTION-CONTRACT.md` §4's gate conditions **on the artifact side only**; the
governed `lean-proof-workflow` (frozen theorem contract, independent informal
audit, kernel/axiom receipt, independent fidelity attestation, canonical close)
remains controller-invoked and is not claimed here.

**Seven conditions before promotion — none mathematical, all mandatory.**
(i) Rename `catalan_strict_logConcave` → `catalan_strict_logConvex` and correct
the matching prose: the statement `catalan (n+1) * catalan (n+1) < catalan n *
catalan (n+2)` is strict log-**convexity**, the exact reverse of its name. **No
fence is breached** — the objects are Catalan integers, not `i_k(F)`, and it is
proved, never assumed — but the run's fence list reads "no log-concavity
premise, ever", and a compiled fragment carrying the fenced word for its opposite
is a live hazard for anyone assembling a contract by name.
(ii) Declare the integer zero-extension guard as a convention of record, citing
`SEMANTIC-CONTRACT.md`, not §A2.
(iii) Either add the threshold-**minimality** witnesses — `Γ(2,1) = 0` (a
**plateau**, not a strict negative), `Γ(3,2) = −1`, `Γ(4,3) = −4`,
`Γ(5,5) = −14`, `Γ(6,11) = −1563`,
`Γ(7,69) = −799363812466329793611557404284949737`, all of which I reproduce —
or restate the `K(1..7)` literal as the sufficiency half only. The `τ = 2,3,4`
witnesses sit at `k < τ`, **outside `Gamma_unfold`'s domain**, so the guard is
load-bearing for the minimality half too.
(iv) Register the alias: `gamma_pos_4` is, after unfolding, frozen ENTRY 149
`Erdos993G1.ThirdWide.catalan_gap_pos` — an already formally verified frozen
result. Gate ruling 7 makes this a separately reported step and the return
reported none. **It is an alias, not a dependency: the project re-derives it
independently and imports nothing.**
(v) Adopt either the ratio form over `ℚ` or the denominator-free cross-multiplied
form as the statement of record.
(vi) Correct the literals — 33 declarations (not 32); `C(142,71)` has 42 digits
(not 41); strike the Part-4 attribution for `Γ(5,5)`/`Γ(5,6)` (no declaration
computes either value) and ship a digested generator for every numeric claim.
(vii) If obligation (3)'s `cover_pad_to_five` is carried alongside, weaken its
`3 ≤ r` to `1 ≤ r` or drop it, so it covers the `r = 2` cell it exists to serve.

**Ruling on the standing prerequisite.** `control/C3-ALLOCATION.md` item 12 makes
`U-C3-04`'s shared base a prerequisite of every award path. **It does not bind
this award**, and I rule so explicitly: the award object declares `Gamma` itself,
contains no G1 definition (`indepCount`, `coeff`, `delta`, `stratum` do not
occur in it), imports no frozen or awarded entry, and closes its DAG against
pinned Mathlib alone. The prerequisite binds any award that **composes** frozen
or awarded G1 fragments — which is every other candidate below.

**Excluded conclusions, stated as duty 4 requires.** This award does **not**
establish `c(d) = min(d,5)` in Lean; does **not** establish any statement about
forests, covers, matchings, `Δ_k`, `i_k`, `x(F)`, or any graph whatever; does
**not** establish the minimality of `K(1..7)` unless condition (iii)'s witnesses
are added; does **not** touch Tier 1, Tier 2, Tier 3a, the diagnostic band,
FOREST, TREE, TRANSFER or Erdős #993; and carries **no** implication for the
`τ ≤ 5` cover cells, whose obstruction lies elsewhere entirely.

### Award group 2 — NOT AWARDED. Corollary F (the stratum depth theorem)

**Hold; the leading Cycle 4 award candidate.** Statement stable, DAG closed,
materiality genuine — it is a parameterized theorem with explicit thresholds
holding at five distinct excesses by one argument, it is **not** a fixed-band
result, and it is the statement the gate itself names as sufficient for the
diagnostic band. **What blocks it:** the finite-census half — at `d = 5, 6` the
131,848 stratum forests of order ≤ 18 would need a certified enumeration — and
the fact that the pinned Mathlib has **no matching number**, so even the
hypothesis must be carried extensionally as `τ = ν`. A Stage 7 contract would
additionally need the Catalan-dominance chain at rank `r−2` (C2) formalised. The
`U-C3-04` prerequisite binds it. **The blocker is removable in one cycle** by the
Hall-tightened budget route below, which would drive `R(6)` and `R(7)` to 2 and
delete the census half outright.

### Award group 3 — NOT AWARDED. The matching branch at rank `r = d`, uniform in `d` (B1 ∘ B2)

**Hold.** Statement stable; materiality real — the run's first uniform-in-`d`
matching-branch sign theorem, with no horizon, and an explicit rational
certificate well suited to formalisation. **The DAG is not closed:** it depends
on the outside/inside incidence lemmas in general `(m,d)` form, verified in the
record only at `(7,5)`. That is `U-C3-02`'s explicit charter and it did **not**
land this cycle (B5 reaches one family at the rational-function level, with
`E_m ≡ 0`). Until it lands the candidate is a **reduction theorem whose honest
conditional form must carry the generalised incidence lemmas as an explicit
hypothesis** — and in that form it is admissible under duty 4, but the honest
conditional adds little over the informal statement, so I recommend holding
rather than awarding a conditional. The `U-C3-04` prerequisite binds it (it
composes award-run entries).

### Award group 4 — NOT AWARDED. F1's exact criterion and drift ceiling

**Not award-material, and I rule against awarding either even conditionally.**
The criterion is registrable at `proved_informal` with `r > τ` in the statement,
but its Lean materiality is low: **form II is the registered VERIFIED
`E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` verbatim at `k = r−1`**, and only form
I adds Pascal — duty 4 excludes repackaged identities, and although the
equivalence is genuinely more than a repackaging, its substance is already
formalised. The ceiling is a real-analytic bound with a transcendental constant,
ill-suited to the pinned Mathlib, and — as the `(7,8)` strike demonstrates — it
closes no cell by itself. Both should be **registered** at `proved_informal` with
their mandatory amendments; neither should reach the governed workflow.

### Other candidates considered and excluded

`E2`, the shared-base bridge, is **kernel-verified infrastructure, not a claim**:
sign-free, it cannot imply any `Δ_k` statement, and it is a prerequisite that
carries an award rather than being one. The 73-cell partition is a **registry
status update**, and duty 4 excludes finite exhaustive decisions and null
searches. T1's Theorems 3a/3b are correct closed-form lemmas inside a dual
argument, not graph-level sign theorems. T3's refutation is an exact finite
computation with exhibited witnesses — **registrable and it should be**, but not
a Lean target, and its registration text must drop the minimality wording, add
the second cell `(7,7,9)`, and state the family over which the search is
exhaustive. D1 is a genuine unconditional theorem but is two lines. `A1`, the
band close at `r ≤ 260`, is `proved_informal` with a **horizon** and composes a
`proved_informal` cover half; it is not a Lean target this cycle.

**Net: one award group. `no award attempted` does not apply.**

---

## Progress and stop-gate ruling

**The stop gate, armed at this close** (`control/C3-SYNTHESIS-PROTOCOL.md`
duty 5, `SOLUTION-CONTRACT.md` §6). A **decisive event** is a verified Tier 1 or
Tier 2 theorem, a verified reduction strictly shrinking the remaining class, or
an exact counterexample. A **plateau** requires evidence of no material progress
over two consecutive cycles, and the protocol states it is not applicable at
Cycle 3 unless the evidence is overwhelming.

**No decisive event.** No Tier 1 or Tier 2 theorem was proved, at any grade. No
exact counterexample to any tier or to the band exists anywhere in the evidence —
zero recovering forests at every horizon reached, and no crossing forest with
`x ≤ r−2` on any `τ = ν = d+1` stratum cell tested. The two strongest candidates
for "a verified reduction strictly shrinking the remaining class" both fall
short on inspection: the band close at `r ≤ 260` is `proved_informal` (not
verified), carries a horizon, and reduces a **diagnostic**, not the Tier 1 class;
and the 73-cell partition is a registry status update on cellwise statements at
fixed `(τ,d,r)` that transfer to no tier. **The gate is not tripped by a decisive
event.**

**No plateau, and the opposite of one.** The gate's condition requires evidence
of *no* material progress over two consecutive cycles; this cycle supplies the
contrary on all three orientations independently, and each adjudicator ruled
`material_progress: yes`, `orientation_plateau: no` on its own record. The cycle
produced: a diagnostic band closed informally to `r = 260`; the first
uniform-in-`d` matching-branch sign theorem of the run, at one rank, with no
horizon; an award-ready kernel-verified Lean node with a closed compiled DAG; a
73-cell census moved to `45 / 28 / 0` on four independent instruments; an exact
refutation of the single-hub conjecture at two cells with the true minima and
witnesses computed; a parameterized stratum-depth theorem uniform across five
excesses; three refutations that remove wrong directions from the next cycle
(Schur-convexity, the convexity surrogate, `4/9 (mod 1)`); a false negative
overturned at five `d` values; a chartered route retired as a restatement of the
headline; and two chartered debts discharged with exact answers. `SOLUTION-CONTRACT.md`
§6's continuation conditions (a), (b) and (c) are each independently met — (a) a
new actual-graph mechanism whose unresolved dependency is strictly weaker than
Tier 1 (Corollary F's stratum-depth argument), (b) a new proved reduction of a
remaining class (the band, to `r ≥ 261` on three named repairs), and (c) a
candidate ready for the Lean gate (Award group 1).

**The seating finding, recorded not as a plateau.** All three orientations record
that the load-bearing advances came predominantly from the Opus 5 critics.
`control/C3-STAGE1-GATE.md` §6 directs exactly this case to be recorded as a
seating finding, and I so record it, with T's nuance: the correlation is with
seat model, and the one route seat seated on Opus 5 is the one that produced
route theorems. **This is a controller-review item for the Cycle 3 close, not
evidence of exhaustion.**

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

---

## Cycle 4 route portfolio

Four genuinely distinct routes per orientation, consistent with the three
adjudicators' next-route allocations and adjusted only where this synthesis's
cross-orientation rulings make an allocated route stale. Each names what it can
close, or honestly name as debt, in one cycle. **Per Ashton's ruling every Cycle
4 route seat returns to Claude Sonnet 5 xhigh**; the critic, adjudicator and
synthesis stages stay at Opus 5 high. Two allocated routes are **re-chartered
here and the reason is stated**, because neither adjudicator could see the
other's evidence.

### T routes (prove)

1. **`T-C4-01 ALL-INDEX-DUAL-POSITIVITY`.** Prove `N_j` coefficientwise
   nonnegative for every `j ≤ m` whenever `3d ≤ 2m+2` — the all-index
   generalisation of the VERIFIED
   `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`, whose `j = m` instance is
   that claim. Established: coefficientwise for `d ≤ 70` [C-T1-F];
   `t`-uniformly for `j ≤ max(⌊(K+1)/2⌋, 2m−2d+2)` and the clamped tail, hence
   completely for `d ≤ 5` [C-T1-U]; the exact residual inequality is
   `g_{j−1} ≥ 2(m−j+1)(2j−K−1)/(j(t+j))` with `g_j = 2(m−j)μ_j^g`. **Closes:**
   T1's existence claim uniformly in `d`, hence Tier 3a's `t ≥ 0` half
   unconditionally at the dual level. **Must not** re-attack `Q_{m,d}`'s
   positivity or re-derive the `(7,5)` fit. **Debt:** the exact `d` and index at
   which the induction resists.
2. **`T-C4-02 SMALL-RANK-BAND-UNIFORM`** (highest-value T route). Extend B2's
   `r = d` closed-form certificate to the whole band by proving (a) monotonicity
   of the mode-A margin in `r` (zero decreasing steps to `d = 300`) and (b) a
   uniform positive lower bound on the a-budget margin (observed in
   `[0.378, 0.393]` and increasing in `d`). **Closes:** T2's half of the matching
   branch **uniformly in `d`**, retiring the `d ≤ 300` horizon and making Award
   group 3 Lean-ready the moment the primal-side lemmas land. A finite amount of
   algebra on a three-term recursion. Extending the horizon past `d = 300` is
   explicitly **not** the plan of record. **Debt:** the rank at which the
   monotonicity argument resists.
3. **`T-C4-03 COVER-CELL-EXACT-MINIMA`.** Generalise the cover-skeleton
   parameterisation (1,082 classes at `τ = 7`; `|E_CC| + q ≤ 6`) to exact cell
   minima at `(7,7,r)` for `r ≥ 10`, to determine the **exact upper endpoint of
   the `(7,7)` exceptional band** (undelivered, bounded above by `r = 71` via
   `K(7) = 70`), and to open the untouched `τ = 6, d = 7` cells that `c(7)`
   needs. The method is proven: it reproduced both known cells exactly and found
   the true extremal family. **Closes:** the exact endpoints, and plausibly
   `c(7)` exactly. T owns the exact minima; F owns the search direction.
   **Debt:** the exact resisting cells by `(τ,d,r)`.
4. **`T-C4-04 STAR-UPPER-BOUND-VIA-NO-RECOVERY`.** Attack the isolated-addition
   upper bound in its true form: by C-T4-F's Lemma B it is **exactly**
   `i_{x+1}(G) < i_{x−1}(G)` or `i_{x+2}(G) < i_x(G)`, a rank-`(x+1)`
   no-recovery condition, and it is **false without acyclicity** (order-16
   witness), so forest structure must do the work — which is what Tier 1 needs
   and what no route has yet made it do. **Closes:** a genuinely
   forest-specific foothold on Tier 1 at a single rank, or a counterexample.
   **Must not** be proved by importing forest unimodality; that is the fenced
   premise. **Debt:** the smallest order at which the forest argument resists.

### F routes (falsify)

1. **`F-C4-01 HALL-TIGHTENED-CATALAN-BUDGET`** (highest expected value in the
   orientation). The rank-`(r−2)` bound charges every independent fiber of size
   `s` its unconstrained maximum `Cat_{k−s}` and never uses the Hall condition
   `|N(S) ∩ B| ≥ |S|`, which the stratum supplies free through its `C`-into-`B`
   perfect matching. Tighten the negative budget with it and recompute `R(τ)`.
   **Closes:** `R(6)` and `R(7)` driven to 2, which deletes Corollary F's census
   half entirely and makes **Award group 2 Lean-sized with a fully closed DAG**;
   and, with C-F4-T's cell-by-cell residues, the extension of the stratum
   theorem to `d = 7..11` (the Catalan ceiling `τ ≤ 12` is the hard stop).
   **Debt:** the exact `τ` at which the tightened budget stops improving `R`.
2. **`F-C4-02 BAND-COMPOSITION-AUDIT`** — **re-chartered.** The allocated route
   was "discharge Lemma (L)'s three tail repairs, audit the window reduction,
   then compose". **The composition is performed in this synthesis and the tail
   repairs move to the U orientation** (they are analytic inequalities on
   `Bd(r,k)`, and U reconstructed that object). What remains for F, and what F
   should own, is the **audit**: independently re-derive the two inputs this
   synthesis could not audit from inside its capsule — the cover half `c(5) = 5`
   and the `ν = τ = 6` reduction of the band — and independently reproduce
   Corollary F's finite-census half at `d = 5` (`r ∈ {3,4,5}`). **Closes:** the
   `r ≤ 260` band result on audited rather than recorded inputs, and its
   registration. **Debt:** any input whose re-derivation diverges from the
   record.
3. **`F-C4-03 NON-LOG-CONCAVE-COVER-FLOOR-8-TO-11`.** Settle whether a
   non-log-concave forest exists with `τ ∈ {8,…,11}`, using a `τ`-capped
   generator (both F2 critics showed this makes the orders the seat called
   unaffordable routine), paired with a vendoring request that names the
   **property** rather than the paper: a family whose log-concavity failure sits
   near `x` rather than at `α − 1`. **Closes:** the smallest cover a
   non-log-concave forest can carry; and, composed with Lemma C3, a decision on
   whether non-log-concavity can reach a small-rank cover cell at all — which on
   C-F2-U's M1 it currently cannot. **Debt:** the smallest `τ` at which the
   capped generator becomes unaffordable.
4. **`F-C4-04 COVER-CELL-EXHAUSTION-AND-CERTIFICATE-TAIL`** (the `F-C3-01`
   successor, **renamed with changed vocabulary** as directed; it is not a
   re-charter of the drift-directed falsifier). Close the two cover cells no
   current instrument reaches — `(6,6)` at `r = 11` (order 28) and `r = 12`
   (order 30) — with the `τ`-capped generator; ship a digested generator for the
   eight positive cell minima; and prove the monotone tail lemma for
   `max_n [W(n,t)(n − 2t − c)]⁺` beyond the argmax, which both critics showed a
   naive bound does not supply. **Closes:** the full `45 / 28 / 0` partition on
   shipped rather than critic evidence, and the arithmetic certificate's last
   conditionality. **Debt:** the exact cell at which the capped generator
   resists.

### U routes (formal / structural)

1. **`U-C4-01 LEMMA-L-TAIL-UNIFORM`** — **re-chartered, and this is the
   highest-value route in the run.** The allocated `BAND-RESIDUE-AT-THE-RECORD-k₀`
   is **stale**: it asked for `x ≥ r−1` on the `ν = τ = 6` class, which Corollary
   F proves, and U could not see it. What is now the band's *only* residue is
   Lemma (L)'s tail. Discharge the three recorded repairs — the `m = b+1`
   boundary case, `C(b,m) ≤ 2^{2r−1−ρ}`, and the `max_{ρ ≥ j} D ≥ 0` step — plus
   the **fourth singular family located this cycle** (`m = −1`, true
   zero-extended value `+1`), and prove `Bd(r,r) < 0` for **every** `r`. Consume
   `Bd(r)`, `k₀(r)` and the `[6,260]` range as discharged; do not re-derive them.
   Adopt the `k₀(r)` definition fixed in `## Reconciliation` §1. **Closes:
   `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` unconditionally in `r`.** **Debt:**
   the exact repair that resists, with the `(b,m)` profile.
2. **`U-C4-02 MONOTONE-RATIO-STAGE-7-SUBMISSION`** (the award path). Take Award
   group 1 to the governed Lean gate **as its own award**, after the seven
   conditions above, adding the minimality witnesses so `K(τ)` is certified as a
   **threshold** rather than a sufficient base. **Do not** package it as
   `c(d) = min(d,5)`, which is not Lean-ready. **Closes:** the run's third formal
   award and the gating node named at the Cycle 2 close. **Debt:** whether the
   `ℚ` ratio form or the denominator-free form becomes the statement of record.
3. **`U-C4-03 COVER-CELLS-INDEPCOUNT-RANKS-4-TO-6`** (unblocks
   `c(d) = min(d,5)`). Transcribe frozen ENTRIES 58, 59, 43–44, 54 and
   `cover_cross_edges_le` (ENTRY 172, already general in `C`) into a pinned
   project under the seat's scratch — **transcription, not discovery** — then
   build the `indepCount` closed forms at ranks 4, 5, 6 that the four remaining
   `τ = 5` cells need, with the card-5 sparsity bounds `2, 2, 2, 3` at orders 11,
   13, 15, 17 taken as given. **The obstruction is these closed forms, not frozen
   ENTRY 58**, which is already proved and sealed in a more general form.
   **Closes:** obligation (2), hence `c(d) = min(d,5)` as a complete Lean target.
   **Debt:** the smallest rank at which the closed form resists.
4. **`U-C4-04 CLAMPED-DUAL-AND-THE-SMALL-RANK-RESIDUE`** (Tier 3a). The
   block-substitution family is **settled and must not be re-attacked**: it is
   `t`-crossover feasible, it has `E_m ≡ 0`, and it has no two-block member.
   Adopt the **capped-greedy / clamped** dual as the object; close the finite
   small-rank residues left by the certified tail duals (`r ∈ [9,40], [13,57],
   [15,70], [17,35], [19,86]` at `d = 9, 14, 15, 17, 20` — wider than T2's
   registered band and so not absorbed by it) by the `omega` route the `(7,5)`
   award already uses; and deliver the **primal-side** generalised incidence
   lemmas for arbitrary `(m,d)`, which is what Award group 3 is blocked on. Carry
   the corrected side condition `c ≤ K` and the distinct names for the two
   `D_m(t)` objects. **Closes:** Tier 3a's `t ≥ 0` half at the five failing `d`,
   or an exact impossibility; and, with `T-C4-02`, Award group 3. **Debt:**
   whether the clamp-binding pattern admits a single rational family on the whole
   ray or only a piecewise one.

### Deliberately not chartered

Option (a) of `F-C3-03` (a restatement of strict Tier 1, retired). The
Schur-convexity conjecture (refuted; the Lemma-(L) machinery must not be spent
generalising it). The leaf-vector / pendant-star family (provably contains none
of the crossing phenomenon at every cell where the truth is known). Any re-attack
on the drift ceiling as a finite-rank instrument, or on drift as a near-miss
*measure* rather than a padding-orbit invariant. The convexity surrogate on the
band class. Re-derivation of `Q_{m,d}`'s positivity or of the `(7,5)` fit. The
single-attachment graph-scope probe. Any route on the cover diagonal or on
`min(d,6)` / `min(d,7)`. Further probing of the `τ ≤ 5` cells. `c(d) ≠ d` for
`d ≥ 31`. The G1 ambient coupling remains deferred; guard 8 never binds and the
Δ-level coupling has no deductive power, so it is not chartered here either.

---

## Continuation ruling

**Continue to Cycle 4 under the portfolio above.** The stop gate found no
decisive event and no plateau, and all three of `SOLUTION-CONTRACT.md` §6's
continuation conditions are independently met. Four cycles of the six-cycle
ceiling remain.

**The exact earliest honest continuation obligations**, in the order a Cycle 4
controller should read them:

1. **Define `k₀(r)`** in the Cycle 4 gate, verbatim as fixed in
   `## Reconciliation` §1, and record that Lemma (L) has **four** singular
   families, not three.
2. **Discharge Lemma (L)'s tail.** It is the band's only residue and the single
   cheapest unconditional result available to the run.
3. **Register the corrected texts before any Cycle 4 seat quotes them:** the
   single-hub refutation **without** the minimality wording, **with** the second
   cell `(7,7,9)`, and stating the family over which the search is exhaustive;
   the `(7,7) r = 8, 9` cell minima with **exactly two** non-isomorphic
   order-23 minimisers at `−202` and no canonical witness named; the `D7` scope
   retirement on its three conditions; the `d = 4` errata replacement as the
   `ν`-histogram; `E993-C3-GRAPH-MATCHING5-THIRD-BAND-SIGN` named as covering the
   entire `d = 4` matching branch (so two of T2's 44,700 cells are replays); the
   T4 lower bound at the graph-general altitude; and the T4 upper bound carrying
   both its relations.
4. **Fix the packet scope.** `control/C2-REFUTATION-WITNESSES.json`, or an
   equivalent under `sources/fixtures/`, must be a **Stage 2 worker-packet**
   member, since the worker brief makes those fixed points mandatory. Add
   `control/C1-CENSUS-ERRATA.json`'s corrected `d = 4` row at the same time.
5. **Fold the cap-form bridge and vanishing lemma into the shared base** before
   any award path relies on it; the shipped `M.card`-indexed form reaches no real
   use site.
6. **Close the certification gap.** Adopt the payload-digest rule for artifacts
   carrying unhashed blocks; require a shipped digested generator for every
   numeric claim without exception; and add to the worker common brief the four
   recurring defect species named in `## Refuted or narrowed mechanisms`.
7. **Reconcile the transport items:** the C-U3-T observation against the dispatch
   record, and the post-seal drift on `control/C3-STAGE4-AGENTS.json`.
8. **Act on the seating finding** at the controller's Cycle 3 review, which is
   due at this close.

**What would end the run.** A verified Tier 1 or Tier 2 theorem; a verified
reduction strictly shrinking the Tier 1 class; or an exact counterexample — a
single actual forest with `x(F) < r`, `|V(F)| ≥ 2r+2` and `Δ_r(F) > 0`, with
every hypothesis reproduced by exact counts. None exists in any evidence before
me, and nothing in this cycle projects onto FOREST, TREE, TRANSFER or Erdős #993.

---

## Artifact inventory

Written by this seat: **exactly one file** outside its scratch,
`cycles/cycle-3/stage6/SYNTHESIS.md` (digest reported in the closing message,
computed after the final write). Scratch under the ABSOLUTE path
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20/scratchpad/S-C3/`.
No system temporary directory, no `mktemp` and no `TMPDIR` at any point; no
in-place redirection onto any inventoried artifact; no sealed, frozen or
awarded object written to; nothing under `sources/`, `runs/`, `control/` or
any other seat's scratch modified.
Exact integer and exact rational arithmetic throughout (Python `int`,
`fractions.Fraction`); no floating point in any decision, only in printed
decimals of exactly-computed rationals; no wall-clock field in any output listed
here. No literal filesystem path outside the run root is quoted anywhere in this
file; the run root's own absolute path appears only where the dispatch requires
the ABSOLUTE scratch path.

| artifact | SHA-256 | purpose |
|---|---|---|
| `scratchpad/S-C3/seal_audit.py` | `35ac251fbf64952d8089697834bcdff9576411d0970f166de40c260a699f4739` | canonical seal recomputation of the Stage 6 dispatch capsule and the Stage 5 packet; all 12 member digests and byte counts |
| `scratchpad/S-C3/seal_audit.txt` | `270325f3dcdbf064bcb067aa6c2c3a32e8099b1843856c4d49e5e6fd050132d2` | transcript: dispatch seal MATCH, 12/12 members exact, Stage 5 seal MATCH |
| `scratchpad/S-C3/verify1.py` | `3dd5787304dd07d7cd68a77862d823996baea47b489c45247ec7e89e77fc3a89` | `Γ(τ,k)` from `SEMANTIC-CONTRACT.md`'s integer zero extension; `K(1..7)`; the `τ ≥ 8` ceiling; the minimality witnesses; the Addendum §A2 criterion |
| `scratchpad/S-C3/verify1.txt` | `9707af015d1faf6ff2d8b332464028ef0f433a62ba4dab691190e7d1178fd3ce` | output: `K(1..7) = 0,2,3,4,6,12,70`; `Γ(2,1)=0`, `Γ(3,2)=−1`, `Γ(4,3)=−4`, `Γ(5,5)=−14`, `Γ(5,6)=+18`, `Γ(6,11)=−1563`, `Γ(7,69)` as quoted; ceiling clean on `τ=8..16`, `k=τ..300`; `(5/4)^τ−1<4 ⟺ τ≤7`; `<16 ⟺ τ≤12` |
| `scratchpad/S-C3/verify2.py` | `b28aaffbeb55cd200aa69c32cd1573e8998a9fbac0b5667df249758768511526` | `D(b,m)`, `Bd(r,k)` and **`k₀(r)`** reconstructed from binomials; `D(2r−1,r) = −Cat_r`; the two empty-fiber identities |
| `scratchpad/S-C3/verify2.txt` | `2613c9b03cc614ab1e6edd22ee6384e1e9cee84c32b6b4ec0a313756cf52621a` | output: `Bd = +48, +33, −16, −14406` at `r = 4,5,6,10`; `Bd(r,r) < 0` on all of `[6,260]`; the `r − k₀(r)` table reproducing the record exactly; window empty at `r = 4,5` |
| `scratchpad/S-C3/verify3.py` | `349caf65c65a21fd9a3a0f30b7e93376bdff7c9deace4227692eb07238a30793` | Corollary F / Theorem D thresholds `R(τ)`; the matching-branch arithmetic and the full Tier-3c window table; `m² > 2(d−1)`; the mode-A margin closed forms |
| `scratchpad/S-C3/verify3.txt` | `8b8594301c9ba865bf95c76c37fc8deb68460299a48d0b43a9036cad4b7f9d4b` | output: `R(3..12) = 2,2,5,6,7,8,10,12,19,44`, `τ = 13` never holds to `r = 400`; window empty at `d ≤ 4`, `{6}` at `d = 5`, `{6,7}` at `d = 6`; `m² > 2(d−1)` for `d = 1..5000` |
| `scratchpad/S-C3/verify4.py` | `dfdaac7c70517b4d1eedd9d419f750236cf82d6af5313f9eff15d93ea828d0f9` | extension of `Bd(r,r)`'s sign beyond the mandated horizon (bounded evidence only; load-bearing for nothing) |
| `scratchpad/S-C3/verify4.txt` | `3647ba7dafbf35f2684aab84218f9cfeafe7c71cc3c6634ed859d01fc4b8b7f2` | output: no `r ∈ [6,1200]` has `Bd(r,r) ≥ 0`; `D(b,−1) = D(b,b+1) = +1` |

**Replay commands** (all in-root; `verify4.py` is the long one and was polled in
a bounded loop on its own task id):

```bash
RR=/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20
cd "$RR/scratchpad/S-C3"
python3 seal_audit.py        # capsule seal + 12/12 member digests
python3 verify1.py           # K(1..7), ceiling, minimality witnesses, A2 criterion
python3 verify2.py           # D, Bd, k0 table, empty-fiber identities
python3 verify3.py           # R(tau), window table, matching-branch arithmetic
python3 verify4.py           # Bd(r,r) sign beyond r = 260 (bounded evidence)
```

**Read, not written:** the capsule's 12 members at the digests tabulated in
`## Identity and seal audit`; `SOLUTION-CONTRACT-ADDENDUM-1.md`; the directory
structure under `sources/`; plus `verity.md` and `identity/startup-protocol.md`
as separately authorized by the mandatory-boot rule. **Not read:** any Cycle 3
return, critique or scratch; any prior-cycle synthesis, return, critique,
adjudication or scratch; any failed lineage; any other experiment root; any
manuscript, repository state or external source.

**Background jobs.** The one background computation was polled to completion on
its own task id and its output retrieved before this write; a process check
immediately before the final write shows none belonging to this seat. This file
was reread before close. The model disclosure line for this seat is given once,
in the header above.
