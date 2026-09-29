import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition e993NN 5b2384c789d1f055bf15b4cf14cd3315f1479aa37011b7396aa6fa7a55898e17
open Polynomial

def e993NN (p : Polynomial ℚ) : Prop := ∀ n, 0 ≤ p.coeff n
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition e993D b6cef82b84a4cb18a5a1c0d9919d229c9653d2cedae2b7202422e1b8146bb43d
noncomputable
def e993D (d : ℕ) (p : Polynomial ℚ) : Polynomial ℚ :=
  (3 + 2 * X) * p.derivative - (2 * (d : Polynomial ℚ)) * p
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition e993RankParent 384876a2c7f2293e4b8d6fced5b316823b42ee4ab28cd6123cbee8c7d02679cb
noncomputable
def e993RankParent (rs : List ℕ) : Polynomial ℚ :=
  (1 + 2 * X) * (rs.map (fun r => (1 + X)^r + X)).prod +
    X * (1 + X)^(rs.sum + 1)
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma e993NN_add 4e92a46895013d48db070ae48cb2a9f27b93a4997d6602e4c9cc8ccc6c287eb8
lemma e993NN_add {p q : Polynomial ℚ} (hp : e993NN p) (hq : e993NN q) :
    e993NN (p + q) := by
  intro n
  rw [coeff_add]
  exact add_nonneg (hp n) (hq n)
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma e993NN_mul 7fae172c5427e8d1fc54865ae6bef75b67517e8382d94ee70a11458e0a5acc06
lemma e993NN_mul {p q : Polynomial ℚ} (hp : e993NN p) (hq : e993NN q) :
    e993NN (p * q) := by
  intro n
  rw [coeff_mul]
  apply Finset.sum_nonneg
  intro x hx
  exact mul_nonneg (hp x.1) (hq x.2)
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma e993NN_one 04d21a6d0feb7f7bb0c86727ec840bfd735cd3a35c48e739cfd580ee548c0c8d
lemma e993NN_one : e993NN (1 : Polynomial ℚ) := by
  intro n
  rw [coeff_one]
  split_ifs <;> norm_num
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma e993NN_X 7011eae23ecae5792a862d4643c6a9950c3a024e4664eeaaeee0c3df072f2dd5
lemma e993NN_X : e993NN (X : Polynomial ℚ) := by
  intro n
  rw [coeff_X]
  split_ifs <;> norm_num
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma e993NN_nat 69cbcb28ac09280fb85f9e467b56be7af2c14de51d6c183d04db79047f70fe3f
lemma e993NN_nat (m : ℕ) : e993NN (m : Polynomial ℚ) := by
  intro n
  rw [← C_eq_natCast, coeff_C]
  split_ifs <;> positivity
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma e993NN_pow 5fa1b654a375b598ddf651a04f67b02898ee90f3dad29cca12c63ef0a72a9df7
lemma e993NN_pow {p : Polynomial ℚ} (hp : e993NN p) (m : ℕ) : e993NN (p^m) := by
  induction m with
  | zero => simpa using e993NN_one
  | succ m ih => simpa [pow_succ] using e993NN_mul ih hp
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma e993D_mul bd141a02a9b91404dbcf6a296e173aac4153334b8c854dfe59d5620409e6a274
lemma e993D_mul (a b : ℕ) (p q : Polynomial ℚ) :
    e993D (a+b) (p*q) = e993D a p * q + p * e993D b q := by
  simp only [e993D, derivative_mul, Nat.cast_add]
  ring
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma e993D_add d0c8fb6e61734bbc922219eb165920f6ea4aefb198dd199966d341ff1fa0a44a
lemma e993D_add (a : ℕ) (p q : Polynomial ℚ) :
    e993D a (p+q) = e993D a p + e993D a q := by
  simp only [e993D, derivative_add]
  ring
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma e993C2 b837fde1c57a9bd58da8ffc930881d17d15beb0987182176df00655eea1a07e0
lemma e993C2 : (C (2:ℚ) : Polynomial ℚ) = 2 := by norm_cast
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma e993C3 bcc4b8ff95ace2ebcc358db7acd2822192185a2e0b8722a8813b75eee2563e49
lemma e993C3 : (C (3:ℚ) : Polynomial ℚ) = 3 := by norm_cast
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma e993C4 5b9c2ff7d22f27a9486bfd8bcc41533ca302fb446f52c989aee9a4832e0f200b
lemma e993C4 : (C (4:ℚ) : Polynomial ℚ) = 4 := by norm_cast
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma e993D_G 88df258d030c27498565e8338c13279076b01bb2eac794c9e0a55e837aef6301
lemma e993D_G : e993D 1 (1 + 2 * X : Polynomial ℚ) = 4 := by
  simp [e993D]
  ring
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma e993D_B2 a4d3b7a64d76b6f32ac0d4013ce9bf75e90c4ea39554b3cb0df8c9a6e91bac0d
lemma e993D_B2 : e993D 2 ((1 + X : Polynomial ℚ)^2 + X) = 5 := by
  norm_num [e993D, derivative_pow, e993C2, e993C3, e993C4]; ring
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma e993D_B3 bc6e45dbff0811eca1728348ea7148ad0a208d726051e32ce1ef57d0c8d8090c
lemma e993D_B3 : e993D 3 ((1 + X : Polynomial ℚ)^3 + X) = 6 + 2*X + 3*X^2 := by
  norm_num [e993D, derivative_pow, e993C2, e993C3, e993C4]; ring
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma e993D_B4 6058d89eb4b088fb91bdd17e367ceeef3331695a807d49f5e0e12e6a41581cec
lemma e993D_B4 : e993D 4 ((1 + X : Polynomial ℚ)^4 + X) = 7 + 6*X + 12*X^2 + 4*X^3 := by
  norm_num [e993D, derivative_pow, e993C2, e993C3, e993C4]; ring
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma e993D_X 19092ffdf7a9f47975020fd71726bf782a5c7a691ba1b0359d2032134a4b5af0
lemma e993D_X : e993D 0 (X : Polynomial ℚ) = 3 + 2*X := by
  simp [e993D]
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma e993D_L 041ccd01d7d7cba697c31bc92f3e61e80874be413af04627249db62087fd68fe
lemma e993D_L : e993D 1 (1 + X : Polynomial ℚ) = 1 := by
  simp [e993D]
  ring
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma e993NN_L 2ada322dcfc75d22cac385ddf178dc20aa1d85a91828fcfe71d74a7f75534252
lemma e993NN_L : e993NN (1 + X : Polynomial ℚ) :=
  e993NN_add e993NN_one e993NN_X
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma e993NN_twoX 62bc486ac8bca8f01547479067fcd45a418b762b2388778cf5f9f5bb2e741b50
lemma e993NN_twoX : e993NN (2 * X : Polynomial ℚ) :=
  e993NN_mul (e993NN_nat 2) e993NN_X
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma e993NN_G 392471714439b8c7a8f67aa9eec0e4090a00980183ca24ed2421013bf07e85bc
lemma e993NN_G : e993NN (1 + 2 * X : Polynomial ℚ) :=
  e993NN_add e993NN_one e993NN_twoX
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma e993NN_DG 1160df4ae39ab40085a8a9fc35a17cbeaf3fde4fd1536d7a20f90a934fc175fc
lemma e993NN_DG : e993NN (e993D 1 (1 + 2 * X : Polynomial ℚ)) := by
  rw [e993D_G]
  exact e993NN_nat 4
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma e993NN_B f2e72a41daf915a559fa01ca118db59c0fc4210de8e49be797bd939ff5872201
lemma e993NN_B (r : ℕ) : e993NN ((1 + X : Polynomial ℚ)^r + X) :=
  e993NN_add (e993NN_pow e993NN_L r) e993NN_X
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma e993NN_DB b85adbeb4a0d96bfe2f27e244c2e530d65d73f168631cb86d8d45f9d2298c9d0
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
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma e993D_one b43df3842da7929d6c567a9d4f93762baae823464c31adec2445b2153c9dd3a1
lemma e993D_one : e993D 0 (1 : Polynomial ℚ) = 0 := by
  simp [e993D]
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma e993NN_zero f799c2d97c75dbcbb009e7c01ad20731450930baab13ad5998383e9f27897f76
lemma e993NN_zero : e993NN (0 : Polynomial ℚ) := by
  intro n
  simp
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma e993NN_prod d7a703a8e88a5e0fa0762f577072a2b59230f3c578951685285b8798d3ea88d5
lemma e993NN_prod (rs : List ℕ) :
    e993NN (rs.map (fun r => (1 + X : Polynomial ℚ)^r + X)).prod := by
  induction rs with
  | nil => simpa using e993NN_one
  | cons r rs ih => simpa using e993NN_mul (e993NN_B r) ih
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma e993NN_Dprod 852818b943b1641cab5ef938fff09120c2948b39753dd77952af32a0ae5628ca
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
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma e993NN_Dpow 3b68617295a237b084e2ff8723f4dbd1c0d3b4ee8cafa69b7b7a88e18b755213
lemma e993NN_Dpow (n : ℕ) : e993NN (e993D n ((1 + X : Polynomial ℚ)^n)) := by
  induction n with
  | zero => simpa [e993D_one] using e993NN_zero
  | succ n ih =>
      have h := e993NN_add
        (e993NN_mul ih e993NN_L)
        (e993NN_mul (e993NN_pow e993NN_L n) (by simpa [e993D_L] using e993NN_one))
      simpa only [pow_succ, e993D_mul, Nat.succ_eq_add_one, e993D_L] using h
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma e993NN_parent 1c3a2c947ab07fee04494e05360efecd55a04fd0791751a03335b0ab6780e4b0
lemma e993NN_parent (rs : List ℕ) : e993NN (e993RankParent rs) := by
  unfold e993RankParent
  exact e993NN_add
    (e993NN_mul e993NN_G (e993NN_prod rs))
    (e993NN_mul e993NN_X (e993NN_pow e993NN_L (rs.sum + 1)))
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma e993NN_Dparent abccb60f345141316df4bdea19fe35d960ac7c53bf45d306e9bc3b1edd632850
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
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma e993_coeff_X_derivative 6f5fbcd0c513f6b2d8c0ca7c1415c141239cf3b08db6c4448d0c7854f019f04b
lemma e993_coeff_X_derivative (p : Polynomial ℚ) (k : ℕ) :
    (X * p.derivative).coeff k = (k : ℚ) * p.coeff k := by
  cases k with
  | zero => simp
  | succ n =>
      rw [coeff_X_mul, coeff_derivative]
      push_cast
      ring
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma e993D_coeff de478e9b023ad270bae2375537d9ae3cf499c6bf8d5dda2bd66f7ff9b82aebbe
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
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN theorem e993_rank_any_strict_descent a6e76beed39734b50d28349e062a173366b54a2a4710b8901ea14bd22253f6c6
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
-- VERITYOS ENTRY 36 END

