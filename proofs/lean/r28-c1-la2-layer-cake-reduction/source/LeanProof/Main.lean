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

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.occ_le_card_indepSetFinset 87ad5da837416ec0668d4f6b4777063821dea443fb1382355906e52fc89ddea6
namespace Erdos993G1

lemma occ_le_card_indepSetFinset {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (v : X) (k : ℕ) :
    occ G v k ≤ (G.indepSetFinset k).card :=
  Finset.card_filter_le _ _

end Erdos993G1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.layerCake_subset d139c09ae0164c1ab9edb972e2e1c866b21062be023466c3046afbde26f04112
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
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.sum_branch_slots_eq_sum_slotsAtLeast e5a2b903b0e490509cc5316f1f771c2531f166b894d2602217ca3613342131df
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
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.sum_leaves_eq_sum_leavesAtLeast e4738b113958c21e198961ebfb9f2b86663504db5ff6cd02fb1619b16cb78a96
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
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.indepDegreeSum_eq_sum_degree_mul_occ a45ec9902fa3b8afc4729ff561c0c9d433ebb349645dc080789fc442e2bca959
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
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.sum_occ_eq_card_mul_indepSetFinset e7c6833a89c2b886fe87f31df39efba0835aaededc36730e1f13520abddfaea4
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
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.CriticU1F.weight_identity e95a4d9e80f7705238a5e07c0e0aa41693e322613ef7f4becfd0dcfc1ece1fcb
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Weight identity, every finite simple graph: `2k·#I_k − D_k = Σ_v (2 − deg v)·c_v(k)`. -/
lemma weight_identity (k : ℕ) :
    2 * (k : ℤ) * ((G.indepSetFinset k).card : ℤ) - (indepDegreeSum G k : ℤ)
      = ∑ v : X, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ) := by
  have hD := indepDegreeSum_eq_sum_degree_mul_occ G k
  have hS := sum_occ_eq_card_mul_indepSetFinset G k
  have hD' : (indepDegreeSum G k : ℤ) = ∑ v : X, (G.degree v : ℤ) * (occ G v k : ℤ) := by
    rw [hD]; push_cast; rfl
  have hS' : ∑ v : X, (occ G v k : ℤ) = (k : ℤ) * ((G.indepSetFinset k).card : ℤ) := by
    have : ((∑ v : X, occ G v k : ℕ) : ℤ) = ((k * (G.indepSetFinset k).card : ℕ) : ℤ) := by
      rw [hS]
    push_cast at this; exact this
  rw [hD', Finset.sum_congr rfl (fun v _ => sub_mul 2 (G.degree v : ℤ) (occ G v k : ℤ)),
    Finset.sum_sub_distrib, ← Finset.mul_sum, hS']
  ring

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.CriticU1F.pointwise_split fd04869ea267c4fb0d74d05208dbff0d62b6023531b6992a2bbfa174b1a471d6
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Pointwise degree split. -/
lemma pointwise_split (d c : ℕ) :
    (2 - (d : ℤ)) * (c : ℤ)
      = (if d = 0 then 2 * (c : ℤ) else 0) + (if d = 1 then (c : ℤ) else 0)
        - (if 3 ≤ d then ((d : ℤ) - 2) * (c : ℤ) else 0) := by
  rcases Nat.lt_or_ge d 3 with h | h
  · interval_cases d <;> simp
  · have h0 : d ≠ 0 := by omega
    have h1 : d ≠ 1 := by omega
    simp [h0, h1, h]; ring

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.CriticU1F.leaf_branch_identity_general 90d2921d92e3ff7623290f1fca875ef8310db48a7807037a1d15802ba666ff07
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Exact leaf/branch identity on EVERY finite simple graph, with the isolated-vertex term:
`2k·i_k − D_k = 2·Σ_{deg 0} c_v + Σ_{deg 1} c_ℓ − Σ_{deg ≥ 3} (deg v − 2)·c_v`. -/
lemma leaf_branch_identity_general (k : ℕ) :
    2 * (k : ℤ) * indepCount G k - (indepDegreeSum G k : ℤ)
      = 2 * ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 0), (occ G v k : ℤ)
        + ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ)
        - ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
            ((G.degree v : ℤ) - 2) * (occ G v k : ℤ) := by
  rw [indepCount_eq_card_indepSetFinset, weight_identity,
    Finset.sum_congr rfl (fun v _ => pointwise_split (G.degree v) (occ G v k)),
    Finset.sum_sub_distrib, Finset.sum_add_distrib, Finset.sum_ite, Finset.sum_ite,
    Finset.sum_ite]
  simp only [Finset.sum_const_zero, add_zero, Finset.mul_sum]

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.CriticU1F.leaf_branch_identity_of_no_isolated b8c7649179b696e0579392f21b64f8def41d1cb1bc12c051d0cf3fc9466d8c75
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The exact identity with no isolated vertex (the r27 reformulation's content, graph-general). -/
lemma leaf_branch_identity_of_no_isolated (k : ℕ) (hpos : ∀ v, 0 < G.degree v) :
    2 * (k : ℤ) * indepCount G k - (indepDegreeSum G k : ℤ)
      = ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ)
        - ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
            ((G.degree v : ℤ) - 2) * (occ G v k : ℤ) := by
  rw [leaf_branch_identity_general]
  have hempty : Finset.univ.filter (fun v => G.degree v = 0) = ∅ := by
    ext v; simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.notMem_empty,
      iff_false]; have := hpos v; omega
  rw [hempty, Finset.sum_empty]; ring

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.CriticU1F.tree_degree_pos 293c62494096b9e763a3d22e9541b618b50c01a28b82971c130ce75678b193ba
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- A tree of order `≥ 2` has no isolated vertex. -/
lemma tree_degree_pos (hT : G.IsTree) (h2 : 2 ≤ Fintype.card X) (v : X) : 0 < G.degree v := by
  obtain ⟨w, hw⟩ := Fintype.exists_ne_of_one_lt_card (by omega) v
  exact SimpleGraph.Reachable.degree_pos_left (Ne.symm hw) (hT.connected.preconnected v w)

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.CriticU1F.tree_leaf_branch_identity 611eb6ad46b50bc09697b7d4ee550f4f48837d1d6a54a4dc2d3e77d9a72ee5b9
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`, formalized (exact identity). -/
lemma tree_leaf_branch_identity (hT : G.IsTree) (h2 : 2 ≤ Fintype.card X) (k : ℕ) :
    2 * (k : ℤ) * indepCount G k - (indepDegreeSum G k : ℤ)
      = ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ)
        - ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
            ((G.degree v : ℤ) - 2) * (occ G v k : ℤ) :=
  leaf_branch_identity_of_no_isolated G k (tree_degree_pos G hT h2)

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.CriticU1F.dominance_implies_degree_lemma_general f0b7979e42b433f7ac72d270133f21e3ba12a690ce45df6138446957f650caf8
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- (LC), graph-general, with the hypothesis only at `t ≥ 1` (the (HS) of `SEMANTIC-CONTRACT.md` §2). -/
lemma dominance_implies_degree_lemma_general (k : ℕ)
    (h : ∀ t : ℕ, 1 ≤ t → slotsAtLeast G k t ≤ leavesAtLeast G k t) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k := by
  have hsum : ∑ t ∈ Finset.Icc 1 (G.indepSetFinset k).card, slotsAtLeast G k t
      ≤ ∑ t ∈ Finset.Icc 1 (G.indepSetFinset k).card, leavesAtLeast G k t :=
    Finset.sum_le_sum (fun t ht => h t (Finset.mem_Icc.mp ht).1)
  rw [← sum_branch_slots_eq_sum_slotsAtLeast, ← sum_leaves_eq_sum_leavesAtLeast] at hsum
  have hLHS : ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
        ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
      = ((∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
            (G.degree v - 2) * occ G v k : ℕ) : ℤ) := by
    rw [Nat.cast_sum]
    refine Finset.sum_congr rfl (fun v hv => ?_)
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv
    rw [Nat.cast_mul, Nat.cast_sub (show 2 ≤ G.degree v by omega)]
    norm_num
  have hZ : ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
        ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
      ≤ ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ) := by
    rw [hLHS]; push_cast; exact_mod_cast hsum
  have hid := leaf_branch_identity_general G k
  have h0 : 0 ≤ ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 0), (occ G v k : ℤ) :=
    Finset.sum_nonneg (fun v _ => by positivity)
  linarith

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.CriticU1F.slotsAtLeast_zero 0f8f3da22d524141e0056b72e0a780fdee1e2413d6158220eaeb4a6261ce0c29
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The `t = 0` instance is NOT implied by the `t ≥ 1` family off trees: it is the bare count
`Σ_{Br}(deg v − 2) ≤ |L|`. -/
lemma slotsAtLeast_zero (k : ℕ) :
    slotsAtLeast G k 0 = ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), (G.degree v - 2) := by
  unfold slotsAtLeast; congr 1; ext v; simp

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.CriticU1F.leavesAtLeast_zero bc5749767db698f20433b76c57ff603c51d09153a16de2e13b1d4ef83c143e0a
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

lemma leavesAtLeast_zero (k : ℕ) :
    leavesAtLeast G k 0 = (Finset.univ.filter (fun v => G.degree v = 1)).card := by
  unfold leavesAtLeast; congr 1; ext v; simp

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.CriticU1F.tree_slots_le_leaves_zero a6af82ce56161747793a9b6c34e12f2f0918f32676033dab5c52ee6f0eb4b485
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- For a tree, the `t = 0` instance holds: `Σ_{Br}(deg v − 2) ≤ |L|` (slot count; needs `IsTree`). -/
lemma tree_slots_le_leaves_zero (hT : G.IsTree) (k : ℕ) :
    slotsAtLeast G k 0 ≤ leavesAtLeast G k 0 := by
  rw [slotsAtLeast_zero, leavesAtLeast_zero]
  rcases Nat.lt_or_ge (Fintype.card X) 2 with hc | hc
  · have hempty : Finset.univ.filter (fun v => 3 ≤ G.degree v) = ∅ := by
      ext v; simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.notMem_empty,
        iff_false]; have := G.degree_lt_card_verts v; omega
    rw [hempty, Finset.sum_empty]; exact Nat.zero_le _
  · have hpos := tree_degree_pos G hT hc
    have hE := hT.card_edgeFinset
    have hH := G.sum_degrees_eq_twice_card_edges
    -- Σ_v (2 − deg v) = 2 in ℤ
    have hsum2 : ∑ v : X, (2 - (G.degree v : ℤ)) * ((1 : ℕ) : ℤ) = 2 := by
      simp only [Nat.cast_one, mul_one, Finset.sum_sub_distrib, Finset.sum_const,
        Finset.card_univ, nsmul_eq_mul]
      have : ((∑ v : X, G.degree v : ℕ) : ℤ) = 2 * (Fintype.card X : ℤ) - 2 := by
        rw [hH]; push_cast; omega
      push_cast at this; linarith
    rw [Finset.sum_congr rfl (fun v _ => pointwise_split (G.degree v) 1),
      Finset.sum_sub_distrib, Finset.sum_add_distrib, Finset.sum_ite, Finset.sum_ite,
      Finset.sum_ite] at hsum2
    simp only [Finset.sum_const_zero, add_zero, Nat.cast_one, mul_one] at hsum2
    have hempty : Finset.univ.filter (fun v => G.degree v = 0) = ∅ := by
      ext v; simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.notMem_empty,
        iff_false]; have := hpos v; omega
    simp only [hempty, Finset.sum_empty, mul_zero, zero_add, add_zero] at hsum2
    have hcast : ((∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), (G.degree v - 2) : ℕ) : ℤ)
        = ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), ((G.degree v : ℤ) - 2) := by
      rw [Nat.cast_sum]; refine Finset.sum_congr rfl (fun v hv => ?_)
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv
      rw [Nat.cast_sub (show 2 ≤ G.degree v by omega)]; norm_num
    have hL : ((Finset.univ.filter (fun v => G.degree v = 1)).card : ℤ)
        = ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (1 : ℤ) := by simp
    have : ((∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), (G.degree v - 2) : ℕ) : ℤ)
        ≤ ((Finset.univ.filter (fun v => G.degree v = 1)).card : ℤ) := by
      rw [hcast, hL]; linarith
    exact_mod_cast this

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.CriticU1F.tree_forall_t_of_ge_one eb1b848b871287d732bf3bb85e19fad23faa2dfcd206e3840c468071deb65108
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Composition check: for a tree, (HS) at `t ≥ 1` already gives the contract's `∀ t` hypothesis. -/
lemma tree_forall_t_of_ge_one (hT : G.IsTree) (k : ℕ)
    (h : ∀ t : ℕ, 1 ≤ t → slotsAtLeast G k t ≤ leavesAtLeast G k t) :
    ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t := by
  intro t
  rcases Nat.eq_zero_or_pos t with h0 | hp
  · subst h0; exact tree_slots_le_leaves_zero G hT k
  · exact h t hp

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.CriticU1F.tree_slot_count aac553f8b53ea4f090d7d8a692d451776479bb21847b235b4cdf312618fc974a
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Slot count of `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`, in ℤ:
for a tree of order `≥ 2`, `Σ_{Br}(deg v − 2) = |L| − 2`. -/
lemma tree_slot_count (hT : G.IsTree) (hc : 2 ≤ Fintype.card X) :
    ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), ((G.degree v : ℤ) - 2)
      = ((Finset.univ.filter (fun v => G.degree v = 1)).card : ℤ) - 2 := by
  have hpos := tree_degree_pos G hT hc
  have hE := hT.card_edgeFinset
  have hH := G.sum_degrees_eq_twice_card_edges
  have hsum2 : ∑ v : X, (2 - (G.degree v : ℤ)) * ((1 : ℕ) : ℤ) = 2 := by
    simp only [Nat.cast_one, mul_one, Finset.sum_sub_distrib, Finset.sum_const,
      Finset.card_univ, nsmul_eq_mul]
    have : ((∑ v : X, G.degree v : ℕ) : ℤ) = 2 * (Fintype.card X : ℤ) - 2 := by
      rw [hH]; push_cast; omega
    push_cast at this; linarith
  rw [Finset.sum_congr rfl (fun v _ => pointwise_split (G.degree v) 1),
    Finset.sum_sub_distrib, Finset.sum_add_distrib, Finset.sum_ite, Finset.sum_ite,
    Finset.sum_ite] at hsum2
  simp only [Finset.sum_const_zero, add_zero, Nat.cast_one, mul_one] at hsum2
  have hempty : Finset.univ.filter (fun v => G.degree v = 0) = ∅ := by
    ext v; simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.notMem_empty,
      iff_false]; have := hpos v; omega
  simp only [hempty, Finset.sum_empty, zero_add] at hsum2
  have hL : ((Finset.univ.filter (fun v => G.degree v = 1)).card : ℤ)
      = ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (1 : ℤ) := by simp
  rw [hL]; linarith

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.CriticU1F.tree_degree_lemma_iff a7e7b681c7cc65320ed14c01c7a9b8d0fc19e3408f21da12b4046431fa75f987
namespace Erdos993G1
namespace CriticU1F

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The ⟺ clause of `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`. -/
lemma tree_degree_lemma_iff (hT : G.IsTree) (hc : 2 ≤ Fintype.card X) (k : ℕ) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k ↔
      ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
        ≤ ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ) := by
  have := tree_leaf_branch_identity G hT hc k
  constructor <;> intro h <;> linarith

end CriticU1F
end Erdos993G1
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma CriticU1T.base_identity d3a5da63a80271c7c147e7f556c3c8cb50731d3ffadf6dcc7112869e7fb60491
namespace CriticU1T

open Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- `2k·i_k − D_k = Σ_v (2 − deg v)·c_v(k)` on every finite simple graph. -/
lemma base_identity (k : ℕ) :
    (2 * k * indepCount G k : ℤ) - indepDegreeSum G k
      = ∑ v, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ) := by
  rw [indepCount_eq_card_indepSetFinset, indepDegreeSum_eq_sum_degree_mul_occ]
  have h1 := sum_occ_eq_card_mul_indepSetFinset G k
  have h1' : ((∑ v, occ G v k : ℕ) : ℤ) = ((k * (G.indepSetFinset k).card : ℕ) : ℤ) := by
    rw [h1]
  push_cast at h1' ⊢
  have e : ∑ v, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ)
      = 2 * ∑ v, (occ G v k : ℤ) - ∑ v, (G.degree v : ℤ) * (occ G v k : ℤ) := by
    rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl (fun v _ => by ring)
  rw [e]
  linarith

end CriticU1T
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma CriticU1T.reformulation_of_no_isolated 7cd189fa776b7bf8fd0cbcc83c2785887d150075641c6ef1ce2e7b6439777286
namespace CriticU1T

open Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Exact leaf/branch reformulation on every finite simple graph WITHOUT isolated vertices. -/
lemma reformulation_of_no_isolated (h0 : ∀ v, 1 ≤ G.degree v) (k : ℕ) :
    (2 * k * indepCount G k : ℤ) - indepDegreeSum G k
      = ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ)
        - ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
            ((G.degree v : ℤ) - 2) * (occ G v k : ℤ) := by
  rw [base_identity, Finset.sum_filter, Finset.sum_filter, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl (fun v _ => ?_)
  have hv := h0 v
  rcases Nat.lt_or_ge (G.degree v) 3 with h | h
  · rcases (show G.degree v = 1 ∨ G.degree v = 2 by omega) with h1 | h2
    · rw [if_pos h1, if_neg (by omega), h1]; push_cast; ring
    · rw [if_neg (by omega), if_neg (by omega), h2]; push_cast; ring
  · rw [if_neg (by omega), if_pos h]; ring

end CriticU1T
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma CriticU1T.tree_no_isolated 57be795e863cdb3f6b99bfe2034e08979c2eda668178cf2252541c788b293282
namespace CriticU1T

open Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Every vertex of a tree of order `n ≥ 2` has degree `≥ 1`. -/
lemma tree_no_isolated (hT : G.IsTree) (hn : 2 ≤ Fintype.card X) (v : X) : 1 ≤ G.degree v := by
  haveI : Nontrivial X := Fintype.one_lt_card_iff_nontrivial.mp (by omega)
  exact hT.connected.preconnected.degree_pos_of_nontrivial v

end CriticU1T
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma CriticU1T.tree_leaf_branch_reformulation 2b8e6cfb8ae87e7f4492a6cfb98ecb9b59bd6324c6888d0dee5ad5cb46b6eeec
namespace CriticU1T

open Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The r27 leaf/branch reformulation for trees of order `n ≥ 2`, as an exact identity in Lean
(allocation item 5's missing lemma; critic-derived). -/
lemma tree_leaf_branch_reformulation (hT : G.IsTree) (hn : 2 ≤ Fintype.card X) (k : ℕ) :
    (2 * k * indepCount G k : ℤ) - indepDegreeSum G k
      = ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ)
        - ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
            ((G.degree v : ℤ) - 2) * (occ G v k : ℤ) :=
  reformulation_of_no_isolated G (tree_no_isolated G hT hn) k

end CriticU1T
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma CriticU1T.tree_slot_count 6563c8f420e6416760b4276c0a7132d2d166b0dc2f61056129a9d86e6588c10c
namespace CriticU1T

open Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- The slot count `Σ_{Br}(deg v − 2) = |L| − 2` for trees of order `n ≥ 2`. -/
lemma tree_slot_count (hT : G.IsTree) (hn : 2 ≤ Fintype.card X) :
    ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), ((G.degree v : ℤ) - 2)
      = ((Finset.univ.filter (fun v => G.degree v = 1)).card : ℤ) - 2 := by
  have h0 := tree_no_isolated G hT hn
  have hE := hT.card_edgeFinset
  have hS := G.sum_degrees_eq_twice_card_edges
  have htwo : ∑ v : X, (2 - (G.degree v : ℤ)) = 2 := by
    have hS' : ((∑ v, G.degree v : ℕ) : ℤ) = ((2 * G.edgeFinset.card : ℕ) : ℤ) := by rw [hS]
    have hE' : ((G.edgeFinset.card + 1 : ℕ) : ℤ) = ((Fintype.card X : ℕ) : ℤ) := by rw [hE]
    push_cast at hS' hE'
    rw [Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ, hS']
    simp only [nsmul_eq_mul]
    linarith
  have hsplit : ∑ v : X, (2 - (G.degree v : ℤ))
      = ((Finset.univ.filter (fun v => G.degree v = 1)).card : ℤ)
        - ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v), ((G.degree v : ℤ) - 2) := by
    rw [Finset.cast_card, Finset.sum_filter, Finset.sum_filter, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl (fun v _ => ?_)
    have hv := h0 v
    rcases Nat.lt_or_ge (G.degree v) 3 with h | h
    · rcases (show G.degree v = 1 ∨ G.degree v = 2 by omega) with h1 | h2
      · rw [if_pos h1, if_neg (by omega), h1]; push_cast; try ring
      · rw [if_neg (by omega), if_neg (by omega), h2]; push_cast; try ring
    · rw [if_neg (by omega), if_pos h]; ring
  linarith

end CriticU1T
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma CriticU1T.dominance_implies_degree_lemma_graph_general eef224d92fb920e5a063047d5a8c5a46b6bd779f10e208ab4b17bbf90ff43668
namespace CriticU1T

open Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- Graph-general (LC) with the hypothesis only at `t ≥ 1` (no `IsTree`, no `t = 0` row). -/
lemma dominance_implies_degree_lemma_graph_general (k : ℕ)
    (h : ∀ t : ℕ, 1 ≤ t → slotsAtLeast G k t ≤ leavesAtLeast G k t) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k := by
  have hsum : ∑ t ∈ Finset.Icc 1 (G.indepSetFinset k).card, slotsAtLeast G k t
      ≤ ∑ t ∈ Finset.Icc 1 (G.indepSetFinset k).card, leavesAtLeast G k t :=
    Finset.sum_le_sum (fun t ht => h t (Finset.mem_Icc.mp ht).1)
  rw [← sum_branch_slots_eq_sum_slotsAtLeast, ← sum_leaves_eq_sum_leavesAtLeast] at hsum
  have hcastB : ((∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
        (G.degree v - 2) * occ G v k : ℕ) : ℤ)
      = ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
          ((G.degree v : ℤ) - 2) * (occ G v k : ℤ) := by
    rw [Nat.cast_sum]
    refine Finset.sum_congr rfl (fun v hv => ?_)
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv
    rw [Nat.cast_mul, Nat.cast_sub (show 2 ≤ G.degree v by omega)]
    norm_num
  have hcastL : ((∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), occ G v k : ℕ) : ℤ)
      = ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ) := by
    rw [Nat.cast_sum]
  have hsumZ := (Nat.cast_le (α := ℤ)).mpr hsum
  rw [hcastB, hcastL] at hsumZ
  have hge : ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ)
        - ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
            ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
      ≤ ∑ v, (2 - (G.degree v : ℤ)) * (occ G v k : ℤ) := by
    rw [Finset.sum_filter, Finset.sum_filter, ← Finset.sum_sub_distrib]
    refine Finset.sum_le_sum (fun v _ => ?_)
    have hc : (0 : ℤ) ≤ (occ G v k : ℤ) := by positivity
    rcases Nat.lt_or_ge (G.degree v) 3 with h | h
    · rcases (show G.degree v = 0 ∨ G.degree v = 1 ∨ G.degree v = 2 by omega) with h0 | h1 | h2
      · rw [if_neg (by omega), if_neg (by omega), h0]; push_cast; linarith
      · rw [if_pos h1, if_neg (by omega), h1]; push_cast; linarith
      · rw [if_neg (by omega), if_neg (by omega), h2]; push_cast; linarith
    · rw [if_neg (by omega), if_pos h]; linarith
  have hb := base_identity G k
  linarith

end CriticU1T
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma CriticU1T.tree_DL_iff_aggregate 3b70324939f3c34959832f7d6184a324d4a29b8f3acf0cb5ac86da0651f75a6f
namespace CriticU1T

open Erdos993G1

variable {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj]

/-- r27 reformulation, biconditional clause: for a tree of order `n ≥ 2`, (DL) at `k` iff the
aggregate slot/leaf inequality at `k`. -/
lemma tree_DL_iff_aggregate (hT : G.IsTree) (hn : 2 ≤ Fintype.card X) (k : ℕ) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k ↔
      ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v),
          ((G.degree v : ℤ) - 2) * (occ G v k : ℤ)
        ≤ ∑ v ∈ Finset.univ.filter (fun v => G.degree v = 1), (occ G v k : ℤ) := by
  have e := tree_leaf_branch_reformulation G hT hn k
  constructor <;> intro h <;> linarith

end CriticU1T
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN theorem Erdos993G1.dominance_implies_degree_lemma eefb5f1859af38e4760936c333d7432c01e00363ed25985cc4fbc1fc01bb440c
namespace Erdos993G1

/-- **(LC), the layer-cake reduction, composed** (key `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA`).
If `slotsAtLeast G k t ≤ leavesAtLeast G k t` for every `t`, then `D_k(G) ≤ 2k·i_k(G)`.
Statement: `SOLUTION-CONTRACT.md` §2, verbatim. Proof: seat U1's tactic block, carried verbatim.
Erratum R28-E-a: on trees the `∀ t` quantifier is harmless (`CriticU1F.tree_forall_t_of_ge_one`);
the proof consumes the hypothesis only at `t ≥ 1` and does not use `hT`.
Fences: an instance-wise implication, not a proof of the degree lemma and not a second proof of
it; its hypothesis fails at `(T22, 11)` and `(T22, 12)`; no composition with the refuted (HS). -/
theorem dominance_implies_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
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
-- VERITYOS ENTRY 33 END

