import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition C4LA1.vertexDeletionIndepSetCount 7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The coefficient `i_k(G-v)`, represented without changing vertex types:
independent `k`-subsets of the original finite vertex type that avoid `v`. -/
def vertexDeletionIndepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (v : V) (k : Nat) : Nat :=
  (((Finset.univ.erase v).powersetCard k).filter fun s : Finset V =>
    G.IsIndepSet (s : Set V)).card

end C4LA1
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition C4LA1.vertexDeletionForwardDifference c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880
namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The forward coefficient difference `i_(p+1)(G-v) - i_p(G-v)`, with
natural counts embedded in the integers. -/
def vertexDeletionForwardDifference (G : SimpleGraph V) [DecidableRel G.Adj]
    (v : V) (p : Nat) : Int :=
  (vertexDeletionIndepSetCount G v (p + 1) : Int) -
    vertexDeletionIndepSetCount G v p

end C4LA1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition C4LA1.IsFavorableAt 25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db
namespace C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Literal strict favorability of an original leaf at rank `p`. -/
def IsFavorableAt (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (p : Nat) : Prop :=
  vertexDeletionForwardDifference G v p < 0

end C4LA1
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition C4LA1.IsGraphLeaf 65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5
namespace C4LA1

variable {V : Type*}

/-- A graph leaf has exactly one adjacent vertex. -/
def IsGraphLeaf (G : SimpleGraph V) (v : V) : Prop :=
  ∃! u, G.Adj v u

end C4LA1
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition C5LA1.leafSet 78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- The set of original leaves of `G`. -/
noncomputable
def leafSet (G : SimpleGraph V) : Finset V :=
  Finset.univ.filter (C4LA1.IsGraphLeaf G)

end C5LA1
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition C5LA1.indepSetsAvoiding ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition C5LA1.indepSetCount e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition E993Transport.favorableLeaves 16b0c7672ed66c4cb53ba24d853764df160d6694f63b231346a2eb71c390ec77
-- r30 C1-LA1 carry: declaration text byte-identical to
-- sources/c1-stage7-sources/U2-Main.lean (sha256 110c2751d073ad036e0ec63f6d73c8ea900e7f59efd850ca8e6b194a23d72743),
-- lines 1529-1532. Author: r30 U2 (Claude Sonnet 5).
-- Freeze repair 3: the U2 wrapper's `open scoped Classical` is replaced, for definitions, by
-- `open Classical in` on `favorableLeaves` and `WeightedHall` only (mirroring entry 13); every
-- definition elaborates to the identical term (`set_option pp.all true` comparison, DRAFTS/defs-pp-all.log).
namespace E993Transport

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- the fixed original strict selector `F_p(G)`. -/
noncomputable
def favorableLeaves (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) : Finset V :=
  (C5LA1.leafSet G).filter fun v => C4LA1.IsFavorableAt G v p

end E993Transport
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition E993Transport.cbEdge 84901458c1f299cbc7a74fca5dec1dec3dea642585242b696d6df7acb8a7fa7b
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- Labelling of record (FROZEN by the r31 Cycle 1 synthesis): 0 = r (root); 1 = s; 2 = v (leaf on r–s–v);
-- for i < m: u_i = 3+17i (choke), b_ij = u_i+1+2j (support, j < 8), c_ij = u_i+2+2j (private leaf, j < 8).
-- Edges: r–s, s–v, r–u_i, u_i–b_ij, b_ij–c_ij. Vertices: Fin (17*m+3) (n = 3 + m(2d+1), d = 8).
/-- The edge relation of `CB(8,m)` on `Fin (17*m+3)`: root `0`–`1`–`2` (`r`–`s`–`v`); `m` chokes
`u_i` at label `3+17i` adjacent to `r`; `8` supports `b_{ij}` at `3+17i+1+2j` adjacent to `u_i`;
one private leaf `c_{ij}` at `3+17i+2+2j` adjacent to `b_{ij}`. -/
def cbEdge (m : ℕ) (u v : Fin (17 * m + 3)) : Prop :=
  (u.val = 0 ∧ v.val = 1) ∨ (u.val = 1 ∧ v.val = 2) ∨
  ∃ i < m, (u.val = 0 ∧ v.val = 3 + 17 * i) ∨
    ∃ j < 8, (u.val = 3 + 17 * i ∧ v.val = 3 + 17 * i + 1 + 2 * j) ∨
             (u.val = 3 + 17 * i + 1 + 2 * j ∧ v.val = 3 + 17 * i + 2 + 2 * j)

end E993Transport
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition E993Transport.cbGraph 206cd48848e1208041e40cdd238a0c92f341ede8e257629cf468701ba4ebb52f
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- `CB(8,m)`, the tree of record for r31's target rank (`SEMANTIC-CONTRACT.md` §2). -/
def cbGraph (m : ℕ) : SimpleGraph (Fin (17 * m + 3)) := SimpleGraph.fromRel (cbEdge m)

end E993Transport
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition E993Transport.cbGraph_decAdj dabf806176a2765b998216113a73e1a57e7137165ce6410e32c38be98f94e52a
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- The decidable adjacency of `CB(8,m)`: `cbEdge` is a finite disjunction of equalities of
naturals and bounded `∃ i < m`, `∃ j < 8`, each decidable by the core instances, so no classical
choice is used (pattern: r30 C6-LA2 `spiderOneTwoThrees_decAdj`, r30 C4-LA1 `gkGraph_decAdj`). -/
@[reducible, instance]
def cbGraph_decAdj (m : ℕ) : DecidableRel (cbGraph m).Adj := fun u v =>
  haveI : ∀ a b : Fin (17 * m + 3), Decidable (cbEdge m a b) := fun a b => by
    unfold cbEdge
    infer_instance
  decidable_of_iff (u ≠ v ∧ (cbEdge m u v ∨ cbEdge m v u))
    (SimpleGraph.fromRel_adj (cbEdge m) u v).symm

end E993Transport
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition E993Transport.cbVertex 8a1b06d43ac1f07c0c1b81f814493fb47ff9f2e61b9fa806c80e0ab6c084dffa
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- the vertex of `CB(8,m)` with label `n` (labels `n < 17m+3` are the vertices of record). -/
def cbVertex (m n : ℕ) : Fin (17 * m + 3) := ⟨n % (17 * m + 3), Nat.mod_lt _ (by omega)⟩

end E993Transport
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition E993Transport.polyCoeffZ 046f659b7d033efef4613b69f6f6192013a62df02806d99ad4013ef00d9a5f9f
namespace E993Transport

open Polynomial

/-- Integer-indexed coefficient sequence of an integer polynomial: `polyCoeffZ p i` is the
coefficient of `X ^ i` for `0 ≤ i` and `0` for `i < 0`. Auxiliary (r31 C1-LA3, formalizer). -/
def polyCoeffZ (p : ℤ[X]) (i : ℤ) : ℤ :=
  if i < 0 then 0 else p.coeff i.toNat

end E993Transport
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition E993Transport.critU3T_indepPoly 81c7a11df4dffb0882a43a1a04a0ba5a58188d5f4966a5edfe9b0d7856fbf63f
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 152–155.
/-- The independent-set generating polynomial of `G − D` over `ℕ` (critic C-U3-T, scratch). -/
noncomputable
def critU3T_indepPoly (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V) :
    Polynomial ℕ :=
  ∑ k ∈ Finset.range (Fintype.card V + 1), Polynomial.monomial k (C5LA1.indepSetCount G D k)

end E993Transport
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition E993Transport.critU3T_cbPart 6501549155030af35fc7ca1984043ec8754fc5de50beaec2e030412e8cedefad
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 270–276.
/-- The branch parts of `CB(8,m) − r` (critic C-U3-T): part `0` is the pendant `{s, v}` (labels 1, 2);
part `i + 1` is the choke gadget of `u_i` (labels `3+17i .. 3+17i+16`: `u_i`, its 8 supports, its 8
private leaves). -/
def critU3T_cbPart (m i : ℕ) : Finset (Fin (17 * m + 3)) :=
  Finset.univ.filter (fun a : Fin (17 * m + 3) =>
    (i = 0 ∧ (a.val = 1 ∨ a.val = 2)) ∨
      (i ≠ 0 ∧ 3 + 17 * (i - 1) ≤ a.val ∧ a.val < 3 + 17 * (i - 1) + 17))

end E993Transport
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma E993Transport.cbVertex_val c6accdf2872bf41acb9ddf524f60282afed933a76da5fdb142a88e29d571e223
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbVertex_val (m n : ℕ) (h : n < 17 * m + 3) : (cbVertex m n).val = n :=
  Nat.mod_eq_of_lt h

end E993Transport
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma E993Transport.eq_cbVertex_iff e31d191c4e64507642d9e3cb70b9b13fae338e921de4968c9e69504a4d7ccd66
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma eq_cbVertex_iff (m n : ℕ) (h : n < 17 * m + 3) (v : Fin (17 * m + 3)) :
    v = cbVertex m n ↔ v.val = n := by
  rw [Fin.ext_iff, cbVertex_val m n h]

end E993Transport
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma E993Transport.cbGraph_adj_iff b462cedd206638d7cd619f9a0d7ad1ccb6f5e6f1c25e86a2b3814692d9a60d4b
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_iff (m : ℕ) (u v : Fin (17 * m + 3)) :
    (cbGraph m).Adj u v ↔ cbEdge m u v ∨ cbEdge m v u := by
  have hne : ∀ a b : Fin (17 * m + 3), cbEdge m a b → a ≠ b := by
    intro a b h hab
    subst hab
    unfold cbEdge at h
    rcases h with h | h | ⟨i, -, h | ⟨j, -, h | h⟩⟩ <;> omega
  rw [cbGraph, SimpleGraph.fromRel_adj]
  constructor
  · exact fun h => h.2
  · intro h
    refine ⟨?_, h⟩
    rcases h with h | h
    · exact hne u v h
    · exact fun huv => hne v u h huv.symm

end E993Transport
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma E993Transport.cbGraph_adj_iff_val 0d82fdf8407ffb57f4f7cb4e17f42bd15f2b5db9985cbd802c1f81b624c99912
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_iff_val (m : ℕ) (u v : Fin (17 * m + 3)) :
    (cbGraph m).Adj u v ↔ cbEdge m u v ∨ cbEdge m v u := cbGraph_adj_iff m u v

end E993Transport
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma E993Transport.cbGraph_adj_of_val 07d238df818cfdf7b573eaa17c924159094dabe9ef58829817fb4aee955eef21
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_of_val (m : ℕ) (u v : Fin (17 * m + 3)) (h : cbEdge m u v) :
    (cbGraph m).Adj u v := (cbGraph_adj_iff m u v).mpr (Or.inl h)

end E993Transport
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma E993Transport.cbGraph_adj_r_s fe0ea61f6049522a9452bcb38e333e98b92249c2de63e3542335e6f0af2c93ec
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_r_s (m : ℕ) : (cbGraph m).Adj (cbVertex m 0) (cbVertex m 1) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m 0 (by omega), cbVertex_val m 1 (by omega)]; exact Or.inl ⟨rfl, rfl⟩)

end E993Transport
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma E993Transport.cbGraph_adj_s_v 79bcebf1d707141783cac3436aaafbe0bf9f778de301fce76c7d572019dff008
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_s_v (m : ℕ) : (cbGraph m).Adj (cbVertex m 1) (cbVertex m 2) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m 1 (by omega), cbVertex_val m 2 (by omega)]
    exact Or.inr (Or.inl ⟨rfl, rfl⟩))

end E993Transport
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma E993Transport.cbGraph_adj_r_choke bf806398b632a71b8a77006b213fa2b9e5db1d44dcb2a400bcd6184162e5a570
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_r_choke (m i : ℕ) (hi : i < m) :
    (cbGraph m).Adj (cbVertex m 0) (cbVertex m (3 + 17 * i)) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m 0 (by omega), cbVertex_val m (3 + 17 * i) (by omega)]
    exact Or.inr (Or.inr ⟨i, hi, Or.inl ⟨rfl, rfl⟩⟩))

end E993Transport
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma E993Transport.cbGraph_adj_choke_support e9ba1eb05fffafad702a6b31518a800b974e91accd31b55b72d53853d50c3088
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_choke_support (m i j : ℕ) (hi : i < m) (hj : j < 8) :
    (cbGraph m).Adj (cbVertex m (3 + 17 * i)) (cbVertex m (3 + 17 * i + 1 + 2 * j)) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m (3 + 17 * i) (by omega), cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega)]
    exact Or.inr (Or.inr ⟨i, hi, Or.inr ⟨j, hj, Or.inl ⟨rfl, rfl⟩⟩⟩))

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma E993Transport.cbGraph_adj_support_leaf 2c41bee31dd97c88dfe6551f3e6fdf9c09c51c05982e37ee1fce58a8a4807859
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cbGraph_adj_support_leaf (m i j : ℕ) (hi : i < m) (hj : j < 8) :
    (cbGraph m).Adj (cbVertex m (3 + 17 * i + 1 + 2 * j)) (cbVertex m (3 + 17 * i + 2 + 2 * j)) :=
  cbGraph_adj_of_val m _ _ (by
    unfold cbEdge
    rw [cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega),
        cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)]
    exact Or.inr (Or.inr ⟨i, hi, Or.inr ⟨j, hj, Or.inr ⟨rfl, rfl⟩⟩⟩))

end E993Transport
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma E993Transport.cb_val_cases 5d74bbd3141e6d8811691fc06303c109616ecb9a372f00bb70e56f9ec54efaa6
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- exhaustive, label-level case split (0<m case: covers every label of `CB(8,m)`). -/
lemma cb_val_cases (m n : ℕ) (h : n < 17 * m + 3) :
    n = 0 ∨ n = 1 ∨ n = 2 ∨ (∃ i < m, n = 3 + 17 * i) ∨
    (∃ i < m, ∃ j < 8, n = 3 + 17 * i + 1 + 2 * j) ∨
    (∃ i < m, ∃ j < 8, n = 3 + 17 * i + 2 + 2 * j) := by
  by_cases h2 : n ≤ 2
  · omega
  · set i := (n - 3) / 17 with hidef
    set q := (n - 3) % 17 with hqdef
    have hi : i < m := by omega
    by_cases hq0 : q = 0
    · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨i, hi, by omega⟩)))
    · by_cases hqodd : q % 2 = 1
      · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨i, hi, (q - 1) / 2, by omega, by omega⟩))))
      · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ⟨i, hi, (q - 2) / 2, by omega, by omega⟩))))

end E993Transport
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma E993Transport.cb_leaf_cases c88c5b63b3eeb9356c3783b409f5a19e21bbed79875029585c18c643a7bcc9be
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- (F0) a leaf of `CB(8,m)` (`m ≥ 1`) is `v` (label `2`) or a private leaf `c_{ij}`. -/
lemma cb_leaf_cases (m : ℕ) (hm : 0 < m) (τ : Fin (17 * m + 3))
    (hleaf : C4LA1.IsGraphLeaf (cbGraph m) τ) :
    τ.val = 2 ∨ ∃ i < m, ∃ j < 8, τ.val = 3 + 17 * i + 2 + 2 * j := by
  obtain ⟨s, -, huniq⟩ := hleaf
  have two : ∀ u w, (cbGraph m).Adj τ u → (cbGraph m).Adj τ w → u.val = w.val := by
    intro u w hu hw; rw [huniq u hu, huniq w hw]
  have hlt := τ.isLt
  rcases cb_val_cases m τ.val hlt with h0 | h1 | h2 | ⟨i, hi, hc⟩ | ⟨i, hi, j, hj, hb⟩ |
    ⟨i, hi, j, hj, hl⟩
  · exfalso
    have hτeq : τ = cbVertex m 0 := (eq_cbVertex_iff m 0 (by omega) τ).mpr h0
    have hadj1 : (cbGraph m).Adj τ (cbVertex m 1) := by rw [hτeq]; exact cbGraph_adj_r_s m
    have hadj2 : (cbGraph m).Adj τ (cbVertex m (3 + 17 * 0)) := by
      rw [hτeq]; exact cbGraph_adj_r_choke m 0 hm
    have hval := two _ _ hadj1 hadj2
    rw [cbVertex_val m 1 (by omega), cbVertex_val m (3 + 17 * 0) (by omega)] at hval
    omega
  · exfalso
    have hτeq : τ = cbVertex m 1 := (eq_cbVertex_iff m 1 (by omega) τ).mpr h1
    have hadj1 : (cbGraph m).Adj τ (cbVertex m 0) := by
      rw [hτeq]; exact (cbGraph_adj_r_s m).symm
    have hadj2 : (cbGraph m).Adj τ (cbVertex m 2) := by rw [hτeq]; exact cbGraph_adj_s_v m
    have hval := two _ _ hadj1 hadj2
    rw [cbVertex_val m 0 (by omega), cbVertex_val m 2 (by omega)] at hval
    omega
  · exact Or.inl h2
  · exfalso
    have hτeq : τ = cbVertex m (3 + 17 * i) := (eq_cbVertex_iff m (3 + 17 * i) (by omega) τ).mpr hc
    have hadj1 : (cbGraph m).Adj τ (cbVertex m 0) := by
      rw [hτeq]; exact (cbGraph_adj_r_choke m i hi).symm
    have hadj2 : (cbGraph m).Adj τ (cbVertex m (3 + 17 * i + 1 + 2 * 0)) := by
      rw [hτeq]; exact cbGraph_adj_choke_support m i 0 hi (by omega)
    have hval := two _ _ hadj1 hadj2
    rw [cbVertex_val m 0 (by omega), cbVertex_val m (3 + 17 * i + 1 + 2 * 0) (by omega)] at hval
    omega
  · exfalso
    have hτeq : τ = cbVertex m (3 + 17 * i + 1 + 2 * j) :=
      (eq_cbVertex_iff m (3 + 17 * i + 1 + 2 * j) (by omega) τ).mpr hb
    have hadj1 : (cbGraph m).Adj τ (cbVertex m (3 + 17 * i)) := by
      rw [hτeq]; exact (cbGraph_adj_choke_support m i j hi hj).symm
    have hadj2 : (cbGraph m).Adj τ (cbVertex m (3 + 17 * i + 2 + 2 * j)) := by
      rw [hτeq]; exact cbGraph_adj_support_leaf m i j hi hj
    have hval := two _ _ hadj1 hadj2
    rw [cbVertex_val m (3 + 17 * i) (by omega),
        cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)] at hval
    omega
  · exact Or.inr ⟨i, hi, j, hj, hl⟩

end E993Transport
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma E993Transport.cb_isGraphLeaf_of_cases f138151e922a73bbc05816e8c1246588ac8eb57c0664737dca51575521c5ecb6
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
/-- (F0) `v` and the private leaves `c_{ij}` are leaves of `CB(8,m)`. -/
lemma cb_isGraphLeaf_of_cases (m : ℕ) (τ : Fin (17 * m + 3))
    (h : τ.val = 2 ∨ ∃ i < m, ∃ j < 8, τ.val = 3 + 17 * i + 2 + 2 * j) :
    C4LA1.IsGraphLeaf (cbGraph m) τ := by
  have hlt := τ.isLt
  rcases h with h | ⟨i, hi, j, hj, h⟩
  · refine ⟨cbVertex m 1, by
      rw [(eq_cbVertex_iff m 2 (by omega) τ).mpr h]; exact (cbGraph_adj_s_v m).symm, ?_⟩
    intro w hw
    rw [(eq_cbVertex_iff m 2 (by omega) τ).mpr h, cbGraph_adj_iff_val] at hw
    apply Fin.ext
    rw [cbVertex_val m 1 (by omega)]
    unfold cbEdge at hw
    rw [cbVertex_val m 2 (by omega)] at hw
    rcases hw with (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) |
      (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) <;> omega
  · refine ⟨cbVertex m (3 + 17 * i + 1 + 2 * j), by
      rw [(eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) τ).mpr h]
      exact (cbGraph_adj_support_leaf m i j hi hj).symm, ?_⟩
    intro w hw
    rw [(eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) τ).mpr h, cbGraph_adj_iff_val] at hw
    apply Fin.ext
    rw [cbVertex_val m (3 + 17 * i + 1 + 2 * j) (by omega)]
    unfold cbEdge at hw
    rw [cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)] at hw
    rcases hw with (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) |
      (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) <;> omega

end E993Transport
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma E993Transport.mem_leafSet_cbGraph_iff d94a4323f5ed4b636c98e2147b5569f342f03438d92dc635594afede03baa0fd
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U1 (Claude Sonnet 5) Lean layer, transmitted verbatim in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- **The CB(8,m) leaf layer.** `leafSet(CB(8,m)) = {v} ∪ {c_{ij} : i < m, j < 8}` (`m ≥ 1`;
`SEMANTIC-CONTRACT.md` §2, `leafSet = {v} ∪ C`). -/
lemma mem_leafSet_cbGraph_iff (m : ℕ) (hm : 0 < m) (τ : Fin (17 * m + 3)) :
    τ ∈ C5LA1.leafSet (cbGraph m) ↔
      τ.val = 2 ∨ ∃ i < m, ∃ j < 8, τ.val = 3 + 17 * i + 2 + 2 * j := by
  constructor
  · intro hτ
    have hleaf : C4LA1.IsGraphLeaf (cbGraph m) τ := by simpa [C5LA1.leafSet] using hτ
    exact cb_leaf_cases m hm τ hleaf
  · intro h
    have hleaf := cb_isGraphLeaf_of_cases m τ h
    simpa [C5LA1.leafSet] using hleaf

end E993Transport
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma E993Transport.cb_leafSet_eq_image faa4b7f4dfddb4189bad0e8fa5f5993f9342a3529872ebf68f291451dcff4c6e
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-T (Claude Opus 5.5), scratch in C-U1-T `CriticAdvance.lean` (c94ef3bd…).
lemma cb_leafSet_eq_image (m : ℕ) (hm : 0 < m) :
    C5LA1.leafSet (cbGraph m) =
      insert (cbVertex m 2) ((Finset.range m ×ˢ Finset.range 8).image
        (fun p => cbVertex m (3 + 17 * p.1 + 2 + 2 * p.2))) := by
  ext τ
  rw [mem_leafSet_cbGraph_iff m hm τ, Finset.mem_insert, Finset.mem_image]
  have hlt := τ.isLt
  constructor
  · rintro (h | ⟨i, hi, j, hj, h⟩)
    · exact Or.inl ((eq_cbVertex_iff m 2 (by omega) τ).mpr h)
    · refine Or.inr ⟨(i, j), ?_, ?_⟩
      · simp only [Finset.mem_product, Finset.mem_range]; exact ⟨hi, hj⟩
      · exact ((eq_cbVertex_iff m (3 + 17 * i + 2 + 2 * j) (by omega) τ).mpr h).symm
  · rintro (h | ⟨⟨i, j⟩, hij, h⟩)
    · exact Or.inl (h ▸ cbVertex_val m 2 (by omega))
    · simp only [Finset.mem_product, Finset.mem_range] at hij
      refine Or.inr ⟨i, hij.1, j, hij.2, ?_⟩
      rw [← h]; exact cbVertex_val m (3 + 17 * i + 2 + 2 * j) (by omega)

end E993Transport
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma E993Transport.favorableLeaves_eq_leafSet_of_all dd382623d12aa41b616927c1fd5fc78b5f38325e09bae5cb8bbec83c639330a2
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-F (Claude Opus 5.5), scratch `Audit.lean` critic section (C-U1-F lean-check).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- critic (graph-generic): if every original leaf is strictly favorable at `p`, the selector is the whole leaf set.
This is the exact shape in which the favorability key must enter the terminal's fourth conjunct. -/
lemma favorableLeaves_eq_leafSet_of_all {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (h : ∀ v ∈ C5LA1.leafSet G, C4LA1.IsFavorableAt G v p) :
    favorableLeaves G p = C5LA1.leafSet G := by
  classical
  unfold favorableLeaves
  exact Finset.filter_true_of_mem h

end E993Transport
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma E993Transport.mem_neighborFinset_choke_iff 1cca2da81fcd6303f0df5590affc964b75473f52991d6b83102d10a27f11c124
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-F (Claude Opus 5.5), scratch `Audit.lean` critic section (C-U1-F lean-check).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- critic: the neighbourhood of a choke, `N(u_i) = {r} ∪ {b_{ij} : j < 8}` (consumed by the switch relation
`|N(u) ∩ B| = 2` of `transportRel`). -/
lemma mem_neighborFinset_choke_iff (m i : ℕ) (hi : i < m) (w : Fin (17 * m + 3)) :
    w ∈ (cbGraph m).neighborFinset (cbVertex m (3 + 17 * i)) ↔
      w.val = 0 ∨ ∃ j < 8, w.val = 3 + 17 * i + 1 + 2 * j := by
  rw [SimpleGraph.mem_neighborFinset, cbGraph_adj_iff_val]
  unfold cbEdge
  rw [cbVertex_val m (3 + 17 * i) (by omega)]
  have hlt := w.isLt
  constructor
  · rintro ((h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) | (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩))
    all_goals first
      | omega
      | (right; exact ⟨j', hj', by omega⟩)
  · rintro (h | ⟨j, hj, h⟩)
    · exact Or.inr (Or.inr (Or.inr ⟨i, hi, Or.inl ⟨h, rfl⟩⟩))
    · exact Or.inl (Or.inr (Or.inr ⟨i, hi, Or.inr ⟨j, hj, Or.inl ⟨rfl, h⟩⟩⟩))

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma E993Transport.mem_neighborFinset_root_iff 8e28d4f326b15eda940000970abbeb1d3c5e08a32cfb576a5160c81b0a43f436
namespace E993Transport

-- r31 C1-LA2 formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U1-F (Claude Opus 5.5), scratch `Audit.lean` critic section (C-U1-F lean-check).
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
/-- critic: the neighbourhood of the root, `N(r) = {s} ∪ {u_i : i < m}`. -/
lemma mem_neighborFinset_root_iff (m : ℕ) (w : Fin (17 * m + 3)) :
    w ∈ (cbGraph m).neighborFinset (cbVertex m 0) ↔ w.val = 1 ∨ ∃ i < m, w.val = 3 + 17 * i := by
  rw [SimpleGraph.mem_neighborFinset, cbGraph_adj_iff_val]
  unfold cbEdge
  rw [cbVertex_val m 0 (by omega)]
  have hlt := w.isLt
  constructor
  · rintro ((h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩) | (h' | h' | ⟨i', hi', h' | ⟨j', hj', h' | h'⟩⟩))
    all_goals first
      | omega
      | (right; exact ⟨i', hi', by omega⟩)
  · rintro (h | ⟨i, hi, h⟩)
    · exact Or.inl (Or.inl ⟨rfl, h⟩)
    · exact Or.inl (Or.inr (Or.inr ⟨i, hi, Or.inl ⟨rfl, h⟩⟩))

end E993Transport
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma E993Transport.descent_of_recurrence_logconcave 7be63ac8eb845bce953cef4e1c3f1b473c9eb06bea85ba3eb52ca2ad4d95d679
namespace E993Transport

open Polynomial

/-- The closing step (C-U3-T, Lemma A closing step; re-authored from C-U3-T's Critic.lean
DRAFT scratch, never carried): three consecutive terms with `r0, r1 > 0`, the recurrence (R) at
`k`, one-point log-concavity and `3a + 4b + 2 ≤ 6k` force `r2 < r1`. -/
lemma descent_of_recurrence_logconcave (a b k r0 r1 r2 : ℤ)
    (hk : 0 ≤ k) (h0 : 0 < r0) (h1 : 0 < r1) (hB : k ≤ a + b + 1)
    (hrec : (k + 1) * r2 = (a + 2 * b - 3 * k) * r1 + 2 * (a + b - k + 1) * r0)
    (hlc : r0 * r2 ≤ r1 * r1) (hgap : 3 * a + 4 * b + 2 ≤ 6 * k) : r2 < r1 := by
  by_contra hcon
  rw [not_lt] at hcon
  have hr01 : r0 ≤ r1 := by
    have : r0 * r1 ≤ r1 * r1 := le_trans (mul_le_mul_of_nonneg_left hcon h0.le) hlc
    exact le_of_mul_le_mul_right this h1
  have hc : 0 ≤ a + b - k + 1 := by linarith
  have step : (k + 1) * r1 ≤ (3 * a + 4 * b - 5 * k + 2) * r1 := by
    have e1 : (k + 1) * r1 ≤ (k + 1) * r2 := mul_le_mul_of_nonneg_left hcon (by linarith)
    have e2 : 2 * (a + b - k + 1) * r0 ≤ 2 * (a + b - k + 1) * r1 :=
      mul_le_mul_of_nonneg_left hr01 (by linarith)
    nlinarith
  have := le_of_mul_le_mul_right step h1
  linarith

end E993Transport
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma E993Transport.twoBinom_derivative_identity 63ad7e5309d3418f643650fc656162f808ef36f1c0a0191950a5151d88753b71
namespace E993Transport

open Polynomial

/-- The derivative identity
`(1+X)(1+2X) · P' = (a(1+2X) + 2b(1+X)) · P` for `P = (1+X)^a (1+2X)^b`, written with
`(1+X)(1+2X) = 1 + 3X + 2X^2`. -/
lemma twoBinom_derivative_identity (a b : ℕ) :
    (1 + 3 * X + 2 * X ^ 2) * derivative ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) =
      (C ((a : ℤ) + 2 * b) + C (2 * (a : ℤ) + 2 * b) * X) * ((1 + X) ^ a * (1 + 2 * X) ^ b) := by
  rcases a with _ | a <;> rcases b with _ | b
  · simp
  · simp only [derivative_mul, derivative_pow_succ]
    simp
    ring
  · simp only [derivative_mul, derivative_pow_succ]
    simp
    ring
  · simp only [derivative_mul, derivative_pow_succ]
    simp
    ring

end E993Transport
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma E993Transport.twoBinomCoeff_recurrence d60b214129419ccdf8cd12a466c639c1f83da6cce1f52f3b1d61366905f7b891
namespace E993Transport

open Polynomial

/-- (R): the three-term coefficient recurrence of `(1+X)^a (1+2X)^b` at `k = n + 1`:
`(k+1) r(k+1) = (a + 2b - 3k) r(k) + 2(a + b - k + 1) r(k-1)`. -/
lemma twoBinomCoeff_recurrence (a b n : ℕ) :
    ((n : ℤ) + 2) * ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 2) =
      ((a : ℤ) + 2 * b - 3 * (n + 1)) * ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 1) +
        2 * ((a : ℤ) + b - n) * ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff n := by
  set P : ℤ[X] := (1 + X) ^ a * (1 + 2 * X) ^ b with hP
  have h := congrArg (fun q : ℤ[X] => q.coeff (n + 1)) (twoBinom_derivative_identity a b)
  rw [← hP] at h
  have hL : ((1 + 3 * X + 2 * X ^ 2) * derivative P).coeff (n + 1) =
      P.coeff (n + 2) * ((n : ℤ) + 2) + 3 * (P.coeff (n + 1) * ((n : ℤ) + 1)) +
        2 * (P.coeff n * (n : ℤ)) := by
    have e : (1 + 3 * X + 2 * X ^ 2) * derivative P =
        derivative P + C 3 * (X * derivative P) + C 2 * (X ^ 2 * derivative P) := by
      simp only [map_ofNat]; ring
    rw [e, coeff_add, coeff_add, coeff_C_mul, coeff_C_mul, coeff_X_mul, coeff_derivative,
      coeff_derivative]
    rcases n with _ | n
    · simp [coeff_X_pow_mul']
    · rw [show n + 1 + 1 = n + 2 from rfl, coeff_X_pow_mul, coeff_derivative]
      push_cast; ring
  have hR : ((C ((a : ℤ) + 2 * b) + C (2 * (a : ℤ) + 2 * b) * X) * P).coeff (n + 1) =
      ((a : ℤ) + 2 * b) * P.coeff (n + 1) + (2 * (a : ℤ) + 2 * b) * P.coeff n := by
    rw [add_mul, coeff_add, coeff_C_mul, mul_assoc, coeff_C_mul, coeff_X_mul]
  rw [hL, hR] at h
  linear_combination h

end E993Transport
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma E993Transport.polyCoeffZ_natCast 4c3bf9dcf2a367fb88d5a49b18837f0e18768a66d4d5774b7e5a28979ac1c940
namespace E993Transport

open Polynomial

/-- `polyCoeffZ` agrees with `Polynomial.coeff` at natural indices. -/
lemma polyCoeffZ_natCast (p : ℤ[X]) (n : ℕ) : polyCoeffZ p (n : ℤ) = p.coeff n := by
  simp [polyCoeffZ]

end E993Transport
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma E993Transport.polyCoeffZ_of_neg 3cd1bd212783c3eb57c95fb443c9ea94cfa4ae19f40c37e9d1e83520fe737c08
namespace E993Transport

open Polynomial

/-- `polyCoeffZ` vanishes at negative indices. -/
lemma polyCoeffZ_of_neg (p : ℤ[X]) (i : ℤ) (hi : i < 0) : polyCoeffZ p i = 0 := by
  simp [polyCoeffZ, hi]

end E993Transport
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma E993Transport.polyCoeffZ_one 124ae5c48f85f9b8ae1fe5842db3164f7c6feb80ac516db56dce2bd533cbd456
namespace E993Transport

open Polynomial

/-- The integer-indexed coefficients of `1`. -/
lemma polyCoeffZ_one (i : ℤ) : polyCoeffZ (1 : ℤ[X]) i = if i = 0 then 1 else 0 := by
  unfold polyCoeffZ
  by_cases hi : i < 0
  · simp [hi]; omega
  · obtain ⟨n, rfl⟩ := Int.eq_ofNat_of_zero_le (not_lt.mp hi)
    rcases n with _ | n
    · simp
    · simp [coeff_one]
      omega

end E993Transport
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma E993Transport.polyCoeffZ_linear_mul 3459fc88eb9ce095b0f01978ec725389ed51de6ad1fd7d21fac1d2f7c5d703ed
namespace E993Transport

open Polynomial

/-- Multiplying by a linear factor `1 + cX`: `s(i) = r(i) + c · r(i-1)` at every integer index. -/
lemma polyCoeffZ_linear_mul (p : ℤ[X]) (c i : ℤ) :
    polyCoeffZ ((1 + C c * X) * p) i = polyCoeffZ p i + c * polyCoeffZ p (i - 1) := by
  by_cases hi : i < 0
  · rw [polyCoeffZ_of_neg _ _ hi, polyCoeffZ_of_neg _ _ hi, polyCoeffZ_of_neg _ _ (by omega)]
    ring
  · obtain ⟨n, rfl⟩ := Int.eq_ofNat_of_zero_le (not_lt.mp hi)
    have e : (1 + C c * X) * p = p + C c * (X * p) := by ring
    rcases n with _ | n
    · rw [polyCoeffZ_natCast, polyCoeffZ_natCast, polyCoeffZ_of_neg _ _ (by omega), e,
        coeff_add, coeff_C_mul]
      simp
    · rw [polyCoeffZ_natCast, polyCoeffZ_natCast,
        show ((n + 1 : ℕ) : ℤ) - 1 = (n : ℤ) by push_cast; ring, polyCoeffZ_natCast, e,
        coeff_add, coeff_C_mul, coeff_X_mul]

end E993Transport
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma E993Transport.strongLC_linear_step d787f5498d99542c3aa877607acadf4da9083888cfad1282baad7d96ef6bcceb
namespace E993Transport

open Polynomial

/-- Factor step of log-concavity (no Newton, no Darroch): the two-by-two minor inequality
`f(i-1) f(j+1) ≤ f(i) f(j)` for all `i ≤ j` is preserved by `f ↦ f + c · f(· - 1)` with `0 ≤ c`. -/
lemma strongLC_linear_step (f : ℤ → ℤ) (c : ℤ) (hc : 0 ≤ c)
    (hf : ∀ i j : ℤ, i ≤ j → f (i - 1) * f (j + 1) ≤ f i * f j) :
    ∀ i j : ℤ, i ≤ j →
      (f (i - 1) + c * f (i - 1 - 1)) * (f (j + 1) + c * f (j + 1 - 1)) ≤
        (f i + c * f (i - 1)) * (f j + c * f (j - 1)) := by
  intro i j hij
  have hA := hf i j hij
  have hC := hf (i - 1) (j - 1) (by linarith)
  rw [sub_add_cancel] at hC
  have hM : f (i - 1 - 1) * f (j + 1) ≤ f i * f (j - 1) := by
    rcases lt_or_eq_of_le hij with hlt | heq
    · have h1 := hf i (j - 1) (by linarith)
      rw [sub_add_cancel] at h1
      have h2 := hf (i - 1) j (by linarith)
      linarith
    · subst heq
      have h2 := hf (i - 1) i (by linarith)
      linarith
  rw [add_sub_cancel_right]
  have hM' := mul_le_mul_of_nonneg_left hM hc
  have hC' := mul_le_mul_of_nonneg_left hC (mul_nonneg hc hc)
  nlinarith

end E993Transport
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma E993Transport.twoBinom_succ_left a661a5422e938a23adf197c83ce03c17d6e749a9313c245a5031a6d5a1a5876c
namespace E993Transport

open Polynomial

/-- Peeling one factor `1 + X`. -/
lemma twoBinom_succ_left (a b : ℕ) :
    ((1 + X) ^ (a + 1) * (1 + 2 * X) ^ b : ℤ[X]) =
      (1 + C 1 * X) * ((1 + X) ^ a * (1 + 2 * X) ^ b) := by
  simp only [map_one]; ring

end E993Transport
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma E993Transport.twoBinom_succ_right 2759f45c072c96b98ad9a6be9e94af7e61dd6c2ca2e31d7a55fe3d7235370be0
namespace E993Transport

open Polynomial

/-- Peeling one factor `1 + 2X`. -/
lemma twoBinom_succ_right (a b : ℕ) :
    ((1 + X) ^ a * (1 + 2 * X) ^ (b + 1) : ℤ[X]) =
      (1 + C 2 * X) * ((1 + X) ^ a * (1 + 2 * X) ^ b) := by
  simp only [map_ofNat]; ring

end E993Transport
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma E993Transport.polyCoeffZ_linear_mul_nonneg_pos 9b25fa4db728eee090ffbdf7182be9c750e8bf8d07f2a0f8d5d75e865900c12b
namespace E993Transport

open Polynomial

/-- Factor step of positivity: nonnegativity everywhere and positivity on `[0, N]` pass to
`(1 + cX) · p` with positivity on `[0, N + 1]`, for `0 < c`. -/
lemma polyCoeffZ_linear_mul_nonneg_pos (p : ℤ[X]) (c : ℤ) (hc : 0 < c) (N : ℕ)
    (hnn : ∀ i : ℤ, 0 ≤ polyCoeffZ p i)
    (hpos : ∀ i : ℤ, 0 ≤ i → i ≤ N → 0 < polyCoeffZ p i) :
    (∀ i : ℤ, 0 ≤ polyCoeffZ ((1 + C c * X) * p) i) ∧
      (∀ i : ℤ, 0 ≤ i → i ≤ (N + 1 : ℕ) → 0 < polyCoeffZ ((1 + C c * X) * p) i) := by
  refine ⟨fun i => ?_, fun i hi0 hiN => ?_⟩
  · rw [polyCoeffZ_linear_mul]
    have := hnn i
    have := mul_nonneg hc.le (hnn (i - 1))
    linarith
  · rw [polyCoeffZ_linear_mul]
    have h1 := hnn i
    have h2 := mul_nonneg hc.le (hnn (i - 1))
    push_cast at hiN
    by_cases hle : i ≤ N
    · have := hpos i hi0 hle
      linarith
    · have := hpos (i - 1) (by omega) (by omega)
      have := mul_pos hc this
      linarith

end E993Transport
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma E993Transport.twoBinomCoeffZ_nonneg_pos 8db51d28180bafedd83eb8bca3225379c85c478498b64681f87a0671c7de8a58
namespace E993Transport

open Polynomial

/-- Nonnegativity of all coefficients and positivity on `[0, a + b]`, by factor induction. -/
lemma twoBinomCoeffZ_nonneg_pos (a b : ℕ) :
    (∀ i : ℤ, 0 ≤ polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) i) ∧
      (∀ i : ℤ, 0 ≤ i → i ≤ (a + b : ℕ) →
        0 < polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) i) := by
  induction a with
  | zero =>
    induction b with
    | zero =>
      refine ⟨fun i => ?_, fun i hi0 hiN => ?_⟩
      · rw [pow_zero, pow_zero, mul_one, polyCoeffZ_one]; split_ifs <;> norm_num
      · rw [pow_zero, pow_zero, mul_one, polyCoeffZ_one]
        push_cast at hiN
        rw [if_pos (by omega)]; norm_num
    | succ b ih =>
      rw [twoBinom_succ_right]
      have := polyCoeffZ_linear_mul_nonneg_pos _ 2 (by norm_num) (0 + b) ih.1 ih.2
      simpa [Nat.add_assoc] using this
  | succ a ih =>
    rw [twoBinom_succ_left]
    have := polyCoeffZ_linear_mul_nonneg_pos _ 1 (by norm_num) (a + b) ih.1 ih.2
    refine ⟨this.1, fun i hi0 hiN => this.2 i hi0 ?_⟩
    push_cast at hiN ⊢; linarith

end E993Transport
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma E993Transport.twoBinomCoeff_pos 768f4ab5ed5dd35057de158c05a06727d928906d103861fe4dcd70a6e039a9ac
namespace E993Transport

open Polynomial

/-- Positivity of the coefficients of `(1+X)^a (1+2X)^b` on `[0, a + b]`. -/
lemma twoBinomCoeff_pos (a b k : ℕ) (hk : k ≤ a + b) :
    0 < ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff k := by
  have := (twoBinomCoeffZ_nonneg_pos a b).2 (k : ℤ) (by positivity) (by exact_mod_cast hk)
  rwa [polyCoeffZ_natCast] at this

end E993Transport
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma E993Transport.twoBinomCoeffZ_strongLC 61e8794fec4ff00b103505614f6cce53efdcf341ae98866fdc89686abaf57dc0
namespace E993Transport

open Polynomial

/-- The two-by-two minor inequality for the coefficients of `(1+X)^a (1+2X)^b`, by induction on
linear factors. -/
lemma twoBinomCoeffZ_strongLC (a b : ℕ) :
    ∀ i j : ℤ, i ≤ j →
      polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) (i - 1) *
          polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) (j + 1) ≤
        polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) i *
          polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) j := by
  induction a with
  | zero =>
    induction b with
    | zero =>
      intro i j hij
      simp only [pow_zero, mul_one, polyCoeffZ_one]
      split_ifs <;> (try norm_num) <;> omega
    | succ b ih =>
      intro i j hij
      rw [twoBinom_succ_right]
      simp only [polyCoeffZ_linear_mul]
      exact strongLC_linear_step _ 2 (by norm_num) ih i j hij
  | succ a ih =>
    intro i j hij
    rw [twoBinom_succ_left]
    simp only [polyCoeffZ_linear_mul]
    exact strongLC_linear_step _ 1 (by norm_num) ih i j hij

end E993Transport
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma E993Transport.twoBinomCoeff_logConcave 77460852bfb43435d294720f9480f9713283eb6aa46af6491b6c0d8e25255b02
namespace E993Transport

open Polynomial

/-- Log-concavity of the coefficients of `(1+X)^a (1+2X)^b` (LC by factor induction). -/
lemma twoBinomCoeff_logConcave (a b n : ℕ) :
    ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff n *
        ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 2) ≤
      ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 1) *
        ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 1) := by
  have h := twoBinomCoeffZ_strongLC a b ((n + 1 : ℕ) : ℤ) ((n + 1 : ℕ) : ℤ) le_rfl
  rw [show ((n + 1 : ℕ) : ℤ) - 1 = (n : ℤ) by push_cast; ring,
    show ((n + 1 : ℕ) : ℤ) + 1 = ((n + 2 : ℕ) : ℤ) by push_cast; ring] at h
  simpa only [polyCoeffZ_natCast] using h

end E993Transport
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma E993Transport.twoBinom_coeff_strictAnti_of_gap b39cd78768d02c83194f21b48717af69a8354afb36719755c5979769c3d6589c
namespace E993Transport

open Polynomial

/-- (G), the companion tool (no certificate of its own; no family or tree claim): for
`1 ≤ t ≤ a + b` and `3a + 4b + 2 ≤ 6t`, the coefficient at `t + 1` is below the one at `t`. -/
lemma twoBinom_coeff_strictAnti_of_gap (a b t : ℕ) (ht : 1 ≤ t) (hta : t ≤ a + b)
    (hgap : 3 * a + 4 * b + 2 ≤ 6 * t) :
    ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (t + 1) <
      ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff t := by
  obtain ⟨n, rfl⟩ : ∃ n, t = n + 1 := ⟨t - 1, by omega⟩
  have hrec := twoBinomCoeff_recurrence a b n
  have hlc := twoBinomCoeff_logConcave a b n
  have h0 := twoBinomCoeff_pos a b n (by omega)
  have h1 := twoBinomCoeff_pos a b (n + 1) hta
  exact descent_of_recurrence_logconcave (a : ℤ) (b : ℤ) ((n : ℤ) + 1) _ _ _
    (by positivity) h0 h1 (by omega)
    (by linear_combination hrec) hlc (by omega)

end E993Transport
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma E993Transport.cb8_armLeaf_blockExpansion 396116c7558302c70c6a49e9fd7f09907319b89a0dd4d714c53ac211fe6f0b01
namespace E993Transport

open Polynomial

/-- Arm-leaf block expansion (r31 C2-LA2; re-authored under attribution from C-F2-U's `CritFav.lean`
DRAFT and C-T1-U's `Crit.lean` DRAFT, never carried): by the binomial theorem,
`(1+X)·G^m = Σ_j C(m,j) · X^j (1+X)^{8j+1} (1+2X)^{8(m−j)}` with `G = (1+2X)^8 + X(1+X)^8`. -/
lemma cb8_armLeaf_blockExpansion (m : ℕ) :
    ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m : ℤ[X]) =
      ∑ j ∈ Finset.range (m + 1),
        C (m.choose j : ℤ) * (X ^ j * ((1 + X) ^ (8 * j + 1) * (1 + 2 * X) ^ (8 * (m - j)))) := by
  rw [add_comm ((1 + 2 * X : ℤ[X]) ^ 8) (X * (1 + X) ^ 8),
    add_pow (X * (1 + X) ^ 8 : ℤ[X]) ((1 + 2 * X) ^ 8), Finset.mul_sum]
  refine Finset.sum_congr rfl ?_
  intro j _
  rw [mul_pow, ← pow_mul, ← pow_mul, pow_succ, C_eq_natCast]
  ring

end E993Transport
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma E993Transport.cb8_armLeaf_block_descent 8518b8869cb73ee1279d756164a732982f7cce5056afcf4cdf380d9199c22866
namespace E993Transport

open Polynomial

/-- (G) on the arm block `V_j` (r31 C2-LA2; from C-F2-U's `armLeaf_block` DRAFT): for `j ≤ m`,
`m ≡ 2 (mod 3)`, the block `(1+X)^{8j+1}(1+2X)^{8(m−j)}` strictly descends from `p* − j` to
`p* − j + 1`, `p* = (16m+4)/3` (margin `2j+3` in `3a+4b+2 ≤ 6t`). -/
lemma cb8_armLeaf_block_descent (m j : ℕ) (hmod : m % 3 = 2) (hj : j ≤ m) :
    ((1 + X) ^ (8 * j + 1) * (1 + 2 * X) ^ (8 * (m - j)) : ℤ[X]).coeff ((16 * m + 4) / 3 - j + 1) <
      ((1 + X) ^ (8 * j + 1) * (1 + 2 * X) ^ (8 * (m - j)) : ℤ[X]).coeff ((16 * m + 4) / 3 - j) :=
  twoBinom_coeff_strictAnti_of_gap _ _ _ (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma E993Transport.cb8_armLeaf_remainder_descent bac7c7df427a94b5088f0ccd8558978e252ceafb5e7cc35e9996ad0569c474a9
namespace E993Transport

open Polynomial

/-- (G) on the arm remainder `R = X(1+2X)^{8m}` (r31 C2-LA2; from C-F2-U's DRAFT): strict descent
from `p*` to `p* + 1` (margin 0). -/
lemma cb8_armLeaf_remainder_descent (m : ℕ) (hmod : m % 3 = 2) :
    (X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      (X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3) := by
  obtain ⟨q, hq⟩ : ∃ q, (16 * m + 4) / 3 = q + 1 := ⟨(16 * m + 4) / 3 - 1, by omega⟩
  rw [hq, coeff_X_mul, coeff_X_mul]
  have h := twoBinom_coeff_strictAnti_of_gap 0 (8 * m) q (by omega) (by omega) (by omega)
  simpa using h

end E993Transport
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma E993Transport.cb8_armLeaf_closedForm_descent_topRank 62647c33b400eb53bce67a0befcff3454f3bdec57e83c118ae5b29e171faad52
namespace E993Transport

open Polynomial

/-- Arm leaf `v` at the closed-form level (r31 C2-LA2; re-authored from C-F2-U's
`armLeaf_favorable_topRank` DRAFT, rebuilt by the F adjudicator; C-T1-F and C-T1-U arm-leaf Lean;
T1 seat proof): the closed form `(1+X)G^m + X(1+2X)^{8m}` of `I(CB(8,m) − v)` strictly descends
from `p*` to `p* + 1`. Blocks: weights `C(m,j) > 0`, (G) on every `V_j`, (G) on `R`. -/
lemma cb8_armLeaf_closedForm_descent_topRank (m : ℕ) (hmod : m % 3 = 2) :
    ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff
        ((16 * m + 4) / 3 + 1) <
      ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff
        ((16 * m + 4) / 3) := by
  rw [coeff_add, coeff_add]
  apply add_lt_add
  · rw [cb8_armLeaf_blockExpansion, finsetSum_coeff, finsetSum_coeff]
    apply Finset.sum_lt_sum_of_nonempty ⟨0, by simp⟩
    intro j hj
    have hjm : j ≤ m := Nat.lt_succ_iff.mp (Finset.mem_range.mp hj)
    rw [coeff_C_mul, coeff_C_mul, coeff_X_pow_mul', coeff_X_pow_mul', if_pos (by omega),
      if_pos (by omega)]
    have hpos : (0 : ℤ) < m.choose j := by exact_mod_cast Nat.choose_pos hjm
    apply mul_lt_mul_of_pos_left _ hpos
    rw [show (16 * m + 4) / 3 + 1 - j = (16 * m + 4) / 3 - j + 1 by omega]
    exact cb8_armLeaf_block_descent m j hmod hjm
  · exact cb8_armLeaf_remainder_descent m hmod

end E993Transport
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma E993Transport.cb8_privateLeaf_blockExpansion 16c3e8cc2e47edd8826fe0cef0a166f9d8ed55c2b6c5d82db4b6bec14065aa23
namespace E993Transport

open Polynomial

/-- Private-leaf block expansion (r31 C2-LA2; re-authored from C-F2-U's `privateLeaf_favorable_topRank`
DRAFT): with `G_c = (1+2X)^7(1+X) + X(1+X)^7`,
`(1+2X)·G_c·G^n = Σ_k C(n,k) · (E0_k + E1_k)`, where
`E0_k = X^k (1+X)^{8k+1} (1+2X)^{8(n−k)+8}` and `E1_k = X^{k+1} (1+X)^{8k+7} (1+2X)^{8(n−k)+1}`. -/
lemma cb8_privateLeaf_blockExpansion (n : ℕ) :
    ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
        ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ n : ℤ[X]) =
      ∑ k ∈ Finset.range (n + 1),
        (C (n.choose k : ℤ) * (X ^ k * ((1 + X) ^ (8 * k + 1) * (1 + 2 * X) ^ (8 * (n - k) + 8))) +
          C (n.choose k : ℤ) *
            (X ^ (k + 1) * ((1 + X) ^ (8 * k + 7) * (1 + 2 * X) ^ (8 * (n - k) + 1)))) := by
  rw [add_comm ((1 + 2 * X : ℤ[X]) ^ 8) (X * (1 + X) ^ 8),
    add_pow (X * (1 + X) ^ 8 : ℤ[X]) ((1 + 2 * X) ^ 8), Finset.mul_sum]
  refine Finset.sum_congr rfl ?_
  intro k _
  rw [mul_pow, ← pow_mul, ← pow_mul, C_eq_natCast]
  ring

end E993Transport
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma E993Transport.cb8_privateLeaf_regroup ef36203e02c94102fef6e961fe39b92a42e0c133dc20f6e81dd9e3ddb700e022
namespace E993Transport

open Polynomial

/-- The regrouping (r31 C2-LA2; from C-F2-U's DRAFT, `1+3X+X² = (1+X)² + X`): the `k = 0` block `E0_0`
plus the tail `X(1+X)^2(1+2X)^{8n+7}` equals `(1+X)^3(1+2X)^{8n+7} + X·(1+X)(1+2X)^{8n+7}`. -/
lemma cb8_privateLeaf_regroup (n : ℕ) :
    ((1 + X) * (1 + 2 * X) ^ (8 * n + 8) + X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * n + 7) : ℤ[X]) =
      (1 + X) ^ 3 * (1 + 2 * X) ^ (8 * n + 7) + X * ((1 + X) ^ 1 * (1 + 2 * X) ^ (8 * n + 7)) := by
  ring

end E993Transport
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma E993Transport.cb8_privateLeaf_E0_block_descent 90c5bd6f04058f9149d6f11a147b2e8e1626f850cfcdc3497fd5ea8ab394906d
namespace E993Transport

open Polynomial

/-- (G) on the private block `E0_k` (r31 C2-LA2; from C-F2-U's DRAFT): with `m = n + 1 ≡ 2 (mod 3)`
and `k ≤ n`, `(1+X)^{8k+1}(1+2X)^{8(n−k)+8}` strictly descends from `p* − k` to `p* − k + 1`
(margin `2k+3`; applied for `k ≥ 1`). -/
lemma cb8_privateLeaf_E0_block_descent (n k : ℕ) (hmod : (n + 1) % 3 = 2) (hk : k ≤ n) :
    ((1 + X) ^ (8 * k + 1) * (1 + 2 * X) ^ (8 * (n - k) + 8) : ℤ[X]).coeff
        ((16 * (n + 1) + 4) / 3 - k + 1) <
      ((1 + X) ^ (8 * k + 1) * (1 + 2 * X) ^ (8 * (n - k) + 8) : ℤ[X]).coeff
        ((16 * (n + 1) + 4) / 3 - k) :=
  twoBinom_coeff_strictAnti_of_gap _ _ _ (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma E993Transport.cb8_privateLeaf_E1_block_descent 2cbf6fa6bc1ee3894a1e847347fc675ff8fbf6ee0e00a769e0425671dd11a3b6
namespace E993Transport

open Polynomial

/-- (G) on the private block `E1_k` (r31 C2-LA2; from C-F2-U's DRAFT): with `m = n + 1 ≡ 2 (mod 3)`
and `k ≤ n`, `(1+X)^{8k+7}(1+2X)^{8(n−k)+1}` strictly descends from `p* − (k+1)` to
`p* − (k+1) + 1` (margin `2k+7`). -/
lemma cb8_privateLeaf_E1_block_descent (n k : ℕ) (hmod : (n + 1) % 3 = 2) (hk : k ≤ n) :
    ((1 + X) ^ (8 * k + 7) * (1 + 2 * X) ^ (8 * (n - k) + 1) : ℤ[X]).coeff
        ((16 * (n + 1) + 4) / 3 - (k + 1) + 1) <
      ((1 + X) ^ (8 * k + 7) * (1 + 2 * X) ^ (8 * (n - k) + 1) : ℤ[X]).coeff
        ((16 * (n + 1) + 4) / 3 - (k + 1)) :=
  twoBinom_coeff_strictAnti_of_gap _ _ _ (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma E993Transport.cb8_privateLeaf_regrouped_descent 7703d38ca821385cae600e2016607165517de6ab00c9a5d28a2fd1586f049dd7
namespace E993Transport

open Polynomial

/-- (G) on the two regrouped `Π` blocks (r31 C2-LA2; from C-F2-U's DRAFT): with `m = n + 1 ≡ 2 (mod 3)`,
`(1+X)^3(1+2X)^{8n+7} + X·(1+X)(1+2X)^{8n+7}` strictly descends from `p*` to `p* + 1`
(each block has `6t − (3a+4b) = 3`). -/
lemma cb8_privateLeaf_regrouped_descent (n : ℕ) (hmod : (n + 1) % 3 = 2) :
    ((1 + X) ^ 3 * (1 + 2 * X) ^ (8 * n + 7) + X * ((1 + X) ^ 1 * (1 + 2 * X) ^ (8 * n + 7)) :
        ℤ[X]).coeff ((16 * (n + 1) + 4) / 3 + 1) <
      ((1 + X) ^ 3 * (1 + 2 * X) ^ (8 * n + 7) + X * ((1 + X) ^ 1 * (1 + 2 * X) ^ (8 * n + 7)) :
        ℤ[X]).coeff ((16 * (n + 1) + 4) / 3) := by
  rw [coeff_add, coeff_add]
  apply add_lt_add
  · exact twoBinom_coeff_strictAnti_of_gap 3 (8 * n + 7) _ (by omega) (by omega) (by omega)
  · obtain ⟨q, hq⟩ : ∃ q, (16 * (n + 1) + 4) / 3 = q + 1 :=
      ⟨(16 * (n + 1) + 4) / 3 - 1, by omega⟩
    rw [hq, coeff_X_mul, coeff_X_mul]
    exact twoBinom_coeff_strictAnti_of_gap 1 (8 * n + 7) q (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma E993Transport.cb8_privateLeaf_closedForm_descent_topRank 39b8d37276ea43e8d35a2fd508ac3a331efbcbae59e7369cd5fce08defb2808a
namespace E993Transport

open Polynomial

/-- Private leaf `c` at the closed-form level (r31 C2-LA2; re-authored from C-F2-U's
`privateLeaf_favorable_topRank` DRAFT, rebuilt by the F adjudicator; independent informal routes
C-F2-T, C-T2-F, C-T2-U): the closed form `(1+2X)G_c G^{m−1} + X(1+X)^2(1+2X)^{8m−1}` of
`I(CB(8,m) − c)` strictly descends from `p*` to `p* + 1`. Blocks: weights `C(m−1,k) ≥ 0`, (G) on
`E0_k` (`k ≥ 1`) and `E1_k` (`k ≥ 0`), and the regrouped pair `E0_0 + tail`. -/
lemma cb8_privateLeaf_closedForm_descent_topRank (m : ℕ) (hmod : m % 3 = 2) :
    ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
          ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
          ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3) := by
  obtain ⟨n, rfl⟩ : ∃ n, m = n + 1 := ⟨m - 1, by omega⟩
  rw [show n + 1 - 1 = n by omega, show 8 * (n + 1) - 1 = 8 * n + 7 by omega]
  set S := (16 * (n + 1) + 4) / 3 with hS
  rw [cb8_privateLeaf_blockExpansion, Finset.sum_add_distrib, Finset.sum_range_succ']
  set E0 : ℕ → ℤ[X] := fun k =>
    C (n.choose k : ℤ) * (X ^ k * ((1 + X) ^ (8 * k + 1) * (1 + 2 * X) ^ (8 * (n - k) + 8))) with hE0
  set E1 : ℕ → ℤ[X] := fun k =>
    C (n.choose k : ℤ) *
      (X ^ (k + 1) * ((1 + X) ^ (8 * k + 7) * (1 + 2 * X) ^ (8 * (n - k) + 1))) with hE1
  set tl : ℤ[X] := X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * n + 7) with htl
  have regroup : E0 0 + tl =
      (1 + X) ^ 3 * (1 + 2 * X) ^ (8 * n + 7) + X * ((1 + X) ^ 1 * (1 + 2 * X) ^ (8 * n + 7)) := by
    rw [← cb8_privateLeaf_regroup n]
    simp only [hE0, htl, Nat.choose_zero_right, Nat.cast_one, map_one, one_mul, pow_zero,
      Nat.sub_zero, mul_zero, zero_add, pow_one]
  have hE0_le : ∀ i ∈ Finset.range n, (E0 (i + 1)).coeff (S + 1) ≤ (E0 (i + 1)).coeff S := by
    intro i hi
    have hin : i < n := Finset.mem_range.mp hi
    simp only [hE0]
    rw [coeff_C_mul, coeff_C_mul, coeff_X_pow_mul', coeff_X_pow_mul', if_pos (by omega),
      if_pos (by omega)]
    have hpos : (0 : ℤ) ≤ n.choose (i + 1) := by positivity
    apply mul_le_mul_of_nonneg_left _ hpos
    rw [show S + 1 - (i + 1) = S - (i + 1) + 1 by omega]
    exact le_of_lt (cb8_privateLeaf_E0_block_descent n (i + 1) hmod hin)
  have hE1_le : ∀ k ∈ Finset.range (n + 1), (E1 k).coeff (S + 1) ≤ (E1 k).coeff S := by
    intro k hk
    have hkn : k ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hk)
    simp only [hE1]
    rw [coeff_C_mul, coeff_C_mul, coeff_X_pow_mul', coeff_X_pow_mul', if_pos (by omega),
      if_pos (by omega)]
    have hpos : (0 : ℤ) ≤ n.choose k := by positivity
    apply mul_le_mul_of_nonneg_left _ hpos
    rw [show S + 1 - (k + 1) = S - (k + 1) + 1 by omega]
    exact le_of_lt (cb8_privateLeaf_E1_block_descent n k hmod hkn)
  have s0 := Finset.sum_le_sum hE0_le
  have s1 := Finset.sum_le_sum hE1_le
  have hreg : (E0 0).coeff (S + 1) + tl.coeff (S + 1) < (E0 0).coeff S + tl.coeff S := by
    rw [← coeff_add, ← coeff_add, regroup]
    exact cb8_privateLeaf_regrouped_descent n hmod
  simp only [coeff_add, finsetSum_coeff] at s0 s1 ⊢
  linarith

end E993Transport
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma E993Transport.cb8_leafDeletion_closedForms_descent_topRank 768c6972f81e81df3e0259f7a75f0c5c255da00af6050c442154878ebec4db38
namespace E993Transport

open Polynomial

/-- r31 C2-LA2 terminal (frozen by the Cycle 2 synthesis, `### C2-LA2`): Darroch/Newton-free
favorability at the closed-form level, both leaf classes. At the forward-difference index of record
`Δ_p = i_{p+1} − i_p`, `p = p* = (16m+4)/3`, both closed forms — `I(CB(8,m) − v)` and
`I(CB(8,m) − c)` — strictly descend. A statement about closed-form polynomials over `ℤ[X]`, not
about `cbGraph`; `107 ≤ m` is unused (fence 1). -/
lemma cb8_leafDeletion_closedForms_descent_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3) ∧
    ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3)
 :=
  ⟨cb8_armLeaf_closedForm_descent_topRank m hmod, cb8_privateLeaf_closedForm_descent_topRank m hmod⟩

end E993Transport
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma E993Transport.indepSetCount_succ_split 11137bef77ff6bfeaabc0f5ef4ed756d8f4d4535b07ef41db4315ac30f617439
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: r31 U3 (Claude Sonnet 5, seat C2-U-03), Node 0; `U3.lean` (bacc4808…) lines 19–134.
-- U3's P4 import edit is not reproduced: this single-source project imports only Mathlib
/-- **Node 0 (generic vertex-split recursion), U3.**
For ANY simple graph `G`, ANY finite deletion set `D`, and ANY vertex `x ∉ D` (leaf or not),
the literal independent-`(k+1)`-subset count avoiding `D` splits by membership of `x`:
sets that omit `x` are exactly those avoiding `insert x D`, and sets that contain `x`
correspond bijectively (by `Finset.erase x`) to independent `k`-subsets avoiding
`D ∪ N[x]` (deletion of `x` together with its whole closed neighbourhood). This is the
graph-generic form of the leaf-recursion already used informally through `C5LA1.H`/`C5LA1.R`
(carried Main.lean entries 7–8) and is the exact bridge needed to connect
`C5LA1.crossingIndex`/`C5LA1.indepSetCount` (raw combinatorial counts, carried entries 10/22)
to any closed-form coefficient identity for `I(G;x)`. -/
lemma indepSetCount_succ_split (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (x : V) (hx : x ∉ D) (k : ℕ) :
    C5LA1.indepSetCount G D (k + 1) =
      C5LA1.indepSetCount G (insert x D) (k + 1) +
        C5LA1.indepSetCount G (insert x (D ∪ G.neighborFinset x)) k := by
  classical
  unfold C5LA1.indepSetCount
  set F := C5LA1.indepSetsAvoiding G D (k + 1) with hF
  have hsplit : F.card =
      (F.filter (fun A => x ∉ A)).card + (F.filter (fun A => x ∈ A)).card := by
    have h := Finset.card_filter_add_card_filter_not (s := F) (fun A : Finset V => x ∈ A)
    omega
  rw [hsplit]
  congr 1
  · -- the branch `x ∉ A`: literally `indepSetsAvoiding G (insert x D) (k+1)`.
    apply congrArg Finset.card
    ext A
    simp only [hF, C5LA1.indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard,
      and_assoc]
    constructor
    · rintro ⟨hAsub, hAcard, hAindep, hxA⟩
      refine ⟨fun a ha => ?_, hAcard, hAindep⟩
      have h := hAsub ha
      rw [Finset.mem_sdiff] at h
      rw [Finset.mem_sdiff, Finset.mem_insert]
      exact ⟨h.1, by rintro (rfl | hd); exacts [hxA ha, h.2 hd]⟩
    · rintro ⟨hAsub, hAcard, hAindep⟩
      have hxA : x ∉ A := fun hxmem => by
        have h := hAsub hxmem
        rw [Finset.mem_sdiff, Finset.mem_insert] at h
        exact h.2 (Or.inl rfl)
      refine ⟨fun a ha => ?_, hAcard, hAindep, hxA⟩
      have h := hAsub ha
      rw [Finset.mem_sdiff, Finset.mem_insert] at h
      rw [Finset.mem_sdiff]
      exact ⟨h.1, fun hd => h.2 (Or.inr hd)⟩
  · -- the branch `x ∈ A`: bijection `Finset.erase x` with
    -- `indepSetsAvoiding G (insert x (D ∪ N(x))) k`.
    have hbij : F.filter (fun A => x ∈ A) =
        (C5LA1.indepSetsAvoiding G (insert x (D ∪ G.neighborFinset x)) k).image
          (fun B => insert x B) := by
      ext A
      simp only [hF, C5LA1.indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard,
        and_assoc, Finset.mem_image]
      constructor
      · rintro ⟨hAsub, hAcard, hAindep, hxA⟩
        refine ⟨A.erase x, ?_, ?_, ?_, Finset.insert_erase hxA⟩
        · intro a ha
          have haA : a ∈ A := Finset.mem_of_mem_erase ha
          have hane : a ≠ x := Finset.ne_of_mem_erase ha
          have hadjx : ¬ G.Adj x a := fun hadj =>
            ((isIndepSet_iff G).mp hAindep) (Finset.mem_coe.mpr hxA) (Finset.mem_coe.mpr haA)
              (Ne.symm hane) hadj
          have haD : a ∉ D := (Finset.mem_sdiff.mp (hAsub haA)).2
          rw [Finset.mem_sdiff]
          refine ⟨Finset.mem_univ _, fun hmem => ?_⟩
          rcases Finset.mem_insert.mp hmem with h | h
          · exact hane h
          · rcases Finset.mem_union.mp h with h' | h'
            · exact haD h'
            · exact hadjx ((SimpleGraph.mem_neighborFinset G x a).mp h')
        · rw [Finset.card_erase_of_mem hxA, hAcard]; omega
        · rw [isIndepSet_iff]
          exact Set.Pairwise.mono (Finset.coe_subset.mpr (Finset.erase_subset x A))
            ((isIndepSet_iff G).mp hAindep)
      · rintro ⟨B, hBsub, hBcard, hBindep, rfl⟩
        have hxB : x ∉ B := fun hxmem => by
          have h := hBsub hxmem
          rw [Finset.mem_sdiff, Finset.mem_insert] at h
          exact h.2 (Or.inl rfl)
        refine ⟨fun a ha => ?_, ?_, ?_, Finset.mem_insert_self _ _⟩
        · rcases Finset.mem_insert.mp ha with rfl | haB
          · rw [Finset.mem_sdiff]; exact ⟨Finset.mem_univ _, hx⟩
          · have hnotin : a ∉ insert x (D ∪ G.neighborFinset x) :=
              (Finset.mem_sdiff.mp (hBsub haB)).2
            have haD : a ∉ D := fun hd =>
              hnotin (Finset.mem_insert_of_mem (Finset.mem_union_left _ hd))
            rw [Finset.mem_sdiff]
            exact ⟨Finset.mem_univ _, haD⟩
        · rw [Finset.card_insert_of_notMem hxB, hBcard]
        · rw [isIndepSet_iff]
          letI : Std.Symm (fun p q : V => ¬ G.Adj p q) := ⟨fun _ _ h h' => h h'.symm⟩
          have hxB' : x ∉ (B : Set V) := by simpa using hxB
          have hcoe : ((insert x B : Finset V) : Set V) = insert x (B : Set V) := by simp
          rw [hcoe, Set.pairwise_insert_of_symm_of_notMem hxB']
          refine ⟨(isIndepSet_iff G).mp hBindep, fun b hb => ?_⟩
          have hbmem : b ∈ B := Finset.mem_coe.mp hb
          have hnotin : b ∉ insert x (D ∪ G.neighborFinset x) :=
            (Finset.mem_sdiff.mp (hBsub hbmem)).2
          intro hadj
          exact hnotin (Finset.mem_insert_of_mem
            (Finset.mem_union_right _ ((SimpleGraph.mem_neighborFinset G x b).mpr hadj)))
    rw [hbij, Finset.card_image_of_injOn]
    intro B1 hB1 B2 hB2 he
    simp only [Finset.mem_coe, C5LA1.indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard, and_assoc] at hB1 hB2
    have hx1 : x ∉ B1 := fun hmem => by
      have h := hB1.1 hmem
      rw [Finset.mem_sdiff, Finset.mem_insert] at h
      exact h.2 (Or.inl rfl)
    have hx2 : x ∉ B2 := fun hmem => by
      have h := hB2.1 hmem
      rw [Finset.mem_sdiff, Finset.mem_insert] at h
      exact h.2 (Or.inl rfl)
    have hcongr := congrArg (fun S : Finset V => S.erase x) he
    simpa [Finset.erase_insert hx1, Finset.erase_insert hx2] using hcongr

end E993Transport
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma E993Transport.critU3T_mem_indepSetsAvoiding 2a4404c180c92ea7b252d617cfd4a39990552395c8a7651a49f6364e5970c7cf
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 16–21.
lemma critU3T_mem_indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : ℕ) (A : Finset V) :
    A ∈ C5LA1.indepSetsAvoiding G D k ↔
      (∀ a ∈ A, a ∉ D) ∧ A.card = k ∧ G.IsIndepSet (A : Set V) := by
  simp only [C5LA1.indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard,
    Finset.subset_iff, Finset.mem_sdiff, Finset.mem_univ, true_and, and_assoc]

end E993Transport
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma E993Transport.critU3T_indepSetCount_disjoint_split 776fe685c497b24a558a0df2240a3f2a831325403b385fa2aa3f50b417da66b0
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 23–150.
/-- **Binary disjoint-branch convolution (critic C-U3-T).** If the vertices surviving the deletion
set `D` split into two disjoint parts `P`, `Q` with no edge between them, then the independent
`k`-set count of `G − D` is the Cauchy convolution of the counts of `G − (D ∪ Q)` (the `P` part)
and `G − (D ∪ P)` (the `Q` part). -/
lemma critU3T_indepSetCount_disjoint_split (G : SimpleGraph V) [DecidableRel G.Adj]
    (D P Q : Finset V) (hcov : ∀ a, a ∉ D ↔ (a ∈ P ∨ a ∈ Q)) (hPQ : Disjoint P Q)
    (hno : ∀ p ∈ P, ∀ q ∈ Q, ¬ G.Adj p q) (k : ℕ) :
    C5LA1.indepSetCount G D k =
      ∑ ab ∈ Finset.HasAntidiagonal.antidiagonal k,
        C5LA1.indepSetCount G (D ∪ Q) ab.1 * C5LA1.indepSetCount G (D ∪ P) ab.2 := by
  classical
  have hPnQ : ∀ a, a ∈ P → a ∉ Q := fun a ha hq => Finset.disjoint_left.mp hPQ ha hq
  have hPnD : ∀ a, a ∈ P → a ∉ D := fun a ha => (hcov a).mpr (Or.inl ha)
  have hQnD : ∀ a, a ∈ Q → a ∉ D := fun a ha => (hcov a).mpr (Or.inr ha)
  unfold C5LA1.indepSetCount
  rw [Finset.card_eq_sum_card_fiberwise
    (f := fun A : Finset V => ((A ∩ P).card, (A ∩ Q).card)) (t := Finset.HasAntidiagonal.antidiagonal k)]
  · refine Finset.sum_congr rfl (fun ab _ => ?_)
    rw [← Finset.card_product]
    apply Finset.card_nbij' (fun A => (A ∩ P, A ∩ Q)) (fun BC => BC.1 ∪ BC.2)
    · intro A hA
      simp only [Finset.coe_filter, Set.mem_setOf_eq, critU3T_mem_indepSetsAvoiding] at hA
      obtain ⟨⟨_hAD, _hAc, hAi⟩, hf⟩ := hA
      simp only [Finset.coe_product, Set.mem_prod, Finset.mem_coe,
        critU3T_mem_indepSetsAvoiding]
      refine ⟨⟨?_, by rw [← hf], ?_⟩, ⟨?_, by rw [← hf], ?_⟩⟩
      · intro a ha hmem
        have haP := (Finset.mem_inter.mp ha).2
        rcases Finset.mem_union.mp hmem with h | h
        exacts [hPnD a haP h, hPnQ a haP h]
      · exact Set.Pairwise.mono (Finset.coe_subset.mpr Finset.inter_subset_left) hAi
      · intro a ha hmem
        have haQ := (Finset.mem_inter.mp ha).2
        rcases Finset.mem_union.mp hmem with h | h
        exacts [hQnD a haQ h, hPnQ a h haQ]
      · exact Set.Pairwise.mono (Finset.coe_subset.mpr Finset.inter_subset_left) hAi
    · rintro ⟨B, C⟩ hBC
      simp only [Finset.coe_product, Set.mem_prod, Finset.mem_coe,
        critU3T_mem_indepSetsAvoiding] at hBC
      obtain ⟨⟨hBD, hBc, hBi⟩, ⟨hCD, hCc, hCi⟩⟩ := hBC
      have hBP : ∀ b ∈ B, b ∈ P := fun b hb => by
        have h1 : b ∉ D := fun h => hBD b hb (Finset.mem_union_left _ h)
        have h2 : b ∉ Q := fun h => hBD b hb (Finset.mem_union_right _ h)
        rcases (hcov b).mp h1 with h | h
        exacts [h, absurd h h2]
      have hCQ : ∀ c ∈ C, c ∈ Q := fun c hc => by
        have h1 : c ∉ D := fun h => hCD c hc (Finset.mem_union_left _ h)
        have h2 : c ∉ P := fun h => hCD c hc (Finset.mem_union_right _ h)
        rcases (hcov c).mp h1 with h | h
        exacts [absurd h h2, h]
      have hBP' : (B ∪ C) ∩ P = B := by
        ext a; simp only [Finset.mem_inter, Finset.mem_union]
        constructor
        · rintro ⟨h | h, hp⟩
          exacts [h, absurd (hCQ a h) (hPnQ a hp)]
        · intro h; exact ⟨Or.inl h, hBP a h⟩
      have hCQ' : (B ∪ C) ∩ Q = C := by
        ext a; simp only [Finset.mem_inter, Finset.mem_union]
        constructor
        · rintro ⟨h | h, hq⟩
          exacts [absurd hq (hPnQ a (hBP a h)), h]
        · intro h; exact ⟨Or.inr h, hCQ a h⟩
      simp only [Finset.coe_filter, Set.mem_setOf_eq, critU3T_mem_indepSetsAvoiding]
      refine ⟨⟨?_, ?_, ?_⟩, ?_⟩
      · intro a ha
        rcases Finset.mem_union.mp ha with h | h
        exacts [hPnD a (hBP a h), hQnD a (hCQ a h)]
      · have hdisj : Disjoint B C := Finset.disjoint_left.mpr
          (fun a hb hc => hPnQ a (hBP a hb) (hCQ a hc))
        rw [Finset.card_union_of_disjoint hdisj, hBc, hCc]
        exact Finset.HasAntidiagonal.mem_antidiagonal.mp ‹ab ∈ Finset.HasAntidiagonal.antidiagonal k›
      · rw [isIndepSet_iff, Finset.coe_union]
        rw [Set.pairwise_union]
        refine ⟨(isIndepSet_iff G).mp hBi, (isIndepSet_iff G).mp hCi, ?_⟩
        intro b hb c hc _
        have hbc := hno b (hBP b (Finset.mem_coe.mp hb)) c (hCQ c (Finset.mem_coe.mp hc))
        exact ⟨hbc, fun h => hbc h.symm⟩
      · simp only [hBP', hCQ', hBc, hCc]
    · intro A hA
      simp only [Finset.coe_filter, Set.mem_setOf_eq, critU3T_mem_indepSetsAvoiding] at hA
      obtain ⟨⟨hAD, _, _⟩, _⟩ := hA
      ext a; simp only [Finset.mem_union, Finset.mem_inter]
      constructor
      · rintro (⟨h, _⟩ | ⟨h, _⟩) <;> exact h
      · intro h
        rcases (hcov a).mp (hAD a h) with hp | hq
        exacts [Or.inl ⟨h, hp⟩, Or.inr ⟨h, hq⟩]
    · rintro ⟨B, C⟩ hBC
      simp only [Finset.coe_product, Set.mem_prod, Finset.mem_coe,
        critU3T_mem_indepSetsAvoiding] at hBC
      obtain ⟨⟨hBD, -, -⟩, ⟨hCD, -, -⟩⟩ := hBC
      have hBP : ∀ b ∈ B, b ∈ P := fun b hb => by
        have h1 : b ∉ D := fun h => hBD b hb (Finset.mem_union_left _ h)
        have h2 : b ∉ Q := fun h => hBD b hb (Finset.mem_union_right _ h)
        rcases (hcov b).mp h1 with h | h
        exacts [h, absurd h h2]
      have hCQ : ∀ c ∈ C, c ∈ Q := fun c hc => by
        have h1 : c ∉ D := fun h => hCD c hc (Finset.mem_union_left _ h)
        have h2 : c ∉ P := fun h => hCD c hc (Finset.mem_union_right _ h)
        rcases (hcov c).mp h1 with h | h
        exacts [absurd h h2, h]
      simp only [Prod.mk.injEq]
      constructor
      · ext a; simp only [Finset.mem_inter, Finset.mem_union]
        constructor
        · rintro ⟨h | h, hp⟩
          exacts [h, absurd (hCQ a h) (hPnQ a hp)]
        · intro h; exact ⟨Or.inl h, hBP a h⟩
      · ext a; simp only [Finset.mem_inter, Finset.mem_union]
        constructor
        · rintro ⟨h | h, hq⟩
          exacts [absurd hq (hPnQ a (hBP a h)), h]
        · intro h; exact ⟨Or.inr h, hCQ a h⟩
  · intro A hA
    simp only [Finset.mem_coe, critU3T_mem_indepSetsAvoiding] at hA
    obtain ⟨hAD, hAc, _⟩ := hA
    rw [Finset.mem_coe, Finset.HasAntidiagonal.mem_antidiagonal]
    have hAeq : A = (A ∩ P) ∪ (A ∩ Q) := by
      ext a; simp only [Finset.mem_union, Finset.mem_inter]
      constructor
      · intro h
        rcases (hcov a).mp (hAD a h) with hp | hq
        exacts [Or.inl ⟨h, hp⟩, Or.inr ⟨h, hq⟩]
      · rintro (⟨h, _⟩ | ⟨h, _⟩) <;> exact h
    have hdisj : Disjoint (A ∩ P) (A ∩ Q) :=
      Finset.disjoint_left.mpr (fun a ha hb =>
        hPnQ a (Finset.mem_inter.mp ha).2 (Finset.mem_inter.mp hb).2)
    rw [← Finset.card_union_of_disjoint hdisj, ← hAeq, hAc]

end E993Transport
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma E993Transport.critU3T_indepSetCount_eq_zero 8256ae809488493b3665ffd6aa9c5b4e75552d12db06c4f369abfd3c3e9f0cd9
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 157–161.
lemma critU3T_indepSetCount_eq_zero (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V)
    (k : ℕ) (hk : Fintype.card V < k) : C5LA1.indepSetCount G D k = 0 := by
  unfold C5LA1.indepSetCount C5LA1.indepSetsAvoiding
  rw [Finset.powersetCard_eq_empty.mpr, Finset.filter_empty, Finset.card_empty]
  exact lt_of_le_of_lt (le_trans (Finset.card_le_univ _) le_rfl) hk

end E993Transport
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma E993Transport.critU3T_coeff_indepPoly 5f360f052957fabc018a18506fc5a07555a2c00691c535e4f377a4fe2febc51b
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 163–172.
lemma critU3T_coeff_indepPoly (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V)
    (k : ℕ) : (critU3T_indepPoly G D).coeff k = C5LA1.indepSetCount G D k := by
  unfold critU3T_indepPoly
  rw [Polynomial.finsetSum_coeff]
  simp only [Polynomial.coeff_monomial]
  rw [Finset.sum_ite_eq']
  split_ifs with h
  · rfl
  · rw [Finset.mem_range, not_lt] at h
    exact (critU3T_indepSetCount_eq_zero G D k (by omega)).symm

end E993Transport
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma E993Transport.critU3T_indepPoly_disjoint_mul c672d5d5554e0b30e9b964038cca9df7edc670bd30cbb79bedf85cc3f8e6f7eb
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 174–182.
/-- **Binary product form (critic C-U3-T).** -/
lemma critU3T_indepPoly_disjoint_mul (G : SimpleGraph V) [DecidableRel G.Adj]
    (D P Q : Finset V) (hcov : ∀ a, a ∉ D ↔ (a ∈ P ∨ a ∈ Q)) (hPQ : Disjoint P Q)
    (hno : ∀ p ∈ P, ∀ q ∈ Q, ¬ G.Adj p q) :
    critU3T_indepPoly G D = critU3T_indepPoly G (D ∪ Q) * critU3T_indepPoly G (D ∪ P) := by
  ext k
  rw [Polynomial.coeff_mul, critU3T_coeff_indepPoly,
    critU3T_indepSetCount_disjoint_split G D P Q hcov hPQ hno k]
  simp only [critU3T_coeff_indepPoly]

end E993Transport
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma E993Transport.critU3T_indepPoly_congr 41508deca9495125882f81136b36aa1ac56f2fce1ebede9c88242c26898e8564
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 184–187.
/-- The polynomial depends on `D` only through its complement: equal deletion sets. -/
lemma critU3T_indepPoly_congr (G : SimpleGraph V) [DecidableRel G.Adj] (D D' : Finset V)
    (h : ∀ a, a ∈ D ↔ a ∈ D') : critU3T_indepPoly G D = critU3T_indepPoly G D' := by
  rw [Finset.ext h]

end E993Transport
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma E993Transport.critU3T_indepPoly_univ 322a113cbef4bf7d4ff3880ad82e2f91ef5f139f5d7ee89323f3a7067d335a56
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 189–199.
lemma critU3T_indepPoly_univ (G : SimpleGraph V) [DecidableRel G.Adj] :
    critU3T_indepPoly G Finset.univ = 1 := by
  ext k
  rw [critU3T_coeff_indepPoly, Polynomial.coeff_one]
  unfold C5LA1.indepSetCount C5LA1.indepSetsAvoiding
  rw [Finset.sdiff_self]
  rcases Nat.eq_zero_or_pos k with rfl | hk
  · rw [Finset.powersetCard_zero, Finset.filter_singleton, if_pos (by simp)]
    simp
  · rw [Finset.powersetCard_eq_empty.mpr (by simpa using hk)]
    simp [Nat.pos_iff_ne_zero.mp hk]

end E993Transport
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma E993Transport.critU3T_indepPoly_eq_prod a0a302470d1d88c552de4fad556abe11bf8ce283f215e69720ac389cda6bb966
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 201–268.
/-- **`m`-ary branch product (critic C-U3-T).** If the surviving vertices of `G − D` are covered by
pairwise disjoint parts `P i` (`i ∈ s`) with no edge between distinct parts, the generating
polynomial of `G − D` is the product over `i ∈ s` of the generating polynomials of the parts
(`G − (univ \ P i)`). -/
lemma critU3T_indepPoly_eq_prod {ι : Type*} [DecidableEq ι] (G : SimpleGraph V)
    [DecidableRel G.Adj] (P : ι → Finset V) (s : Finset ι)
    (hdisj : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → Disjoint (P i) (P j))
    (hno : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → ∀ a ∈ P i, ∀ b ∈ P j, ¬ G.Adj a b) :
    ∀ D : Finset V, (∀ a, a ∉ D ↔ ∃ i ∈ s, a ∈ P i) →
      critU3T_indepPoly G D = ∏ i ∈ s, critU3T_indepPoly G (Finset.univ \ P i) := by
  classical
  induction s using Finset.induction_on with
  | empty =>
    intro D hD
    rw [Finset.prod_empty]
    have : D = Finset.univ := by
      ext a; simp only [Finset.mem_univ, iff_true]
      by_contra h; obtain ⟨i, hi, _⟩ := (hD a).mp h; simp at hi
    rw [this, critU3T_indepPoly_univ]
  | insert i s hi ih =>
    intro D hD
    rw [Finset.prod_insert hi]
    let Q := s.biUnion P
    have hQ : ∀ a, a ∈ Q ↔ ∃ j ∈ s, a ∈ P j := fun a => by simp [Q]
    have hcov : ∀ a, a ∉ D ↔ (a ∈ P i ∨ a ∈ Q) := fun a => by
      rw [hD a, hQ a]
      constructor
      · rintro ⟨j, hj, ha⟩
        rcases Finset.mem_insert.mp hj with rfl | hj
        exacts [Or.inl ha, Or.inr ⟨j, hj, ha⟩]
      · rintro (ha | ⟨j, hj, ha⟩)
        exacts [⟨i, Finset.mem_insert_self _ _, ha⟩, ⟨j, Finset.mem_insert_of_mem hj, ha⟩]
    have hne : ∀ j ∈ s, i ≠ j := fun j hj h => hi (h ▸ hj)
    have hPQ : Disjoint (P i) Q := Finset.disjoint_left.mpr (fun a ha haQ => by
      obtain ⟨j, hj, haj⟩ := (hQ a).mp haQ
      exact Finset.disjoint_left.mp (hdisj i (Finset.mem_insert_self _ _) j
        (Finset.mem_insert_of_mem hj) (hne j hj)) ha haj)
    have hnoPQ : ∀ p ∈ P i, ∀ q ∈ Q, ¬ G.Adj p q := fun p hp q hq => by
      obtain ⟨j, hj, hqj⟩ := (hQ q).mp hq
      exact hno i (Finset.mem_insert_self _ _) j (Finset.mem_insert_of_mem hj) (hne j hj) p hp q hqj
    rw [critU3T_indepPoly_disjoint_mul G D (P i) Q hcov hPQ hnoPQ]
    congr 1
    · apply critU3T_indepPoly_congr
      intro a
      rw [Finset.mem_union, Finset.mem_sdiff]
      have := hcov a
      constructor
      · rintro (h | h)
        · exact ⟨Finset.mem_univ _, fun hp => ((hcov a).mpr (Or.inl hp)) h⟩
        · exact ⟨Finset.mem_univ _, fun hp => Finset.disjoint_left.mp hPQ hp h⟩
      · rintro ⟨-, hp⟩
        by_contra hc
        push Not at hc
        rcases (hcov a).mp hc.1 with h | h
        exacts [hp h, hc.2 h]
    · apply ih
      · intro j hj k hk hjk
        exact hdisj j (Finset.mem_insert_of_mem hj) k (Finset.mem_insert_of_mem hk) hjk
      · intro j hj k hk hjk
        exact hno j (Finset.mem_insert_of_mem hj) k (Finset.mem_insert_of_mem hk) hjk
      · intro a
        rw [Finset.mem_union, not_or, ← hQ a]
        constructor
        · rintro ⟨hD', hPi⟩
          rcases (hcov a).mp hD' with h | h
          exacts [absurd h hPi, h]
        · intro h
          exact ⟨(hcov a).mpr (Or.inr h), fun hp => Finset.disjoint_left.mp hPQ hp h⟩

end E993Transport
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma E993Transport.critU3T_mem_cbPart 2e916d348906632bfa8c74b1b7cf55d8b41854d80582e05414ffb671fb5bb54d
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 278–281.
lemma critU3T_mem_cbPart (m i : ℕ) (a : Fin (17 * m + 3)) :
    a ∈ critU3T_cbPart m i ↔ (i = 0 ∧ (a.val = 1 ∨ a.val = 2)) ∨
      (i ≠ 0 ∧ 3 + 17 * (i - 1) ≤ a.val ∧ a.val < 3 + 17 * (i - 1) + 17) := by
  simp [critU3T_cbPart]

end E993Transport
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma E993Transport.critU3T_indepPoly_vertex_split c139b8d0e59a03748a7410798100b9839979cb0fa5123b08840e8f826009db5b
namespace E993Transport

open SimpleGraph C4LA1 C5LA1
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T.lean` (b2f134b8…) lines 319–333.
/-- **U3's Node 0 in polynomial form (critic C-U3-T, composing the return's
`indepSetCount_succ_split`).** `I(G − D) = I(G − D − x) + X · I(G − D − N[x])` for `x ∉ D`. -/
lemma critU3T_indepPoly_vertex_split (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (x : V) (hx : x ∉ D) :
    critU3T_indepPoly G D =
      critU3T_indepPoly G (insert x D) +
        Polynomial.X * critU3T_indepPoly G (insert x (D ∪ G.neighborFinset x)) := by
  ext k
  rw [Polynomial.coeff_add]
  rcases k with _ | k
  · rw [Polynomial.coeff_X_mul_zero, critU3T_coeff_indepPoly, critU3T_coeff_indepPoly]
    unfold C5LA1.indepSetCount C5LA1.indepSetsAvoiding
    simp [Finset.powersetCard_zero, Finset.filter_singleton]
  · rw [Polynomial.coeff_X_mul, critU3T_coeff_indepPoly, critU3T_coeff_indepPoly,
      critU3T_coeff_indepPoly, indepSetCount_succ_split G D x hx k]

end E993Transport
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma E993Transport.critU3T_indepPoly_eq_one de5b5b1baa0a0627edeb592a283e8646b2dd9c6414befc2730b3f4dab5235b47
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T2.lean` (74a1c05c…) lines 17–19.
lemma critU3T_indepPoly_eq_one (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V)
    (h : ∀ y, y ∈ D) : critU3T_indepPoly G D = 1 := by
  rw [critU3T_indepPoly_congr G D Finset.univ (fun y => by simp [h y]), critU3T_indepPoly_univ]

end E993Transport
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma E993Transport.critU3T_indepPoly_single cbe40a3a7a2d0b7fbd30a579a904d45a024cd0f6f4ddb48a8183c1d31409c183
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T2.lean` (74a1c05c…) lines 21–35.
/-- A single surviving vertex: `I = 1 + X`. -/
lemma critU3T_indepPoly_single (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V) (a : V)
    (hD : ∀ y, y ∉ D ↔ y = a) : critU3T_indepPoly G D = 1 + X := by
  have ha : a ∉ D := (hD a).mpr rfl
  rw [critU3T_indepPoly_vertex_split G D a ha,
    critU3T_indepPoly_eq_one G (insert a D) (fun y => by
      by_cases hy : y = a
      · exact hy ▸ Finset.mem_insert_self _ _
      · exact Finset.mem_insert_of_mem (by by_contra h'; exact hy ((hD y).mp h'))),
    critU3T_indepPoly_eq_one G (insert a (D ∪ G.neighborFinset a)) (fun y => by
      by_cases hy : y = a
      · exact hy ▸ Finset.mem_insert_self _ _
      · exact Finset.mem_insert_of_mem (Finset.mem_union_left _
          (by by_contra h'; exact hy ((hD y).mp h'))))]
  ring

end E993Transport
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma E993Transport.critU3T_indepPoly_edge 3fbaef94268b6a66593e7bb08e8b303d353292837bcaa088b71a3a03147c0593
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T2.lean` (74a1c05c…) lines 37–59.
/-- A single surviving edge: `I = 1 + 2X`. -/
lemma critU3T_indepPoly_edge (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V) (a b : V)
    (hD : ∀ y, y ∉ D ↔ (y = a ∨ y = b)) (hab : G.Adj a b) :
    critU3T_indepPoly G D = 1 + 2 * X := by
  have ha : a ∉ D := (hD a).mpr (Or.inl rfl)
  have hne : a ≠ b := G.ne_of_adj hab
  rw [critU3T_indepPoly_vertex_split G D a ha,
    critU3T_indepPoly_single G (insert a D) b (fun y => by
      rw [Finset.mem_insert, not_or, hD y]
      constructor
      · rintro ⟨hya, h | h⟩
        exacts [absurd h hya, h]
      · rintro rfl; exact ⟨fun h => hne h.symm, Or.inr rfl⟩),
    critU3T_indepPoly_eq_one G (insert a (D ∪ G.neighborFinset a)) (fun y => by
      by_cases hy : y = a
      · exact hy ▸ Finset.mem_insert_self _ _
      · refine Finset.mem_insert_of_mem ?_
        by_cases hyD : y ∈ D
        · exact Finset.mem_union_left _ hyD
        · rcases (hD y).mp hyD with h | h
          · exact absurd h hy
          · exact Finset.mem_union_right _ ((SimpleGraph.mem_neighborFinset _ _ _).mpr (h ▸ hab)))]
  ring

end E993Transport
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma E993Transport.critU3T_cb_pendant ea12541e8a53d2efcf30a9b79465a597ca2b67d0f0229e5f07a8c552fd9af218
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T2.lean` (74a1c05c…) lines 63–70.
/-- The pendant branch `{s, v}`: `1 + 2X`. -/
lemma critU3T_cb_pendant (m : ℕ) :
    critU3T_indepPoly (cbGraph m) (Finset.univ \ critU3T_cbPart m 0) = 1 + 2 * X := by
  apply critU3T_indepPoly_edge _ _ (cbVertex m 1) (cbVertex m 2) _ (cbGraph_adj_s_v m)
  intro y
  rw [Finset.mem_sdiff, not_and, not_not, critU3T_mem_cbPart,
    eq_cbVertex_iff m 1 (by omega), eq_cbVertex_iff m 2 (by omega)]
  simp

end E993Transport
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma E993Transport.critU3T_cb_gadget a3655aa194901048316dd878d926911c5a07c0f3c527454f3ca0650d530bf901
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T2.lean` (74a1c05c…) lines 72–153.
set_option maxHeartbeats 4000000 in
/-- A choke gadget: `G = (1+2X)^8 + X(1+X)^8`. -/
lemma critU3T_cb_gadget (m i : ℕ) (hi : i < m) :
    critU3T_indepPoly (cbGraph m) (Finset.univ \ critU3T_cbPart m (i + 1)) =
      (1 + 2 * X) ^ 8 + X * (1 + X) ^ 8 := by
  have hu : (cbVertex m (3 + 17 * i)).val = 3 + 17 * i := cbVertex_val m _ (by omega)
  have huD : cbVertex m (3 + 17 * i) ∉ Finset.univ \ critU3T_cbPart m (i + 1) := by
    rw [Finset.mem_sdiff, not_and, not_not, critU3T_mem_cbPart, hu]; intro; right; omega
  rw [critU3T_indepPoly_vertex_split _ _ _ huD]
  congr 1
  · -- the gadget without `u_i`: eight disjoint support–leaf edges
    rw [critU3T_indepPoly_eq_prod (cbGraph m)
      (fun j => Finset.univ.filter (fun a : Fin (17 * m + 3) =>
        a.val = 3 + 17 * i + 1 + 2 * j ∨ a.val = 3 + 17 * i + 2 + 2 * j)) (Finset.range 8)]
    · rw [Finset.prod_congr rfl (g := fun _ => 1 + 2 * X), Finset.prod_const, Finset.card_range]
      intro j hj
      rw [Finset.mem_range] at hj
      apply critU3T_indepPoly_edge _ _ (cbVertex m (3 + 17 * i + 1 + 2 * j))
        (cbVertex m (3 + 17 * i + 2 + 2 * j)) _ (cbGraph_adj_support_leaf m i j hi hj)
      intro y
      rw [Finset.mem_sdiff, not_and, not_not, eq_cbVertex_iff m _ (by omega),
        eq_cbVertex_iff m _ (by omega)]
      simp
    · intro j _ k _ hjk
      rw [Finset.disjoint_left]; intro a ha hb; simp at ha hb; omega
    · intro j _ k hk hjk a ha b hb hadj
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
      rw [Finset.mem_range] at hk
      rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
      rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
        (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;>
        (try interval_cases j') <;> omega
    · intro a
      rw [Finset.mem_insert, Finset.mem_sdiff, not_or, not_and, not_not, critU3T_mem_cbPart,
        Fin.ext_iff, hu]
      simp only [Finset.mem_range, Finset.mem_filter, Finset.mem_univ, true_and]
      constructor
      · rintro ⟨hne, hpart⟩
        have hp := hpart trivial
        refine ⟨(a.val - (3 + 17 * i) - 1) / 2, by omega, by omega⟩
      · rintro ⟨j, hj, h⟩
        exact ⟨by omega, fun _ => by omega⟩
  · -- the gadget without `N[u_i]`: eight isolated private leaves
    congr 1
    rw [critU3T_indepPoly_eq_prod (cbGraph m)
      (fun j => Finset.univ.filter (fun a : Fin (17 * m + 3) =>
        a.val = 3 + 17 * i + 2 + 2 * j)) (Finset.range 8)]
    · rw [Finset.prod_congr rfl (g := fun _ => 1 + X), Finset.prod_const, Finset.card_range]
      intro j hj
      rw [Finset.mem_range] at hj
      apply critU3T_indepPoly_single _ _ (cbVertex m (3 + 17 * i + 2 + 2 * j))
      intro y
      rw [Finset.mem_sdiff, not_and, not_not, eq_cbVertex_iff m _ (by omega)]
      simp
    · intro j _ k _ hjk
      rw [Finset.disjoint_left]; intro a ha hb; simp at ha hb; omega
    · intro j _ k _ hjk a ha b hb hadj
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
      rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
      rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
        (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;>
        (try interval_cases j') <;> omega
    · intro a
      rw [Finset.mem_insert, Finset.mem_union, Finset.mem_sdiff, not_or, not_or, not_and, not_not,
        critU3T_mem_cbPart, Fin.ext_iff, hu, mem_neighborFinset_choke_iff m i hi]
      simp only [Finset.mem_range, Finset.mem_filter, Finset.mem_univ, true_and, not_or,
        not_exists, not_and]
      constructor
      · rintro ⟨hne, hpart, h0, hb⟩
        clear hu huD
        have hp := hpart trivial
        generalize a.val = t at hne hp h0 hb ⊢
        have hb' := hb ((t - (3 + 17 * i) - 1) / 2)
        refine ⟨(t - (3 + 17 * i) - 2) / 2, by omega, by omega⟩
      · rintro ⟨j, hj, h⟩
        clear hu huD
        rw [h]
        refine ⟨?_, fun _ => ?_, ?_, fun j' hj' => ?_⟩
        · omega
        · right; omega
        · omega
        · omega

end E993Transport
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma E993Transport.critU3T_cb_pairs 3439d84d1d3d799ac679926f500c3c0e84a1c72a2e41a65ed8b080dcf4439a7b
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA1 formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link; `CriticU3T2.lean` (74a1c05c…) lines 155–197.
set_option maxHeartbeats 4000000 in
/-- The surviving vertices of `CB(8,m) − N[r]` other than `v`: the `8m` support–leaf edges. -/
lemma critU3T_cb_pairs (m : ℕ) (D : Finset (Fin (17 * m + 3)))
    (hD : ∀ a : Fin (17 * m + 3), a ∉ D ↔
      ∃ i < m, ∃ j < 8, (a.val = 3 + 17 * i + 1 + 2 * j ∨ a.val = 3 + 17 * i + 2 + 2 * j)) :
    critU3T_indepPoly (cbGraph m) D = (1 + 2 * X) ^ (8 * m) := by
  rw [critU3T_indepPoly_eq_prod (cbGraph m)
    (fun ij : ℕ × ℕ => Finset.univ.filter (fun a : Fin (17 * m + 3) =>
      a.val = 3 + 17 * ij.1 + 1 + 2 * ij.2 ∨ a.val = 3 + 17 * ij.1 + 2 + 2 * ij.2))
    (Finset.range m ×ˢ Finset.range 8)]
  · rw [Finset.prod_product]
    rw [Finset.prod_congr rfl (g := fun _ => (1 + 2 * X) ^ 8)]
    · rw [Finset.prod_const, Finset.card_range, ← pow_mul, mul_comm]
    intro i hi
    rw [Finset.prod_congr rfl (g := fun _ => 1 + 2 * X), Finset.prod_const, Finset.card_range]
    intro j hj
    rw [Finset.mem_range] at hi hj
    apply critU3T_indepPoly_edge _ _ (cbVertex m (3 + 17 * i + 1 + 2 * j))
      (cbVertex m (3 + 17 * i + 2 + 2 * j)) _ (cbGraph_adj_support_leaf m i j hi hj)
    intro y
    rw [Finset.mem_sdiff, not_and, not_not, eq_cbVertex_iff m _ (by omega),
      eq_cbVertex_iff m _ (by omega)]
    simp
  · rintro ⟨i, j⟩ hij ⟨i', j'⟩ hij' hne
    simp only [Finset.mem_product, Finset.mem_range] at hij hij'
    have hne' : i ≠ i' ∨ j ≠ j' := by
      by_contra h; push Not at h; exact hne (by rw [h.1, h.2])
    rw [Finset.disjoint_left]; intro a ha hb; simp at ha hb; omega
  · rintro ⟨i, j⟩ hij ⟨i', j'⟩ hij' hne a ha b hb hadj
    simp only [Finset.mem_product, Finset.mem_range] at hij hij'
    have hne' : i ≠ i' ∨ j ≠ j' := by
      by_contra h; push Not at h; exact hne (by rw [h.1, h.2])
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
    rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
    rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
      (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;> omega
  · intro a
    rw [hD a]
    simp only [Finset.mem_product, Finset.mem_range, Finset.mem_filter, Finset.mem_univ, true_and,
      Prod.exists]
    constructor
    · rintro ⟨i, hi, j, hj, h⟩; exact ⟨i, j, ⟨hi, hj⟩, h⟩
    · rintro ⟨i, j, ⟨hi, hj⟩, h⟩; exact ⟨i, hi, j, hj, h⟩

end E993Transport
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma E993Transport.critU3T_cb_gadgets 6da0a71aafafb206f72925b465b9554e22bd7663fc33402a3aa4ae63b7652200
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link (arm leaf `v`); `CriticU3T2.lean` (74a1c05c…) lines 288–313.
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
set_option maxHeartbeats 4000000 in
/-- The `m` choke gadgets alone (`r, s, v` all deleted): `G^m` (critic C-U3-T). -/
lemma critU3T_cb_gadgets (m : ℕ) (D : Finset (Fin (17 * m + 3)))
    (hD : ∀ a : Fin (17 * m + 3), a ∉ D ↔ 3 ≤ a.val) :
    critU3T_indepPoly (cbGraph m) D = ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m := by
  rw [critU3T_indepPoly_eq_prod (cbGraph m) (fun i => critU3T_cbPart m (i + 1)) (Finset.range m),
    Finset.prod_congr rfl (g := fun _ => (1 + 2 * X) ^ 8 + X * (1 + X) ^ 8)
      (fun i hi => critU3T_cb_gadget m i (Finset.mem_range.mp hi)),
    Finset.prod_const, Finset.card_range]
  · intro i _ j _ hij
    rw [Finset.disjoint_left]; intro a ha hb
    rw [critU3T_mem_cbPart] at ha hb; omega
  · intro i _ j _ hij a ha b hb hadj
    rw [critU3T_mem_cbPart] at ha hb
    rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
    rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
      (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;>
      (try interval_cases j') <;> omega
  · intro a
    rw [hD a]
    have hlt := a.isLt
    simp only [Finset.mem_range, critU3T_mem_cbPart]
    constructor
    · intro h
      exact ⟨(a.val - 3) / 17, by omega, Or.inr ⟨by omega, by omega, by omega⟩⟩
    · rintro ⟨i, _, h⟩; omega

end E993Transport
-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma E993Transport.critU3T_cb_minus_v_closedForm 96d9eb23689ce40c53a5745a23d609b91cd24828e840c0883153b03fa4a95e68
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link (arm leaf `v`); `CriticU3T2.lean` (74a1c05c…) lines 315–368.
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
set_option maxHeartbeats 4000000 in
/-- **The closed form of record for `I(CB(8,m) − v)` (critic C-U3-T):** `(1+X)G^m + X(1+2X)^{8m}`,
over the carried `C4LA1.vertexDeletionIndepSetCount` at the arm leaf `v = cbVertex m 2`. -/
lemma critU3T_cb_minus_v_closedForm (m : ℕ) :
    critU3T_indepPoly (cbGraph m) {cbVertex m 2} =
      (1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) := by
  classical
  have h0 : (cbVertex m 0).val = 0 := cbVertex_val m 0 (by omega)
  have h2 : (cbVertex m 2).val = 2 := cbVertex_val m 2 (by omega)
  have hr : cbVertex m 0 ∉ ({cbVertex m 2} : Finset _) := by
    rw [Finset.mem_singleton, Fin.ext_iff, h0, h2]; omega
  rw [critU3T_indepPoly_vertex_split (cbGraph m) _ (cbVertex m 0) hr]
  congr 1
  · -- `CB − {v, r}`: the pendant `{s}` times the gadgets
    rw [critU3T_indepPoly_disjoint_mul (cbGraph m) _
      (Finset.univ.filter (fun a : Fin (17 * m + 3) => a.val = 1))
      (Finset.univ.filter (fun a : Fin (17 * m + 3) => 3 ≤ a.val))]
    · congr 1
      · apply critU3T_indepPoly_single _ _ (cbVertex m 1)
        intro y
        rw [eq_cbVertex_iff m 1 (by omega)]
        simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton, Finset.mem_filter,
          Finset.mem_univ, true_and, Fin.ext_iff, h0, h2]
        omega
      · apply critU3T_cb_gadgets
        intro y
        simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton, Finset.mem_filter,
          Finset.mem_univ, true_and, Fin.ext_iff, h0, h2]
        omega
    · intro y
      simp only [Finset.mem_insert, Finset.mem_singleton, Finset.mem_filter,
        Finset.mem_univ, true_and, Fin.ext_iff, h0, h2]
      omega
    · rw [Finset.disjoint_left]; intro a ha hb; simp at ha hb; omega
    · intro p hp q hq hadj
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hp hq
      rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
      rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
        (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;> omega
  · congr 1
    apply critU3T_cb_pairs
    intro a
    rw [Finset.mem_insert, Finset.mem_union, Finset.mem_singleton, mem_neighborFinset_root_iff,
      Fin.ext_iff, Fin.ext_iff, h0, h2]
    have hlt := a.isLt
    generalize a.val = t at hlt ⊢
    constructor
    · intro h
      push Not at h
      obtain ⟨h0', h2', h1', hch⟩ := h
      have hc := hch ((t - 3) / 17)
      exact ⟨(t - 3) / 17, by omega, ((t - 3) % 17 - 1) / 2, by omega, by omega⟩
    · rintro ⟨i, hi, j, hj, h⟩
      push Not; refine ⟨by omega, by omega, by omega, fun i' _ => by omega⟩

end E993Transport
-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma E993Transport.critU3T_cb_vertexDeletion_v_eq_coeff 2f427993e676c9674714180ddc1450efce849e83f93c25a4e15dcd4f82202976
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): re-authored under attribution from the DRAFT seed;
-- origin: critic C-U3-T (Claude Opus 5.5), closed-form link (arm leaf `v`); `CriticU3T2.lean` (74a1c05c…) lines 370–376.
-- edits (and only these): `theorem` keyword -> `lemma` (one terminal theorem per award).
lemma critU3T_cb_vertexDeletion_v_eq_coeff (m k : ℕ) :
    C4LA1.vertexDeletionIndepSetCount (cbGraph m) (cbVertex m 2) k =
      ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) :
        Polynomial ℕ).coeff k := by
  rw [← critU3T_cb_minus_v_closedForm, critU3T_coeff_indepPoly]
  unfold C5LA1.indepSetCount C5LA1.indepSetsAvoiding C4LA1.vertexDeletionIndepSetCount
  rw [← Finset.erase_eq]

end E993Transport
-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma E993Transport.cb8_indepPoly_isolated_factor 7f3ed8cdb4957bc1a1614aea5e6fe3cfdd36d1fdd3810fc62b5baf8247d269f3
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial
variable {V : Type*} [Fintype V] [DecidableEq V]

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N1 of the Cycle 2 synthesis, `### C2-LA3`),
-- composing U3's Node 0 in C-U3-T's polynomial form (`critU3T_indepPoly_vertex_split`, carried C2-LA1 entry 532).
/-- An isolated surviving vertex splits off a factor `1 + X`: if every neighbour of `x` is already
deleted, `I(G − D) = (1 + X) · I(G − D − x)`. -/
lemma cb8_indepPoly_isolated_factor (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (x : V) (hx : x ∉ D) (hN : ∀ y, G.Adj x y → y ∈ D) :
    critU3T_indepPoly G D = (1 + X) * critU3T_indepPoly G (insert x D) := by
  rw [critU3T_indepPoly_vertex_split G D x hx,
    critU3T_indepPoly_congr G (insert x (D ∪ G.neighborFinset x)) (insert x D) (fun a => by
      simp only [Finset.mem_insert, Finset.mem_union, SimpleGraph.mem_neighborFinset]
      constructor
      · rintro (h | h | h)
        exacts [Or.inl h, Or.inr h, Or.inr (hN a h)]
      · rintro (h | h)
        exacts [Or.inl h, Or.inr (Or.inl h)])]
  ring

end E993Transport
-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma E993Transport.cb8_damagedGadget aebddc49263945ed08363b79fad0b1b390e5b6d574ed43e33b327e3042cad4fb
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N1 of the Cycle 2 synthesis, `### C2-LA3`),
-- patterned on critic C-U3-T's `critU3T_cb_gadget` (`CriticU3T2.lean` (74a1c05c…) lines 72–153; carried C2-LA1 entry 537).
set_option maxHeartbeats 4000000 in
/-- **The damaged choke gadget (N1).** The gadget of `u_i` with its private leaf `c_{ij}` deleted has
generating polynomial `G_c = (1+2X)^7(1+X) + X(1+X)^7`: split at `u_i`; without `u_i` there remain seven
support–leaf edges and the isolated support `b_{ij}`; without `N[u_i]` the seven other private leaves. -/
lemma cb8_damagedGadget (m i j : ℕ) (hi : i < m) (hj : j < 8) (D : Finset (Fin (17 * m + 3)))
    (hD : ∀ a : Fin (17 * m + 3), a ∉ D ↔
      (3 + 17 * i ≤ a.val ∧ a.val < 3 + 17 * i + 17 ∧ a.val ≠ 3 + 17 * i + 2 + 2 * j)) :
    critU3T_indepPoly (cbGraph m) D = (1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7 := by
  classical
  have hu : (cbVertex m (3 + 17 * i)).val = 3 + 17 * i := cbVertex_val m _ (by omega)
  have huD : cbVertex m (3 + 17 * i) ∉ D := by
    rw [hD, hu]; omega
  rw [critU3T_indepPoly_vertex_split _ _ _ huD]
  congr 1
  · -- without `u_i`: seven support–leaf edges and the isolated support `b_{ij}`
    rw [critU3T_indepPoly_disjoint_mul (cbGraph m) (insert (cbVertex m (3 + 17 * i)) D)
      (Finset.univ.filter (fun a : Fin (17 * m + 3) =>
        ∃ j' < 8, j' ≠ j ∧ (a.val = 3 + 17 * i + 1 + 2 * j' ∨ a.val = 3 + 17 * i + 2 + 2 * j')))
      (Finset.univ.filter (fun a : Fin (17 * m + 3) => a.val = 3 + 17 * i + 1 + 2 * j))]
    · congr 1
      · rw [critU3T_indepPoly_eq_prod (cbGraph m)
          (fun j' => Finset.univ.filter (fun a : Fin (17 * m + 3) =>
            a.val = 3 + 17 * i + 1 + 2 * j' ∨ a.val = 3 + 17 * i + 2 + 2 * j'))
          ((Finset.range 8).erase j)]
        · rw [Finset.prod_congr rfl (g := fun _ => 1 + 2 * X), Finset.prod_const,
            Finset.card_erase_of_mem (Finset.mem_range.mpr hj), Finset.card_range]
          intro j' hj'
          rw [Finset.mem_erase, Finset.mem_range] at hj'
          apply critU3T_indepPoly_edge _ _ (cbVertex m (3 + 17 * i + 1 + 2 * j'))
            (cbVertex m (3 + 17 * i + 2 + 2 * j')) _ (cbGraph_adj_support_leaf m i j' hi hj'.2)
          intro y
          rw [Finset.mem_sdiff, not_and, not_not, eq_cbVertex_iff m _ (by omega),
            eq_cbVertex_iff m _ (by omega)]
          simp
        · intro j1 _ j2 _ hj12
          rw [Finset.disjoint_left]; intro a ha hb; simp at ha hb; omega
        · intro j1 hj1 j2 hj2 hj12 a ha b hb hadj
          rw [Finset.mem_erase, Finset.mem_range] at hj1 hj2
          simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
          rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
          rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
            (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;>
            (try interval_cases j') <;> omega
        · intro a
          rw [Finset.mem_union, not_or, Finset.mem_insert, not_or, hD a, Fin.ext_iff, hu]
          simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_erase, Finset.mem_range]
          constructor
          · rintro ⟨⟨hne, hlo, hhi, hc⟩, hb⟩
            exact ⟨(a.val - (3 + 17 * i) - 1) / 2, ⟨by omega, by omega⟩, by omega⟩
          · rintro ⟨j', ⟨hj'j, hj'8⟩, h⟩
            omega
      · apply critU3T_indepPoly_single _ _ (cbVertex m (3 + 17 * i + 1 + 2 * j))
        intro y
        rw [Finset.mem_union, not_or, Finset.mem_insert, not_or, hD y, Fin.ext_iff, hu,
          eq_cbVertex_iff m _ (by omega)]
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
        constructor
        · rintro ⟨⟨hne, hlo, hhi, hc⟩, hp⟩
          by_contra hy
          exact hp ⟨(y.val - (3 + 17 * i) - 1) / 2, by omega, fun h => hy (by omega), by omega⟩
        · intro h
          refine ⟨⟨by omega, by omega, by omega, by omega⟩, ?_⟩
          rintro ⟨j', hj', hne, h'⟩
          omega
    · intro a
      rw [Finset.mem_insert, not_or, hD a, Fin.ext_iff, hu]
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      constructor
      · rintro ⟨hne, hlo, hhi, hc⟩
        by_cases hb : a.val = 3 + 17 * i + 1 + 2 * j
        · exact Or.inr hb
        · exact Or.inl ⟨(a.val - (3 + 17 * i) - 1) / 2, by omega, fun h => hb (by omega), by omega⟩
      · rintro (⟨j', hj', hne, h⟩ | h) <;> omega
    · rw [Finset.disjoint_left]; intro a ha hb
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
      obtain ⟨j', hj', hne, h⟩ := ha
      omega
    · intro p hp q hq hadj
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hp hq
      obtain ⟨j', hj', hne, hp⟩ := hp
      rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
      rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
        (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;> omega
  · -- without `N[u_i]`: the seven surviving private leaves
    congr 1
    rw [critU3T_indepPoly_eq_prod (cbGraph m)
      (fun j' => Finset.univ.filter (fun a : Fin (17 * m + 3) => a.val = 3 + 17 * i + 2 + 2 * j'))
      ((Finset.range 8).erase j)]
    · rw [Finset.prod_congr rfl (g := fun _ => 1 + X), Finset.prod_const,
        Finset.card_erase_of_mem (Finset.mem_range.mpr hj), Finset.card_range]
      intro j' hj'
      rw [Finset.mem_erase, Finset.mem_range] at hj'
      apply critU3T_indepPoly_single _ _ (cbVertex m (3 + 17 * i + 2 + 2 * j'))
      intro y
      rw [Finset.mem_sdiff, not_and, not_not, eq_cbVertex_iff m _ (by omega)]
      simp
    · intro j1 _ j2 _ hj12
      rw [Finset.disjoint_left]; intro a ha hb; simp at ha hb; omega
    · intro j1 hj1 j2 hj2 hj12 a ha b hb hadj
      rw [Finset.mem_erase, Finset.mem_range] at hj1 hj2
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
      rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
      rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
        (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;>
        (try interval_cases j') <;> omega
    · intro a
      rw [Finset.mem_insert, Finset.mem_union, not_or, not_or, Fin.ext_iff, hu, hD a,
        mem_neighborFinset_choke_iff m i hi]
      simp only [Finset.mem_erase, Finset.mem_range, Finset.mem_filter, Finset.mem_univ, true_and,
        not_or, not_exists, not_and]
      constructor
      · rintro ⟨hne, ⟨hlo, hhi, hc⟩, h0, hb⟩
        have hb' := hb ((a.val - (3 + 17 * i) - 1) / 2)
        exact ⟨(a.val - (3 + 17 * i) - 2) / 2, ⟨by omega, by omega⟩, by omega⟩
      · rintro ⟨j', ⟨hj'j, hj'8⟩, h⟩
        refine ⟨by omega, ⟨by omega, by omega, by omega⟩, by omega, fun j'' _ => by omega⟩

end E993Transport
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma E993Transport.cb8_pairs_erase 7ae63d8d6e1cb44d5d2cd8d32f64c13afd7684b0500c3f6625e9d4127b27b379
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N1 of the Cycle 2 synthesis, `### C2-LA3`),
-- patterned on critic C-U3-T's `critU3T_cb_pairs` (`CriticU3T2.lean` (74a1c05c…) lines 155–197; carried C2-LA1 entry 538).
set_option maxHeartbeats 4000000 in
/-- The support–leaf edges of `CB(8,m)` other than `b_{ij}c_{ij}`: `(1 + 2X)^{8m−1}`. -/
lemma cb8_pairs_erase (m i j : ℕ) (hi : i < m) (hj : j < 8) (D : Finset (Fin (17 * m + 3)))
    (hD : ∀ a : Fin (17 * m + 3), a ∉ D ↔
      ∃ i' < m, ∃ j' < 8, ¬ (i' = i ∧ j' = j) ∧
        (a.val = 3 + 17 * i' + 1 + 2 * j' ∨ a.val = 3 + 17 * i' + 2 + 2 * j')) :
    critU3T_indepPoly (cbGraph m) D = (1 + 2 * X) ^ (8 * m - 1) := by
  rw [critU3T_indepPoly_eq_prod (cbGraph m)
    (fun ij : ℕ × ℕ => Finset.univ.filter (fun a : Fin (17 * m + 3) =>
      a.val = 3 + 17 * ij.1 + 1 + 2 * ij.2 ∨ a.val = 3 + 17 * ij.1 + 2 + 2 * ij.2))
    ((Finset.range m ×ˢ Finset.range 8).erase (i, j))]
  · rw [Finset.prod_congr rfl (g := fun _ => 1 + 2 * X), Finset.prod_const,
      Finset.card_erase_of_mem (by simp [hi, hj]), Finset.card_product, Finset.card_range,
      Finset.card_range, Nat.mul_comm m 8]
    rintro ⟨i', j'⟩ hij
    simp only [Finset.mem_erase, Finset.mem_product, Finset.mem_range] at hij
    apply critU3T_indepPoly_edge _ _ (cbVertex m (3 + 17 * i' + 1 + 2 * j'))
      (cbVertex m (3 + 17 * i' + 2 + 2 * j')) _ (cbGraph_adj_support_leaf m i' j' hij.2.1 hij.2.2)
    intro y
    rw [Finset.mem_sdiff, not_and, not_not, eq_cbVertex_iff m _ (by omega),
      eq_cbVertex_iff m _ (by omega)]
    simp
  · rintro ⟨i1, j1⟩ hij ⟨i2, j2⟩ hij' hne
    simp only [Finset.mem_erase, Finset.mem_product, Finset.mem_range] at hij hij'
    have hne' : i1 ≠ i2 ∨ j1 ≠ j2 := by
      by_contra h; push Not at h; exact hne (by rw [h.1, h.2])
    rw [Finset.disjoint_left]; intro a ha hb; simp at ha hb; omega
  · rintro ⟨i1, j1⟩ hij ⟨i2, j2⟩ hij' hne a ha b hb hadj
    simp only [Finset.mem_erase, Finset.mem_product, Finset.mem_range] at hij hij'
    have hne' : i1 ≠ i2 ∨ j1 ≠ j2 := by
      by_contra h; push Not at h; exact hne (by rw [h.1, h.2])
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
    rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
    rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
      (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;> omega
  · intro a
    rw [hD a]
    simp only [Finset.mem_erase, Finset.mem_product, Finset.mem_range, Finset.mem_filter,
      Finset.mem_univ, true_and, Prod.exists, ne_eq, Prod.mk.injEq]
    constructor
    · rintro ⟨i', hi', j', hj', hne, h⟩; exact ⟨i', j', ⟨hne, hi', hj'⟩, h⟩
    · rintro ⟨i', j', ⟨hne, hi', hj'⟩, h⟩; exact ⟨i', hi', j', hj', hne, h⟩

end E993Transport
-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma E993Transport.cb8_privateLeaf_minus_closedNbhd_root c8712394f8028644ff6e4ad4ef1c6652352bf1fa689ae114f7e01e347563ca36
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N1 of the Cycle 2 synthesis, `### C2-LA3`),
-- patterned on critic C-U3-T's `critU3T_cb_minus_closedNbhd_root` (`CriticU3T2.lean` (74a1c05c…) lines 199–263; C2-LA1 entry 539, not carried).
set_option maxHeartbeats 4000000 in
/-- `CB(8,m) − c_{ij} − N[r]`: the arm leaf `v` and the support `b_{ij}` are isolated, and the other
`8m − 1` support–leaf edges remain: `(1 + X)((1 + X)(1 + 2X)^{8m−1})`. -/
lemma cb8_privateLeaf_minus_closedNbhd_root (m i j : ℕ) (hi : i < m) (hj : j < 8) :
    critU3T_indepPoly (cbGraph m)
        (insert (cbVertex m 0) ({cbVertex m (3 + 17 * i + 2 + 2 * j)} ∪
          (cbGraph m).neighborFinset (cbVertex m 0))) =
      (1 + X) * ((1 + X) * (1 + 2 * X) ^ (8 * m - 1)) := by
  set D := insert (cbVertex m 0) ({cbVertex m (3 + 17 * i + 2 + 2 * j)} ∪
    (cbGraph m).neighborFinset (cbVertex m 0)) with hDdef
  have h0 : (cbVertex m 0).val = 0 := cbVertex_val m 0 (by omega)
  have hv : (cbVertex m 2).val = 2 := cbVertex_val m 2 (by omega)
  have hb : (cbVertex m (3 + 17 * i + 1 + 2 * j)).val = 3 + 17 * i + 1 + 2 * j :=
    cbVertex_val m _ (by omega)
  have hc : (cbVertex m (3 + 17 * i + 2 + 2 * j)).val = 3 + 17 * i + 2 + 2 * j :=
    cbVertex_val m _ (by omega)
  have hD : ∀ a : Fin (17 * m + 3), a ∉ D ↔
      (a.val = 2 ∨ a.val = 3 + 17 * i + 1 + 2 * j ∨
        ∃ i' < m, ∃ j' < 8, ¬ (i' = i ∧ j' = j) ∧
          (a.val = 3 + 17 * i' + 1 + 2 * j' ∨ a.val = 3 + 17 * i' + 2 + 2 * j')) := by
    intro a
    rw [hDdef, Finset.mem_insert, Finset.mem_union, Finset.mem_singleton, mem_neighborFinset_root_iff,
      Fin.ext_iff, Fin.ext_iff, h0, hc]
    have hlt := a.isLt
    generalize a.val = t at hlt ⊢
    constructor
    · intro h
      push Not at h
      obtain ⟨h0', hc', h1', hch⟩ := h
      have hcc := hch ((t - 3) / 17)
      by_cases h2 : t = 2
      · exact Or.inl h2
      · by_cases hbt : t = 3 + 17 * i + 1 + 2 * j
        · exact Or.inr (Or.inl hbt)
        · right; right
          exact ⟨(t - 3) / 17, by omega, ((t - 3) % 17 - 1) / 2, by omega, by omega, by omega⟩
    · rintro (h | h | ⟨i', hi', j', hj', hne, h⟩)
      · push Not; exact ⟨by omega, by omega, by omega, fun i' _ => by omega⟩
      · push Not; exact ⟨by omega, by omega, by omega, fun i' _ => by omega⟩
      · push Not; exact ⟨by omega, by omega, by omega, fun i'' _ => by omega⟩
  -- the arm leaf `v` is isolated in `CB − D`
  have hvD : cbVertex m 2 ∉ D := by rw [hD, hv]; exact Or.inl rfl
  rw [cb8_indepPoly_isolated_factor (cbGraph m) D (cbVertex m 2) hvD (by
    intro y hadj
    by_contra hy
    rw [hD y] at hy
    rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj; rw [hv] at hadj
    rcases hy with hy | hy | ⟨i', hi', j', hj', hne, hy⟩ <;>
    rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
      (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;> omega)]
  -- the support `b_{ij}` is isolated in `CB − D − v`
  have hD1 : ∀ a : Fin (17 * m + 3), a ∉ insert (cbVertex m 2) D ↔
      (a.val = 3 + 17 * i + 1 + 2 * j ∨
        ∃ i' < m, ∃ j' < 8, ¬ (i' = i ∧ j' = j) ∧
          (a.val = 3 + 17 * i' + 1 + 2 * j' ∨ a.val = 3 + 17 * i' + 2 + 2 * j')) := by
    intro a
    rw [Finset.mem_insert, not_or, hD a, Fin.ext_iff, hv]
    constructor
    · rintro ⟨h2, h | h | h⟩
      exacts [absurd h h2, Or.inl h, Or.inr h]
    · rintro (h | ⟨i', hi', j', hj', hne, h⟩)
      · exact ⟨by omega, Or.inr (Or.inl h)⟩
      · exact ⟨by omega, Or.inr (Or.inr ⟨i', hi', j', hj', hne, h⟩)⟩
  have hbD : cbVertex m (3 + 17 * i + 1 + 2 * j) ∉ insert (cbVertex m 2) D := by
    rw [hD1, hb]; exact Or.inl rfl
  rw [cb8_indepPoly_isolated_factor (cbGraph m) _ (cbVertex m (3 + 17 * i + 1 + 2 * j)) hbD (by
    intro y hadj
    by_contra hy
    rw [hD1 y] at hy
    rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj; rw [hb] at hadj
    rcases hy with hy | ⟨i', hi', j', hj', hne, hy⟩ <;>
    rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
      (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i'', hi'', ⟨h1, h2⟩ | ⟨j'', hj'', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;> omega)]
  -- the remaining `8m − 1` support–leaf edges
  rw [cb8_pairs_erase m i j hi hj]
  intro a
  rw [Finset.mem_insert, not_or, hD1 a, Fin.ext_iff, hb]
  constructor
  · rintro ⟨hne, h | h⟩
    exacts [absurd h hne, h]
  · rintro ⟨i', hi', j', hj', hne, h⟩
    exact ⟨by omega, Or.inr ⟨i', hi', j', hj', hne, h⟩⟩

end E993Transport
-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma E993Transport.cb8_privateLeaf_minus_root 528c799821093f06b04c51e582420916885dfe4d9f61f99fd7e4a7a70c401844
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N1 of the Cycle 2 synthesis, `### C2-LA3`),
-- the branch product at the root with one damaged branch (critic C-U3-T's `critU3T_cb_minus_root_prod` pattern,
-- `CriticU3T.lean` (b2f134b8…) lines 283–317, over the parts `critU3T_cbPart m k` with `c_{ij}` erased).
set_option maxHeartbeats 4000000 in
/-- `CB(8,m) − c_{ij} − r`: the pendant `{s, v}`, the damaged gadget of `u_i` and the `m − 1` intact gadgets,
`(1 + 2X)(G_c · G^{m−1})`. -/
lemma cb8_privateLeaf_minus_root (m i j : ℕ) (hi : i < m) (hj : j < 8) :
    critU3T_indepPoly (cbGraph m) (insert (cbVertex m 0) {cbVertex m (3 + 17 * i + 2 + 2 * j)}) =
      (1 + 2 * X) * (((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
        ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1)) := by
  have h0 : (cbVertex m 0).val = 0 := cbVertex_val m 0 (by omega)
  have hc : (cbVertex m (3 + 17 * i + 2 + 2 * j)).val = 3 + 17 * i + 2 + 2 * j :=
    cbVertex_val m _ (by omega)
  rw [critU3T_indepPoly_eq_prod (cbGraph m)
    (fun k => (critU3T_cbPart m k).erase (cbVertex m (3 + 17 * i + 2 + 2 * j))) (Finset.range (m + 1))]
  · rw [Finset.prod_range_succ']
    have hpend : critU3T_indepPoly (cbGraph m)
        (Finset.univ \ (critU3T_cbPart m 0).erase (cbVertex m (3 + 17 * i + 2 + 2 * j))) = 1 + 2 * X := by
      rw [Finset.erase_eq_of_notMem, critU3T_cb_pendant]
      rw [critU3T_mem_cbPart, hc]; omega
    rw [hpend, ← Finset.mul_prod_erase (Finset.range m)
      (fun k => critU3T_indepPoly (cbGraph m)
        (Finset.univ \ (critU3T_cbPart m (k + 1)).erase (cbVertex m (3 + 17 * i + 2 + 2 * j))))
      (Finset.mem_range.mpr hi)]
    rw [Finset.prod_congr rfl (g := fun _ => (1 + 2 * X) ^ 8 + X * (1 + X) ^ 8)]
    · rw [Finset.prod_const, Finset.card_erase_of_mem (Finset.mem_range.mpr hi), Finset.card_range]
      rw [cb8_damagedGadget m i j hi hj]
      · ring
      · intro a
        rw [Finset.mem_sdiff, not_and, not_not, Finset.mem_erase, Ne, critU3T_mem_cbPart, Fin.ext_iff, hc]
        simp only [Finset.mem_univ, true_implies]
        omega
    · intro k hk
      rw [Finset.mem_erase, Finset.mem_range] at hk
      rw [Finset.erase_eq_of_notMem, critU3T_cb_gadget m k hk.2]
      rw [critU3T_mem_cbPart, hc]; omega
  · intro k1 _ k2 _ hk
    rw [Finset.disjoint_left]; intro a ha hb
    rw [Finset.mem_erase, critU3T_mem_cbPart] at ha hb
    obtain ⟨-, ha⟩ := ha; obtain ⟨-, hb⟩ := hb
    omega
  · intro k1 _ k2 _ hk a ha b hb hadj
    rw [Finset.mem_erase, critU3T_mem_cbPart] at ha hb
    obtain ⟨-, ha⟩ := ha; obtain ⟨-, hb⟩ := hb
    rw [cbGraph_adj_iff] at hadj; unfold cbEdge at hadj
    rcases hadj with (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) |
      (⟨h1, h2⟩ | ⟨h1, h2⟩ | ⟨i', hi', ⟨h1, h2⟩ | ⟨j', hj', ⟨h1, h2⟩ | ⟨h1, h2⟩⟩⟩) <;>
      (try interval_cases j') <;> omega
  · intro a
    rw [Finset.mem_insert, Finset.mem_singleton, not_or, Fin.ext_iff, Fin.ext_iff, h0, hc]
    have hlt := a.isLt
    constructor
    · rintro ⟨ha0, hac⟩
      by_cases h12 : a.val = 1 ∨ a.val = 2
      · refine ⟨0, Finset.mem_range.mpr (by omega), ?_⟩
        rw [Finset.mem_erase, critU3T_mem_cbPart, Ne, Fin.ext_iff, hc]
        omega
      · refine ⟨(a.val - 3) / 17 + 1, Finset.mem_range.mpr (by omega), ?_⟩
        rw [Finset.mem_erase, critU3T_mem_cbPart, Ne, Fin.ext_iff, hc]
        refine ⟨hac, Or.inr ⟨by omega, ?_, ?_⟩⟩ <;> simp only [Nat.add_sub_cancel] <;> omega
    · rintro ⟨k, hk, ha⟩
      rw [Finset.mem_erase, critU3T_mem_cbPart, Ne, Fin.ext_iff, hc] at ha
      omega

end E993Transport
-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma E993Transport.cb8_privateLeaf_indepPoly_closedForm b5937c4599e95a120370b14d0344a8a190c87e81a3b4295879058b4615520681
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N1 of the Cycle 2 synthesis, `### C2-LA3`),
-- the vertex split at the root (U3 Node 0; C-U3-T's polynomial form), as for `critU3T_cb_minus_v_closedForm`.
/-- **The closed form of record for `I(CB(8,m) − c_{ij})` (N1):**
`(1+2X)·G_c·G^{m−1} + X(1+X)^2(1+2X)^{8m−1}`, `G_c = (1+2X)^7(1+X) + X(1+X)^7`, `G = (1+2X)^8 + X(1+X)^8`,
for every private leaf `c_{ij}` (`i < m`, `j < 8`) directly. -/
lemma cb8_privateLeaf_indepPoly_closedForm (m i j : ℕ) (hi : i < m) (hj : j < 8) :
    critU3T_indepPoly (cbGraph m) {cbVertex m (3 + 17 * i + 2 + 2 * j)} =
      (1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) := by
  have h0 : (cbVertex m 0).val = 0 := cbVertex_val m 0 (by omega)
  have hc : (cbVertex m (3 + 17 * i + 2 + 2 * j)).val = 3 + 17 * i + 2 + 2 * j :=
    cbVertex_val m _ (by omega)
  have hr : cbVertex m 0 ∉ ({cbVertex m (3 + 17 * i + 2 + 2 * j)} : Finset (Fin (17 * m + 3))) := by
    rw [Finset.mem_singleton, Fin.ext_iff, h0, hc]; omega
  rw [critU3T_indepPoly_vertex_split (cbGraph m) _ (cbVertex m 0) hr,
    cb8_privateLeaf_minus_root m i j hi hj, cb8_privateLeaf_minus_closedNbhd_root m i j hi hj]
  ring

end E993Transport
-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma E993Transport.cb8_vertexDeletion_privateLeaf_eq_coeff 94276aca863273367ba48a311eda8967edb861bb5308e7cc06aa3f8edfe0c002
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N1 of the Cycle 2 synthesis, `### C2-LA3`),
-- the count-equals-coefficient step as in critic C-U3-T's `critU3T_cb_vertexDeletion_v_eq_coeff`.
/-- **Node (N1).** For every private leaf `c_{ij}`, the carried count
`C4LA1.vertexDeletionIndepSetCount (cbGraph m) c_{ij} k` is the `k`-th coefficient of
`(1+2X)·G_c·G^{m−1} + X(1+X)^2(1+2X)^{8m−1}` over `ℕ`. -/
lemma cb8_vertexDeletion_privateLeaf_eq_coeff (m i j k : ℕ) (hi : i < m) (hj : j < 8) :
    C4LA1.vertexDeletionIndepSetCount (cbGraph m) (cbVertex m (3 + 17 * i + 2 + 2 * j)) k =
      ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : Polynomial ℕ).coeff k := by
  rw [← cb8_privateLeaf_indepPoly_closedForm m i j hi hj, critU3T_coeff_indepPoly]
  unfold C5LA1.indepSetCount C5LA1.indepSetsAvoiding C4LA1.vertexDeletionIndepSetCount
  rw [← Finset.erase_eq]

end E993Transport
-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma E993Transport.cb8_armLeaf_isFavorableAt_topRank b366745d58b798f649d498828df86827a4eb02539d6c6ff81b1185b47f0d52c4
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N4 of the Cycle 2 synthesis, `### C2-LA3`):
-- the ℕ→ℤ cast of the forward difference (carried C1-LA2 entry 2) against C2-LA2's first conjunct (carried, rekeyed).
/-- **Arm-leaf favorability on the literal tree (N2 + N4).** `v` is strictly favorable at `p* = (16m+4)/3`. -/
lemma cb8_armLeaf_isFavorableAt_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    C4LA1.IsFavorableAt (cbGraph m) (cbVertex m 2) ((16 * m + 4) / 3) := by
  have h := (cb8_leafDeletion_closedForms_descent_topRank m hm hmod).1
  have hmap : ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]) =
      Polynomial.map (Nat.castRingHom ℤ)
        ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℕ[X]) := by
    simp only [Polynomial.map_add, Polynomial.map_mul, Polynomial.map_pow, Polynomial.map_one,
      Polynomial.map_X, Polynomial.map_ofNat]
  rw [hmap, Polynomial.coeff_map, Polynomial.coeff_map, eq_natCast, eq_natCast] at h
  unfold C4LA1.IsFavorableAt C4LA1.vertexDeletionForwardDifference
  rw [critU3T_cb_vertexDeletion_v_eq_coeff, critU3T_cb_vertexDeletion_v_eq_coeff]
  exact sub_neg.mpr h

end E993Transport
-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma E993Transport.cb8_privateLeaf_isFavorableAt_topRank 4a516087f55750bb1c193bac36be9984110801f5a92aaaec644bab694ef13d81
namespace E993Transport

open SimpleGraph C4LA1 C5LA1 Polynomial

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): NEW (node N4 of the Cycle 2 synthesis, `### C2-LA3`):
-- the ℕ→ℤ cast of the forward difference (carried C1-LA2 entry 2) against C2-LA2's second conjunct (carried, rekeyed).
/-- **Private-leaf favorability on the literal tree (N1 + N4).** Every `c_{ij}` (`i < m`, `j < 8`) is strictly
favorable at `p* = (16m+4)/3`. -/
lemma cb8_privateLeaf_isFavorableAt_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (i j : ℕ)
    (hi : i < m) (hj : j < 8) :
    C4LA1.IsFavorableAt (cbGraph m) (cbVertex m (3 + 17 * i + 2 + 2 * j)) ((16 * m + 4) / 3) := by
  have h := (cb8_leafDeletion_closedForms_descent_topRank m hm hmod).2
  have hmap : ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
        ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) + X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]) =
      Polynomial.map (Nat.castRingHom ℤ)
        ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
          ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) + X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℕ[X]) := by
    simp only [Polynomial.map_add, Polynomial.map_mul, Polynomial.map_pow, Polynomial.map_one,
      Polynomial.map_X, Polynomial.map_ofNat]
  rw [hmap, Polynomial.coeff_map, Polynomial.coeff_map, eq_natCast, eq_natCast] at h
  unfold C4LA1.IsFavorableAt C4LA1.vertexDeletionForwardDifference
  rw [cb8_vertexDeletion_privateLeaf_eq_coeff m i j _ hi hj,
    cb8_vertexDeletion_privateLeaf_eq_coeff m i j _ hi hj]
  exact sub_neg.mpr h

end E993Transport
-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN theorem E993Transport.cb8_favorableLeaves_eq_leafSet_topRank 81a0e7bfa18e6339d6eea50dd2fe16e633b2b06784ee376d7b576ac92441de36
namespace E993Transport

-- r31 C2-LA3 formalizer c2-la3-formalizer-opus-20260928 (Claude Opus 5.5): terminal frozen by the Cycle 2 synthesis
-- (`### C2-LA3`); proof = node N3 (carried C1-LA2 entries 60, 72) + node N4 (carried C1-LA2 entry 74).
/-- r31 C2-LA3 terminal (frozen by the Cycle 2 synthesis, `### C2-LA3`): graph-level favorability. On the
literal tree `CB(8,m)` (`cbGraph m`), for every `m ≥ 107` with `m ≡ 2 (mod 3)`, the fixed original strict
selector at the single rank `p* = (16m+4)/3` is the whole leaf set. Fences: one rank `p*`; `d = 8`; the r31
class only. Not claimed: (H), conjunct 4, (HALL) at any scope, any aggregate, TREE, FOREST or TRANSFER status. -/
theorem cb8_favorableLeaves_eq_leafSet_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m) := by
  apply favorableLeaves_eq_leafSet_of_all
  rw [cb_leafSet_eq_image m (by omega)]
  intro τ hτ
  rcases Finset.mem_insert.mp hτ with rfl | hτ
  · exact cb8_armLeaf_isFavorableAt_topRank m hm hmod
  · obtain ⟨⟨i, j⟩, hij, rfl⟩ := Finset.mem_image.mp hτ
    rw [Finset.mem_product, Finset.mem_range, Finset.mem_range] at hij
    exact cb8_privateLeaf_isFavorableAt_topRank m hm hmod i j hij.1 hij.2

end E993Transport
-- VERITYOS ENTRY 90 END

