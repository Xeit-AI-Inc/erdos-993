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

-- VERITYOS ENTRY 5 BEGIN definition C5LA1.support 8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4
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
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition C5LA1.leafSet 78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- The set of original leaves of `G`. -/
noncomputable
def leafSet (G : SimpleGraph V) : Finset V :=
  Finset.univ.filter (C4LA1.IsGraphLeaf G)

end C5LA1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition C5LA1.leafDegree ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `lambda(s)`: the number of leaves of `G` adjacent to `s`, zero off
supports. -/
noncomputable
def leafDegree (G : SimpleGraph V) [DecidableRel G.Adj] (s : V) : Nat :=
  ((leafSet G).filter fun v => G.Adj v s).card

end C5LA1
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition C5LA1.H 55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `H_v = G - {v, s_v}`, realised as the deletion set for a leaf `v`. -/
noncomputable
def H (G : SimpleGraph V) (v : V) : Finset V :=
  {v, support G v}

end C5LA1
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition C5LA1.R a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `R_v = G - N[s_v]`, realised as the deletion set for a leaf `v`. -/
noncomputable
def R (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  insert (support G v) (G.neighborFinset (support G v))

end C5LA1
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition C5LA1.indepSetsAvoiding ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I_k(G - D)`: independent `k`-subsets of the original vertex type
avoiding the finite deletion set `D`. -/
def indepSetsAvoiding (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Finset (Finset V) :=
  ((Finset.univ \ D).powersetCard k).filter fun s : Finset V => G.IsIndepSet (s : Set V)

end C5LA1
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition C5LA1.indepSetCount e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `i_k(G - D)`. -/
def indepSetCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Nat :=
  (indepSetsAvoiding G D k).card

end C5LA1
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition C5LA1.forwardDifferenceDel 60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `Delta_k(G - D) = i_(k+1)(G-D) - i_k(G-D)`. -/
def forwardDifferenceDel (G : SimpleGraph V) [DecidableRel G.Adj]
    (D : Finset V) (k : Nat) : Int :=
  (indepSetCount G D (k + 1) : Int) - indepSetCount G D k

end C5LA1
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition C5LA1.aggregate d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

open Classical in
/-- `S(G,p) = sum_{v in F} (b_v - B_v)`, the literal top-rank residual
aggregate, summed over the favorable filter of the leaf set. -/
noncomputable
def aggregate (G : SimpleGraph V) [DecidableRel G.Adj] (p : Nat) : Int :=
  ∑ v ∈ (leafSet G).filter fun v => C4LA1.IsFavorableAt G v p,
    (forwardDifferenceDel G (H G v) (p - 1) - forwardDifferenceDel G (R G v) (p - 1))

end C5LA1
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition C5LA1.crossingIndex 378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb
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
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition R26LA1.indepPowerset d2bf1485c4f586deca46a0e4b326e8ebac5399bb84c6b3c1b5f63c4c2a50363a
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I(U)`: the independent subsets of a Finset `U` of vertices, as a filter of `U.powerset`. -/
def indepPowerset (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) : Finset (Finset V) :=
  U.powerset.filter fun A => G.IsIndepSet (A : Set V)

end R26LA1
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN definition R26CritT.famOneMap b34fef11b637e2a10a2f99441f4411c75ca36f8acdced88883fd5e80f00cae68
namespace R26CritT

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The family-(I) map of `C1-ALLOCATION.md` item 8(c). -/
def famOneMap (L : Finset V) (x : Finset V × V) : Finset V := x.1 ∪ L.erase x.2

end R26CritT
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN definition R26CritT.famOneSource 4391f1a3def2e3883b352d7a85f2f0ddc9c6d17512f5cb5ee1b535546ed008ab
namespace R26CritT

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The source of the family-(I) map: independent `a`-subsets of `D`. -/
def famOneSource (G : SimpleGraph V) [DecidableRel G.Adj] (D : Finset V) (a : ℕ) :
    Finset (Finset V) :=
  D.powerset.filter fun (J : Finset V) => G.IsIndepSet (J : Set V) ∧ J.card = a

end R26CritT
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN definition R26LA1.supportSet 32f03845365a08958c40649bca67a398a1e6d8e0b233e1c50288d3549d757c39
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `C(G)`: the support set, in the filter form `{s : 0 < λ(s)}`. -/
noncomputable
def supportSet (G : SimpleGraph V) [DecidableRel G.Adj] : Finset V :=
  Finset.univ.filter fun s => 0 < C5LA1.leafDegree G s

end R26LA1
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN definition R26LA1.interior ecbcb8f7052c0759cc9ca0c55c07c40c5a4d63d52fdcdd9428ce0c350311ee57
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `D(G)`: the interior, the vertices that are neither leaves nor supports. -/
noncomputable
def interior (G : SimpleGraph V) [DecidableRel G.Adj] : Finset V :=
  Finset.univ \ (C5LA1.leafSet G ∪ supportSet G)

end R26LA1
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN definition R26LA1.interiorIndep e047a3493dcc4f45ad98cda86694e38f9c4ef3171cd57ca4c348e6fa084dc429
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The independent subsets of the interior. -/
noncomputable
def interiorIndep (G : SimpleGraph V) [DecidableRel G.Adj] : Finset (Finset V) :=
  (interior G).powerset.filter fun J => G.IsIndepSet (J : Set V)

end R26LA1
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN definition R26LA1.aVal e79af1dd080d2ad39a33e4627da5713edeb3ef306d2abe02282ddcc77a121706
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `a(G)`: the maximum size of an independent subset of the interior. -/
noncomputable
def aVal (G : SimpleGraph V) [DecidableRel G.Adj] : ℕ :=
  (interiorIndep G).sup Finset.card

end R26LA1
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN definition R26LA1.C1 b96354d3c1005640b641bee0930c0860464af877a68c1104ecc0e15358aff578
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `C₁(G) = {s : λ(s) = 1}`. -/
noncomputable
def C1 (G : SimpleGraph V) [DecidableRel G.Adj] : Finset V :=
  Finset.univ.filter fun s => C5LA1.leafDegree G s = 1

end R26LA1
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN definition R26LA1.C2 49106305743a2230fedd7f71ede2a67c166f5231e43f472c910a30a0e7b5286e
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `C₂(G) = {s : λ(s) = 2}`. -/
noncomputable
def C2 (G : SimpleGraph V) [DecidableRel G.Adj] : Finset V :=
  Finset.univ.filter fun s => C5LA1.leafDegree G s = 2

end R26LA1
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN definition R26LA1.w 4cf14c6ee8b04d287508cea728915d44f1b1a8c4520b8183e3e07c6bce71996f
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `w(B) = |B ∩ L| − Σ_{s ∈ B} λ(s)`, the weight of `SEMANTIC-CONTRACT.md` §4. -/
noncomputable
def w (G : SimpleGraph V) [DecidableRel G.Adj] (B : Finset V) : ℤ :=
  ((B ∩ C5LA1.leafSet G).card : ℤ) - ∑ s ∈ B, (C5LA1.leafDegree G s : ℤ)

end R26LA1
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN definition R26LA1.USet 84de76f0cf45bd471e2a1c775b74603dd09c339966fdc409692423f4e145c39a
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `U(J)`: the `λ = 1` supports with no neighbour in `J`. -/
noncomputable
def USet (G : SimpleGraph V) [DecidableRel G.Adj] (J : Finset V) : Finset V :=
  (C1 G).filter fun s => ∀ d ∈ J, ¬ G.Adj s d

end R26LA1
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN definition R26LA1.maxIndepInterior 43c70a8f8081361e7a568b146dc3f24c189e249bdde07b4278856b29b94a788f
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The maximum independent subsets of the interior. -/
noncomputable
def maxIndepInterior (G : SimpleGraph V) [DecidableRel G.Adj] : Finset (Finset V) :=
  (interiorIndep G).filter fun J => J.card = aVal G

end R26LA1
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN definition R26LA1.topShell 52dc0a91e236575f4cc0a0aaa9e33310cb5abe8b6367b7975e7342da6036ac7f
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The top shell `I_{α−1}(G)` on the contract carrier. -/
noncomputable
def topShell (G : SimpleGraph V) [DecidableRel G.Adj] : Finset (Finset V) :=
  C5LA1.indepSetsAvoiding G ∅ (G.indepNum - 1)

end R26LA1
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN definition R26LA1.slack fe53d8799551cc25ce8d36bce036217e147cb1e4b6a33bea6b3fba3e3a64df9d
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The slack `h(B) = ℓ − |B ∩ L| − Σ_{s ∈ B} λ(s)`, in `ℤ`. -/
noncomputable
def slack (G : SimpleGraph V) [DecidableRel G.Adj] (B : Finset V) : ℤ :=
  ((C5LA1.leafSet G).card : ℤ) - ((B ∩ C5LA1.leafSet G).card : ℤ)
    - ∑ s ∈ B, (C5LA1.leafDegree G s : ℤ)

end R26LA1
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN definition R26LA1.famI 4162a73596fa8822fd879f3324e9eaf4bd2033a1c4307431cae207727b1452f1
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Family (I): the interior part is already maximum and no support is used. -/
noncomputable
def famI (G : SimpleGraph V) [DecidableRel G.Adj] : Finset (Finset V) :=
  (topShell G).filter fun B => (B ∩ interior G).card = aVal G ∧ B ∩ supportSet G = ∅

end R26LA1
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN definition R26LA1.famII 33ca5c6ae289c351a0670ffad2e82d7113cdbe1da854e21d265357e3b1f7d605
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Family (II): the interior part is already maximum and some support is used. -/
noncomputable
def famII (G : SimpleGraph V) [DecidableRel G.Adj] : Finset (Finset V) :=
  (topShell G).filter fun B => (B ∩ interior G).card = aVal G ∧ B ∩ supportSet G ≠ ∅

end R26LA1
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN definition R26LA1.famIII 6797cd775437e526ffb4980679ae5cf5165c7606914d6929f9ebbc5cd16d5357
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Family (III): the interior part is one short of maximum. -/
noncomputable
def famIII (G : SimpleGraph V) [DecidableRel G.Adj] : Finset (Finset V) :=
  (topShell G).filter fun B => ¬ ((B ∩ interior G).card = aVal G)

end R26LA1
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN definition R26LA1.N2 8df5ded5b15d06c04782e9544875eee95b3391d4301212d8c17d8ee55c188614
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `N₂`, the family-(II) count. -/
noncomputable
def N2 (G : SimpleGraph V) [DecidableRel G.Adj] : ℕ := (famII G).card

end R26LA1
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN definition R26LA1.famIIMap 8f44f35cbd571e33cb48b0822e200f15055434c19750ef31e9c743676c477c55
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The family-(II) index map `(s, J) ↦ {s} ∪ J ∪ (L ∖ leaves(s))`. -/
noncomputable
def famIIMap (G : SimpleGraph V) [DecidableRel G.Adj] (x : V × Finset V) :
    Finset V :=
  insert x.1 (x.2 ∪ (C5LA1.leafSet G \ ((C5LA1.leafSet G).filter fun v =>
    C5LA1.support G v = x.1)))

end R26LA1
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN definition R26LA1.shellD 54f2318cc0c958d73b381584fecb31b680ae5aea7233688a4c4b8f21fbd9cf71
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The `a − 1` shell, stated as `|J| + 1 = a` so that `a = 0` makes it empty without any
`ℕ`-truncation. -/
noncomputable
def shellD (G : SimpleGraph V) [DecidableRel G.Adj] : Finset (Finset V) :=
  (interiorIndep G).filter fun J => J.card + 1 = aVal G

end R26LA1
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN definition R26LA1.famIIIIndex 85b0c157528b8356e7f3a354a777a376776f39914fc123e9469b1457cb43661e
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The family-(III) index: pairs `(J, A)` with `J` in the `a − 1` shell and `A` an independent
subset of `U(J)`. -/
noncomputable
def famIIIIndex (G : SimpleGraph V) [DecidableRel G.Adj] :
    Finset ((_ : Finset V) × Finset V) :=
  (shellD G).sigma fun J => R26LA1.indepPowerset G (USet G J)

end R26LA1
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN definition R26LA1.famIIIMap e3c52533a80b19ff3ce5654965c07335554f469e7e8f8a564eda718970372bf6
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The family-(III) map `(J, A) ↦ A ∪ J ∪ (L ∖ leaves(A))`. -/
noncomputable
def famIIIMap (G : SimpleGraph V) [DecidableRel G.Adj]
    (x : (_ : Finset V) × Finset V) : Finset V :=
  x.2 ∪ x.1 ∪ (C5LA1.leafSet G \ ((C5LA1.leafSet G).filter fun v =>
    C5LA1.support G v ∈ x.2))

end R26LA1
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma C4LA1.isIndepSet_insert_of_unique_neighbor 792665784226f42ee4138c1863f5db0312fee1122546999a8b85206666405f78
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma isIndepSet_insert_of_unique_neighbor {G : SimpleGraph V} {v u : V}
    {s : Finset V} (huniq : forall w, G.Adj v w -> w = u)
    (hs : G.IsIndepSet (s : Set V)) (hv : v ∉ s) (hu : u ∉ s) :
    G.IsIndepSet ((insert v s : Finset V) : Set V) := by
  rw [SimpleGraph.isIndepSet_iff]
  simp only [Finset.coe_insert]
  rw [Set.pairwise_insert_of_notMem (by simpa using hv)]
  refine ⟨hs, ?_⟩
  intro w hw
  constructor
  · intro hvw
    exact hu (huniq w hvw ▸ hw)
  · intro hwv
    exact hu (huniq w hwv.symm ▸ hw)

end C4LA1
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma C4LA1.support_mem_of_max_indep_avoids_leaf 49d38e011acf4223e557be333e8cc99f9bf41d31f1d425d4ec4c6743f0cf3935
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma support_mem_of_max_indep_avoids_leaf {G : SimpleGraph V} {v u : V}
    {s : Finset V} (huniq : forall w, G.Adj v w -> w = u)
    (hs : G.IsIndepSet (s : Set V)) (hcard : s.card = G.indepNum) (hv : v ∉ s) :
    u ∈ s := by
  by_contra hu
  have hins := isIndepSet_insert_of_unique_neighbor huniq hs hv hu
  have hle := hins.card_le_indepNum
  rw [Finset.card_insert_of_notMem hv, hcard] at hle
  omega

end C4LA1
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma C4LA1.exists_maximum_indepSet_containing_leaf 7aa899bcbaba4534e07c8da5ba513a51a932c99ab5c1866319fc7e6bbdddc637
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma exists_maximum_indepSet_containing_leaf {G : SimpleGraph V} {v : V}
    (hAlpha : 2 ≤ G.indepNum) (hvLeaf : IsGraphLeaf G v) :
    ∃ s : Finset V, G.IsIndepSet (s : Set V) ∧ s.card = G.indepNum ∧ v ∈ s := by
  classical
  obtain ⟨u, _hvu, huniq⟩ := hvLeaf
  obtain ⟨s, hs⟩ := G.exists_isNIndepSet_indepNum
  by_cases hv : v ∈ s
  · exact ⟨s, hs.isIndepSet, hs.card_eq, hv⟩
  · have hu : u ∈ s :=
      support_mem_of_max_indep_avoids_leaf huniq hs.isIndepSet hs.card_eq hv
    let t := insert v (s.erase u)
    have herase : G.IsIndepSet ((s.erase u : Finset V) : Set V) :=
      Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hs.isIndepSet
    have ht : G.IsIndepSet (t : Set V) :=
      isIndepSet_insert_of_unique_neighbor huniq herase (by simp [t, hv]) (by simp [t])
    refine ⟨t, ht, ?_, by simp [t]⟩
    simp [t, hv, hu, hs.card_eq]
    omega

end C4LA1
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma C4LA1.topRankSelectorCollapse e9ffbcfbaf88ffd14aad1288a5add8057a2d92bd0845e816ca17f08b37a32a9e
namespace C4LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma topRankSelectorCollapse (G : SimpleGraph V) [DecidableRel G.Adj]
    (_hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (v : V)
    (hvLeaf : IsGraphLeaf G v) :
    IsFavorableAt G v (G.indepNum - 1) := by
  classical
  obtain ⟨u, hvu, huniq⟩ := hvLeaf
  let a := G.indepNum
  let A := ((Finset.univ.erase v).powersetCard a).filter fun s : Finset V =>
    G.IsIndepSet (s : Set V)
  let B := ((Finset.univ.erase v).powersetCard (a - 1)).filter fun s : Finset V =>
    G.IsIndepSet (s : Set V)
  let E := A.image fun s : Finset V => s.erase u

  have member_A_support {s : Finset V} (hsA : s ∈ A) : u ∈ s := by
    have hsA' := hsA
    simp only [A, Finset.mem_filter, Finset.mem_powersetCard] at hsA'
    have hv : v ∉ s := by
      intro hvs
      have := hsA'.1.1 hvs
      simpa using this
    exact support_mem_of_max_indep_avoids_leaf huniq hsA'.2 hsA'.1.2 hv

  have hEsub : E ⊆ B := by
    intro t ht
    rcases Finset.mem_image.mp ht with ⟨s, hsA, rfl⟩
    have hsA' := hsA
    simp only [A, Finset.mem_filter, Finset.mem_powersetCard] at hsA'
    have hu : u ∈ s := member_A_support hsA
    simp only [B, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      have hxs : x ∈ s := Finset.mem_of_mem_erase hx
      exact Finset.mem_of_subset hsA'.1.1 hxs
    · rw [Finset.card_erase_of_mem hu, hsA'.1.2]
    · exact Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hsA'.2

  have hEinj : Set.InjOn (fun s : Finset V => s.erase u) (A : Set (Finset V)) := by
    intro s hs t ht hst
    have hus : u ∈ s := member_A_support hs
    have hut : u ∈ t := member_A_support ht
    calc
      s = insert u (s.erase u) := (Finset.insert_erase hus).symm
      _ = insert u (t.erase u) := congrArg (insert u) hst
      _ = t := Finset.insert_erase hut

  obtain ⟨M, hMind, hMcard, hvM⟩ :=
    exists_maximum_indepSet_containing_leaf hAlpha ⟨u, hvu, huniq⟩
  have huM : u ∉ M := by
    intro huM
    exact (hMind huM hvM hvu.ne.symm) hvu.symm
  let H := M.erase v
  have hHcard : H.card = a - 1 := by
    simp [H, Finset.card_erase_of_mem hvM, hMcard, a]
  have hHmemB : H ∈ B := by
    simp only [B, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, hHcard⟩, ?_⟩
    · intro x hx
      exact Finset.mem_erase.mpr ⟨(Finset.mem_erase.mp hx).1, Finset.mem_univ x⟩
    · exact Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hMind

  have hEproper : E ⊂ B := by
    refine Finset.ssubset_iff_subset_ne.mpr ⟨hEsub, ?_⟩
    intro hEB
    have hHmemE : H ∈ E := hEB.symm ▸ hHmemB
    rcases Finset.mem_image.mp hHmemE with ⟨S, hSA, hSerase⟩
    have huS : u ∈ S := member_A_support hSA
    have hSind : G.IsIndepSet (S : Set V) := by
      have hSA' := hSA
      simp only [A, Finset.mem_filter, Finset.mem_powersetCard] at hSA'
      exact hSA'.2
    have hS_eq : S = insert u H := by
      calc
        S = insert u (S.erase u) := (Finset.insert_erase huS).symm
        _ = insert u H := congrArg (insert u) hSerase
    have hHpos : 0 < H.card := by
      rw [hHcard]
      omega
    obtain ⟨w, hwH⟩ := Finset.card_pos.mp hHpos
    let K := insert u (H.erase w)
    have huH : u ∉ H := by
      intro huH
      exact huM (Finset.mem_of_mem_erase huH)
    have hKind : G.IsIndepSet (K : Set V) := by
      have hKsub : K ⊆ S := by
        intro x hx
        rw [hS_eq]
        have hx' : x = u ∨ x ∈ H.erase w := by simpa [K] using hx
        rcases hx' with hxu | hx
        · exact Finset.mem_insert.mpr (Or.inl hxu)
        · exact Finset.mem_insert_of_mem (Finset.mem_of_mem_erase hx)
      exact Set.Pairwise.mono (by intro x hx; exact hKsub hx) hSind
    have hKmemB : K ∈ B := by
      simp only [B, Finset.mem_filter, Finset.mem_powersetCard]
      refine ⟨⟨?_, ?_⟩, hKind⟩
      · intro x hx
        have hx' : x = u ∨ x ∈ H.erase w := by simpa [K] using hx
        rcases hx' with hxu | hx
        · exact Finset.mem_erase.mpr ⟨by simpa [hxu] using hvu.ne.symm, Finset.mem_univ x⟩
        · have hxH : x ∈ H := Finset.mem_of_mem_erase hx
          exact Finset.mem_erase.mpr ⟨(Finset.mem_erase.mp hxH).1, Finset.mem_univ x⟩
      · have huErase : u ∉ H.erase w := by simp [huH]
        rw [show K = insert u (H.erase w) by rfl,
          Finset.card_insert_of_notMem huErase, Finset.card_erase_of_mem hwH, hHcard]
        omega
    have hKnotE : K ∉ E := by
      intro hKE
      rcases Finset.mem_image.mp hKE with ⟨S', _, hS'K⟩
      have huK : u ∈ K := by simp [K]
      rw [← hS'K] at huK
      exact Finset.notMem_erase u S' huK
    exact hKnotE (hEB ▸ hKmemB)

  have hcard : A.card < B.card := by
    have himage : E.card = A.card := by
      exact Finset.card_image_of_injOn hEinj
    rw [← himage]
    exact Finset.card_lt_card hEproper

  have hcardInt : (A.card : Int) - B.card < 0 :=
    sub_neg.mpr (by exact_mod_cast hcard)
  simpa [IsFavorableAt, vertexDeletionForwardDifference, vertexDeletionIndepSetCount,
    A, B, a, Nat.sub_add_cancel (by omega : 1 ≤ G.indepNum)] using hcardInt

end C4LA1
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma C5LA1.support_spec 70b0781d1f99e74a3b34849eadd081b15d9968f177ef1e147c25765e186069fb
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
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma C5LA1.adj_iff_support_eq f12f82bc757ccd70f1eea5e3aa5759bd654fb7d4088a5360e04cc098a202a81e
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
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma C5LA1.support_ne_self 8cf3e2ee51f18d50c6b6c4a2dd74dd68783a94c1013337b7d1ae88aceeee0462
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma support_ne_self {G : SimpleGraph V} {v : V} (hv : C4LA1.IsGraphLeaf G v) :
    support G v ≠ v := by
  intro h
  have hadj : G.Adj v (support G v) := (support_spec hv).1
  rw [h] at hadj
  exact (G.ne_of_adj hadj) rfl

end C5LA1
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma C5LA1.leafDegree_eq_filter_support 53119a540f36ad19dd43c9dd7b7a5761e9eef2fdd92425606b8a92e8ff5e1597
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
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma C5LA1.sum_card_filter_comm 8a2d0fcef47481141c9b03c55648c36181f4dde28ed2dd5ed1d8d96bc4b0f59e
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma sum_card_filter_comm {α β : Type*} [DecidableEq α] [DecidableEq β]
    (s : Finset α) (t : Finset β) (r : α → β → Prop) [∀ a b, Decidable (r a b)] :
    ∑ a ∈ s, (t.filter fun b => r a b).card = ∑ b ∈ t, (s.filter fun a => r a b).card := by
  simp_rw [Finset.card_filter]
  rw [Finset.sum_comm]

end C5LA1
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma C5LA1.H_bijection_card 5baf8f1fd00f875f31b82aeda3961b2524d1a8a971f311c126f6d0b1c3db7edd
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma H_bijection_card {G : SimpleGraph V} [DecidableRel G.Adj] {v : V}
    (hv : C4LA1.IsGraphLeaf G v) (k : Nat) :
    indepSetCount G (H G v) k
      = ((indepSetsAvoiding G ∅ (k + 1)).filter fun B => v ∈ B).card := by
  have hvs : G.Adj v (support G v) := (support_spec hv).1
  have hsuniq : ∀ w, G.Adj v w → w = support G v := (support_spec hv).2
  have hvne : v ≠ support G v := fun h => (G.ne_of_adj hvs) h
  unfold indepSetCount
  apply Finset.card_nbij' (fun C => insert v C) (fun B => B.erase v)
  · intro C hC
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hC
    obtain ⟨⟨hCsub, hCcard⟩, hCind⟩ := hC
    have hvC : v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [H])
    have hsC : support G v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [H])
    have hind : G.IsIndepSet ((insert v C : Finset V) : Set V) :=
      C4LA1.isIndepSet_insert_of_unique_neighbor hsuniq hCind hvC hsC
    simp only [Finset.mem_coe, Finset.mem_filter]
    refine ⟨?_, Finset.mem_insert_self v C⟩
    simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨fun x _ => Finset.mem_sdiff.mpr ⟨Finset.mem_univ x, by simp⟩, ?_⟩, hind⟩
    rw [Finset.card_insert_of_notMem hvC, hCcard]
  · intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter] at hB
    obtain ⟨hB1, hBv⟩ := hB
    simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at hB1
    obtain ⟨⟨_hBsub, hBcard⟩, hBind⟩ := hB1
    have hsB : support G v ∉ B := by
      intro hmem
      exact (hBind hBv hmem hvne) hvs
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      have hxB : x ∈ B := Finset.mem_of_mem_erase hx
      have hxne : x ≠ v := Finset.ne_of_mem_erase hx
      have hxne2 : x ≠ support G v := by
        intro hxeq
        rw [hxeq] at hxB
        exact hsB hxB
      simp only [H, Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_insert,
        Finset.mem_singleton]
      push_neg
      exact ⟨hxne, hxne2⟩
    · rw [Finset.card_erase_of_mem hBv, hBcard]; omega
    · exact Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hBind
  · intro C hC
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hC
    obtain ⟨⟨hCsub, _⟩, _⟩ := hC
    have hvC : v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [H])
    exact Finset.erase_insert hvC
  · intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter] at hB
    exact Finset.insert_erase hB.2

end C5LA1
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma C5LA1.isIndepSet_insert_of_no_adj 09b4af885f4c75886f46324a56c0df2dbfa1340d01983751a8c46d47267a9201
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma isIndepSet_insert_of_no_adj {G : SimpleGraph V} {s0 : V} {C : Finset V}
    (hC : G.IsIndepSet (C : Set V)) (hs0 : s0 ∉ C) (hn : ∀ x ∈ C, ¬ G.Adj s0 x) :
    G.IsIndepSet ((insert s0 C : Finset V) : Set V) := by
  rw [SimpleGraph.isIndepSet_iff]
  simp only [Finset.coe_insert]
  rw [Set.pairwise_insert_of_notMem (by simpa using hs0)]
  refine ⟨hC, ?_⟩
  intro w hw
  exact ⟨fun h => hn w hw h, fun h => hn w hw h.symm⟩

end C5LA1
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma C5LA1.R_bijection_card ee259823168fb3e94a7d059897d50aafe504fbb8322354f90bb8cf3c4ba882d0
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma R_bijection_card {G : SimpleGraph V} [DecidableRel G.Adj] {v : V}
    (hv : C4LA1.IsGraphLeaf G v) (k : Nat) :
    indepSetCount G (R G v) k
      = ((indepSetsAvoiding G ∅ (k + 1)).filter fun B => support G v ∈ B).card := by
  unfold indepSetCount
  apply Finset.card_nbij' (fun C => insert (support G v) C) (fun B => B.erase (support G v))
  · intro C hC
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hC
    obtain ⟨⟨hCsub, hCcard⟩, hCind⟩ := hC
    have hs0C : support G v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [R])
    have hn : ∀ x ∈ C, ¬ G.Adj (support G v) x := by
      intro x hx hadj
      have hxR : x ∈ Finset.univ \ R G v := hCsub hx
      have hxnR : x ∉ R G v := (Finset.mem_sdiff.mp hxR).2
      apply hxnR
      simp only [R, Finset.mem_insert]
      right
      rw [SimpleGraph.mem_neighborFinset]
      exact hadj
    have hind : G.IsIndepSet ((insert (support G v) C : Finset V) : Set V) :=
      isIndepSet_insert_of_no_adj hCind hs0C hn
    simp only [Finset.mem_coe, Finset.mem_filter]
    refine ⟨?_, Finset.mem_insert_self (support G v) C⟩
    simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨fun x _ => Finset.mem_sdiff.mpr ⟨Finset.mem_univ x, by simp⟩, ?_⟩, hind⟩
    rw [Finset.card_insert_of_notMem hs0C, hCcard]
  · intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter] at hB
    obtain ⟨hB1, hBs0⟩ := hB
    simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at hB1
    obtain ⟨⟨_hBsub, hBcard⟩, hBind⟩ := hB1
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard]
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro x hx
      have hxB : x ∈ B := Finset.mem_of_mem_erase hx
      have hxne : x ≠ support G v := Finset.ne_of_mem_erase hx
      have hxnotadj : ¬ G.Adj (support G v) x := hBind hBs0 hxB (Ne.symm hxne)
      simp only [R, Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_insert]
      push_neg
      refine ⟨hxne, ?_⟩
      rw [SimpleGraph.mem_neighborFinset]
      exact hxnotadj
    · rw [Finset.card_erase_of_mem hBs0, hBcard]; omega
    · exact Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_erase hx) hBind
  · intro C hC
    simp only [Finset.mem_coe, indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hC
    obtain ⟨⟨hCsub, _⟩, _⟩ := hC
    have hs0C : support G v ∉ C := by
      intro hmem
      exact absurd (hCsub hmem) (by simp [R])
    exact Finset.erase_insert hs0C
  · intro B hB
    simp only [Finset.mem_coe, Finset.mem_filter] at hB
    exact Finset.insert_erase hB.2

end C5LA1
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma C5LA1.H_count_eq_M 342ed6c99bfa5dd17e8bba58034490e9a8cedce7417010c2d3d7a57375c732f4
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma H_count_eq_M {G : SimpleGraph V} [DecidableRel G.Adj] {v : V}
    (hv : C4LA1.IsGraphLeaf G v) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ w, C4LA1.IsGraphLeaf G w →
      ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → w ∈ S) :
    indepSetCount G (H G v) (G.indepNum - 1) = indepSetCount G ∅ G.indepNum := by
  have hp1 : G.indepNum - 1 + 1 = G.indepNum := by omega
  rw [H_bijection_card hv (G.indepNum - 1), hp1]
  unfold indepSetCount
  congr 1
  apply Finset.filter_true_of_mem
  intro B hB
  simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at hB
  exact hResidual v hv B hB.2 hB.1.2

end C5LA1
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma C5LA1.R_count_eq_zero 6ace840bee5205e0d71b135f9ff55902dd8e013afead9bd2ec951b0ce39259fc
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma R_count_eq_zero {G : SimpleGraph V} [DecidableRel G.Adj] {v : V}
    (hv : C4LA1.IsGraphLeaf G v) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ w, C4LA1.IsGraphLeaf G w →
      ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → w ∈ S) :
    indepSetCount G (R G v) (G.indepNum - 1) = 0 := by
  have hp1 : G.indepNum - 1 + 1 = G.indepNum := by omega
  rw [R_bijection_card hv (G.indepNum - 1), hp1]
  rw [Finset.card_eq_zero]
  apply Finset.filter_false_of_mem
  intro B hB hcontra
  simp only [indepSetsAvoiding, Finset.mem_filter, Finset.mem_powersetCard] at hB
  have hvB : v ∈ B := hResidual v hv B hB.2 hB.1.2
  have hadj : G.Adj v (support G v) := (support_spec hv).1
  have hvne : v ≠ support G v := G.ne_of_adj hadj
  exact (hB.2 hvB hcontra hvne) hadj

end C5LA1
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma C5LA1.H_doubleCount cbfc5ccdaa5265a9d4b0f1f7e6cd360ce823b381a452364a2a5753500a449f92
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma H_doubleCount {G : SimpleGraph V} [DecidableRel G.Adj] (k : Nat) :
    ∑ v ∈ leafSet G, indepSetCount G (H G v) k
      = ∑ B ∈ indepSetsAvoiding G ∅ (k + 1), (B ∩ leafSet G).card := by
  have hstep : ∀ v ∈ leafSet G, indepSetCount G (H G v) k
      = ((indepSetsAvoiding G ∅ (k + 1)).filter fun B => v ∈ B).card := by
    intro v hv
    simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
    exact H_bijection_card hv k
  rw [Finset.sum_congr rfl hstep,
    sum_card_filter_comm (leafSet G) (indepSetsAvoiding G ∅ (k + 1)) (fun v B => v ∈ B)]
  apply Finset.sum_congr rfl
  intro B _
  rw [Finset.filter_mem_eq_inter, Finset.inter_comm]

end C5LA1
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma C5LA1.R_doubleCount 4039d9e3e0bcab3b73a38fb8f1ed36793741e14634713965a537d0ee37dfce0f
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma R_doubleCount {G : SimpleGraph V} [DecidableRel G.Adj] (k : Nat) :
    ∑ v ∈ leafSet G, indepSetCount G (R G v) k
      = ∑ B ∈ indepSetsAvoiding G ∅ (k + 1), ∑ s ∈ B, leafDegree G s := by
  have hstep : ∀ v ∈ leafSet G, indepSetCount G (R G v) k
      = ((indepSetsAvoiding G ∅ (k + 1)).filter fun B => support G v ∈ B).card := by
    intro v hv
    simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
    exact R_bijection_card hv k
  rw [Finset.sum_congr rfl hstep,
    sum_card_filter_comm (leafSet G) (indepSetsAvoiding G ∅ (k + 1))
      (fun v B => support G v ∈ B)]
  apply Finset.sum_congr rfl
  intro B _
  have hmaps : Set.MapsTo (fun v => support G v)
      ↑((leafSet G).filter fun v => support G v ∈ B) ↑B := by
    intro v hv
    simp only [Finset.mem_coe, Finset.mem_filter] at hv
    simpa using hv.2
  rw [Finset.card_eq_sum_card_fiberwise hmaps]
  apply Finset.sum_congr rfl
  intro s hs
  rw [leafDegree_eq_filter_support, Finset.filter_filter]
  congr 1
  apply Finset.filter_congr
  intro v _
  constructor
  · rintro ⟨_, h2⟩
    exact h2
  · intro h2
    exact ⟨h2 ▸ hs, h2⟩

end C5LA1
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma C5LA1.topRankResidualIdentity 834e7be0f991607fd57f45ba5f2f3eb8e19b0d08536f81b869f3090faaeff91c
namespace C5LA1

open SimpleGraph C4LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma topRankResidualIdentity (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v →
      ∀ S : Finset V, G.IsIndepSet (S : Set V) → S.card = G.indepNum → v ∈ S) :
    aggregate G (G.indepNum - 1)
      = ((leafSet G).card * indepSetCount G ∅ G.indepNum : Int)
        - ∑ B ∈ indepSetsAvoiding G ∅ (G.indepNum - 1),
            (((B ∩ leafSet G).card : Int) - ∑ s ∈ B, (leafDegree G s : Int)) := by
  classical
  set p := G.indepNum - 1 with hp_def
  have hsplit :
      (∑ B ∈ indepSetsAvoiding G ∅ p,
          (((B ∩ leafSet G).card : Int) - ∑ s ∈ B, (leafDegree G s : Int)))
        = (∑ B ∈ indepSetsAvoiding G ∅ p, ((B ∩ leafSet G).card : Int))
          - ∑ B ∈ indepSetsAvoiding G ∅ p, ∑ s ∈ B, (leafDegree G s : Int) :=
    Finset.sum_sub_distrib _ _
  rw [hsplit]
  have hp1 : p - 1 + 1 = p := by omega
  have hFilterAll : (leafSet G).filter (fun v => C4LA1.IsFavorableAt G v p) = leafSet G := by
    apply Finset.filter_true_of_mem
    intro v hv
    simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
    exact C4LA1.topRankSelectorCollapse G hTree hAlpha v hv
  have hsummand : ∀ v ∈ leafSet G,
      forwardDifferenceDel G (H G v) (p - 1) - forwardDifferenceDel G (R G v) (p - 1)
        = (indepSetCount G ∅ G.indepNum : Int)
          - (indepSetCount G (H G v) (p - 1) : Int)
          + (indepSetCount G (R G v) (p - 1) : Int) := by
    intro v hv
    simp only [leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hv
    have hM : indepSetCount G (H G v) p = indepSetCount G ∅ G.indepNum :=
      H_count_eq_M hv hAlpha hResidual
    have hR0 : indepSetCount G (R G v) p = 0 := R_count_eq_zero hv hAlpha hResidual
    unfold forwardDifferenceDel
    rw [hp1, hM, hR0]
    push_cast
    ring
  have hHnat := H_doubleCount (G := G) (p - 1)
  have hRnat := R_doubleCount (G := G) (p - 1)
  rw [hp1] at hHnat hRnat
  have hHcast : (∑ v ∈ leafSet G, (indepSetCount G (H G v) (p - 1) : Int))
      = ∑ B ∈ indepSetsAvoiding G ∅ p, ((B ∩ leafSet G).card : Int) := by
    exact_mod_cast hHnat
  have hRcast : (∑ v ∈ leafSet G, (indepSetCount G (R G v) (p - 1) : Int))
      = ∑ B ∈ indepSetsAvoiding G ∅ p, ∑ s ∈ B, (leafDegree G s : Int) := by
    exact_mod_cast hRnat
  show aggregate G p = _
  unfold aggregate
  rw [hFilterAll, Finset.sum_congr rfl hsummand]
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const, nsmul_eq_mul]
  rw [hHcast, hRcast]
  ring

end C5LA1
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma R26LA1.deletionInjectionBound 01ad773c6d6d039e27aeaae5f15d33d39d38cbb92e9ad7a8f18cf8d4d3fad2a8
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (a) The deletion injection: `2 * Σ_{A ∈ I(U)} |A| ≤ |U| * |I(U)|`, via the injection
`A ↦ A.erase u` from the independent subsets of `U` containing a fixed `u` into those omitting
it (well-defined and injective for every fixed `u`, no graph hypothesis beyond independence
being downward closed is used). -/
lemma deletionInjectionBound (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) :
    2 * ∑ A ∈ indepPowerset G U, A.card ≤ U.card * (indepPowerset G U).card := by
  classical
  set I := indepPowerset G U with hI_def
  have hstep : ∀ u ∈ U, 2 * (I.filter fun A => u ∈ A).card ≤ I.card := by
    intro u _hu
    have hsplit : (I.filter fun A => u ∈ A).card + (I.filter fun A => ¬ u ∈ A).card = I.card :=
      Finset.card_filter_add_card_filter_not (fun A => u ∈ A)
    have hinj : (I.filter fun A => u ∈ A).card ≤ (I.filter fun A => ¬ u ∈ A).card := by
      apply Finset.card_le_card_of_injOn (fun A => A.erase u)
      · intro A hA
        simp only [Finset.mem_coe, Finset.mem_filter] at hA
        obtain ⟨hAI, huA⟩ := hA
        have hAI' : A ⊆ U ∧ G.IsIndepSet (A : Set V) := by
          simpa only [hI_def, indepPowerset, Finset.mem_filter, Finset.mem_powerset] using hAI
        simp only [Finset.mem_coe, Finset.mem_filter]
        refine ⟨?_, Finset.notMem_erase u A⟩
        simp only [hI_def, indepPowerset, Finset.mem_filter, Finset.mem_powerset]
        exact ⟨fun x hx => hAI'.1 (Finset.mem_of_mem_erase hx),
          Set.Pairwise.mono (fun x hx => Finset.mem_of_mem_erase hx) hAI'.2⟩
      · intro A hA B hB hAB
        simp only [Finset.mem_coe, Finset.mem_filter] at hA hB
        have hAB' : A.erase u = B.erase u := hAB
        have huA : u ∈ A := hA.2
        have huB : u ∈ B := hB.2
        calc A = insert u (A.erase u) := (Finset.insert_erase huA).symm
          _ = insert u (B.erase u) := by rw [hAB']
          _ = B := Finset.insert_erase huB
    omega
  have hdbl : ∑ u ∈ U, (I.filter fun A => u ∈ A).card = ∑ A ∈ I, A.card := by
    rw [C5LA1.sum_card_filter_comm U I (fun u A => u ∈ A)]
    apply Finset.sum_congr rfl
    intro A hA
    have hAsub : A ⊆ U := by
      simp only [hI_def, indepPowerset, Finset.mem_filter, Finset.mem_powerset] at hA
      exact hA.1
    congr 1
    apply Finset.ext
    intro x
    simp only [Finset.mem_filter]
    constructor
    · rintro ⟨_, hxA⟩; exact hxA
    · intro hxA; exact ⟨hAsub hxA, hxA⟩
  calc 2 * ∑ A ∈ I, A.card
      = 2 * ∑ u ∈ U, (I.filter fun A => u ∈ A).card := by rw [hdbl]
    _ = ∑ u ∈ U, 2 * (I.filter fun A => u ∈ A).card := by rw [Finset.mul_sum]
    _ ≤ ∑ _u ∈ U, I.card := Finset.sum_le_sum hstep
    _ = U.card * I.card := by rw [Finset.sum_const, smul_eq_mul, mul_comm]

end R26LA1
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma R26LA1.isIndepSet_union_of_no_cross_adj ed67598cbf66ddd589c808414125267bc83ed88e30bf452536ffc61de1570d55
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- General helper: two independent sets with no adjacency crossing between them union to an
independent set. -/
lemma isIndepSet_union_of_no_cross_adj {G : SimpleGraph V} {A B : Finset V}
    (hA : G.IsIndepSet (A : Set V)) (hB : G.IsIndepSet (B : Set V))
    (hcross : ∀ x ∈ A, ∀ y ∈ B, ¬ G.Adj x y) :
    G.IsIndepSet ((A ∪ B : Finset V) : Set V) := by
  rw [SimpleGraph.isIndepSet_iff, Finset.coe_union, Set.pairwise_union]
  refine ⟨hA, hB, ?_⟩
  intro x hx y hy _hxy
  simp only [Finset.mem_coe] at hx hy
  exact ⟨hcross x hx y hy, fun hadj => hcross x hx y hy hadj.symm⟩

end R26LA1
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma R26LA1.budgetWeightBound 8c6f63f823996cb640802152ee451955bf0b1a2e2187e796fbf77af3d46e4059
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (d, first half) The budget weight bound: for any independent `B`, the leaves `B` itself
contains plus the leaves forced out by the supports `B` contains cannot exceed the total leaf
count — `|B ∩ L| + Σ_{s ∈ B} λ(s) ≤ ℓ`. Unconditional: no tree, `hyp-alpha`, `hyp-eligible` or
`(★)` hypothesis is used, only that `B` is independent. -/
lemma budgetWeightBound (G : SimpleGraph V) [DecidableRel G.Adj] (B : Finset V)
    (hBind : G.IsIndepSet (B : Set V)) :
    (B ∩ C5LA1.leafSet G).card + ∑ s ∈ B, C5LA1.leafDegree G s ≤ (C5LA1.leafSet G).card := by
  classical
  set Lf := C5LA1.leafSet G with hLf_def
  set W := Lf.filter (fun v => C5LA1.support G v ∈ B) with hW_def
  have hsum_eq : W.card = ∑ s ∈ B, C5LA1.leafDegree G s := by
    have hmaps : Set.MapsTo (fun v => C5LA1.support G v) (↑W : Set V) (↑B : Set V) := by
      intro v hv
      simp only [hW_def, Finset.mem_coe, Finset.mem_filter] at hv
      simpa using hv.2
    rw [Finset.card_eq_sum_card_fiberwise hmaps]
    apply Finset.sum_congr rfl
    intro s hs
    rw [C5LA1.leafDegree_eq_filter_support, hW_def, Finset.filter_filter]
    congr 1
    apply Finset.filter_congr
    intro v _
    constructor
    · rintro ⟨_, h2⟩; exact h2
    · intro h2; exact ⟨h2 ▸ hs, h2⟩
  have hdisj : Disjoint (B ∩ Lf) W := by
    rw [Finset.disjoint_left]
    intro v hvBL hvW
    simp only [Finset.mem_inter] at hvBL
    obtain ⟨hvB, hvLf⟩ := hvBL
    simp only [hW_def, Finset.mem_filter] at hvW
    obtain ⟨_, hsB⟩ := hvW
    have hvLeaf : C4LA1.IsGraphLeaf G v := by
      simp only [hLf_def, C5LA1.leafSet, Finset.mem_filter, Finset.mem_univ, true_and] at hvLf
      exact hvLf
    have hadj : G.Adj v (C5LA1.support G v) := (C5LA1.support_spec hvLeaf).1
    have hne : v ≠ C5LA1.support G v := (C5LA1.support_ne_self hvLeaf).symm
    exact hBind hvB hsB hne hadj
  have hsub : (B ∩ Lf) ∪ W ⊆ Lf :=
    Finset.union_subset Finset.inter_subset_right (Finset.filter_subset _ _)
  calc (B ∩ Lf).card + ∑ s ∈ B, C5LA1.leafDegree G s
      = (B ∩ Lf).card + W.card := by rw [hsum_eq]
    _ = ((B ∩ Lf) ∪ W).card := (Finset.card_union_of_disjoint hdisj).symm
    _ ≤ Lf.card := Finset.card_le_card hsub

end R26LA1
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma R26LA1.leafDegree_sum_eq_inter_support 8455424e75e38b19dcc2695da63fdef4aecd6ed3e2821d02d51c80ae35be2665
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Helper: `λ` vanishes off the support set `{s : 0 < λ(s)}`, so summing over `B` or over
`B ∩ {s : 0 < λ(s)}` gives the same total. Purely a counting fact about `leafDegree`, no tree or
residual hypothesis. -/
lemma leafDegree_sum_eq_inter_support (G : SimpleGraph V) [DecidableRel G.Adj] (B : Finset V) :
    ∑ s ∈ B ∩ (Finset.univ.filter fun s => 0 < C5LA1.leafDegree G s), C5LA1.leafDegree G s
      = ∑ s ∈ B, C5LA1.leafDegree G s := by
  classical
  apply Finset.sum_subset Finset.inter_subset_left
  intro x hxB hxnotin
  have hxnotCs : ¬ (0 < C5LA1.leafDegree G x) := by
    intro hpos
    apply hxnotin
    simp only [Finset.mem_inter, Finset.mem_filter, Finset.mem_univ, true_and]
    exact ⟨hxB, hpos⟩
  omega

end R26LA1
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma R26U3.closed_reachable a0106c0719d0340e934b6f5f3d3d9f492a1b119b15267921e3c4e221d5670d2a
namespace R26U3

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

end R26U3
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma R26U3.card_leafSet_ge_two_of_nontrivial 2d9493125ebce49ce08e2c8f11c1e516565ec3e04e312e0699e2bc8b37bed841
namespace R26U3

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

end R26U3
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma R26U3.tree_two_le_indepNum_two_le_leafSet 835ef1f23ebd121580fffd9b40fe933596c04936b6f39525ffc756b47fca02ec
namespace R26U3

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

end R26U3
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma R26U3.tree_two_le_indepNum_no_adjacent_leaves aae3582c8741188e3105fdf3cb70d7e44245775705fe5e3ba06a64f1c65aef57
namespace R26U3

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

end R26U3
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma R26U3.sum_leafDegree_eq_card_leafSet e9b662d235a5e1c870f7b4a7c9dde3c2330669b9ee22efbcc982148e853457ed
namespace R26U3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (d), part 1: `∑ s, leafDegree G s = (leafSet G).card`. -/
lemma sum_leafDegree_eq_card_leafSet (G : SimpleGraph V) [DecidableRel G.Adj] :
    ∑ s : V, C5LA1.leafDegree G s = (C5LA1.leafSet G).card := by
  classical
  simp_rw [C5LA1.leafDegree_eq_filter_support]
  symm
  exact Finset.card_eq_sum_card_fiberwise (fun v _ => Finset.mem_univ (C5LA1.support G v))

end R26U3
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma R26U3.eligible_three_le_indepNum dee3ba1e295f9c3624c5e84ddf4719629a9794da45ba7a761203a7d10ecab5d7
namespace R26U3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (f) `crossingIndex G + 2 ≤ indepNum - 1 → 3 ≤ indepNum`: pure `ℕ` arithmetic
on the truncated subtraction, independent of the tree structure. -/
lemma eligible_three_le_indepNum (G : SimpleGraph V) [DecidableRel G.Adj]
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1) :
    3 ≤ G.indepNum := by omega

end R26U3
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma R26U3.nonleaf_degree_eq_two_of_leafSet_card_eq_two 66f9a969b7f9c633cfe08c038192c1a12e43b919f867aa2d1e23d837ec3290d0
namespace R26U3

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

end R26U3
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma R26U3.leafDegree_two_indepNum_eq_two 00ca6c31db0bb81b2e9693494f75ceaa02f30c15cc4b7896cd1403d05bc056fa
namespace R26U3

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (e) the `P_3` lemma: a tree with exactly two leaves, one of whose support
is adjacent to both, has `indepNum = 2` (the tree is forced to be exactly the
three-vertex path `t1 - s - t2`, i.e. `P_3`). -/
lemma leafDegree_two_indepNum_eq_two (G : SimpleGraph V) [DecidableRel G.Adj]
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

end R26U3
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma R26CritU3T.mul_card_leafDegree_fiber_le_card_leafSet 44c452de2d36964390586edaa601e3984707ce0f574294d742e096e9878e2c15
namespace R26CritU3T

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `j · |C_j| ≤ ℓ` for every `j`, where `C_j := {s : λ(s) = j}`.  Generalizes
U3's `card_C1_le_card_leafSet` (the case `j = 1`). -/
lemma mul_card_leafDegree_fiber_le_card_leafSet (G : SimpleGraph V) [DecidableRel G.Adj]
    (j : ℕ) :
    j * (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = j)).card
      ≤ (C5LA1.leafSet G).card := by
  classical
  rw [← R26U3.sum_leafDegree_eq_card_leafSet G]
  calc j * (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = j)).card
      = ∑ _s ∈ Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = j), j := by
        rw [Finset.sum_const, smul_eq_mul]
        exact Nat.mul_comm _ _
    _ = ∑ s ∈ Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = j),
          C5LA1.leafDegree G s :=
        Finset.sum_congr rfl (fun _s hs => ((Finset.mem_filter.mp hs).2).symm)
    _ ≤ ∑ s : V, C5LA1.leafDegree G s :=
        Finset.sum_le_sum_of_subset (Finset.filter_subset _ _)

end R26CritU3T
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma R26CritU3T.two_mul_card_C2_le_card_leafSet 3001306ce77e6db329767050b48d9c715e6b6302385f8edefd8831fed6beff81
namespace R26CritU3T

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `k₂ ≤ ⌊ℓ/2⌋` (SEMANTIC-CONTRACT.md Section 4), in the form `2·k₂ ≤ ℓ`. -/
lemma two_mul_card_C2_le_card_leafSet (G : SimpleGraph V) [DecidableRel G.Adj] :
    2 * (Finset.univ.filter (fun s : V => C5LA1.leafDegree G s = 2)).card
      ≤ (C5LA1.leafSet G).card :=
  mul_card_leafDegree_fiber_le_card_leafSet G 2

end R26CritU3T
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma R26CritT.famOneInjOn 49df2035dd71dd00c0416bf132af94a3d9923fdc91e1e488dcea022a4f37564c
namespace R26CritT

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The map is injective on `(independent a-subsets of D) × L` whenever `D` and `L` are
disjoint. Re-derived here (U2 inlines this inside `familyOneInjection` and so cannot state
the exact image count). -/
lemma famOneInjOn (G : SimpleGraph V) [DecidableRel G.Adj] (D L : Finset V) (a : ℕ)
    (hDL : Disjoint D L) :
    Set.InjOn (famOneMap L) ((famOneSource G D a) ×ˢ L : Finset (Finset V × V)) := by
  classical
  rintro ⟨J1, v1⟩ h1 ⟨J2, v2⟩ h2 heq
  simp only [Finset.mem_coe, Finset.mem_product] at h1 h2
  obtain ⟨hJ1, hv1⟩ := h1
  obtain ⟨hJ2, hv2⟩ := h2
  simp only [famOneSource, Finset.mem_filter, Finset.mem_powerset] at hJ1 hJ2
  have hJ1sub : J1 ⊆ D := hJ1.1
  have hJ2sub : J2 ⊆ D := hJ2.1
  have heq' : J1 ∪ L.erase v1 = J2 ∪ L.erase v2 := heq
  have hrecJ : ∀ (J : Finset V) (v : V), J ⊆ D → (J ∪ L.erase v) ∩ D = J := by
    intro J v hJ
    apply Finset.ext; intro x
    simp only [Finset.mem_inter, Finset.mem_union]
    constructor
    · rintro ⟨hx | hx, hxD⟩
      · exact hx
      · exact absurd (Finset.mem_of_mem_erase hx) (Finset.disjoint_left.mp hDL hxD)
    · intro hx; exact ⟨Or.inl hx, hJ hx⟩
  have hrecL : ∀ (J : Finset V) (v : V), J ⊆ D → (J ∪ L.erase v) ∩ L = L.erase v := by
    intro J v hJ
    apply Finset.ext; intro x
    simp only [Finset.mem_inter, Finset.mem_union]
    constructor
    · rintro ⟨hx | hx, hxL⟩
      · exact absurd hxL (Finset.disjoint_left.mp hDL (hJ hx))
      · exact hx
    · intro hx; exact ⟨Or.inr hx, Finset.mem_of_mem_erase hx⟩
  have hJeq : J1 = J2 := by
    rw [← hrecJ J1 v1 hJ1sub, ← hrecJ J2 v2 hJ2sub, heq']
  have hLeq : L.erase v1 = L.erase v2 := by
    rw [← hrecL J1 v1 hJ1sub, ← hrecL J2 v2 hJ2sub, heq']
  have hvv : v1 = v2 := by
    by_contra hne
    have : v1 ∈ L.erase v2 := Finset.mem_erase.mpr ⟨hne, hv1⟩
    rw [← hLeq] at this
    exact (Finset.notMem_erase v1 L) this
  exact Prod.ext hJeq hvv

end R26CritT
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma R26CritT.famOneImageCard 8949361b6a5cf2a27d24599f9c70733c4568cf4b7a08c7828b3ee4097ce1c546
namespace R26CritT

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **Critic advance 2a — the EXACT image count** `|image| = ℓ · |{J ⊆ D : indep, |J| = a}|`.
`C1-ALLOCATION.md` item 8(c) asks for `ℓ · M ≤ |image|`; U2's return states this is not
attempted ("the EXACT count … is not attempted by this route"). -/
lemma famOneImageCard (G : SimpleGraph V) [DecidableRel G.Adj] (D L : Finset V) (a : ℕ)
    (hDL : Disjoint D L) :
    (((famOneSource G D a) ×ˢ L).image (famOneMap L)).card
      = L.card * (famOneSource G D a).card := by
  classical
  rw [Finset.card_image_of_injOn (famOneInjOn G D L a hDL), Finset.card_product]
  ring

end R26CritT
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma R26CritF.fibreInequalitySharp c93f269067af130c11239a2edd33dca446b24eafbff9ef6b645492c0a20f360a
namespace R26CritF

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (1) Critic-derived sharpening of U2's (b): the fibre sum dominates
`(ℓ − |U|)·|I(U)|` for EVERY `ℓ : ℕ`, no hypothesis. -/
lemma fibreInequalitySharp (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (ℓ : ℕ) :
    ((ℓ : ℤ) - (U.card : ℤ)) * ((R26LA1.indepPowerset G U).card : ℤ)
      ≤ ∑ A ∈ R26LA1.indepPowerset G U, ((ℓ : ℤ) - 2 * (A.card : ℤ)) := by
  classical
  have hbound := R26LA1.deletionInjectionBound G U
  have hboundZ : 2 * ∑ A ∈ R26LA1.indepPowerset G U, (A.card : ℤ)
      ≤ (U.card : ℤ) * ((R26LA1.indepPowerset G U).card : ℤ) := by
    have hc : ((2 * ∑ A ∈ R26LA1.indepPowerset G U, A.card : ℕ) : ℤ)
        ≤ ((U.card * (R26LA1.indepPowerset G U).card : ℕ) : ℤ) := by exact_mod_cast hbound
    push_cast at hc
    linarith [hc]
  have hsum_eq : ∑ A ∈ R26LA1.indepPowerset G U, ((ℓ : ℤ) - 2 * (A.card : ℤ))
      = (ℓ : ℤ) * ((R26LA1.indepPowerset G U).card : ℤ)
        - 2 * ∑ A ∈ R26LA1.indepPowerset G U, (A.card : ℤ) := by
    rw [Finset.sum_sub_distrib, Finset.sum_const, Finset.mul_sum]
    push_cast
    ring
  rw [hsum_eq]
  nlinarith [hboundZ]

end R26CritF
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma R26LA1.mem_supportSet_iff a842dbb146e45cf35d6088b7ad9d4032bf912cf35fdcfe0586955b226c77a9c8
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_supportSet_iff (G : SimpleGraph V) [DecidableRel G.Adj] (s : V) :
    s ∈ supportSet G ↔ 0 < C5LA1.leafDegree G s := by
  simp [supportSet]

end R26LA1
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma R26LA1.mem_interior_iff 09d0536d8ec80665a8f28be0804321c4a1a56ee7ba43b42c0253bb1a6d492ca9
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_interior_iff (G : SimpleGraph V) [DecidableRel G.Adj] (x : V) :
    x ∈ interior G ↔ x ∉ C5LA1.leafSet G ∧ x ∉ supportSet G := by
  simp [interior, not_or]

end R26LA1
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma R26LA1.mem_leafSet_iff cea28a703224adad8924a6842e1379040a62d65427ce12857740901d6c47747b
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_leafSet_iff (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) :
    v ∈ C5LA1.leafSet G ↔ C4LA1.IsGraphLeaf G v := by
  simp [C5LA1.leafSet]

end R26LA1
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma R26LA1.c_eq_support_image 2f5bd481d8f7b28bcbe20157b3e3fe03a4bedc5b771898e3391e78edce1cf62a
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-12** `c_eq_support_image`: `C(G) = support '' L(G)`. -/
lemma c_eq_support_image (G : SimpleGraph V) [DecidableRel G.Adj] :
    supportSet G = (C5LA1.leafSet G).image (C5LA1.support G) := by
  classical
  ext s
  rw [mem_supportSet_iff, C5LA1.leafDegree_eq_filter_support, Finset.card_pos, Finset.mem_image]
  constructor
  · rintro ⟨v, hv⟩
    rw [Finset.mem_filter] at hv
    exact ⟨v, hv.1, hv.2⟩
  · rintro ⟨v, hv, hs⟩
    exact ⟨v, Finset.mem_filter.mpr ⟨hv, hs⟩⟩

end R26LA1
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma R26LA1.exists_leaf_of_mem_supportSet 60d534e4077536c3f551e31dc62056e684513dc79307851b87957e1b7cc66bfb
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma exists_leaf_of_mem_supportSet (G : SimpleGraph V) [DecidableRel G.Adj] {s : V}
    (hs : s ∈ supportSet G) : ∃ v ∈ C5LA1.leafSet G, C5LA1.support G v = s := by
  rw [c_eq_support_image, Finset.mem_image] at hs
  obtain ⟨v, hv, hsv⟩ := hs
  exact ⟨v, hv, hsv⟩

end R26LA1
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma R26LA1.support_mem_supportSet 5722555ffc2fd7b512413968eb4bb8d132a4817adfacbacf6ff14eaf06741e86
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma support_mem_supportSet (G : SimpleGraph V) [DecidableRel G.Adj] {v : V}
    (hv : v ∈ C5LA1.leafSet G) : C5LA1.support G v ∈ supportSet G := by
  rw [c_eq_support_image]
  exact Finset.mem_image_of_mem _ hv

end R26LA1
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma R26LA1.leaf_not_mem_supportSet 6060615f6442c0be01cde9cace742315fef11ec43be47cb1ef8ea99d85cecd44
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- In a tree with `α ≥ 2`, no leaf is a support (re-derived on the run's own spelling of
`supportSet`; the corpus carries three incompatible spellings). -/
lemma leaf_not_mem_supportSet (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {v : V} (hv : C4LA1.IsGraphLeaf G v) :
    v ∉ supportSet G := by
  intro hmem
  obtain ⟨u, hu, hsupp⟩ := exists_leaf_of_mem_supportSet G hmem
  have huleaf : C4LA1.IsGraphLeaf G u := (mem_leafSet_iff G u).mp hu
  have hadj : G.Adj u v := (C5LA1.adj_iff_support_eq huleaf).2 hsupp
  exact R26U3.tree_two_le_indepNum_no_adjacent_leaves G hTree hAlpha u v huleaf hv hadj

end R26LA1
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma R26LA1.leaf_support_disjoint 152d865500ee169089905bbaa268c6e2c26e63538e8ab49c3d4b86ba91b0f125
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-8** `leaf_support_disjoint`. -/
lemma leaf_support_disjoint (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    Disjoint (C5LA1.leafSet G) (supportSet G) := by
  rw [Finset.disjoint_left]
  intro v hv hmem
  exact leaf_not_mem_supportSet G hTree hAlpha ((mem_leafSet_iff G v).mp hv) hmem

end R26LA1
-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma R26LA1.leaf_degree_sum_eq_card f6596b1c1681e6830229644896996f797c5f15edb31c31f57cda0490e64729d0
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-10 (d)** `leaf_degree_sum_eq_card`. -/
lemma leaf_degree_sum_eq_card (G : SimpleGraph V) [DecidableRel G.Adj] :
    ∑ s : V, C5LA1.leafDegree G s = (C5LA1.leafSet G).card :=
  R26U3.sum_leafDegree_eq_card_leafSet G

end R26LA1
-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma R26LA1.leaf_card_ge_two 1c7e96ec558b6c1fe0a356a4b0cfa687d52f4797f8efa8030699275e7ae5f92a
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-6** `leaf_card_ge_two`. -/
lemma leaf_card_ge_two (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    2 ≤ (C5LA1.leafSet G).card :=
  R26U3.tree_two_le_indepNum_two_le_leafSet G hTree hAlpha

end R26LA1
-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma R26LA1.k2_le_ell_div_two 26ac2c47aee1bc66db2745a1eddec29333227fea17d8737fe974db4fade73447
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-10** `k2_le_ell_div_two`, in the form `2 k₂ ≤ ℓ`. -/
lemma k2_le_ell_div_two (G : SimpleGraph V) [DecidableRel G.Adj] :
    2 * (C2 G).card ≤ (C5LA1.leafSet G).card :=
  R26CritU3T.two_mul_card_C2_le_card_leafSet G

end R26LA1
-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma R26LA1.eligible_imp_alpha_ge_three 93757eb9f5484c4f6f3b041d3843951de91802a8adb26226c9de2b42d54582ee
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-11** `eligible_imp_alpha_ge_three`. -/
lemma eligible_imp_alpha_ge_three (G : SimpleGraph V) [DecidableRel G.Adj]
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1) :
    3 ≤ G.indepNum :=
  R26U3.eligible_three_le_indepNum G hEligible

end R26LA1
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma R26LA1.leafDegree_eq_zero_of_not_mem_supportSet 7d6c64c7ee3907c64452cf0d2b0b215f707a6eec33eeebba8e62f61147da1b72
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `λ` vanishes off `C(G)`. -/
lemma leafDegree_eq_zero_of_not_mem_supportSet (G : SimpleGraph V) [DecidableRel G.Adj] {x : V}
    (hx : x ∉ supportSet G) : C5LA1.leafDegree G x = 0 := by
  rw [mem_supportSet_iff] at hx
  omega

end R26LA1
-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma R26LA1.leaf_leafDegree_eq_zero fd65ac478d8247750a7260a42dd2baad158d63c238cc026f559f7438bea5b61f
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `λ` vanishes on the leaves (tree, `α ≥ 2`). -/
lemma leaf_leafDegree_eq_zero (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {v : V} (hv : v ∈ C5LA1.leafSet G) :
    C5LA1.leafDegree G v = 0 := by
  refine leafDegree_eq_zero_of_not_mem_supportSet G ?_
  exact Finset.disjoint_left.mp (leaf_support_disjoint G hTree hAlpha) hv

end R26LA1
-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma R26LA1.interior_leafDegree_eq_zero 4c1c7d32e3102e18eb61c32a742e0830a00dc68b55856c2ff9728826ad8a7cd4
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `λ` vanishes on the interior. -/
lemma interior_leafDegree_eq_zero (G : SimpleGraph V) [DecidableRel G.Adj] {d : V}
    (hd : d ∈ interior G) : C5LA1.leafDegree G d = 0 :=
  leafDegree_eq_zero_of_not_mem_supportSet G ((mem_interior_iff G d).mp hd).2

end R26LA1
-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma R26LA1.leafSet_indep dd5d3116bb917715908181d9b8f1abe23f430e6362491939372f285fdc9f85a2
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The leaf set is independent (no two leaves of a tree with `α ≥ 2` are adjacent). -/
lemma leafSet_indep (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    G.IsIndepSet ((C5LA1.leafSet G : Finset V) : Set V) := by
  rw [SimpleGraph.isIndepSet_iff]
  intro x hx y hy _hxy
  simp only [Finset.mem_coe, mem_leafSet_iff] at hx hy
  exact R26U3.tree_two_le_indepNum_no_adjacent_leaves G hTree hAlpha x y hx hy

end R26LA1
-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma R26LA1.no_edge_interior_leaf 8b9ca2f89826545e3e1e01569a338bd80571bc11f549ea30a78472b60c96485d
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- There is no edge between the interior and the leaf set. -/
lemma no_edge_interior_leaf (G : SimpleGraph V) [DecidableRel G.Adj] {d v : V}
    (hd : d ∈ interior G) (hv : v ∈ C5LA1.leafSet G) : ¬ G.Adj d v := by
  intro hadj
  have hvl : C4LA1.IsGraphLeaf G v := (mem_leafSet_iff G v).mp hv
  have hsupp : C5LA1.support G v = d := (C5LA1.adj_iff_support_eq hvl).1 hadj.symm
  have : d ∈ supportSet G := hsupp ▸ support_mem_supportSet G hv
  exact ((mem_interior_iff G d).mp hd).2 this

end R26LA1
-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma R26LA1.mem_interiorIndep_iff 36798fdcac3cc8ec4f74a7eaba8ccb161a27fb36f0d12b2e090904dd175d4796
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_interiorIndep_iff (G : SimpleGraph V) [DecidableRel G.Adj] {J : Finset V} :
    J ∈ interiorIndep G ↔ J ⊆ interior G ∧ G.IsIndepSet (J : Set V) := by
  simp [interiorIndep]

end R26LA1
-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma R26LA1.card_le_aVal 7eaaa01ad834c3e05b57eeb2307cb05858741e8ec522ca3f24701b7ef6f175ae
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma card_le_aVal (G : SimpleGraph V) [DecidableRel G.Adj] {J : Finset V}
    (hJ : J ∈ interiorIndep G) : J.card ≤ aVal G :=
  Finset.le_sup (f := Finset.card) hJ

end R26LA1
-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN lemma R26LA1.interiorIndep_nonempty bae20ced058e90410f3cd26d6d773a43e86f1527ec5267fb5f294e5c99521c09
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma interiorIndep_nonempty (G : SimpleGraph V) [DecidableRel G.Adj] :
    (interiorIndep G).Nonempty :=
  ⟨∅, by
    rw [mem_interiorIndep_iff]
    refine ⟨Finset.empty_subset _, ?_⟩
    rw [SimpleGraph.isIndepSet_iff]
    simp⟩

end R26LA1
-- VERITYOS ENTRY 90 END

-- VERITYOS ENTRY 91 BEGIN lemma R26LA1.exists_aVal cf7c6e38f3b745c11ec3a6cf84349a3dda9cc5b02e9df40d98016bd21e2c6eb7
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma exists_aVal (G : SimpleGraph V) [DecidableRel G.Adj] :
    ∃ J ∈ interiorIndep G, J.card = aVal G := by
  obtain ⟨J, hJ, hJeq⟩ :=
    Finset.exists_mem_eq_sup (interiorIndep G) (interiorIndep_nonempty G) Finset.card
  exact ⟨J, hJ, hJeq.symm⟩

end R26LA1
-- VERITYOS ENTRY 91 END

-- VERITYOS ENTRY 92 BEGIN lemma R26LA1.leaf_union_interior_indep 2e86d0c20d9279fa905b3d806649ded57afb7e6e8b09a4ff29ace794796bd617
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `L ∪ J` is independent for every independent subset `J` of the interior. -/
lemma leaf_union_interior_indep (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {J : Finset V} (hJ : J ∈ interiorIndep G) :
    G.IsIndepSet ((C5LA1.leafSet G ∪ J : Finset V) : Set V) := by
  rw [mem_interiorIndep_iff] at hJ
  refine R26LA1.isIndepSet_union_of_no_cross_adj (leafSet_indep G hTree hAlpha) hJ.2 ?_
  intro x hx y hy hadj
  exact no_edge_interior_leaf G (hJ.1 hy) hx hadj.symm

end R26LA1
-- VERITYOS ENTRY 92 END

-- VERITYOS ENTRY 93 BEGIN lemma R26LA1.disjoint_leafSet_interior b4f47fb7cfe6b35ed2a76286a1aed202ee9f3aa12e93c88dec38325ac8cae2a3
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma disjoint_leafSet_interior (G : SimpleGraph V) [DecidableRel G.Adj] :
    Disjoint (C5LA1.leafSet G) (interior G) := by
  rw [Finset.disjoint_right]
  intro x hx
  exact ((mem_interior_iff G x).mp hx).1

end R26LA1
-- VERITYOS ENTRY 93 END

-- VERITYOS ENTRY 94 BEGIN lemma R26LA1.disjoint_supportSet_interior 588b33b2118a40f2ce2493b820bbf7a484a07b14f22d253fd9c5342eb283c37a
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma disjoint_supportSet_interior (G : SimpleGraph V) [DecidableRel G.Adj] :
    Disjoint (supportSet G) (interior G) := by
  rw [Finset.disjoint_right]
  intro x hx
  exact ((mem_interior_iff G x).mp hx).2

end R26LA1
-- VERITYOS ENTRY 94 END

-- VERITYOS ENTRY 95 BEGIN lemma R26LA1.card_inter_split 172e37261e8c7b63bc50cdb7a7720427ba8694c2ef6b8d4ef547ec2abe73a506
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The partition `V = L ⊎ C ⊎ D` at the level of cardinalities of intersections. -/
lemma card_inter_split (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (B : Finset V) :
    B.card = (B ∩ C5LA1.leafSet G).card + (B ∩ supportSet G).card + (B ∩ interior G).card := by
  classical
  have hLC := leaf_support_disjoint G hTree hAlpha
  have hd1 : Disjoint (B ∩ C5LA1.leafSet G) (B ∩ supportSet G) := by
    rw [Finset.disjoint_left]
    intro x hx hy
    exact Finset.disjoint_left.mp hLC (Finset.mem_of_mem_inter_right hx)
      (Finset.mem_of_mem_inter_right hy)
  have hd2 : Disjoint ((B ∩ C5LA1.leafSet G) ∪ (B ∩ supportSet G)) (B ∩ interior G) := by
    rw [Finset.disjoint_right]
    intro x hx
    have hxi := (mem_interior_iff G x).mp (Finset.mem_of_mem_inter_right hx)
    simp only [Finset.mem_union, Finset.mem_inter]
    rintro (⟨_, h⟩ | ⟨_, h⟩)
    · exact hxi.1 h
    · exact hxi.2 h
  have hcover : (B ∩ C5LA1.leafSet G) ∪ (B ∩ supportSet G) ∪ (B ∩ interior G) = B := by
    ext x
    simp only [Finset.mem_union, Finset.mem_inter, mem_interior_iff]
    tauto
  calc B.card
      = ((B ∩ C5LA1.leafSet G) ∪ (B ∩ supportSet G) ∪ (B ∩ interior G)).card := by rw [hcover]
    _ = ((B ∩ C5LA1.leafSet G) ∪ (B ∩ supportSet G)).card + (B ∩ interior G).card :=
        Finset.card_union_of_disjoint hd2
    _ = (B ∩ C5LA1.leafSet G).card + (B ∩ supportSet G).card + (B ∩ interior G).card := by
        rw [Finset.card_union_of_disjoint hd1]

end R26LA1
-- VERITYOS ENTRY 95 END

-- VERITYOS ENTRY 96 BEGIN lemma R26LA1.alpha_ge_ell_add_a 49f9f1399e839119066e00565d622a5df05854e1cc064da7fc9dcb2c340a6af9
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma alpha_ge_ell_add_a (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    (C5LA1.leafSet G).card + aVal G ≤ G.indepNum := by
  classical
  obtain ⟨J, hJ, hJcard⟩ := exists_aVal G
  have hJsub : J ⊆ interior G := ((mem_interiorIndep_iff G).mp hJ).1
  have hdisj : Disjoint (C5LA1.leafSet G) J :=
    Finset.disjoint_of_subset_right hJsub (disjoint_leafSet_interior G)
  have hind := leaf_union_interior_indep G hTree hAlpha hJ
  have hle := hind.card_le_indepNum
  rwa [Finset.card_union_of_disjoint hdisj, hJcard] at hle

end R26LA1
-- VERITYOS ENTRY 96 END

-- VERITYOS ENTRY 97 BEGIN lemma R26LA1.alpha_le_ell_add_a 60697a9bb9083c74382901baef569af8d3b3eac7bd7b799ee402ec7f321691c1
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma alpha_le_ell_add_a (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    G.indepNum ≤ (C5LA1.leafSet G).card + aVal G := by
  classical
  obtain ⟨S, hS⟩ := G.exists_isNIndepSet_indepNum
  have hSind : G.IsIndepSet (S : Set V) := hS.isIndepSet
  have hScard : S.card = G.indepNum := hS.card_eq
  -- the supports inside `S` are dominated by the leaves outside `S`
  have hsub : S ∩ supportSet G ⊆ (C5LA1.leafSet G \ S).image (C5LA1.support G) := by
    intro s hs
    rw [Finset.mem_inter] at hs
    obtain ⟨hsS, hsC⟩ := hs
    obtain ⟨v, hv, hsv⟩ := exists_leaf_of_mem_supportSet G hsC
    have hvl : C4LA1.IsGraphLeaf G v := (mem_leafSet_iff G v).mp hv
    have hadj : G.Adj v s := hsv ▸ (C5LA1.support_spec hvl).1
    have hvS : v ∉ S := by
      intro hvS
      exact (hSind hvS hsS (G.ne_of_adj hadj)) hadj
    exact Finset.mem_image.mpr ⟨v, Finset.mem_sdiff.mpr ⟨hv, hvS⟩, hsv⟩
  have hcardC : (S ∩ supportSet G).card ≤ (C5LA1.leafSet G \ S).card :=
    le_trans (Finset.card_le_card hsub) (Finset.card_image_le)
  have hsplitL : (C5LA1.leafSet G \ S).card + (C5LA1.leafSet G ∩ S).card
      = (C5LA1.leafSet G).card := Finset.card_sdiff_add_card_inter _ _
  have hcomm : C5LA1.leafSet G ∩ S = S ∩ C5LA1.leafSet G := Finset.inter_comm _ _
  -- the interior part of `S` is an independent subset of the interior
  have hSD : S ∩ interior G ∈ interiorIndep G := by
    rw [mem_interiorIndep_iff]
    exact ⟨Finset.inter_subset_right,
      Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_inter_left hx) hSind⟩
  have hcardD : (S ∩ interior G).card ≤ aVal G := card_le_aVal G hSD
  have hsplit := card_inter_split G hTree hAlpha S
  rw [hcomm] at hsplitL
  omega

end R26LA1
-- VERITYOS ENTRY 97 END

-- VERITYOS ENTRY 98 BEGIN lemma R26LA1.alpha_eq_ell_add_a 6f8d9c13614da2aabb014c088e64fea71531c61a7a771a9dcd76e3a7216419b4
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **GATE (L-9)** `alpha_eq_ell_add_a`: `α = ℓ + a`, free of `(★)`. -/
lemma alpha_eq_ell_add_a (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    G.indepNum = (C5LA1.leafSet G).card + aVal G :=
  le_antisymm (alpha_le_ell_add_a G hTree hAlpha) (alpha_ge_ell_add_a G hTree hAlpha)

end R26LA1
-- VERITYOS ENTRY 98 END

-- VERITYOS ENTRY 99 BEGIN lemma R26LA1.maxIndep_no_support ac6b4cd2a081c95685e889be19cc7e7b302eaed9f504418b2c218c20b1d9f8b5
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **X-5** `maxIndep_no_support`: under `(★)` a maximum independent set contains no support. -/
lemma maxIndep_no_support (G : SimpleGraph V) [DecidableRel G.Adj]
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    {S : Finset V} (hSind : G.IsIndepSet (S : Set V)) (hScard : S.card = G.indepNum) :
    S ∩ supportSet G = ∅ := by
  classical
  rw [Finset.eq_empty_iff_forall_notMem]
  intro s hs
  rw [Finset.mem_inter] at hs
  obtain ⟨hsS, hsC⟩ := hs
  obtain ⟨v, hv, hsv⟩ := exists_leaf_of_mem_supportSet G hsC
  have hvl : C4LA1.IsGraphLeaf G v := (mem_leafSet_iff G v).mp hv
  have hadj : G.Adj v s := hsv ▸ (C5LA1.support_spec hvl).1
  have hvS : v ∈ S := hResidual v hvl S hSind hScard
  exact (hSind hvS hsS (G.ne_of_adj hadj)) hadj

end R26LA1
-- VERITYOS ENTRY 99 END

-- VERITYOS ENTRY 100 BEGIN lemma R26LA1.leafSet_subset_of_max 090b17169ca0d3ca09ec9231b11d9e59ceb139be58a148a0bc9030ea83a819e8
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Every leaf lies in every maximum independent set, i.e. `L ⊆ S`. -/
lemma leafSet_subset_of_max (G : SimpleGraph V) [DecidableRel G.Adj]
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    {S : Finset V} (hSind : G.IsIndepSet (S : Set V)) (hScard : S.card = G.indepNum) :
    C5LA1.leafSet G ⊆ S := by
  intro v hv
  exact hResidual v ((mem_leafSet_iff G v).mp hv) S hSind hScard

end R26LA1
-- VERITYOS ENTRY 100 END

-- VERITYOS ENTRY 101 BEGIN lemma R26LA1.max_indep_eq_leaf_union_D 64520db644976a5539e3586e89b7760579561ab5d20533cc40bc5a7d7bf479b1
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-9 + (★)** `max_indep_eq_leaf_union_D`. -/
lemma max_indep_eq_leaf_union_D (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    {S : Finset V} (hSind : G.IsIndepSet (S : Set V)) (hScard : S.card = G.indepNum) :
    S = C5LA1.leafSet G ∪ (S ∩ interior G) := by
  classical
  have hLS : C5LA1.leafSet G ⊆ S := leafSet_subset_of_max G hResidual hSind hScard
  have hSC : S ∩ supportSet G = ∅ := maxIndep_no_support G hResidual hSind hScard
  ext x
  simp only [Finset.mem_union, Finset.mem_inter]
  constructor
  · intro hx
    by_cases hxL : x ∈ C5LA1.leafSet G
    · exact Or.inl hxL
    · right
      refine ⟨hx, ?_⟩
      rw [mem_interior_iff]
      refine ⟨hxL, ?_⟩
      intro hxC
      have : x ∈ S ∩ supportSet G := Finset.mem_inter.mpr ⟨hx, hxC⟩
      rw [hSC] at this
      exact absurd this (Finset.notMem_empty x)
  · rintro (hx | ⟨hx, _⟩)
    · exact hLS hx
    · exact hx

end R26LA1
-- VERITYOS ENTRY 101 END

-- VERITYOS ENTRY 102 BEGIN lemma R26LA1.card_inter_interior_of_max bd1ac9c45a3a125f2e91bd1814b39e58c3c6c45da8a09d99253d811301b93e7d
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-9 + (★)** `M_eq_card_maxIndep_D`, cardinality half. -/
lemma card_inter_interior_of_max (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    {S : Finset V} (hSind : G.IsIndepSet (S : Set V)) (hScard : S.card = G.indepNum) :
    (S ∩ interior G).card = aVal G := by
  classical
  have heq := max_indep_eq_leaf_union_D G hTree hAlpha hResidual hSind hScard
  have hdisj : Disjoint (C5LA1.leafSet G) (S ∩ interior G) :=
    Finset.disjoint_of_subset_right Finset.inter_subset_right (disjoint_leafSet_interior G)
  have hc : S.card = (C5LA1.leafSet G).card + (S ∩ interior G).card := by
    conv_lhs => rw [heq]
    rw [Finset.card_union_of_disjoint hdisj]
  rw [hScard, alpha_eq_ell_add_a G hTree hAlpha] at hc
  omega

end R26LA1
-- VERITYOS ENTRY 102 END

-- VERITYOS ENTRY 103 BEGIN lemma R26LA1.M_eq_card_maxIndep_D d4a431dc4092de024155539b96161770da0a419a773dfa78b9af77f37e2c1fc9
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-9 + (★)** `M_eq_card_maxIndep_D`: `M = i_α(G) = |{J ⊆ D indep, |J| = a}|`. -/
lemma M_eq_card_maxIndep_D (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    C5LA1.indepSetCount G ∅ G.indepNum = (maxIndepInterior G).card := by
  classical
  unfold C5LA1.indepSetCount
  apply Finset.card_nbij' (fun S => S ∩ interior G) (fun J => C5LA1.leafSet G ∪ J)
  · intro S hS
    simp only [Finset.mem_coe, C5LA1.indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hS
    obtain ⟨⟨_, hScard⟩, hSind⟩ := hS
    simp only [Finset.mem_coe, maxIndepInterior, Finset.mem_filter]
    refine ⟨?_, card_inter_interior_of_max G hTree hAlpha hResidual hSind hScard⟩
    rw [mem_interiorIndep_iff]
    exact ⟨Finset.inter_subset_right,
      Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_inter_left hx) hSind⟩
  · intro J hJ
    simp only [Finset.mem_coe, maxIndepInterior, Finset.mem_filter] at hJ
    obtain ⟨hJmem, hJcard⟩ := hJ
    have hJsub : J ⊆ interior G := ((mem_interiorIndep_iff G).mp hJmem).1
    have hdisj : Disjoint (C5LA1.leafSet G) J :=
      Finset.disjoint_of_subset_right hJsub (disjoint_leafSet_interior G)
    simp only [Finset.mem_coe, C5LA1.indepSetsAvoiding, Finset.sdiff_empty, Finset.mem_filter,
      Finset.mem_powersetCard]
    refine ⟨⟨Finset.subset_univ _, ?_⟩, leaf_union_interior_indep G hTree hAlpha hJmem⟩
    rw [Finset.card_union_of_disjoint hdisj, hJcard, alpha_eq_ell_add_a G hTree hAlpha]
  · intro S hS
    simp only [Finset.mem_coe, C5LA1.indepSetsAvoiding, Finset.mem_filter,
      Finset.mem_powersetCard] at hS
    obtain ⟨⟨_, hScard⟩, hSind⟩ := hS
    exact (max_indep_eq_leaf_union_D G hTree hAlpha hResidual hSind hScard).symm
  · intro J hJ
    simp only [Finset.mem_coe, maxIndepInterior, Finset.mem_filter] at hJ
    have hJsub : J ⊆ interior G := ((mem_interiorIndep_iff G).mp hJ.1).1
    ext x
    simp only [Finset.mem_inter, Finset.mem_union]
    constructor
    · rintro ⟨hx | hx, hxD⟩
      · exact absurd hx ((mem_interior_iff G x).mp hxD).1
      · exact hx
    · intro hx
      exact ⟨Or.inr hx, hJsub hx⟩

end R26LA1
-- VERITYOS ENTRY 103 END

-- VERITYOS ENTRY 104 BEGIN lemma R26LA1.forced_neighbour 194e1750cc8228744ac2ae50ee3f1278e833300d839f0e4d92b75b04973872a7
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-1** `forced_neighbour`: under `(★)`, an independent `B` whose interior part is already
maximum cannot contain a `λ = 1` support. -/
lemma forced_neighbour (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    {B : Finset V} (hBind : G.IsIndepSet (B : Set V))
    (hBD : (B ∩ interior G).card = aVal G)
    {s : V} (hsB : s ∈ B) (hlam : C5LA1.leafDegree G s = 1) : False := by
  classical
  set J := B ∩ interior G with hJ_def
  have hJmem : J ∈ interiorIndep G := by
    rw [mem_interiorIndep_iff]
    exact ⟨Finset.inter_subset_right,
      Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_inter_left hx) hBind⟩
  have hJsub : J ⊆ interior G := Finset.inter_subset_right
  -- the unique leaf of `s`
  have hfil : ((C5LA1.leafSet G).filter fun v => C5LA1.support G v = s).card = 1 := by
    rw [← C5LA1.leafDegree_eq_filter_support]; exact hlam
  obtain ⟨v, hveq⟩ := Finset.card_eq_one.mp hfil
  have hvmem : v ∈ (C5LA1.leafSet G).filter fun v => C5LA1.support G v = s := by
    rw [hveq]; exact Finset.mem_singleton_self v
  rw [Finset.mem_filter] at hvmem
  obtain ⟨hvL, hvs⟩ := hvmem
  have hsC : s ∈ supportSet G := by rw [mem_supportSet_iff]; omega
  -- `s` has no neighbour in `(L.erase v) ∪ J`
  have hdisjLJ : Disjoint ((C5LA1.leafSet G).erase v) J :=
    Finset.disjoint_of_subset_left (Finset.erase_subset _ _)
      (Finset.disjoint_of_subset_right hJsub (disjoint_leafSet_interior G))
  have hbase : G.IsIndepSet ((((C5LA1.leafSet G).erase v) ∪ J : Finset V) : Set V) := by
    refine Set.Pairwise.mono ?_ (leaf_union_interior_indep G hTree hAlpha hJmem)
    intro x hx
    simp only [Finset.coe_union, Set.mem_union, Finset.mem_coe, Finset.mem_union] at hx ⊢
    rcases hx with hx | hx
    · exact Or.inl (Finset.mem_of_mem_erase hx)
    · exact Or.inr hx
  have hsnot : s ∉ (((C5LA1.leafSet G).erase v) ∪ J : Finset V) := by
    simp only [Finset.mem_union]
    rintro (hx | hx)
    · exact Finset.disjoint_left.mp (leaf_support_disjoint G hTree hAlpha)
        (Finset.mem_of_mem_erase hx) hsC
    · exact Finset.disjoint_left.mp (disjoint_supportSet_interior G) hsC (hJsub hx)
  have hnoadj : ∀ x ∈ (((C5LA1.leafSet G).erase v) ∪ J : Finset V), ¬ G.Adj s x := by
    intro x hx hadj
    simp only [Finset.mem_union] at hx
    rcases hx with hx | hx
    · have hxL : x ∈ C5LA1.leafSet G := Finset.mem_of_mem_erase hx
      have hxl : C4LA1.IsGraphLeaf G x := (mem_leafSet_iff G x).mp hxL
      have : C5LA1.support G x = s := (C5LA1.adj_iff_support_eq hxl).1 hadj.symm
      have hxmem : x ∈ (C5LA1.leafSet G).filter fun v => C5LA1.support G v = s :=
        Finset.mem_filter.mpr ⟨hxL, this⟩
      rw [hveq, Finset.mem_singleton] at hxmem
      exact (Finset.ne_of_mem_erase hx) hxmem
    · exact (hBind hsB (Finset.mem_of_mem_inter_left hx) (G.ne_of_adj hadj)) hadj
  have hTind : G.IsIndepSet ((insert s (((C5LA1.leafSet G).erase v) ∪ J) : Finset V) : Set V) :=
    C5LA1.isIndepSet_insert_of_no_adj hbase hsnot hnoadj
  have hell : 1 ≤ (C5LA1.leafSet G).card := Finset.card_pos.mpr ⟨v, hvL⟩
  have hTcard : (insert s (((C5LA1.leafSet G).erase v) ∪ J) : Finset V).card = G.indepNum := by
    rw [Finset.card_insert_of_notMem hsnot, Finset.card_union_of_disjoint hdisjLJ,
      Finset.card_erase_of_mem hvL, hBD, alpha_eq_ell_add_a G hTree hAlpha]
    omega
  have hvT : v ∈ (insert s (((C5LA1.leafSet G).erase v) ∪ J) : Finset V) :=
    hResidual v ((mem_leafSet_iff G v).mp hvL) _ hTind hTcard
  simp only [Finset.mem_insert, Finset.mem_union] at hvT
  rcases hvT with h | h | h
  · exact Finset.disjoint_left.mp (leaf_support_disjoint G hTree hAlpha) hvL (h ▸ hsC)
  · exact (Finset.notMem_erase v _) h
  · exact Finset.disjoint_left.mp (disjoint_leafSet_interior G) hvL (hJsub h)

end R26LA1
-- VERITYOS ENTRY 104 END

-- VERITYOS ENTRY 105 BEGIN lemma R26LA1.mem_topShell_iff 4605fba2276153b3055270d714fd5db10308377cc56f1ade4ec44ef6e2d216c4
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_topShell_iff (G : SimpleGraph V) [DecidableRel G.Adj] {B : Finset V} :
    B ∈ topShell G ↔ B.card = G.indepNum - 1 ∧ G.IsIndepSet (B : Set V) := by
  classical
  simp only [topShell, C5LA1.indepSetsAvoiding, Finset.sdiff_empty, Finset.mem_filter,
    Finset.mem_powersetCard]
  constructor
  · rintro ⟨⟨_, h⟩, hi⟩; exact ⟨h, hi⟩
  · rintro ⟨h, hi⟩; exact ⟨⟨Finset.subset_univ _, h⟩, hi⟩

end R26LA1
-- VERITYOS ENTRY 105 END

-- VERITYOS ENTRY 106 BEGIN lemma R26LA1.sum_leafDegree_inter 717be8ef97832c6dc3a9eae5ccf7d5c95b79c61a257d9ddea28ad75ad1b22892
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma sum_leafDegree_inter (G : SimpleGraph V) [DecidableRel G.Adj] (B : Finset V) :
    ∑ s ∈ B ∩ supportSet G, (C5LA1.leafDegree G s : ℤ)
      = ∑ s ∈ B, (C5LA1.leafDegree G s : ℤ) := by
  have h := R26LA1.leafDegree_sum_eq_inter_support G B
  have he : B ∩ supportSet G = B ∩ (Finset.univ.filter fun s => 0 < C5LA1.leafDegree G s) := rfl
  rw [he]
  exact_mod_cast h

end R26LA1
-- VERITYOS ENTRY 106 END

-- VERITYOS ENTRY 107 BEGIN lemma R26LA1.h_nonneg 208f5e134c110c1345f64d09bfeca0b169708c06edce17da513b7b6b624e8c37
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-2** `h_nonneg`: the slack is nonnegative; the only step that uses independence. -/
lemma h_nonneg (G : SimpleGraph V) [DecidableRel G.Adj] {B : Finset V}
    (hBind : G.IsIndepSet (B : Set V)) : 0 ≤ slack G B := by
  have hw := R26LA1.budgetWeightBound G B hBind
  have hwZ : ((B ∩ C5LA1.leafSet G).card : ℤ) + ((∑ s ∈ B, C5LA1.leafDegree G s : ℕ) : ℤ)
      ≤ ((C5LA1.leafSet G).card : ℤ) := by exact_mod_cast hw
  have hcast : ((∑ s ∈ B, C5LA1.leafDegree G s : ℕ) : ℤ)
      = ∑ s ∈ B, (C5LA1.leafDegree G s : ℤ) := by push_cast; ring
  rw [hcast] at hwZ
  rw [slack]; linarith

end R26LA1
-- VERITYOS ENTRY 107 END

-- VERITYOS ENTRY 108 BEGIN lemma R26LA1.support_term_nonneg 5470ded2e763a39614aae74602eb18b017ca2aebe4dcc08519c73238e8faf34e
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The support term `Σ_{s ∈ B ∩ C} (λ(s) − 1)` is nonnegative. -/
lemma support_term_nonneg (G : SimpleGraph V) [DecidableRel G.Adj] (B : Finset V) :
    0 ≤ ∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1) := by
  apply Finset.sum_nonneg
  intro s hs
  have : 0 < C5LA1.leafDegree G s :=
    (mem_supportSet_iff G s).mp (Finset.mem_of_mem_inter_right hs)
  have : (1 : ℤ) ≤ (C5LA1.leafDegree G s : ℤ) := by exact_mod_cast this
  linarith

end R26LA1
-- VERITYOS ENTRY 108 END

-- VERITYOS ENTRY 109 BEGIN lemma R26LA1.interior_term_nonneg 4ca19be1582ce39d60037f56efc1433daa859df05f4105422ebe4b63acf483e4
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The interior term `a − |B ∩ D|` is nonnegative. -/
lemma interior_term_nonneg (G : SimpleGraph V) [DecidableRel G.Adj] {B : Finset V}
    (hBind : G.IsIndepSet (B : Set V)) :
    ((B ∩ interior G).card : ℤ) ≤ (aVal G : ℤ) := by
  have : (B ∩ interior G).card ≤ aVal G := by
    refine card_le_aVal G ?_
    rw [mem_interiorIndep_iff]
    exact ⟨Finset.inter_subset_right,
      Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_inter_left hx) hBind⟩
  exact_mod_cast this

end R26LA1
-- VERITYOS ENTRY 109 END

-- VERITYOS ENTRY 110 BEGIN lemma R26LA1.budget_identity 542af637521dba4c3199c1485db4a53afa99861c38b121058d4e59442e27ce3c
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-2** `budget_identity`: the three budget terms sum to exactly `1`. -/
lemma budget_identity (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {B : Finset V} (hB : B ∈ topShell G) :
    (∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1))
      + ((aVal G : ℤ) - ((B ∩ interior G).card : ℤ)) + slack G B = 1 := by
  classical
  obtain ⟨hBcard, hBind⟩ := mem_topShell_iff G |>.mp hB
  have hsplit := card_inter_split G hTree hAlpha B
  have hsplitZ : (B.card : ℤ) = ((B ∩ C5LA1.leafSet G).card : ℤ)
      + ((B ∩ supportSet G).card : ℤ) + ((B ∩ interior G).card : ℤ) := by exact_mod_cast hsplit
  have halpha := alpha_eq_ell_add_a G hTree hAlpha
  have hBcardZ : (B.card : ℤ) + 1 = ((C5LA1.leafSet G).card : ℤ) + (aVal G : ℤ) := by
    have : B.card + 1 = G.indepNum := by omega
    have h2 : B.card + 1 = (C5LA1.leafSet G).card + aVal G := by omega
    exact_mod_cast h2
  have hterm : (∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1))
      = (∑ s ∈ B, (C5LA1.leafDegree G s : ℤ)) - ((B ∩ supportSet G).card : ℤ) := by
    rw [Finset.sum_sub_distrib, Finset.sum_const, nsmul_eq_mul, mul_one, sum_leafDegree_inter]
  rw [hterm, slack]
  linarith

end R26LA1
-- VERITYOS ENTRY 110 END

-- VERITYOS ENTRY 111 BEGIN lemma R26LA1.budget_shapes f7cbea47e06fdb40d25107fcf5c61052923956e9641883c0c2577381347f97c0
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L5′** `budget_shapes`: the arithmetic trichotomy of the budget.  The `a − 1` shell at
`a = 0` is excluded by the budget term itself (in `ℤ`), never by `ℕ`-truncation. -/
lemma budget_shapes (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {B : Finset V} (hB : B ∈ topShell G) :
    ((B ∩ interior G).card = aVal G ∧ slack G B = 1
        ∧ (∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1)) = 0)
      ∨ ((B ∩ interior G).card = aVal G ∧ slack G B = 0
        ∧ (∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1)) = 1)
      ∨ (((B ∩ interior G).card : ℤ) + 1 = (aVal G : ℤ) ∧ slack G B = 0
        ∧ (∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1)) = 0) := by
  classical
  obtain ⟨_, hBind⟩ := mem_topShell_iff G |>.mp hB
  have hid := budget_identity G hTree hAlpha hB
  have h1 := support_term_nonneg G B
  have h2 := interior_term_nonneg G hBind
  have h3 := h_nonneg G hBind
  have hcard : ((B ∩ interior G).card : ℤ) = (aVal G : ℤ) ∨
      ((B ∩ interior G).card : ℤ) + 1 = (aVal G : ℤ) := by omega
  rcases hcard with hc | hc
  · have hceq : (B ∩ interior G).card = aVal G := by exact_mod_cast hc
    rcases (by omega : slack G B = 1 ∨ slack G B = 0) with hs | hs
    · exact Or.inl ⟨hceq, hs, by omega⟩
    · exact Or.inr (Or.inl ⟨hceq, hs, by omega⟩)
  · exact Or.inr (Or.inr ⟨hc, by omega, by omega⟩)

end R26LA1
-- VERITYOS ENTRY 111 END

-- VERITYOS ENTRY 112 BEGIN lemma R26LA1.family_support_pruned 5cea40107644c5fbc83b7f4b5e51f49bcee5a971bfdd74b7be9aa69533a22839
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L5″** `family_support_pruned`: under `(★)`, an already-maximum interior part admits at
most one support, and that support carries `λ = 2`. -/
lemma family_support_pruned (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    {B : Finset V} (hB : B ∈ topShell G) (hBD : (B ∩ interior G).card = aVal G) :
    B ∩ supportSet G = ∅ ∨ ∃ s : V, B ∩ supportSet G = {s} ∧ C5LA1.leafDegree G s = 2 := by
  classical
  obtain ⟨_, hBind⟩ := mem_topShell_iff G |>.mp hB
  -- every support used by `B` has `λ ≥ 2`
  have hge2 : ∀ s ∈ B ∩ supportSet G, 2 ≤ C5LA1.leafDegree G s := by
    intro s hs
    rw [Finset.mem_inter] at hs
    have hpos : 0 < C5LA1.leafDegree G s := (mem_supportSet_iff G s).mp hs.2
    rcases Nat.lt_or_ge (C5LA1.leafDegree G s) 2 with hlt | hge
    · exact absurd (forced_neighbour G hTree hAlpha hResidual hBind hBD hs.1 (by omega))
        (not_false)
    · exact hge
  have hlow : ((B ∩ supportSet G).card : ℤ)
      ≤ ∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1) := by
    have : ∀ s ∈ B ∩ supportSet G, (1 : ℤ) ≤ (C5LA1.leafDegree G s : ℤ) - 1 := by
      intro s hs
      have := hge2 s hs
      have : (2 : ℤ) ≤ (C5LA1.leafDegree G s : ℤ) := by exact_mod_cast this
      linarith
    calc ((B ∩ supportSet G).card : ℤ)
        = ∑ _s ∈ B ∩ supportSet G, (1 : ℤ) := by
          rw [Finset.sum_const, nsmul_eq_mul, mul_one]
      _ ≤ ∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1) := Finset.sum_le_sum this
  have hid := budget_identity G hTree hAlpha hB
  have h3 := h_nonneg G hBind
  have hcZ : ((B ∩ interior G).card : ℤ) = (aVal G : ℤ) := by exact_mod_cast hBD
  have hsum_le : (∑ s ∈ B ∩ supportSet G, ((C5LA1.leafDegree G s : ℤ) - 1)) ≤ 1 := by
    rw [hcZ] at hid; linarith
  have hcard_le : (B ∩ supportSet G).card ≤ 1 := by
    have : ((B ∩ supportSet G).card : ℤ) ≤ 1 := le_trans hlow hsum_le
    exact_mod_cast this
  rcases Nat.lt_or_ge (B ∩ supportSet G).card 1 with h0 | h1
  · left
    rw [← Finset.card_eq_zero]
    omega
  · right
    have hc1 : (B ∩ supportSet G).card = 1 := by omega
    obtain ⟨s, hs⟩ := Finset.card_eq_one.mp hc1
    refine ⟨s, hs, ?_⟩
    have hsmem : s ∈ B ∩ supportSet G := by rw [hs]; exact Finset.mem_singleton_self s
    have hge := hge2 s hsmem
    have hsum_eq : (∑ x ∈ B ∩ supportSet G, ((C5LA1.leafDegree G x : ℤ) - 1))
        = (C5LA1.leafDegree G s : ℤ) - 1 := by
      rw [hs, Finset.sum_singleton]
    have : (C5LA1.leafDegree G s : ℤ) - 1 ≤ 1 := by rw [← hsum_eq]; exact hsum_le
    have h2Z : (2 : ℤ) ≤ (C5LA1.leafDegree G s : ℤ) := by exact_mod_cast hge
    have : (C5LA1.leafDegree G s : ℤ) = 2 := by omega
    exact_mod_cast this

end R26LA1
-- VERITYOS ENTRY 112 END

-- VERITYOS ENTRY 113 BEGIN lemma R26LA1.inter_cover 0a162aa250d573db2e7c5bd47d7d8a3eadd8e4822f0ad82c1c9adbdf49d83e98
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma inter_cover (G : SimpleGraph V) [DecidableRel G.Adj] (B : Finset V) :
    B = (B ∩ C5LA1.leafSet G) ∪ (B ∩ supportSet G) ∪ (B ∩ interior G) := by
  ext x
  simp only [Finset.mem_union, Finset.mem_inter, mem_interior_iff]
  tauto

end R26LA1
-- VERITYOS ENTRY 113 END

-- VERITYOS ENTRY 114 BEGIN lemma R26LA1.famI_sum_leafDegree_zero 656e45d2242834dcacfc66db5c9841bec129f691f3c63230892e3c2837a33d06
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famI_sum_leafDegree_zero (G : SimpleGraph V) [DecidableRel G.Adj] {B : Finset V}
    (hBC : B ∩ supportSet G = ∅) : ∑ s ∈ B, (C5LA1.leafDegree G s : ℤ) = 0 := by
  rw [← sum_leafDegree_inter, hBC, Finset.sum_empty]

end R26LA1
-- VERITYOS ENTRY 114 END

-- VERITYOS ENTRY 115 BEGIN lemma R26LA1.family_I_weight 162c2c80964863ff83ff165bafac172ced12278e47c9aaa3bb5db5812dd0b6ff
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-3** `family_I_weight`: every family-(I) member has weight `ℓ − 1`. -/
lemma family_I_weight (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {B : Finset V} (hB : B ∈ famI G) :
    w G B = ((C5LA1.leafSet G).card : ℤ) - 1 := by
  classical
  rw [famI, Finset.mem_filter] at hB
  obtain ⟨hBshell, hBD, hBC⟩ := hB
  have hzero := famI_sum_leafDegree_zero G hBC
  have hid := budget_identity G hTree hAlpha hBshell
  rw [hBC, Finset.sum_empty] at hid
  have hcZ : ((B ∩ interior G).card : ℤ) = (aVal G : ℤ) := by exact_mod_cast hBD
  rw [hcZ, slack, hzero] at hid
  rw [w, hzero]
  linarith

end R26LA1
-- VERITYOS ENTRY 115 END

-- VERITYOS ENTRY 116 BEGIN lemma R26LA1.famI_card_inter_leaf de36b4da79a486e3d3a6262307b08ebf87fb2b2b4d1552cfc61d4c9fc5b43f96
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famI_card_inter_leaf (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) {B : Finset V} (hB : B ∈ famI G) :
    (B ∩ C5LA1.leafSet G).card + 1 = (C5LA1.leafSet G).card := by
  have hw := family_I_weight G hTree hAlpha hB
  rw [famI, Finset.mem_filter] at hB
  have hzero := famI_sum_leafDegree_zero G hB.2.2
  rw [w, hzero] at hw
  have : ((B ∩ C5LA1.leafSet G).card : ℤ) + 1 = ((C5LA1.leafSet G).card : ℤ) := by linarith
  exact_mod_cast this

end R26LA1
-- VERITYOS ENTRY 116 END

-- VERITYOS ENTRY 117 BEGIN lemma R26LA1.family_II_weight 5ff7acd7b56389143d7ed723d45a19366c504abee2cd2b8a99dd797ee2029785
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-3** `family_II_weight`: every family-(II) member has weight `ℓ − 4`. -/
lemma family_II_weight (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    {B : Finset V} (hB : B ∈ famII G) :
    w G B = ((C5LA1.leafSet G).card : ℤ) - 4 := by
  classical
  rw [famII, Finset.mem_filter] at hB
  obtain ⟨hBshell, hBD, hBC⟩ := hB
  rcases family_support_pruned G hTree hAlpha hResidual hBshell hBD with h | ⟨s, hs, hlam⟩
  · exact absurd h hBC
  have hsum : ∑ x ∈ B, (C5LA1.leafDegree G x : ℤ) = 2 := by
    rw [← sum_leafDegree_inter, hs, Finset.sum_singleton, hlam]
    norm_num
  have hid := budget_identity G hTree hAlpha hBshell
  rw [hs, Finset.sum_singleton, hlam] at hid
  have hcZ : ((B ∩ interior G).card : ℤ) = (aVal G : ℤ) := by exact_mod_cast hBD
  rw [hcZ, slack, hsum] at hid
  rw [w, hsum]
  norm_num at hid ⊢
  linarith

end R26LA1
-- VERITYOS ENTRY 117 END

-- VERITYOS ENTRY 118 BEGIN lemma R26LA1.maxIndepInterior_eq d228feef2ea6e37f7a45ce774b5e1501a85215ec973f1dc54666a219b5350aa6
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma maxIndepInterior_eq (G : SimpleGraph V) [DecidableRel G.Adj] :
    maxIndepInterior G = R26CritT.famOneSource G (interior G) (aVal G) := by
  classical
  ext J
  simp only [maxIndepInterior, interiorIndep, R26CritT.famOneSource, Finset.mem_filter,
    Finset.mem_powerset]
  tauto

end R26LA1
-- VERITYOS ENTRY 118 END

-- VERITYOS ENTRY 119 BEGIN lemma R26LA1.disjoint_interior_leafSet 47ffeb7095fc20092de4515fc719fd1455275f1a041bb65f0b9f461b6c43dc4b
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma disjoint_interior_leafSet (G : SimpleGraph V) [DecidableRel G.Adj] :
    Disjoint (interior G) (C5LA1.leafSet G) := (disjoint_leafSet_interior G).symm

end R26LA1
-- VERITYOS ENTRY 119 END

-- VERITYOS ENTRY 120 BEGIN lemma R26LA1.famI_eq_image 9ca777fc48fd63b5edaa4c4bcfc424d139cc62b04096e336b7c7a26145463892
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-3 / item 8(c)** `family_I_count`: family (I) is exactly the image of the
`(J, v) ↦ J ∪ (L ∖ {v})` index product. -/
lemma famI_eq_image (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    famI G = ((R26CritT.famOneSource G (interior G) (aVal G)) ×ˢ (C5LA1.leafSet G)).image
      (R26CritT.famOneMap (C5LA1.leafSet G)) := by
  classical
  have hell : 1 ≤ (C5LA1.leafSet G).card := by
    have := leaf_card_ge_two G hTree hAlpha; omega
  have halpha := alpha_eq_ell_add_a G hTree hAlpha
  ext B
  constructor
  · intro hB
    have hBleaf := famI_card_inter_leaf G hTree hAlpha hB
    rw [famI, Finset.mem_filter] at hB
    obtain ⟨hBshell, hBD, hBC⟩ := hB
    obtain ⟨_, hBind⟩ := mem_topShell_iff G |>.mp hBshell
    -- the omitted leaf
    have hsub : B ∩ C5LA1.leafSet G ⊆ C5LA1.leafSet G := Finset.inter_subset_right
    have hsd : (C5LA1.leafSet G \ (B ∩ C5LA1.leafSet G)).card = 1 := by
      rw [Finset.card_sdiff, Finset.inter_assoc, Finset.inter_self]
      omega
    obtain ⟨v, hv⟩ := Finset.card_eq_one.mp hsd
    have hvL : v ∈ C5LA1.leafSet G := by
      have : v ∈ C5LA1.leafSet G \ (B ∩ C5LA1.leafSet G) := by rw [hv]; exact Finset.mem_singleton_self v
      exact (Finset.mem_sdiff.mp this).1
    have hBLeq : B ∩ C5LA1.leafSet G = (C5LA1.leafSet G).erase v := by
      rw [Finset.erase_eq, ← hv, Finset.sdiff_sdiff_eq_self hsub]
    rw [Finset.mem_image]
    refine ⟨(B ∩ interior G, v), ?_, ?_⟩
    · rw [Finset.mem_product]
      refine ⟨?_, hvL⟩
      rw [← maxIndepInterior_eq, maxIndepInterior, Finset.mem_filter]
      refine ⟨?_, hBD⟩
      rw [mem_interiorIndep_iff]
      exact ⟨Finset.inter_subset_right,
        Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_inter_left hx) hBind⟩
    · rw [R26CritT.famOneMap, ← hBLeq]
      show (B ∩ interior G) ∪ (B ∩ C5LA1.leafSet G) = B
      conv_rhs => rw [inter_cover G B]
      rw [hBC, Finset.union_empty]
      exact Finset.union_comm _ _
  · intro hB
    rw [Finset.mem_image] at hB
    obtain ⟨⟨J, v⟩, hJv, rfl⟩ := hB
    rw [Finset.mem_product, ← maxIndepInterior_eq, maxIndepInterior, Finset.mem_filter] at hJv
    obtain ⟨⟨hJmem, hJcard⟩, hvL⟩ := hJv
    have hJsub : J ⊆ interior G := ((mem_interiorIndep_iff G).mp hJmem).1
    have hdisjJL : Disjoint J ((C5LA1.leafSet G).erase v) :=
      Finset.disjoint_of_subset_left hJsub
        (Finset.disjoint_of_subset_right (Finset.erase_subset _ _)
          (disjoint_interior_leafSet G))
    set B : Finset V := J ∪ (C5LA1.leafSet G).erase v with hB_def
    have hBind : G.IsIndepSet ((B : Finset V) : Set V) := by
      refine Set.Pairwise.mono ?_ (leaf_union_interior_indep G hTree hAlpha hJmem)
      intro x hx
      simp only [hB_def, Finset.coe_union, Set.mem_union, Finset.mem_coe] at hx ⊢
      rcases hx with hx | hx
      · exact Or.inr hx
      · exact Or.inl (Finset.mem_of_mem_erase hx)
    have hBcard : B.card = G.indepNum - 1 := by
      rw [hB_def, Finset.card_union_of_disjoint hdisjJL, Finset.card_erase_of_mem hvL, hJcard,
        halpha]
      omega
    have hBD : B ∩ interior G = J := by
      ext x
      simp only [hB_def, Finset.mem_inter, Finset.mem_union]
      constructor
      · rintro ⟨hx | hx, hxD⟩
        · exact hx
        · exact absurd (Finset.mem_of_mem_erase hx) ((mem_interior_iff G x).mp hxD).1
      · intro hx; exact ⟨Or.inl hx, hJsub hx⟩
    have hBC : B ∩ supportSet G = ∅ := by
      rw [Finset.eq_empty_iff_forall_notMem]
      intro x hx
      rw [Finset.mem_inter] at hx
      obtain ⟨hxB, hxC⟩ := hx
      simp only [hB_def, Finset.mem_union] at hxB
      rcases hxB with hxJ | hxL
      · exact Finset.disjoint_left.mp (disjoint_supportSet_interior G) hxC (hJsub hxJ)
      · exact Finset.disjoint_left.mp (leaf_support_disjoint G hTree hAlpha)
          (Finset.mem_of_mem_erase hxL) hxC
    rw [R26CritT.famOneMap]
    show B ∈ famI G
    rw [famI, Finset.mem_filter]
    exact ⟨(mem_topShell_iff G).mpr ⟨hBcard, hBind⟩, by rw [hBD, hJcard], hBC⟩

end R26LA1
-- VERITYOS ENTRY 120 END

-- VERITYOS ENTRY 121 BEGIN lemma R26LA1.famI_card 4e8552399724759f8ce65452c9c8411d19a1c5035f9c030023368da72c66bae6
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famI_card (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    (famI G).card = (C5LA1.leafSet G).card * (maxIndepInterior G).card := by
  rw [famI_eq_image G hTree hAlpha,
    R26CritT.famOneImageCard G (interior G) (C5LA1.leafSet G) (aVal G)
      (disjoint_interior_leafSet G), maxIndepInterior_eq]

end R26LA1
-- VERITYOS ENTRY 121 END

-- VERITYOS ENTRY 122 BEGIN lemma R26LA1.C1_subset_supportSet 76aa0102b068411ffc04c51dae99e3b635f5d73b9646fc945ed5506bb6c5c0e0
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma C1_subset_supportSet (G : SimpleGraph V) [DecidableRel G.Adj] : C1 G ⊆ supportSet G := by
  intro s hs
  rw [C1, Finset.mem_filter] at hs
  rw [mem_supportSet_iff]
  omega

end R26LA1
-- VERITYOS ENTRY 122 END

-- VERITYOS ENTRY 123 BEGIN lemma R26LA1.C2_subset_supportSet 53024ae9cd53ad028f12bb7b27bcf2dc14971da3fab2d05b96cac39400bc955d
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma C2_subset_supportSet (G : SimpleGraph V) [DecidableRel G.Adj] : C2 G ⊆ supportSet G := by
  intro s hs
  rw [C2, Finset.mem_filter] at hs
  rw [mem_supportSet_iff]
  omega

end R26LA1
-- VERITYOS ENTRY 123 END

-- VERITYOS ENTRY 124 BEGIN lemma R26LA1.card_C1_le_ell f51626929dd59ce37f88a5452f8f2833254e6b430afd3d79ef8ce065bd064241
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma card_C1_le_ell (G : SimpleGraph V) [DecidableRel G.Adj] :
    (C1 G).card ≤ (C5LA1.leafSet G).card := by
  have := R26CritU3T.mul_card_leafDegree_fiber_le_card_leafSet G 1
  simpa [C1] using this

end R26LA1
-- VERITYOS ENTRY 124 END

-- VERITYOS ENTRY 125 BEGIN lemma R26LA1.card_leaf_fiber_eq 1422acfcbad78e2c42856d4340909e136c9672a36d0bf96147eb862e44b1d9fa
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma card_leaf_fiber_eq (G : SimpleGraph V) [DecidableRel G.Adj] (s : V) :
    ((C5LA1.leafSet G).filter fun v => C5LA1.support G v = s).card = C5LA1.leafDegree G s :=
  (C5LA1.leafDegree_eq_filter_support s).symm

end R26LA1
-- VERITYOS ENTRY 125 END

-- VERITYOS ENTRY 126 BEGIN lemma R26LA1.famII_card_inter_leaf 3d7fe24195d62a413e4d104fd4fad43af6c63e113219c49934ff0051e10c2b06
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famII_card_inter_leaf (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    {B : Finset V} (hB : B ∈ famII G) {s : V} (hs : B ∩ supportSet G = {s})
    (hlam : C5LA1.leafDegree G s = 2) :
    (B ∩ C5LA1.leafSet G).card + 2 = (C5LA1.leafSet G).card := by
  classical
  rw [famII, Finset.mem_filter] at hB
  obtain ⟨hBshell, hBD, _⟩ := hB
  have hsum : ∑ x ∈ B, (C5LA1.leafDegree G x : ℤ) = 2 := by
    rw [← sum_leafDegree_inter, hs, Finset.sum_singleton, hlam]; norm_num
  have hid := budget_identity G hTree hAlpha hBshell
  rw [hs, Finset.sum_singleton, hlam] at hid
  have hcZ : ((B ∩ interior G).card : ℤ) = (aVal G : ℤ) := by exact_mod_cast hBD
  rw [hcZ, slack, hsum] at hid
  have : ((B ∩ C5LA1.leafSet G).card : ℤ) + 2 = ((C5LA1.leafSet G).card : ℤ) := by
    norm_num at hid; linarith
  exact_mod_cast this

end R26LA1
-- VERITYOS ENTRY 126 END

-- VERITYOS ENTRY 127 BEGIN lemma R26LA1.famII_subset_image 8371b4fedfe76715039a69cea433db589844dc83817f3428ff4028fc52156eaa
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famII_subset_image (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    famII G ⊆ ((C2 G) ×ˢ (maxIndepInterior G)).image (famIIMap G) := by
  classical
  intro B hB
  have hBmem := hB
  rw [famII, Finset.mem_filter] at hBmem
  obtain ⟨hBshell, hBD, hBCne⟩ := hBmem
  obtain ⟨_, hBind⟩ := mem_topShell_iff G |>.mp hBshell
  rcases family_support_pruned G hTree hAlpha hResidual hBshell hBD with h | ⟨s, hs, hlam⟩
  · exact absurd h hBCne
  have hsB : s ∈ B := by
    have : s ∈ B ∩ supportSet G := by rw [hs]; exact Finset.mem_singleton_self s
    exact Finset.mem_of_mem_inter_left this
  have hleafcard := famII_card_inter_leaf G hTree hAlpha hResidual hB hs hlam
  set F : Finset V := (C5LA1.leafSet G).filter fun v => C5LA1.support G v = s with hF_def
  have hFsub : F ⊆ C5LA1.leafSet G := Finset.filter_subset _ _
  have hFcard : F.card = 2 := by rw [hF_def, card_leaf_fiber_eq, hlam]
  have hBLsub : B ∩ C5LA1.leafSet G ⊆ C5LA1.leafSet G \ F := by
    intro v hv
    rw [Finset.mem_inter] at hv
    refine Finset.mem_sdiff.mpr ⟨hv.2, ?_⟩
    intro hvF
    rw [hF_def, Finset.mem_filter] at hvF
    have hvl : C4LA1.IsGraphLeaf G v := (mem_leafSet_iff G v).mp hv.2
    have hadj : G.Adj v s := hvF.2 ▸ (C5LA1.support_spec hvl).1
    exact (hBind hv.1 hsB (G.ne_of_adj hadj)) hadj
  have hsdcard : (C5LA1.leafSet G \ F).card = (C5LA1.leafSet G).card - 2 := by
    rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hFsub, hFcard]
  have hBLeq : B ∩ C5LA1.leafSet G = C5LA1.leafSet G \ F := by
    refine Finset.eq_of_subset_of_card_le hBLsub ?_
    rw [hsdcard]; omega
  rw [Finset.mem_image]
  refine ⟨(s, B ∩ interior G), ?_, ?_⟩
  · rw [Finset.mem_product]
    constructor
    · rw [C2, Finset.mem_filter]; exact ⟨Finset.mem_univ s, hlam⟩
    · rw [maxIndepInterior, Finset.mem_filter]
      refine ⟨?_, hBD⟩
      rw [mem_interiorIndep_iff]
      exact ⟨Finset.inter_subset_right,
        Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_inter_left hx) hBind⟩
  · rw [famIIMap]
    show insert s ((B ∩ interior G) ∪ (C5LA1.leafSet G \ F)) = B
    rw [← hBLeq]
    conv_rhs => rw [inter_cover G B]
    rw [hs]
    ext x
    simp only [Finset.mem_insert, Finset.mem_union, Finset.mem_singleton]
    tauto

end R26LA1
-- VERITYOS ENTRY 127 END

-- VERITYOS ENTRY 128 BEGIN lemma R26LA1.N2_le_k2_mul_M 0f66de7a458e2151691be54f93f94ced2693e0754d369eda2c2ac0f0a804cd05
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-10** `N2_le_k2_mul_M`: `N₂ ≤ k₂ M`, never `N₂ ≤ M`. -/
lemma N2_le_k2_mul_M (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    N2 G ≤ (C2 G).card * C5LA1.indepSetCount G ∅ G.indepNum := by
  classical
  rw [N2, M_eq_card_maxIndep_D G hTree hAlpha hResidual]
  calc (famII G).card
      ≤ (((C2 G) ×ˢ (maxIndepInterior G)).image (famIIMap G)).card :=
        Finset.card_le_card (famII_subset_image G hTree hAlpha hResidual)
    _ ≤ ((C2 G) ×ˢ (maxIndepInterior G)).card := Finset.card_image_le
    _ = (C2 G).card * (maxIndepInterior G).card := Finset.card_product _ _

end R26LA1
-- VERITYOS ENTRY 128 END

-- VERITYOS ENTRY 129 BEGIN lemma R26LA1.mem_indepPowerset 5d1cb67552842e49960365eb453b71a054259566728915b0f2675cf779f40d8b
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_indepPowerset (G : SimpleGraph V) [DecidableRel G.Adj] {U A : Finset V} :
    A ∈ R26LA1.indepPowerset G U ↔ A ⊆ U ∧ G.IsIndepSet (A : Set V) := by
  simp [R26LA1.indepPowerset]

end R26LA1
-- VERITYOS ENTRY 129 END

-- VERITYOS ENTRY 130 BEGIN lemma R26LA1.mem_USet e256bbd49174b68cd49c6e3cb98a8ee56eb205d4c2292701a9a1c914893c15dc
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma mem_USet (G : SimpleGraph V) [DecidableRel G.Adj] {J : Finset V} {s : V} :
    s ∈ USet G J ↔ s ∈ C1 G ∧ ∀ d ∈ J, ¬ G.Adj s d := by
  simp [USet]

end R26LA1
-- VERITYOS ENTRY 130 END

-- VERITYOS ENTRY 131 BEGIN lemma R26LA1.USet_subset_C1 ebcb852b6d718e468f28b24ca2e25a1b0e802c1628afb222316fa9fc939fe970
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma USet_subset_C1 (G : SimpleGraph V) [DecidableRel G.Adj] (J : Finset V) :
    USet G J ⊆ C1 G := Finset.filter_subset _ _

end R26LA1
-- VERITYOS ENTRY 131 END

-- VERITYOS ENTRY 132 BEGIN lemma R26LA1.card_leaf_fiber_mem 0850d51aa5cc32afa652550093bfadf4ada33aaac8c3d87bae993e0a5def87c3
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `|leaves(A)| = |A|` for `A ⊆ C₁`. -/
lemma card_leaf_fiber_mem (G : SimpleGraph V) [DecidableRel G.Adj] {A : Finset V}
    (hA : A ⊆ C1 G) :
    ((C5LA1.leafSet G).filter fun v => C5LA1.support G v ∈ A).card = A.card := by
  classical
  have hmaps : ∀ v ∈ (C5LA1.leafSet G).filter (fun v => C5LA1.support G v ∈ A),
      C5LA1.support G v ∈ A := fun v hv => (Finset.mem_filter.mp hv).2
  rw [Finset.card_eq_sum_card_fiberwise hmaps]
  have hstep : ∀ s ∈ A,
      (((C5LA1.leafSet G).filter fun v => C5LA1.support G v ∈ A).filter
        fun v => C5LA1.support G v = s).card = 1 := by
    intro s hs
    have heq : (((C5LA1.leafSet G).filter fun v => C5LA1.support G v ∈ A).filter
        fun v => C5LA1.support G v = s)
        = (C5LA1.leafSet G).filter fun v => C5LA1.support G v = s := by
      rw [Finset.filter_filter]
      apply Finset.filter_congr
      intro v _
      constructor
      · rintro ⟨_, h⟩; exact h
      · intro h; exact ⟨h ▸ hs, h⟩
    rw [heq, card_leaf_fiber_eq]
    have := hA hs
    rw [C1, Finset.mem_filter] at this
    exact this.2
  rw [Finset.sum_congr rfl hstep, Finset.sum_const, smul_eq_mul, mul_one]

end R26LA1
-- VERITYOS ENTRY 132 END

-- VERITYOS ENTRY 133 BEGIN lemma R26LA1.famIIIMap_spec ccc1e3eeb9dbd5b92a22fe974928d2b61111e8101aa0c1f6a8772f56b0bce335
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The structural specification of the family-(III) map. -/
lemma famIIIMap_spec (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    {J A : Finset V} (hJ : J ∈ shellD G) (hA : A ∈ R26LA1.indepPowerset G (USet G J)) :
    famIIIMap G ⟨J, A⟩ ∈ famIII G
      ∧ famIIIMap G ⟨J, A⟩ ∩ interior G = J
      ∧ famIIIMap G ⟨J, A⟩ ∩ supportSet G = A
      ∧ w G (famIIIMap G ⟨J, A⟩) = ((C5LA1.leafSet G).card : ℤ) - 2 * (A.card : ℤ) := by
  classical
  rw [shellD, Finset.mem_filter, mem_interiorIndep_iff] at hJ
  obtain ⟨⟨hJsub, hJind⟩, hJcard⟩ := hJ
  rw [mem_indepPowerset] at hA
  obtain ⟨hAsub, hAind⟩ := hA
  have hAC1 : A ⊆ C1 G := hAsub.trans (USet_subset_C1 G J)
  have hAC : A ⊆ supportSet G := hAC1.trans (C1_subset_supportSet G)
  set FA : Finset V := (C5LA1.leafSet G).filter fun v => C5LA1.support G v ∈ A with hFA_def
  have hFAsub : FA ⊆ C5LA1.leafSet G := Finset.filter_subset _ _
  have hFAcard : FA.card = A.card := card_leaf_fiber_mem G hAC1
  have hAle : A.card ≤ (C5LA1.leafSet G).card := by
    rw [← hFAcard]; exact Finset.card_le_card hFAsub
  have hLFcard : (C5LA1.leafSet G \ FA).card = (C5LA1.leafSet G).card - A.card := by
    rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hFAsub, hFAcard]
  set B : Finset V := A ∪ J ∪ (C5LA1.leafSet G \ FA) with hB_def
  have hBeq : famIIIMap G ⟨J, A⟩ = B := rfl
  -- disjointness
  have hdAJ : Disjoint A J :=
    Finset.disjoint_of_subset_left hAC
      (Finset.disjoint_of_subset_right hJsub (disjoint_supportSet_interior G))
  have hdAL : Disjoint A (C5LA1.leafSet G \ FA) :=
    Finset.disjoint_of_subset_left hAC
      (Finset.disjoint_of_subset_right (Finset.sdiff_subset)
        (leaf_support_disjoint G hTree hAlpha).symm)
  have hdJL : Disjoint J (C5LA1.leafSet G \ FA) :=
    Finset.disjoint_of_subset_left hJsub
      (Finset.disjoint_of_subset_right (Finset.sdiff_subset) (disjoint_interior_leafSet G))
  have hdAJL : Disjoint (A ∪ J) (C5LA1.leafSet G \ FA) := Finset.disjoint_union_left.mpr ⟨hdAL, hdJL⟩
  -- independence
  have hAJind : G.IsIndepSet ((A ∪ J : Finset V) : Set V) := by
    refine R26LA1.isIndepSet_union_of_no_cross_adj hAind hJind ?_
    intro s hs d hd
    exact ((mem_USet G).mp (hAsub hs)).2 d hd
  have hLFind : G.IsIndepSet (((C5LA1.leafSet G \ FA : Finset V)) : Set V) :=
    Set.Pairwise.mono (by intro x hx; exact Finset.mem_sdiff.mp hx |>.1)
      (leafSet_indep G hTree hAlpha)
  have hBind : G.IsIndepSet ((B : Finset V) : Set V) := by
    refine R26LA1.isIndepSet_union_of_no_cross_adj hAJind hLFind ?_
    intro x hx y hy hadj
    rw [Finset.mem_union] at hx
    rw [Finset.mem_sdiff] at hy
    rcases hx with hxA | hxJ
    · have hyl : C4LA1.IsGraphLeaf G y := (mem_leafSet_iff G y).mp hy.1
      have : C5LA1.support G y = x := (C5LA1.adj_iff_support_eq hyl).1 hadj.symm
      exact hy.2 (Finset.mem_filter.mpr ⟨hy.1, this ▸ hxA⟩)
    · exact no_edge_interior_leaf G (hJsub hxJ) hy.1 hadj
  -- intersections
  have hBD : B ∩ interior G = J := by
    ext x
    simp only [hB_def, Finset.mem_inter, Finset.mem_union, Finset.mem_sdiff]
    constructor
    · rintro ⟨(hx | hx) | hx, hxD⟩
      · exact absurd (hAC hx) ((mem_interior_iff G x).mp hxD).2
      · exact hx
      · exact absurd hx.1 ((mem_interior_iff G x).mp hxD).1
    · intro hx; exact ⟨Or.inl (Or.inr hx), hJsub hx⟩
  have hBC : B ∩ supportSet G = A := by
    ext x
    simp only [hB_def, Finset.mem_inter, Finset.mem_union, Finset.mem_sdiff]
    constructor
    · rintro ⟨(hx | hx) | hx, hxC⟩
      · exact hx
      · exact absurd hxC (Finset.disjoint_left.mp (disjoint_supportSet_interior G) · (hJsub hx))
      · exact absurd hxC (Finset.disjoint_left.mp (leaf_support_disjoint G hTree hAlpha) hx.1)
    · intro hx; exact ⟨Or.inl (Or.inl hx), hAC hx⟩
  have hBL : B ∩ C5LA1.leafSet G = C5LA1.leafSet G \ FA := by
    ext x
    simp only [hB_def, Finset.mem_inter, Finset.mem_union, Finset.mem_sdiff]
    constructor
    · rintro ⟨(hx | hx) | hx, hxL⟩
      · exact absurd (hAC hx) (Finset.disjoint_left.mp (leaf_support_disjoint G hTree hAlpha) hxL)
      · exact absurd hxL (Finset.disjoint_left.mp (disjoint_interior_leafSet G) (hJsub hx))
      · exact hx
    · intro hx; exact ⟨Or.inr hx, hx.1⟩
  -- cardinality
  have hBcard : B.card = G.indepNum - 1 := by
    rw [hB_def, Finset.card_union_of_disjoint hdAJL, Finset.card_union_of_disjoint hdAJ,
      hLFcard, alpha_eq_ell_add_a G hTree hAlpha]
    omega
  have hBshell : B ∈ topShell G := (mem_topShell_iff G).mpr ⟨hBcard, hBind⟩
  -- the weight
  have hsumlam : ∑ s ∈ B, (C5LA1.leafDegree G s : ℤ) = (A.card : ℤ) := by
    rw [← sum_leafDegree_inter, hBC]
    have : ∀ s ∈ A, (C5LA1.leafDegree G s : ℤ) = 1 := by
      intro s hs
      have := hAC1 hs
      rw [C1, Finset.mem_filter] at this
      rw [this.2]; norm_num
    rw [Finset.sum_congr rfl this, Finset.sum_const, nsmul_eq_mul, mul_one]
  have hwB : w G B = ((C5LA1.leafSet G).card : ℤ) - 2 * (A.card : ℤ) := by
    rw [w, hBL, hsumlam, hLFcard]
    have : ((C5LA1.leafSet G).card - A.card : ℕ) = ((C5LA1.leafSet G).card : ℤ) - (A.card : ℤ) := by
      omega
    rw [this]; ring
  rw [hBeq]
  refine ⟨?_, hBD, hBC, hwB⟩
  rw [famIII, Finset.mem_filter]
  exact ⟨hBshell, by rw [hBD]; omega⟩

end R26LA1
-- VERITYOS ENTRY 133 END

-- VERITYOS ENTRY 134 BEGIN lemma R26LA1.famIII_subset_image 5c135bfa0985c072047ae02063e546ecb62f0d52e3875d9fe2ac600f5808a86a
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-4** `family_III_bijection`, forward half: every family-(III) member is `Φ(J, A)` for a
unique index pair, with outer index the `a − 1` shell (never the maximum shell). -/
lemma famIII_subset_image (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    famIII G ⊆ (famIIIIndex G).image (famIIIMap G) := by
  classical
  intro B hB
  rw [famIII, Finset.mem_filter] at hB
  obtain ⟨hBshell, hBDne⟩ := hB
  obtain ⟨_, hBind⟩ := mem_topShell_iff G |>.mp hBshell
  rcases budget_shapes G hTree hAlpha hBshell with ⟨hc, _, _⟩ | ⟨hc, _, _⟩ | ⟨hc, hslack, hsupp⟩
  · exact absurd hc hBDne
  · exact absurd hc hBDne
  set J : Finset V := B ∩ interior G with hJ_def
  set A : Finset V := B ∩ supportSet G with hA_def
  have hJind : G.IsIndepSet ((J : Finset V) : Set V) :=
    Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_inter_left hx) hBind
  have hAind : G.IsIndepSet ((A : Finset V) : Set V) :=
    Set.Pairwise.mono (by intro x hx; exact Finset.mem_of_mem_inter_left hx) hBind
  have hJcard : J.card + 1 = aVal G := by exact_mod_cast hc
  -- every support used carries `λ = 1`
  have hlam1 : ∀ s ∈ A, C5LA1.leafDegree G s = 1 := by
    intro s hs
    have hnn : ∀ x ∈ A, (0 : ℤ) ≤ (C5LA1.leafDegree G x : ℤ) - 1 := by
      intro x hx
      have : 0 < C5LA1.leafDegree G x :=
        (mem_supportSet_iff G x).mp (Finset.mem_of_mem_inter_right hx)
      have : (1 : ℤ) ≤ (C5LA1.leafDegree G x : ℤ) := by exact_mod_cast this
      linarith
    have := (Finset.sum_eq_zero_iff_of_nonneg hnn).mp hsupp s hs
    have : (C5LA1.leafDegree G s : ℤ) = 1 := by linarith
    exact_mod_cast this
  have hAC1 : A ⊆ C1 G := by
    intro s hs
    rw [C1, Finset.mem_filter]
    exact ⟨Finset.mem_univ s, hlam1 s hs⟩
  have hAU : A ⊆ USet G J := by
    intro s hs
    rw [mem_USet]
    refine ⟨hAC1 hs, ?_⟩
    intro d hd hadj
    exact (hBind (Finset.mem_of_mem_inter_left hs) (Finset.mem_of_mem_inter_left hd)
      (G.ne_of_adj hadj)) hadj
  -- the leaves used are exactly the leaves not attached to `A`
  set FA : Finset V := (C5LA1.leafSet G).filter fun v => C5LA1.support G v ∈ A with hFA_def
  have hFAsub : FA ⊆ C5LA1.leafSet G := Finset.filter_subset _ _
  have hFAcard : FA.card = A.card := card_leaf_fiber_mem G hAC1
  have hsumlam : ∑ s ∈ B, (C5LA1.leafDegree G s : ℤ) = (A.card : ℤ) := by
    rw [← sum_leafDegree_inter, ← hA_def]
    have : ∀ s ∈ A, (C5LA1.leafDegree G s : ℤ) = 1 := by
      intro s hs; rw [hlam1 s hs]; norm_num
    rw [Finset.sum_congr rfl this, Finset.sum_const, nsmul_eq_mul, mul_one]
  have hBLcard : ((B ∩ C5LA1.leafSet G).card : ℤ) = ((C5LA1.leafSet G).card : ℤ) - (A.card : ℤ) := by
    rw [slack, hsumlam] at hslack; linarith
  have hLFcard : (C5LA1.leafSet G \ FA).card = (C5LA1.leafSet G).card - A.card := by
    rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hFAsub, hFAcard]
  have hBLsub : B ∩ C5LA1.leafSet G ⊆ C5LA1.leafSet G \ FA := by
    intro v hv
    rw [Finset.mem_inter] at hv
    refine Finset.mem_sdiff.mpr ⟨hv.2, ?_⟩
    intro hvFA
    rw [hFA_def, Finset.mem_filter] at hvFA
    have hvl : C4LA1.IsGraphLeaf G v := (mem_leafSet_iff G v).mp hv.2
    have hadj : G.Adj v (C5LA1.support G v) := (C5LA1.support_spec hvl).1
    exact (hBind hv.1 (Finset.mem_of_mem_inter_left hvFA.2) (G.ne_of_adj hadj)) hadj
  have hBLeq : B ∩ C5LA1.leafSet G = C5LA1.leafSet G \ FA := by
    refine Finset.eq_of_subset_of_card_le hBLsub ?_
    have h1 : ((B ∩ C5LA1.leafSet G).card : ℤ) = ((C5LA1.leafSet G).card : ℤ) - (A.card : ℤ) :=
      hBLcard
    have h2 : A.card ≤ (C5LA1.leafSet G).card := by
      rw [← hFAcard]; exact Finset.card_le_card hFAsub
    omega
  rw [Finset.mem_image]
  refine ⟨⟨J, A⟩, ?_, ?_⟩
  · rw [famIIIIndex, Finset.mem_sigma]
    constructor
    · rw [shellD, Finset.mem_filter, mem_interiorIndep_iff]
      exact ⟨⟨Finset.inter_subset_right, hJind⟩, hJcard⟩
    · rw [mem_indepPowerset]; exact ⟨hAU, hAind⟩
  · show A ∪ J ∪ (C5LA1.leafSet G \ FA) = B
    rw [← hBLeq]
    conv_rhs => rw [inter_cover G B]
    ext x
    simp only [Finset.mem_union, ← hJ_def, ← hA_def]
    tauto

end R26LA1
-- VERITYOS ENTRY 134 END

-- VERITYOS ENTRY 135 BEGIN lemma R26LA1.famIII_eq_image 8619703e9919bf08280d56d73faadbe7cbefc782d56ab38927101adf518f7c76
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famIII_eq_image (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    famIII G = (famIIIIndex G).image (famIIIMap G) := by
  refine Finset.Subset.antisymm (famIII_subset_image G hTree hAlpha) ?_
  intro B hB
  rw [Finset.mem_image] at hB
  obtain ⟨⟨J, A⟩, hx, rfl⟩ := hB
  rw [famIIIIndex, Finset.mem_sigma] at hx
  exact (famIIIMap_spec G hTree hAlpha hx.1 hx.2).1

end R26LA1
-- VERITYOS ENTRY 135 END

-- VERITYOS ENTRY 136 BEGIN lemma R26LA1.famIIIMap_injOn 80ade0535dc766761c0b6c55ea6ddc4945f97b56f4e3fdb3f6fe966a4cfabdbb
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famIIIMap_injOn (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    ∀ x ∈ famIIIIndex G, ∀ y ∈ famIIIIndex G, famIIIMap G x = famIIIMap G y → x = y := by
  rintro ⟨J1, A1⟩ h1 ⟨J2, A2⟩ h2 heq
  rw [famIIIIndex, Finset.mem_sigma] at h1 h2
  obtain ⟨_, hJ1, hA1, _⟩ := famIIIMap_spec G hTree hAlpha h1.1 h1.2
  obtain ⟨_, hJ2, hA2, _⟩ := famIIIMap_spec G hTree hAlpha h2.1 h2.2
  have e1 : famIIIMap G ⟨J1, A1⟩ ∩ interior G = J1 := hJ1
  have e2 : famIIIMap G ⟨J2, A2⟩ ∩ interior G = J2 := hJ2
  have f1 : famIIIMap G ⟨J1, A1⟩ ∩ supportSet G = A1 := hA1
  have f2 : famIIIMap G ⟨J2, A2⟩ ∩ supportSet G = A2 := hA2
  have hJ : J1 = J2 := by rw [← e1, ← e2, heq]
  have hA : A1 = A2 := by rw [← f1, ← f2, heq]
  subst hJ; subst hA; rfl

end R26LA1
-- VERITYOS ENTRY 136 END

-- VERITYOS ENTRY 137 BEGIN lemma R26LA1.fibre_nonneg eeb6b0895bdced2ad3211b0249aa6d738c46ce2efe08a6b2d96e76978c6d8cfa
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-5** `fibre_nonneg`: `|U(J)| ≤ |C₁| ≤ ℓ`, so each fibre sum is nonnegative. -/
lemma fibre_nonneg (G : SimpleGraph V) [DecidableRel G.Adj] (J : Finset V) :
    (0 : ℤ) ≤ ∑ A ∈ R26LA1.indepPowerset G (USet G J),
      (((C5LA1.leafSet G).card : ℤ) - 2 * (A.card : ℤ)) := by
  have hsharp := R26CritF.fibreInequalitySharp G (USet G J) (C5LA1.leafSet G).card
  have hU : (USet G J).card ≤ (C5LA1.leafSet G).card :=
    le_trans (Finset.card_le_card (USet_subset_C1 G J)) (card_C1_le_ell G)
  have hUZ : ((USet G J).card : ℤ) ≤ ((C5LA1.leafSet G).card : ℤ) := by exact_mod_cast hU
  have hcard : (0 : ℤ) ≤ ((R26LA1.indepPowerset G (USet G J)).card : ℤ) := Int.natCast_nonneg _
  nlinarith [hsharp, hUZ, hcard]

end R26LA1
-- VERITYOS ENTRY 137 END

-- VERITYOS ENTRY 138 BEGIN lemma R26LA1.famIII_sum_nonneg 13453b950efdd67faff829b4001058672c3b11b47e7afc12add4c4b8c1e2c2d0
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `W_III ≥ 0`: the family-(III) weight sum is nonnegative. -/
lemma famIII_sum_nonneg (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) :
    (0 : ℤ) ≤ ∑ B ∈ famIII G, w G B := by
  classical
  rw [famIII_eq_image G hTree hAlpha,
    Finset.sum_image (famIIIMap_injOn G hTree hAlpha)]
  have hcongr : ∀ x ∈ famIIIIndex G,
      w G (famIIIMap G x) = ((C5LA1.leafSet G).card : ℤ) - 2 * (x.2.card : ℤ) := by
    rintro ⟨J, A⟩ hx
    rw [famIIIIndex, Finset.mem_sigma] at hx
    exact (famIIIMap_spec G hTree hAlpha hx.1 hx.2).2.2.2
  rw [Finset.sum_congr rfl hcongr, famIIIIndex, Finset.sum_sigma]
  exact Finset.sum_nonneg fun J _ => fibre_nonneg G J

end R26LA1
-- VERITYOS ENTRY 138 END

-- VERITYOS ENTRY 139 BEGIN lemma R26LA1.W_split f1fdf29a154bf28e3248a6b2d91b27f7ce0c4dadd80bf5a2903357972dfdffae
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The three families partition the top shell. -/
lemma W_split (G : SimpleGraph V) [DecidableRel G.Adj] :
    ∑ B ∈ topShell G, w G B
      = ∑ B ∈ famI G, w G B + ∑ B ∈ famII G, w G B + ∑ B ∈ famIII G, w G B := by
  classical
  have h1 := Finset.sum_filter_add_sum_filter_not (topShell G)
    (fun B => (B ∩ interior G).card = aVal G) (w G)
  have h2 := Finset.sum_filter_add_sum_filter_not
    ((topShell G).filter (fun B => (B ∩ interior G).card = aVal G))
    (fun B => B ∩ supportSet G = ∅) (w G)
  have e1 : ((topShell G).filter (fun B => (B ∩ interior G).card = aVal G)).filter
      (fun B => B ∩ supportSet G = ∅) = famI G := by
    rw [famI, Finset.filter_filter]
  have e2 : ((topShell G).filter (fun B => (B ∩ interior G).card = aVal G)).filter
      (fun B => ¬ (B ∩ supportSet G = ∅)) = famII G := by
    rw [famII, Finset.filter_filter]
  have e3 : (topShell G).filter (fun B => ¬ ((B ∩ interior G).card = aVal G)) = famIII G := by
    rw [famIII]
  rw [e1, e2] at h2
  rw [e3] at h1
  linarith [h1, h2]

end R26LA1
-- VERITYOS ENTRY 139 END

-- VERITYOS ENTRY 140 BEGIN lemma R26LA1.famI_sum b654de2795102aab5394bef931cfc2eed9adee992bb8788c00a77f9472ccecb3
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famI_sum (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    ∑ B ∈ famI G, w G B
      = ((C5LA1.leafSet G).card : ℤ) * (C5LA1.indepSetCount G ∅ G.indepNum : ℤ)
        * (((C5LA1.leafSet G).card : ℤ) - 1) := by
  classical
  rw [Finset.sum_congr rfl (fun B hB => family_I_weight G hTree hAlpha hB), Finset.sum_const,
    nsmul_eq_mul, famI_card G hTree hAlpha, M_eq_card_maxIndep_D G hTree hAlpha hResidual]
  push_cast
  ring

end R26LA1
-- VERITYOS ENTRY 140 END

-- VERITYOS ENTRY 141 BEGIN lemma R26LA1.famII_sum f69cca93de0402dbec9a53d0df3a3bc8e19f9935e125138580e7ee4755b68a0e
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma famII_sum (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    ∑ B ∈ famII G, w G B = (N2 G : ℤ) * (((C5LA1.leafSet G).card : ℤ) - 4) := by
  classical
  rw [Finset.sum_congr rfl (fun B hB => family_II_weight G hTree hAlpha hResidual hB),
    Finset.sum_const, nsmul_eq_mul, N2]

end R26LA1
-- VERITYOS ENTRY 141 END

-- VERITYOS ENTRY 142 BEGIN lemma R26LA1.sign_bound 63c6047e91a3c76a70edf1f3a0e75950bb8ebbf2e378176528a3259f185783e1
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **`node-sign-bound`**: `S ≤ −ℓ(ℓ−2)M − (ℓ−4)N₂` in `ℤ`. -/
lemma sign_bound (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    C5LA1.aggregate G (G.indepNum - 1)
      ≤ -(((C5LA1.leafSet G).card : ℤ) * (((C5LA1.leafSet G).card : ℤ) - 2))
            * (C5LA1.indepSetCount G ∅ G.indepNum : ℤ)
          - (((C5LA1.leafSet G).card : ℤ) - 4) * (N2 G : ℤ) := by
  classical
  have hRI := C5LA1.topRankResidualIdentity G hTree hAlpha hEligible hResidual
  have hW : ∑ B ∈ C5LA1.indepSetsAvoiding G ∅ (G.indepNum - 1),
      (((B ∩ C5LA1.leafSet G).card : ℤ) - ∑ s ∈ B, (C5LA1.leafDegree G s : ℤ))
      = ∑ B ∈ topShell G, w G B := rfl
  rw [hW, W_split G, famI_sum G hTree hAlpha hResidual,
    famII_sum G hTree hAlpha hResidual] at hRI
  have h3 := famIII_sum_nonneg G hTree hAlpha
  rw [hRI]
  nlinarith [h3]

end R26LA1
-- VERITYOS ENTRY 142 END

-- VERITYOS ENTRY 143 BEGIN lemma R26LA1.ell_two_lambda_two_imp_alpha_two 4f9537bfc4283f27c73b68f2b9be768698f7ed4345c73d60b672f9bc01ec0e28
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **L-7** `ell_two_lambda_two_imp_alpha_two`. -/
lemma ell_two_lambda_two_imp_alpha_two (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hLeafCard : (C5LA1.leafSet G).card = 2) {s : V}
    (hDeg2 : C5LA1.leafDegree G s = 2) : G.indepNum = 2 :=
  R26U3.leafDegree_two_indepNum_eq_two G hTree hLeafCard hDeg2

end R26LA1
-- VERITYOS ENTRY 143 END

-- VERITYOS ENTRY 144 BEGIN lemma R26LA1.C2_card_eq_zero_of_alpha_three 47581ea7292e450055c5a1c1465cd228977383fbd80aa1fc12e749a3fa49ee89
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `k₂ = 0` when `ℓ = 2` and `α ≥ 3`; this is the only consumption of `hyp-eligible`. -/
lemma C2_card_eq_zero_of_alpha_three (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha3 : 3 ≤ G.indepNum) (hell : (C5LA1.leafSet G).card = 2) :
    (C2 G).card = 0 := by
  classical
  rw [C2, Finset.card_eq_zero]
  apply Finset.filter_false_of_mem
  intro s _ hlam
  have := ell_two_lambda_two_imp_alpha_two G hTree hell hlam
  omega

end R26LA1
-- VERITYOS ENTRY 144 END

-- VERITYOS ENTRY 145 BEGIN lemma R26LA1.finish_ell_ge_four e01f7d0f120b8261ff0a445c8d179c7028bb2ecd663b86c413c9643fcb28a35f
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma finish_ell_ge_four (G : SimpleGraph V) [DecidableRel G.Adj]
    (hell : 4 ≤ (C5LA1.leafSet G).card)
    (hbound : C5LA1.aggregate G (G.indepNum - 1)
      ≤ -(((C5LA1.leafSet G).card : ℤ) * (((C5LA1.leafSet G).card : ℤ) - 2))
            * (C5LA1.indepSetCount G ∅ G.indepNum : ℤ)
          - (((C5LA1.leafSet G).card : ℤ) - 4) * (N2 G : ℤ)) :
    C5LA1.aggregate G (G.indepNum - 1) ≤ 0 := by
  have hellZ : (4 : ℤ) ≤ ((C5LA1.leafSet G).card : ℤ) := by exact_mod_cast hell
  have hM : (0 : ℤ) ≤ (C5LA1.indepSetCount G ∅ G.indepNum : ℤ) := Int.natCast_nonneg _
  have hN : (0 : ℤ) ≤ (N2 G : ℤ) := Int.natCast_nonneg _
  have h1 : (0 : ℤ) ≤ ((C5LA1.leafSet G).card : ℤ) * (((C5LA1.leafSet G).card : ℤ) - 2) :=
    mul_nonneg (by linarith) (by linarith)
  have h2 : (0 : ℤ) ≤ (((C5LA1.leafSet G).card : ℤ) * (((C5LA1.leafSet G).card : ℤ) - 2))
      * (C5LA1.indepSetCount G ∅ G.indepNum : ℤ) := mul_nonneg h1 hM
  have h3 : (0 : ℤ) ≤ (((C5LA1.leafSet G).card : ℤ) - 4) * (N2 G : ℤ) :=
    mul_nonneg (by linarith) hN
  linarith [hbound, h2, h3]

end R26LA1
-- VERITYOS ENTRY 145 END

-- VERITYOS ENTRY 146 BEGIN lemma R26LA1.finish_ell_three 290f16772b00d3c181b56ef550a57553a2b5383261f06fecf7038912d3f8c0b7
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma finish_ell_three (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    (hell : (C5LA1.leafSet G).card = 3)
    (hbound : C5LA1.aggregate G (G.indepNum - 1)
      ≤ -(((C5LA1.leafSet G).card : ℤ) * (((C5LA1.leafSet G).card : ℤ) - 2))
            * (C5LA1.indepSetCount G ∅ G.indepNum : ℤ)
          - (((C5LA1.leafSet G).card : ℤ) - 4) * (N2 G : ℤ)) :
    C5LA1.aggregate G (G.indepNum - 1) ≤ 0 := by
  have hk2 : 2 * (C2 G).card ≤ 3 := by rw [← hell]; exact k2_le_ell_div_two G
  have hN2 := N2_le_k2_mul_M G hTree hAlpha hResidual
  have hk2le : (C2 G).card ≤ 1 := by omega
  have hNle : N2 G ≤ C5LA1.indepSetCount G ∅ G.indepNum :=
    le_trans hN2 (by simpa using Nat.mul_le_mul_right _ hk2le)
  have hNleZ : (N2 G : ℤ) ≤ (C5LA1.indepSetCount G ∅ G.indepNum : ℤ) := by exact_mod_cast hNle
  have hM : (0 : ℤ) ≤ (C5LA1.indepSetCount G ∅ G.indepNum : ℤ) := Int.natCast_nonneg _
  rw [hell] at hbound
  push_cast at hbound
  linarith [hbound, hNleZ, hM]

end R26LA1
-- VERITYOS ENTRY 146 END

-- VERITYOS ENTRY 147 BEGIN lemma R26LA1.finish_ell_two 0a4cd55ee3cacdf24250b742be56344f220645029fa3716bd413459782f8ef87
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma finish_ell_two (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S)
    (hAlpha3 : 3 ≤ G.indepNum) (hell : (C5LA1.leafSet G).card = 2)
    (hbound : C5LA1.aggregate G (G.indepNum - 1)
      ≤ -(((C5LA1.leafSet G).card : ℤ) * (((C5LA1.leafSet G).card : ℤ) - 2))
            * (C5LA1.indepSetCount G ∅ G.indepNum : ℤ)
          - (((C5LA1.leafSet G).card : ℤ) - 4) * (N2 G : ℤ)) :
    C5LA1.aggregate G (G.indepNum - 1) ≤ 0 := by
  have hk2 : (C2 G).card = 0 := C2_card_eq_zero_of_alpha_three G hTree hAlpha3 hell
  have hN2 := N2_le_k2_mul_M G hTree hAlpha hResidual
  rw [hk2] at hN2
  have hN0 : N2 G = 0 := by omega
  rw [hell, hN0] at hbound
  push_cast at hbound
  linarith [hbound]

end R26LA1
-- VERITYOS ENTRY 147 END

-- VERITYOS ENTRY 148 BEGIN theorem R26LA1.topRankResidualSign a665cbe719b16daf15c8b86f17b7e5db8f44c3d06d75ca4388155f774e12e917
namespace R26LA1

open SimpleGraph C4LA1 C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **The (RC) award.**  The top-rank residual aggregate of an eligible residual tree is
nonpositive. -/
theorem topRankResidualSign (G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree)
    (hAlpha : 2 ≤ G.indepNum) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    aggregate G (G.indepNum - 1) ≤ 0 := by
  classical
  have hbound := sign_bound G hTree hAlpha hEligible hResidual
  have hell2 : 2 ≤ (C5LA1.leafSet G).card := leaf_card_ge_two G hTree hAlpha
  rcases Nat.lt_or_ge (C5LA1.leafSet G).card 4 with hlt | hge
  · have h23 : (C5LA1.leafSet G).card = 2 ∨ (C5LA1.leafSet G).card = 3 := by omega
    rcases h23 with h | h
    · exact finish_ell_two G hTree hAlpha hResidual
        (eligible_imp_alpha_ge_three G hEligible) h hbound
    · exact finish_ell_three G hTree hAlpha hResidual h hbound
  · exact finish_ell_ge_four G hge hbound

end R26LA1
-- VERITYOS ENTRY 148 END

