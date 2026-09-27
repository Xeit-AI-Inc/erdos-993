# INFORMAL PROOF — award C3-LA1 (r30 Cycle 3 Stage 7)

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (Erdős #993). Workflow run root
`runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall`. Producer `c3-la1-formalizer-opus-20260927`
(chartered Claude Opus 5.5 / high; runtime-reported model id `claude-opus-5-5[1m]`). Date 2026-09-27.

This is a statement-level proof of the one terminal theorem of the award. It follows the dependency DAG frozen by
`cycles/cycle-3/stage6/SYNTHESIS.md` (`## Lean awards`, C3-LA1). It says where finiteness, decidability, the
`Aut`-invariance of `favorableLeaves G p` and the class-union identity enter. It asserts nothing beyond the statement below.

## 1. Statement

Setting: `V` a type with `[Fintype V] [DecidableEq V]`; `G : SimpleGraph V` with `[DecidableRel G.Adj]`; `p : ℕ`. No other
hypothesis: no `IsTree`, no eligibility, no `p ≥ 1`. `Γ` is all of `G ≃g G`. The tag set is `F := favorableLeaves G p`.

```lean
theorem weightedHall_iff_autOrbitQuotientHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) :
    WeightedHall G (favorableLeaves G p) p ↔
      ∀ 𝒮 ⊆ (indepFamily G (p + 1)).image (orbitOf G (p + 1)),
        ∑ O ∈ 𝒮, supply G (favorableLeaves G p) O ≤
          ∑ O' ∈ ((indepFamily G p).image (orbitOf G p)).filter
              (fun O' => ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A),
            supply G (favorableLeaves G p) O'
```

(namespace `E993Transport`; `open SimpleGraph`; `open scoped Classical`; `variable {V : Type*} [Fintype V] [DecidableEq V]`.)
This is C-U1-T's `crit_weightedHall_iff_orbitQuotientHall` (frozen `sources/c3-stage7-sources/C-U1-T-CritAdv.lean`,
`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`, lines 77–139) with the name changed and nothing else.

In words. `I_j := indepFamily G j` is the set of independent `j`-subsets of `V`. `w(B) := activeWeight G F B` is the number of
tags `v ∈ F ∩ B` that are ACTIVE in `B`, meaning `(B ∖ {v}) ∩ W_v ≠ ∅` with `W_v = N_G(s_v) ∖ {v}` (`tagWitnesses`). An
inactive tag is not counted. `transportRel G B A` is exactly (D) ∪ (S): (D) `A = B ∖ {q}` for some `q ∈ B`, or (S) some
`u ∉ B` has `|N_G(u) ∩ B| = 2` and `A = (B ∖ N_G(u)) ∪ {u}`. `WeightedHall G F p` says: for every `X ⊆ I_{p+1}`,
`Σ_{B∈X} w(B) ≤ Σ_{A ∈ N(X)} w(A)`, where `N(X) = {A ∈ I_p : ∃ B ∈ X, transportRel G B A}`. For `B ∈ I_j`, `orbitOf G j B` is
the set of members of `I_j` that equal `γ(B)` for some automorphism `γ`. For a family `O`, `supply G F O = Σ_{B∈O} w(B)` (its
orbit total when `O` is an orbit).

The right-hand side is Hall's condition on the orbit quotient. Source nodes are the `Aut(G)`-orbits of `I_{p+1}`, and target
nodes are the orbits of `I_p`. Node weights are orbit totals. There is an arc `O → O'` iff SOME member `B ∈ O` and SOME member
`A ∈ O'` satisfy `transportRel G B A`. The theorem says that weighted Hall on the original network holds iff Hall holds on
this quotient. It is an equivalence of two Hall CONDITIONS. It asserts neither side.

## 2. Dependency DAG (as frozen by the synthesis)

`weightedHall_iff_invariant` (C2-LA1 entry 76) → invariant ⇔ union of orbits (`invariant_iff_orbitOf_subset`, with
`mem_orbitOf_self`, `orbitOf_subset_of_mem_invariant`) → orbits partition the layer (`crit_map_map_aut`,
`crit_orbitOf_eq_of_mem`, `crit_orbitOf_subset`, `crit_orbits_pairwiseDisjoint`, `crit_biUnion_orbits`) → supply of an orbit
union = sum of orbit totals (`crit_supply_eq_sum_orbits`, `crit_sum_biUnion_orbits`) → the covered set of an invariant family is
a union of target orbits (`covered_orbitUnion`) → the terminal iff.

## 3. Lemmas, in dependency order

**L0 (carried; C2-LA1 entry 76, `weightedHall_iff_invariant`; companion, not re-certified here).** `WeightedHall G F p` holds iff
the Hall inequality holds for every `X ⊆ I_{p+1}` that is invariant (`famMap G γ X = X` for every automorphism `γ`). The (⇒)
direction is a specialisation. The (⇐) direction is the supermodular-maximizer argument of C2-LA1. If Hall fails, the
deficiency `φ(X) = supply(X) − w(N(X))` (computed in ℤ) has a positive maximum. The least maximizer `canonMin` is
automorphism-invariant (`canonMin_famMap`). That lemma needs `F` to be `Aut`-invariant. For `F = favorableLeaves G p` this is
C2-LA1 entry 41 (`favorableLeaves_map_aut`), which holds unconditionally. **This is the only place where the
`Aut`-invariance of the tag set enters the proof.** It is a carried, kernel-checked companion. Its proof is C2-LA1's and is
not redone here.

**L1 (U1, `mem_orbitOf_self`).** If `B ∈ I_j` then `B ∈ orbitOf G j B`, by the identity automorphism `Iso.refl`, whose
underlying embedding is `Function.Embedding.refl`, and `Finset.map_refl`.

**L2 (U1, `orbitOf_subset_of_mem_invariant`).** If `X` is invariant and `B ∈ X`, then `orbitOf G j B ⊆ X`. If
`B' = γ(B)` then `B' ∈ famMap G γ X` (`mem_famMap`, C2-LA1 entry 59), and `famMap G γ X = X`. (The binder
`hXsub : X ⊆ I_j` is unused. It is kept byte-identical, fence 4.)

**L3 (U1, `invariant_iff_orbitOf_subset`).** For `X ⊆ I_j`: `X` is invariant iff `∀ B ∈ X, orbitOf G j B ⊆ X`. (⇒) is L2.
(⇐) Fix `γ`. Every member of `famMap G γ X` is `γ(B)` for some `B ∈ X`. It lies in `I_j` (`mem_indepFamily_map`, entry 61),
so it lies in `orbitOf G j B ⊆ X`. Hence `famMap G γ X ⊆ X`. **Finiteness enters here.** `famMap G γ X` has the same
cardinality as `X` (`card_famMap`, entry 69, because `γ` is injective). A subset of a finite set with at least its
cardinality equals it (`Finset.eq_of_subset_of_card_le`).

**L4 (U1, `covered_orbitUnion`).** If `X ⊆ I_{p+1}` is invariant then `covered G p X = N(X)` is invariant:
`famMap G γ (covered G p X) = covered G p (famMap G γ X) = covered G p X` (`covered_famMap`, entry 62, which uses
`transportRel_map_aut`, entry 45). This is where (D) ∪ (S) is used: automorphisms preserve the relation. (Its `hXsub` binder
is unused and kept byte-identical, fence 4.)

**L5 (C-U1-T, `crit_map_map_aut`).** `δ(γ(s)) = (γ ≫ δ)(s)` for Finset images. This is `Finset.map_map`.

**L6 (C-U1-T, `crit_orbitOf_eq_of_mem`).** If `B' ∈ orbitOf G j B` then `orbitOf G j B' = orbitOf G j B`. Write
`B' = γ(B)`. Then `δ(B') = (γ ≫ δ)(B)`, and `δ(B) = (γ⁻¹ ≫ δ)(B')` by `map_map_symm_self` (entry 43). Membership in `I_j` is
part of both filters. So orbits are equivalence classes of the layer, because `Aut(G)` is a group (identity L1, composition
L5, inverse). This uses the FULL automorphism group. It needs no `Fintype (G ≃g G)`, because `orbitOf` filters the finite
layer instead of taking an image of `Aut(G)`.

**L7 (C-U1-T, `crit_orbitOf_subset`).** `orbitOf G j B ⊆ I_j` (`Finset.filter_subset`).

**L8 (C-U1-T, `crit_orbits_pairwiseDisjoint`).** For any `Y`, the distinct orbits in `Y.image (orbitOf G j)` are pairwise
disjoint. A common member `C` of two orbits `O₁` and `O₂` gives `O₁ = orbitOf C = O₂` by L6.

**L9 (C-U1-T, `crit_biUnion_orbits`).** If `Y ⊆ I_j` is orbit-closed (`∀ B ∈ Y, orbitOf G j B ⊆ Y`), then the union of its
orbits is `Y`. (⊆) is closure. (⊇) is L1.

**L10 (C-U1-T, `crit_supply_eq_sum_orbits`), the class-union identity.** For orbit-closed `Y ⊆ I_j` and any `F`:
`supply G F Y = Σ_{O ∈ Y.image (orbitOf G j)} supply G F O`. Rewrite `Y` as the union of its orbits (L9). Then a sum over a
pairwise-disjoint union is the sum of the parts (`Finset.sum_biUnion` with L8). **The class-union identity enters here**, and
again as L11. It is pure bookkeeping. It does not use constancy of `w` on an orbit, so it holds for any `F`.

**L11 (C-U1-T, `crit_sum_biUnion_orbits`).** For `𝒮 ⊆ Y.image (orbitOf G j)`:
`Σ_{B ∈ ⋃𝒮} w(B) = Σ_{O ∈ 𝒮} supply G F O`. This is `Finset.sum_biUnion` with the disjointness of L8 restricted to `𝒮`.

## 4. Proof of the terminal theorem

Write `F = favorableLeaves G p`, `w = activeWeight G F`, `𝒪_j = I_j.image (orbitOf G j)`, and for `𝒮 ⊆ 𝒪_{p+1}` let
`T(𝒮) = {O' ∈ 𝒪_p : ∃ O ∈ 𝒮, ∃ B ∈ O, ∃ A ∈ O', transportRel G B A}`.

**(⇒).** Assume `WeightedHall G F p` and let `𝒮 ⊆ 𝒪_{p+1}`. Put `X = ⋃𝒮`. Then `X ⊆ I_{p+1}` (L7). Hall gives
`Σ_X w ≤ Σ_{N(X)} w`. We show `N(X) ⊆ ⋃T(𝒮)`. Let `A ∈ N(X)`, so `A ∈ I_p` and `transportRel G B A` for some `B ∈ X`, with
`B ∈ O ∈ 𝒮`. Then `O' := orbitOf G p A ∈ 𝒪_p` contains `A` (L1). The pair `(B, A)` witnesses `O' ∈ T(𝒮)`. Weights are
natural numbers, so a sum over a subset is at most the sum over the superset (`Finset.sum_le_sum_of_subset`). Hence
`Σ_{O∈𝒮} supply O = Σ_X w` (L11 at `j = p+1`) `≤ Σ_{N(X)} w ≤ Σ_{⋃T(𝒮)} w = Σ_{O'∈T(𝒮)} supply O'` (L11 at `j = p`,
`T(𝒮) ⊆ 𝒪_p`). This direction uses neither invariance nor L0.

**(⇐).** Assume the quotient condition. By L0 it suffices to prove the Hall inequality for each invariant `X ⊆ I_{p+1}`. By
L3, `X` is orbit-closed. Let `𝒮 = X.image (orbitOf G (p+1)) ⊆ 𝒪_{p+1}`. The hypothesis gives
`Σ_{O∈𝒮} supply O ≤ Σ_{O'∈T(𝒮)} supply O'`. On the left, `Σ_X w = Σ_{O∈𝒮} supply O` (L10). On the right we show
`⋃T(𝒮) ⊆ N(X)`. Take `A' ∈ O' ∈ T(𝒮)`, witnessed by `O = orbitOf B₀` with `B₀ ∈ X`, `B ∈ O`, `A ∈ O'`, and
`transportRel G B A`. Since `X` is orbit-closed, `B ∈ X`. Since `A ∈ O' ⊆ I_p`, `A ∈ N(X)`. `N(X)` is invariant by L4,
hence orbit-closed by L3 (applied with `N(X) ⊆ I_p`). Also `O' = orbitOf A` by L6. So `A' ∈ orbitOf A ⊆ N(X)`. Then
`Σ_{O'∈T(𝒮)} supply O' = Σ_{⋃T(𝒮)} w ≤ Σ_{N(X)} w` (L11 and monotonicity of ℕ-sums). Chaining gives
`Σ_X w ≤ Σ_{N(X)} w`. ∎

(The adjudication's equality `⋃T(𝒮) = N(X)` for invariant `X` also holds, since the (⇒) inclusion needs no invariance. The
proof uses only the two inclusions.)

## 5. Where each ingredient enters

- **Finiteness.** `Fintype V` makes `I_j` a `Finset` (`powersetCard` of `univ`, filtered), so every orbit is a finite filter of
  a finite layer. `𝒪_j` is a finite `Finset (Finset (Finset V))`, so `∀ 𝒮 ⊆ 𝒪_{p+1}` ranges over finitely many families. The
  cardinality step of L3 is the one place where finiteness is used as an argument, not just as a type. No
  `Fintype (G ≃g G)` is used or needed. That instance does not synthesize at the pin (U1; both U1 critics' probes).
- **Decidability (fence 5).** `DecidableEq V` gives `DecidableEq (Finset V)` and `DecidableEq (Finset (Finset V))`, which
  `Finset.image`, `Finset.biUnion` and the orbit sets need. The two filter predicates that quantify over automorphisms or
  over `𝒮` (in `orbitOf` and in the statement's `Finset.filter`) get their `DecidablePred` instance from `open scoped
  Classical` (`Classical.propDecidable`). This does not change the set the filter denotes. Membership in `s.filter P` is
  `a ∈ s ∧ P a` (`Finset.mem_filter`) whatever instance is used. `Decidable P` is a subsingleton, so any two instances give
  the same `Finset` (`Finset.filter_congr_decidable`). The carried definitions were compiled the same way (the C1-LA1 and
  C2-LA1 fragments open `Classical` where they filter by non-computable predicates). Every fragment of this award opens
  `Classical` in the same scaffold as its origin file.
- **`Aut`-invariance of `F = favorableLeaves G p`.** It enters only through L0's (⇐) (C2-LA1 entries 41 and 70). It is
  unconditional: it needs no tree hypothesis and no eligibility. The orbit lemmas L1–L11 hold for any `F`.
- **Class-union identity.** L10 (the source side in (⇐)) and L11 (both sides in (⇒), the target side in (⇐)).
- **ℕ/ℤ audit.** `activeWeight` and `supply` are ℕ-valued. The statement compares two ℕ-sums with `≤` and contains no
  subtraction, so no truncated subtraction can occur. The only ℤ quantity (`phi = supply − cov`, cast to ℤ) lives inside the
  carried proof of L0 (C2-LA1). It is cast and compared there with `exact_mod_cast` and `linarith`, not in this statement.
- **Edge cases.** `p = 0` is included: `I_0 = {∅}`, and the statement is then about sources of size 1. `𝒮 = ∅` gives
  `0 ≤ …`, which is trivial. `orbitOf G j B` for `B ∉ I_j` is empty, but only `orbitOf G j B` with `B ∈ I_j` occurs in the
  statement, through the images of `I_j`.

## 6. Scope, fences and excluded conclusions

- Scope: every finite simple graph (`Fintype V`, `DecidableEq V`, `DecidableRel G.Adj`), every `p : ℕ`, `Γ` = all of
  `G ≃g G`, tag set exactly `favorableLeaves G p`, weight exactly `activeWeight` (active tags), relation exactly (D) ∪ (S),
  orbit-total supplies and capacities, and an orbit arc iff some member pair is joined.
- **Excluded conclusions.** This award proves no quotient feasibility. It is not (HALL) at any scope. It is not (LIFT), and it
  says nothing about (LIFT)'s feasibility. It says nothing for a proper subgroup of `Aut(G)`, for another tag set or for another
  weight. No flow is constructed or implied. It has no tree, eligibility or aggregate-sign content. It says nothing about the
  size or enumerability of orbit spaces (≈ 3·10^37 per layer at the `CB(8,·)` rows). C2-LA1's terminal content is not
  re-certified (its entry 77 is not carried, and entry 76 is a companion).
- Fence 1 (SR-C3-1): the key is decided by the controller's isolated second read. This file asserts no key or grade.
- Fence 2: one terminal `theorem`. The 12 other new declarations are `lemma` (11) or `def` (1). Companions register
  `proved_informal` only (R29-N-12).
- Fence 3: carried fragments are keyed by (origin award, origin entry, fragment digest). See the tables below and
  `CAPSULE-VERIFICATION.json`.
- Fence 4: U1's unused `hXsub` binders (L2, L4) are kept byte-identical. No statement change.
- Fence 5: see §5, decidability.
- Fence 6: axioms exactly `propext`, `Classical.choice`, `Quot.sound`. No `sorry`, `admit`, `native_decide`, `axiom`, or
  `decide` over an enumeration. See `FORMALIZER-REPORT.md` for the probe.

**Repairs on the face.** U1's "remaining gap" wording is struck: there was no capacity-side gap (`cov = supply ∘ covered` by
`rfl`), and the only real gap was the partition plus the disjoint-sum bookkeeping (L6–L11). U1's axiom count "nine (three
inherited, six new)" is corrected to **ten / seven** (ten declarations printed exactly `[propext, Classical.choice,
Quot.sound]` on the U adjudicator's rebuild: three inherited, seven new). The carry description is as corrected: C2-LA1 carries
C1-LA1 entries 1–21 plus 24 only (entry 24 as its entry 31), not "the whole C1-LA1 base".

## 7. Attribution

Definitions of record: C1-LA1 (entries 1–13: the r24/r25/r26 definition layers `C4LA1`/`C5LA1` and
`E993Interior.taggedFamily`, carried from the first-interior award (Codex); entries 14–21: the `E993Transport` layer authored
in r30 Cycle 1) and C2-LA1 (the supermodularity / `canonMin` apparatus; the invariant-family statement critic-derived by C-U1-T
in Cycle 2). r30 Cycle 3: U1 (Claude Sonnet 5) for the orbit block (`orbitOf`, L1–L4). C-U1-T (Claude Opus 5.5, critic) for the
partition, the class-union identity and the terminal theorem (L5–L11 and §4; critic-derived). C-U1-F (Claude Opus 5.5, critic)
for the independent equivalent formalization (`weightedHall_iff_quotientHall`; not used here). The U adjudicator for the kernel
equivalence check `adj_two_quotient_forms_agree`. Codex (GPT-6) for the transport mechanism, the lower-region run and (LIFT)'s
orbit-quotient conventions. r29 for the high tail that closes the complementary region (not used by this proof).

## 8. Carry table by origin award

Every carried fragment is byte-identical to its origin award's registered `Snippets/` file. Each digest was checked against the origin award's `FORMALIZATION-STATE.json`, against the file bytes and against the registrar header in the frozen `U1-Main.lean` (76/76). Receipt bindings: C1-LA1 `Main.lean` `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` (kernel receipt `9e7334914b8ea5a4532d89d2f039aacc13b3be92a98b09685d8a7f1cb5c5d00a`); C2-LA1 `Main.lean` `a9cf3b815832b6fa25e43e07e628db4ce01a7a496b084cac0cd3768e877c7fc4` (kernel receipt `2313f9590917a0c2cd292722b6b76fec6a064198d397671f61331fa451bca71c`). Both are `formally_verified`.


### Carried from C1-LA1

| Origin entry | This run index | Kind | Declaration | Fragment SHA-256 |
|---:|---:|---|---|---|
| 1 | 1 | definition | `C4LA1.vertexDeletionIndepSetCount` | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` |
| 2 | 2 | definition | `C4LA1.vertexDeletionForwardDifference` | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` |
| 3 | 3 | definition | `C4LA1.IsFavorableAt` | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` |
| 4 | 4 | definition | `C4LA1.IsGraphLeaf` | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` |
| 5 | 5 | definition | `C5LA1.support` | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` |
| 6 | 6 | definition | `C5LA1.leafSet` | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` |
| 7 | 7 | definition | `C5LA1.H` | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` |
| 8 | 8 | definition | `C5LA1.R` | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` |
| 9 | 9 | definition | `C5LA1.indepSetsAvoiding` | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` |
| 10 | 10 | definition | `C5LA1.indepSetCount` | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` |
| 11 | 11 | definition | `C5LA1.forwardDifferenceDel` | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` |
| 12 | 12 | definition | `C5LA1.aggregate` | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` |
| 13 | 13 | definition | `E993Interior.taggedFamily` | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` |
| 14 | 14 | definition | `E993Transport.indepFamily` | `73df20a8511ea67885d45631688cf693e58cebe9cfd5413ee67e782c1030ef9e` |
| 15 | 15 | definition | `E993Transport.tagWitnesses` | `113d952167528dfc045eb79961e8fbff0326da8f04277799436d6c8962022025` |
| 16 | 16 | definition | `E993Transport.activeWeight` | `074ed034729850d34722d0b1ceeb96d8362beaebf3b7a409cb3fab28a9850b93` |
| 17 | 17 | definition | `E993Transport.layerWeight` | `5ca5792309be23276583ac42cef294618e2471c97d3f58e67f0ab7980a3a83c3` |
| 18 | 18 | definition | `E993Transport.favorableLeaves` | `16b0c7672ed66c4cb53ba24d853764df160d6694f63b231346a2eb71c390ec77` |
| 19 | 19 | definition | `E993Transport.transportRel` | `b1b9ac6c8de56fa740a37e5bac0fa628f1d817c2e33625ca34dcab33a1100d95` |
| 20 | 20 | definition | `E993Transport.IsSaturatingFlow` | `a9d81c260914024d38f46ff5b564749d34f640674f9e9116685b4e7c631a48ac` |
| 21 | 21 | definition | `E993Transport.WeightedHall` | `63534ffbfcc4bb1297228e598da165dcf98732939cd51a5d7fda3e62bc518478` |
| 24 | 32 | lemma | `E993Transport.isGraphLeaf_of_mem_favorableLeaves` | `8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8` |

### Carried from C2-LA1

| Origin entry | This run index | Kind | Declaration | Fragment SHA-256 |
|---:|---:|---|---|---|
| 22 | 22 | definition | `E993Transport.famMap` | `0072baac5b2a65b21aede9c79e8891f86bdef34d2980e9a53208382cf7977d91` |
| 23 | 23 | definition | `E993Transport.covered` | `5a7272b7318c108850de92e0d1b9c9e41d4497c119ede7ea146cea41ba520cf0` |
| 24 | 24 | definition | `E993Transport.cov` | `79c740a956373838c59f7b828443f589661e3cae84230b416b8a268947eebb9c` |
| 25 | 25 | definition | `E993Transport.supply` | `e981d867eed11f032fe42f04adfab048d213b00a6d921368dca040478b7cf2d7` |
| 26 | 26 | definition | `E993Transport.phi` | `402536db4c2a08c851c51a5300b19cb539a8d2ffb7061db2ee7310fcf6298d3c` |
| 27 | 27 | definition | `E993Transport.domain` | `7dfc3846302a694014b66cb07308bf1a7121d367355fa91b355276402f736e0b` |
| 28 | 28 | definition | `E993Transport.maxPhi` | `4fa71b0c0c71027117b594d26838d3e3bcf17a7a548afc2bd1c1be10bce21e70` |
| 29 | 29 | definition | `E993Transport.maximizers` | `0f1ec8e0a4b322f6872b4509b6445569b35ca73c606fc8b2e6ffe7bf73dacc32` |
| 30 | 30 | definition | `E993Transport.canonMin` | `a891a9957dd56410a6c26c6e0a696f953b6479017a3f79657f19f21a21ca4e9c` |
| 32 | 33 | lemma | `E993Transport.isIndepSet_map_aut` | `0218c4510d98bfd14545876f948ed1c4fc21dfad121c5968862d6a30f2185208` |
| 33 | 34 | lemma | `E993Transport.neighborFinset_map_aut` | `55722f0f2fde567d98d11288759dfbf9bcd06edef609d223faf006833b15daae` |
| 34 | 35 | lemma | `E993Transport.isGraphLeaf_map_aut` | `27fb04f91f99e571864377bc2c9dda81bdaa5982304b077d1fa5934da2f8a9b5` |
| 35 | 36 | lemma | `E993Transport.support_spec` | `5b8bd4a85c06e95592b5642cffb47b09a65b5d12a5283da9df27ba9968303787` |
| 36 | 37 | lemma | `E993Transport.support_map_aut` | `671013bdf19cf09c6551b7d227e4d40a8586bddbf37f1b1b3a9eba330caaeda0` |
| 37 | 38 | lemma | `E993Transport.tagWitnesses_map_aut` | `1671788dfd616725f1dd885f3a60d9b82f9cbac4b03f228f9b1be81b5c9ee5c5` |
| 38 | 39 | lemma | `E993Transport.mem_leafSet_iff` | `f134eff74e3c1ac28ac53feee79e696c47cd347804ab557f888504b837efb575` |
| 39 | 40 | lemma | `E993Transport.vertexDeletionIndepSetCount_map_aut` | `788c9f7b87b9cf67befd6279a725c5dba440f3f08103eef13c4fefd91c9c17c4` |
| 40 | 41 | lemma | `E993Transport.isFavorableAt_map_aut` | `2ac69fe3c20e10e7d1b68ea6b2984d104da1077ecc714c6a9bd334e6c2845129` |
| 41 | 42 | lemma | `E993Transport.favorableLeaves_map_aut` | `cdaeccdce48aca901d5f318337a2879bd01faee84f0d9f8892d7cf99b9c054fe` |
| 42 | 43 | lemma | `E993Transport.activeWeight_map_aut` | `ce09d63639fb8cf4c23e5b36e4a10a1b20efd88c596537a5ceffa7b03a0af5d2` |
| 43 | 44 | lemma | `E993Transport.map_map_symm_self` | `a8bb1a8f2cd10e6228d492555ec52bff4f19f78f44a6344c77adfb733100e392` |
| 44 | 45 | lemma | `E993Transport.transportRel_map_aut_mp` | `114a3006970f8ece479216d0b7251ba48795e06921a8c1f435b2f19147092105` |
| 45 | 46 | lemma | `E993Transport.transportRel_map_aut` | `fa934f4b3f3f7c61b6f5348b16858476ce8a55f29de8a6dd4663c844cea3e347` |
| 46 | 47 | lemma | `E993Transport.covered_union` | `2a287f11cbaebacfa11eb73a38fdebf5fc8e201d749159d1e21a2fc223157a29` |
| 47 | 48 | lemma | `E993Transport.covered_inter_subset` | `1cdc64296db75dee6bc1b2e6b11cd5dbb851f1e078792c1b1a99c6c2cc0d0108` |
| 48 | 49 | lemma | `E993Transport.cov_submodular` | `0832bf5e84a0a71d62c9b14760a9e01a4119aebb9eb4a667c35436c31109024e` |
| 49 | 50 | lemma | `E993Transport.supply_modular` | `316fc29399d51476d63d1ae89ea772caa5d95f2fb1eb5b505286e75bf09fbc6b` |
| 50 | 51 | lemma | `E993Transport.phi_supermodular` | `4bbae797abbbcd45af619f6767f9553257de2598b46de6b470cb8e8c01f7b76c` |
| 51 | 52 | lemma | `E993Transport.isMaximizer_union_inter` | `e63eddece8867130af7f1708e9e2988c895141b947eb69ddd51d915147c71fe0` |
| 52 | 53 | lemma | `E993Transport.domain_nonempty` | `a9dd9ed5792d5ae3b932be2cc8186180b88f0b95e750995c2565ef020079d701` |
| 53 | 54 | lemma | `E993Transport.maximizers_nonempty` | `f44ad9de98f03483d513c00d326b3e2717c00bdca148d37b14d0e21da76cb318` |
| 54 | 55 | lemma | `E993Transport.le_maxPhi_of_mem_domain` | `8f60f64d2df148ca649e6f9500964449bf6ae51375614cb79b92f48eb326d125` |
| 55 | 56 | lemma | `E993Transport.mem_domain_union` | `6b4743c54c4f1229c7e5d5231c5076cf4dc619086e5c53526d39fba00d3f8ebe` |
| 56 | 57 | lemma | `E993Transport.mem_domain_inter` | `1cdae55fce2180c150692ea2152b5b59658cd2a5feb58772f3fb6c9ec9343e87` |
| 57 | 58 | lemma | `E993Transport.isMaximizer_inter` | `93df92aa25edf0fb4c6148efd9505453c0ef124391964496b1f80360492b9b2e` |
| 58 | 59 | lemma | `E993Transport.canonMin_isMaximizer` | `efd3b98b1384ce8d2b27acdc767aabacfdbc736cb84778fa11d2c83e0dc4658e` |
| 59 | 60 | lemma | `E993Transport.mem_famMap` | `f9edabce19091026268c683d20f0b95a5374edf701f4bebdddffd67610b1004e` |
| 60 | 61 | lemma | `E993Transport.map_symm_map_self` | `d01f5b58b1b23ffb974e68cdbc871463e1276f0f12fd30fa694162d4e3a815a2` |
| 61 | 62 | lemma | `E993Transport.mem_indepFamily_map` | `467dec36b330ddd9329e656c2be6301d32027aac2d30731f1a067d815b391fb4` |
| 62 | 63 | lemma | `E993Transport.covered_famMap` | `189219f33af782ab5e0c9ce56ed6387a624ad323970ea7be8e49b4a40168254d` |
| 63 | 64 | lemma | `E993Transport.activeWeight_map_of_invariant` | `a4fdf241666c9df0acb82b097af5ce586d46fc09c0222a44b2170442bc2a145b` |
| 64 | 65 | lemma | `E993Transport.supply_famMap` | `1bd48c950fb804787bf4ff1b82d4e96a9bb7c30f80600ea7871d32ef45ccdeac` |
| 65 | 66 | lemma | `E993Transport.cov_famMap` | `cb28176c0cdb978ad49b451de6c83b190c57410fcbc2665f9dae0f295050c050` |
| 66 | 67 | lemma | `E993Transport.phi_famMap` | `c5b2c970d9d369075598d3afc159a5b2454eed8af1a5c7e498611af9ddb50ad0` |
| 67 | 68 | lemma | `E993Transport.famMap_mem_domain` | `31e42b7a9fd7531d477f1c305555a17e955aee02cae60282fc253392398e6814` |
| 68 | 69 | lemma | `E993Transport.famMap_mem_maximizers` | `eb961c1fe4915a605eff6aebbf850a1785a299badd5e4943814c2f8b1bcf6713` |
| 69 | 70 | lemma | `E993Transport.card_famMap` | `93cc12d32d0f4744a8d94b51571dc49390757d9904622a4752b5e49413834924` |
| 70 | 71 | lemma | `E993Transport.canonMin_famMap` | `2c437cddc3939ce82b57c8ff27ffde4ac5c6fc4085e3277bb3356f241c3b9a7c` |
| 71 | 72 | lemma | `E993Transport.covered_mono` | `6cba1002be4bf6d8cbd88235913b07327073e892fc08810c854d2ced9e34466c` |
| 72 | 73 | lemma | `E993Transport.canonMin_pos` | `41f34ed6b32394c459ada7d40f8c50fb55551cfa95981ef1ba85caa47cfd4b85` |
| 73 | 74 | lemma | `E993Transport.filter_eq_covered` | `9a29a3b33379ccee186cfd3084c87ea0147cb391455551483c51609f16a0559d` |
| 74 | 75 | lemma | `E993Transport.weightedHall_iff_phi_nonpos` | `18f181b429595f281f5e0b731b9de33eeafc9e0230a4b98803813022197a46b8` |
| 75 | 76 | lemma | `E993Transport.favorableLeaves_leaf` | `10999e3f271bc7f7b8ca9d2314e97aa35d38d817ed8471db243c65b50b3414f0` |
| 76 | 77 | lemma | `E993Transport.weightedHall_iff_invariant` | `147e76e0f226408a91e6921fb267a77fc01971b8044fed784600db33e4dc226a` |

Not carried: C1-LA1 entries 22–23 and 25–36; C2-LA1 entry 31 (byte-identical to C1-LA1 entry 24, carried once as C1-LA1 24) and entry 77 (its terminal `theorem`). None was needed by the build.


### New declarations (in-run; origin text transported by exact line range)

| This run index | Kind | Declaration | Origin file (SHA-256) | Lines | Origin declaration-text SHA-256 | Registered fragment SHA-256 | Author | Change |
|---:|---|---|---|---|---|---|---|---|
| 31 | definition | `E993Transport.orbitOf` | `U1-Main.lean` (`f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`) | 2717–2721 | `5e692d958dc0bafcb2027482371920e53635b1162a2f256a7abe3ed2d369f12e` | `1df6865fc16475343a841e7fdffb4168a1a983615aa6f1afe455d8f27b77f354` | U1 (Claude Sonnet 5) | none |
| 78 | lemma | `E993Transport.mem_orbitOf_self` | `U1-Main.lean` (`f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`) | 2723–2729 | `05d1609baa00187540f8ea5b20f9ea77dd9b4739c09ada9cae0323dbf8b397e2` | `768ea69c7d6b4bc694b84ca1efcd37ae699be4364ba3780f05e4e6c8fca1635b` | U1 (Claude Sonnet 5) | keyword `theorem` → `lemma` |
| 79 | lemma | `E993Transport.orbitOf_subset_of_mem_invariant` | `U1-Main.lean` (`f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`) | 2731–2740 | `6292defffc540e695c97986198745fb25afd73467352b544d9c31f649074cfcd` | `ff2869d61812e8dd8abf0a19467db39ab77e4e164717aa586c40961257ce349a` | U1 (Claude Sonnet 5) | keyword `theorem` → `lemma` |
| 80 | lemma | `E993Transport.invariant_iff_orbitOf_subset` | `U1-Main.lean` (`f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`) | 2742–2758 | `76246b3e33834d9299b64c6e7cd1fbed2976286fb515eb72b9d6bba569bd8b7e` | `1c42b7ff7c1e8e74842d5973c09531bd950ac49bf8714e5a44e0a24f061a265a` | U1 (Claude Sonnet 5) | keyword `theorem` → `lemma` |
| 81 | lemma | `E993Transport.covered_orbitUnion` | `U1-Main.lean` (`f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`) | 2760–2767 | `4c852561064334de738b9149d35adb152ecb4f83c5bebf5be3ce7fe3bd31a101` | `7caab3d45ff60e86e050e26e6a549b927208ea59759a5fa0831c4595c4b83616` | U1 (Claude Sonnet 5) | keyword `theorem` → `lemma` |
| 82 | lemma | `E993Transport.crit_map_map_aut` | `C-U1-T-CritAdv.lean` (`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) | 13–16 | `d85a2261120e57629eadddea7ff43fd13a6731146b564bb1bb4a07b6cc084939` | `bc4fe8fddd56c02e57fe18005155a80c8dcf5f7b0fa3ffb3de743f5e25e03589` | C-U1-T (Claude Opus 5.5), critic-derived | none |
| 83 | lemma | `E993Transport.crit_orbitOf_eq_of_mem` | `C-U1-T-CritAdv.lean` (`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) | 18–29 | `12c1d4c2959a47cec6acebab05e74ebc3365b691741b9d124dac7a6005fa57f1` | `dc3d2edf61675c0245947585189fb20b29bc9fc92bd10fde25ee2b3c2b59c299` | C-U1-T (Claude Opus 5.5), critic-derived | none |
| 84 | lemma | `E993Transport.crit_orbitOf_subset` | `C-U1-T-CritAdv.lean` (`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) | 31–32 | `220f0169c026e9be791fc1e49e32f6dbf03c3d29878add43a61e7f02399b79e3` | `b5655327367b165d1d34bb8a2880895546369732051356fb2e2a5526a84ab766` | C-U1-T (Claude Opus 5.5), critic-derived | none |
| 85 | lemma | `E993Transport.crit_orbits_pairwiseDisjoint` | `C-U1-T-CritAdv.lean` (`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) | 34–44 | `4170f445312bfff02e3f5432f1171b9ad13d8e75297b466d19ec73921a0ef511` | `7f47d79fd504e2cc0d7b1b212dd647161ee831bf48b24e7dbb2c93ed2b57c2c6` | C-U1-T (Claude Opus 5.5), critic-derived | none |
| 86 | lemma | `E993Transport.crit_biUnion_orbits` | `C-U1-T-CritAdv.lean` (`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) | 46–56 | `f3c81ad959a439cebbc1534f82770957f2109b417ded5f16e046297b3aa2b793` | `974050cbd99a9b431bbc28a3b4eed208da650ba6a626a1c99f5f895ee0e2d09b` | C-U1-T (Claude Opus 5.5), critic-derived | none |
| 87 | lemma | `E993Transport.crit_supply_eq_sum_orbits` | `C-U1-T-CritAdv.lean` (`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) | 58–66 | `a558c756580901bf45bb2793de882fedeba881d39a04973197efc1ef36c8787b` | `da819ae487ab635ab7a3077eb2f53a2c8154ff3c06223540bb244f80875a2a93` | C-U1-T (Claude Opus 5.5), critic-derived | none |
| 88 | lemma | `E993Transport.crit_sum_biUnion_orbits` | `C-U1-T-CritAdv.lean` (`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) | 68–75 | `5d04c593aabdf0a83a16f5ff0e3f831b600f147cf34861f7c2b4106284a23993` | `391fc5f1f98957b7321e61a5133837c2401e680572628ea0d3edc53e7bc8a347` | C-U1-T (Claude Opus 5.5), critic-derived | none |
| 89 | theorem | `E993Transport.weightedHall_iff_autOrbitQuotientHall` | `C-U1-T-CritAdv.lean` (`8de15f02130b44f5fe5d9d906221f24f485d38e91f99a1bb51270cb5f73bb59b`) | 77–139 | `fa33769f808808e3e835982de5e6fc81f324ec9a4dbbd1c905bae573b9130bb1` | `87e103bcd5d01368d151e406203622470e9062e5dc94bc943ed03a8863d9a59b` | C-U1-T (Claude Opus 5.5), critic-derived | renamed from `crit_weightedHall_iff_orbitQuotientHall`; nothing else |

Each new fragment adds a comment header and the scaffold `namespace E993Transport` / `open SimpleGraph` / `open scoped Classical` / `variable {V : Type*} [Fintype V] [DecidableEq V]` / `end E993Transport` around the transported lines. This is the same scaffold as the origin files. `orbitOf` (a definition) is registered after the last carried definition and before the first carried lemma, because the registrar orders entries definition → lemma → theorem (see `CAPSULE-VERIFICATION.json`, `registration_order`). Excluded by default and not registered: `supply_orbitOf`, `crit_supply_orbit_eq_card_mul`, `exists_transportRel_iff`, `regular_bipartite_shadow_bound`, and both critics' (NM) files and `CriticQuot.lean`.
