import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.Sum
import Mathlib.Tactic

set_option autoImplicit false

namespace C4F306

noncomputable section

/-- Labels for the two core vertices, the two left leaves, and the `m` right leaves. -/
abbrev Vertex (m : Nat) := Fin 2 ⊕ (Fin 2 ⊕ Fin m)

def u (m : Nat) : Vertex m := Sum.inl 0
def v (m : Nat) : Vertex m := Sum.inl 1
def leftLeaf {m : Nat} (i : Fin 2) : Vertex m := Sum.inr (Sum.inl i)
def rightLeaf {m : Nat} (i : Fin m) : Vertex m := Sum.inr (Sum.inr i)

/-- Exactly the core edge and the prescribed pendant edges of `D_(2,m)`. -/
def doubleBroomAdj {m : Nat} : Vertex m → Vertex m → Prop
  | Sum.inl i, Sum.inl j =>
      (i = (0 : Fin 2) ∧ j = (1 : Fin 2)) ∨
        (i = (1 : Fin 2) ∧ j = (0 : Fin 2))
  | Sum.inl i, Sum.inr (Sum.inl _) => i = (0 : Fin 2)
  | Sum.inr (Sum.inl _), Sum.inl j => j = (0 : Fin 2)
  | Sum.inl i, Sum.inr (Sum.inr _) => i = (1 : Fin 2)
  | Sum.inr (Sum.inr _), Sum.inl j => j = (1 : Fin 2)
  | _, _ => False

theorem doubleBroomAdj_symm {m : Nat} {x y : Vertex m}
    (h : doubleBroomAdj x y) : doubleBroomAdj y x := by
  rcases x with i | a <;> rcases y with j | b
  · simpa [doubleBroomAdj, and_comm, or_comm] using h
  · rcases b with b | b <;> simpa [doubleBroomAdj] using h
  · rcases a with a | a <;> simpa [doubleBroomAdj] using h
  · simp [doubleBroomAdj] at h

theorem doubleBroomAdj_irrefl {m : Nat} (x : Vertex m) : ¬doubleBroomAdj x x := by
  rcases x with i | a
  · fin_cases i <;> simp [doubleBroomAdj]
  · rcases a with a | a <;> simp [doubleBroomAdj]

/-- The finite labelled double-broom `D_(2,m)`. -/
def doubleBroom (m : Nat) : SimpleGraph (Vertex m) where
  Adj := doubleBroomAdj
  symm := ⟨fun _ _ h => doubleBroomAdj_symm h⟩
  loopless := ⟨doubleBroomAdj_irrefl (m := m)⟩

instance doubleBroomAdj_decidable {m : Nat} : DecidableRel (@doubleBroomAdj m) := by
  intro x y
  rcases x with i | a <;> rcases y with j | b
  · simp only [doubleBroomAdj]
    infer_instance
  · rcases b with b | b <;> simp only [doubleBroomAdj] <;> infer_instance
  · rcases a with a | a <;> simp only [doubleBroomAdj] <;> infer_instance
  · simp only [doubleBroomAdj]
    infer_instance

instance (m : Nat) : DecidableRel (doubleBroom m).Adj :=
  doubleBroomAdj_decidable

/-- Independent vertex sets of exactly rank `r` in a finite graph. -/
abbrev IndepAt {W : Type*} [Fintype W] [DecidableEq W]
    (G : SimpleGraph W) [DecidableRel G.Adj] (r : Nat) :=
  {X : Finset W // G.IsIndepSet (X : Set W) ∧ X.card = r}

/-- The actual number of independent vertex sets of rank `r` in a finite graph. -/
def graphIndependentSetCount {W : Type*} [Fintype W] [DecidableEq W]
    (G : SimpleGraph W) [DecidableRel G.Adj] (r : Nat) : Nat :=
  Fintype.card (IndepAt G r)

/-- Integer adjacent differences of actual independent-set counts. -/
def graphDelta {W : Type*} [Fintype W] [DecidableEq W]
    (G : SimpleGraph W) [DecidableRel G.Adj] (r : Nat) : Int :=
  (graphIndependentSetCount G (r + 1) : Int) - graphIndependentSetCount G r

/-- Exact plateau-safe first recovery for any finite graph. -/
def FR {W : Type*} [Fintype W] [DecidableEq W]
    (G : SimpleGraph W) [DecidableRel G.Adj] (p q : Nat) : Prop :=
  p < q ∧
    graphDelta G p < 0 ∧
    (∀ r : Nat, p < r → r < q → graphDelta G r ≤ 0) ∧
    graphDelta G q > 0

/-- The actual number of independent vertex sets of rank `r` in `D_(2,m)`. -/
def independentSetCount (m r : Nat) : Nat :=
  graphIndependentSetCount (doubleBroom m) r

/-- Integer adjacent differences of the actual counts for `D_(2,m)`. -/
def delta (m r : Nat) : Int :=
  graphDelta (doubleBroom m) r

/-- Fixed-cardinality finsets, used only as the codomain of the counting bridge. -/
abbrev FixedCard (A : Type*) [DecidableEq A] (r : Nat) :=
  {S : Finset A // S.card = r}

/-- Leaf sets whose core-selected total rank is exactly `r`. -/
abbrev CoreConfig (A : Type*) [DecidableEq A] (r : Nat) :=
  {S : Finset A // S.card + 1 = r}

/-- The three possible core states of an independent set: neither, `u`, or `v`. -/
abbrev Config (m r : Nat) :=
  FixedCard (Fin 2 ⊕ Fin m) r ⊕
    (CoreConfig (Fin m) r ⊕ CoreConfig (Fin 2) r)

def decodeConfig {m r : Nat} : Config m r → IndepAt (doubleBroom m) r
  | Sum.inl S => by
      refine ⟨(∅ : Finset (Fin 2)).disjSum S.1, ?_, ?_⟩
      · intro x hx y hy hxy
        rcases x with x | x <;> rcases y with y | y
        · simp at hx
        · simp at hx
        · simp at hy
        · simp [doubleBroom, doubleBroomAdj]
      · simpa using S.2
  | Sum.inr (Sum.inl R) => by
      refine ⟨({0} : Finset (Fin 2)).disjSum
        ((∅ : Finset (Fin 2)).disjSum R.1), ?_, ?_⟩
      · intro x hx y hy hxy
        rcases x with x | x <;> rcases y with y | y
        · fin_cases x <;> fin_cases y <;> simp_all
        · rcases y with y | y
          · simp at hy
          · fin_cases x <;> simp_all [doubleBroom, doubleBroomAdj]
        · rcases x with x | x
          · simp at hx
          · fin_cases y <;> simp_all [doubleBroom, doubleBroomAdj]
        · simp [doubleBroom, doubleBroomAdj]
      · simpa [Finset.card_disjSum, Nat.add_comm] using R.2
  | Sum.inr (Sum.inr L) => by
      refine ⟨({1} : Finset (Fin 2)).disjSum
        (L.1.disjSum (∅ : Finset (Fin m))), ?_, ?_⟩
      · intro x hx y hy hxy
        rcases x with x | x <;> rcases y with y | y
        · fin_cases x <;> fin_cases y <;> simp_all
        · rcases y with y | y
          · fin_cases x <;> simp_all [doubleBroom, doubleBroomAdj]
          · simp at hy
        · rcases x with x | x
          · fin_cases y <;> simp_all [doubleBroom, doubleBroomAdj]
          · simp at hx
        · simp [doubleBroom, doubleBroomAdj]
      · simpa [Finset.card_disjSum, Nat.add_comm] using L.2

@[simp] theorem adj_u_v (m : Nat) : (doubleBroom m).Adj (u m) (v m) := by
  simp [doubleBroom, doubleBroomAdj, u, v]

@[simp] theorem adj_u_leftLeaf {m : Nat} (i : Fin 2) :
    (doubleBroom m).Adj (u m) (leftLeaf i) := by
  simp [doubleBroom, doubleBroomAdj, u, leftLeaf]

@[simp] theorem adj_v_rightLeaf {m : Nat} (i : Fin m) :
    (doubleBroom m).Adj (v m) (rightLeaf i) := by
  simp [doubleBroom, doubleBroomAdj, v, rightLeaf]

theorem not_mem_of_indep_adj {m : Nat} {X : Finset (Vertex m)}
    (hX : (doubleBroom m).IsIndepSet (X : Set (Vertex m)))
    {a b : Vertex m} (ha : a ∈ X) (hab : (doubleBroom m).Adj a b) : b ∉ X := by
  intro hb
  exact hX ha hb ((doubleBroom m).ne_of_adj hab) hab

theorem decodeConfig_injective {m r : Nat} :
    Function.Injective (@decodeConfig m r) := by
  intro A B h
  rcases A with A | A
  · rcases B with B | B
    · apply congrArg Sum.inl
      apply Subtype.ext
      have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
      exact (Finset.disjSum_inj.mp hval).2
    · rcases B with B | B
      · have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
        have hc := (Finset.disjSum_inj.mp hval).1
        have : False := by simp at hc
        exact this.elim
      · have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
        have hc := (Finset.disjSum_inj.mp hval).1
        have : False := by simp at hc
        exact this.elim
  · rcases A with A | A
    · rcases B with B | B
      · have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
        have hc := (Finset.disjSum_inj.mp hval).1
        have : False := by simp at hc
        exact this.elim
      · rcases B with B | B
        · apply congrArg (fun Z => Sum.inr (Sum.inl Z))
          apply Subtype.ext
          have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
          have hr := (Finset.disjSum_inj.mp hval).2
          exact (Finset.disjSum_inj.mp hr).2
        · have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
          have hc := (Finset.disjSum_inj.mp hval).1
          have : False := by simp at hc
          exact this.elim
    · rcases B with B | B
      · have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
        have hc := (Finset.disjSum_inj.mp hval).1
        have : False := by simp at hc
        exact this.elim
      · rcases B with B | B
        · have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
          have hc := (Finset.disjSum_inj.mp hval).1
          have : False := by simp at hc
          exact this.elim
        · apply congrArg (fun Z => Sum.inr (Sum.inr Z))
          apply Subtype.ext
          have hval := congrArg (fun Z : IndepAt (doubleBroom m) r => Z.1) h
          have hr := (Finset.disjSum_inj.mp hval).2
          exact (Finset.disjSum_inj.mp hr).1

theorem decodeConfig_surjective {m r : Nat} :
    Function.Surjective (@decodeConfig m r) := by
  rintro ⟨X, hX, hcard⟩
  by_cases hu : u m ∈ X
  · have hv : v m ∉ X := not_mem_of_indep_adj hX hu (adj_u_v m)
    have hl (i : Fin 2) : leftLeaf i ∉ X :=
      not_mem_of_indep_adj hX hu (adj_u_leftLeaf i)
    let R : Finset (Fin m) := X.toRight.toRight
    have hshape : X = ({0} : Finset (Fin 2)).disjSum
        ((∅ : Finset (Fin 2)).disjSum R) := by
      ext z
      rcases z with i | a
      · fin_cases i
        · simpa [u] using hu
        · simpa [v] using hv
      · rcases a with a | i
        · simpa [leftLeaf] using hl a
        · simp [R]
    have hRcard : R.card + 1 = r := by
      have hc := congrArg Finset.card hshape
      simp [Finset.card_disjSum, hcard] at hc
      omega
    let C : Config m r := Sum.inr (Sum.inl ⟨R, hRcard⟩)
    refine ⟨C, ?_⟩
    apply Subtype.ext
    simpa [C, decodeConfig] using hshape.symm
  · by_cases hv : v m ∈ X
    · have hr (i : Fin m) : rightLeaf i ∉ X :=
        not_mem_of_indep_adj hX hv (adj_v_rightLeaf i)
      let L : Finset (Fin 2) := X.toRight.toLeft
      have hshape : X = ({1} : Finset (Fin 2)).disjSum
          (L.disjSum (∅ : Finset (Fin m))) := by
        ext z
        rcases z with i | a
        · fin_cases i
          · simpa [u] using hu
          · simpa [v] using hv
        · rcases a with a | i
          · simp [L]
          · simpa [rightLeaf] using hr i
      have hLcard : L.card + 1 = r := by
        have hc := congrArg Finset.card hshape
        simp [Finset.card_disjSum, hcard] at hc
        omega
      let C : Config m r := Sum.inr (Sum.inr ⟨L, hLcard⟩)
      refine ⟨C, ?_⟩
      apply Subtype.ext
      simpa [C, decodeConfig] using hshape.symm
    · let S : Finset (Fin 2 ⊕ Fin m) := X.toRight
      have hshape : X = (∅ : Finset (Fin 2)).disjSum S := by
        ext z
        rcases z with i | a
        · fin_cases i
          · simpa [u] using hu
          · simpa [v] using hv
        · simp [S]
      have hScard : S.card = r := by
        have hc := congrArg Finset.card hshape
        simpa [Finset.card_disjSum, hcard] using hc.symm
      let C : Config m r := Sum.inl ⟨S, hScard⟩
      refine ⟨C, ?_⟩
      apply Subtype.ext
      simpa [C, decodeConfig] using hshape.symm

/-- Bijection witnessing the exact bridge from labelled independent sets to coefficients. -/
def configEquivIndep {m r : Nat} : Config m r ≃ IndepAt (doubleBroom m) r :=
  Equiv.ofBijective decodeConfig ⟨decodeConfig_injective, decodeConfig_surjective⟩

theorem card_fixedCard (A : Type*) [Fintype A] [DecidableEq A] (r : Nat) :
    Fintype.card (FixedCard A r) = (Fintype.card A).choose r := by
  let P : Finset (Finset A) := Finset.univ.powersetCard r
  letI : Fintype {S : Finset A // S ∈ P} := Finset.fintypeCoeSort P
  let e : FixedCard A r ≃ {S : Finset A // S ∈ P} :=
    Equiv.subtypeEquiv (Equiv.refl (Finset A)) (by
      intro S
      simp [P])
  calc
    Fintype.card (FixedCard A r) =
        Fintype.card {S : Finset A // S ∈ P} :=
      Fintype.card_congr e
    _ = P.card := Fintype.card_coe P
    _ = (Fintype.card A).choose r := by simp [P]

theorem card_coreConfig_of_pos (A : Type*) [Fintype A] [DecidableEq A]
    (r : Nat) (hr : 1 ≤ r) :
    Fintype.card (CoreConfig A r) = (Fintype.card A).choose (r - 1) := by
  let e : CoreConfig A r ≃ FixedCard A (r - 1) :=
    Equiv.subtypeEquiv (Equiv.refl (Finset A)) (by
      intro S
      change (S.card + 1 = r ↔ S.card = r - 1)
      omega)
  exact (Fintype.card_congr e).trans (card_fixedCard A (r - 1))

theorem card_coreConfig_zero (A : Type*) [Fintype A] [DecidableEq A] :
    Fintype.card (CoreConfig A 0) = 0 := by
  apply Fintype.card_eq_zero_iff.mpr
  exact ⟨fun S => by have := S.2; omega⟩

/-- The coefficient formula is proved from the actual graph count via `configEquivIndep`. -/
theorem independentSetCount_eq_coeff (m r : Nat) (hr : 1 ≤ r) :
    independentSetCount m r =
      (m + 2).choose r + m.choose (r - 1) + (2 : Nat).choose (r - 1) := by
  rw [independentSetCount, graphIndependentSetCount]
  calc
    Fintype.card (IndepAt (doubleBroom m) r) = Fintype.card (Config m r) :=
      Fintype.card_congr configEquivIndep.symm
    _ = Fintype.card (FixedCard (Fin 2 ⊕ Fin m) r) +
          Fintype.card (CoreConfig (Fin m) r) +
          Fintype.card (CoreConfig (Fin 2) r) := by
      simp only [Config, Fintype.card_sum, Nat.add_assoc]
    _ = (m + 2).choose r + m.choose (r - 1) + (2 : Nat).choose (r - 1) := by
      rw [card_fixedCard, card_coreConfig_of_pos _ r hr,
        card_coreConfig_of_pos _ r hr]
      simp [Nat.add_comm]

theorem independentSetCount_zero (m : Nat) : independentSetCount m 0 = 1 := by
  rw [independentSetCount, graphIndependentSetCount]
  calc
    Fintype.card (IndepAt (doubleBroom m) 0) = Fintype.card (Config m 0) :=
      Fintype.card_congr configEquivIndep.symm
    _ = Fintype.card (FixedCard (Fin 2 ⊕ Fin m) 0) +
          Fintype.card (CoreConfig (Fin m) 0) +
          Fintype.card (CoreConfig (Fin 2) 0) := by
      simp only [Config, Fintype.card_sum, Nat.add_assoc]
    _ = 1 := by
      rw [card_fixedCard, card_coreConfig_zero, card_coreConfig_zero]
      simp

/-- The adjacent difference of `(1+x)^(m+2) + x(1+x)^m`. -/
def mainDelta (m r : Nat) : Int :=
  ((m + 2).choose (r + 1) : Int) + (m.choose r : Int) -
    ((m + 2).choose r : Int) - (m.choose (r - 1) : Int)

/-- The linear sign controller for `mainDelta`. -/
def score (m r : Nat) : Int := (m : Int) + 1 - 2 * (r : Int)

/-- The positive binomial weight in the exact sign identity. -/
def weight (m r : Nat) : Int :=
  (r : Int) * ((m + 2).choose r : Int) +
    ((r : Int) + 1) * (m.choose (r - 1) : Int)

theorem delta_eq_coeff (m r : Nat) (hr : 1 ≤ r) :
    delta m r =
      ((m + 2).choose (r + 1) + m.choose r + (2 : Nat).choose r : Int) -
      ((m + 2).choose r + m.choose (r - 1) + (2 : Nat).choose (r - 1) : Nat) := by
  rw [delta, graphDelta]
  change (independentSetCount m (r + 1) : Int) - independentSetCount m r = _
  rw [independentSetCount_eq_coeff m (r + 1) (by omega),
    independentSetCount_eq_coeff m r hr]
  simp only [Nat.add_sub_cancel]
  push_cast
  rfl

theorem delta_zero_eq (m : Nat) : delta m 0 = (m : Int) + 3 := by
  rw [delta, graphDelta]
  change (independentSetCount m 1 : Int) - independentSetCount m 0 = _
  rw [independentSetCount_eq_coeff m 1 (by omega),
    independentSetCount_zero]
  simp [Nat.choose_one_right]
  ring

theorem delta_eq_main_add_correction (m r : Nat) (hr : 1 ≤ r) :
    delta m r = mainDelta m r + ((2 : Nat).choose r : Int) -
      ((2 : Nat).choose (r - 1) : Int) := by
  rw [delta_eq_coeff m r hr]
  push_cast
  simp only [mainDelta]
  ring

theorem delta_one_eq (m : Nat) : delta m 1 = mainDelta m 1 + 1 := by
  rw [delta_eq_main_add_correction m 1 (by omega)]
  norm_num
  ring

theorem delta_two_eq (m : Nat) : delta m 2 = mainDelta m 2 - 1 := by
  rw [delta_eq_main_add_correction m 2 (by omega)]
  norm_num
  ring

theorem delta_three_eq (m : Nat) : delta m 3 = mainDelta m 3 - 1 := by
  rw [delta_eq_main_add_correction m 3 (by omega)]
  norm_num

theorem delta_eq_main_of_ge_four (m r : Nat) (hr : 4 ≤ r) :
    delta m r = mainDelta m r := by
  rw [delta_eq_main_add_correction m r (by omega),
    Nat.choose_eq_zero_of_lt (by omega : 2 < r),
    Nat.choose_eq_zero_of_lt (by omega : 2 < r - 1)]
  ring

theorem mainDelta_score_identity (m r : Nat) (hr : 1 ≤ r) :
    ((r : Int) * ((r : Int) + 1)) * mainDelta m r =
      score m r * weight m r := by
  by_cases hrm : r ≤ m + 1
  · have hrA : r ≤ m + 2 := by omega
    have hrpred : r - 1 ≤ m := by omega
    have hAraw :
        ((m + 2).choose (r + 1) : Int) * ((r : Int) + 1) =
          ((m + 2).choose r : Int) * (((m + 2 - r : Nat) : Int)) := by
      exact_mod_cast Nat.choose_succ_right_eq (m + 2) r
    have hA :
        ((m + 2).choose (r + 1) : Int) * ((r : Int) + 1) =
          ((m + 2).choose r : Int) * ((m : Int) + 2 - (r : Int)) := by
      rw [Nat.cast_sub hrA] at hAraw
      norm_num at hAraw ⊢
      exact hAraw
    have hpred : r - 1 + 1 = r := Nat.sub_add_cancel hr
    have hBN := Nat.choose_succ_right_eq m (r - 1)
    rw [hpred] at hBN
    have hBraw :
        (m.choose r : Int) * (r : Int) =
          (m.choose (r - 1) : Int) * (((m - (r - 1) : Nat) : Int)) := by
      exact_mod_cast hBN
    have hB :
        (m.choose r : Int) * (r : Int) =
          (m.choose (r - 1) : Int) * ((m : Int) - (r : Int) + 1) := by
      rw [Nat.cast_sub hrpred, Nat.cast_sub hr] at hBraw
      norm_num at hBraw
      calc
        (m.choose r : Int) * (r : Int) =
            (m.choose (r - 1) : Int) * ((m : Int) - ((r : Int) - 1)) := hBraw
        _ = (m.choose (r - 1) : Int) * ((m : Int) - (r : Int) + 1) := by ring
    calc
      ((r : Int) * ((r : Int) + 1)) * mainDelta m r =
          (r : Int) * (((m + 2).choose (r + 1) : Int) * ((r : Int) + 1)) +
          ((r : Int) + 1) * ((m.choose r : Int) * (r : Int)) -
          ((r : Int) * ((r : Int) + 1)) * ((m + 2).choose r : Int) -
          ((r : Int) * ((r : Int) + 1)) * (m.choose (r - 1) : Int) := by
        simp only [mainDelta]
        ring
      _ = (r : Int) * (((m + 2).choose r : Int) *
            ((m : Int) + 2 - (r : Int))) +
          ((r : Int) + 1) * ((m.choose (r - 1) : Int) *
            ((m : Int) - (r : Int) + 1)) -
          ((r : Int) * ((r : Int) + 1)) * ((m + 2).choose r : Int) -
          ((r : Int) * ((r : Int) + 1)) * (m.choose (r - 1) : Int) := by
        rw [hA, hB]
      _ = score m r * weight m r := by
        simp only [score, weight]
        ring
  · by_cases heq : r = m + 2
    · subst r
      have hm2 : m < m + 2 := by omega
      simp [mainDelta, score, weight, Nat.choose_eq_zero_of_lt hm2]
      ring
    · have hbig : m + 2 < r := by omega
      have hprev : m < r - 1 := by omega
      have hcur : m < r := by omega
      have hnext : m + 2 < r + 1 := by omega
      simp [mainDelta, weight, Nat.choose_eq_zero_of_lt hbig,
        Nat.choose_eq_zero_of_lt hprev, Nat.choose_eq_zero_of_lt hcur,
        Nat.choose_eq_zero_of_lt hnext]

theorem weight_pos_of_le (m r : Nat) (hr : 1 ≤ r) (hle : r ≤ m + 2) :
    0 < weight m r := by
  have hrI : 0 < (r : Int) := by exact_mod_cast hr
  have hcN : 0 < (m + 2).choose r := Nat.choose_pos hle
  have hcI : 0 < ((m + 2).choose r : Int) := by exact_mod_cast hcN
  have hfirst : 0 < (r : Int) * ((m + 2).choose r : Int) := mul_pos hrI hcI
  have hsecond :
      0 ≤ ((r : Int) + 1) * (m.choose (r - 1) : Int) := by positivity
  simpa only [weight] using add_pos_of_pos_of_nonneg hfirst hsecond

theorem score_nonpos_of_mainDelta_nonpos (m r : Nat) (hr : 1 ≤ r)
    (hmain : mainDelta m r ≤ 0) : score m r ≤ 0 := by
  by_cases hle : r ≤ m + 2
  · have hfac : 0 < (r : Int) * ((r : Int) + 1) := by
      have hrI : 0 < (r : Int) := by exact_mod_cast hr
      positivity
    have hleft :
        ((r : Int) * ((r : Int) + 1)) * mainDelta m r ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (le_of_lt hfac) hmain
    rw [mainDelta_score_identity m r hr] at hleft
    by_contra hs
    have hspos : 0 < score m r := lt_of_not_ge hs
    exact (not_lt_of_ge hleft) (mul_pos hspos (weight_pos_of_le m r hr hle))
  · have hbig : m + 2 < r := by omega
    have hbigI : (m : Int) + 2 < (r : Int) := by exact_mod_cast hbig
    simp only [score]
    omega

theorem mainDelta_nonpos_of_score_neg (m r : Nat) (hr : 1 ≤ r)
    (hscore : score m r < 0) : mainDelta m r ≤ 0 := by
  by_cases hle : r ≤ m + 2
  · have hright : score m r * weight m r < 0 :=
      mul_neg_of_neg_of_pos hscore (weight_pos_of_le m r hr hle)
    rw [← mainDelta_score_identity m r hr] at hright
    have hfac : 0 < (r : Int) * ((r : Int) + 1) := by
      have hrI : 0 < (r : Int) := by exact_mod_cast hr
      positivity
    by_contra h
    have hmainpos : 0 < mainDelta m r := lt_of_not_ge h
    exact (not_lt_of_ge (le_of_lt hright)) (mul_pos hfac hmainpos)
  · have hbig : m + 2 < r := by omega
    have hprev : m < r - 1 := by omega
    have hcur : m < r := by omega
    have hnext : m + 2 < r + 1 := by omega
    simp [mainDelta, Nat.choose_eq_zero_of_lt hbig,
      Nat.choose_eq_zero_of_lt hprev, Nat.choose_eq_zero_of_lt hcur,
      Nat.choose_eq_zero_of_lt hnext]

theorem score_strict_decrease (m p q : Nat) (hpq : p < q) :
    score m q < score m p := by
  have hpqI : (p : Int) < (q : Int) := by exact_mod_cast hpq
  simp only [score]
  omega

theorem score_nonpos_of_delta_neg (m r : Nat) (hr : 1 ≤ r)
    (hneg : delta m r < 0) : score m r ≤ 0 := by
  by_cases hr1 : r = 1
  · subst r
    have hmain : mainDelta m 1 ≤ 0 := by
      rw [delta_one_eq] at hneg
      omega
    exact score_nonpos_of_mainDelta_nonpos m 1 (by omega) hmain
  · by_cases hr2 : r = 2
    · subst r
      have hmain : mainDelta m 2 ≤ 0 := by
        rw [delta_two_eq] at hneg
        omega
      exact score_nonpos_of_mainDelta_nonpos m 2 (by omega) hmain
    · by_cases hr3 : r = 3
      · subst r
        have hmain : mainDelta m 3 ≤ 0 := by
          rw [delta_three_eq] at hneg
          omega
        exact score_nonpos_of_mainDelta_nonpos m 3 (by omega) hmain
      · have hr4 : 4 ≤ r := by omega
        have hmain : mainDelta m r ≤ 0 := by
          rw [delta_eq_main_of_ge_four m r hr4] at hneg
          exact le_of_lt hneg
        exact score_nonpos_of_mainDelta_nonpos m r hr hmain

theorem delta_nonpos_of_score_neg (m r : Nat) (hr : 2 ≤ r)
    (hscore : score m r < 0) : delta m r ≤ 0 := by
  have hmain : mainDelta m r ≤ 0 :=
    mainDelta_nonpos_of_score_neg m r (by omega) hscore
  by_cases hr2 : r = 2
  · subst r
    rw [delta_two_eq]
    omega
  · by_cases hr3 : r = 3
    · subst r
      rw [delta_three_eq]
      omega
    · rw [delta_eq_main_of_ge_four m r (by omega)]
      exact hmain

theorem FR_doubleBroom_iff (m p q : Nat) :
    FR (doubleBroom m) p q ↔
      p < q ∧ delta m p < 0 ∧
        (∀ r : Nat, p < r → r < q → delta m r ≤ 0) ∧ delta m q > 0 := by
  rfl

/-- Frozen theorem C4-F3-06: no labelled `D_(2,m)` has a first recovery. -/
theorem C4_F3_06 (m p q : Nat) : ¬FR (doubleBroom m) p q := by
  rw [FR_doubleBroom_iff]
  rintro ⟨hpq, hpneg, _hplateau, hqpos⟩
  have hp0 : p ≠ 0 := by
    intro hp
    subst p
    rw [delta_zero_eq] at hpneg
    have hm0 : 0 ≤ (m : Int) := Int.natCast_nonneg m
    omega
  have hp1 : 1 ≤ p := by omega
  have hq2 : 2 ≤ q := by omega
  have hscorep : score m p ≤ 0 := score_nonpos_of_delta_neg m p hp1 hpneg
  have hscoreq : score m q < 0 :=
    lt_of_lt_of_le (score_strict_decrease m p q hpq) hscorep
  have hqnonpos : delta m q ≤ 0 := delta_nonpos_of_score_neg m q hq2 hscoreq
  omega

end

end C4F306
