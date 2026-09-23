import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.FirstWide.binomCoeff 4122acfaa14e5c632d69ef149c6ba27d694236a36c7066cda31e970ac3ea2aac

/-
TRANSCRIPTION, NOT DISCOVERY.

Every declaration below is copied verbatim (statement and proof text
character-for-character identical) from the frozen, sealed G1 Lean source

  sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean
  SHA-256 aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4

which this seat independently re-verified against
`control/C4-STAGE2-PACKET-MANIFEST.json` (seal
36a38fb9ec783a3224c3e936249ffd29de5c5d73e9bf967170d96c3d82434b59, recomputed
canonically byte-for-byte and matched exactly, along with all 80 member file
digests, before any of this file was written).

The ONLY thing this seat changed is the surrounding `namespace`/`open`
packaging: the source file interleaves single declarations with shared
`namespace Erdos993G1 ... end Erdos993G1` scaffolding that spans many
consecutive `-- FROZEN-SOURCE ENTRY N BEGIN/END` blocks, so a subset cannot be
lifted by literal contiguous copy without dragging in unrelated material
(pathGraph-8 numerics, isomorphism-invariance lemmas, the `ambient`/`residual`
deletion machinery, `ordinaryG1Guards`, etc., entries 4-13, 15, 18-19, 21-22,
26-40, 55-57, 60-65, 67, 69, 71-145, 150-164, 171, 174, 177-179, none of which
are named in this seat's charter and none of which the closed-form/cell-lemma
target below depends on). Each block is cited with: original ENTRY number,
the original per-entry content hash printed at its BEGIN marker in the frozen
file, and its exact original line range, so any reviewer can `sed -n` the
cited range out of the frozen file and diff it byte-for-byte against the body
below. Dependency order (so every name resolves top-to-bottom, exactly as
Lean requires) was reconstructed by this seat from the proof texts; it is
listed in `## Dependency DAG` in RETURN.md.
-/

universe u
universe w

/- ENTRY 1 (lines 8-13) 858f5de3d80b67c1390e828786f252d3d6d020b7311b0039071e14bd1407c4a9 -/
noncomputable def Erdos993G1.indepCount {V : Type u}
    (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

/- ENTRY 2 (lines 17-19) 92ee6695ec9af348314ae6543d4102a54df31fa504644e0a0f386d6b81bd44cd -/
noncomputable def Erdos993G1.coeff {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

/- ENTRY 3 (lines 24-26) b34fa17ed22bb7174290541832e4f5abe5ec3e5ea329b7ab516d5b2db76eb201 -/
noncomputable def Erdos993G1.delta {V : Type u}
    (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

/- U-C5-03 ADDITION (this route, NOT Cycle 4): ENTRIES 6,7,8 (lines 45-56 of
   the frozen file), verbatim, needed for the pendant-vertex deletion
   machinery (closedNeighborhood = N[v], deleteVerts = induced subgraph on a
   removed vertex set, ambientA = G - N[v]) that Cycle 4's U3 return did not
   need and did not transcribe. Same frozen source, same seal
   (aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4), fully
   qualified names (Erdos993G1.foo), so placed here BEFORE `namespace
   Erdos993G1` opens, matching their un-namespaced style in the original. -/
-- FROZEN-SOURCE ENTRY 6 (lines 45-47) 589a193da9846f7dfa34a178b346f3466b219affcd372591acccba327bc5c9a3
def Erdos993G1.closedNeighborhood {V : Type u}
    (T : SimpleGraph V) (v : V) : Set V :=
  {w | w = v ∨ T.Adj v w}

-- FROZEN-SOURCE ENTRY 6 END

-- FROZEN-SOURCE ENTRY 7 BEGIN definition Erdos993G1.deleteVerts 8044160bd96993004323eaebfb80e42820d15779af6158f7906dd76e79c61378
def Erdos993G1.deleteVerts {V : Type u}
    (F : SimpleGraph V) (S : Set V) : SimpleGraph {w : V // w ∉ S} :=
  F.induce Sᶜ

-- FROZEN-SOURCE ENTRY 7 END

-- FROZEN-SOURCE ENTRY 8 BEGIN definition Erdos993G1.ambientA b504fd5411779932120471f20ba7398be72724b13e87404b5b6ad5a7df9a3a55
def Erdos993G1.ambientA {V : Type u}
    (T : SimpleGraph V) (v : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v)

-- FROZEN-SOURCE ENTRY 8 END

namespace Erdos993G1

variable {V : Type u} (F : SimpleGraph V)

/- ENTRY 16 (lines 136-140) b12f77f59d3690c92c7c8bada90d9b4c5f1449b5b17c2e5574308cfbf54a0536 -/
lemma isNIndepSet_one_iff (S : Finset V) :
    F.IsNIndepSet 1 S ↔ ∃ a, S = {a} := by
  classical
  simpa only [SimpleGraph.isNClique_compl] using
    (SimpleGraph.isNClique_one (G := Fᶜ) (s := S))

/- ENTRY 17 (lines 145-149) 4c59444af666076a0ce8c355415235545a1d9c97ae721113599f63dcfb489a31 -/
lemma indepCount_eq_card_indepSetFinset [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

/- ENTRY 20 (lines 172-182) 2c3536cb34ec79e12b8147cd94b40ec4f4c21269c2fc1c9efd90a558e487a31e -/
lemma indepCount_one [Finite V] : indepCount F 1 = (Nat.card V : ℤ) := by
  classical
  letI := Fintype.ofFinite V
  rw [indepCount_eq_card_indepSetFinset]
  have h : F.indepSetFinset 1 = Finset.univ.image (fun a : V => ({a} : Finset V)) := by
    ext S
    simp only [SimpleGraph.mem_indepSetFinset_iff, isNIndepSet_one_iff,
      Finset.mem_image, Finset.mem_univ, true_and]
    exact ⟨fun ⟨a, ha⟩ => ⟨a, ha.symm⟩, fun ⟨a, ha⟩ => ⟨a, ha.symm⟩⟩
  rw [h, Finset.card_image_of_injective _ Finset.singleton_injective,
    Finset.card_univ, Nat.card_eq_fintype_card]

/- ENTRY 23 (lines 209-210) 03f00ca029c7e10a6278ad907c2d6e5891668cdff802ec6768f9f93e51ed47f7 -/
lemma coeff_nat (k : ℕ) : coeff F (k : ℤ) = indepCount F k := by
  simp [coeff]

/- ENTRY 25 (lines 221-224) a7a02236294541ef40fa02c9d9f0dd02052d13536f6523f462e2d5b96ff04f9e -/
lemma delta_nat (k : ℕ) :
    delta F (k : ℤ) = indepCount F (k + 1) - indepCount F k := by
  simpa only [delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (coeff_nat F (k + 1)) (coeff_nat F k)

/- U-C5-03 ADDITION: ENTRY 38 (lines 344-348 of the frozen file), verbatim,
   needed to know deleteVerts preserves acyclicity (so F - v and F - N[v]
   are forests again whenever F is). -/
-- FROZEN-SOURCE ENTRY 38 (lines 344-348) fa008ac82c212d1670b3452bfae66fd9cdc7d0daf5cf0730113bca4db67f24d6
-- FROZEN-SOURCE ENTRY 38 BEGIN lemma Erdos993G1.deleteVerts_isAcyclic fa008ac82c212d1670b3452bfae66fd9cdc7d0daf5cf0730113bca4db67f24d6
lemma deleteVerts_isAcyclic (h : F.IsAcyclic) (S : Set V) :
    (deleteVerts F S).IsAcyclic :=
  h.induce _


/- ENTRY 41 (lines 374-379) c7fe22b14d4127788420f1fc872c6908e1c8e03d5089db1a4512366a1c6011cd -/
lemma isNIndepSet_pair_iff [DecidableEq V] (a b : V) :
    F.IsNIndepSet 2 {a, b} ↔ a ≠ b ∧ ¬F.Adj a b := by
  by_cases h : a = b
  · subst b
    simp [SimpleGraph.isNIndepSet_iff]
  · simp [SimpleGraph.isNIndepSet_iff, SimpleGraph.isIndepSet_iff, Set.Pairwise, h, F.adj_comm] <;> tauto

/- ENTRY 42 (lines 384-389) b6bb80d1fc0be2dc048f714854ea2d7ae9649fbceb0e5bbffbd1fae3d1947acd -/
lemma sym2_toFinset_injective [DecidableEq V] :
    Function.Injective (Sym2.toFinset : Sym2 V → Finset V) := by
  intro a b h
  apply Sym2.ext
  intro v
  simpa only [Sym2.mem_toFinset] using iff_of_eq (congrArg (v ∈ ·) h)

/- ENTRY 43 (lines 394-411) 39a4bb3841ed900d0110289548de64819de9508cc2754cd12dd313c2afe30cc8 -/
lemma indepSetFinset_two_eq [Fintype V] [DecidableEq V] [DecidableRel F.Adj] :
    F.indepSetFinset 2 = (Fᶜ.edgeFinset).image Sym2.toFinset := by
  ext S
  constructor
  · intro h
    have hS := SimpleGraph.mem_indepSetFinset_iff.mp h
    obtain ⟨a, b, hab, rfl⟩ := Finset.card_eq_two.mp hS.card_eq
    refine Finset.mem_image.mpr ⟨s(a, b), ?_, Sym2.toFinset_mk_eq⟩
    simpa only [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
      SimpleGraph.compl_adj] using (isNIndepSet_pair_iff F a b).mp hS
  · intro h
    obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp h
    induction e using Sym2.inductionOn with
    | hf a b =>
      rw [SimpleGraph.mem_indepSetFinset_iff, Sym2.toFinset_mk_eq,
        isNIndepSet_pair_iff]
      simpa only [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet,
        SimpleGraph.compl_adj] using he

/- ENTRY 44 (lines 416-438) a01f026068c216985f79412914a708de863f8d52ac60d7369e2b85a21c58c014 -/
lemma indepCount_two_add_edges [Finite V] :
    indepCount F 2 + (Nat.card F.edgeSet : ℤ) = ((Nat.card V).choose 2 : ℤ) := by
  classical
  letI := Fintype.ofFinite V
  have hd : Disjoint F.edgeFinset Fᶜ.edgeFinset :=
    SimpleGraph.disjoint_edgeFinset.mpr disjoint_compl_right
  have hu : F.edgeFinset ∪ Fᶜ.edgeFinset = (⊤ : SimpleGraph V).edgeFinset := by
    ext e
    induction e using Sym2.inductionOn with
    | hf a b =>
      by_cases hab : a = b
      · subst b
        simp
      · simp [SimpleGraph.compl_adj, hab]
        exact Classical.em _
  have ht : F.edgeFinset.card + Fᶜ.edgeFinset.card = (Fintype.card V).choose 2 := by
    rw [← Finset.card_union_of_disjoint hd, hu,
      SimpleGraph.card_edgeFinset_top_eq_card_choose_two]
  rw [indepCount_eq_card_indepSetFinset, indepSetFinset_two_eq,
    Finset.card_image_of_injective _ sym2_toFinset_injective,
    Nat.card_eq_fintype_card, Nat.card_eq_fintype_card,
    ← SimpleGraph.edgeFinset_card]
  exact_mod_cast (by omega : Fᶜ.edgeFinset.card + F.edgeFinset.card = (Fintype.card V).choose 2)

/- ENTRY 45 (lines 450-455) ec9d1ede162d82ed94a34a38672bad65fc69ea0b778b5162ae78c5fec73a5628 -/
lemma indepSetFinset_eq_filter_powersetCard [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (k : ℕ) :
    F.indepSetFinset k = ((Finset.univ : Finset V).powersetCard k).filter
      (fun B : Finset V => F.IsIndepSet B) := by
  ext B
  simp [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff, and_comm]

/- ENTRY 46 (lines 460-471) 96c84ad8516cd9224be112085b17e6b4dceb988fd19ce9e39ffaad28a4804cbc -/
lemma card_nonindep_pairs [Fintype V] [DecidableEq V] [DecidableRel F.Adj] :
    (((Finset.univ : Finset V).powersetCard 2).filter
      (fun E : Finset V => ¬F.IsIndepSet E)).card = Nat.card F.edgeSet := by
  have hp := Finset.card_filter_add_card_filter_not
    (s := (Finset.univ : Finset V).powersetCard 2)
    (fun E : Finset V => F.IsIndepSet E)
  rw [← indepSetFinset_eq_filter_powersetCard, Finset.card_powersetCard,
    Finset.card_univ] at hp
  have he := indepCount_two_add_edges F
  rw [indepCount_eq_card_indepSetFinset,
    Nat.card_eq_fintype_card (α := V)] at he
  omega

/- ENTRY 47 (lines 476-482) db506bda8bc6b666134551b5bc0fd50e22daf1b537ec59f21be1da84eb4ffe98 -/
lemma sum_card_filter_swap {A : Type u} {B : Type w}
    (s : Finset A) (t : Finset B) (p : A → B → Prop)
    [DecidableRel p] :
    ∑ a ∈ s, (t.filter (p a)).card =
      ∑ b ∈ t, (s.filter (fun a => p a b)).card := by
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]
  exact Finset.sum_comm

/- ENTRY 48 (lines 487-518) da829ee128471804d3016cd47dc81dc700c969ffe760cdfe792d805388f36292 -/
lemma sum_nonindep_pair_incidence [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
      ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card =
        Nat.card F.edgeSet * (Fintype.card V - 2) := by
  classical
  let E := ((Finset.univ : Finset V).powersetCard 2).filter
    (fun S : Finset V => ¬F.IsIndepSet S)
  have hlocal (B : Finset V) :
      (B.powersetCard 2).filter (fun S : Finset V => ¬F.IsIndepSet S) =
        E.filter (fun S => S ⊆ B) := by
    ext S
    simp [E, and_assoc, and_left_comm, and_comm]
  calc
    _ = ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        (E.filter (fun S => S ⊆ B)).card := by
      apply Finset.sum_congr rfl
      intro B _
      rw [hlocal]
    _ = ∑ S ∈ E, (((Finset.univ : Finset V).powersetCard 3).filter
        (fun B => S ⊆ B)).card :=
      sum_card_filter_swap _ _ (fun B S : Finset V => S ⊆ B)
    _ = ∑ S ∈ E, (Fintype.card V - 2) := by
      apply Finset.sum_congr rfl
      intro S hS
      have hcard : S.card = 2 := (Finset.mem_powersetCard.mp
        (Finset.mem_filter.mp hS).1).2
      rw [Finset.card_filter_powersetCard_subset S Finset.univ 3
        (Finset.subset_univ _) (by omega), hcard, Finset.card_univ]
      simp
    _ = E.card * (Fintype.card V - 2) := by simp
    _ = _ := by rw [show E.card = Nat.card F.edgeSet from card_nonindep_pairs F]

/- ENTRY 49 (lines 523-528) e8656c5832d89388faa9e5fbe465d97c9212944d86545795e43360d7cf446d54 -/
lemma sum_indep_indicator [Fintype V] [DecidableEq V] [DecidableRel F.Adj]
    (k : ℕ) :
    ∑ B ∈ (Finset.univ : Finset V).powersetCard k,
      (if F.IsIndepSet B then 1 else 0) = (F.indepSetFinset k).card := by
  rw [indepSetFinset_eq_filter_powersetCard]
  simp only [Finset.card_eq_sum_ones, Finset.sum_filter]

/- ENTRY 50 (lines 540-577) 1987228dfddb76922331fd7897112e6fbb9500d655adc833b004028ebafcd53d -/
lemma triple_local_identity [DecidableEq V] [DecidableRel F.Adj]
    (hF : F.IsAcyclic) (B : Finset V) (hB : B.card = 3) :
    (if F.IsIndepSet B then 1 else 0) +
        ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card =
      1 + ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2 := by
  classical
  obtain ⟨a, b, c, hab, hac, hbc, rfl⟩ := Finset.card_eq_three.mp hB
  have hn : ¬(F.Adj a b ∧ F.Adj a c ∧ F.Adj b c) := by
    intro h
    exact (hF.cliqueFree (by omega : 3 ≤ 3)) {a, b, c}
      ((F.is3Clique_triple_iff).mpr h)
  have hsingle : ({c} : Finset V).powerset = {∅, {c}} := by
    change (insert c ∅ : Finset V).powerset = _
    rw [Finset.powerset_insert]
    simp
  have hpabac : ({a, b} : Finset V) ≠ {a, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => b ∈ S) h
    simp [hab.symm, hbc] at h'
  have hpabbc : ({a, b} : Finset V) ≠ {b, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => a ∈ S) h
    simp [hab, hac] at h'
  have hpacbc : ({a, c} : Finset V) ≠ {b, c} := by
    intro h
    have h' := congrArg (fun S : Finset V => a ∈ S) h
    simp [hab, hac] at h'
  have hp : ({a, b, c} : Finset V).powersetCard 2 =
      {{a, b}, {a, c}, {b, c}} := by
    simp [Finset.powersetCard_eq_filter, Finset.powerset_insert,
      hsingle, Finset.filter_insert, Finset.filter_singleton, Finset.insert_comm,
      hab, hac, hbc, hab.symm, hac.symm, hbc.symm]
  rw [hp]
  by_cases hab' : F.Adj a b <;> by_cases hac' : F.Adj a c <;>
    by_cases hbc' : F.Adj b c
  all_goals simp_all [SimpleGraph.isIndepSet_iff, Set.Pairwise, F.adj_comm,
    Finset.filter_insert, Finset.filter_singleton, hpabac, hpabbc, hpacbc,
    hab, hac, hbc, hab.symm, hac.symm, hbc.symm]

/- ENTRY 51 (lines 589-607) 80322d36a50c5f8eedef153e69e935eaf0bebd0f6e842e96267c37f5a18cb932 -/
lemma indepSetFinset_three_incidence [Fintype V] [DecidableEq V]
    [DecidableRel F.Adj] (hF : F.IsAcyclic) :
    (F.indepSetFinset 3).card + Nat.card F.edgeSet * (Fintype.card V - 2) =
      (Fintype.card V).choose 3 +
        ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
          ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2 := by
  have hs :
      (∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        ((if F.IsIndepSet B then 1 else 0) +
          ((B.powersetCard 2).filter (fun E : Finset V => ¬F.IsIndepSet E)).card)) =
      ∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
        (1 + ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2) := by
    apply Finset.sum_congr rfl
    intro B hB
    exact triple_local_identity F hF B (Finset.mem_powersetCard.mp hB).2
  simp only [Finset.sum_add_distrib] at hs
  rw [sum_indep_indicator, sum_nonindep_pair_incidence] at hs
  simpa only [Finset.sum_const, smul_eq_mul, mul_one,
    Finset.card_powersetCard, Finset.card_univ] using hs

/- ENTRY 53 (lines 628-684) 5d6d13f96ef2b45f6ff273927629e027fd51f7516517e36611d6551eb587a326 -/
lemma sum_triple_centered_neighbor_pairs {V : Type u}
    [Fintype V] [DecidableEq V] (F : SimpleGraph V) [DecidableRel F.Adj] :
    (∑ B ∈ (Finset.univ : Finset V).powersetCard 3,
      ∑ a ∈ B, ((B.filter (F.Adj a)).card).choose 2) =
      ∑ a : V, (F.degree a).choose 2 := by
  let L : Finset (Σ _B : Finset V, Σ _a : V, Finset V) :=
    ((Finset.univ : Finset V).powersetCard 3).sigma fun B =>
      B.sigma fun a => (B.filter (F.Adj a)).powersetCard 2
  let R : Finset (Σ _a : V, Finset V) :=
    (Finset.univ : Finset V).sigma fun a => (F.neighborFinset a).powersetCard 2
  have hcard : L.card = R.card := by
    refine Finset.card_bij'
      (fun x _ => x.2)
      (fun y _ => ⟨insert y.1 y.2, y⟩) ?_ ?_ ?_ ?_
    · rintro ⟨B, a, N⟩ hx
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and] at hx
      obtain ⟨hB, ha, hN, hn⟩ := hx
      simp only [R, Finset.mem_sigma, Finset.mem_univ, true_and,
        Finset.mem_powersetCard]
      refine ⟨?_, hn⟩
      intro w hw
      exact (F.mem_neighborFinset a w).mpr (Finset.mem_filter.mp (hN hw)).2
    · rintro ⟨a, N⟩ hy
      simp only [R, Finset.mem_sigma, Finset.mem_univ, true_and,
        Finset.mem_powersetCard] at hy
      obtain ⟨hN, hn⟩ := hy
      have ha : a ∉ N := by
        intro h
        exact F.irrefl ((F.mem_neighborFinset a a).mp (hN h))
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and]
      refine ⟨?_, Finset.mem_insert_self a N, ?_, hn⟩
      · simp [Finset.card_insert_of_notMem ha, hn]
      · intro w hw
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_insert_of_mem hw, (F.mem_neighborFinset a w).mp (hN hw)⟩
    · rintro ⟨B, a, N⟩ hx
      simp only [L, Finset.mem_sigma, Finset.mem_powersetCard,
        Finset.subset_univ, true_and] at hx
      obtain ⟨hB, haB, hN, hn⟩ := hx
      have ha : a ∉ N := by
        intro h
        exact F.irrefl (Finset.mem_filter.mp (hN h)).2
      have hNB : insert a N ⊆ B := by
        intro w hw
        obtain rfl | hw := Finset.mem_insert.mp hw
        · exact haB
        · exact (Finset.mem_filter.mp (hN hw)).1
      have hEq : insert a N = B := by
        apply Finset.eq_of_subset_of_card_le hNB
        simp [hB, Finset.card_insert_of_notMem ha, hn]
      simp only [hEq]
    · rintro ⟨a, N⟩ _
      rfl
  simpa only [L, R, Finset.card_sigma, Finset.card_powersetCard,
    SimpleGraph.card_neighborFinset_eq_degree] using hcard

/- ENTRY 54 (lines 694-702) b398a1f04b7b79977e8c1fc91c4eff3e3af0fec8c9def9962f181c902fe781da -/
lemma indepCount_three_add_edge_incidence {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (hF : F.IsAcyclic) :
    indepCount F 3 + (Nat.card F.edgeSet : ℤ) * ((Fintype.card V - 2 : ℕ) : ℤ) =
      ((Fintype.card V).choose 3 : ℤ) +
        ∑ a : V, ((F.degree a).choose 2 : ℤ) := by
  have h := indepSetFinset_three_incidence F hF
  rw [sum_triple_centered_neighbor_pairs] at h
  rw [indepCount_eq_card_indepSetFinset]
  exact_mod_cast h

/- ENTRY 58 (lines 742-788) 0c2fc141909dd6efa072639e3071ed6f5e6b14787697f3dd2ee2579560bb017f -/
lemma forest_card_edges_add_components {V : Type u} [Finite V]
    (F : SimpleGraph V) (hF : F.IsAcyclic) :
    Nat.card F.edgeSet + Nat.card F.ConnectedComponent = Nat.card V := by
  classical
  letI := Fintype.ofFinite V
  have hvertices :
      (∑ c : F.ConnectedComponent, Fintype.card c) = Fintype.card V := by
    have hv := Fintype.sum_fiberwise F.connectedComponentMk (fun _ : V => (1 : ℕ))
    simp only [Finset.sum_const, Finset.card_univ, smul_eq_mul, mul_one] at hv
    calc
      _ = ∑ c : F.ConnectedComponent,
          Fintype.card {v : V // F.connectedComponentMk v = c} := by
        apply Finset.sum_congr rfl
        intro c _
        exact Fintype.card_congr (Equiv.refl _)
      _ = _ := hv
  have hdegrees :
      (∑ c : F.ConnectedComponent, ∑ v : c, F.degree v.val) =
        ∑ v : V, F.degree v := by
    exact Fintype.sum_fiberwise F.connectedComponentMk (fun v : V => F.degree v)
  have hcomponent (c : F.ConnectedComponent) :
      (∑ v : c, F.degree v.val) + 2 = 2 * Fintype.card c := by
    have ht := (hF.isTree_connectedComponent c).card_edgeFinset
    have hd := c.toSimpleGraph.sum_degrees_eq_twice_card_edges
    have heq : (∑ v : c, F.degree v.val) =
        ∑ v : c, c.toSimpleGraph.degree v := by
      apply Finset.sum_congr rfl
      intro v _
      symm
      rw [← SimpleGraph.card_neighborSet_eq_degree,
        ← SimpleGraph.card_neighborSet_eq_degree]
      exact Fintype.card_congr
        { toFun := fun w => ⟨w.val.val, w.property⟩
          invFun := fun w =>
            ⟨⟨w.val, c.mem_supp_of_adj_mem_supp v.property w.property⟩, w.property⟩
          left_inv := fun _ => rfl
          right_inv := fun _ => rfl }
    rw [heq, hd]
    omega
  have hsum := congrArg
    (fun f : F.ConnectedComponent → ℕ => ∑ c, f c) (funext hcomponent)
  simp only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
    smul_eq_mul, ← Finset.mul_sum] at hsum
  rw [hdegrees, hvertices, F.sum_degrees_eq_twice_card_edges] at hsum
  have hcount : F.edgeFinset.card + Fintype.card F.ConnectedComponent =
      Fintype.card V := by omega
  simpa only [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card] using hcount

/- ENTRY 59 (lines 793-797) bd55e00b7dabf7179733a98d36feec04246ff14e0711a9213ddea4545442ebba -/
lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos

end Erdos993G1

/- ENTRY 66 (lines 965-973) 36d264dd1540fb3c551965bb8704a04e73dffb2748e1497c1638b7d3407c7d8e -/
lemma Erdos993G1.degreeDefect_nonneg (d : ℕ) :
    (0 : ℤ) ≤ (d.choose 2 : ℤ) - (d : ℤ) + 1 := by
  cases d with
  | zero => norm_num
  | succ n =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    have h := (Nat.cast_nonneg (n.choose 2) : (0 : ℤ) ≤ n.choose 2)
    omega

/- ENTRY 68 (lines 1001-1007) 32408765453e657cc5f7832829d929966472874f342ca4c81d8899d5d346784e -/
lemma Erdos993G1.degreeChoose_sum_lower {V : Type*} [Fintype V] (d : V → ℕ) :
    (∑ v, (d v : ℤ)) - Fintype.card V ≤ ∑ v, ((d v).choose 2 : ℤ) := by
  have h : 0 ≤ ∑ v, (((d v).choose 2 : ℤ) - (d v : ℤ) + 1) :=
    Finset.sum_nonneg (fun v _ => Erdos993G1.degreeDefect_nonneg (d v))
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, mul_one] at h
  omega

/- ENTRY 70 (lines 1029-1038) c526653f5ce4c90392e252c3e28e6ce164135670fdd12d5664f120646f2671d8 -/
lemma Erdos993G1.scaledChooseTwo (n : ℕ) :
    2 * (n.choose 2 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.choose_one_right, Nat.cast_add, Nat.cast_succ]
    change 2 * ((n : ℤ) + (n.choose 2 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1)
    nlinarith

/- ENTRY 71 (lines 1043-1052) bcef58787034fa165d746e7fa2a863cc1a20b351dafb9951cc1178ad9b01fc1b -/
lemma Erdos993G1.scaledChooseThree (n : ℕ) :
    6 * (n.choose 3 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) * ((n : ℤ) - 2) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.cast_add, Nat.cast_succ]
    change 6 * ((n.choose 2 : ℤ) + (n.choose 3 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1) * ((n : ℤ) + 1 - 2)
    nlinarith [Erdos993G1.scaledChooseTwo n]

namespace Erdos993G1.FirstWide

/- ENTRY 14 (lines 121-122) 15be04fe3358ec671f28da2db52c757627e101992d8d40791181b1b1e5f06a6d -/
def binomCoeff (n : ℕ) (k : ℤ) : ℤ :=
  if 0 ≤ k then (n.choose k.toNat : ℤ) else 0

/- ENTRY 82 (lines 1279-1280) 586e57d9bbf57356d8d3f141a64048b60b0025dd334aa3cb43cf0c05b86fd40b -/
lemma binomCoeff_nat (n k : ℕ) : binomCoeff n (k : ℤ) = (n.choose k : ℤ) := by
  simp [binomCoeff]

/- ENTRY 83 (lines 1288-1289) 0fd093d56b6fbbc606c172582bf0269994ddb4b44a43255450640e15ac99592f -/
lemma binomCoeff_neg (n : ℕ) {k : ℤ} (hk : k < 0) : binomCoeff n k = 0 := by
  simp [binomCoeff, not_le.mpr hk]

end Erdos993G1.FirstWide

/- ENTRY 146 (lines 2716-2721) 6daec2923384e73fdac57762d37e7e60f4af9f6db10ac7ba4c1fc73d7d0ce92e -/
namespace Erdos993G1.ThirdWide

lemma catalan_pos_int (n : ℕ) : (0 : ℤ) < catalan n := by
  have hc : (0:ℕ) < (2*n).choose n := Nat.choose_pos (by omega)
  have he := succ_mul_catalan_eq_centralBinom n
  change (n+1)*catalan n=(2*n).choose n at he
  have : 0<catalan n := by nlinarith
  exact_mod_cast this

end Erdos993G1.ThirdWide

/- ENTRY 147 (lines 2729-2736) 781e38a130fc5a4c11297a11a33f51fc8c7a5714cd1bfc99dbe2ca0cae3ea852 -/
namespace Erdos993G1.ThirdWide

lemma catalan_recurrence_int (n : ℕ) :
    ((n:ℤ)+2) * catalan (n+1) = (4*n+2) * catalan n := by
  have hc := Nat.succ_mul_centralBinom_succ n
  rw [← succ_mul_catalan_eq_centralBinom (n+1), ← succ_mul_catalan_eq_centralBinom n] at hc
  have he : ((n:ℤ)+1) * (((n:ℤ)+2) * catalan (n+1)) =
      2*(2*n+1)*(((n:ℤ)+1)*catalan n) := by exact_mod_cast hc
  apply (mul_left_cancel₀ (show (n:ℤ)+1 ≠ 0 by omega))
  nlinarith [he]

end Erdos993G1.ThirdWide

/- ENTRY 148 (lines 2744-2762) 1ee4cb872cab161bae8ebcd306fdfd24240cae92f7b90a778f769428b5556ff3 -/
namespace Erdos993G1.ThirdWide

lemma catalan_gap_identity (t : ℕ) :
    (((t:ℤ)+2)*((t:ℤ)+3)*((t:ℤ)+4)*((t:ℤ)+5)*((t:ℤ)+6)) *
      ((catalan (t+5):ℤ) - 4*catalan (t+3) - 6*catalan (t+2) -
        4*catalan (t+1) - catalan t) =
      (3600+20748*(t:ℤ)+36556*(t:ℤ)^2+24797*(t:ℤ)^3+
        6884*(t:ℤ)^4+655*(t:ℤ)^5)*catalan t := by
  have e0 := catalan_recurrence_int t
  have e1 := catalan_recurrence_int (t+1)
  have e2 := catalan_recurrence_int (t+2)
  have e3 := catalan_recurrence_int (t+3)
  have e4 := catalan_recurrence_int (t+4)
  norm_num only [Nat.cast_add, Nat.cast_ofNat, show t+1+1=t+2 by omega,
    show t+2+1=t+3 by omega, show t+3+1=t+4 by omega, show t+4+1=t+5 by omega] at e1 e2 e3 e4
  linear_combination
    (2160+6576*(t:ℤ)+5416*(t:ℤ)^2+1644*(t:ℤ)^3+164*(t:ℤ)^4)*e0 +
    (1200+2448*(t:ℤ)+1656*(t:ℤ)^2+450*(t:ℤ)^3+42*(t:ℤ)^4)*e1 +
    (792+1164*(t:ℤ)+624*(t:ℤ)^2+144*(t:ℤ)^3+12*(t:ℤ)^4)*e2 +
    (432+564*(t:ℤ)+266*(t:ℤ)^2+54*(t:ℤ)^3+4*(t:ℤ)^4)*e3 +
    (120+154*(t:ℤ)+71*(t:ℤ)^2+14*(t:ℤ)^3+(t:ℤ)^4)*e4

end Erdos993G1.ThirdWide

/- ENTRY 149 (lines 2770-2785) 8e27823a598cfcc4a6ae17132e70dd86de38212d26cfa661094cd2885f0450a7 -/
namespace Erdos993G1.ThirdWide

lemma catalan_gap_pos (k : ℕ) (h : 4 ≤ k) :
    0 < (catalan (k+1):ℤ) - 4*catalan (k-1) - 6*catalan (k-2) -
      4*catalan (k-3) - catalan (k-4) := by
  obtain ⟨t, rfl⟩ := Nat.exists_eq_add_of_le' h
  have he := catalan_gap_identity t
  have hc := catalan_pos_int t
  have hp : (0:ℤ) < 3600+20748*(t:ℤ)+36556*(t:ℤ)^2+24797*(t:ℤ)^3+
      6884*(t:ℤ)^4+655*(t:ℤ)^5 := by positivity
  have hd : (0:ℤ) < ((t:ℤ)+2)*((t:ℤ)+3)*((t:ℤ)+4)*((t:ℤ)+5)*((t:ℤ)+6) := by positivity
  have hg : (0:ℤ) < (catalan (t+5):ℤ) - 4*catalan (t+3) - 6*catalan (t+2) -
      4*catalan (t+1) - catalan t := by
    have hm := mul_pos hp hc
    rw [← he] at hm
    exact (mul_pos_iff_of_pos_left hd).mp hm
  simpa only [show t+4+1=t+5 by omega, show t+4-1=t+3 by omega,
    show t+4-2=t+2 by omega, show t+4-3=t+1 by omega, Nat.add_sub_cancel] using hg

end Erdos993G1.ThirdWide

/- ENTRY 165 (lines 3414-3500) 6307108c49fc64c9a0029a9d74c226018a516ebbcaaa7045e971bef3b0caf46e -/
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_fiber_count {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C S : Finset X)
    (hSC : S ⊆ C) (hS : F.IsIndepSet S)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    (((F.indepSetFinset k).filter (fun T => T ∩ C = S)).card : ℤ) =
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card) := by
  classical
  let B := (univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)
  let A := (F.indepSetFinset k).filter (fun T => T ∩ C = S)
  by_cases hsk : S.card ≤ k
  · have hcount : A.card = (B.powersetCard (k-S.card)).card := by
      apply Finset.card_bij (fun T _ => T \ C)
      · intro T hT
        obtain ⟨hT,hTC⟩ := mem_filter.mp hT
        have hind := (SimpleGraph.mem_indepSetFinset_iff.mp hT).isIndepSet
        have htcard := (SimpleGraph.mem_indepSetFinset_iff.mp hT).card_eq
        refine mem_powersetCard.mpr ⟨?_,?_⟩
        · intro x hx
          obtain ⟨hxT,hxC⟩ := mem_sdiff.mp hx
          refine mem_filter.mpr ⟨mem_univ _, hxC, ?_⟩
          intro y hy hadj
          have hyT : y ∈ T := (mem_inter.mp (hTC ▸ hy)).1
          exact hind hyT hxT hadj.ne hadj
        · have hc := card_sdiff_add_card_inter T C
          rw [hTC,htcard] at hc
          omega
      · intro T hT U hU heq
        have hTC := (mem_filter.mp hT).2
        have hUC := (mem_filter.mp hU).2
        have hTdec : T \ C ∪ S = T := by rw [← hTC]; exact sdiff_union_inter _ _
        have hUdec : U \ C ∪ S = U := by rw [← hUC]; exact sdiff_union_inter _ _
        rw [← hTdec, ← hUdec, heq]
      · intro J hJ
        obtain ⟨hJB,hJcard⟩ := mem_powersetCard.mp hJ
        have hJC : Disjoint J C := disjoint_left.mpr (by
          intro x hx hxC
          exact (mem_filter.mp (hJB hx)).2.1 hxC)
        have hJS : Disjoint J S := hJC.mono_right hSC
        have hind : F.IsIndepSet (↑(J ∪ S) : Set X) := by
          intro x hx y hy hxy hadj
          rcases mem_union.mp hx with hx | hx <;> rcases mem_union.mp hy with hy | hy
          · rcases hcover x y hadj with hxC | hyC
            · exact (mem_filter.mp (hJB hx)).2.1 hxC
            · exact (mem_filter.mp (hJB hy)).2.1 hyC
          · exact (mem_filter.mp (hJB hx)).2.2 y hy hadj.symm
          · exact (mem_filter.mp (hJB hy)).2.2 x hx hadj
          · exact hS hx hy hxy hadj
        refine ⟨J ∪ S, mem_filter.mpr ⟨?_,?_⟩, ?_⟩
        · apply SimpleGraph.mem_indepSetFinset_iff.mpr
          refine ⟨hind,?_⟩
          rw [card_union_of_disjoint hJS,hJcard]
          omega
        · ext x
          simp only [mem_inter,mem_union]
          constructor
          · rintro ⟨hx,hxC⟩
            rcases hx with hx | hx
            · exact False.elim ((disjoint_left.mp hJC hx) hxC)
            · exact hx
          · intro hx
            exact ⟨Or.inr hx,hSC hx⟩
        · ext x
          simp only [mem_sdiff,mem_union]
          constructor
          · rintro ⟨hx,hxC⟩
            rcases hx with hx | hx
            · exact hx
            · exact False.elim (hxC (hSC hx))
          · intro hx
            exact ⟨Or.inl hx,fun hxC => disjoint_left.mp hJC hx hxC⟩
    rw [card_powersetCard] at hcount
    have hz : (k : ℤ) - S.card = ((k-S.card : ℕ) : ℤ) := by omega
    change (A.card : ℤ) = FirstWide.binomCoeff B.card _
    rw [hcount,hz,FirstWide.binomCoeff_nat]
  · have hA : A = ∅ := by
      apply eq_empty_iff_forall_notMem.mpr
      intro T hT
      obtain ⟨hT,hTC⟩ := mem_filter.mp hT
      have hc := card_le_card (inter_subset_left (s₁ := T) (s₂ := C))
      rw [hTC,(SimpleGraph.mem_indepSetFinset_iff.mp hT).card_eq] at hc
      exact hsk hc
    have hz : (k : ℤ) - S.card < 0 := by omega
    change (A.card : ℤ) = FirstWide.binomCoeff B.card _
    rw [hA,card_empty,FirstWide.binomCoeff_neg _ hz]
    rfl

end Erdos993G1.ThirdWide

/- ENTRY 166 (lines 3510-3533) 9c0d62d2686b57a95bb19223e8dedcd0cd1e3918140e84f34ca38c6da685363a -/
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_indepCount_partition {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    indepCount F k =
      ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S),
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card) := by
  classical
  rw [indepCount_eq_card_indepSetFinset]
  have hc := card_eq_sum_card_fiberwise
    (s := F.indepSetFinset k)
    (t := C.powerset.filter (fun S : Finset X => F.IsIndepSet S))
    (f := fun T => T ∩ C) (by
      intro T hT
      apply mem_filter.mpr
      refine ⟨mem_powerset.mpr (inter_subset_right),?_⟩
      exact (SimpleGraph.mem_indepSetFinset_iff.mp hT).isIndepSet.mono
        (by simpa using (inter_subset_left (s₁ := T) (s₂ := C))))
  rw [hc,Nat.cast_sum]
  apply sum_congr rfl
  intro S hS
  obtain ⟨hSC,hS⟩ := mem_filter.mp hS
  exact cover_fiber_count F C S (mem_powerset.mp hSC) hS hcover k

end Erdos993G1.ThirdWide

/- ENTRY 167 (lines 3543-3560) fa600fe0f83173c8c834c607ef8f5b97c7c61055370b1f9d7b7d282085b638c1 -/
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_delta_partition {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ) :
    delta F (k : ℤ) =
      ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S),
        (FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card + 1) -
        FirstWide.binomCoeff
          ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
          ((k : ℤ) - S.card)) := by
  rw [delta_nat,cover_indepCount_partition F C hcover,
    cover_indepCount_partition F C hcover,← sum_sub_distrib]
  apply sum_congr rfl
  intro S hS
  congr 2
  push_cast
  ring

end Erdos993G1.ThirdWide

/- ENTRY 168 (lines 3570-3597) eb0bad9f51f529b85c826eadc79952c681d7712777d855ef9d14a287c19dcb2c -/
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_sum_bound {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ)
    (f : Finset X → ℤ)
    (hmiss : ∀ S ⊆ C, ¬F.IsIndepSet S → f S ≤ 0)
    (hterm : ∀ S ⊆ C, F.IsIndepSet S → f S ≤
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card + 1) -
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card)) :
    ∑ S ∈ C.powerset, f S ≤ delta F (k : ℤ) := by
  rw [cover_delta_partition F C hcover]
  calc
    ∑ S ∈ C.powerset, f S ≤
        ∑ S ∈ C.powerset.filter (fun S : Finset X => F.IsIndepSet S), f S := by
      rw [sum_filter]
      apply sum_le_sum
      intro S hSC
      by_cases hS : F.IsIndepSet S
      · simp [hS]
      · simpa [hS] using hmiss S (mem_powerset.mp hSC) hS
    _ ≤ _ := by
      apply sum_le_sum
      intro S hS
      obtain ⟨hSC,hS⟩ := mem_filter.mp hS
      exact hterm S (mem_powerset.mp hSC) hS

end Erdos993G1.ThirdWide

/- ENTRY 169 (lines 3607-3613) 14e1c216feebe1e659caee09b9ab098b716d3e6d3177bb2512e818da3d3f4f76 -/
namespace Erdos993G1.ThirdWide

open Finset

lemma powerset_four_sum {X : Type u} [DecidableEq X] (C : Finset X)
    (hC : C.card = 4) (b : ℕ → ℤ) :
    ∑ S ∈ C.powerset, b S.card = b 0 + 4*b 1 + 6*b 2 + 4*b 3 + b 4 := by
  rw [sum_powerset]
  simp_rw [sum_powersetCard]
  rw [hC]
  norm_num [sum_range_succ, Nat.choose]

end Erdos993G1.ThirdWide

/- ENTRY 170 (lines 3623-3643) f6e33a24c0a0008d0b5b99cac47374687f513979ed590ced93dee1459abd54c9 -/
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_rank_bound {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 4)
    (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) (k : ℕ)
    (b : ℕ → ℤ) (hb : ∀ t, 0 < t → b t ≤ 0)
    (hterm : ∀ S ⊆ C, F.IsIndepSet S → b S.card ≤
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card + 1) -
      FirstWide.binomCoeff
        ((univ : Finset X).filter (fun x => x ∉ C ∧ ∀ y ∈ S, ¬F.Adj y x)).card
        ((k : ℤ) - S.card)) :
    b 0 + 4*b 1 + 6*b 2 + 4*b 3 + b 4 ≤ delta F (k : ℤ) := by
  rw [← powerset_four_sum C hC b]
  apply cover_sum_bound F C hcover k (fun S => b S.card) ?_ hterm
  intro S hSC hS
  apply hb
  by_contra h
  have : S = ∅ := card_eq_zero.mp (by omega)
  subst S
  exact hS (by simp [SimpleGraph.IsIndepSet])

end Erdos993G1.ThirdWide

/- ENTRY 172 (lines 3692-3714) b32d3a22f51995e48376876f0089f27d33541d36099f0c82d75ac15cd0962023 -/
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_cross_edges_le {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X) :
    ∑ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card ≤
      Nat.card F.edgeSet := by
  classical
  let P := C.sigma (fun a => (univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x))
  have hP : P.card ≤ F.edgeFinset.card := by
    apply card_le_card_of_injOn (fun p : Sigma (fun _ : X => X) => s(p.1,p.2))
    · intro p hp
      obtain ⟨hpC,hp⟩ := mem_sigma.mp hp
      exact SimpleGraph.mem_edgeFinset.mpr (mem_filter.mp hp).2.2
    · rintro ⟨a,x⟩ ha ⟨b,y⟩ hb heq
      obtain ⟨haC,hax⟩ := mem_sigma.mp ha
      obtain ⟨hbC,hby⟩ := mem_sigma.mp hb
      obtain ⟨_,hxC,hax⟩ := mem_filter.mp hax
      obtain ⟨_,hyC,hby⟩ := mem_filter.mp hby
      rcases Sym2.eq_iff.mp heq with ⟨hab,hxy⟩ | ⟨hay,hxb⟩
      · cases hab
        cases hxy
        rfl
      · exact False.elim (hyC (hay ▸ haC))
  rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
  simpa [P,card_sigma] using hP

end Erdos993G1.ThirdWide

/- ENTRY 173 (lines 3724-3738) ae33397d5835c1792cefe8e000a3ed8a0d752f8e68e5d961ac3a0bb071ec43b2 -/
namespace Erdos993G1.ThirdWide

open Finset

lemma cover_four_sparse_vertex {X : Type u} [Fintype X] [DecidableEq X]
    (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hn : Nat.card X = 12) (C : Finset X) (hC : C.card = 4) :
    ∃ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card ≤ 2 := by
  have he := forest_card_edges_add_components F hF
  have hp := components_card_pos_of_card_pos F (by omega)
  have hc := cover_cross_edges_le F C
  by_contra h
  push Not at h
  have hs : 3*C.card ≤
      ∑ a ∈ C, ((univ : Finset X).filter (fun x => x ∉ C ∧ F.Adj a x)).card := by
    calc
      3*C.card = ∑ _a ∈ C, 3 := by simp [mul_comm]
      _ ≤ _ := sum_le_sum (fun a ha => by have := h a ha; omega)
  omega

end Erdos993G1.ThirdWide

/- ENTRY 175 (lines 3772-3785) b7a8f175866bc785b5ee83c77b20fe6aa95cd71b565b10eb6775f2d1666f4212 -/
namespace Erdos993G1.ThirdWide

open Finset

lemma forest_delta_one_pos {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (hn : 6 ≤ Nat.card X) :
    0 < delta F 1 := by
  have hp := components_card_pos_of_card_pos F (by omega)
  have he := forest_card_edges_add_components F hF
  have hpair := indepCount_two_add_edges F
  have hchoose := scaledChooseTwo (Nat.card X)
  have hnz : (6 : ℤ) ≤ Nat.card X := by exact_mod_cast hn
  have hez : (Nat.card F.edgeSet : ℤ) + 1 ≤ Nat.card X := by exact_mod_cast (by omega : Nat.card F.edgeSet + 1 ≤ Nat.card X)
  have hh := mul_nonneg (show (0:ℤ) ≤ Nat.card X by positivity)
    (show (0:ℤ) ≤ (Nat.card X : ℤ)-5 by omega)
  rw [show (1:ℤ) = ((1:ℕ):ℤ) by rfl,delta_nat,indepCount_one]
  norm_num only [Nat.reduceAdd]
  nlinarith

end Erdos993G1.ThirdWide

/- ENTRY 176 (lines 3795-3814) 4dbac3461fcbd6ddef14e0fdda1f69a4c1a2aa41009d366a8b083701ff039918 -/
namespace Erdos993G1.ThirdWide

open Finset

lemma forest_delta_two_ten_pos {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (hn : Nat.card X = 10) :
    0 < delta F 2 := by
  classical
  letI := Fintype.ofFinite X
  have hnx : Fintype.card X = 10 := by simpa [Nat.card_eq_fintype_card] using hn
  have hp := components_card_pos_of_card_pos F (by omega)
  have he := forest_card_edges_add_components F hF
  have hpair := indepCount_two_add_edges F
  have htriple := indepCount_three_add_edge_incidence F hF
  have hsum := degreeChoose_sum_lower (fun x : X => F.degree x)
  have hd : (∑ x, (F.degree x : ℤ)) = 2 * (Nat.card F.edgeSet : ℤ) := by
    rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
    exact_mod_cast F.sum_degrees_eq_twice_card_edges
  rw [hd,hnx] at hsum
  norm_num only [hn,hnx,Nat.choose] at hpair htriple hsum
  have hez : (Nat.card F.edgeSet : ℤ) ≤ 9 := by exact_mod_cast (by omega : Nat.card F.edgeSet ≤ 9)
  rw [show (2:ℤ) = ((2:ℕ):ℤ) by rfl,delta_nat]
  norm_num only [Nat.reduceAdd]
  linarith

end Erdos993G1.ThirdWide

/- U-C5-03 note: `Erdos993G1.scaledChooseTwo` (ENTRY 70) is already present
   above (it was already part of the Cycle 4 U3 base this file transcribes
   from -- Cycle 4's own dependency table lists entries "66,68,70,71" as
   already-included toolbox items); no re-transcription needed here. -/

-- FROZEN-SOURCE ENTRY 70 END

-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition ErdosR25.CriticUC604FChain.edgeless 0809a39e0e3f8da4bffa875ab28a3d5fd22568f947354e4b744ac5ae0a87fb73
/-
Critic C-U4-F, second artifact: the ARITHMETIC CORE of a BASE-FREE
Delta_3 chain.  Attributed to this critic.

The seat's return concludes that the whole Delta_3 threshold proof
reduces to exactly one enumerated scalar -- `min Delta_3` over the 76
order-8 forest isomorphism classes.  It does not.  Feeding the
uniform-in-`n` Delta_2 bound proved in `CriticUC604F.lean`
(`forest_delta_two_lower_uniform`, no enumeration, no induction) into
the SAME leaf recursion the seat used closes the chain at order 12 with
NO enumerated input at any order:

  L3(n) = min( C(n,4) - C(n,3) ,  L3(n-1) + L2(n-2) )
  L2(n) = B(n) = C(n,3) - C(n,2) - n^2 + 5n - 5           (n >= 5)
  L2(n) = the same leaf recursion bottoming at the edgeless formula
                                                          (n <= 4)

giving  L3 = ..., -19 (11),  +1 (12),  +40 (13),  +105 (14).
The seat's own Variant B (Delta_2 input taken from the leaf recursion
rather than from the algebra) loses one unit per order and lands at
L3(12) = -5, which is why the seat concluded a finite base was needed.

This file checks the arithmetic of the chain in the kernel.  It does
NOT by itself prove the graph-theoretic statement: that still needs the
pendant identity in Delta form and a strong induction on the order,
both of which are already available (the pendant identity is proved
twice, axiom-clean, in the Cycle 5 record; the leaf is frozen ENTRY
150; the edgeless formula is frozen ENTRY 100).  No `native_decide`,
no `sorry`.
-/

-- VERITYOS R3 HEADER (added by this formalizer, A1 Stage 7 A1-LA1, before registration;
-- the ONE permitted edit to imported text, per adjudication R3 and synthesis R3):
-- Origin run: erdos-993-uniform-residual-no-recovery-dre-2026-09-20, Cycle 6.
-- Critic C-U4-F's own file (CriticUC604FChain.lean); statement and proof text below are
-- UNCHANGED. R5: this file diffs against the capsule original
-- (sources/r25-terminal/a1-stage7-sources/CriticUC604FChain.lean) in exactly the one
-- import line, 'import LeanProof.Main' -> 'import LeanProof.Transcribed' (this project's
-- fragment layout has no separate Main.lean holding the transcribed entries; they live in
-- Transcribed.lean here), confirmed by byte-diff in CAPSULE-VERIFICATION.json.

namespace ErdosR25.CriticUC604FChain

/-- `Delta_k` of the edgeless forest on `n` vertices (frozen ENTRY 100). -/
def edgeless (n k : ℕ) : ℤ := (n.choose (k + 1) : ℤ) - (n.choose k : ℤ)

/-- The uniform-in-`n` Delta_1 lower bound produced by the same leaf
recursion (`Delta_0(F) = n - 1` exactly). -/
def L1 : ℕ → ℤ
  | 0 => 0
  | 1 => edgeless 1 1
  | (n + 2) => min (edgeless (n + 2) 1) (L1 (n + 1) + ((n : ℤ) - 1))

/-- `B(n)`, the ENTRY-176 uniform Delta_2 bound
(`6 B(n) = n^3 - 12 n^2 + 35 n - 30`); equal to `min Delta_2` over
forests of order `n` for every `n >= 5`. -/
def B (n : ℕ) : ℤ := (n.choose 3 : ℤ) - (n.choose 2 : ℤ) - (n : ℤ) ^ 2 + 5 * n - 5

/-- Delta_2 lower bound used as the chain's input: the algebra for
`n >= 5`, the leaf recursion below that.  NO enumeration anywhere. -/
def L2 : ℕ → ℤ
  | 0 => 0
  | 1 => edgeless 1 2
  | (n + 2) =>
      if 5 ≤ n + 2 then B (n + 2)
      else min (edgeless (n + 2) 2) (L2 (n + 1) + L1 n)

/-- The base-free Delta_3 chain. -/
def L3 : ℕ → ℤ
  | 0 => 0
  | 1 => edgeless 1 3
  | (n + 2) => min (edgeless (n + 2) 3) (L3 (n + 1) + L2 n)

theorem B_six (n : ℕ) :
    6 * B n = (n : ℤ) ^ 3 - 12 * (n : ℤ) ^ 2 + 35 * (n : ℤ) - 30 := by
  have h2 : 2 * (n.choose 2 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) :=
    Erdos993G1.scaledChooseTwo n
  have h3 : 6 * (n.choose 3 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) * ((n : ℤ) - 2) :=
    Erdos993G1.scaledChooseThree n
  simp only [B]
  nlinarith [h2, h3]

/-- The chain's values at the orders that matter.  Kernel-checked. -/
theorem L2_table :
    L2 5 = -5 ∧ L2 6 = -6 ∧ L2 7 = -5 ∧ L2 8 = -1 ∧ L2 9 = 7 ∧ L2 10 = 20 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;> decide

theorem L3_table :
    L3 8 = -20 ∧ L3 9 = -25 ∧ L3 10 = -26 ∧ L3 11 = -19 ∧
    L3 12 = 1 ∧ L3 13 = 40 ∧ L3 14 = 105 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> decide

/-- **The chain closes at order 12 with no enumerated input.** -/
theorem L3_twelve_pos : 0 < L3 12 := by decide

/-- And stays positive: from order 12 on, both branches of the `min`
are positive, so no further base case is ever consulted. -/
theorem L3_thirteen_fourteen_pos : 0 < L3 13 ∧ 0 < L3 14 := by
  refine ⟨?_, ?_⟩ <;> decide

end ErdosR25.CriticUC604FChain
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN lemma Erdos993G1.U1Transcribed.indepCount_edgeless e16d38ded83055a49aad36aa7d9c80302e12bf85dc999867c71938922d2b581d

/-
TRANSCRIPTION, NOT DISCOVERY (route A1-U-01, seat U1).

The two declarations below are copied verbatim (statement and proof text
character-for-character identical) from the frozen, sealed G1 Lean source

  sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean
  SHA-256 aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4

(this exact SHA-256 is verified against the manifest-recorded digest for
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` in
`control/A1-STAGE2-PACKET-MANIFEST.json`, entry sha256
aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4, matching).
Neither ENTRY 100 nor ENTRY 150 is transcribed in the granted Cycle 5
`Transcribed.lean` (its own header lists 150-164 among the entries it
deliberately excludes), so this route re-transcribes them directly from the
frozen source rather than re-deriving them.

- ENTRY 100 (`Erdos993G1.FirstWide.indepCount_edgeless`, original lines
  1553-1570, per-entry hash
  65f447028fbab531a1ab9d37c8485f02dc5b12b52002d438703c6308017fe3bd): for the
  edgeless graph on `Y`, `indepCount G k = binomCoeff (Nat.card Y) k` for
  every `k`.
- ENTRY 150 (`Erdos993G1.ThirdWide.forest_leaf_of_edge`, original lines
  2790-2816, per-entry hash
  a5b1f215a01b6301161483c73c89cf84f72023d318a6a4fb1e85846d68f611c0): every
  acyclic graph with at least one edge has a leaf `l` with a unique
  neighbour `u`.

Namespacing: the frozen source opens these inside `namespace
Erdos993G1.FirstWide` / `namespace Erdos993G1.ThirdWide` respectively; this
route places them inside `namespace Erdos993G1.U1Transcribed` instead (a
namespace private to this route, not shared with the frozen project's own
sub-namespaces) purely so the fully-qualified declaration names used below
cannot be mistaken for frozen-project declarations reachable by other
routes; the statement and proof text of each declaration is untouched.
-/

namespace Erdos993G1.U1Transcribed

open Finset Erdos993G1 Erdos993G1.FirstWide

-- ENTRY 100 BEGIN (transcribed verbatim, renamespaced only)
lemma indepCount_edgeless {Y : Type u} [Finite Y]
    (G : SimpleGraph Y) (he : Nat.card G.edgeSet = 0) (k : ℕ) :
    indepCount G k = binomCoeff (Nat.card Y) (k : ℤ) := by
  classical
  letI := Fintype.ofFinite Y
  letI : IsEmpty G.edgeSet := Finite.card_eq_zero_iff.mp he
  have hi : ∀ S : Finset Y, G.IsIndepSet S := by
    intro S a ha b hb hab hadj
    exact isEmptyElim (⟨s(a, b), hadj⟩ : G.edgeSet)
  rw [indepCount_eq_card_indepSetFinset, indepSetFinset_eq_filter_powersetCard,
    Finset.filter_eq_self.mpr (fun S _ => hi S), Finset.card_powersetCard,
    Finset.card_univ, binomCoeff_nat, Nat.card_eq_fintype_card]
-- ENTRY 100 END

-- ENTRY 150 BEGIN (transcribed verbatim, renamespaced only)
lemma forest_leaf_of_edge {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (he : ∃ a b, F.Adj a b) :
    ∃ l u, F.Adj l u ∧ ∀ v, F.Adj l v → v = u := by
  classical
  letI : Fintype X := Fintype.ofFinite X
  obtain ⟨a, b, hab⟩ := he
  let c := F.connectedComponentMk a
  have ha : a ∈ c.supp := SimpleGraph.ConnectedComponent.connectedComponentMk_mem
  have hb : b ∈ c.supp := c.mem_supp_of_adj_mem_supp ha hab
  let a' : c := ⟨a, ha⟩
  let b' : c := ⟨b, hb⟩
  have hab' : c.toSimpleGraph.Adj a' b' := hab
  letI : Nontrivial c := c.toSimpleGraph.nontrivial_of_not_isIsolated
    hab'.not_isIsolated_left
  letI : Fintype c := Fintype.ofFinite c
  obtain ⟨l, hl⟩ := (hF.isTree_connectedComponent c).exists_vert_degree_one_of_nontrivial
  obtain ⟨u, hlu, hu⟩ := SimpleGraph.degree_eq_one_iff_existsUnique_adj.mp hl
  refine ⟨l.val, u.val, hlu, ?_⟩
  intro v hlv
  have hv : v ∈ c.supp := c.mem_supp_of_adj_mem_supp l.property hlv
  exact congrArg Subtype.val (hu ⟨v, hv⟩ hlv)
-- ENTRY 150 END

end Erdos993G1.U1Transcribed
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma Erdos993G1.ForestDelta2.forest_delta_two_lower 4b74e35e9def19b2f457b68cf268db5515b355e799cfc059acdf842031a8a629

/-
IMPORTED BY NAME, NEVER RE-PROVED (route A1-U-01, seat U1).

The two declarations below are the terminal Lean declarations of the
governed, formally-verified award `C6-LA1` (`U-AWARD-FOREST-DELTA2-ORDER-9`),
copied verbatim (statement and proof text character-for-character identical)
from the award run's own compiled source

  r25 root, runs/lean-2026-09-22-c6-forest-delta2-order-9/LeanProject/LeanProof/Main.lean
  (ENTRY 26 `Erdos993G1.ForestDelta2.forest_delta_two_lower`, per-entry hash
   d10faad16db24225630d6fc2ceded0845d8f16449c2ef35648c446097a864ce9;
   ENTRY 27 `Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine`, per-entry
   hash a95d132d7209e55ec4d1eb216851c4037b6a4dc2701c628a2f5d7341a6aadef0)

which this route is granted read-only and is instructed to import
`Erdos993G1.ForestDelta2.forest_delta_two_lower` and
`forest_delta_two_pos_ge_nine` "by name, never re-prove"
(`control/A1-STAGE1-GATE.md` ruling 7). Because Lean has no cross-package
import into a separate Lake project without vendoring it, "by name" is
realised the same way every route in this run realises a frozen-project
import: a byte-for-byte transcription of the two terminal declarations,
re-elaborated (not re-derived) against this project's own copy of ENTRIES
1-71 in `Transcribed.lean` (verified byte-identical to the same frozen
source `sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`,
SHA-256 aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4,
which the award run's own ENTRIES 1-25 are themselves transcribed from). No
step of the proof below was authored, altered, or re-derived by this route;
the award's own proof text is reused exactly, including its formalizer
caution comment.

This route strips only: (a) the docstring commentary duplicated above as
plain comments (Lean docstrings on lemmas already re-attributed here would
misattribute authorship of this route's own file), (b) the surrounding
`-- FROZEN-SOURCE ENTRY N BEGIN/END` sealed-file markers, which are file-local to
the award run and not meaningful here.
-/

namespace Erdos993G1.ForestDelta2

open Erdos993G1

/-- AWARD C6-LA1, ENTRY 26, imported by name (never re-proved): for every
forest of order `n ≥ 5`, `6 * Delta_2(F) ≥ n^3 - 12 n^2 + 35 n - 30`.
Critic-attributed jointly to C-U4-T and C-U4-F on the frozen G1 project's own
compiled lemmas (ENTRIES 1-71, transcribed in `Transcribed.lean`). FENCES
(restated per the award's own face, mandatory): uniform in the order, no
horizon, no enumeration at any order; `nu`, `tau`, `d` and `x(F) < r` enter
nowhere; `Delta_2` here is a positivity/threshold object, not a no-recovery
statement; does not sharpen `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`; is
not `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12`; bears on no tier, on
FOREST/TREE/TRANSFER, or on Erdos #993. -/
lemma forest_delta_two_lower {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (hn : 5 ≤ Nat.card X) :
    (Nat.card X : ℤ) ^ 3 - 12 * (Nat.card X : ℤ) ^ 2 + 35 * (Nat.card X : ℤ) - 30
      ≤ 6 * Erdos993G1.delta F 2 := by
  classical
  letI := Fintype.ofFinite X
  have hnx : Fintype.card X = Nat.card X := (Nat.card_eq_fintype_card).symm
  have hp := components_card_pos_of_card_pos F (by omega)
  have he := forest_card_edges_add_components F hF
  have hpair := indepCount_two_add_edges F
  have htriple := indepCount_three_add_edge_incidence F hF
  have hsum := Erdos993G1.degreeChoose_sum_lower (fun x : X => F.degree x)
  have hd : (∑ x, (F.degree x : ℤ)) = 2 * (Nat.card F.edgeSet : ℤ) := by
    rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card]
    exact_mod_cast F.sum_degrees_eq_twice_card_edges
  rw [hd, hnx] at hsum
  rw [hnx] at htriple
  -- NATURAL vs INTEGER subtraction: `htriple` carries `((n - 2 : Nat) : Int)`.
  -- The formalizer caution named in the adjudication (condition (iii)):
  -- `((Nat.card X - 2 : ℕ) : ℤ)` must be converted to `(Nat.card X : ℤ) - 2`
  -- or `nlinarith` fails silently below.
  have hsub : ((Nat.card X - 2 : ℕ) : ℤ) = (Nat.card X : ℤ) - 2 := by omega
  rw [hsub] at htriple
  have hc2 := Erdos993G1.scaledChooseTwo (Nat.card X)
  have hc3 := Erdos993G1.scaledChooseThree (Nat.card X)
  have hmz : (Nat.card F.edgeSet : ℤ) + 1 ≤ (Nat.card X : ℤ) := by
    exact_mod_cast (by omega : Nat.card F.edgeSet + 1 ≤ Nat.card X)
  have hnz : (5 : ℤ) ≤ (Nat.card X : ℤ) := by exact_mod_cast hn
  have hmnn : (0 : ℤ) ≤ (Nat.card F.edgeSet : ℤ) := by positivity
  rw [show (2 : ℤ) = ((2 : ℕ) : ℤ) by rfl, delta_nat]
  norm_num only [Nat.reduceAdd]
  nlinarith [hpair, htriple, hsum, hc2, hc3, hmz, hnz, hmnn,
             mul_nonneg (sub_nonneg.mpr hnz) (sub_nonneg.mpr hmz)]

/-- AWARD C6-LA1, ENTRY 27, terminal declaration, imported by name (never
re-proved): every forest of order at least 9 has `Delta_2 > 0`. Registry
effect (on the award's own face): a grade change for the registered VERIFIED
`E993-R25-FOREST-DELTA2-POS-ORDER-9`, `proved_informal -> formally_verified`
(not a new claim; not re-asserted by this route, which only imports the
declaration). Sharp: `min Delta_2 = -1` at order 8 (`P_8`). -/
theorem forest_delta_two_pos_ge_nine {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 9 ≤ Nat.card X) : 0 < Erdos993G1.delta F 2 := by
  have hb := forest_delta_two_lower F hF (by omega)
  have hnz : (9 : ℤ) ≤ (Nat.card X : ℤ) := by exact_mod_cast hn
  nlinarith [hb, hnz, sq_nonneg ((Nat.card X : ℤ) - 9)]

end Erdos993G1.ForestDelta2
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma Erdos993G1.CritUC503F.deleteVerts_adj 2e0432d527af23ed79551b6517e89ffecf7d23d98d2881bd48dab8ae6d64ee1e

-- VERITYOS R3 HEADER (added by this formalizer, A1 Stage 7 A1-LA1, before registration;
-- the ONE permitted edit to imported text, per adjudication R3 and synthesis R3):
-- Origin run: erdos-993-uniform-residual-no-recovery-dre-2026-09-20, Cycle 5.
-- Critic C-U3-F's own file (Crit.lean); statement and proof text below are UNCHANGED.

/-
C-U3-F: the critic's OWN attempt at the step the U3 return leaves open
(`pendant_identity_draft`).  Nothing here is transcribed; this is the
critic's own work, written to locate the exact resisting point.

Strategy (different from the return's stated one): do NOT build a single
cross-carrier `Equiv` onto a sum type.  Factor through ONE reusable bridge
lemma that pushes `deleteVerts` back onto the ORIGINAL carrier `X`:

    indepCount (deleteVerts F S) k
      = Nat.card {T : Finset X // F.IsNIndepSet k T ∧ ∀ x ∈ T, x ∉ S}

after which both halves of the pendant split (`v ∉ T`, `v ∈ T`) are
statements about `Finset X` alone.
-/

namespace Erdos993G1.CritUC503F

open Finset

variable {X : Type u}

/-- `deleteVerts` is an induced subgraph, so its adjacency is definitionally
the ambient one. -/
lemma deleteVerts_adj (F : SimpleGraph X) (S : Set X) (a b : {w : X // w ∉ S}) :
    (Erdos993G1.deleteVerts F S).Adj a b ↔ F.Adj (a : X) (b : X) := Iff.rfl

/-- Bridge, step 1: the carrier-transport equivalence.  Independent `k`-sets
of `deleteVerts F S` correspond exactly to independent `k`-sets of `F` that
avoid `S`. -/
def deleteVertsIndepEquiv (F : SimpleGraph X) (S : Set X)
    [DecidablePred (fun w : X => w ∉ S)] (k : ℕ) :
    {T : Finset {w : X // w ∉ S} // (Erdos993G1.deleteVerts F S).IsNIndepSet k T}
      ≃ {T : Finset X // F.IsNIndepSet k T ∧ ∀ x ∈ T, x ∉ S} where
  toFun := fun T =>
    ⟨T.1.map (Function.Embedding.subtype _), by
      refine ⟨⟨?_, ?_⟩, ?_⟩
      · intro a ha b hb hab
        simp only [Finset.coe_map, Function.Embedding.coe_subtype, Set.mem_image,
          Finset.mem_coe] at ha hb
        obtain ⟨a', ha', rfl⟩ := ha
        obtain ⟨b', hb', rfl⟩ := hb
        have hne : a' ≠ b' := fun h => hab (by rw [h])
        exact T.2.isIndepSet (by simpa using ha') (by simpa using hb') hne
      · simpa using T.2.card_eq
      · intro x hx
        simp only [Finset.mem_map, Function.Embedding.coe_subtype] at hx
        obtain ⟨x', _, rfl⟩ := hx
        exact x'.2⟩
  invFun := fun T =>
    ⟨T.1.subtype (fun w : X => w ∉ S), by
      refine ⟨?_, ?_⟩
      · intro a ha b hb hab
        simp only [Finset.mem_coe, Finset.mem_subtype] at ha hb
        have hne : (a : X) ≠ (b : X) := fun h => hab (Subtype.ext h)
        exact T.2.1.isIndepSet (by simpa using ha) (by simpa using hb) hne
      · rw [Finset.card_subtype]
        rw [Finset.filter_true_of_mem (fun x hx => T.2.2 x hx)]
        exact T.2.1.card_eq⟩
  left_inv := by
    intro T
    apply Subtype.ext
    ext x
    rw [Finset.mem_subtype]
    exact Finset.mem_map' (Function.Embedding.subtype (fun w : X => w ∉ S))
  right_inv := by
    intro T
    apply Subtype.ext
    ext x
    simp only [Finset.mem_map, Finset.mem_subtype, Function.Embedding.coe_subtype]
    constructor
    · rintro ⟨x', hx', rfl⟩; exact hx'
    · intro hx; exact ⟨⟨x, T.2.2 x hx⟩, hx, rfl⟩

/-- Bridge, step 2 (the reusable lemma the return's debt item (1) really
needs): `indepCount` of a vertex-deleted graph, expressed entirely over the
original carrier `X`. -/
lemma indepCount_deleteVerts (F : SimpleGraph X) (S : Set X) (k : ℕ) :
    Erdos993G1.indepCount (Erdos993G1.deleteVerts F S) k
      = (Nat.card {T : Finset X // F.IsNIndepSet k T ∧ ∀ x ∈ T, x ∉ S} : ℤ) := by
  classical
  unfold Erdos993G1.indepCount
  exact congrArg _ (Nat.card_congr (deleteVertsIndepEquiv F S k))

end Erdos993G1.CritUC503F

namespace Erdos993G1.CritUC503F

open Finset

variable {X : Type u}

/-- Step B (the combinatorial core): independent `k`-sets CONTAINING `v`
correspond to independent `(k-1)`-sets avoiding the closed neighbourhood of
`v`, by `T ↦ T.erase v`. -/
def containsVEquiv [DecidableEq X] (F : SimpleGraph X) (v : X) (k : ℕ) (hk : 1 ≤ k) :
    {T : Finset X // F.IsNIndepSet k T ∧ v ∈ T}
      ≃ {T : Finset X // F.IsNIndepSet (k - 1) T
            ∧ ∀ x ∈ T, x ∉ Erdos993G1.closedNeighborhood F v} where
  toFun := fun T =>
    ⟨T.1.erase v, by
      refine ⟨⟨?_, ?_⟩, ?_⟩
      · intro a ha b hb hab
        simp only [Finset.mem_coe, Finset.mem_erase] at ha hb
        exact T.2.1.isIndepSet (by simpa using ha.2) (by simpa using hb.2) hab
      · rw [Finset.card_erase_of_mem T.2.2, T.2.1.card_eq]
      · intro x hx
        simp only [Finset.mem_erase] at hx
        intro hmem
        rcases hmem with h | h
        · exact hx.1 h
        · exact T.2.1.isIndepSet (by simpa using T.2.2) (by simpa using hx.2)
            (fun hc => hx.1 hc.symm) h⟩
  invFun := fun U =>
    ⟨insert v U.1, by
      have hvU : v ∉ U.1 := fun hv =>
        U.2.2 v hv (Or.inl rfl)
      refine ⟨⟨?_, ?_⟩, Finset.mem_insert_self _ _⟩
      · intro a ha b hb hab
        simp only [Finset.mem_coe, Finset.mem_insert] at ha hb
        rcases ha with rfl | ha
        · rcases hb with rfl | hb
          · exact absurd rfl hab
          · exact fun hadj => U.2.2 b hb (Or.inr hadj)
        · rcases hb with rfl | hb
          · exact fun hadj => U.2.2 a ha (Or.inr hadj.symm)
          · exact U.2.1.isIndepSet (by simpa using ha) (by simpa using hb) hab
      · rw [Finset.card_insert_of_notMem hvU, U.2.1.card_eq]
        omega⟩
  left_inv := by
    intro T
    apply Subtype.ext
    exact Finset.insert_erase T.2.2
  right_inv := by
    intro U
    apply Subtype.ext
    exact Finset.erase_insert (fun hv => U.2.2 v hv (Or.inl rfl))

/-- **The pendant-vertex identity, PROVED** (critic C-U3-F's own derivation;
the U3 return left this as `pendant_identity_draft`, `sorry`). -/
theorem pendant_identity [Finite X] (F : SimpleGraph X) (v : X) (k : ℕ) (hk : 1 ≤ k) :
    Erdos993G1.indepCount F k
      = Erdos993G1.indepCount (Erdos993G1.deleteVerts F ({v} : Set X)) k
        + Erdos993G1.indepCount (Erdos993G1.ambientA F v) (k - 1) := by
  classical
  rw [indepCount_deleteVerts, Erdos993G1.ambientA, indepCount_deleteVerts]
  unfold Erdos993G1.indepCount
  have hsplit :
      Nat.card {T : Finset X // F.IsNIndepSet k T}
        = Nat.card {T : Finset X // F.IsNIndepSet k T ∧ v ∉ T}
          + Nat.card {T : Finset X // F.IsNIndepSet k T ∧ v ∈ T} := by
    have e1 :
        {T : Finset X // F.IsNIndepSet k T}
          ≃ {T : {T : Finset X // F.IsNIndepSet k T} // v ∉ T.1}
            ⊕ {T : {T : Finset X // F.IsNIndepSet k T} // ¬ (v ∉ T.1)} :=
      (Equiv.sumCompl (fun T : {T : Finset X // F.IsNIndepSet k T} => v ∉ T.1)).symm
    have e2 := Equiv.subtypeSubtypeEquivSubtypeInter
      (fun T : Finset X => F.IsNIndepSet k T) (fun T : Finset X => v ∉ T)
    have e3 := Equiv.subtypeSubtypeEquivSubtypeInter
      (fun T : Finset X => F.IsNIndepSet k T) (fun T : Finset X => ¬ (v ∉ T))
    have e4 : {T : Finset X // F.IsNIndepSet k T ∧ ¬ (v ∉ T)}
        ≃ {T : Finset X // F.IsNIndepSet k T ∧ v ∈ T} :=
      Equiv.subtypeEquivRight (fun T => by simp)
    calc Nat.card {T : Finset X // F.IsNIndepSet k T}
        = Nat.card ({T : {T : Finset X // F.IsNIndepSet k T} // v ∉ T.1}
            ⊕ {T : {T : Finset X // F.IsNIndepSet k T} // ¬ (v ∉ T.1)}) :=
          Nat.card_congr e1
      _ = Nat.card {T : {T : Finset X // F.IsNIndepSet k T} // v ∉ T.1}
            + Nat.card {T : {T : Finset X // F.IsNIndepSet k T} // ¬ (v ∉ T.1)} :=
          Nat.card_sum
      _ = Nat.card {T : Finset X // F.IsNIndepSet k T ∧ v ∉ T}
            + Nat.card {T : Finset X // F.IsNIndepSet k T ∧ v ∈ T} := by
          rw [Nat.card_congr e2, Nat.card_congr (e3.trans e4)]
  have hA : Nat.card {T : Finset X // F.IsNIndepSet k T ∧ v ∉ T}
      = Nat.card {T : Finset X // F.IsNIndepSet k T ∧ ∀ x ∈ T, x ∉ ({v} : Set X)} :=
    Nat.card_congr (Equiv.subtypeEquivRight (fun T => by
      constructor
      · rintro ⟨h1, h2⟩
        exact ⟨h1, fun x hx hmem => h2 (by simpa [Set.mem_singleton_iff.mp hmem] using hx)⟩
      · rintro ⟨h1, h2⟩
        exact ⟨h1, fun hv => h2 v hv rfl⟩))
  have hB : Nat.card {T : Finset X // F.IsNIndepSet k T ∧ v ∈ T}
      = Nat.card {T : Finset X // F.IsNIndepSet (k - 1) T
            ∧ ∀ x ∈ T, x ∉ Erdos993G1.closedNeighborhood F v} :=
    Nat.card_congr (containsVEquiv F v k hk)
  rw [hsplit, hA, hB]
  push_cast
  ring

end Erdos993G1.CritUC503F

namespace Erdos993G1.CritUC503F

variable {X : Type u}

/-- **The Δ-form the U3 induction actually uses, PROVED** (critic C-U3-F):
`Δ_{j+1}(F) = Δ_{j+1}(F - v) + Δ_j(F - N[v])`.  Stated with `j+1` rather
than `k` and `k-1` so that NO natural subtraction appears anywhere. -/
theorem pendant_delta [Finite X] (F : SimpleGraph X) (v : X) (j : ℕ) :
    Erdos993G1.delta F ((j + 1 : ℕ) : ℤ)
      = Erdos993G1.delta (Erdos993G1.deleteVerts F ({v} : Set X)) ((j + 1 : ℕ) : ℤ)
        + Erdos993G1.delta (Erdos993G1.ambientA F v) ((j : ℕ) : ℤ) := by
  have h1 := pendant_identity F v (j + 2) (by omega)
  have h2 := pendant_identity F v (j + 1) (by omega)
  have e2 : j + 2 - 1 = j + 1 := by omega
  have e3 : j + 1 - 1 = j := by omega
  rw [e2] at h1
  rw [e3] at h2
  rw [Erdos993G1.delta_nat, Erdos993G1.delta_nat, Erdos993G1.delta_nat]
  have e1 : j + 1 + 1 = j + 2 := by omega
  rw [e1, h1, h2]
  ring

end Erdos993G1.CritUC503F

#print axioms Erdos993G1.CritUC503F.indepCount_deleteVerts
#print axioms Erdos993G1.CritUC503F.pendant_identity
#print axioms Erdos993G1.CritUC503F.pendant_delta
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.ForestDelta3.forest_delta_three_lower e2268208b610507cb8138bf87b1a7631c927ede52dfef7015a2162f9a9d203a2
/-
Route A1-U-01 `FOREST-DELTA3-HEADLINE-ENUMERATION-FREE`, seat U1.
This route's OWN new work (not transcription): the strong induction on
`Nat.card X` that connects the pendant identity, `forest_delta_two_lower`,
ENTRY 150 and ENTRY 100 into the headline
`0 < Erdos993G1.delta F 3` for every forest of order `>= 12`, threading the
kernel-checked `ℓ₃`/`L1`/`L2`/`L3` arithmetic in `L123Chain.lean`
(`ErdosR25.CriticUC604FChain`, attributed to critic C-U4-F).
-/

namespace Erdos993G1.ForestDelta3

open Erdos993G1 Erdos993G1.U1Transcribed Erdos993G1.ForestDelta2
  Erdos993G1.CritUC503F ErdosR25.CriticUC604FChain

/-- `Delta_0(F) = |V| - 1`, exactly, for ANY finite simple graph (no forest
hypothesis needed): `indepCount F 0 = 1` (only the empty set) and
`indepCount F 1 = Nat.card X` (ENTRY 20, `indepCount_one`). -/
theorem delta_zero_exact {X : Type u} [Finite X] (F : SimpleGraph X) :
    Erdos993G1.delta F 0 = (Nat.card X : ℤ) - 1 := by
  classical
  have h0 : Erdos993G1.indepCount F 0 = 1 := by
    have hiff : ∀ S : Finset X, F.IsNIndepSet 0 S ↔ S = ∅ := by
      intro S
      rw [SimpleGraph.isNIndepSet_iff]
      constructor
      · rintro ⟨-, hc⟩; exact Finset.card_eq_zero.mp hc
      · rintro rfl; exact ⟨by simp [SimpleGraph.isIndepSet_iff], rfl⟩
    have huniq : Unique {S : Finset X // F.IsNIndepSet 0 S} :=
      { default := ⟨∅, (hiff ∅).mpr rfl⟩
        uniq := fun a => Subtype.ext ((hiff a.1).mp a.2) }
    simpa [Erdos993G1.indepCount] using Nat.card_eq_one_iff_unique.mpr ⟨huniq.uniq, ⟨huniq.default⟩⟩
  have h1 : Erdos993G1.indepCount F 1 = (Nat.card X : ℤ) := Erdos993G1.indepCount_one F
  rw [show (0:ℤ) = ((0:ℕ):ℤ) by rfl, Erdos993G1.delta_nat]
  rw [h0, h1]

/-- ENTRY 100 restated at the level of `delta`: for the edgeless graph on
`n` vertices, `delta F k` is exactly the binomial difference `L123Chain.edgeless`
threads through the arithmetic chain. -/
theorem edgeless_delta_eq {X : Type u} [Finite X] (F : SimpleGraph X)
    (he : Nat.card F.edgeSet = 0) (k : ℕ) :
    Erdos993G1.delta F (k : ℤ) = ErdosR25.CriticUC604FChain.edgeless (Nat.card X) k := by
  have h1 := Erdos993G1.U1Transcribed.indepCount_edgeless F he (k + 1)
  have h2 := Erdos993G1.U1Transcribed.indepCount_edgeless F he k
  rw [Erdos993G1.delta_nat, h1, h2, ErdosR25.CriticUC604FChain.edgeless]
  rw [Erdos993G1.FirstWide.binomCoeff_nat, Erdos993G1.FirstWide.binomCoeff_nat]

/-- Cardinality of `deleteVerts F {v}`'s carrier: removing one vertex. -/
theorem card_deleteVerts_singleton {X : Type u} [Finite X] (v : X) :
    Nat.card {w : X // w ∉ ({v} : Set X)} = Nat.card X - 1 := by
  classical
  letI := Fintype.ofFinite X
  have hne : ∀ w : X, w ∉ ({v} : Set X) ↔ w ≠ v := by intro w; simp
  simp only [Nat.card_eq_fintype_card]
  rw [Fintype.card_congr (Equiv.subtypeEquivRight hne)]
  rw [Fintype.card_subtype_compl (fun w : X => w = v)]
  simp

/-- The closed neighbourhood of a leaf `l` with unique neighbour `u` is
exactly `{l, u}`. -/
theorem closedNeighborhood_leaf_eq {X : Type u} (F : SimpleGraph X) {l u : X}
    (hlu : F.Adj l u) (hl : ∀ v, F.Adj l v → v = u) :
    Erdos993G1.closedNeighborhood F l = ({l, u} : Set X) := by
  ext w
  simp only [Erdos993G1.closedNeighborhood, Set.mem_setOf_eq, Set.mem_insert_iff,
    Set.mem_singleton_iff]
  constructor
  · rintro (rfl | hw)
    · exact Or.inl rfl
    · exact Or.inr (hl w hw)
  · rintro (rfl | rfl)
    · exact Or.inl rfl
    · exact Or.inr hlu

/-- Cardinality of `ambientA F l`'s carrier at a leaf: removing the leaf and
its unique neighbour drops the order by exactly two. -/
theorem card_ambientA_leaf {X : Type u} [Finite X] (F : SimpleGraph X) {l u : X}
    (hlu : F.Adj l u) (hl : ∀ v, F.Adj l v → v = u) :
    Nat.card {w : X // w ∉ Erdos993G1.closedNeighborhood F l} = Nat.card X - 2 := by
  classical
  have hne : l ≠ u := hlu.ne
  rw [closedNeighborhood_leaf_eq F hlu hl]
  have hmem : Nat.card {w : X // w ∈ ({l, u} : Set X)} = 2 := by
    rw [Nat.card_coe_set_eq]; exact Set.ncard_pair hne
  have hunion : Nat.card {w : X // w ∈ ({l, u} : Set X)}
      + Nat.card {w : X // w ∉ ({l, u} : Set X)} = Nat.card X := by
    have e := Equiv.sumCompl (fun w : X => w ∈ ({l, u} : Set X))
    have h := Nat.card_congr e
    rwa [Nat.card_sum] at h
  omega

/-- If `X` has at most one vertex, `F` cannot have an edge (an edge needs two
distinct endpoints, so `{a,b} ⊆ X` would force `2 ≤ Nat.card X`). -/
theorem no_edge_of_card_le_one {X : Type u} [Finite X] (F : SimpleGraph X)
    (hn : Nat.card X ≤ 1) : Nat.card F.edgeSet = 0 := by
  classical
  by_contra he
  have hne : Nonempty F.edgeSet := Nat.card_pos_iff.mp (Nat.pos_of_ne_zero he) |>.1
  obtain ⟨e, he'⟩ := hne
  induction e using Sym2.inductionOn with
  | hf a b =>
    have hab : F.Adj a b := he'
    have hac : a ≠ b := hab.ne
    have h2 : Nat.card ({a, b} : Set X) = 2 := by
      rw [Nat.card_coe_set_eq]; exact Set.ncard_pair hac
    have hsub : ({a, b} : Set X) ⊆ (Set.univ : Set X) := Set.subset_univ _
    have hle := Set.ncard_le_ncard hsub Set.finite_univ
    rw [Set.ncard_pair hac, Set.ncard_univ] at hle
    omega

/-- Every acyclic graph has an edge whenever its edge set is nonempty
(unpacks the `Sym2` witness into an ordered pair). -/
theorem exists_adj_of_card_edgeSet_ne_zero {X : Type u} [Finite X] (F : SimpleGraph X)
    (he : Nat.card F.edgeSet ≠ 0) : ∃ a b, F.Adj a b := by
  classical
  have hne : Nonempty F.edgeSet := Nat.card_pos_iff.mp (Nat.pos_of_ne_zero he) |>.1
  obtain ⟨e, he'⟩ := hne
  induction e using Sym2.inductionOn with
  | hf a b => exact ⟨a, b, he'⟩

/-- Every forest of order `n` has `Delta_1(F) ≥ L1(n)`, uniformly, for every
`n` (the base of the chain: `L1` needs no enumeration, only the exact
`Delta_0` identity above and the edgeless formula ENTRY 100). -/
theorem forest_delta_one_lower :
    ∀ n : ℕ, ∀ {X : Type u} [Finite X] (F : SimpleGraph X),
      F.IsAcyclic → Nat.card X = n →
      ErdosR25.CriticUC604FChain.L1 n ≤ Erdos993G1.delta F 1 := by
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    match n, ih with
    | 0, _ =>
      intro X _ F _ hn
      have he : Nat.card F.edgeSet = 0 := no_edge_of_card_le_one F (by omega)
      have hd := edgeless_delta_eq F he 1
      simp only [Nat.cast_one] at hd
      rw [hd, hn]
      simp [ErdosR25.CriticUC604FChain.L1, ErdosR25.CriticUC604FChain.edgeless]
    | 1, _ =>
      intro X _ F _ hn
      have he : Nat.card F.edgeSet = 0 := no_edge_of_card_le_one F (by omega)
      have hd := edgeless_delta_eq F he 1
      simp only [Nat.cast_one] at hd
      rw [hd, hn]
      simp [ErdosR25.CriticUC604FChain.L1]
    | (m + 2), ih =>
      intro X _ F hF hn
      by_cases he : Nat.card F.edgeSet = 0
      · have hd := edgeless_delta_eq F he 1
        simp only [Nat.cast_one] at hd
        rw [hd, hn]
        show ErdosR25.CriticUC604FChain.L1 (m + 2) ≤ _
        rw [ErdosR25.CriticUC604FChain.L1]
        exact min_le_left _ _
      · obtain ⟨a, b, hab⟩ := exists_adj_of_card_edgeSet_ne_zero F he
        obtain ⟨l, u, hlu, hl⟩ :=
          Erdos993G1.U1Transcribed.forest_leaf_of_edge F hF ⟨a, b, hab⟩
        have hFlAcyc : (Erdos993G1.deleteVerts F ({l} : Set X)).IsAcyclic :=
          Erdos993G1.deleteVerts_isAcyclic F hF _
        have hFluAcyc : (Erdos993G1.ambientA F l).IsAcyclic :=
          Erdos993G1.deleteVerts_isAcyclic F hF _
        have hFlCard : Nat.card {w : X // w ∉ ({l} : Set X)} = m + 1 := by
          rw [card_deleteVerts_singleton]; omega
        have hFluCard : Nat.card {w : X // w ∉ Erdos993G1.closedNeighborhood F l} = m := by
          rw [card_ambientA_leaf F hlu hl]; omega
        have hIH := ih (m + 1) (by omega) (Erdos993G1.deleteVerts F ({l} : Set X))
          hFlAcyc hFlCard
        have hzero := delta_zero_exact (Erdos993G1.ambientA F l)
        have hpen := Erdos993G1.CritUC503F.pendant_delta F l 0
        have hcast1 : ((0 + 1 : ℕ) : ℤ) = (1 : ℤ) := by norm_num
        have hcast0 : ((0 : ℕ) : ℤ) = (0 : ℤ) := by norm_num
        rw [hcast1, hcast0] at hpen
        have hzero' : Erdos993G1.delta (Erdos993G1.ambientA F l) 0 = (m : ℤ) - 1 := by
          rw [hzero, hFluCard]
        have hstep : ErdosR25.CriticUC604FChain.L1 (m + 1) + ((m : ℤ) - 1)
            ≤ Erdos993G1.delta F 1 := by
          rw [hpen, hzero']
          linarith [hIH]
        have hL1step : ErdosR25.CriticUC604FChain.L1 (m + 2)
            ≤ ErdosR25.CriticUC604FChain.L1 (m + 1) + ((m : ℤ) - 1) := by
          show ErdosR25.CriticUC604FChain.L1 (m + 2) ≤ _
          rw [ErdosR25.CriticUC604FChain.L1]
          exact min_le_right _ _
        linarith [hL1step, hstep]

/-- Every forest of order `n` has `Delta_2(F) ≥ L2(n)`, uniformly, for every
`n`: the imported award `forest_delta_two_lower` (C6-LA1) handles `n ≥ 5`
directly (no recursion); `n < 5` recurses through the pendant identity onto
`forest_delta_one_lower`. -/
theorem forest_delta_two_lower_general :
    ∀ n : ℕ, ∀ {X : Type u} [Finite X] (F : SimpleGraph X),
      F.IsAcyclic → Nat.card X = n →
      ErdosR25.CriticUC604FChain.L2 n ≤ Erdos993G1.delta F 2 := by
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    match n, ih with
    | 0, _ =>
      intro X _ F _ hn
      have he : Nat.card F.edgeSet = 0 := no_edge_of_card_le_one F (by omega)
      have hd := edgeless_delta_eq F he 2
      norm_num at hd
      rw [hd, hn]
      simp [ErdosR25.CriticUC604FChain.L2, ErdosR25.CriticUC604FChain.edgeless]
    | 1, _ =>
      intro X _ F _ hn
      have he : Nat.card F.edgeSet = 0 := no_edge_of_card_le_one F (by omega)
      have hd := edgeless_delta_eq F he 2
      norm_num at hd
      rw [hd, hn]
      simp [ErdosR25.CriticUC604FChain.L2, ErdosR25.CriticUC604FChain.edgeless]
    | (n + 2), ih =>
      intro X _ F hF hn
      by_cases hge : 5 ≤ n + 2
      · have hlower := Erdos993G1.ForestDelta2.forest_delta_two_lower F hF (by omega)
        have hsix := ErdosR25.CriticUC604FChain.B_six (n + 2)
        rw [hn] at hlower
        have hL2eq : ErdosR25.CriticUC604FChain.L2 (n + 2)
            = ErdosR25.CriticUC604FChain.B (n + 2) := by
          show ErdosR25.CriticUC604FChain.L2 (n + 2) = _
          rw [ErdosR25.CriticUC604FChain.L2, if_pos hge]
        rw [hL2eq]
        linarith [hsix, hlower]
      · by_cases he : Nat.card F.edgeSet = 0
        · have hd := edgeless_delta_eq F he 2
          norm_num at hd
          rw [hd, hn]
          show ErdosR25.CriticUC604FChain.L2 (n + 2) ≤ _
          rw [ErdosR25.CriticUC604FChain.L2, if_neg hge]
          exact min_le_left _ _
        · obtain ⟨a, b, hab⟩ := exists_adj_of_card_edgeSet_ne_zero F he
          obtain ⟨l, u, hlu, hl⟩ :=
            Erdos993G1.U1Transcribed.forest_leaf_of_edge F hF ⟨a, b, hab⟩
          have hFlAcyc : (Erdos993G1.deleteVerts F ({l} : Set X)).IsAcyclic :=
            Erdos993G1.deleteVerts_isAcyclic F hF _
          have hFluAcyc : (Erdos993G1.ambientA F l).IsAcyclic :=
            Erdos993G1.deleteVerts_isAcyclic F hF _
          have hFlCard : Nat.card {w : X // w ∉ ({l} : Set X)} = n + 1 := by
            rw [card_deleteVerts_singleton]; omega
          have hFluCard : Nat.card {w : X // w ∉ Erdos993G1.closedNeighborhood F l} = n := by
            rw [card_ambientA_leaf F hlu hl]; omega
          have hIH2 := ih (n + 1) (by omega) (Erdos993G1.deleteVerts F ({l} : Set X))
            hFlAcyc hFlCard
          have hIH1 := forest_delta_one_lower n (Erdos993G1.ambientA F l) hFluAcyc hFluCard
          have hpen := Erdos993G1.CritUC503F.pendant_delta F l 1
          have hcast2 : ((1 + 1 : ℕ) : ℤ) = (2 : ℤ) := by norm_num
          have hcast1 : ((1 : ℕ) : ℤ) = (1 : ℤ) := by norm_num
          rw [hcast2, hcast1] at hpen
          have hL2step : ErdosR25.CriticUC604FChain.L2 (n + 2)
              ≤ ErdosR25.CriticUC604FChain.L2 (n + 1) + ErdosR25.CriticUC604FChain.L1 n := by
            show ErdosR25.CriticUC604FChain.L2 (n + 2) ≤ _
            rw [ErdosR25.CriticUC604FChain.L2, if_neg hge]
            exact min_le_right _ _
          rw [hpen]
          linarith [hIH2, hIH1, hL2step]

/-- **This route's headline lower bound**: every forest of order `n` has
`Delta_3(F) ≥ L3(n)`, uniformly, for every `n` (ENTRY 150's leaf, ENTRY
100's edgeless formula, the pendant identity in `Delta` form, and
`forest_delta_two_lower_general`; no base case, no enumeration, no
isomorphism-completeness object anywhere in this proof). -/
lemma forest_delta_three_lower :
    ∀ n : ℕ, ∀ {X : Type u} [Finite X] (F : SimpleGraph X),
      F.IsAcyclic → Nat.card X = n →
      ErdosR25.CriticUC604FChain.L3 n ≤ Erdos993G1.delta F 3 := by
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    match n, ih with
    | 0, _ =>
      intro X _ F _ hn
      have he : Nat.card F.edgeSet = 0 := no_edge_of_card_le_one F (by omega)
      have hd := edgeless_delta_eq F he 3
      norm_num at hd
      rw [hd, hn]
      simp [ErdosR25.CriticUC604FChain.L3, ErdosR25.CriticUC604FChain.edgeless]
    | 1, _ =>
      intro X _ F _ hn
      have he : Nat.card F.edgeSet = 0 := no_edge_of_card_le_one F (by omega)
      have hd := edgeless_delta_eq F he 3
      norm_num at hd
      rw [hd, hn]
      simp [ErdosR25.CriticUC604FChain.L3, ErdosR25.CriticUC604FChain.edgeless]
    | (n + 2), ih =>
      intro X _ F hF hn
      by_cases he : Nat.card F.edgeSet = 0
      · have hd := edgeless_delta_eq F he 3
        norm_num at hd
        rw [hd, hn]
        show ErdosR25.CriticUC604FChain.L3 (n + 2) ≤ _
        rw [ErdosR25.CriticUC604FChain.L3]
        exact min_le_left _ _
      · obtain ⟨a, b, hab⟩ := exists_adj_of_card_edgeSet_ne_zero F he
        obtain ⟨l, u, hlu, hl⟩ :=
          Erdos993G1.U1Transcribed.forest_leaf_of_edge F hF ⟨a, b, hab⟩
        have hFlAcyc : (Erdos993G1.deleteVerts F ({l} : Set X)).IsAcyclic :=
          Erdos993G1.deleteVerts_isAcyclic F hF _
        have hFluAcyc : (Erdos993G1.ambientA F l).IsAcyclic :=
          Erdos993G1.deleteVerts_isAcyclic F hF _
        have hFlCard : Nat.card {w : X // w ∉ ({l} : Set X)} = n + 1 := by
          rw [card_deleteVerts_singleton]; omega
        have hFluCard : Nat.card {w : X // w ∉ Erdos993G1.closedNeighborhood F l} = n := by
          rw [card_ambientA_leaf F hlu hl]; omega
        have hIH3 := ih (n + 1) (by omega) (Erdos993G1.deleteVerts F ({l} : Set X))
          hFlAcyc hFlCard
        have hIH2 := forest_delta_two_lower_general n (Erdos993G1.ambientA F l)
          hFluAcyc hFluCard
        have hpen := Erdos993G1.CritUC503F.pendant_delta F l 2
        have hcast3 : ((2 + 1 : ℕ) : ℤ) = (3 : ℤ) := by norm_num
        have hcast2 : ((2 : ℕ) : ℤ) = (2 : ℤ) := by norm_num
        rw [hcast3, hcast2] at hpen
        have hL3step : ErdosR25.CriticUC604FChain.L3 (n + 2)
            ≤ ErdosR25.CriticUC604FChain.L3 (n + 1) + ErdosR25.CriticUC604FChain.L2 n := by
          show ErdosR25.CriticUC604FChain.L3 (n + 2) ≤ _
          rw [ErdosR25.CriticUC604FChain.L3]
          exact min_le_right _ _
        rw [hpen]
        linarith [hIH3, hIH2, hL3step]

/-- `24 * C(n,4) = n(n-1)(n-2)(n-3)`, proved by induction exactly like the
frozen `scaledChooseTwo`/`scaledChooseThree` (ENTRIES 70-71). -/
theorem scaledChooseFour (n : ℕ) :
    24 * (n.choose 4 : ℤ) = (n : ℤ) * ((n : ℤ) - 1) * ((n : ℤ) - 2) * ((n : ℤ) - 3) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    rw [Nat.choose_succ_succ]
    simp only [Nat.cast_add]
    change 24 * ((n.choose 3 : ℤ) + (n.choose 4 : ℤ)) =
      ((n : ℤ) + 1) * ((n : ℤ) + 1 - 1) * ((n : ℤ) + 1 - 2) * ((n : ℤ) + 1 - 3)
    nlinarith [Erdos993G1.scaledChooseThree n, ih]

/-- The edgeless `Delta_3` value `C(n,4) - C(n,3)` is strictly positive for
`n ≥ 8` (in fact `24 * edgeless(n,3) = n(n-1)(n-2)(n-7)`). -/
theorem edgeless_three_pos_of_ge_eight (n : ℕ) (hn : 8 ≤ n) :
    0 < ErdosR25.CriticUC604FChain.edgeless n 3 := by
  have h4 := scaledChooseFour n
  have h3 := Erdos993G1.scaledChooseThree n
  have hnz : (8 : ℤ) ≤ (n : ℤ) := by exact_mod_cast hn
  have hident : 24 * ErdosR25.CriticUC604FChain.edgeless n 3
      = (n : ℤ) * ((n : ℤ) - 1) * ((n : ℤ) - 2) * ((n : ℤ) - 7) := by
    show 24 * ((n.choose 4 : ℤ) - (n.choose 3 : ℤ)) = _
    linear_combination h4 - 4 * h3
  have f0 : (0 : ℤ) < (n : ℤ) := by linarith
  have f1 : (0 : ℤ) < (n : ℤ) - 1 := by linarith
  have f2 : (0 : ℤ) < (n : ℤ) - 2 := by linarith
  have f7 : (0 : ℤ) < (n : ℤ) - 7 := by linarith
  have hprod : 0 < (n : ℤ) * ((n : ℤ) - 1) * ((n : ℤ) - 2) * ((n : ℤ) - 7) :=
    mul_pos (mul_pos (mul_pos f0 f1) f2) f7
  linarith [hident, hprod]

/-- `B(m) > 0` for `m ≥ 9` (the imported cubic bound is strict here; matches
`min Delta_2(9) = 7`). -/
theorem B_pos_of_ge_nine (m : ℕ) (hm : 9 ≤ m) : 0 < ErdosR25.CriticUC604FChain.B m := by
  have hsix := ErdosR25.CriticUC604FChain.B_six m
  have hmz : (9 : ℤ) ≤ (m : ℤ) := by exact_mod_cast hm
  nlinarith [hsix, hmz, sq_nonneg ((m : ℤ) - 9)]

/-- **The arithmetic chain closes and stays closed**: `L3(n) > 0` for every
`n ≥ 12`, not merely at the three numeral checks
(`L3_twelve_pos`/`L3_thirteen_fourteen_pos` in `L123Chain.lean`). Ordinary
induction from the kernel-checked base `L3(12) = 1`, using that once both
branches of the `min` defining `L3(n+1)` are positive (the edgeless branch
for `n + 1 ≥ 8` and `L3(n) + L2(n-1)` for `L3(n) > 0`, `L2(n-1) > 0`), no
further base case is ever consulted again. -/
theorem L3_pos_of_ge_twelve : ∀ n : ℕ, 12 ≤ n → 0 < ErdosR25.CriticUC604FChain.L3 n := by
  intro n hn
  induction n with
  | zero => omega
  | succ n ihn =>
    rcases Nat.lt_or_ge n 12 with hlt | hge
    · have : n = 11 := by omega
      subst this
      exact ErdosR25.CriticUC604FChain.L3_twelve_pos
    · obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
      have hprev : 0 < ErdosR25.CriticUC604FChain.L3 (k + 1) := ihn hge
      have hL2 : 0 < ErdosR25.CriticUC604FChain.L2 k := by
        have hb := B_pos_of_ge_nine k (by omega)
        have hL2eq : ErdosR25.CriticUC604FChain.L2 k = ErdosR25.CriticUC604FChain.B k := by
          obtain ⟨j, hj⟩ : ∃ j, k = j + 2 := ⟨k - 2, by omega⟩
          rw [hj]
          show ErdosR25.CriticUC604FChain.L2 (j + 2) = _
          rw [ErdosR25.CriticUC604FChain.L2, if_pos (by omega)]
        rw [hL2eq]; exact hb
      have hedge : 0 < ErdosR25.CriticUC604FChain.edgeless (k + 2) 3 :=
        edgeless_three_pos_of_ge_eight (k + 2) (by omega)
      show 0 < ErdosR25.CriticUC604FChain.L3 (k + 1 + 1)
      have hidx : k + 1 + 1 = k + 2 := by omega
      rw [hidx, ErdosR25.CriticUC604FChain.L3]
      exact lt_min hedge (by linarith [hprev, hL2])

-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN theorem Erdos993G1.ForestDelta3.forest_delta_three_pos_ge_twelve 7d805da65c69eccf2b76bebd07a1bf35e96bf52a112891798da68ae02e437c49
/-- **The headline, imported/derived, enumeration-free**:
`0 < Erdos993G1.delta F 3` for every forest of order `≥ 12`. -/
theorem forest_delta_three_pos_ge_twelve {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 12 ≤ Nat.card X) : 0 < Erdos993G1.delta F 3 := by
  have hlow := forest_delta_three_lower (Nat.card X) F hF rfl
  have hpos := L3_pos_of_ge_twelve (Nat.card X) hn
  linarith

end Erdos993G1.ForestDelta3
-- VERITYOS ENTRY 7 END

