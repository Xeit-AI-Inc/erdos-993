# Cycle 6 Neutral Synthesis

Neutral Stage 6 synthesis of **Cycle 6 — the charter's LAST cycle** of run
`erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`. Isolated seat; the
three adjudications, the sealed controller facts and the commissioned second-read
report are the evidence, and every ruling below is mine.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted this session by
reading exactly the two authorized files at the VerityOS root — the root constitution
`verity.md` (subsystem map, source-of-truth rules, the experiments subsystem's
bounded / reversible / non-durable status, and the observe → propose → review →
approve → promote inbox gate) and the startup protocol under `identity/` (the default
operating sequence and its task-type → subsystem map). Per that map this is
`experiments/` work, so the only subsystem loaded is this run root, through the sealed
Cycle 6 Stage 6 dispatch capsule and the run-root authority the dispatch names
(`SOLUTION-CONTRACT.md`, `SEMANTIC-CONTRACT.md`, `control/CLAIM-IDENTITY.run-local.json`,
`sources/`). No `writing/`, `operations/`, `projects/`, `decisions/`, `logs/`,
`memory/`, `knowledge/`, `inbox/` or `conversations/` file was opened. This synthesis
is an experiment-local Stage 6 artifact and proposes no durable VerityOS record
change; every registration named below is a recommendation to the controller, and I
have written no registry.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit
parameter); the seat cannot self-inspect its runtime model/effort — stated on
dispatch-record authority.

**Autonomy and delegation.** No question was put to the controller; every point the
protocol left open is decided below and disclosed. No child agent was spawned at any
point (child delegation forbidden).

---

## Identity and seal audit

**Dispatch capsule seal, recomputed canonically** — SHA-256 of the compact key-sorted
JSON of `control/C6-STAGE6-DISPATCH-MANIFEST.json` minus `seal_sha256`, UTF-8,
`separators=(",",":")`, no trailing newline:

```
recomputed   1d62203092eeadccb636cfb0eea5ec6d19e65ba07f7f5081d2e818f99a55cd99
declared     1d62203092eeadccb636cfb0eea5ec6d19e65ba07f7f5081d2e818f99a55cd99
dispatched   1d62203092eeadccb636cfb0eea5ec6d19e65ba07f7f5081d2e818f99a55cd99   MATCH
```

`file_count` 24 equals `len(files)`. **All 24 members verify on both SHA-256 and byte
length: 24 / 24, zero mismatches, zero missing.**

**Seal chain, each recomputed by my own instrument:**

| record | members | recomputed | declared | dispatch-stated |
|---|---|---|---|---|
| `control/C6-STAGE6-DISPATCH-MANIFEST.json` | 24 | `1d622030…5cd99` | match | match |
| `control/C6-STAGE5-PACKET-MANIFEST.json` (member) | 15 | `813d9401…6f5b87` | match | match |
| `control/C6-STAGE4-PACKET-MANIFEST.json` | 42 | `962d0535…55c22` | match | match |
| `control/C6-STAGE3-PACKET-MANIFEST.json` | 31 | `9b486b73…f98810` | match | match |
| `control/C6-STAGE2-PACKET-MANIFEST.json` | 106 | `9c56f164…8751d6` | match | match |
| `control/c6-second-read/T-BUNDLE-PACKET-MANIFEST.json` (member) | 23 | `5939e3a7…fbf5b9e8` | match | as the second read reports |

**Artifact digests against the sealed controller facts.** The three adjudications hash
to exactly the values `control/C6-STAGE6-CONTROLLER-FACTS.json` declares and the
Stage 5 packet manifest records — T `a1172bab…92d341` (110,716 bytes), F
`4160cfe0…54561b` (132,238), U `9624e817…07c117` (105,045) — so each is byte-identical
to what its adjudicator sealed. The second-read report hashes to
`b97906c0…95ea4847` (42,131 bytes), the value the controller facts declare, and its
typed lines are `q1_verdict: complete`, `q2_verdict: confirmed_with_repairs`,
`headline_resolved: no`, exactly as the controller records. `control/PATH-CHECK-c6-stage6-dispatch.json`:
21 files scanned, 0 findings.

**Adjudicator capsule seals** (reported by the adjudicators, outside my member set,
recorded and not verified): T `17d018ea…49dd0aa` (28 / 28 members), F
`cad2191f…4dfeb479` (28 / 28), U `a828cb6c…f614d0da3` (28 / 28). Each adjudicator
recomputed the Stage 2 / 3 / 4 chain independently and all three reached the values in
my table, which is three independent confirmations of the same chain. The T
adjudicator additionally re-hashed all 179 member files of the three packets with zero
mismatches.

**My read boundary, disclosed in full.** The 24 capsule members; run-root authority
(`SOLUTION-CONTRACT.md`, `SEMANTIC-CONTRACT.md`,
`control/CLAIM-IDENTITY.run-local.json`, 345 claims). **Three disclosures, all
content-free for mathematics:** (i) `control/C6-STAGE2-PACKET-MANIFEST.json`,
`…STAGE3…` and `…STAGE4…` are **not** members of my capsule and were opened to
recompute the three seals my dispatch names — authorized by the dispatch's own seal
list, manifest metadata only, no member of any of those packets was read; (ii) one
**non-recursive** `ls -1` of `control/` to locate those three manifests by name (names
only; not `find`, `grep`, `rg` or `ls -R`, and not rooted above the run root); (iii)
one `ps -eo pid=,args=` process sweep before this write. **No raw return, no critique,
no seat's or critic's scratch, no other experiment root, no manuscript, no repository
state, no external source, no network, no package install.** No `find`/`grep`/`rg` or
recursive listing was rooted above the run root or above a granted path. I opened no
prior-cycle return, critique, adjudication or synthesis.

**My own instrument.** Python standard library only (`json`, `math`, `itertools`,
`fractions`, `sys`), exact integers and `Fraction`s in every judgement, no float
anywhere, foreground, in-root scratch under the absolute path
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20/scratchpad/S-C6/`.
Never `/tmp`, `mktemp` or `TMPDIR`. Digests in `## Artifact inventory`. Where a figure
below is marked **(re-derived here)** I computed it from `SEMANTIC-CONTRACT.md` and the
registered definitions rather than taking it on report.

**Read-boundary and hygiene findings carried to this record.** Seven seat disclosures
(`control/C6-STAGE3-READ-BOUNDARY-DISCLOSURES.json`): F3, U4 and F1 ran a `find`/`ls`
above their grants before the brief was read, U4 twice more **after** the rule was
read; U2's non-recursive listings are within the letter of the rule; U1 and T2 stayed
in grant. The three adjudicators each confirmed, on positive evidence, that nothing in
any return depends on a disclosed read, and I adopt every one of those confirmations.
**Two findings I sustain as breaches in terms, not as mathematical defects:** U4's two
post-rule `find` calls (the species' fourth occurrence, first with post-rule
instances), and T2's `elan toolchain list` against the Stage 1 gate's unqualified
"Lean seats never `lake clean`/`lake update`/`elan`" (the T adjudicator's narrowing,
which I adopt: a successor brief should either mean the rule or carve out read-only
subcommands). **One adjudicator-side disclosure:** the F adjudicator self-discloses one
`find` rooted at `cycles/cycle-6/stage5`, above its granted output directory, run
**after** its file was written; it surfaced the names of the concurrently running T and
U adjudication files and nothing else. I record it as the named forbidden species,
disclosed rather than concealed, with no evidentiary effect: the F adjudication's
rulings were written before the command ran, no sibling file was opened, and none of
its findings is reachable from a file name. The C6-E-d(1) capsule defect (the Stage 2
manifest absent from the twelve critic capsules although protocol duty 1 requires its
seal) is **specific to the critic-capsule builder** — all three adjudicator capsules
carry it, and my own dispatch capsule does not (hence my disclosure (i) above, which is
the same defect reaching the Stage 6 seat). Fix it at the critic and synthesis capsule
builders together.

---

## Reconciliation

The three adjudications are reconciled **claim by claim, with no majority vote**. On
every typed line they agree — `headline_resolved: no`, `status: still_open`,
`material_progress: yes`, `orientation_plateau: no` — and I concur with each on my own
reading. **I find no disagreement of fact between any two adjudicators.** The
reconciliation therefore has three parts: the shared objects, the
divergences each adjudicator resolved inside its own orientation, and the four places
where I depart from or go beyond an adjudicator.

### 1. Shared objects across orientations — reconciled, no conflict

**(a) The `d = 5` band composition `E993-R25-FOURTH-BAND-CLOSE-ALL-R`.** F holds the
graph-theoretic carry step, U holds the arithmetic tail. Both rule them **disjoint
objects on one composition**; both rule that an award on either is an **input, not a
closure**; both rule the composition's grade unchanged at `proved_informal`,
fixed-band, weakest link. F says an award makes the band's "second formally verified
link"; U says it is the "first formal link beyond the matching half". **These are the
same statement** — gate ruling 1 records exactly one formally verified link entering
Cycle 6 (`E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`). I adopt F's counting: an
award on the carry step gives the band a **second formally verified input**. Only one
of the two disjoint objects is fundable at this close — the carry step is
contract-ready (F, two independent Lean proofs) and the tail's top-level theorem is
**not** (U: nodes 8-lift / 9 / 10 / 10′ open).

**(b) The `τ ≤ 5` cover branch.** F rules on the informal decision at `d = 6` and
`d ≥ 7`; U rules on the Lean of the five `d = 5` cells. Neither claims the other's
object and the two fit exactly. **(re-derived here)** From
`Γ_n(τ,k,n) = E(n,k) − Σ_{a=1}^{τ} C(τ,a)·Cat_{k−a}` with `n = 2r+d−τ` at `r = k+1`,
the `τ = 5` residue is **`k = 1..5` at `d = 5` (orders 9, 11, 13, 15, 17), `k = 1,2` at
`d = 6` (orders 10, 12), and EMPTY at every `d = 7..12`** — cell for cell the F
adjudicator's table, and cell for cell the run's own five registered `τ = 5` cells,
which calibrates the instrument. I also reproduce `s*(1..7) = 0,1,1,1,2,2,3`,
`Γ(5,·) = 1, −3, −10, −16, −18, −14, 18, 183, 902` (so `K(5) = 6`),
`K(1..7) = 0,2,3,4,6,12,70`, and `Γ(τ,k) < 0` for every `τ ≥ 8`, `k ≥ τ`.

**(c) Γ double-counting.** U2 imports `Γ(6,k) > 0` for `k ≥ 12`; the U3 critics compile
`Γ(5,k) > 0` for `k ≥ 6`; F4's `d ≥ 7` decision rests on the same object above `K(τ)`.
**All three are conjuncts of one registered, formally verified claim**
(`E993-R25-CATALAN-GAP-MONOTONE-RATIO`, the run's third award). The U adjudicator's
warning is correct and binding: **no terminal tally may count `catalan_gap5_pos` as a
new formal result.** I verified `K(5) = 6` and `K(6) = 12` and the full `Γ(6, 0..12)`
row `1, −4, −16, −33, −53, −88, −170, −360, −774, −1578, −2662, −1563, 16848`
**(re-derived here)**.

**(d) The crossing hypothesis.** T (T1 nowhere; T4 absent from every shipped row until
the critics supplied it), F (F3 nowhere), U (nowhere in any of the four routes) agree:
**`x(F) < r` enters no Cycle 6 route as a hypothesis, anywhere.** This is the single
most consequential shared finding and it drives every headline verdict below: not one
Cycle 6 object is a no-recovery statement.

**(e) Hunter's inequality.** T Ruling 6 sustains that the DAG's credit to "Cycle 5 T1"
is a stale citation; the second read independently confirms against the Stage 2 registry
snapshot that `E993-R25-HUNTER-SPANNING-TREE-INEQUALITY` credits **seat T3**, and notes
that the **second-read protocol itself repeats the stale citation**. I confirm the
registry entry (VERIFIED, `proved_informal`) and adopt: the whole `H`/Hunter lineage is
Cycle 5 seat T3's.

**(f) Tier separation.** All three adjudicators check independently that no route
imports a log-concavity premise, no route instantiates the fenced comparator as a
domination argument, and no status transfers between tiers, between forests and G1
tuples, or to FOREST / TREE / TRANSFER / Erdős #993. **(re-derived here)** The fenced
comparator `6K₂ ∪ (2r−7)K₁` at `r = 21` has order 47 `= 2r+5`, `x = 22 = r+1` — so the
`x(F) < r` hypothesis **fails** and it never reaches any crossing statement — and
`Δ₂₁ = +6,552,954,840`, exactly as the F adjudicator reports. `P₈` gives
`i = (1,8,21,20,5)`, `Δ₂ = −1`, `Δ₃ = −15`, `x = 2`; `Δ₃(P₁₁) = −14`, `Δ₃(P₁₂) = +6`.
All nine registered refutation witnesses of `control/C2-REFUTATION-WITNESSES.json`
reproduce on my own forest DP — every `i_k` vector, every `Δ_{r−1}`, every `Δ_r`, every
`x`, nine of nine, none recovering.

### 2. Divergences resolved inside an orientation — sustained

I do not re-open a paired-critic divergence an adjudicator resolved on replay evidence I
cannot rebuild. I sustain each of the following and record what it binds:

- **T1, the `d = 3` question.** C-T1-F's heading reads as a cell closure and C-T1-U's
  as a grade change; the T adjudicator shows C-T1-F's own `## Verdict` disclaims
  closure, so **the two critics do not differ on any claim**. Ruling sustained, and it
  is the controller's attention item (3): **top-cell attainment and the one-step lemma
  are THEOREMS at `d = 3`; the live cell `(3,4)` is NOT closed; the schema stays
  OPEN.** Independent ground: `control/C6-ALLOCATION.md` item 1 requires top-cell
  attainment **plus** the `j = r+1` constraint **plus** an explicit uniform lower bound
  on the top-cell margin; only the first is supplied, and only at `d = 3`.
- **T1, reciprocal `ρ_j`.** The two critics define reciprocal quantities; both closed
  forms are correct in their own orientation. **Binding on any successor: fix one
  orientation before quoting either critic**, or C-T1-F's refutation inverts.
- **T1, where the margin binds.** C-T1-F measures the exact requirement's margin
  (minimum at the top cell, `≈ 0.3/d`); C-T1-U measures a safety ratio (minimum at the
  band bottom). **Different functionals, so not a contradiction of fact — but a
  contradiction of successor guidance.** Neither is established as *the* obstruction;
  sustained, not averaged.
- **T3, the residue.** The seat's characterisation is false as written (its enumerator
  covers connected spanning spiders only); C-T3-U's exhaustive `≤ 2`-branch-vertex
  forest stratum at orders 22–29 (20,108,361 classes) strictly subsumes C-T3-F's
  (a)+(b)+(c). **Residue of record: finite forests of order 22–25 with at least THREE
  vertices of degree `≥ 3`.**
- **T3/T4 count conventions.** Spiders at orders 22–29 = **15,650 distinct isomorphism
  classes** (15,738 constructions; the seat's "10,738" struck). Exactly-two-hub trees
  at `n = 25` = **91,754 classes** (183,325 structures; the 183 difference is
  hub-swap symmetry — both critics right in their own convention). `(7,7,r)` skeletons
  = **1,082 classes = 128 + 954** (2,507,010 labelled pairs).
- **F1.** The categorical alias sentence is struck (four on-point registered claims
  unnamed); the residue is exactly `h ∈ {6,7,8}` = 764,513 skeletons = 44.40 %, with
  rule-determined coverage **55.60 %**; the two `τ = 12` failures are identified as
  `T(3,4,4)` and `W2`, both out of window; C-F1-U's strike of the throughput literal
  governs over C-F1-T's narrative reading (replay over self-report).
- **F2.** The `τ = 14` stress test is **VOID** — a null search whose move set provably
  cannot reach the family producing the phenomenon, and whose control, run by both
  critics at six ranks inside the known negative band, returns positive where the truth
  is negative. The closure conclusion survives on replacement evidence only. The
  `G(τ,D)` criterion is a **derivation, not a theorem** (the Gaussian-ratio step has no
  error bound). The `r = 19`, `τ = 13` cell is **OPEN** — no proof and no
  counterexample from five independent methods.
- **F4.** The chartered question was answered on the **wrong object** (the diagonal
  `τ = d`, where the registered theorem asserts nothing and the answer was already
  REFUTED); the correct answer, critic-attributed, is **the opposite of the return's
  headline**: the slack argument is not a `d = 5` accident, it strengthens with `d`.
  "Order 9 vacuous" is false against the registry's own face and two censuses — a
  repeat of the species that erratum `C5-E-b`, **a member of the offending seat's own
  capsule**, exists to correct. The two-hub probe is a **bug**, not a finding.
- **U1.** The seat's claimed `j < m` obstruction **does not exist** (`partner K i < i`);
  both critics closed every `j ≤ m` in Lean; **clause (b) of the registered claim is
  formalised nowhere**, so the claim as a whole may not be raised.
- **U2.** The seat's §4 "exact Lean statement" does not elaborate; **C-U2-F's
  integer-rank `MaR`/`BdRR` is the definition of record** and C-U2-T's ℕ-truncated
  `MaR0` is not the contract object. **(re-derived here, and this is the ruling's
  decisive check):** under the RANGED integer-rank object of `C4-E-c`,
  `Bd(2..15, r) = 24, 31, 48, 33, −16, −210, −963, −3810, −14406, −52630, −191305,
  −695243, −2535952, −9294964`; so `Bd(4,4) = **48**`, not 42; `Bd(r,r) ≥ 0` **exactly**
  at `r ∈ {2,3,4,5}`; the nine `[6,14]` layer values are
  `−16, −210, −963, −3810, −14406, −52630, −191305, −695243, −2535952`;
  `Bd(r,r) < 0` for every `r = 6..200`; `Bd(r,r) ≤ −Γ(6,r−1)` for every `r = 15..60`;
  `D(2r−1,r) = −Cat_r`; and `D(100,1) = 4751 > 0`, which is exactly why node 9 is **not**
  a blanket non-positivity lemma. The U adjudicator's choice between the two critic
  frames is confirmed by an independent instrument.
- **U3.** `cell_9` is an undisclosed strictly-less-general replay of frozen ENTRY 175:
  **four cells are new Lean content, not five.** The cover hypothesis is **vacuous at
  orders 9 and 11** and cover-essential only at 15 and 17. The order-13 population is
  **3,073** (`τ ≤ 5`), not 3,658 (the total order-13 forest class count) — the U
  adjudicator's own new finding, the fifth occurrence of the population species.
- **U4.** The finite base case is **unnecessary**: the uniform cubic
  `6Δ₂(F) ≥ n³ − 12n² + 35n − 30` for every forest of order `n ≥ 5` closes the chain
  with zero enumeration at any order. **(re-derived here)** that cubic divided by 6 is
  `−5, −6, −5, −1, 7, 20, 39, 65, 99, 142` at `n = 5..14`, exactly the claimed
  `min Δ₂(n)` at every one of those orders, and positive iff `n ≥ 9`. The "native stack
  ceiling" diagnosis is **refuted**: it was a mis-scoped `set_option` (the failure is at
  the cheap sanity-check line, at default `maxRecDepth`).

### 3. Where I depart from, or go beyond, an adjudicator

**(i) The `(7,7,15)` full-census minimum — UPGRADED from the T adjudication, on the
second read the T adjudication itself requested.** T declined to certify completeness,
grading `−1,612,675` **bounded computation at a named horizon** with the
`≥ 2`-low-slot residue on its face, and named the one question that would decide it.
The commissioned second read decides it, `q1_verdict: complete`, and the grounds are
sound on their face: C-T4-F's box is the **complete order-derived padding box**
`0 ≤ Σp ≤ 2r − K`, proved from `|V| = 2r+7` alone (`Σp + K + z = 2r`), so it is not a
restriction of any kind and **contains the entire `≥ 2`-low-slot stratum**; the
pruning is a per-mask interval-minimum relaxation whose soundness is a two-line proof
over a superset of achievable values, not a twelve-class observation; the class
enumeration is complete and irredundant by a third independent method; the reader's own
instrument reproduces the certificate under two variable orders and replays C-T4-F's
apparatus byte-identically; and the `≥ 2`-low-slot stratum's own exact minimum at
`r = 15` is **−168,481**, which is **1,444,194 above** the census minimum. The decisive
structural point is that C-T4-U's residue is a **sub-stratum of C-T4-F's box, not a
complement of it** — it is the residue of C-T4-U's own narrower box. **Ruling: the
`(7,7,15)` full-census minimum is `−1,612,675`, COMPLETE, attained by the
connector-only arity-7 hub at `p ≡ 3` (`|V| = 37`, `d = 7`, forest, `ν = τ = 7`,
`x = 14`, `Δ₁₅ = −32,006,037`); the cover-edge stratum minimum at `r = 15` is
`−614,281` and the margin is `998,394`; and the same certificate holds at `r = 16, 17,
18` against `−5,148,488`, `−16,558,925`, `−53,562,698`.** Two limits I hold: the
`r = 8..18` **exhaustive domination table** was not re-certified by the second read and
remains C-T4-F's bounded computation at its named horizon (corroborated at
`r = 8, 9, 10, 12..15`); and C-T4-F's "twelve classes at `r = 8`" validation literal is
**struck as unbacked by shipped evidence** (no shipped file performs it) and is
replaced by the soundness proof plus 155 classes at `r = 8` over the complete box and
18,096 bound checks at `r = 6`. Also struck: `strata.py`'s hashed payload carries a
wall-clock `secs` field — the same species as F2's breach, a hygiene item.

**(ii) The `k = 5` ceiling chain — REGISTRABLE, with the second read's structural
repair.** The T adjudication stated it for the record and, under gate ruling 8,
registered nothing. The second read confirms every link at the grade stated
(`q2_verdict: confirmed_with_repairs`) and supplies the repair that matters: **the
chain `36 → 33 → 29 → 25` is a numerically decreasing sequence of order bounds, not a
derivation chain, and `33` is NOT on the derivation path of `25`.** Theorem E's
`n ≥ 30` half composes with the registered `29`, whose own tail is the **formal** `36`
for `n ≥ 37` and the second-order certificate for `30 ≤ n ≤ 36`; `k²+k+3 = 33` is a
*sibling* uniform claim that enters the derivation of `25` nowhere. There is no
circularity. **(re-derived here)** the largest `n` with `W(n,k,n−1) < C(n,k)` is
`4, 9, 15, 23, 33, 45, 59, 75, 93, 113, 135, 159` at `k = 1..12` — exactly `k²+k+3` for
every `k ≥ 2` and **4 at `k = 1`** (where `k²+k+3 = 5`), which is why the `k ≥ 2` fence
is load-bearing; the unified closed form
`W(n,k,e+1) − W(n,k,e) = −(1+δ(e))C(n−4,k−2) − C(n−4,k−1)` has **zero mismatches over
73,920 instances** (`n = 4..80`, `k = −3..20`, every `e ∈ [1,n−2]`) and the argmin sits
at `e = n−1` with **zero violations** over `n = 4..140`, `k ∈ {0..40} ∪ {60,97,150}`;
and `(k+1)² − (k²+k+3) = k−2` exactly. **Ruling: register the composition at
`proved_informal` with the second read's exact statement and repairs** (below).

**(iii) The T2 §5 inversion — STRUCK AND INVERTED, on my own arithmetic.** This is the
single item in the portfolio that could propagate a false statement into the
publication packet. **(re-derived here)** over `k = 2..60`: the return's stated pair
holds for **0 of 59** values of `k`; the true relations — `W < C` at `k²+k+3`, `W ≥ C`
at `k²+k+4` — hold for **59 of 59**. (The T adjudication's `k = 2..60` population and
the second read's `k = 2..30` population are both correct; mine reproduces the wider
one.) The sentence must be struck and inverted **before** any Stage 7 dispatch, any
registration and any publication packet quotes §5, and the return's own obligation item
1(f) pointer to §5 must be repaired or removed.

**(iv) An alias identification neither adjudicator made.** The U adjudicator fences its
award group 5 as raising "nothing — not `E993-R25-BD-TAIL-NEGATIVE`, not
`E993-R25-FOURTH-BAND-CLOSE-ALL-R`", which is right as far as it goes. But I read the
registry by statement and find that **`D_step_sign` and `peak_bracket_integral`
together are the registered VERIFIED `E993-R25-D-ROW-STEP-SIGN-LAW` verbatim** — that
claim's statement is exactly "`m(2m−g)(h(g+1) − h(g)) = C(2m−g,m−1)(2m − g² + g)` for
`0 ≤ g < m` … **and** the integral peak bracket `N(g_c) ≤ 4g_c − 5` at the argmax", and
its grade is `proved_informal`, critic-derived in Cycle 5 by C-U2-T and C-U2-F. So that
award group is **a grade change for a registered VERIFIED claim**, not a fence-free
fragment, and its materiality rises accordingly; `interior_peak_le_cat` is separately
**new content with no registered predecessor** (I searched the 345-claim registry for
peak / bracket statements and found no other). This changes my funding order against
the U adjudicator's recommended priority, and I say so explicitly rather than silently.

### 4. Controller errata and attention items — ruled

- **C6-E-a** (the date literal 2026-09-23 sealed into two records; true date 2026-09-22):
  sealed members are immutable; the literal stands, corrected here; no mathematics
  affected. **Concur** (T concurs; F and U record).
- **C6-E-b** (the allocation's "Cycle 1 award" for the `D`/`E` algebra): **RESOLVED by
  the F adjudicator on the evidence** — C-F3-U held the `runs/` grant and checked: no
  award run ships a `D`/`E` layer at all, the Catalan-gap award is **Cycle 3's**, and
  the F3 seat's `Arithmetic.lean` is the run's first `D`/`E` layer. **The clause should
  be struck, not re-pointed.** Nothing depends on it.
- **C6-E-c** ("4,364 in-region triples"): **SUSTAINED** — the U adjudicator reproduces
  750 pairs / 23,055 cells / 3,600 hard triples / 660 pairs carrying a hard index at
  `m ≤ 45`, and 4,364 is none of them. Not load-bearing (the general-`j` theorem is now
  kernel-checked twice). **The figure must not travel further.**
- **C6-E-d**: (1) critic-capsule-builder defect, confirmed by all three adjudicators as
  **not** inherited by the adjudicator capsules — and, as my disclosure (i) records, it
  **does** reach the Stage 6 dispatch capsule, so the fix is scoped to the critic and
  synthesis capsule builders. (2) The F3 disclosure undercount is **confirmed and
  enlarged** by the F adjudicator to four listing/read events across two kinds.
- **C6-E-e**: (1) the attack brief's `min Δ₃` literals are the TRUE minima while the
  chain's own outputs are one unit lower — brief-side, sustained by U; the seat never
  claimed otherwise. (2) "the run's first formally verified unconditional forest
  theorem" was **stale at Stage 1**; the correct phrase for what U4's lineage delivers
  is *the run's first formally verified unconditional forest **threshold** theorem* — a
  different object from an order bound, and the award citation must say so.
- **C6-E-f** (the `1,082` wording): the controller's reading is right and both the T
  adjudicator and I adopt it — **1,082 is the live `(7,7,r)` census total
  (`128 + 954 = 1,082`), forbidden only as the denominator of the connector-only
  residue.** Fix it once, centrally.
- **Attention item (3)** — ruled above (grade change, not closure).
- **Attention item (4)** — ruled under `## Successor-run recommendations`, R4: I state
  the cross-orientation composition, say exactly what it is and is not, and **register
  nothing**; it needs an isolated second read and the terminal cycle affords none.
- **Attention item (5)** — every correction is directed in R2 below.
- **Attention items (1), (2), (6)** — ruled in `## Lean awards` and
  `## Successor-run recommendations`.

### 5. The seating finding, recorded for the seventh consecutive cycle

All three adjudicators record it independently, and this cycle it is unusually stark.
**Eleven of twelve routes carry critic-attributed advances; the seats' own results were
narrowed on every route; and in three of the four F routes, three of the four U routes
and three of the four T routes the decisive step was taken by an Opus critic rather
than by the Sonnet seat.** In F3 and F4 the two isolated critics concurred on
essentially every point; in U1, U2, U3 and U4 the two critics produced the same advance
independently and in incompatible styles. **This is a finding about seating, not about
progress**, and it is now the run's longest-standing operational observation. Its
practical consequence for a successor charter: the critic stage is where terminal value
was created, and it should be resourced as a first-class production stage, not as an
audit.

---

## Exact established results

Grades are those of `SOLUTION-CONTRACT.md` §4. **Every critic-derived result is named
as critic-attributed.** For every theorem I state where `d`, `ν`, `τ` and `x(F) < r`
enter. Nothing below is `formally_verified`: that grade belongs to the governed
`lean-proof-workflow` alone, and no Cycle 6 seat, critic, adjudicator or this synthesis
submitted anything to it.

### A. Exact theorems, uniform

**A1. Coefficientwise nonnegativity of the certificate dual at every index** (U-E1).
`∀ m K d, K + d = 2m → 3d ≤ 2m+2 → ∀ j ≤ m, Nonneg (Nj K m j)`. **Uniform in `d`, `m`
and `j`**; no horizon, no census. *Grade:* kernel-verified compiled fragment.
*Attribution:* seat **U1** for the whole apparatus and the `j = m` assembly; the
general-`j` lift **critic-attributed jointly to C-U1-T and C-U1-F**. *Parameters:* `d`
only as an integer parameter of the region inequality; **`ν`, `τ`, `x(F) < r`
nowhere** — no graph object occurs in the corpus. *Alias:* the `j = m` instance **is**
the sufficiency half of `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`
(`Q_{m,d} = m!·N_m`); the `∀ j ≤ m` statement **is clause (a) of**
`E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`, whose clause (b) is formalised nowhere.

**A2. The uniform forest `Δ₂` threshold in the frozen G1 definitions** (U-E7).
`∀ {X} [Finite X] (F : SimpleGraph X), F.IsAcyclic → 9 ≤ Nat.card X →
0 < Erdos993G1.delta F 2`, with the quantitative
`n³ − 12n² + 35n − 30 ≤ 6·delta F 2` for `5 ≤ Nat.card X`. **Uniform in the order**; no
induction, no leaf case, no edgeless clause, **no enumeration at any order**. *Grade:*
kernel-verified compiled fragments, compiled twice independently against the frozen
`g1-c3-third-wide` project. *Attribution:* **critic-attributed jointly to C-U4-T (the
`[Finite X]` contract form and the quantitative cubic) and C-U4-F (the
component-corrected form and `entry176_is_an_instance`)**. *Parameters:* `ν`, `τ`, `d`
and `x(F) < r` **nowhere**; acyclicity through `e(F) ≤ n−1` and the convexity step.
*Alias:* it **is** the registered VERIFIED `E993-R25-FOREST-DELTA2-POS-ORDER-9`, and it
strictly generalises frozen ENTRY 176. *Sharp:* `P₈` attains it at `n = 8`
(`Δ₂ = −1`) — **(re-derived here)**.

**A3. Node N8, the argmin step** (T-E5). `W(n,k,e) := H(n,k,e,min(e,n−e))` is antitone
in `e`, hence `min_{1 ≤ e ≤ n−1} W(n,k,e) = W(n,k,n−1)`, for **every `n ≥ 4` and every
integer `k`** — from the single closed form
`W(n,k,e+1) − W(n,k,e) = −(1+δ(e))C(n−4,k−2) − C(n−4,k−1)` with `δ(e) ≥ −1`, by a
finite antitone induction, not a search. *Grade:* kernel-checked, `sorry`-free,
axiom-clean compiled fragment; **not** `formally_verified`. *Attribution:* seat **T2**;
the `c_e = 1` bridge (`candidateD_argmin`) **critic-attributed to C-T2-F**; rebuilt
independently by both T2 critics (exit 0, 8,657 jobs, identical source digest and
receipts). *Parameters:* `d`, `ν`, `τ`, `x(F) < r` **nowhere** — there is no graph in
the statement. The `n ≥ 4` fence is **tight**. **(re-derived here:** 73,920 instances,
0 mismatches; 0 argmin violations.**)**

**A4. Region I strictness, the boundary identity and the region characterisation**
(T-E1, T-E2, T-E3). For every `d`, every consecutive band pair `r−1, r` and every `j`
in rank `(r−1)`'s window with `j ≤ ⌊(K(d)+1)/2⌋`: `σ_j(r−1) > σ_j(r)` **strictly**;
`⌊(K(d)+1)/2⌋ = K(d) − d + 1` for both parities; Region I `= {j : E_j > 0}` and Region
II `= {j : E_j ≤ 0}` with `E_j = 2m+2−3j` the recursion's own drift term; and
`β_cell(d,α) < 1` for **every** band cell with **no horizon**, because
`α+1 ≤ K−d+1 = ⌊(K+1)/2⌋` always. **Uniform in `d`.** *Grade:* `proved_informal`.
*Attribution:* **critic-attributed to C-T1-U (strictness, H3, the absorbing state) and
jointly to both T1 critics (the boundary and region identities)**; verified by the T
adjudicator at every `d = 2..2000` with zero counterexamples. *Parameters:* `d` only
through `m(d) = ⌈3d/2⌉−1` and `K(d) = 2m−d`; `ν`, `τ`, `x(F) < r` **nowhere** — this
object never touches `i_k` of any graph. **(re-derived here:** `K(d) = 2d−2` for even
`d` and `2d−1` for odd `d`, at every `d = 2..400`.**)**

**A5. Theorem D, the third-order conservative Bonferroni bound** (T-E6). For every
finite forest `G` with non-isolated degree multiset `D`, **whenever
`κ(n,k) = C(n−4,k−3) − 2C(n−5,k−4) + C(n−6,k−5) ≥ 0`**: `i_{k+1}(G) ≥ V3(n,k,D)`.
**The hypothesis `κ(n,k) ≥ 0` must appear on the face of any registration**, with
`(n,k) = (5,4)` the sole exception in `n ≤ 120`, `k ≤ 40`. **Wider scope,
critic-attributed to C-T3-U: it holds verbatim for every finite triangle-free graph** —
acyclicity enters only through triangle-freeness. *Grade:* `proved_informal`.
*Parameters:* `ν`, `τ`, `d`, `x(F) < r` **nowhere**.

**A6. The rank-isolation reduction, at the sharp hypothesis** (F-T3). For fixed `k` and
**`τ ≤ d+3`**: if `Γ_n(τ,k,2r+d−τ) > 0` at `r = k+1`, then `> 0` at every `r > k+1`.
**Genuinely uniform in `(τ,d)`** — the algebra contains no `d`. *Grade:*
`proved_informal`, no horizon; but **a two-line Pascal corollary of the registered
ceiling claim's monotonicity clause**, already on the registered face of
`E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`. *Attribution:* the sharp hypothesis
**critic-attributed to C-F4-T**, confirmed sharp by the F adjudicator. **The "reduces to
exactly one cell" gloss is STRUCK:** the statement is conditional, and when
`Γ_n ≤ 0` at `r = k+1` the residue is an initial interval of ranks — **(re-derived
here)** `Γ_n(7,2,·) = −23, 0, +47` at `r = 3, 4, 5`, so the `Γ`-ambiguous set at
`τ = d = 7` has **70** cells, not 69.

**A7. Lemma H, floor plus tightness** (F-T2). `E(b,j) ≥ −Cat_j`, with equality
**exactly** at `b ∈ {2j−1, 2j}` and nowhere else. `proved_informal`, no horizon; pure
binomial arithmetic (no `d`, `ν`, `τ`, `x(F)`). The floor half is the registered
`E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR`; the equality **value** at `b = 2j` is already
inside `E993-PAIR-STAR-CLOSURE`; **the new content is the UNIQUENESS of the attaining
set.** Its "realized on 29 explicit forests" evidence base is **struck** (Stage C
evaluates neither `Cat`, nor the floor, nor `Γ_n`) and replaced by C-F4-T's supplied
test.

**A8. Hall admissibility, general form** (F-T4). For a forest `F` with `C ⊆ V`,
`|C| = τ`, `B = V∖C` independent: `τ(F) = ν(F) = τ` **iff** `ρ_S ≥ |S|` for every
`S ⊆ C` — necessary **and** sufficient, and `e_C = 0` is **not** needed. *Attribution:*
the return proves sufficiency; **the general necessity half is critic-attributed to
C-F2-T** (deficiency / König–Ore), independently re-derived by C-F2-U. The single-hub
specialisation must carry the hypothesis that **the hub touches all of `C`**; verified
exhaustively over all 80,321 leaf multisets at `τ = 13, r = 19`.

**A9. The joint `surplus + e_C ≤ τ − 1` budget** (F-T5). Cover-internal edges and hub
surplus draw on one budget of `τ−1`, one for one; forest-only (the component count is
the proof). *Grade:* theorem, **critic-attributed jointly to C-F2-T (its Theorem 3) and
C-F2-U**; 1,688 acyclicity-tested forests, 0 violations, 327 tight.

**A10. The exact sign decomposition at `k = r−2`, and `D ≤ 3 ⟹ Δ_{r−2} > 0`** (F-T6).
With `N = 2k+3` and `n_s = 2k+2−s(D−1)`:
`f(n_s, k−s) = C(n_s,k−s)·(s(3−D)+1)/(k−s+1)` and `f(N,k) = 2C(N,k)/(k+1)`, so every
`s ≥ 1` term carries the sign of `s(3−D)+1`. **Corollary, a genuine theorem uniform in
`τ` and `r`: `D ≤ 3 ⟹ Δ_{r−2} > 0` at every feasible `r`, for every `τ`** — a
term-by-term proof, not a computation horizon. Negativity requires `D ≥ 4`.
*Attribution:* **critic-attributed to C-F2-U**, verified as an exact identity by the F
adjudicator.

### B. Exact theorems, fixed-band, fixed-cell or fixed-rank (named as such)

**B1. The band carry step** (`E993-R25-BAND-CARRY-STEP-HALL`; F-T1). For every finite
simple graph `F` of order `2r+5` with a vertex cover `C`, `|C| = 6`, and `ν(F) = 6`:
`Δ_k(F) − Δ_{k−1}(F) ≤ Bd(r,k)` for every integer `k`, with `Bd` the **RANGED** object.
Registered VERIFIED `proved_informal`; **now formally proved in Lean twice,
independently, on the seat's verbatim statements — critic-attributed compiled
fragments, NOT `formally_verified`.** *Parameters:* `ν` once, through the numeric
equality producing the `C → B` bijection; `τ = 6` fixes `C(6,a)` and `|B| = 2r−1`;
**`d = 5` enters only through the order `2r+5`**; **`x(F) < r` enters nowhere**;
**acyclicity enters nowhere** — graph-general given `ν = τ`, positively evidenced by
C-F3-T's 516,096 non-forest graphs at zero violations. `r ≥ 4` is **derived inside the
proof**, not assumed, so the target statement is complete as written.
**FIXED-BAND `d = 5`.**

**B2. The five card-5 `τ ≤ 5` cells on actual `SimpleGraph` forests** (U-E5).
`cell_9/11/13/15/17`: `IsAcyclic F → Fintype.card X = 2k+7 → ∀ C₀, C₀.card ≤ 5 →
(cover) → t_k ≤ Erdos993G1.delta F k` with `t = 9, 5, 9, 21, 42` at `k = 1..5`. **Five
FIXED-CELL theorems**, not uniform in `d`, in the order or in `r`. *Attribution:* seat
**U3** for the Lean assembly and the padding lemma; **the LP-dual certificate
`f(d) ≥ 42 − 14d` and the five-cell reach are critic-derived in Cycle 5** and keep that
attribution. *Parameters:* `d = 5` through the order numeral `2k+7`; `τ` only as
`C₀.card ≤ 5`; `ν` nowhere (König is never invoked); **`x(F) < r` never a hypothesis** —
each theorem proves an unconditional `Δ_k` lower bound from which `x ≥ r` follows at
that cell, never the reverse, so the `6K₂ ∪ (2r−7)K₁` fence is respected by
construction. Acyclicity enters at exactly one declaration, `budget_bound`, confirmed
from both directions by a 13-vertex `τ = 5` **general-graph** witness with `Δ₃ = −8`.
*Alias:* `E993-R25-CARD5-JOINT-BUDGET-CELLS`, verbatim; **four cells are new Lean
content, not five**. **Far from sharp at four of five cells** (true minima
`19 / 39 / 56 / 56 / 43` against `9 / 5 / 9 / 21 / 42`); only order 17 is essentially
sharp.

**B3. The card-5 `cover_catalan_bound` and the six-term `Γ(5,k)` identity** (U-E6).
`Erdos993G1.ThirdWide.cover_catalan_bound_five` — **unconditional** (no `hfloor`),
`(n,k)`-parametric — with the card-5 ENTRY-148 analogue `catalan_gap5_identity`. A
**parameterized theorem** uniform in `n` and `k`; kernel-verified compiled fragments,
closed DAG. *Attribution:* **C-U3-F** for the unconditional form and the ENTRY 136–143
+ `FirstWide` 84/86/87 + 177 transcription closure; **C-U3-T** independently for the
identity and the conditional form. **The positivity half is NOT new:** `Γ(5,k) > 0` for
`k ≥ 6` is an instance of the formally verified `E993-R25-CATALAN-GAP-MONOTONE-RATIO`
at `τ = 5`.

**B4. The `D`-level step-sign law and the interior peak bound** (U-E2, U-E3).
`D_step_sign`: `∀ m g, 1 ≤ m → g < m →
m(2m−g)(D(2m−g−1,m) − D(2m−g,m)) = C(2m−g,m−1)(2m − g² + g)` — an exact identity
uniform in `m` and `g`, **with no hypothesis on `N(g)` and no shape premise on any
`i_k`**. `interior_peak_le_cat`: `∀ m g, 7 ≤ m → g ≤ m → 2m ≤ g²−g →
(g−1)²−(g−1) < 2m → D(2m−g,m) ≤ Cat_{m−1}` — a **parameterized theorem with explicit
thresholds**, the maximiser supplied as a witness of two inequalities and never
asserted to exist. *Grade:* kernel-verified compiled fragments, one project, closed
DAG. *Attribution:* seat **U2** for nodes 1, 2a, 4, 5, 6, 7; **C-U2-F** for node 2b and
the interior peak bound, with **node 2b independently compiled by C-U2-T**.
*Alias (mine, §Reconciliation 3(iv)):* `D_step_sign` together with
`peak_bracket_integral` **is the registered VERIFIED `E993-R25-D-ROW-STEP-SIGN-LAW`
verbatim** (both conjuncts); `interior_peak_le_cat` has **no registered predecessor**.

**B5. The `[6,14]` layer through the assembled ranged object, and four fixed points in
Lean** (U-E4). `∀ r, 6 ≤ r → r ≤ 14 → BdRR r < 0`, with `BdRR 4 = 48`, `BdRR 5 = 33`,
`BdRR 6 = −16`, `BdRR 10 = −14406` on the **repaired integer-rank** `BdRR`. A complete
finite case split on nine cells — **a theorem about those nine values, not a universal
statement** — and the affirmative answer to the charter's own named debt (the
900-evaluation layer **is** kernel-affordable by plain `decide`, with
`maxRecDepth ≈ 8000` at `r = 13, 14`; not unconditionally). *Attribution:*
**critic-attributed jointly to C-U2-T (on the ℕ-truncated frame) and C-U2-F (on the
integer-rank frame of record)**. All nine values and all four fixed points
**(re-derived here)**.

**B6. Theorem E, and the `k = 5` ceiling chain** (T-E8; second read `q2_verdict:
confirmed_with_repairs`). **For every finite forest `F`: `Δ₅(F) < 0 ⟹ |V(F)| ≤ 25`**;
equivalently every finite forest on `≥ 26` vertices has `Δ₅(F) ≥ 0`. **FIXED-RANK
`k = 5`.** Orders 26–29 proved in-run over a **proved-complete** `(e, c_e, D)`
superset including disconnected forests, every `(e,c_e) ≠ (n−1,1)`, and the edgeless
case `e = 0`; orders `n ≥ 30` **composed with** the registered
`E993-R25-SECOND-ORDER-TWO-SIDED-CEILING`, whose `n ≥ 37` tail is the formally verified
`(k+1)²` award and whose `30 ≤ n ≤ 36` half is the second-order certificate. *Grade:*
`proved_informal`. *Attribution:* seat **T3**; reproduced digit for digit by **two
independent critic instruments** and again by the second reader's literal exhaustion.
**"Unconditional, no horizon" is narrowed to "composed with the registered ceiling for
`n ≥ 30`."** *Parameters:* `ν`, `τ`, `d`, `x(F) < r` **nowhere**. **(re-derived here:**
the edgeless `Δ₅ = C(n,6) − C(n,5) = 48,279 … 356,265` at `n = 22..29`, all positive.**)**

**B7. The `≤ 2`-branch-vertex forest exactness at orders 22–29** (T-E9). Every finite
forest of order `n ∈ {22,…,29}` with at most two vertices of degree `≥ 3` satisfies
`Δ₅ ≥ 0` — exhaustive over **20,108,361 isomorphism classes** (19,955,812 distinct `Δ₅`
evaluations) by exact truncated independence polynomials, **not a bound**, with a
positive-detection control that fires through `n = 18` and an AHU
structural-completeness control. *Grade:* `proved_informal`, exact and exhaustive over
a finite explicitly named population. *Attribution:* **critic-attributed to C-T3-U,
corroborated by C-T3-F.**

**B8. The widened pendant Cap Lemma at the constant 40** (T-E10). For any `(7,7,r)`
skeleton with **arbitrary** `F[C]`, the minimum of `Δ_{r−1}` over the padding simplex
is attained at some `p` with **`Σp ≤ 40`**, and the greedy that realises it is
**cell-preserving** (`ν = τ = 7` survives every licensed move). *Grade:*
`proved_informal`, **FIXED-BAND `d = 7`, uniform in `r`**; the constant **does not
transport** (the step `n_S ≤ 2r − q_S` uses `|B| = 2r`). *Attribution:* seat T4's Lever
1; **the exact criterion and the constant critic-attributed jointly to C-T4-F and
C-T4-U; the two load-bearing steps (cell preservation, the max-load step) supplied by
the critics.** **(re-derived here)** `C(n,j) − C(n,j−1) ≤ 0 ⟺ n ≤ 2j−1`: **zero**
counterexamples over `n ≤ 80`, `j ≤ 40`, against **40** counterexamples to the return's
`n ≤ 2j−2`, every one at `n = 2j−1`; the per-`t₀` profiles are
`35, 42, 45, 44, 39, 30, 17` (max **45**) and `28, 36, 40, 40, 36, 28, 16` (max **40**);
the padding box falls from `C(52,7) = 133,784,560` to `C(47,7) = 62,891,499`, a
**52.99 %** reduction. 45 is true but non-optimal; 40 implies it.

**B9. The `(7,7,r)` skeleton census and the `(7,7,15)` full-census minimum** (T-E11;
second read `q1_verdict: complete`). `2,507,010` labelled pairs reduce to **1,082
skeleton classes = 128 connector-only + 954 cover-edge**, confirmed by canonical form
twice, by Burnside once, and by the second reader's third independent method. **The
`(7,7,15)` full-census minimum is `−1,612,675`, COMPLETE** (§Reconciliation 3(i)); the
cover-edge stratum minimum is `−614,281`, the `≥ 2`-low-slot stratum minimum is
`−168,481`, and the margin is `998,394`; the certificate extends to `r = 16, 17, 18`.
**These are exact finite facts about named cells. They are NOT extremality of any kind
at `τ = 7`;** `E993-R25-SINGLE-HUB-NOT-UNIFORMLY-WORST` remains REFUTED and its three
refuting cells reproduce. Every configuration in the population has `Δ_r` large and
negative, i.e. **the whole population sits far from the recovery frontier** — a fact no
shipped row stated until the critics supplied `x`.

**B10. Thin trees at `τ = 11`** (F-T8). *No thin tree with cover number `τ = 11` has a
log-concavity failure at any rank.* `proved_informal` **on a forced finite family** —
the band `2τ ≤ n ≤ 3τ−1` is proved, so this is a finitely quantified sentence, not a
census generalised. **Three legs, each named:** orders 22–25 on the registered
order-`≤ 25` census (conditional); **order 26 exhaustive, unconditional, this cycle,
replayed orbit-free to the unit by both critics** (336,219 skeletons, 10,601,172
accepted instances, 1,178,732 distinct thin classes, zero failures of any kind); orders
27–32 on Cycle 5 critic C-F4-T alone, unreplicated. **"Unconditional" means only "not
conditional on the register" and must not be read as verified in Cycle 6.** Its forest
corollary travels under `E993-TRS2-CONVOLUTION-CLOSURE` + `E993-TRS2-IFF-ALC` **with the
positive-interval-support hypothesis stated** and `E993-TRANSFER-TO-FOREST`'s
per-component discipline named — and on the correct side of the
`SOLUTION-CONTRACT.md` §3 fence, which forbids convolution closure of *unimodal*
sequences, not of log-concavity.

**B11. The `τ ≤ 5` cover branch beyond `d = 5`** (F-R1, F-R2). For every `d ≥ 7` and
every forest of order `2r+d` with `τ(F) ≤ 5`, the `Γ` bound is strictly positive at
every `k ≤ r−1`, hence `Δ_k > 0` for every `k < r`, hence `x(F) ≥ r` — **with no finite
residue and no case analysis**; at `d = 6` exactly two cells (orders 10, 12), both
closed by complete census (`min Δ₁ = +26` over 329 order-10 forests; `min Δ₂ = +66` over
1,516 order-12 forests with `τ ≤ 5`) **and** by two elementary counts needing no census
at all. `proved_informal`, uniform in `d`, resting on the `Γ` bound plus the **formally
verified** Catalan-gap award above `K(τ)` and a finite exact check below it.
*Attribution:* **critic-attributed to C-F4-T and C-F4-U independently**, confirmed by
the F adjudicator and **(re-derived here)**. **This strengthens the evidence for an
already-VERIFIED claim and raises no status.**

**B12. The single-hub sub-family at `r = 19`, `τ = 13`** (F-T7). Positive at **every**
`k ≤ r−2`, not merely at `k = r−2` — complete case analysis over all **12,199**
Hall-admissible profiles, exhaustive minimum `Δ₁₇ = +405,520,555` at leaves
`(3^10, 2, 2, 2)`. **The full Corollary-F conclusion holds for that sub-family.** A
sub-family result; it does not bear on the general hyperforest space, where the floor
`+89,857,131` at `[10,2,2,2]` is **attained, not proved** — five independent methods
converge and none proves optimality. *Attribution:* **critic-attributed to C-F2-T**,
confirmed by the F adjudicator's own complete re-enumeration.

**B13. Five diagonal low-rank cells raised to complete isomorphism-class census**
(F). `(6,6,3)`, `(6,6,4)`, `(6,6,5)`, `(7,7,4)`, `(7,7,5)` with true cell minima
**`+65, +116, +154, +209, +342`** — every one of the return's family minima is a
**strict over-estimate**. Consequence: **the `(6,6)` diagonal residue is now COMPLETE —
eight closed, two REFUTED, zero undetermined.** *Attribution:* critic-attributed,
both F4 critics, identical minima.

### C. Bounded computation at attained horizons

- **T1's whole-band sweep:** 18,546,203 pointwise comparisons at `d ≤ 400`, zero
  domination violations and zero strict-`β` violations; Region I 10,626,202 / Region II
  7,920,001, of which 6,773,496 are **absorbed**, leaving a **live residue of 1,146,505
  steps (6.2 %)**. Band convention fixed here, once: **79,600 inclusive cells / 79,202
  strict cells / 79,202 consecutive pairs under the inclusive convention** — three
  numbers, two equal by coincidence **(re-derived here;** the difference 398 is one per
  odd-and-even `d` from 3 to 400, `d = 2`'s band being empty**)**.
- **F1:** `τ = 12`, order 26 — rule-determined closed coverage **957,243 / 1,721,756 =
  55.60 %**, residue exactly **`h ∈ {6,7,8}` = 764,513 skeletons = 44.40 %**, with
  `h = 8` at 58.8 % on bounded evidence. Zero in-window failures and zero recoveries
  across the 58.35 M + 50.10 M accepted instances the two critics evaluated. **Orders
  27–34 were never swept by anyone.**
- **F2:** the `τ = 14`, `D = 4` negative band is **exactly `r = 22..261`** (240 ranks),
  closing, strictly positive through `r = 3000`; **`D = 4` is the unique negative degree
  slice at `τ = 14`**, which upgrades the return's figure from a `D = 4` claim to a
  claim about the whole uniform single-hub family; **`τ = 17`, `D = 5` is a second
  disjoint band, exactly `r = 35..89, and it CLOSES` — the first evidence in the run
  that a `τ ≥ 15` band can close at all**; `τ = 15..20` at `D = 4` open past `r = 3000`.
  The onset column restates the registered threshold `r ≥ (3τ+2)/2` and carries no
  independent information **(re-derived here:** `24, 25, 27, 28, 30, 31` at
  `τ = 15..20`**)**.
- **T2/T3/T4:** the corroborating sweeps at their re-labelled populations; C-T3-F's
  exhaustive `n = 30..47` tail; the `r = 8..18` exhaustive domination table (C-T4-F,
  **not** re-certified by the second read).
- **U4:** kernel certificates of the forest minima at orders 8, 9, 10 and 11 —
  `min Δ₃(8) = −16` **exactly** (bound plus attainment), `min Δ₂(9) = 7`,
  `min Δ₃(11) = −14` **attained**, the last being the kernel form of the sharpness that
  `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12` carries informally. Bounded evidence: the
  completeness of each class list is Python-level, not a Lean-kernel guarantee.

---

## Refuted or narrowed mechanisms

**Refuted outright this cycle; never reopened.**

1. **The multiplicative Region II strengthening `Q ≥ ρ_j P`** (T1) — false; worst
   witness `(d,r,j) = (6,8,7)` with `ρ_j P = 3/4 > 43/80 = Q`, domination rescued by the
   `E_j` slack and by nothing else. Critic-attributed to C-T1-F. **A successor must not
   attempt the multiplicative route.** (Its witness population is filter-dependent —
   661 of 11,622 in C-T1-F's filter, 851 of 14,011 in the adjudicator's — and must be
   quoted with its filter.)
2. **The seat's "two refuted strengthenings" are ONE predicate** in two algebraically
   equivalent forms, refuted at the attained horizon `d ≤ 80` (not 100).
3. **The `partner K i ≤ j` obstruction at `j < m`** (U1) — no such configuration
   exists; hardness forces `partner K i < i ≤ j`. 694,540 hard quadruples, zero
   violations.
4. **`D_unimodal_peak` stays FALSE** and must never reach a formalizer. The whole U2
   corpus mentions it once, as a struck name in a comment. **The charter's hardest fence
   held.**
5. **The necessity of a finite forest base case** (U4) — refuted by a uniform
   closed-form `Δ₂` bound that is **exactly** `min Δ₂(n)` for `n = 5..14`; with it
   `ℓ₃(12) = +1` and positivity persists for all `n ≥ 12` with zero enumeration at any
   order. **"Order 8 is the minimal closing order" is also false** — 10 classes at order
   5 close the chain equally well.
6. **"A native process stack ceiling"** (U4) — it was a **mis-scoped `set_option`**; the
   unchanged encoding compiles at file scope in ≈24 s, axiom-free.
7. **The duplicate-`omit` parser hypothesis** (U3) — the trigger is a doc comment
   immediately preceding any `<command> … in` modifier, with the error reported one line
   above the offending token.
8. **"ENTRY 175's positivity is all the induction consumes"** (U4) — positivity-only
   `Δ₁` gives `L₂(9) = 0`, a plateau at exactly the threshold order.
9. **F2's `τ = 14` closure stress test — VOID** (§Reconciliation 2). Its ten values are
   ten arithmetic facts about two frozen shapes at maximal degree and carry **no**
   inference about closure. The registered species: *a null search is bounded evidence
   of nothing.*
10. **F4's two-hub probe — a BUG, not a finding.** An order-arithmetic error rejected
    every candidate before the `τ` test ran; **not one forest was evaluated**. Repaired,
    the family is far from empty and its true minima (`+149`, `+245`) **beat the
    return's own reported figure**.
11. **F4's "order 9 vacuous"** — false against the registry's own face and two
    independent censuses (`min Δ₁ = +19` over all 153 order-9 classes).
12. **The naive substitution of Theorem D alone** for the inherited second-order
    certificate — worse at every `n = 22..29` (`−2,758,203` against `−585` at `n = 29`),
    because AM-GM is maximally loose at a high-degree hub adjacent to leaves. **The
    degree-threshold split** is provably dominated by the Pareto join.

**Narrowed, not refuted.**

- **Theorem D's reach:** triangle-free, **not forest-specific**. The only place
  acyclicity is still unexploited is the relation between `L` and `D`, which the
  topology-free AM-GM step throws away. This is the honest reason the chartered
  third-order lever under-delivered.
- **Region I's coverage:** a theorem at the stratum level, but only **199 of 79,202**
  pairs (0.25 %) have their whole comparison window inside it — and those are exactly
  the band-bottom pairs of odd `d`.
- **The spider closure:** connected spanning trees, **15,650** distinct classes — not
  forests, and superseded by B7.
- **The Cap Lemma:** `Σp ≤ 40`, fixed-band `d = 7`, non-transporting — **and re-priced
  by the second read**: at `r = 15` the order-derived box already gives
  `Σp ≤ 30 − K < 40`, so the Cap is **vacuous where it was invoked** and binds only at
  large `r`.
- **The `G(τ,D)` closure criterion:** a derivation, not a theorem; its signs are
  confirmed in every tested case, but `"τ = 15..20 never close"` is a well-supported
  **prediction**, not a proved statement, and must not be carried forward as one.
- **The rank-isolation reduction:** **do not register as drafted** — the minimal-rank
  reduction is already on the registered face of
  `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`. The only new content is
  `(τ,d)`-uniformity with hypothesis `τ ≤ d+3`: **a scope note, not a new key.**
- **The card-5 positivity half:** `Γ(5,k) > 0` for `k ≥ 6` is the registered formal
  Catalan award at `τ = 5`; **never registered as new.**
- **Node N8, and every Cycle 6 Lean object:** compiled fragments, **not**
  `formally_verified`. The three `formally_verified`-grade literals in the T2 return are
  struck; "independently replayed" is narrowed to self-replay plus two critic replays.

**Struck certifications, consolidated.** T1: the horizon literals, the part-B citation
(re-cite at 159,250, do not strike), §8's `j1` sentence and "complete, gapless", §6's
"always" and its "grows slowly" trend, §10's stated reason, §2's "unrelated legacy".
T2: `formally_verified` ×3, "independently replayed" ×2, the §3 population labels, **§5's
two boundary inequalities (struck and inverted)**, the N1 seat attribution. T3:
"10,738 topologies", the `forest` scope of the spider closure, "`V_old` validated on
3,863 instances", the §5 witness generator attribution, "every admissible `(e,c_e,D)`
checked", the residue characterisation. T4: "exactly when", the `−566,547,978`
attribution, the unshipped `2^15` cross-check, "Verified exactly" for the Lever 2
reduction, "a one-smaller (6-vertex-cover) auxiliary problem" (**in the return and in
the mechanism token** — the auxiliary cover has size `7 − 1 − deg_{F[C]}(c*)`),
"793 combined numeric checks" (169 effective), and `x` on every row (absent
throughout). F1: `validate_automorphism.py` (does not exist), the `τ = 21` control's
generator (does not exist; every literal nevertheless true on two independent
attributions), the two `τ = 12` failures' missing rank and margin, the class-count
preamble, Hoggar's attribution. F2: the stress test, the `JB(13,19,17)` literal (no
generator exists anywhere in Cycle 6), the wall-clock fields in a digested payload
(**with an unreproducible digest as the concrete consequence**), "8,910 evaluated
ranks" (the count of record is **8,841**, what the instrument did), "60 distinct" (55
distinct shapes, 60 rows), "2,738 ranks" (2,739), the `K(1..7)` self-test claim.
F3: "`#print axioms` on every declaration" (3 of 8 named; five anonymous `example`s
cannot be axiom-printed), **the sorry count wrong by one in three shipped places, the
most consequential inside `THEOREM-CONTRACT.yaml`**, "character-for-character" (narrowed
to extensional equality on 3,198 cells plus kernel range endpoints), the malformed
`Bd(r,r)` docstring, "a FOURTH time", the "Cycle 1 Catalan award" paraphrase. F4:
"exhaustively over `τ≤d≤10, k≤40`" (the box is `τ ∈ {2..7}`), "order 9 vacuous", the
"reduces to exactly one cell" gloss, "true by luck at `d = 5`", "verbatim programmatic
extraction", "never seeded with that answer". U1: "every declaration" (20 of 29), "all
20 new declarations" (29 are new), the "full build" log (a warm-cache `Replayed` line),
the "different object" alias ruling. U2: "22 checks" (31 `[ok]` lines, no count),
"168,000 checks" (2,316 comparisons / 953,034 `D` evaluations), "4 definitions" (5),
"always odd" (always even), "draft contract complete", the fresh-namespace claim.
U3: "zero deviations" (a dropped trailing space at frozen line 3761), the ENTRY 174/178
line spans, `cover_five_sparse_vertex'` (does not exist), "all 17 declarations" (17 of
18), the census figure `153/710/**3,658**/10,648/29,915`. U4: "it is 76 classes for
exactly one scalar fact", "order 8 is minimal", the stack-ceiling cause, the `L₃` index
labels, the alias check's four omissions.

**Recurring defect species, counted for the record.** A cited script that does not
exist (F1). A numeric claim with no shipped generator (F1 ×2, F2, T3 ×4, T4). A sign
reported without its difference index (F1). **A construction count under a class-count
preamble — sixth occurrence across the run** (T3 ×2, F1, U3). **Float wall-clock fields
in a digested payload, with an unreproducible digest as the consequence** (F2, and
C-T4-F's `strata_report_*.json`). A null search shipped without a control (F2, F4).
An off-by-one count of a seat's own artifacts, **the most consequential instance inside
a frozen theorem contract** (F3). **A repeat of the `C5-E-b` species by a seat holding
that very erratum in its own capsule** (F4). **The `C5-E-e` alias species — three
occurrences in orientation U alone this cycle (U1, U3, U4), plus F1, F2 and F4's
drafted candidate: the dominant defect mode of the terminal cycle.** A `find`/`grep`
above a grant (F1, F3, U4 — fourth occurrence, first with post-rule instances — plus
the F adjudicator's own, disclosed). A name collision with a frozen or Mathlib
declaration (`star_star`, `Nonneg`, the cover binder `C`, `cover_rank_bound`).

---

## Headline verdicts

Exact evidence-grade verdicts at this close. **No status transfers between any two of
these, in either direction.**

**Tier 1 — `E993-R25-UNR-FOREST-WIDE` (for every finite forest `F` and `r ≥ 1` with
`|V(F)| ≥ 2r+2` and `x(F) < r`: `Δ_r(F) ≤ 0`): OPEN. Unchanged by every Cycle 6
route.** No Cycle 6 object carries `x(F) < r` as a hypothesis, so nothing this cycle is
a no-recovery statement. What moved is the evidence **around** it: the `x = 5` residue
is now exactly forests of order 22–25 with `≥ 3` vertices of degree `≥ 3` (B7, B6); thin
trees are free of any log-concavity failure at every `τ ≤ 11` (B10); the standing
in-window minimum `τ = 21` is **unchanged**; zero recovering forests were found
anywhere, by any instrument, at any order or rank. Tier 1's remaining region is the
excesses `d ≥ 6` (the `d = 5` band being closed informally). **An order bound is not a
no-recovery statement** (`SOLUTION-CONTRACT.md` §1, gate ruling 6): neither B6 nor the
sharpened uniform bound transfers any status here, and neither may be bundled with the
`x ≤ 4` closure.

**Tier 2 — `E993-G1WIDE-NO-SIZE-CAP`: OPEN, and untouched.** **No Cycle 6 route has a
G1 tuple in it.** The exact residue a successor inherits is precisely what the Cycle 5
close left: every `d′ ≥ 6` plus the single cell `(d′,p) = (3,6)`, with the Basit–Galvin
dependency discharged for the forest-restricted `d′ = 3` slice,
`E993-R25-G1-RESIDUAL-D5-SLICE` registered, and nothing bounding `d′` above. **Cycle 6
neither narrowed nor widened it.**

**Tier 3a — `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`: OPEN.** Theorem at `r = d`
(formal award) and at `r ≥ K(d)` (`proved_informal`, second-read); the band
`d < r < K(d)` remains bounded computation to `d ≤ 400`. **The one-step lemma
`β_cell(d,α+1) > β_cell(d,α)` is now a THEOREM at `d = 3` and open at every `d ≥ 4`** —
a `d = 3` **grade change, not a cell closure**. Live cells: **`(3,4)` and every
`d ≥ 6`**, unchanged. The chartered deliverable (top-cell attainment as a theorem, the
band, the live cell, the last open rank of the `d′ = 3` slice) is **not** delivered.

**Tier 3b — `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY`: OPEN.** `c(d) = min(d,5)`
stays informal; the diagonal stays REFUTED for `d ≥ 6`; the census stays 45 closed / 28
refuted / 0 undetermined. What moved: the `τ ≤ 5` branch's **proof route** is now
uniform in `d` and closes by arithmetic alone at every `d ≥ 7` (B11), and the `d = 5`
small-rank cells are kernel-checked (B2) — **but the threshold function `c(d)` did not
move**, and nothing raises `c` above 5 anywhere.

**Tier 3c — the window reduction: UNCHANGED by Cycle 6.** With
`m(d) = ⌈3d/2⌉ − 1` and `c(d) = min(d,5)`, every counterexample to Tier 1 has
`ν(F) ∈ [c(d)+1, m(d)−1]` together with `x(F) < r`, of width **`m(d) − c(d) − 1`** —
`⌈3d/2⌉ − 7` for `d ≥ 5` and `⌈3d/2⌉ − d − 2` for `2 ≤ d < 5`; at `d = 6` the window is
exactly **`{6,7}`** **(re-derived here)**. **Neither endpoint moved in Cycle 6**, and no
further reduction was proved from the ambient G1 guards. **This is the honest terminal
statement about the run's Tier 3 objective: the reduced class is explicitly
characterized but is not strictly smaller at this close than it was at the Cycle 5
close.**

**Diagnostic band — `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` /
`E993-R25-FOURTH-BAND-CLOSE-ALL-R`: VERIFIED, `proved_informal`, fixed-band `d = 5`,
every `r`, graded at its weakest link.** Cycle 6 makes a **second** formally verified
input contract-ready (B1) and kernel-checks the five-cell finite part (B2), but the
arithmetic tail's top-level theorem is **not** proved, the general half of `c(5) = 5`
and Corollary F at `d = 5` are untouched, and **the composition's grade does not
change.** A band theorem alone is a fixed-band result and is graded as such; it
explains no uniform mechanism.

**And separately, with no status transfer:**

- **`E993-TGT-FOREST` (every finite forest has a weakly unimodal independence
  sequence): OPEN.** Untouched. Tier 1 is a proper subclaim of it and Tier 1 is open.
- **`E993-TGT-TREE` (every finite tree …): OPEN.** Untouched. `E993-UNIV-TREE-TRS2`
  remains **REFUTED** (Kadrawi–Levit, order 26) and never regresses to OPEN; Galvin's
  non-log-concave trees stand; **no log-concavity premise was imported anywhere in
  Cycle 6**, and in F1 log-concavity is the *conclusion under test*, with both order-26
  counterexamples reproduced inside the route's own family before any null was reported.
- **`E993-TGT-TRANSFER` (a convolution-stable class strictly between log-concavity and
  unimodality containing all tree independence sequences): OPEN.** Untouched.
  `E993-TRANSFER-TO-FOREST` remains **CONDITIONAL**, and the one Cycle 6 argument that
  travels near it (F1's forest corollary) uses convolution closure of **log-concavity**
  (`E993-TRS2-CONVOLUTION-CLOSURE` + `E993-TRS2-IFF-ALC`, both VERIFIED), not of
  unimodality, so it lands on the correct side of the `SOLUTION-CONTRACT.md` §3 fence —
  provided it travels with the positive-interval-support hypothesis and the
  per-component discipline.
- **Erdős #993: untouched.** No claim registered, advanced or refuted in this run bears
  on it. **Closing G1 alone does not solve Erdős #993**, and nothing in this synthesis,
  in any adjudication or in the second read may be read as suggesting otherwise.

**No counterexample to any tier was produced by any instrument, on any route, at any
order or rank, in Cycle 6.** No new refutation was produced anywhere in orientation F;
the refutations reproduced there are registered ones.

**The headline is unresolved at this close.** All twelve returns, all twenty-four
critiques, all three adjudications and the second read return the negative call, and I
concur with each on my own evidence. The typed line is carried once, under
`## Continuation ruling`.

---

## Lean awards

The test is `SOLUTION-CONTRACT.md` §4 and the adjudicator protocol's duty 6: a stable
statement, a closed dependency DAG at the exact scope, sufficient materiality; a uniform
theorem, a parameterized theorem with explicit threshold functions, or a reduction
theorem in honest conditional form qualifies; a fixed-band or fixed-cell result
qualifies **only if named as such**. **The terminal Stage 7 is the last — there is no
later close, and a group with open nodes is not fundable.** Capacity: Sonnet 5
formalizers at repair limit 2, one Opus informal auditor and one Opus fidelity reviewer
per group, sequential Lean builds on the write-protected shared tree.

**I fund six dispatches, in this order.** Where I depart from the U adjudicator's
recommended priority I say why on the face of the group.

### Dispatch 1 — `U-AWARD-FOREST-DELTA2-ORDER-9`

**Exact statement.**
```lean
theorem forest_delta_two_pos_ge_nine {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 9 ≤ Nat.card X) : 0 < Erdos993G1.delta F 2
```
with the quantitative companion
```lean
theorem forest_delta_two_lower {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 5 ≤ Nat.card X) :
    (Nat.card X : ℤ)^3 - 12*(Nat.card X : ℤ)^2 + 35*(Nat.card X : ℤ) - 30
      ≤ 6 * Erdos993G1.delta F 2
```
**Hypotheses:** acyclicity and `9 ≤ Nat.card X` (resp. `5 ≤`). `[Finite X]` alone is
the minimal instance burden and is the contract form. **Fences:** uniform in the order,
no horizon, **no enumeration at any order**; `ν`, `τ`, `d`, `x(F) < r` enter nowhere;
`Δ₂ > 0` is a **positivity** statement, the opposite sign from a no-recovery statement.
**DAG:** frozen ENTRIES 44 → 54 → 68 → 58/59, all compiled, then
`forest_delta_two_lower` → `forest_delta_two_pos_ge_nine`, both compiled, with an
independent second implementation carrying the component correction and
`entry176_is_an_instance`. **No open node**; rebuilt from fresh copy-outs at 8,656 and
8,657 jobs, `[propext, Classical.choice, Quot.sound]`, no `sorryAx`.
**Attribution:** critic-attributed jointly to **C-U4-T** (contract form, quantitative
cubic) and **C-U4-F** (component-corrected bound, ENTRY-176 instance disclosure), on
the frozen G1 project's own compiled lemmas. **Repairs the adjudicator names:** none
mathematical (0 of 2 used); one formalizer caution — the proof fails until
`((Nat.card X − 2 : ℕ) : ℤ)` is converted to `(Nat.card X : ℤ) − 2`, `nlinarith` fails
silently otherwise. **Registry effect:** a **grade change** for the VERIFIED
`E993-R25-FOREST-DELTA2-POS-ORDER-9`, `proved_informal → formally_verified`. **Not a
new claim.** **Excluded conclusions, mandatory on the award's face:** it is a forest
**threshold** theorem, **never** "the run's first unconditional forest theorem"
(C6-E-e(2)); it does **not** sharpen `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (an
order bound is a different object); it is **not** `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`;
it bears on **no** tier, on FOREST/TREE/TRANSFER, or on Erdős #993. The alias line must
name `E993-R25-FOREST-DELTA2-POS-ORDER-9`, frozen ENTRY 176 (of which it is a strict
generalisation) and `E993-PAIR-RANK3-FOREST-MIN`. **Ranked first** on the product of
readiness (zero proof repairs, two independent implementations, three rebuilds) and
materiality (uniform in the order, grade change of a VERIFIED claim).

### Dispatch 2 — `E993-R25-BAND-CARRY-STEP-HALL` (critic-attributed)

**Exact statement.**
```lean
theorem ErdosR25BandCarryStep.bandCarryStepHall
    {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj] (r : ℕ)
    (hcard : Fintype.card V = 2 * r + 5)
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (hCcard : C.card = 6)
    (M : F.Subgraph) (hM : M.IsMatching) (hMcard : M.verts.ncard = 12)
    (k : ℤ) :
    ErdosR25BandCarryStep.delta F k - ErdosR25BandCarryStep.delta F (k - 1)
      ≤ ErdosR25BandCarryStep.Bd r k
```
**Hypotheses:** exactly `ν = τ = 6` at order `2r+5`, packaged as the matching itself
because the proof consumes the saturating injection `C → B`, not the number; the
hypothesis sets are **equivalent, not merely sufficient**; `r ≥ 4` is **derived inside
the proof** and discharges the guard inside `Mclamped`, so nothing is missing.
**Fences: FIXED-BAND `d = 5`, named as such** — `d` enters only through the order;
**`x(F) < r` enters nowhere; acyclicity enters nowhere** (graph-general given `ν = τ`);
`Bd` is the **RANGED** object and the range is load-bearing. **DAG:** node (i) the
cover-fiber partition identity, node (ii) the König saturation lemma, the clamp, the
arithmetic layer, and the composition — **every node proved**, by two mutually
independent constructions (a literal transcription, exit 0, 8,661 jobs, zero `sorry`
warnings and zero `sorryAx` in the log; and a definitional `rfl` bridge inside the
seat's own project, exit 0, 8,663 jobs, bridges clean while the seat's originals still
print `sorryAx` — which is itself the proof that the bridges do not lean on them). Both
rebuilt by the F adjudicator from fresh copies. **No open node.**
**Attribution:** **critic-attributed to C-F3-T and C-F3-U for all three declarations**,
on the seat's unmodified `clamp_lemma` and `Arithmetic.lean`; the precedent is
`E993-R25-MATCHING-DUAL-SCALAR-CORE`'s critic-attributed induction step.
**Repairs the adjudicator names, all mandatory before dispatch:** (1)
`THEOREM-CONTRACT.yaml`'s `constructivity.rationale` "**two** of the three
theorem-level declarations" → **three** (the contract currently contradicts its own DAG
table and would tell a formalizer one fewer obligation than exists); (2)
`success_criteria.sorry_free: false` → update; (3) **rename** the cover binder `C` or
the binomial `ErdosR25BandCarryStep.C` (shadowing hazard, adjacent to `C5-E-h`); (4)
record the `Classical.propDecidable` instance bridge
(`convert h using 2 <;> congr 1 <;> exact Subsingleton.elim _ _`) in the contract; (5)
**critic attribution on the award's face for all three declarations.**
**Excluded conclusions:** an award here gives the band a **SECOND formally verified
INPUT — not a closure**; `E993-R25-FOURTH-BAND-CLOSE-ALL-R` stays `proved_informal` at
its weakest link; the arithmetic tail, the general half of `c(5) = 5`, Corollary F at
`d = 5` and (unless dispatch 5 also lands) the finite part are untouched; it is
**progress toward no tier**, and "however completely formalised, it resolves no
headline". One consequence worth registering separately: because the undifferenced and
differenced forms are equivalent under integer zero extension,
`CriticBridge.seat_coverFiberPartitionIdentity` is in substance **the first Lean proof
of the registered `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`** (whose registered grade is
`independently_adjudicated_informal_proof_no_formal_award`), and node (i) is the
**deeper** lemma, not the "once-differenced ancestor". **Ranked second:** the only
contract-ready group in orientation F, two independent proofs, and the highest-value
registry effect available on the run's fixed-band flagship composition.

### Dispatch 3 — `U-AWARD-MATCHING-ALL-INDEX-COEFFICIENTWISE` (clause (a) only)

**Exact statement.**
```lean
theorem Nj_nonneg_all_index {m K d : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) : ∀ j ≤ m, Nonneg (Nj K m j)
```
(`Nonneg p := ∀ n, 0 ≤ p.coeff n`.) **Hypotheses:** `K + d = 2m` and the region
`3d ≤ 2m+2`, both load-bearing and the region **exactly sharp** (at every off-region
cell tested `N_m` has a negative coefficient; smallest witness `(m,d) = (1,2)`,
`N_1 = −t−1`). **Fences:** uniform in `d`, `m` **and** `j`; no horizon, no census;
`ν`, `τ`, `x(F) < r` nowhere — no `SimpleGraph`, `indepCount`, `delta` or
`firstDescent` occurs in the corpus. **DAG:** the sixth award imported
byte-identically → seat U1's 29 declarations (compiled) →
`partner_mem_range`/`Nj_nonneg_general`/`Nj_nonneg_all_index`/`Nj_nonneg_is_instance`
(compiled), with an independent second implementation. **No open node**; all three
rebuilt (8,657 / 8,658 / 8,658 jobs), axiom-clean. **Attribution:** seat **U1** for the
apparatus and the `j = m` assembly; the general-`j` lift **critic-attributed jointly to
C-U1-T and C-U1-F**. **Repairs the adjudicator names (2 of 2, both mechanical):**
(1) **rename `Nonneg`** and its dot-namespace lemmas (collision with Mathlib's root
`Nonneg`); (2) state the `t = r − K` substitution in the contract (no Lean identifier
mentions `r`; on the region `m ≤ K+1`, so `t ≥ 0` already implies `r ≥ m−1`).
**Excluded conclusions, mandatory on the face:** this discharges **clause (a) only** of
`E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`; **clause (b)** (`μ_j^g(t) ≥ 0`,
denominator positivity, clamp persistence) is formalised **nowhere**, so the registered
claim as a whole **stays `proved_informal`** and "the coefficientwise positivity lemma
is formal" must never be shortened to "the all-index dual positivity claim is formal".
The award must also record that the `j = m` instance **is** the sufficiency half of
`E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF` (two registry keys, not one), that the
**converse** half is not formalised, and that it bears **not at all** on
`E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`, which stays OPEN — nothing here shortens the
distance to certificate existence, which still needs a dual-sign lemma.

### Dispatch 4 — `U-AWARD-BD-STEP-SIGN-AND-INTERIOR-PEAK`

**Exact statement.** The two theorems `D_step_sign` and `interior_peak_le_cat` as
stated in B4 above. **Hypotheses:** `1 ≤ m`, `g < m` (the step-sign law; it also holds
at `g = m`, the restriction being a proof artifact of the cancellation, correctly
imposed); `7 ≤ m`, `g ≤ m` and the two bracket inequalities (the interior peak bound),
with the maximiser **supplied as a witness, never asserted to exist** — precisely the
distinction that makes `D_unimodal_peak` false and this true. **Fences:** fixed-band
`d = 5` arithmetic; no graph content; "unimodality" here is of the **integer function**
`g ↦ D(2m−g,m)` and is *derived* from a sign identity, importing no shape premise on
any `i_k`. **DAG:** seat nodes `Cz`/`D`/`N`/`L`/`R`, the ratio lemmas, node 1
`D_closed_form`, node 2a `L_sub_R`, node 4 `peak_bracket_integral`, node 5, node 6,
node 7 → C-U2-F's `choose_row_shift`/`choose_ratio_down_at` → node 2b `D_step_sign` →
`D_step_up`/`D_step_down`/`Cz_nonneg` → node 8 core `interior_peak_le_cat`. **One
project; no open node in this group**; rebuilt at 3,003 jobs, zero `sorry`, zero
`native_decide`, permitted axioms only. **Attribution:** seat **U2** for nodes 1, 2a, 4,
5, 6, 7; **C-U2-F** for node 2b and the interior peak bound; **node 2b independently
compiled by C-U2-T** (joint attribution on that node). **Repairs the adjudicator names
(1 of 2):** **rename `ErdosR25C6U2.star_star`** — it collides with Mathlib's root
`star_star` and the seat's own 18-line receipt for 17 prints exposes it.
**Registry effect, my ruling and not the U adjudicator's:** `D_step_sign` together with
`peak_bracket_integral` **is the registered VERIFIED `E993-R25-D-ROW-STEP-SIGN-LAW`
verbatim (both conjuncts)**, so this is a **grade change** for that claim,
`proved_informal → formally_verified`, with its Cycle 5 critic attribution (C-U2-T,
C-U2-F) preserved; `interior_peak_le_cat` is **new content with no registered
predecessor** and takes a new key. **The controller must re-confirm both alias findings
against the registry before dispatch** — I state them on my own reading of the
statements. **Excluded conclusions:** it raises **nothing else** — not
`E993-R25-BD-TAIL-NEGATIVE` (whose object is the top-level `Bd(r,r) < 0`), not
`E993-R25-FOURTH-BAND-CLOSE-ALL-R`; name it the *step-sign law and interior peak
bound*, **never "the band's tail"**; `D_unimodal_peak` must not appear in any form.
**Ranked fourth, above the card-5 groups**, because the alias makes it a grade change
for a registered VERIFIED claim plus one new parameterized theorem, at one rename.

### Dispatch 5 — the card-5 project: `U-AWARD-CARD5-JOINT-BUDGET-CELLS` + `U-AWARD-CARD5-COVER-CATALAN-BOUND`

**Funded as ONE Stage 7 project with two award statements and two distinct registry
actions** (the U adjudicator sanctions the shared project, and C-U3-F's
`cover_catalan_bound_five` consumes seat U3's `cover_rank_bound_five`, so building them
apart would duplicate the project).

**Statement (a):** the five theorems `Erdos993G1.ThirdWide.cell_9/11/13/15/17` as in
B2. **Statement (b):**
```lean
theorem Erdos993G1.ThirdWide.cover_catalan_bound_five {X} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) (hC : C.card = 5)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (n k : ℕ) (hn : Fintype.card X = n + 5) :
    (n.choose (k+1) : ℤ) - n.choose k
      - 5*(if 1 ≤ k then (catalan (k-1):ℤ) else 0) - 10*(if 2 ≤ k then (catalan (k-2):ℤ) else 0)
      - 10*(if 3 ≤ k then (catalan (k-3):ℤ) else 0) - 5*(if 4 ≤ k then (catalan (k-4):ℤ) else 0)
      - (if 5 ≤ k then (catalan (k-5):ℤ) else 0) ≤ Erdos993G1.delta F (k : ℤ)
```
**unconditional** (no `hfloor`), with the card-5 ENTRY-148 analogue
`catalan_gap5_identity`. **Fences:** (a) is **FIXED-CELL** — one `(r,k,order)` triple
each, not uniform in `d`, in the order or in `r`; (b) is **parameterized in `(n,k)`**.
`x(F) < r` is never a hypothesis anywhere in the group. **DAG:** (a) frozen ENTRIES
1–3, 14, 17, 23, 25, 58, 59, 82, 83, 165–168, 172, 174, 178 → `powerset_five_sum`,
`cover_rank_bound_five` (**renamed**, the frozen ENTRY 170 collision resolved as
chartered), `cover_five_sparse_vertex`, `avail_le`, `exists_card_five_cover`,
`fSingleton`, `joint_cert`, `sum_powersetCard_one_eq`,
`cover_rank_bound_five_singletons`, `joint_cert_finset`, `crossdeg_le`, `budget_bound`
(**the sole point where acyclicity enters**), `cell_bound`, and the five cells — all
compiled, three independent rebuilds; (b) `FirstWide` 84/86/87 + ENTRIES 136–143 + 177
transcribed → `binomDelta_floor` → `binom_shift_floor` → ENTRY 178 →
`cover_catalan_bound_five`, and ENTRY 147 → `catalan_gap5_identity` — all compiled,
8,660 jobs. **No open node in either half**; C-U3-T's stated seven-entry transcription
residue is **discharged** by C-U3-F's unconditional form, which is the object of record.
**Attribution:** seat **U3** for the cells' Lean assembly and the padding lemma; the
LP-dual certificate `f(d) ≥ 42 − 14d` and the five-cell reach **critic-derived in
Cycle 5**; **C-U3-F** for the unconditional `cover_catalan_bound_five` and its
transcription closure; **C-U3-T** independently for the identity and the conditional
form. **Repairs the adjudicator names (contract text only; 0 proof-term repairs):**
(i) re-target the alias line to **`E993-R25-CARD5-JOINT-BUDGET-CELLS`**, naming also
`E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY` (OPEN) and
`E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`; (ii) disclose that `cell_9`'s registered
positivity content is **already frozen ENTRY 175, more generally** — **the delivered
novelty is FOUR cells, not five**; (iii) disclose that the cover hypothesis is
**vacuous at orders 9 and 11** and cover-essential only at 15 and 17; (iv) repair the
transcription-fidelity language (`Transcribed2.lean` line 44 drops the trailing space
of frozen line 3761, so the ENTRY 174 tag digest does not recompute over the
transcribed body — restore the byte or state the deviation); (v) **strike or re-label
the census figure "153/710/3,658/10,648/29,915" — 3,658 is the TOTAL order-13 forest
class count; the `τ ≤ 5` population is 3,073**; (vi) strike
`cover_five_sparse_vertex'`, correct "all 17 declarations" to "17 of 18", and correct
the ENTRY 174/178 line spans and the `unnecessarySimpa` attribution. **Excluded
conclusions:** `catalan_gap5_pos` / `catalan_gap_five_pos` (`Γ(5,k) > 0` for `k ≥ 6`)
**is an instance of the already formally verified `E993-R25-CATALAN-GAP-MONOTONE-RATIO`
at `τ = 5` and must NOT be registered as new** — the genuinely new objects are the
`ThirdWide`-namespace identity and the card-5 cover bound; the group is **never**
`c(d) = min(d,5)` in Lean and **never** a tier statement; it does **not** discharge
`E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`, because each `cell_n` proves **one** rank
(`k = r−1`) while that claim asks for `Δ_k > 0` at **every** `k < r` — **no Lean object
in this run discharges the lower ranks**, and the award must say so; the theorems are
**far from sharp** at four of five cells; and the gate's `Δ₃ = −8` figure is a
**witness**, not a cell minimum (`τ = 5` graphs at `−9` and `−10` exist).

### Dispatch 6 (contingent on remaining capacity) — T2's node N8, at a RE-FROZEN contract

**Exact statement:** `W_min_at_spanning_tree` / `candidateD_argmin` — `W(n,k,e)` is
antitone in `e`, hence `min_{1 ≤ e ≤ n−1} W(n,k,e) = W(n,k,n−1)` for every `n ≥ 4` and
every integer `k`; the headline declaration must be **`candidateD_argmin`**, which
states the step in Candidate D's own words. **Hypotheses:** `n ≥ 4` (tight, not
decorative — the closed form fails at `n = 3, k = 1, e = 1` and below), every integer
`k`. **Fences:** uniform in `k`; **no graph occurs in the statement at all** — the
object is zero-extended integer binomial coefficients; `d`, `ν`, `τ`, `x(F) < r`
nowhere. **DAG:** closed at the integer statement (`Nat.choose` and integer arithmetic
only; `zchoose` is tied to `Nat.choose`, not axiomatised; everything in `ℤ` with no
natural subtraction). Kernel-checked, `sorry`-free, axiom-clean, **rebuilt from fresh
copy-outs by both T2 critics** with identical source digest, job count and receipts.
**Attribution:** seat **T2**; the `c_e = 1` bridge **critic-attributed to C-T2-F**.
**Two binding conditions, both mandatory:** (1) **the frozen contract of §4.1 must NOT
be dispatched as written** — its `expected_statement` is the *graph* theorem N12, which
**no shipped fragment proves** (a token sweep finds no `SimpleGraph`, `IsAcyclic`,
`indepCount` or `Erdos993G1` anywhere in the seat's `Main.lean`); re-freeze on the
integer statement actually proved, explicitly **not** as the forest order bound;
(2) **the dispatch must not carry the §5 pointer** — the return's obligation item 1(f)
sends a formalizer to §5, and §5 states the two boundary-order facts **inverted**, so a
formalizer would formalise the negation of the run's own bound. **Materiality: at the
low end of this run's bar, and I say so plainly** — N8 is the discharge of a
sub-obligation named *inside* an already-registered claim, not a claim of its own, and
**no new `E993-R25-…` registration is warranted** (the seat, both critics, the
adjudicator and I all decline to propose one). Against that, it is the step the Cycle 5
T adjudication called "the exact and only missing piece", it is uniform in `k` with no
horizon, and it is what makes `E993-R25-FOREST-ORDER-BOUND-SHARPENED` rest on a proof.
**Ranked last; fund only if capacity remains after dispatches 1–5.**

### Not fundable at this close, with the reason

- **The Cycle 6 flagship, `∀ r ≥ 6, Bd(r,r) < 0`.** **Open nodes** — node 8's lift from
  the interior peak to the whole `Finset.sup'`, the `b < m` region, node 9's tail clause
  on the `a−1 ≤ 5` indices above `2m` (**not** a blanket non-positivity lemma:
  `D(100,1) = 4751 > 0`, **re-derived here**), node 10 `M_a_le_Cat` at `r ≥ 15`, and
  `g_c` as a `Nat.find` — and, beyond the open nodes, the two critics' completed halves
  sit in **incompatible definitional frames**, so assembling them is a *new composition*
  that gate ruling 8 would subject to an isolated second read the terminal cycle cannot
  afford. **The definition of record is C-U2-F's integer-rank `MaR`/`BdRR`**
  (`BdRR 4 = 48`, confirmed by my own instrument), not C-U2-T's ℕ-truncated `MaR0`
  (`42`); the divergence is confined to `r ∈ {2,3,4}`, harmless for the `r ≥ 6` target
  and **fatal for fixed-point validation**, which is exactly the check a terminal Stage 7
  seat performs first.
- **Node N1 (Hunter), despite two kernel-checked critic fragments** — both carry the
  same unformalised bridge (every finite spanning tree admits an increasing-order parent
  map). DAG not closed. **Two independent formalizations agreeing on the same residual
  gap is the strongest signal in the T portfolio that the gap is real and small.**
- **The full sharpened order bound (T2's §4.1 target)** — N12 unbuilt, N1–N7/N9/N10
  informal, **binding node N3** (the maximum-weight auxiliary spanning tree over the
  line graph, for which Mathlib offers no API), plus a missing explicit `e = 0` node.
- **T1, T3, T4 and F1/F2/F4 entirely** — no Lean anywhere; T3's Lean was explicitly and
  correctly declined; T4's widened Cap Lemma is `proved_informal` with its two
  load-bearing repairs critic-supplied and not written up in one place.
- **Lemma H's tightness half, the `τ ≤ 5` decision and `s*(τ)`, Theorem D and its forest
  corollary, the rank-isolation reduction** — registration candidates, not award groups;
  no Lean work exists on any of them.

---

## Progress and stop-gate ruling

**The stop gate is armed at this close.** A decisive event is a verified Tier 1 or
Tier 2 theorem, a verified reduction strictly shrinking the remaining class, or an
exact counterexample. A plateau requires **evidence of no material progress over two
consecutive cycles**, never the absence of a headline proof; Cycles 3, 4 and 5 each made
material progress, so a plateau would need **Cycle 6 itself** to show none.

**No decisive event.** No Tier 1 or Tier 2 theorem was verified. No reduction strictly
shrinking the remaining class was proved — **the window `[c(d)+1, m(d)−1]` is exactly
where the Cycle 5 close left it**, both endpoints unmoved. No exact counterexample to
any tier was found, by any instrument, on any route.

**Material progress: yes**, on all three orientations' independent assessments and on
mine. Ten items, each new against the Cycle 5 close and **none a horizon extension**:

1. **Seven award-grade groups are contract-ready at the terminal Stage 7** (one in T,
   one in F, five in U), funded below as **six dispatches** because two of the U groups
   share one project — the largest Stage 7 slate of the run, against six formally
   verified awards produced across the five preceding cycles combined.
   `SOLUTION-CONTRACT.md` §6(c) ("a candidate ready for the Lean gate") is satisfied
   seven times over.
2. **The band carry step's full Lean DAG now exists, twice independently**, taking
   Candidate C from "zero Lean fragments exist" to contract-ready in cycle.
3. **A registered VERIFIED forest threshold closed in Lean against the frozen G1
   project, twice, with zero enumeration at any order** — dissolving rather than solving
   the charter's own Debt question.
4. **The coefficientwise dual positivity closed at every index `j ≤ m`**, and the
   obstruction the seat believed blocked it shown not to exist.
5. **The `x = 5` residue shrank on two axes at once** — by proof (ceiling 29 → 25) and
   by exact exhaustion of the whole `≤ 2`-branch-vertex forest stratum at orders 22–29.
   Neither shrinkage is a sweep.
6. **`τ = 11` thin trees are settled end to end**, and the `τ = 12` order-26 residue is
   narrowed from `h = 6..11` to exactly `h ∈ {6,7,8}`, coverage 53.17 % → **55.60 %**.
7. **The `τ ≤ 5` cover branch is decided at `d = 6` and `d ≥ 7`** — residue 5 → 2 → 0,
   both `d = 6` cells closed by complete census *and* by elementary counts. This is a
   proved reduction of the remaining class **within a fixed-`τ` hypothesis**, and it
   reverses its own route's headline.
8. **The `(7,7,15)` full-census minimum is certified COMPLETE** by the commissioned
   second read; the 954-class cover-edge census the route declined is delivered and
   confirmed three ways; the Cap constant is sharpened 45 → 40 with scope widened from
   128 to all 1,082 classes.
9. **Seven new critic-attributed theorems** — Region I strictness, the exact Region II
   characterisation and H3 on the matching branch; the general Hall equivalence, the
   joint `σ + e_C ≤ τ−1` budget and the exact sign decomposition (`D ≤ 3 ⟹ Δ_{r−2} > 0`
   for every `τ`) on the cover branch; the one-step lemma as a theorem at `d = 3`.
10. **Five mechanisms refuted**, each closing a door a successor would otherwise have
    tried: the multiplicative Region II route, the `partner` obstruction, the necessity
    of a finite forest base case, the `τ = 14` stress test's inference, and the two-hub
    probe's null.

**Plateau: no.** The condition fails at this cycle alone, so it cannot be met over two
consecutive cycles ending here.

**The honest counterweight, stated because material progress is not headline
progress.** **Not one of these advances touches the uniform residual no-recovery
question.** T1's object is a band-margin lemma open at every `d ≥ 4`; T2's and T3's are
order bounds, and an order bound is not a no-recovery statement; T4's is a fixed-band
`d = 7` cell whose constant demonstrably does not transport; F3's is a fixed-band `d = 5`
ingredient; F4's raises no status; U1 has no graph object; U2 is fixed-band arithmetic;
U3 is five fixed cells; U4 is a positivity statement of the opposite sign. **The run
advanced its instruments materially and advanced the headline not at all** — by the
design of the portfolio, not by failure of the seats. Two of the four questions this
cycle was chartered to *close* (the `τ ≤ 12` in-window decision and the `r = 19`,
`τ = 13` cell) hit a **budget wall rather than a mathematical one**; the other two (the
one-step lemma at every `d`, the flagship's top-level theorem) hit mathematical walls
that are now named exactly.

**Stop-gate ruling: material progress is affirmed and no plateau is found**, on all
three orientations' independent assessments and on mine; the stop gate found no
decisive event. The typed lines are carried once, under `## Continuation ruling`.

---

## Successor-run recommendations

Cycle 6 is the charter's last cycle; there is no Cycle 7 and this section replaces any
next-cycle portfolio. Every item is written as **what a successor run inherits**.
Nothing here is deferred Cycle 6 work: the Cycle 6 obligations are adjudicated,
discharged or struck above. The chartered controller review and Ashton's
pre-authorized scoped publication follow this close and are **not** routes.

### (a) Which of the charter's four outcomes the experiment achieved

The charter names four (`SOLUTION-CONTRACT.md` §5): *a uniform advance, a proved
structural reduction, another fixed-band result, or a refutation.* **My ruling, exactly:**

> **The experiment achieved ANOTHER FIXED-BAND RESULT, together with REFUTATIONS that
> fence the method. It did not achieve a uniform advance in the charter's sense, and it
> did not achieve a proved structural reduction of the remaining class.**

**The fixed-band result** is the diagnostic band: `E993-R25-FOURTH-BAND-CLOSE-ALL-R` —
for every finite forest `F` and every `r ≥ 1`, `|V(F)| = 2r+5` and `x(F) < r` imply
`Δ_r(F) ≤ 0` — registered VERIFIED at `proved_informal`, **fixed-band `d = 5`, every
`r`, graded at its weakest link**, with one formally verified input entering this cycle
and a second (and, with dispatch 5, the finite part) contract-ready at this close. It is
a band theorem, and the charter grades a band theorem as a fixed-band result; it
explains no uniform mechanism.

**The refutations** are real and they are the run's most durable product: the cover
diagonal at `d = 6` and `d = 7` refuted with nine explicit, controller-verified,
independently reproduced witnesses (all nine re-derived here); Corollary F's extension
to `d = 12` refuted with explicit forests, which turned `d ≤ 11` from a computation
horizon into a **PROVED SHARP** ceiling; `E993-R25-SINGLE-HUB-NOT-UNIFORMLY-WORST`;
`D_unimodal_peak` caught FALSE before any formalizer saw it; and this cycle's five
mechanism refutations. Eighty-eight of the run-local registry's 345 claims are REFUTED.

**Why not a uniform advance.** The charter's uniform targets are Tier 1, Tier 2 and the
Tier 3 schemas; **all are OPEN and all end the run OPEN**, with Tier 2 exactly as the
Cycle 5 close left it. The run did produce genuine uniform theorems — six formally
verified awards: two fixed-band `d = 5` matching results, one about Catalan integers
uniform in `τ` with explicit thresholds, one uniform-in-`d` bottom-rank matching
theorem at rank `r = d` only, one sharp forest order bound uniform in `k`, and one
scalar core — plus, at this close, contract-ready uniform-in-order and
uniform-in-`(d,m,j)` groups. **None of them is a uniform-in-`d` no-recovery statement**,
and the run's only rank-uniform matching theorem is at the bottom rank alone.

**Why not a proved structural reduction.** Tier 3c asks for the counterexample class to
be explicitly characterized **and strictly smaller** than the current necessary region.
The class is explicitly characterized — `ν(F) ∈ [min(d,5)+1, ⌈3d/2⌉−2]` with
`x(F) < r`, plus the G1 necessary region `p ≥ 6`, `|U| ≥ 2p+1`, `maxdeg(U) ≥ 3`, strict
residual recovery — but **neither endpoint moved in Cycle 6**, and no further reduction
from the ambient G1 guards was proved at any point in the run.

**On the record after six cycles:** six formally verified awards plus whatever the
terminal Stage 7 lands; **every headline still open; no recovering forest anywhere, at
any order, at any rank, by any instrument, in six cycles.** **And, stated because the
publication packet depends on it: closing G1 alone does not solve Erdős #993.** G1 is
one wrapper configuration in one program; Tier 2 is a statement about that wrapper;
Tier 1 is a proper subclaim of forest unimodality below half the order; forest
unimodality is itself a subclaim of the open targets `E993-TGT-FOREST` /
`E993-TGT-TREE`; and no claim in this run bears on Erdős #993 itself.

### (b) The exact remaining obligation of every tier and schema

**Tier 1 `E993-R25-UNR-FOREST-WIDE` — the whole statement.** A successor inherits: zero
recovering forests anywhere; `x ≤ 4` of the `K₁`-addition target closed
**unconditionally**; the `x = 5` residue **exactly** forests of order 22–25 with at
least **three** vertices of degree `≥ 3` (orders 26–29 excluded twice over, by Theorem E
and by exact value on the `≤ 2`-hub stratum); `N*(k) = k²+k+3` now with **no** open step
(T2's argmin closed, `e = 0` checked harmless); thin trees free of any log-concavity
failure at every `τ ≤ 11`, `τ ≤ 9` unconditional and `τ ≤ 10`/`τ = 11` conditional on
the register; the in-window question open at **nine orders of `τ = 12` (26–34)** — order
26 residual `h ∈ {6,7,8}` = 764,513 skeletons ≈ 1.1 × 10⁸ attachment instances, orders
27–34 never swept by anyone; the standing in-window minimum **`τ = 21` unchanged**; the
remaining region of excesses **`d ≥ 6`**. The forest-of-several-thin-components case
needs a **separate window computation on the convolved sequence** (because `r_max`
belongs to the whole forest) — **an instrument no route in this run built.**

**Tier 2 `E993-G1WIDE-NO-SIZE-CAP` — untouched, inherited exactly.** Residue: every
`d′ ≥ 6` plus the single cell `(d′,p) = (3,6)`; the `d′ = 3` slice `proved_informal` at
every other rank with the Basit–Galvin dependency discharged for the forest-restricted
slice; `E993-R25-G1-RESIDUAL-D5-SLICE` registered after its second read; **nothing
bounds `d′` above.** A successor should note that the last open rank of the `d′ = 3`
slice **is the same object as the live matching-branch cell `(3,4)`**.

**Tier 3a `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` — ONE lemma, now named exactly.**
Prove pointwise domination on the **Region II pre-absorption strip** together with the
absorption-ordering sub-lemma (rank `r−1` never absorbs later than rank `r`; zero
violations at `d ≤ 400`; **1,146,505 live steps**). The target is named: the leak
identity `Δ_j = B(j,r)Δ_{j−1} − [(2j−K−1)/((i_r−1)(r+1−j))]φ_j(r−1)` with the explicit
sufficient bound `Δ_{j−1} ≥ 2(m−j+1)(2j−K−1)φ_j(r−1)/[j·i_r(i_r−1)]`. That gives the
one-step lemma for every `(d,α)`, hence top-cell attainment by induction on `α` with no
asymptotics, hence — **with the already-discharged `j = r+1` constraint and an explicit
uniform lower bound on the top-cell margin** — the band `d < r < K(d)`, the live cell
`(3,4)` and the `d′ = 3` slice's last rank. Already in hand: `r = d` formal,
`r ≥ K(d)` informal, H3 and the region identities as theorems, Region I domination
strict, the absorbing state.

**Tier 3b `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY` — `c(d) = min(d,5)` in Lean and
the exact domain.** Four inherited obligations: (i) the **general half of `c(5) = 5`**
and the ranks **below `k = r−1`** — each `cell_n` proves one rank, the claim asks for
every `k < r`, and **no Lean object in this run discharges the lower ranks**;
(ii) the `order ≥ 19` regime (the ENTRY-182 analogue at card 5) and a uniform-in-order
statement replacing five fixed cells; (iii) the exact domain of the stratum theorem —
the `r = 19`, `τ = 13` cell (no proof, no counterexample from five methods; the
obstruction is that `f_m(n)` is **not monotone in `n`** and `Δ₁₇ ≈ 9×10⁷` against terms
of order `10^{10}` is a three-decimal-order cancellation), the `τ ≥ 14` shape
(`D`-indexed: `D ≤ 3` is a theorem, `D = 4` the unique negative slice at `τ = 14`,
`τ = 17`/`D = 5` the only `τ ≥ 15` band known to close), and `s*(τ)` for `τ ≥ 8`
(out of reach: no registered `K(τ)` covers it, `K(8)` exceeds 6,000);
(iv) **the chartered debt nobody paid** — compute `JB(τ, r, r−2)` **with a shipped
digested generator** (nothing in Cycle 6 ships one at all) and name the least `τ` at
which the closed-form single-hub family stops attaining the joint bound, with the
competing profile.

**Tier 3c, the window reduction — both endpoints.** Raise `c(d)` above 5 (the diagonal
route is refuted for `d ≥ 6`, so a successor must find an off-diagonal route, and the
registered record has **no false cell off the diagonal**) or lower `m(d)` below
`⌈3d/2⌉−1`. Until one moves, the window is `[min(d,5)+1, ⌈3d/2⌉−2]`, width
`⌈3d/2⌉ − 7` for `d ≥ 5`, and `{6,7}` at `d = 6`.

**Diagnostic band `d = 5` — three informal inputs.** The arithmetic tail
`E993-R25-BD-TAIL-NEGATIVE` (top-level `∀ r ≥ 6, Bd(r,r) < 0`; nodes 8-lift / 9 / 10 /
10′ open, on the integer-rank frame of record); the general half of `c(5) = 5`;
Corollary F at `d = 5`. With dispatches 2 and 5 the band would have **three** formally
verified inputs and its grade would **still** be `proved_informal` at the weakest link.

**Every schema ends the run OPEN. No schema's threshold function moved in Cycle 6.**

### (c) Successor routes — four per orientation

**T (prove).**
- **S-T-1 — the Region II pre-absorption strip** (inherits T1). Closes the one-step
  lemma for every `(d,α)`, hence the band, the live cell `(3,4)` and the `d′ = 3`
  slice's last rank. **Binding:** fix **one** `ρ` orientation before quoting either
  critic (they are reciprocals); do **not** attempt the multiplicative route (refuted);
  re-derive the binding family under **one stated functional**, because the two critics
  locate it at opposite ends of the band while measuring different quantities; do not
  extend the `d ≤ 400` horizon by sweeping — that is not a route.
- **S-T-2 — the N12 assembly of the sharpened order bound in Lean** (inherits T2),
  re-priced with **N3** as the binding node. In hand: N8 verbatim; N1 modulo the
  tree-ordering normal form (two kernel-checked critic fragments); the Cycle 4 award's
  reusable declarations by name; N4 as `nonindep_card_le_edges_mul_choose` with
  `Finset.card_biUnion_le` replaced by `hunter_card_sdiff_ge`. **Add an explicit `e = 0`
  node. Re-freeze the contract; strike and invert §5 first; write `N*` for the attained
  extremum and a different symbol for the method's threshold.** Closes a formal award
  strictly sharpening one of the run's own awards by exactly `k−2` for `k ≥ 3`.
- **S-T-3 — the `≥ 3`-branch-vertex stratum at orders 22–25** (inherits T3). Extend the
  exact enumeration one hub further and meet it with a genuinely **forest-specific**
  bound: **the AM-GM step `L ≤ ½Σ_v d_v(d_v−1)²` is the sole lossy step in Theorem D and
  is topology-free**, so a `D`-only bound respecting the forest fact that a high-degree
  hub's neighbours are mostly leaves is the only route by which the third-order
  mechanism becomes forest-specific rather than triangle-free. The hub count is capped
  by `n/3 ≤ 8`, so the induction terminates. Closes `x ≤ 5`, leaving `x = 6` the
  smallest open rank.
- **S-T-4 — the `(7,7)` cells beyond `r = 15`** (inherits T4, **re-scoped by the second
  read**). Question (i) of the T adjudicator's route — whether an `r = 15` cell-minimiser
  has at most one low slot — **is answered and is no longer a route**: the box is the
  complete order-derived box and `−1,612,675` is a complete full-census minimum. What
  remains: re-run at the sharpened cap `Σp ≤ 40` (the box halves where the cap binds, at
  large `r`), push the exhaustive domination range above `r = 18` toward the
  **`(7,7,34)` closed-form sign endpoint**, and lift the cover-edge stratum's minima to
  every `r`. **Binding: no "extremality at `τ = 7`" line in any form; `x` on every row;
  the constant is fixed-band `d = 7` and does not transport.**

**F (falsify).**
- **S-F-1 — finish the `τ ≤ 12` in-window decision.** Residue exact: `h ∈ {6,7,8}` at
  order 26 = 764,513 skeletons ≈ 1.1 × 10⁸ instances, **3–6 hours single-threaded or
  ≈ 1 hour per stratum across three parallel processes** (the strata are independent);
  plus **all eight orders 27–34, never swept by anyone**. **The decisive lever is
  per-instance cost, not orbit deduplication** (whose ceiling is under 1.4×): compute
  the independence polynomial on the *skeleton*, handling pendant leaves analytically as
  a factor `(1+z)` on each attached cover vertex's exclusion polynomial. Closes a
  COMPLETE answer — either the standing minimum `τ = 21` **lowered**, the most
  consequential event available to the orientation, or the thin band closed with the
  frontier pinned at `τ ≥ 13`. Also owed: the convolved-sequence window instrument.
- **S-F-2 — the `r = 19`, `τ = 13` cell by an argument, not a search.** Coordinates are
  right and the obstruction is named. Two admissible attacks: a monotonicity/exchange
  lemma bounding all hyperforest topologies by a small family (five methods converge on
  `[10,2,2,2]`; none proves it optimal), or a genuinely complete enumeration of
  hyperforest **shapes** on 13 elements with `surplus ≤ 12` — a finite space that remains
  **uncounted** (296 spanning shapes reached; the leaf space alone exceeds `10^{11}`
  points, so brute force is out). Closes the stratum theorem's exact domain and with it
  the last open cell of Corollary F's `d ≤ 11` sharp ceiling.
- **S-F-3 — the `(τ,D)` closure law, and the chartered debt.** (i) Turn the
  Gaussian-ratio step into an **explicit error bound**, upgrading "`τ = 14` closes at
  `r = 261` and never reopens" from a scan to a theorem, **quantified over `D`**, with
  the exhaustive 38,760-multiset window sweep as the finite base case; `τ = 17`, `D = 5`
  is the natural place to look, being the only `τ ≥ 15` band known to close, and `D ≤ 3`
  is already a theorem. (ii) **Discharge the joint-bound debt with a shipped digested
  generator.** (iii) Settle `e_C = 0` optimality in general, from the joint budget.
  **Record the `D`-indexed band structure so no successor reports "the negative band" as
  a single object.**
- **S-F-4 — the falsity criterion on the cover diagonal.** The `Γ` residue says where
  the bound is *inconclusive*, **never where the statement is false** (0 of 5 false at
  `τ = 5`, 2 of 10 at `τ = 6`, 26 of 67 at `τ = 7`). **Can falsity occur at slack `≥ 1`
  at all?** The registered record has **no false cell off the diagonal**. A closed-form
  criterion predicting falsity from `(τ,k)` alone would turn the case-by-case diagonal
  census into a theorem and would settle `s*(τ)` for `τ ≥ 8`. Cheap leftovers:
  `(7,7,6)` order 19 and `(7,7,7)` order 21 at complete-census grade. **Do NOT
  re-charter** "does the reduction survive at `d = 8,9,…`" (proved outright, uniform in
  `(τ,d)` for `τ ≤ d+3`) or sweeping the diagonal further.

**U (formal / structural).**
- **S-U-1 — close the `Bd` tail (the flagship's residue).** Rebuild on **C-U2-F's
  integer-rank `MaR`/`BdRR`** in a single project and land: node 8's lift via
  `Finset.sup'_le` plus `D_step_up`/`D_step_down`; the `b < m` region
  (`D(b,m) = C(b,m−1) ≤ 1 ≤ Cat_{m−1}`); node 9's tail clause on the `a−1 ≤ 5` indices
  above `2m` (**not** a blanket non-positivity lemma); `g_c(m)` as `Nat.find` on
  `g²−g ≥ 2m` with the two bracket inequalities from `Nat.find_spec`/`Nat.lt_find_iff`;
  then re-derive `MaR0_le`/`node11`/`BdRR_le_neg_gamma`/`BdRR_neg_of_high` on the
  corrected frame and split over `r ≤ 14` (already compiled) and `r ≥ 15`. **Rename
  `star_star` first. Carry the warning: `M_a(r) ≤ Cat_{r−1−a}` has 19 failures at
  `r ≤ 14`, so the layer must not be folded into the general case.** **If a successor
  funds one thing, fund this** — it is the band's remaining formal input.
- **S-U-2 — close the dual side end to end.** Formalise clause (b): `Nonneg p →
  0 ≤ p.eval t` for `t ≥ 0`; the strict positivity of the denominators on `t ≥ 0`
  (elementary); `μ^g` (or `ε_j`) as a Lean object; clamp persistence keyed to
  `E993-R25-CLAMPED-DUAL-DOMINATION`. Then the **converse** half of
  `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF` from the leading coefficient
  `3^{m−1}(2m−3d+3)`. **Fence: this is still the dual side;
  `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` stays OPEN and certificate existence still
  needs a dual-sign lemma. No tier moves.**
- **S-U-3 — the `order ≥ 19` regime of `c(5) = 5` in Lean, and a uniform-in-order
  statement.** With the unconditional `cover_catalan_bound_five` and `catalan_gap5_pos`
  in hand, land the ENTRY-182 analogue `cover_delta_large_pos` at card 5, then fold the
  five hand-instantiated cells into one `∀`-quantified numeral table over `cell_bound`
  (already fully parametric). **Also inherits the ranks below `k = r−1`**, which no Lean
  object in this run discharges and which must be formalised or recorded as open.
- **S-U-4 — the forest `Δ₃` headline, enumeration-free.** Land
  `0 < Erdos993G1.delta F 3` for every forest of order `≥ 12` from
  `forest_delta_two_lower` (now compiled), frozen ENTRY 150's leaf, ENTRY 100's edgeless
  formula and a strong induction threading the `ℓ₃` values already kernel-checked. **No
  base case, no enumeration, no isomorphism-completeness object.** The one genuinely
  missing Lean piece is the **pendant identity `Δ_k(F) = Δ_k(F−v) + Δ_{k−1}(F−N[v])` at
  a leaf**, in the `indepCount`/`deleteVerts` carriers: the frozen project does **not**
  contain it and it exists only in two Cycle 5 critic files **outside every Cycle 6
  grant** — a successor must be granted those files or re-prove it (the method of record
  is a single transport lemma back onto the original carrier). Cheap add-on: restate the
  order-11 kernel certificate in the G1 definitions, upgrading a standing informal
  sharpness claim.

### (d) The TERMINAL Stage 7 funding

**In dispatch order: (1) `U-AWARD-FOREST-DELTA2-ORDER-9`; (2)
`E993-R25-BAND-CARRY-STEP-HALL` (critic-attributed); (3)
`U-AWARD-MATCHING-ALL-INDEX-COEFFICIENTWISE` (clause (a) only); (4)
`U-AWARD-BD-STEP-SIGN-AND-INTERIOR-PEAK`; (5) the card-5 project
(`U-AWARD-CARD5-JOINT-BUDGET-CELLS` + `U-AWARD-CARD5-COVER-CATALAN-BOUND`, one project,
two statements); (6) contingent on remaining capacity, T2's node N8 at a RE-FROZEN
contract.** Each group's exact statement, hypotheses, fences, attribution, the repairs
its adjudicator names and every excluded conclusion are in `## Lean awards` above, and
that section is the funding instrument. **Not fundable — and stated plainly because it
is the cycle's flagship — the top-level `∀ r ≥ 6, Bd(r,r) < 0`: it has open nodes, and
a group with open nodes is not fundable at a terminal close.**

### (e) Registrations and scope updates the controller should make at the close

**Each carries its grade and attribution on its face. The registry must be honest about
which results are formal and which are not — Ashton's pre-authorized publication depends
on it. Only the governed `lean-proof-workflow` may write `formally_verified`.**

**R1 — grade changes, CONTINGENT on the terminal Stage 7 closing each group.**
`E993-R25-FOREST-DELTA2-POS-ORDER-9` → `formally_verified` (critic-attributed C-U4-T /
C-U4-F; a forest **threshold** theorem, never "first unconditional forest theorem").
`E993-R25-BAND-CARRY-STEP-HALL` → `formally_verified`, **fixed-band `d = 5`,
critic-attributed to C-F3-T and C-F3-U on all three declarations**; the band composition
**does not** change grade. `E993-R25-D-ROW-STEP-SIGN-LAW` → `formally_verified` (both
conjuncts; Cycle 5 critic attribution preserved) — **my alias identification, to be
re-confirmed by the controller against the registry before dispatch.**
`E993-R25-CARD5-JOINT-BUDGET-CELLS` → `formally_verified`, **fixed-cell**, with the
four-not-five disclosure. `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`: **clause (a)
only** formally verified; **the claim as a whole stays `proved_informal`.** If a group
does not close, its claim's grade does not move — say so rather than carrying an
intention as a grade.

**R2 — scope updates and corrections (no grade change in any of them).**
(i) `E993-R25-FOREST-ORDER-BOUND-SHARPENED`: the scope sentence "ONE STEP NAMED OPEN …
not proved" is now **false** — T2 closed the argmin unconditionally; **a scope update,
explicitly not a grade change**, and leaving it would ship a terminal packet naming as
open a step its own Cycle 6 return proved. (ii) `E993-R25-PENDANT-CAP-TAU-7`: the
credited "exact per-subset Pascal criterion" and the constant 45 **cannot both stand**;
the repair true either way is criterion `n_S ≤ 2(r−1−t) − 1` (equivalently
`|B ∩ N(S)| ≥ 2|S|+3`) and constant **`Σp ≤ 40`**, scope widened from the 128-class
connector-only stratum to all **1,082** classes, with the note that the order-derived
box already makes the cap **vacuous at `r = 15`** and it binds only at large `r`. **Do
not reopen the Cycle 5 attribution.** (iii) `E993-R25-COVER-DIAGONAL-D7-SIGN`'s
certificate: replace "exact within the connector-only stratum (128 classes), NOT a
full-census cell minimum" with **the `(7,7,15)` full-census minimum `−1,612,675`,
COMPLETE**, second-read-certified, with the cover-edge stratum minimum `−614,281`, the
`≥ 2`-low-slot stratum minimum `−168,481`, the margin `998,394`, and the certificate at
`r = 16, 17, 18`; record that it is **not extremality at `τ = 7` in any form** and that
`E993-R25-SINGLE-HUB-NOT-UNIFORMLY-WORST` remains REFUTED. (iv)
`E993-R25-BD-TAIL-NEGATIVE`: record **C-U2-F's integer-rank `MaR`/`BdRR` as the
definition of record**, with the four Lean fixed points and C-U2-T's
`BdRR_four_nat_reading` as the honest record of the ℕ-truncation trap — **no grade
change.** (v) `E993-R25-CARD5-JOINT-BUDGET-CELLS`: correct the order-13 population to
**3,073** (`τ ≤ 5`), 3,658 being the total order-13 forest class count. (vi) Fix the
**band convention** once, centrally: **79,600 inclusive cells / 79,202 strict cells /
79,202 consecutive pairs**, with the note that the inclusive sweep's bottom rank `r = d`
lies outside `d < r < K(d)` and is owned by the formally verified
`E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN` (no claim transferred). (vii) Fix the
**`1,082` wording** once: the live census total, forbidden only as the connector-only
residue's denominator. (viii) **Strike and invert T2 §5's two boundary-order
inequalities** in an unsealed controller addendum — never as an edit to the sealed
return — and repair or remove the return's item-1(f) pointer. (ix) Strike the
allocation's "Cycle 1 award" `D`/`E` clause (no award run ships a `D`/`E` layer).
(x) Record that the gate's `Δ₃ = −8` figure is a **witness**, not a cell minimum.
(xi) Record the corrected `omit … in` parser cause. (xii) Keep `D_unimodal_peak` absent
everywhere. (xiii) Rename `star_star`, `Nonneg`, the cover binder `C` and the card-5
`cover_rank_bound` **before any dispatch**. (xiv) Record that "4,364 in-region triples"
must not travel.

**R3 — new registration candidates, each named and none asserted as registered** (the
controller assigns final keys; grade and attribution on every face):
`E993-R25-RANK5-CEILING-SHARPENED-TO-25` — **FIXED-RANK `k = 5`, `proved_informal`,
seat T3, reproduced by both T3 critics and by the isolated second reader
(`q2_verdict: confirmed_with_repairs`)**; register with the second read's exact
statement, its named dependencies (the classical second and third Bonferroni
inequalities; `E993-R25-HUNTER-SPANNING-TREE-INEQUALITY`, `proved_informal`, **Cycle 5
seat T3**; the AM-GM substitution; `κ(n,k) ≥ 0`), the composition on its face (orders
26–29 in-run over a proved-complete superset including disconnected forests and `e = 0`;
`n ≥ 30` composed with the registered ceiling), and the **structural repair: the chain
`36 → 33 → 29 → 25` is a numerically decreasing sequence, not a derivation chain, and
`33` is NOT on the derivation path of `25`**. Also: `E993-R25-FOREST-THIRD-ORDER-BONFERRONI-BOUND`
(Theorem D, with `κ(n,k) ≥ 0` on its face and the triangle-free scope
**critic-attributed to C-T3-U**); the `≤ 2`-branch-vertex exactness at orders 22–29
(20,108,361 classes, **critic-attributed to C-T3-U, corroborated by C-T3-F**), which
**supersedes** any spider candidate (if the spider result is registered at all it is
scoped to **connected spanning trees at 15,650 distinct classes**); the scope widening
of `E993-R25-PENDANT-CAP-TAU-7` at the constant 40; C-T4-F's `(7,7,r)` finite cell
facts; **`…-THIN-TREE-LOGCONCAVE-TAU-LE-11` and `…-THIN-FOREST-NO-RECOVERY-TAU-LE-11`**
(successors to two VERIFIED claims; **I confirm directly that neither key exists among
the 345**; the tree key inherits the order-`≤ 25` conditionality and depends
additionally on Cycle 5 critic C-F4-T's unreplicated orders 27–32; the forest key must
carry the **positive-interval-support hypothesis** and `E993-TRANSFER-TO-FOREST`'s
per-component discipline; **not** a scope note on
`E993-R25-RECOVERY-LOGCONCAVITY-NECESSARY`, whose registered scope contains no `τ ≤ 10`
band); **Lemma H's tightness half narrowed to the UNIQUENESS of the attaining set
`{2j−1, 2j}`** (the equality value at `b = 2j` being already inside
`E993-PAIR-STAR-CLOSURE`); the **`τ ≤ 5` `Γ`-residue count by excess** (five cells at
`d = 5`, two at `d = 6`, empty at every `d ≥ 7`) together with
`s*(1..7) = 0,1,1,1,2,2,3` and the five complete-census cell minima
(**critic-attributed to C-F4-T and C-F4-U**); the general **Hall equivalence**
(critic-attributed C-F2-T, re-derived C-F2-U), the **joint `σ + e_C ≤ τ−1` budget**
(jointly critic-attributed) and the **exact sign decomposition with `D ≤ 3 ⟹
Δ_{r−2} > 0`** (critic-attributed C-F2-U); the `(τ,D)`-indexed band facts as **bounded
computation at named horizons**, with `G(τ,D)` recorded as a **derivation, not a
theorem**; the five diagonal cells at complete-census grade and the completed `(6,6)`
diagonal residue (8 / 2 / 0); the T1 matching-branch theorems (Region I strictness, the
boundary and region identities, H3) as **critic-attributed theorems**, and the
absorbing state with the 1,146,505-step live residue as **bounded computation**; and
`interior_peak_le_cat` as **new content with no registered predecessor**, to be
registered only with the Stage 7 outcome. **DO NOT REGISTER:** the rank-isolation
reduction as drafted (a scope note on `E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`
recording `(τ,d)`-uniformity at `τ ≤ d+3`, **at most**); `catalan_gap5_pos` as new
(an instance of the third award); `E993-R25-D3-LOW-COVER-WEAK-NONDECREASE` (never);
any new key for N8 (it is a sub-obligation inside an already-registered claim).
**Three of these need gate ruling 8's isolated second read before registration** — Lemma
H's uniqueness half, the `τ ≤ 5` residue count with `s*(τ)`, and the `k = 5` chain
(**already performed: `q2_verdict: confirmed_with_repairs`, so the chain is registrable
now and the other two are not**).

**R4 — compositions FIRST STATED BY ME. I state them for the record and register
nothing; each needs an isolated second read before registration, and the terminal cycle
affords none.** I say so here because the rule applies to me exactly as it applies to an
adjudicator.

> **Composition S1 — the `τ ≤ 5` cover branch at every excess.** For every `d ≥ 5` and
> every finite forest `F` of order `2r+d` with `τ(F) ≤ 5`: `Δ_k(F) > 0` for every
> `k < r`, hence `x(F) ≥ r` — with the `Γ`-route residue **empty at every `d ≥ 7`** (by
> arithmetic alone), **exactly two cells at `d = 6`** (orders 10, 12; closed by complete
> census and by two elementary counts), and **exactly five cells at `d = 5`** (orders 9,
> 11, 13, 15, 17; kernel-checked in Lean at `k = r−1`, the order-9 cell already frozen
> ENTRY 175). **What it is NOT, and this is the point of stating it:** it is **not a new
> theorem** — at `d ≥ 5` the hypothesis `τ ≤ min(d,5)` **is** `τ ≤ 5`, so the statement
> is the `d ≥ 5` instance of the already-VERIFIED
> `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST` and **raises no status**. The new content is
> the **proof route and the exact residue structure, uniform in `d`**. It is a fixed-`τ`
> statement, **never `c(d) = min(d,5)` in Lean, never a tier statement**. And it carries
> a caveat neither adjudicator states: **the Lean side discharges only the top rank
> `k = r−1` at each cell**, while the claim asks for every `k < r`, so the lower ranks
> remain informal. *(Residue table re-derived here.)*
>
> **Composition S2 — the band's input ledger at this close.**
> `E993-R25-FOURTH-BAND-CLOSE-ALL-R` composes eight inputs and is graded at its weakest
> link. Entering Cycle 6, **exactly one** input (the matching half) is formally
> verified. At this close the **carry step** and the **five-cell finite part** are
> contract-ready. If both land, the band has **three** formally verified inputs **and
> its grade is still `proved_informal`**, because the arithmetic tail, the general half
> of `c(5) = 5` and Corollary F at `d = 5` remain informal. **A count of formal inputs
> is not a grade, and the publication packet must not present it as one.**

**R5 — what must appear in the publication packet's own words.** The six formally
verified awards, named as such, with their exact scopes (two fixed-band `d = 5`
matching results; one theorem about Catalan integers; one uniform-in-`d` bottom-rank
matching theorem at rank `r = d` only; one sharp forest order bound uniform in `k`; one
scalar core with its critic-attributed induction step). Every informal result with its
grade and attribution on its face, **critic-derived results named as
critic-attributed** — for the seventh cycle running the advances that moved a grade were
critic- or adjudicator-derived, and a packet that silently attributes them to seats
would be false. **Every headline still open.** The vendored Galvin paper excluded. **No
claim that closing G1 alone solves Erdős #993.**

---

## Continuation ruling

The stop gate found **no decisive event** — no verified Tier 1 or Tier 2 theorem, no
verified reduction strictly shrinking the remaining class, no exact counterexample — and
**no plateau**, since Cycle 6 itself made material progress on all three orientations'
independent assessments and on mine, and a plateau needs two consecutive cycles showing
none.

**Had the charter allowed a Cycle 7, the portfolio would have warranted one**, and I
would name S-U-1 (the `Bd` tail's residue), S-T-1 (the Region II pre-absorption strip)
and S-F-1 (the `τ ≤ 12` in-window decision) as its three highest-value seats — one
formal, one structural, one falsifying, each with its target named exactly and its cost
measured. **The charter's ceiling is six. The run ends at this close either way**, and
what follows is the chartered controller review and the pre-authorized scoped
publication, neither of which is a route.

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: yes
```

Model disclosure (restated per protocol, on one line):

chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

---

## Artifact inventory

**Read.** The 24 members of `control/C6-STAGE6-DISPATCH-MANIFEST.json` — the synthesis
protocol (read first, binding in full), the three adjudications, the second-read
protocol and report, the sealed Stage 6 controller facts, the three Stage 5
controller-facts records, the Stage 5 packet manifest, the second-read capsule
manifest, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C6-STAGE1-GATE.md`,
`control/C6-ALLOCATION.md`, `control/C2-REFUTATION-WITNESSES.json`,
`control/C3-CENSUS-CONVENTION-RECONCILIATION.json`, `control/C3-CENSUS-ERRATA.json`,
`control/C4-CONTROLLER-ERRATA.json`, `control/C5-CONTROLLER-ERRATA.json`,
`control/C6-STAGE3-READ-BOUNDARY-DISCLOSURES.json`,
`control/C6-STAGE5-PATH-LITERAL-QUOTATION-RECORD.json`,
`control/PATH-CHECK-c6-stage6-dispatch.json` — plus run-root authority
`control/CLAIM-IDENTITY.run-local.json` (345 claims, queried by key **and by
statement**). **Three disclosures, as in `## Identity and seal audit`:** the Stage 2 /
Stage 3 / Stage 4 packet manifests (non-members, opened only to recompute the three
seals my dispatch names); one non-recursive `ls -1` of `control/`; one `ps` sweep. **No
raw return, no critique, no seat's or critic's scratch, no `runs/` directory, no
prior-cycle artifact, no other orientation's capsule, no other experiment root, no
manuscript, no repository state, no external source, no network, no package install.**
I ran no Lean build and no `lake`/`elan` command of any kind, so the shared, write-
protected Mathlib tree was never approached. **I ran no `Agent` call: child delegation
forbidden, and none was used.**

**Written.** This file, and scratch under the absolute path
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20/scratchpad/S-C6/`.
**Never `/tmp`, `mktemp` or `TMPDIR`; no session scratchpad.** No file outside my
scratch directory and this `SYNTHESIS.md` was created or modified; no return, no
critique, no adjudication, no sealed control record, no registry and nothing under
`runs/` was touched. **Every job ran in the foreground to completion. No background job
was ever launched by this seat, and a `ps -eo pid=,args=` sweep immediately before this
write shows no `python3`, `lake` or `lean` process of mine alive** — the only match is
the unrelated macOS `com.apple.MobileSoftwareUpdate.CleanupPreparePathService`, whose
name merely contains the substring "lean", observed and left untouched, exactly as both
the F and U adjudicators record. No `pgrep -f` pattern matching my own command line was
used and nothing was detached-and-awaited.

| file | SHA-256 | role |
|---|---|---|
| `scratchpad/S-C6/verify_seal.py` | `48a52380d5dfa5129e84ebd2f55b19c74248f70fff34e508ff06c9c12f32eb89` | canonical seal recomputation of the dispatch and Stage 5 manifests; per-member digest and byte-length verification of all 24 capsule members |
| `scratchpad/S-C6/verify_stage_seals.py` | `94f41591c251f283ae92ebd4a4f1d19b1994e8c1980b5dfae2f614ff6efff421` | canonical seal recomputation of the Cycle 6 Stage 2 / 3 / 4 packet manifests and the second-read T-bundle capsule |
| `scratchpad/S-C6/syn_checks.py` | `cd3b322f9b94dd2cfccc7501aed4711881da9029281034d768e61436c5a50614` | independent instrument: band conventions and `K(d)` parity; `Γ(τ,k)`, `K(1..7)`, `Γ(5,·)`, `Γ(6,·)`; ranged integer-rank `Bd(r,r)` and the `[6,14]` layer; the pendant Cap criterion and both constants; `H`/`W`, the argmin closed form, the order threshold and the inverted §5 test; the `Γ_n` residue by excess and `s*(τ)`; exact independence polynomials for `P₈`/`P₁₁`/`P₁₂`, the fenced comparator at `r = 21`, and all nine registered refutation witnesses; the edgeless `Δ₅` row; the forest `Δ₂` cubic |
| `scratchpad/S-C6/syn_checks.json` | `1cfec46721e275037e54a474a1c60d2aac81dbf7ffffd994491ed9bcae33639e` | its output (no wall-clock, PID or host field) |

Imports, standard library only: `hashlib`, `json`, `os`, `sys` (seal instruments);
`json`, `math`, `itertools`, `fractions`, `sys` (`syn_checks.py`). Exact integers and
`Fraction`s throughout; **no float in any judgement or any reported number.** Replay
(foreground, in-root):

```sh
RR=/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-dre-2026-09-20
cd "$RR/scratchpad/S-C6" && python3 verify_seal.py
cd "$RR/scratchpad/S-C6" && python3 verify_stage_seals.py
cd "$RR/scratchpad/S-C6" && python3 syn_checks.py > syn_checks.json
```

**Counts and their populations, for the record.** 24 capsule members verified (24 / 24,
zero mismatches); 6 seals recomputed canonically (6 / 6 match declared and dispatched);
345 run-local claims searched by key and by statement; 73,920 `(n,k,e)` instances of the
argmin closed form, 0 mismatches; 0 argmin violations over `n = 4..140` and 44 values of
`k`; 118 boundary-order sign tests at `k = 2..60` (the return's pair holds 0 of 59, the
true pair 59 of 59); 3,321 `(n,j)` cells for the Cap criterion (0 counterexamples to
`n ≤ 2j−1`, 40 to `n ≤ 2j−2`, every one at `n = 2j−1`); `Bd(r,r)` at every `r = 2..200`
under the ranged integer-rank definition; `Γ(τ,k)` over `τ = 1..15` to the sufficiency
thresholds; the `Γ_n` residue over `d = 5..12` at `τ = 5` and over slack `0..12` at
`τ = 1..7`; 9 registered refutation witnesses rebuilt from their edge lists with my own
forest DP (full `i_k` vectors, `Δ_{r−1}`, `Δ_r`, `x`, 9 / 9 exact); 1 fenced comparator
instantiated at `r = 21`; 3 path fixed points; 399 band values of `K(d)` at both
parities. **Every count names its population; none is an isomorphism-class count unless
it says so.**

**Reread before close.**
