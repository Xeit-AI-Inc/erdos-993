import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition pCoeff 10f4f6af2bacb37f7d1c4aa9e45bcbede8c4f35aca8ada18880986f880a676a3
namespace RootedStarCrossTerm

/-- Integer coefficients indexed at every integer rank. -/
abbrev CoeffSequence := Int -> Int

/-- The zero-extended coefficient sequence of `P = (1 + x)^3`. -/
def pCoeff (k : Int) : Int :=
  if k = 0 then 1
  else if k = 1 then 3
  else if k = 2 then 3
  else if k = 3 then 1
  else 0

/-- The zero-extended coefficient sequence of `Q = x`. -/
def qCoeff (k : Int) : Int :=
  if k = 1 then 1 else 0

/-- Coefficients of `P + Q = 1 + 4x + 3x^2 + x^3`. -/
def totalCoeff (k : Int) : Int := pCoeff k + qCoeff k

/-- The complete finite rank domain on which a minor may be nonzero. -/
def rootedStarMinorRanks : Finset Int := {0, 1, 2, 3}

/-- Exact interval support, with zero extension understood at all other ranks. -/
def HasExactIntervalSupport (c : CoeffSequence) (lower upper : Int) : Prop :=
  forall k : Int, c k ≠ 0 ↔ lower ≤ k ∧ k ≤ upper

/-- The integer-valued adjacent Toeplitz minor at rank `k`. -/
def adjacentMinor (c : CoeffSequence) (k : Int) : Int :=
  c k * c k - c (k - 1) * c (k + 1)

/-- The integer-valued symmetric cross term at rank `k`. -/
def symmetricCrossTerm (p q : CoeffSequence) (k : Int) : Int :=
  2 * p k * q k - p (k - 1) * q (k + 1) - q (k - 1) * p (k + 1)

/-- Nonnegative minors on an explicit finite domain and zero minors off it. -/
def HasNonnegativeAdjacentMinors
    (c : CoeffSequence) (ranks : Finset Int) : Prop :=
  (forall k : Int, k ∈ ranks -> 0 ≤ adjacentMinor c k) ∧
    (forall k : Int, k ∉ ranks -> adjacentMinor c k = 0)

/-- Exact coefficient identity for `P = (1 + x)^3`. -/
def RepresentsOnePlusXPowThree (c : CoeffSequence) : Prop :=
  c 0 = 1 ∧ c 1 = 3 ∧ c 2 = 3 ∧ c 3 = 1 ∧
    forall k : Int, k < 0 ∨ 3 < k -> c k = 0

/-- Exact coefficient identity for `Q = x`. -/
def RepresentsX (c : CoeffSequence) : Prop :=
  c 1 = 1 ∧ forall k : Int, k ≠ 1 -> c k = 0

/-- Exact coefficient identity for the total polynomial. -/
def RepresentsRootedStarTotal (c : CoeffSequence) : Prop :=
  c 0 = 1 ∧ c 1 = 4 ∧ c 2 = 3 ∧ c 3 = 1 ∧
    forall k : Int, k < 0 ∨ 3 < k -> c k = 0

end RootedStarCrossTerm
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN lemma pCoeff_eq_zero_of_lt 8b1eb11eb6b319252224ccce6ba681edd6eaa4252dc7ff45f08ff99a621976b1
namespace RootedStarCrossTerm

lemma pCoeff_eq_zero_of_lt {k : Int} (hk : k < 0) : pCoeff k = 0 := by
  simp [pCoeff]
  omega

lemma pCoeff_eq_zero_of_gt {k : Int} (hk : 3 < k) : pCoeff k = 0 := by
  simp [pCoeff]
  omega

lemma qCoeff_eq_zero_of_ne {k : Int} (hk : k ≠ 1) : qCoeff k = 0 := by
  simp [qCoeff, hk]

lemma totalCoeff_eq_zero_of_lt {k : Int} (hk : k < 0) : totalCoeff k = 0 := by
  rw [totalCoeff, pCoeff_eq_zero_of_lt hk, qCoeff_eq_zero_of_ne (by omega)]
  norm_num

lemma totalCoeff_eq_zero_of_gt {k : Int} (hk : 3 < k) : totalCoeff k = 0 := by
  rw [totalCoeff, pCoeff_eq_zero_of_gt hk, qCoeff_eq_zero_of_ne (by omega)]
  norm_num

lemma p_represents_one_plus_x_pow_three : RepresentsOnePlusXPowThree pCoeff := by
  refine ⟨by norm_num [pCoeff], by norm_num [pCoeff], by norm_num [pCoeff],
    by norm_num [pCoeff], ?_⟩
  intro k hk
  rcases hk with hk | hk
  · exact pCoeff_eq_zero_of_lt hk
  · exact pCoeff_eq_zero_of_gt hk

lemma q_represents_x : RepresentsX qCoeff := by
  refine ⟨by norm_num [qCoeff], ?_⟩
  intro k hk
  exact qCoeff_eq_zero_of_ne hk

lemma total_represents_rooted_star : RepresentsRootedStarTotal totalCoeff := by
  refine ⟨by norm_num [totalCoeff, pCoeff, qCoeff],
    by norm_num [totalCoeff, pCoeff, qCoeff],
    by norm_num [totalCoeff, pCoeff, qCoeff],
    by norm_num [totalCoeff, pCoeff, qCoeff], ?_⟩
  intro k hk
  rcases hk with hk | hk
  · exact totalCoeff_eq_zero_of_lt hk
  · exact totalCoeff_eq_zero_of_gt hk

lemma p_has_exact_interval_support : HasExactIntervalSupport pCoeff 0 3 := by
  intro k
  constructor
  · intro hk
    constructor
    · by_contra h
      exact hk (pCoeff_eq_zero_of_lt (by omega))
    · by_contra h
      exact hk (pCoeff_eq_zero_of_gt (by omega))
  · intro hk
    rcases hk with ⟨hlower, hupper⟩
    interval_cases k <;> norm_num [pCoeff]

lemma q_has_exact_interval_support : HasExactIntervalSupport qCoeff 1 1 := by
  intro k
  constructor
  · intro hk
    constructor <;> by_contra h <;> exact hk (qCoeff_eq_zero_of_ne (by omega))
  · intro hk
    have : k = 1 := by omega
    subst k
    norm_num [qCoeff]

lemma p_has_nonnegative_adjacent_minors :
    HasNonnegativeAdjacentMinors pCoeff rootedStarMinorRanks := by
  constructor
  · intro k hk
    have hk' : (0 : Int) ≤ k ∧ k ≤ 3 := by
      simp [rootedStarMinorRanks] at hk
      omega
    rcases hk' with ⟨hlower, hupper⟩
    interval_cases k <;> norm_num [adjacentMinor, pCoeff]
  · intro k hk
    have hk' : ¬((0 : Int) ≤ k ∧ k ≤ 3) := by
      simp [rootedStarMinorRanks] at hk
      omega
    by_cases hneg : k < 0
    · rw [adjacentMinor, pCoeff_eq_zero_of_lt hneg,
        pCoeff_eq_zero_of_lt (by omega)]
      ring
    · have hhigh : 3 < k := by omega
      have hhighNext : 3 < k + 1 := by omega
      rw [adjacentMinor, pCoeff_eq_zero_of_gt hhigh,
        pCoeff_eq_zero_of_gt hhighNext]
      ring

lemma q_has_nonnegative_adjacent_minors :
    HasNonnegativeAdjacentMinors qCoeff rootedStarMinorRanks := by
  constructor
  · intro k hk
    have hk' : (0 : Int) ≤ k ∧ k ≤ 3 := by
      simp [rootedStarMinorRanks] at hk
      omega
    rcases hk' with ⟨hlower, hupper⟩
    interval_cases k <;> norm_num [adjacentMinor, qCoeff]
  · intro k hk
    have hk' : ¬((0 : Int) ≤ k ∧ k ≤ 3) := by
      simp [rootedStarMinorRanks] at hk
      omega
    by_cases hneg : k < 0
    · rw [adjacentMinor, qCoeff_eq_zero_of_ne (by omega),
        qCoeff_eq_zero_of_ne (by omega)]
      ring
    · have hhigh : 3 < k := by omega
      rw [adjacentMinor, qCoeff_eq_zero_of_ne (by omega),
        qCoeff_eq_zero_of_ne (by omega)]
      ring

lemma rooted_star_cross_term_at_two : symmetricCrossTerm pCoeff qCoeff 2 = -1 := by
  norm_num [symmetricCrossTerm, pCoeff, qCoeff]

lemma total_has_nonnegative_adjacent_minors :
    HasNonnegativeAdjacentMinors totalCoeff rootedStarMinorRanks := by
  constructor
  · intro k hk
    have hk' : (0 : Int) ≤ k ∧ k ≤ 3 := by
      simp [rootedStarMinorRanks] at hk
      omega
    rcases hk' with ⟨hlower, hupper⟩
    interval_cases k <;> norm_num [adjacentMinor, totalCoeff, pCoeff, qCoeff]
  · intro k hk
    have hk' : ¬((0 : Int) ≤ k ∧ k ≤ 3) := by
      simp [rootedStarMinorRanks] at hk
      omega
    by_cases hneg : k < 0
    · rw [adjacentMinor, totalCoeff_eq_zero_of_lt hneg,
        totalCoeff_eq_zero_of_lt (by omega)]
      ring
    · have hhigh : 3 < k := by omega
      have hhighNext : 3 < k + 1 := by omega
      rw [adjacentMinor, totalCoeff_eq_zero_of_gt hhigh,
        totalCoeff_eq_zero_of_gt hhighNext]
      ring

end RootedStarCrossTerm
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN theorem RootedStarCrossTerm.centerRootedK13_crossTerm_certificate 8b98b34ffeb0ed5c53d20d83e8b460c21947787ef86235dd34760d9ab20f375a
namespace RootedStarCrossTerm

theorem centerRootedK13_crossTerm_certificate :
    RepresentsOnePlusXPowThree pCoeff ∧
    RepresentsX qCoeff ∧
    (totalCoeff = fun k => pCoeff k + qCoeff k) ∧
    RepresentsRootedStarTotal totalCoeff ∧
    HasExactIntervalSupport pCoeff 0 3 ∧
    HasExactIntervalSupport qCoeff 1 1 ∧
    HasNonnegativeAdjacentMinors pCoeff rootedStarMinorRanks ∧
    HasNonnegativeAdjacentMinors qCoeff rootedStarMinorRanks ∧
    symmetricCrossTerm pCoeff qCoeff 2 = -1 ∧
    HasNonnegativeAdjacentMinors totalCoeff rootedStarMinorRanks := by
  refine ⟨p_represents_one_plus_x_pow_three, q_represents_x, rfl,
    total_represents_rooted_star, p_has_exact_interval_support,
    q_has_exact_interval_support, p_has_nonnegative_adjacent_minors,
    q_has_nonnegative_adjacent_minors, rooted_star_cross_term_at_two,
    total_has_nonnegative_adjacent_minors⟩

end RootedStarCrossTerm
-- VERITYOS ENTRY 3 END


-- VERITYOS ENTRY 4 BEGIN theorem RootedStarCrossTerm.rootedStarMinorRanks_eq_Icc ee1cb095ea62038d40c61a11bde7ec0dd9f553f9399d7f277b2b5bf1e0b6ab9e
namespace RootedStarCrossTerm

theorem rootedStarMinorRanks_eq_Icc : rootedStarMinorRanks = Finset.Icc (0:Int) 3 := by decide

end RootedStarCrossTerm
-- VERITYOS ENTRY 4 END
