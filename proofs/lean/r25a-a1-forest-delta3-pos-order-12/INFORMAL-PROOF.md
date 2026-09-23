# Informal Proof — U-AWARD-FOREST-DELTA3-ORDER-12, the `n ≥ 12` half

Formalizer: seat `A1-LA1`, Cycle A1 Stage 7, r25 ADDENDUM. Chartered model/effort: Claude
Sonnet 5, xhigh. This document is the formalizer's own re-derivation and audit of the
mathematics, built by copying the seat's compiled project out of the sealed capsule,
re-verifying every byte-identity claim independently, and re-registering the fragments in
dependency order in a fresh governed run. It records definitions, hypotheses, proof
structure, attribution, exclusions, and the two mandatory provenance checks (R4, R5).

## 0. Governing texts

The registered statement of record is `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`, a
conjunction: "`Δ₃(F) > 0` for every finite forest of order ≥ 12; sharp at 11, where `P₁₁` is
the unique minimiser, `Δ₃ = −14`." This award formalizes the **first conjunct only** (§2). The
governing texts are the U adjudication (`cycles/cycle-A1/stage5/adjudicators/U/ADJUDICATION.md`,
`## Lean readiness`) and the admitted Cycle A1 synthesis
(`cycles/cycle-A1/stage6/SYNTHESIS.md`, `## Lean awards`, entry "U-A1-1"), which is the
statement of record.

## 1. Definitions (exact, quoted verbatim from `SEMANTIC-CONTRACT.md` / the frozen G1 source)

```lean
noncomputable def Erdos993G1.indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)
noncomputable def Erdos993G1.coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0
noncomputable def Erdos993G1.delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k
```

`i_k(F)` counts actual independent `k`-subsets once; `i_0 = 1` for every finite graph
including the empty graph; `coeff` is zero at negative integer indices (integer zero
extension); `Δ_k(F) = i_{k+1}(F) − i_k(F)`. `Δ₃(F) > 0` is a **positivity** statement, the
opposite sign from a no-recovery statement; `x(F)` (first strict descent) is **never used**
anywhere in this proof. These three definitions, and every frozen entry this proof calls, are
byte-identical to the frozen, sealed G1 source
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`
(SHA-256 `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`, cited by
`SEMANTIC-CONTRACT.md` and re-verified by this formalizer against the capsule's own digest for
`scratchpad/a1-U1/LeanProject/LeanProof/Transcribed.lean`, `74cce95f…`, itself checked against
`sources/r25-terminal/a1-stage7-sources/C-U3-F-Transcribed.lean`, same digest, confirmed
byte-identical — see `CAPSULE-VERIFICATION.json`).

## 2. Terminal declaration, exact statement, scope

```lean
namespace Erdos993G1.ForestDelta3
theorem forest_delta_three_pos_ge_twelve {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 12 ≤ Nat.card X) : 0 < Erdos993G1.delta F 3
```

Kernel-printed type (this run, confirmed by `#check`):

```text
@Erdos993G1.ForestDelta3.forest_delta_three_pos_ge_twelve :
  ∀ {X : Type u_1} [Finite X] (F : SimpleGraph X),
    F.IsAcyclic → 12 ≤ Nat.card X → 0 < Erdos993G1.delta F 3
```

Hypotheses: exactly `F.IsAcyclic` and `12 ≤ Nat.card X`. `[Finite X]` is the instance burden;
`X` implicit. `SimpleGraph.IsAcyclic` is used throughout, never `SimpleGraph.IsTree`, so no
connectivity is smuggled in and disconnected forests are genuinely covered (ENTRY 150's own
proof works per connected component, `F.connectedComponentMk a`).

**Scope (repair R1).** This award proves the **first conjunct only** of
`E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`: `Δ₃(F) > 0` for every finite forest of order
`≥ 12`. The registered statement's second conjunct — sharp at 11, `P₁₁` the unique minimiser,
`Δ₃ = −14` — is **excluded** and stays `proved_informal` (§6). Registry effect, exactly:
`E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`: `proved_informal → formally_verified` **on the
`n ≥ 12` half only**; the sharpness clause is unaffected.

**Namespace (repair R6, controller's election).** The seat's compiled declaration was
`Erdos993G1.U1.forest_delta_three_pos_ge_twelve` (`Erdos993G1.U1.*` embeds a seat token). This
run renames the containing namespace to the content namespace `Erdos993G1.ForestDelta3`
(parallel to C6-LA1's `Erdos993G1.ForestDelta2`), confirmed free in the computed dependency
closure. Binders and casts are otherwise exactly as the seat's compiled theorem; only the
namespace changed (two lines: `namespace`/`end`, diffed below). Imported fragments keep their
own namespaces byte-identically: `Erdos993G1.CritUC503F.*` (pendant identity),
`ErdosR25.CriticUC604FChain.*` (the chain), `Erdos993G1.ForestDelta2.*` (the C6-LA1 import),
and the frozen `Erdos993G1.*`/`Erdos993G1.FirstWide.*`/`Erdos993G1.ThirdWide.*` entries.
`Erdos993G1.delta`, `coeff`, `indepCount` are the frozen G1 definitions, byte-identical to
`sources/g1/lean/` as ENTRIES 1–71 carry them (via `Transcribed.lean`).

## 3. Proof architecture (node by node)

Notation: `i_k(F) = Erdos993G1.indepCount F k`; `Δ_k(F) = Erdos993G1.delta F k`.

1. **[N1, this route's own, uniform exact identity]** `Δ_0(F) = |V(F)| − 1` for any finite
   simple graph, no forest hypothesis needed (`i_1(F) = |V(F)|`, ENTRY 20; `i_0(F) = 1`, proved
   directly). Lean: `delta_zero_exact`.
2. **[imported, ENTRY 100, transcribed]** For edgeless `F` on `n` vertices,
   `Δ_k(F) = C(n,k+1) − C(n,k)` for every `k` (`Erdos993G1.U1Transcribed.indepCount_edgeless`
   plus `delta_nat`). Lean: `edgeless_delta_eq`.
3. **[imported, ENTRY 150, transcribed]** Every acyclic `F` with an edge has a leaf `l` with a
   unique neighbour `u` (`Erdos993G1.U1Transcribed.forest_leaf_of_edge`), proved per connected
   component so disconnected forests are covered. Acyclicity of `deleteVerts F {l}` and
   `ambientA F l` is obtained at every call site from ENTRY 38
   (`Erdos993G1.deleteVerts_isAcyclic`), never assumed.
4. **[N4, this route's own, exact identity]** `|V(deleteVerts F {l})| = |V(F)| − 1` and
   `|V(ambientA F l)| = |V(F)| − 2` at a leaf `l` with unique neighbour `u` (since
   `closedNeighborhood F l = {l, u}`, two distinct vertices). Lean:
   `card_deleteVerts_singleton`, `closedNeighborhood_leaf_eq`, `card_ambientA_leaf`.
5. **[imported, critic-derived, byte-identical]** The pendant identity in `Δ` form,
   `Δ_{j+1}(F) = Δ_{j+1}(F−v) + Δ_j(F−N[v])` for any vertex `v`
   (`Erdos993G1.CritUC503F.pendant_delta`), invoked at a leaf, at `j = 0, 1, 2` for ranks
   1, 2, 3 respectively. See §4 for attribution.
6. **[imported by name, byte-identical, award C6-LA1]**
   `6·Δ_2(F) ≥ n³ − 12n² + 35n − 30` for every forest of order `n ≥ 5`
   (`Erdos993G1.ForestDelta2.forest_delta_two_lower`). See §4 for the import of record.
7. **[N7, this route's own, strong induction on `n`]**
   `forest_delta_one_lower : ∀ n, ∀ F, F.IsAcyclic → Nat.card X = n → L1(n) ≤ Δ_1(F)`. Base
   `n ∈ {0,1}`: no edge possible, step 2 applies. Step `n = m+2`: case split on
   `Nat.card F.edgeSet = 0`; edgeless uses step 2; else step 3 gives a leaf, step 5 at `j=0`
   gives `Δ_1(F) = Δ_1(F−l) + Δ_0(F−N[l])`, step 1 closes the `Δ_0` term exactly, and the
   strong induction hypothesis (order `m+1 < n`) bounds `Δ_1(F−l)`.
8. **[N8, this route's own, strong induction on `n`]**
   `forest_delta_two_lower_general : ∀ n, ∀ F, … → L2(n) ≤ Δ_2(F)`. For `n ≥ 5`: step 6
   directly, no recursion. For `n < 5`: the same case split at `j = 1`, closing the `Δ_1` term
   with step 7.
9. **[N9, this route's own, strong induction on `n` — the headline lower bound]**
   `forest_delta_three_lower : ∀ n, ∀ F, … → L3(n) ≤ Δ_3(F)`. Base `n ∈ {0,1}` via step 2 at
   `k = 3`. Step `n = m+2`: the same case split at `j = 2`, closing the `Δ_2` term with step 8.
   **No base case, no enumeration, no isomorphism-completeness object anywhere in steps 7–9.**
10. **[imported, critic-derived, byte-identical modulo the one import line]** `L1`, `L2`, `L3`
    are the kernel-checked recursive integer functions of `ErdosR25.CriticUC604FChain`:
    `edgeless(n,k) = C(n,k+1) − C(n,k)`; `L1` bottoms at `edgeless(·,1)`; `L2(n) = B(n)` for
    `n ≥ 5` (`B(n) = C(n,3) − C(n,2) − n² + 5n − 5`) and recurses below 5;
    `L3(n) = min(edgeless(n,3), L3(n−1) + L2(n−2))`. See §5 (R5 provenance) for the byte-diff.
11. **[N11, this route's own, general in `n` — not a numeral table]**
    `L3_pos_of_ge_twelve : ∀ n ≥ 12, 0 < L3(n)`. Ordinary induction from the kernel-checked
    base `L3(12) = 1` (`ErdosR25.CriticUC604FChain.L3_twelve_pos`, `decide`); step: `0 <
    edgeless(n+2,3)` for `n+2 ≥ 8` (new lemma `edgeless_three_pos_of_ge_eight`, from a new
    closed-form identity `scaledChooseFour : 24·C(n,4) = n(n−1)(n−2)(n−3)`, proved by induction
    exactly like the frozen `scaledChooseTwo`/`scaledChooseThree`, giving
    `24·edgeless(n,3) = n(n−1)(n−2)(n−7)`, positive for `n ≥ 8`) and `0 < L2(n)` for `n ≥ 9`
    (new lemma `B_pos_of_ge_nine`, `nlinarith` on `B_six`). **This closes the chain for every
    `n ≥ 12`, not merely at the numerals the Lean file `decide`-checks directly.**
12. **[N12, this route's own — THE HEADLINE]**
    `forest_delta_three_pos_ge_twelve : ∀ F, F.IsAcyclic → 12 ≤ |V(F)| → 0 < Δ_3(F)`, by
    `linarith` from steps 9 and 11.

## 4. Attribution (condition (i), exact wording carried on this award's face)

- The **pendant identity in `Δ` form** is **critic-derived, r25 Cycle 5 critic C-U3-F**
  (`Erdos993G1.CritUC503F.pendant_delta`, `Crit.lean`, SHA-256
  `d8aae69d35b0539097275bd940490a5a5c88e1b2f075a4e4320049842b95a85e`), closing the step r25
  Cycle 5 **seat** U3 left as `pendant_identity_draft`, `sorry`. **Independently and
  equivalently proved** by r25 Cycle 5 critic **C-U3-T**
  (`CriticUC503.pendant_delta_identity`, `C-U3-T-CriticPendant.lean`) — **corroboration, not
  the compiled dependency** (not registered in this project's build graph).
- The **arithmetic chain** `ErdosR25.CriticUC604FChain` is **critic-derived, r25 Cycle 6
  critic C-U4-F** (`CriticUC604FChain.lean`).
- The imported **`forest_delta_two_lower`** is award **C6-LA1**
  (`Erdos993G1.ForestDelta2.forest_delta_two_lower`), critic-attributed jointly to **C-U4-T**
  (contract form, quantitative cubic) and **C-U4-F** (component-corrected bound, ENTRY-176
  instance). The dependency list names `Erdos993G1.ForestDelta2.forest_delta_two_lower` as the
  **load-bearing** C6-LA1 import (repair R4); `forest_delta_two_pos_ge_nine` is
  **present-but-unused** — it is carried in the same source file (byte-identical to the award's
  own text) but nothing in this proof calls it.
- **This cycle's seat U1's own** (re-derived and re-verified by this formalizer): the three
  strong inductions threading the pendant identity, the C6-LA1 import and the chain into one
  order-uniform argument (steps 7–9), the exact `Δ_0` identity and leaf cardinality bookkeeping
  (steps 1, 4), `scaledChooseFour`, `edgeless_three_pos_of_ge_eight`, `B_pos_of_ge_nine`,
  `L3_pos_of_ge_twelve` (step 11, positivity general in `n`), and the assembly (step 12).

Run id and cycle disclosure (repair R3), added as header comments to the two critic-derived
files before registration — the ONE permitted edit to imported text, disclosed here as in lane
B: `PendantIdentity.lean` (`Crit.lean`) carries "Origin run:
erdos-993-uniform-residual-no-recovery-dre-2026-09-20, Cycle 5"; `L123Chain.lean`
(`CriticUC604FChain.lean`) carries "Origin run:
erdos-993-uniform-residual-no-recovery-dre-2026-09-20, Cycle 6". The struck sentence "both are
attributed on the face of `PendantIdentity.lean`" does not appear anywhere in this run's
artifacts.

## 5. R5 — `L123Chain.lean` provenance (the one open link, closed inside this capsule)

The capsule ships the byte-identical r25 provenance original,
`sources/r25-terminal/a1-stage7-sources/CriticUC604FChain.lean`
(SHA-256 `f436e4ae3a15e12ffb091e7665828e991d400f843c7b076dca15c5585ee24494`, origin `r25
scratchpad/c6-crit-U4-F/LeanCritic/LeanProof/CriticUC604FChain.lean`, critic C-U4-F, r25 Cycle
6). This formalizer ran the byte-diff directly (see `CAPSULE-VERIFICATION.json`,
`r5_byte_diff`):

```text
31c31
< import LeanProof.Main
---
> import LeanProof.Transcribed
```

**Exactly the one import line differs**; no statement or proof text changed. (The seat's
project has no separate `Main.lean` holding the transcribed entries the way the critic's own
project did; they live in `Transcribed.lean` here, hence the retarget.) This closes R5: the one
open provenance link in the whole award is now verified, not merely unverified-but-not-false.

## 6. Exclusions (condition (ii); every excluded conclusion, restated)

1. **The sharpness half is EXCLUDED, not carried for trees, stays `proved_informal`.** The
   registered clause quantifies over forests; a tree-scope enumeration (C-U1-F's 235-tree
   census) cannot stand in for a forest-scope clause (the FOREST/TREE transfer the fences
   forbid); the Lean object proves nothing at order 11 and formalizing it would require a
   verified isomorphism-complete enumeration of the 710 order-11 forest classes, an enumeration
   object this method excludes by construction; the question is independently confirmed at full
   forest scope informally by the U adjudicator's own census (E6, all 710 classes,
   `min Δ_3 = −14`, unique at `P_11`).
2. **The enumeration-free wording (repair R2), exact text, the only form this award's face may
   carry:**

   > No enumeration over graphs, trees, forests or isomorphism classes occurs at any order, and
   > no `native_decide` occurs anywhere. No `Finset`- or `SimpleGraph`-typed object is
   > enumerated over a graph-indexed domain in any declaration of the closure. The single
   > kernel-evaluated numeral fact inside the closed dependency set is
   > `ErdosR25.CriticUC604FChain.L3_twelve_pos : 0 < L3 12` — a closed evaluation, in `ℤ`
   > arithmetic with no graph type in scope, of a recursive integer function at one numeral,
   > discharged by `decide` within the three standard axioms. The graph-theoretic content is
   > carried entirely by `forest_delta_three_lower`, which is proved for every order by strong
   > induction with no base case and no enumerated input.

   **Never "no `decide`"** — that is false; four `decide` calls exist in `L123Chain.lean`
   (`L2_table`, `L3_table`, `L3_twelve_pos`, `L3_thirteen_fourteen_pos`), of which only
   `L3_twelve_pos` is in this theorem's actual dependency closure (confirmed by this
   formalizer's own registration order and kernel build: `L2_table`, `L3_table`,
   `L3_thirteen_fourteen_pos` are carried in the same file but nothing in the proof calls
   them). The closure fact is confirmed, not merely asserted.
3. **No tier, band, G1 tuple or headline moves.** `d`, `ν`, `τ`, and `x(F) < r` enter nowhere.
   `Δ₃ > 0` is a positivity statement, the opposite sign from a no-recovery statement.
4. **Never described as sharpening `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`**; **never
   "the run's first unconditional forest theorem"** (C6-LA1 holds rank 2); **never translated
   into a `d`-band result**; independent of `E993-PAIR-RANK3-FOREST-MIN`.
5. **Does not move `E993-C13-I4-GT-I3`** (trees, order ≥ 12, `proved_informal`). The forest
   theorem strictly generalises it logically, but a grade does not transfer across claim keys.
6. **The order-11 add-on and the adjudicator's 710-forest census are NOT part of this award.**
7. **The internal theorems are not separately funded** beyond the controller's R8 election
   (§7): only the terminal theorem and `forest_delta_three_lower` appear as distinct registry
   entries in this run's workflow state.

## 7. R8 — registry-face election (controller's, restated)

Per the controller's election (brief §3(iii), R8): the terminal theorem is the only `theorem`
registered by this workflow; `forest_delta_three_lower` is registered as a `lemma` (its
supporting components — steps 1, 4, 7, 8, 11 above — are carried in the same registered
fragment, not separately registered); nothing else goes on the registry face. Both `theorem`
and `lemma` are semantically identical Lean keywords (Mathlib's `lemma` macro is an alias for
`theorem`); `forest_delta_three_lower` is declared with the `lemma` keyword in this run's
source purely so the governed registrar's kind-matching check can bind it as the LEMMA entry
R8 calls for — a cosmetic keyword choice on this route's own new work, not a change to any
statement or proof text of an imported fragment.

## 8. R7 — literal correction

Any quotation of the return's evidence-generator check count reads **39**, not 34 (the return's
own text undercounted its own shipped generator's output; corrected here per repair R7).

## 9. R2 closure-fact confirmation (independent, this run)

Confirmed directly from this run's own registration order and kernel build: `L2_table`,
`L3_table`, `L3_thirteen_fourteen_pos` (three of the four `decide` calls in
`ErdosR25.CriticUC604FChain`) are declared in the registered fragment but are never invoked by
any declaration on the path from `forest_delta_three_lower`/`L3_pos_of_ge_twelve` to the
terminal theorem; `L3_twelve_pos` alone is invoked (in `L3_pos_of_ge_twelve`'s base case). No
`Finset`- or `SimpleGraph`-typed object is enumerated anywhere in the registered project (swept
for `Finset.univ.filter`/`decide`/`native_decide` over a graph-indexed domain; none found
outside the four numeral `decide` calls on `L2`/`L3`, which range over no graph type).

## 10. Axioms and completeness

No `sorry`, `admit`, or `native_decide` anywhere. Every registered declaration is axiom-clean
within `propext`, `Classical.choice`, `Quot.sound` (see `EVIDENCE/axioms.txt`,
`EVIDENCE/axioms-full-sweep-raw-probe.log`). Kernel verification (`lake build`, single-file
check, axiom policy) passed; see `RECEIPTS/kernel-verification.json`.

## 11. What this document does not claim

This document and this run do not claim `formally_verified` registry status (that requires the
independent fidelity review and `close`, neither of which this seat runs), mathematical truth
beyond the exact audited contract, novelty, or publication readiness. Status: `compiled-candidate`.
