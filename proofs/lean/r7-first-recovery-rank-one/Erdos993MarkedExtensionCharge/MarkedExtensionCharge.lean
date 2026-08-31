import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Data.Finset.Powerset
import Mathlib.Tactic

set_option autoImplicit false

namespace MarkedExtensionCharge

noncomputable section

variable {V : Type*} [Fintype V] [DecidableEq V]
variable (G : SimpleGraph V) [DecidableRel G.Adj]

/-- Independent vertex sets of exactly rank `k`. -/
abbrev IndepAt (k : Nat) :=
  {X : Finset V // G.IsIndepSet (X : Set V) ∧ X.card = k}

/-- Vertices that can be added to `X` while preserving independence. -/
def ext (X : Finset V) : Finset V :=
  Finset.univ.filter fun v => v ∉ X ∧ ∀ x ∈ X, ¬G.Adj v x

@[simp]
theorem mem_ext {X : Finset V} {v : V} :
    v ∈ ext G X ↔ v ∉ X ∧ ∀ x ∈ X, ¬G.Adj v x := by
  simp [ext]

/-- The specification residual graph, exactly `G[ext_G(X)]`. -/
abbrev RSpec (X : Finset V) : SimpleGraph {v // v ∈ ext G X} :=
  G.induce (ext G X : Set V)

def extensionCount (X : Finset V) : Nat :=
  (ext G X).card

def residualEdgeCount (X : Finset V) : Nat :=
  (RSpec G X).edgeFinset.card

def independentSetCount (k : Nat) : Nat :=
  Fintype.card (IndepAt G k)

def delta (r : Nat) : Int :=
  (independentSetCount G (r + 1) : Int) - independentSetCount G r

theorem indep_insert_of_mem_ext {X : Finset V} (hX : G.IsIndepSet (X : Set V))
    {v : V} (hv : v ∈ ext G X) : G.IsIndepSet ((insert v X : Finset V) : Set V) := by
  rw [G.isIndepSet_iff, Finset.coe_insert, Set.pairwise_insert]
  refine ⟨hX, ?_⟩
  intro x hx _
  have hvx : ¬G.Adj v x := (mem_ext G).mp hv |>.2 x hx
  exact ⟨hvx, fun hxv => hvx (G.adj_symm hxv)⟩

theorem indep_mono {X Y : Finset V} (hY : G.IsIndepSet (Y : Set V))
    (hXY : X ⊆ Y) : G.IsIndepSet (X : Set V) :=
  hY.mono (by exact_mod_cast hXY)

/-- One marked extension vertex over an independent `(r-1)`-set. -/
abbrev OneLeft (r : Nat) :=
  Σ X : IndepAt G (r - 1), {v : V // v ∈ ext G X.1}

/-- One marked selected vertex in an independent `r`-set. -/
abbrev OneRight (r : Nat) :=
  Σ Y : IndepAt G r, {v : V // v ∈ Y.1}

def oneForward {r : Nat} (hr : 1 ≤ r) (p : OneLeft G r) : OneRight G r := by
  rcases p with ⟨X, v⟩
  refine ⟨⟨insert v.1 X.1, indep_insert_of_mem_ext G X.2.1 v.2, ?_⟩,
    ⟨v.1, Finset.mem_insert_self _ _⟩⟩
  have hvX : v.1 ∉ X.1 := (mem_ext G).mp v.2 |>.1
  rw [Finset.card_insert_of_notMem hvX, X.2.2]
  omega

def oneBackward {r : Nat} (p : OneRight G r) : OneLeft G r := by
  rcases p with ⟨Y, v⟩
  let X : Finset V := Y.1.erase v.1
  have hXsub : X ⊆ Y.1 := Finset.erase_subset _ _
  have hXind : G.IsIndepSet (X : Set V) := indep_mono G Y.2.1 hXsub
  have hXcard : X.card = r - 1 := by
    dsimp [X]
    rw [Finset.card_erase_of_mem v.2, Y.2.2]
  have hvX : v.1 ∈ ext G X := by
    rw [mem_ext]
    refine ⟨Finset.notMem_erase _ _, ?_⟩
    intro x hx
    have hxY : x ∈ Y.1 := hXsub hx
    have hvne : v.1 ≠ x := by
      exact (Finset.mem_erase.mp hx).1.symm
    exact Y.2.1 v.2 hxY hvne
  exact ⟨⟨X, hXind, hXcard⟩, ⟨v.1, hvX⟩⟩

def oneMarkEquiv (r : Nat) (hr : 1 ≤ r) : OneLeft G r ≃ OneRight G r where
  toFun := oneForward G hr
  invFun := oneBackward G
  left_inv := by
    rintro ⟨⟨X, hX⟩, ⟨v, hv⟩⟩
    have hbase : (insert v X).erase v = X := by
      simp [(mem_ext G).mp hv |>.1]
    change (⟨⟨(insert v X).erase v, _⟩, ⟨v, _⟩⟩ : OneLeft G r) =
      ⟨⟨X, hX⟩, ⟨v, hv⟩⟩
    apply Sigma.ext (Subtype.ext hbase)
    apply (Subtype.heq_iff_coe_eq (fun x => by simp [hbase])).2
    rfl
  right_inv := by
    rintro ⟨⟨Y, hY⟩, ⟨v, hv⟩⟩
    have hbase : insert v (Y.erase v) = Y := Finset.insert_erase hv
    change (⟨⟨insert v (Y.erase v), _⟩, ⟨v, _⟩⟩ : OneRight G r) =
      ⟨⟨Y, hY⟩, ⟨v, hv⟩⟩
    apply Sigma.ext (Subtype.ext hbase)
    apply (Subtype.heq_iff_coe_eq (fun x => by simp [hbase])).2
    rfl

theorem one_mark_sum (r : Nat) (hr : 1 ≤ r) :
    (∑ X : IndepAt G (r - 1), extensionCount G X.1) =
      r * independentSetCount G r := by
  calc
    (∑ X : IndepAt G (r - 1), extensionCount G X.1) = Fintype.card (OneLeft G r) := by
      rw [Fintype.card_sigma]
      apply Finset.sum_congr rfl
      intro X _
      exact (Fintype.card_coe (ext G X.1)).symm
    _ = Fintype.card (OneRight G r) := Fintype.card_congr (oneMarkEquiv G r hr)
    _ = r * independentSetCount G r := by
      rw [Fintype.card_sigma]
      simp only [Fintype.card_coe]
      calc
        (∑ Y : IndepAt G r, Y.1.card) = ∑ _Y : IndepAt G r, r := by
          apply Finset.sum_congr rfl
          intro Y _
          exact Y.2.2
        _ = r * independentSetCount G r := by
          simp [independentSetCount, mul_comm]

/-- Unordered two-marks selected from `S`. -/
abbrev PairMarks (S : Finset V) :=
  {P : Finset V // P ⊆ S ∧ P.card = 2}

/-- Unordered nonadjacent two-marks selected from `E`. -/
abbrev NonedgePairMarks (E : Finset V) :=
  {P : Finset V // P ⊆ E ∧ P.card = 2 ∧ G.IsIndepSet (P : Set V)}

abbrev TwoLeft (r : Nat) :=
  Σ X : IndepAt G (r - 1), NonedgePairMarks G (ext G X.1)

abbrev TwoRight (r : Nat) :=
  Σ Y : IndepAt G (r + 1), PairMarks Y.1

theorem indep_union_of_subset_ext {X P : Finset V}
    (hX : G.IsIndepSet (X : Set V)) (hP : G.IsIndepSet (P : Set V))
    (hPE : P ⊆ ext G X) : G.IsIndepSet ((X ∪ P : Finset V) : Set V) := by
  rw [G.isIndepSet_iff, Finset.coe_union, Set.pairwise_union]
  refine ⟨hX, hP, ?_⟩
  intro x hx p hp _
  have hpa : ¬G.Adj p x := (mem_ext G).mp (hPE hp) |>.2 x hx
  exact ⟨(fun hxp => hpa (G.adj_symm hxp)), hpa⟩

def twoForward {r : Nat} (hr : 1 ≤ r) (p : TwoLeft G r) : TwoRight G r := by
  rcases p with ⟨X, P⟩
  have hdisj : Disjoint X.1 P.1 := by
    rw [Finset.disjoint_left]
    intro x hxX hxP
    exact (mem_ext G).mp (P.2.1 hxP) |>.1 hxX
  have hcard : (X.1 ∪ P.1).card = r + 1 := by
    rw [Finset.card_union_of_disjoint hdisj, X.2.2, P.2.2.1]
    omega
  refine ⟨⟨X.1 ∪ P.1, indep_union_of_subset_ext G X.2.1 P.2.2.2 P.2.1, hcard⟩,
    ⟨P.1, Finset.subset_union_right, P.2.2.1⟩⟩

def twoBackward {r : Nat} (hr : 1 ≤ r) (p : TwoRight G r) : TwoLeft G r := by
  rcases p with ⟨Y, P⟩
  let X : Finset V := Y.1 \ P.1
  have hXsub : X ⊆ Y.1 := Finset.sdiff_subset
  have hXind : G.IsIndepSet (X : Set V) := indep_mono G Y.2.1 hXsub
  have hXcard : X.card = r - 1 := by
    dsimp [X]
    rw [Finset.card_sdiff, Finset.inter_eq_left.mpr P.2.1, Y.2.2, P.2.2]
    omega
  have hPind : G.IsIndepSet (P.1 : Set V) := indep_mono G Y.2.1 P.2.1
  have hPE : P.1 ⊆ ext G X := by
    intro p hp
    rw [mem_ext]
    refine ⟨by simp [X, hp], ?_⟩
    intro x hx
    have hxY : x ∈ Y.1 := hXsub hx
    have hpY : p ∈ Y.1 := P.2.1 hp
    have hpne : p ≠ x := by
      intro hpx
      subst x
      exact (by simpa [X, hp] using hx)
    exact Y.2.1 hpY hxY hpne
  exact ⟨⟨X, hXind, hXcard⟩, ⟨P.1, hPE, P.2.2, hPind⟩⟩

def twoMarkEquiv (r : Nat) (hr : 1 ≤ r) : TwoLeft G r ≃ TwoRight G r where
  toFun := twoForward G hr
  invFun := twoBackward G hr
  left_inv := by
    rintro ⟨⟨X, hX⟩, ⟨P, hP⟩⟩
    have hdisj : Disjoint X P := by
      rw [Finset.disjoint_left]
      intro x hxX hxP
      exact (mem_ext G).mp (hP.1 hxP) |>.1 hxX
    have hbase : (X ∪ P) \ P = X := by
      ext x
      constructor
      · intro hx
        exact (Finset.mem_union.mp (Finset.mem_sdiff.mp hx).1).resolve_right
          (Finset.mem_sdiff.mp hx).2
      · intro hx
        exact Finset.mem_sdiff.mpr ⟨Finset.mem_union_left _ hx,
          fun hp => Finset.disjoint_left.mp hdisj hx hp⟩
    change (⟨⟨(X ∪ P) \ P, _⟩, ⟨P, _⟩⟩ : TwoLeft G r) =
      ⟨⟨X, hX⟩, ⟨P, hP⟩⟩
    apply Sigma.ext (Subtype.ext hbase)
    apply (Subtype.heq_iff_coe_eq (fun Q => by simp [hbase])).2
    rfl
  right_inv := by
    rintro ⟨⟨Y, hY⟩, ⟨P, hP⟩⟩
    have hbase : Y \ P ∪ P = Y := Finset.sdiff_union_of_subset hP.1
    change (⟨⟨Y \ P ∪ P, _⟩, ⟨P, _⟩⟩ : TwoRight G r) =
      ⟨⟨Y, hY⟩, ⟨P, hP⟩⟩
    apply Sigma.ext (Subtype.ext hbase)
    apply (Subtype.heq_iff_coe_eq (fun Q => by simp [hbase])).2
    rfl

theorem card_pairMarks (S : Finset V) :
    Fintype.card (PairMarks S) = S.card.choose 2 := by
  let e : PairMarks S ≃ {P // P ∈ S.powersetCard 2} :=
    Equiv.subtypeEquiv (Equiv.refl (Finset V)) (by
      intro P
      simp [PairMarks, and_comm])
  calc
    Fintype.card (PairMarks S) = Fintype.card {P // P ∈ S.powersetCard 2} :=
      Fintype.card_congr e
    _ = (S.powersetCard 2).card := Fintype.card_coe _
    _ = S.card.choose 2 := Finset.card_powersetCard 2 S

/-- Off-diagonal unordered pairs supported on `S`, in Mathlib's `Sym2` representation. -/
abbrev SymPairMarks (S : Finset V) :=
  {z : Sym2 V // z ∈ S.sym2 ∧ ¬z.IsDiag}

def symPairToPair (S : Finset V) (z : SymPairMarks S) : PairMarks S := by
  refine ⟨z.1.toFinset, ?_, Sym2.card_toFinset_of_not_isDiag z.1 z.2.2⟩
  intro x hx
  exact Finset.mem_sym2_iff.mp z.2.1 x (Sym2.mem_toFinset.mp hx)

def symPairEquiv (S : Finset V) : SymPairMarks S ≃ PairMarks S :=
  Equiv.ofBijective (symPairToPair S) ⟨by
    intro z w h
    apply Subtype.ext
    apply Sym2.ext
    intro x
    have hfin : z.1.toFinset = w.1.toFinset := congrArg Subtype.val h
    rw [← Sym2.mem_toFinset, ← Sym2.mem_toFinset, hfin], by
    intro P
    rcases Finset.card_eq_two.mp P.2.2 with ⟨x, y, hxy, hP⟩
    have hxS : x ∈ S := P.2.1 (hP.symm ▸ Finset.mem_insert_self x {y})
    have hyS : y ∈ S := P.2.1 (hP.symm ▸ Finset.mem_insert_of_mem (Finset.mem_singleton_self y))
    let z : SymPairMarks S := ⟨s(x, y), Finset.mk_mem_sym2_iff.mpr ⟨hxS, hyS⟩,
      by simpa [Sym2.mk_isDiag_iff] using hxy⟩
    refine ⟨z, ?_⟩
    apply Subtype.ext
    exact Sym2.toFinset_mk_eq.trans hP.symm⟩

theorem indep_pair_iff {x y : V} (hxy : x ≠ y) :
    G.IsIndepSet (({x, y} : Finset V) : Set V) ↔ ¬G.Adj x y := by
  constructor
  · intro h
    exact h (by simp) (by simp) hxy
  · intro h a ha b hb hab
    simp only [Finset.mem_coe, Finset.mem_insert, Finset.mem_singleton] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact (hab rfl).elim
    · exact h
    · exact fun hyx => h (G.adj_symm hyx)
    · exact (hab rfl).elim

theorem indep_toFinset_iff_compl_edgeSet (z : Sym2 V) (hz : ¬z.IsDiag) :
    G.IsIndepSet (z.toFinset : Set V) ↔ z ∈ Gᶜ.edgeSet := by
  induction z using Sym2.inductionOn with
  | _ x y =>
      rw [Sym2.mk_isDiag_iff] at hz
      rw [Sym2.toFinset_mk_eq, indep_pair_iff G hz, SimpleGraph.mem_edgeSet,
        SimpleGraph.compl_adj]
      simp [hz]

abbrev SymNonedgeMarks (E : Finset V) :=
  {z : Sym2 V // z ∈ E.sym2 ∧ ¬z.IsDiag ∧ G.IsIndepSet (z.toFinset : Set V)}

def symNonedgeToPair (E : Finset V) (z : SymNonedgeMarks G E) :
    NonedgePairMarks G E := by
  refine ⟨z.1.toFinset, ?_, Sym2.card_toFinset_of_not_isDiag z.1 z.2.2.1, z.2.2.2⟩
  intro x hx
  exact Finset.mem_sym2_iff.mp z.2.1 x (Sym2.mem_toFinset.mp hx)

def symNonedgeEquiv (E : Finset V) :
    SymNonedgeMarks G E ≃ NonedgePairMarks G E :=
  Equiv.ofBijective (symNonedgeToPair G E) ⟨by
    intro z w h
    apply Subtype.ext
    apply Sym2.ext
    intro x
    have hfin : z.1.toFinset = w.1.toFinset := congrArg Subtype.val h
    rw [← Sym2.mem_toFinset, ← Sym2.mem_toFinset, hfin], by
    intro P
    let P0 : PairMarks E := ⟨P.1, P.2.1, P.2.2.1⟩
    rcases (symPairEquiv E).surjective P0 with ⟨z, hz⟩
    have hfin : z.1.toFinset = P.1 := congrArg Subtype.val hz
    let zN : SymNonedgeMarks G E :=
      ⟨z.1, z.2.1, z.2.2, by simpa [hfin] using P.2.2.2⟩
    refine ⟨zN, ?_⟩
    apply Subtype.ext
    exact hfin⟩

theorem compl_induce (E : Finset V) :
    (G.induce (E : Set V))ᶜ = Gᶜ.induce (E : Set V) := by
  ext u v
  simp only [SimpleGraph.compl_adj, SimpleGraph.induce_adj, Subtype.coe_ne_coe]

theorem card_compl_edgeFinset {W : Type*} [Fintype W] [DecidableEq W]
    (H : SimpleGraph W) [DecidableRel H.Adj] :
    Hᶜ.edgeFinset.card = (Fintype.card W).choose 2 - H.edgeFinset.card := by
  have hdisj : Disjoint H.edgeFinset Hᶜ.edgeFinset := by
    rw [Finset.disjoint_left]
    intro z hzH hzC
    induction z using Sym2.inductionOn with
    | _ u v =>
        have hH : H.Adj u v := (SimpleGraph.mem_edgeSet H).mp
          (SimpleGraph.mem_edgeFinset.mp hzH)
        have hC : Hᶜ.Adj u v := (SimpleGraph.mem_edgeSet Hᶜ).mp
          (SimpleGraph.mem_edgeFinset.mp hzC)
        exact (SimpleGraph.compl_adj H u v).mp hC |>.2 hH
  have htop : H.edgeFinset ∪ Hᶜ.edgeFinset = (⊤ : SimpleGraph W).edgeFinset := by
    ext z
    induction z using Sym2.inductionOn with
    | _ u v =>
        simp only [Finset.mem_union, SimpleGraph.mem_edgeFinset,
          SimpleGraph.mem_edgeSet, SimpleGraph.compl_adj, SimpleGraph.top_adj]
        constructor
        · rintro (huv | ⟨hne, _⟩)
          · exact H.ne_of_adj huv
          · exact hne
        · intro hne
          by_cases huv : H.Adj u v
          · exact Or.inl huv
          · exact Or.inr ⟨hne, huv⟩
  have hc := congrArg Finset.card htop
  rw [Finset.card_union_of_disjoint hdisj,
    SimpleGraph.card_edgeFinset_top_eq_card_choose_two] at hc
  omega

theorem card_nonedgePairMarks (E : Finset V) :
    Fintype.card (NonedgePairMarks G E) =
      E.card.choose 2 - (G.induce (E : Set V)).edgeFinset.card := by
  let I : Finset (Sym2 V) := Gᶜ.edgeFinset ∩ E.sym2
  let e : SymNonedgeMarks G E ≃ {z : Sym2 V // z ∈ I} :=
    Equiv.subtypeEquiv (Equiv.refl (Sym2 V)) (by
      intro z
      constructor
      · rintro ⟨hzE, hzdiag, hzind⟩
        exact Finset.mem_inter.mpr ⟨SimpleGraph.mem_edgeFinset.mpr
          ((indep_toFinset_iff_compl_edgeSet G z hzdiag).mp hzind), hzE⟩
      · intro hzI
        have hc : z ∈ Gᶜ.edgeSet := SimpleGraph.mem_edgeFinset.mp
          (Finset.mem_inter.mp hzI).1
        have hzdiag : ¬z.IsDiag := Gᶜ.not_isDiag_of_mem_edgeSet hc
        exact ⟨(Finset.mem_inter.mp hzI).2, hzdiag,
          (indep_toFinset_iff_compl_edgeSet G z hzdiag).mpr hc⟩)
  letI : Fintype {x // x ∈ (E : Set V)} := Finset.fintypeCoeSort E
  have hmap := SimpleGraph.map_edgeFinset_induce (G := Gᶜ) (s := (E : Set V))
  have hmapCard := congrArg Finset.card hmap
  rw [Finset.card_map] at hmapCard
  have hmapCard' : (Gᶜ.induce (E : Set V)).edgeFinset.card = I.card := by
    convert hmapCard using 1
    · apply congrArg Finset.card
      ext z
      simp only [SimpleGraph.mem_edgeFinset]
    · simp [I]
  calc
    Fintype.card (NonedgePairMarks G E) = Fintype.card (SymNonedgeMarks G E) :=
      Fintype.card_congr (symNonedgeEquiv G E).symm
    _ = Fintype.card {z : Sym2 V // z ∈ I} := Fintype.card_congr e
    _ = I.card := Fintype.card_coe I
    _ = (Gᶜ.induce (E : Set V)).edgeFinset.card := hmapCard'.symm
    _ = ((G.induce (E : Set V))ᶜ).edgeFinset.card := by
      apply congrArg Finset.card
      ext z
      simp only [SimpleGraph.mem_edgeFinset]
      rw [compl_induce G E]
    _ = E.card.choose 2 - (G.induce (E : Set V)).edgeFinset.card := by
      simpa using card_compl_edgeFinset (G.induce (E : Set V))

theorem two_mark_count (r : Nat) (hr : 1 ≤ r) :
    (∑ X : IndepAt G (r - 1), Fintype.card (NonedgePairMarks G (ext G X.1))) =
      (r + 1).choose 2 * independentSetCount G (r + 1) := by
  calc
    (∑ X : IndepAt G (r - 1), Fintype.card (NonedgePairMarks G (ext G X.1))) =
        Fintype.card (TwoLeft G r) := by simp [TwoLeft, Fintype.card_sigma]
    _ = Fintype.card (TwoRight G r) := Fintype.card_congr (twoMarkEquiv G r hr)
    _ = (r + 1).choose 2 * independentSetCount G (r + 1) := by
      rw [Fintype.card_sigma]
      simp_rw [card_pairMarks]
      calc
        (∑ Y : IndepAt G (r + 1), Y.1.card.choose 2) =
            ∑ _Y : IndepAt G (r + 1), (r + 1).choose 2 := by
          apply Finset.sum_congr rfl
          intro Y _
          rw [Y.2.2]
        _ = (r + 1).choose 2 * independentSetCount G (r + 1) := by
          simp [independentSetCount, mul_comm]

theorem card_nonedgePairMarks_ext (X : Finset V) :
    Fintype.card (NonedgePairMarks G (ext G X)) =
      (extensionCount G X).choose 2 - residualEdgeCount G X := by
  have hedge : residualEdgeCount G X =
      (G.induce (ext G X : Set V)).edgeFinset.card := by
    unfold residualEdgeCount RSpec
    apply congrArg Finset.card
    ext z
    simp only [SimpleGraph.mem_edgeFinset]
    rfl
  rw [hedge]
  simpa [extensionCount] using card_nonedgePairMarks G (ext G X)

theorem two_mark_sum (r : Nat) (hr : 1 ≤ r) :
    (∑ S : IndepAt G (r - 1),
      ((extensionCount G S.1).choose 2 - residualEdgeCount G S.1)) =
      (r + 1).choose 2 * independentSetCount G (r + 1) := by
  simpa only [card_nonedgePairMarks_ext] using two_mark_count G r hr

theorem two_mul_choose_two (n : Nat) :
    2 * n.choose 2 = n * (n - 1) := by
  induction n with
  | zero => simp
  | succ n ih =>
      rw [Nat.choose_succ_succ n 1, Nat.choose_one_right, mul_add, ih]
      cases n with
      | zero => simp
      | succ k =>
          simp only [Nat.succ_eq_add_one, Nat.add_sub_cancel]
          ring

theorem residualEdgeCount_le (X : Finset V) :
    residualEdgeCount G X ≤ (extensionCount G X).choose 2 := by
  letI : Fintype {v // v ∈ ext G X} := Finset.fintypeCoeSort (ext G X)
  letI : Fintype (RSpec G X).edgeSet := Fintype.ofFinite _
  have h := SimpleGraph.card_edgeFinset_le_card_choose_two (G := RSpec G X)
  have hvcard : Fintype.card ↥(ext G X) = (ext G X).card :=
    Fintype.card_coe (ext G X)
  rw [hvcard] at h
  unfold residualEdgeCount extensionCount
  convert h using 1
  apply congrArg Finset.card
  ext z
  simp only [SimpleGraph.mem_edgeFinset]

theorem charge_arithmetic (e m r : Nat) (hm : m ≤ e.choose 2) :
    (e : Int) * ((e : Int) - (r : Int) - 2) - 2 * (m : Int) =
      2 * ((e.choose 2 - m : Nat) : Int) - ((r + 1 : Nat) : Int) * (e : Int) := by
  rw [Nat.cast_sub hm]
  have hcNat := two_mul_choose_two e
  have hcInt : (2 : Int) * (e.choose 2 : Int) =
      (e : Int) * ((e - 1 : Nat) : Int) := by
    exact_mod_cast hcNat
  cases e with
  | zero =>
      simp at hm
      subst m
      simp
  | succ e =>
      simp only [Nat.add_sub_cancel] at hcInt
      push_cast at hcInt ⊢
      nlinarith

theorem charge_sum (r : Nat) (hr : 1 ≤ r) :
    (∑ X : IndepAt G (r - 1),
      ((extensionCount G X.1 : Int) *
          ((extensionCount G X.1 : Int) - (r : Int) - 2) -
        2 * (residualEdgeCount G X.1 : Int))) =
      (r : Int) * ((r + 1 : Nat) : Int) * delta G r := by
  have hOneNat := one_mark_sum G r hr
  have hTwoNat := two_mark_sum G r hr
  have hOne : (∑ X : IndepAt G (r - 1), (extensionCount G X.1 : Int)) =
      (r : Int) * (independentSetCount G r : Int) := by
    exact_mod_cast hOneNat
  have hTwo : (∑ X : IndepAt G (r - 1),
      (((extensionCount G X.1).choose 2 - residualEdgeCount G X.1 : Nat) : Int)) =
      ((r + 1).choose 2 : Int) * (independentSetCount G (r + 1) : Int) := by
    exact_mod_cast hTwoNat
  have hCoeffNat := two_mul_choose_two (r + 1)
  have hCoeffNat' : 2 * (r + 1).choose 2 = r * (r + 1) := by
    simpa [mul_comm] using hCoeffNat
  have hCoeff : (2 : Int) * ((r + 1).choose 2 : Int) =
      (r : Int) * ((r + 1 : Nat) : Int) := by
    exact_mod_cast hCoeffNat'
  calc
    (∑ X : IndepAt G (r - 1),
      ((extensionCount G X.1 : Int) *
          ((extensionCount G X.1 : Int) - (r : Int) - 2) -
        2 * (residualEdgeCount G X.1 : Int))) =
        ∑ X : IndepAt G (r - 1),
          (2 * (((extensionCount G X.1).choose 2 - residualEdgeCount G X.1 : Nat) : Int) -
            ((r + 1 : Nat) : Int) * (extensionCount G X.1 : Int)) := by
      apply Finset.sum_congr rfl
      intro X _
      exact charge_arithmetic (extensionCount G X.1) (residualEdgeCount G X.1) r
        (residualEdgeCount_le G X.1)
    _ = 2 * (∑ X : IndepAt G (r - 1),
          (((extensionCount G X.1).choose 2 - residualEdgeCount G X.1 : Nat) : Int)) -
        ((r + 1 : Nat) : Int) *
          (∑ X : IndepAt G (r - 1), (extensionCount G X.1 : Int)) := by
      rw [Finset.sum_sub_distrib, Finset.mul_sum, Finset.mul_sum]
    _ = (r : Int) * ((r + 1 : Nat) : Int) * delta G r := by
      rw [hOne, hTwo]
      calc
        2 * (((r + 1).choose 2 : Int) * (independentSetCount G (r + 1) : Int)) -
            ((r + 1 : Nat) : Int) *
              ((r : Int) * (independentSetCount G r : Int)) =
            ((2 : Int) * ((r + 1).choose 2 : Int)) *
              (independentSetCount G (r + 1) : Int) -
            ((r + 1 : Nat) : Int) *
              ((r : Int) * (independentSetCount G r : Int)) := by ring
        _ = ((r : Int) * ((r + 1 : Nat) : Int)) *
              (independentSetCount G (r + 1) : Int) -
            ((r + 1 : Nat) : Int) *
              ((r : Int) * (independentSetCount G r : Int)) := by rw [hCoeff]
        _ = (r : Int) * ((r + 1 : Nat) : Int) * delta G r := by
          simp only [delta]
          ring

/-- The exact N4 theorem for a finite labelled tree. The tree hypothesis is intentionally
retained even though the marked-extension count is valid for every finite simple graph. -/
theorem labelled_tree_marked_extension_charge_identity {n : Nat}
    (T : SimpleGraph (Fin n)) [DecidableRel T.Adj] (hT : T.IsTree)
    (r : Nat) (hr : 1 ≤ r) :
    (∑ X : IndepAt T (r - 1), extensionCount T X.1) =
        r * independentSetCount T r ∧
    (∑ X : IndepAt T (r - 1),
        ((extensionCount T X.1).choose 2 - residualEdgeCount T X.1)) =
        (r + 1).choose 2 * independentSetCount T (r + 1) ∧
    (∑ X : IndepAt T (r - 1),
        ((extensionCount T X.1 : Int) *
            ((extensionCount T X.1 : Int) - (r : Int) - 2) -
          2 * (residualEdgeCount T X.1 : Int))) =
        (r : Int) * ((r + 1 : Nat) : Int) * delta T r := by
  exact ⟨one_mark_sum T r hr, two_mark_sum T r hr, charge_sum T r hr⟩

end

end MarkedExtensionCharge
