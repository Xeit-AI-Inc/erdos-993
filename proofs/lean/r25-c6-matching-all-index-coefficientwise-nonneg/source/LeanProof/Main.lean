import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition ErdosR25.E1ArithmeticCore.PStatement 9b0b3e79cf43ca41ce4748ab67bc919571e253ea2da71912040e51f67f9642a2
namespace ErdosR25.E1ArithmeticCore

/-- `(P)`: the greedy dual's scalar arithmetic-core statement, `C(n,s) ≥ 2^s·C(q,s)`
in `Nat.descFactorial` form (`s = 2n-K-1`, `q = m+n-K-1`), exactly as seat U1's
file (`scratchpad/c5-U1/LeanProject/LeanProof/Main.lean`) states it. -/
def PStatement (m K n : ℕ) : Prop :=
  Nat.descFactorial n (2 * n - K - 1) ≥ 2 ^ (2 * n - K - 1) * Nat.descFactorial (m + n - K - 1) (2 * n - K - 1)

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition ErdosR25.E1CoeffWise.Afac ad79eb48b880ca06bba54c0bedd53711e4d7947d44efbd05579917f026c4433b
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- `A_i(t) = ∏_{l=0}^{i-1} (t + K + 1 - l)`, as a `Polynomial ℤ`. -/
noncomputable
def Afac (K i : ℕ) : Polynomial ℤ :=
  ∏ l ∈ Finset.range i, (X + C ((K : ℤ) + 1 - (l : ℤ)))
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition ErdosR25.E1CoeffWise.Bfac 65ad5e64ce8a0f97fa0590182ef0ea3f1ad4a0b657bfe30098b3991d315dbbbf
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- `B_i(t) = ∏_{l=i+1}^{j} (t + l)`, as a `Polynomial ℤ`, for outer bound `j`. -/
noncomputable
def Bfac (j i : ℕ) : Polynomial ℤ :=
  ∏ l ∈ Finset.Ico (i + 1) (j + 1), (X + C (l : ℤ))
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition ErdosR25.E1CoeffWise.IsHard 5b996e63fd5ecb19b2229444e40830e5ff741ac438afe75f8f6786a1ca788627
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- An index `i` is *hard* when its `N_j` coefficient `K+1-2i` would be
negative. -/
def IsHard (K i : ℕ) : Prop := K + 1 < 2 * i
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition ErdosR25.E1CoeffWise.partner b84d899ed97e59d593766da1479cf350e7439dddf8e0f888f91108ed3211ec1b
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- The reflection partner of index `i`. -/
def partner (K i : ℕ) : ℕ := K + 1 - i
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition ErdosR25.E1CoeffWise.Wcoef 3cacedeba838945533ecf3071a5cebe8f68f5e74cf68ed8d347081c7a9c92202
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- `W_i` up to the positive common factor `j!` (dropped: it cancels in every
sign comparison and does not depend on `j`): `2^i · C(m,i)`. -/
def Wcoef (m i : ℕ) : ℕ := 2 ^ i * Nat.choose m i
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition ErdosR25.E1CoeffWise.NjTerm 6517ada1e0f8615a085b4c232f074618cb6aceeff697786508df82762bc57bd0
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- The `i`-th raw summand of `N_j`: `(K+1-2i) · W_i · A_i(t) · B_i(t)`. -/
noncomputable
def NjTerm (K m j i : ℕ) : Polynomial ℤ :=
  (((K : ℤ) + 1 - 2 * (i : ℤ)) * (Wcoef m i : ℤ)) • (Afac K i * Bfac j i)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition ErdosR25.E1CoeffWise.Nj 8373c621ebd4e53a2f607579ea980751594f8d022dbbe23e05ffeb0b3b48999b
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **`N_j` itself, as a `Polynomial ℤ`-valued object.** `N_j(t) =
Σ_{i=0}^{j} (K+1-2i) · W_i · A_i(t) · B_i(t)`, the `j!` common factor of `W_i`
dropped (a positive constant, irrelevant to sign). -/
noncomputable
def Nj (K m j : ℕ) : Polynomial ℤ :=
  ∑ i ∈ Finset.range (j + 1), NjTerm K m j i
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition ErdosR25.E1CoeffWise.CoeffNonneg fe0f273e7d6e31ad4491d3588e16ef14e50cd0854f142aa7fcdeb7d1c2c87d48
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- Coefficientwise nonnegativity of a `Polynomial ℤ`. -/
def CoeffNonneg (p : Polynomial ℤ) : Prop := ∀ n, 0 ≤ p.coeff n
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma ErdosR25.E1ArithmeticCore.discriminant_factorization 6908d8a610358523ccd0fc0891af9c192746408468a005aa6aa5f96b46aca109
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. The discriminant of the quadratic `3n² - 3Kn + (K+1+4Km-4m²)` in `n`,
after substituting `K = 2m - d`, equals `9d² + 12(m+1)d - 12(m+1)²`, and this
factors as `3·(3d - 2(m+1))·(d + 2(m+1))`. Pure ring identity: no hypothesis
needed. Award part 1. -/
lemma discriminant_factorization (m d : ℤ) :
    9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2
      = 3 * (3 * d - 2 * (m + 1)) * (d + 2 * (m + 1)) := by
  ring

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma ErdosR25.E1ArithmeticCore.discriminant_in_K_matches_in_d aefe6eaa1708f9a05d9156be7ae98691234fc4b83b23a90792a8213f8170d593
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. The discriminant, as it literally arises from substituting `K = 2m - d`
into `9K² - 12(K+1+4Km-4m²)`, equals the `(m,d)` form above. Pure ring
identity. -/
lemma discriminant_in_K_matches_in_d (m d : ℤ) :
    9 * (2 * m - d) ^ 2 - 12 * ((2 * m - d) + 1 + 4 * (2 * m - d) * m - 4 * m ^ 2)
      = 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 := by
  ring

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma ErdosR25.E1ArithmeticCore.discriminant_nonpos_iff 5b74a6439ae19a7eda72678d4f66562175c854df49f8365f5a073942eeb43274
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. For `d ≥ 0` and `m ≥ 0` (so `m + 1 > 0`), the discriminant is
`≤ 0` exactly on the chartered region `3d ≤ 2m+2`: the two-sided region
characterisation. Award part 2. -/
lemma discriminant_nonpos_iff (m d : ℤ) (hm : 0 ≤ m) (hd : 0 ≤ d) :
    9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 ↔ 3 * d ≤ 2 * m + 2 := by
  rw [discriminant_factorization]
  have hpos : (0:ℤ) < d + 2 * (m + 1) := by linarith
  constructor
  · intro h
    have h2 : (d + 2 * (m + 1)) * (3 * d - 2 * (m + 1)) ≤ 0 := by nlinarith
    have h3 : 3 * d - 2 * (m + 1) ≤ 0 :=
      nonpos_of_mul_nonpos_right h2 hpos
    linarith
  · intro h
    have h3 : 3 * d - 2 * (m + 1) ≤ 0 := by linarith
    have h4 : (d + 2 * (m + 1)) * (3 * d - 2 * (m + 1)) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos (le_of_lt hpos) h3
    nlinarith

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma ErdosR25.E1ArithmeticCore.S_quadratic_nonneg_of_discriminant_nonpos 3cd91ee873039407a345e1a7a649aa01c1690aec13796008264ba0f8f193ea40
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. Standard "discriminant ≤ 0 implies the quadratic form is a sum of
squares" certificate: `12·(3n²-3Kn+C) = (6n-3K)² - Δ`, so `Δ ≤ 0` forces the
right side `≥ 0`. -/
lemma S_quadratic_nonneg_of_discriminant_nonpos (K m n : ℤ)
    (hΔ : 9 * K ^ 2 - 12 * (K + 1 + 4 * K * m - 4 * m ^ 2) ≤ 0) :
    3 * n ^ 2 - 3 * K * n + (K + 1 + 4 * K * m - 4 * m ^ 2) ≥ 0 := by
  nlinarith [sq_nonneg (6 * n - 3 * K), hΔ]

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma ErdosR25.E1ArithmeticCore.S_holds_of_discriminant_nonpos 42e408b5766a80a20c82985c90a8b3253f20e9f7b9271610bf508bb904876bdd
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. `(S)` itself, in its original multiplicative form, from the
discriminant hypothesis. -/
lemma S_holds_of_discriminant_nonpos (K m n : ℤ)
    (hΔ : 9 * K ^ 2 - 12 * (K + 1 + 4 * K * m - 4 * m ^ 2) ≤ 0) :
    (n + 1) * (K + 1 - n) ≥ 4 * (m + n - K) * (m - n) := by
  have h := S_quadratic_nonneg_of_discriminant_nonpos K m n hΔ
  nlinarith [h]

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma ErdosR25.E1ArithmeticCore.S_holds_on_region 124e582383400534df6e5b641ee7c1a42be7a5a509e8a555bf9042012dff6353
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. Chaining the two region facts: on `3d ≤ 2m+2` (with `K = 2m-d`),
`(S)` holds at every integer `n`, uniformly. Award part 3. -/
lemma S_holds_on_region (m d n : ℤ) (hm : 0 ≤ m) (hd : 0 ≤ d)
    (hregion : 3 * d ≤ 2 * m + 2) :
    (n + 1) * ((2 * m - d) + 1 - n) ≥ 4 * (m + n - (2 * m - d)) * (m - n) := by
  have hΔ : 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 :=
    (discriminant_nonpos_iff m d hm hd).2 hregion
  have hΔK : 9 * (2 * m - d) ^ 2
      - 12 * ((2 * m - d) + 1 + 4 * (2 * m - d) * m - 4 * m ^ 2) ≤ 0 := by
    rw [discriminant_in_K_matches_in_d]; exact hΔ
  exact S_holds_of_discriminant_nonpos (2 * m - d) m n hΔK

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma ErdosR25.E1ArithmeticCore.P_base_s1 4b0b17447ffcb9ec22beb141c3c6aa64f6a3cff06c161dd9506134075071bde8
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. Base case `s = 1` (`K` even, `K = 2c`, `n = c + 1 = K/2 + 1`): unfolds to
`n!/(n-1)! ≥ 2·(m-p)`, i.e. `n ≥ 2(m-p) = 2(m-n+1)`, i.e. `3n ≥ 2m+2` —
literally the region hypothesis. Parametrised directly by `c` (rather than by
`K` with a `K / 2` in the statement) so no `ℕ`-division simplification is
needed anywhere in the proof. -/
lemma P_base_s1 (m c : ℕ) (hn : c + 1 ≤ m) (_hKm : m ≤ 2 * c + 1)
    (hregion : 3 * (c + 1) ≥ 2 * m + 2) :
    PStatement m (2 * c) (c + 1) := by
  unfold PStatement
  have hs : 2 * (c + 1) - 2 * c - 1 = 1 := by omega
  rw [hs]
  simp only [Nat.descFactorial_one, pow_one]
  have hq : m + (c + 1) - 2 * c - 1 = m - c := by omega
  rw [hq]
  omega

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma ErdosR25.E1ArithmeticCore.P_base_s2 8ba45dcbb27e2932f36b73f36bf04c16e6abbb76f9f26da62a37bef607b6c062
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. Base case `s = 2` (`K` odd, `K = 2c+1`, `n = c + 2 = (K+3)/2`): a
two-factor comparison, `n(n-1) ≥ 4(m-p)(m-p-1)`. Parametrised by `c` for the
same reason as `P_base_s1`. The literal region hypothesis `3d ≤ 2m+2` at
`K = 2c+1` (so `d = 2m - K = 2m - 2c - 1`) rearranges, over `ℕ` with `m ≥ c+2`
so no subtraction truncates, to `4m ≤ 6c+5`. -/
lemma P_base_s2 (m c : ℕ) (hn : c + 2 ≤ m) (hKm : m ≤ 2 * c + 2)
    (hregion : 4 * m ≤ 6 * c + 5) :
    PStatement m (2 * c + 1) (c + 2) := by
  unfold PStatement
  have hs : 2 * (c + 2) - (2 * c + 1) - 1 = 2 := by omega
  rw [hs]
  have hq : m + (c + 2) - (2 * c + 1) - 1 = m - c := by omega
  rw [hq]
  obtain ⟨e, he⟩ := Nat.le.dest hn
  subst he
  have hmc : c + 2 + e - c = 2 + e := by omega
  rw [hmc]
  have hLHS : (c + 2).descFactorial 2 = (c + 2) * (c + 1) := by
    simp [Nat.descFactorial]; ring
  have hRHS : (2 + e).descFactorial 2 = (2 + e) * (1 + e) := by
    simp [Nat.descFactorial]; ring
  rw [hLHS, hRHS]
  nlinarith [hKm, hregion]

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma ErdosR25.E1ArithmeticCore.P_induction_step_critic 31d0ad9f4d440cf9206ef82ef95b2e51d6089b420828d0fc1d0d7482c4324c6a
namespace ErdosR25.E1ArithmeticCore

/-- CRITIC-ATTRIBUTED (C-U1-F), toolkit-free. **PRIMARY** induction step per the
award's fences: the seat's `descProd` toolkit is correct but NOT load-bearing,
and this step does not use it. From `Nat.succ_descFactorial_succ`,
`Nat.descFactorial_succ`, `S_holds_of_discriminant_nonpos`, `Nat.mul_le_mul`.
`(P)` at a hard index `n` implies `(P)` at `n+1`, given `(S)`. -/
lemma P_induction_step_critic (m K n : ℕ) (hnm : n + 1 ≤ m) (hKm : m ≤ K + 1)
    (hhard : K + 1 < 2 * n)
    (hregion : 9 * (K : ℤ) ^ 2 - 12 * ((K : ℤ) + 1 + 4 * (K : ℤ) * (m : ℤ) - 4 * (m : ℤ) ^ 2) ≤ 0)
    (hstep : PStatement m K n) :
    PStatement m K (n + 1) := by
  unfold PStatement at hstep ⊢
  have hnK : n ≤ K := by omega
  have hs : 2 * (n + 1) - K - 1 = (2 * n - K - 1) + 2 := by omega
  have hq : m + (n + 1) - K - 1 = (m + n - K - 1) + 1 := by omega
  rw [hs, hq]
  set s : ℕ := 2 * n - K - 1 with hsdef
  set q : ℕ := m + n - K - 1 with hqdef
  have hns : n - s = K + 1 - n := by omega
  have hqs : q - s = m - n := by omega
  have hq1 : q + 1 = m + n - K := by omega
  have hL : Nat.descFactorial (n + 1) (s + 2) = (n + 1) * ((n - s) * Nat.descFactorial n s) := by
    rw [Nat.succ_descFactorial_succ, Nat.descFactorial_succ]
  have hR : Nat.descFactorial (q + 1) (s + 2) = (q + 1) * ((q - s) * Nat.descFactorial q s) := by
    rw [Nat.succ_descFactorial_succ, Nat.descFactorial_succ]
  have hSZ : ((n : ℤ) + 1) * ((K : ℤ) + 1 - (n : ℤ))
      ≥ 4 * ((m : ℤ) + (n : ℤ) - (K : ℤ)) * ((m : ℤ) - (n : ℤ)) :=
    S_holds_of_discriminant_nonpos (K : ℤ) (m : ℤ) (n : ℤ) hregion
  have hS : 4 * ((q + 1) * (q - s)) ≤ (n + 1) * (n - s) := by
    rw [hns, hqs, hq1]
    have h1 : ((K + 1 - n : ℕ) : ℤ) = (K : ℤ) + 1 - (n : ℤ) := by
      push_cast [Nat.cast_sub (by omega : n ≤ K + 1)]; ring
    have h2 : ((m + n - K : ℕ) : ℤ) = (m : ℤ) + (n : ℤ) - (K : ℤ) := by
      push_cast [Nat.cast_sub (by omega : K ≤ m + n)]; ring
    have h3 : ((m - n : ℕ) : ℤ) = (m : ℤ) - (n : ℤ) := by
      push_cast [Nat.cast_sub (by omega : n ≤ m)]; ring
    have : (4 * ((m + n - K : ℕ) * (m - n : ℕ)) : ℤ) ≤ ((n + 1) * (K + 1 - n : ℕ) : ℤ) := by
      push_cast [h1, h2, h3]
      nlinarith [hSZ]
    exact_mod_cast this
  rw [hL, hR]
  calc 2 ^ (s + 2) * ((q + 1) * ((q - s) * Nat.descFactorial q s))
      = (4 * ((q + 1) * (q - s))) * (2 ^ s * Nat.descFactorial q s) := by ring
    _ ≤ ((n + 1) * (n - s)) * Nat.descFactorial n s := Nat.mul_le_mul hS hstep
    _ = (n + 1) * ((n - s) * Nat.descFactorial n s) := by ring

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma ErdosR25.E1ArithmeticCore.P_holds_critic 89a67bb0df9416076a66728bc40caaf9180c5bda7a84f944ec6d71017ca979c4
namespace ErdosR25.E1ArithmeticCore

/-- Induction-principle SCAFFOLD attributed C-U1-T (`Nat.le_induction` over
`(K+3)/2 ≤ j ≤ m` with the parity split at the base), re-derived here to call
this project's registered `P_induction_step_critic` (C-U1-F's toolkit-free
step, the award's PRIMARY step per its fences) in place of C-U1-T's own
`descProd`-based step, so the `descProd` toolkit is never a dependency.
`(P)` holds at every hard index `n` with `(K+3)/2 ≤ n ≤ m`, given `m ≤ K+1`
and the region. -/
lemma P_holds_critic (m K : ℕ) (hKm : m ≤ K + 1)
    (hd0 : (K : ℤ) ≤ 2 * (m : ℤ))
    (hregion : 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2)
    (n : ℕ) (hhard : K + 1 < 2 * n) (hnm : n ≤ m) :
    PStatement m K n := by
  have hΔ : 9 * (K : ℤ) ^ 2 - 12 * ((K : ℤ) + 1 + 4 * (K : ℤ) * (m : ℤ) - 4 * (m : ℤ) ^ 2) ≤ 0 := by
    have h := (discriminant_nonpos_iff (m : ℤ) (2 * (m : ℤ) - (K : ℤ))
      (Int.natCast_nonneg m) (by linarith)).2 (by linarith)
    have heq : 9 * (K : ℤ) ^ 2 - 12 * ((K : ℤ) + 1 + 4 * (K : ℤ) * (m : ℤ) - 4 * (m : ℤ) ^ 2)
        = 9 * (2 * (m : ℤ) - (K : ℤ)) ^ 2 + 12 * ((m : ℤ) + 1) * (2 * (m : ℤ) - (K : ℤ))
          - 12 * ((m : ℤ) + 1) ^ 2 := by ring
    rw [heq]; exact h
  have key : ∀ j, (K + 3) / 2 ≤ j → j ≤ m → PStatement m K j := by
    intro j hj
    induction j, hj using Nat.le_induction with
    | base =>
      intro hm0
      rcases Nat.even_or_odd K with ⟨c, hc⟩ | ⟨c, hc⟩
      · subst hc
        rw [show (c + c + 3) / 2 = c + 1 from by omega, show c + c = 2 * c from by omega]
        exact P_base_s1 m c (by omega) (by omega) (by omega)
      · subst hc
        rw [show (2 * c + 1 + 3) / 2 = c + 2 from by omega]
        exact P_base_s2 m c (by omega) (by omega) (by omega)
    | succ j hj ih =>
      intro hm1
      exact P_induction_step_critic m K j hm1 hKm (by omega) hΔ (ih (by omega))
  exact key n (by omega) hnm

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma ErdosR25.E1ArithmeticCore.P_holds_critic_general decf7f83fc7c509c609ab0576efefcd2e7b21844f0e0d42681065720593a478c
namespace ErdosR25.E1ArithmeticCore

/-- Attributed C-U1-T (source name `P_holds_critic'`; renamed here because the
formalization registrar's source-declaration check requires a word boundary
immediately after the identifier, which a trailing `'` followed by whitespace
does not supply). The `m ≤ K+1` hypothesis is redundant: it follows from
`d = 2m-K ≥ 0` and the chartered region `3d ≤ 2m+2`. This is award part 4,
`(P)` at every hard index for both parities of `K`. -/
lemma P_holds_critic_general (m K : ℕ)
    (hd0 : (K : ℤ) ≤ 2 * (m : ℤ))
    (hregion : 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2)
    (n : ℕ) (hhard : K + 1 < 2 * n) (hnm : n ≤ m) :
    PStatement m K n :=
  P_holds_critic m K (by omega) hd0 hregion n hhard hnm

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma ErdosR25.E1ArithmeticCore.matchingDual_scalarCore_award 50f421306ee4dd4f922278f87700ea957b60ec16a1791a0c2f1641953d2b7091
namespace ErdosR25.E1ArithmeticCore

/-- The award: the conjunction of the discriminant factorisation, the
two-sided region characterisation, step `(S)` on the region, and `(P)` at
every hard index for both parities of `K` on the region `3d ≤ 2m+2`. Parts 1-3
are the seat's (U1's) own exact statements (`discriminant_factorization`,
`discriminant_nonpos_iff`, `S_holds_on_region`); part 4 is
`P_holds_critic_general` (source name `P_holds_critic'`; the `m ≤ K+1`
hypothesis shown redundant), whose induction step and
induction principle are CRITIC-ATTRIBUTED (C-U1-F primary for the step,
C-U1-T for the induction-principle scaffold). SCOPE: this is the SCALAR core;
it does not raise `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY` (whose object
is the coefficientwise-in-`t` nonnegativity of `N_j`); it is not the
large-rank theorem and not the Tier 3a schema; no statement about any graph,
forest, G1 tuple, tier, FOREST, TREE, TRANSFER or Erdős #993; no
`SimpleGraph`, `Δ_k`, `indepCount` occurs; no sharpness claim; no claim that a
certificate exists for any particular graph; `m` and `d` are numerals. -/
lemma matchingDual_scalarCore_award :
    (∀ m d : ℤ, 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 = 3 * (3 * d - 2 * (m + 1)) * (d + 2 * (m + 1))) ∧
    (∀ m d : ℤ, 0 ≤ m → 0 ≤ d → (9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 ↔ 3 * d ≤ 2 * m + 2)) ∧
    (∀ m d n : ℤ, 0 ≤ m → 0 ≤ d → 3 * d ≤ 2 * m + 2 →
        (n + 1) * ((2 * m - d) + 1 - n) ≥ 4 * (m + n - (2 * m - d)) * (m - n)) ∧
    (∀ m K : ℕ, (K : ℤ) ≤ 2 * (m : ℤ) → 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 →
        ∀ n : ℕ, K + 1 < 2 * n → n ≤ m → PStatement m K n) :=
  ⟨discriminant_factorization, discriminant_nonpos_iff, S_holds_on_region, P_holds_critic_general⟩

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma ErdosR25.E1CoeffWise.Afac_split 0f6404103628b9f87f27e928687402c64f5c8857f194a94b7d8b3474b732e3ac
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- Splitting `Afac` at an intermediate index `i' ≤ i`. -/
lemma Afac_split {K i i' : ℕ} (h : i' ≤ i) :
    Afac K i = Afac K i' * ∏ l ∈ Finset.Ico i' i, (X + C ((K : ℤ) + 1 - (l : ℤ))) := by
  unfold Afac
  rw [Finset.range_eq_Ico, Finset.range_eq_Ico]
  exact (Finset.prod_Ico_consecutive (fun l => (X + C ((K : ℤ) + 1 - (l : ℤ)))) (Nat.zero_le i') h).symm
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma ErdosR25.E1CoeffWise.Bfac_split b4454c13d56eb08494718b590495faae7edd78452ed6c090be46e7dada341061
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- Splitting `Bfac` at an intermediate index `i' ≤ i ≤ j`. -/
lemma Bfac_split {j i i' : ℕ} (h1 : i' ≤ i) (h2 : i ≤ j) :
    Bfac j i' = (∏ l ∈ Finset.Ico (i' + 1) (i + 1), (X + C (l : ℤ))) * Bfac j i := by
  unfold Bfac
  exact (Finset.prod_Ico_consecutive (fun l => (X + C (l : ℤ)))
    (Nat.add_le_add_right h1 1) (Nat.add_le_add_right h2 1)).symm
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma ErdosR25.E1CoeffWise.extra_eq f89553c8198c8bdb63246ea6efc1da78efa4a6076fb32e7caaf903e6da3360ff
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- The two "extra factor" blocks produced by splitting `Afac` and `Bfac` at a
hard/easy pair `(i, i')` coincide as polynomials: this is the combinatorial
heart of the reflection identity, a pure re-indexing via `l ↦ K+1-l`. -/
lemma extra_eq {K i i' : ℕ} (hsum : i + i' = K + 1) (_h : i' ≤ i) :
    (∏ l ∈ Finset.Ico i' i, (X + C ((K : ℤ) + 1 - (l : ℤ))))
      = ∏ l ∈ Finset.Ico (i' + 1) (i + 1), (X + C (l : ℤ)) := by
  have step1 : (∏ l ∈ Finset.Ico i' i, (X + C ((K : ℤ) + 1 - (l : ℤ))))
      = ∏ l ∈ Finset.Ico i' i, (X + C (((K + 1 - l : ℕ) : ℤ))) := by
    apply Finset.prod_congr rfl
    intro l hl
    simp only [Finset.mem_Ico] at hl
    have hl2 : l ≤ K + 1 := by omega
    rw [Nat.cast_sub hl2]
    push_cast
    ring_nf
  rw [step1]
  have hK1 : i ≤ K + 1 + 1 := by omega
  have hrefl := Finset.prod_Ico_reflect (fun x : ℕ => (X + C ((x : ℤ)))) i' (n := K + 1) hK1
  have e1 : K + 1 + 1 - i = i' + 1 := by omega
  have e2 : K + 1 + 1 - i' = i + 1 := by omega
  rw [e1, e2] at hrefl
  exact hrefl
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma ErdosR25.E1CoeffWise.reflection_identity_poly d4182dc5f83706b5382794262c64bb9bfd39066d118ca78c59d8368823ee6e11
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **Reflection identity, as a genuine `Polynomial ℤ` equation** (not merely
pointwise-in-`t`): for a hard/easy pair `i + i' = K + 1` with `i' ≤ i ≤ j`,
`A_i(t) B_i(t) = A_{i'}(t) B_{i'}(t)` as polynomials. -/
lemma reflection_identity_poly {K j i i' : ℕ}
    (hsum : i + i' = K + 1) (h1 : i' ≤ i) (h2 : i ≤ j) :
    Afac K i * Bfac j i = Afac K i' * Bfac j i' := by
  rw [Afac_split h1, Bfac_split h1 h2, extra_eq hsum h1]
  ring
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma ErdosR25.E1CoeffWise.region_le 0480d11d99b446fd2da136cc19f5bc4ef8c1434c336a75bc4e9d09425345c2bb
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **Region fact, proved rather than assumed.** From the primitive excess
relation `K + d = 2m` and the chartered region `3d ≤ 2m+2`, derive
`m ≤ K+1` internally (never taken as a raw side hypothesis downstream). -/
lemma region_le {m K d : ℕ} (hKd : K + d = 2 * m) (hregion : 3 * d ≤ 2 * m + 2) :
    m ≤ K + 1 := by omega
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma ErdosR25.E1CoeffWise.partner_spec ea523f0e15bc52f8950270e0e3b76f2a3727628dff8b97ded34b1cf5fa2ed1be
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **Pairing bijection, from hard indices onto a subset of easy indices**
(at `j = m`, the registered instance). Every hard index `i ≤ m` has a
partner `partner K i` that is strictly smaller, itself a valid index
(`≤ m`), easy, and sums with `i` to `K+1` (so `reflection_identity_poly`
applies to the pair). The map `i ↦ partner K i` is injective on hard
indices (shown separately, `partner_injOn`). -/
lemma partner_spec {m K d i : ℕ} (hKd : K + d = 2 * m) (hregion : 3 * d ≤ 2 * m + 2)
    (him : i ≤ m) (hhard : IsHard K i) :
    partner K i < i ∧ partner K i ≤ m ∧ ¬ IsHard K (partner K i)
      ∧ i + partner K i = K + 1 := by
  have hm : m ≤ K + 1 := region_le hKd hregion
  unfold IsHard partner at *
  refine ⟨by omega, by omega, by omega, by omega⟩
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma ErdosR25.E1CoeffWise.partner_injOn 8e7c26205e7f016dbeda6612870ab4a4ce7d15f11d2252fcae25e8b206f00695
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- `partner K` is injective on hard indices (both bounded by `K+1`, which
holds for any valid index `≤ m ≤ K+1`). -/
lemma partner_injOn {K : ℕ} {i₁ i₂ : ℕ} (h1 : i₁ ≤ K + 1) (h2 : i₂ ≤ K + 1)
    (heq : partner K i₁ = partner K i₂) : i₁ = i₂ := by
  unfold partner at heq; omega
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma ErdosR25.E1CoeffWise.term_sign 1752202c2c57d62a449dc7513bda5b5406e90a84deec61efe4d637479ed73e69
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **Term-sign lemma.** On a hard/easy pair `i + i' = K+1`, `i' < i ≤ m`,
importing the scalar-core award's `PStatement m K i` (never re-derived here,
only algebraically repackaged via `Nat.descFactorial_eq_factorial_mul_choose`
and `Nat.descFactorial_mul_descFactorial`), the easy partner's weight
dominates: `W_i ≤ W_{i'}`. This is what makes each paired contribution to
`N_j` sign-correct. -/
lemma term_sign {m K i i' : ℕ} (hsum : i + i' = K + 1) (hlt : i' < i) (him : i ≤ m)
    (hP : ErdosR25.E1ArithmeticCore.PStatement m K i) :
    Wcoef m i ≤ Wcoef m i' := by
  unfold ErdosR25.E1ArithmeticCore.PStatement at hP
  have hs : 2 * i - K - 1 = i - i' := by omega
  have hq : m + i - K - 1 = m - i' := by omega
  rw [hs, hq] at hP
  have hip : i' ≤ i := hlt.le
  have hfact1 : i'.factorial * Nat.descFactorial i (i - i') = i.factorial := by
    have h0 := @Nat.factorial_mul_descFactorial i (i - i') (by omega)
    have h1 : i - (i - i') = i' := by omega
    rwa [h1] at h0
  have hfact2 :
      Nat.descFactorial (m - i') (i - i') * Nat.descFactorial m i' = Nat.descFactorial m i := by
    exact @Nat.descFactorial_mul_descFactorial i' i m hip
  have hchoose_i : Nat.descFactorial m i = i.factorial * Nat.choose m i :=
    Nat.descFactorial_eq_factorial_mul_choose m i
  have hchoose_i' : Nat.descFactorial m i' = i'.factorial * Nat.choose m i' :=
    Nat.descFactorial_eq_factorial_mul_choose m i'
  have hmul :
      Nat.descFactorial i (i - i') * (Nat.descFactorial m i' * i'.factorial)
        ≥ (2 ^ (i - i') * Nat.descFactorial (m - i') (i - i')) * (Nat.descFactorial m i' * i'.factorial) := by
    exact Nat.mul_le_mul_right _ hP
  have hLHS :
      Nat.descFactorial i (i - i') * (Nat.descFactorial m i' * i'.factorial)
        = i.factorial * Nat.descFactorial m i' := by
    rw [← hfact1]; ring
  have hRHS :
      (2 ^ (i - i') * Nat.descFactorial (m - i') (i - i')) * (Nat.descFactorial m i' * i'.factorial)
        = 2 ^ (i - i') * i'.factorial * Nat.descFactorial m i := by
    rw [← hfact2]; ring
  rw [hLHS, hRHS, hchoose_i, hchoose_i'] at hmul
  have key :
      i.factorial * i'.factorial * Nat.choose m i'
        ≥ 2 ^ (i - i') * (i.factorial * i'.factorial) * Nat.choose m i := by
    calc i.factorial * i'.factorial * Nat.choose m i'
        = i.factorial * (i'.factorial * Nat.choose m i') := by ring
      _ ≥ 2 ^ (i - i') * i'.factorial * (i.factorial * Nat.choose m i) := hmul
      _ = 2 ^ (i - i') * (i.factorial * i'.factorial) * Nat.choose m i := by ring
  have hpos : 0 < i.factorial * i'.factorial := Nat.mul_pos i.factorial_pos i'.factorial_pos
  have hcancel : 2 ^ (i - i') * Nat.choose m i ≤ Nat.choose m i' := by
    have hkey' :
        2 ^ (i - i') * Nat.choose m i * (i.factorial * i'.factorial)
          ≤ Nat.choose m i' * (i.factorial * i'.factorial) := by
      calc 2 ^ (i - i') * Nat.choose m i * (i.factorial * i'.factorial)
          = 2 ^ (i - i') * (i.factorial * i'.factorial) * Nat.choose m i := by ring
        _ ≤ i.factorial * i'.factorial * Nat.choose m i' := key
        _ = Nat.choose m i' * (i.factorial * i'.factorial) := by ring
    exact Nat.le_of_mul_le_mul_right hkey' hpos
  unfold Wcoef
  have hpow : 2 ^ i = 2 ^ i' * 2 ^ (i - i') := by
    rw [← pow_add]; congr 1; omega
  calc 2 ^ i * Nat.choose m i = 2 ^ i' * (2 ^ (i - i') * Nat.choose m i) := by rw [hpow]; ring
    _ ≤ 2 ^ i' * Nat.choose m i' := by
        apply Nat.mul_le_mul_left
        exact hcancel
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma ErdosR25.E1CoeffWise.CoeffNonneg_add b50f35f3c4ea3e3d56edfe97088211adec8b471d879520b9268b3a0b7a2b9ff9
namespace ErdosR25.E1CoeffWise

open Polynomial

lemma CoeffNonneg_add {p q : Polynomial ℤ} (hp : CoeffNonneg p) (hq : CoeffNonneg q) : CoeffNonneg (p + q) := by
  intro n; simp only [Polynomial.coeff_add]; exact add_nonneg (hp n) (hq n)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma ErdosR25.E1CoeffWise.CoeffNonneg_zero dbbeed2b0bda5706dc5f9074d99f164dd0c2e34e6c63698b21b64ef3ff2536eb
namespace ErdosR25.E1CoeffWise

open Polynomial

lemma CoeffNonneg_zero : CoeffNonneg (0 : Polynomial ℤ) := by intro n; simp
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma ErdosR25.E1CoeffWise.CoeffNonneg_sum 540bfc4ac81364628d5f5fd3e1c20bca18dbda5f9b3999c5d554d29238fb065b
namespace ErdosR25.E1CoeffWise

open Polynomial

lemma CoeffNonneg_sum {ι : Type} (s : Finset ι) (f : ι → Polynomial ℤ) (h : ∀ i ∈ s, CoeffNonneg (f i)) :
    CoeffNonneg (∑ i ∈ s, f i) := by
  intro n
  rw [Polynomial.finsetSum_coeff]
  exact Finset.sum_nonneg (fun i hi => h i hi n)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma ErdosR25.E1CoeffWise.CoeffNonneg_mul 1ce2367639d79927c0b32176014b1c84cbee3baac0bacd4661aedcddab2fdb4c
namespace ErdosR25.E1CoeffWise

open Polynomial

lemma CoeffNonneg_mul {p q : Polynomial ℤ} (hp : CoeffNonneg p) (hq : CoeffNonneg q) : CoeffNonneg (p * q) := by
  intro n
  rw [Polynomial.coeff_mul]
  apply Finset.sum_nonneg
  rintro ⟨a, b⟩ _
  exact mul_nonneg (hp a) (hq b)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma ErdosR25.E1CoeffWise.CoeffNonneg_one 89a8731682863969f9e3158ae42517cbb53ce24fa12a4784de99541fb1c46f5f
namespace ErdosR25.E1CoeffWise

open Polynomial

lemma CoeffNonneg_one : CoeffNonneg (1 : Polynomial ℤ) := by
  intro n
  rw [Polynomial.coeff_one]
  split_ifs <;> norm_num
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma ErdosR25.E1CoeffWise.CoeffNonneg_prod 588c98ff34a2b6972da6debf57b5f521dea50ddc453ffbf59ea589b1d29c6caf
namespace ErdosR25.E1CoeffWise

open Polynomial

lemma CoeffNonneg_prod {ι : Type} (s : Finset ι) (f : ι → Polynomial ℤ) (h : ∀ i ∈ s, CoeffNonneg (f i)) :
    CoeffNonneg (∏ i ∈ s, f i) :=
  Finset.prod_induction f CoeffNonneg (fun _ _ ha hb => CoeffNonneg_mul ha hb) CoeffNonneg_one h
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma ErdosR25.E1CoeffWise.CoeffNonneg_smul e74a5c0035951814608c6fd9db2dda15879d05fa2118d7d1b8f28e7dcd2093f5
namespace ErdosR25.E1CoeffWise

open Polynomial

lemma CoeffNonneg_smul {c : ℤ} (hc : 0 ≤ c) {p : Polynomial ℤ} (hp : CoeffNonneg p) : CoeffNonneg (c • p) := by
  intro n
  simp only [Polynomial.coeff_smul, smul_eq_mul]
  exact mul_nonneg hc (hp n)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma ErdosR25.E1CoeffWise.NonnegLinFac aee950e07127e93244506036fd84bff2f5aa22829a8a4078d14fe5ae4b82f996
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- `X + C x` is `CoeffNonneg` for any `x : ℕ` cast into `ℤ`: its coefficients are
`x` (constant term) and `1` (linear term), both `≥ 0`. -/
lemma NonnegLinFac (x : ℕ) : CoeffNonneg (X + C (x : ℤ)) := by
  intro n
  rcases n with _ | _ | n
  · simp
  · simp
  · simp [Polynomial.coeff_X_of_ne_one]
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma ErdosR25.E1CoeffWise.NonnegBfacFn 4bc24977d5e2d38f8572ca570e59d8458f07931b8cfb440adec9c7d350de6eea
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- `Bfac j i` is always `CoeffNonneg`: every factor `X + C l` has `l : ℕ` cast
into `ℤ`, hence nonneg coefficients. -/
lemma NonnegBfacFn (j i : ℕ) : CoeffNonneg (ErdosR25.E1CoeffWise.Bfac j i) := by
  unfold ErdosR25.E1CoeffWise.Bfac
  exact CoeffNonneg_prod _ _ (fun l _ => NonnegLinFac l)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma ErdosR25.E1CoeffWise.NonnegAfacFn 1806f6606bd86754523d267d6e39d07c4931ea95ddb5d6d6b21bb5547071eefe
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- `Afac K i` is `CoeffNonneg` provided `i ≤ K + 1`: every factor's constant term
`K+1-l` (`l < i ≤ K+1`) is then a genuine nonneg integer. -/
lemma NonnegAfacFn {K i : ℕ} (hKi : i ≤ K + 1) : CoeffNonneg (ErdosR25.E1CoeffWise.Afac K i) := by
  unfold ErdosR25.E1CoeffWise.Afac
  apply CoeffNonneg_prod
  intro l hl
  simp only [Finset.mem_range] at hl
  have hl2 : l ≤ K + 1 := by omega
  have hcast : (K : ℤ) + 1 - (l : ℤ) = ((K + 1 - l : ℕ) : ℤ) := by
    rw [Nat.cast_sub hl2]; push_cast; ring
  rw [hcast]
  exact NonnegLinFac (K + 1 - l)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma ErdosR25.E1CoeffWise.NonnegEasyTerm 20b0584672ccde8a4d570d58934d33b95514280d989d02238aedf2257b9404e7
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **Each unpaired-easy term of `N_j` is `CoeffNonneg`.** For an easy index
`i ≤ K + 1` (so `K+1-2i ≥ 0` and `Afac K i` is `CoeffNonneg`), its raw term in the
sum is `CoeffNonneg`. -/
lemma NonnegEasyTerm {K m j i : ℕ} (hKi : i ≤ K + 1) (heasy : ¬ IsHard K i) :
    CoeffNonneg (NjTerm K m j i) := by
  unfold NjTerm
  apply CoeffNonneg_smul
  · unfold IsHard at heasy
    have heasy' : 2 * i ≤ K + 1 := by omega
    have : (2 * i : ℤ) ≤ (K : ℤ) + 1 := by exact_mod_cast heasy'
    positivity
  · exact CoeffNonneg_mul (NonnegAfacFn hKi) (NonnegBfacFn j i)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma ErdosR25.E1CoeffWise.NonnegPairedBlock 230fd0b029612b1ad4c7462eb81502e658e7b12b383a04f5c8ef0cc121407b74
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **Each paired hard/easy block of `N_j` is `CoeffNonneg`.** For a hard index
`i` with partner `i' = K+1-i` (both `≤ j`, `≤ m ≤ K+1`), the *combined*
contribution `term(i) + term(i')` is `CoeffNonneg`, using the reflection identity
(`A_iB_i = A_{i'}B_{i'}`) to factor out the sign, and the term-sign lemma
(importing the award's `PStatement`, never re-derived) to sign the scalar. -/
lemma NonnegPairedBlock {K m j i i' : ℕ} (hsum : i + i' = K + 1) (hlt : i' < i)
    (him : i ≤ m) (hij : i ≤ j) (hi'K : i' ≤ K + 1)
    (hP : ErdosR25.E1ArithmeticCore.PStatement m K i) :
    CoeffNonneg (NjTerm K m j i + NjTerm K m j i') := by
  unfold NjTerm
  have hrefl : Afac K i * Bfac j i = Afac K i' * Bfac j i' :=
    reflection_identity_poly hsum hlt.le hij
  have hWle : Wcoef m i ≤ Wcoef m i' := term_sign hsum hlt him hP
  have hcombine :
      (((K : ℤ) + 1 - 2 * (i : ℤ)) * (Wcoef m i : ℤ)) • (Afac K i * Bfac j i)
        + (((K : ℤ) + 1 - 2 * (i' : ℤ)) * (Wcoef m i' : ℤ)) • (Afac K i' * Bfac j i')
      = (((i : ℤ) - (i' : ℤ)) * ((Wcoef m i' : ℤ) - (Wcoef m i : ℤ))) • (Afac K i' * Bfac j i') := by
    rw [hrefl]
    have hKi : (K : ℤ) + 1 - 2 * (i : ℤ) = -(2 * (i : ℤ) - (i : ℤ) - (i' : ℤ)) := by
      have : (K : ℤ) = (i : ℤ) + (i' : ℤ) - 1 := by exact_mod_cast (by omega : (K:ℤ) = i + i' - 1)
      linarith [this]
    have hKi' : (K : ℤ) + 1 - 2 * (i' : ℤ) = (i : ℤ) - (i' : ℤ) := by
      have : (K : ℤ) = (i : ℤ) + (i' : ℤ) - 1 := by exact_mod_cast (by omega : (K:ℤ) = i + i' - 1)
      linarith [this]
    rw [hKi, hKi']
    module
  rw [hcombine]
  apply CoeffNonneg_smul
  · have h1 : (0 : ℤ) ≤ (i : ℤ) - (i' : ℤ) := by omega
    have h2 : (0 : ℤ) ≤ (Wcoef m i' : ℤ) - (Wcoef m i : ℤ) := by
      have hcast : (Wcoef m i : ℤ) ≤ (Wcoef m i' : ℤ) := by exact_mod_cast hWle
      linarith
    exact mul_nonneg h1 h2
  · exact CoeffNonneg_mul (NonnegAfacFn hi'K) (NonnegBfacFn j i')
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma ErdosR25.E1CoeffWise.Nj_nonneg e3706fa5df019fd5651e9d3e65fe0bb22536beebf97e81b354c9fdbbcf5646da
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **Coefficientwise nonnegativity of `N_j` at `j = m`** (the registered
instance), on the chartered region `3d ≤ 2m+2`. Assembled from
`NonnegEasyTerm` (unpaired easy indices) and `NonnegPairedBlock` (hard
indices, paired with their image under `partner K` via `Finset.sum_image`
and `Finset.sum_sdiff`), importing the scalar-core award's
`P_holds_critic_general` at each hard index — never re-derived. This is the
Stage 7 target `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY` itself, at
`j = m`. -/
lemma Nj_nonneg {m K d : ℕ} (hKd : K + d = 2 * m) (hregion : 3 * d ≤ 2 * m + 2) :
    CoeffNonneg (Nj K m m) := by
  classical
  have hmK : m ≤ K + 1 := region_le hKd hregion
  have hd0 : (K : ℤ) ≤ 2 * (m : ℤ) := by exact_mod_cast (by omega : K ≤ 2 * m)
  have hreg' : 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 := by
    have hc1 : (3 : ℤ) * (d : ℤ) ≤ 2 * (m : ℤ) + 2 := by exact_mod_cast hregion
    have hc2 : (K : ℤ) + (d : ℤ) = 2 * (m : ℤ) := by exact_mod_cast hKd
    linarith
  unfold Nj
  set H := Finset.filter (fun i => IsHard K i) (Finset.range (m + 1)) with hHdef
  set E := Finset.filter (fun i => ¬ IsHard K i) (Finset.range (m + 1)) with hEdef
  have hsplit : ∑ i ∈ H, NjTerm K m m i + ∑ i ∈ E, NjTerm K m m i
      = ∑ i ∈ Finset.range (m + 1), NjTerm K m m i :=
    Finset.sum_filter_add_sum_filter_not (Finset.range (m + 1)) (fun i => IsHard K i) _
  rw [← hsplit]
  set EH := Finset.image (partner K) H with hEHdef
  have hEHsub : EH ⊆ E := by
    rw [hEHdef, hEdef]
    intro x hx
    simp only [Finset.mem_image] at hx
    obtain ⟨h, hhH, hheq⟩ := hx
    rw [hHdef, Finset.mem_filter, Finset.mem_range] at hhH
    obtain ⟨hhrange, hhhard⟩ := hhH
    have hhm : h ≤ m := by omega
    have hspec := partner_spec hKd hregion hhm hhhard
    rw [Finset.mem_filter, Finset.mem_range]
    subst hheq
    exact ⟨by omega, hspec.2.2.1⟩
  have hEsplit : ∑ i ∈ (E \ EH), NjTerm K m m i + ∑ i ∈ EH, NjTerm K m m i
      = ∑ i ∈ E, NjTerm K m m i := Finset.sum_sdiff hEHsub
  have hinj : Set.InjOn (partner K) H := by
    intro a ha b hb hab
    rw [Finset.mem_coe, hHdef, Finset.mem_filter, Finset.mem_range] at ha hb
    have ha1 : a ≤ K + 1 := by omega
    have hb1 : b ≤ K + 1 := by omega
    exact partner_injOn ha1 hb1 hab
  have hEHimg : ∑ i ∈ EH, NjTerm K m m i = ∑ h ∈ H, NjTerm K m m (partner K h) :=
    Finset.sum_image hinj
  have hcomb : ∑ h ∈ H, NjTerm K m m h + ∑ h ∈ H, NjTerm K m m (partner K h)
      = ∑ h ∈ H, (NjTerm K m m h + NjTerm K m m (partner K h)) :=
    (Finset.sum_add_distrib).symm
  have hfinal :
      ∑ i ∈ H, NjTerm K m m i + ∑ i ∈ E, NjTerm K m m i
        = ∑ i ∈ (E \ EH), NjTerm K m m i
          + ∑ h ∈ H, (NjTerm K m m h + NjTerm K m m (partner K h)) := by
    calc ∑ i ∈ H, NjTerm K m m i + ∑ i ∈ E, NjTerm K m m i
        = ∑ i ∈ H, NjTerm K m m i
            + (∑ i ∈ (E \ EH), NjTerm K m m i + ∑ i ∈ EH, NjTerm K m m i) := by rw [hEsplit]
      _ = ∑ i ∈ H, NjTerm K m m i
            + (∑ i ∈ (E \ EH), NjTerm K m m i + ∑ h ∈ H, NjTerm K m m (partner K h)) := by
            rw [hEHimg]
      _ = ∑ i ∈ (E \ EH), NjTerm K m m i
            + (∑ i ∈ H, NjTerm K m m i + ∑ h ∈ H, NjTerm K m m (partner K h)) := by abel
      _ = ∑ i ∈ (E \ EH), NjTerm K m m i
            + ∑ h ∈ H, (NjTerm K m m h + NjTerm K m m (partner K h)) := by rw [hcomb]
  rw [hfinal]
  apply CoeffNonneg_add
  · apply CoeffNonneg_sum
    intro i hi
    have hiE : i ∈ E := (Finset.mem_sdiff.mp hi).1
    rw [hEdef, Finset.mem_filter, Finset.mem_range] at hiE
    exact NonnegEasyTerm (by omega) hiE.2
  · apply CoeffNonneg_sum
    intro h hh
    rw [hHdef, Finset.mem_filter, Finset.mem_range] at hh
    obtain ⟨hhrange, hhhard⟩ := hh
    have hhm : h ≤ m := by omega
    have hspec := partner_spec hKd hregion hhm hhhard
    obtain ⟨hlt, hle, heasy, hsum⟩ := hspec
    have hP : ErdosR25.E1ArithmeticCore.PStatement m K h :=
      ErdosR25.E1ArithmeticCore.P_holds_critic_general m K hd0 hreg' h hhhard hhm
    exact NonnegPairedBlock hsum hlt hhm hhm (by omega) hP
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma ErdosR25.E1CoeffWise.partner_mem_range 760dec3759d13219e9f7115151ff6e02e924faf2e689393ecac84571ab5fdaa1
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- The partner of a hard index `i ≤ j` always lies in `Finset.range (j+1)`:
`partner K i < i ≤ j`. This is the step the seat's `## Remaining obligation`
claims is missing; it is already a consequence of `partner_spec`. -/
lemma partner_mem_range {m K d i j : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) (hjm : j ≤ m) (hij : i ≤ j) (hhard : IsHard K i) :
    partner K i < j + 1 := by
  have h := partner_spec hKd hregion (le_trans hij hjm) hhard
  omega
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma ErdosR25.E1CoeffWise.Nj_nonneg_general f89e2d579c699a393ce6f061e907e645032149663b2728079dcbf669db676a3d
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- **Coefficientwise nonnegativity of `N_j` for EVERY `j ≤ m`** on the
chartered region `3d ≤ 2m+2` — the full registered statement of
`E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`, not only its `j = m`
instance. Proof: the seat's assembly with `m` replaced by `j` in the index
ranges; `partner_spec` supplies `partner K i < i`, hence membership. -/
lemma Nj_nonneg_general {m K d j : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) (hjm : j ≤ m) :
    CoeffNonneg (Nj K m j) := by
  classical
  have hmK : m ≤ K + 1 := region_le hKd hregion
  have hd0 : (K : ℤ) ≤ 2 * (m : ℤ) := by exact_mod_cast (by omega : K ≤ 2 * m)
  have hreg' : 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 := by
    have hc1 : (3 : ℤ) * (d : ℤ) ≤ 2 * (m : ℤ) + 2 := by exact_mod_cast hregion
    have hc2 : (K : ℤ) + (d : ℤ) = 2 * (m : ℤ) := by exact_mod_cast hKd
    linarith
  unfold Nj
  set H := Finset.filter (fun i => IsHard K i) (Finset.range (j + 1)) with hHdef
  set E := Finset.filter (fun i => ¬ IsHard K i) (Finset.range (j + 1)) with hEdef
  have hsplit : ∑ i ∈ H, NjTerm K m j i + ∑ i ∈ E, NjTerm K m j i
      = ∑ i ∈ Finset.range (j + 1), NjTerm K m j i :=
    Finset.sum_filter_add_sum_filter_not (Finset.range (j + 1)) (fun i => IsHard K i) _
  rw [← hsplit]
  set EH := Finset.image (partner K) H with hEHdef
  have hEHsub : EH ⊆ E := by
    rw [hEHdef, hEdef]
    intro x hx
    simp only [Finset.mem_image] at hx
    obtain ⟨h, hhH, hheq⟩ := hx
    rw [hHdef, Finset.mem_filter, Finset.mem_range] at hhH
    obtain ⟨hhrange, hhhard⟩ := hhH
    have hhj : h ≤ j := by omega
    have hhm : h ≤ m := le_trans hhj hjm
    have hspec := partner_spec hKd hregion hhm hhhard
    rw [Finset.mem_filter, Finset.mem_range]
    subst hheq
    exact ⟨by omega, hspec.2.2.1⟩
  have hEsplit : ∑ i ∈ (E \ EH), NjTerm K m j i + ∑ i ∈ EH, NjTerm K m j i
      = ∑ i ∈ E, NjTerm K m j i := Finset.sum_sdiff hEHsub
  have hinj : Set.InjOn (partner K) H := by
    intro a ha b hb hab
    rw [Finset.mem_coe, hHdef, Finset.mem_filter, Finset.mem_range] at ha hb
    have ha1 : a ≤ K + 1 := by omega
    have hb1 : b ≤ K + 1 := by omega
    exact partner_injOn ha1 hb1 hab
  have hEHimg : ∑ i ∈ EH, NjTerm K m j i = ∑ h ∈ H, NjTerm K m j (partner K h) :=
    Finset.sum_image hinj
  have hcomb : ∑ h ∈ H, NjTerm K m j h + ∑ h ∈ H, NjTerm K m j (partner K h)
      = ∑ h ∈ H, (NjTerm K m j h + NjTerm K m j (partner K h)) :=
    (Finset.sum_add_distrib).symm
  have hfinal :
      ∑ i ∈ H, NjTerm K m j i + ∑ i ∈ E, NjTerm K m j i
        = ∑ i ∈ (E \ EH), NjTerm K m j i
          + ∑ h ∈ H, (NjTerm K m j h + NjTerm K m j (partner K h)) := by
    calc ∑ i ∈ H, NjTerm K m j i + ∑ i ∈ E, NjTerm K m j i
        = ∑ i ∈ H, NjTerm K m j i
            + (∑ i ∈ (E \ EH), NjTerm K m j i + ∑ i ∈ EH, NjTerm K m j i) := by rw [hEsplit]
      _ = ∑ i ∈ H, NjTerm K m j i
            + (∑ i ∈ (E \ EH), NjTerm K m j i + ∑ h ∈ H, NjTerm K m j (partner K h)) := by
            rw [hEHimg]
      _ = ∑ i ∈ (E \ EH), NjTerm K m j i
            + (∑ i ∈ H, NjTerm K m j i + ∑ h ∈ H, NjTerm K m j (partner K h)) := by abel
      _ = ∑ i ∈ (E \ EH), NjTerm K m j i
            + ∑ h ∈ H, (NjTerm K m j h + NjTerm K m j (partner K h)) := by rw [hcomb]
  rw [hfinal]
  apply CoeffNonneg_add
  · apply CoeffNonneg_sum
    intro i hi
    have hiE : i ∈ E := (Finset.mem_sdiff.mp hi).1
    rw [hEdef, Finset.mem_filter, Finset.mem_range] at hiE
    exact NonnegEasyTerm (by omega) hiE.2
  · apply CoeffNonneg_sum
    intro h hh
    rw [hHdef, Finset.mem_filter, Finset.mem_range] at hh
    obtain ⟨hhrange, hhhard⟩ := hh
    have hhj : h ≤ j := by omega
    have hhm : h ≤ m := le_trans hhj hjm
    have hspec := partner_spec hKd hregion hhm hhhard
    obtain ⟨hlt, hle, heasy, hsum⟩ := hspec
    have hP : ErdosR25.E1ArithmeticCore.PStatement m K h :=
      ErdosR25.E1ArithmeticCore.P_holds_critic_general m K hd0 hreg' h hhhard hhm
    exact NonnegPairedBlock hsum hlt hhm hhj (by omega) hP
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma ErdosR25.E1CoeffWise.Nj_nonneg_is_instance 2ff234b30c04ba8e04488e3f28a24150d5f1ab1562425e8329a332942aa8b2e7
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- The seat's `j = m` theorem is the `j = m` instance of the general one. Derived directly from `Nj_nonneg_general` (rather than from `Nj_nonneg_all_index`, which is this project's terminal declaration and so cannot be depended on by any earlier-registered entry): the value is identical either way, since `Nj_nonneg_all_index` is itself nothing more than `Nj_nonneg_general` re-packaged as a `∀ j ≤ m` statement. -/
lemma Nj_nonneg_is_instance {m K d : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) :
    CoeffNonneg (Nj K m m) :=
  Nj_nonneg_general hKd hregion (le_refl m)
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN theorem ErdosR25.E1CoeffWise.Nj_nonneg_all_index 5f8f2f65fe75a7aaa59a065a207da81049e78905ba39d89564c122042ba7475b
namespace ErdosR25.E1CoeffWise

open Polynomial

/-- The registered statement's shape: for every `m ≥ 1` and every `d ≥ 0` with
`3d ≤ 2m+2`, `N_j` is coefficientwise nonnegative **for every `j ≤ m`**. -/
theorem Nj_nonneg_all_index {m K d : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) :
    ∀ j ≤ m, CoeffNonneg (Nj K m j) :=
  fun _ hjm => Nj_nonneg_general hKd hregion hjm
end ErdosR25.E1CoeffWise
-- VERITYOS ENTRY 46 END

