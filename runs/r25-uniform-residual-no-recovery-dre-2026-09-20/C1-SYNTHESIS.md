# Cycle 1 Neutral Synthesis

Cycle 1, Stage 6, neutral synthesis seat. Run
`erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted before any
substantive work by reading `verity.md` (root constitution) and
`identity/startup-protocol.md` (startup sequence), per the mandatory-boot rule
in the repository's `CLAUDE.md`. Per the startup protocol's task-type map this
is bounded work inside an already-chartered `experiments/` run, so the only
subsystem loaded beyond the two boot files is `experiments/` — this run root's
`control/`, `sources/`, `cycles/` and `scratchpad/`. No durable VerityOS
memory, decision, knowledge, skill, module, project, identity or writing change
is proposed, so no `inbox/` routing applies.

**Model disclosure.**
chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

**Child delegation:** none (forbidden and not used). **Background jobs:** none
started at any point; there was nothing to kill before this write. All
computation was foreground and had exited before this file was written.

---

## Identity and seal audit

**Stage 6 dispatch capsule seal (reported as required):**
`eb7a6b04251b409bf6279e271bfc61dd2174c9e6c09040048fe05cf4f8609708`.

Recomputed canonically — SHA-256 of the compact key-sorted JSON of
`control/C1-STAGE6-DISPATCH-MANIFEST.json` minus `seal_sha256`,
`sort_keys=True`, `separators=(",",":")`, no trailing newline — and it equals
both the value stored in the manifest and the value given on dispatch.

| object | recomputed | dispatch value | result |
|---|---|---|---|
| Stage 6 dispatch `control/C1-STAGE6-DISPATCH-MANIFEST.json` | `eb7a6b04251b409bf6279e271bfc61dd2174c9e6c09040048fe05cf4f8609708` | same | **match** |
| Stage 5 packet `control/C1-STAGE5-PACKET-MANIFEST.json` | `555872339d4c7ac638e99dd232ae3d1e9e2deab0125e9c45ab44dfca369f0cbe` | same | **match** |
| Stage 4 packet `control/C1-STAGE4-PACKET-MANIFEST.json` | `f17925af87f586332059c1fd8f0fcb4105e9b065a18257a45bd5efff4acf1a83` | same | **match** |
| Stage 3 packet `control/C1-STAGE3-PACKET-MANIFEST.json` | `43325fa61f84903894cbef2f11e902c537ce9c7bb02a88eac965fa8de2e9ff11` | same | **match** |
| Stage 2 packet `control/C1-STAGE2-PACKET-MANIFEST.json` | `e4fb88edc91ffde1e02347c6a2ef30536d5908be38e07656b042ad6431da2215` | same | **match** |

**Member digests: 9 of 9 verify** on both SHA-256 and byte count against disk;
0 missing, 0 mismatched; `file_count: 9` equals the `files` array length.

| member | bytes | sha256 |
|---|---|---|
| `SEMANTIC-CONTRACT.md` | 4261 | `3bbeae0777006c9a4479f9976881f597373867782fe71157166dc75cb306aab3` |
| `SOLUTION-CONTRACT.md` | 8321 | `129225220caacf942bea2ad4d8e56548924897f3ab7a910b55e715c2e8c4c00f` |
| `control/C1-STAGE1-GATE.md` | 8270 | `84321eb5381fd599f08a4aadd424a03417fc9355ae9f35480946f8720eb73435` |
| `control/C1-STAGE5-PACKET-MANIFEST.json` | 2741 | `0a7cc1c62fa4bed1ab304bbc16f14987acf8296ae54fcce4be40d41954326db6` |
| `control/C1-SYNTHESIS-PROTOCOL.md` | 3282 | `39897326132892d3707fad42e62643a82957cafa0a0e856abddd3e12a5af20d5` |
| `control/PATH-CHECK-c1-stage6-dispatch.json` | 537 | `5174f2648d6e2268add5e6a2b3c9c8081fb5db34b6413db3047086734e510f20` |
| `cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md` | 84092 | `8faad3e2125d236339c420b575ea336bcefe1a8116da618489d875b111b6bec8` |
| `cycles/cycle-1/stage5/adjudicators/T/ADJUDICATION.md` | 101608 | `4e0ffe24ca874a8ef458f25f2164a430e34c0a9c39d42998087c423e3e5c1afa` |
| `cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md` | 88254 | `d3af3fc308c1c038aff54c877b93553bc2743b7b344637f1026e9ffbe2ef9bd0` |

The three adjudication digests are identical to the values the Stage 5 packet
manifest independently carries, so the chain Stage 2 → Stage 3 → Stage 4 →
Stage 5 → Stage 6 is unbroken at every link this seat can see.

**Path evidence.** `control/PATH-CHECK-c1-stage6-dispatch.json`: 8 files
scanned, `files_with_findings: 0`, `finding_count: 0`, `findings: []`,
`pruned_roots: []`. Clean.

**Read boundary honoured.** Read: the nine capsule members; run-root authority
under `sources/` (the frozen C3 Lean source `sources/g1/lean/g1-c3-third-wide/`
for the binder forms of entries 108, 112, 120, 154–164;
`sources/fixtures/KL-FIXTURES.md`; `sources/authority/CLAIM-IDENTITY.json` and
`sources/authority/LEDGER.md` as the authority registry and ledger); and
`control/CLAIM-IDENTITY.run-local.json` (293 claims) for statuses and scopes.
**No raw return, no critique, no seat scratch, no failed lineage, no other
experiment root, no manuscript, no repository state beyond the two boot files,
and no external source was opened.** No network. All of this seat's scratch is
under the absolute in-root path `<run root>/scratchpad/S-C1/`; no system
temporary directory, no temporary-directory environment variable and no
temporary-directory command was used anywhere. No literal filesystem path
outside the run root appears in this file.

**Adjudicator statuses accepted as given.** All three adjudications carry the
required model disclosure, report their own capsule seals
(T `2c4c680c30b4f75b10ec6ea565e8c1f2ffa622ddf8de1bd06bd6b54ccd46f7b3`,
F `5a7687974ce8a25b4372bc9c58b965aaef03fd26c6a56a0f7fab68747592c8d7`,
U `f53111ef7d20f56c55733daa2c3aae8ec2e8158b25179ee7d262b17c1ea3d99a`), record
18/18 member verification, and declare no child delegation and no background
job. Those capsule manifests are not members of this seat's capsule, so their
seals are recorded on adjudicator authority and are not re-verified here.

**This seat's own instrument.** `<run root>/scratchpad/S-C1/synth_checks.py`,
exact integer and `fractions.Fraction` arithmetic only, no floating point in
any decision, no sampling in any exhaustive claim, no wall-clock field in any
output. It re-derives independently every decisive number this synthesis
carries; results are cited inline and inventoried at the end.

---

## Reconciliation

Resolved claim by claim, never by majority vote and never by consulting lower
tiers. Where the three adjudications disagree I say so and rule; where I
re-derived the disputed quantity myself I say that too. Controller rulings
(1)–(7) are applied throughout as dispatch-record authority.

### R1. What all three agree on

`headline_resolved: no`, `status: still_open`, `material_progress: yes`,
`orientation_plateau: no` in every orientation. No route in any orientation
claims Tier 1 or Tier 2. No fence was breached anywhere: no log-concavity, no
TRS2, no real-rootedness, no convolution closure of unimodal sequences, no
imported forest unimodality, no pointwise addability, no every-vertex SR2, no
all-vertex align, no diameter-only selector, no raw edge-addition monotonicity,
no factor-two margin, and no assumption of `|B| ≥ 2r` for `τ > d` appears as a
premise in any surviving result. Every comparator row in every orientation
reports `x` exactly and has `x = r+1`, so each is a **bare sign failure, never
a recovery**; the hard fence that a comparator failure is not a counterexample
to a crossing theorem is honoured throughout. Tier separation is clean: no
status transfers between tiers, between forests and G1 tuples, or to FOREST,
TREE, TRANSFER, `OB-G1` or Erdős #993.

Fixed points are reproduced and violated nowhere. I reproduced them myself:
`P_8` has `i = (1,8,21,20,5)`, `x = 2`, `Δ_3 = −15`; `4K₂` has
`i = (1,8,24,32,16)`, `Δ_2 = +8`, `x = 3 = r+1`; the registered `d = 5` fence
family `6K₂ ∪ (2r−7)K₁` has `Δ_r = 32, 68, 164, 431, 1204, 3520` at `r = 4…9`
with `x = r+1` on every row.

### R2. The `d = 5` window — agreement, and the controller ruling applied

U proves both endpoints at the diagnostic band and reduces the `d = 5`
counterexample class unconditionally to `ν = τ = 6` (its E1+E2+E3). T reaches
the same window arithmetically from the two branch thresholds
(`c(d) = min(d,7)`, `m(d) = ⌈3d/2⌉−1`). F's adjudication records a live
paired-critic split at the route level (C-F2-T: the honestly uncovered region
at `d = 5` is `τ = ν ≥ 6` because `m(5) = 7` is only a registered *lower*
bound; C-F2-U: the window narrows to `{6}` once `m(5) = 7` is credited) and
ruled for C-F2-T, referring the `{5,6}` versus `{6,7}` discrepancy to the
controller.

**Ruling.** Controller ruling (1) settles it: the `d = 5` residual window is
exactly `{6}`, with `c(5) = 5` and `m(5) = 7`; the charter's `{5,6}` was a
pre-run heuristic and any `{6,7}` reading used the loose `(d, 3d/2)` interval.
F's caution was correct **on F's own read scope** — F could not see U's proof
of `m(5) = 7` — and is now superseded, not overturned: `m(5) = 7` is no longer
a necessary-only comparator fact but a theorem (R3 below), which is exactly the
condition C-F2-T named for crediting it. I recompute the window table from the
two threshold functions: widths `0, 0, 0, 1, 1, 2, 3, 5, 6, 8, 9` for
`d = 2…12`, with `d = 5 → {6}` and `d = 6 → {7}`.

### R3. `m(5) = 7` — proved; and the T/U divergence on the `d ≤ 6` family

U regrades `m(5) = 7` from bounded computation to `proved_informal` on two
independently constructed `r`-uniform rational duals (C-U4-T by symbolic chain
elimination with a shifted-basis positivity certificate for `r ≥ 16` plus exact
substitution at `r = 4…15`; C-U4-F by an explicit closed form in `r`, valid for
`r ≥ 8`, plus seven exact small-`r` duals), verified a third time by the U
adjudicator. T reaches the same threshold from the other side and accepts
C-T1-F's symbolic `Q(r)` method as proof for **each** `d ∈ {1,…,6}`, while
grading `7 ≤ d ≤ 12` bounded evidence; but T then **blocks** the `d ≤ 6` family
from award on three grounds: it is critic-attributed with no generator, digests
or replay in any T seat's envelope; the `r < m` vanishing argument is unshipped;
and it must be scoped and named as a band family.

**Ruling, and the divergence surfaced.** T and U do not disagree about the
mathematics — `m(d) = ⌈3d/2⌉−1` is one object and `d = 5` is one of its
instances. They disagree about *awardability*, and the disagreement is entirely
about evidence custody, not validity. I rule: **the `d = 5` instance is proved**
(three independent `r`-uniform certificates, plus my own fourth replication);
**the `d ≤ 6` family is `proved_informal` but not awardable this cycle**, for
exactly T's first two reasons, which apply to the family and not to the single
band; **`7 ≤ d ≤ 16` is bounded evidence at a stated `r` horizon and no more**.

My own exact-rational Farkas greedy over the dual conditions
`λ_j(r+1−j) + j·μ_{j−1} ≥ 1` and `λ_j(t+j) + 2(m−j)μ_j ≤ 1`
(`t = r − (2m−d) ≥ 0`, `λ, μ ≥ 0`, `μ_{−1} = μ_m = 0`) gives the least feasible
`m` for every `r` in a 41-wide consecutive band as
`2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23` at `d = 2…16` —
**exactly `⌈3d/2⌉−1` at all fifteen values**, with `(3,3)` and `(6,5)`
infeasible (the two registered refuted pairs sitting precisely on the
infeasible side), and `(7,5)` feasible at `r = 20` and again at `r = 10⁶`. The
threshold is therefore a property of the certificate system, not a comparator
heuristic. Two independent accounts of the closing step agree and I record the
common form: feasibility at `j = m` is exactly
`μ_{m−1} ≥ (d−1)/(m(t+m))`.

### R4. The Catalan-dominance ceiling — controller ruling (5) applied and verified

T (via C-T2-U) upgrades the ceiling from a `k = 400` witness to a theorem; U
(via C-U4-T) proves the monotonicity that makes "first positive ⟹ positive
forever" a theorem; F (via C-F2-T) supplies the same monotone-ratio lemma and
reverses F2's own index error. The Stage 1 gate wrote the criterion
`Σ_j C(τ,j)4^{−j} < 4` without its index range, and one Stage 3 route summed
from `j = 0` and concluded `τ ≤ 6`; F's adjudication additionally **strikes an
active downstream instruction** that would have told a named route to discard
the entire `τ = 7` stratum.

**Ruling.** Controller ruling (5) governs and the mathematics agrees: `j ≥ 1` is
the correct reading, the ceiling is `τ ≤ 7`, and the criterion fails for every
`τ ≥ 8`. The controller has retracted its Stage 3 acceptance of the opposite
boundary. I verified both readings in exact rationals:
`Σ_{j≥1} C(τ,j)4^{−j} = (5/4)^τ − 1` is `11529/4096` at `τ = 6`,
`61741/16384 < 4` at `τ = 7`, `325089/65536 > 4` at `τ = 8`; the
`j = 0`-inclusive sum `(5/4)^τ` already exceeds 4 at `τ = 7`, which is the error
mode. I reproduce the thresholds
**`K(τ) = 0, 2, 3, 4, 6, 12, 70` for `τ = 1…7`** and `Γ(8,k) < 0` for every
`k ∈ [8, 600]`, and the three negative values `Γ(5,5) = −14`, `Γ(6,6) = −170`,
`Γ(7,7) = −1091` that refute the "positive for `k ≥ τ`" reading. The decisive
internal argument is that `j = 0` is the `S = ∅` fiber supplying the *positive*
`Cat_{k+1}` term, and the kernel-verified `catalan_gap_identity` subtracts
`C(4, 1..4)` with no `Cat_k` term. Any check with a horizon below `k = 70` sees
`Γ(7,k) < 0` throughout and wrongly concludes failure.

### R5. The 73-point cover residual — T and U reconciled by an independent derivation

T canonicalizes the cover branch's open set at **73 finite points** (both T2
critics reaching it from different enumerations and different censuses), all at
`τ ∈ {6,7}`, all at the top rank `k = r−1`, all at `d ∈ {6,7,8}`, orders
`18 ≤ 2r+d ≤ 147`; T declines to canonicalize the *pre-reduction* enumerations
(102 quadruples versus 93 cells) and refers the discrepancy to Cycle 2. U
computes exceptional-cell tables instead — `(4,4) → 3`, `(4,5) → none`,
`(5,5) → 5`, `(6,5) → every r`, `(6,6) → 11`, `(7,7) → 70` — and does not
produce a residual count.

**Ruling: the two are the same object and I reconcile them by a third,
independent derivation.** Enumerating the generic cover bound
`Δ_k ≥ [C(|B|,k+1) − C(|B|,k)] − Σ_{j=1}^{τ} C(τ,j)Cat_{k−j}` with
`|B| = 2r+d−τ` over every `(k, r)` with `k < r` and `r ≤ 90`, I reproduce U's
table exactly and extend it: `(5,6) → 2`, `(6,7) → 3`, `(7,8) → 4`,
`(7,9) → 1`, and **zero** cells at every other `(τ, d)` with `τ ≤ 7`, `τ ≤ d`.
Then removing (a) cells vacuous for forests by König (`ν = τ` needs
`|X| ≥ 2τ`) and (b) cells at order ≤ 17, which the two order-17 isomorph-free
forest censuses close exhaustively, leaves

| `(τ,d)` | cells | vacuous | closed by the order-17 census | **residual** | residual orders |
|---|---|---|---|---|---|
| `(6,6)` | 11 | 1 | 3 | **7** | 18–30 |
| `(7,7)` | 70 | 2 | 3 | **65** | 19–147 |
| `(7,8)` | 4 | 1 | 2 | **1** | 18 |
| all other `τ ≤ 7` | — | — | — | **0** | — |

**73 exactly**, every one at `k = r−1`, matching T's canonical figure and its
per-cell shape row by row. The `102`-versus-`93` pre-reduction discrepancy is
therefore a bookkeeping artefact of two different enumeration conventions and
not a mathematical disagreement; I canonicalize the residual at **73** and
record the pre-reduction reconciliation as discharged by this derivation, which
supersedes the Cycle 2 debt T recorded. The `τ ≤ 5` cells are all closed: the
five `(5,5)` cells sit at orders 9, 11, 13, 15, 17 (order 9 vacuous, the rest
inside the census) and the two `(5,6)` cells likewise.

### R6. The window widens for `d ≥ 8` — three-way agreement, and its consequence

T (E10), U (E4′) and both adjudications' cross-route sections independently
reach the same negative structural fact: with `c(d) = min(d,7)` capped by the
Catalan ceiling and `m(d) = ⌈3d/2⌉−1` growing linearly, the Tier-3c window
`ν ∈ [c(d)+1, m(d)−1]` has width `≈ d/2 − 2` for `d ≤ 7` and `≈ 3d/2 − 9` for
`d ≥ 8`. **The window widens with slope `3/2`, not `1/2`.** I recompute the
table and confirm it. The Stage 1 gate's structural reading
(`τ = ν ∈ (d, 3d/2)`, widening like `d/2`) is **confirmed for `d ≤ 7` and
refuted as an account of `d ≥ 8`**. This is negative for
`E993-R25-WINDOW-REDUCTION` and materially raises the bar on
`SOLUTION-CONTRACT.md` §1 Tier 3's "strictly smaller class" criterion. Per
controller ruling (3), `E993-R25-WINDOW-REDUCTION` is stated over the **bare**
matching branch; under the crossing-conditioned branch the threshold `m_x(d)`
has no established lower bound at any `d`, because producing one would require
a graph with `x < r`, `ν ≥ m` and `Δ_r > 0` — by definition a recovery, i.e.
a refutation of Tier 1.

### R7. The crossing hypothesis does no work anywhere in Cycle 1

T states this as its central structural gap and I extend it across all three
orientations. T1, T2 and every established T result are unconditional in `x`;
T3, the one route whose fingerprint is the crossing hypothesis, ships no step in
which it does work; T4 uses `x(T)` only through `p = x(T)+1` and guard 10. U's
E1, E4, E5, E11 are bare; E2 and E8 have `x ≥ r` as a conclusion, not a
hypothesis; only E3 and E10 consume `x < r`, and they consume it by
*dispatching* the two branches rather than by any positive use. F's entire
falsification perimeter is a null over the crossing class. **No result in Cycle
1 makes `x(F) < r` do positive mathematical work.** Since Tier 1 and Tier 2 are
crossing-conditioned, this is the exact reason nothing in Cycle 1 reaches
either, and it is the single most important allocation constraint for Cycle 2.

### R8. Claim-identity separations required before registration

- Per controller ruling (2), **any registration derived from U4's
  `E993-C3-FIFTH-BAND-*` candidate names uses FOURTH-BAND**. The band this
  program calls the fourth is `d = 5` (C2 = first wide at `d = 2`, C3 = third
  wide at `d = 4`), and the registry's own keys are
  `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` and
  `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`. The sealed U4 return is not
  edited; the rename binds registration only.
- Per controller ruling (4), **`E993-G1-MATCHING-COMPARATOR-SUFFICIENT` is
  CONDITIONAL in the registry, not refuted** (I confirmed the status field
  directly), and U2's matching-branch contract is a **strengthening** of it —
  it discharges that conditional's comparator premise by an arithmetic
  threshold. The claim-identity separation must be recorded at registration:
  the refuted comparator keys are
  `E993-G1-MAXMATCHING-COMPARATOR-NONPOSITIVE` and
  `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`, and neither is the
  conditional. The word "refuted" as applied to the conditional is struck.
- Per controller ruling (6), **the canonical census figures are those the F
  adjudication establishes**, superseding the returns' literals: 515,780
  distinct forests of order 4–18; 1,179,516 forest-rank pairs at `d = 3…7`;
  4,950,598 distinct `(F,r)` pairs across F3's two streams after removing the
  551,916-pair overlap; 522,956 and 208,581 as **tested-object** counts at
  `n ≥ 4` against true horizon sums 522,959 and 208,587; 148,035 rows at
  `d = 5`, `r ≤ 6` and 60,530 at `d = 4`, `r ≤ 6`; 367,735 and 367,729 retained
  only as the `d = 2` and `d = 4` even-order control denominators. U's
  isomorphism-class counts `37, 153, 710, 3658, 20514, 122963, 775529,
  5086638` for orders `7, 9, …, 21` are consistent with these and are retained
  for the odd orders F does not tabulate; `122963` at `n = 17` is canonical.
- T's `E993-R25-T3-*` candidates are refused as aliases of registered VERIFIED
  master claims (`E993-L0-CONV-DELTA`, `E993-PAIR-STAR-CLOSURE`, and a
  restatement of `Δ_0(F) = |V(F)| − 1`); I sustain the refusal.
- The `n = 9` cover-3 witness must be alias-checked against the registered
  VERIFIED `E993-C2-COVER3-NINE-VERTEX-PLATEAU-WITNESS`, and the `n = 7`
  witness against `E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE` (scope `r ≥ 3`;
  the witness is at `r = 2`, genuinely outside) before any registration.

### R9. A cross-orientation identification the adjudicators could not make

U's unique `d = 5` crossing window witness at `r = 5` and F's corrected
`forest_index = 12850` exhibit are **the same order-15 tree**. Each
adjudication saw only its own orientation. I rebuilt both of F's corrected edge
lists and U's reported invariants from scratch: both lists give the identical
polynomial `i = (1,15,91,288,511,509,274,78,13,1)` with `x = 4 < r = 5`,
`Δ_5 = −235`, and brute-force `ν = τ = 6`. They are two labellings of one
isomorphism class, and it is the unique crossing window forest at `r = 5`. This
confirms that the F census and the U window analysis are describing one object
from two directions, and it gives Cycle 2 a single named positive test case.

### R10. Disagreements recorded but not resolvable at this seat

- The `τ ≤ 3` graph-scope violator population: 18 classes up to cover
  relabelling versus 62 configurations. Different units, neither derivable from
  the other. The qualitative content (plateaus only, `r = 3` only, **zero
  forests** through order 19) is established by two independent exhaustive
  scans and is retained; the counts must be recomputed in Cycle 2 under one
  explicit isomorphism convention.
- `control/C1-ALLOCATION.md` is outside every Stage 4, Stage 5 and Stage 6 read
  boundary, so the "verbatim allocation item" quotations in two U returns
  remain unaudited; the controller should either admit the file to the capsules
  or stop requiring verbatim quotation.
- `control/EXTERNAL-PATH-ALLOWLIST.txt` and the path checker's own
  `allowed_external_roots` disagree about the shared Mathlib root; the
  allowlist file is the stale artifact. Records question, not a contract
  breach.
- The illustrative index in `SOLUTION-CONTRACT.md` §1 Tier 3 reads
  `Δ_p(A) = Δ_p(H) + Δ_{p−2}(U)`; the correct specialisation is
  `Δ_p(A) = Δ_p(H) + Δ_{p−1}(U)`. Controller decision requested so that no
  later seat copies it.

---

## Exact established results

Grades follow `SOLUTION-CONTRACT.md` §4. **Nothing here is
`formally_verified`**; that grade is reachable only through the governed
`lean-proof-workflow`. Each result names where `d`, `ν`, `τ` and `x(F) < r`
enter. Attribution is carried: a large share of Cycle 1's material progress is
**critic-attributed**, and I grade it that way.

**S1 — The generalized strata/incidence machinery.** `proved_informal`,
**uniform in `m` and `d`**, bare, general graphs. Strata partition, the support
bound `|S ∩ M| ≤ m`, the forbidden-set construction, outside incidence
`(r+1−j)u_j ≤ e_j v_j` with `e_j = r+j+d−2m` (needing only `|M| = 2m`, not a
matching), and inside incidence `(j+1)u_{j+1} ≤ 2(m−j)v_j` (where the pairing
*is* load-bearing). `ν` enters as `m`, linearly, in `e_j` and `2(m−j)`; `d`
enters in exactly two places, the intercept `e_j` and the slack
`S_j = 2(m−j)−d+1`; `τ` does not enter; **`x` does not enter at all**. The
truncation case is vacuous, not conventional: if `e_j < 0` then `|M ∪ B| > N`
and both strata are empty. Route-attributed, adversarially retested by four
critics over tens of thousands of instances with zero violations.

**S2 — Low-window domination, restated.** `proved_informal`, unconditional,
uniform in `m` and `d`: for `j ≤ K := m − ⌈d/2⌉`,
`|stratum(r+1,j)| ≤ |stratum(r,j)|` individually, **with no side condition**,
and `K ≤ r` always. Critic-attributed.

**S3 — The window implication, with a mandatory rider.** `proved_informal` as
an implication only: `Σ_{j>K} u_j ≤ Σ_{j>K} v_j ⟹ Δ_r(G) ≤ 0`. **Rider,
mandatory at registration: the antecedent is known false at the C2 fixed point,
at the C3 fixed point and at both conjectured thresholds.** The negative slack
that closes every known case lives entirely in the *low* window. This is **not**
the contract's Tier 3c window reduction, which is an interval for `ν`, not a
range of stratum indices.

**S4 — The bare `d = 5` seven-matching sign theorem (the award).**
`proved_informal`. **For every finite simple graph `G` of order `2r+5` carrying
seven pairwise disjoint edges, `Δ_r(G) ≤ 0`, for every `r`.** Bare — no
crossing hypothesis, no acyclicity. Critic-derived (C-U4-T and C-U4-F,
independently and by different methods), U-adjudicator-verified, and replicated
here. *Parameters:* `d = 5` and `m = 7` enter **jointly and only** through
`2m − d = 9`, in the outside coefficient `r+j−9` and the stratum range
`j = 0…7`; `ν ≥ 7` is the hypothesis; `τ` does not enter; **`x(G) < r` does not
enter**. *Sharp:* `m = 6` fails by the registered REFUTED fence
`6K₂ ∪ (2r−7)K₁` (`Δ_r > 0`, `x = r+1`), and the certificate system at `(6,5)`
is infeasible at every `r` I tested. The companion positive family
`7K₂ ∪ (2r−9)K₁` has `Δ_r = −112, −376, −1252, −4214, −14381` at `r = 5…9`,
`x = r`, consistent with the theorem.

**S5 — The bare matching band family at `d ≤ 6`.** `proved_informal`,
**critic-attributed to C-T1-F**, corroborated by C-T1-U's Farkas scan, by the T
adjudicator's exact-rational replication and by mine. For each
`d ∈ {1,…,6}` and every admissible `r`: every finite simple graph of order
`2r+d` with a matching of size `m = ⌈3d/2⌉−1` has `Δ_r(G) ≤ 0`, bare. **Named
as a fixed-band family; a per-`d` family of certificates is not an argument
uniform in `d`.** Not awardable this cycle (see Lean awards). For
`7 ≤ d ≤ 16` this is bounded evidence at a stated `r` horizon and not proof.

**S6 — Bare sharpness of `m(d)`, uniform in `d`.** `proved_informal`,
critic-attributed (C-U2-F, corroborated C-U2-T, U-adjudicator-verified
algebraically). For every `d ≥ 2` the graph `(⌈3d/2⌉−2)K₂ ∪ εK₁` at the stated
rank has `Δ_r > 0`, so `m_bare(d) ≥ ⌈3d/2⌉−1` for every `d`. The registered
fences at `d = 3` and `d = 5` are two members of one family and `d = 4` is the
missing third. **Every known sharpness witness has `x = r+1`**, so this
constrains the bare threshold only; the crossing-conditioned threshold has no
established lower bound at any `d`.

**S7 — The feasibility boundary of the matching certificate system.** For the
`O_j / I_j` system at `(m,d)`, a non-negative rational certificate forcing
`Σb ≤ Σa` exists for every admissible `r` **iff** `3d ≤ 2m+2`, i.e.
`m ≥ ⌈3d/2⌉−1`. `proved_informal` per swept `(m,d)` and exact in `r` within
each; `bounded computation` as a statement over all `d` (swept to `d = 16` here,
`d ≤ 27` by a Stage 4 critic). The two registered refuted pairs `(3,3)` and
`(6,5)` sit exactly on the infeasible side. **LP infeasibility at `m*−1` is
evidence about the certificate, never a lower bound on `m(d)`** — the lower
bounds are the comparator graphs of S6 only.

**S8 — The general-`τ` cover-fiber floor and its exact thresholds.**
`proved_informal`, graph-general, **uniform in `d`**, parameterized by `τ ≤ d`.
`Δ_k(F) ≥ [C(n,k+1) − C(n,k)] − Σ_{j=1}^{τ} C(τ,j)Cat_{k−j}` with
`n = |X| − τ`, using no acyclicity; and `τ ≤ d` (equivalently `|B| ≥ 2r`) gives
`Δ_k(F) ≥ Γ(τ,k)` for every `k ≤ r−1` simultaneously. `τ` is the hypothesis;
**`d` enters in exactly one place**, the requirement `τ ≤ d`; `ν` enters only
via König; **`x` does not enter**. *Unformalised dependency:* the general-`τ`
power-set expansion (`powerset_four_sum` is `C.card = 4`-locked in the frozen
source).

**S9 — The `τ ≤ 7` ceiling, as a theorem.** `proved_informal`. The ratio
`Γ(τ,k)/Cat_{k+1}` is strictly increasing in `k` for `k ≥ τ`, so "first
positive ⟹ positive forever" is a theorem; `Γ(τ,·)` is eventually positive
**iff `τ ≤ 7`**, and `Γ(τ,k) < 0` for every `τ ≥ 8` and every `k ≥ τ`. Exact
thresholds `K(τ) = 0, 2, 3, 4, 6, 12, 70` for `τ = 1…7`. The ceiling is exact
and `d`-independent: this mechanism cannot yield `c(d) > 7` for any `d`,
however large. Critic-attributed (C-T2-U for the ceiling, C-U4-T and C-F2-T for
the monotonicity), verified by the controller, by all three adjudications and
here. Controller ruling (5) applied.

**S10 — `c(d) = min(d,5)` for forests.** `proved_informal`, uniform in `d`,
with two named unformalised nodes. *Statement of record:* **for every finite
forest `F` with `|V(F)| = 2r+d`, `r ≥ 2`, `d ≥ 2` and `τ(F) ≤ min(d,5)`:
`Δ_k(F) > 0` for every natural `k < r`, hence `x(F) ≥ r`.** The **`r ≥ 2`
guard is mandatory** — `P_4` at `r = 1`, `d = 2` has `τ = ν = 2` and
`Δ_1 = −1 < 0` — equivalently the bullets must be guarded by `k < r`, as the
kernel-verified `coverFour_prehistory` and the registered run-local claim both
are. `τ = 4` is closed for **every** `d ≥ 4` by the sharp anchors (`n ≥ 7`
gives `+4`, `n ≥ 9` gives `+24`); the packaged C3 constants `n ≥ 8`, `n ≥ 10`
were a `d = 4` artefact carried into `d = 5`. Route-attributed at `τ ≤ 2`,
critic-attributed at `τ = 3, 4, 5`. *Unformalised nodes:* the general-`τ`
power-set expansion, and the finite-cell exhaustive closures (complete case
analyses at fixed orders, **not** null censuses over open families).
**Binding caveat: acyclicity is load-bearing exactly at the exceptional
cells** — the `τ ≤ 5` statement is **false for general graphs**, by a
13-vertex witness with `τ = 5`, `r = 4`, `x = 3 < r`, which lands precisely on
the exceptional cell `(k,r) = (3,4)`.

**S11 — The finite-cell reduction of the cover branch's open set.**
`proved_informal` as a reduction. With `c(d) = min(d,7)` as the conjecture, the
residual is **73 named finite points**, all at `τ ∈ {6,7}`, all at the top rank
`k = r−1`, all at `d ∈ {6,7,8}`, orders `18 ≤ 2r+d ≤ 147`, distributed
`(6,6) → 7` at orders 18–30, `(7,7) → 65` at orders 19–147, `(7,8) → 1` at
order 18. Critic-attributed; **independently re-derived here** from the generic
bound plus König vacuity plus the order-17 censuses (R5). The obligation
collapses to a single structural statement: `Δ_{r−1}(F) > 0` for forests with
`τ = ν = d ∈ {6,7}` at those orders.

**S12 — The `d = 5` window reduction.** `proved_informal`, **unconditional**
(no longer conditional, since both branch endpoints are now theorems at this
band): **every forest `F` with `|V(F)| = 2r+5`, `x(F) < r` and `Δ_r(F) > 0` has
`ν(F) = τ(F) = 6`.** S4 dispatches `ν ≥ 7`; S10 dispatches `τ ≤ 5` against
`x(F) < r`; König makes the trichotomy exhaustive. **This does not prove
`E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`, which stays OPEN.** The window is
**generic, not thin**: crossing window forests number
`1, 4065, 43390, 192015, 588333, 1489237` at `r = 5…10`, a majority of all
window forests by `r = 10`, every one with `Δ_r < 0` (max `−235` at `r = 5`,
`−31482` at `r = 10`) — bounded evidence at that horizon, and the scale-free
margin `max Δ_r / i_r` is *decreasing*, so absolute-deficit reassurance is
misleading.

**S13 — The Tier-3c window table, and its widening.** `proved_informal` as
arithmetic, conditional on the two branch theorems at each `d`. With
`m_bare(d) = ⌈3d/2⌉−1` and `c(d) = min(d,7)`: widths
`0, 0, 0, 1, 1, 2, 3, 5, 6, 8, 9` for `d = 2…12`; `d = 5 → {6}`, `d = 6 → {7}`
are the two singleton bands where a targeted attack is tractable; **slope `3/2`
from `d = 8` on**. Negative for `E993-R25-WINDOW-REDUCTION`.

**S14 — The perfect-matching uniform lemma.** `proved_informal`,
critic-attributed (C-U2-F), U-adjudicator-verified, replicated here. **For
every finite simple graph `G` with a perfect matching on `2m = |V(G)| = 2r+d`
vertices and `3d ≤ 2m+2`: `Δ_r(G) ≤ 0`.** Every independent set is a
transversal of the `m` edges, so `i_k = A_k`, and counting containments gives
`(r+1)A_{r+1} ≤ 2(m−r)A_r = d·A_r`; the threshold gives `d ≤ r+1`. Equivalently
and more cleanly: **every finite simple graph with a perfect matching on `2m`
vertices has `Δ_r ≤ 0` for every `r` with `2m ≤ 3r+1`.** *Scope limit this
synthesis adds, which no adjudication states:* the perfect-matching hypothesis
forces `d = 2(m−r)`, so the lemma is uniform in `d` **over even `d` only**. Its
threshold is **exactly sharp on `mK₂`**, since `Δ_r(mK₂) = 2^r[2C(m,r+1) −
C(m,r)] > 0 ⟺ 2m > 3r+1` — strong independent evidence that `⌈3d/2⌉−1` is the
right constant and not a tuned one.

**S15 — The G1 ambient couplings.** `proved_informal`, elementary,
`novelty_claimed: false`. `I(A) = I(H) + z·I(U)`; `I(T) = (1+z)I(A) + z·I(H)`;
the composite `I(T) = (1+2z)I(H) + z(1+z)I(U)`; the Δ-coupling
`Δ_k(T) = Δ_k(H) + 2Δ_{k−1}(H) + Δ_{k−1}(U) + Δ_{k−2}(U)` **for every integer
`k`** including the `Δ_{−1} = 1` boundary; and three rank-specialised exact
equalities. Leaf-ness of `v` and `deg(s) = 2` are load-bearing and were tested
for necessity, not asserted. Standing warning adopted: the composite is the
algebraic seed of the refuted comparator, since iterating the second identity
down a chain of `m` leaf/support pairs manufactures a `(1+2z)^m` factor; any
such iteration in a later cycle must be re-checked against the fence.

**S16 — The Δ-level abstraction carries no information about
`sign(Δ_{p−2}(U))`.** `proved_informal`, critic-attributed, **free-integer
scope**. For every `p ≥ 3` and every prescribed integer sequence
`(Δ_k(U))_{k≥0}` — including ones with `Δ_{p−2}(U) > 0` — there exist integers
`(Δ_k(H))_{k≥0}` satisfying the **full** prehistory chain and `Γ < 0`, and this
survives imposing `i_k ≥ 0`, `i_0 = 1` and the nesting `i_k(H) ≥ i_k(U)`.
**Consequence: every constraint in Tier 2 is a realizability constraint, and no
sharpening of the Δ-level abstraction can yield a reduction.** Registrable only
as a negative/scoping lemma with the free-integer scope and the dropped guard 10
stated in the statement, plus an explicit "no consequence for actual G1 tuples"
note.

**S17 — Tier 1 ⟹ Tier 2 on guards 9 and 10 alone.** `proved_informal`, the
registered CONDITIONAL `E993-FOREST-IMPLIES-ORDINARY-G1` made explicit;
critic-attributed, and instantiated in the frozen Lean by `ordinaryG1_lowRank`,
which discards `hgamma` and the ambient conjuncts. Setting `F := U`,
`r := p−2`: guard 10 read with ℕ subtraction forces `p ≥ 3` hence `r ≥ 1`;
guard 9 is exactly `|V(U)| ≥ 2r+2`; guard 10 is `x(U) < r` verbatim; and `U` is
a forest. **This is the baseline against which every future ambient-coupling
reduction must be measured.**

**S18 — The G1-guard residual translation.** `proved_informal`. Under
`Erdos993G1.ordinaryG1Guards T v s g p`, with `U = residual T v g` and
`r' := p−2`: `U` is a forest, `r' ≥ 1`, `|U| ≥ 2r'+2` (so `d' ≥ 2`), and
`x(U) < r'`. Uses guards 1, 9, 10 and `p ≥ 3` only; guard 8 untouched.
Validated on 7,484 constructed ten-guard tuples, zero translation failures. Two
citation gaps to close before any Lean attempt: sealed entry 29
`delta_firstDescent_neg` for the `sInf`-attainment step (since
`Nat.sInf ∅ = 0`), and entry 186's `((p−2 : ℕ) : ℤ) = (p:ℤ) − 2`.

**S19 — Unconditional residue of the G1 residual band.** `proved_informal`.
For any ordinary G1 tuple satisfying the ten guards with `Δ_{p−2}(U) > 0`:
`d' ≠ 2` (C2, kernel-verified), `d' ≠ 4` (C3, kernel-verified), and if `d' = 5`
then `ν(U) = τ(U) = 6` (S12). **So the residue is `d' = 3`, or `d' = 5` with
`ν(U) = τ(U) = 6`, or `d' ≥ 6`.** This is the run's only Tier-3-shaped
statement stated over the **actual G1 guards** rather than over an informal
necessary region.

**S20 — König for forests from the sealed certificate.** `proved_informal`.
For every finite forest `F`, the C3 certificate's `m` satisfies
`ν(F) = τ(F) = m` (the source proves `ν ≥ m` and `τ ≤ m`; the elementary
`ν ≤ τ` closes the sandwich and is an inference, not a quotation). Verified on
602,180 labelled forests of order ≤ 8 and all forests of order ≤ 11 plus the
degenerate cases. **Formalization caveat, binding:** Mathlib at the pinned
commit has no matching number and `vertexCoverNum : ℕ∞`, so the *numeric* form
needs new definitions and an `ℕ∞`/`ℕ` bridge; the *extensional* form needs
neither and should be preferred.

**S21 — `c(8) ≤ 7`; `τ ≤ d ⟹ x(F) ≥ r` is false.** **Proof** by one exact
forest witness: `F* = 8·K_{1,3}`, `n = 32`, `r = 12`, `d = 8`,
`τ = ν = 8 ≤ d`, `|B| = 24 = 2r`; `Δ_11(F*) = −31822 < 0` so `x(F*) = 11 < 12`.
I recomputed both values independently: `Δ_11 = −31822`, `Δ_12 = −1145354`.
`Δ_12 ≤ 0`, so `F*` is **Tier-1-consistent and is not a recovering forest**.
Bounded extension at its horizon: `c(9) ≤ 8`, `c(10) ≤ 9`.

**S22 — Exact cover-fiber margin split at `τ = d` versus `τ = d+1`.**
`proved_informal`, elementary. In the cover-fiber partition the `S = ∅` term is
`(1+z)^{|B|}` with `|B| = 2r+d−τ`; at `τ = d` its difference at rank `r−1` is
`C(2r,r) − C(2r,r−1) = Cat_r > 0`, and at `τ = d+1` it is
`C(2r−1,r) − C(2r−1,r−1) = 0` exactly. In both cases the term's own first
descent is `x = r` (the `τ = d+1` zero is a **plateau**, not a descent) and its
`Δ_r` is `−Cat_r`. **This is a statement about one fiber and never about
`Δ_r(F)`**; treating the `S = ∅` fiber as controlling the total is exactly the
step the `COVER3-STRICT-PRE-R-INCREASE` fence exists to block, and it fails
quantitatively on the `d = 5` band and qualitatively one band over.

**S23 — The falsification perimeter (bounded computation, exact, at stated
horizons).** Zero `(F,r)` with `x(F) < r` and `Δ_r(F) > 0`: over 515,780
distinct forests of order 4–18 at 1,179,516 forest-rank pairs for `d = 3…7`;
over 4,950,598 distinct `(F,r)` pairs in the whole Tier 1 domain, trees to
order 19 and forests to order 17; over every distinct forest of order 4–20 at
**every** rank (3,269,187 forests, critic-attributed); over 148,035 forests of
order `2r+5` at `r ≤ 6` plus `r = 7` extensions; over four constructed families
to order ≈115 and one to order 415; and **no recovering forest at order ≤ 21
(all `ν`), none in the `d = 5` window at order ≤ 25**. **A null census is
bounded evidence at its stated horizon and never universal proof, and is
insufficient for any tier.** Two scope limits bound what the perimeter can ever
say: crossing occurs only at `d ∈ {2,…,6}` within the exhaustive tree horizon
and **never at `d ≥ 7`**, so the censuses contribute nothing to the
uniform-in-`d` question above `d = 6`; and the criterion for a promising
construction is inverted — absolute `|Δ_r|` growth is uninformative, recovery
is exactly `i_{r+1}/i_r > 1`, and in the designated matching-window family the
scale-free deficit `|Δ_r|/i_r` **falls** monotonically to `0.01010` at `n = 415`
with `i_{r+1}/i_r` rising to `0.989903` and still no recovery, for a structural
reason (the rank sits a fixed offset above the binomial peak of the `(1+z)^k`
factor) that explains that family only.

**S24 — Kadrawi–Levit control.** The five mandatory fixtures `T(3,4,4)` …
`T(3,6,6)` (orders 26–34, log-concavity failure ranks 13–17) were instantiated
from the in-root fixture definition. **None is a recovering forest**, and at
every rank where the crossing hypothesis holds each satisfies `ν ≥ m(d)` — the
registered hardest trees lie strictly inside the matching branch and never
enter the window. They refute log-concavity and real-rootedness and are **not**
counterexamples to any Tier 1 / Tier 2 / Tier 3 statement. No route or critic in
any orientation proposes an invariant stronger than unimodality.

**Independently re-derived at this seat** (exact integer / exact rational, no
floating point in any decision): `K(τ) = 0,2,3,4,6,12,70`; `Γ(8,k) < 0` on
`[8,600]`; `Γ(5,5) = −14`, `Γ(6,6) = −170`, `Γ(7,7) = −1091`; both readings of
the dominance criterion in exact rationals; the exceptional-cell tables at
`(τ,d) = (4,4), (4,5), (5,5), (5,6), (6,5), (6,6), (6,7), (7,7), (7,8), (7,9)`
and the reduction of them to **73** residual points, all at `k = r−1`; `P_8`;
`4K₂`; `6K₂ ∪ (2r−7)K₁` at `r = 4…11` with `x = r+1` on every row;
`7K₂ ∪ (2r−9)K₁` at `r = 5…11`; `8·K_{1,3}` at `r = 12`; both corrected edge
lists for the order-15 window witness, with `ν` and `τ` by brute force; the
Farkas feasibility boundary `m* = ⌈3d/2⌉−1` for `d = 2…16` with infeasibility
at `(3,3)` and `(6,5)`; and S14's threshold and its sharpness on `mK₂`.

---

## Refuted or narrowed mechanisms

**Refuted this cycle — fences for Cycle 2, never reopened.**

1. **`τ ≤ d ⟹ x(F) ≥ r` for forests.** Refuted by the exact forest `8·K_{1,3}`
   at `τ = d = 8` (S21). Its *derivation* — inferring the sign of `Δ_k` from the
   `S = ∅` cover fiber alone — is invalid for every `τ ≥ 1`, and since it uses
   no acyclicity it reproduces the registered
   `E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE` pattern verbatim at `d = 3`. Only
   the one-fiber fragment (S22) survives.
2. **`Γ(τ,k) > 0` for `k ≥ τ`.** False for `τ = 5, 6, 7` in that range and false
   for every `k` when `τ ≥ 8`. Any route chartered on that obligation is
   chartered to prove a false statement. Replaced by S9.
3. **The `∀m ∀d` quantification of the matching certificate.** Refuted at
   `(6,5)` by the registered fence. Correct form `∀d ∃m(d)` with
   `m(d) = ⌈3d/2⌉−1`.
4. **`outside_incidence_general` as shipped.** False when `d > 2m` under ℕ
   truncation, with an exact witness `K₂ ∪ (2r+1)K₁` reducing the stated
   inequality to `r+1 ≤ r`. Repair: add `hd : d ≤ 2m`, or state the coefficient
   as the exact cardinality. **Nothing may be built on it until repaired.**
5. **"The cover branch extends to all `d`."** False: the mechanism caps at
   `c_mech(d) = min(d,7)` by S9, and the true threshold is capped independently
   by S21 at `d = 8`.
6. **"Satisfying `x(F) < r` at `ν = τ = 6` is structurally hard."** Refuted by
   exhaustive census; the window is generic (52 % of window forests cross at
   `r = 10`). The *conclusion* (no recovery in the window) survives and is
   strengthened; the stated reason must go.
7. **The top-block-only certificate**, at every `(m,d)` including the
   width-one case. Killed by Farkas at `(2,2)`, `(5,4)`, `(7,5)`, `(8,6)`; its
   feasibility is not a function of the window width at all, so the
   "width one closes, width two does not" framing has no mathematical content.
8. **The naive termwise convolution condition** — definitionally unsatisfiable
   for every nonempty component by `Δ_0(F) = |V(F)| − 1`; not any route's own
   decomposition invariant; discharges nothing.
9. **The `∃`-leaf reading of the registered existential-SR2 claim** — wrong
   quantifier (the registered claim quantifies over *all* vertices) and a
   dropped hypothesis `Δ_r(F) < 0` that conceals a circularity the master
   registry itself flags: it assumes the sign it would need to supply. The
   hypothesis-free form the mechanism actually needs is **strictly stronger than
   Tier 1**, so it is not a reduction of Tier 1 and must be registered
   separately if attacked.
10. **"The necessary region is inhabited"** — 0 of 148 shipped tuples; the
    claim, if true, would itself be a Tier 2 refutation, since the region
    contains the recovery clause.
11. **Sharpening the Δ-level G1 abstraction** as a route to Tier 2 — S16 shows
    it has zero deductive power even with the full chain, coefficient
    nonnegativity and the `U ⊆ H` nesting.
12. **The fractional window-width table** — an integer count evaluated at
    real-valued thresholds, mis-transcribing its own cited source at the two odd
    bands. Replaced by S13.
13. **"Conditionally strictly smaller than the necessary region"** — the window
    condition is *derived* from the region's own recovery clause, so the reduced
    class is equal, not smaller. Narrowed to a search filter of unproven bite.
14. **`DS(t,t)` as uniform-in-`d` evidence** — `d = 2` for every tested `t`;
    struck entirely.
15. **"Parity asymmetry" in matching witnesses** — one comparator schema under
    two gadget substitutions, related by an exact `−2z²Q` perturbation, with
    `k ≡ d (mod 2)` forced; no parity law.
16. **"Moves away from recovery with scale"** — struck in its normalized form;
    the scale-free measure runs the other way in the designated family.

**Narrowed but retained.** The matching certificate machinery (corrected
quantifier, ℕ→ℤ re-centring restored, slack column restored, `hd : d ≤ 2m`
added, `hK` deleted, the `j > r+1` over-constraint fixed); the cover-branch
statement (guarded by `k < r` / `r ≥ 2`); `c(d) = min(d,7)` (conjecture;
`min(d,5)` is the theorem); the `d = 2` matching specialization (the matching-2
corollary of C2, not C2 — two edges with `ν = 1` give `Δ_r = 0`, which C2
covers and no matching-branch statement reaches); "novel theorem" framings
(both the `τ ≤ d` requirement and the `τ ≥ 8` failure are written into the
Stage 1 gate, the run carries `novelty_claimed: false`, and the contribution is
the *proof* and the *exact* thresholds, not the statements); the padding
narrative (the honest obstruction is dimensional — a single discrete dial
supplying at most three `H`'s per fixed `p` — not "`p` moves", and the binding
guard is width, not descent/Γ); and `τ = ν` scoping (König holds for every
bipartite graph and non-bipartite König–Egerváry graphs exist; the forest
restriction is sufficient, not necessary).

**Evidence-envelope defects carried forward as controller debt** (none of which
changes a mathematical verdict): wall-clock fields inside three hashed census
artifacts, making those digests not replay-reproducible; one shipped self-test
that prints `MISMATCH` and `passed: False` on a benign trailing-zero
representation difference; one hashed output whose digest is not stable across
runs because a heap tie-break keys on object identity; a replay block that
redirects in place onto inventoried artifacts; replay targets created with a
temporary-directory command outside the run root; several "checked" attributions
for claims never instantiated; and distinctness-up-to-isomorphism argued from
degree sequences rather than computed. Cycle 2 briefs must name the in-root
replay directory, forbid every out-of-root temporary-directory form, forbid
wall-clock fields inside hashed outputs, require computed isomorphism-class
counts, require the `SOLUTION-CONTRACT.md` §3 controls before any null search is
reported, require a shipped digested generator for **every** numeric claim, and
require each seat to name the registered VERIFIED claims its census would
re-confirm **before** presenting it as evidence.

---

## Headline verdicts

Exact evidence grades, per target. No status transfers anywhere.

| target | registered status | Cycle 1 verdict | grade |
|---|---|---|---|
| **Tier 1** `E993-R25-UNR-FOREST-WIDE` | OPEN | **untouched**; not proved, not refuted, not approached | no advance; bounded negative evidence only (S23) |
| **Tier 2** `E993-G1WIDE-NO-SIZE-CAP` | OPEN | **untouched**; no tuple with `Δ_{p−2}(U) > 0`, no proof that none exists | no advance; S16 retires the Δ-level line, S17 fixes the baseline, S19 narrows the residue |
| **Tier 3a** matching schema `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` | OPEN | **band instances proved, uniform form open** | S4 `proved_informal` at `d = 5`; S5 `proved_informal` at `d ≤ 6` (critic-attributed, fixed-band); S6 sharpness uniform in `d`; S7 boundary exact per swept `(m,d)`; the **`(m,d)`-uniform closed form is open** |
| **Tier 3b** cover schema `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY` | OPEN | **`c(d) = min(d,5)` proved for forests; `min(d,7)` conjectural** | S10 `proved_informal` with the `r ≥ 2` guard and two unformalised nodes; S11 reduces the rest to 73 finite points; S9 caps the mechanism at `τ ≤ 7` |
| **Tier 3c** `E993-R25-WINDOW-REDUCTION` | OPEN | **stated over the bare branch, and it widens** | S13 `proved_informal` as arithmetic, conditional on the branch theorems at each `d`; **negative**: width `≈ 3d/2 − 9` for `d ≥ 8`, so the reduced class is not strictly smaller in the contract's sense at large `d`; S12 is the one band where it bites |
| **Diagnostic band** `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` | OPEN | **OPEN — reduced, not closed** | S12 confines every counterexample to `ν = τ = 6`, unconditionally; S4 is bare and matching-conditioned and **does not transfer** |

**Separately, with no status transfer whatsoever:**

- **FOREST** (`E993-TGT-FOREST`, every finite forest weakly unimodal) — **OPEN,
  untouched.** Nothing in Cycle 1 bears on it. Tier 1 is a registered *proper
  subclaim* of it, and Tier 1 did not move.
- **TREE** (`E993-TGT-TREE`) — **OPEN, untouched.** No tree-specific statement
  was proved or refuted.
- **TRANSFER** (`E993-TRANSFER-TO-FOREST`) — **CONDITIONAL, undisturbed.** Its
  universal antecedent `E993-UNIV-TREE-TRS2` remains **REFUTED** at order 26 and
  is not reopened; convolution closure of weakly unimodal sequences was
  falsified afresh by an abstract pair correctly flagged as realizable by no
  graph's independence sequence. A REFUTED claim never regresses to OPEN.
- **Erdős #993** — **untouched.** No claim is made, anywhere, that closing the
  `d = 5` band, the G1 residual, or G1 itself solves Erdős #993.
- `E993-EXISTS-COUNTEREXAMPLE` remains **OPEN**;
  `E993-C3-RECOVERY-RESTRICTED-UNBOUNDED-PADDING-RESCUE` remains **OPEN**;
  `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`,
  `E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE`,
  `E993-G1-RANK-SCALED-MARGIN-FACTOR2`,
  `E993-C3-FOREST-WIDE-EARLIER-EVERY-VERTEX-SR2` and `E993-UNIV-TREE-TRS2`
  remain **REFUTED** and undisturbed; `OB-G1` is untouched and is not conflated
  with G1wide.

**Branch states, recorded exactly as the close requires.**

*Cover branch.* `c(d) = min(d,5)` is a **theorem for forests** with the `r ≥ 2`
guard (equivalently `k < r`), uniform in `d`, with two unformalised nodes (the
general-`τ` power-set expansion and the finite-cell exhaustions) and acyclicity
load-bearing exactly at the exceptional cells. `c(d) = min(d,7)` is a
**conjecture** with **73 finite open points**, at `τ ∈ {6,7}`, `k = r−1`,
`d ∈ {6,7,8}`, orders 18–147, distributed 7 / 65 / 1 across `(6,6)`, `(7,7)`,
`(7,8)`. The **`τ ≤ 7` ceiling is proved** and is `d`-independent: this
mechanism cannot reach `c(d) > 7` for any `d`. Consequently the Tier-3c window
**widens with slope `3/2` for `d ≥ 8`**.

*Matching branch.* Per-`(m,d)` certificates that are **`r`-uniform proofs** exist
at `d ≤ 6` and at the named pairs `(2,2), (4,3), (5,4), (7,5), (8,6)`; the
**`(m,d)`-uniform closed form is open** — per-`(m,d)` existence is solved, the
uniform statement is unproved, and one reparametrized incidence lemma is both
uncompiled and false as written. **Bare sharpness is uniform in `d`**
(`m_bare(d) ≥ ⌈3d/2⌉−1` for every `d`, by an explicit family). **Every known
sharpness witness has `x = r+1`** — so every one is a bare sign failure, never a
recovery, and the crossing-conditioned threshold has no established lower bound
at any `d`.

```text
headline_resolved: no
```

---

## Lean awards

**Award decision: one award group plus one companion contract. E1 is confirmed
and awarded, at the single band `d = 5`, named as a fixed-band result.**

**Reconciliation of the three adjudications on the award.** U recommends E1 and
names E11 as a two-lemma companion. T names no award but identifies the same
mathematics (its E4 at `d = 5` is S4) and blocks it for three reasons; F names
no award and finds nothing in its orientation awaiting naming. There is **no
mathematical disagreement** — T, U and F agree on every number at this band,
and F's own perimeter reproduces the `m = 6` fence that makes S4 sharp. I
resolve T's three blocking reasons at the single band: (i) *critic-attributed
with no seat-shipped envelope* — true of T's own `d ≤ 6` family, which I do not
award; at `d = 5` the certificate is verified by three independent instruments
plus this seat's fourth, and Stage 7 re-derives it under the frozen theorem
contract regardless of which seat first found it; (ii) *the `r < m` vanishing
argument is unshipped* — at `(m,d) = (7,5)` this is not an unwritten
mathematical step but a cardinality fact: `2m = 14 > 2r+5` for `r ≤ 4`, so no
injective `f : Fin 7 × Bool → X` exists and the case is vacuous by `omega`;
(iii) *must be scoped and named as a band family* — it is named fixed-band
here, at one band, per protocol duty 4. **T's block is therefore sustained
against the `d ≤ 6` family and does not reach the `d = 5` instance.**

### Award group A — `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`

Named **FOURTH-BAND** per controller ruling (2). Fixed-band result, named as
such. Grade at award: `proved_informal`; `formally_verified` only after the
governed `lean-proof-workflow`.

**Exact statement.** For every finite simple graph `G` on a vertex type of
cardinality `2r+5` carrying seven pairwise disjoint edges, `Δ_r(G) ≤ 0`, for
every `r`. Bare: no crossing hypothesis, no acyclicity, no forest hypothesis.

**Exact Lean-facing statement and hypotheses for Stage 7** — the C3 binder
pattern generalized from `Fin 5` to `Fin 7`, mirroring frozen entry 164
`Erdos993G1.ThirdWide.fiveMatching_delta_nonpos` binder for binder:

```lean
lemma sevenMatching_delta_nonpos {X : Type u} [Finite X]
    (G : SimpleGraph X) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+5)
    (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true))) :
    delta G (r : ℤ) ≤ 0
```

`hr : 1 ≤ r` is retained for fidelity with the C3 analogue and is redundant:
`M.card = 14 ≤ Nat.card X = 2r+5` gives `5 ≤ r` by `omega`, and `r ≤ 4` is
vacuous. `delta`, `coeff`, `indepCount` are the `SEMANTIC-CONTRACT.md`
definitions, reused verbatim.

**Closed dependency DAG over the `Erdos993G1` definitions at this exact scope.**
Confirmed closed. Reused with **no** new Lean: `indepCount`, `coeff`, `delta`
(C2 entries 1–3); `FirstWide.stratum` (entry 13); `stratum_partition`
(entry 108); `extension_fiber_bound` (entry 112); `stratum_univ_empty`
(entry 120); `fiveMatching_stratum_empty` (entry 158 — its statement is generic
in `M.card` and carries no `Fin 5`, so it is reusable verbatim). Nine new
lemmas, each a direct analogue of a kernel-verified C3 entry:

| # | new lemma | mirrors C3 entry | what changes |
|---|---|---|---|
| 1 | `sevenMatching_endpoints_card` — `(univ.image f).card = 14` | **154** (`= 10`) | `Fintype.card (Fin 7 × Bool) = 14`; one line |
| 2 | `sevenMatching_forbidden` — for independent `S`, `∃ Q ⊆ image f`, `Q.card = 2·(S ∩ image f).card`, each element of `Q` in `S` or adjacent to `S` | **155** | proof generic in the matching; only the `Fin 5 → Fin 7` retyping of `C.image flip` changes |
| 3 | `sevenMatching_support` — `(S ∩ image f).card ≤ 7` | **156** (`≤ 5`) | consumes 1 and 2 |
| 4 | `sevenMatching_stratum_partition` — `indepCount G k = Σ_{j=0}^{7} (stratum G M k j).card` | **157** (six terms) | eight terms over the reused `FirstWide.stratum` |
| 5 | `sevenMatching_outside_incidence` — `(r+1−j)·S(r+1,j) ≤ (r+j−9)·S(r,j)` at `Nat.card X = 2r+5`, `M.card = 14`, **in ℕ with truncation on both sides** | **159** (coefficient `r+j−6`) | **this is the only place `d = 5` and `m = 7` enter, jointly and only as `2m−d = 9`**; same `omega` step `2r+5 − (M ∪ B).card = r+j−9` |
| 6 | `sevenMatching_inside_incidence` and `sevenMatching_inside_incidence_int` — `(j+1)·S(r+1,j+1) ≤ 2(7−j)·S(r,j)` for `j < 7` | **160**, **161** | `2*(5−j)` becomes `2*(7−j)`; the ℤ form by `exact_mod_cast` |
| 7 | `sevenMatching_outside_incidence_large_int` — the re-centred ℤ form at `t = r − 9`, `hj : j ≤ 7` | **162** (at `t = r − 6`) | **the ℕ→ℤ re-centring; not skippable** — it is the step one Stage 3 return silently dropped, and the certificate is not typable without it |
| 8 | `sevenMatching_integer_certificate` — the closed-form positivity identity over `t, a_0..a_7, b_0..b_7` with `ht : 0 ≤ t` and the slack hypothesis `ha7 : 0 ≤ a_7`, combining eight outside and seven inside inequalities | **163** (six/five, with `ha5` and multiplier `E`) | multipliers are the verified `λ_j(r), μ_j(r)` family with `105·(r+1)r(r−1)(r−2)(r−3)(r−4)(r−5)` cleared; **the slack column on `a_7` is the analogue of C3's `E·a_5` term and must not be omitted**; closes by `linear_combination` / `positivity` exactly as entry 163 does |
| 9 | `sevenMatching_delta_nonpos` — the assembly | **164** | generic branch `r ≥ 9 = 2m−d` via 8; small-rank branch `r = 5,6,7,8` via `stratum_univ_empty` / `fiveMatching_stratum_empty` plus explicit exact duals at those four ranks (the analogue of entry 164's `r = 3,4,5` branches); `r ≤ 4` vacuous by cardinality |

**Certificate provenance.** The `r`-uniform dual exists in closed form
(`λ = (1/(r+1), 1/r, 1/(r−1), 1/(r−2), (105r²−789r+1446)/(105(r−2)(r−3)(r−5)),
(21r²−149r+262)/(21(r−2)(r−3)(r−4)), (7r−22)/(7(r−2)(r−3)), 1/(r−2))`,
`μ = (0, 0, 0, (9r−66)/(70(r−2)(r−5)), (44r−136)/(105(r−2)(r−3)),
(11r−34)/(21(r−2)(r−3)), 4/(7(r−2)))`, valid for `r ≥ 8`, the only binding side
condition being `μ₃ ≥ 0 ⟺ 9r ≥ 66`), verified symbolically for `r ≥ 16` by a
second, independent method, at 497 values of `r` up to `10^15`, at
`r ∈ {8,…,59} ∪ {100, 1000, 10⁶, 10⁹}` by the U adjudicator, and here by an
independent exact-rational Farkas greedy at `r` throughout `[9,49]` and at
`r = 10⁶`, with `(6,5)` infeasible.

**Every excluded conclusion.** The award carries **none** of the following, and
Stage 7 must state each exclusion in the frozen theorem contract:

1. **No Tier 1 status.** `E993-R25-UNR-FOREST-WIDE` stays OPEN. The theorem is
   bare and matching-conditioned; Tier 1 is crossing-conditioned with no
   matching hypothesis.
2. **No Tier 2 status.** `E993-G1WIDE-NO-SIZE-CAP` stays OPEN. Nothing here
   touches the G1 guards.
3. **No Tier 3-uniform status.** This is one band. It does not prove the schema
   `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`; per that schema's own scope field
   each concrete instantiation registers its own key, and the `(m,d)`-uniform
   closed form remains open.
4. **No closure of the diagnostic band.** `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`
   stays OPEN. It is crossing-conditioned and carries no matching hypothesis;
   **no status transfers**. The band's counterexample class is confined to
   `ν = τ = 6` by S12, which is a separate informal result and is **not** part
   of this award.
5. **No forest status transfer.** The theorem is general-graph and uses no
   acyclicity; specializing it to forests yields nothing beyond the
   specialization, and in particular nothing about `E993-TGT-FOREST`,
   `E993-TGT-TREE`, `E993-TRANSFER-TO-FOREST`, `E993-EXISTS-COUNTEREXAMPLE` or
   Erdős #993.
6. **No reopening of any fence.** It sits exactly on top of
   `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN` (REFUTED), which fixes
   `m = 6` as the failing boundary; that refutation is confirmed, not disturbed.
7. **Not the refuted comparator.** The comparator `(1+2z)^m(1+z)^{n−2m}` is
   nowhere a proof device; the certificate system is strictly stronger and its
   infeasibility is exactly at the refuted pairs. Per controller ruling (4), the
   CONDITIONAL `E993-G1-MATCHING-COMPARATOR-SUFFICIENT` is **not** refuted and
   the contract is a **strengthening** of it; the claim-identity separation is
   recorded and must appear at registration.
8. **No claim about log-concavity, TRS2 or real-rootedness**, and no census
   below order 26 is offered as bearing on any of them.
9. **`novelty_claimed: false`**, and the grade at award is `proved_informal`;
   nothing in this run is `formally_verified` until the governed workflow
   returns a kernel/axiom receipt.

### Award group B (companion) — the perfect-matching uniform lemma

Two lemmas, bundled as a separate small contract, and the **only** uniform-in-`d`
statement Cycle 1 produced.

**Exact statement.** For every finite simple graph `G` with a perfect matching
(`2m = Nat.card X = 2r+d`) and `3d ≤ 2m+2`: `Δ_r(G) ≤ 0`. Equivalently: every
finite simple graph with a perfect matching on `2m` vertices has `Δ_r ≤ 0` for
every `r` with `2m ≤ 3r+1`.

**The two new lemmas.** (i) a containment count
`(r+1)·indepCount G (r+1) ≤ 2(m−r)·indepCount G r` for graphs with a perfect
matching — the top-stratum specialization of new lemma 2 above, since every
independent set is a transversal of the `m` edges and `i_k = A_k`; (ii) the
threshold arithmetic `3d ≤ 2m+2 ∧ 2m = 2r+d ⟹ d ≤ r+1`, by `omega`.

**Excluded conclusions.** The perfect-matching hypothesis forces
`d = 2(m−r)`, so the lemma is uniform in `d` **over even `d` only** — a scope
limit no adjudication states and which must appear in the contract. It is
**not** Tier 3a: it says nothing about graphs without a perfect matching, where
`|V| > 2ν`. Its threshold is exactly sharp on `mK₂`, which is a comparator
family and therefore never a counterexample to any crossing statement. No
transfer to Tier 1, Tier 2, the diagnostic band, FOREST, TREE, TRANSFER or
Erdős #993.

### Not awarded, and exactly why

- **The `d ≤ 6` bare matching band family (S5).** Stable statement, closed DAG
  over new lemmas 5–6 and nothing else, real materiality. Blocked on evidence
  custody: critic-attributed with no generator, digest or copy-out-first replay
  in any seat's shipped envelope, and the family must be re-shipped under seat
  attribution. Clear that and it becomes awardable in Cycle 2, named as a band
  family.
- **`c(d) = min(d,5)` for forests (S10).** Stable statement once guarded by
  `k < r`; materially a uniform-in-`d` cover theorem. Blocked by **two
  unformalised DAG nodes**: the general-`τ` power-set expansion
  (`powerset_four_sum` is `C.card = 4`-locked in the frozen source and every
  positive result passes through its general form), and the finite-cell
  exhaustive closures, which are computer-assisted case analyses with no
  kernel-checked counterpart. Formalise the power-set step first.
- **The `d = 5` window reduction (S12).** The right *mathematical* headline of
  the cycle, and **not** Lean-renderable this cycle: it depends on S10's
  exceptional cells, `native_decide` is forbidden, kernel `decide` over 122,963
  forests is hopeless, and the alternative is bespoke counting lemmas that must
  consume acyclicity at ranks higher than anything C3 attempts. **DAG not
  closed.**
- **The `τ ≥ 8` ceiling (S9).** Stable, elementary, closed DAG, two-line proof.
  Materiality real but small and **negative** — a ceiling on an instrument, not
  a residual or forest theorem. Lean-eligible as a named auxiliary lemma inside
  a proved cover-branch theorem, not as a standalone award.
- **The strata machinery alone (S1–S2)**, and **the G1 identities (S15)** —
  repackaged machinery and repackaged identities, explicitly excluded; the
  `SEMANTIC-CONTRACT.md` already declares both parent identities available to
  every seat. S1–S2 are the mandatory substrate for group A and are formalized
  inside it.
- **The abstract-insufficiency lemma (S16)** — awardable only as a
  negative/scoping lemma with an explicit "no consequence for actual G1 tuples"
  note; marginal materiality; not recommended this cycle.
- **Orientation F** — no award attempted, and the reason is recorded exactly:
  every F result is either a bounded computation or a null census (excluded by
  contract §4: "a null census is insufficient for any tier"), a repackaged
  binomial identity about a single fiber (S22), a necessary-only threshold whose
  DAG is not closed, or a reconfirmation of a claim already registered REFUTED.
  No fixed-band result awaits naming in F and no conditional reduction in honest
  conditional form was produced there.
- **T3's three candidate registrations** — refused as aliases or corollaries of
  registered VERIFIED master claims.

**Gate hygiene carried into Stage 7.** Lean 4.32.2 / Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`; axioms exactly `propext`,
`Classical.choice`, `Quot.sound`; no `sorry` / `admit` / `native_decide`;
shared Mathlib bound by symlink, never copied (run the copy audit before the
wave); repair limit 2 per candidate; frozen theorem contract, independent
informal audit, kernel/axiom receipt, independent fidelity attestation,
canonical close. **Nothing in Cycle 1 has been compiled; no result in this run
is `formally_verified` and none may be reported as such.**

---

## Progress and stop-gate ruling

```text
material_progress: yes
```

All three orientations return `material_progress: yes` and
`orientation_plateau: no`, and the evidence sustains both.

**What moved.** (1) The matching branch's threshold went from a comparator
heuristic to the **exact feasibility boundary of the certificate system itself**
(S7), with the two registered refuted pairs sitting precisely on the infeasible
side, and with `m(5) = 7` upgraded to a **theorem** (S4) and bare sharpness
proved **uniformly in `d`** (S6). (2) The cover branch's open set collapsed from
open rank ranges over infinitely many forests to **73 named finite points**
(S11), independently re-derived here, while `c(d) = min(d,5)` became a theorem
(S10) and two declared exceptions were closed by the route's own bound. (3) The
`τ ≤ 7` ceiling went from a witness to a **theorem** (S9), an index error that
would have discarded the entire `τ = 7` stratum was caught and reversed, and the
Tier-3c consequence — the window **widens** like `3d/2 − 9` — is a new
structural fact about the programme's shape (S13). (4) The `d = 5`
counterexample class was reduced **unconditionally** to `ν = τ = 6` (S12), and
the G1 residual band to `d' = 3`, `d' = 5` at that single matching number, or
`d' ≥ 6` (S19), the latter stated over the **actual guards**. (5) A whole line
of attack on Tier 2 was retired: the Δ-level abstraction carries no information
about the residual sign even with the full prehistory chain, coefficient
nonnegativity and the `U ⊆ H` nesting (S16), which redirects Tier 2 effort to
realizability and fixes the correct baseline (S17). (6) Two false mechanisms
were fenced with actual witnesses (S21, S9), one of which was about to be handed
to three downstream routes as free. (7) The falsification perimeter was pushed
to every distinct forest of order ≤ 20 at every rank, the whole Tier 1 domain
for trees ≤ 19 and forests ≤ 17, and families to order 415 — with the criterion
for a promising construction **inverted** (S23), which changes what Cycle 2
should search for. (8) A Lean-gate candidate with a stable statement and a
closed DAG now exists, plus a cheap uniform companion.

**Two honest qualifications.** Most of this is **critic-attributed**: three of
four returns in two orientations misdescribed their own evidence in ways both
paired critics caught independently, and in several cases the decisive work was
done by the critics rather than the seats. And **none of it touches Tier 1 or
Tier 2.** Neither qualification makes the progress less real as evidence for the
run; both bear on how Cycle 2 is allocated and how Cycle 2's close is judged.

```text
plateau: no
```

The stop gate's plateau condition requires **evidence of no material progress
over two consecutive cycles**, never the absence of a headline proof. This is
Cycle 1, so the condition cannot be met on its own terms, and the evidence is
not remotely overwhelming in the other direction — it points the other way.
Recorded for the Cycle 2 close so the test can be applied properly: the run
would plateau if Cycle 2 returned only larger null censuses with no new exact
statement, no new narrowed fence and no construction class whose scale-free
deficit is not explained away; **and**, for the T and U orientations
specifically, a second cycle of the same pattern — correct machinery, misgraded
by the seats, closed by the critics — would be evidence of plateau even with
nominal new content.

**Stop-gate ruling.** No decisive event occurred. A decisive event is a verified
Tier 1 or Tier 2 theorem, a verified reduction strictly shrinking the remaining
class, or an exact counterexample. Tier 1 and Tier 2 are untouched; no
counterexample exists anywhere in the record; and the two reductions produced
(S11, S12, S19) shrink the class at **fixed bands or at fixed `(τ,d)` cells**,
not uniformly — indeed S13 shows the residual class **grows** with `d` under the
current thresholds, so the Tier-3c reduction does not meet the contract's
"strictly smaller class" criterion at large `d`. `SOLUTION-CONTRACT.md` §6's
continue conditions are met independently on all three counts: **(a)** a new
actual-graph mechanism whose unresolved dependency (the `ν = τ = 6` window at
one band) is strictly weaker than Tier 1 and which survived a fresh falsifier —
the exhaustive census refuted its author's structural inference and left the
conclusion intact; **(b)** new proved reductions of the remaining class (S11,
S12, S19); **(c)** a candidate ready for the Lean gate (award group A).

---

## Cycle 2 route portfolio

Twelve routes, four per orientation, consistent with the three adjudicators'
next-route allocations and deconflicted across orientations. Each says what it
can close in one cycle, or what debt it can honestly name.

**Binding constraints on every Cycle 2 brief.** Name the in-root replay
directory explicitly; forbid out-of-root temporary-directory forms and in-place
redirection onto inventoried artifacts; forbid wall-clock fields inside hashed
outputs; require a shipped, digested generator and a copy-out-first replay for
**every** numeric claim; require computed isomorphism-class counts, never
degree-sequence arguments; require the `SOLUTION-CONTRACT.md` §3 controls (C2,
C3, `P_8`, the `d = 3` band) to be reproduced **before** any null search is
reported; require every seat to name the registered VERIFIED claims its census
would re-confirm **before** presenting it as evidence; require attained rather
than filter horizons; and require critics to describe replaced path literals by
reference to the edit record rather than by quotation.

### Orientation T (prove)

- **T-C2-01 `UNIFORM-D-MATCHING-CERTIFICATE`** (Tier 3a, highest expected
  value). Prove the closing inequality `μ_{m−1} ≥ (d−1)/(m(t+m))` for
  `m = ⌈3d/2⌉−1` and all `t ≥ 0` in the substitution `t = r+d−2m`,
  `w = 2m−d+1`, plus the elementary vanishing argument for `r < m`; re-ship the
  `d ≤ 6` symbolic certificates with generators, digests and copy-out-first
  replay **under seat attribution**. *Closes:* Tier 3a uniform in `d` — the
  run's first uniform advance — or, failing that, a Lean-ready band family at
  `d ≤ 6`, named as fixed-band. *Debt if it fails:* an explicit statement of
  which `d` the closing inequality resists, with the exact margin. **Owns the
  algebraic closing step; coordinate with U-C2-03, which owns the coefficientwise
  positivity of `Q_{m,d}(t)` and the Lean repairs — do not duplicate.**
- **T-C2-02 `COVER-CELL-CLOSURE-AND-CEILING`** (Tier 3b). Close the 73 residual
  cells by **cover-structured** enumeration (`|C| = τ`, `B` independent, at most
  `τ−1` vertices of `B` with `|N(b)| ≥ 2` by acyclicity, the rest leaves and
  isolated vertices) rather than by forest order, which is infeasible past 17;
  guard the theorem by `k < r`; formalise the general-`τ` power-set expansion;
  register the `τ ≥ 8` ceiling theorem; alias-check the `n = 9` witness against
  `E993-C2-COVER3-NINE-VERTEX-PLATEAU-WITNESS` first. The pre-reduction
  `102`-versus-`93` reconciliation is **discharged** by this synthesis (R5) and
  need not be redone. *Closes:* `c(d) = min(d,7)` as a theorem for forests, the
  Tier-3c window's exact lower end for all `d`, and the first Lean-tractable
  node of the cover branch. *Debt if it fails:* the exact sub-list of cells that
  resist, by `(τ,d,r)`.
- **T-C2-03 `G1-RESIDUAL-REALIZABILITY`** (Tier 2, redirected by S16). Attack
  Tier 2 **only** through realizability. Build guard-satisfying tuples with
  `maxdeg(U) ≥ 3` and `|U| ≥ 2p+1` from the existing 6,891-tuple bed and its
  19-vertex lift, and either force `Δ_{p−2}(U) > 0` at fixed `p` or prove the
  tree structure together with `p = x(T)+1` as a **global** invariant forbids
  it. Measure everything against the **S17 baseline**; report `maxdeg(U)` and
  `|U| − (2p+1)` on every row; disclose how many rows fall in the C2, `d = 3`
  and C3 bands; subtract the three registered VERIFIED path-forest claims before
  claiming content. *Closes:* a strict reduction of the necessary region, or one
  direction of Tier 2. *Debt if it fails:* a certified statement of which guard
  blocks realizability, with the exact obstruction. **Coordinate with F-C2-01;
  do not duplicate its recovery-hunt charter.**
- **T-C2-04 `CROSSING-SHIFT-UPPER-BOUND`** (Tier 1; the only T route where
  `x(F) < r` would do work). Register and attack the **missing upper
  crossing-shift bound** `x(F−v) ≤ x(F)` for a leaf `v` of a forest — the
  complement to the registered OPEN `E993-THEOREM-B`, registered nowhere in any
  status, and exactly the lemma the induction's `A_v` branch needs (zero
  violations over all forests `6 ≤ n ≤ 12`, bounded). Pair it with an explicit
  **excess budget**: the `A_v` branch consumes `d`, so either strengthen the
  target to `d ≥ 0` or reorganise onto the `d`-preserving branch. **Binding
  caution:** the hypothesis-free selection statement the mechanism needs is
  *strictly stronger* than Tier 1, so the route must frame itself as attacking a
  stronger statement and register it separately, and must **not** cite
  `E993-FOREST-EARLIER-DESCENT-NEGATIVE-TARGET-IMPLIES-SR2` for it. Quantify
  over **all** vertices, include `K₁` components, target high-degree centres.
  *Closes:* the run's first genuinely crossing-conditioned step. *Debt if it
  fails:* the registered open claim itself, which is the single most useful
  artifact this line can produce.

### Orientation F (falsify)

- **F-C2-01 `WINDOW-INTERIOR RECOVERY HUNT AT τ = d+1`.** Attack the one
  stratum the whole orientation never entered: at `d = 5` no F family reached
  `ν = 6` at all, yet every observed crossing window instance sits at `τ = d+1`
  with `x = r−1` exactly — precisely the rank where S22 says the `S = ∅` fiber's
  margin is **zero**. Construct and search forests with `τ = ν = d+1` exactly at
  `d = 5…12`, beyond the exhaustive horizon, with `r` chosen so the crossing
  hypothesis bites, and measure the `S ≠ ∅` fiber contribution at rank `r−1`
  directly rather than the aggregate. Use the order-15 window witness identified
  in R9 as the seed. *Closes:* an actual recovering forest (the headline), or an
  exact lower bound on the `S ≠ ∅` fibers at `τ = d+1`, `k = r−1` — the single
  missing step of the cover branch. *Debt if it fails:* a certified absence
  statement at a horizon that finally includes `ν = d+1` witnesses.
- **F-C2-02 `SCALE-FREE DEFICIT FALSIFIER`.** Adopt the inverted criterion:
  absolute `|Δ_r|` growth is uninformative and recovery is exactly
  `i_{r+1}/i_r > 1`. Sweep the complementary class — families whose padding
  grows **slower** than two `K₁` per unit rank, so the rank is not pinned at a
  fixed offset from a binomial peak, and families whose branching core grows
  with `n`; report `i_{r+1}/i_r` and `|Δ_r|/i_r` on every row with `x` computed
  exactly. *Closes:* a genuine near-miss with `i_{r+1}/i_r > 0.999` under
  crossing — the first evidence in the programme that recovery is approachable —
  or a proved bound `i_{r+1}/i_r < 1` for the entire padded class, which is a
  **Tier 3 structural reduction** rather than another null.
- **F-C2-03 `COVER-BRANCH CEILING AND SCOPE SPLIT`.** Convert S9 and the
  `τ ≤ 3` forest scan into a decision. For `τ = 5, 6, 7` produce the explicit
  finite exceptional rank sets `k < K(τ)` (`K = 6, 12, 70`) with an exact
  witness or an exact positivity certificate at each excepted rank, and settle
  whether the cover branch admits `c(d) = d` for `d ≥ 4` on **forests**. Freeze
  and audit the monotone-ratio lemma so the all-`k` halves of S9 become
  award-ready. Recount the `τ ≤ 3` graph-scope violator population under one
  explicit isomorphism convention (the 18-versus-62 discrepancy). *Closes:* a
  forest counterexample to the cover branch as chartered — decisive — or a
  certified statement that for `τ ≤ 7` the only failures lie in the finite set
  `k < K(τ)`, which converts Tier 3b into a **parameterized theorem with an
  explicit finite exceptional set** and is F's most plausible route to the Lean
  gate. **Coordinate with T-C2-02: F owns the falsifier and the exceptional-rank
  certificates; T owns the 73-cell closure.**
- **F-C2-04 `KL/GALVIN FIXTURE BATTERY AND INVARIANT FALSIFIER`.** Discharge the
  clause the controller has made dischargeable. Using the in-root fixture
  definition and evaluator, compute `i_k`, `x` and `Δ_r` **exactly** on
  `T(3,4,4)`, `T(3,4,5)`, `T(3,5,5)`, `T(3,5,6)`, `T(3,6,6)` at every admissible
  rank, on their disjoint unions and paddings, and on any ordinary G1 wrapper
  they admit; then instantiate every Cycle 2 mechanism on them. *Closes:* kills
  on sight any Cycle 2 mechanism that implicitly needs log-concavity, TRS2,
  real-rootedness or unrestricted TRANSFER; ships the exact `x` / `Δ_r` rows no
  run in this lineage has shipped; and settles whether the KL family is a
  near-miss in the crossing sense or irrelevant to it — S24 already indicates
  irrelevant, and this route makes that a shipped result.
- **Deliberately not allocated:** a plain order-extension of the existing
  censuses. Crossing never occurs at `d ≥ 7` within the exhaustive horizon, the
  null is already robust at every reachable order, and another order-only census
  would be exactly the evidence of no material progress that arms the plateau
  condition. Any Cycle 2 census must be targeted by `τ`, `ν` or family shape.

### Orientation U (formal/structural)

- **U-C2-01 `D5-MATCHING-LEAN-AWARD`** (Stage 7 track, highest priority).
  Freeze the award group A theorem contract exactly as stated above, write the
  nine new Lean lemmas, and take it through the governed `lean-proof-workflow`;
  register as `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`. Bundle award
  group B as a second, two-lemma contract with its even-`d` scope limit stated.
  *Closes:* the run's first formal award off `d = 4`, the first reparametrization
  of the C3 incidence chain, and the first uniform-in-`d` statement in the run's
  Lean corpus. *Risk:* low — every lemma has a kernel-verified analogue and the
  certificate is verified four ways.
- **U-C2-02 `WINDOW-ACYCLICITY-BOUND`** (the real mathematics). Attack
  `ν = τ = 6` at `d = 5` with a forest-specific fiber bound at exactly
  `k = r−1`, using acyclicity to bound the spread of `N(S) ∩ B` for `S ⊆ C`
  strictly better than `−Cat_{k−|S|}`; the natural candidate is the acyclicity
  inequality `Σ_{b∈B}(deg b − 1) ≤ |C| − 1 − e_C`. Mandatory instruments: the
  4,065 / 192,015 / 1,489,237 crossing window forests at `r = 6, 8, 10` as the
  positive test set; the 13-vertex `τ = 5` graph as the **negative control any
  acyclicity-free proposal must fail**; the `x(F) = r−1` narrowing as the first
  target. *Closes:* the diagnostic band
  `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` outright, and — since the same
  ingredient is what the `(5,5)` exceptional cells need — a Lean-renderable S10
  as a byproduct, putting S12 on the Stage 7 track in Cycle 3. *Risk:* high;
  this is where genuinely new mathematical content is required.
- **U-C2-03 `UNIFORM-CERTIFICATE-POSITIVITY`** (Tier 3a). Prove, for all `d`,
  that the cleared decision polynomial `Q_{m,d}(t)` of the recursion `ε₀ = 0`,
  `ε_{j+1} = (j+1)[(K+1−2j) + ε_j(t+j)] / [2(m−j)(t+K+1−j)]`,
  `Q := ε_m·(t+m) − (d−1)`, has non-negative coefficients **iff** `3d ≤ 2m+2`;
  the asymptotic half is the finite recursion
  `e_{j+1} = (j+1)(K+1−2j+e_j)/(2(m−j))`, and the second-order half decides the
  odd-`d` boundary cases `(3,3), (6,5), (9,7), (12,9)` where the asymptotic
  margin is exactly zero. In the same cycle: repair and compile the four
  reparametrized incidence lemmas with `hd : d ≤ 2m` (or the exact cardinality
  coefficient), delete the vacuous `hK`, and fix the `j > r+1` over-constraint.
  *Closes:* Tier 3a in full and a second Lean award. *Risk:* medium — a single
  symbolic-positivity claim about an explicit rational recursion, already swept
  exactly to `d = 16` here and `d ≤ 27` by a Stage 4 critic. **Ruling on the
  dispatch's question: the `(m,d)`-uniform closed form is a Cycle 2 route, not
  already in reach** — per-`(m,d)` existence is solved, the uniform statement is
  unproved, and one incidence lemma is false as written.
- **U-C2-04 `G1-RESIDUAL-BAND-SWEEP`** (Tier 3c, over the guards). Build on S18
  and S19. C2 and C3 already close `d' = 2` and `d' = 4` with kernel-verified
  theorems; U-C2-01/02 close `d' = 5`. Target `d' = 3` — the second band,
  informal in the record and never formalized, where `c(3) = 3` and
  `m_bare(3) = 4` give an **empty** window, so the band may be closable by the
  dichotomy alone — and `d' = 6`, whose window is `{7}` and whose cover side
  needs eleven exceptional cells at `r ≤ 12`, all within census reach and
  materially easier than `(7,7)`'s seventy. Formalize S18 extensionally, closing
  the entry-29 and entry-186 citation gaps. *Closes:* an unconditional theorem
  that every ordinary G1 counterexample has residual excess `d' ≥ 6` — a Tier 3
  shrinkage stated over the **actual G1 guards**, which is exactly what the
  contract's Tier 3 asks for.

---

## Continuation ruling

```text
continue: yes
```

Proceed to Cycle 2 under the portfolio above. The stop gate, armed at this
close, found **no decisive event** — Tier 1 and Tier 2 are untouched, no exact
counterexample exists anywhere in the record, and the reductions produced shrink
the class only at fixed bands and fixed `(τ,d)` cells while the Tier-3c window
provably widens for `d ≥ 8` — and **no plateau**, which at Cycle 1 requires
evidence of no material progress over two consecutive cycles and could not be
met on its own terms, and which the evidence contradicts in any case. Under the
gate as armed, `continue: no` would require `plateau: yes` or
`headline_resolved: yes`; neither holds.

**Earliest honest continuation obligations, stated exactly.**

1. **Tier 3a.** Prove coefficientwise non-negativity of `Q_{m,d}(t)` iff
   `3d ≤ 2m+2` for **all** `d`, equivalently the closing inequality
   `μ_{m−1} ≥ (d−1)/(m(t+m))` at `m = ⌈3d/2⌉−1` for all `t ≥ 0`; ship the
   `r < m` vanishing argument; repair `outside_incidence_general` with
   `hd : d ≤ 2m`.
2. **Tier 3b.** Close the **73** finite cells at `τ ∈ {6,7}`, `k = r−1`,
   `d ∈ {6,7,8}`, orders 18–147, by cover-structured enumeration; formalise the
   general-`τ` power-set expansion; guard the theorem by `k < r`.
3. **Tier 3c.** Explain why the window widens, and state
   `E993-R25-WINDOW-REDUCTION` over the **bare** matching branch per controller
   ruling (3), with the widening recorded against it.
4. **Diagnostic band.** Prove that no forest `F` with `|V(F)| = 2r+5`,
   `ν(F) = τ(F) = 6` and `x(F) < r` has `Δ_r(F) > 0`, against a lower bound
   whose `S = ∅` fiber contributes **exactly zero** at `k = r−1` (since
   `|B| = 2r−1` and `C(2r−1,r) = C(2r−1,r−1)`). The lemma cannot be an
   emptiness argument (the window is generic), cannot be a tightening of the
   generic Catalan estimate (which is negative there), and cannot be
   graph-general (the 13-vertex witness). It must be a forest-acyclicity-
   sharpened fiber bound at exactly `k = r−1`, or a genuine use of `x(F) < r`.
5. **Tier 2.** Attack realizability only; the Δ-level abstraction is now known
   to be empty. Measure against the S17 baseline (Tier 1 ⟹ Tier 2 on guards 9
   and 10 alone), and target `d' = 3` and `d' ≥ 6` over the actual guards.
6. **Tier 1.** Make the crossing hypothesis do work. The registered open upper
   crossing-shift bound must be created and attacked; nothing in Cycle 1 used
   `x(F) < r` positively.
7. **Stage 7.** Take award group A through the governed `lean-proof-workflow`
   with the nine named lemmas and every excluded conclusion stated in the frozen
   contract; bundle group B.

**Controller items carried up.** (i) The FOURTH-BAND rename binds every
registration derived from the `E993-C3-FIFTH-BAND-*` candidates; the sealed
return is not edited. (ii) The claim-identity separation between the
matching-branch contract and the CONDITIONAL
`E993-G1-MATCHING-COMPARATOR-SUFFICIENT` must be recorded before registration.
(iii) Decide whether to correct the off-by-one illustrative index in
`SOLUTION-CONTRACT.md` §1 Tier 3 (`Δ_{p−2}(U)` should read `Δ_{p−1}(U)`) and to
restate the Stage 1 gate's dominance criterion with its index range `j ≥ 1`.
(iv) Reconcile `control/EXTERNAL-PATH-ALLOWLIST.txt` with the path checker's own
`allowed_external_roots`. (v) Either admit `control/C1-ALLOCATION.md` to the
Stage 4/5 capsules or stop requiring verbatim quotation from it. (vi) Carry the
canonicalized figures and struck literals as an erratum record so Cycle 2 quotes
the canonical values, never the sealed ones. (vii) Recompute the `τ ≤ 3`
graph-scope violator count under one isomorphism convention before either
number (18 or 62) is quoted. (viii) **A headline resolution fails automatic
admission and is inspected by the controller by hand** — recorded here for the
Cycle 2 close; none arose at this one.

---

## Artifact inventory

All of this seat's scratch is under the **absolute** in-root path
`<run root>/scratchpad/S-C1/`. Python 3 standard library only; deterministic;
exact integer and `fractions.Fraction` arithmetic throughout — **no floating
point enters any count, coefficient, first descent, threshold or inequality
test**. No wall-clock value is written to any file. No sampling in any
exhaustive claim. No network. No system temporary directory, no
temporary-directory environment variable, and no temporary-directory command
was used at any point. No file under any seat's or adjudicator's scratch was
read or written.

| file | role |
|---|---|
| `verify_seals.py` | recomputes the Stage 6 dispatch seal canonically, re-hashes all 9 capsule members against disk (9/9, 0 mismatches), and recomputes the Stage 5, Stage 4, Stage 3 and Stage 2 packet seals from their own contents |
| `synth_checks.py` | independent synthesis instrument: `Γ(τ,k)` and `K(τ)`; both readings of the dominance criterion in exact rationals; the cover-branch exceptional-cell tables and their reduction to the 73 residual points; exact independence polynomials, first descents, matching numbers and cover numbers by brute force; `P_8`; `4K₂`; the six- and seven-edge `d = 5` comparators with `x` on every row; `8·K_{1,3}`; both corrected edge lists for the order-15 window witness; the exact-rational Farkas greedy and the least-feasible-`m` table for `d = 2…16`; the perfect-matching lemma and its sharpness on `mK₂`; the integer window table |
| `SYNTH-CHECKS.json` | output of `synth_checks.py` |

**Replay** (copy-out-first is unnecessary — nothing is written outside this
seat's own directory; every target stays inside the run root; no arguments
needed):

```
cd <run root>/scratchpad/S-C1
python3 verify_seals.py
python3 synth_checks.py > SYNTH-CHECKS.json
```

**Read set actually used.** The nine capsule members (`SEMANTIC-CONTRACT.md`;
`SOLUTION-CONTRACT.md`; `control/C1-STAGE1-GATE.md`;
`control/C1-STAGE5-PACKET-MANIFEST.json`; `control/C1-SYNTHESIS-PROTOCOL.md`;
`control/PATH-CHECK-c1-stage6-dispatch.json`; the three Stage 5 adjudications);
run-root authority under `sources/` (`sources/g1/lean/g1-c3-third-wide/` for the
frozen C3 binder forms, `sources/fixtures/KL-FIXTURES.md`,
`sources/authority/CLAIM-IDENTITY.json`, `sources/authority/LEDGER.md`);
`control/CLAIM-IDENTITY.run-local.json`; and, for the mandatory VerityOS boot,
the root constitution and startup protocol. The four upstream stage manifests
were hashed for the custody chain and their member lists inspected; **no raw
return, no critique, no seat scratch, no other adjudication, no prior synthesis,
no failed lineage, no other experiment root, no manuscript and no external
source was opened.**

**Files written by this seat:** exactly one under `cycles/` —
`cycles/cycle-1/stage6/SYNTHESIS.md` — plus the scratch inventoried above.

**Background jobs:** none started at any point; none required killing before
this write. **This file was reread before close:** the eleven protocol headings
are present and in order, the four required lines (`headline_resolved: no`,
`material_progress: yes`, `plateau: no`, `continue: yes`) each appear exactly
once, the model disclosure line is present, no literal filesystem path outside
the run root appears anywhere, and every numeric claim was re-checked against
the recorded output of the instrument above.
