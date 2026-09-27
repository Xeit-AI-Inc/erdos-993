import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition e993L fc670ae4c2b15bc461eb4bf0c6ecbf0d1323aac0a004a68818e72a322bbd526d
noncomputable
def e993L : Polynomial ℤ := 1 + Polynomial.X
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition e993G f1db3f27662786cc08789469f38f7a2e27c91398334f67de86e85430daecb5e7
noncomputable
def e993G : Polynomial ℤ := 1 + 2 * Polynomial.X
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition e993B 612dfd5731de9c3ce8bbbd6bc287a88aba1864c251d1305f05703ee8c77dac37
noncomputable
def e993B (s : ℕ) : Polynomial ℤ := e993L ^ s + Polynomial.X
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition e993F 3067de841bd3bb51835c438cf7c773fcaf43c717f95d2fefdb1c46f207eab4d7
noncomputable
def e993F (s : ℕ) : Polynomial ℤ :=
  ∑ h ∈ Finset.range (s - 1), e993L ^ h
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition e993ProfileProduct 3b01107b7a55bc9f85c7dc6df9080e5ee0d4712223b5da3bcf0450f7cb347581
noncomputable
def e993ProfileProduct {m : ℕ} (r : Fin m → ℕ) : Polynomial ℤ :=
  ∏ h : Fin m, e993B (r h)
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition e993ProfileDegree 3a726a06ff35f387f5cdfb46351e0905826a0e8b53c104e351cf54844c1b265b
def e993ProfileDegree {m : ℕ} (r : Fin m → ℕ) : ℕ :=
  (∑ h : Fin m, r h) + 1
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition e993RootOut b6db97510b88f53d85c317cb2d9c41a24db22b714c5ee9e7f193a2e6c857c918
noncomputable
def e993RootOut {m : ℕ} (r : Fin m → ℕ) : Polynomial ℤ :=
  e993G * e993ProfileProduct r
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition e993MainMark d153db7fb03efd4cd2fb7fa8f55f09c9785cbca393a495034bc06bfd863934d5
noncomputable
def e993MainMark {m : ℕ} (r : Fin m → ℕ) (i : Fin m) : Polynomial ℤ :=
  e993G * e993F (r i) * ∏ h ∈ Finset.univ.erase i, e993B (r h)
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition e993Down 510aca6ecf0fb16ea1ce685ab06a5af9d875a2356bb4427835312a53a3f77bfa
noncomputable
def e993Down (q : ℕ) (C : Polynomial ℤ) : Polynomial ℤ :=
  Polynomial.C (q : ℤ) * C - Polynomial.X * C.derivative
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition e993D e94440e3e962726158d5dc1255a0ae93b6c5b0ad4cf9d2a997c6d0ab47e69700
noncomputable
def e993D (s : ℕ) : Polynomial ℤ :=
  Polynomial.C (s : ℤ) * e993B s - Polynomial.X * (e993B s).derivative
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition e993FiniteConvolution 99dac6d4421849c0d78a1b98866c177c938a719fcedbffc586f9cd003b68153a
def e993FiniteConvolution (d : ℕ) (a : ℕ → ℤ) (h : ℤ → ℤ) (k : ℤ) : ℤ :=
  ∑ u ∈ Finset.range (d + 1), a u * h (k - (u : ℤ))
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition e993CoeffZ 86f6c57fc48d68bd9603db2853e592befc41c5dd5183207a1c158a7adc32b29e
def e993CoeffZ (p : Polynomial ℤ) (k : ℤ) : ℤ :=
  if k < 0 then 0 else p.coeff k.toNat
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition e993KernelB2 73915dfdb054e393d9630ec4e30fd0346c5a117d7d90d391a56632f7d92bad7c
def e993KernelB2 (z : ℤ) : ℤ :=
  if z = 0 then 1 else if z = 1 then 3 else if z = 2 then 1 else 0
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN definition e993KernelG 630b9e198e9c91fb892d3e8d8a8e6a9956470dc6e9b1d3e1daf60547a4ea5e3b
def e993KernelG (z : ℤ) : ℤ := if z = 0 then 1 else if z = 1 then 2 else 0
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN definition e993KernelB3 7efeee0a030213cd4b768c3097f4a1d8c65c9f14e0a0cd42e5cb1420c9ed1705
def e993KernelB3 (z : ℤ) : ℤ := if z = 0 then 1 else if z = 1 then 4 else if z = 2 then 3 else if z = 3 then 1 else 0
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN definition e993KernelB4 62509fb950f62d485652d18ba267e06297532dc9e8e0582ff91bd6ea8db37bb4
def e993KernelB4 (z : ℤ) : ℤ := if z = 0 then 1 else if z = 1 then 5 else if z = 2 then 6 else if z = 3 then 4 else if z = 4 then 1 else 0
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN definition e993LR 29e1255b3a06894388cdd46f85347914b99c13c5faaed4d0c59d430d891808c0
def e993LR (a b : Polynomial ℤ) : Prop :=
  ∀ u v : ℕ, u < v →
    0 ≤ a.coeff u * b.coeff v - a.coeff v * b.coeff u
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN definition e993PolyTP2 31c325818ac770c5e210e185610f655bd5026a256a30c6e79cba62bb3ab56919
def e993PolyTP2 (h : Polynomial ℤ) : Prop :=
  ∀ u v x y : ℤ, u < v → x < y →
    0 ≤ e993CoeffZ h (x - u) * e993CoeffZ h (y - v) -
      e993CoeffZ h (y - u) * e993CoeffZ h (x - v)
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma e993Down_coeff 8370b02f85b0e4ccac488acf8c79ecc6d46979bc908b1982f3626bdd7c5b5329
lemma e993Down_coeff (q j : ℕ) (C : Polynomial ℤ) :
    (e993Down q C).coeff j = ((q : ℤ) - (j : ℤ)) * C.coeff j := by
  cases j with
  | zero =>
      simp [e993Down, Polynomial.coeff_sub, Polynomial.coeff_C_mul,
        Polynomial.coeff_X_mul_zero]
  | succ n =>
      simp only [e993Down, Polynomial.coeff_sub, Polynomial.coeff_C_mul,
        Polynomial.coeff_X_mul, Polynomial.coeff_derivative]
      push_cast
      ring
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma e993B_two 17ea63e75c0b71ed184941c07345aaef18e86b123aaf8fa6b930b246b4498494
lemma e993B_two :
    e993B 2 = 1 + 3 * Polynomial.X + Polynomial.X ^ 2 := by
  unfold e993B e993L
  ring
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma e993B_three b389ba1ddfa3ec5181eee32a90e98bd0865e7dd21acf3520b8dc200bea68f6ac
lemma e993B_three :
    e993B 3 = 1 + 4 * Polynomial.X + 3 * Polynomial.X ^ 2 +
      Polynomial.X ^ 3 := by
  unfold e993B e993L
  ring
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma e993B_four 81be4db522590104bb34e2eb561b55a5f93da161ce2302eabaa9bdfc34a98213
lemma e993B_four :
    e993B 4 = 1 + 5 * Polynomial.X + 6 * Polynomial.X ^ 2 +
      4 * Polynomial.X ^ 3 + Polynomial.X ^ 4 := by
  unfold e993B e993L
  ring
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma e993F_two 8e1422c92e0fe5597f171cb98a18df237f44d03b20df5b4a057f8df36267a0b7
lemma e993F_two : e993F 2 = 1 := by
  simp [e993F]
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma e993F_three ca10050bedfdd77750427f7abcb9f8f5538ced1479f6391acaf7a37df50442ab
lemma e993F_three : e993F 3 = 2 + Polynomial.X := by
  norm_num [e993F, e993L, Finset.sum_range_succ]
  ring
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma e993F_four 3cf6ae3810bf7c9afd75382d08fde3952c02ba42558825eb28e8fc55af4c7f76
lemma e993F_four :
    e993F 4 = 3 + 3 * Polynomial.X + Polynomial.X ^ 2 := by
  norm_num [e993F, e993L, Finset.sum_range_succ]
  ring
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma e993_double_sum_det 098bb7ce64d92491ec6ed31ebe9cfd8af5e816d7d1710f6f40a6210b943a8360
lemma e993_double_sum_det {α : Type*} (s : Finset α)
    (a b x y : α → ℤ) :
    2 * ((∑ u ∈ s, a u * x u) * (∑ v ∈ s, b v * y v) -
      (∑ u ∈ s, a u * y u) * (∑ v ∈ s, b v * x v)) =
    ∑ u ∈ s, ∑ v ∈ s,
      (a u * b v - a v * b u) * (x u * y v - x v * y u) := by
  let P := ∑ u ∈ s, ∑ v ∈ s, a u * b v * x u * y v
  let Q := ∑ u ∈ s, ∑ v ∈ s, a u * b v * x v * y u
  let R := ∑ u ∈ s, ∑ v ∈ s, a v * b u * x u * y v
  let S := ∑ u ∈ s, ∑ v ∈ s, a v * b u * x v * y u
  have hPQ : (∑ u ∈ s, ∑ v ∈ s,
      (a u * b v - a v * b u) * (x u * y v - x v * y u)) =
      P - Q - R + S := by
    dsimp [P, Q, R, S]
    simp_rw [mul_sub, sub_mul, Finset.sum_sub_distrib]
    ring
  have hP : P = (∑ u ∈ s, a u * x u) * (∑ v ∈ s, b v * y v) := by
    rw [Finset.sum_mul_sum]
    dsimp [P]
    apply Finset.sum_congr rfl
    intro u hu
    apply Finset.sum_congr rfl
    intro v hv
    ring
  have hS : S = P := by
    dsimp [S, P]
    rw [Finset.sum_comm]
  have hQ : Q = (∑ u ∈ s, a u * y u) * (∑ v ∈ s, b v * x v) := by
    rw [Finset.sum_mul_sum]
    dsimp [Q]
    apply Finset.sum_congr rfl
    intro u hu
    apply Finset.sum_congr rfl
    intro v hv
    ring
  have hR : R = Q := by
    dsimp [R, Q]
    rw [Finset.sum_comm]
  rw [hPQ, hS, hR, hP, hQ]
  ring
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma e993_double_sum_nonneg 7ecc4d64ac554354aa460c0a984970b289fd156dbdfe0aa0ae1ee07f1ffe5c62
lemma e993_double_sum_nonneg {α : Type*} [LinearOrder α] (s : Finset α)
    (a b x y : α → ℤ)
    (hab : ∀ u ∈ s, ∀ v ∈ s, u < v → 0 ≤ a u * b v - a v * b u)
    (hxy : ∀ u ∈ s, ∀ v ∈ s, u < v → 0 ≤ x u * y v - x v * y u) :
    0 ≤ (∑ u ∈ s, a u * x u) * (∑ v ∈ s, b v * y v) -
      (∑ u ∈ s, a u * y u) * (∑ v ∈ s, b v * x v) := by
  have hterm : ∀ u ∈ s, ∀ v ∈ s,
      0 ≤ (a u * b v - a v * b u) * (x u * y v - x v * y u) := by
    intro u hu v hv
    rcases lt_trichotomy u v with huv | heq | hvu
    · exact mul_nonneg (hab u hu v hv huv) (hxy u hu v hv huv)
    · subst v
      simp
    · have h₁ := hab v hv u hu hvu
      have h₂ := hxy v hv u hu hvu
      nlinarith [mul_nonneg h₁ h₂]
  have hsum : 0 ≤ ∑ u ∈ s, ∑ v ∈ s,
      (a u * b v - a v * b u) * (x u * y v - x v * y u) := by
    apply Finset.sum_nonneg
    intro u hu
    apply Finset.sum_nonneg
    intro v hv
    exact hterm u hu v hv
  rw [← e993_double_sum_det] at hsum
  omega
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma e993D_two fa0e89d5ba8203d721c21162b665924423ed17aaa84b48e5dbf3eea33ff628ea
lemma e993D_two : e993D 2 = 2 + 3 * Polynomial.X := by
  rw [e993D, e993B_two]
  norm_num [Polynomial.derivative_add, Polynomial.derivative_mul,
    Polynomial.derivative_pow]
  ring
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma e993D_three c1e31c1c910f0dc8c16fb0dfb3dd24dad0887c4ddb0ec1701e5df0faaf3dae97
lemma e993D_three :
    e993D 3 = 3 + 8 * Polynomial.X + 3 * Polynomial.X ^ 2 := by
  rw [e993D, e993B_three]
  norm_num [Polynomial.derivative_add, Polynomial.derivative_mul,
    Polynomial.derivative_pow]
  ring
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma e993D_four 15af603ab43a69ae76be508231307bfb3cd1e0678234ac28ff4ea79bc885c579
lemma e993D_four :
    e993D 4 = 4 + 15 * Polynomial.X + 12 * Polynomial.X ^ 2 +
      4 * Polynomial.X ^ 3 := by
  rw [e993D, e993B_four]
  norm_num [Polynomial.derivative_add, Polynomial.derivative_mul,
    Polynomial.derivative_pow]
  ring
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma e993_margin_eq_minor 1a778229edae073f4132a6c7a27f394ba64cc67c763fd1b92d411556a66dc868
lemma e993_margin_eq_minor (q j : ℕ) (C T : Polynomial ℤ) :
    ((q : ℤ) - (j : ℤ) - 1) * T.coeff j * C.coeff (j + 1) -
      ((q : ℤ) - (j : ℤ)) * T.coeff (j + 1) * C.coeff j =
    T.coeff j * (e993Down q C).coeff (j + 1) -
      T.coeff (j + 1) * (e993Down q C).coeff j := by
  rw [e993Down_coeff, e993Down_coeff]
  push_cast
  ring
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma e993_local_F2_D2 c7be8c960595a48104d5c4590b6a1d69cdde89ba1f10aa4c9fbf5ca9ba4a72de
lemma e993_local_F2_D2 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 2).coeff u * (e993D 2).coeff v -
      (e993F 2).coeff v * (e993D 2).coeff u := by
  rw [e993F_two, e993D_two]
  have hv : v ≠ 0 := by omega
  by_cases hu : u = 0
  · subst u
    cases v with
    | zero => omega
    | succ n =>
        cases n with
        | zero => norm_num [Polynomial.coeff_add, Polynomial.coeff_X, Polynomial.coeff_one]
        | succ n => simp [Polynomial.coeff_add, Polynomial.coeff_X, Polynomial.coeff_one]
  · simp [hu, hv, Polynomial.coeff_one, Polynomial.coeff_natCast_ite]
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma e993_lr_of_finite_coefficients 9269fc6656190a02aadaa157a33d83c15648e644577e0ccdc0363beefa493ea0
lemma e993_lr_of_finite_coefficients (d : ℕ) (a b : Polynomial ℤ)
    (ha : ∀ n, d < n → a.coeff n = 0)
    (hb : ∀ n, d < n → b.coeff n = 0)
    (hfinite : ∀ u v, u < v → v ≤ d →
      0 ≤ a.coeff u * b.coeff v - a.coeff v * b.coeff u)
    (u v : ℕ) (huv : u < v) :
    0 ≤ a.coeff u * b.coeff v - a.coeff v * b.coeff u := by
  by_cases hv : v ≤ d
  · exact hfinite u v huv hv
  · have hdv : d < v := by omega
    rw [ha v hdv, hb v hdv]
    simp
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma e993FiniteConvolution_lr 193ed247f45934c48750beeeb7b3b7f57637082c130a526deb076697a846297b
lemma e993FiniteConvolution_lr (d : ℕ) (a b : ℕ → ℤ) (h : ℤ → ℤ) (k : ℤ)
    (hab : ∀ u v, u ≤ d → v ≤ d → u < v →
      0 ≤ a u * b v - a v * b u)
    (htp : ∀ u v, u ≤ d → v ≤ d → u < v →
      0 ≤ h (k - (u : ℤ)) * h (k + 1 - (v : ℤ)) -
        h (k - (v : ℤ)) * h (k + 1 - (u : ℤ))) :
    0 ≤ e993FiniteConvolution d a h k * e993FiniteConvolution d b h (k + 1) -
      e993FiniteConvolution d a h (k + 1) * e993FiniteConvolution d b h k := by
  unfold e993FiniteConvolution
  convert e993_double_sum_nonneg (Finset.range (d + 1)) a b
      (fun u => h (k - (u : ℤ))) (fun u => h (k + 1 - (u : ℤ)))
      (by
        intro u hu v hv huv
        exact hab u v (by simpa using hu) (by simpa using hv) huv)
      (by
        intro u hu v hv huv
        exact htp u v (by simpa using hu) (by simpa using hv) huv) using 1 <;> ring
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma e993CoeffZ_sub_nat 80b5dcb0253e5de0d5c6db8a659bca3e03cc3eadf1b17f3dfac70e55bf4fc491
lemma e993CoeffZ_sub_nat (p : Polynomial ℤ) (k u : ℕ) (hu : u ≤ k) :
    e993CoeffZ p ((k : ℤ) - (u : ℤ)) = p.coeff (k - u) := by
  have hnonneg : ¬(k : ℤ) - (u : ℤ) < 0 := by omega
  have hnat : ((k : ℤ) - (u : ℤ)).toNat = k - u := by omega
  simp [e993CoeffZ, hnonneg, hnat]
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma e993_coeff_mul_common_range 6973d23c3b9ad7efe4709469d8c1f93d6ed166b21c4ef35694d1c655e3639d85
lemma e993_coeff_mul_common_range (a h : Polynomial ℤ) (k : ℕ) :
    (a * h).coeff k =
      ∑ u ∈ Finset.range (k + 2), a.coeff u *
        e993CoeffZ h ((k : ℤ) - (u : ℤ)) := by
  rw [Polynomial.coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  conv_rhs => rw [Finset.sum_range_succ]
  have hlast : e993CoeffZ h ((k : ℤ) - ((k + 1 : ℕ) : ℤ)) = 0 := by
    simp [e993CoeffZ]
  rw [hlast]
  simp only [mul_zero, add_zero]
  apply Finset.sum_congr rfl
  intro u hu
  have huk : u ≤ k := by simpa using hu
  rw [e993CoeffZ_sub_nat h k u huk]
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma e993_coeff_mul_common_range_shift 2b7cfcb528f84f1cf8315dfdc3d03f120f1a08359e88b91429e5ae0e31bef1ad
lemma e993_coeff_mul_common_range_shift (a h : Polynomial ℤ) (k : ℕ) :
    (a * h).coeff (k + 1) =
      ∑ u ∈ Finset.range (k + 2), a.coeff u *
        e993CoeffZ h (((k + 1 : ℕ) : ℤ) - (u : ℤ)) := by
  rw [Polynomial.coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  apply Finset.sum_congr rfl
  intro u hu
  have huk : u ≤ k + 1 := by simpa using hu
  rw [e993CoeffZ_sub_nat h (k + 1) u huk]
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma e993_poly_common_mul_lr aac2158c97a56ab1080854575b29643e7b0ff387832d5e36b293570766526089
lemma e993_poly_common_mul_lr (a b h : Polynomial ℤ) (k : ℕ)
    (hab : ∀ u v : ℕ, u < v →
      0 ≤ a.coeff u * b.coeff v - a.coeff v * b.coeff u)
    (htp : ∀ u v : ℕ, u < v →
      0 ≤ e993CoeffZ h ((k : ℤ) - (u : ℤ)) *
          e993CoeffZ h (((k + 1 : ℕ) : ℤ) - (v : ℤ)) -
        e993CoeffZ h ((k : ℤ) - (v : ℤ)) *
          e993CoeffZ h (((k + 1 : ℕ) : ℤ) - (u : ℤ))) :
    0 ≤ (a * h).coeff k * (b * h).coeff (k + 1) -
      (a * h).coeff (k + 1) * (b * h).coeff k := by
  rw [e993_coeff_mul_common_range a h k, e993_coeff_mul_common_range b h k,
    e993_coeff_mul_common_range_shift a h k, e993_coeff_mul_common_range_shift b h k]
  exact e993_double_sum_nonneg (Finset.range (k + 2))
    (fun u => a.coeff u) (fun u => b.coeff u)
    (fun u => e993CoeffZ h ((k : ℤ) - (u : ℤ)))
    (fun u => e993CoeffZ h (((k + 1 : ℕ) : ℤ) - (u : ℤ)))
    (by intro u _ v _ huv; exact hab u v huv)
    (by intro u _ v _ huv; exact htp u v huv)
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma e993_tp2_from_finite 94ad9811af9c5cb25beb99d712b644e6b7f87951a57936a1d583b4927e829623
lemma e993_tp2_from_finite (d : ℤ) (h : ℤ → ℤ)
    (hnonneg : ∀ z, 0 ≤ h z)
    (hout : ∀ z, z < 0 ∨ d < z → h z = 0)
    (hfin : ∀ p q r s, 0 ≤ s → r ≤ d → s < p → p < r →
      s < q → q < r → p + q = r + s →
      0 ≤ h p * h q - h r * h s)
    (u v x y : ℤ) (huv : u < v) (hxy : x < y) :
    0 ≤ h (x - u) * h (y - v) - h (y - u) * h (x - v) := by
  let p := x - u
  let q := y - v
  let r := y - u
  let s := x - v
  have hsp : s < p := by dsimp [s, p]; omega
  have hpr : p < r := by dsimp [p, r]; omega
  have hsq : s < q := by dsimp [s, q]; omega
  have hqr : q < r := by dsimp [q, r]; omega
  have hsum : p + q = r + s := by dsimp [p, q, r, s]; omega
  change 0 ≤ h p * h q - h r * h s
  by_cases hs : s < 0 ∨ d < s
  · rw [hout s hs]
    nlinarith [mul_nonneg (hnonneg p) (hnonneg q)]
  by_cases hr : r < 0 ∨ d < r
  · rw [hout r hr]
    nlinarith [mul_nonneg (hnonneg p) (hnonneg q)]
  have hs0 : 0 ≤ s := by omega
  have hrd : r ≤ d := by omega
  exact hfin p q r s hs0 hrd hsp hpr hsq hqr hsum
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma e993KernelB2_tp2 b2514fd0474eb837264dfde9ed22a72969f0e28978a5b1fd1a6aac19257352d8
lemma e993KernelB2_tp2 (u v x y : ℤ) (huv : u < v) (hxy : x < y) :
    0 ≤ e993KernelB2 (x - u) * e993KernelB2 (y - v) -
      e993KernelB2 (y - u) * e993KernelB2 (x - v) := by
  apply e993_tp2_from_finite 2 e993KernelB2 ?_ ?_ ?_ u v x y huv hxy
  · intro z
    simp only [e993KernelB2]
    split_ifs <;> omega
  · intro z hz
    simp only [e993KernelB2]
    split_ifs <;> omega
  · intro p q r s hs0 hrd hsp hpr hsq hqr hsum
    have hsd : s ≤ 2 := by omega
    have hr0 : 0 ≤ r := by omega
    have hp0 : 0 ≤ p := by omega
    have hpd : p ≤ 2 := by omega
    have hq0 : 0 ≤ q := by omega
    have hqd : q ≤ 2 := by omega
    interval_cases s <;> interval_cases p <;> interval_cases q <;> interval_cases r <;>
      norm_num [e993KernelB2] at * <;> omega
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma e993KernelG_tp2 428868a2dfc863a400952a60cb3dbabfc3fdf501d6d1bab2050b9292c14f65a1
lemma e993KernelG_tp2 (u v x y : ℤ) (huv : u < v) (hxy : x < y) :
    0 ≤ e993KernelG (x - u) * e993KernelG (y - v) -
      e993KernelG (y - u) * e993KernelG (x - v) := by
  apply e993_tp2_from_finite 1 e993KernelG ?_ ?_ ?_ u v x y huv hxy
  · intro z
    simp only [e993KernelG]
    split_ifs <;> omega
  · intro z hz
    simp only [e993KernelG]
    split_ifs <;> omega
  · intro p q r s hs0 hrd hsp hpr hsq hqr hsum
    have hsd : s ≤ 1 := by omega
    have hr0 : 0 ≤ r := by omega
    have hp0 : 0 ≤ p := by omega
    have hpd : p ≤ 1 := by omega
    have hq0 : 0 ≤ q := by omega
    have hqd : q ≤ 1 := by omega
    interval_cases s <;> interval_cases p <;> interval_cases q <;> interval_cases r <;>
      norm_num [e993KernelG] at * <;> omega
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma e993KernelB3_tp2 18c31f30fbb5d41fac710f87c1250c4673d94a033c58425410972821f5c0e449
lemma e993KernelB3_tp2 (u v x y : ℤ) (huv : u < v) (hxy : x < y) :
    0 ≤ e993KernelB3 (x - u) * e993KernelB3 (y - v) -
      e993KernelB3 (y - u) * e993KernelB3 (x - v) := by
  apply e993_tp2_from_finite 3 e993KernelB3 ?_ ?_ ?_ u v x y huv hxy
  · intro z
    simp only [e993KernelB3]
    split_ifs <;> omega
  · intro z hz
    simp only [e993KernelB3]
    split_ifs <;> omega
  · intro p q r s hs0 hrd hsp hpr hsq hqr hsum
    have hsd : s ≤ 3 := by omega
    have hr0 : 0 ≤ r := by omega
    have hp0 : 0 ≤ p := by omega
    have hpd : p ≤ 3 := by omega
    have hq0 : 0 ≤ q := by omega
    have hqd : q ≤ 3 := by omega
    interval_cases s <;> interval_cases p <;> interval_cases q <;> interval_cases r <;>
      norm_num [e993KernelB3] at * <;> omega
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma e993KernelB4_tp2 948ad0688a3871491a8ad94d8121177e49378b0c0fb9f99ed37ed01180da6052
lemma e993KernelB4_tp2 (u v x y : ℤ) (huv : u < v) (hxy : x < y) :
    0 ≤ e993KernelB4 (x - u) * e993KernelB4 (y - v) -
      e993KernelB4 (y - u) * e993KernelB4 (x - v) := by
  apply e993_tp2_from_finite 4 e993KernelB4 ?_ ?_ ?_ u v x y huv hxy
  · intro z
    simp only [e993KernelB4]
    split_ifs <;> omega
  · intro z hz
    simp only [e993KernelB4]
    split_ifs <;> omega
  · intro p q r s hs0 hrd hsp hpr hsq hqr hsum
    have hsd : s ≤ 4 := by omega
    have hr0 : 0 ≤ r := by omega
    have hp0 : 0 ≤ p := by omega
    have hpd : p ≤ 4 := by omega
    have hq0 : 0 ≤ q := by omega
    have hqd : q ≤ 4 := by omega
    interval_cases s <;> interval_cases p <;> interval_cases q <;> interval_cases r <;>
      norm_num [e993KernelB4] at * <;> omega
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma e993CoeffZ_B2 f972323e545c39c70996601f12a2e963c0726880d307394419317263bcdb09e3
lemma e993CoeffZ_B2 (z : ℤ) :
    e993CoeffZ (e993B 2) z = e993KernelB2 z := by
  by_cases hz : z < 0
  · simp [e993CoeffZ, hz, e993KernelB2]
    omega
  · have hz0 : 0 ≤ z := by omega
    lift z to ℕ using hz0
    simp [e993CoeffZ, e993KernelB2, e993B_two,
      Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one]
    split_ifs <;> omega
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma e993CoeffZ_G 8c88303e4ab0f32053edb131da83470a9fdd985d43185a6b99601978565456d3
lemma e993CoeffZ_G (z : ℤ) :
    e993CoeffZ (e993G) z = e993KernelG z := by
  by_cases hz : z < 0
  · simp [e993CoeffZ, hz, e993KernelG]
    omega
  · have hz0 : 0 ≤ z := by omega
    lift z to ℕ using hz0
    simp [e993CoeffZ, e993KernelG, e993G,
      Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one]
    split_ifs <;> omega
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma e993CoeffZ_B3 c466a07ea7ef30fa8a7b44ad676b6b5bd3f34bc0a1bb65ef115e144a497b343a
lemma e993CoeffZ_B3 (z : ℤ) :
    e993CoeffZ (e993B 3) z = e993KernelB3 z := by
  by_cases hz : z < 0
  · simp [e993CoeffZ, hz, e993KernelB3]
    omega
  · have hz0 : 0 ≤ z := by omega
    lift z to ℕ using hz0
    simp [e993CoeffZ, e993KernelB3, e993B_three,
      Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one]
    split_ifs <;> omega
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma e993CoeffZ_B4 1051d4b28b82b3b7f7e187756c3f5307cfd75f4fcf1b569fdedf126e0a368e86
lemma e993CoeffZ_B4 (z : ℤ) :
    e993CoeffZ (e993B 4) z = e993KernelB4 z := by
  by_cases hz : z < 0
  · simp [e993CoeffZ, hz, e993KernelB4]
    omega
  · have hz0 : 0 ≤ z := by omega
    lift z to ℕ using hz0
    simp [e993CoeffZ, e993KernelB4, e993B_four,
      Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one]
    split_ifs <;> omega
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma e993_coeff_mul_larger_range 757d0198b652f17312c6a70cada3bfc171d56d21005b3af5d95857f0b5d1e02d
lemma e993_coeff_mul_larger_range (a h : Polynomial ℤ) (j k : ℕ) (hjk : j ≤ k) :
    (a * h).coeff j =
      ∑ u ∈ Finset.range (k + 1), a.coeff u *
        e993CoeffZ h ((j : ℤ) - (u : ℤ)) := by
  calc
    (a * h).coeff j =
        ∑ u ∈ Finset.range (j + 1), a.coeff u * h.coeff (j - u) := by
          rw [Polynomial.coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
    _ = ∑ u ∈ Finset.range (j + 1), a.coeff u *
          e993CoeffZ h ((j : ℤ) - (u : ℤ)) := by
          apply Finset.sum_congr rfl
          intro u hu
          have huj : u ≤ j := by simpa using hu
          rw [e993CoeffZ_sub_nat h j u huj]
    _ = ∑ u ∈ Finset.range (k + 1), a.coeff u *
          e993CoeffZ h ((j : ℤ) - (u : ℤ)) := by
          apply Finset.sum_subset (Finset.range_mono (by omega))
          intro u hu hnot
          have hju : j < u := by
            simp only [Finset.mem_range] at hnot
            omega
          have hz : (j : ℤ) - (u : ℤ) < 0 := by omega
          simp [e993CoeffZ, hz]
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma e993_poly_mul_full_lr 723fe4696296960865b71a8c6241ab82d739936b0d0c97305139095dd354e448
lemma e993_poly_mul_full_lr (a b h : Polynomial ℤ)
    (hab : ∀ u v : ℕ, u < v →
      0 ≤ a.coeff u * b.coeff v - a.coeff v * b.coeff u)
    (hh : ∀ u v x y : ℤ, u < v → x < y →
      0 ≤ e993CoeffZ h (x - u) * e993CoeffZ h (y - v) -
        e993CoeffZ h (y - u) * e993CoeffZ h (x - v))
    (j k : ℕ) (hjk : j < k) :
    0 ≤ (a * h).coeff j * (b * h).coeff k -
      (a * h).coeff k * (b * h).coeff j := by
  have hjkle : j ≤ k := by omega
  rw [e993_coeff_mul_larger_range a h j k hjkle,
    e993_coeff_mul_larger_range b h k k le_rfl,
    e993_coeff_mul_larger_range a h k k le_rfl,
    e993_coeff_mul_larger_range b h j k hjkle]
  exact e993_double_sum_nonneg (Finset.range (k + 1))
    (fun u => a.coeff u) (fun u => b.coeff u)
    (fun u => e993CoeffZ h ((j : ℤ) - (u : ℤ)))
    (fun u => e993CoeffZ h ((k : ℤ) - (u : ℤ)))
    (by intro u _ v _ huv; exact hab u v huv)
    (by
      intro u _ v _ huv
      convert hh u v (j : ℤ) (k : ℤ) (by exact_mod_cast huv)
        (by exact_mod_cast hjk) using 1 <;> ring)
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma e993_local_GF3_B3 a87308f9bd18a4704aff7ca9b1da45282ae5cef55c8fa6a90168e1d57aae0267
lemma e993_local_GF3_B3 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993G * e993F 3).coeff u * (e993B 3).coeff v -
      (e993G * e993F 3).coeff v * (e993B 3).coeff u := by
  have hA : e993G * e993F 3 =
      2 + 5 * Polynomial.X + 2 * Polynomial.X ^ 2 := by
    rw [e993F_three]
    unfold e993G
    ring
  rw [hA, e993B_three]
  by_cases hv : v ≤ 3
  · have hu : u ≤ 2 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · have hv3 : 3 < v := by omega
    have hv0 : v ≠ 0 := by omega
    have hv1 : v ≠ 1 := by omega
    have hv2 : v ≠ 2 := by omega
    have hv3n : v ≠ 3 := by omega
    obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3]
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma e993_local_GF2_B2 f995557dd87037ba7a204b5b7502ff77c5f6fb109dcb7d72a0ebf998f956571a
lemma e993_local_GF2_B2 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993G * e993F 2).coeff u * (e993B 2).coeff v -
      (e993G * e993F 2).coeff v * (e993B 2).coeff u := by
  have hA : e993G * e993F 2 = 1 + 2 * Polynomial.X := by
    rw [e993F_two]
    unfold e993G
    ring
  rw [hA, e993B_two]
  by_cases hv : v ≤ 2
  · have hu : u ≤ 1 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2]
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma e993_local_GF4_B4 dcf2c47fd5166d4d4a6c950d6619026b3f7a540cc5b1c4376199902c7f8f8e28
lemma e993_local_GF4_B4 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993G * e993F 4).coeff u * (e993B 4).coeff v -
      (e993G * e993F 4).coeff v * (e993B 4).coeff u := by
  have hA : e993G * e993F 4 =
      3 + 9 * Polynomial.X + 7 * Polynomial.X ^ 2 + 2 * Polynomial.X ^ 3 := by
    rw [e993F_four]
    unfold e993G
    ring
  rw [hA, e993B_four]
  by_cases hv : v ≤ 4
  · have hu : u ≤ 3 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4]
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma e993_local_F3_D3 a146d6c829db9f8e4f2adfc07401c62e3898f91c8aa061eca017addfe00e8ac1
lemma e993_local_F3_D3 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 3).coeff u * (e993D 3).coeff v -
      (e993F 3).coeff v * (e993D 3).coeff u := by
  rw [e993F_three, e993D_three]
  by_cases hv : v ≤ 2
  · have hu : u ≤ 1 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2]
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma e993_local_F4_D4 6b857e0bc6aca022a3c1503bccbb2c7e7c6988813be82cc7260aa45cced674ea
lemma e993_local_F4_D4 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 4).coeff u * (e993D 4).coeff v -
      (e993F 4).coeff v * (e993D 4).coeff u := by
  rw [e993F_four, e993D_four]
  by_cases hv : v ≤ 3
  · have hu : u ≤ 2 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3]
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma e993_local_F2B2_B2D2 28dc685ece549687752cf65c9d5219aa6d4f331e530891248d033e97a3bd7a84
lemma e993_local_F2B2_B2D2 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 2 * e993B 2).coeff u *
        (e993B 2 * e993D 2).coeff v -
      (e993F 2 * e993B 2).coeff v *
        (e993B 2 * e993D 2).coeff u := by
  have hA : e993F 2 * e993B 2 = 1 + 3 * Polynomial.X + 1 * Polynomial.X ^ 2 := by
    rw [e993F_two, e993B_two]
    ring
  have hB : e993B 2 * e993D 2 = 2 + 9 * Polynomial.X + 11 * Polynomial.X ^ 2 + 3 * Polynomial.X ^ 3 := by
    rw [e993B_two, e993D_two]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 3
  · have hu : u ≤ 2 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3]
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma e993_local_F2B3_B2D3 f6261c27edbb91ce3447877689ea4a1683eb8e2e712e38b3f5790f420e17a6f7
lemma e993_local_F2B3_B2D3 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 2 * e993B 3).coeff u *
        (e993B 2 * e993D 3).coeff v -
      (e993F 2 * e993B 3).coeff v *
        (e993B 2 * e993D 3).coeff u := by
  have hA : e993F 2 * e993B 3 = 1 + 4 * Polynomial.X + 3 * Polynomial.X ^ 2 + 1 * Polynomial.X ^ 3 := by
    rw [e993F_two, e993B_three]
    ring
  have hB : e993B 2 * e993D 3 = 3 + 17 * Polynomial.X + 30 * Polynomial.X ^ 2 + 17 * Polynomial.X ^ 3 + 3 * Polynomial.X ^ 4 := by
    rw [e993B_two, e993D_three]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 4
  · have hu : u ≤ 3 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4]
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma e993_local_F2B4_B2D4 4b62854958d517c382aa8640e58e28931b53b4acbfa414c117853d1868c00540
lemma e993_local_F2B4_B2D4 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 2 * e993B 4).coeff u *
        (e993B 2 * e993D 4).coeff v -
      (e993F 2 * e993B 4).coeff v *
        (e993B 2 * e993D 4).coeff u := by
  have hA : e993F 2 * e993B 4 = 1 + 5 * Polynomial.X + 6 * Polynomial.X ^ 2 + 4 * Polynomial.X ^ 3 + 1 * Polynomial.X ^ 4 := by
    rw [e993F_two, e993B_four]
    ring
  have hB : e993B 2 * e993D 4 = 4 + 27 * Polynomial.X + 61 * Polynomial.X ^ 2 + 55 * Polynomial.X ^ 3 + 24 * Polynomial.X ^ 4 + 4 * Polynomial.X ^ 5 := by
    rw [e993B_two, e993D_four]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 5
  · have hu : u ≤ 4 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    have hn5 : n + 1 ≠ 5 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4, hn5]
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma e993_local_F3B2_B3D2 be2f8471998bd72d5031d62f1379b7374b5f0e426c18e6920c604718f63673e0
lemma e993_local_F3B2_B3D2 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 3 * e993B 2).coeff u *
        (e993B 3 * e993D 2).coeff v -
      (e993F 3 * e993B 2).coeff v *
        (e993B 3 * e993D 2).coeff u := by
  have hA : e993F 3 * e993B 2 = 2 + 7 * Polynomial.X + 5 * Polynomial.X ^ 2 + 1 * Polynomial.X ^ 3 := by
    rw [e993F_three, e993B_two]
    ring
  have hB : e993B 3 * e993D 2 = 2 + 11 * Polynomial.X + 18 * Polynomial.X ^ 2 + 11 * Polynomial.X ^ 3 + 3 * Polynomial.X ^ 4 := by
    rw [e993B_three, e993D_two]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 4
  · have hu : u ≤ 3 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4]
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma e993_local_F3B3_B3D3 c5ada4d52344867c83e92542e4f5291c747789b7a14a53354c3cd3b11bf9c7a0
lemma e993_local_F3B3_B3D3 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 3 * e993B 3).coeff u *
        (e993B 3 * e993D 3).coeff v -
      (e993F 3 * e993B 3).coeff v *
        (e993B 3 * e993D 3).coeff u := by
  have hA : e993F 3 * e993B 3 = 2 + 9 * Polynomial.X + 10 * Polynomial.X ^ 2 + 5 * Polynomial.X ^ 3 + 1 * Polynomial.X ^ 4 := by
    rw [e993F_three, e993B_three]
    ring
  have hB : e993B 3 * e993D 3 = 3 + 20 * Polynomial.X + 44 * Polynomial.X ^ 2 + 39 * Polynomial.X ^ 3 + 17 * Polynomial.X ^ 4 + 3 * Polynomial.X ^ 5 := by
    rw [e993B_three, e993D_three]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 5
  · have hu : u ≤ 4 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    have hn5 : n + 1 ≠ 5 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4, hn5]
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma e993_local_F3B4_B3D4 a024a6b6763ac8757c0b718ffc8c695b5befede47edf110b2169863c5a805dd1
lemma e993_local_F3B4_B3D4 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 3 * e993B 4).coeff u *
        (e993B 3 * e993D 4).coeff v -
      (e993F 3 * e993B 4).coeff v *
        (e993B 3 * e993D 4).coeff u := by
  have hA : e993F 3 * e993B 4 = 2 + 11 * Polynomial.X + 17 * Polynomial.X ^ 2 + 14 * Polynomial.X ^ 3 + 6 * Polynomial.X ^ 4 + 1 * Polynomial.X ^ 5 := by
    rw [e993F_three, e993B_four]
    ring
  have hB : e993B 3 * e993D 4 = 4 + 31 * Polynomial.X + 84 * Polynomial.X ^ 2 + 101 * Polynomial.X ^ 3 + 67 * Polynomial.X ^ 4 + 24 * Polynomial.X ^ 5 + 4 * Polynomial.X ^ 6 := by
    rw [e993B_three, e993D_four]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 6
  · have hu : u ≤ 5 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    have hn5 : n + 1 ≠ 5 := by omega
    have hn6 : n + 1 ≠ 6 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4, hn5, hn6]
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma e993_local_F4B2_B4D2 015c21e2ad4c1664f1dc66873ece76c58c5ee9860464c2481b3aff8e6d7558a0
lemma e993_local_F4B2_B4D2 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 4 * e993B 2).coeff u *
        (e993B 4 * e993D 2).coeff v -
      (e993F 4 * e993B 2).coeff v *
        (e993B 4 * e993D 2).coeff u := by
  have hA : e993F 4 * e993B 2 = 3 + 12 * Polynomial.X + 13 * Polynomial.X ^ 2 + 6 * Polynomial.X ^ 3 + 1 * Polynomial.X ^ 4 := by
    rw [e993F_four, e993B_two]
    ring
  have hB : e993B 4 * e993D 2 = 2 + 13 * Polynomial.X + 27 * Polynomial.X ^ 2 + 26 * Polynomial.X ^ 3 + 14 * Polynomial.X ^ 4 + 3 * Polynomial.X ^ 5 := by
    rw [e993B_four, e993D_two]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 5
  · have hu : u ≤ 4 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    have hn5 : n + 1 ≠ 5 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4, hn5]
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma e993_local_F4B3_B4D3 861761a762005a165bbe01285a5a0dacababfb47fab921fc5d964a97225547e7
lemma e993_local_F4B3_B4D3 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 4 * e993B 3).coeff u *
        (e993B 4 * e993D 3).coeff v -
      (e993F 4 * e993B 3).coeff v *
        (e993B 4 * e993D 3).coeff u := by
  have hA : e993F 4 * e993B 3 = 3 + 15 * Polynomial.X + 22 * Polynomial.X ^ 2 + 16 * Polynomial.X ^ 3 + 6 * Polynomial.X ^ 4 + 1 * Polynomial.X ^ 5 := by
    rw [e993F_four, e993B_three]
    ring
  have hB : e993B 4 * e993D 3 = 3 + 23 * Polynomial.X + 61 * Polynomial.X ^ 2 + 75 * Polynomial.X ^ 3 + 53 * Polynomial.X ^ 4 + 20 * Polynomial.X ^ 5 + 3 * Polynomial.X ^ 6 := by
    rw [e993B_four, e993D_three]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 6
  · have hu : u ≤ 5 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    have hn5 : n + 1 ≠ 5 := by omega
    have hn6 : n + 1 ≠ 6 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4, hn5, hn6]
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma e993_local_F4B4_B4D4 f9ca01c282893dafbb9ce90233287036ce3ef34e0750f1929b6ec71189d2e609
lemma e993_local_F4B4_B4D4 (u v : ℕ) (huv : u < v) :
    0 ≤ (e993F 4 * e993B 4).coeff u *
        (e993B 4 * e993D 4).coeff v -
      (e993F 4 * e993B 4).coeff v *
        (e993B 4 * e993D 4).coeff u := by
  have hA : e993F 4 * e993B 4 = 3 + 18 * Polynomial.X + 34 * Polynomial.X ^ 2 + 35 * Polynomial.X ^ 3 + 21 * Polynomial.X ^ 4 + 7 * Polynomial.X ^ 5 + 1 * Polynomial.X ^ 6 := by
    rw [e993F_four, e993B_four]
    ring
  have hB : e993B 4 * e993D 4 = 4 + 35 * Polynomial.X + 111 * Polynomial.X ^ 2 + 170 * Polynomial.X ^ 3 + 156 * Polynomial.X ^ 4 + 87 * Polynomial.X ^ 5 + 28 * Polynomial.X ^ 6 + 4 * Polynomial.X ^ 7 := by
    rw [e993B_four, e993D_four]
    ring
  rw [hA, hB]
  by_cases hv : v ≤ 7
  · have hu : u ≤ 6 := by omega
    interval_cases u <;> interval_cases v <;>
      norm_num [Polynomial.coeff_add, Polynomial.coeff_X_pow,
        Polynomial.coeff_X, Polynomial.coeff_one] at *
  · obtain ⟨n, rfl⟩ : ∃ n, v = n + 1 := ⟨v - 1, by omega⟩
    have hn0 : n ≠ 0 := by omega
    have hn1 : n + 1 ≠ 1 := by omega
    have hn2 : n + 1 ≠ 2 := by omega
    have hn3 : n + 1 ≠ 3 := by omega
    have hn4 : n + 1 ≠ 4 := by omega
    have hn5 : n + 1 ≠ 5 := by omega
    have hn6 : n + 1 ≠ 6 := by omega
    have hn7 : n + 1 ≠ 7 := by omega
    simp [Polynomial.coeff_add, Polynomial.coeff_X_pow,
      Polynomial.coeff_X, Polynomial.coeff_one, hn0, hn1, hn2, hn3, hn4, hn5, hn6, hn7]
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma e993LR_mul c97789464dadaad66c16e80e9577ca283936ef55fc6abb9d397bd519bac264bb
lemma e993LR_mul (a b h : Polynomial ℤ)
    (hab : e993LR a b) (hh : e993PolyTP2 h) :
    e993LR (a * h) (b * h) := by
  intro j k hjk
  exact e993_poly_mul_full_lr a b h hab hh j k hjk
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma e993G_tp2 70402307079bdae68934970130b0bfaaf203adbc9f773621d03828951895a5b0
lemma e993G_tp2 : e993PolyTP2 e993G := by
  intro u v x y huv hxy
  simpa only [e993CoeffZ_G] using e993KernelG_tp2 u v x y huv hxy
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma e993B_two_tp2 f8bf50956264b55bd3bd66cb1ce9259c80ed1511d4cf6d516e1a569c60421d4f
lemma e993B_two_tp2 : e993PolyTP2 (e993B 2) := by
  intro u v x y huv hxy
  simpa only [e993CoeffZ_B2] using e993KernelB2_tp2 u v x y huv hxy
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma e993B_three_tp2 2e7567ec00b31103fb730ef6d2ca20bb8cffb60558a5a66751846e88c1a7910d
lemma e993B_three_tp2 : e993PolyTP2 (e993B 3) := by
  intro u v x y huv hxy
  simpa only [e993CoeffZ_B3] using e993KernelB3_tp2 u v x y huv hxy
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma e993B_four_tp2 2e7ccf28b443d67f374b0bff50acebafbfc03f75ffc3a081ea324e68bfd3e041
lemma e993B_four_tp2 : e993PolyTP2 (e993B 4) := by
  intro u v x y huv hxy
  simpa only [e993CoeffZ_B4] using e993KernelB4_tp2 u v x y huv hxy
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma e993B_profile_tp2 c6a5d7aacdc6c7f15c805d20a8402fd842856546754c9b11f5e50bbb4980feba
lemma e993B_profile_tp2 {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (i : Fin m) :
    e993PolyTP2 (e993B (r i)) := by
  rcases hr i with h | h | h
  · simpa [h] using e993B_two_tp2
  · simpa [h] using e993B_three_tp2
  · simpa [h] using e993B_four_tp2
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma e993LR_mul_profile_product 2af35a00d18d826e0bf1784149714bcea39a21a4ab80610c6192f1bd4dc74a7d
lemma e993LR_mul_profile_product {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (s : Finset (Fin m)) (a b : Polynomial ℤ) (hab : e993LR a b) :
    e993LR (a * ∏ i ∈ s, e993B (r i))
      (b * ∏ i ∈ s, e993B (r i)) := by
  induction s using Finset.induction_on with
  | empty =>
      simpa using hab
  | @insert i s hi ih =>
      have h := e993LR_mul (a * ∏ j ∈ s, e993B (r j))
        (b * ∏ j ∈ s, e993B (r j))
        (e993B (r i)) ih (e993B_profile_tp2 r hr i)
      simpa [Finset.prod_insert hi, mul_assoc, mul_comm, mul_left_comm] using h
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma e993_local_root_lr baf39e605fba02f42c6e3bcf0daaf21a466a0e2231bab6c695c20cd1f2e05652
lemma e993_local_root_lr (r : ℕ) (hr : r = 2 ∨ r = 3 ∨ r = 4) :
    e993LR (e993G * e993F r) (e993B r) := by
  intro u v huv
  rcases hr with h | h | h
  · simpa [h] using e993_local_GF2_B2 u v huv
  · simpa [h] using e993_local_GF3_B3 u v huv
  · simpa [h] using e993_local_GF4_B4 u v huv
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma e993_local_same_lr c8f4df18754c9ff6026f961cb796997c79e5781b7d6285a5ef230c13a63aa18f
lemma e993_local_same_lr (r : ℕ) (hr : r = 2 ∨ r = 3 ∨ r = 4) :
    e993LR (e993F r) (e993D r) := by
  intro u v huv
  rcases hr with h | h | h
  · simpa [h] using e993_local_F2_D2 u v huv
  · simpa [h] using e993_local_F3_D3 u v huv
  · simpa [h] using e993_local_F4_D4 u v huv
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma e993_local_other_lr 9fb1038dd835f1ea2137943087038f4daa4114d053b672367d9a0c2ece35fbdf
lemma e993_local_other_lr (r s : ℕ)
    (hr : r = 2 ∨ r = 3 ∨ r = 4)
    (hs : s = 2 ∨ s = 3 ∨ s = 4) :
    e993LR (e993F r * e993B s) (e993B r * e993D s) := by
  intro u v huv
  rcases hr with hr2 | hr3 | hr4
  · rcases hs with hs2 | hs3 | hs4
    · simpa [hr2, hs2] using e993_local_F2B2_B2D2 u v huv
    · simpa [hr2, hs3] using e993_local_F2B3_B2D3 u v huv
    · simpa [hr2, hs4] using e993_local_F2B4_B2D4 u v huv
  · rcases hs with hs2 | hs3 | hs4
    · simpa [hr3, hs2] using e993_local_F3B2_B3D2 u v huv
    · simpa [hr3, hs3] using e993_local_F3B3_B3D3 u v huv
    · simpa [hr3, hs4] using e993_local_F3B4_B3D4 u v huv
  · rcases hs with hs2 | hs3 | hs4
    · simpa [hr4, hs2] using e993_local_F4B2_B4D2 u v huv
    · simpa [hr4, hs3] using e993_local_F4B3_B4D3 u v huv
    · simpa [hr4, hs4] using e993_local_F4B4_B4D4 u v huv
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma e993Down_mul 83a0c17d173f3878e2b9db519f12b219bc3c46edf01744d3f44d075277aebd83
lemma e993Down_mul (q r : ℕ) (A B : Polynomial ℤ) :
    e993Down (q + r) (A * B) =
      e993Down q A * B + A *
        (Polynomial.C (r : ℤ) * B - Polynomial.X * B.derivative) := by
  unfold e993Down
  rw [Polynomial.derivative_mul]
  push_cast
  rw [map_add]
  ring
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma e993Down_G 2dbb306027dee062d652748a9b199d6e0ebd1170ce4eeb008b177e18927bca62
lemma e993Down_G : e993Down 1 e993G = 1 := by
  norm_num [e993Down, e993G, Polynomial.derivative_add]
  ring
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma e993Down_finset_product e03240a7ff49a1fdb28e82117dbb368a8c03a67ef5e50d4341c0dfb93cd9d1a8
lemma e993Down_finset_product {m : ℕ} (r : Fin m → ℕ)
    (s : Finset (Fin m)) :
    e993Down ((∑ h ∈ s, r h) + 1)
      (e993G * ∏ h ∈ s, e993B (r h)) =
    (∏ h ∈ s, e993B (r h)) +
      e993G * ∑ h ∈ s,
        e993D (r h) * ∏ k ∈ s.erase h, e993B (r k) := by
  induction s using Finset.induction_on with
  | empty =>
      simpa using e993Down_G
  | @insert i s hi ih =>
      have hsum :
          (∑ h ∈ insert i s,
            e993D (r h) * ∏ k ∈ (insert i s).erase h, e993B (r k)) =
          e993D (r i) * (∏ k ∈ s, e993B (r k)) +
            e993B (r i) *
              (∑ h ∈ s, e993D (r h) *
                ∏ k ∈ s.erase h, e993B (r k)) := by
        rw [Finset.sum_insert hi, Finset.erase_insert hi]
        congr 1
        calc
          (∑ h ∈ s,
              e993D (r h) * ∏ k ∈ (insert i s).erase h, e993B (r k)) =
            ∑ h ∈ s,
              e993D (r h) *
                (e993B (r i) * ∏ k ∈ s.erase h, e993B (r k)) := by
                  apply Finset.sum_congr rfl
                  intro h hh
                  have hih : i ≠ h := by
                    intro heq
                    exact hi (heq ▸ hh)
                  rw [Finset.erase_insert_of_ne hih]
                  rw [Finset.prod_insert (by simp [hi])]
          _ = e993B (r i) *
                (∑ h ∈ s, e993D (r h) *
                  ∏ k ∈ s.erase h, e993B (r k)) := by
                  rw [Finset.mul_sum]
                  apply Finset.sum_congr rfl
                  intro h hh
                  ring
      have hq :
          (∑ h ∈ insert i s, r h) + 1 =
            ((∑ h ∈ s, r h) + 1) + r i := by
        rw [Finset.sum_insert hi]
        omega
      rw [hq, Finset.prod_insert hi, hsum]
      have hassoc :
          e993G * (e993B (r i) * ∏ h ∈ s, e993B (r h)) =
          (e993G * ∏ h ∈ s, e993B (r h)) * e993B (r i) := by ring
      rw [hassoc, e993Down_mul, ih]
      simp only [e993D]
      ring
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma e993_root_summand_lr 0879c74886594cd8aa24cc3a77664c3b8fcf6c0d552b300d36d15079f75dea99
lemma e993_root_summand_lr {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (i : Fin m) :
    e993LR (e993MainMark r i) (e993ProfileProduct r) := by
  have hi : i ∈ (Finset.univ : Finset (Fin m)) := Finset.mem_univ i
  have hfactor :
      e993ProfileProduct r =
        e993B (r i) * ∏ h ∈ (Finset.univ.erase i), e993B (r h) := by
    unfold e993ProfileProduct
    exact (Finset.mul_prod_erase Finset.univ (fun h => e993B (r h)) hi).symm
  have hlocal := e993_local_root_lr (r i) (hr i)
  have hprod := e993LR_mul_profile_product r hr (Finset.univ.erase i)
    (e993G * e993F (r i)) (e993B (r i)) hlocal
  rw [hfactor]
  simpa [e993MainMark, mul_assoc] using hprod
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma e993_same_summand_lr 8ea20dc0f6fb11001d46423e00b9252832d679e66dbb49169380a17682ba44dd
lemma e993_same_summand_lr {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (i : Fin m) :
    e993LR (e993MainMark r i)
      (e993G * e993D (r i) *
        ∏ h ∈ (Finset.univ.erase i), e993B (r h)) := by
  have hlocal := e993_local_same_lr (r i) (hr i)
  have hG := e993LR_mul (e993F (r i)) (e993D (r i)) e993G
    hlocal e993G_tp2
  have hprod := e993LR_mul_profile_product r hr (Finset.univ.erase i)
    (e993F (r i) * e993G) (e993D (r i) * e993G) hG
  simpa [e993MainMark, mul_assoc, mul_comm, mul_left_comm] using hprod
-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma e993_other_summand_lr 75ad88172a2eb5ed655866d2a29ec86f4ce4ebc06aead79cdbc624aaaee17bf9
lemma e993_other_summand_lr {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i l : Fin m) (hil : i ≠ l) :
    e993LR (e993MainMark r i)
      (e993G * e993D (r l) *
        ∏ h ∈ (Finset.univ.erase l), e993B (r h)) := by
  let rest : Finset (Fin m) := (Finset.univ.erase i).erase l
  have hli : l ∈ (Finset.univ.erase i : Finset (Fin m)) := by
    simp [hil.symm]
  have hil' : i ∈ (Finset.univ.erase l : Finset (Fin m)) := by
    simp [hil]
  have hpi :
      (∏ h ∈ (Finset.univ.erase i), e993B (r h)) =
        e993B (r l) * ∏ h ∈ rest, e993B (r h) := by
    exact (Finset.mul_prod_erase (Finset.univ.erase i)
      (fun h => e993B (r h)) hli).symm
  have hpl :
      (∏ h ∈ (Finset.univ.erase l), e993B (r h)) =
        e993B (r i) * ∏ h ∈ rest, e993B (r h) := by
    calc
      (∏ h ∈ (Finset.univ.erase l), e993B (r h)) =
          e993B (r i) *
            ∏ h ∈ (Finset.univ.erase l).erase i, e993B (r h) :=
        (Finset.mul_prod_erase (Finset.univ.erase l)
          (fun h => e993B (r h)) hil').symm
      _ = e993B (r i) * ∏ h ∈ rest, e993B (r h) := by
        have hrest : (Finset.univ.erase l).erase i = rest := by
          ext h
          simp only [rest, Finset.mem_erase, Finset.mem_univ, and_true]
          tauto
        rw [hrest]
  have hlocal := e993_local_other_lr (r i) (r l) (hr i) (hr l)
  have hG := e993LR_mul (e993F (r i) * e993B (r l))
    (e993B (r i) * e993D (r l)) e993G hlocal e993G_tp2
  have hprod := e993LR_mul_profile_product r hr rest
    ((e993F (r i) * e993B (r l)) * e993G)
    ((e993B (r i) * e993D (r l)) * e993G) hG
  unfold e993MainMark
  rw [hpi, hpl]
  simpa [mul_assoc, mul_comm, mul_left_comm] using hprod
-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma e993LR_add_right d299efc9b34461f067b710c413b1ae79908adfda007c8e5c886fe48c855e1f5a
lemma e993LR_add_right (a b c : Polynomial ℤ)
    (hab : e993LR a b) (hac : e993LR a c) :
    e993LR a (b + c) := by
  intro u v huv
  have hb := hab u v huv
  have hc := hac u v huv
  simp only [Polynomial.coeff_add]
  nlinarith
-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma e993LR_sum_right bc3a83cb66d0ef6eef536556c5380687dd1a36ebe0d023056a9de6cb15e216b9
lemma e993LR_sum_right {α : Type*} (s : Finset α)
    (a : Polynomial ℤ) (f : α → Polynomial ℤ)
    (hf : ∀ i ∈ s, e993LR a (f i)) :
    e993LR a (∑ i ∈ s, f i) := by
  classical
  induction s using Finset.induction_on with
  | empty =>
      intro u v huv
      simp
  | @insert i s hi ih =>
      rw [Finset.sum_insert hi]
      apply e993LR_add_right
      · exact hf i (Finset.mem_insert_self i s)
      · apply ih
        intro h hh
        exact hf h (Finset.mem_insert_of_mem hh)
-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma e993_mark_down_lr f2ef84557e9847a316a6cf9ef6c71a8dd2a384a6b65533c2af2598545a368ce8
lemma e993_mark_down_lr {m : ℕ} (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4) (i : Fin m) :
    e993LR (e993MainMark r i)
      (e993Down (e993ProfileDegree r) (e993RootOut r)) := by
  let f : Fin m → Polynomial ℤ := fun l =>
    e993G * e993D (r l) *
      ∏ h ∈ (Finset.univ.erase l), e993B (r h)
  have hH :
      e993Down (e993ProfileDegree r) (e993RootOut r) =
        e993ProfileProduct r + ∑ l : Fin m, f l := by
    have hbase := e993Down_finset_product r Finset.univ
    have hdist :
        e993G * (∑ l : Fin m,
          e993D (r l) *
            ∏ h ∈ (Finset.univ.erase l), e993B (r h)) =
        ∑ l : Fin m, f l := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro l hl
      dsimp [f]
      ring
    rw [hdist] at hbase
    simpa [e993ProfileDegree, e993RootOut, e993ProfileProduct] using hbase
  have hterms : e993LR (e993MainMark r i) (∑ l : Fin m, f l) := by
    apply e993LR_sum_right
    intro l hl
    by_cases hil : i = l
    · subst l
      simpa [f] using e993_same_summand_lr r hr i
    · simpa [f] using e993_other_summand_lr r hr i l hil
  rw [hH]
  exact e993LR_add_right _ _ _ (e993_root_summand_lr r hr i) hterms
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN theorem e993_main_mark_relative_margin 04025cc3584eb5ee37d248c6dd601e5172060ce4bdcf7fe82563c83588e7f8b1
theorem e993_main_mark_relative_margin (m : ℕ) (hm : 1 ≤ m)
    (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i : Fin m) (j : ℕ) (hj : j < e993ProfileDegree r) :
    ((e993ProfileDegree r : ℤ) - (j : ℤ) - 1) *
        (e993MainMark r i).coeff j * (e993RootOut r).coeff (j + 1) ≥
      ((e993ProfileDegree r : ℤ) - (j : ℤ)) *
        (e993MainMark r i).coeff (j + 1) * (e993RootOut r).coeff j := by
  have hminor := (e993_mark_down_lr r hr i) j (j + 1) (Nat.lt_succ_self j)
  have hid := e993_margin_eq_minor (e993ProfileDegree r) j
    (e993RootOut r) (e993MainMark r i)
  nlinarith
-- VERITYOS ENTRY 83 END

