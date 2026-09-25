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

-- VERITYOS ENTRY 6 BEGIN definition Erdos993G1.BranchTreeMaxDegreeLeTwo 26b2403e48349b60ef8c8fc08a7424549c55632ea73cba041b5e40e903089463
namespace Erdos993G1

open Classical in
/-- **The class of Theorem BTP** (run-local, C1-LA5): every branch vertex `v` (`3 ≤ deg v`) has at most
two neighbours `w` from which some branch vertex `z` (`3 ≤ deg z`) is reachable in `G − v`, i.e. by a
walk `w ⇝ z` of `G` whose support avoids `v` (such a `z` is automatically `≠ v`). Equivalently: the
branch tree `B(T)` has maximum degree `≤ 2`. This is the synthesis's branch-direction predicate with
"`(G.induce {v}ᶜ).Reachable ⟨w, _⟩ ⟨z, _⟩` and `z ≠ v`" recorded as "a walk from `w` to `z` in `G`
avoiding `v`". The filter's decidability is classical (it is a `Prop`-valued definition). -/
def BranchTreeMaxDegreeLeTwo {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] : Prop :=
  ∀ v : X, 3 ≤ G.degree v →
    (Finset.univ.filter (fun w => G.Adj v w ∧
      ∃ z : X, 3 ≤ G.degree z ∧ ∃ p : G.Walk w z, v ∉ p.support)).card ≤ 2

end Erdos993G1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.indepCount_eq_card_indepSetFinset 4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac
namespace Erdos993G1

lemma indepCount_eq_card_indepSetFinset {V : Type u} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (k : ℕ) :
    Erdos993G1.indepCount F k = ((F.indepSetFinset k).card : ℤ) := by
  simp only [Erdos993G1.indepCount, Nat.card_eq_fintype_card, Fintype.card_subtype,
    SimpleGraph.indepSetFinset]

end Erdos993G1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.pendant_path_adj_of_pos e0b86a6d6d9ca5bc2aef995d4b27b85b1eba4e6aad52bc2741b7bb4349361787
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
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.pendant_path_adj_consec 34427ac636105b7f12a998c7b91bc7cc80cc95b4a033b024822456e50c7688fe
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
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.pendant_path_adj_mem_range b2a5a0c02fd79a468329b1d2c4b00a407b0681ed629583254f63116462c0a20a
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
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.exists_pendant_shift_perm ace96d1ec54fe794357e36542c01f375e702856d0ec8236da54edf249399b412
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
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.pendant_path_occ_le_of_lt 4087830d9c05849f6065a1b6a2eceec2cb780cac6e9f830d150bca83e64df608
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
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.pendant_path_leaf_dominance 18b1b9c763f30a5819853ab14f0b065322e5478b5ec84ecb1e57b76b5d9d34fd
namespace Erdos993G1

/-- **Pendant-path leaf dominance** (`E993-R28-PENDANT-PATH-LEAF-DOMINANCE`, C1-LA4), graph-general
(no `IsTree`). For a pendant path `u : Fin (m + 2) → X` (injective; consecutive vertices adjacent;
the interior vertices `u 1, …, u m` of degree 2; the end `u (m + 1)` a leaf; `u 0` arbitrary),
every `k` and every position `i`: `c_{u i}(k) ≤ c_{u (m + 1)}(k)`. Not (PW); not stepwise
monotonicity along the path (REFUTED, `S(3,1,1)`, `k = 3`). -/
lemma pendant_path_leaf_dominance {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
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
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.occ_le_card_indepSetFinset 87ad5da837416ec0668d4f6b4777063821dea443fb1382355906e52fc89ddea6
namespace Erdos993G1

lemma occ_le_card_indepSetFinset {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (v : X) (k : ℕ) :
    occ G v k ≤ (G.indepSetFinset k).card :=
  Finset.card_filter_le _ _

end Erdos993G1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.layerCake_subset d139c09ae0164c1ab9edb972e2e1c866b21062be023466c3046afbde26f04112
namespace Erdos993G1

/-- For any finset `s`, any weight `w` and any `ℕ`-valued `f` bounded on `s` by `N`, the
layer-cake identity `Σ_{v∈s} w(v)·f(v) = Σ_{t=1}^{N} Σ_{v∈s, f(v)≥t} w(v)`. This is the general
double-count underlying both `slotsAtLeast` and `leavesAtLeast`; it needs no graph structure. -/
lemma layerCake_subset {X : Type u} [Fintype X] [DecidableEq X] (s : Finset X) (w f : X → ℕ)
    (N : ℕ) (hN : ∀ v ∈ s, f v ≤ N) :
    ∑ v ∈ s, w v * f v
      = ∑ t ∈ Finset.Icc 1 N, ∑ v ∈ s.filter (fun v => t ≤ f v), w v := by
  have step1 : ∀ t ∈ Finset.Icc 1 N, ∑ v ∈ s.filter (fun v => t ≤ f v), w v
      = ∑ v ∈ s, if t ≤ f v then w v else 0 :=
    fun t _ => Finset.sum_filter (fun v => t ≤ f v) w
  rw [Finset.sum_congr rfl step1, Finset.sum_comm]
  refine Finset.sum_congr rfl (fun v hv => ?_)
  have hfv : f v ≤ N := hN v hv
  have step2 : ∀ t ∈ Finset.Icc 1 N,
      (if t ≤ f v then w v else 0) = w v * (if t ≤ f v then 1 else 0) :=
    fun t _ => by by_cases h : t ≤ f v <;> simp [h]
  rw [Finset.sum_congr rfl step2, ← Finset.mul_sum]
  have hcard : ∑ t ∈ Finset.Icc 1 N, (if t ≤ f v then (1 : ℕ) else 0) = f v := by
    rw [Finset.sum_boole]
    have hset : (Finset.Icc 1 N).filter (fun t => t ≤ f v) = Finset.Icc 1 (f v) := by
      ext t
      simp only [Finset.mem_filter, Finset.mem_Icc]
      omega
    rw [hset]
    simp
  rw [hcard]

end Erdos993G1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.sum_branch_slots_eq_sum_slotsAtLeast e5a2b903b0e490509cc5316f1f771c2531f166b894d2602217ca3613342131df
namespace Erdos993G1

/-- `Σ_{v∈Br}(deg v − 2)·c_v(k) = Σ_{t=1}^{N} slotsAtLeast k t`, `N := #I_k(G)`. -/
lemma sum_branch_slots_eq_sum_slotsAtLeast {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) :
    ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), (G.degree v - 2) * occ G v k
      = ∑ t ∈ Finset.Icc 1 (G.indepSetFinset k).card, slotsAtLeast G k t := by
  have hN : ∀ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
      occ G v k ≤ (G.indepSetFinset k).card := fun v _ => occ_le_card_indepSetFinset G v k
  rw [layerCake_subset _ (fun v => G.degree v - 2) (fun v => occ G v k) _ hN]
  refine Finset.sum_congr rfl (fun t _ => ?_)
  unfold slotsAtLeast
  rw [Finset.filter_filter]

end Erdos993G1
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.sum_leaves_eq_sum_leavesAtLeast e4738b113958c21e198961ebfb9f2b86663504db5ff6cd02fb1619b16cb78a96
namespace Erdos993G1

/-- `Σ_L c_ℓ(k) = Σ_{t=1}^{N} leavesAtLeast k t`, `N := #I_k(G)`. -/
lemma sum_leaves_eq_sum_leavesAtLeast {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) :
    ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), occ G v k
      = ∑ t ∈ Finset.Icc 1 (G.indepSetFinset k).card, leavesAtLeast G k t := by
  have hN : ∀ v ∈ Finset.univ.filter (fun v => G.degree v = 1),
      occ G v k ≤ (G.indepSetFinset k).card := fun v _ => occ_le_card_indepSetFinset G v k
  have hlc := layerCake_subset (Finset.univ.filter (fun v => G.degree v = 1))
    (fun _ => 1) (fun v => occ G v k) (G.indepSetFinset k).card hN
  simp only [one_mul] at hlc
  rw [hlc]
  refine Finset.sum_congr rfl (fun t _ => ?_)
  unfold leavesAtLeast
  rw [Finset.filter_filter, Finset.card_eq_sum_ones]

end Erdos993G1
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.indepDegreeSum_eq_sum_degree_mul_occ a45ec9902fa3b8afc4729ff561c0c9d433ebb349645dc080789fc442e2bca959
namespace Erdos993G1

/-- `D_k(G) = Σ_v deg(v)·c_v(k)`: pure double counting, valid for any finite graph
(needs no acyclicity or connectivity). -/
lemma indepDegreeSum_eq_sum_degree_mul_occ {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) :
    indepDegreeSum G k = ∑ v : X, G.degree v * occ G v k := by
  unfold indepDegreeSum
  have hJ : ∀ J ∈ G.indepSetFinset k, ∑ v ∈ J, G.degree v
      = ∑ v : X, if v ∈ J then G.degree v else 0 := by
    intro J _
    have huniv : Finset.univ.filter (fun v => v ∈ J) = J := by
      ext v; simp
    calc ∑ v ∈ J, G.degree v
        = ∑ v ∈ Finset.univ.filter (fun v => v ∈ J), G.degree v := by rw [huniv]
      _ = ∑ v : X, if v ∈ J then G.degree v else 0 := Finset.sum_filter _ _
  rw [Finset.sum_congr rfl hJ, Finset.sum_comm]
  refine Finset.sum_congr rfl (fun v _ => ?_)
  have step : ∀ J ∈ G.indepSetFinset k, (if v ∈ J then G.degree v else 0)
      = G.degree v * (if v ∈ J then 1 else 0) :=
    fun J _ => by by_cases h : v ∈ J <;> simp [h]
  rw [Finset.sum_congr rfl step, ← Finset.mul_sum]
  congr 1
  unfold occ
  rw [Finset.card_filter]

end Erdos993G1
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.sum_occ_eq_card_mul_indepSetFinset e7c6833a89c2b886fe87f31df39efba0835aaededc36730e1f13520abddfaea4
namespace Erdos993G1

/-- `Σ_v c_v(k) = k·i_k(G)`: pure double counting, valid for any finite graph. -/
lemma sum_occ_eq_card_mul_indepSetFinset {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (k : ℕ) :
    ∑ v : X, occ G v k = k * (G.indepSetFinset k).card := by
  have hstep : ∀ v : X, occ G v k = ∑ J ∈ G.indepSetFinset k, if v ∈ J then 1 else 0 := by
    intro v
    unfold occ
    rw [Finset.card_filter]
  rw [Finset.sum_congr rfl (fun v _ => hstep v), Finset.sum_comm]
  have hJ : ∀ J ∈ G.indepSetFinset k, ∑ v : X, (if v ∈ J then (1 : ℕ) else 0) = k := by
    intro J hJmem
    have huniv : Finset.univ.filter (fun v => v ∈ J) = J := by ext v; simp
    have hswap : ∑ v : X, (if v ∈ J then (1 : ℕ) else 0)
        = ∑ v ∈ Finset.univ.filter (fun v => v ∈ J), (1 : ℕ) :=
      (Finset.sum_filter (fun v => v ∈ J) (fun _ => (1 : ℕ))).symm
    rw [hswap, huniv]
    have hcardJ : J.card = k := (SimpleGraph.mem_indepSetFinset_iff.mp hJmem).card_eq
    simpa using hcardJ
  rw [Finset.sum_congr rfl hJ, Finset.sum_const, smul_eq_mul, mul_comm]

end Erdos993G1
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.dominance_implies_degree_lemma eca485740083521846164b57e89193016cdd8b38f75dac577ef3b6e38f2d32dd
namespace Erdos993G1

/-- **(LC), the layer-cake reduction, composed** (key `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA`).
If `slotsAtLeast G k t ≤ leavesAtLeast G k t` for every `t`, then `D_k(G) ≤ 2k·i_k(G)`.
Statement: `SOLUTION-CONTRACT.md` §2, verbatim. Proof: seat U1's tactic block, carried verbatim.
Erratum R28-E-a: on trees the `∀ t` quantifier is harmless (`CriticU1F.tree_forall_t_of_ge_one`);
the proof consumes the hypothesis only at `t ≥ 1` and does not use `hT`.
Fences: an instance-wise implication, not a proof of the degree lemma and not a second proof of
it; its hypothesis fails at `(T22, 11)` and `(T22, 12)`; no composition with the refuted (HS). -/
lemma dominance_implies_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ)
    (h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k := by
  -- summed (HS): Σ_{Br}(deg−2)c_v ≤ Σ_L c_v, in ℕ
  have hsumHS : ∑ t ∈ Finset.Icc 1 (G.indepSetFinset k).card, slotsAtLeast G k t
      ≤ ∑ t ∈ Finset.Icc 1 (G.indepSetFinset k).card, leavesAtLeast G k t :=
    Finset.sum_le_sum (fun t _ => h t)
  have hBr := sum_branch_slots_eq_sum_slotsAtLeast G k
  have hLf := sum_leaves_eq_sum_leavesAtLeast G k
  have hAgg : ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), (G.degree v - 2) * occ G v k
      ≤ ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), occ G v k := by
    rw [hBr, hLf]; exact hsumHS
  -- cast the aggregate (HS) bound to ℤ, with the ℕ-subtraction discharged on `Br`
  have hAggZ : ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
        ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
      ≤ ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ) := by
    have hLHS : ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
          ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
        = ((∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
              (G.degree v - 2) * occ G v k : ℕ) : ℤ) := by
      rw [Nat.cast_sum]
      refine Finset.sum_congr rfl (fun v hv => ?_)
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv
      rw [Nat.cast_mul, Nat.cast_sub (show 2 ≤ G.degree v by omega)]
      norm_num
    have hRHS : ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ)
        = ((∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), occ G v k : ℕ) : ℤ) := by
      rw [Nat.cast_sum]
    rw [hLHS, hRHS]
    exact_mod_cast hAgg
  -- the two double counts, cast to ℤ
  have hD : (indepDegreeSum G k : ℤ) = ∑ v : X, (G.degree v : ℤ) * (occ G v k : ℤ) := by
    have := indepDegreeSum_eq_sum_degree_mul_occ G k
    have hZ : (indepDegreeSum G k : ℤ) = ((∑ v : X, G.degree v * occ G v k : ℕ) : ℤ) := by
      rw [this]
    rw [hZ]; push_cast; ring_nf
  have hIC : indepCount G k = ((G.indepSetFinset k).card : ℤ) :=
    indepCount_eq_card_indepSetFinset G k
  have hSumOcc : ∑ v : X, occ G v k = k * (G.indepSetFinset k).card :=
    sum_occ_eq_card_mul_indepSetFinset G k
  have hSumOccZ : ∑ v : X, (occ G v k : ℤ) = (k : ℤ) * (G.indepSetFinset k).card := by
    have : ((∑ v : X, occ G v k : ℕ) : ℤ) = ((k * (G.indepSetFinset k).card : ℕ) : ℤ) := by
      rw [hSumOcc]
    push_cast at this; linarith
  -- split univ into the leaf/branch pieces and everything else (deg ∈ {0,2}), the latter
  -- contributing a manifestly nonnegative term
  have hSplit : ∑ v : X, (G.degree v : ℤ) * (occ G v k : ℤ)
      ≤ 2 * ∑ v : X, (occ G v k : ℤ)
        - (∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ)
           - ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
               ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)) := by
    -- rewrite the target as `0 ≤ Σ_v (2 − deg v) c_v(k)` restricted to leaf ∪ branch,
    -- plus the nonnegative leftover on the complement
    set A : Finset X := Finset.univ.filter (fun v => G.degree v = 1) with hA
    set B : Finset X := Finset.univ.filter (fun v => 3 ≤ G.degree v) with hB
    have hDisj : Disjoint A B := by
      rw [hA, hB, Finset.disjoint_filter]
      intro x _ hx1 hx3
      omega
    have hSubset : A ∪ B ⊆ (Finset.univ : Finset X) := Finset.subset_univ _
    have hNonneg : ∀ v ∈ (Finset.univ : Finset X), v ∉ A ∪ B →
        0 ≤ (2 - (G.degree v : ℤ)) * (occ G v k : ℤ) := by
      intro v _ hv
      simp only [Finset.mem_union, hA, hB, Finset.mem_filter, Finset.mem_univ, true_and] at hv
      have hdeg2 : G.degree v ≤ 2 := by omega
      have h1 : (0 : ℤ) ≤ 2 - (G.degree v : ℤ) := by
        have : (G.degree v : ℤ) ≤ 2 := by exact_mod_cast hdeg2
        linarith
      have h2 : (0 : ℤ) ≤ (occ G v k : ℤ) := by positivity
      exact mul_nonneg h1 h2
    have hkey : ∑ v ∈ A ∪ B, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ)
        ≤ ∑ v : X, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ) :=
      Finset.sum_le_sum_of_subset_of_nonneg hSubset hNonneg
    have hunion : ∑ v ∈ A ∪ B, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ)
        = ∑ v ∈ A, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ)
          + ∑ v ∈ B, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ) :=
      Finset.sum_union hDisj
    have hAval : ∑ v ∈ A, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ)
        = ∑ v ∈ A, (occ G v k : ℤ) := by
      refine Finset.sum_congr rfl (fun v hv => ?_)
      simp only [hA, Finset.mem_filter, Finset.mem_univ, true_and] at hv
      rw [hv]; ring
    have hBcancel : ∑ v ∈ B, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ)
        + ∑ v ∈ B, ((G.degree v : ℤ) - 2) * (occ G v k : ℤ) = 0 := by
      rw [← Finset.sum_add_distrib]
      have hzero : ∀ v ∈ B, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ)
          + ((G.degree v : ℤ) - 2) * (occ G v k : ℤ) = 0 := fun v _ => by ring
      rw [Finset.sum_congr rfl hzero, Finset.sum_const_zero]
    have heq : ∑ v ∈ A, (occ G v k : ℤ) - ∑ v ∈ B, ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
        = ∑ v ∈ A ∪ B, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ) := by
      linarith [hunion, hAval, hBcancel]
    have hfin : ∑ v ∈ A, (occ G v k : ℤ) - ∑ v ∈ B, ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
        ≤ ∑ v : X, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ) := by
      rw [heq]; exact hkey
    have hexpand : ∑ v : X, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ)
        = 2 * ∑ v : X, (occ G v k : ℤ) - ∑ v : X, (G.degree v : ℤ) * (occ G v k : ℤ) := by
      rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
      refine Finset.sum_congr rfl (fun v _ => ?_)
      ring
    linarith [hfin, hexpand]
  -- assemble
  have hfinal : (indepDegreeSum G k : ℤ) ≤ 2 * (k : ℤ) * (G.indepSetFinset k).card := by
    rw [hD]
    nlinarith [hSplit, hAggZ, hSumOccZ]
  rw [hIC]
  linarith [hfinal]

end Erdos993G1
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.walk_avoiding_iff_induce_reachable 304e0ff3c8a852f5b9094bce2e0e43145b0564cb7a84b4851fc1f4fd7a4298bb
namespace Erdos993G1

/-- **Reachability in `G − v`, two readings** (re-derived in-run, C1-LA5; fidelity companion for
`BranchTreeMaxDegreeLeTwo`). For `w, z ≠ v`: a walk of `G` from `w` to `z` whose support avoids `v`
exists iff `z` is reachable from `w` in the induced graph `G.induce {v}ᶜ`. -/
lemma walk_avoiding_iff_induce_reachable {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (v w z : X) (hw : w ≠ v) (hz : z ≠ v) :
    (∃ p : G.Walk w z, v ∉ p.support) ↔
      (G.induce {v}ᶜ).Reachable ⟨w, Set.mem_compl_singleton_iff.mpr hw⟩
        ⟨z, Set.mem_compl_singleton_iff.mpr hz⟩ := by
  constructor
  · rintro ⟨p, hp⟩
    induction p with
    | nil => exact SimpleGraph.Reachable.refl _
    | @cons a b c h p ih =>
      simp only [SimpleGraph.Walk.support_cons, List.mem_cons, not_or] at hp
      have hb : b ≠ v := fun e => hp.2 (e ▸ p.start_mem_support)
      have hadj : (G.induce {v}ᶜ).Adj ⟨a, Set.mem_compl_singleton_iff.mpr hw⟩
          ⟨b, Set.mem_compl_singleton_iff.mpr hb⟩ := h
      exact hadj.reachable.trans (ih hb hz hp.2)
  · rintro ⟨q⟩
    refine ⟨(q.map (SimpleGraph.Embedding.induce {v}ᶜ).toHom).copy rfl rfl, ?_⟩
    rw [SimpleGraph.Walk.support_copy, SimpleGraph.Walk.support_map, List.mem_map]
    rintro ⟨x, -, hx⟩
    exact x.2 hx

end Erdos993G1
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.branchTreeMaxDegreeLeTwo_iff_induce 163f13bad71cb0ea57c8a3cc71fe6e2e217a04e3783c51a9c00888eed3a66519
namespace Erdos993G1

open Classical in
/-- **The class predicate in the synthesis's induced-subgraph wording** (re-derived in-run, C1-LA5;
fidelity companion). `BranchTreeMaxDegreeLeTwo G` holds iff every branch vertex `v` has at most two
neighbours `w` for which some `z` with `3 ≤ deg z`, `z ≠ v`, is reachable from `w` in
`G.induce {v}ᶜ` (the membership proofs `w ∈ {v}ᶜ`, `z ∈ {v}ᶜ` are built from the displayed `w ≠ v`, `z ≠ v` by
`Set.mem_compl_singleton_iff`). -/
lemma branchTreeMaxDegreeLeTwo_iff_induce {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] :
    BranchTreeMaxDegreeLeTwo G ↔ ∀ v : X, 3 ≤ G.degree v →
      (Finset.univ.filter (fun w => G.Adj v w ∧ ∃ z : X, 3 ≤ G.degree z ∧
        ∃ (hw : w ≠ v) (hz : z ≠ v),
          (G.induce {v}ᶜ).Reachable ⟨w, Set.mem_compl_singleton_iff.mpr hw⟩
            ⟨z, Set.mem_compl_singleton_iff.mpr hz⟩)).card ≤ 2 := by
  have key : ∀ v w : X, (G.Adj v w ∧ ∃ z : X, 3 ≤ G.degree z ∧ ∃ p : G.Walk w z, v ∉ p.support) ↔
      (G.Adj v w ∧ ∃ z : X, 3 ≤ G.degree z ∧
        ∃ (hw : w ≠ v) (hz : z ≠ v),
          (G.induce {v}ᶜ).Reachable ⟨w, Set.mem_compl_singleton_iff.mpr hw⟩
            ⟨z, Set.mem_compl_singleton_iff.mpr hz⟩) := by
    intro v w
    constructor
    · rintro ⟨hvw, z, hz3, p, hp⟩
      have hzv : z ≠ v := fun e => hp (e ▸ p.end_mem_support)
      exact ⟨hvw, z, hz3, hvw.ne.symm, hzv,
        (walk_avoiding_iff_induce_reachable G v w z hvw.ne.symm hzv).mp ⟨p, hp⟩⟩
    · rintro ⟨hvw, z, hz3, hw, hzv, hr⟩
      exact ⟨hvw, z, hz3, (walk_avoiding_iff_induce_reachable G v w z hw hzv).mpr hr⟩
  unfold BranchTreeMaxDegreeLeTwo
  refine forall_congr' (fun v => imp_congr_right (fun _ => ?_))
  rw [Finset.filter_congr (fun w _ => key v w)]

end Erdos993G1
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.pendant_chain_back_eq 15e6a0f61881d7c57ba45aa789895062865d33fabf62f43a9ab06d102bdc3797
namespace Erdos993G1

/-- **Backward uniqueness of pendant chains** (re-derived in-run, C1-LA5). Two ℕ-indexed pendant
chains `f 0, …, f a` and `g 0, …, g b` (`a, b ≥ 1`; each injective on its index range; consecutive
vertices adjacent; interior vertices of degree 2) that end at the same leaf agree when read backwards
from the leaf, for as long as both last. Only the degree pattern is used (no acyclicity, no
connectivity): a leaf has one neighbour, and a degree-2 vertex has exactly the two chain neighbours. -/
lemma pendant_chain_back_eq {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (f g : ℕ → X) (a b : ℕ)
    (hfinj : Set.InjOn f {i | i ≤ a}) (hginj : Set.InjOn g {i | i ≤ b})
    (hfadj : ∀ i, i < a → G.Adj (f i) (f (i + 1)))
    (hgadj : ∀ i, i < b → G.Adj (g i) (g (i + 1)))
    (hfdeg : ∀ i, 0 < i → i < a → G.degree (f i) = 2)
    (hend : f a = g b) (hleaf : G.degree (f a) = 1) :
    ∀ j, j ≤ min a b → f (a - j) = g (b - j) ∧ (0 < j → f (a - j + 1) = g (b - j + 1)) := by
  intro j
  induction j with
  | zero =>
    intro _
    refine ⟨by simpa using hend, fun h => absurd h (lt_irrefl 0)⟩
  | succ j ih =>
    intro hj
    have hja : j + 1 ≤ a := le_trans hj (min_le_left a b)
    have hjb : j + 1 ≤ b := le_trans hj (min_le_right a b)
    obtain ⟨h0, h1⟩ := ih (by omega)
    have ea : a - (j + 1) + 1 = a - j := by omega
    have eb : b - (j + 1) + 1 = b - j := by omega
    refine ⟨?_, fun _ => by rw [ea, eb]; exact h0⟩
    -- `x := f (a - j) = g (b - j)`; its chain predecessors `f (a - j - 1)` and `g (b - j - 1)`
    have hfp : G.Adj (f (a - j)) (f (a - (j + 1))) := by
      have h := hfadj (a - (j + 1)) (by omega)
      rw [ea] at h
      exact h.symm
    have hgp : G.Adj (f (a - j)) (g (b - (j + 1))) := by
      have h := hgadj (b - (j + 1)) (by omega)
      rw [eb] at h
      rw [h0]
      exact h.symm
    rcases Nat.eq_zero_or_pos j with rfl | hjpos
    · -- `x` is the leaf: its only neighbour is the common predecessor
      have hcard : (G.neighborFinset (f (a - 0))).card ≤ 1 := by
        rw [SimpleGraph.card_neighborFinset_eq_degree, Nat.sub_zero, hleaf]
      exact Finset.card_le_one.mp hcard _ ((G.mem_neighborFinset _ _).mpr hfp) _
        ((G.mem_neighborFinset _ _).mpr hgp)
    · -- `x` is interior (degree 2) with chain neighbours `f (a - j - 1)` and `f (a - j + 1)`
      have hfs : G.Adj (f (a - j)) (f (a - j + 1)) := hfadj (a - j) (by omega)
      have hne : f (a - (j + 1)) ≠ f (a - j + 1) := by
        intro h
        have := hfinj (show a - (j + 1) ∈ {i | i ≤ a} by simp only [Set.mem_setOf_eq]; omega)
          (show a - j + 1 ∈ {i | i ≤ a} by simp only [Set.mem_setOf_eq]; omega) h
        omega
      have hsub : ({f (a - (j + 1)), f (a - j + 1)} : Finset X) ⊆ G.neighborFinset (f (a - j)) := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rw [SimpleGraph.mem_neighborFinset]
        rcases hz with rfl | rfl
        · exact hfp
        · exact hfs
      have hcard : (G.neighborFinset (f (a - j))).card
          ≤ ({f (a - (j + 1)), f (a - j + 1)} : Finset X).card := by
        rw [SimpleGraph.card_neighborFinset_eq_degree, hfdeg (a - j) (by omega) (by omega),
          Finset.card_pair hne]
      have heq := Finset.eq_of_subset_of_card_le hsub hcard
      have hmem : g (b - (j + 1)) ∈ G.neighborFinset (f (a - j)) :=
        (G.mem_neighborFinset _ _).mpr hgp
      rw [← heq] at hmem
      simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
      rcases hmem with h | h
      · exact h.symm
      · exfalso
        rw [h1 hjpos] at h
        have := hginj (show b - (j + 1) ∈ {i | i ≤ b} by simp only [Set.mem_setOf_eq]; omega)
          (show b - j + 1 ∈ {i | i ≤ b} by simp only [Set.mem_setOf_eq]; omega) h
        omega

end Erdos993G1
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.pendant_chain_eq 8575ed267696d1ec5b0d934325b5edb57426398cc6dd3e154efd07d545f812e3
namespace Erdos993G1

/-- **Anchor uniqueness** (re-derived in-run, C1-LA5; SR-BTP (F2)). Two pendant chains that end at the
same leaf and both start at branch vertices (`3 ≤ deg`) are the same chain: equal lengths and equal
vertices. In particular the anchors agree (`f 0 = g 0`) and so do the first steps (`f 1 = g 1`). -/
lemma pendant_chain_eq {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (f g : ℕ → X) (a b : ℕ) (ha : 1 ≤ a) (hb : 1 ≤ b)
    (hfinj : Set.InjOn f {i | i ≤ a}) (hginj : Set.InjOn g {i | i ≤ b})
    (hfadj : ∀ i, i < a → G.Adj (f i) (f (i + 1)))
    (hgadj : ∀ i, i < b → G.Adj (g i) (g (i + 1)))
    (hfdeg : ∀ i, 0 < i → i < a → G.degree (f i) = 2)
    (hgdeg : ∀ i, 0 < i → i < b → G.degree (g i) = 2)
    (hend : f a = g b) (hleaf : G.degree (f a) = 1)
    (hf0 : 3 ≤ G.degree (f 0)) (hg0 : 3 ≤ G.degree (g 0)) :
    a = b ∧ ∀ i, i ≤ a → f i = g i := by
  have hfg := pendant_chain_back_eq G f g a b hfinj hginj hfadj hgadj hfdeg hend hleaf
  have hgf := pendant_chain_back_eq G g f b a hginj hfinj hgadj hfadj hgdeg hend.symm
    (by rw [← hend]; exact hleaf)
  have hab : a = b := by
    rcases le_total a b with h | h
    · have e := (hfg a (by omega)).1
      rw [Nat.sub_self] at e
      by_contra hne
      have hd := hgdeg (b - a) (by omega) (by omega)
      rw [← e] at hd
      omega
    · have e := (hgf b (by omega)).1
      rw [Nat.sub_self] at e
      by_contra hne
      have hd := hfdeg (a - b) (by omega) (by omega)
      rw [← e] at hd
      omega
  subst hab
  refine ⟨rfl, fun i hi => ?_⟩
  have e := (hfg (a - i) (by omega)).1
  rwa [Nat.sub_sub_self hi] at e

end Erdos993G1
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.exists_pendant_chain 397946c9f2d5a26ecce566f54e467daef2c0db4223927a0c145450f5e3e2a5a4
namespace Erdos993G1

/-- **A pendant direction ends at an own leaf** (re-derived in-run, C1-LA5; SR-BTP (F1)). In an acyclic
finite graph, let `v – w` be an edge such that no vertex of degree `≥ 3` is reachable from `w` by a walk
avoiding `v`. Then there is a pendant chain `v = f 0, w = f 1, …, f (m + 1)`: injective on its index
range, consecutive vertices adjacent, interior vertices of degree 2, ending at a leaf. Proof: take a
longest path from `w` avoiding `v`; its end has degree `≤ 2` (hypothesis), is not isolated, and cannot
have a second neighbour — one on the path would close a cycle (`IsAcyclic.eq_penultimate_of_adj_end`),
one off the path would extend it. Interior vertices have the two path neighbours and degree `≤ 2`. -/
lemma exists_pendant_chain {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (v w : X) (hvw : G.Adj v w)
    (hno : ∀ z : X, 3 ≤ G.degree z → ∀ p : G.Walk w z, v ∈ p.support) :
    ∃ (m : ℕ) (f : ℕ → X), f 0 = v ∧ f 1 = w ∧ Set.InjOn f {i | i ≤ m + 1} ∧
      (∀ i, i < m + 1 → G.Adj (f i) (f (i + 1))) ∧
      (∀ i, 0 < i → i < m + 1 → G.degree (f i) = 2) ∧ G.degree (f (m + 1)) = 1 := by
  classical
  let P : ℕ → Prop := fun n =>
    ∃ (ℓ : X) (q : G.Walk w ℓ), q.IsPath ∧ v ∉ q.support ∧ q.length = n
  have hP0 : P 0 := ⟨w, SimpleGraph.Walk.nil, SimpleGraph.Walk.IsPath.nil, by
    simp only [SimpleGraph.Walk.support_nil, List.mem_singleton]
    exact hvw.ne, rfl⟩
  have hbound : ∀ n, P n → n < Fintype.card X := by
    rintro n ⟨ℓ, q, hq, -, rfl⟩
    exact hq.length_lt
  let N := Nat.findGreatest P (Fintype.card X)
  have hPN : P N := Nat.findGreatest_spec (Nat.zero_le _) hP0
  have hmax : ¬ P (N + 1) := by
    intro h
    have hlt := hbound _ h
    exact Nat.findGreatest_is_greatest (Nat.lt_succ_self N) (by omega) h
  obtain ⟨ℓ, q, hq, hvq, hlen⟩ := hPN
  -- every vertex of `q` has degree `< 3`
  have hsmall : ∀ x ∈ q.support, G.degree x < 3 := by
    intro x hx
    by_contra hge
    exact hvq (q.support_takeUntil_subset_support hx (hno x (by omega) (q.takeUntil x hx)))
  let Q : G.Walk v ℓ := SimpleGraph.Walk.cons hvw q
  have hQ : Q.IsPath := hq.cons hvq
  have hQlen : Q.length = N + 1 := by
    simp only [Q, SimpleGraph.Walk.length_cons, hlen]
  have hQnil : ¬ Q.Nil := SimpleGraph.Walk.not_nil_cons
  -- the end `ℓ` is a leaf
  have hℓ : G.degree ℓ = 1 := by
    have hle : G.degree ℓ < 3 := hsmall ℓ q.end_mem_support
    have hpen : G.Adj Q.penultimate ℓ := SimpleGraph.Walk.adj_penultimate hQnil
    have hpos : 0 < G.degree ℓ := by
      rw [← SimpleGraph.card_neighborFinset_eq_degree]
      exact Finset.card_pos.mpr ⟨Q.penultimate, (G.mem_neighborFinset _ _).mpr hpen.symm⟩
    by_contra hne
    have h2 : 1 < (G.neighborFinset ℓ).card := by
      rw [SimpleGraph.card_neighborFinset_eq_degree]
      omega
    obtain ⟨x, hx, hxne⟩ := Finset.exists_mem_ne h2 Q.penultimate
    have hℓx : G.Adj ℓ x := (G.mem_neighborFinset _ _).mp hx
    by_cases hxQ : x ∈ Q.support
    · exact hxne (hG.eq_penultimate_of_adj_end hQ hℓx hxQ)
    · have hxQ' : x ∉ q.support := fun h => hxQ (by
        simp only [Q, SimpleGraph.Walk.support_cons, List.mem_cons]
        exact Or.inr h)
      have hxv : x ≠ v := fun h => hxQ (by
        rw [h]
        exact Q.start_mem_support)
      apply hmax
      refine ⟨x, q.concat hℓx, hq.concat hxQ' hℓx, ?_, ?_⟩
      · rw [SimpleGraph.Walk.support_concat, List.mem_append, List.mem_singleton]
        rintro (h | h)
        · exact hvq h
        · exact hxv h.symm
      · rw [SimpleGraph.Walk.length_concat, hlen]
  refine ⟨N, Q.getVert, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact SimpleGraph.Walk.getVert_zero Q
  · simp only [Q, SimpleGraph.Walk.getVert_cons_succ, SimpleGraph.Walk.getVert_zero]
  · rw [← hQlen]
    exact hQ.getVert_injOn
  · intro i hi
    exact Q.adj_getVert_succ (by omega)
  · intro i hi0 hi
    have hmem : Q.getVert i ∈ q.support := by
      obtain ⟨j, rfl⟩ : ∃ j, i = j + 1 := ⟨i - 1, by omega⟩
      simp only [Q, SimpleGraph.Walk.getVert_cons_succ]
      exact q.getVert_mem_support j
    have hlt := hsmall _ hmem
    have hA : G.Adj (Q.getVert (i - 1)) (Q.getVert i) := by
      have h := Q.adj_getVert_succ (i := i - 1) (by omega)
      rwa [show i - 1 + 1 = i by omega] at h
    have hB : G.Adj (Q.getVert i) (Q.getVert (i + 1)) := Q.adj_getVert_succ (by omega)
    have hne : Q.getVert (i - 1) ≠ Q.getVert (i + 1) := by
      intro h
      have := hQ.getVert_injOn (show i - 1 ∈ {j | j ≤ Q.length} by
        simp only [Set.mem_setOf_eq]; omega)
        (show i + 1 ∈ {j | j ≤ Q.length} by simp only [Set.mem_setOf_eq]; omega) h
      omega
    have hsub : ({Q.getVert (i - 1), Q.getVert (i + 1)} : Finset X)
        ⊆ G.neighborFinset (Q.getVert i) := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rw [SimpleGraph.mem_neighborFinset]
      rcases hz with rfl | rfl
      · exact hA.symm
      · exact hB
    have h2 := Finset.card_le_card hsub
    rw [Finset.card_pair hne, SimpleGraph.card_neighborFinset_eq_degree] at h2
    omega
  · rw [← hQlen, SimpleGraph.Walk.getVert_length]
    exact hℓ

end Erdos993G1
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma Erdos993G1.pendant_chain_occ_le 3b54c010b24850317519c59ff79f1f973090eaa94d072c435b87cb01682188aa
namespace Erdos993G1

/-- **Anchor dominance along an ℕ-indexed pendant chain** (re-derived in-run, C1-LA5): the carried
C1-LA4 lemma `pendant_path_leaf_dominance` at position `0`, applied to the `Fin (m + 2)`-indexed
restriction `i ↦ f i` of the chain. For every `k`: `c_{f 0}(k) ≤ c_{f (m + 1)}(k)`. -/
lemma pendant_chain_occ_le {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (m : ℕ) (f : ℕ → X) (hinj : Set.InjOn f {i | i ≤ m + 1})
    (hadj : ∀ i, i < m + 1 → G.Adj (f i) (f (i + 1)))
    (hdeg2 : ∀ i, 0 < i → i < m + 1 → G.degree (f i) = 2)
    (hleaf : G.degree (f (m + 1)) = 1) (k : ℕ) :
    occ G (f 0) k ≤ occ G (f (m + 1)) k := by
  have h := pendant_path_leaf_dominance G m (fun i : Fin (m + 2) => f i.val)
    (fun a b hab => Fin.ext (hinj (show a.val ∈ {i | i ≤ m + 1} by
        simp only [Set.mem_setOf_eq]; omega)
      (show b.val ∈ {i | i ≤ m + 1} by simp only [Set.mem_setOf_eq]; omega) hab))
    (fun i => by
      simp only [Fin.val_castSucc, Fin.val_succ]
      exact hadj i.val i.isLt)
    (fun i hi0 hi => hdeg2 i.val hi0 hi)
    hleaf k 0
  simpa only [Fin.val_zero, Fin.val_last] using h

end Erdos993G1
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma Erdos993G1.exists_own_leaves f108e5e571a2a5fc476ae8fc4da48d33ed5f76ab6212fa3830d53898f40ee3d3
namespace Erdos993G1

/-- **Own pendant leaves of a branch vertex** (re-derived in-run, C1-LA5; SR-BTP (F1)). On a tree in
the class `BranchTreeMaxDegreeLeTwo`, every branch vertex `v` (`3 ≤ deg v`) has a set `O` of at least
`deg v − 2` leaves, each the end of a pendant chain anchored at `v`. Proof: at most two neighbours of
`v` are internal directions (the class hypothesis); every other neighbour `w` is a pendant direction
and yields a pendant chain through `w` ending at a leaf (`exists_pendant_chain`, acyclicity); distinct
pendant directions end at distinct leaves (`pendant_chain_eq`, first steps agree). The subtraction
`deg v − 2` is truncated ℕ-subtraction, exact here because `3 ≤ deg v`. -/
lemma exists_own_leaves {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (hB : BranchTreeMaxDegreeLeTwo G) (v : X)
    (hv : 3 ≤ G.degree v) :
    ∃ O : Finset X, G.degree v - 2 ≤ O.card ∧ ∀ ℓ ∈ O, ∃ (m : ℕ) (f : ℕ → X),
      f 0 = v ∧ f (m + 1) = ℓ ∧ Set.InjOn f {i | i ≤ m + 1} ∧
      (∀ i, i < m + 1 → G.Adj (f i) (f (i + 1))) ∧
      (∀ i, 0 < i → i < m + 1 → G.degree (f i) = 2) ∧ G.degree (f (m + 1)) = 1 := by
  classical
  let I : X → Prop := fun w => ∃ z : X, 3 ≤ G.degree z ∧ ∃ p : G.Walk w z, v ∉ p.support
  let Nb := G.neighborFinset v
  let Int := Nb.filter I
  let Pend := Nb.filter (fun w => ¬ I w)
  have hInt : Int.card ≤ 2 := by
    refine le_trans (Finset.card_le_card ?_) (hB v hv)
    intro w hw
    simp only [Int, Nb, Finset.mem_filter, SimpleGraph.mem_neighborFinset] at hw
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    exact ⟨hw.1, hw.2⟩
  have hsplit : Int.card + Pend.card = G.degree v := by
    rw [← SimpleGraph.card_neighborFinset_eq_degree]
    exact Finset.card_filter_add_card_filter_not I
  have hPend : G.degree v - 2 ≤ Pend.card := by omega
  have hex : ∀ w : X, ∃ ℓ : X, w ∈ Pend → ∃ (m : ℕ) (f : ℕ → X),
      f 0 = v ∧ f 1 = w ∧ f (m + 1) = ℓ ∧ Set.InjOn f {i | i ≤ m + 1} ∧
      (∀ i, i < m + 1 → G.Adj (f i) (f (i + 1))) ∧
      (∀ i, 0 < i → i < m + 1 → G.degree (f i) = 2) ∧ G.degree (f (m + 1)) = 1 := by
    intro w
    by_cases hw : w ∈ Pend
    · simp only [Pend, Nb, Finset.mem_filter, SimpleGraph.mem_neighborFinset] at hw
      have hno : ∀ z : X, 3 ≤ G.degree z → ∀ p : G.Walk w z, v ∈ p.support := by
        intro z hz p
        by_contra hp
        exact hw.2 ⟨z, hz, p, hp⟩
      obtain ⟨m, f, h0, h1, hinj, hadj, hdeg, hleaf⟩ :=
        exists_pendant_chain G hT.isAcyclic v w hw.1 hno
      exact ⟨f (m + 1), fun _ => ⟨m, f, h0, h1, rfl, hinj, hadj, hdeg, hleaf⟩⟩
    · exact ⟨v, fun h => absurd h hw⟩
  choose L hL using hex
  refine ⟨Pend.image L, ?_, ?_⟩
  · rw [Finset.card_image_of_injOn]
    · exact hPend
    · intro w hw w' hw' hww'
      obtain ⟨m, f, h0, h1, hℓ, hinj, hadj, hdeg, hleaf⟩ := hL w hw
      obtain ⟨m', g, g0, g1, gℓ, ginj, gadj, gdeg, gleaf⟩ := hL w' hw'
      have hend : f (m + 1) = g (m' + 1) := by rw [hℓ, gℓ]; exact hww'
      have := (pendant_chain_eq G f g (m + 1) (m' + 1) (by omega) (by omega) hinj ginj hadj gadj
        hdeg gdeg hend hleaf (by rw [h0]; exact hv) (by rw [g0]; exact hv)).2 1 (by omega)
      rw [h1, g1] at this
      exact this
  · intro ℓ hℓ
    obtain ⟨w, hw, rfl⟩ := Finset.mem_image.mp hℓ
    obtain ⟨m, f, h0, -, hℓ', hinj, hadj, hdeg, hleaf⟩ := hL w hw
    exact ⟨m, f, h0, hℓ', hinj, hadj, hdeg, hleaf⟩

end Erdos993G1
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma Erdos993G1.btp_sdr_exists bdacefe9ec5521713c4d89f37a9f75815a0a330ceaba0e1209838cdf0abf92b5
namespace Erdos993G1

/-- **The own-leaf SDR** (re-derived in-run, C1-LA5; SR-BTP BT-1, the explicit injection). On a tree in
the class `BranchTreeMaxDegreeLeTwo`, for every `k` there is an injection `f` from the slots
`Σ v : {v // 3 ≤ deg v}, Fin (deg v − 2)` (C1-LA3's `Slot G`, written out) into the vertex type that
sends every slot to a leaf dominating its branch vertex: `deg (f s) = 1` and `c_v(k) ≤ c_{f s}(k)`.
The slots of `v` go to distinct own leaves of `v` (`exists_own_leaves`); own-leaf sets of distinct
branch vertices are disjoint (`pendant_chain_eq`, anchors agree); dominance is the carried C1-LA4
pendant-path lemma at the anchor (`pendant_chain_occ_le`). No Hall, no slot count, no surplus
identity. -/
lemma btp_sdr_exists {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (hB : BranchTreeMaxDegreeLeTwo G) (k : ℕ) :
    ∃ f : (Σ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2)) → X,
      Function.Injective f ∧ ∀ s, G.degree (f s) = 1 ∧ occ G s.1.1 k ≤ occ G (f s) k := by
  classical
  have hD := fun v : {v : X // 3 ≤ G.degree v} => exists_own_leaves G hT hB v.1 v.2
  choose O hOcard hOchain using hD
  have hemb : ∀ v : {v : X // 3 ≤ G.degree v}, Nonempty (Fin (G.degree v.1 - 2) ↪ O v) := by
    intro v
    apply Function.Embedding.nonempty_of_card_le
    rw [Fintype.card_fin, Fintype.card_coe]
    exact hOcard v
  let e : ∀ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2) ↪ O v :=
    fun v => Classical.choice (hemb v)
  refine ⟨fun s => (e s.1 s.2).1, ?_, ?_⟩
  · rintro ⟨v, j⟩ ⟨v', j'⟩ h
    simp only at h
    have hvv : v = v' := by
      obtain ⟨m, f, h0, hℓ, hinj, hadj, hdeg, hleaf⟩ := hOchain v _ (e v j).2
      obtain ⟨m', g, g0, gℓ, ginj, gadj, gdeg, gleaf⟩ := hOchain v' _ (e v' j').2
      have hend : f (m + 1) = g (m' + 1) := by rw [hℓ, gℓ]; exact h
      have := (pendant_chain_eq G f g (m + 1) (m' + 1) (by omega) (by omega) hinj ginj hadj gadj
        hdeg gdeg hend hleaf (by rw [h0]; exact v.2) (by rw [g0]; exact v'.2)).2 0 (by omega)
      rw [h0, g0] at this
      exact Subtype.ext this
    subst hvv
    have hj : j = j' := (e v).injective (Subtype.ext h)
    subst hj
    rfl
  · rintro ⟨v, j⟩
    obtain ⟨m, f, h0, hℓ, hinj, hadj, hdeg, hleaf⟩ := hOchain v _ (e v j).2
    have hocc := pendant_chain_occ_le G m f hinj hadj hdeg hleaf k
    rw [hℓ] at hleaf hocc
    rw [h0] at hocc
    exact ⟨hleaf, hocc⟩

end Erdos993G1
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma Erdos993G1.threshold_of_sdr f8065726c3be91f035ec8df461b6058adfb0dd8b3c747904c8976453f679b732
namespace Erdos993G1

/-- **An SDR gives the threshold form at every `t`** (re-derived in-run, C1-LA5; the direct counting
direction of the SDR/threshold equivalence, graph-general). If `f` injects the slots
`Σ v : {v // 3 ≤ deg v}, Fin (deg v − 2)` into the leaves with `c_v(k) ≤ c_{f s}(k)`, then for every
`t : ℕ` (including `t = 0`): `slotsAtLeast G k t ≤ leavesAtLeast G k t`. The slots whose branch vertex
has `c_v(k) ≥ t` number exactly `slotsAtLeast G k t`, and `f` maps them injectively into the leaves
with `c_ℓ(k) ≥ t`. No Hall, no tree hypothesis. -/
lemma threshold_of_sdr {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (k : ℕ)
    (f : (Σ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2)) → X)
    (hf : Function.Injective f) (hfl : ∀ s, G.degree (f s) = 1 ∧ occ G s.1.1 k ≤ occ G (f s) k)
    (t : ℕ) :
    slotsAtLeast G k t ≤ leavesAtLeast G k t := by
  classical
  let A := Finset.univ.filter
    (fun s : (Σ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2)) => t ≤ occ G s.1.1 k)
  have hA : A.card = slotsAtLeast G k t := by
    have h1 : A.card = ∑ s : (Σ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2)),
        (if t ≤ occ G s.1.1 k then 1 else 0) := Finset.card_filter _ _
    have h2 : ∑ s : (Σ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2)),
          (if t ≤ occ G s.1.1 k then 1 else 0)
        = ∑ v : {v : X // 3 ≤ G.degree v}, ∑ _j : Fin (G.degree v.1 - 2),
          (if t ≤ occ G v.1 k then 1 else 0) :=
      Fintype.sum_sigma (fun s : (Σ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2)) =>
        if t ≤ occ G s.1.1 k then 1 else 0)
    have h3 : ∀ v : {v : X // 3 ≤ G.degree v}, ∑ _j : Fin (G.degree v.1 - 2),
        (if t ≤ occ G v.1 k then 1 else 0)
          = if t ≤ occ G v.1 k then G.degree v.1 - 2 else 0 := by
      intro v
      by_cases ht : t ≤ occ G v.1 k <;> simp [ht]
    have h4 : ∑ v : {v : X // 3 ≤ G.degree v}, (if t ≤ occ G v.1 k then G.degree v.1 - 2 else 0)
        = ∑ v ∈ Finset.univ.filter (fun v : X => 3 ≤ G.degree v),
          (if t ≤ occ G v k then G.degree v - 2 else 0) :=
      (Finset.sum_subtype (Finset.univ.filter (fun v : X => 3 ≤ G.degree v))
        (fun v => by simp only [Finset.mem_filter, Finset.mem_univ, true_and])
        (fun v => if t ≤ occ G v k then G.degree v - 2 else 0)).symm
    have h5 : ∑ v ∈ Finset.univ.filter (fun v : X => 3 ≤ G.degree v),
          (if t ≤ occ G v k then G.degree v - 2 else 0) = slotsAtLeast G k t := by
      unfold slotsAtLeast
      rw [← Finset.sum_filter, Finset.filter_filter]
    rw [h1, h2, Finset.sum_congr rfl (fun v _ => h3 v), h4, h5]
  rw [← hA]
  unfold leavesAtLeast
  rw [← Finset.card_image_of_injective A hf]
  apply Finset.card_le_card
  intro ℓ hℓ
  obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hℓ
  simp only [A, Finset.mem_filter, Finset.mem_univ, true_and] at hs ⊢
  exact ⟨(hfl s).1, le_trans hs (hfl s).2⟩

end Erdos993G1
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma Erdos993G1.leaf_slot_dominance_on_pathlike_branch_trees 7b99e257241686ef234b9bcc30fedc19eca76054877af4fde278a5180ef054c2
namespace Erdos993G1

/-- **Theorem BTP, the leaf-slot dominance face** (`E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`,
C1-LA5; mechanism `C-T2-U`, canonical proof SR-BTP). Let `G` be a finite tree in which every branch
vertex has at most two neighbours from which another branch vertex is reachable in `G − v`
(`BranchTreeMaxDegreeLeTwo`). Then for every `k`: an SDR from the branch slots to the leaves respecting
`occ` exists, and hence `slotsAtLeast G k t ≤ leavesAtLeast G k t` for every `t : ℕ` (including
`t = 0`). Fences: NOT (HS) on all trees — `T22` (branch tree `K_{1,3}`) lies outside the class and
refutes (HS); the class is sharp for every branch-degree bound `D ≥ 3`. No status transfer. -/
lemma leaf_slot_dominance_on_pathlike_branch_trees {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (hT : G.IsTree) (hB : BranchTreeMaxDegreeLeTwo G)
    (k : ℕ) :
    (∃ f : (Σ v : {v : X // 3 ≤ G.degree v}, Fin (G.degree v.1 - 2)) → X,
        Function.Injective f ∧ ∀ s, G.degree (f s) = 1 ∧ occ G s.1.1 k ≤ occ G (f s) k) ∧
      ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t := by
  obtain ⟨f, hf, hfl⟩ := btp_sdr_exists G hT hB k
  exact ⟨⟨f, hf, hfl⟩, threshold_of_sdr G k f hf hfl⟩

end Erdos993G1
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN theorem Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees c7df9c6dc485471b7867b994f339bdd7cbb61573025158fc52ced7e6e2bfc4d2
namespace Erdos993G1

/-- **(DL) on the BTP class, by the matching route** (C1-LA5; SCOPE NOTE on
`E993-R27-FOREST-DEGREE-LEMMA`, an alias distinction, never a (DL) key). For a finite tree `G` in the
class `BranchTreeMaxDegreeLeTwo` and every `k`: `D_k(G) ≤ 2k·i_k(G)`. Proof: Theorem BTP's threshold
form (`leaf_slot_dominance_on_pathlike_branch_trees`) fed to the carried C1-LA2 reduction
`dominance_implies_degree_lemma`. A byte-different second formal proof of (DL) ON THIS CLASS ONLY.
Fences: NOT (DL) on all forests (the formal (DL) of record is r27 C1-LA1 `forest_degree_lemma`, an
input never edited here); NOT (HS) on all trees (`T22`); no status transfer. -/
theorem forest_degree_lemma_on_pathlike_branch_trees {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (hT : G.IsTree) (hB : BranchTreeMaxDegreeLeTwo G)
    (k : ℕ) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k :=
  dominance_implies_degree_lemma G hT k (leaf_slot_dominance_on_pathlike_branch_trees G hT hB k).2

end Erdos993G1
-- VERITYOS ENTRY 31 END

