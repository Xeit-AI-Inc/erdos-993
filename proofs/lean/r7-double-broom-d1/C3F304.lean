import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.Sum
import Mathlib.Tactic

set_option autoImplicit false

namespace C3F304

noncomputable section

/-- Labels for the two core vertices, the single left leaf, and the `m` right leaves. -/
abbrev Vertex (m : Nat) := Fin 2 ⊕ (Fin 1 ⊕ Fin m)

def u (m : Nat) : Vertex m := Sum.inl 0
def v (m : Nat) : Vertex m := Sum.inl 1
def leftLeaf (m : Nat) : Vertex m := Sum.inr (Sum.inl 0)
def rightLeaf {m : Nat} (i : Fin m) : Vertex m := Sum.inr (Sum.inr i)

/-- Exactly the core edge and the prescribed pendant edges of `D_(1,m)`. -/
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

/-- The finite labelled double-broom `D_(1,m)`. -/
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

/-- The actual number of independent vertex sets of rank `r` in `D_(1,m)`. -/
def independentSetCount (m r : Nat) : Nat :=
  Fintype.card (IndepAt (doubleBroom m) r)

/-- Integer adjacent differences of the actual independent-set counts. -/
def delta (m r : Nat) : Int :=
  (independentSetCount m (r + 1) : Int) - independentSetCount m r

/-- Fixed-cardinality finsets, used only as the codomain of the counting bridge. -/
abbrev FixedCard (A : Type*) [DecidableEq A] (r : Nat) :=
  {S : Finset A // S.card = r}

/-- Leaf sets whose core-selected total rank is exactly `r`. -/
abbrev CoreConfig (A : Type*) [DecidableEq A] (r : Nat) :=
  {S : Finset A // S.card + 1 = r}

/-- The three possible core states of an independent set: neither, `u`, or `v`. -/
abbrev Config (m r : Nat) :=
  FixedCard (Fin 1 ⊕ Fin m) r ⊕
    (CoreConfig (Fin m) r ⊕ CoreConfig (Fin 1) r)

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
        ((∅ : Finset (Fin 1)).disjSum R.1), ?_, ?_⟩
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

@[simp] theorem adj_u_leftLeaf (m : Nat) :
    (doubleBroom m).Adj (u m) (leftLeaf m) := by
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
    have hl : leftLeaf m ∉ X :=
      not_mem_of_indep_adj hX hu (adj_u_leftLeaf m)
    let R : Finset (Fin m) := X.toRight.toRight
    have hshape : X = ({0} : Finset (Fin 2)).disjSum
        ((∅ : Finset (Fin 1)).disjSum R) := by
      ext z
      rcases z with i | a
      · fin_cases i
        · simpa [u] using hu
        · simpa [v] using hv
      · rcases a with a | i
        · fin_cases a
          simpa [leftLeaf] using hl
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
      let L : Finset (Fin 1) := X.toRight.toLeft
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
    · let S : Finset (Fin 1 ⊕ Fin m) := X.toRight
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
      (m + 1).choose r + m.choose (r - 1) + (1 : Nat).choose (r - 1) := by
  rw [independentSetCount]
  calc
    Fintype.card (IndepAt (doubleBroom m) r) = Fintype.card (Config m r) :=
      Fintype.card_congr configEquivIndep.symm
    _ = Fintype.card (FixedCard (Fin 1 ⊕ Fin m) r) +
          Fintype.card (CoreConfig (Fin m) r) +
          Fintype.card (CoreConfig (Fin 1) r) := by
      simp only [Config, Fintype.card_sum, Nat.add_assoc]
    _ = (m + 1).choose r + m.choose (r - 1) + (1 : Nat).choose (r - 1) := by
      rw [card_fixedCard, card_coreConfig_of_pos _ r hr,
        card_coreConfig_of_pos _ r hr]
      simp [Nat.add_comm]

theorem independentSetCount_zero (m : Nat) : independentSetCount m 0 = 1 := by
  rw [independentSetCount]
  calc
    Fintype.card (IndepAt (doubleBroom m) 0) = Fintype.card (Config m 0) :=
      Fintype.card_congr configEquivIndep.symm
    _ = Fintype.card (FixedCard (Fin 1 ⊕ Fin m) 0) +
          Fintype.card (CoreConfig (Fin m) 0) +
          Fintype.card (CoreConfig (Fin 1) 0) := by
      simp only [Config, Fintype.card_sum, Nat.add_assoc]
    _ = 1 := by
      rw [card_fixedCard, card_coreConfig_zero, card_coreConfig_zero]
      simp

/-- The binomial part of the adjacent difference away from the rank-two correction. -/
def mainDelta (m r : Nat) : Int :=
  (m.choose (r + 1) : Int) + (m.choose r : Int) -
    2 * (m.choose (r - 1) : Int)

/-- The numerator controlling the sign of `mainDelta`. -/
def score (m r : Nat) : Int :=
  ((m : Int) + 1) * ((m : Int) - (r : Int) + 1) -
    2 * (r : Int) * ((r : Int) + 1)

theorem delta_eq_coeff (m r : Nat) (hr : 1 ≤ r) :
    delta m r =
      ((m + 1).choose (r + 1) + m.choose r + (1 : Nat).choose r : Int) -
      ((m + 1).choose r + m.choose (r - 1) + (1 : Nat).choose (r - 1) : Nat) := by
  rw [delta, independentSetCount_eq_coeff m (r + 1) (by omega),
    independentSetCount_eq_coeff m r hr]
  simp only [Nat.add_sub_cancel]
  push_cast
  rfl

theorem delta_zero_eq (m : Nat) : delta m 0 = (m : Int) + 2 := by
  rw [delta, independentSetCount_eq_coeff m 1 (by omega), independentSetCount_zero]
  simp [Nat.choose_one_right]
  ring

theorem delta_eq_main_of_ne_two (m r : Nat) (hr : 1 ≤ r) (hr2 : r ≠ 2) :
    delta m r = mainDelta m r := by
  rw [delta_eq_coeff m r hr]
  have hp0 : (m + 1).choose r = m.choose (r - 1) + m.choose r := by
    simpa [Nat.sub_add_cancel hr] using Nat.choose_succ_succ m (r - 1)
  have hp1 : (m + 1).choose (r + 1) = m.choose r + m.choose (r + 1) := by
    simpa using Nat.choose_succ_succ m r
  rw [hp0, hp1]
  by_cases hr1 : r = 1
  · subst r
    norm_num [mainDelta]
    ring
  · have hr3 : 3 ≤ r := by omega
    have h1r : (1 : Nat).choose r = 0 := Nat.choose_eq_zero_of_lt (by omega)
    have h1p : (1 : Nat).choose (r - 1) = 0 :=
      Nat.choose_eq_zero_of_lt (by omega)
    rw [h1r, h1p]
    push_cast
    simp only [mainDelta]
    ring

theorem delta_two_eq (m : Nat) : delta m 2 = mainDelta m 2 - 1 := by
  rw [delta_eq_coeff m 2 (by omega)]
  rw [Nat.choose_succ_succ m 2, Nat.choose_succ_succ m 1]
  norm_num [mainDelta]
  ring

theorem mainDelta_score_identity (m r : Nat) (hr : 1 ≤ r) :
    ((r : Int) * ((r : Int) + 1)) * mainDelta m r =
      (m.choose (r - 1) : Int) * score m r := by
  by_cases hrm : r ≤ m
  · have hpred : r - 1 + 1 = r := Nat.sub_add_cancel hr
    have hsubpred : m - (r - 1) = m - r + 1 := by omega
    have h1N := Nat.choose_succ_right_eq m (r - 1)
    rw [hpred, hsubpred] at h1N
    have h2N := Nat.choose_succ_right_eq m r
    have h1Iraw :
        (m.choose r : Int) * (r : Int) =
          (m.choose (r - 1) : Int) * ((m - r + 1 : Nat) : Int) := by
      exact_mod_cast h1N
    have h2Iraw :
        (m.choose (r + 1) : Int) * ((r : Int) + 1) =
          (m.choose r : Int) * ((m - r : Nat) : Int) := by
      exact_mod_cast h2N
    have h1I :
        (m.choose r : Int) * (r : Int) =
          (m.choose (r - 1) : Int) * ((m : Int) - (r : Int) + 1) := by
      rw [Nat.cast_add, Nat.cast_one, Nat.cast_sub hrm] at h1Iraw
      exact h1Iraw
    have h2I :
        (m.choose (r + 1) : Int) * ((r : Int) + 1) =
          (m.choose r : Int) * ((m : Int) - (r : Int)) := by
      rw [Nat.cast_sub hrm] at h2Iraw
      exact h2Iraw
    calc
      ((r : Int) * ((r : Int) + 1)) * mainDelta m r =
          (r : Int) * ((m.choose (r + 1) : Int) * ((r : Int) + 1)) +
          ((r : Int) + 1) * ((m.choose r : Int) * (r : Int)) -
          2 * ((r : Int) * ((r : Int) + 1)) *
            (m.choose (r - 1) : Int) := by
        simp only [mainDelta]
        ring
      _ = (r : Int) * ((m.choose r : Int) * ((m : Int) - (r : Int))) +
          ((r : Int) + 1) * ((m.choose r : Int) * (r : Int)) -
          2 * ((r : Int) * ((r : Int) + 1)) *
            (m.choose (r - 1) : Int) := by rw [h2I]
      _ =
          ((m.choose r : Int) * (r : Int)) * ((m : Int) - (r : Int)) +
          ((m.choose r : Int) * (r : Int)) * ((r : Int) + 1) -
          2 * ((r : Int) * ((r : Int) + 1)) *
            (m.choose (r - 1) : Int) := by
        ring
      _ = ((m.choose (r - 1) : Int) * ((m : Int) - (r : Int) + 1)) *
            ((m : Int) - (r : Int)) +
          ((m.choose (r - 1) : Int) * ((m : Int) - (r : Int) + 1)) *
            ((r : Int) + 1) -
          2 * ((r : Int) * ((r : Int) + 1)) *
            (m.choose (r - 1) : Int) := by rw [h1I]
      _ = (m.choose (r - 1) : Int) * score m r := by
        simp only [score]
        ring
  · by_cases heq : r = m + 1
    · subst r
      simp [mainDelta, score, Nat.choose_eq_zero_of_lt]
      ring
    · have hbig : m + 1 < r := by omega
      have hprev : m < r - 1 := by omega
      have hcur : m < r := by omega
      have hnext : m < r + 1 := by omega
      simp [mainDelta, Nat.choose_eq_zero_of_lt hprev,
        Nat.choose_eq_zero_of_lt hcur, Nat.choose_eq_zero_of_lt hnext]

theorem score_strict_decrease (m p q : Nat) (hpq : p < q) :
    score m q < score m p := by
  have hpqI : (p : Int) < (q : Int) := by exact_mod_cast hpq
  have hfirst : 0 < (q : Int) - (p : Int) := sub_pos.mpr hpqI
  have hm0 : 0 ≤ (m : Int) := Int.natCast_nonneg m
  have hp0 : 0 ≤ (p : Int) := Int.natCast_nonneg p
  have hq0 : 0 ≤ (q : Int) := Int.natCast_nonneg q
  have hsecond :
      0 < (m : Int) + 2 * (p : Int) + 2 * (q : Int) + 3 := by
    nlinarith
  have hprod :
      0 < ((q : Int) - (p : Int)) *
        ((m : Int) + 2 * (p : Int) + 2 * (q : Int) + 3) :=
    mul_pos hfirst hsecond
  have hid :
      score m q - score m p =
        -(((q : Int) - (p : Int)) *
          ((m : Int) + 2 * (p : Int) + 2 * (q : Int) + 3)) := by
    simp only [score]
    ring
  apply sub_neg.mp
  rw [hid]
  exact Int.neg_neg_of_pos hprod

theorem score_nonpos_of_delta_neg (m r : Nat) (hm : 1 ≤ m) (hr : 1 ≤ r)
    (hneg : delta m r < 0) : score m r ≤ 0 := by
  by_cases hr2 : r = 2
  · subst r
    have hd := delta_two_eq m
    have hmain : mainDelta m 2 ≤ 0 := by omega
    have hid := mainDelta_score_identity m 2 (by omega)
    have hmI : 0 < (m : Int) := by exact_mod_cast hm
    have hleft : ((2 : Int) * ((2 : Int) + 1)) * mainDelta m 2 ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (by norm_num) hmain
    norm_num at hid hleft
    rw [hid] at hleft
    by_contra hs
    have hspos : 0 < score m 2 := lt_of_not_ge hs
    exact (not_lt_of_ge hleft) (mul_pos hmI hspos)
  · have hd := delta_eq_main_of_ne_two m r hr hr2
    have hmain : mainDelta m r < 0 := by omega
    have hfac : 0 < (r : Int) * ((r : Int) + 1) := by
      have hrI : 0 < (r : Int) := by exact_mod_cast hr
      positivity
    have hleft :
        ((r : Int) * ((r : Int) + 1)) * mainDelta m r < 0 :=
      mul_neg_of_pos_of_neg hfac hmain
    rw [mainDelta_score_identity m r hr] at hleft
    by_contra hs
    have hs0 : 0 ≤ score m r := le_of_not_ge hs
    have hc0 : 0 ≤ (m.choose (r - 1) : Int) := Int.natCast_nonneg _
    exact (not_lt_of_ge (mul_nonneg hc0 hs0)) hleft

theorem delta_nonpos_of_score_neg (m r : Nat) (hr : 1 ≤ r)
    (hscore : score m r < 0) : delta m r ≤ 0 := by
  have hc0 : 0 ≤ (m.choose (r - 1) : Int) := Int.natCast_nonneg _
  have hprod : (m.choose (r - 1) : Int) * score m r ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hc0 (le_of_lt hscore)
  have hid := mainDelta_score_identity m r hr
  rw [← hid] at hprod
  have hfac : 0 < (r : Int) * ((r : Int) + 1) := by
    have hrI : 0 < (r : Int) := by exact_mod_cast hr
    positivity
  have hmain : mainDelta m r ≤ 0 := by
    by_contra h
    have hmainpos : 0 < mainDelta m r := lt_of_not_ge h
    exact (not_lt_of_ge hprod) (mul_pos hfac hmainpos)
  by_cases hr2 : r = 2
  · subst r
    rw [delta_two_eq]
    omega
  · rw [delta_eq_main_of_ne_two m r hr hr2]
    exact hmain

/-- Exact plateau-safe first recovery for the actual counts of `D_(1,m)`. -/
def FirstRecovery (m p q : Nat) : Prop :=
  p < q ∧
    delta m p < 0 ∧
    (∀ r : Nat, p < r → r < q → delta m r ≤ 0) ∧
    delta m q > 0

/-- Frozen theorem C3-F3-04. -/
theorem C3_F3_04 (m : Nat) (hm : 1 ≤ m) (p q : Nat) :
    ¬FirstRecovery m p q := by
  rintro ⟨hpq, hpneg, _hplateau, hqpos⟩
  have hp0 : p ≠ 0 := by
    intro hp
    subst p
    rw [delta_zero_eq] at hpneg
    have hm0 : 0 ≤ (m : Int) := Int.natCast_nonneg m
    omega
  have hp1 : 1 ≤ p := by omega
  have hq1 : 1 ≤ q := by omega
  have hscorep : score m p ≤ 0 :=
    score_nonpos_of_delta_neg m p hm hp1 hpneg
  have hscoreq : score m q < 0 :=
    lt_of_lt_of_le (score_strict_decrease m p q hpq) hscorep
  have hqnonpos : delta m q ≤ 0 := delta_nonpos_of_score_neg m q hq1 hscoreq
  omega

end

end C3F304
