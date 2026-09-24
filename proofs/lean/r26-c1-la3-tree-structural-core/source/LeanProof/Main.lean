import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition C4LA1.IsGraphLeaf 65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5
namespace C4LA1

variable {V : Type*}

/-- A graph leaf has exactly one adjacent vertex. -/
def IsGraphLeaf (G : SimpleGraph V) (v : V) : Prop :=
  ∃! u, G.Adj v u

end C4LA1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition C5LA1.support 8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The unique support (neighbour) of an original leaf `v`; unconstrained
(any value satisfying nothing further) off the leaf set. -/
noncomputable
def support (G : SimpleGraph V) (v : V) : V :=
  Classical.choose (p := fun u => C4LA1.IsGraphLeaf G v → G.Adj v u ∧ ∀ w, G.Adj v w → w = u)
    (by
      by_cases h : C4LA1.IsGraphLeaf G v
      · obtain ⟨u, hu, huniq⟩ := h
        exact ⟨u, fun _ => ⟨hu, huniq⟩⟩
      · exact ⟨v, fun hc => absurd hc h⟩)

end C5LA1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition C5LA1.leafSet 78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- The set of original leaves of `G`. -/
noncomputable
def leafSet (G : SimpleGraph V) : Finset V :=
  Finset.univ.filter (C4LA1.IsGraphLeaf G)

end C5LA1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition C5LA1.leafDegree ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `lambda(s)`: the number of leaves of `G` adjacent to `s`, zero off
supports. -/
noncomputable
def leafDegree (G : SimpleGraph V) [DecidableRel G.Adj] (s : V) : Nat :=
  ((leafSet G).filter fun v => G.Adj v s).card

end C5LA1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition C5LA1.indepSetsAvoiding ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition C5LA1.indepSetCount e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition C5LA1.forwardDifferenceDel 60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `Delta_k(G - D) = i_(k+1)(G-D) - i_k(G-D)`. -/
def forwardDifferenceDel (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Int :=
  (indepSetCount G D (k + 1) : Int) - indepSetCount G D k

end C5LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition C5LA1.crossingIndex 378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- `x(G)`: the least `k` with `Delta_k(G) < 0`; exists because
`Delta_(alpha)(G) = -i_alpha(G) < 0`. -/
noncomputable
def crossingIndex (G : SimpleGraph V) [DecidableRel G.Adj] : Nat :=
  Nat.find (p := fun k => forwardDifferenceDel G ∅ k < 0)
    (by
      classical
      obtain ⟨s, hs⟩ := G.exists_isNIndepSet_indepNum
      refine ⟨G.indepNum, ?_⟩
      have hzero : indepSetCount G ∅ (G.indepNum + 1) = 0 := by
        have hempty : indepSetsAvoiding G ∅ (G.indepNum + 1) = ∅ := by
          rw [Finset.eq_empty_iff_forall_notMem]
          intro t ht
          simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at ht
          have hle : t.card ≤ G.indepNum := ht.2.card_le_indepNum
          omega
        rw [indepSetCount, hempty, Finset.card_empty]
      have hpos : 0 < indepSetCount G ∅ G.indepNum := by
        rw [indepSetCount, Finset.card_pos]
        refine ⟨s, ?_⟩
        simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
        refine ⟨⟨?_, hs.card_eq⟩, hs.isIndepSet⟩
        intro x _
        simp
      simp only [forwardDifferenceDel, hzero]
      omega)

end C5LA1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition R26LA3.supportSet b964c400de9915f81299e13a8b4405024d7194ee9a8798f7ae5bc53f91f00134
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `C(G)` of `SEMANTIC-CONTRACT.md` Section 1: the set of supports of leaves. -/
noncomputable
def supportSet (G : SimpleGraph V) : Finset V :=
  (C5LA1.leafSet G).image (C5LA1.support G)

end R26LA3
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma C5LA1.support_spec 70b0781d1f99e74a3b34849eadd081b15d9968f177ef1e147c25765e186069fb
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma support_spec {G : SimpleGraph V} {v : V} (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v (support G v) ∧ ∀ y, G.Adj v y → y = support G v := by
  unfold support
  exact Classical.choose_spec
    (p := fun u => C4LA1.IsGraphLeaf G v → G.Adj v u ∧ ∀ w, G.Adj v w → w = u)
    (by
      by_cases h : C4LA1.IsGraphLeaf G v
      · obtain ⟨u, hu, huniq⟩ := h
        exact ⟨u, fun _ => ⟨hu, huniq⟩⟩
      · exact ⟨v, fun hc => absurd hc h⟩) hv

end C5LA1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma C5LA1.adj_iff_support_eq f12f82bc757ccd70f1eea5e3aa5759bd654fb7d4088a5360e04cc098a202a81e
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma adj_iff_support_eq {G : SimpleGraph V} {v s : V} (hv : C4LA1.IsGraphLeaf G v) :
    G.Adj v s ↔ support G v = s := by
  constructor
  · intro h
    exact ((support_spec hv).2 s h).symm
  · intro h
    rw [← h]
    exact (support_spec hv).1

end C5LA1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma C5LA1.leafDegree_eq_filter_support 53119a540f36ad19dd43c9dd7b7a5761e9eef2fdd92425606b8a92e8ff5e1597
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma leafDegree_eq_filter_support {G : SimpleGraph V} [DecidableRel G.Adj] (s : V) :
    leafDegree G s = ((leafSet G).filter fun v => support G v = s).card := by
  unfold leafDegree
  congr 1
  apply Finset.filter_congr
  intro v hv
  simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
  exact ⟨fun h => (adj_iff_support_eq hv).1 h, fun h => (adj_iff_support_eq hv).2 h⟩

end C5LA1
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma R26LA3.closed_reachable 6c8c0fdc6c2bf68ac9d4c9c9970563a1d54061d2f76e5d6a7c90fe5dc0ff5936
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Reachability closure: a walk from `a` to `b` transports a property `P` that
is closed under a single adjacency step. Used to bound the vertex set of a
tree by a small closed set. -/
lemma closed_reachable {G : SimpleGraph V} {P : V → Prop}
    (hP : ∀ x y : V, P x → G.Adj x y → P y) :
    ∀ {a b : V}, G.Walk a b → P a → P b := by
  intro a b p
  induction p with
  | nil => exact id
  | cons h p ih => intro ha; exact ih (hP _ _ ha h)

end R26LA3
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma R26LA3.card_leafSet_ge_two_of_nontrivial 22465f006e3f12786b5d4c4a6d919e38ac797ee9e881c616d53e4e1a27a7c7d0
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (a)-core, general form: a nontrivial finite tree has at least two leaves
(the classical handshake argument: at most one degree-1 vertex forces the
degree sum below `2(n-1)`). -/
lemma card_leafSet_ge_two_of_nontrivial (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) [Nontrivial V] :
    2 ≤ (C5LA1.leafSet G).card := by
  classical
  have hleafSet_eq : C5LA1.leafSet G = Finset.univ.filter (fun v => G.degree v = 1) := by
    unfold C5LA1.leafSet
    apply Finset.filter_congr
    intro v _
    exact (SimpleGraph.degree_eq_one_iff_existsUnique_adj).symm
  by_contra hlt
  rw [hleafSet_eq] at hlt
  push_neg at hlt
  have hle1 : (Finset.univ.filter (fun v : V => G.degree v = 1)).card ≤ 1 := by omega
  have hsplitcard :
      (Finset.univ.filter (fun v : V => G.degree v = 1)).card
        + (Finset.univ.filter (fun v : V => ¬ G.degree v = 1)).card = Fintype.card V := by
    rw [Finset.card_filter_add_card_filter_not, Finset.card_univ]
  have hsplitsum :
      (∑ v ∈ Finset.univ.filter (fun v : V => G.degree v = 1), G.degree v)
        + ∑ v ∈ Finset.univ.filter (fun v : V => ¬ G.degree v = 1), G.degree v
        = ∑ v : V, G.degree v := by
    exact Finset.sum_filter_add_sum_filter_not _ _ _
  have hleafsum :
      (∑ v ∈ Finset.univ.filter (fun v : V => G.degree v = 1), G.degree v)
        = (Finset.univ.filter (fun v : V => G.degree v = 1)).card := by
    rw [Finset.sum_congr rfl (fun v hv => (Finset.mem_filter.mp hv).2), Finset.sum_const,
      smul_eq_mul, mul_one]
  have hpos : ∀ v : V, 0 < G.degree v := by
    intro v
    exact hTree.connected.preconnected.degree_pos_of_nontrivial v
  have hnonleafsum :
      2 * (Finset.univ.filter (fun v : V => ¬ G.degree v = 1)).card
        ≤ ∑ v ∈ Finset.univ.filter (fun v : V => ¬ G.degree v = 1), G.degree v := by
    have hstep : (∑ _v ∈ Finset.univ.filter (fun v : V => ¬ G.degree v = 1), (2 : ℕ))
        ≤ ∑ v ∈ Finset.univ.filter (fun v : V => ¬ G.degree v = 1), G.degree v := by
      apply Finset.sum_le_sum
      intro v hv
      have hv' : ¬ G.degree v = 1 := (Finset.mem_filter.mp hv).2
      have := hpos v
      omega
    rw [Finset.sum_const, smul_eq_mul] at hstep
    omega
  have hedges : G.edgeFinset.card + 1 = Fintype.card V := hTree.card_edgeFinset
  have hsumdeg : ∑ v : V, G.degree v = 2 * G.edgeFinset.card :=
    G.sum_degrees_eq_twice_card_edges
  have hn2 : 2 ≤ Fintype.card V := Fintype.one_lt_card_iff_nontrivial.mpr inferInstance
  omega

end R26LA3
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma R26LA3.tree_two_le_indepNum_two_le_leafSet 1edd3aecb23be25d49fb400ffa55cc1e3b89d88c3c991752c6356a598a670f07
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (a) `IsTree → 2 ≤ indepNum → 2 ≤ (leafSet G).card`. -/
lemma tree_two_le_indepNum_two_le_leafSet (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    2 ≤ (C5LA1.leafSet G).card := by
  classical
  obtain ⟨s, hs⟩ := G.exists_isNIndepSet_indepNum
  have h2 : 2 ≤ s.card := by rw [hs.card_eq]; exact hAlpha
  have hle : s.card ≤ Fintype.card V := Finset.card_le_univ s
  have hVcard : 2 ≤ Fintype.card V := le_trans h2 hle
  haveI : Nontrivial V := Fintype.one_lt_card_iff_nontrivial.mp (by omega)
  exact card_leafSet_ge_two_of_nontrivial G hTree

end R26LA3
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma R26LA3.tree_two_le_indepNum_no_adjacent_leaves 3d41b829fc8737f9570dbbf84197551a649e7a562adc82d0ef946f487c85bcc2
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (b) `IsTree → 2 ≤ indepNum → ∀ v w, leaf v → leaf w → ¬ Adj v w`. -/
lemma tree_two_le_indepNum_no_adjacent_leaves (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    ∀ v w : V, C4LA1.IsGraphLeaf G v → C4LA1.IsGraphLeaf G w → ¬ G.Adj v w := by
  classical
  intro v w hv hw hvw
  obtain ⟨uv, _huv, huniqv⟩ := hv
  obtain ⟨uw, _huw, huniqw⟩ := hw
  have hv_uniq : w = uv := huniqv w hvw
  have hw_uniq : v = uw := huniqw v hvw.symm
  have hclosed : ∀ x y : V, (x = v ∨ x = w) → G.Adj x y → (y = v ∨ y = w) := by
    intro x y hx hxy
    rcases hx with rfl | rfl
    · right; exact (huniqv y hxy).trans hv_uniq.symm
    · left; exact (huniqw y hxy).trans hw_uniq.symm
  have hreach : ∀ u : V, G.Reachable v u := fun u => hTree.connected.preconnected v u
  have hmem : ∀ u : V, u = v ∨ u = w := by
    intro u
    obtain ⟨p⟩ := hreach u
    exact closed_reachable hclosed p (Or.inl rfl)
  obtain ⟨s, hs⟩ := G.exists_isNIndepSet_indepNum
  have hcard2 : 2 ≤ s.card := by rw [hs.card_eq]; exact hAlpha
  have hone_lt : 1 < s.card := by omega
  obtain ⟨x, hxs, y, hys, hxy⟩ := Finset.one_lt_card.mp hone_lt
  rcases hmem x with hxv | hxw <;> rcases hmem y with hyv | hyw
  · exact hxy (hxv.trans hyv.symm)
  · subst hxv; subst hyw; exact hs.isIndepSet hxs hys hxy hvw
  · subst hxw; subst hyv; exact hs.isIndepSet hxs hys hxy hvw.symm
  · exact hxy (hxw.trans hyw.symm)

end R26LA3
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma R26LA3.leafDegree_eq_zero_of_not_mem_supportSet 31bceb5b630987994ff0cab1f4378de7b94f5784c6b95018f1632283d72d75b5
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Sharp form of U3's lemma (c): a vertex that is not the support of any leaf
has `leafDegree = 0`.  No `IsTree`, no `2 ≤ indepNum`, and — unlike U3's
`interior_leafDegree_eq_zero` — no superfluous `¬ IsGraphLeaf G d`. -/
lemma leafDegree_eq_zero_of_not_mem_supportSet (G : SimpleGraph V) [DecidableRel G.Adj]
    {d : V} (hd : d ∉ supportSet G) :
    C5LA1.leafDegree G d = 0 := by
  classical
  rw [C5LA1.leafDegree_eq_filter_support, Finset.card_eq_zero]
  apply Finset.filter_false_of_mem
  intro v hv hsupp
  exact hd (Finset.mem_image.mpr ⟨v, hv, hsupp⟩)

end R26LA3
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma R26LA3.leaf_not_mem_supportSet ee8d1a987a3c6174a2a2bb811ea34fd37358cabc0e9021a6aaec665cab978f78
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- In a tree with `2 ≤ α`, no leaf is a support. -/
lemma leaf_not_mem_supportSet (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {v : V} (hv : C4LA1.IsGraphLeaf G v) :
    v ∉ supportSet G := by
  classical
  intro hmem
  obtain ⟨w, hw, hsupp⟩ := Finset.mem_image.mp hmem
  have hwleaf : C4LA1.IsGraphLeaf G w := by
    simpa [C5LA1.leafSet] using hw
  have hadj : G.Adj w v := (C5LA1.adj_iff_support_eq hwleaf).2 hsupp
  exact tree_two_le_indepNum_no_adjacent_leaves G hTree hAlpha w v hwleaf hv hadj

end R26LA3
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma R26LA3.disjoint_leafSet_supportSet 116ec8305f3bb66fd27c38e8b68b2b7e5d0ff2a87d4983ade7ae91dff809c9df
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `L(G) ∩ C(G) = ∅` when `2 ≤ α` (SEMANTIC-CONTRACT.md Section 3). -/
lemma disjoint_leafSet_supportSet (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    Disjoint (C5LA1.leafSet G) (supportSet G) := by
  classical
  rw [Finset.disjoint_left]
  intro v hv hmem
  have hvleaf : C4LA1.IsGraphLeaf G v := by
    simpa [C5LA1.leafSet] using hv
  exact leaf_not_mem_supportSet G hTree hAlpha hvleaf hmem

end R26LA3
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma R26LA3.leaf_leafDegree_eq_zero ece37960d1b1074b28224d929de60e88ae530fca4c66c4ed882d181ce709ba7a
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `λ(v) = 0` for every leaf `v` when `2 ≤ α`: with U3's (c) this is the whole
of SEMANTIC-CONTRACT.md Section 3's "`λ(v) = 0` for `v ∈ L ∪ D`". -/
lemma leaf_leafDegree_eq_zero (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {v : V} (hv : C4LA1.IsGraphLeaf G v) :
    C5LA1.leafDegree G v = 0 :=
  leafDegree_eq_zero_of_not_mem_supportSet G (leaf_not_mem_supportSet G hTree hAlpha hv)

end R26LA3
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma R26LA3.sum_leafDegree_eq_card_leafSet 7a897af167e49c9c8f6818eb93206fb5c57552c2a1385132fd4b9f95391f6d89
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (d), part 1: `∑ s, leafDegree G s = (leafSet G).card`. -/
lemma sum_leafDegree_eq_card_leafSet (G : SimpleGraph V) [DecidableRel G.Adj] :
    ∑ s : V, C5LA1.leafDegree G s = (C5LA1.leafSet G).card := by
  classical
  simp_rw [C5LA1.leafDegree_eq_filter_support]
  symm
  exact Finset.card_eq_sum_card_fiberwise (fun v _ => Finset.mem_univ (C5LA1.support G v))

end R26LA3
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma R26LA3.card_C1_le_card_leafSet 844ad182df6fcd45234f1b51e3d9a89d98eaf6618f0216461f73514dda8ab87e
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (d), part 2: `(C_1).card ≤ (leafSet G).card` where `C_1 := univ.filter (leafDegree G · = 1)`. -/
lemma card_C1_le_card_leafSet (G : SimpleGraph V) [DecidableRel G.Adj] :
    (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = 1)).card
      ≤ (C5LA1.leafSet G).card := by
  classical
  rw [← sum_leafDegree_eq_card_leafSet G]
  calc (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = 1)).card
      = ∑ s ∈ Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = 1), 1 := by
        rw [Finset.sum_const, smul_eq_mul, mul_one]
    _ = ∑ s ∈ Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = 1), C5LA1.leafDegree G s := by
        apply Finset.sum_congr rfl
        intro s hs
        exact (Finset.mem_filter.mp hs).2.symm
    _ ≤ ∑ s : V, C5LA1.leafDegree G s := Finset.sum_le_sum_of_subset (Finset.filter_subset _ _)

end R26LA3
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma R26LA3.mul_card_leafDegree_fiber_le_card_leafSet 8eb7dfeea962bb810e579fbeacacd1a3094b96f01ee055ac81ae56670eab1d19
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `j · |C_j| ≤ ℓ` for every `j`, where `C_j := {s : λ(s) = j}`.  Generalizes
U3's `card_C1_le_card_leafSet` (the case `j = 1`). -/
lemma mul_card_leafDegree_fiber_le_card_leafSet (G : SimpleGraph V) [DecidableRel G.Adj]
    (j : ℕ) :
    j * (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = j)).card
      ≤ (C5LA1.leafSet G).card := by
  classical
  rw [← sum_leafDegree_eq_card_leafSet G]
  calc j * (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = j)).card
      = ∑ _s ∈ Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = j), j := by
        rw [Finset.sum_const, smul_eq_mul]
        exact Nat.mul_comm _ _
    _ = ∑ s ∈ Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = j),
          C5LA1.leafDegree G s :=
        Finset.sum_congr rfl (fun _s hs => ((Finset.mem_filter.mp hs).2).symm)
    _ ≤ ∑ s : V, C5LA1.leafDegree G s :=
        Finset.sum_le_sum_of_subset (Finset.filter_subset _ _)

end R26LA3
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma R26LA3.two_mul_card_C2_le_card_leafSet f935b332480a97ecaad1b21cf76736484a99f8f0a4933afe188616553dd684d5
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `k₂ ≤ ⌊ℓ/2⌋` (SEMANTIC-CONTRACT.md Section 4), in the form `2·k₂ ≤ ℓ`. -/
lemma two_mul_card_C2_le_card_leafSet (G : SimpleGraph V) [DecidableRel G.Adj] :
    2 * (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = 2)).card
      ≤ (C5LA1.leafSet G).card :=
  mul_card_leafDegree_fiber_le_card_leafSet G 2

end R26LA3
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma R26LA3.eligible_three_le_indepNum 8600c622a1b3607454633865f11886e785fefd9abc6a4c886cd3ae8e499b7849
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (f) `crossingIndex G + 2 ≤ indepNum - 1 → 3 ≤ indepNum`: pure `ℕ` arithmetic
on the truncated subtraction, independent of the tree structure. -/
lemma eligible_three_le_indepNum (G : SimpleGraph V) [DecidableRel G.Adj]
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1) :
    3 ≤ G.indepNum := by omega

end R26LA3
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma R26LA3.nonleaf_degree_eq_two_of_leafSet_card_eq_two 591d8d4216b5d6bcf5e2ae25ae9ba7001d40c67f733ece0e65f3361200dd0830
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Auxiliary for (e): if a tree has EXACTLY two leaves, every non-leaf vertex
has degree exactly two. (Same handshake computation as
`card_leafSet_ge_two_of_nontrivial`, but the leaf-count equality forces the
nonleaf lower bound `2 * nonleaf.card ≤ nonleafsum` to be an equality, which
forces every summand to equal its bound.) -/
lemma nonleaf_degree_eq_two_of_leafSet_card_eq_two (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hLeafCard : (C5LA1.leafSet G).card = 2) :
    ∀ v : V, ¬ C4LA1.IsGraphLeaf G v → G.degree v = 2 := by
  classical
  have hleafSet_eq : C5LA1.leafSet G = Finset.univ.filter (fun v => G.degree v = 1) := by
    unfold C5LA1.leafSet
    apply Finset.filter_congr
    intro v _
    exact (SimpleGraph.degree_eq_one_iff_existsUnique_adj).symm
  rw [hleafSet_eq] at hLeafCard
  have hex : (Finset.univ.filter (fun v : V => G.degree v = 1)).Nonempty := by
    rw [← Finset.card_pos, hLeafCard]; norm_num
  obtain ⟨v0, hv0⟩ := hex
  have hv0deg : G.degree v0 = 1 := (Finset.mem_filter.mp hv0).2
  haveI : Nontrivial V :=
    SimpleGraph.nontrivial_of_degree_ne_zero (v := v0) (by rw [hv0deg]; norm_num)
  have hsplitcard :
      (Finset.univ.filter (fun v : V => G.degree v = 1)).card
        + (Finset.univ.filter (fun v : V => ¬ G.degree v = 1)).card = Fintype.card V := by
    rw [Finset.card_filter_add_card_filter_not, Finset.card_univ]
  have hsplitsum :
      (∑ v ∈ Finset.univ.filter (fun v : V => G.degree v = 1), G.degree v)
        + ∑ v ∈ Finset.univ.filter (fun v : V => ¬ G.degree v = 1), G.degree v
        = ∑ v : V, G.degree v := by
    exact Finset.sum_filter_add_sum_filter_not _ _ _
  have hleafsum :
      (∑ v ∈ Finset.univ.filter (fun v : V => G.degree v = 1), G.degree v)
        = (Finset.univ.filter (fun v : V => G.degree v = 1)).card := by
    rw [Finset.sum_congr rfl (fun v hv => (Finset.mem_filter.mp hv).2), Finset.sum_const,
      smul_eq_mul, mul_one]
  have hpos : ∀ v : V, 0 < G.degree v := by
    intro v
    exact hTree.connected.preconnected.degree_pos_of_nontrivial v
  have hedges : G.edgeFinset.card + 1 = Fintype.card V := hTree.card_edgeFinset
  have hsumdeg : ∑ v : V, G.degree v = 2 * G.edgeFinset.card :=
    G.sum_degrees_eq_twice_card_edges
  have hnonleafsum_eq :
      (∑ v ∈ Finset.univ.filter (fun v : V => ¬ G.degree v = 1), G.degree v)
        = 2 * (Finset.univ.filter (fun v : V => ¬ G.degree v = 1)).card := by
    omega
  intro v hv
  have hv' : v ∈ Finset.univ.filter (fun v : V => ¬ G.degree v = 1) := by
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    intro hcontra
    exact hv (SimpleGraph.degree_eq_one_iff_existsUnique_adj.mp hcontra)
  have hge2 : 2 ≤ G.degree v := by
    have hne1 : ¬ G.degree v = 1 := (Finset.mem_filter.mp hv').2
    have := hpos v
    omega
  by_contra hne2
  have hgt2 : 3 ≤ G.degree v := by omega
  set T := Finset.univ.filter (fun v : V => ¬ G.degree v = 1) with hT_def
  have hsum_split : ∑ x ∈ T, G.degree x = ∑ x ∈ T.erase v, G.degree x + G.degree v := by
    exact (Finset.sum_erase_add _ _ hv').symm
  have hrest_ge : 2 * (T.erase v).card ≤ ∑ x ∈ T.erase v, G.degree x := by
    have hstep : (∑ _x ∈ T.erase v, (2 : ℕ)) ≤ ∑ x ∈ T.erase v, G.degree x := by
      apply Finset.sum_le_sum
      intro x hx
      have hxT : x ∈ T := Finset.mem_of_mem_erase hx
      have hne1 : ¬ G.degree x = 1 := (Finset.mem_filter.mp hxT).2
      have := hpos x
      omega
    rw [Finset.sum_const, smul_eq_mul] at hstep
    omega
  have hTcard : (T.erase v).card + 1 = T.card := Finset.card_erase_add_one hv'
  rw [hT_def] at hnonleafsum_eq
  omega

end R26LA3
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma R26LA3.leafDegree_two_indepNum_eq_two_core 67b4d631399066af3e8ffd2e388e7c83a7054331b17af4f0b2fdb01a97451ca5
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (e) the `P_3` lemma: a tree with exactly two leaves, one of whose support
is adjacent to both, has `indepNum = 2` (the tree is forced to be exactly the
three-vertex path `t1 - s - t2`, i.e. `P_3`). -/
lemma leafDegree_two_indepNum_eq_two_core (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hLeafCard : (C5LA1.leafSet G).card = 2) {s : V}
    (hDeg2 : C5LA1.leafDegree G s = 2) :
    G.indepNum = 2 := by
  classical
  obtain ⟨t1, t2, htne, hpair⟩ := Finset.card_eq_two.mp hLeafCard
  have ht1_mem : t1 ∈ C5LA1.leafSet G := by rw [hpair]; exact Finset.mem_insert_self t1 {t2}
  have ht2_mem : t2 ∈ C5LA1.leafSet G := by
    rw [hpair]; exact Finset.mem_insert_of_mem (Finset.mem_singleton_self t2)
  have ht1_leaf : C4LA1.IsGraphLeaf G t1 := by
    simpa [C5LA1.leafSet] using ht1_mem
  have ht2_leaf : C4LA1.IsGraphLeaf G t2 := by
    simpa [C5LA1.leafSet] using ht2_mem
  have hDeg2' : ((C5LA1.leafSet G).filter (fun v => G.Adj v s)).card = 2 := hDeg2
  have hfilter_eq : (C5LA1.leafSet G).filter (fun v => G.Adj v s) = C5LA1.leafSet G :=
    Finset.eq_of_subset_of_card_le (Finset.filter_subset _ _) (by rw [hDeg2', hLeafCard])
  have ht1_mem_filter : t1 ∈ (C5LA1.leafSet G).filter (fun v => G.Adj v s) := by
    rw [hfilter_eq]; exact ht1_mem
  have ht2_mem_filter : t2 ∈ (C5LA1.leafSet G).filter (fun v => G.Adj v s) := by
    rw [hfilter_eq]; exact ht2_mem
  have ht1_adj : G.Adj t1 s := (Finset.mem_filter.mp ht1_mem_filter).2
  have ht2_adj : G.Adj t2 s := (Finset.mem_filter.mp ht2_mem_filter).2
  have ht1s : t1 ≠ s := G.ne_of_adj ht1_adj
  have ht2s : t2 ≠ s := G.ne_of_adj ht2_adj
  obtain ⟨u1, _hu1, huniq1⟩ := ht1_leaf
  obtain ⟨u2, _hu2, huniq2⟩ := ht2_leaf
  have hu1_eq : u1 = s := (huniq1 s ht1_adj).symm
  have hu2_eq : u2 = s := (huniq2 s ht2_adj).symm
  have ht1t2 : ¬ G.Adj t1 t2 := by
    intro hadj
    have heq : t2 = u1 := huniq1 t2 hadj
    rw [hu1_eq] at heq
    exact ht2s heq
  have hs_not_leaf : ¬ C4LA1.IsGraphLeaf G s := by
    rintro ⟨u, _hu, huniq⟩
    have e1 : t1 = u := huniq t1 ht1_adj.symm
    have e2 : t2 = u := huniq t2 ht2_adj.symm
    exact htne (e1.trans e2.symm)
  have hdegs : G.degree s = 2 :=
    nonleaf_degree_eq_two_of_leafSet_card_eq_two G hTree hLeafCard s hs_not_leaf
  have ht1_nbr : t1 ∈ G.neighborFinset s := by
    rw [SimpleGraph.mem_neighborFinset]; exact ht1_adj.symm
  have ht2_nbr : t2 ∈ G.neighborFinset s := by
    rw [SimpleGraph.mem_neighborFinset]; exact ht2_adj.symm
  have hpair_card : ({t1, t2} : Finset V).card = 2 := by
    rw [Finset.card_insert_of_notMem (by simpa using htne), Finset.card_singleton]
  have hnbr_card : (G.neighborFinset s).card = 2 := by
    rw [SimpleGraph.card_neighborFinset_eq_degree]; exact hdegs
  have hnbr_eq : G.neighborFinset s = ({t1, t2} : Finset V) := by
    symm
    apply Finset.eq_of_subset_of_card_le
    · intro y hy
      simp only [Finset.mem_insert, Finset.mem_singleton] at hy
      rcases hy with rfl | rfl
      · exact ht1_nbr
      · exact ht2_nbr
    · rw [hnbr_card, hpair_card]
  have hclosed : ∀ x y : V, (x = t1 ∨ x = s ∨ x = t2) → G.Adj x y →
      (y = t1 ∨ y = s ∨ y = t2) := by
    intro x y hx hxy
    rcases hx with hxt1 | hxs | hxt2
    · subst hxt1
      right; left; exact (huniq1 y hxy).trans hu1_eq
    · rw [hxs] at hxy
      have hy_nbr : y ∈ G.neighborFinset s := by
        rw [SimpleGraph.mem_neighborFinset]; exact hxy
      rw [hnbr_eq] at hy_nbr
      simp only [Finset.mem_insert, Finset.mem_singleton] at hy_nbr
      rcases hy_nbr with rfl | rfl
      · left; rfl
      · right; right; rfl
    · subst hxt2
      right; left; exact (huniq2 y hxy).trans hu2_eq
  have hreach : ∀ u : V, G.Reachable t1 u := fun u => hTree.connected.preconnected t1 u
  have hmem : ∀ u : V, u = t1 ∨ u = s ∨ u = t2 := by
    intro u
    obtain ⟨p⟩ := hreach u
    exact closed_reachable hclosed p (Or.inl rfl)
  have hindep_pair : G.IsIndepSet (({t1, t2} : Finset V) : Set V) := by
    rw [SimpleGraph.isIndepSet_iff]
    intro a ha b hb hab
    simp only [Finset.coe_insert, Finset.coe_singleton, Set.mem_insert_iff,
      Set.mem_singleton_iff] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact absurd rfl hab
    · exact ht1t2
    · exact fun h => ht1t2 h.symm
    · exact absurd rfl hab
  have hlower : 2 ≤ G.indepNum := by
    have hle := hindep_pair.card_le_indepNum
    rwa [hpair_card] at hle
  obtain ⟨M, hM⟩ := G.exists_isNIndepSet_indepNum
  have hMsub : M ⊆ ({t1, s, t2} : Finset V) := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton]
    exact hmem y
  have h1 : ({t1, s, t2} : Finset V).card ≤ ({s, t2} : Finset V).card + 1 :=
    Finset.card_insert_le _ _
  have h2 : ({s, t2} : Finset V).card ≤ ({t2} : Finset V).card + 1 :=
    Finset.card_insert_le _ _
  have h3 : ({t2} : Finset V).card = 1 := Finset.card_singleton _
  have htriple_card_le : ({t1, s, t2} : Finset V).card ≤ 3 := by omega
  have hs_notin2 : s ∉ ({t2} : Finset V) := by simpa using Ne.symm ht2s
  have ht1_notin2 : t1 ∉ ({s, t2} : Finset V) := by
    simp only [Finset.mem_insert, Finset.mem_singleton]
    push_neg
    exact ⟨ht1s, htne⟩
  have htriple_card_eq : ({t1, s, t2} : Finset V).card = 3 := by
    rw [Finset.card_insert_of_notMem ht1_notin2, Finset.card_insert_of_notMem hs_notin2,
      Finset.card_singleton]
  have hMcardle : M.card ≤ 3 := le_trans (Finset.card_le_card hMsub) htriple_card_le
  have hMcard_eq : M.card = G.indepNum := hM.card_eq
  have hMcard_ne3 : M.card ≠ 3 := by
    intro h3'
    have hMeq : M = ({t1, s, t2} : Finset V) :=
      Finset.eq_of_subset_of_card_le hMsub (by rw [htriple_card_eq, h3'])
    have ht1M : t1 ∈ M := by rw [hMeq]; exact Finset.mem_insert_self _ _
    have hsM : s ∈ M := by rw [hMeq]; exact Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)
    exact (hM.isIndepSet ht1M hsM ht1s) ht1_adj
  have hupper : G.indepNum ≤ 2 := by omega
  omega

end R26LA3
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma R26LA3.no_leafDegree_two_of_eligible e75e003a7a9758047a933fd03e37f8d351e9ce7fb2aae5fcc72a85793af41f4e
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The composition U3 left unassembled: on the ELIGIBLE class a tree with
`ℓ = 2` has no `λ = 2` support, hence `k₂ = 0` — exactly the `ℓ = 2` step of
the candidate finish (`C1-ALLOCATION.md` item 1(f): "`ℓ = 2` (`N_2 = 0` unless
`G = P_3`, which `hyp-eligible` excludes via `α ≥ 3`)"). -/
lemma no_leafDegree_two_of_eligible (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1)
    (hLeafCard : (C5LA1.leafSet G).card = 2) (s : V) :
    C5LA1.leafDegree G s ≠ 2 := by
  intro h
  have h3 := eligible_three_le_indepNum G hEligible
  have h2 := leafDegree_two_indepNum_eq_two_core G hTree hLeafCard h
  omega

end R26LA3
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma R26LA3.card_C2_eq_zero_of_eligible 434977feb6e38ef4779104fc1e14e9391410ad64d01ea8083a403c29cf7d4a55
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `k₂ = 0` on the eligible class when `ℓ = 2`. -/
lemma card_C2_eq_zero_of_eligible (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1)
    (hLeafCard : (C5LA1.leafSet G).card = 2) :
    (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = 2)).card = 0 := by
  classical
  rw [Finset.card_eq_zero]
  apply Finset.filter_false_of_mem
  intro s _
  exact no_leafDegree_two_of_eligible G hTree hEligible hLeafCard s

end R26LA3
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN theorem R26LA3.leafDegree_two_indepNum_eq_two a8a7146442ef8e2afecd1301ad2cda95dcb24bd8aa1d8422eb1200ca85d7044b
namespace R26LA3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (e) the `P_3` lemma: a tree with exactly two leaves, one of whose support
is adjacent to both, has `indepNum = 2` (the tree is forced to be exactly the
three-vertex path `t1 - s - t2`, i.e. `P_3`). -/
theorem leafDegree_two_indepNum_eq_two (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hLeafCard : (C5LA1.leafSet G).card = 2) {s : V}
    (hDeg2 : C5LA1.leafDegree G s = 2) :
    G.indepNum = 2 :=
  leafDegree_two_indepNum_eq_two_core G hTree hLeafCard hDeg2

end R26LA3
-- VERITYOS ENTRY 30 END

