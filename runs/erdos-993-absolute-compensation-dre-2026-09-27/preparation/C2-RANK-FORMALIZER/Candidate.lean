import Mathlib

open Polynomial

def e993NN (p : Polynomial ℚ) : Prop := ∀ n, 0 ≤ p.coeff n
noncomputable def e993D (d : ℕ) (p : Polynomial ℚ) : Polynomial ℚ :=
  (3 + 2 * X) * p.derivative - (2 * (d : Polynomial ℚ)) * p

noncomputable def e993RankParent (rs : List ℕ) : Polynomial ℚ :=
  (1 + 2 * X) * (rs.map (fun r => (1 + X)^r + X)).prod +
    X * (1 + X)^(rs.sum + 1)

lemma e993NN_add {p q : Polynomial ℚ} (hp : e993NN p) (hq : e993NN q) :
    e993NN (p + q) := by
  intro n
  rw [coeff_add]
  exact add_nonneg (hp n) (hq n)

lemma e993NN_mul {p q : Polynomial ℚ} (hp : e993NN p) (hq : e993NN q) :
    e993NN (p * q) := by
  intro n
  rw [coeff_mul]
  apply Finset.sum_nonneg
  intro x hx
  exact mul_nonneg (hp x.1) (hq x.2)

lemma e993NN_one : e993NN (1 : Polynomial ℚ) := by
  intro n
  rw [coeff_one]
  split_ifs <;> norm_num

lemma e993NN_X : e993NN (X : Polynomial ℚ) := by
  intro n
  rw [coeff_X]
  split_ifs <;> norm_num

lemma e993NN_nat (m : ℕ) : e993NN (m : Polynomial ℚ) := by
  intro n
  rw [← C_eq_natCast, coeff_C]
  split_ifs <;> positivity

lemma e993NN_pow {p : Polynomial ℚ} (hp : e993NN p) (m : ℕ) : e993NN (p^m) := by
  induction m with
  | zero => simpa using e993NN_one
  | succ m ih => simpa [pow_succ] using e993NN_mul ih hp

lemma e993D_mul (a b : ℕ) (p q : Polynomial ℚ) :
    e993D (a+b) (p*q) = e993D a p * q + p * e993D b q := by
  simp only [e993D, derivative_mul, Nat.cast_add]
  ring

lemma e993D_add (a : ℕ) (p q : Polynomial ℚ) :
    e993D a (p+q) = e993D a p + e993D a q := by
  simp only [e993D, derivative_add]
  ring

lemma e993C2 : (C (2:ℚ) : Polynomial ℚ) = 2 := by norm_cast
lemma e993C3 : (C (3:ℚ) : Polynomial ℚ) = 3 := by norm_cast
lemma e993C4 : (C (4:ℚ) : Polynomial ℚ) = 4 := by norm_cast

lemma e993D_G : e993D 1 (1 + 2 * X : Polynomial ℚ) = 4 := by
  simp [e993D]
  ring

lemma e993D_B2 : e993D 2 ((1 + X : Polynomial ℚ)^2 + X) = 5 := by
  norm_num [e993D, derivative_pow, e993C2, e993C3, e993C4]; ring

lemma e993D_B3 : e993D 3 ((1 + X : Polynomial ℚ)^3 + X) = 6 + 2*X + 3*X^2 := by
  norm_num [e993D, derivative_pow, e993C2, e993C3, e993C4]; ring

lemma e993D_B4 : e993D 4 ((1 + X : Polynomial ℚ)^4 + X) = 7 + 6*X + 12*X^2 + 4*X^3 := by
  norm_num [e993D, derivative_pow, e993C2, e993C3, e993C4]; ring

lemma e993D_X : e993D 0 (X : Polynomial ℚ) = 3 + 2*X := by
  simp [e993D]

lemma e993D_L : e993D 1 (1 + X : Polynomial ℚ) = 1 := by
  simp [e993D]
  ring

lemma e993NN_L : e993NN (1 + X : Polynomial ℚ) :=
  e993NN_add e993NN_one e993NN_X

lemma e993NN_twoX : e993NN (2 * X : Polynomial ℚ) :=
  e993NN_mul (e993NN_nat 2) e993NN_X

lemma e993NN_G : e993NN (1 + 2 * X : Polynomial ℚ) :=
  e993NN_add e993NN_one e993NN_twoX

lemma e993NN_DG : e993NN (e993D 1 (1 + 2 * X : Polynomial ℚ)) := by
  rw [e993D_G]
  exact e993NN_nat 4

lemma e993NN_B (r : ℕ) : e993NN ((1 + X : Polynomial ℚ)^r + X) :=
  e993NN_add (e993NN_pow e993NN_L r) e993NN_X

lemma e993NN_DB (r : ℕ) (hr : r = 2 ∨ r = 3 ∨ r = 4) :
    e993NN (e993D r ((1 + X : Polynomial ℚ)^r + X)) := by
  rcases hr with h | h | h
  · subst r
    rw [e993D_B2]
    exact e993NN_nat 5
  · subst r
    rw [e993D_B3]
    exact e993NN_add
      (e993NN_add (e993NN_nat 6) (e993NN_mul (e993NN_nat 2) e993NN_X))
      (e993NN_mul (e993NN_nat 3) (e993NN_pow e993NN_X 2))
  · subst r
    rw [e993D_B4]
    exact e993NN_add
      (e993NN_add
        (e993NN_add (e993NN_nat 7) (e993NN_mul (e993NN_nat 6) e993NN_X))
        (e993NN_mul (e993NN_nat 12) (e993NN_pow e993NN_X 2)))
      (e993NN_mul (e993NN_nat 4) (e993NN_pow e993NN_X 3))

lemma e993D_one : e993D 0 (1 : Polynomial ℚ) = 0 := by
  simp [e993D]

lemma e993NN_zero : e993NN (0 : Polynomial ℚ) := by
  intro n
  simp

lemma e993NN_prod (rs : List ℕ) :
    e993NN (rs.map (fun r => (1 + X : Polynomial ℚ)^r + X)).prod := by
  induction rs with
  | nil => simpa using e993NN_one
  | cons r rs ih => simpa using e993NN_mul (e993NN_B r) ih

lemma e993NN_Dprod (rs : List ℕ)
    (hr : ∀ r ∈ rs, r = 2 ∨ r = 3 ∨ r = 4) :
    e993NN (e993D rs.sum (rs.map (fun r => (1 + X : Polynomial ℚ)^r + X)).prod) := by
  induction rs with
  | nil => simpa [e993D_one] using e993NN_zero
  | cons r rs ih =>
      have hright : ∀ s ∈ rs, s = 2 ∨ s = 3 ∨ s = 4 := by
        intro s hs
        exact hr s (List.mem_cons_of_mem r hs)
      have hlocal := e993NN_DB r (hr r (List.mem_cons_self))
      have hmul := e993NN_add
        (e993NN_mul hlocal (e993NN_prod rs))
        (e993NN_mul (e993NN_B r) (ih hright))
      simpa only [List.sum_cons, List.map_cons, List.prod_cons, e993D_mul] using hmul

lemma e993NN_Dpow (n : ℕ) : e993NN (e993D n ((1 + X : Polynomial ℚ)^n)) := by
  induction n with
  | zero => simpa [e993D_one] using e993NN_zero
  | succ n ih =>
      have h := e993NN_add
        (e993NN_mul ih e993NN_L)
        (e993NN_mul (e993NN_pow e993NN_L n) (by simpa [e993D_L] using e993NN_one))
      simpa only [pow_succ, e993D_mul, Nat.succ_eq_add_one, e993D_L] using h

lemma e993NN_parent (rs : List ℕ) : e993NN (e993RankParent rs) := by
  unfold e993RankParent
  exact e993NN_add
    (e993NN_mul e993NN_G (e993NN_prod rs))
    (e993NN_mul e993NN_X (e993NN_pow e993NN_L (rs.sum + 1)))

lemma e993NN_Dparent (rs : List ℕ)
    (hr : ∀ r ∈ rs, r = 2 ∨ r = 3 ∨ r = 4) :
    e993NN (e993D (rs.sum + 1) (e993RankParent rs)) := by
  have hC := e993NN_add
    (e993NN_mul e993NN_DG (e993NN_prod rs))
    (e993NN_mul e993NN_G (e993NN_Dprod rs hr))
  have hH := e993NN_add
    (e993NN_mul (by simpa [e993D_X] using e993NN_add (e993NN_nat 3) e993NN_twoX)
      (e993NN_pow e993NN_L (rs.sum + 1)))
    (e993NN_mul e993NN_X (e993NN_Dpow (rs.sum + 1)))
  unfold e993RankParent
  rw [e993D_add]
  apply e993NN_add
  · have heq := e993D_mul 1 rs.sum (1 + 2 * X : Polynomial ℚ)
        ((rs.map (fun r => (1 + X : Polynomial ℚ)^r + X)).prod)
    rw [add_comm 1 rs.sum] at heq
    rw [heq]
    exact hC
  · have heq := e993D_mul 0 (rs.sum + 1) (X : Polynomial ℚ)
        ((1 + X : Polynomial ℚ)^(rs.sum + 1))
    simp only [zero_add, e993D_X] at heq
    rw [heq]
    exact hH

lemma e993_coeff_X_derivative (p : Polynomial ℚ) (k : ℕ) :
    (X * p.derivative).coeff k = (k : ℚ) * p.coeff k := by
  cases k with
  | zero => simp
  | succ n =>
      rw [coeff_X_mul, coeff_derivative]
      push_cast
      ring

lemma e993D_coeff (d k : ℕ) (p : Polynomial ℚ) :
    (e993D d p).coeff k =
      3 * ((k : ℚ) + 1) * p.coeff (k + 1) +
      2 * (k : ℚ) * p.coeff k -
      2 * (d : ℚ) * p.coeff k := by
  have hpoly : (3 + 2 * X : Polynomial ℚ) * p.derivative =
      3 * p.derivative + 2 * (X * p.derivative) := by ring
  unfold e993D
  rw [hpoly, coeff_sub, coeff_add]
  rw [mul_assoc (2 : Polynomial ℚ) (d : Polynomial ℚ) p]
  simp only [coeff_ofNat_mul, coeff_natCast_mul, coeff_derivative,
    e993_coeff_X_derivative]
  ring


theorem e993_rank_any_strict_descent (rs : List ℕ)
    (hr : ∀ r ∈ rs, r = 2 ∨ r = 3 ∨ r = 4) (k : ℕ)
    (hdrop : (e993RankParent rs).coeff (k + 1) < (e993RankParent rs).coeff k) :
    2 * rs.sum ≤ 5 * k := by
  by_contra hn
  have hnat : 5 * k + 1 ≤ 2 * rs.sum := by omega
  have hbound : (5 : ℚ) * (k : ℚ) + 1 ≤ 2 * (rs.sum : ℚ) := by
    exact_mod_cast hnat
  have hnonneg := e993NN_parent rs (k + 1)
  have hpos : 0 < (e993RankParent rs).coeff k := lt_of_le_of_lt hnonneg hdrop
  have hcert := e993NN_Dparent rs hr k
  rw [e993D_coeff] at hcert
  norm_num only [Nat.cast_add, Nat.cast_one] at hcert
  have hscale :
      3 * ((k : ℚ) + 1) * (e993RankParent rs).coeff (k + 1) <
      3 * ((k : ℚ) + 1) * (e993RankParent rs).coeff k := by
    exact mul_lt_mul_of_pos_left hdrop (by positivity)
  have hfactor : 3 * ((k : ℚ) + 1) ≤ 2 * ((rs.sum : ℚ) + 1) - 2 * (k : ℚ) := by
    linarith
  have hscaled := mul_le_mul_of_nonneg_right hfactor (le_of_lt hpos)
  nlinarith
