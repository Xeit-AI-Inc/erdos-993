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

-- VERITYOS ENTRY 2 BEGIN definition Erdos993G1.indepDegreeSum a1ed32eb12b137ac5915bf15255c1173593296f3eb22127e2dcf0fab2ea9f38e
namespace Erdos993G1

section

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The incident degree sum `D_k(G) := Σ_{J ∈ I_k(G)} Σ_{v ∈ J} deg_G(v)`. -/
def indepDegreeSum (k : ℕ) : ℕ :=
  ∑ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v

end

end Erdos993G1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition Erdos993G1.occ db58fa8816d4fd3ced845333ac9fe9beb9802c0657631a15bb03e5ab273583e6
namespace Erdos993G1

/-- Occupancy count `c_v(k)`: the number of independent `k`-sets containing `v`
(`SEMANTIC-CONTRACT.md` §1). -/
def occ {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]
    (v : X) (k : ℕ) : ℕ :=
  ((G.indepSetFinset k).filter (fun J => v ∈ J)).card

end Erdos993G1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition Erdos993G1.slotsAtLeast 0c74d48cbf739f4bc344b3b64d7a60cb2ebda43753b66db8d2dec09f72285b73
namespace Erdos993G1

/-- `slotsAtLeast G k t`: the total slot weight `deg v − 2` of branch vertices whose occupancy
count is at least `t`. -/
def slotsAtLeast {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k t : ℕ) : ℕ :=
  ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v ∧ t ≤ occ G v k), (G.degree v - 2)

end Erdos993G1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition Erdos993G1.leavesAtLeast e916f3de7a4a8ebf1bbd40ebb6f5fe99d9779723e10f894ab43619e191cd55dd
namespace Erdos993G1

/-- `leavesAtLeast G k t`: the number of leaves whose occupancy count is at least `t`. -/
def leavesAtLeast {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k t : ℕ) : ℕ :=
  (Finset.univ.filter (fun ℓ => G.degree ℓ = 1 ∧ t ≤ occ G ℓ k)).card

end Erdos993G1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    Erdos993G1.indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [Erdos993G1.indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.pendant_path_adj_of_pos e0b86a6d6d9ca5bc2aef995d4b27b85b1eba4e6aad52bc2741b7bb4349361787
namespace Erdos993G1

/-- Neighbours of a non-anchor vertex of a pendant path (re-derived in-run, C1-LA4). If
`u : Fin (m + 2) → X` is a pendant path (injective, consecutive vertices adjacent, interior
vertices of degree 2, last vertex a leaf) and `0 < a`, then every neighbour of `u a` is `u b`
for a position `b` consecutive to `a`. The degree pattern alone forces this; no acyclicity or
connectivity is used. -/
lemma pendant_path_adj_of_pos {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (m : ℕ) (u : Fin (m + 2) → X) (hinj : Function.Injective u)
    (hadj : ∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ))
    (hdeg2 : ∀ i : Fin (m + 2), 0 < i.val → i.val < m + 1 → G.degree (u i) = 2)
    (hleaf : G.degree (u (Fin.last (m + 1))) = 1) (a : Fin (m + 2)) (ha : 0 < a.val)
    (y : X) (hy : G.Adj (u a) y) :
    ∃ b : Fin (m + 2), y = u b ∧ (b.val + 1 = a.val ∨ a.val + 1 = b.val) := by
  have hpred : G.Adj (u ⟨a.val - 1, by omega⟩) (u a) := by
    have h := hadj ⟨a.val - 1, by omega⟩
    have e1 : (⟨a.val - 1, by omega⟩ : Fin (m + 1)).castSucc
        = (⟨a.val - 1, by omega⟩ : Fin (m + 2)) := Fin.ext rfl
    have e2 : (⟨a.val - 1, by omega⟩ : Fin (m + 1)).succ = a := by
      ext
      simp only [Fin.val_succ]
      omega
    rw [e1, e2] at h
    exact h
  have hymem : y ∈ G.neighborFinset (u a) := by
    rw [SimpleGraph.mem_neighborFinset]
    exact hy
  by_cases hint : a.val < m + 1
  · have hsucc : G.Adj (u a) (u ⟨a.val + 1, by omega⟩) := by
      have h := hadj ⟨a.val, hint⟩
      have e1 : (⟨a.val, hint⟩ : Fin (m + 1)).castSucc = a := Fin.ext rfl
      have e2 : (⟨a.val, hint⟩ : Fin (m + 1)).succ
          = (⟨a.val + 1, by omega⟩ : Fin (m + 2)) := by
        ext
        simp only [Fin.val_succ]
      rw [e1, e2] at h
      exact h
    have hne : u ⟨a.val - 1, by omega⟩ ≠ u ⟨a.val + 1, by omega⟩ := by
      intro h
      have h' := congrArg Fin.val (hinj h)
      simp only at h'
      omega
    have hsub : ({u ⟨a.val - 1, by omega⟩, u ⟨a.val + 1, by omega⟩} : Finset X)
        ⊆ G.neighborFinset (u a) := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rw [SimpleGraph.mem_neighborFinset]
      rcases hz with hz | hz
      · rw [hz]
        exact hpred.symm
      · rw [hz]
        exact hsucc
    have hcard : (G.neighborFinset (u a)).card
        ≤ ({u ⟨a.val - 1, by omega⟩, u ⟨a.val + 1, by omega⟩} : Finset X).card := by
      rw [SimpleGraph.card_neighborFinset_eq_degree, hdeg2 a ha hint, Finset.card_pair hne]
    have heq := Finset.eq_of_subset_of_card_le hsub hcard
    rw [← heq] at hymem
    simp only [Finset.mem_insert, Finset.mem_singleton] at hymem
    rcases hymem with h | h
    · exact ⟨⟨a.val - 1, by omega⟩, h, Or.inl (by simp only; omega)⟩
    · exact ⟨⟨a.val + 1, by omega⟩, h, Or.inr (by simp only)⟩
  · have hdeg : G.degree (u a) = 1 := by
      have hlast : a = Fin.last (m + 1) := by
        ext
        simp only [Fin.val_last]
        omega
      rw [hlast]
      exact hleaf
    have hsub : ({u ⟨a.val - 1, by omega⟩} : Finset X) ⊆ G.neighborFinset (u a) := by
      intro z hz
      rw [Finset.mem_singleton] at hz
      rw [SimpleGraph.mem_neighborFinset, hz]
      exact hpred.symm
    have hcard : (G.neighborFinset (u a)).card ≤ ({u ⟨a.val - 1, by omega⟩} : Finset X).card := by
      rw [SimpleGraph.card_neighborFinset_eq_degree, hdeg, Finset.card_singleton]
    have heq := Finset.eq_of_subset_of_card_le hsub hcard
    rw [← heq, Finset.mem_singleton] at hymem
    exact ⟨⟨a.val - 1, by omega⟩, hymem, Or.inl (by simp only; omega)⟩

end Erdos993G1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.pendant_path_adj_consec 34427ac636105b7f12a998c7b91bc7cc80cc95b4a033b024822456e50c7688fe
namespace Erdos993G1

/-- Two vertices of a pendant path are adjacent only if their positions are consecutive
(re-derived in-run, C1-LA4). -/
lemma pendant_path_adj_consec {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (m : ℕ) (u : Fin (m + 2) → X) (hinj : Function.Injective u)
    (hadj : ∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ))
    (hdeg2 : ∀ i : Fin (m + 2), 0 < i.val → i.val < m + 1 → G.degree (u i) = 2)
    (hleaf : G.degree (u (Fin.last (m + 1))) = 1) (a b : Fin (m + 2))
    (hab : G.Adj (u a) (u b)) :
    a.val + 1 = b.val ∨ b.val + 1 = a.val := by
  by_cases ha : 0 < a.val
  · obtain ⟨c, hc, hc'⟩ :=
      pendant_path_adj_of_pos G m u hinj hadj hdeg2 hleaf a ha (u b) hab
    have hbc : b = c := hinj hc
    rw [hbc]
    omega
  · have hne : a ≠ b := fun h => hab.ne (congrArg u h)
    have hb : 0 < b.val := by
      rcases Nat.eq_zero_or_pos b.val with h | h
      · exact absurd (Fin.ext (by omega)) hne
      · exact h
    obtain ⟨c, hc, hc'⟩ :=
      pendant_path_adj_of_pos G m u hinj hadj hdeg2 hleaf b hb (u a) hab.symm
    have hac : a = c := hinj hc
    rw [hac]
    omega

end Erdos993G1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.pendant_path_adj_mem_range b2a5a0c02fd79a468329b1d2c4b00a407b0681ed629583254f63116462c0a20a
namespace Erdos993G1

/-- Every neighbour of a non-anchor pendant-path vertex lies on the path (re-derived in-run,
C1-LA4). -/
lemma pendant_path_adj_mem_range {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (m : ℕ) (u : Fin (m + 2) → X) (hinj : Function.Injective u)
    (hadj : ∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ))
    (hdeg2 : ∀ i : Fin (m + 2), 0 < i.val → i.val < m + 1 → G.degree (u i) = 2)
    (hleaf : G.degree (u (Fin.last (m + 1))) = 1) (a : Fin (m + 2)) (ha : 0 < a.val)
    (y : X) (hy : G.Adj (u a) y) :
    y ∈ Set.range u := by
  obtain ⟨b, hb, -⟩ := pendant_path_adj_of_pos G m u hinj hadj hdeg2 hleaf a ha y hy
  exact ⟨b, hb.symm⟩

end Erdos993G1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.exists_pendant_shift_perm ace96d1ec54fe794357e36542c01f375e702856d0ec8236da54edf249399b412
namespace Erdos993G1

/-- The index permutation of the two-step shift (re-derived in-run, C1-LA4): for `i < m + 1`,
positions `j < i` are fixed, `i ↦ m + 1` (the leaf), `i + 1 ↦ m`, and `j ↦ j - 2` for
`j ≥ i + 2`. It is a permutation of `Fin (m + 2)`. -/
lemma exists_pendant_shift_perm (m i : ℕ) (hi : i < m + 1) :
    ∃ π : Equiv.Perm (Fin (m + 2)), ∀ j : Fin (m + 2),
      (π j).val = if j.val < i then j.val else if j.val = i then m + 1
        else if j.val = i + 1 then m else j.val - 2 := by
  let f : Fin (m + 2) → Fin (m + 2) := fun j =>
    ⟨if j.val < i then j.val else if j.val = i then m + 1
        else if j.val = i + 1 then m else j.val - 2, by
      have hj := j.isLt
      split_ifs <;> omega⟩
  have hf : Function.Injective f := by
    intro a b hab
    have h := congrArg Fin.val hab
    simp only [f] at h
    have ha := a.isLt
    have hb := b.isLt
    ext
    split_ifs at h <;> omega
  exact ⟨Equiv.ofBijective f (Finite.injective_iff_bijective.mp hf), fun j => rfl⟩

end Erdos993G1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.pendant_path_occ_le_of_lt 4087830d9c05849f6065a1b6a2eceec2cb780cac6e9f830d150bca83e64df608
namespace Erdos993G1

/-- The two-step shift injection (re-derived in-run, C1-LA4; route of `C-T1-U`, the direct
injection form recommended by the T adjudicator). For a pendant path and a position `i` before
the leaf, the vertex permutation `σ` that moves `u i` to the leaf `u (m + 1)`, `u (i + 1)` to
`u m`, slides `u j` (`j ≥ i + 2`) two steps toward `u 0`, and fixes every other vertex, maps each
independent `k`-set containing `u i` to an independent `k`-set containing the leaf. `σ` is a
permutation, so the induced map on finsets is injective; hence `c_{u_i}(k) ≤ c_ℓ(k)`. -/
lemma pendant_path_occ_le_of_lt {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (m : ℕ) (u : Fin (m + 2) → X) (hinj : Function.Injective u)
    (hadj : ∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ))
    (hdeg2 : ∀ i : Fin (m + 2), 0 < i.val → i.val < m + 1 → G.degree (u i) = 2)
    (hleaf : G.degree (u (Fin.last (m + 1))) = 1) (k : ℕ) (i : Fin (m + 2))
    (hi : i.val < m + 1) :
    occ G (u i) k ≤ occ G (u (Fin.last (m + 1))) k := by
  obtain ⟨π, hπ⟩ := exists_pendant_shift_perm m i.val hi
  let ι : Fin (m + 2) ↪ X := ⟨u, hinj⟩
  let σ : Equiv.Perm X := π.viaEmbedding ι
  have hσu : ∀ a : Fin (m + 2), σ (u a) = u (π a) := fun a =>
    Equiv.Perm.viaEmbedding_apply π ι a
  have hσoff : ∀ x : X, x ∉ Set.range u → σ x = x := fun x hx =>
    Equiv.Perm.viaEmbedding_apply_of_notMem π ι x hx
  have hcons : ∀ a b : Fin (m + 2), a.val + 1 = b.val → G.Adj (u a) (u b) := by
    intro a b h
    have h' := hadj ⟨a.val, by omega⟩
    have e1 : (⟨a.val, by omega⟩ : Fin (m + 1)).castSucc = a := Fin.ext rfl
    have e2 : (⟨a.val, by omega⟩ : Fin (m + 1)).succ = b := by
      ext
      simp only [Fin.val_succ]
      omega
    rw [e1, e2] at h'
    exact h'
  have hπi : π i = Fin.last (m + 1) := by
    ext
    rw [hπ i]
    simp
  unfold occ
  apply Finset.card_le_card_of_injOn (fun J => J.map σ.toEmbedding)
  · intro J hJ
    simp only [Finset.coe_filter, Set.mem_setOf_eq, SimpleGraph.mem_indepSetFinset_iff,
      SimpleGraph.isNIndepSet_iff] at hJ ⊢
    obtain ⟨⟨hind, hcard⟩, hiJ⟩ := hJ
    have hJi : ∀ x ∈ J, ∀ y ∈ J, ¬ G.Adj x y := fun x hx y hy hxy =>
      hind (Finset.mem_coe.mpr hx) (Finset.mem_coe.mpr hy) hxy.ne hxy
    have hS : ∀ a b : Fin (m + 2), u a ∈ J → u b ∈ J →
        ¬ (a.val + 1 = b.val ∨ b.val + 1 = a.val) := by
      intro a b ha hb h
      rcases h with h | h
      · exact hJi _ ha _ hb (hcons a b h)
      · exact hJi _ hb _ ha (hcons b a h)
    have hpath_off : ∀ a : Fin (m + 2), u a ∈ J → ∀ y ∈ J, y ∉ Set.range u →
        ¬ G.Adj (σ (u a)) y := by
      intro a ha y hy hyoff hA
      rw [hσu] at hA
      by_cases hpos : 0 < (π a).val
      · exact hyoff (pendant_path_adj_mem_range G m u hinj hadj hdeg2 hleaf (π a) hpos y hA)
      · have hπa := hπ a
        have hna := hS a i ha hiJ
        have hal := a.isLt
        have hmem : u (π a) ∈ J := by
          rcases (show (π a).val = a.val ∨ (π a).val = i.val by
              split_ifs at hπa <;> omega) with h | h
          · rw [show π a = a from Fin.ext h]
            exact ha
          · rw [show π a = i from Fin.ext h]
            exact hiJ
        exact hJi _ hmem _ hy hA
    have key : ∀ x ∈ J, ∀ y ∈ J, ¬ G.Adj (σ x) (σ y) := by
      intro x hx y hy hA
      by_cases hxr : x ∈ Set.range u
      · by_cases hyr : y ∈ Set.range u
        · obtain ⟨a, rfl⟩ := hxr
          obtain ⟨b, rfl⟩ := hyr
          rw [hσu, hσu] at hA
          have hc := pendant_path_adj_consec G m u hinj hadj hdeg2 hleaf (π a) (π b) hA
          have h1 := hS a b hx hy
          have h2 := hS a i hx hiJ
          have h3 := hS b i hy hiJ
          have ha := hπ a
          have hb := hπ b
          have hal := a.isLt
          have hbl := b.isLt
          split_ifs at ha hb <;> omega
        · obtain ⟨a, rfl⟩ := hxr
          rw [hσoff y hyr] at hA
          exact hpath_off a hx y hy hyr hA
      · by_cases hyr : y ∈ Set.range u
        · obtain ⟨b, rfl⟩ := hyr
          rw [hσoff x hxr] at hA
          exact hpath_off b hy x hx hxr hA.symm
        · rw [hσoff x hxr, hσoff y hyr] at hA
          exact hJi x hx y hy hA
    refine ⟨⟨?_, by rw [Finset.card_map, hcard]⟩, ?_⟩
    · intro x hx y hy _ hxy
      rw [Finset.coe_map, Set.mem_image] at hx hy
      obtain ⟨x', hx', rfl⟩ := hx
      obtain ⟨y', hy', rfl⟩ := hy
      exact key x' (Finset.mem_coe.mp hx') y' (Finset.mem_coe.mp hy') hxy
    · rw [Finset.mem_map]
      exact ⟨u i, hiJ, by rw [Equiv.toEmbedding_apply, hσu, hπi]⟩
  · intro J1 _ J2 _ h
    exact Finset.map_injective σ.toEmbedding h

end Erdos993G1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN theorem Erdos993G1.pendant_path_leaf_dominance 6f0dcbe2feebce289af31daadc2d705823ff411d66e50e470484bc57700eb43b
namespace Erdos993G1

/-- **Pendant-path leaf dominance** (`E993-R28-PENDANT-PATH-LEAF-DOMINANCE`, C1-LA4), graph-general
(no `IsTree`). For a pendant path `u : Fin (m + 2) → X` (injective; consecutive vertices adjacent;
the interior vertices `u 1, …, u m` of degree 2; the end `u (m + 1)` a leaf; `u 0` arbitrary),
every `k` and every position `i`: `c_{u i}(k) ≤ c_{u (m + 1)}(k)`. Not (PW); not stepwise
monotonicity along the path (REFUTED, `S(3,1,1)`, `k = 3`). -/
theorem pendant_path_leaf_dominance {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (m : ℕ) (u : Fin (m + 2) → X) (hinj : Function.Injective u)
    (hadj : ∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ))
    (hdeg2 : ∀ i : Fin (m + 2), 0 < i.val → i.val < m + 1 → G.degree (u i) = 2)
    (hleaf : G.degree (u (Fin.last (m + 1))) = 1) (k : ℕ) (i : Fin (m + 2)) :
    occ G (u i) k ≤ occ G (u (Fin.last (m + 1))) k := by
  by_cases hi : i.val < m + 1
  · exact pendant_path_occ_le_of_lt G m u hinj hadj hdeg2 hleaf k i hi
  · have hlast : i = Fin.last (m + 1) := by
      ext
      simp only [Fin.val_last]
      omega
    rw [hlast]

end Erdos993G1
-- VERITYOS ENTRY 12 END

