# Informal Proof — C2-LA1 (r30 Cycle 2 Stage 7)

Canonical run id: `erdos-993-math-dre-20260926-r30-weighted-transport`. Workflow run: `lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family`.
Producer: `c2-la1-formalizer-opus-20260926` (governed formalizer; chartered Claude Opus 5.5, effort high; runtime-reported model id
`claude-opus-5-5[1m]`). This document is the statement-level informal proof the brief's R5 requires. It is not an audit of itself:
the independent proof-integrity audit and the statement-fidelity review are separate seats.

Key (new, separate, restricted scope): `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`. It never
closes the full (INV) key `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, whose quotient clause stays `proved_informal`.

## 1. Statement

For every finite type `V` (with decidable equality), every simple graph `G` on `V` (with decidable adjacency) and every `p : ℕ`,
write `F = F_p(G) = favorableLeaves G p`. If weighted Hall fails for `F` at rank `p`, then there is a family `X ⊆ I_{p+1}(G)` such
that (i) `γ·X = X` for every automorphism `γ` of `G`; (ii) every member `B ∈ X` has active weight `w_F(B) > 0`; and (iii)
`Σ_{A ∈ N(X)} w_F(A) < Σ_{B ∈ X} w_F(B)`, where `N(X) = {A ∈ I_p : ∃ B ∈ X, B → A}` under the relation (D) ∪ (S). The witness is
`X_min`, the least maximizer of `φ = supply − cov` (never `X_max`; S12).

Lean (namespace `E993Transport`; compiled text of entry 77, byte-identical to the synthesis's frozen block):

```lean
theorem exists_aut_invariant_deficient_of_not_weightedHall {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (h : ¬ WeightedHall G (favorableLeaves G p) p) :
    ∃ X ⊆ indepFamily G (p + 1),
      (∀ γ : G ≃g G, famMap G γ X = X) ∧
      (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
      ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
          activeWeight G (favorableLeaves G p) A <
        ∑ B ∈ X, activeWeight G (favorableLeaves G p) B
```

Vocabulary (definitions of record, C1-LA1 text, carried byte-identically; see §9):
- `I_j = indepFamily G j`: the independent `j`-subsets of `V`.
- `W_v = tagWitnesses G v = N_G(s_v) ∖ {v}`, where `s_v = C5LA1.support G v` is the unique neighbour of a leaf `v`.
- `w_F(B) = activeWeight G F B = |{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}|`. It counts ACTIVE tags (`¬ Disjoint (B.erase v)
  (tagWitnesses G v)`), never `|F ∩ B|`.
- `F_p(G) = favorableLeaves G p = {v ∈ leafSet G : Δ_p(G − v) < 0}`, where `Δ_p(G − v) = i_{p+1}(G − v) − i_p(G − v)` in `ℤ`.
- `B → A` is `transportRel G B A`, exactly (D) ∪ (S):
  - (D): `∃ q ∈ B, A = B ∖ {q}`;
  - (S): `∃ u ∉ B, |N(u) ∩ B| = 2 ∧ A = {u} ∪ (B ∖ N(u))`.
- `WeightedHall G F p`: for every `X ⊆ I_{p+1}`, `Σ_{B∈X} w_F(B) ≤ Σ_{A∈N(X)} w_F(A)`, where `N(X)` is the displayed filter.
- `famMap G γ X = X.map ⟨fun s => s.map γ.toEquiv.toEmbedding, _⟩` (NEW, entry 22): the image under `γ` of each member set, and
  nothing wider. It elaborates to `Finset.map ⟨fun s => Finset.map (Equiv.toEmbedding (RelIso.toEquiv γ)) s, _⟩ X`.
  - **Fidelity item 2 (one sentence).** The Cycle 1 draft's `X.image (fun B => B.map γ.toEmbedding)` is the same set as
    `famMap G γ X`, because `Finset.map` along an embedding equals `Finset.image` of its underlying function
    (`Finset.map_eq_image`), and the draft's `B.map γ.toEmbedding` is meant as the image of `B` under the vertex map `γ`,
    which is `B.map γ.toEquiv.toEmbedding`; both are `{γ(B) : B ∈ X}`.
  - A draft-only compile probe (`DRAFTS/FidelityProbe.lean`, never registered) checks
    `famMap G γ X = X.image (fun B => B.map γ.toEquiv.toEmbedding)` and
    `A ∈ famMap G γ X ↔ ∃ B ∈ X, A = B.map γ.toEquiv.toEmbedding`.
  - The Cycle 1 adjudication itself is outside this seat's read boundary. The brief quotes its invariance clause, and the
    comparison above is against that quotation.

Hypotheses: finiteness and decidability only (`[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`), and `h : ¬ WeightedHall …`.
There is no `IsTree` (neither connectivity nor acyclicity), no eligibility and no `p ≥ 1`. `F` is fixed at rank `p`, and `γ`
ranges over `G ≃g G`.

## 2. Auxiliary objects (new definitions, proof-internal; entries 23–30)

- `covered G p X = N(X)`, the same filter as in `WeightedHall`, elaborated under `open scoped Classical`.
- `supply G F X = Σ_{B∈X} w_F(B) ∈ ℕ` and `cov G F p X = Σ_{A∈N(X)} w_F(A) ∈ ℕ`.
- `phi G F p X = (supply : ℤ) − (cov : ℤ)`.
- `domain G p = 𝒫(I_{p+1})` (finite, and contains `∅`).
- `maxPhi = max_{X ∈ domain} φ(X)`.
- `maximizers = {X ∈ domain : φ(X) = maxPhi}`, which is nonempty.
- `canonMin = X_min = ⋂ maximizers`, taken as `Finset.inf'` with `id`.

`maxPhi` and `canonMin` inline their nonemptiness proofs (`⟨∅, _⟩`, and the argument of `maximizers_nonempty`). The reason is
that the registrar orders every definition before every lemma. By proof irrelevance the values equal U1's.

## 3. Proof, following the synthesis DAG (a)–(e)

Throughout, `γ ∈ Aut(G)` and `γS` denotes the image of a vertex set `S`.

### (a) Equivariance: `I_j`, `F_p`, `w_F` and `N(·)` are `Aut(G)`-equivariant, so `φ` is `Aut(G)`-invariant

1. `isIndepSet_map_aut`: `γS` is independent iff `S` is. `γ` is injective and preserves and reflects adjacency
   (`γ.map_rel_iff`).
2. `neighborFinset_map_aut`: `γ N(u) = N(γu)`.
3. `isGraphLeaf_map_aut`: `γv` is a leaf iff `v` is. A unique neighbour transports along `γ` and `γ⁻¹`.
4. `support_spec` and `support_map_aut`: **for a leaf `v`** (hypothesis `hv`), `s_{γv} = γ s_v`.
   - `γ s_v` is adjacent to `γv`, and a leaf has exactly one neighbour.
   - `hv` is load-bearing: off the leaves, `support` is an unconstrained choice.
5. `tagWitnesses_map_aut`: **for a leaf `v`**, `γ W_v = W_{γv}` (by 2 and 4, and `map_erase`).
6. `mem_leafSet_iff`: membership in `leafSet` is `IsGraphLeaf`.
7. `vertexDeletionIndepSetCount_map_aut`: `i_k(G − γv) = i_k(G − v)`. `γ` maps the `k`-subsets of `V ∖ {v}` bijectively
   onto those of `V ∖ {γv}` and preserves independence (by 1).
8. `isFavorableAt_map_aut`: `Δ_p(G − γv) = Δ_p(G − v)`, so favorability at rank `p` is invariant.
9. `favorableLeaves_map_aut`: `γ F_p(G) = F_p(G)`, by 3, 6 and 8.
10. `activeWeight_map_aut`: **if every member of `F` is a leaf** (hypothesis `hF`), then `w_{γF}(γB) = w_F(B)`.
    - Here `γF ∩ γB = γ(F ∩ B)`, and at `γv` the test reads `¬Disjoint(γB ∖ {γv}, W_{γv}) = ¬Disjoint(γ(B ∖ {v}), γW_v)`.
      This holds iff `¬Disjoint(B ∖ {v}, W_v)`, by injectivity and 5.
    - `hF` is load-bearing, since 5 is applied at each `v ∈ F ∩ B`.
11. `map_map_symm_self`, `transportRel_map_aut_mp` and `transportRel_map_aut`: `γB → γA` iff `B → A`.
    - (D): `A = B ∖ {q}` gives `γA = γB ∖ {γq}`.
    - (S): `u ∉ B`, `|N(u) ∩ B| = 2` and `A = {u} ∪ (B ∖ N(u))` give `γu ∉ γB`,
      `|N(γu) ∩ γB| = |γ(N(u) ∩ B)| = 2` and `γA = {γu} ∪ (γB ∖ N(γu))`.
    - The converse applies the same to `γ⁻¹` and cancels the round trip. (S) is transported literally.
12. `mem_famMap`, `map_symm_map_self` and `mem_indepFamily_map`: `γB ∈ I_j ⇔ B ∈ I_j`, since cardinality is preserved and by 1.
13. `covered_famMap`: `N(γX) = γN(X)`, by 11, 12 and `γ⁻¹`.
14. `activeWeight_map_of_invariant`: **if `hF` holds and `γF = F`**, then `w_F(γB) = w_F(B)` (10 with `γF = F`).
15. `supply_famMap`, `cov_famMap` and `phi_famMap`: **under `hF` and `γF = F`**, `φ(γX) = φ(X)`.
    `Finset.sum_map` is used with 14, and with 13 for `cov`.
16. `famMap_mem_domain`: `X ⊆ I_{p+1} ⇒ γX ⊆ I_{p+1}` (by 12).
17. `famMap_mem_maximizers`: **under `hF` and `γF = F`**, `γ` maps maximizers to maximizers (by 15 and 16).
18. `card_famMap`: `|γX| = |X|`, since `famMap` maps along an embedding.

### (b) `cov` is submodular and `supply` modular, so `φ` is supermodular; the maximizers form a lattice; `X_min` is a maximizer

1. `covered_union`: `N(X ∪ Y) = N(X) ∪ N(Y)`.
2. `covered_inter_subset`: `N(X ∩ Y) ⊆ N(X) ∩ N(Y)`.
3. `cov_submodular`: `cov(X ∪ Y) + cov(X ∩ Y) ≤ cov X + cov Y`.
   - By 1 and inclusion–exclusion for sums (`Finset.sum_union_inter`),
     `cov(X ∪ Y) + Σ_{N(X)∩N(Y)} w = cov X + cov Y`.
   - By 2 and nonnegativity of `w` (`sum_le_sum_of_subset`, in `ℕ`), `cov(X ∩ Y) ≤ Σ_{N(X)∩N(Y)} w`.
4. `supply_modular`: `supply(X ∪ Y) + supply(X ∩ Y) = supply X + supply Y` (`Finset.sum_union_inter`).
5. `phi_supermodular`: `φX + φY ≤ φ(X ∪ Y) + φ(X ∩ Y)`. Cast 3 and 4 to `ℤ` and apply `linarith`.
6. `isMaximizer_union_inter`: if `φX = φY = M` and `φ(X ∪ Y), φ(X ∩ Y) ≤ M`, then both equal `M` (by 5 and `omega`).
7. `domain_nonempty`, `maximizers_nonempty`, `le_maxPhi_of_mem_domain`, `mem_domain_union` and `mem_domain_inter`: the domain
   is closed under `∪` and `∩`, and `maxPhi` bounds `φ` on it.
8. `isMaximizer_inter`: maximizers are closed under `∩` (by 6 and 7).
9. `canonMin_isMaximizer`: `X_min ∈ maximizers`, by `Finset.inf'_induction` over the finite nonempty family with 8.
   `X_min ⊆ Y` for every maximizer `Y` (`Finset.inf'_le`).

### (c) `X_min` is `Aut(G)`-invariant (`canonMin_famMap`)

Fix `γ` with **`hF` and `γF = F`**.
- By (a)17 and (b)9, `γX_min` is a maximizer.
- By leastness, `X_min ⊆ γX_min`.
- By (a)18, `|γX_min| = |X_min|`, so `X_min = γX_min` (`Finset.eq_of_subset_of_card_le`).

For `F = F_p(G)`:
- `hF` is `favorableLeaves_leaf`, which is C1-LA1 entry 24 `isGraphLeaf_of_mem_favorableLeaves`.
- `γF = F` is (a)9.

So `X_min` is invariant under **every** `γ : G ≃g G`.

### (d) Every member of `X_min` has positive active weight (`canonMin_pos`) — repair 3: proved for `X_min`

Suppose `B ∈ X_min` and `w_F(B) = 0` (`omega` from `¬ 0 < w`, in `ℕ`). Let `Y = X_min ∖ {B}`.
- `Y ∈ domain`.
- `supply Y = supply X_min`, since the removed term is 0 (`Finset.sum_erase`).
- `N(Y) ⊆ N(X_min)` (`covered_mono`), so `cov Y ≤ cov X_min` because `w ≥ 0`.
- Hence `φY ≥ φX_min = maxPhi`. Since `φY ≤ maxPhi` on the domain, `Y` is a maximizer.
- By leastness `X_min ⊆ Y`, which contradicts `B ∈ X_min ∖ Y`.

The positivity conjunct is therefore proved for `X_min` specifically. `X_max` would fail it: it contains every tag-free source
(S12), and those have weight 0. No hypothesis on `F` beyond (b) is used here.

### (e) `¬Hall ⇒ maxφ > 0 ⇒` deficiency; the terminal theorem and the companions

- `filter_eq_covered`: the displayed filter equals `covered G p X` for **any** decidability instance (see §5).
- `weightedHall_iff_phi_nonpos`: `WeightedHall G F p ⇔ ∀ X ∈ domain, φX ≤ 0`. This is exact casting between the `ℕ`
  inequality and the `ℤ` difference (§4).
- **Terminal theorem.**
  - From `h`, there is `X₀ ∈ domain` with `φX₀ > 0`, so `maxPhi > 0`.
  - Take `X := X_min`:
    - `X ⊆ I_{p+1}`, because `X_min ∈ domain`;
    - invariance is (c), with `hF` from entry 24 and `γF = F` from (a)9;
    - positivity is (d);
    - `φ X_min = maxPhi > 0`, which after `filter_eq_covered` and the casts of §4 is
      `Σ_{N(X_min)} w_F < Σ_{X_min} w_F`.
- **Companion `weightedHall_iff_invariant`** (a `lemma`, registered `proved_informal` only): WeightedHall for `F_p(G)` holds iff
  Hall holds on every `Aut(G)`-invariant `X ⊆ I_{p+1}`.
  - `(⇒)` is restriction.
  - `(⇐)`: if Hall failed, then `X_min` is invariant by (c) and `φ X_min = maxPhi > 0`, which contradicts Hall at `X_min`.
  - This proof is RE-DERIVED by the formalizer. C-U1-T's origin proof cited the terminal theorem, which must be the last
    registered entry. The mathematics is the same `X_min` argument, and the statement text is C-U1-T's verbatim.

## 4. ℕ/ℤ cast audit

- `w_F`, `supply`, `cov`, `i_k` and all sums are `ℕ`.
  - `φ = (supply : ℤ) − (cov : ℤ)` is formed in `ℤ`.
  - `Δ_p(G − v)` is `ℤ` in the carried definition (entry 2).
  - The new text contains no `ℕ` subtraction. `p + 1` is `ℕ` addition. The carried `C5LA1.aggregate` uses `p − 1`, but it is
    outside the cone and does not occur in the statement.
- Every passage between `ℕ` and `ℤ` is `exact_mod_cast`, and each is a monotone cast of `≤` or `<` between two `ℕ` sums
  (`Nat.cast_le`, `Nat.cast_lt`, `Nat.cast_sum`):
  - in `phi_supermodular`, for `supply_modular` and `cov_submodular`;
  - in `canonMin_pos`, for `cov` monotonicity;
  - in `weightedHall_iff_phi_nonpos`, in both directions;
  - in the terminal theorem, `(Σ_{N} : ℤ) < (Σ_X : ℤ) ⇒` the `ℕ` inequality;
  - in `weightedHall_iff_invariant`.
- `omega` is used only on `ℕ` facts (`¬ 0 < w ⇒ w = 0`) and on `ℤ` linear facts (`isMaximizer_union_inter`,
  `canonMin_pos`). `linarith` is used on `ℤ` only.

## 5. Classical-instance bridge (repair 4)

- `WeightedHall` (entry 21, carried) elaborates its filter under `open Classical in`.
- The new fragments (`covered`, the lemmas and the terminal statement) elaborate under `open scoped Classical`.
- `filter_eq_covered` is stated for an **arbitrary** instance
  `inst : DecidablePred fun A => ∃ B ∈ X, transportRel G B A`, and proved by extensionality through `Finset.mem_filter`, which
  does not depend on the instance.
- Every `rw [filter_eq_covered]` therefore rewrites whichever instance elaborated: the one inside the unfolded
  `WeightedHall`, the one in the terminal statement, and the one in `weightedHall_iff_invariant`.
- No instance-equality assumption is made, and none is needed.

## 6. Where each hypothesis enters

- `[Fintype V]`: `Finset.univ` in `indepFamily`, `leafSet` and `vertexDeletionIndepSetCount`, and finiteness of `domain` (so
  `maxPhi` and `canonMin` exist).
- `[DecidableEq V]`: the `Finset` operations `erase`, `insert`, `∖` and `∩` in `transportRel`, `activeWeight` and
  `tagWitnesses`.
- `[DecidableRel G.Adj]`: `neighborFinset`.
- `h : ¬ WeightedHall …`: used only in (e), to get `maxPhi > 0`.
- The leaf guard `hF` (all members of `F` are leaves) enters (a)10, (a)14, (a)15, (a)17 and (c). For `F_p(G)` it is
  discharged by C1-LA1 entry 24.
- `γF = F` enters (a)14, (a)15, (a)17 and (c). For `F_p(G)` it is discharged by (a)9.
- Not used anywhere: `IsTree`, connectivity, acyclicity, eligibility, `p ≥ 1`, any sign or budget, (LIFT), any quotient, or
  any census value.

## 7. Attribution (on every face)

- Codex GPT-6: the transport mechanism, the active-tag weight and relation, the lower-region run, and (LIFT).
- r30 Cycle 1: (INV) as registered. C1-LA1: the eight frozen `E993Transport` definitions (entries 14–21).
- The first-interior run (Codex): definition entries 1–13 as carried by C1-LA1. These are C1-LA1's entries 1–13, whose text
  appears verbatim in the frozen first-interior `Main.lean` `8d864da2…` (checked; `CAPSULE-VERIFICATION.json`).
- r26/r24/r25: the definition layers.
- r30 Cycle 2:
  - U1 (Claude Sonnet 5): parts (a) equivariance and (b) supermodularity and the maximizer lattice (entries 23–30 and 32–58);
  - C-U1-T (Claude Opus 5.5): the closing theorem and its supports (entries 59–77; the bodies are critic-derived);
  - C-U1-F (Claude Opus 5.5): derived the closing theorem independently (its `CritAdvance.lean` is not carried);
  - the U adjudicator: the replay and the `X_min` ruling.
- The C2-LA1 formalizer (Claude Opus 5.5) authored:
  - `famMap` in its synthesis-frozen form;
  - the inlined nonemptiness proofs in `maxPhi` and `canonMin`;
  - the re-derived `(⇐)` proof of `weightedHall_iff_invariant`;
  - the fragment scaffolding.

  No new mathematics.

## 8. Fences and excluded conclusions

- The result is graph-generic.
- It is not a Hall theorem, a flow or a cut. It asserts nothing about whether deficient families exist, has no sign content,
  and has no quotient step.
- Nothing here asserts:
  - (HALL) for trees;
  - a Hall, flow or cut conclusion;
  - a quotient statement;
  - an aggregate sign or a census value;
  - RTree wording;
  - TREE, FOREST, TRANSFER or Erdős #993.
- Excluded, and not claimed:
  - (INV)'s quotient clause ("⇔ quotient Hall"; the (LIFT)/S11 direction), which stays `proved_informal`;
  - any `X_max` positivity claim;
  - any tree-specific or eligibility-specific strengthening;
  - any claim that the full (INV) key is `formally_verified`.
- Companions carry no certificate of their own (R29-N-12).

## 9. Carry table (every registered entry; origin and full SHA-256)

Carried C1-LA1 entries, in C1-LA1 numbering: 1–21 (the thirteen `C4LA1.*`/`C5LA1.*`/`E993Interior.taggedFamily` definitions and
the eight `E993Transport` definitions) and 24 (`isGraphLeaf_of_mem_favorableLeaves`). Entries 22, 23 and 25–36 are NOT carried.
- C1-LA1 22–23 and 25–28 are outside the cone.
- C1-LA1 29–36 are the WID draft-text lemmas and the WID terminal theorem.

Because definitions precede lemmas in the registrar, C1-LA1 entry 24 is registered here as entry 31, after the nine new
definitions. The carried entries keep their relative C1-LA1 order.

Origin files:
- `sources/c2-stage7-sources/U1-INV.lean` `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9`;
- `sources/c2-stage7-sources/C-U1-T-CritINV.lean` `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb`.

Pruned (outside the cone):
- from U1: `leafSet_map_aut`, `isMaximizer_union`, `canonMax`, `canonMax_isMaximizer`;
- from C-U1-T: `canonMax_famMap`, and `setEmb` (folded into `famMap`).

| # | kind | declaration | mode | origin (file, lines) | origin file SHA-256 | registered fragment SHA-256 |
|---|---|---|---|---|---|---|
| 1 | definition | `C4LA1.vertexDeletionIndepSetCount` | C1-LA1 fragment, byte-identical | C1-LA1 entry 1 (`0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` |
| 2 | definition | `C4LA1.vertexDeletionForwardDifference` | C1-LA1 fragment, byte-identical | C1-LA1 entry 2 (`0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` |
| 3 | definition | `C4LA1.IsFavorableAt` | C1-LA1 fragment, byte-identical | C1-LA1 entry 3 (`0003-definition-C4LA1-IsFavorableAt.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` |
| 4 | definition | `C4LA1.IsGraphLeaf` | C1-LA1 fragment, byte-identical | C1-LA1 entry 4 (`0004-definition-C4LA1-IsGraphLeaf.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` |
| 5 | definition | `C5LA1.support` | C1-LA1 fragment, byte-identical | C1-LA1 entry 5 (`0005-definition-C5LA1-support.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` |
| 6 | definition | `C5LA1.leafSet` | C1-LA1 fragment, byte-identical | C1-LA1 entry 6 (`0006-definition-C5LA1-leafSet.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` |
| 7 | definition | `C5LA1.H` | C1-LA1 fragment, byte-identical | C1-LA1 entry 7 (`0007-definition-C5LA1-H.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` |
| 8 | definition | `C5LA1.R` | C1-LA1 fragment, byte-identical | C1-LA1 entry 8 (`0008-definition-C5LA1-R.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` |
| 9 | definition | `C5LA1.indepSetsAvoiding` | C1-LA1 fragment, byte-identical | C1-LA1 entry 9 (`0009-definition-C5LA1-indepSetsAvoiding.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` |
| 10 | definition | `C5LA1.indepSetCount` | C1-LA1 fragment, byte-identical | C1-LA1 entry 10 (`0010-definition-C5LA1-indepSetCount.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` |
| 11 | definition | `C5LA1.forwardDifferenceDel` | C1-LA1 fragment, byte-identical | C1-LA1 entry 11 (`0011-definition-C5LA1-forwardDifferenceDel.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` |
| 12 | definition | `C5LA1.aggregate` | C1-LA1 fragment, byte-identical | C1-LA1 entry 12 (`0012-definition-C5LA1-aggregate.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` |
| 13 | definition | `E993Interior.taggedFamily` | C1-LA1 fragment, byte-identical | C1-LA1 entry 13 (`0013-definition-E993Interior-taggedFamily.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` |
| 14 | definition | `E993Transport.indepFamily` | C1-LA1 fragment, byte-identical | C1-LA1 entry 14 (`0014-definition-E993Transport-indepFamily.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `73df20a8511ea67885d45631688cf693e58cebe9cfd5413ee67e782c1030ef9e` |
| 15 | definition | `E993Transport.tagWitnesses` | C1-LA1 fragment, byte-identical | C1-LA1 entry 15 (`0015-definition-E993Transport-tagWitnesses.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `113d952167528dfc045eb79961e8fbff0326da8f04277799436d6c8962022025` |
| 16 | definition | `E993Transport.activeWeight` | C1-LA1 fragment, byte-identical | C1-LA1 entry 16 (`0016-definition-E993Transport-activeWeight.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `074ed034729850d34722d0b1ceeb96d8362beaebf3b7a409cb3fab28a9850b93` |
| 17 | definition | `E993Transport.layerWeight` | C1-LA1 fragment, byte-identical | C1-LA1 entry 17 (`0017-definition-E993Transport-layerWeight.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `5ca5792309be23276583ac42cef294618e2471c97d3f58e67f0ab7980a3a83c3` |
| 18 | definition | `E993Transport.favorableLeaves` | C1-LA1 fragment, byte-identical | C1-LA1 entry 18 (`0018-definition-E993Transport-favorableLeaves.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `16b0c7672ed66c4cb53ba24d853764df160d6694f63b231346a2eb71c390ec77` |
| 19 | definition | `E993Transport.transportRel` | C1-LA1 fragment, byte-identical | C1-LA1 entry 19 (`0019-definition-E993Transport-transportRel.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `b1b9ac6c8de56fa740a37e5bac0fa628f1d817c2e33625ca34dcab33a1100d95` |
| 20 | definition | `E993Transport.IsSaturatingFlow` | C1-LA1 fragment, byte-identical | C1-LA1 entry 20 (`0020-definition-E993Transport-IsSaturatingFlow.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `a9d81c260914024d38f46ff5b564749d34f640674f9e9116685b4e7c631a48ac` |
| 21 | definition | `E993Transport.WeightedHall` | C1-LA1 fragment, byte-identical | C1-LA1 entry 21 (`0021-definition-E993Transport-WeightedHall.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `63534ffbfcc4bb1297228e598da165dcf98732939cd51a5d7fda3e62bc518478` |
| 22 | definition | `E993Transport.famMap` | re-derived (see note) | C-U1-T-CritINV.lean lines 22-28 — synthesis-frozen form; injectivity proof from C-U1-T setEmb | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `0072baac5b2a65b21aede9c79e8891f86bdef34d2980e9a53208382cf7977d91` |
| 23 | definition | `E993Transport.covered` | carried; `noncomputable`/`def` line break only | `U1-INV.lean` 227–229 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `5a7272b7318c108850de92e0d1b9c9e41d4497c119ede7ea146cea41ba520cf0` |
| 24 | definition | `E993Transport.cov` | carried; `noncomputable`/`def` line break only | `U1-INV.lean` 231–233 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `79c740a956373838c59f7b828443f589661e3cae84230b416b8a268947eebb9c` |
| 25 | definition | `E993Transport.supply` | carried; `noncomputable`/`def` line break only | `U1-INV.lean` 235–237 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `e981d867eed11f032fe42f04adfab048d213b00a6d921368dca040478b7cf2d7` |
| 26 | definition | `E993Transport.phi` | carried; `noncomputable`/`def` line break only | `U1-INV.lean` 239–243 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `402536db4c2a08c851c51a5300b19cb539a8d2ffb7061db2ee7310fcf6298d3c` |
| 27 | definition | `E993Transport.domain` | carried verbatim | `U1-INV.lean` 314–315 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `7dfc3846302a694014b66cb07308bf1a7121d367355fa91b355276402f736e0b` |
| 28 | definition | `E993Transport.maxPhi` | re-derived (see note) | U1-INV.lean lines 317-320 — nonempty witness inlined (registrar def-before-lemma order) | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `4fa71b0c0c71027117b594d26838d3e3bcf17a7a548afc2bd1c1be10bce21e70` |
| 29 | definition | `E993Transport.maximizers` | carried; `noncomputable`/`def` line break only | `U1-INV.lean` 322–324 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `0f1ec8e0a4b322f6872b4509b6445569b35ca73c606fc8b2e6ffe7bf73dacc32` |
| 30 | definition | `E993Transport.canonMin` | re-derived (see note) | U1-INV.lean lines 317, 326-328, 367-370 — nonempty witness inlined (registrar def-before-lemma order) | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `a891a9957dd56410a6c26c6e0a696f953b6479017a3f79657f19f21a21ca4e9c` |
| 31 | lemma | `E993Transport.isGraphLeaf_of_mem_favorableLeaves` | C1-LA1 fragment, byte-identical | C1-LA1 entry 24 (`0024-lemma-E993Transport-isGraphLeaf_of_mem_favorableLeaves.lean.fragment`) | C1-LA1 `FORMALIZATION-STATE.json` digest (= fragment digest) | `8977fb83111a46cace690984e23e2ffd54e2ea5233712bfeeca579f1debf75c8` |
| 32 | lemma | `E993Transport.isIndepSet_map_aut` | carried verbatim | `U1-INV.lean` 40–53 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `0218c4510d98bfd14545876f948ed1c4fc21dfad121c5968862d6a30f2185208` |
| 33 | lemma | `E993Transport.neighborFinset_map_aut` | carried verbatim | `U1-INV.lean` 55–67 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `55722f0f2fde567d98d11288759dfbf9bcd06edef609d223faf006833b15daae` |
| 34 | lemma | `E993Transport.isGraphLeaf_map_aut` | carried verbatim | `U1-INV.lean` 69–84 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `27fb04f91f99e571864377bc2c9dda81bdaa5982304b077d1fa5934da2f8a9b5` |
| 35 | lemma | `E993Transport.support_spec` | carried verbatim | `U1-INV.lean` 86–95 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `5b8bd4a85c06e95592b5642cffb47b09a65b5d12a5283da9df27ba9968303787` |
| 36 | lemma | `E993Transport.support_map_aut` | carried verbatim | `U1-INV.lean` 97–104 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `671013bdf19cf09c6551b7d227e4d40a8586bddbf37f1b1b3a9eba330caaeda0` |
| 37 | lemma | `E993Transport.tagWitnesses_map_aut` | carried verbatim | `U1-INV.lean` 106–111 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `1671788dfd616725f1dd885f3a60d9b82f9cbac4b03f228f9b1be81b5c9ee5c5` |
| 38 | lemma | `E993Transport.mem_leafSet_iff` | carried verbatim | `U1-INV.lean` 113–115 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `f134eff74e3c1ac28ac53feee79e696c47cd347804ab557f888504b837efb575` |
| 39 | lemma | `E993Transport.vertexDeletionIndepSetCount_map_aut` | carried verbatim | `U1-INV.lean` 131–145 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `788c9f7b87b9cf67befd6279a725c5dba440f3f08103eef13c4fefd91c9c17c4` |
| 40 | lemma | `E993Transport.isFavorableAt_map_aut` | carried verbatim | `U1-INV.lean` 147–151 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `2ac69fe3c20e10e7d1b68ea6b2984d104da1077ecc714c6a9bd334e6c2845129` |
| 41 | lemma | `E993Transport.favorableLeaves_map_aut` | carried; `theorem`→`lemma` only | `U1-INV.lean` 153–167 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `cdaeccdce48aca901d5f318337a2879bd01faee84f0d9f8892d7cf99b9c054fe` |
| 42 | lemma | `E993Transport.activeWeight_map_aut` | carried; `theorem`→`lemma` only | `U1-INV.lean` 169–185 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `ce09d63639fb8cf4c23e5b36e4a10a1b20efd88c596537a5ceffa7b03a0af5d2` |
| 43 | lemma | `E993Transport.map_map_symm_self` | carried verbatim | `U1-INV.lean` 187–190 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `a8bb1a8f2cd10e6228d492555ec52bff4f19f78f44a6344c77adfb733100e392` |
| 44 | lemma | `E993Transport.transportRel_map_aut_mp` | carried verbatim | `U1-INV.lean` 192–205 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `114a3006970f8ece479216d0b7251ba48795e06921a8c1f435b2f19147092105` |
| 45 | lemma | `E993Transport.transportRel_map_aut` | carried; `theorem`→`lemma` only | `U1-INV.lean` 207–215 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `fa934f4b3f3f7c61b6f5348b16858476ce8a55f29de8a6dd4663c844cea3e347` |
| 46 | lemma | `E993Transport.covered_union` | carried verbatim | `U1-INV.lean` 245–257 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `2a287f11cbaebacfa11eb73a38fdebf5fc8e201d749159d1e21a2fc223157a29` |
| 47 | lemma | `E993Transport.covered_inter_subset` | carried verbatim | `U1-INV.lean` 259–267 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `1cdc64296db75dee6bc1b2e6b11cd5dbb851f1e078792c1b1a99c6c2cc0d0108` |
| 48 | lemma | `E993Transport.cov_submodular` | carried verbatim | `U1-INV.lean` 269–285 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `0832bf5e84a0a71d62c9b14760a9e01a4119aebb9eb4a667c35436c31109024e` |
| 49 | lemma | `E993Transport.supply_modular` | carried verbatim | `U1-INV.lean` 287–290 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `316fc29399d51476d63d1ae89ea772caa5d95f2fb1eb5b505286e75bf09fbc6b` |
| 50 | lemma | `E993Transport.phi_supermodular` | carried; `theorem`→`lemma` only | `U1-INV.lean` 292–300 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `4bbae797abbbcd45af619f6767f9553257de2598b46de6b470cb8e8c01f7b76c` |
| 51 | lemma | `E993Transport.isMaximizer_union_inter` | carried; `theorem`→`lemma` only | `U1-INV.lean` 302–312 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `e63eddece8867130af7f1708e9e2988c895141b947eb69ddd51d915147c71fe0` |
| 52 | lemma | `E993Transport.domain_nonempty` | carried verbatim | `U1-INV.lean` 317–317 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `a9dd9ed5792d5ae3b932be2cc8186180b88f0b95e750995c2565ef020079d701` |
| 53 | lemma | `E993Transport.maximizers_nonempty` | carried verbatim | `U1-INV.lean` 326–328 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `f44ad9de98f03483d513c00d326b3e2717c00bdca148d37b14d0e21da76cb318` |
| 54 | lemma | `E993Transport.le_maxPhi_of_mem_domain` | carried verbatim | `U1-INV.lean` 330–332 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `8f60f64d2df148ca649e6f9500964449bf6ae51375614cb79b92f48eb326d125` |
| 55 | lemma | `E993Transport.mem_domain_union` | carried verbatim | `U1-INV.lean` 334–338 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `6b4743c54c4f1229c7e5d5231c5076cf4dc619086e5c53526d39fba00d3f8ebe` |
| 56 | lemma | `E993Transport.mem_domain_inter` | carried verbatim | `U1-INV.lean` 340–343 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `1cdae55fce2180c150692ea2152b5b59658cd2a5feb58772f3fb6c9ec9343e87` |
| 57 | lemma | `E993Transport.isMaximizer_inter` | carried verbatim | `U1-INV.lean` 356–365 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `93df92aa25edf0fb4c6148efd9505453c0ef124391964496b1f80360492b9b2e` |
| 58 | lemma | `E993Transport.canonMin_isMaximizer` | carried; `theorem`→`lemma` only | `U1-INV.lean` 376–378 | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` | `efd3b98b1384ce8d2b27acdc767aabacfdbc736cb84778fa11d2c83e0dc4658e` |
| 59 | lemma | `E993Transport.mem_famMap` | carried verbatim | `C-U1-T-CritINV.lean` 30–33 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `f9edabce19091026268c683d20f0b95a5374edf701f4bebdddffd67610b1004e` |
| 60 | lemma | `E993Transport.map_symm_map_self` | carried verbatim | `C-U1-T-CritINV.lean` 35–37 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `d01f5b58b1b23ffb974e68cdbc871463e1276f0f12fd30fa694162d4e3a815a2` |
| 61 | lemma | `E993Transport.mem_indepFamily_map` | carried verbatim | `C-U1-T-CritINV.lean` 39–44 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `467dec36b330ddd9329e656c2be6301d32027aac2d30731f1a067d815b391fb4` |
| 62 | lemma | `E993Transport.covered_famMap` | carried verbatim | `C-U1-T-CritINV.lean` 46–58 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `189219f33af782ab5e0c9ce56ed6387a624ad323970ea7be8e49b4a40168254d` |
| 63 | lemma | `E993Transport.activeWeight_map_of_invariant` | carried verbatim | `C-U1-T-CritINV.lean` 60–65 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `a4fdf241666c9df0acb82b097af5ce586d46fc09c0222a44b2170442bc2a145b` |
| 64 | lemma | `E993Transport.supply_famMap` | carried verbatim | `C-U1-T-CritINV.lean` 69–74 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `1bd48c950fb804787bf4ff1b82d4e96a9bb7c30f80600ea7871d32ef45ccdeac` |
| 65 | lemma | `E993Transport.cov_famMap` | carried verbatim | `C-U1-T-CritINV.lean` 76–81 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `cb28176c0cdb978ad49b451de6c83b190c57410fcbc2665f9dae0f295050c050` |
| 66 | lemma | `E993Transport.phi_famMap` | carried verbatim | `C-U1-T-CritINV.lean` 83–87 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `c5b2c970d9d369075598d3afc159a5b2454eed8af1a5c7e498611af9ddb50ad0` |
| 67 | lemma | `E993Transport.famMap_mem_domain` | carried verbatim | `C-U1-T-CritINV.lean` 89–95 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `31e42b7a9fd7531d477f1c305555a17e955aee02cae60282fc253392398e6814` |
| 68 | lemma | `E993Transport.famMap_mem_maximizers` | carried verbatim | `C-U1-T-CritINV.lean` 97–102 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `eb961c1fe4915a605eff6aebbf850a1785a299badd5e4943814c2f8b1bcf6713` |
| 69 | lemma | `E993Transport.card_famMap` | carried verbatim | `C-U1-T-CritINV.lean` 104–105 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `93cc12d32d0f4744a8d94b51571dc49390757d9904622a4752b5e49413834924` |
| 70 | lemma | `E993Transport.canonMin_famMap` | carried; `theorem`→`lemma` only | `C-U1-T-CritINV.lean` 107–115 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `2c437cddc3939ce82b57c8ff27ffde4ac5c6fc4085e3277bb3356f241c3b9a7c` |
| 71 | lemma | `E993Transport.covered_mono` | carried verbatim | `C-U1-T-CritINV.lean` 127–131 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `6cba1002be4bf6d8cbd88235913b07327073e892fc08810c854d2ced9e34466c` |
| 72 | lemma | `E993Transport.canonMin_pos` | carried; `theorem`→`lemma` only | `C-U1-T-CritINV.lean` 133–162 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `41f34ed6b32394c459ada7d40f8c50fb55551cfa95981ef1ba85caa47cfd4b85` |
| 73 | lemma | `E993Transport.filter_eq_covered` | carried verbatim | `C-U1-T-CritINV.lean` 164–171 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `9a29a3b33379ccee186cfd3084c87ea0147cb391455551483c51609f16a0559d` |
| 74 | lemma | `E993Transport.weightedHall_iff_phi_nonpos` | carried; `theorem`→`lemma` only | `C-U1-T-CritINV.lean` 173–192 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `18f181b429595f281f5e0b731b9de33eeafc9e0230a4b98803813022197a46b8` |
| 75 | lemma | `E993Transport.favorableLeaves_leaf` | carried verbatim | `C-U1-T-CritINV.lean` 194–197 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `10999e3f271bc7f7b8ca9d2314e97aa35d38d817ed8471db243c65b50b3414f0` |
| 76 | lemma | `E993Transport.weightedHall_iff_invariant` | re-derived (see note) | C-U1-T-CritINV.lean lines 228-244 — statement verbatim (keyword only); (⇐) proof re-derived without the terminal theorem | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `147e76e0f226408a91e6921fb267a77fc01971b8044fed784600db33e4dc226a` |
| 77 | theorem | `E993Transport.exists_aut_invariant_deficient_of_not_weightedHall` | terminal: synthesis binders + verbatim proof body | `C-U1-T-CritINV.lean` 210–226 (proof body); statement: synthesis `## Lean awards` C2-LA1 | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` | `cfc6f8520b4cec0fa3c4bf973ffc77c9d5b690291a7d83b6ac008160107319ca` |
