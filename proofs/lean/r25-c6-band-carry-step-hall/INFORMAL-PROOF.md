# Informal proof — award group `C6-LA2`, `E993-R25-BAND-CARRY-STEP-HALL`

Stage 7 terminal formalization, cycle 6 (the charter's LAST cycle) of run
`erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`. Registry
effect / key: `E993-R25-BAND-CARRY-STEP-HALL`. This document is the
`theorem_intent` source material for `THEOREM-CONTRACT.yaml`.

## 0. Provenance and attribution (brief condition (i))

This proof is **critic-attributed to C-F3-T and C-F3-U for ALL THREE
theorem-level declarations** (node (i) the cover-fiber partition identity,
node (ii) the König saturation lemma, and the composed target
`bandCarryStepHall`), on seat F3's unmodified `clamp_lemma` and
`Arithmetic.lean`. This is stated on the award's face per the precedent of
`E993-R25-MATCHING-DUAL-SCALAR-CORE`'s critic-attributed induction step
(`runs/lean-2026-09-22-c5-matching-dual-scalar-core/`).

- **Seat F3** (`cycles/cycle-6/stage3/returns/F3/RETURN.md`): the arithmetic
  layer (`C`/`E`/`D`/`Mclamped`/`Bd`, renamed `choose`/`E`/`D`/`Mclamped`/`Bd`
  here per mandatory repair (3)), the clamp lemma, and the exact statements
  of nodes (i), (ii) and the composed target (all three left `sorry` in the
  seat's own `GraphNodes.lean`).
- **Critic C-F3-T** (`cycles/cycle-6/stage4/critics/F3/T/CRITIQUE.md`,
  `scratchpad/c6-crit-F3-T/lean-crit/Crit/{Node1,Node2,Node3,SeatLiteral}.lean`):
  the PRIMARY complete proofs of node (i) (`coverFiberPartitionIdentity`),
  node (ii) (`konigSaturation`) and the composition (`bandCarryStepHall`),
  discharging all three of the seat's `sorry`s on the seat's own literal
  statements. This Stage 7 project re-derives and re-proves the same three
  declarations independently (fragment by fragment, re-typed and re-checked
  against pinned Mathlib, per the governed workflow's requirement never to
  trust compiled material without re-verification), following C-F3-T's
  construction as the primary route, with the mechanical renames the
  mandatory repairs require (`Cv → C`, the binomial `C`/`Crit.C` → `choose`).
- **Critic C-F3-U** (`cycles/cycle-6/stage4/critics/F3/U/CRITIQUE.md`,
  `scratchpad/c6-crit-F3-U/lean-critic/LeanProof/{CriticNode,CriticKonig,
  CriticCompose}.lean`): an independent, mutually corroborating FALLBACK
  proof of all three declarations, in a separate namespace with its own
  bridge to the seat's literal statements (`rfl` definitional bridges). Not
  transcribed into this project's `Main.lean` (C-F3-T's route was used as
  primary and compiled cleanly, so the fallback was not needed), but its
  independent existence is part of the evidentiary record this Stage 7
  project relies on for confidence that the construction is correct, per
  the F adjudication's own finding (`## Lean readiness`): "two isolated
  critics, who could not see each other, proved the same three statements
  by two different constructions, and a third party [the F adjudicator]
  rebuilt both."
- **F adjudication** (`cycles/cycle-6/stage5/adjudicators/F/ADJUDICATION.md`,
  `## Lean readiness`): rebuilt both critic constructions from fresh
  copies, confirmed `sorryAx`-free on all three declarations for both, and
  ruled the award group **CONTRACT-READY** for the terminal Stage 7, naming
  the five mandatory repairs discharged below.
- **Cycle 6 synthesis** (`cycles/cycle-6/stage6/SYNTHESIS.md`, `## Lean
  awards`, "Dispatch 2"): the admitted, governing statement of record for
  this dispatch, reproduced in full in `THEOREM-CONTRACT.yaml`'s
  `theorem.informal_statement`.

## 1. Definitions, exactly as the compiled sources state them

All definitions are the G1 semantics of `SEMANTIC-CONTRACT.md`, re-declared
in this project's own namespace `ErdosR25BandCarryStep` (not imported as a
build dependency of the frozen G1 project, per the award statement: "this
award uses the seat's own definitions ... which re-declare the G1
semantics for this project"). Every definition below is `lean_name`-exact
to the compiled `Main.lean` of this run.

**Arithmetic layer** (from seat F3's `Arithmetic.lean`, carried verbatim
except the repair-(3) rename):

- `choose (n : ℕ) (k : ℤ) : ℤ := if 0 ≤ k then (n.choose k.toNat : ℤ) else 0`
  — the zero-extended binomial coefficient. **Renamed from the seat's `C`**
  (mandatory repair (3): the seat's `C` collided with the cover binder `C`
  used throughout the graph layer; the binomial is renamed here so the
  theorem statement's binder `C` stays exactly as the award's exact form
  requires).
- `E (n : ℕ) (k : ℤ) : ℤ := choose n (k + 1) - choose n k`.
- `D (b : ℕ) (m : ℤ) : ℤ := choose b (m + 1) - 2 * choose b m + choose b (m - 1)`
  — the second difference; `D_eq_diff_E` proves `D b m = E b m - E b (m - 1)`.
- `capTerm (b : ℕ) (m : ℤ) : ℕ := (max 0 (D b m)).toNat`.
- `Mclamped (r a : ℕ) (m : ℤ) : ℕ := if a ≤ 2 * r - 1 then (Finset.range (2 * r - a)).sup (fun b => capTerm b m) else 0`
  — the RANGED clamp, range `b ≤ 2r − 1 − a`; **the range is load-bearing**
  (fence, §2 below).
- `Bd (r : ℕ) (k : ℤ) : ℤ := D (2 * r - 1) k + Σ_{a=1}^{6} choose(6,a) · Mclamped r a (k - a)`
  — the RANGED object of record (`control/C4-CONTROLLER-ERRATA.json`
  erratum `C4-E-c`).
- `clamp_lemma`: a general, graph-free Finset-sum bound (`∑ x ∈ t, f x ≤ n · B`
  given `t.card ≤ n`, `0 ≤ B`, `∀ x ∈ t, f x ≤ B`); not graph-theoretic,
  not proposed for registration (alias check, §5).

**Graph layer** (the G1 definitions, quoted verbatim from
`SEMANTIC-CONTRACT.md`, itself quoting the verified
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` entries 1–3, SHA-256
`aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`):

- `indepCount F k := (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)`.
- `coeff F k := if 0 ≤ k then indepCount F k.toNat else 0` — integer zero
  extension below `k = 0`.
- `delta F k := coeff F (k + 1) - coeff F k` — this is `Δ_k(F)` of the
  run's symbol table.
- `nonCover C := Finset.univ \ C` — the non-cover side `B`.
- `bFinset C S := nonCover C \ S.biUnion (fun v => F.neighborFinset v)` —
  `b_S = |B ∖ N(S)|` in the ORIGINAL graph `F`.
- `partner M v` — the `M`-matching partner of `v` (junk value `v` if
  unmatched); the only declaration in this project elaborated under a
  local `Classical.propDecidable` instance (§4 below).

## 2. Hypotheses and where they enter

The terminal declaration's hypothesis set, exactly as bound:

```lean
theorem bandCarryStepHall {V : Type u} [Fintype V] [DecidableEq V]
    {F : SimpleGraph V} [DecidableRel F.Adj] (r : ℕ)
    (hcard : Fintype.card V = 2 * r + 5)
    (C : Finset V) (hC : F.IsVertexCover (↑C : Set V)) (hCcard : C.card = 6)
    (M : F.Subgraph) (hM : M.IsMatching) (hMcard : M.verts.ncard = 12)
    (k : ℤ) :
    delta F k - delta F (k - 1) ≤ Bd r k
```

- `hcard : Fintype.card V = 2 * r + 5` — order `2r + 5`. **`d = 5` enters
  ONLY through this order**; no other occurrence of `5` in the proof
  encodes the excess.
- `hC : F.IsVertexCover (↑C : Set V)`, `hCcard : C.card = 6` — a vertex
  cover of size `6`, giving `τ(F) ≤ 6`.
- `hM : M.IsMatching`, `hMcard : M.verts.ncard = 12` — a matching saturating
  `12` vertices (`6` edges), giving `ν(F) ≥ 6`. Since `ν(F) ≤ τ(F)` always,
  these two hypothesis groups TOGETHER give **exactly `ν(F) = τ(F) = 6`**
  — not merely sufficient, equivalent: `IsMatching` forces `M.verts` to be
  perfectly paired, so `12` vertices is `6` edges and `ν ≥ 6`; the cover
  gives `τ ≤ 6`; `ν ≤ τ` closes it to `ν = τ = 6`. The matching itself
  (not merely its cardinality) is consumed by the proof: node (ii)'s
  `partner` map is a saturating injection `C → B` built directly from `M`.
- `r ≥ 4` is **derived inside the proof** (`bandCarryStepHall`'s own first
  step), from `12 = M.verts.ncard ≤ Fintype.card V = 2r + 5`. This is what
  makes the range `0 ≤ b ≤ 2r − 1 − a` of `Mclamped` non-empty for every
  `a ∈ [1,6]`, so the target statement is **complete as written** — no
  missing hypothesis.
- `x(F) < r` **enters nowhere** in the statement or the proof.
- **Acyclicity enters nowhere** — the proof is graph-general given
  `ν = τ`; independently evidenced by `EVIDENCE/verify_band_carry_step_hall.py`'s
  third graph (`build_graph_C`), which contains a genuine cycle
  (cover-internal edge `0–1` plus the two-edge path through the shared
  satellite vertex `12`) and still satisfies the carry step with zero
  violations.

## 3. Proof, node by node

### Node (i) — the cover-fiber partition identity (`coverFiberPartitionIdentity`)

For ANY finite simple graph and ANY vertex cover `C` (no `ν = τ` needed —
only that `B = V ∖ C` is independent, automatic from the definition of a
cover):

```
coeff F k = Σ_{S ⊆ C, S independent} choose(b_S, k − |S|)
```

*Proof.* An independent `k`-set `T` splits uniquely into `T ∩ C = S` (some
independent `S ⊆ C`) and `T ∖ C ⊆ b_S = B ∖ N(S)` (an arbitrary
`(k − |S|)`-subset of `b_S`, since nothing in `b_S` is adjacent to `S`,
and `B` itself is independent). Formally: `Finset.card_eq_sum_card_fiberwise`
groups the `{T | F.IsNIndepSet k T}` finset by `T ↦ T ∩ C`, and each fiber
over a fixed `S` is shown, by an explicit bijection
`T ↦ T ∖ C`, `U ↦ U ∪ S` (`Finset.card_nbij'`), to have cardinality
`choose(b_S, k − |S|)` (`Finset.card_powersetCard`). The `|S| > k` branch is
closed by emptiness (`S ⊆ T` forces `|S| ≤ k`), not by arithmetic — natural
subtraction is never relied on. Negative `k`: both sides are `0` by the
same `if 0 ≤ k` zero extension on `coeff` and on `choose`.

**Consequence recorded separately** (per the award statement, §2 of the
Stage 7 brief): the once-DIFFERENCED form of this identity,
`Δ_k(F) = Σ_S [choose(b_S,k−|S|+1) − choose(b_S,k−|S|)]`, is exactly the
registered `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`. Node (i) above is the
UNDIFFERENCED count identity and is, under integer zero extension, the
DEEPER lemma (telescoping from `k = −1` recovers the differenced form).
This Lean proof is, in substance, **the first Lean proof of
`E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`** (registry grade
`independently_adjudicated_informal_proof_no_formal_award`), reached via
`delta_fiber`/`carry_fiber` (the once- and twice-differenced corollaries
registered as separate lemmas in this project).

### Node (ii) — the König/Hall saturation lemma (`konigSaturation`)

Given a matching `M` with `M.verts.ncard = 2·|C|` (packaging `ν(F) = τ(F) = |C|`
as the matching itself, per §2), for every `S ⊆ C`:
`b_S ≤ |B| − |S|` (equivalently `|N(S) ∩ B| ≥ |S|`, the Hall condition).

*Proof.* Let `φ` be the partner map of `M` (a fixed-point-free involution
of `M.verts`). Every `M`-edge is an `F`-edge, hence meets `C` (the cover
property), so `φ` maps `M.verts ∖ C` INJECTIVELY into `M.verts ∩ C`.
Counting with `|M.verts| = 2|C|` and `|M.verts ∩ C| ≤ |C|` forces both
halves to have size EXACTLY `|C|`, hence `C ⊆ M.verts` and, by the
involution, `φ` carries `C` back into `M.verts ∖ C` (i.e. into `B`, since
`M.verts ∖ C ⊆ B` follows from `C` being exactly the cover-side of
`M.verts`). Restricting `φ` to `S ⊆ C` gives an injection `S → N(S) ∩ B`,
so `|N(S) ∩ B| ≥ |S|`, i.e. `b_S = |B ∖ N(S)| ≤ |B| − |S|`. This is the
**only** place `ν = τ` enters in the whole proof.

**Natural-vs-integer subtraction is not a hole** (recorded explicitly,
finding F of critic C-F3-T's critique): the conclusion's `ℕ`-subtraction
`(nonCover C).card - S.card` would only STRENGTHEN the claim under
truncation, and truncation cannot occur here because the injection forces
`|S| ≤ |C| ≤ |B|` — verified by proving the lemma, not asserted.

### The composition — `bandCarryStepHall`, PROVED

Working from `carry_fiber` (node (i), twice differenced):
`Δ_k − Δ_{k−1} = Σ_{S ⊆ C indep} D(b_S, k − |S|)`. Split the fiber sum by
`a = |S| ∈ [0,6]` (`Finset.sum_fiberwise_of_maps_to`, since every
independent `S ⊆ C` with `|C| = 6` has `|S| ∈ [0,6]`):

- The `a = 0` fiber is exactly `{∅}` (`S.card = 0 ↔ S = ∅` for a `Finset`),
  with `b_∅ = |B| = 2r − 1` (from `hcard`, `hCcard`), giving the head term
  `D(2r−1, k)` **exactly**, not as a bound.
- Each `a ≥ 1` fiber has AT MOST `choose(6,a)` members
  (`Finset.card_powersetCard`, using `hCcard`), and each term is bounded by
  `Mclamped r a (k−a)` via node (ii) (`b_S ≤ 2r−1−a`, exactly membership in
  the ranged `sup`'s domain) composed with `Finset.le_sup`; the (unmodified)
  `clamp_lemma` closes each fiber: `Σ ≤ choose(6,a) · Mclamped r a (k−a)`.

Summing the head term and the six clamped strata gives `Bd r k` exactly as
defined. `r ≥ 4` is derived (§2) inside this same proof, from
`hMcard`/`hcard`, discharging the `if a ≤ 2r−1` guard inside `Mclamped` for
every `a ∈ [1,6]`.

## 4. The `Classical.propDecidable` instance bridge — mandatory repair (4)

**Where the originating construction needed it.** The originating critic
construction (`Crit/SeatLiteral.lean`) needed the explicit bridge
`convert h using 2 <;> congr 1 <;> exact Subsingleton.elim _ _` because it
combined TWO files elaborated under DIFFERENT decidability conventions: the
seat's `GraphNodes.lean` declares `attribute [local instance]
Classical.propDecidable` for its WHOLE FILE (affecting the `DecidablePred`
instance baked into its `Finset.filter (fun S => F.IsIndepSet ...)` terms),
while the critic's `Crit/Node1.lean` (no such attribute; `[DecidableRel
F.Adj]` alone suffices to derive the same `DecidablePred` instance from
Mathlib) proves the SAME statement shape under the MATHLIB-DERIVED
instance. These are two different (though propositionally/`Subsingleton`-
equal) realizations of the same `Decidable` proposition, so a direct `exact`
between them fails and the bridge is needed to reconcile them.

**Why this project needs no such bridge.** This project is a single,
self-contained re-derivation (per §4 of the Stage 7 brief: "copy the
sources out and re-register fragment by fragment, re-proving as you go"),
not a composition of two independently-elaborated files. Verified
empirically (`EVIDENCE/build.log`, zero errors) rather than merely argued:
`Classical.propDecidable` is declared as a `local instance` in EXACTLY one
place in this project — a `section PartnerConstruction ... end
PartnerConstruction` block wrapping ONLY the definition of `partner`
(needed there, and only there, to decide the general existential
`∃ w, M.Adj v w`). The section closes immediately afterward. Every
`IsIndepSet`/`IsNIndepSet`-filtered `Finset.filter` in this project — in
node (i)'s `coverFiberPartitionIdentity`/`delta_fiber`/`carry_fiber` AND in
the composition's own `set P := C.powerset.filter (fun S => F.IsIndepSet
...) with hP` — is elaborated OUTSIDE that section, so all of them resolve
their `DecidablePred` instance from `[DecidableRel F.Adj]` alone,
consistently, and no two occurrences of the same filter predicate can ever
pick different `Decidable` witnesses. This is confirmed by the successful
`rw [carry_fiber C hC k]` step inside `bandCarryStepHall`'s own proof,
which substitutes node (i)'s already-elaborated filter term directly into
the goal with no `convert`/`Subsingleton.elim` bridge anywhere in this
project's `Main.lean` (grep-verified: zero occurrences of `Subsingleton.elim`
in `LeanProject/LeanProof/Main.lean`).

## 5. Alias check

This route registers no new claim; `bandCarryStepHall` is, by construction,
`E993-R25-BAND-CARRY-STEP-HALL` (Cycle 5 registration R2), not a new key.
`clamp_lemma` is a general `Finset`-sum lemma with no graph content, not
proposed for registration. `D_eq_diff_E` is the first Lean encoding of a
step already performed in the Cycle 5 F3 return's prose. As recorded in
§3, node (i) is in substance the first Lean proof of the registered
`E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` (differenced form, equivalent
under integer zero extension) — recorded here and on the report's face,
never itself registered as a new key by this formalizer (registration is
the controller's, after synthesis).

## 6. Scope exclusions (brief condition (ii); mandatory fences, §2 of the brief)

**FIXED-BAND `d = 5`, named as such.** `d` enters ONLY through the order
`2r + 5`. `x(F) < r` enters nowhere. Acyclicity enters nowhere (graph-general
given `ν = τ`, positively evidenced above and in
`EVIDENCE/verify_band_carry_step_hall.py`'s third, genuinely cyclic graph).
`Bd` is the RANGED object, and the range `b ≤ 2r−1−a` is load-bearing (node
(ii) is precisely what supplies it: without it, `Mclamped`'s domain would
have to be taken unranged, and the unranged object is `≥ 0` far past
`r = 5`, per `control/C4-CONTROLLER-ERRATA.json` erratum `C4-E-c`). `r ≥ 4`
is derived inside the proof, not assumed.

**An award here gives `E993-R25-FOURTH-BAND-CLOSE-ALL-R` a SECOND formally
verified INPUT — NOT a closure.** That composition stays `proved_informal`
at its weakest link; the arithmetic tail (`E993-R25-BD-TAIL-NEGATIVE`,
`U-C6-02`'s object), the general half of `c(5) = 5`, Corollary F at `d = 5`
and the finite part are UNTOUCHED by this Stage 7 formalization. This
theorem bears on NO tier, on FOREST/TREE/TRANSFER, or on Erdős #993; it is
**progress toward no tier**; however completely formalized, it resolves no
headline.

## 7. Shipped-file literal and axiom sentence (mandatory repair (1))

**The seat's `THEOREM-CONTRACT.yaml` `constructivity.rationale` said
`sorryAx` was explicitly present on "two" of the three theorem-level
declarations of the seat's own `GraphNodes.lean` — this was WRONG and is
NOT carried into this project's contract.** Both Cycle 6 critics struck
this literal (C-F3-T's critique, "Certification audit" item 3; C-F3-U's
critique, "Certification audit" item 2): `sorryAx` was present on **ALL
THREE** of the seat's theorem-level declarations
(`coverFiberPartitionIdentity`, `konigSaturation`, `bandCarryStepHall`),
confirmed by the build log's three `sorry` warnings and by the DAG table
elsewhere in the same (self-contradicting) seat contract, which correctly
marked all three `STATED_NOT_PROVED`. This project's
`THEOREM-CONTRACT.yaml` states "all three", not "two of three" (mandatory
repair (1), discharged).

This project's own 35 registered declarations are **entirely `sorry`-free**
(`success_criteria.sorry_free: true`, mandatory repair (2), discharged):
`grep -c 'sorry\|admit\|native_decide' LeanProject/LeanProof/Main.lean` = 0;
every declaration's axioms are printed in
`EVIDENCE/axiom-check-all-declarations.txt` and are all within the three
standard axioms `[propext, Classical.choice, Quot.sound]` (four
declarations — `choose`, `E`, `D`, `capTerm` — depend on no axioms at all,
a strict subset of the permitted set; `D_eq_diff_E` depends on `[propext]`
alone). Zero `sorryAx` anywhere in the log.

## 8. Numeric evidence (brief condition (iv))

`EVIDENCE/verify_band_carry_step_hall.py` (standard library only: `math`,
`json`, `hashlib`, `itertools`; import list stated at the top of the file
itself), digested output
`EVIDENCE/band-carry-step-hall-instance-check.out.json` (no wall-clock, PID
or host field):

1. The RANGED `Bd`, reconstructed independently in Python from the erratum
   text (not transcribed from the Lean source), matches the canonical
   figures on the diagonal `r = 2..10` and the named checkpoints
   `Bd(4,4) = 48`, `Bd(5,5) = 33`, `Bd(6,6) = −16`, `Bd(10,10) = −14406`
   exactly, plus a full grid `r ∈ [2,9] × k ∈ [−3,20]` (192 cells) whose
   sign profile matches the expected `Bd(r,r) ≥ 0 ⟺ r ∈ {2,3,4,5}` exactly.
2. Three explicit, independently constructed graphs of order 13 (`r = 4`)
   — a forest (`6K₂` plus one isolated vertex), a second forest (`6K₂` plus
   one multi-hub satellite vertex), and a genuinely NON-forest graph (the
   same multi-hub construction plus one cover-internal edge, containing a
   cycle, verified acyclic-or-not by explicit union-find, NOT assumed) —
   each independently confirmed by BRUTE FORCE (exhaustive matching and
   vertex-cover search, not construction) to have `ν = τ = 6`; the
   cover-fiber partition identity (node (i)) matches full `2^13` subset
   enumeration exactly at every tested `k`; the carry-step inequality holds
   with **zero violations** on all three, including the cyclic one (tightest
   slack `0` in every case, so the bound is attained, not vacuous).

`all_checks_passed: true` (`EVIDENCE/band-carry-step-hall-instance-check.out.json`).

## 9. Kernel evidence

`RECEIPTS/kernel-verification.json`: `verdict.code = "verified"`,
`verdict.verified = true`; all 11 checks (`path_containment`,
`pinned_project`, `incomplete_proof_scan`, `unsafe_execution_scan`,
`execution_sandbox`, `toolchain`, `project_build`, `single_file`,
`axiom_probe`, `axiom_policy`, `source_immutable`) `"passed"`.
`EVIDENCE/build.log`: `Build completed successfully (8657 jobs)`, exit 0.
`EVIDENCE/axiom-check-all-declarations.txt`: all 35 registered declarations
axiom-printed, zero `sorryAx`.

## Remaining gates (not run by this formalizer)

No reviewer assignment, no informal proof-integrity audit, no independent
fidelity review, no `close`, no `formally_verified` claim. This document
and the accompanying receipts establish `compiled-candidate` status only.
