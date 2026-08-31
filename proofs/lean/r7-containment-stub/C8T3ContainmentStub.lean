import Mathlib

open scoped BigOperators

namespace C8T3ContainmentStub

open Finset SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- Independent `s`-subsets of the active vertex set `U`. -/
def independentSetsOn (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (s : Nat) : Finset (Finset V) :=
  (U.powersetCard s).filter fun Z => G.IsIndepSet (Z : Set V)

def independentCountOn (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (s : Nat) : Nat :=
  (independentSetsOn G U s).card

def deltaOn (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) : Int :=
  (independentCountOn G U (r + 1) : Int) - independentCountOn G U r

/-- `U \ N_G[Z]`, represented as a finite active vertex set. -/
def extensionVerts (G : SimpleGraph V) [DecidableRel G.Adj]
    (U Z : Finset V) : Finset V :=
  U.filter fun x => x ∉ Z ∧ ∀ z ∈ Z, ¬G.Adj x z

/-- The induced extension graph required by the contract. -/
def extensionGraph (G : SimpleGraph V) [DecidableRel G.Adj]
    (U Z : Finset V) : SimpleGraph {x // x ∈ extensionVerts G U Z} :=
  G.induce (extensionVerts G U Z : Set V)

def extensionVertexCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (U Z : Finset V) : Nat :=
  (extensionVerts G U Z).card

noncomputable def extensionEdgeCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (U Z : Finset V) : Nat :=
  Nat.card (extensionGraph G U Z).edgeSet

noncomputable def extensionComponentCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (U Z : Finset V) : Nat :=
  Nat.card (extensionGraph G U Z).ConnectedComponent

noncomputable def rho (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) (Z : Finset V) : Int :=
  let e : Int := extensionVertexCount G U Z
  let m : Int := extensionEdgeCount G U Z
  e * (e - r - 2) - 2 * m

def containmentDegree (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (q : Nat) (P : Finset V) : Nat :=
  ((independentSetsOn G U (q - 1)).filter fun Q => P ⊆ Q).card

/-- The `X` sum over genuine rows, with one full-charge stub at degree zero. -/
noncomputable def xMarginal (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (p q : Nat) : Rat :=
  ∑ P ∈ independentSetsOn G U (p - 1),
    if containmentDegree G U q P = 0 then (rho G U p P : Rat)
    else
      ∑ _Q ∈ (independentSetsOn G U (q - 1)).filter fun Q => P ⊆ Q,
        (rho G U p P : Rat) / containmentDegree G U q P

/-- The `Y` sum over genuine rows; stubs have zero `Y`-weight. -/
noncomputable def yMarginal (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (p q : Nat) : Rat :=
  ∑ Q ∈ independentSetsOn G U (q - 1),
    ∑ _P ∈ Q.powersetCard (p - 1),
      (rho G U q Q : Rat) / Nat.choose (q - 1) (p - 1)

def leafSet (G : SimpleGraph V) [DecidableRel G.Adj] : Finset V :=
  Finset.univ.filter fun v => G.degree v = 1

def aVerts (v : V) : Finset V := Finset.univ.erase v

def bVerts (v w : V) : Finset V := (Finset.univ.erase v).erase w

noncomputable def supportVertex (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : V :=
  if h : G.degree v = 1 then
    (degree_eq_one_iff_existsUnique_adj.mp h).exists.choose
  else v

noncomputable def gamma (G : SimpleGraph V) [DecidableRel G.Adj] (r : Nat) : Int :=
  ∑ v ∈ leafSet G, deltaOn G (bVerts v (supportVertex G v)) (r - 1)

noncomputable def globalD (G : SimpleGraph V) [DecidableRel G.Adj] (r : Nat) : Int :=
  (r : Int) * (r + 1) *
    (gamma G r - (leafSet G).card * deltaOn G Finset.univ r)

@[simp] theorem mem_independentSetsOn {G : SimpleGraph V} [DecidableRel G.Adj]
    {U Z : Finset V} {s : Nat} :
    Z ∈ independentSetsOn G U s ↔ Z ⊆ U ∧ Z.card = s ∧ G.IsIndepSet (Z : Set V) := by
  simp [independentSetsOn, and_assoc]

@[simp] theorem mem_extensionVerts {G : SimpleGraph V} [DecidableRel G.Adj]
    {U Z : Finset V} {x : V} :
    x ∈ extensionVerts G U Z ↔ x ∈ U ∧ x ∉ Z ∧ ∀ z ∈ Z, ¬G.Adj x z := by
  simp [extensionVerts, and_assoc]

theorem extensionVerts_anti {G : SimpleGraph V} [DecidableRel G.Adj]
    {U P Q : Finset V} (hPQ : P ⊆ Q) :
    extensionVerts G U Q ⊆ extensionVerts G U P := by
  intro x hx
  rw [mem_extensionVerts] at hx ⊢
  exact ⟨hx.1, fun hxP => hx.2.1 (hPQ hxP),
    fun z hz => hx.2.2 z (hPQ hz)⟩

theorem supportVertex_spec {G : SimpleGraph V} [DecidableRel G.Adj]
    {v : V} (hv : G.degree v = 1) :
    G.Adj v (supportVertex G v) ∧
      ∀ w, G.Adj v w → w = supportVertex G v := by
  classical
  rw [supportVertex, dif_pos hv]
  let h := degree_eq_one_iff_existsUnique_adj.mp hv
  exact ⟨h.exists.choose_spec,
    fun w hw => h.unique hw h.exists.choose_spec⟩

/-- Vertices are the disjoint union of the supports of their connected components. -/
noncomputable def vertexComponentEquiv (G : SimpleGraph V) :
    (Σ c : G.ConnectedComponent, c) ≃ V where
  toFun x := x.2.1
  invFun v := ⟨G.connectedComponentMk v, ⟨v, rfl⟩⟩
  left_inv x := by
    rcases x with ⟨c, ⟨v, hv⟩⟩
    simp only
    have hc : G.connectedComponentMk v = c := hv
    subst c
    rfl
  right_inv _ := rfl

/-- Edges are the disjoint union of the edge sets of the connected components. -/
noncomputable def componentEdgeEquiv (G : SimpleGraph V) :
    (Σ c : G.ConnectedComponent, c.toSimpleGraph.edgeSet) ≃ G.edgeSet := by
  classical
  let f : (Σ c : G.ConnectedComponent, c.toSimpleGraph.edgeSet) → G.edgeSet :=
    fun x => x.1.toSimpleGraph_hom.mapEdgeSet x.2
  apply Equiv.ofBijective f
  constructor
  · rintro ⟨c, e⟩ ⟨d, f'⟩ hef
    have he_mem : (e.val.out.1.val : V) ∈
        (c.toSimpleGraph_hom.mapEdgeSet e).val := by
      exact Sym2.mem_map.mpr ⟨e.val.out.1, Sym2.out_fst_mem e.val, rfl⟩
    have hefval := congrArg Subtype.val hef
    change (c.toSimpleGraph_hom.mapEdgeSet e).val =
      (d.toSimpleGraph_hom.mapEdgeSet f').val at hefval
    have hf_mem : (e.val.out.1.val : V) ∈
        (d.toSimpleGraph_hom.mapEdgeSet f').val := by
      rw [← hefval]
      exact he_mem
    obtain ⟨z, hz, hzval⟩ := Sym2.mem_map.mp hf_mem
    have hcd : c = d := ConnectedComponent.eq_of_common_vertex e.val.out.1.property <| by
      rw [← hzval]
      exact z.property
    subst d
    have heq : e = f' :=
      Hom.mapEdgeSet.injective c.toSimpleGraph_hom Subtype.val_injective hef
    subst f'
    rfl
  · intro e
    let a : V := e.val.out.1
    let b : V := e.val.out.2
    have hab : G.Adj a b := by
      rw [← mem_edgeSet]
      simpa [a, b, e.val.out_eq] using e.property
    let c : G.ConnectedComponent := G.connectedComponentMk a
    have ha : a ∈ c.supp := rfl
    have hb : b ∈ c.supp := by
      exact (ConnectedComponent.connectedComponentMk_eq_of_adj hab).symm
    let ec : c.toSimpleGraph.edgeSet :=
      ⟨s(⟨a, ha⟩, ⟨b, hb⟩), by simpa [ConnectedComponent.toSimpleGraph] using hab⟩
    refine ⟨⟨c, ec⟩, ?_⟩
    apply Subtype.ext
    change s(a, b) = e.val
    exact e.val.out_eq

/-- Euler's edge-component identity for a finite forest. -/
theorem forest_edge_component_count {W : Type*} [Finite W]
    (G : SimpleGraph W) (hG : G.IsAcyclic) :
    Nat.card G.edgeSet = Nat.card W - Nat.card G.ConnectedComponent := by
  classical
  letI := Fintype.ofFinite W
  letI : DecidableEq W := Classical.decEq W
  letI : DecidableRel G.Adj := Classical.decRel G.Adj
  have hcomp (c : G.ConnectedComponent) :
      Nat.card c.toSimpleGraph.edgeSet + 1 = Nat.card c := by
    letI := Fintype.ofFinite c
    letI : DecidableEq c := Classical.decEq c
    letI : DecidableRel c.toSimpleGraph.Adj := Classical.decRel _
    simpa [edgeFinset_card, Nat.card_eq_fintype_card] using
      (hG.isTree_connectedComponent c).card_edgeFinset
  have hsum : Nat.card G.edgeSet + Nat.card G.ConnectedComponent = Nat.card W := by
    calc
      Nat.card G.edgeSet + Nat.card G.ConnectedComponent =
          Nat.card (Σ c : G.ConnectedComponent, c.toSimpleGraph.edgeSet) +
            Nat.card G.ConnectedComponent := by
              rw [Nat.card_congr (componentEdgeEquiv G).symm]
      _ = (∑ c : G.ConnectedComponent, Nat.card c.toSimpleGraph.edgeSet) +
            ∑ _c : G.ConnectedComponent, 1 := by
              rw [Nat.card_sigma]
              simp
      _ = ∑ c : G.ConnectedComponent, (Nat.card c.toSimpleGraph.edgeSet + 1) := by
              rw [Finset.sum_add_distrib]
      _ = ∑ c : G.ConnectedComponent, Nat.card c := by
              apply Finset.sum_congr rfl
              intro c _
              exact hcomp c
      _ = Nat.card (Σ c : G.ConnectedComponent, c) := by
              rw [Nat.card_sigma]
      _ = Nat.card W := Nat.card_congr (vertexComponentEquiv G)
  omega

theorem extensionGraph_isAcyclic {G : SimpleGraph V} [DecidableRel G.Adj]
    (hG : G.IsAcyclic) (U Z : Finset V) :
    (extensionGraph G U Z).IsAcyclic := by
  exact hG.induce _

theorem natCard_extensionSubtype {G : SimpleGraph V} [DecidableRel G.Adj]
    (U Z : Finset V) :
    Nat.card {x // x ∈ extensionVerts G U Z} = extensionVertexCount G U Z := by
  rw [extensionVertexCount, Nat.card_eq_fintype_card, Fintype.card_coe]

theorem extension_edge_eq_vertex_sub_component {G : SimpleGraph V}
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (U Z : Finset V) :
    extensionEdgeCount G U Z =
      extensionVertexCount G U Z - extensionComponentCount G U Z := by
  rw [extensionEdgeCount, extensionComponentCount]
  have h := forest_edge_component_count (extensionGraph G U Z)
    (extensionGraph_isAcyclic hG U Z)
  rw [natCard_extensionSubtype (G := G) U Z] at h
  exact h

theorem raw_rho_identity {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (p q : Nat) (P Q : Finset V) :
    let ep : Int := extensionVertexCount G U P
    let eq : Int := extensionVertexCount G U Q
    let mp : Int := extensionEdgeCount G U P
    let mq : Int := extensionEdgeCount G U Q
    let u := ep - eq
    let k := mp - mq
    rho G U p P - rho G U q Q =
      (q - p : Int) * eq + u * (2 * eq + u - p - 2) - 2 * k := by
  simp only [rho]
  ring

theorem raw_rho_forest_identity {G : SimpleGraph V} [DecidableRel G.Adj]
    (hG : G.IsAcyclic) (U : Finset V) (p q : Nat) (P Q : Finset V) :
    let ep : Int := extensionVertexCount G U P
    let eq : Int := extensionVertexCount G U Q
    let cp : Int := extensionComponentCount G U P
    let cq : Int := extensionComponentCount G U Q
    let u := ep - eq
    rho G U p P - rho G U q Q =
      (q - p : Int) * eq + u * (2 * eq + u - p - 4) + 2 * (cp - cq) := by
  have hp := extension_edge_eq_vertex_sub_component hG U P
  have hq := extension_edge_eq_vertex_sub_component hG U Q
  have hcp : extensionComponentCount G U P ≤ extensionVertexCount G U P := by
    rw [extensionComponentCount]
    have h := Nat.card_le_card_of_surjective
      (extensionGraph G U P).connectedComponentMk Quot.mk_surjective
    rw [natCard_extensionSubtype (G := G) U P] at h
    exact h
  have hcq : extensionComponentCount G U Q ≤ extensionVertexCount G U Q := by
    rw [extensionComponentCount]
    have h := Nat.card_le_card_of_surjective
      (extensionGraph G U Q).connectedComponentMk Quot.mk_surjective
    rw [natCard_extensionSubtype (G := G) U Q] at h
    exact h
  have hp' : (extensionEdgeCount G U P : Int) =
      extensionVertexCount G U P - extensionComponentCount G U P := by
    exact_mod_cast hp
  have hq' : (extensionEdgeCount G U Q : Int) =
      extensionVertexCount G U Q - extensionComponentCount G U Q := by
    exact_mod_cast hq
  simp only [rho]
  rw [hp', hq']
  ring

theorem indep_insert_of_mem_extension {G : SimpleGraph V} [DecidableRel G.Adj]
    {U Z : Finset V} {x : V} (hZ : G.IsIndepSet (Z : Set V))
    (hx : x ∈ extensionVerts G U Z) :
    G.IsIndepSet ((insert x Z : Finset V) : Set V) := by
  rw [isIndepSet_iff] at hZ ⊢
  intro a ha b hb hab
  simp only [Finset.mem_coe, mem_insert] at ha hb
  rcases ha with rfl | ha
  · rcases hb with rfl | hb
    · exact (hab rfl).elim
    · exact (mem_extensionVerts.mp hx).2.2 b hb
  · rcases hb with rfl | hb
    · exact fun h => (mem_extensionVerts.mp hx).2.2 a ha h.symm
    · exact hZ ha hb hab

theorem indep_erase {G : SimpleGraph V} [DecidableRel G.Adj]
    {S : Finset V} (hS : G.IsIndepSet (S : Set V)) (x : V) :
    G.IsIndepSet ((S.erase x : Finset V) : Set V) := by
  exact hS.mono <| by
    intro z hz
    exact (mem_erase.mp hz).2

abbrev IndependentSetOn (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (s : Nat) :=
  {Z : Finset V // Z ∈ independentSetsOn G U s}

abbrev ExtensionOne (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) :=
  Σ Z : IndependentSetOn G U (r - 1),
    {x : V // x ∈ extensionVerts G U Z.1}

abbrev PointedIndependentSet (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) :=
  Σ S : IndependentSetOn G U r, {x : V // x ∈ S.1}

noncomputable def extensionOneEquivPointed {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) (hr : 1 ≤ r) :
    ExtensionOne G U r ≃ PointedIndependentSet G U r where
  toFun zx := by
    rcases zx with ⟨Z, x⟩
    have hZ := mem_independentSetsOn.mp Z.2
    have hx := mem_extensionVerts.mp x.2
    let S : Finset V := insert x.1 Z.1
    have hScard : S.card = r := by
      dsimp [S]
      rw [card_insert_of_notMem hx.2.1, hZ.2.1]
      omega
    have hS : S ∈ independentSetsOn G U r := mem_independentSetsOn.mpr
      ⟨by
        intro z hz
        simp only [S, mem_insert] at hz
        exact hz.elim (fun h => h ▸ hx.1) (fun hz => hZ.1 hz),
       hScard, indep_insert_of_mem_extension hZ.2.2 x.2⟩
    exact ⟨⟨S, hS⟩, ⟨x.1, by simp [S]⟩⟩
  invFun sx := by
    rcases sx with ⟨S, x⟩
    have hS := mem_independentSetsOn.mp S.2
    let Z : Finset V := S.1.erase x.1
    have hZcard : Z.card = r - 1 := by
      dsimp [Z]
      rw [card_erase_of_mem x.2, hS.2.1]
    have hZ : Z ∈ independentSetsOn G U (r - 1) := mem_independentSetsOn.mpr
      ⟨fun z hz => hS.1 ((erase_subset _ _) hz), hZcard,
       indep_erase hS.2.2 x.1⟩
    have hxS : x.1 ∈ S.1 := x.2
    have hxext : x.1 ∈ extensionVerts G U Z := mem_extensionVerts.mpr
      ⟨hS.1 hxS, by
        intro hxerase
        exact (mem_erase.mp hxerase).1 rfl, by
        intro z hz hadj
        exact hS.2.2 hxS ((erase_subset _ _) hz) (ne_of_mem_erase hz).symm hadj⟩
    exact ⟨⟨Z, hZ⟩, ⟨x.1, hxext⟩⟩
  left_inv zx := by
    rcases zx with ⟨Z, x⟩
    apply Sigma.ext
    · apply Subtype.ext
      simp [mem_extensionVerts.mp x.2 |>.2.1]
    · rw [Subtype.heq_iff_coe_eq]
      intro y
      simp [mem_extensionVerts.mp x.2 |>.2.1]
  right_inv sx := by
    rcases sx with ⟨S, x⟩
    apply Sigma.ext
    · apply Subtype.ext
      simp [x.2]
    · rw [Subtype.heq_iff_coe_eq]
      intro y
      simp [x.2]

theorem sum_extensionVertexCount {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) (hr : 1 ≤ r) :
    ∑ Z ∈ independentSetsOn G U (r - 1), extensionVertexCount G U Z =
      r * independentCountOn G U r := by
  classical
  have hcard := Fintype.card_congr (extensionOneEquivPointed (G := G) U r hr)
  simp only [ExtensionOne, PointedIndependentSet, Fintype.card_sigma,
    Fintype.card_coe] at hcard
  have hcardAttach :
      ∑ Z ∈ (independentSetsOn G U (r - 1)).attach,
          (extensionVerts G U Z.1).card =
        ∑ S ∈ (independentSetsOn G U r).attach, S.1.card := by
    simpa only [Finset.attach_eq_univ] using hcard
  have hcard' :
      ∑ Z ∈ independentSetsOn G U (r - 1), extensionVertexCount G U Z =
        ∑ S ∈ independentSetsOn G U r, S.card := by
    calc
      ∑ Z ∈ independentSetsOn G U (r - 1), extensionVertexCount G U Z =
          ∑ Z ∈ (independentSetsOn G U (r - 1)).attach,
            (extensionVerts G U Z.1).card := by
              symm
              exact Finset.sum_attach (independentSetsOn G U (r - 1))
                (fun Z => extensionVertexCount G U Z)
      _ = ∑ S ∈ (independentSetsOn G U r).attach, S.1.card := hcardAttach
      _ = ∑ S ∈ independentSetsOn G U r, S.card :=
        Finset.sum_attach (independentSetsOn G U r) (fun S => S.card)
  rw [hcard']
  calc
    ∑ S ∈ independentSetsOn G U r, S.card =
        ∑ _S ∈ independentSetsOn G U r, r := by
          apply Finset.sum_congr rfl
          intro S hS
          exact (mem_independentSetsOn.mp hS).2.1
    _ = r * independentCountOn G U r := by
          simp [independentCountOn, Nat.mul_comm]

def independentPairs (G : SimpleGraph V) [DecidableRel G.Adj]
    (E : Finset V) : Finset (Finset V) :=
  (E.powersetCard 2).filter fun W => G.IsIndepSet (W : Set V)

def nonIndependentPairs (G : SimpleGraph V) [DecidableRel G.Adj]
    (E : Finset V) : Finset (Finset V) :=
  (E.powersetCard 2).filter fun W => ¬G.IsIndepSet (W : Set V)

theorem not_indep_pair_iff_adj {G : SimpleGraph V} [DecidableRel G.Adj]
    {a b : V} (hab : a ≠ b) :
    ¬G.IsIndepSet (({a, b} : Finset V) : Set V) ↔ G.Adj a b := by
  constructor
  · intro hnot
    by_contra hadj
    apply hnot
    rw [isIndepSet_iff]
    intro x hx y hy hxy
    simp only [Finset.mem_coe, mem_insert, mem_singleton] at hx hy
    rcases hx with rfl | rfl <;> rcases hy with rfl | rfl
    · exact (hxy rfl).elim
    · exact hadj
    · exact fun h => hadj h.symm
    · exact (hxy rfl).elim
  · intro hadj hind
    exact hind (by simp) (by simp) hab hadj

noncomputable def extensionEdgeEquivNonIndependentPairs
    {G : SimpleGraph V} [DecidableRel G.Adj] (U Z : Finset V) :
    (extensionGraph G U Z).edgeSet ≃
      {W : Finset V // W ∈ nonIndependentPairs G (extensionVerts G U Z)} := by
  classical
  let emb : {x // x ∈ extensionVerts G U Z} ↪ V :=
    ⟨Subtype.val, Subtype.val_injective⟩
  let f : (extensionGraph G U Z).edgeSet →
      {W : Finset V // W ∈ nonIndependentPairs G (extensionVerts G U Z)} :=
    fun e => by
      let W := e.val.toFinset.map emb
      have hcard : W.card = 2 := by
        dsimp [W]
        rw [card_map]
        exact Sym2.card_toFinset_of_not_isDiag e.val
          ((extensionGraph G U Z).not_isDiag_of_mem_edgeSet e.property)
      have hsubset : W ⊆ extensionVerts G U Z := by
        intro x hx
        obtain ⟨y, _, rfl⟩ := mem_map.mp hx
        exact y.property
      have hadjR : (extensionGraph G U Z).Adj e.val.out.1 e.val.out.2 := by
        rw [← mem_edgeSet]
        simpa [e.val.out_eq] using e.property
      have hadjG : G.Adj e.val.out.1.val e.val.out.2.val := hadjR
      have haW : e.val.out.1.val ∈ W := by
        exact mem_map.mpr ⟨e.val.out.1, Sym2.mem_toFinset.mpr (Sym2.out_fst_mem _), rfl⟩
      have hbW : e.val.out.2.val ∈ W := by
        exact mem_map.mpr ⟨e.val.out.2, Sym2.mem_toFinset.mpr (Sym2.out_snd_mem _), rfl⟩
      have hnot : ¬G.IsIndepSet (W : Set V) := by
        intro hW
        exact hW haW hbW (Subtype.val_injective.ne hadjR.ne) hadjG
      exact ⟨W, by simp [nonIndependentPairs, hsubset, hcard, hnot]⟩
  apply Equiv.ofBijective f
  constructor
  · intro e e' heq
    apply Subtype.ext
    apply Sym2.ext
    intro x
    constructor
    · intro hx
      have hxW : x.val ∈ e.val.toFinset.map emb :=
        mem_map.mpr ⟨x, Sym2.mem_toFinset.mpr hx, rfl⟩
      have hvals := congrArg (fun w => w.1) heq
      change e.val.toFinset.map emb = e'.val.toFinset.map emb at hvals
      rw [hvals] at hxW
      obtain ⟨y, hy, hyx⟩ := mem_map.mp hxW
      have : y = x := Subtype.ext hyx
      simpa [this] using Sym2.mem_toFinset.mp hy
    · intro hx
      have hxW : x.val ∈ e'.val.toFinset.map emb :=
        mem_map.mpr ⟨x, Sym2.mem_toFinset.mpr hx, rfl⟩
      have hvals := congrArg (fun w => w.1) heq
      change e.val.toFinset.map emb = e'.val.toFinset.map emb at hvals
      rw [← hvals] at hxW
      obtain ⟨y, hy, hyx⟩ := mem_map.mp hxW
      have : y = x := Subtype.ext hyx
      simpa [this] using Sym2.mem_toFinset.mp hy
  · intro W
    obtain ⟨hWsub, hWcard, hWnot⟩ :
        W.1 ⊆ extensionVerts G U Z ∧ W.1.card = 2 ∧
          ¬G.IsIndepSet (W.1 : Set V) := by
      have h := W.2
      simp only [nonIndependentPairs, mem_filter, mem_powersetCard] at h
      exact ⟨h.1.1, h.1.2, h.2⟩
    obtain ⟨a, b, hab, hWab⟩ := Finset.card_eq_two.mp hWcard
    have haE : a ∈ extensionVerts G U Z := hWsub (hWab ▸ by simp)
    have hbE : b ∈ extensionVerts G U Z := hWsub (hWab ▸ by simp)
    have habG : G.Adj a b := (not_indep_pair_iff_adj hab).mp <| by
      simpa [hWab] using hWnot
    let e : (extensionGraph G U Z).edgeSet :=
      ⟨s(⟨a, haE⟩, ⟨b, hbE⟩), by
        rw [mem_edgeSet]
        exact habG⟩
    refine ⟨e, ?_⟩
    apply Subtype.ext
    dsimp [f]
    change e.val.toFinset.map emb = W.1
    dsimp [e]
    rw [Sym2.toFinset_mk_eq]
    simpa [emb] using hWab.symm

theorem card_independentPairs_extension {G : SimpleGraph V} [DecidableRel G.Adj]
    (U Z : Finset V) :
    (independentPairs G (extensionVerts G U Z)).card =
      Nat.choose (extensionVertexCount G U Z) 2 - extensionEdgeCount G U Z := by
  classical
  have hedge := Nat.card_congr
    (extensionEdgeEquivNonIndependentPairs (G := G) U Z)
  have hedge' : extensionEdgeCount G U Z =
      (nonIndependentPairs G (extensionVerts G U Z)).card := by
    simpa [extensionEdgeCount, Nat.card_eq_fintype_card, Fintype.card_coe] using hedge
  have hpartition := Finset.card_filter_add_card_filter_not
    (s := extensionVerts G U Z |>.powersetCard 2)
    (fun W => G.IsIndepSet (W : Set V))
  have hsum :
      (independentPairs G (extensionVerts G U Z)).card +
        (nonIndependentPairs G (extensionVerts G U Z)).card =
          Nat.choose (extensionVertexCount G U Z) 2 := by
    simpa [independentPairs, nonIndependentPairs, extensionVertexCount,
      Finset.card_powersetCard] using hpartition
  omega

theorem card_independentPairs_add_extensionEdges
    {G : SimpleGraph V} [DecidableRel G.Adj] (U Z : Finset V) :
    (independentPairs G (extensionVerts G U Z)).card + extensionEdgeCount G U Z =
      Nat.choose (extensionVertexCount G U Z) 2 := by
  have h := card_independentPairs_extension (G := G) U Z
  have hedge : extensionEdgeCount G U Z ≤
      Nat.choose (extensionVertexCount G U Z) 2 := by
    have hedgeCard := Nat.card_congr
      (extensionEdgeEquivNonIndependentPairs (G := G) U Z)
    have hedgeEq : extensionEdgeCount G U Z =
        (nonIndependentPairs G (extensionVerts G U Z)).card := by
      simpa [extensionEdgeCount, Nat.card_eq_fintype_card, Fintype.card_coe] using hedgeCard
    rw [hedgeEq]
    calc
      (nonIndependentPairs G (extensionVerts G U Z)).card ≤
          (extensionVerts G U Z |>.powersetCard 2).card := by
            exact Finset.card_filter_le _ _
      _ = Nat.choose (extensionVertexCount G U Z) 2 := by
            simp [extensionVertexCount, Finset.card_powersetCard]
  omega

@[simp] theorem mem_independentPairs {G : SimpleGraph V} [DecidableRel G.Adj]
    {E W : Finset V} :
    W ∈ independentPairs G E ↔
      W ⊆ E ∧ W.card = 2 ∧ G.IsIndepSet (W : Set V) := by
  simp [independentPairs, and_assoc]

theorem indep_union_of_extension {G : SimpleGraph V} [DecidableRel G.Adj]
    {U Z W : Finset V} (hZ : G.IsIndepSet (Z : Set V))
    (hW : G.IsIndepSet (W : Set V))
    (hWE : W ⊆ extensionVerts G U Z) :
    G.IsIndepSet ((Z ∪ W : Finset V) : Set V) := by
  rw [isIndepSet_iff] at hZ hW ⊢
  intro a ha b hb hab
  simp only [Finset.mem_coe, mem_union] at ha hb
  rcases ha with ha | ha <;> rcases hb with hb | hb
  · exact hZ ha hb hab
  · exact fun hadj => (mem_extensionVerts.mp (hWE hb)).2.2 a ha hadj.symm
  · exact (mem_extensionVerts.mp (hWE ha)).2.2 b hb
  · exact hW ha hb hab

abbrev ExtensionPair (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) :=
  Σ Z : IndependentSetOn G U (r - 1),
    {W : Finset V // W ∈ independentPairs G (extensionVerts G U Z.1)}

abbrev BaseChoice (G : SimpleGraph V) [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) :=
  Σ S : IndependentSetOn G U (r + 1),
    {Z : Finset V // Z ∈ S.1.powersetCard (r - 1)}

noncomputable def extensionPairEquivBaseChoice
    {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) (hr : 1 ≤ r) :
    ExtensionPair G U r ≃ BaseChoice G U r where
  toFun zw := by
    rcases zw with ⟨Z, W⟩
    have hZ := mem_independentSetsOn.mp Z.2
    have hW := mem_independentPairs.mp W.2
    have hdisj : Disjoint Z.1 W.1 := Finset.disjoint_left.mpr <| by
      intro z hzZ hzW
      exact (mem_extensionVerts.mp (hW.1 hzW)).2.1 hzZ
    let S : Finset V := Z.1 ∪ W.1
    have hScard : S.card = r + 1 := by
      dsimp [S]
      rw [card_union_of_disjoint hdisj, hZ.2.1, hW.2.1]
      omega
    have hS : S ∈ independentSetsOn G U (r + 1) := mem_independentSetsOn.mpr
      ⟨by
        intro x hx
        rcases mem_union.mp hx with hx | hx
        · exact hZ.1 hx
        · exact (mem_extensionVerts.mp (hW.1 hx)).1,
       hScard, indep_union_of_extension hZ.2.2 hW.2.2 hW.1⟩
    have hZbase : Z.1 ∈ S.powersetCard (r - 1) := by
      rw [mem_powersetCard]
      exact ⟨subset_union_left, hZ.2.1⟩
    exact ⟨⟨S, hS⟩, ⟨Z.1, hZbase⟩⟩
  invFun sz := by
    rcases sz with ⟨S, Z⟩
    have hS := mem_independentSetsOn.mp S.2
    have hZbase := mem_powersetCard.mp Z.2
    let W : Finset V := S.1 \ Z.1
    have hWcard : W.card = 2 := by
      dsimp [W]
      rw [card_sdiff_of_subset hZbase.1, hS.2.1, hZbase.2]
      omega
    have hWind : G.IsIndepSet (W : Set V) := hS.2.2.mono <| by
      intro x hx
      exact (mem_sdiff.mp hx).1
    have hWE : W ⊆ extensionVerts G U Z.1 := by
      intro x hx
      have hx' := mem_sdiff.mp hx
      rw [mem_extensionVerts]
      exact ⟨hS.1 hx'.1, hx'.2, by
        intro z hz hadj
        exact hS.2.2 hx'.1 (hZbase.1 hz) (fun h => hx'.2 (h ▸ hz)) hadj⟩
    have hZind : G.IsIndepSet (Z.1 : Set V) := hS.2.2.mono hZbase.1
    have hZI : Z.1 ∈ independentSetsOn G U (r - 1) :=
      mem_independentSetsOn.mpr
        ⟨hZbase.1.trans hS.1, hZbase.2, hZind⟩
    have hWI : W ∈ independentPairs G (extensionVerts G U Z.1) :=
      mem_independentPairs.mpr ⟨hWE, hWcard, hWind⟩
    exact ⟨⟨Z.1, hZI⟩, ⟨W, hWI⟩⟩
  left_inv zw := by
    rcases zw with ⟨Z, W⟩
    have hW := mem_independentPairs.mp W.2
    have hdisj : Disjoint Z.1 W.1 := Finset.disjoint_left.mpr <| by
      intro z hzZ hzW
      exact (mem_extensionVerts.mp (hW.1 hzW)).2.1 hzZ
    apply Sigma.ext
    · apply Subtype.ext
      rfl
    · rw [Subtype.heq_iff_coe_eq (by
        intro X
        simp [union_sdiff_cancel_left hdisj])]
      exact union_sdiff_cancel_left hdisj
  right_inv sz := by
    rcases sz with ⟨S, Z⟩
    have hZbase := mem_powersetCard.mp Z.2
    apply Sigma.ext
    · apply Subtype.ext
      exact union_sdiff_of_subset hZbase.1
    · rw [Subtype.heq_iff_coe_eq (by
        intro X
        simp [union_sdiff_of_subset hZbase.1])]

theorem sum_independent_extension_pairs
    {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) (hr : 1 ≤ r) :
    ∑ Z ∈ independentSetsOn G U (r - 1),
        (independentPairs G (extensionVerts G U Z)).card =
      Nat.choose (r + 1) 2 * independentCountOn G U (r + 1) := by
  classical
  have hcard := Fintype.card_congr
    (extensionPairEquivBaseChoice (G := G) U r hr)
  simp only [ExtensionPair, BaseChoice, Fintype.card_sigma,
    Fintype.card_coe] at hcard
  have hcardAttach :
      ∑ Z ∈ (independentSetsOn G U (r - 1)).attach,
          (independentPairs G (extensionVerts G U Z.1)).card =
        ∑ S ∈ (independentSetsOn G U (r + 1)).attach,
          (S.1.powersetCard (r - 1)).card := by
    simpa only [Finset.attach_eq_univ] using hcard
  have hcard' :
      ∑ Z ∈ independentSetsOn G U (r - 1),
          (independentPairs G (extensionVerts G U Z)).card =
        ∑ S ∈ independentSetsOn G U (r + 1),
          (S.powersetCard (r - 1)).card := by
    calc
      _ = ∑ Z ∈ (independentSetsOn G U (r - 1)).attach,
          (independentPairs G (extensionVerts G U Z.1)).card := by
            symm
            exact Finset.sum_attach (independentSetsOn G U (r - 1))
              (fun Z => (independentPairs G (extensionVerts G U Z)).card)
      _ = _ := hcardAttach
      _ = _ := Finset.sum_attach (independentSetsOn G U (r + 1))
        (fun S => (S.powersetCard (r - 1)).card)
  rw [hcard']
  have hchoose : Nat.choose (r + 1) (r - 1) = Nat.choose (r + 1) 2 := by
    have htwo : 2 ≤ r + 1 := by omega
    have hind : r - 1 = (r + 1) - 2 := by omega
    rw [hind]
    exact Nat.choose_symm htwo
  calc
    ∑ S ∈ independentSetsOn G U (r + 1),
        (S.powersetCard (r - 1)).card =
      ∑ _S ∈ independentSetsOn G U (r + 1), Nat.choose (r + 1) 2 := by
        apply Finset.sum_congr rfl
        intro S hS
        rw [Finset.card_powersetCard, (mem_independentSetsOn.mp hS).2.1, hchoose]
    _ = Nat.choose (r + 1) 2 * independentCountOn G U (r + 1) := by
      simp [independentCountOn, Nat.mul_comm]

theorem two_mul_choose_two_int (n : Nat) :
    (2 : Int) * (Nat.choose n 2 : Int) = (n : Int) * ((n : Int) - 1) := by
  have hn : 2 * Nat.choose n 2 = n * (n - 1) := by
    rw [Nat.choose_two_right, Nat.mul_comm]
    exact Nat.div_two_mul_two_of_even (Nat.even_mul_pred_self n)
  cases n with
  | zero => norm_num
  | succ n =>
      have hnI := congrArg (fun x : Nat => (x : Int)) hn
      norm_num at hnI ⊢
      exact hnI

theorem rho_eq_pair_charge {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) (Z : Finset V) :
    rho G U r Z =
      2 * ((independentPairs G (extensionVerts G U Z)).card : Int) -
        (r + 1) * (extensionVertexCount G U Z : Int) := by
  let e := extensionVertexCount G U Z
  let m := extensionEdgeCount G U Z
  let a := (independentPairs G (extensionVerts G U Z)).card
  have hsum : a + m = Nat.choose e 2 := by
    exact card_independentPairs_add_extensionEdges (G := G) U Z
  have hsumI : (a : Int) + (m : Int) = (Nat.choose e 2 : Int) := by
    exact_mod_cast hsum
  have hchoose := two_mul_choose_two_int e
  simp only [rho]
  change (e : Int) * ((e : Int) - (r : Int) - 2) - 2 * (m : Int) = _
  rw [← hsumI] at hchoose
  dsimp [a, e, m] at hchoose ⊢
  ring_nf at hchoose ⊢
  omega

theorem sum_rho_eq_delta {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (r : Nat) (hr : 1 ≤ r) :
    ∑ Z ∈ independentSetsOn G U (r - 1), rho G U r Z =
      (r : Int) * (r + 1) * deltaOn G U r := by
  have hpairs := sum_independent_extension_pairs (G := G) U r hr
  have hext := sum_extensionVertexCount (G := G) U r hr
  have hpairsI :
      (∑ Z ∈ independentSetsOn G U (r - 1),
        ((independentPairs G (extensionVerts G U Z)).card : Int)) =
      (Nat.choose (r + 1) 2 : Int) * independentCountOn G U (r + 1) := by
    exact_mod_cast hpairs
  have hextI :
      (∑ Z ∈ independentSetsOn G U (r - 1),
        (extensionVertexCount G U Z : Int)) =
      (r : Int) * independentCountOn G U r := by
    exact_mod_cast hext
  calc
    ∑ Z ∈ independentSetsOn G U (r - 1), rho G U r Z =
        ∑ Z ∈ independentSetsOn G U (r - 1),
          (2 * ((independentPairs G (extensionVerts G U Z)).card : Int) -
            (r + 1) * (extensionVertexCount G U Z : Int)) := by
              apply Finset.sum_congr rfl
              intro Z _
              exact rho_eq_pair_charge U r Z
    _ = 2 * (∑ Z ∈ independentSetsOn G U (r - 1),
          ((independentPairs G (extensionVerts G U Z)).card : Int)) -
        (r + 1) * (∑ Z ∈ independentSetsOn G U (r - 1),
          (extensionVertexCount G U Z : Int)) := by
            rw [Finset.sum_sub_distrib, Finset.mul_sum, Finset.mul_sum]
    _ = 2 * ((Nat.choose (r + 1) 2 : Int) * independentCountOn G U (r + 1)) -
        (r + 1) * ((r : Int) * independentCountOn G U r) := by
          rw [hpairsI, hextI]
    _ = (r : Int) * (r + 1) * deltaOn G U r := by
          have hchoose := two_mul_choose_two_int (r + 1)
          rw [show
            2 * ((Nat.choose (r + 1) 2 : Int) * independentCountOn G U (r + 1)) =
              (2 * (Nat.choose (r + 1) 2 : Int)) *
                independentCountOn G U (r + 1) by ring]
          norm_num at hchoose
          rw [hchoose]
          simp only [deltaOn]
          ring

theorem xMarginal_eq_sum_rho {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (p q : Nat) :
    xMarginal G U p q =
      ∑ P ∈ independentSetsOn G U (p - 1), (rho G U p P : Rat) := by
  classical
  rw [xMarginal]
  apply Finset.sum_congr rfl
  intro P _
  by_cases hd : containmentDegree G U q P = 0
  · simp [hd]
  · rw [if_neg hd]
    simp only [sum_const, nsmul_eq_mul]
    rw [show
      ((independentSetsOn G U (q - 1)).filter fun Q => P ⊆ Q).card =
        containmentDegree G U q P by rfl]
    field_simp

theorem yMarginal_eq_sum_rho {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (p q : Nat) (hpq : p < q) :
    yMarginal G U p q =
      ∑ Q ∈ independentSetsOn G U (q - 1), (rho G U q Q : Rat) := by
  classical
  rw [yMarginal]
  apply Finset.sum_congr rfl
  intro Q hQ
  have hcardQ : Q.card = q - 1 := (mem_independentSetsOn.mp hQ).2.1
  have hle : p - 1 ≤ q - 1 := by omega
  have hchoose : Nat.choose (q - 1) (p - 1) ≠ 0 :=
    (Nat.choose_pos hle).ne'
  simp only [sum_const, nsmul_eq_mul, Finset.card_powersetCard, hcardQ]
  field_simp

theorem xMarginal_recovery {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (p q : Nat) (hp : 1 ≤ p) :
    xMarginal G U p q =
      ((p : Int) * (p + 1) * deltaOn G U p : Int) := by
  rw [xMarginal_eq_sum_rho]
  have hsum := sum_rho_eq_delta (G := G) U p hp
  exact_mod_cast hsum

theorem yMarginal_recovery {G : SimpleGraph V} [DecidableRel G.Adj]
    (U : Finset V) (p q : Nat) (hq : 1 ≤ q) (hpq : p < q) :
    yMarginal G U p q =
      ((q : Int) * (q + 1) * deltaOn G U q : Int) := by
  rw [yMarginal_eq_sum_rho U p q hpq]
  have hsum := sum_rho_eq_delta (G := G) U q hq
  exact_mod_cast hsum

noncomputable def leafSplitEquiv {G : SimpleGraph V} [DecidableRel G.Adj]
    (v w : V) (s : Nat) (hs : 1 ≤ s)
    (hvdeg : G.degree v = 1) (hvw : G.Adj v w) :
    IndependentSetOn G Finset.univ s ≃
      IndependentSetOn G (aVerts v) s ⊕
        IndependentSetOn G (bVerts v w) (s - 1) where
  toFun S := by
    have hS := mem_independentSetsOn.mp S.2
    by_cases hvS : v ∈ S.1
    · have hwS : w ∉ S.1 := by
        intro hwS
        exact hS.2.2 hvS hwS hvw.ne hvw
      let Z : Finset V := S.1.erase v
      have hZcard : Z.card = s - 1 := by
        dsimp [Z]
        rw [card_erase_of_mem hvS, hS.2.1]
      have hZsub : Z ⊆ bVerts v w := by
        intro x hx
        have hx' := mem_erase.mp hx
        simp only [bVerts, mem_erase, mem_univ, and_true]
        exact ⟨fun hxw => hwS (hxw ▸ hx'.2), hx'.1⟩
      exact Sum.inr ⟨Z, mem_independentSetsOn.mpr
        ⟨hZsub, hZcard, indep_erase hS.2.2 v⟩⟩
    · exact Sum.inl ⟨S.1, mem_independentSetsOn.mpr
        ⟨by
          intro x hx
          simp only [aVerts, mem_erase, mem_univ, and_true]
          exact fun h => hvS (h ▸ hx),
         hS.2.1, hS.2.2⟩⟩
  invFun SZ := by
    rcases SZ with A | B
    · have hA := mem_independentSetsOn.mp A.2
      exact ⟨A.1, mem_independentSetsOn.mpr
        ⟨fun _ _ => mem_univ _, hA.2.1, hA.2.2⟩⟩
    · have hB := mem_independentSetsOn.mp B.2
      have hvB : v ∉ B.1 := by
        intro hv
        have := hB.1 hv
        simp [bVerts, hvw.ne] at this
      have hvext : v ∈ extensionVerts G Finset.univ B.1 := mem_extensionVerts.mpr
        ⟨mem_univ _, hvB, by
          intro z hz hadj
          have hzw : z = w :=
            (degree_eq_one_iff_existsUnique_adj.mp hvdeg).unique hadj hvw
          have hzB := hB.1 hz
          simpa [bVerts, hzw] using hzB⟩
      have hcard : (insert v B.1).card = s := by
        rw [card_insert_of_notMem hvB, hB.2.1]
        omega
      exact ⟨insert v B.1, mem_independentSetsOn.mpr
        ⟨fun _ _ => mem_univ _, hcard,
         indep_insert_of_mem_extension hB.2.2 hvext⟩⟩
  left_inv S := by
    have hS := mem_independentSetsOn.mp S.2
    by_cases hvS : v ∈ S.1
    · simp only [hvS, ↓reduceDIte]
      apply Subtype.ext
      exact insert_erase hvS
    · simp only [hvS, ↓reduceDIte]
  right_inv SZ := by
    rcases SZ with A | B
    · have hA := mem_independentSetsOn.mp A.2
      have hvA : v ∉ A.1 := by
        intro hv
        have := hA.1 hv
        simpa [aVerts] using this
      simp only [hvA, ↓reduceDIte]
    · have hB := mem_independentSetsOn.mp B.2
      have hvB : v ∉ B.1 := by
        intro hv
        have := hB.1 hv
        simp [bVerts, hvw.ne] at this
      simp only [mem_insert, true_or, ↓reduceDIte]
      apply congrArg Sum.inr
      apply Subtype.ext
      simp [hvB]

theorem independentCount_leaf_split {G : SimpleGraph V} [DecidableRel G.Adj]
    (v w : V) (s : Nat) (hs : 1 ≤ s)
    (hvdeg : G.degree v = 1) (hvw : G.Adj v w) :
    independentCountOn G Finset.univ s =
      independentCountOn G (aVerts v) s +
        independentCountOn G (bVerts v w) (s - 1) := by
  classical
  have hcard := Fintype.card_congr
    (leafSplitEquiv (G := G) v w s hs hvdeg hvw)
  simpa only [independentCountOn, Fintype.card_sum,
    Fintype.card_coe] using hcard

theorem delta_leaf_deletion {G : SimpleGraph V} [DecidableRel G.Adj]
    (v w : V) (r : Nat) (hr : 1 ≤ r)
    (hvdeg : G.degree v = 1) (hvw : G.Adj v w) :
    deltaOn G (aVerts v) r =
      deltaOn G Finset.univ r - deltaOn G (bVerts v w) (r - 1) := by
  have hs := independentCount_leaf_split (G := G) v w r hr hvdeg hvw
  have hs1 := independentCount_leaf_split (G := G) v w (r + 1) (by omega) hvdeg hvw
  have hpred : r - 1 + 1 = r := by omega
  have hsuccpred : r + 1 - 1 = r := by omega
  rw [hsuccpred] at hs1
  have hsI : (independentCountOn G Finset.univ r : Int) =
      independentCountOn G (aVerts v) r +
        independentCountOn G (bVerts v w) (r - 1) := by
    exact_mod_cast hs
  have hs1I : (independentCountOn G Finset.univ (r + 1) : Int) =
      independentCountOn G (aVerts v) (r + 1) +
        independentCountOn G (bVerts v w) r := by
    exact_mod_cast hs1
  simp only [deltaOn]
  rw [hpred, hsI, hs1I]
  ring

@[simp] theorem mem_leafSet {G : SimpleGraph V} [DecidableRel G.Adj] {v : V} :
    v ∈ leafSet G ↔ G.degree v = 1 := by
  simp [leafSet]

theorem extensionComponentCount_empty {G : SimpleGraph V} [DecidableRel G.Adj]
    (U Z : Finset V) (hE : extensionVerts G U Z = ∅) :
    extensionComponentCount G U Z = 0 := by
  rw [extensionComponentCount]
  have hempty : IsEmpty {x // x ∈ extensionVerts G U Z} := by
    rw [hE]
    infer_instance
  letI := hempty
  exact (Finite.card_eq_zero_iff).2 inferInstance

theorem sum_xMarginal_eq_neg_globalD {G : SimpleGraph V} [DecidableRel G.Adj]
    (p q : Nat) (hp : 1 ≤ p) :
    ∑ v ∈ leafSet G, xMarginal G (aVerts v) p q = -(globalD G p : Rat) := by
  classical
  have hx (v : V) (hv : v ∈ leafSet G) :
      xMarginal G (aVerts v) p q =
        (((p : Int) * (p + 1) *
          (deltaOn G Finset.univ p -
            deltaOn G (bVerts v (supportVertex G v)) (p - 1)) : Int) : Rat) := by
    have hvdeg : G.degree v = 1 := mem_leafSet.mp hv
    have hvw := (supportVertex_spec hvdeg).1
    rw [xMarginal_recovery (G := G) (aVerts v) p q hp]
    rw [delta_leaf_deletion v (supportVertex G v) p hp hvdeg hvw]
  calc
    ∑ v ∈ leafSet G, xMarginal G (aVerts v) p q =
        ∑ v ∈ leafSet G,
          (((p : Int) * (p + 1) *
            (deltaOn G Finset.univ p -
              deltaOn G (bVerts v (supportVertex G v)) (p - 1)) : Int) : Rat) := by
                apply Finset.sum_congr rfl
                intro v hv
                exact hx v hv
    _ = -(globalD G p : Rat) := by
      simp only [globalD, gamma]
      push_cast
      rw [← Finset.mul_sum]
      rw [Finset.sum_sub_distrib]
      simp only [Finset.sum_const, nsmul_eq_mul]
      ring

theorem sum_yMarginal_eq_neg_globalD {G : SimpleGraph V} [DecidableRel G.Adj]
    (p q : Nat) (hq : 1 ≤ q) (hpq : p < q) :
    ∑ v ∈ leafSet G, yMarginal G (aVerts v) p q = -(globalD G q : Rat) := by
  classical
  have hy (v : V) (hv : v ∈ leafSet G) :
      yMarginal G (aVerts v) p q =
        (((q : Int) * (q + 1) *
          (deltaOn G Finset.univ q -
            deltaOn G (bVerts v (supportVertex G v)) (q - 1)) : Int) : Rat) := by
    have hvdeg : G.degree v = 1 := mem_leafSet.mp hv
    have hvw := (supportVertex_spec hvdeg).1
    rw [yMarginal_recovery (G := G) (aVerts v) p q hq hpq]
    rw [delta_leaf_deletion v (supportVertex G v) q hq hvdeg hvw]
  calc
    ∑ v ∈ leafSet G, yMarginal G (aVerts v) p q =
        ∑ v ∈ leafSet G,
          (((q : Int) * (q + 1) *
            (deltaOn G Finset.univ q -
              deltaOn G (bVerts v (supportVertex G v)) (q - 1)) : Int) : Rat) := by
                apply Finset.sum_congr rfl
                intro v hv
                exact hy v hv
    _ = -(globalD G q : Rat) := by
      simp only [globalD, gamma]
      push_cast
      rw [← Finset.mul_sum]
      rw [Finset.sum_sub_distrib]
      simp only [Finset.sum_const, nsmul_eq_mul]
      ring

/-- The frozen C8-T3 auxiliary containment-and-stub theorem. -/
theorem containment_stub_theorem
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) (_hnontrivial : 2 ≤ Fintype.card V)
    (p q : Nat) (hp : 2 ≤ p) (hpq : p < q) :
    (∀ v ∈ leafSet T,
      T.Adj v (supportVertex T v) ∧
        (∀ w, T.Adj v w → w = supportVertex T v)) ∧
    (∀ v ∈ leafSet T, ∀ r, r = p ∨ r = q →
      (∀ Z ∈ independentSetsOn T (aVerts v) (r - 1),
        (extensionGraph T (aVerts v) Z).IsAcyclic ∧
        extensionEdgeCount T (aVerts v) Z =
          extensionVertexCount T (aVerts v) Z -
            extensionComponentCount T (aVerts v) Z ∧
        (extensionVerts T (aVerts v) Z = ∅ →
          extensionComponentCount T (aVerts v) Z = 0)) ∧
      (∑ Z ∈ independentSetsOn T (aVerts v) (r - 1),
        rho T (aVerts v) r Z) =
          (r : Int) * (r + 1) * deltaOn T (aVerts v) r) ∧
    (∀ v ∈ leafSet T,
      xMarginal T (aVerts v) p q =
          (((p : Int) * (p + 1) * deltaOn T (aVerts v) p : Int) : Rat) ∧
      xMarginal T (aVerts v) p q =
          (((p : Int) * (p + 1) *
            (deltaOn T Finset.univ p -
              deltaOn T (bVerts v (supportVertex T v)) (p - 1)) : Int) : Rat) ∧
      yMarginal T (aVerts v) p q =
          (((q : Int) * (q + 1) * deltaOn T (aVerts v) q : Int) : Rat) ∧
      yMarginal T (aVerts v) p q =
          (((q : Int) * (q + 1) *
            (deltaOn T Finset.univ q -
              deltaOn T (bVerts v (supportVertex T v)) (q - 1)) : Int) : Rat)) ∧
    (∀ v ∈ leafSet T,
      ∀ P ∈ independentSetsOn T (aVerts v) (p - 1),
      ∀ Q ∈ independentSetsOn T (aVerts v) (q - 1), P ⊆ Q →
        extensionVerts T (aVerts v) Q ⊆ extensionVerts T (aVerts v) P ∧
        (let ep : Int := extensionVertexCount T (aVerts v) P
         let eq : Int := extensionVertexCount T (aVerts v) Q
         let mp : Int := extensionEdgeCount T (aVerts v) P
         let mq : Int := extensionEdgeCount T (aVerts v) Q
         let u := ep - eq
         let k := mp - mq
         rho T (aVerts v) p P - rho T (aVerts v) q Q =
           (q - p : Int) * eq + u * (2 * eq + u - p - 2) - 2 * k) ∧
        (let ep : Int := extensionVertexCount T (aVerts v) P
         let eq : Int := extensionVertexCount T (aVerts v) Q
         let cp : Int := extensionComponentCount T (aVerts v) P
         let cq : Int := extensionComponentCount T (aVerts v) Q
         let u := ep - eq
         rho T (aVerts v) p P - rho T (aVerts v) q Q =
           (q - p : Int) * eq + u * (2 * eq + u - p - 4) + 2 * (cp - cq))) ∧
    (∑ v ∈ leafSet T, xMarginal T (aVerts v) p q = -(globalD T p : Rat)) ∧
    (∑ v ∈ leafSet T, yMarginal T (aVerts v) p q = -(globalD T q : Rat)) := by
  have hp1 : 1 ≤ p := by omega
  have hq1 : 1 ≤ q := by omega
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro v hv
    exact supportVertex_spec (mem_leafSet.mp hv)
  · intro v _ r _
    constructor
    · intro Z _
      exact ⟨extensionGraph_isAcyclic hT.isAcyclic _ _,
        extension_edge_eq_vertex_sub_component hT.isAcyclic _ _,
        extensionComponentCount_empty _ Z⟩
    · exact sum_rho_eq_delta (aVerts v) r (by omega)
  · intro v hv
    have hvdeg := mem_leafSet.mp hv
    have hvw := (supportVertex_spec hvdeg).1
    refine ⟨xMarginal_recovery (aVerts v) p q hp1, ?_,
      yMarginal_recovery (aVerts v) p q hq1 hpq, ?_⟩
    · rw [xMarginal_recovery (aVerts v) p q hp1]
      rw [delta_leaf_deletion v (supportVertex T v) p hp1 hvdeg hvw]
    · rw [yMarginal_recovery (aVerts v) p q hq1 hpq]
      rw [delta_leaf_deletion v (supportVertex T v) q hq1 hvdeg hvw]
  · intro v _ P _ Q _ hPQ
    exact ⟨extensionVerts_anti hPQ,
      raw_rho_identity (aVerts v) p q P Q,
      raw_rho_forest_identity hT.isAcyclic (aVerts v) p q P Q⟩
  · exact sum_xMarginal_eq_neg_globalD p q hp1
  · exact sum_yMarginal_eq_neg_globalD p q hq1 hpq

end C8T3ContainmentStub
