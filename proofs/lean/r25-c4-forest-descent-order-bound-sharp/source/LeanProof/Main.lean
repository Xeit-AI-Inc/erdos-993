import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.indepCount 5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb
universe u


namespace Erdos993G1

noncomputable
def indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

end Erdos993G1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.coeff 211900436b28e4a685af60df26a20e8fe254fd4c9479c12ba2863fa180c1a639
namespace Erdos993G1

noncomputable
def coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

end Erdos993G1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition Erdos993G1.delta bdb46014d98507a7c85cc8de0b806f80c04496479795e28677dde024e216b9ee
namespace Erdos993G1

noncomputable
def delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k

end Erdos993G1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    Erdos993G1.indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [Erdos993G1.indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma Erdos993G1.coeff_nat df2c55481b6ddf4fc4fcce445b787573fca53c0f4fb7599f0e1f5b3330f36da1
namespace Erdos993G1

lemma coeff_nat {V : Type u} (F : SimpleGraph V) (k : ℕ) :
    Erdos993G1.coeff F (k : ℤ) = Erdos993G1.indepCount F k := by
  simp [Erdos993G1.coeff]

end Erdos993G1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.delta_nat c063c49584d30c5e9e7761596f1f323212ddb803b56bea9b3fd8b0027ad38077
namespace Erdos993G1

lemma delta_nat {V : Type u} (F : SimpleGraph V) (k : ℕ) :
    Erdos993G1.delta F (k : ℤ) = Erdos993G1.indepCount F (k + 1) - Erdos993G1.indepCount F k := by
  simpa only [Erdos993G1.delta, Nat.cast_add, Nat.cast_one] using
    congrArg₂ (· - ·) (Erdos993G1.coeff_nat F (k + 1)) (Erdos993G1.coeff_nat F k)

end Erdos993G1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.indepSetFinset_eq_filter_powersetCard 2bbf89c624e4ed8b21dea69806ce7f665ff18b8634a59a1d4c461ef977ca90ca
namespace Erdos993G1

lemma indepSetFinset_eq_filter_powersetCard {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    F.indepSetFinset k = ((Finset.univ : Finset V).powersetCard k).filter
      (fun B : Finset V => F.IsIndepSet B) := by
  ext B
  simp [SimpleGraph.mem_indepSetFinset_iff, SimpleGraph.isNIndepSet_iff, and_comm]

end Erdos993G1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.indepSetFinset_card_le_choose 4d424758751cac03a524b23854e6366b4ced80bfcdfbd7578b2930904f3e2ca0
namespace Erdos993G1

lemma indepSetFinset_card_le_choose {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    (F.indepSetFinset k).card ≤ (Fintype.card V).choose k := by
  rw [Erdos993G1.indepSetFinset_eq_filter_powersetCard]
  calc
    ((Finset.univ.powersetCard k).filter (fun B : Finset V => F.IsIndepSet B)).card
        ≤ (Finset.univ.powersetCard k).card := Finset.card_filter_le _ _
    _ = (Fintype.card V).choose k := by
        rw [Finset.card_powersetCard, Finset.card_univ]

end Erdos993G1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.forest_card_edges_add_components 7eef4f723871eb13f3132efb877cda06e5b4a7498589fca0a012eb49339ea183
namespace Erdos993G1

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

end Erdos993G1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.components_card_pos_of_card_pos 2948f2bea2afbc682160cd1afae04ff4f83f519d4413e437dddd787c6d33f3a8
namespace Erdos993G1

lemma components_card_pos_of_card_pos {V : Type u} [Finite V]
    (F : SimpleGraph V) (hV : 0 < Nat.card V) :
    0 < Nat.card F.ConnectedComponent := by
  haveI : Nonempty V := (Finite.card_pos_iff).mp hV
  exact Nat.card_pos

end Erdos993G1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.forest_card_edgeSet_le 306835a68974a8e83716ffb740fd4eb398707f11f3b4404fbbb6d5df2fac13a1
namespace Erdos993G1

lemma forest_card_edgeSet_le {V : Type u} [Finite V]
    (F : SimpleGraph V) (hF : F.IsAcyclic) (hV : 0 < Nat.card V) :
    Nat.card F.edgeSet ≤ Nat.card V - 1 := by
  have he := Erdos993G1.forest_card_edges_add_components F hF
  have hp := Erdos993G1.components_card_pos_of_card_pos F hV
  omega

end Erdos993G1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.nonindep_card_le_edges_mul_choose 0efe5780c1c3a489e6ca3a4eec4f16766692446cf7c1b88d5fdf4e5430234e7e
namespace Erdos993G1

lemma nonindep_card_le_edges_mul_choose {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) (hk : 1 ≤ k) :
    (((Finset.univ : Finset X).powersetCard (k + 1)).filter
        (fun S : Finset X => ¬ G.IsIndepSet S)).card ≤
      Nat.card G.edgeSet * (Fintype.card X - 2).choose (k - 1) := by
  classical
  have hsub :
      ((Finset.univ : Finset X).powersetCard (k + 1)).filter
          (fun S : Finset X => ¬ G.IsIndepSet S) ⊆
        G.edgeFinset.biUnion (fun e =>
          ((Finset.univ : Finset X).powersetCard (k + 1)).filter
            (fun S : Finset X => e.toFinset ⊆ S)) := by
    intro S hS
    simp only [Finset.mem_filter, Finset.mem_powersetCard] at hS
    obtain ⟨⟨_, hScard⟩, hnotindep⟩ := hS
    rw [SimpleGraph.isIndepSet_iff] at hnotindep
    simp only [Set.Pairwise, ne_eq] at hnotindep
    push Not at hnotindep
    obtain ⟨x, hxS, y, hyS, hxy, hadj⟩ := hnotindep
    refine Finset.mem_biUnion.mpr ⟨s(x, y), ?_, ?_⟩
    · rw [SimpleGraph.mem_edgeFinset, SimpleGraph.mem_edgeSet]
      exact hadj
    · simp only [Finset.mem_filter, Finset.mem_powersetCard]
      refine ⟨⟨Finset.subset_univ _, hScard⟩, ?_⟩
      rw [Sym2.toFinset_mk_eq]
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hxS
      · exact hyS
  calc
    (((Finset.univ : Finset X).powersetCard (k + 1)).filter
        (fun S : Finset X => ¬ G.IsIndepSet S)).card
        ≤ (G.edgeFinset.biUnion (fun e =>
            ((Finset.univ : Finset X).powersetCard (k + 1)).filter
              (fun S : Finset X => e.toFinset ⊆ S))).card :=
      Finset.card_le_card hsub
    _ ≤ ∑ e ∈ G.edgeFinset, (((Finset.univ : Finset X).powersetCard (k + 1)).filter
          (fun S : Finset X => e.toFinset ⊆ S)).card :=
      Finset.card_biUnion_le
    _ = ∑ _e ∈ G.edgeFinset, (Fintype.card X - 2).choose (k - 1) := by
      apply Finset.sum_congr rfl
      intro e he
      have hnd : ¬ e.IsDiag := G.not_isDiag_of_mem_edgeSet (SimpleGraph.mem_edgeFinset.mp he)
      have hcard2 : e.toFinset.card = 2 := Sym2.card_toFinset_of_not_isDiag e hnd
      have hkey := Finset.card_filter_powersetCard_subset e.toFinset
        (Finset.univ : Finset X) (k + 1) (Finset.subset_univ _) (by rw [hcard2]; omega)
      rw [hcard2, Finset.card_univ, show k + 1 - 2 = k - 1 from by omega] at hkey
      exact hkey
    _ = G.edgeFinset.card * (Fintype.card X - 2).choose (k - 1) := by
      rw [Finset.sum_const, smul_eq_mul]
    _ = Nat.card G.edgeSet * (Fintype.card X - 2).choose (k - 1) := by
      rw [Nat.card_eq_fintype_card, SimpleGraph.edgeFinset_card]

end Erdos993G1
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.choose_succ_le_indepSetFinset_add_edges_mul_choose ee395f11f02f46b5f03156b6db864acc66494a29c15cd6f8ec0c99a62ffa3e27
namespace Erdos993G1

lemma choose_succ_le_indepSetFinset_add_edges_mul_choose {X : Type u} [Fintype X]
    [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) (hk : 1 ≤ k) :
    (Fintype.card X).choose (k + 1) ≤
      (G.indepSetFinset (k + 1)).card +
        Nat.card G.edgeSet * (Fintype.card X - 2).choose (k - 1) := by
  have hsplit :
      ((Finset.univ : Finset X).powersetCard (k + 1)).card =
        (G.indepSetFinset (k + 1)).card +
          (((Finset.univ : Finset X).powersetCard (k + 1)).filter
            (fun S : Finset X => ¬ G.IsIndepSet S)).card := by
    rw [Erdos993G1.indepSetFinset_eq_filter_powersetCard]
    exact (Finset.card_filter_add_card_filter_not (fun S : Finset X => G.IsIndepSet S)).symm
  have hbound := Erdos993G1.nonindep_card_le_edges_mul_choose G k hk
  rw [Finset.card_powersetCard, Finset.card_univ] at hsplit
  omega

end Erdos993G1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.choose_absorption_two ea09528592ed9e5a55b2234ae8bd90a2b4f04de9d7d0c89674d9eeca8f12198f
namespace Erdos993G1

lemma choose_absorption_two (n k : ℕ) (hk : 1 ≤ k) :
    n.choose k * k * (n - k) = (n - 2).choose (k - 1) * n * (n - 1) := by
  have hmul := Nat.choose_mul (n := n) (k := k + 1) (s := 2) (by omega)
  have h2n : n.choose 2 * 2 = n * (n - 1) := by
    have h := Nat.choose_succ_right_eq n 1
    simpa [Nat.choose_one_right] using h
  have h2k : (k + 1).choose 2 * 2 = (k + 1) * k := by
    have h := Nat.choose_succ_right_eq (k + 1) 1
    simpa [Nat.choose_one_right] using h
  have hstep : n.choose (k + 1) * ((k + 1).choose 2 * 2) =
      (n.choose 2 * 2) * (n - 2).choose (k + 1 - 2) := by
    rw [← mul_assoc, hmul]; ring
  rw [h2k, h2n, show k + 1 - 2 = k - 1 from by omega] at hstep
  calc
    n.choose k * k * (n - k) = n.choose k * (n - k) * k := by ring
    _ = n.choose (k + 1) * (k + 1) * k := by rw [Nat.choose_succ_right_eq n k]
    _ = n.choose (k + 1) * ((k + 1) * k) := by ring
    _ = n * (n - 1) * (n - 2).choose (k - 1) := hstep
    _ = (n - 2).choose (k - 1) * n * (n - 1) := by ring

end Erdos993G1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.choose_growth_of_large f87d24c1f4e7c318108d9b13c951fd71d7417f5cfbcfaeb5eaef516dd818ed65
namespace Erdos993G1

lemma choose_growth_of_large {n k : ℕ} (hk : 1 ≤ k) (hn : (k + 1) ^ 2 + 1 ≤ n) :
    n.choose k + (n - 1) * (n - 2).choose (k - 1) ≤ n.choose (k + 1) := by
  have hnk : k ≤ n := by nlinarith
  have hn1 : 1 ≤ n := by nlinarith
  have h1 : n.choose (k + 1) * (k + 1) = n.choose k * (n - k) := Nat.choose_succ_right_eq n k
  have h2 : n.choose k * k * (n - k) = (n - 2).choose (k - 1) * n * (n - 1) :=
    Erdos993G1.choose_absorption_two n k hk
  have h1' : (n.choose (k + 1) : ℤ) * ((k : ℤ) + 1) =
      (n.choose k : ℤ) * ((n : ℤ) - (k : ℤ)) := by
    have h := h1
    zify [hnk] at h
    linarith [h]
  have h2' : (n.choose k : ℤ) * (k : ℤ) * ((n : ℤ) - (k : ℤ)) =
      ((n - 2).choose (k - 1) : ℤ) * (n : ℤ) * ((n : ℤ) - 1) := by
    have h := h2
    zify [hnk, hn1] at h
    linarith [h]
  have hA : (0 : ℤ) ≤ (n.choose k : ℤ) := by positivity
  have hD : (0 : ℤ) ≤ ((n - 2).choose (k - 1) : ℤ) := by positivity
  obtain ⟨s, hs⟩ := Nat.le.dest hn
  have hs' : (n : ℤ) = ((k : ℤ) + 1) ^ 2 + 1 + (s : ℤ) := by exact_mod_cast hs.symm
  have hquad : ((k : ℤ) + 1) * ((n : ℤ) + (k : ℤ) * ((n : ℤ) - (k : ℤ))) ≤
      ((n : ℤ) - (k : ℤ)) * (n : ℤ) := by
    rw [hs']
    nlinarith [sq_nonneg (s : ℤ), Nat.cast_nonneg (α := ℤ) s, Nat.cast_nonneg (α := ℤ) k]
  have hscaled : ((n.choose k : ℤ) + ((n : ℤ) - 1) * ((n - 2).choose (k - 1) : ℤ)) *
      (((k : ℤ) + 1) * (n : ℤ)) ≤ (n.choose (k + 1) : ℤ) * (((k : ℤ) + 1) * (n : ℤ)) := by
    have hmulA : (n.choose k : ℤ) * (((k : ℤ) + 1) *
        ((n : ℤ) + (k : ℤ) * ((n : ℤ) - (k : ℤ)))) ≤
        (n.choose k : ℤ) * (((n : ℤ) - (k : ℤ)) * (n : ℤ)) :=
      mul_le_mul_of_nonneg_left hquad hA
    nlinarith [hmulA, h1', h2']
  have hnk1pos : (0 : ℤ) < ((k : ℤ) + 1) * (n : ℤ) := by
    have : (0:ℤ) < (n:ℤ) := by exact_mod_cast hn1
    positivity
  have hfinal : (n.choose k : ℤ) + ((n : ℤ) - 1) * ((n - 2).choose (k - 1) : ℤ) ≤
      (n.choose (k + 1) : ℤ) :=
    le_of_mul_le_mul_right hscaled hnk1pos
  have hn1cast : ((n - 1 : ℕ) : ℤ) = (n : ℤ) - 1 := Nat.cast_sub hn1
  have hcastgoal :
      ((n.choose k + (n - 1) * (n - 2).choose (k - 1) : ℕ) : ℤ) ≤
        ((n.choose (k + 1) : ℕ) : ℤ) := by
    push_cast [hn1cast]
    linarith [hfinal]
  exact_mod_cast hcastgoal

end Erdos993G1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.indep_card_mono_of_large 81f8150c7db59fcce3227ceb1a377d17163af4888aa76c7adc16da90ea005392
namespace Erdos993G1

lemma indep_card_mono_of_large {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) (hG : G.IsAcyclic) [DecidableRel G.Adj] (k : ℕ) (hk : 1 ≤ k)
    (hn : (k + 1) ^ 2 + 1 ≤ Fintype.card X) :
    (G.indepSetFinset k).card ≤ (G.indepSetFinset (k + 1)).card := by
  have ha : (G.indepSetFinset k).card ≤ (Fintype.card X).choose k :=
    Erdos993G1.indepSetFinset_card_le_choose G k
  have hb := Erdos993G1.choose_succ_le_indepSetFinset_add_edges_mul_choose G k hk
  have hXpos : 0 < Fintype.card X := by omega
  have hc : Nat.card G.edgeSet ≤ Fintype.card X - 1 := by
    have heq1 : Nat.card G.edgeSet = Fintype.card G.edgeSet := Nat.card_eq_fintype_card
    have heq2 : Nat.card X = Fintype.card X := Nat.card_eq_fintype_card
    have hXpos' : 0 < Nat.card X := by omega
    have h := Erdos993G1.forest_card_edgeSet_le G hG hXpos'
    omega
  have hd := Erdos993G1.choose_growth_of_large hk hn
  have he : Nat.card G.edgeSet * (Fintype.card X - 2).choose (k - 1) ≤
      (Fintype.card X - 1) * (Fintype.card X - 2).choose (k - 1) :=
    Nat.mul_le_mul hc (le_refl _)
  omega

end Erdos993G1
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN theorem Erdos993G1.ForestOrderBound.forest_descent_order_bound 2e4b63f5dde8db7f7ef628469fa615f2f72ac9a1190e1bc1655012b0d6eaa45c
namespace Erdos993G1.ForestOrderBound

theorem forest_descent_order_bound {X : Type u} [Finite X]
    (G : SimpleGraph X) (hG : G.IsAcyclic) (k : ℕ) (hk : 1 ≤ k)
    (hneg : Erdos993G1.delta G (k : ℤ) < 0) :
    Nat.card X ≤ (k + 1) ^ 2 := by
  classical
  letI := Fintype.ofFinite X
  by_contra hcon
  have hlt : (k + 1) ^ 2 < Nat.card X := not_le.mp hcon
  have hn : (k + 1) ^ 2 + 1 ≤ Fintype.card X := by
    rw [Nat.card_eq_fintype_card] at hlt
    omega
  have hmono := Erdos993G1.indep_card_mono_of_large G hG k hk hn
  have hineq : Erdos993G1.indepCount G k ≤ Erdos993G1.indepCount G (k + 1) := by
    rw [Erdos993G1.indepCount_eq_card_indepSetFinset, Erdos993G1.indepCount_eq_card_indepSetFinset]
    exact_mod_cast hmono
  have hd := Erdos993G1.delta_nat G k
  omega

end Erdos993G1.ForestOrderBound
-- VERITYOS ENTRY 17 END

