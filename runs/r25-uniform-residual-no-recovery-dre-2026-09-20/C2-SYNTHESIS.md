# Cycle 2 Neutral Synthesis

Cycle 2, Stage 6, neutral synthesis seat. Run
`erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted before any
substantive work by reading `verity.md` (root constitution) and
`identity/startup-protocol.md` (startup sequence), per the mandatory-boot rule
in the repository's `CLAUDE.md`. Per the startup protocol's task-type map this
is bounded work inside an already-chartered `experiments/` run, so the only
subsystem loaded beyond the two boot files is `experiments/` — this run root's
`control/`, `sources/`, `cycles/` and `scratchpad/`. No durable VerityOS
memory, knowledge, decision, skill, module, project, identity or writing change
is proposed, so no `inbox/` routing applies; this seat writes one file under
`cycles/` plus its own scratch.

**Model disclosure.**
chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

**Child delegation:** none (forbidden and not used). No subagent, no network,
no external source.

**Background jobs:** none started at any point. Every computation was
foreground and had exited before this file was written; a process check
immediately before the write found no process belonging to this seat (the one
long-running interpreter on the host is an unrelated service predating this
run by weeks, and nothing belonging to any other seat was signalled or
touched).

---

## Identity and seal audit

**Stage 6 dispatch capsule seal (reported as required):**
`a5e97398e1e1c0b3401df88b746732f621482bb8cbde38f3c3708a3610e61875`.

Recomputed canonically — SHA-256 of the compact key-sorted JSON of
`control/C2-STAGE6-DISPATCH-MANIFEST.json` minus `seal_sha256`,
`sort_keys=True`, `separators=(",",":")`, no trailing newline — and it equals
both the value stored in the manifest and the value given on dispatch.

| object | recomputed | dispatch value | result |
|---|---|---|---|
| Stage 6 dispatch `control/C2-STAGE6-DISPATCH-MANIFEST.json` | `a5e97398e1e1c0b3401df88b746732f621482bb8cbde38f3c3708a3610e61875` | same | **match** |
| Stage 5 packet `control/C2-STAGE5-PACKET-MANIFEST.json` | `9db079d7ebad5a37fd456883a64a2b58764e82e7fdf22145f533a1ec6db46872` | same | **match** |
| Stage 4 packet `control/C2-STAGE4-PACKET-MANIFEST.json` | `e121251ba5cbc0aad0749a9cb37d618b751ff52c9c21882643baad30ae301fac` | same | **match** |
| Stage 3 packet `control/C2-STAGE3-PACKET-MANIFEST.json` | `c24bc815bf12c260497462407272e3683eedeffeeda99f8b50d38f84af60f76a` | same | **match** |
| Stage 2 packet `control/C2-STAGE2-PACKET-MANIFEST.json` | `116a3be251dc0d603ed775aa4b7d695b34fe47521f2eaa5427efece9affbe6a3` | same | **match** |

**Member digests: 9 of 9 verify** on SHA-256 *and* byte count against disk;
0 missing, 0 mismatched; `file_count: 9` equals the length of the `files`
array.

| member | bytes | sha256 |
|---|---|---|
| `SEMANTIC-CONTRACT.md` | 4261 | `3bbeae0777006c9a4479f9976881f597373867782fe71157166dc75cb306aab3` |
| `SOLUTION-CONTRACT.md` | 8321 | `129225220caacf942bea2ad4d8e56548924897f3ab7a910b55e715c2e8c4c00f` |
| `control/C2-STAGE1-GATE.md` | 7429 | `6252d0b84cc9de14efd67fe77b10ae53fe5baaa82c87b98286e370d2f2de7a9d` |
| `control/C2-STAGE5-PACKET-MANIFEST.json` | 2741 | `3c8cca15f3aa087d181d309984c2b8237ee383734ff2945fa25bbae05654ba01` |
| `control/C2-SYNTHESIS-PROTOCOL.md` | 3282 | `de3391a7880cb78fa2b3ae4e9777f80d72556df8a408deb68358c496d43eecfe` |
| `control/PATH-CHECK-c2-stage6-dispatch.json` | 537 | `5174f2648d6e2268add5e6a2b3c9c8081fb5db34b6413db3047086734e510f20` |
| `cycles/cycle-2/stage5/adjudicators/F/ADJUDICATION.md` | 96264 | `a5d22d9261ce2fac167a0f3b2b44d5f4c36084ed8d760ad5f8fa9731eb4f353c` |
| `cycles/cycle-2/stage5/adjudicators/T/ADJUDICATION.md` | 103412 | `83a0f1074acceac9857d85f29dc9f2ee1a9f951c2668b1b529c4a6bd66415543` |
| `cycles/cycle-2/stage5/adjudicators/U/ADJUDICATION.md` | 94843 | `6e7516b76e66f52a58038cf063b4a364c484bc4583fd9756d54c6a9a601d5dd0` |

The three adjudication digests are identical to the values the Stage 5 packet
manifest independently carries, so the chain Stage 2 → Stage 3 → Stage 4 →
Stage 5 → Stage 6 is unbroken at every link this seat can see.

**Path evidence.** `control/PATH-CHECK-c2-stage6-dispatch.json`: 8 files
scanned, `files_with_findings: 0`, `finding_count: 0`, `findings: []`,
`pruned_roots: []`. Clean.

**Read boundary honoured.** Read: the nine capsule members; run-root authority
(`SOLUTION-CONTRACT-ADDENDUM-1.md`; `sources/fixtures/KL-FIXTURES.md`;
`control/CLAIM-IDENTITY.run-local.json`; `control/C1-CENSUS-ERRATA.json`;
`control/C2-ALLOCATION.md`; `cycles/cycle-1/stage6/SYNTHESIS.md`;
`cycles/cycle-1/stage7/LEAN-GATE-CLOSEOUT.md`). **No raw return, no critique,
no seat or adjudicator scratch, no failed lineage, no other experiment root, no
manuscript, no repository state beyond the two boot files, and no external
source was opened.** No network. All of this seat's scratch is under the
absolute in-root path `<run root>/scratchpad/S-C2/`; no system temporary
directory, no temporary-directory environment variable and no
temporary-directory command was used anywhere. No literal filesystem path
outside the run root appears in this file.

**Adjudicator statuses accepted as given.** All three adjudications carry the
required model disclosure verbatim, report their own capsule seals (T
`272dcfff59221b3b5ea0d0161d343666509f373182e634d539b5392711b6d1ea`, F
`9538dbd118415b3a37a37dd18ac51ec55ae1fdd28ac0ef36bcfb7aeb2d240133`, U
`cbb4d831b10067cdcdfcd61fa9df3f183de067e9021b2e8c3823bb2e3b80f2d2`), record
20/20 member verification, and declare no child delegation. Those capsule
manifests are **not** members of this seat's capsule, so their seals are
recorded on adjudicator authority and are not re-verified here. One
transcription defect recorded so that no later seat quotes it: the F
adjudication's seal-chain table abbreviates its capsule seal with a tail that
does not match the full value it states three lines above; the full value in
the fenced block is the one of record.

**Two clone residues in this seat's own protocol**, recorded rather than
followed silently: `control/C2-SYNTHESIS-PROTOCOL.md` directs scratch to
`<run root>/scratchpad/S-C1` (the Cycle 1 seat's directory) and glosses
`continue: yes` as "proceed to Cycle 2". The dispatch record directs
`<run root>/scratchpad/S-C2/` and Cycle 3; the dispatch governs, and this seat
wrote nothing into the Cycle 1 seat's directory. Controller item for the
Cycle 3 builder.

**This seat's own instrument.** `<run root>/scratchpad/S-C2/synth_lib.py` and
four drivers: exact integer and `fractions.Fraction` arithmetic only, no
floating point in any decision, no sampling in any exhaustive claim, no
wall-clock field in any output. Independence polynomials are computed two
ways (rooted two-state forest DP; deletion recursion with component
factorisation) and cross-validated before use. **119 of 119 recorded checks
pass**, plus four cross-orientation checks reported below. Full disclosure of
two corrections made to this seat's own expected values is in the artifact
inventory.

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
TRS2, no real-rootedness, no convolution closure, no imported forest
unimodality, no pointwise addability, no every-vertex SR2 used as a proof
device, no raw edge-addition monotonicity carried forward, no factor-two
margin, and no comparator failure offered as a counterexample to a crossing
theorem. Tier separation is clean: no status transfers between tiers, between
forests and G1 tuples, or to FOREST, TREE, TRANSFER, `OB-G1`, `E993-BETA-AGG`
or Erdős #993. **No recovering forest exists anywhere in the Cycle 2 record**,
in any orientation, on any instrument — every refutation witness, every census
row and every constructed family has `Δ_r < 0`.

I reproduced the fixed points myself: `P_8` has `i = (1,8,21,20,5)`, `x = 2`,
`Δ_3 = −15`; `4K₂` has `i = (1,8,24,32,16)`, `Δ_2 = +8`, `x = 3 = r+1`; the
registered `d = 5` fence `6K₂ ∪ (2r−7)K₁` has `Δ_r = 32, 68, 164, 431, 1204,
3520` at `r = 4…9` with `x = r+1` on every row; the companion
`7K₂ ∪ (2r−9)K₁` has `Δ_r = −112, −376, −1252, −4214, −14381` at `r = 5…9`.
I also verified the registry statuses this synthesis relies on by a direct
programmatic read of `control/CLAIM-IDENTITY.run-local.json` (295 claims):
Tier 1, Tier 2, both Tier 3 schemas, the window reduction, the diagnostic band
and `E993-THEOREM-B` are **OPEN**; the two Cycle 1 awards are **VERIFIED**;
`E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`, `E993-UNIV-TREE-TRS2` and
`E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE` are **REFUTED**;
`E993-G1-MATCHING-COMPARATOR-SUFFICIENT` and `E993-TRANSFER-TO-FOREST` are
**CONDITIONAL**. The T adjudication could not read that file (2.1 MB exceeds
its single-read limit) and relied on its critics; this seat's direct read
confirms every status the T adjudication relied on.

### R2. The T2 paired split — controller ruling (1) applied

`C-T2-U` returned `retained_narrowed`, `C-T2-F` returned `rejected`; the T
adjudicator ruled `retained_narrowed` on a stated severability rule and
adopted `C-T2-F`'s substantive findings in full, including the three
`C-T2-U` does not hold (the exhaustive `(7,7)` minima at `r = 8,9,10`; the
diagnosis that assumption (W1)'s justification is an instance of the fenced
raw edge-addition monotonicity; and the corrected thresholds). Controller
ruling (1) sustains that resolution and it stands. I record that the two
critics had **no mathematical disagreement anywhere** — their independent
full-space minima at the `(6,6)` block agree digit for digit at all seven
cells — so the split was over disposition only, and the severability rule is
the right instrument for it: a single valid witness refutes a universal claim
regardless of the search that found it.

### R3. The cover branch — the cycle's decisive movement, reached independently by two orientations

Controller ruling (2) is the ruling of record and I apply it:
`c(d) = min(d,5)` for forests (guard `k < r`) is a **theorem**; `c(6) = 5`
exactly; the diagonal `c(d) = d` is **refuted at every `d ≥ 6`**; strong
sharpness `c(d) = 5` is established **only at `d = 6`**; `c(7) ∈ {5,6}` with
bounded evidence for `6`; `5 ≤ c(d) ≤ 7` for `d ≥ 8`; the corrected 73-cell
census is **8 closed / 28 refuted / 37 undetermined**; the registered `d = 6`
window's lower end moves to **6** and the Tier-3c window widens at every
`d ≥ 6`.

I verified the witnesses myself, every hypothesis by exact counts on my own
instrument: the `(6,6)` witnesses at `r = 9` (order 24, leaf vector
`(2,3,3,3,3,3)`, `τ = ν = 6` with `τ` by exhaustive exclusion of every cover of
size `≤ 5`, `Δ_8 = −78`, `x = 8 < 9`, `Δ_9 < 0`) and at `r = 10` (order 26,
`Δ_9 = −235`, `x = 9 < 10`, `Δ_10 < 0`); the `(7,7)` single-full-hub witness at
`r = 9` (order 25, `τ = ν = 7`, `Δ_8 = −252`, `x = 8 < 9`); and the registered
`c(8) ≤ 7` instance `8·K_{1,3}` (order 32, `Σ i_k = 9^8`, `τ = ν = 8`,
`Δ_11 = −31822`, `Δ_12 = −1145354`, `x = 11 < 12`). None recovers.

**The cross-orientation identification neither adjudicator could make.** T's
`(7,7)` refuted band `r = 8…33` comes from connected connector-tree and
single-full-hub skeletons. F's decisive result is a *different* object reached
by a *different* mechanism: `C-F3-T`'s drift-directed knapsack over
non-isomorphic tree cores produced `W = T₁₆ ⊔ T₁₃`, a **disconnected
two-component high-drift core** of order 29, which with isolated padding closes
`(7,7)` at `r = 11…15`. I reproduced all five of F's cell values from `W`'s own
shipped coefficient vector by `I(W ∪ jK₁) = I(W)(1+z)^j` — `−6353, −15495,
−34762, −63174, −38636`, every one with `x = r−1 < r` and `Δ_r < 0` — on an
instrument independent of the F seat, its critic and its adjudicator.

Two consequences follow, and only this seat is positioned to state them.

1. **The two orientations' counts are not additive.** F's five cells
   (`(7,7)`, `r = 11…15`) lie strictly inside T's refuted band
   (`(7,7)`, `r = 8…33`). The controller's canonical census 8/28/37 already
   absorbs them: `28 = 2` at `(6,6)` `r = 9,10` plus `26` at `(7,7)`
   `r = 8…33`. **F's "5 closed negatively, 68 open" is superseded by the
   canonical 8/28/37** and must not be quoted alongside it.
2. **The refutation of `c(d) = min(d,7)` does not depend on the single-hub
   conjecture.** Two structurally disjoint construction classes — a connected
   single-hub skeleton and a disconnected two-component core — refute the same
   five cells independently. That is a materially stronger position than either
   adjudication records.

**And a test of T's own conjecture that only this seat could run.** T retains
the single-full-hub skeleton as a *conjectured* worst case at `k = r−1` and
allocates `T-C3-03` to prove it; F's witness is outside that family. I
minimised `Δ_{r−1}` exhaustively over every leaf partition and every isolated
padding of the single-full-hub family at exactly F's five cells:
`−17458, −52899, −163075, −509875, −1612675` at `r = 11…15`, each **strictly
below** F's witness. **T's single-hub worst-case conjecture survives F's
counterexample**, and my `r = 11` and `r = 15` minima reproduce two of the four
`(7,7)` family values the T adjudication quotes (`−17458`, `−1612675`) exactly,
as does `−252` at `r = 9`. `T-C3-03` may therefore proceed, and must be told
that the disconnected high-drift core is a member of the full space it has to
dominate.

**Where I record a precise divergence between two adjudications.** The U
adjudication writes, on controller authority from the T orientation, that "the
forest cover threshold is `c(d) = min(d,5)` **exactly**", and uses that to
declare the 73-cell set "a dead conjecture's residue" and to instruct that no
Cycle 3 route be chartered to close it. The T adjudication, which owns the
evidence, is explicitly narrower: `c(6) = 5` exactly; `c(7) ≤ 6` with
`c(7) = 6` a **conjecture**; `c(d) ≤ d−1` for `d ≥ 8` — and it flags the
stronger phrasing as a controller item rather than smoothing it over. **I rule
with T, and controller ruling (2) agrees:** `c(d) = min(d,5)` is the proved
theorem and is exactly sharp **at `d = 6` only**; at `d ≥ 7` only upper bounds
are established (`c(7) ∈ {5,6}`, `5 ≤ c(d) ≤ 7` for `d ≥ 8`). U's "exactly" at
every `d` is **struck**. The operational consequence is the reconciliation of
the three orientations' conflicting instructions about the cells, in R4.

### R4. What Cycle 3 may and may not do with the 73 cells — a three-way divergence, ruled

T allocates `T-C3-03` to settle the 37 undetermined cells and determine `c(7)`
and `c(d ≥ 8)` exactly. F allocates `F-C3-01` to partition "the 68 remaining
open cells" by drift-directed search. U instructs: "**Do not** re-charter any
route to 'close the 73 cover cells'."

**Ruling.** All three are partly right and the reconciliation is exact. U is
right that closing the cells *as a proof of `c(d) = min(d,7)`* is chartered to
prove a statement now known false, and any such charter is void. T and F are
right that the cells still carry live information — they are precisely what
determines `c(7)` and the exact **lower end of the Tier-3c window at every
`d ≥ 6`**, which is a quantity every window-reduction statement consumes.
Therefore the Cycle 3 charter is **"determine `c(d)` exactly for `d ≥ 7`"**,
with the 37 undetermined cells and the 8 closed ones as the instrument, and
never "close the 73 cells". F must be told the canonical census is 8/28/37,
not 5/68.

### R5. The Tier-3c window, restated and widened for a second consecutive cycle

I recomputed the window `ν ∈ [c(d)+1, m(d)−1]` from the **proved** threshold
`c(d) = min(d,5)` and `m(d) = ⌈3d/2⌉−1`:

| `d` | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| window | ∅ | ∅ | ∅ | `{6}` | `[6,7]` | `[6,9]` | `[6,10]` | `[6,12]` | `[6,13]` | `[6,15]` | `[6,16]` |
| width | 0 | 0 | 0 | 1 | 2 | 4 | 5 | 7 | 8 | 10 | 11 |
| width under the now-refuted `min(d,7)` | 0 | 0 | 0 | 1 | 1 | 2 | 3 | 5 | 6 | 8 | 9 |

The `d = 2, 3, 4` windows are empty either way. The `d = 5` window `{6}` is
**untouched** (`c(5) = 5` is inside the theorem and the refutations begin at
`d = 6`). **The registered `d = 6` window `{7}` has the wrong lower end and
must be restated `{6,7}` before any route consumes the `d = 6` band.** Slope
stays `3/2`; the widening is materially negative for
`E993-R25-WINDOW-REDUCTION` for the second cycle running and raises the bar on
`SOLUTION-CONTRACT.md` §1 Tier 3's "strictly smaller class" criterion again.

### R6. Tier 3a — T and U proved two halves of one object, and the alias is now resolved

Controller ruling (3) records that the U adjudicator verified `Q_{m,d}`
coefficientwise nonnegative **iff** `3d ≤ 2m+2` (critic-attributed to
`C-U3-T`), with certificate existence still needing the dual-sign lemma
because the greedy dual has negative multipliers for `d ≥ 7`. Separately the T
adjudicator established, critic-attributed to `C-T1-U`, that
`[t^m]P_{m,d} = m!·3^{m−1}(2m−3d+3)`, positive **iff** `3d ≤ 2m+2` — the
*necessity* half uniform in `d` — and demanded an alias check against
U-C2-03's `e_m` before any registration.

**I performed the alias check and it resolves to one object.** I implemented
the charter recursion independently as integer `N_j / D_j` polynomial pairs and
computed the cleared polynomial. For every `m ≤ 25` and every `0 ≤ d ≤ 2m`, the
coefficient of `t^m` in the cleared recursion is exactly
`m!·3^{m−1}(2m−3d+3)`, and `deg Q ≤ m`. **T's `P_{m,d}` and U's `Q_{m,d}` are
the same cleared polynomial and T's E1 is the leading-coefficient half of U's
E8.** Consequences, ruled:

- **U's E8 subsumes T's E1.** One registration, not two. The alias check T
  demanded is discharged here.
- **U's E8 closes T's open degeneracy rider.** T records the family
  `(m,d) = (3j, 2j+1)` where the coefficient is exactly 0 and the degree drops,
  and leaves it as a rider. U's E8 settles it: on that family
  `[t^{m−1}]Q = −4m·m!·3^{m−3} < 0`, which I verified for `j = 1…5` against the
  independent recursion, so the predicate is decided there too and the three
  cases `3d ≤ 2m+2`, `= 2m+3`, `≥ 2m+4` are exhaustive.
- **The threshold is produced, not imported.** I re-ran the AM–GM pairing step:
  the reflection `G_i = G_{K+1−i}` and the window involution reduce positivity
  to `3ab ≤ (m+1)(m+1−d)` with `a+b = d`, and `3d ≤ 2m+2` falls out as exactly
  what the inequality needs. I confirm coefficientwise nonnegativity `⟺
  3d ≤ 2m+2` by direct inspection on every cell with `m ≤ 20`,
  `0 ≤ d ≤ 2m`, zero mismatches, and the leading-coefficient identity to
  `m ≤ 25`.
- **The open node is now two named nodes, not one undifferentiated gap.** The
  **dual-sign lemma** (T's finding: `λ_j < 0` at `d = 7` and every
  `d = 9…30` tested, so `Q` is the *unconstrained relaxation* there) and the
  **LP-encoding fidelity step** (U's finding: nobody has proved the
  `A_j, B_j, E_j` weights solve the column equations identically in `m, d, j`;
  verified at `(7,5)` only). This is a real reduction of the obligation even
  though the tier does not move, and it is the single most important
  qualification in the cycle: **E8 is a theorem about a recursion, not about
  graphs.**
- **T's sign-constrained repair is the correct redirection** (critic-attributed
  to `C-T1-F`): clamping `λ_j` at 0 gives the exact maximiser of `μ_{m−1}` over
  non-negative dual points, and where the clamp binds the requirement reduces to
  `m(t+m) ≥ 2(d−1)`, already true at `t = 0` with slack `m² − 2(d−1) > 0` for
  every `d = 2…200`. I confirm `m(d) = ⌈3d/2⌉−1` is exactly the least `m` with
  `3d ≤ 2m+2` for `d = 2…16`, matching the Farkas boundary of Cycle 1.

### R7. The diagnostic band — a two-lemma proof plan, one lemma proved, the other stated exactly

This is the most consequential composition in the cycle and **no adjudication
states it, because no adjudication could see both halves.**

*Half one, proved.* U's E6, Lemma (L), critic-attributed to `C-U2-T` and
verified by the U adjudicator with two repairs: for every graph `G` with
`|V(G)| = 2r+5`, `τ(G) = ν(G) = 6` and `r ≥ 6`, `Δ_r(G) ≤ Δ_{r−1}(G)`; more
generally `Δ_k ≤ Δ_{k−1}` on `k ∈ [k₀(r), r]` with `r − k₀(r) = Θ(√r)`. Hence
unconditionally: every forest of order `2r+5` with `ν = τ = 6` and
`x(F) ≥ k₀(r) − 1` has `Δ_r(F) < 0`. **The residue of the band at `ν = τ = 6`
is therefore: no crossing forest in that class has `x(F) ≤ k₀(r) − 2`.**
Acyclicity is never used — the mechanism is Hall plus the binomial
second-difference sign rule.

*I re-derived it as an independent second reader,* which is exactly what
`C-U2-T` asks for and what the U adjudication names as the lemma's weakest
point ("no second reader"). I verified: the sign identity
`D(b,m) = C(b,m)[(b−2m)² − b − 2]/((m+1)(b−m+1))` on all 1,891 cells
`0 ≤ m ≤ b ≤ 60` with zero failures, plus both boundary cases `D(b,b+1) = 1`
and `D(b,m) = 0` for `m > b+1`; the over-count validity step
`max_{ρ≥j} D ≥ 0` for every `j = 1…6` and `r = 6…79`; `Bd(r) ≤ 0` for **every
`r` in `[6,260]`**, with the only positive values in `[4,260]` at `Bd(4) = +48`
and `Bd(5) = +33`, and `Bd(6) = −16`, `Bd(10) = −14406`; and
`r − k₀(r) = 1,1,2,3,4,5,6,9` at `r = 10,15,20,30,50,80,120,200`. **Every
figure reproduces exactly.** The lemma now has two independent readers.

*Half two, stated exactly but unproved.* F's R10, corroborated from outside the
constructing seat twice: across 3,020 distinct crossing forests on the
`τ = ν = d+1` stratum at `d = 5…12`, plus `C-F1-T`'s 5,181-instance richer
parametrization (553 crossing) and `C-F1-U`'s 8,456 random labelled on-stratum
forests (593 crossing), **every single crossing instance sits at `x = r−1`
exactly and not one with `x ≤ r−2` was ever constructed** — while
`control/C1-CENSUS-ERRATA.json` records 9,532 crossing forests with `x = r−2`
one band over, at `d = 4`, `r = 7`. F allocates `F-C3-04` to prove
`τ = d+1 ⟹ x ≥ r−1` or exhibit an `x ≤ r−2` witness.

**The composition, ruled.** Since `k₀(r) ≤ r`, we have `k₀(r) − 2 ≤ r − 2`. So
a proof that every crossing forest on the `τ = ν = 6`, order-`2r+5` stratum has
`x ≥ r−1` gives `x ≥ r−1 > r−2 ≥ k₀(r)−2` for every member, which is exactly
the residue Lemma (L) leaves. **Lemma (L) plus F's statement closes
`E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` at `ν = τ = 6`; composed with the
Cycle 1 *unconditional* `d = 5` window reduction (every crossing forest of
order `2r+5` with `Δ_r > 0` has `ν = τ = 6`), it closes the diagnostic band
outright.** And U4's `guardTranslation` then composes that mechanically into
the unconditional `d' ≥ 6` Tier 3c theorem over the actual ten G1 guards. The
Cycle 3 portfolio is built around this and the two routes are deconflicted in
`## Cycle 3 route portfolio`.

*Two riders that travel with it, both binding.* (i) Lemma (L) holds for
`r ≥ 6`; `r = 4, 5` rest on forest-only exhaustive enumeration and the
graph-scope question there is open. (ii) The concavity `C-U2-T` proves is
**local** (`k ∈ [k₀(r), r]`) and false for smaller `k`; it is a conclusion on
one class in one rank window, never an imported unimodality or log-concavity
premise, and the locality must travel with every downstream use.

### R8. Where the crossing hypothesis finally does positive work

Gate ruling 7 records that `x(F) < r` did no positive work anywhere in Cycle 1.
Cycle 2 changes this in exactly two places, and both are critic-derived.

1. **Inside the band (U, via `C-U2-T`).** Lemma (L)'s closure step consumes
   the crossing hypothesis as the negative seed `Δ_x < 0` and the
   second-difference monotonicity transports it to rank `r`. Moreover both U2
   critics prove that **no** acyclicity-only, crossing-free bound over the
   `ν = τ = 6`, order-`2r+5` class can ever be negative: the class maximum of
   `Δ_r` is positive and attained by the registered REFUTED fence
   `6K₂ ∪ (2r−7)K₁`. I verified the attainment identity
   `Σ_{j=0}^{6} C(6,j)[C(2r−1−j, r+1−j) − C(2r−1−j, r−j)] = Δ_r(6K₂ ∪ (2r−7)K₁)`
   at ten ranks to `r = 50`, and the class maxima `32/68/164/431/1204` at
   `r = 4…8`. **So the crossing hypothesis is not merely useful there — it is
   provably indispensable.**
2. **Toward Tier 1 (T, via `C-T4-U`).** The reduction of the leaf
   crossing-shift bound to the all-vertex forest form (★) of registered-OPEN
   `E993-THEOREM-B` is an `x`-to-`x` comparison doing load-bearing work. It is
   not yet `x(F) < r` inside a rank-indexed argument.

The allocation constraint therefore stands, **narrowed**: Tier 1 and Tier 2
remain crossing-conditioned, and the only two live bridges are the band's
second-difference chain and the excess-budget accounting, whose arithmetic this
cycle corrected (the residual excess after `d_F − 2` A-steps is exactly 2, not
0) and whose G-branch reorganisation both T4 critics show is asserted rather
than derived.

### R9. Tier 2 — realizability settled, the residue narrowed, and two censuses that do not reconcile

*Established, and consistent across orientations.* The G1 **structural triple**
(`p ≥ 6`, `|U| ≥ 2p+1`, `maxdeg(U) ≥ 3`) is realizable under the unweakened
ten-guard conjunction, order-minimal at **19** (T's E11, minimality
critic-attributed to `C-T3-F`: empty for every `n ≤ 18`, first inhabited at
`n = 19` by 785 tuples, all with `p = 7`, `maxdeg(U) = 3`, `d' = 5`). The
registered **four-condition necessary region** — which adds strict residual
recovery — is **not** realizable and is refuted by the route's own data; T
strikes "the necessary region is realizable" and the typed `REFUTES` verdict
accordingly. Guard 8, the only guard coupling `U` to the ambient tree, rejected
exactly **zero** of 19,800 combinations, which is the precise structural reason
the Tier 2 bridge did not fall. Zero recovery anywhere: over T's 14,103 + 342
tuples, `C-T3-F`'s grid to `maxdeg(U) = 13` and `d' = 82`, `C-T3-U`'s two-hub
family and family-free census, and U's 265,749 exhaustive ten-guard tuples.

*The `d' = 5` residue, ruled.* U's E11 is the statement of record: guards 9–10
plus the forest cover theorem force `ν(U) = τ(U) ≥ 6` on every `d' = 5`
residual; `ν ≥ 7` is discharged by the VERIFIED
`E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`; **`ν = τ = 6` is the unique
unresolved profile.** U4's stronger headline ("every `d' = 5` residual has
`ν = τ = 6`") is **false** and is refuted by an actual ten-guard tuple, which I
verified end to end from closed forms: `T = P₁₉`, `v = 0`, `s = 1`, `g = 2`;
`i_k(P₁₉) = (1,19,153,680,1820,3003,3003,1716,495,55,1)`; `Δ_5 = 0` is a
**plateau, not a descent**, so `x(T) = 6` and `p = 7`; guard 8 gives
`Δ_7(P₁₇) + Δ_6(P₁₆) = −627 < 0`; guard 9 gives `2p−3 = 11 < 15 = |U|`; guard
10 gives `x(P₁₅) = 4 < 5 = p−2`; `d' = 5`, `Δ_5(P₁₅) = −252 ≤ 0`, and
`ν(U) = τ(U) = 7`. The first-strict-descent convention is exactly what makes
the witness work — a direct confirmation that the `SEMANTIC-CONTRACT.md`
convention is load-bearing.

*Two cross-orientation items only this seat sees.*

- **A numeric discrepancy the controller must resolve.** T's `C-T3-F` reports
  an "exhaustive Beyer–Hedetniemi census of *every* ten-guard tuple to
  `n = 19`" totalling **224,403** tuples. U's `C-U4-F` reports an exhaustive
  ten-guard enumeration over all trees of order 8–19 totalling **265,749**,
  fully decomposed as `d' ∈ {2: 103,036, 3: 110,747, 4: 51,073, 5: 893}`. Both
  are presented as exhaustive over the same object. They differ by 41,346. I
  can partly locate the divergence: U's tree population **reconciles exactly**
  against the canonical figure — the canonical 522,959 trees of order ≤ 19
  minus the 25 trees of order 1–7 is exactly the 522,934 U's critic states — so
  the divergence is **not** in the tree census but in the tuple-counting
  convention (labelled `(v,s,g)` choices versus orbits under tree automorphism,
  or a different minimum order). Neither underlying return nor critique is in
  my read boundary. **Controller item for Cycle 3; neither figure may be quoted
  as "the" ten-guard population until it is settled.**
- **A corroboration, and a warning against conflating two populations.** T's
  785 order-19 structural-region tuples all have `d' = 5`, and U's exhaustive
  census finds 893 `d' = 5` tuples in total over orders 8–19: `785 ≤ 893`,
  consistent, and mutually corroborating across two instruments that never met.
  But T's E13 reports **sixteen** `d' = 5` structural-region rows with
  `ν(U) = τ(U) = 6` while U reports **five** of its 893 at that profile. These
  are different populations — T's family reaches beyond order 19, U's census
  stops there — so both stand, and **neither figure is "the number of `d' = 5`
  residuals in the band."**
- **T's E13 is the first place in the run where the G1 residual side and the
  diagnostic band are exhibited as the same objects** (sixteen rows at
  `d' = 5`, `ν = τ = 6`, `x = r−1`, all `Δ_r < 0`, one attaining `Δ_6 = −695`,
  the extremum of the canonical corrected range `[−695,−490]`). Together with
  R7 this makes the band's closure the single highest-leverage target in the
  run: it closes a Tier 3 target, and composes through `guardTranslation` into
  Tier 3c over the actual guards.

### R10. Tier 1 — the lead, and a cross-orientation corroboration on the hardest trees

T's E16 is the strongest Tier-1-directed object of the cycle and the route did
not produce it: let (★) be the **all-vertex forest form** of registered-OPEN
`E993-THEOREM-B` — for every finite forest `H` and every vertex `w`,
`x(H−w) ≥ x(H) − 1`. Then **(★) implies the leaf crossing-shift bound**
`x(F−v) ≤ x(F)`, by the deletion identity plus the observation that the support
`u` need not be a leaf of `F−v` — which is exactly why the all-vertex
quantifier is indispensable. (★) is verified exhaustively at order ≤ 17
(maximum of `x(F) − x(F−v)` over all 3,397,265 vertex instances is exactly 1,
in every degree class). So §7's grading line "`E993-THEOREM-B` — untouched,
out of charter: this route is the complement" is **wrong in substance**: the
two are not disjoint complements, and the Theorem-B direction implies the
chartered target.

I verified the supporting facts: the deletion identity
`Δ_k(F) = Δ_k(F−v) + Δ_{k−1}(F−N[v])` at every vertex of four graphs across
every integer rank including the `Δ_{−1} = 1` boundary, with zero mismatches
(and it is a **replay** of the registered VERIFIED
`E993-GRAPH-SR2-EXACT-AVERAGE-IDENTITIES`, claim 235, for every graph and every
vertex — neither acyclicity nor leafhood is a hypothesis); the all-vertex
refutation at `K_{1,3}` (`i = (1,4,3,1)`, `x = 1`; centre deleted gives `3K₁`,
`i = (1,3,3,1)`, `x = 2`), with the plateau convention load-bearing
(`Δ_1(3K₁) = 0` is not a descent); and the isolated-vertex bound as a theorem.

**The corroboration neither adjudicator could give.** F's R14 instantiates
`x(F−v) ≤ x(F)` on all 65 leaves of the five Kadrawi–Levit fixtures — the
registered **non-log-concave** trees, the one family where a crossing-shift
bound would most plausibly fail — with **0 violations**, saturated on 38 and
strict with shift `−1` on 27. F also **strikes the equality form** ("in every
single case tested `x(F−v) = x(F)` exactly"), which is false on 27 of 65. So
the Tier 1 lead is corroborated on the hardest registered objects, and
`T-C3-04` must receive the `≤` form and never the equality form. I verified the
five fixtures independently from the closed form and from an explicit forest DP
that agree: orders 26/28/30/32/34, `x = 8/9/9/10/11`, every crossing-rank
`Δ_r < 0`, `T(3,4,4)` with `Δ_7 = +17640`, `Δ_8 = −21232` and log-concavity
first failing at rank 13, and `ν = τ = 12,13,14,15,16` — every fixture far
above the cover branch's `τ ≤ 7` ceiling, which is why the family is
irrelevant to it by scope.

### R11. The scale-free thread — the instrument is wrong

F's cross-route item 6, which I adopt in full as a synthesis-level finding.
Five structurally independent families examined by three seats and four critics
all show `i_{r+1}/i_r` approaching 1 **from below** under crossing with **zero
recoveries**: the Cycle 1 matching-window family (`0.9899` at `n = 415`, on a
**rising** curve, not a ceiling); the padded double spider (`0.98972` at order
431, `r = 200`, `d = 31`); padded Kadrawi–Levit (`0.99686` at
`T(3,4,5) + 1280K₁`, order 1,308); iterated KL union (`0.974` at order 450); the
KL family in `k` (`0.9788` at `T(3,120,121)`, on a rising sawtooth). The ratio
is **unbounded below 1 in the `K₁`/`K₂` padding parameter, which provably
cannot create a recovery**, so it cannot discriminate: a "near-miss" measured
by it carries no information about whether Tier 1 can fail. The Cycle 1 `0.9899`
figure is retained only as the observed value at the largest shipped order, not
as a bound or a limit. **Recorded as a negative structural finding about the
run's own measurement**, and the real question underneath — is
`sup i_{r+1}/i_r` over crossing forests equal to 1 with the supremum
unattained, i.e. is `|Δ_r|` always positive but `o(i_r)`? — is a genuine Tier 3
structural question and is allocated as `F-C3-03`.

### R12. The critic-attribution finding — unanimous, and recorded for the controller

All three adjudications record it independently and it is the sharpest
non-mathematical fact of the cycle.

- **T**: of eighteen established results, **eleven** are critic-attributed in
  whole or part and **five** are wholly critic-derived; on two routes the
  single most valuable object came from a critic; three of four returns shipped
  certification literals their own generators do not back.
- **F**: the orientation's one decisive result is **critic-derived**, as are
  the double-star theorem, the drift explanation, the 18-vs-62 reconciliation,
  the `K₁`-extended star-forest enumeration, the guard-10 closure, the battery
  maximum and the `d = 15…30` verification; three of four seats delivered their
  conclusions on critic instruments.
- **U**: in **all four** routes the central load-bearing advance was supplied or
  corrected by the critics, and **in three of four the seat's own net-new
  mathematical claim did not survive**. U names the mechanism: routes ran at
  Sonnet 5 / xhigh and critics at Opus 5 / high, and the pattern tracks that
  split precisely. U recommends raising route model/effort for Cycle 3, or
  formally re-chartering the critic stage to include derivation with a
  second-reader requirement.

**I record this for the controller's Cycle 3 review as a unanimous seating and
effort-allocation finding, and rule that it is not a plateau** (see
`## Progress and stop-gate ruling`): the work is real and is being produced;
it is being produced by the wrong seats, which distorts attribution, loads the
critic stage with derivation it is not chartered for, and leaves the strongest
results — E8 and Lemma (L) — with very few readers. This synthesis has added
itself as the second reader to both.

### R13. Controller rulings (4), (5), (6) applied

- **Ruling (4), the "eleven".** Reconciled as `K(6) − 1 = 11` floor-failing
  cells at `τ = 6`, a different object from the 7 open `(6,6)` cover cells. I
  verified `K(6) = 12`, so the count is 11, and that they sit at `r = k+1` for
  `k = 1…11`, i.e. `r ∈ [2,12]` — matching allocation item 12's "eleven … at
  `r ≤ 12`" in both the count and the rank bound. The U adjudicator identified
  this provenance; the reconciliation should be recorded rather than the figure
  merely struck. I also verified the enabling identity
  `C(2k+2,k+1) − C(2k+2,k) = Cat_{k+1}` for `k ≤ 19`, which is what makes the
  floor at `r = k+1` equal to `Γ(τ,k)`, and the general cell counts
  `K(τ) − 1 = 1, 2, 3, 5, 11, 69` for `τ = 2…7`.
- **Ruling (5), the two control-side incidents.** The route allocation was
  absent from the twelve Stage 4 critic capsules while the dispatch described
  it as a member; the incident record stands as a controller-facing defect and
  the critics' reads are retroactively authorized. All three adjudications
  handle this identically and none charges a boundary breach. The clone-residue
  paragraph in the Cycle 2 critic common brief asserted a Cycle 2 Stage 3
  path-hygiene edit record that **does not exist**; **only this seat sees the
  full tally.** The residue named **four returns** (T3, F2, F3, U4); at least
  **eight critiques across two orientations repeated it as fact** and were
  struck — six in U (`C-U3-T`, `C-U3-F`, `C-U2-T`, `C-U2-F`, `C-U4-T`,
  `C-U4-F`) and two in F (`C-F1-T`, `C-F1-U`) — while `C-F2-T`, `C-F2-U`,
  `C-F3-T`, `C-T3-F` and `C-T3-U` correctly reported the record's absence. The
  controller's "four" refers to the four *returns* the residue named, not to
  four critiques. **Every Cycle 2 return is byte-identical to what its seat
  wrote**, and every Cycle 2 replay target was the in-root sibling directory the
  gate requires.
- **Ruling (6), canonical figures.** `control/C1-CENSUS-ERRATA.json` governs,
  extended by the Cycle 2 canonicalizations below. Where an adjudication's
  figure conflicts with the errata I use the errata; where two adjudications
  conflict I rule in R3, R6 and R9.

### R14. Disagreements recorded but not resolvable at this seat

- The 224,403 versus 265,749 ten-guard census totals (R9). Different
  conventions; neither derivable from the other inside my boundary.
- The F adjudication's abbreviated capsule-seal tail (identity and seal audit).
- `control/C2-SYNTHESIS-PROTOCOL.md`'s two Cycle 1 clone residues (identity and
  seal audit).
- The exact upper endpoint of the `(7,7)` refuted band. T establishes
  `r = 8…33` and explicitly does **not** establish 33 as exact; the band is
  bounded above by the Catalan ceiling, which forces positivity for `r ≥ 71`
  (`k ≥ K(7) = 70`, which I verified). The 37 undetermined cells are
  `(7,7)`, `r = 34…70`.
- My own independent enumeration of the raw generic-bound cells reproduces the
  adjudicated table exactly at every `(τ,d)` with `τ ≥ 4` and additionally
  finds **three raw cells at `τ ≤ 3`** — one at `(2,2)` (order 6) and two at
  `(3,3)` (orders 7 and 9) — which the adjudicated tables omit. All three are
  removed by the exhaustive order-17 censuses, so **the residual is 73 exactly
  either way**. This is the same class of pre-reduction bookkeeping artefact
  Cycle 1 recorded as the 102-versus-93 discrepancy; the reduction is
  unaffected and I canonicalize the residual, not the pre-reduction count.

---

## Exact established results

Grades follow `SOLUTION-CONTRACT.md` §4. **Nothing in this run is
`formally_verified` beyond the two Cycle 1 awards**; that grade is reachable
only through the governed `lean-proof-workflow`. Each result names where `d`,
`ν`, `τ` and `x(F) < r` enter. Critic-derived results carry attribution.
Numbering is `C2-n` to avoid collision with Cycle 1's `S1`–`S24`.

**C2-1 — The cover branch's threshold, and the death of the diagonal.**
`proved_informal` for the theorem; refutations by exhibited objects. *Statement
of record, unchanged:* for every finite forest `F` with `|V(F)| = 2r+d`,
`r ≥ 2`, `d ≥ 2` and `τ(F) ≤ min(d,5)`: `Δ_k(F) > 0` for every natural `k < r`,
hence `x(F) ≥ r`. The `k < r` guard (equivalently `r ≥ 2`) is mandatory.
*New this cycle:* **`c(d) = min(d,7)` and `c(d) = min(d,6)` are FALSE**, and
the diagonal `c(d) = d` is **refuted on forests at every `d ≥ 6`**. `c(6) = 5`
exactly, so the theorem's threshold is exactly sharp at the first `d` where the
conjecture differed from it. Strong sharpness is established **only at `d = 6`**;
`c(7) ∈ {5,6}` with bounded evidence for 6; `5 ≤ c(d) ≤ 7` for `d ≥ 8`
(controller ruling (2)). *Attribution:* the `(7,7)` witnesses at `r = 8…14` are
T2's own refutation; the `(6,6)` witnesses at `r = 9,10` and the `(7,7)`
extension to `r = 8…33` are **critic-attributed** (both T2 critics,
independently); the `(7,7)` disconnected high-drift witness at `r = 11…15` is
**critic-attributed** to `C-F3-T`; the `d ≥ 8` family is on controller
authority. *Parameters:* `τ = ν` is the hypothesis; `d` enters only through
`τ ≤ d`; `ν` only via König; **`x(F) < r` is a conclusion of each witness
(`x = r−1`), never a hypothesis**. **No witness recovers** — every one has
`Δ_r < 0` — so Tier 1 is untouched.

**C2-2 — The corrected 73-cell census.** `proved_informal` as a reduction, with
its three parts separately graded: **8 cells exhaustively closed** (`(6,6)`
`r = 6,7,8,11,12`; `(7,7)` `r = 6,7`; `(7,8)` `r = 5`); **28 cells refuted**
with explicit witnesses (`(6,6)` `r = 9,10`; `(7,7)` `r = 8…33`); **37 cells
genuinely undetermined** (`(7,7)` `r = 34…70`), closed by neither side and not
to be reported as closed. `8 + 28 + 37 = 73`. The band is finite: the Catalan
ceiling forces positivity for `r ≥ 71`. **F's five negatively-closed cells are
a subset of the 28, not an addition to them.** Every one of the 73 sits at
`k = r−1` — re-derived here independently.

**C2-3 — The Tier-3c window, restated under the proved threshold.**
`proved_informal` as arithmetic, conditional on the two branch theorems at each
`d`. Widths `0,0,0,1,2,4,5,7,8,10,11` for `d = 2…12`; **the registered `d = 6`
window `{7}` must become `{6,7}`**; the window widens at every `d ≥ 6` and the
slope is `3/2`. **Negative for `E993-R25-WINDOW-REDUCTION` for a second
consecutive cycle.**

**C2-4 — Tier 3a's algebraic core, uniform in `(m,d)`.** `proved_informal`,
**critic-attributed to `C-U3-T`**, verified step by step by the U adjudicator
and verified again here. For every integer `m ≥ 1` and `0 ≤ d ≤ 2m`,
`Q_{m,d}(t)` is coefficientwise nonnegative **iff** `3d ≤ 2m+2`. With the
closed form
`Q_{m,d} = m!·Σ_{i=0}^{m} 2^i(K+1−2i)C(m,i)·∏_{l=i+1}^{m}(t+l)·∏_{l=0}^{i−1}(t+K+1−l)`,
`K = 2m−d`; the coefficient `[t^m]Q = m!·3^{m−1}(2m−3d+3)`; and on the boundary
family `(3j, 2j+1)` the next coefficient `[t^{m−1}]Q = −4m·m!·3^{m−3} < 0`. The
threshold is **produced by** the AM–GM pairing, not imported. *Parameters:* `d`
enters only through `K = 2m−d` and the `−(d−1)` intercept; `t` (hence `r`) is
free; **`τ`, `ν` beyond `m`, and `x(F) < r` do not enter at all.**
**Two binding qualifications:** *(a)* controller ruling (3) — coefficientwise
positivity is the **unconstrained relaxation** of certificate feasibility, and
the greedy dual has negative multipliers for `d ≥ 7`, so certificate existence
still needs a **dual-sign lemma**; *(b)* the LP-encoding fidelity step is
verified at `(7,5)` only. **`E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` stays
OPEN.**

**C2-5 — The necessity half of the matching threshold, uniform in `d` — and it
is the same object as C2-4.** `proved_informal`, **critic-attributed to
`C-T1-U`**. `[t^m]P_{m,d} = m!·3^{m−1}(2m−3d+3)`, positive iff `3d ≤ 2m+2`,
i.e. iff `m ≥ ⌈3d/2⌉−1`, upgrading a figure the Stage 1 gate carries as bounded
at `d ≤ 16` to a theorem uniform in `d`. **Alias resolved at this seat: T's
`P_{m,d}` and U's `Q_{m,d}` are the same cleared polynomial, so C2-5 is the
leading-coefficient half of C2-4 and C2-4 subsumes it — one registration, and
C2-4 additionally closes C2-5's degeneracy rider on `(3j, 2j+1)`.** State it as
`[t^m]P` with `m ≥ 1`, never as "leading coefficient".

**C2-6 — The sign-constrained dual, and the reduced closing requirement.**
`proved_informal` per swept `(d,t)`, **critic-attributed to `C-T1-F`**,
independently confirmed by the T adjudicator. Clamping `λ_j` at 0 yields, by
monotonicity of the chain, the exact maximiser of `μ_{m−1}` over non-negative
dual points; that optimum satisfies `μ_{m−1} ≥ (d−1)/(m(t+m))` at every point
scanned (`d = 2…30`, integer `t ∈ [0,800]`), and **where the clamp binds the
requirement reduces to `m(t+m) ≥ 2(d−1)`**, which at `m = ⌈3d/2⌉−1` already
holds at `t = 0` with slack `m² − 2(d−1) > 0` for every `d = 2…200`. Graded
**bounded** as a statement over all `d`; it is the correct object for a uniform
proof and is the route's redirection.

**C2-7 — Vacuity and the three-way `r`-split.** `proved_informal`, uniform in
`(m,d)`, route-attributed (T1) with the band's closed form critic-attributed to
`C-T1-U`. The vacuity threshold is `r < m − d/2` (**not** the charter's loose
`r < m`). Between vacuity and the generic branch `r ≥ 2m−d` lies a non-vacuous
small-rank band `r ∈ [d−1, 2d−3]` (even `d`) and `[d, 2d−2]` (odd `d`), of
**width exactly `d−1`** — I verified the endpoints and the width for every
`d = 2…20`. **At even `d` the band's bottom rank `r = d−1` has order `2m` with
a perfect matching and `2m = 3r+1`, hence is closed by the registered VERIFIED
`E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN`** (verified here for every even
`d = 2…40`); at `d = 2` the whole band is closed. The genuinely open part is
`r ∈ [d, 2d−3]` (even `d`) and `[d, 2d−2]` (odd `d`), and the certificate
cannot reach it: at the band's low end `D_m(t) = 0` exactly and `r+1−m < 0`, so
no continuation from `t ≥ 0` gets there.

**C2-8 — Lemma (L): Hall-only second-difference concavity at `ν = τ = 6`.**
`proved_informal`, **critic-attributed to `C-U2-T`**, adjudicator-verified with
two repairs, and **re-derived here as an independent second reader**. For every
graph `G` with `|V(G)| = 2r+5`, `τ(G) = ν(G) = 6` and `r ≥ 6`:
`Δ_r(G) ≤ Δ_{r−1}(G)`. More generally `Δ_k ≤ Δ_{k−1}` for
`k ∈ [k₀(r), r]` with `r − k₀(r) = Θ(√r)` (`1,1,2,3,4,5,6,9` at
`r = 10,15,20,30,50,80,120,200`). Hence **unconditionally**: every forest of
order `2r+5` with `ν = τ = 6` and `x(F) ≥ k₀(r) − 1` has `Δ_r(F) < 0`.
**Acyclicity is never used** — the mechanism is Hall plus the binomial
second-difference sign rule. *Required repairs, binding:* carry `D(b,b+1) = 1`
and `D(b,m) = 0` (`m > b+1`) as separate cases; use `C(b,m) ≤ 2^{2r−1−ρ}`, not
`2^{2r−ρ}`, in the tail chain; state the `max_{ρ≥j} D ≥ 0` step that validates
the `C(6,j)` over-count. *Scope:* `r = 4, 5` are forest-only by exhaustive
enumeration and the graph-scope question there is open. *Parameters:*
`ν = τ = 6` enters through Hall everywhere; `d = 5` fixes `|B| = 2r−1`;
**`x < r` enters at the closure step and is where the crossing hypothesis does
its first positive work in the run.**
**The exact residue at `ν = τ = 6`: no crossing forest in that class has
`x(F) ≤ k₀(r) − 2`.** The coarser reading "`x ≤ r−2`" is what (L) gives at the
top rank alone; the chained form is strictly weaker and is the obligation of
record.

**C2-9 — No crossing-free bound over the window class can be negative.**
`proved_informal` (identity) plus bounded computation (maximality),
**critic-attributed to both U2 critics**, verified here at ten ranks. For every
`r ≥ 4`,
`Σ_{j=0}^{6} C(6,j)[C(2r−1−j, r+1−j) − C(2r−1−j, r−j)] = Δ_r(6K₂ ∪ (2r−7)K₁)`,
strictly positive, and exhaustively the maximum of `Δ_r` over
`{F forest : |V| = 2r+5, ν = τ = 6}` at `r = 4…8` (`32/68/164/431/1204`).
**Consequence: every valid acyclicity-only, crossing-free upper bound over that
class is at least that positive value, so the crossing hypothesis is provably
indispensable there.** The attaining object is the registered REFUTED
`E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`; register only as an independent
re-derivation of that refutation, **never as a new negative finding**, and
never as a counterexample to a crossing theorem.

**C2-10 — Hall equivalence at the window.** `proved_informal`,
**critic-attributed to `C-U2-T`**. For a minimum cover `C` with
`|C| = τ = ν = 6`: `τ = ν = 6` **iff** `ρ(S) ≥ |S|` for **every** `S ⊆ C`,
independent or not. This replaces U2's Result B, whose "private pendant"
hypothesis both critics show is inert.

**C2-11 — Forest cover-degree identity, corrected.** `proved_informal`,
route-attributed (U2), corrected by `C-U2-T`.
`Σ_{b∈B}(deg b − 1) = |C| − e_C − c(F)` for any forest and any cover with `B`
independent, with equality in the charter's candidate `≤ |C| − 1 − e_C` iff `F`
is connected. In the window class, with `H` the usable hub budget and `c₁` the
components meeting `C`: `e_C + H + c₁ = 6`, `c₁ ≥ 1`, hence `e_C + H ≤ 5`.
**Load-bearing for the class enumeration — it is what makes the
cover-structured census finite — and NOT for the band**, since Lemma (L) never
uses acyclicity.

**C2-12 — The crossing-window census, independently regenerated twice.**
Bounded computation at attained horizons, **critic-attributed to both U2
critics** and corroborated by both U4 critics. `0 / 1 / 4,065 / 43,390 /
192,015` crossing `ν = τ = 6` isomorphism classes at `r = 4…8`; every member
has `x = r−1`; max `Δ_r` over the crossing class `−235 / −490 / −1,288 /
−3,648`; `Δ_6 ∈ [−695,−490]`, `Δ_8 ∈ [−6761,−3648]`; **zero recovering
forests**, and **zero over all 208,587 forests of order ≤ 17 at every rank**.
Reproduces `control/C1-CENSUS-ERRATA.json` exactly. The seat that was mandated
to generate this instrument did not; both its critics did, independently.

**C2-13 — The `τ ≤ 7` Catalan ceiling, with its statement repaired and its DAG
closed.** `proved_informal`, seat-authored (F3) and verified line by line by
both F3 critics and here. `K(τ) = 0,2,3,4,6,12,70` for `τ = 1…7`; the
exceptional set for `τ ≤ 7` is exactly `{τ ≤ k < K(τ)}`; `Γ(τ,k) > 0` for all
`k ≥ K(τ)`; `Γ(τ,k) < 0` for every `τ ≥ 8` and `k ≥ τ`; `Γ(τ,0) = 1` for every
`τ`, so `K(τ)` is the first *permanently* positive rank and not the boundary of
`{k : Γ > 0}`. **Two repairs, binding on any formalization:** the statement
needs `(hk : τ ≤ k)` — without it `Cat_{k−j}` has a negative index and
`f(0) = −1/2` breaks the monotonicity step — and the ceiling has a **finitary**
proof (`f(i) > 1/4 ⟹ g_j(k) > 4^{−(j+1)}`) that removes the limit and the
analysis dependency entirely. Both are critic-attributed to `C-F3-T`. I
verified `K(1…7)`, `Γ(8,k) < 0` on `[8,400]`, `Γ(8,0) = +1`, `Γ(5,5) = −14`,
`Γ(6,6) = −170`, `Γ(7,7) = −1091`, and both Addendum §A2 rationals
(`(5/4)^7 − 1 = 61741/16384 < 4`, `(5/4)^8 − 1 = 325089/65536 > 4`).
*Standing caveat, new this cycle:* C2-1 shows the cover branch fails **exactly
at the ranks where the Catalan certificate fails**, so the lemma's standing as
a bridge to forests is weaker after this cycle than before it.

**C2-14 — The acyclicity cell rule, and the reconciliation of "eleven".**
`proved_informal` for the rule, exact finite computation for the witnesses;
**critic-attributed to `C-U1-F` with `C-U1-T`**, adjudicator-verified,
re-verified here. A cell `(τ, r, k)` with `k < r` is acyclicity-load-bearing
**exactly when `r = k+1` and `Γ(τ,k) ≤ 0`**, i.e. for `k = 1, …, K(τ)−1`; the
count is `K(τ) − 1`. `τ = 4` → 3 cells at orders 8, 10, 12 (correcting the
return's "exactly two"); `τ = 5` → **5 cells at orders 9, 11, 13, 15, 17**, with
`(4,3,13)` exactly the registered 13-vertex negative control. **`τ = 6` → 11
cells at `r ∈ [2,12]`, which is the provenance of allocation item 12's
"eleven" — a different object from the 7 open `(6,6)` cover cells** (controller
ruling (4)).

**C2-15 — Three compiled, kernel-verified fragment sets. No award claimed.**
All in pinned projects at Lean 4.32.2 / Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, symlink-bound, axioms exactly
`propext, Classical.choice, Quot.sound`, no `sorry`/`admit`/`native_decide`,
each replayed by both its critics.
*(i)* **The general-`τ` cover-fiber floor** (U1): `powerset_card_sum_binom`,
`cover_rank_bound_general`, `cover_gamma_floor`, for an arbitrary finite vertex
cover, **no acyclicity, no crossing, uniform in `τ`** — this **discharges the
unformalised dependency the Cycle 1 synthesis named twice** (S8 and S10). Its
acyclicity-freedom is established semantically as well as syntactically (both
critics instantiated it on cyclic graphs, 21,000+ instances, zero failures).
*(ii)* **Four reparametrized incidence lemmas** (U3), uniform in `m, d, K, r,
t, j`, with **both repairs load-bearing for truth**: 19.8M instantiations
against actual graphs with 0 failures, while the pre-repair truncating-`K` form
fails 2,638,162 of 5,592,920 times and the unguarded `j > K+1` form fails
847,027 of 1,133,265.
*(iii)* **`guardTranslation`** (U4) over the actual ten guards: `p ≥ 3`, `U`
acyclic, `|U| ≥ 2r+2` (so `d' ≥ 2`), `x(U) < r` — the Lean formalisation of the
Cycle 1 baseline S17, with `d' = 2` attained 103,036 times.

**C2-16 — Realizability of the G1 structural triple, order-minimal at 19.**
`proved_informal` (existence by exhibited objects), route-attributed to T3 for
the existence and **critic-attributed to `C-T3-F` for minimality**. 11,332
pairwise non-isomorphic witnesses with `p ≥ 6`, `|U| ≥ 2p+1`, `maxdeg(U) ≥ 3`
under the unweakened ten-guard conjunction; both critics rebuilt every row with
zero field mismatches. **The object is the structural triple, never the
registered four-condition necessary region**, whose fourth condition (strict
residual recovery) is met by none of them — a tuple in the four-condition
region would be a live counterexample candidate, the opposite of what was
found. Minimal at order 19, first inhabited by 785 tuples, all `p = 7`,
`maxdeg(U) = 3`, `d' = 5`. **Guard 8 rejected exactly zero of 19,800
combinations**, so the evidence is concentrated where the one guard coupling
`U` to the ambient tree is slack — the precise structural reason the Tier 2
bridge did not fall.

**C2-17 — The `d' = 5` residue and the exhaustive ten-guard population.**
`proved_informal` reduction plus bounded computation. Guards 9–10 with the
forest cover theorem force `ν(U) = τ(U) ≥ 6` on every `d' = 5` residual;
`ν ≥ 7` is discharged by the VERIFIED
`E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`; **`ν = τ = 6` is the unique
unresolved profile.** The stronger "every `d' = 5` residual has `ν = τ = 6`" is
**false** (the `P₁₉` witness, verified here in every guard; 888 of 893 such
tuples have `ν = τ = 7`). Bounded: **265,749 ten-guard tuples enumerated
exhaustively over all 522,934 trees of order 8–19 with zero recovery**, `d'`
inhabited at `{2: 103,036, 3: 110,747, 4: 51,073, 5: 893}` — so the necessary
region constrains *counterexamples*, not guard satisfaction, and "the necessary
region excludes `d' ∈ {2,3,4}` from occurring" is struck. The tree population
reconciles exactly against the canonical 522,959 trees of order ≤ 19 (verified
here).

**C2-18 — `d' = 3` conditional closure over the actual ten guards.**
`proved_informal`, compiled conditionally on `hExternal_d3`, route-attributed
(U4). Non-vacuous (110,747 realized tuples), zero violations on all of them and
in bare-forest censuses to `r = 7`. **The cover half of the dichotomy is
logically required but fires on no realized instance** — every realized `d' = 3`
residual has `ν ≥ 4` — so the closure rests in fact on the **critic-attributed
`(4,3)` matching certificate**, an attribution the return drops and which must
be restored at the point of dependence. The `r ≥ 2` guard of the cover theorem
is dropped and the `r = 1` case, though vacuous, is undischarged.

**C2-19 — The Tier 1 lead.** `proved_informal` for the implication, bounded
computation for (★), **critic-attributed to `C-T4-U`**, with cross-orientation
corroboration from F. (★), the **all-vertex forest form of registered-OPEN
`E993-THEOREM-B`** — for every finite forest `H` and every vertex `w`,
`x(H−w) ≥ x(H) − 1` — **implies** the leaf crossing-shift bound `x(F−v) ≤ x(F)`,
and the step where the all-vertex quantifier is indispensable is exactly the
difficulty the route identified: the support `u` need not be a leaf of `F−v`.
(★) is exhaustive at order ≤ 17 (max of `x(F) − x(F−v)` over 3,397,265 vertex
instances is exactly 1, in every degree class). The leaf bound itself is
**OPEN**, bounded at an attained horizon: 208,587 forests of order ≤ 17,
1,683,925 leaf instances, zero violations, reproduced twice by instruments with
different generation mechanisms, plus 1,345,874 further leaf instances to order
153 and **0 violations on all 65 Kadrawi–Levit leaves** (F, `≤` form only; the
equality form is false on 27 of 65 and must not be handed downstream). The
**all-vertex** bound `x(F−v) ≤ x(F)` is **REFUTED** at `K_{1,3}`, order 4, with
the plateau convention load-bearing; failures are narrow and structured
(internal vertices of degree ≥ 2 only, never a leaf, never an isolated vertex,
worst slack exactly `−1`, 24,176 violations over 3,397,265 vertex tests). The
**isolated-vertex** bound is a **theorem** for every finite simple graph
(critic-attributed, proved twice by different arguments). The vertex-deletion
Δ-identity is a **replay** of the registered VERIFIED
`E993-GRAPH-SR2-EXACT-AVERAGE-IDENTITIES` (claim 235) and must say so.

**C2-20 — The drift statistic, and the `c(d) ≠ d` transitions.**
`proved_informal` structural explanation, **critic-derived independently by
both F3 critics**, adjudicator-verified and verified again here. For
`d·K_{1,3}` with parity padding, `α = 2r` exactly so `r` is the midpoint of the
coefficient range; the normalized mean per factor is `I'(1)/I(1) = 13/9`
against `r/d = 3/2`, so the mean sits left of the midpoint by exactly
`(3/2 − 13/9)·d = d/18`; the sequence is log-concave so `x` is the mode, and
`r − x` steps up once per unit of drift. **Predicted and observed transitions
at `d = 8, 26, 44` — an arithmetic progression of common difference 18, which I
reproduced exactly.** The same statistic `drift(core) = α(core)/2 − μ(core)`
explains why F3's two probe families (drift ≤ `7/18` ≈ 0.389) could not find
the `(7,7)` counterexample (which needs drift ≳ 0.44). **The most reusable
object the F orientation produced**, and the mechanism of `F-C3-01`.

**C2-21 — The near-miss ratio is the wrong instrument.** Bounded computation
plus a structural argument; **F-adjudicator-attributed**, assembled from four
seats and four critics. `i_{r+1}/i_r` approaches 1 from below with zero
recoveries across five structurally independent families (R11), and is
**unbounded below 1 in a padding parameter that provably cannot create a
recovery**. So a "near-miss" measured by it carries no information about
whether Tier 1 can fail, and the Cycle 1 `0.9899` figure is a point on a
**rising** curve, not a ceiling. **Absolute `|Δ_r|` growth was already known
uninformative; this cycle establishes that the scale-free ratio is
uninformative too.**

**C2-22 — Two classes removed from consideration, honestly graded.** The padded
balanced double star `DS(t,t) ∪ mK₁` has `τ = ν = 2`, so `Δ_k > 0` for every
`k < r` in domain — proved by both F2 critics and verified here over 6,118,070
checks with minimum `Δ_k = +3`, plus 1,848,980 checks in the two tightest
slices `|V| ∈ {2r+2, 2r+3}` the seat's generator never scanned (its domain
guard was one rank too strict). **It is a `τ = 2` instance of the registered
cover theorem and is *vacuous* with respect to Tier 1** — the class contains no
crossing instance, so Tier 1's hypothesis is unsatisfiable on it. It removes a
class; it reduces nothing. The Kadrawi–Levit family is likewise **irrelevant by
scope**: every fixture has `ν = τ ∈ {12,…,16}`, far above the cover branch's
ceiling, and its log-concavity failure ranks 13–17 sit at or above the
admissible ceiling `⌊(|V|−2)/2⌋` — which is exactly why it refutes
log-concavity at order 26 while doing nothing to Tier 1. Verified here on all
five fixtures by two independent routes.

**Independently re-derived at this seat** (exact integer / exact rational, no
floating point in any decision, no sampling in any exhaustive claim): the five
seals and all nine member digests; the registry statuses of 21 named claims by
direct read; `P_8`, `4K₂`, both `d = 5` comparator fences with `x` on every
row; `K(1…7)`, `Γ(8,k) < 0` on `[8,400]`, `Γ(8,0) = +1`, `Γ(5,5)`, `Γ(6,6)`,
`Γ(7,7)`, `Γ(τ,0) = 1`, both Addendum §A2 rationals, the cell counts
`K(τ)−1`, and the `K(6)−1 = 11` reconciliation at `r ∈ [2,12]`; the `(6,6)`
witnesses at `r = 9,10` with `τ` by exhaustive cover search; the `(7,7)`
single-hub witness at `r = 9`; `8·K_{1,3}` with `Δ_11`, `Δ_12`, `Σ i_k = 9^8`;
the `d·K_{1,3}` drift transitions at `d = 8, 26, 44`; the `W` witness's first
descent and both Δ values from its coefficient vector, and **all five of its
padded cells** by an independent route; the **single-full-hub exhaustive minima
at the same five cells**; the raw cover-cell table at `τ ≥ 4` and the reduction
to 73 residual cells all at `k = r−1`, plus three raw `τ ≤ 3` cells the
adjudicated tables omit; the census arithmetic `8+28+37 = 73` and the band
arithmetic; `Q_{m,d}` coefficientwise positivity `⟺ 3d ≤ 2m+2` at every cell
with `m ≤ 20`, its `[t^m]` closed form to `m ≤ 25`, its degeneracy family and
its boundary coefficient; `m(d) = ⌈3d/2⌉−1` as the least feasible `m`; the
`D(b,m)` sign identity on 1,891 cells with both boundary cases, the
`crude(r)` attainment identity at ten ranks, the class maxima, `Bd(r) ≤ 0` on
the whole exact range `[6,260]` with `Bd(4) = +48` and `Bd(5) = +33`, the
over-count validity step, and `r − k₀(r)` at eight ranks; the `P₁₉` ten-guard
witness in every guard including the `Δ_5 = 0` plateau, with `ν(U) = τ(U) = 7`;
`K_{1,3}` versus `3K₁`; the deletion identity at every vertex of four graphs at
every integer rank; the window table and the small-rank band for `d = 2…20`
with the even-`d` perfect-matching coverage; bare sharpness for `d = 2…12`;
both cover-fiber margin identities at `τ = d` and `τ = d+1`; all five KL
fixtures by two independent routes with their `ν = τ`; the `DS(t,t) ∪ mK₁`
class; and the reconciliation of the 522,934-tree population against the
canonical 522,959.

---

## Refuted or narrowed mechanisms

**Refuted this cycle — fences for Cycle 3, never reopened.**

1. **`c(d) = min(d,7)` as a universal schema.** Refuted on forests at
   `(τ,d) = (7,7)` for `r = 8…33` and at `(6,6)` for `r = 9,10`, by two
   structurally disjoint construction classes. Every witness is an actual
   forest with every hypothesis reproduced by exact counts and **none
   recovers**.
2. **`c(d) = min(d,6)`.** Refuted at `(6,6)`. `c(6) = 5` exactly.
3. **The diagonal `c(d) = d` on forests for `d ≥ 6`.** Refuted at `d = 6`, at
   `d = 7`, and for every `d ≥ 8`. Any route chartered on the diagonal is
   chartered to prove a false statement.
4. **The cover-structured search as implemented by T2.** Its production driver
   enumerated connected tree shapes with every connector a degree-2 hub; the
   modelling assumptions "all-hub spanning-tree skeleton is worst case" and
   "degree-2 hubs dominate degree-≥3 hubs" are **false at scale** and flip the
   sign of the verdict at `(6,6)` `r = 9,10`. A minimum over a proper
   sub-family is an upper certificate: it can refute, never close.
5. **"Direct `C`-edges never help" as justified.** The shipped argument
   ("internal edges only remove independent subsets `S`, which can only
   increase `Δ_k`") is invalid — the removed terms are not all negative — and
   is an instance of raw **edge-addition monotonicity**, which
   `SOLUTION-CONTRACT.md` §3 fences and never reopens. The conclusion may hold;
   the argument must not be carried forward.
6. **"The necessary region is realizable."** False against the four-condition
   definition of record, and refuted by the route's own data. Only the
   structural triple is realizable, and the charter's second disjunct — that
   the tree structure with `p = x(T)+1` as a global invariant forbids
   **recovery** — is untouched and remains the route's principal debt.
7. **"Every `d' = 5` residual has `ν = τ = 6`."** False; refuted by the `P₁₉`
   ten-guard tuple and by 888 of 893 such tuples. Restated as C2-17.
8. **"The necessary region excludes `d' ∈ {2,3,4}` from occurring."** False; it
   constrains counterexamples, not guard satisfaction. Those bands hold 264,856
   of the 265,749 enumerated tuples.
9. **`x(F−v) ≤ x(F)` for every vertex of a forest.** Refuted at `K_{1,3}`,
   order 4. Failure is narrow and structured, not generic.
10. **"`E993-THEOREM-B` is the complement of the chartered target, and
    untouched."** Struck: the all-vertex forest form **implies** the chartered
    target.
11. **"Proposition 1 explains why the leaf bound is hard to violate."** Struck:
    the criterion is vertex-type-agnostic and so cannot explain a leaf/non-leaf
    dichotomy, and its hypothesis fails on about half of all leaf instances,
    beginning at `K₂`.
12. **`Q_{m,d}` as a certificate for `d ≥ 7`.** It is the **unconstrained
    relaxation** there; the sign condition `λ_j ≥ 0` that the ground-truth Lean
    instance carries is violated by the shipped recursion at admissible integer
    ranks (`d = 7` and every `d = 9…30` tested; `d = 8` the single exception).
13. **"The leading coefficient is the strict global minimum of `P_d`."** False
    at `d = 1` (a tie), and not well-posed without the clearing convention,
    since `gcd(N_m, D_m)` has degree `⌊d/2⌋` for `d ≥ 3`.
14. **The `r < m` vanishing argument as phrased in the charter.** The vacuous
    threshold is `r < m − d/2`; the phrasing conceals a three-way split whose
    middle part is non-empty of width exactly `d−1` and is not reached by the
    certificate at all.
15. **`R_j(t) = N_j − e_j·D_j` as an induction invariant**, and **real-linear
    factorization of `Q_{m,d}`.** Both refuted (1,408 mixed-sign occurrences at
    `m ≤ 19`; exact Sturm counts give complex-conjugate pairs at `(7,5)`,
    `(10,7)`, `(8,8)`, `(10,10)`). Any proof of the coefficientwise claim must
    survive complex roots — and C2-4's certificate does, by never touching root
    structure. **Companion fence: Newton's inequalities hold at `(7,5)` and
    `(10,7)` although neither is real-rooted, so "Newton holds ⟹ real-rooted"
    is invalid here.**
16. **The "joint achievability" refinement of U2's bound — it does not exist.**
    The bound is **attained** by an actual class member (C2-9). U2's primary
    remaining obligation is **void**; any successor told to pursue it will lose
    a cycle.
17. **Any acyclicity-only, crossing-free bound on `Δ_r` over the `ν = τ = 6`,
    order-`2r+5` class — impossible** (C2-9).
18. **The chartered `U-C2-02` fingerprint is not the mechanism that works.** An
    acyclicity-sharpened spread bound on `N(S) ∩ B` beating `−Cat_{k−|S|}` is
    not what closes the second difference at `ν = τ = 6`; Hall plus the binomial
    sign rule is, and it is acyclicity-free. **Consequently the registered
    13-vertex `τ = 5` negative control does not bite on such an argument** and
    must not be imposed on it.
19. **Node (A)/(B) as a dichotomy, and `Γ(τ,k) ≤ 0` for `k < K(τ)`.** False:
    `Γ(τ,0) = 1 > 0` for every `τ`; `K(τ)` is the first *permanently* positive
    rank.
20. **`ν = τ = 6 ⟹ x = r−1`.** False — exactly one of 7,469 order-15 forests
    with `ν = τ = 6` has `x = 4`. Only the *crossing ⟹ `ν = τ = 6`* reduction is
    unconditional; the `x = r−1` value is a census fact at `r = 5…10`. **This
    separation is exactly what leaves Lemma (L) short of closing the band.**
21. **The near-miss ratio `i_{r+1}/i_r` as a discriminator** (C2-21), and with
    it the reading of the Cycle 1 `0.9899` figure as an "asymptotic ceiling".
22. **F3 §4's 0/70 null read as support for the conjecture**, and its offer to
    `T-C2-02` as "encouragement" — reversed; five of its own cells close
    negatively. **F3 §5's substitute `τ ≤ 3` violator convention** — rejected;
    the errata stands, and its 18,123 / 5,064 figures must not enter any ledger
    as isomorphism-class counts. **F4's universal "no Cycle 2 mechanism
    implicitly requires log-concavity, TRS2, real-rootedness or unrestricted
    transfer"** — struck as certified; a five-tree scope audit cannot carry a
    universal over twelve routes, and the gap is a real open charter item.
    **F4's 65-leaf equality form** and **its `T(3,5,5)` guard-10 "open
    descriptive question"** (closed: guard 10 is a knife-edge failing exactly on
    the rows with `x(T) − x(U) = 1`).

**Narrowed but retained.** The cover-fiber partition mechanism (correct, but a
replay of the registered VERIFIED `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`,
already compiled for arbitrary `C` at frozen entry 167, with `cover_sum_bound`
at 168; **the `C.card = 4` lock is on entries 169–170, not on the partition**);
the stratified matching certificate (retained with the sign condition explicit
and the clamped optimum substituted for `Q_{m,d}`); the T3 construction family
(horizons restated as sweep ceilings, distinctness recomputed to 11,498, "new
territory" reduced to 7,285 rows after subtracting the matching branch); T4's
structured probes; the single-full-hub skeleton (retained as a **conjectured**
worst case at `k = r−1` — it attains the exact full-space minimum at every
exhaustively settled cell with `r ≥ 9`, and **it survives F's disconnected
witness at all five shared cells**, as verified here); F1's star-forest theorem
(restated for the `K₁`-free slice on seat evidence, the full family
critic-attributed; 3,020 distinct crossing forests, not 3,424 rows); the
`S = ∅` vanishing identity (correct, but a composition of two registered
VERIFIED claims with no acyclicity and no minimality used — register at graph
scope with dependencies named, or decline); the cover-fiber sign criterion
(correct with the non-degeneracy guard added, without which 1,729 of 4,284
cases are degenerate).

**Evidence-envelope defects carried forward as controller debt** (none changes
a mathematical verdict, and the pattern is now unanimous across orientations):
**companion-snippet literals** — numeric claims with no shipped generator, in
T1, T2, F1 (two), F3 (three), F4 and U2 and U3, *every one of which turned out
true when a critic recomputed it*, and every one of which is therefore
critic-attributed rather than seat-backed; **filter caps presented as attained
horizons** — T3 (in breach of a binding gate rule), F1, F2 (three), F3;
**lexical alias checks standing in for mathematical ones** — F1 (missed two
registered VERIFIED claims and a canonical errata theorem), F2 (missed a
`τ = 2` instance of a ruled theorem and the registered comparator under a new
name), F3 (never named the OPEN schema it instantiates), T4 (scoped the search
to the wrong statement); a shipped replay that imports from and writes onto an
inventoried artifact (T2); an emphatic "second independent implementation" with
no shipped artifact (T3); a non-recomputable payload seal (T4); a fake König
spot-check whose assertion is structurally incapable of firing (U4); and a
`checkdefect.lean` that does not elaborate, so "kernel-checked both directions"
is struck (U3). **Cycle 3 worker briefs must make the *mathematical* alias
check — "what does this class look like to the registered theorems?" — an
explicit, separately reported step.**

---

## Headline verdicts

Exact evidence grades, per target. No status transfers anywhere. Registry
statuses confirmed by this seat's own direct read of
`control/CLAIM-IDENTITY.run-local.json`.

| target | registered status | Cycle 2 verdict | grade |
|---|---|---|---|
| **Tier 1** `E993-R25-UNR-FOREST-WIDE` | OPEN | **untouched**; not proved, not refuted | no advance; the first crossing-conditioned *lead* exists (C2-19) but is a reduction to a strictly stronger registered-OPEN claim, not an advance on Tier 1 itself |
| **Tier 2** `E993-G1WIDE-NO-SIZE-CAP` | OPEN | **untouched**; no tuple with `Δ_{p−2}(U) > 0`, no proof that none exists | no advance; realizability settled and order-minimal (C2-16), the residue narrowed to one profile (C2-17), guard 8 identified as never binding |
| **Tier 3a** `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` | OPEN | **algebraic core proved uniformly in `(m,d)`; certificate existence still open** | C2-4 `proved_informal`, uniform, critic-attributed and twice verified; C2-5 subsumed into it; **two named open nodes** — the dual-sign lemma and the LP-encoding fidelity step — where Cycle 1 had one undifferentiated gap; C2-6 is the redirection; C2-7 exposes a small-rank complement the certificate cannot reach |
| **Tier 3b** `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY` | OPEN | **`c(d) = min(d,5)` stands and is exactly sharp at `d = 6`; the conjectural extension is DEAD** | C2-1 `proved_informal`, uniform in `d`, with one unformalised node remaining (the finite-cell acyclicity-carrying closures, now exactly located by C2-14); `min(d,6)` and `min(d,7)` refuted by exhibited forests from two disjoint construction classes; C2-2 gives the exact 8/28/37 census; C2-13 caps the mechanism at `τ ≤ 7` |
| **Tier 3c** `E993-R25-WINDOW-REDUCTION` | OPEN | **restated, and it widens again** | C2-3 `proved_informal` as arithmetic; **negative** — the window's lower end is `6` at every `d ≥ 6`, the `d = 6` window is `{6,7}` not `{7}`, and every `d ≥ 6` gains width relative to the now-refuted `min(d,7)`. The `d = 5` window `{6}` is untouched |
| **Diagnostic band** `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` | OPEN | **OPEN — materially reduced, not closed** | C2-8 `proved_informal` (Lemma (L)), acyclicity-free, twice-read; the exact residue at `ν = τ = 6` is **no crossing forest with `x ≤ k₀(r)−2`**, `r − k₀(r) = Θ(√r)`; C2-9 proves no crossing-free bound over the class can ever work; the composition in R7 gives a two-lemma proof plan with one lemma proved |

**Separately, with no status transfer whatsoever:**

- **FOREST** (`E993-TGT-FOREST`) — **OPEN, untouched.** Nothing in Cycle 2
  bears on it. Tier 1 is a registered *proper subclaim* of it, and Tier 1 did
  not move.
- **TREE** (`E993-TGT-TREE`) — **OPEN, untouched.** No tree-specific statement
  was proved or refuted. The `P₁₉` witness and the KL fixtures are instruments,
  not tree theorems.
- **TRANSFER** (`E993-TRANSFER-TO-FOREST`) — **CONDITIONAL, undisturbed.** Its
  universal antecedent `E993-UNIV-TREE-TRS2` remains **REFUTED** at order 26
  and is not reopened. A REFUTED claim never regresses to OPEN. The five KL
  fixtures were instantiated exactly this cycle and confirm the refutation of
  log-concavity (and hence, by Newton's inequalities, of real-rootedness —
  implied, not computed) while bearing on no tier.
- **Erdős #993** — **untouched.** No claim is made, anywhere, that closing the
  cover branch, the `d = 5` band, the G1 residual, or G1 itself solves
  Erdős #993.
- `E993-EXISTS-COUNTEREXAMPLE` remains **OPEN**; `E993-THEOREM-B` remains
  **OPEN** as registered (tree- and leaf-scoped); `E993-G1-MATCHING-COMPARATOR-SUFFICIENT`
  remains **CONDITIONAL**, not refuted; `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`,
  `E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE` and `E993-UNIV-TREE-TRS2` remain
  **REFUTED** and undisturbed; `OB-G1` is a different claim, is untouched, and
  is not projected onto G1wide.

**Branch states, recorded exactly as the close requires.**

*Matching branch.* Coefficientwise positivity of `Q_{m,d}` **iff** `3d ≤ 2m+2`
is **proved, uniform in `(m,d)`, critic-attributed** (C2-4) and verified twice.
The **dual-sign lemma is open**: the greedy dual carries negative multipliers
for `d ≥ 7`, so positivity is the unconstrained relaxation of certificate
feasibility, and the LP-encoding fidelity step is verified at `(7,5)` only. The
**small-rank band** is `r ∈ [d−1, 2d−3]` (even `d`) and `[d, 2d−2]` (odd `d`),
of width exactly `d−1`, and **its bottom rank at even `d` is closed by the
VERIFIED perfect-matching theorem**; the genuinely open part is
`r ∈ [d, 2d−3]` / `[d, 2d−2]`, which the certificate cannot reach at all. Bare
sharpness is uniform in `d` and every known sharpness witness has `x = r+1`, so
the crossing-conditioned threshold still has no established lower bound at any
`d`.

*Cover branch.* Exactly as ruled: `c(d) = min(d,5)` for forests (guard `k < r`)
is a **theorem**; `c(6) = 5` **exactly**; the diagonal `c(d) = d` is **refuted
at every `d ≥ 6`** (witnesses at `(6,6)` `r = 9,10`; `(7,7)` `r = 8…33`;
`d·K_{1,3}` for `d ≥ 8`); **strong sharpness `c(d) = 5` is established only at
`d = 6`**; `c(7) ∈ {5,6}` with bounded evidence for 6; `5 ≤ c(d) ≤ 7` for
`d ≥ 8`. The corrected 73-cell census is **8 closed / 28 refuted / 37
undetermined**. The registered `d = 6` window's lower end **moves to 6** and the
Tier-3c window **widens at every `d ≥ 6`**.

*Tier 2 state.* Every G1 counterexample has `d' ≥ 5`; `d' = 3` is closed
**conditionally** on the `(4,3)` certificate (critic-attributed, and the cover
half of its dichotomy fires on no realized instance); at `d' = 5` the residual
has `ν ≥ 6` with **`ν = τ = 6` the unique unresolved profile**; the
**structural triple is realizable from order 19** and is order-minimal there.

*Tier 1 state.* The lead is: **the all-vertex Theorem B form (★) implies the
leaf crossing-shift bound**, and (★) is exhaustive to order 17 over all
3,397,265 vertex instances.

*Scale-free thread.* Ratios approach 1 from below with **zero recoveries**
across five independent families and are unbounded below 1 in a padding
parameter that cannot create a recovery — **the wrong instrument**.

*Seating.* The unanimous critic-attribution finding of all three adjudicators
is recorded for the controller's Cycle 3 review (R12). **It is not a plateau,
because the progress is real.**

```text
headline_resolved: no
```

---

## Lean awards

**Award decision: `no award attempted`.** All three adjudicators independently
recommend zero Lean awards from their orientations, and I sustain that on
`SOLUTION-CONTRACT.md` §4 and protocol duty 4. **No candidate in the cycle has
simultaneously a stable statement, a closed dependency DAG at its exact scope,
and sufficient materiality.** Nothing was weakened to manufacture one, and
nothing in this run is `formally_verified` beyond the two Cycle 1 awards.

**Reconciliation of every proposed candidate.**

- **The `τ ≥ 8` ceiling and the monotone-ratio lemma (C2-13).** *Stable
  statement:* **not yet** — it omits `(hk : τ ≤ k)`, without which `Cat_{k−j}`
  has a negative index (the contract's integer zero extension is declared for
  `coeff`, **not** for `Cat`) and the monotonicity step is false. *DAG:* **not
  closed as written** — the ceiling is routed through a limit, dragging in an
  unnamed analysis dependency; the finitary route
  (`f(i) > 1/4 ⟹ g_j(k) > 4^{−(j+1)}`) removes it entirely and is the object any
  formalizer should receive. *Materiality:* an **auxiliary** — a
  `d`-independent ceiling on what the cover-fiber mechanism can deliver, not a
  statement about forests — and a Cycle 1 re-confirmation. **Weaker after this
  cycle than before it**, because C2-1 shows the cover branch fails exactly at
  the ranks where the Catalan certificate fails. **Verdict: Lean-eligible after
  the two named repairs, but formalise it *inside* a cover-branch award, never
  as one.** Credit: F3 for the argument, `C-F3-T` for the finitary route and
  the missing hypothesis.
- **`c(d) = min(d,5)` for forests (C2-1).** *Stable statement:* **yes**, and
  this cycle made it stronger and cleaner — it is now the only surviving
  threshold and is exactly sharp at `d = 6`. *Materiality:* **high** — a
  uniform theorem in `d` and one of the two branch endpoints of the Tier-3c
  window. *DAG:* **not closed**, but this cycle located the blockers exactly,
  and one of the two the Cycle 1 synthesis named is **discharged**. Residual
  DAG, for the Cycle 3 Stage 7 target:
  - `cover_indepCount_partition`, `cover_delta_partition` (frozen entry 167,
    already general in `C`), `cover_sum_bound` (168), `binom_shift_floor`,
    `binomDelta_*` — **compiled**;
  - `powerset_card_sum_binom`, `cover_rank_bound_general`, `cover_gamma_floor`
    — **compiled this cycle** (C2-15(i)); **this discharges the general-`τ`
    power-set dependency the Cycle 1 synthesis named twice**, and corrects the
    briefing error that located the lock on the partition: the `C.card = 4`
    lock sits on **entries 169–170** (`powerset_four_sum`, `cover_rank_bound`);
  - `Γ(τ,k) > 0` for `k ≥ K(τ)`, `τ ≤ 7`, general in `τ` — **OPEN in Lean; this
    is the gating node.** Only `τ = 4` is Lean-proved, by the frozen bespoke
    degree-4 `linear_combination` identity, which both U1 critics confirm is not
    a template;
  - the **five `τ = 5` forest small-rank lemmas** at the now-exactly-located
    cells `(r,k,order) = (2,1,9), (3,2,11), (4,3,13), (5,4,15), (6,5,17)`
    (C2-14), each acyclicity-carrying, plus **`K(5) = 6` positivity** —
    **none written**;
  - `exists_subsuperset_card_eq` (present in the frozen source, **not
    re-declared**) to reduce `τ ≤ 5` to `τ = 5`; and D2 packaged so `Gamma`
    stops being a dead declaration.
  **Verdict: not ready this cycle; ready as soon as the gating node and the five
  small-rank lemmas land. Recommend the extensional `τ = ν` form**, since
  Mathlib at the pinned commit has no matching number and `vertexCoverNum : ℕ∞`,
  so the numeric form needs new definitions and an `ℕ∞`/`ℕ` bridge.
- **C2-4, coefficientwise positivity uniform in `(m,d)` with an explicit
  threshold.** The **right shape** for an award (a parameterized theorem with
  an explicit threshold) and the strongest single mathematical result of the
  cycle. *Not ready, decisively:* it is **the unconstrained relaxation of the
  property actually wanted** (controller ruling (3)), so awarding it would
  certify a statement about a recursion as though it were a statement about
  graphs; and it is not formalized at all. Its evidential standing improved
  this cycle — it now has two independent step-by-step readers rather than one
  — but that does not change its awardability. **Ready when the dual-sign lemma
  and the LP-encoding fidelity step land and the statement is formalized.**
- **C2-8, Lemma (L).** A genuine reduction theorem about actual graphs, stable
  as stated for `r ≥ 6`. *Not ready:* it mixes an exact finite computation
  (`6 ≤ r ≤ 260`) with an analytic tail whose written chain needs the two named
  repairs; `r = 4, 5` are forest-only; and it is not Lean-renderable at the
  pinned Mathlib without new matching/cover definitions. **DAG not closed.**
- **The three compiled fragment sets (C2-15).** Clean and kernel-verified, but
  **rejected on materiality**: duty 4 admits a uniform theorem, a parameterized
  theorem with explicit thresholds, or a reduction theorem in honest conditional
  form, and a fragment set **with no theorem** is none of the three. The
  objection is substantive as well as formal — U3's file declares
  `indepCount`/`coeff`/`delta` and then never uses them, so its four lemmas are
  pure stratum-counting facts **with no stated relation to `Δ_r`**; awarding
  them would certify counting lemmas as if they were steps of the conjecture.
- **The refutations (C2-1, C2-2, the `(7,7)` witness).** Materially the most
  important results of the cycle, but a refutation is **registered, not
  awarded**, and formalizing a fixed 29-vertex forest would be formalizing a
  `decide`-style computation.
- **C2-5 (T's `[t^m]P`).** Subsumed by C2-4; one registration, not an award.
- **C2-19 (the Tier 1 lead).** (★) is **unproved**, so what could be formalised
  today is only the implication — three lines of the registered VERIFIED
  identity, i.e. a repackaging.
- **Bounded computations and null searches** (C2-12, C2-17's census, C2-22, the
  falsification perimeter). `SOLUTION-CONTRACT.md` §4 makes a null census
  insufficient for any tier, and duty 4 excludes them explicitly.

**Excluded conclusions, stated for the record even though no award is made.**
Nothing this cycle carries Tier 1 status, Tier 2 status, Tier 3-uniform status,
or closure of the diagnostic band; no forest status transfers from any
graph-general statement, and no G1 status transfers from any forest statement;
no fence is reopened, and in particular the `m = 6` comparator refutation at
`d = 5` is **confirmed, not disturbed** — C2-9 re-derives it as the attaining
object of the class maximum and it must be registered as a re-derivation, never
as a new negative finding; no claim about log-concavity, TRS2 or
real-rootedness beyond the confirmed refutations on the KL fixtures;
`E993-G1-MATCHING-COMPARATOR-SUFFICIENT` stays CONDITIONAL; `novelty_claimed:
false` throughout.

**Prerequisites common to any future award** (none optional, and all three
should be treated as controller-level work): a **shared base module** resolving
the duplicate `Erdos993G1.indepCount`/`coeff`/`delta` declarations across the
frozen C3 project and the C1-LA1 award run — until it exists, no route can
compose the kernel-verified `ν ≥ 7` theorem with anything; the bridge
`Σ_j |stratum G M k j| = coeff G k`; and D2 packaged with `Gamma` live.

**Claim-identity separations required before any registration.**

- The general-`τ` cover-fiber expansion is the registered VERIFIED
  `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`, already compiled for arbitrary
  `C`; the formalisation gap is entries 169–170. Any brief that says otherwise
  is corrected here.
- The vertex-deletion Δ-identity is the registered VERIFIED
  `E993-GRAPH-SR2-EXACT-AVERAGE-IDENTITIES` (claim 235); T4's §4 is a replay.
- The cover-branch refutation must be registered as **two** keys: `(7,7)`,
  `τ = ν = 7`, `|V| = 2r+7`, `x = r−1 < r`, `r ∈ {8,…,33}`; and **separately**
  `(6,6)`, `τ = ν = 6`, `|V| = 2r+6`, `x = r−1`, `r ∈ {9,10}`. No
  `(7,7)`-window key may carry the `(6,6)` band. The `W = T₁₆ ⊔ T₁₃` witness
  registers inside the `(7,7)` key, not as a separate refutation.
- T3's and U2's candidates must be renamed out of the predecessor experiment's
  `E993-C2-*` namespace into `E993-R25-*`; T3's statement must name the
  **structural triple**, never the four-condition necessary region.
- T1's leading-coefficient candidate is **the same object as U3's `Q_{m,d}`
  leading coefficient** (verified here) and registers once, in the general
  `(m,d)` form.
- T4's two candidates are collision-free; Candidate A must record that it is
  **forest**-scoped against a **tree**-scoped `E993-THEOREM-B`, and Candidate B
  that it is rank-free and therefore **not** an instance of the refuted
  every-vertex SR2 keys.
- The `τ = d+1` `S = ∅` vanishing identity registers, if at all, at **graph**
  scope for **any** cover of size `d+1`, with its two VERIFIED dependencies and
  the companion `τ = d ⟹ margin = Cat_r` named, and with the errata's
  refutation of the causal reading cited as a guard.
- F3's `c(d) := d` result **refutes no registered or live claim**; it is an
  instantiation of the OPEN run-local schema, lying entirely outside the live
  conjecture's `τ ≤ 7` region, and the honest statement is that the ceiling's
  forest-witness set is extended from one point to 23.

---

## Progress and stop-gate ruling

```text
material_progress: yes
```

All three orientations return `material_progress: yes` and
`orientation_plateau: no`, and the evidence sustains both.

**What moved, measured against the stop gate's three continuation conditions.**

*(b) New proved reductions of the remaining class — four of them.*
(1) **The cover branch.** `c(d) = min(d,7)` and `min(d,6)` are dead, the
diagonal is dead at every `d ≥ 6`, `c(6) = 5` exactly, and the Tier-3c window
must be restated wider at every `d ≥ 6` including the registered `d = 6`
window, whose lower end was wrong. Established by exhibited forests from **two
structurally disjoint construction classes** and by two independent exhaustive
enumerations of a complete finite space, verified by the controller and again
here. That is a permanent, actual-graph narrowing of what the cover branch can
ever deliver.
(2) **The diagnostic band.** Lemma (L) reduces it at `ν = τ = 6` from "no
recovery at rank `r`" to an exact statement about how early `x` can be, with
`r − k₀(r) = Θ(√r)`, and in doing so gives the crossing hypothesis its **first
positive work anywhere in the run** — while C2-9 proves that no crossing-free
bound over the class can ever succeed, so the hypothesis is indispensable
rather than merely useful.
(3) **Tier 2.** The `d' = 5` residue collapses to the single unresolved profile
`ν = τ = 6` over the **actual ten guards**, and realizability of the structural
triple is settled and shown order-minimal at 19, correcting a Cycle 1 census
null.
(4) **Tier 1.** The leaf crossing-shift bound is **reduced** to the all-vertex
forest form of a registered OPEN claim, with the implication proved and the
reduced target verified exhaustively at order ≤ 17 and on the hardest
registered (non-log-concave) trees.

*(a) A new mechanism whose unresolved dependency is strictly weaker.* The
matching branch. Coefficientwise positivity iff `3d ≤ 2m+2` is now **proved
uniformly in `(m,d)`** with the threshold produced by the argument rather than
imported; the necessity half went from bounded evidence at `d ≤ 16` to a
theorem uniform in `d`; and Tier 3a's single undifferentiated gap became **two
named nodes**. The shipped closing inequality was shown to be an unconstrained
relaxation for `d ≥ 7` and the sign-constrained replacement was constructed and
shown to meet the requirement everywhere scanned, reducing where the clamp
binds to something trivially true at the threshold. The route's open dependency
is strictly weaker at the end of this cycle than at the start, and it is now
correctly posed.

*(c) A candidate ready for the Lean gate.* **Not met this cycle** — see
`## Lean awards`. Two of the three continuation conditions suffice.

*Further material gains.* Three compiled, kernel-verified, axiom-clean fragment
sets, one of which discharges a dependency the Cycle 1 synthesis named twice;
the mandated crossing-window census independently regenerated **twice** after
the owning seat skipped it; a 265,749-tuple exhaustive ten-guard population
that did not previously exist; the acyclicity cell rule corrected and closed at
`τ ≤ 5`; the drift statistic, which simultaneously explains the `c(d) ≠ d`
transitions, explains why one null was a false negative, and is directly
reusable as a search direction; and the reframing of the run's own near-miss
instrument as uninformative.

```text
plateau: no
```

**The plateau test, applied exactly, including its sharper Cycle 1
formulation.** `control/C2-STAGE1-GATE.md` §5 is the binding text and it sets a
**conjunction**: a Cycle 2 plateau ruling would need Cycle 2 alone to be empty
**and** the adjudicators' critic-attribution warning to recur. The second
conjunct **has fired, forcefully and unanimously** (R12). The first has not:
Cycle 2 is emphatically not empty in any orientation.

I address the Cycle 1 synthesis's sharper formulation head-on rather than
letting it pass, because that synthesis wrote the test: it recorded that "for
the T and U orientations specifically, a second cycle of the same pattern —
correct machinery, misgraded by the seats, closed by the critics — would be
evidence of plateau **even with nominal new content**." That pattern did recur.
**But Cycle 2's content is not nominal**, and the distinction is what the
ruling turns on: a live named conjecture was refuted by exhibited forests from
two independent mechanisms; the algebraic core of Tier 3a was proved uniformly
in `(m,d)` with the threshold falling out of the argument; the diagnostic band
was reduced by a lemma in which the crossing hypothesis does positive work for
the first time in the run, with a companion proof that it is indispensable
there; and three kernel-verified fragment sets landed, one discharging a
standing dependency. That is not nominal content under any reading. The later,
more specific gate text governs, and on it **plateau: no**. The
critic-attribution finding is carried to the controller as a **seating and
effort-allocation** matter, which is what it is.

**Stop-gate ruling.** No decisive event occurred. A decisive event is a
**verified** Tier 1 or Tier 2 theorem, a **verified** reduction strictly
shrinking the remaining class, or an exact counterexample. Tier 1 and Tier 2
are untouched; no recovering forest exists anywhere in the record, in any
orientation, on any instrument; and nothing this cycle is `formally_verified`,
so no *verified* reduction exists — the reductions produced are
`proved_informal` and most of the strongest of them are critic-attributed. The
one refutation that is decisive in its own right (`c(d) = min(d,7)` is false)
refutes a **conjecture internal to the method**, not a contract tier, and it
**shrinks Tier 3b's reach rather than delivering a reduction** — indeed C2-3
shows the Tier-3c residual class **grows** at every `d ≥ 6` under the corrected
thresholds, so the Tier-3c reduction moves further from the contract's
"strictly smaller class" criterion for a second consecutive cycle. Under the
gate as armed, `continue: no` would require `plateau: yes` or
`headline_resolved: yes`; neither holds, and a headline resolution would in any
case fail automatic admission and be inspected by the controller by hand.

---

## Cycle 3 route portfolio

Twelve routes, four per orientation, consistent with the three adjudicators'
next-route allocations and deconflicted across orientations by this seat. Each
says what it can close in one cycle, or what debt it can honestly name.

**Binding constraints on every Cycle 3 brief.** Carry forward every Cycle 2
hygiene rule (in-root replay directory named explicitly; no out-of-root
temporary-directory form and no in-place redirection onto inventoried
artifacts; no wall-clock fields inside hashed outputs; a shipped, digested
generator and a copy-out-first replay for **every** numeric claim; computed
isomorphism-class counts; attained rather than filter horizons; the
`SOLUTION-CONTRACT.md` §3 controls reproduced **before** any null search; every
registered VERIFIED claim a census would re-confirm named **before** the census
is presented as evidence). **Add three, from this cycle's unanimous findings:**
(i) the **mathematical** alias check — "what does this class look like to the
registered theorems?" — is a separately reported step, not a name search;
(ii) `control/C2-ALLOCATION.md`'s successor is an **explicit member of every
critic capsule's file list**, and the Cycle 3 builder must not rely on a clone
substitution to create it; (iii) every brief states the **canonical** figures
it may quote (the corrected 8/28/37 census; the window table under
`c(d) = min(d,5)`; `K(1…7)`), and forbids the superseded ones.

**Also binding, and new:** the controller should act on the unanimous
critic-attribution finding before dispatch — by raising route model/effort, or
by formally re-chartering the critic stage to include derivation with a
second-reader requirement, or both. Three cycles of "correct machinery,
misgraded by the seats, closed by the critics" would be a different ruling.

### Orientation T (prove)

- **T-C3-01 `SIGN-CONSTRAINED-MATCHING-DUAL`** (Tier 3a; highest expected
  value). *Fingerprint:* the **clamped** dual — `λ_j ≥ 0`, `μ_j ≥ 0` imposed as
  the ground-truth Lean instance imposes them. Prove the clamped greedy chain is
  the exact maximiser of `μ_{m−1}` over non-negative dual points (the
  monotonicity both T1 critics rely on and neither proves), then split into the
  clamp-binding regime, where the requirement reduces to `m(t+m) ≥ 2(d−1)` and
  is trivial at `m = ⌈3d/2⌉−1`, and the unclamped regime, where C2-4 and
  `D_m(t) > 0` already apply. *Closes:* Tier 3a's `t ≥ 0` half **uniformly in
  `d`** — the matching branch's one open derivation. *Debt:* the exact `(d,t)`
  where the clamped optimum falls short, with the exact margin. **Do not**
  re-attack `Q_{m,d}`'s coefficientwise positivity or its coefficient ordering:
  C2-4 is proved and twice verified, and the global-minimum framing is the
  wrong altitude. **Owns the algebraic closing step; U-C3-02 owns the
  LP-encoding fidelity and the formal statement — do not duplicate.**
- **T-C3-02 `MATCHING-BRANCH-SMALL-RANK-COMPLEMENT`** (Tier 3a's complement).
  *Fingerprint:* the non-vacuous band `r ∈ [d, 2d−3]` (even `d`) and
  `[d, 2d−2]` (odd `d`), after subtracting the bottom rank at even `d`, which
  the registered VERIFIED perfect-matching theorem already closes. The
  certificate provably cannot reach it — at the band's low end `D_m(t) = 0`
  exactly and `r+1−m < 0`, so no continuation or limiting argument from
  `t ≥ 0` gets there — so it needs the per-rank treatment the `(7,5)` Lean
  closeout used (stratum-emptiness plus exact small-rank duals), generalised in
  `d`. *Closes:* the matching branch as a **complete** theorem at each `d`
  rather than a theorem above a rank threshold, which is what any Lean award on
  the branch will need. *Debt:* the smallest `d` at which the per-rank
  construction resists, with the resisting rank.
- **T-C3-03 `COVER-THRESHOLD-EXACT-AND-SINGLE-HUB-LEMMA`** (Tier 3b).
  *Fingerprint:* prove or refute that a **single hub of degree `τ`** is the
  worst skeleton at `k = r−1`, and use it to settle the 37 undetermined cells
  `(7,7)` `r = 34…70` and to determine **`c(7)` and `c(d)` for `d ≥ 8`
  exactly**, the diagonal now being dead. *Chartered as "determine `c(d)`
  exactly for `d ≥ 7`", never as "close the 73 cells"* (R4). Three deliverables
  the record needs: the two corrected, split registrations for the `(6,6)` and
  `(7,7)` refuted bands; the restated Tier-3c window table under the proved
  `c(d) = min(d,5)`, including the corrected `d = 6` window `{6,7}`, **before**
  any route consumes it; and the exact endpoints of the `(7,7)` exceptional
  band (bounded above by `r = 71` via `K(7) = 70`). **Must be told:** the
  canonical census is 8/28/37; five of the refuted cells were closed by a
  **disconnected two-component high-drift core** outside the single-hub family,
  and this seat has verified that the single-hub minima are strictly below that
  witness at all five, so the conjecture survives but the full space it must
  dominate includes disconnected cores. *Debt:* the exact resisting cells by
  `(τ,d,r)`, with the search actually run over hubs of arbitrary arity.
- **T-C3-04 `ALL-VERTEX-THEOREM-B-FOR-FORESTS`** (Tier 1; the crossing lead).
  *Fingerprint:* attack (★) — for every finite forest `H` and every vertex `w`,
  `x(H−w) ≥ x(H) − 1` — registered separately as a strict strengthening of the
  tree- and leaf-scoped `E993-THEOREM-B`, using the registered VERIFIED
  deletion identity (claim 235) and the two-level necessary condition on the
  record (a violation forces an earlier strict descent one level down **and** a
  strict increase two levels down). (★) implies the leaf bound by a proof
  already on the record; the isolated-vertex stratum is already a theorem at
  every order. Pair it with the **corrected** excess budget (`d_A = d_F − 1` per
  A-step with the guard first failing after `d_F − 1` steps;
  `d_G = d_F + 1 − δ`, so the G-branch preserves excess only at a leaf; and no
  induction can be organised on the G-branch alone, because the identity is a
  sum). **Receive the `≤` form only** — the equality form is false on 27 of the
  65 Kadrawi–Levit leaves. *Closes:* the run's first genuinely
  crossing-conditioned step toward Tier 1. *Debt:* the registered open claim
  (★) itself, with the smallest order at which an all-vertex strategy breaks.

*Not allocated in T:* any further plain census over forest orders; any re-attack
on `Q_{m,d}`; any route chartered on the diagonal or on `min(d,6)`/`min(d,7)`;
any G1 realizability sweep that does not make **guard 8 bind** — realizability
is settled and order-minimal, and the next G1 question is the ambient coupling,
which belongs with the orientation owning the guard translation.

### Orientation F (falsify)

- **F-C3-01 `DRIFT-DIRECTED-COVER-CELL-FALSIFIER`.** *Fingerprint:* the drift
  statistic `drift(F) = α(F)/2 − μ(F)` with `μ = I'(1)/I(1)`, additive over
  components and invariant under isolated-vertex padding (C2-20), used as the
  **search direction** — maximize drift per unit of cover budget by knapsack
  over non-isomorphic tree cores, then evaluate the cell. This is exactly the
  method that produced the decisive `(7,7)` witness and it has been run only at
  `τ = 7` to core order 16. *Obligation:* determine which of the **37
  undetermined cells** and which of the **8 currently closed** ones survive, in
  particular the 7 cells at `(6,6)` (the best `τ = 6` cores reach drift 0.371
  against a threshold ≈ 0.44 — the gap is small and the core-order horizon was
  16) and the single `(7,8)` cell. *Closes:* the exact negative/positive
  partition of the 73 registered cells and the drift threshold stated as a
  criterion with the constant **computed** rather than observed. **Must be
  told:** the canonical census is **8 closed / 28 refuted / 37 undetermined**,
  not 5/68; its own five cells are already inside the 28. **Coordinates with
  T-C3-03: F owns the falsifier and the drift search; T owns the single-hub
  lemma and the exact threshold function.**
- **F-C3-02 `NON-LOG-CONCAVE-COVER-STRATUM`.** *Fingerprint:* attack the
  `τ ≤ 7` cover cells on the **non-log-concave** stratum, where `x` and the
  mode can separate. **Every family tested anywhere in the F orientation this
  cycle, including the decisive witness, is log-concave**, so `x` is the mode
  and the whole cover-branch test collapses to the drift of C2-20; the
  registered fences name the Kadrawi–Levit and Galvin trees precisely because
  they are where the cover branch could behave differently, and no route has
  ever pointed them at `τ ≤ 7`. The obstacle is arithmetic and stated: the KL
  fixtures have `ν = τ ∈ {12,…,16}` (verified here), so the route must build
  **low-cover non-log-concave forests** — KL residuals, Galvin cores, or hybrid
  cores carrying a non-log-concave factor under a small cover — rather than use
  the fixtures directly; the closed form makes arbitrary arm length computable
  at no new algorithmic cost. *Closes:* the `(6,6)` and `(7,8)` cells, or a
  certified statement that non-log-concavity does not reach the small-rank
  cells. *Debt:* the smallest cover size a non-log-concave core can carry.
- **F-C3-03 `PADDING-INVARIANT-NEAR-MISS-INSTRUMENT`.** *Fingerprint:* repair
  the measurement (C2-21). *Obligation, in either of two forms:* (a) prove
  `sup i_{r+1}/i_r = 1` over crossing forests with the supremum **unattained** —
  i.e. `|Δ_r|` always strictly positive but `o(i_r)` — which would be a genuine
  **Tier 3 structural reduction of the whole crossing class**, the first one
  this run has had within reach; or (b) construct a **padding-invariant**
  near-miss statistic (the drift of C2-20 is the natural candidate, being
  invariant under isolated-vertex padding by construction) and re-run the
  near-miss question under it. **This route subsumes and retires the Cycle 2
  ratio sweep; do not re-charter it.** *Debt:* the exact family where the
  supremum argument fails.
- **F-C3-04 `DEEP-CROSSING-ON-THE-WINDOW-STRATUM`.** *Fingerprint:* settle
  whether `x ≤ r−2` is **possible** on the `τ = ν = d+1` stratum. Across 3,020
  distinct seat rows and two independent critic populations (5,181 and 8,456),
  every crossing instance at `d = 5…12` sits at `x = r−1` exactly and **not one
  at `x ≤ r−2` was ever constructed** — while the canonical errata records 9,532
  crossing forests with `x = r−2` one band over, at `d = 4`, `r = 7`, and fixes
  the split as `τ ≤ d` versus `τ = d+1`. *Obligation:* a proof that `τ = d+1`
  forces `x ≥ r−1`, or a witness with `x ≤ r−2`. **This seat's ruling, and the
  reason this route is now the highest-leverage falsification route in the run:
  at `d = 5` the positive outcome *closes the diagnostic band*. Since
  `k₀(r) ≤ r`, `x ≥ r−1` implies `x ≥ k₀(r) − 1`, which is exactly the residue
  Lemma (L) leaves; composed with the unconditional `d = 5` window reduction it
  closes `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` outright.** A witness with
  `x ≤ r−2` would be equally decisive in the other direction. **Coordinates with
  U-C3-01 and does not duplicate it:** U owns the analytic second-difference
  route at `ν = τ = 6`, `d = 5`; F owns the **descent-depth structure of the
  stratum** and the general-`d` statement.

*Not re-allocated in F:* any plain order-extension census; any re-run of the
`i_{r+1}/i_r` sweep as chartered in Cycle 2; any further probing of the `τ ≤ 5`
cover cells, which the theorem closes; and "`c(d) ≠ d` for `d ≥ 31`", which the
record already asserts and which is a curiosity, not an obligation.

### Orientation U (formal/structural)

- **U-C3-01 `WINDOW-CROSSING-NARROWING`** (highest value; owns the band).
  *Fingerprint:* the residue Lemma (L) leaves. Prove, for all `r`, that a forest
  of order `2r+5` with `ν = τ = 6` and `x(F) < r` has `x(F) ≥ k₀(r) − 1`, where
  `r − k₀(r) = Θ(√r)`; equivalently `Δ_k ≥ 0` for `k ≤ k₀(r) − 2`. **This is
  where forest structure must finally enter**, and it is presently verified only
  at `r = 5…10`. *Mandatory instruments:* independently re-derive Lemma (L) as a
  further reader — the sign identity, the Hall equivalence, `Bd(r)` exactly on
  `6 ≤ r ≤ 260`, and the tail chain **with the three repairs of record** (the
  `m = b+1` boundary case; `C(b,m) ≤ 2^{2r−1−ρ}` not `2^{2r−ρ}`; and the
  `max_{ρ≥j} D ≥ 0` step that validates the `C(6,j)` over-count) — *this
  synthesis has already supplied the second reading of every exact figure, so
  the route starts from a twice-verified lemma*; the 4,065 / 192,015 crossing
  window forests as the positive test set (regenerated twice, so replay is
  cheap); and the `r = 4, 5` **graph-scope** cells, which are untested outside
  forests. **Do not** re-issue the voided "joint achievability" obligation, and
  **do not** impose the 13-vertex `τ = 5` negative control on an
  acyclicity-free argument — it cannot bite on one. *Closes:* the diagnostic
  band at `ν = τ = 6`, and with it — composed through `guardTranslation`, a
  mechanical step — the unconditional `d' ≥ 6` Tier 3c theorem over the actual
  ten guards. *Debt:* the exact `r` at which the narrowing resists, with the
  witness profile.
- **U-C3-02 `CERTIFICATE-DUAL-SIGN-LEMMA`** (Tier 3a; consumes C2-4).
  *Fingerprint:* take C2-4 as established — it has now been verified step by
  step twice, by the U adjudicator and by this seat — and attack the two nodes
  that stand between it and the matching-branch theorem. *(i)* The
  **LP-encoding fidelity step**: prove the `A_j, B_j, E_j` weights solve the
  stratified incidence LP's column equations **identically in `m, d, j`**, with
  the low/high strata split and the slack on `a_0…a_3` per gate ruling 4,
  generalizing the `(7,5)` fit to closed form. *(ii)* The **dual-sign lemma**:
  produce an `(m,d)`-uniform dual with **nonnegative** multipliers, or name the
  exact `d` at which none exists with the failure mode. *Secondary:* prove the
  all-nonpositive half when `3d > 2m+2` (currently bounded computation only).
  Carry the `D_m(t) > 0` side condition (which needs `K ≥ m−1`, true throughout
  the regime but a hypothesis) and the charter's normalisation
  `μ_{m−1} = ε_m/m` explicitly. **Must not re-derive C2-4.** *Closes:* Tier 3a
  uniform in `d`, or an exact impossibility with the threshold's true status
  named. *Debt:* the exact `d` and the dual's sign pattern there.
- **U-C3-03 `MONOTONE-RATIO-LEAN`** (the gating Lean node; the Cycle 3 Stage 7
  target). *Fingerprint:* formalise `Γ(τ,k)/Cat_{k+1}` strictly increasing in
  `k` for `k ≥ τ`, **general in `τ`**, replacing the frozen bespoke `τ = 4`
  `linear_combination` identity, **using the finitary route and carrying
  `(hk : τ ≤ k)`** — both critic-attributed and both mandatory; `Γ(τ,k) > 0` for
  `k ≥ K(τ)` with `K(1…7) = 0,2,3,4,6,12,70` and the `τ ≥ 8` ceiling then follow
  at once. Then write the **five `τ = 5` forest small-rank lemmas** at the
  exactly-located cells `(2,1,9), (3,2,11), (4,3,13), (5,4,15), (6,5,17)`, each
  acyclicity-carrying, plus `K(5) = 6` positivity, and re-declare
  `exists_subsuperset_card_eq` to reduce `τ ≤ 5` to `τ = 5`. *Deliverable:* a
  frozen draft theorem contract plus compiled fragments for `c(d) = min(d,5)`
  over forests with the guard `k < r`, `r ≥ 2`, and a **closed** DAG — in the
  **extensional** `τ = ν` form, since Mathlib at the pinned commit has no
  matching number. *Closes:* the first governed Lean award this run could carry
  off the matching branch. *Debt:* the exact `τ` at which the general
  monotone-ratio proof resists.
- **U-C3-04 `SHARED-BASE-AND-COMPOSITION`** (enabling; unblocks every award
  path). *Fingerprint:* Lean hygiene as a route. Refactor the duplicate
  `Erdos993G1.indepCount`/`coeff`/`delta` declarations across the frozen C3
  project, the C1-LA1 award run and the Cycle 2 scratch projects into one
  importable shared base module; prove the missing bridge
  `Σ_j |stratum G M k j| = coeff G k` so that the four compiled incidence
  lemmas connect to `delta` at all; package D2 so `Gamma` stops being a dead
  declaration and re-declare `binomDelta_mono`; then compose `guardTranslation`
  with the kernel-verified `ν ≥ 7` theorem in one project. *Closes:* the
  `d' = 2` / `d' = 4` / `d' = 5`-modulo-the-window band lemmas as a single
  composed Lean statement, and removes the standing prerequisite from every
  other route's award path. **Controller note: this touches frozen and awarded
  projects, so the allocation must grant standing explicitly or carry it as
  controller-level work; U4 correctly refused it for want of standing.**

### Cross-orientation coordination map

`T-C3-01 ↔ U-C3-02` (clamped-dual maximality versus LP-encoding fidelity and
the dual-sign lemma; neither re-derives C2-4). `T-C3-03 ↔ F-C3-01 ↔ F-C3-02`
(exact threshold function versus drift-directed falsification versus the
untested non-log-concave stratum; all three consume the canonical 8/28/37
census). `U-C3-01 ↔ F-C3-04` (**the band's two halves** — the analytic
second-difference chain at `ν = τ = 6`, `d = 5` versus the stratum's
descent-depth structure at general `d`; a positive result on either closes the
band, and the composition is stated in R7). `U-C3-03 ↔ T-C3-03` (the Lean
gating node consumes the cover-branch statement and the exactly-located cells;
do not re-derive the cell rule). `U-C3-04` is a prerequisite of every award
path and of `U-C3-01`'s composition into Tier 3c.

**Deliberately unallocated, with the reason.** No Cycle 3 route is chartered on
the **G1 ambient coupling**, which guard 8's never binding identifies as the
next real Tier 2 question. Realizability is settled and order-minimal;
`U-C3-01` plus `U-C3-04` deliver Tier 3c over the actual guards without it; and
no adjudicator allocated it. **It is recorded here as a named, deliberately
deferred obligation for Cycle 4**, so that its absence is visible rather than
accidental.

---

## Continuation ruling

```text
continue: yes
```

Proceed to Cycle 3 under the portfolio above. The stop gate, armed at this
close, found **no decisive event** — Tier 1 and Tier 2 are untouched, no
recovering forest exists anywhere in the record, nothing this cycle is
`formally_verified`, and the one decisive refutation targets a conjecture
internal to the method while the Tier-3c residual class provably **grows** at
every `d ≥ 6` — and **no plateau**, since the gate's plateau condition is a
conjunction whose first conjunct (an empty Cycle 2) fails outright. Under the
gate as armed, `continue: no` would require `plateau: yes` or
`headline_resolved: yes`; neither holds.

**Earliest honest continuation obligations, stated exactly.**

1. **Tier 3a.** Prove the clamped dual is the exact maximiser of `μ_{m−1}` over
   non-negative dual points, and close the **dual-sign lemma** and the
   **LP-encoding fidelity step**. C2-4 is proved and must not be re-derived;
   registration is once, in the general `(m,d)` form, with T's `[t^m]P` recorded
   as the same object.
2. **Tier 3a's complement.** Close the small-rank band `r ∈ [d, 2d−3]` (even
   `d`) / `[d, 2d−2]` (odd `d`) by per-rank construction; the even-`d` bottom
   rank is already closed by a registered VERIFIED theorem.
3. **Tier 3b.** Determine `c(d)` **exactly for `d ≥ 7`** — never "close the 73
   cells to prove `min(d,7)`", which is chartered to prove a false statement.
   Settle the single-hub worst-case question over hubs of arbitrary arity and
   over disconnected cores. Register the `(6,6)` and `(7,7)` refuted bands as
   two separate keys.
4. **Tier 3c.** Restate the window table under the proved `c(d) = min(d,5)`
   **before** any route consumes the `d = 6` band; the registered `{7}` becomes
   `{6,7}`. Record the second consecutive cycle of widening against
   `E993-R25-WINDOW-REDUCTION`.
5. **Diagnostic band.** Prove that every crossing forest of order `2r+5` with
   `ν = τ = 6` has `x(F) ≥ k₀(r) − 1` — or, in F's stronger and structurally
   more natural form, that `τ = ν = d+1` forces `x ≥ r−1`. Either closes the
   band when composed with Lemma (L) and the unconditional `d = 5` window
   reduction. The lemma cannot be an emptiness argument (the window is
   generic), cannot be a crossing-free bound (C2-9 proves every such bound is
   positive), and need not be acyclicity-sharpened (Lemma (L) uses no
   acyclicity).
6. **Tier 2.** Compose the band's closure through `guardTranslation` into the
   unconditional `d' ≥ 6` theorem over the actual ten guards. Restore the
   critic attribution to the `(4,3)` certificate on which `d' = 3` actually
   rests, and add the `r ≥ 2` guard or the `r = 1` vacuity argument. Note for
   Cycle 4 that guard 8 has never bound and the ambient coupling is the next
   real question.
7. **Tier 1.** Register (★) — the all-vertex forest form of `E993-THEOREM-B` —
   as a strict strengthening, and attack it. Nothing else in the run makes the
   crossing hypothesis do work at rank level.
8. **Stage 7.** Land the gating monotone-ratio node general in `τ`, with
   `(hk : τ ≤ k)` and the finitary route, plus the five `τ = 5` small-rank
   lemmas and `K(5) = 6` positivity, and build the shared base module. That is
   the only closed-DAG award path visible from here.

**Controller items carried up.** (i) Reconcile the two exhaustive ten-guard
census totals, **224,403** and **265,749**; neither may be quoted as "the"
population until settled. (ii) Record the `K(6) − 1 = 11` reconciliation of
allocation item 12 rather than merely striking the figure. (iii) Repair the two
Cycle 1 clone residues in `control/C2-SYNTHESIS-PROTOCOL.md` (the `S-C1` scratch
path and the "proceed to Cycle 2" gloss) before the Cycle 3 protocol is
cloned. (iv) Add the route allocation to the Cycle 3 critic capsules'
**explicit file list**, and remove the clone-residue path-hygiene paragraph
from the critic common brief — it produced false hygiene literals in at least
eight critiques across two orientations this cycle. (v) Correct the F
adjudication's abbreviated capsule-seal tail in any downstream quotation. (vi)
Act on the unanimous critic-attribution finding before Cycle 3 dispatch. (vii)
Carry the corrected census (8/28/37), the restated window table and the
struck/canonicalized figures of this synthesis as an erratum record, so Cycle 3
quotes the canonical values and never the superseded ones. (viii) **A headline
resolution fails automatic admission and is inspected by the controller by
hand** — none arose at this close. (ix) The controller review is due at this
close per `AUTHORIZATION.md`; this synthesis is written to serve it, and the
seating finding is its most actionable item.

---

## Artifact inventory

All of this seat's scratch is under the **absolute** in-root path
`<run root>/scratchpad/S-C2/`. Python 3 standard library only; deterministic;
exact integer and `fractions.Fraction` arithmetic throughout — **no floating
point enters any count, coefficient, first descent, threshold, matching number,
cover number or inequality test**. No wall-clock value is written to any file.
No sampling in any exhaustive claim. No network. No system temporary directory,
no temporary-directory environment variable and no temporary-directory command
was used at any point. **No file under any seat's, critic's or adjudicator's
scratch was read or written**, and no sealed artifact, source file, registry,
Lean project or Cycle 1 file was edited or executed in place.

| file | bytes | sha256 | role |
|---|---:|---|---|
| `synth_lib.py` | 9391 | `f3923266f3c5226c4c4d11c0f9eb17e6c902265689f8b0f7fe20d3420ae23168` | the instrument: exact polynomial arithmetic; rooted two-state forest DP **and** a deletion recursion with component factorisation for the independence polynomial, cross-validated; `coeff`/`Δ_k` with the `Δ_{−1} = 1` convention and integer zero extension; first **strict** descent; exact maximum matching for forests; exhaustive minimum vertex cover to a cap; Catalan, `Γ(τ,k)` and `K(τ)`; the charter recursion cleared to `Q_{m,d}`; the binomial second difference `D(b,m)`, `Bd(r)` and `k₀(r)`; generators for star-of-stars, `k·K_{1,3}`, paths and Kadrawi–Levit spiders |
| `synth_checks.py` | 21666 | `4078cf477c06cbe4d7e08b540126a769e945510c5968d13debafd0211cdaed86` | the 119 recorded checks, sections A–O |
| `SYNTH-CHECKS.txt` | 12153 | `2e4d1962efce17b320ee6bc675fb41429021a4654304dc7c8889e03ca7599d67` | its verbatim output: **119 checks, 119 pass, 0 fail** |
| `SYNTH-CHECKS.json` | 17526 | `2eb43099fdcf45ebd14d784644ee4d386ba7fda6dc2a66dcdf1dedcf2b49f714` | the same, machine-readable |
| `verify_seals.py` | 4058 | `9db299f3c0b47f4e22343d7e0e805d509dbea3b3b82617a63efacd6e782bf1bb` | canonical recomputation of the five stage seals, all nine member digests against disk, the Stage 5/Stage 6 digest cross-check, the path evidence, and a direct streamed read of the 295-claim run-local registry for the 21 statuses this synthesis relies on |
| `VERIFY-SEALS.txt` | 6386 | `55bd4f51bcf6cb44dcd70b8e5f625a3dd95a8c8e62f6cd1c78c6b3d1e48400ff` | its verbatim output |
| `cross_orientation.py` | 6332 | `7f78aaa1c4874e74d8bfa8eeafe8458771ff680e0e443556aa62d0ca40d7d225` | the four cross-orientation checks no single adjudicator could run: F's five padded `(7,7)` cells reproduced from `W`'s own coefficient vector; T's single-full-hub family minimised exhaustively at the same five cells; U's tree population reconciled against the canonical count; and the T/U `[t^m]` alias |
| `CROSS-ORIENTATION.txt` | 2771 | `31b0bf08cd20a240e80ad55f0e242abf6657ca411aae4cafe777a70694f09de0` | its verbatim output |
| `CROSS-ORIENTATION.json` | 2615 | `ec7468eab8b3ebb45bdd753826b7f13ff642edff11bc9981e5b532f9f4fc4aa2` | the same, machine-readable |
| `lemma_L_extended.py` | 787 | `720aa6226f1dc374098508fa408b0e6c4701498786e13ee4ea08a34692a3cb8d` | the full exact range of Lemma (L)'s bound, as a second reader |
| `LEMMA-L-EXTENDED.txt` | 197 | `da041da0a7ea43b0feb3f246b0e2f4a58dc91e01d53a08b9eafe10878d3475dd` | its verbatim output: `Bd(r) > 0` exactly at `r = 4, 5` in `[4,260]`; `Bd(r) ≤ 0` for every `r` in `[6,260]`; `r − k₀(r) = 1,1,2,3,4,5,6,9` at `r = 10,15,20,30,50,80,120,200` |

**Replay** (from the directory above; Python standard library only, exact
integers, deterministic; copy-out-first is unnecessary because nothing is
written outside this seat's own directory and every target stays inside the run
root):

```
python3 verify_seals.py      > VERIFY-SEALS.txt
python3 synth_checks.py      > SYNTH-CHECKS.txt
python3 cross_orientation.py > CROSS-ORIENTATION.txt
python3 lemma_L_extended.py  > LEMMA-L-EXTENDED.txt
```

**Disclosures, in full.**

1. **Two corrections to this seat's own expected values**, both caught by the
   instrument and both errors of mine, not of any seat, critic or adjudicator.
   (a) I initially asserted values for the `6K₂ ∪ (2r−7)K₁` fence at `r = 10, 11`
   that appear nowhere in the record; the instrument returned `10660` and
   `33202` against my invented `10648` and `33098`. The computed values govern
   and the record's own range (`r = 4…9`) is what I check against; the two
   extended rows are reported as uncommitted. (b) I initially asserted the
   `d = 3` and `d = 4` Tier-3c windows as `[4,2]` and `[6,4]`; they are `[4,3]`
   and `[5,4]`. **Both are empty under either arithmetic**, so no conclusion
   moves. Both corrections were made to my expectation, never to a computed
   value.
2. **My own raw cover-cell enumeration finds three cells the adjudicated tables
   omit**, at `(2,2)` order 6 and `(3,3)` orders 7 and 9. All three are removed
   by the exhaustive order-17 censuses and the residual is **73 exactly** either
   way; the divergence is a pre-reduction enumeration convention at `τ ≤ 3`
   only, and I canonicalize the residual, not the pre-reduction count.
3. **What I could not verify inside my read boundary**, recorded rather than
   asserted: the `(7,7)` refuted band's exact upper endpoint (my own
   single-hub-family sweep with a narrow leaf parametrization found refuted
   ranks only in `r = 9…13`, which is a property of my narrow family and not a
   limit on T's; T's exhaustive sweep establishes `r = 8…33` and I defer to it,
   noting that my `r = 9`, `r = 11` and `r = 15` minima reproduce three of the
   four `(7,7)` family values T quotes exactly); the interior of the `W`
   witness's edge structure (its coefficient vector is what my capsule carries,
   and everything I check about it is derived from that vector); the exhaustive
   census totals of 224,403 and 265,749; and the three adjudicator capsule
   seals, which are not members of my capsule.
4. **Background jobs: none started at any point**, and none required killing
   before this write. A process check immediately before the write found no
   process belonging to this seat; the single unrelated long-running service on
   the host predates this run by weeks and belongs to no seat.
5. **Model and effort:** this seat cannot self-inspect its runtime model or
   effort; the disclosure line at the head of this file is stated on
   dispatch-record authority, verbatim as instructed.

**Read set actually used.** The nine capsule members
(`SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`; `control/C2-STAGE1-GATE.md`;
`control/C2-STAGE5-PACKET-MANIFEST.json`; `control/C2-SYNTHESIS-PROTOCOL.md`;
`control/PATH-CHECK-c2-stage6-dispatch.json`; the three Stage 5 adjudications);
run-root authority (`SOLUTION-CONTRACT-ADDENDUM-1.md`;
`sources/fixtures/KL-FIXTURES.md`; `control/CLAIM-IDENTITY.run-local.json`;
`control/C1-CENSUS-ERRATA.json`; `control/C2-ALLOCATION.md`;
`cycles/cycle-1/stage6/SYNTHESIS.md`;
`cycles/cycle-1/stage7/LEAN-GATE-CLOSEOUT.md`); and, for the mandatory VerityOS
boot, the root constitution and the startup protocol. The four upstream stage
manifests were hashed for the custody chain. **No raw return, no critique, no
seat or adjudicator scratch, no other synthesis, no failed lineage, no other
experiment root, no manuscript and no external source was opened.**

**Files written by this seat:** exactly one under `cycles/` —
`cycles/cycle-2/stage6/SYNTHESIS.md` — plus the eleven scratch files
inventoried above.

**This file was reread before close:** the eleven protocol headings are present
and in order; the four required lines (`headline_resolved: no`,
`material_progress: yes`, `plateau: no`, `continue: yes`) each appear exactly
once; `## Cycle 3 route portfolio` is present with four routes per orientation;
the model disclosure line is present verbatim; no literal filesystem path
outside the run root appears anywhere; and every numeric claim was re-checked
against the recorded output of the instruments above.
