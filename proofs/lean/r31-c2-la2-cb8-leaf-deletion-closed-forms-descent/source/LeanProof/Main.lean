import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition E993Transport.polyCoeffZ 046f659b7d033efef4613b69f6f6192013a62df02806d99ad4013ef00d9a5f9f
namespace E993Transport

open Polynomial

/-- Integer-indexed coefficient sequence of an integer polynomial: `polyCoeffZ p i` is the
coefficient of `X ^ i` for `0 ≤ i` and `0` for `i < 0`. Auxiliary (r31 C1-LA3, formalizer). -/
def polyCoeffZ (p : ℤ[X]) (i : ℤ) : ℤ :=
  if i < 0 then 0 else p.coeff i.toNat

end E993Transport
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN lemma E993Transport.descent_of_recurrence_logconcave 7be63ac8eb845bce953cef4e1c3f1b473c9eb06bea85ba3eb52ca2ad4d95d679
namespace E993Transport

open Polynomial

/-- The closing step (C-U3-T, Lemma A closing step; re-authored from C-U3-T's Critic.lean
DRAFT scratch, never carried): three consecutive terms with `r0, r1 > 0`, the recurrence (R) at
`k`, one-point log-concavity and `3a + 4b + 2 ≤ 6k` force `r2 < r1`. -/
lemma descent_of_recurrence_logconcave (a b k r0 r1 r2 : ℤ)
    (hk : 0 ≤ k) (h0 : 0 < r0) (h1 : 0 < r1) (hB : k ≤ a + b + 1)
    (hrec : (k + 1) * r2 = (a + 2 * b - 3 * k) * r1 + 2 * (a + b - k + 1) * r0)
    (hlc : r0 * r2 ≤ r1 * r1) (hgap : 3 * a + 4 * b + 2 ≤ 6 * k) : r2 < r1 := by
  by_contra hcon
  rw [not_lt] at hcon
  have hr01 : r0 ≤ r1 := by
    have : r0 * r1 ≤ r1 * r1 := le_trans (mul_le_mul_of_nonneg_left hcon h0.le) hlc
    exact le_of_mul_le_mul_right this h1
  have hc : 0 ≤ a + b - k + 1 := by linarith
  have step : (k + 1) * r1 ≤ (3 * a + 4 * b - 5 * k + 2) * r1 := by
    have e1 : (k + 1) * r1 ≤ (k + 1) * r2 := mul_le_mul_of_nonneg_left hcon (by linarith)
    have e2 : 2 * (a + b - k + 1) * r0 ≤ 2 * (a + b - k + 1) * r1 :=
      mul_le_mul_of_nonneg_left hr01 (by linarith)
    nlinarith
  have := le_of_mul_le_mul_right step h1
  linarith

end E993Transport
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN lemma E993Transport.twoBinom_derivative_identity 63ad7e5309d3418f643650fc656162f808ef36f1c0a0191950a5151d88753b71
namespace E993Transport

open Polynomial

/-- The derivative identity
`(1+X)(1+2X) · P' = (a(1+2X) + 2b(1+X)) · P` for `P = (1+X)^a (1+2X)^b`, written with
`(1+X)(1+2X) = 1 + 3X + 2X^2`. -/
lemma twoBinom_derivative_identity (a b : ℕ) :
    (1 + 3 * X + 2 * X ^ 2) * derivative ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) =
      (C ((a : ℤ) + 2 * b) + C (2 * (a : ℤ) + 2 * b) * X) * ((1 + X) ^ a * (1 + 2 * X) ^ b) := by
  rcases a with _ | a <;> rcases b with _ | b
  · simp
  · simp only [derivative_mul, derivative_pow_succ]
    simp
    ring
  · simp only [derivative_mul, derivative_pow_succ]
    simp
    ring
  · simp only [derivative_mul, derivative_pow_succ]
    simp
    ring

end E993Transport
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma E993Transport.twoBinomCoeff_recurrence d60b214129419ccdf8cd12a466c639c1f83da6cce1f52f3b1d61366905f7b891
namespace E993Transport

open Polynomial

/-- (R): the three-term coefficient recurrence of `(1+X)^a (1+2X)^b` at `k = n + 1`:
`(k+1) r(k+1) = (a + 2b - 3k) r(k) + 2(a + b - k + 1) r(k-1)`. -/
lemma twoBinomCoeff_recurrence (a b n : ℕ) :
    ((n : ℤ) + 2) * ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 2) =
      ((a : ℤ) + 2 * b - 3 * (n + 1)) * ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 1) +
        2 * ((a : ℤ) + b - n) * ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff n := by
  set P : ℤ[X] := (1 + X) ^ a * (1 + 2 * X) ^ b with hP
  have h := congrArg (fun q : ℤ[X] => q.coeff (n + 1)) (twoBinom_derivative_identity a b)
  rw [← hP] at h
  have hL : ((1 + 3 * X + 2 * X ^ 2) * derivative P).coeff (n + 1) =
      P.coeff (n + 2) * ((n : ℤ) + 2) + 3 * (P.coeff (n + 1) * ((n : ℤ) + 1)) +
        2 * (P.coeff n * (n : ℤ)) := by
    have e : (1 + 3 * X + 2 * X ^ 2) * derivative P =
        derivative P + C 3 * (X * derivative P) + C 2 * (X ^ 2 * derivative P) := by
      simp only [map_ofNat]; ring
    rw [e, coeff_add, coeff_add, coeff_C_mul, coeff_C_mul, coeff_X_mul, coeff_derivative,
      coeff_derivative]
    rcases n with _ | n
    · simp [coeff_X_pow_mul']
    · rw [show n + 1 + 1 = n + 2 from rfl, coeff_X_pow_mul, coeff_derivative]
      push_cast; ring
  have hR : ((C ((a : ℤ) + 2 * b) + C (2 * (a : ℤ) + 2 * b) * X) * P).coeff (n + 1) =
      ((a : ℤ) + 2 * b) * P.coeff (n + 1) + (2 * (a : ℤ) + 2 * b) * P.coeff n := by
    rw [add_mul, coeff_add, coeff_C_mul, mul_assoc, coeff_C_mul, coeff_X_mul]
  rw [hL, hR] at h
  linear_combination h

end E993Transport
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma E993Transport.polyCoeffZ_natCast 4c3bf9dcf2a367fb88d5a49b18837f0e18768a66d4d5774b7e5a28979ac1c940
namespace E993Transport

open Polynomial

/-- `polyCoeffZ` agrees with `Polynomial.coeff` at natural indices. -/
lemma polyCoeffZ_natCast (p : ℤ[X]) (n : ℕ) : polyCoeffZ p (n : ℤ) = p.coeff n := by
  simp [polyCoeffZ]

end E993Transport
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma E993Transport.polyCoeffZ_of_neg 3cd1bd212783c3eb57c95fb443c9ea94cfa4ae19f40c37e9d1e83520fe737c08
namespace E993Transport

open Polynomial

/-- `polyCoeffZ` vanishes at negative indices. -/
lemma polyCoeffZ_of_neg (p : ℤ[X]) (i : ℤ) (hi : i < 0) : polyCoeffZ p i = 0 := by
  simp [polyCoeffZ, hi]

end E993Transport
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma E993Transport.polyCoeffZ_one 124ae5c48f85f9b8ae1fe5842db3164f7c6feb80ac516db56dce2bd533cbd456
namespace E993Transport

open Polynomial

/-- The integer-indexed coefficients of `1`. -/
lemma polyCoeffZ_one (i : ℤ) : polyCoeffZ (1 : ℤ[X]) i = if i = 0 then 1 else 0 := by
  unfold polyCoeffZ
  by_cases hi : i < 0
  · simp [hi]; omega
  · obtain ⟨n, rfl⟩ := Int.eq_ofNat_of_zero_le (not_lt.mp hi)
    rcases n with _ | n
    · simp
    · simp [coeff_one]
      omega

end E993Transport
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma E993Transport.polyCoeffZ_linear_mul 3459fc88eb9ce095b0f01978ec725389ed51de6ad1fd7d21fac1d2f7c5d703ed
namespace E993Transport

open Polynomial

/-- Multiplying by a linear factor `1 + cX`: `s(i) = r(i) + c · r(i-1)` at every integer index. -/
lemma polyCoeffZ_linear_mul (p : ℤ[X]) (c i : ℤ) :
    polyCoeffZ ((1 + C c * X) * p) i = polyCoeffZ p i + c * polyCoeffZ p (i - 1) := by
  by_cases hi : i < 0
  · rw [polyCoeffZ_of_neg _ _ hi, polyCoeffZ_of_neg _ _ hi, polyCoeffZ_of_neg _ _ (by omega)]
    ring
  · obtain ⟨n, rfl⟩ := Int.eq_ofNat_of_zero_le (not_lt.mp hi)
    have e : (1 + C c * X) * p = p + C c * (X * p) := by ring
    rcases n with _ | n
    · rw [polyCoeffZ_natCast, polyCoeffZ_natCast, polyCoeffZ_of_neg _ _ (by omega), e,
        coeff_add, coeff_C_mul]
      simp
    · rw [polyCoeffZ_natCast, polyCoeffZ_natCast,
        show ((n + 1 : ℕ) : ℤ) - 1 = (n : ℤ) by push_cast; ring, polyCoeffZ_natCast, e,
        coeff_add, coeff_C_mul, coeff_X_mul]

end E993Transport
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma E993Transport.strongLC_linear_step d787f5498d99542c3aa877607acadf4da9083888cfad1282baad7d96ef6bcceb
namespace E993Transport

open Polynomial

/-- Factor step of log-concavity (no Newton, no Darroch): the two-by-two minor inequality
`f(i-1) f(j+1) ≤ f(i) f(j)` for all `i ≤ j` is preserved by `f ↦ f + c · f(· - 1)` with `0 ≤ c`. -/
lemma strongLC_linear_step (f : ℤ → ℤ) (c : ℤ) (hc : 0 ≤ c)
    (hf : ∀ i j : ℤ, i ≤ j → f (i - 1) * f (j + 1) ≤ f i * f j) :
    ∀ i j : ℤ, i ≤ j →
      (f (i - 1) + c * f (i - 1 - 1)) * (f (j + 1) + c * f (j + 1 - 1)) ≤
        (f i + c * f (i - 1)) * (f j + c * f (j - 1)) := by
  intro i j hij
  have hA := hf i j hij
  have hC := hf (i - 1) (j - 1) (by linarith)
  rw [sub_add_cancel] at hC
  have hM : f (i - 1 - 1) * f (j + 1) ≤ f i * f (j - 1) := by
    rcases lt_or_eq_of_le hij with hlt | heq
    · have h1 := hf i (j - 1) (by linarith)
      rw [sub_add_cancel] at h1
      have h2 := hf (i - 1) j (by linarith)
      linarith
    · subst heq
      have h2 := hf (i - 1) i (by linarith)
      linarith
  rw [add_sub_cancel_right]
  have hM' := mul_le_mul_of_nonneg_left hM hc
  have hC' := mul_le_mul_of_nonneg_left hC (mul_nonneg hc hc)
  nlinarith

end E993Transport
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma E993Transport.twoBinom_succ_left a661a5422e938a23adf197c83ce03c17d6e749a9313c245a5031a6d5a1a5876c
namespace E993Transport

open Polynomial

/-- Peeling one factor `1 + X`. -/
lemma twoBinom_succ_left (a b : ℕ) :
    ((1 + X) ^ (a + 1) * (1 + 2 * X) ^ b : ℤ[X]) =
      (1 + C 1 * X) * ((1 + X) ^ a * (1 + 2 * X) ^ b) := by
  simp only [map_one]; ring

end E993Transport
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma E993Transport.twoBinom_succ_right 2759f45c072c96b98ad9a6be9e94af7e61dd6c2ca2e31d7a55fe3d7235370be0
namespace E993Transport

open Polynomial

/-- Peeling one factor `1 + 2X`. -/
lemma twoBinom_succ_right (a b : ℕ) :
    ((1 + X) ^ a * (1 + 2 * X) ^ (b + 1) : ℤ[X]) =
      (1 + C 2 * X) * ((1 + X) ^ a * (1 + 2 * X) ^ b) := by
  simp only [map_ofNat]; ring

end E993Transport
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma E993Transport.polyCoeffZ_linear_mul_nonneg_pos 9b25fa4db728eee090ffbdf7182be9c750e8bf8d07f2a0f8d5d75e865900c12b
namespace E993Transport

open Polynomial

/-- Factor step of positivity: nonnegativity everywhere and positivity on `[0, N]` pass to
`(1 + cX) · p` with positivity on `[0, N + 1]`, for `0 < c`. -/
lemma polyCoeffZ_linear_mul_nonneg_pos (p : ℤ[X]) (c : ℤ) (hc : 0 < c) (N : ℕ)
    (hnn : ∀ i : ℤ, 0 ≤ polyCoeffZ p i)
    (hpos : ∀ i : ℤ, 0 ≤ i → i ≤ N → 0 < polyCoeffZ p i) :
    (∀ i : ℤ, 0 ≤ polyCoeffZ ((1 + C c * X) * p) i) ∧
      (∀ i : ℤ, 0 ≤ i → i ≤ (N + 1 : ℕ) → 0 < polyCoeffZ ((1 + C c * X) * p) i) := by
  refine ⟨fun i => ?_, fun i hi0 hiN => ?_⟩
  · rw [polyCoeffZ_linear_mul]
    have := hnn i
    have := mul_nonneg hc.le (hnn (i - 1))
    linarith
  · rw [polyCoeffZ_linear_mul]
    have h1 := hnn i
    have h2 := mul_nonneg hc.le (hnn (i - 1))
    push_cast at hiN
    by_cases hle : i ≤ N
    · have := hpos i hi0 hle
      linarith
    · have := hpos (i - 1) (by omega) (by omega)
      have := mul_pos hc this
      linarith

end E993Transport
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma E993Transport.twoBinomCoeffZ_nonneg_pos 8db51d28180bafedd83eb8bca3225379c85c478498b64681f87a0671c7de8a58
namespace E993Transport

open Polynomial

/-- Nonnegativity of all coefficients and positivity on `[0, a + b]`, by factor induction. -/
lemma twoBinomCoeffZ_nonneg_pos (a b : ℕ) :
    (∀ i : ℤ, 0 ≤ polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) i) ∧
      (∀ i : ℤ, 0 ≤ i → i ≤ (a + b : ℕ) →
        0 < polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) i) := by
  induction a with
  | zero =>
    induction b with
    | zero =>
      refine ⟨fun i => ?_, fun i hi0 hiN => ?_⟩
      · rw [pow_zero, pow_zero, mul_one, polyCoeffZ_one]; split_ifs <;> norm_num
      · rw [pow_zero, pow_zero, mul_one, polyCoeffZ_one]
        push_cast at hiN
        rw [if_pos (by omega)]; norm_num
    | succ b ih =>
      rw [twoBinom_succ_right]
      have := polyCoeffZ_linear_mul_nonneg_pos _ 2 (by norm_num) (0 + b) ih.1 ih.2
      simpa [Nat.add_assoc] using this
  | succ a ih =>
    rw [twoBinom_succ_left]
    have := polyCoeffZ_linear_mul_nonneg_pos _ 1 (by norm_num) (a + b) ih.1 ih.2
    refine ⟨this.1, fun i hi0 hiN => this.2 i hi0 ?_⟩
    push_cast at hiN ⊢; linarith

end E993Transport
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma E993Transport.twoBinomCoeff_pos 768f4ab5ed5dd35057de158c05a06727d928906d103861fe4dcd70a6e039a9ac
namespace E993Transport

open Polynomial

/-- Positivity of the coefficients of `(1+X)^a (1+2X)^b` on `[0, a + b]`. -/
lemma twoBinomCoeff_pos (a b k : ℕ) (hk : k ≤ a + b) :
    0 < ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff k := by
  have := (twoBinomCoeffZ_nonneg_pos a b).2 (k : ℤ) (by positivity) (by exact_mod_cast hk)
  rwa [polyCoeffZ_natCast] at this

end E993Transport
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma E993Transport.twoBinomCoeffZ_strongLC 61e8794fec4ff00b103505614f6cce53efdcf341ae98866fdc89686abaf57dc0
namespace E993Transport

open Polynomial

/-- The two-by-two minor inequality for the coefficients of `(1+X)^a (1+2X)^b`, by induction on
linear factors. -/
lemma twoBinomCoeffZ_strongLC (a b : ℕ) :
    ∀ i j : ℤ, i ≤ j →
      polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) (i - 1) *
          polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) (j + 1) ≤
        polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) i *
          polyCoeffZ ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]) j := by
  induction a with
  | zero =>
    induction b with
    | zero =>
      intro i j hij
      simp only [pow_zero, mul_one, polyCoeffZ_one]
      split_ifs <;> (try norm_num) <;> omega
    | succ b ih =>
      intro i j hij
      rw [twoBinom_succ_right]
      simp only [polyCoeffZ_linear_mul]
      exact strongLC_linear_step _ 2 (by norm_num) ih i j hij
  | succ a ih =>
    intro i j hij
    rw [twoBinom_succ_left]
    simp only [polyCoeffZ_linear_mul]
    exact strongLC_linear_step _ 1 (by norm_num) ih i j hij

end E993Transport
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma E993Transport.twoBinomCoeff_logConcave 77460852bfb43435d294720f9480f9713283eb6aa46af6491b6c0d8e25255b02
namespace E993Transport

open Polynomial

/-- Log-concavity of the coefficients of `(1+X)^a (1+2X)^b` (LC by factor induction). -/
lemma twoBinomCoeff_logConcave (a b n : ℕ) :
    ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff n *
        ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 2) ≤
      ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 1) *
        ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (n + 1) := by
  have h := twoBinomCoeffZ_strongLC a b ((n + 1 : ℕ) : ℤ) ((n + 1 : ℕ) : ℤ) le_rfl
  rw [show ((n + 1 : ℕ) : ℤ) - 1 = (n : ℤ) by push_cast; ring,
    show ((n + 1 : ℕ) : ℤ) + 1 = ((n + 2 : ℕ) : ℤ) by push_cast; ring] at h
  simpa only [polyCoeffZ_natCast] using h

end E993Transport
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma E993Transport.twoBinom_coeff_strictAnti_of_gap b39cd78768d02c83194f21b48717af69a8354afb36719755c5979769c3d6589c
namespace E993Transport

open Polynomial

/-- (G), the companion tool (no certificate of its own; no family or tree claim): for
`1 ≤ t ≤ a + b` and `3a + 4b + 2 ≤ 6t`, the coefficient at `t + 1` is below the one at `t`. -/
lemma twoBinom_coeff_strictAnti_of_gap (a b t : ℕ) (ht : 1 ≤ t) (hta : t ≤ a + b)
    (hgap : 3 * a + 4 * b + 2 ≤ 6 * t) :
    ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (t + 1) <
      ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff t := by
  obtain ⟨n, rfl⟩ : ∃ n, t = n + 1 := ⟨t - 1, by omega⟩
  have hrec := twoBinomCoeff_recurrence a b n
  have hlc := twoBinomCoeff_logConcave a b n
  have h0 := twoBinomCoeff_pos a b n (by omega)
  have h1 := twoBinomCoeff_pos a b (n + 1) hta
  exact descent_of_recurrence_logconcave (a : ℤ) (b : ℤ) ((n : ℤ) + 1) _ _ _
    (by positivity) h0 h1 (by omega)
    (by linear_combination hrec) hlc (by omega)

end E993Transport
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma E993Transport.cb8_armLeaf_blockExpansion 396116c7558302c70c6a49e9fd7f09907319b89a0dd4d714c53ac211fe6f0b01
namespace E993Transport

open Polynomial

/-- Arm-leaf block expansion (r31 C2-LA2; re-authored under attribution from C-F2-U's `CritFav.lean`
DRAFT and C-T1-U's `Crit.lean` DRAFT, never carried): by the binomial theorem,
`(1+X)·G^m = Σ_j C(m,j) · X^j (1+X)^{8j+1} (1+2X)^{8(m−j)}` with `G = (1+2X)^8 + X(1+X)^8`. -/
lemma cb8_armLeaf_blockExpansion (m : ℕ) :
    ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m : ℤ[X]) =
      ∑ j ∈ Finset.range (m + 1),
        C (m.choose j : ℤ) * (X ^ j * ((1 + X) ^ (8 * j + 1) * (1 + 2 * X) ^ (8 * (m - j)))) := by
  rw [add_comm ((1 + 2 * X : ℤ[X]) ^ 8) (X * (1 + X) ^ 8),
    add_pow (X * (1 + X) ^ 8 : ℤ[X]) ((1 + 2 * X) ^ 8), Finset.mul_sum]
  refine Finset.sum_congr rfl ?_
  intro j _
  rw [mul_pow, ← pow_mul, ← pow_mul, pow_succ, C_eq_natCast]
  ring

end E993Transport
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma E993Transport.cb8_armLeaf_block_descent 8518b8869cb73ee1279d756164a732982f7cce5056afcf4cdf380d9199c22866
namespace E993Transport

open Polynomial

/-- (G) on the arm block `V_j` (r31 C2-LA2; from C-F2-U's `armLeaf_block` DRAFT): for `j ≤ m`,
`m ≡ 2 (mod 3)`, the block `(1+X)^{8j+1}(1+2X)^{8(m−j)}` strictly descends from `p* − j` to
`p* − j + 1`, `p* = (16m+4)/3` (margin `2j+3` in `3a+4b+2 ≤ 6t`). -/
lemma cb8_armLeaf_block_descent (m j : ℕ) (hmod : m % 3 = 2) (hj : j ≤ m) :
    ((1 + X) ^ (8 * j + 1) * (1 + 2 * X) ^ (8 * (m - j)) : ℤ[X]).coeff ((16 * m + 4) / 3 - j + 1) <
      ((1 + X) ^ (8 * j + 1) * (1 + 2 * X) ^ (8 * (m - j)) : ℤ[X]).coeff ((16 * m + 4) / 3 - j) :=
  twoBinom_coeff_strictAnti_of_gap _ _ _ (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma E993Transport.cb8_armLeaf_remainder_descent bac7c7df427a94b5088f0ccd8558978e252ceafb5e7cc35e9996ad0569c474a9
namespace E993Transport

open Polynomial

/-- (G) on the arm remainder `R = X(1+2X)^{8m}` (r31 C2-LA2; from C-F2-U's DRAFT): strict descent
from `p*` to `p* + 1` (margin 0). -/
lemma cb8_armLeaf_remainder_descent (m : ℕ) (hmod : m % 3 = 2) :
    (X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      (X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3) := by
  obtain ⟨q, hq⟩ : ∃ q, (16 * m + 4) / 3 = q + 1 := ⟨(16 * m + 4) / 3 - 1, by omega⟩
  rw [hq, coeff_X_mul, coeff_X_mul]
  have h := twoBinom_coeff_strictAnti_of_gap 0 (8 * m) q (by omega) (by omega) (by omega)
  simpa using h

end E993Transport
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma E993Transport.cb8_armLeaf_closedForm_descent_topRank 62647c33b400eb53bce67a0befcff3454f3bdec57e83c118ae5b29e171faad52
namespace E993Transport

open Polynomial

/-- Arm leaf `v` at the closed-form level (r31 C2-LA2; re-authored from C-F2-U's
`armLeaf_favorable_topRank` DRAFT, rebuilt by the F adjudicator; C-T1-F and C-T1-U arm-leaf Lean;
T1 seat proof): the closed form `(1+X)G^m + X(1+2X)^{8m}` of `I(CB(8,m) − v)` strictly descends
from `p*` to `p* + 1`. Blocks: weights `C(m,j) > 0`, (G) on every `V_j`, (G) on `R`. -/
lemma cb8_armLeaf_closedForm_descent_topRank (m : ℕ) (hmod : m % 3 = 2) :
    ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff
        ((16 * m + 4) / 3 + 1) <
      ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff
        ((16 * m + 4) / 3) := by
  rw [coeff_add, coeff_add]
  apply add_lt_add
  · rw [cb8_armLeaf_blockExpansion, finsetSum_coeff, finsetSum_coeff]
    apply Finset.sum_lt_sum_of_nonempty ⟨0, by simp⟩
    intro j hj
    have hjm : j ≤ m := Nat.lt_succ_iff.mp (Finset.mem_range.mp hj)
    rw [coeff_C_mul, coeff_C_mul, coeff_X_pow_mul', coeff_X_pow_mul', if_pos (by omega),
      if_pos (by omega)]
    have hpos : (0 : ℤ) < m.choose j := by exact_mod_cast Nat.choose_pos hjm
    apply mul_lt_mul_of_pos_left _ hpos
    rw [show (16 * m + 4) / 3 + 1 - j = (16 * m + 4) / 3 - j + 1 by omega]
    exact cb8_armLeaf_block_descent m j hmod hjm
  · exact cb8_armLeaf_remainder_descent m hmod

end E993Transport
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma E993Transport.cb8_privateLeaf_blockExpansion 16c3e8cc2e47edd8826fe0cef0a166f9d8ed55c2b6c5d82db4b6bec14065aa23
namespace E993Transport

open Polynomial

/-- Private-leaf block expansion (r31 C2-LA2; re-authored from C-F2-U's `privateLeaf_favorable_topRank`
DRAFT): with `G_c = (1+2X)^7(1+X) + X(1+X)^7`,
`(1+2X)·G_c·G^n = Σ_k C(n,k) · (E0_k + E1_k)`, where
`E0_k = X^k (1+X)^{8k+1} (1+2X)^{8(n−k)+8}` and `E1_k = X^{k+1} (1+X)^{8k+7} (1+2X)^{8(n−k)+1}`. -/
lemma cb8_privateLeaf_blockExpansion (n : ℕ) :
    ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
        ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ n : ℤ[X]) =
      ∑ k ∈ Finset.range (n + 1),
        (C (n.choose k : ℤ) * (X ^ k * ((1 + X) ^ (8 * k + 1) * (1 + 2 * X) ^ (8 * (n - k) + 8))) +
          C (n.choose k : ℤ) *
            (X ^ (k + 1) * ((1 + X) ^ (8 * k + 7) * (1 + 2 * X) ^ (8 * (n - k) + 1)))) := by
  rw [add_comm ((1 + 2 * X : ℤ[X]) ^ 8) (X * (1 + X) ^ 8),
    add_pow (X * (1 + X) ^ 8 : ℤ[X]) ((1 + 2 * X) ^ 8), Finset.mul_sum]
  refine Finset.sum_congr rfl ?_
  intro k _
  rw [mul_pow, ← pow_mul, ← pow_mul, C_eq_natCast]
  ring

end E993Transport
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma E993Transport.cb8_privateLeaf_regroup ef36203e02c94102fef6e961fe39b92a42e0c133dc20f6e81dd9e3ddb700e022
namespace E993Transport

open Polynomial

/-- The regrouping (r31 C2-LA2; from C-F2-U's DRAFT, `1+3X+X² = (1+X)² + X`): the `k = 0` block `E0_0`
plus the tail `X(1+X)^2(1+2X)^{8n+7}` equals `(1+X)^3(1+2X)^{8n+7} + X·(1+X)(1+2X)^{8n+7}`. -/
lemma cb8_privateLeaf_regroup (n : ℕ) :
    ((1 + X) * (1 + 2 * X) ^ (8 * n + 8) + X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * n + 7) : ℤ[X]) =
      (1 + X) ^ 3 * (1 + 2 * X) ^ (8 * n + 7) + X * ((1 + X) ^ 1 * (1 + 2 * X) ^ (8 * n + 7)) := by
  ring

end E993Transport
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma E993Transport.cb8_privateLeaf_E0_block_descent 90c5bd6f04058f9149d6f11a147b2e8e1626f850cfcdc3497fd5ea8ab394906d
namespace E993Transport

open Polynomial

/-- (G) on the private block `E0_k` (r31 C2-LA2; from C-F2-U's DRAFT): with `m = n + 1 ≡ 2 (mod 3)`
and `k ≤ n`, `(1+X)^{8k+1}(1+2X)^{8(n−k)+8}` strictly descends from `p* − k` to `p* − k + 1`
(margin `2k+3`; applied for `k ≥ 1`). -/
lemma cb8_privateLeaf_E0_block_descent (n k : ℕ) (hmod : (n + 1) % 3 = 2) (hk : k ≤ n) :
    ((1 + X) ^ (8 * k + 1) * (1 + 2 * X) ^ (8 * (n - k) + 8) : ℤ[X]).coeff
        ((16 * (n + 1) + 4) / 3 - k + 1) <
      ((1 + X) ^ (8 * k + 1) * (1 + 2 * X) ^ (8 * (n - k) + 8) : ℤ[X]).coeff
        ((16 * (n + 1) + 4) / 3 - k) :=
  twoBinom_coeff_strictAnti_of_gap _ _ _ (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma E993Transport.cb8_privateLeaf_E1_block_descent 2cbf6fa6bc1ee3894a1e847347fc675ff8fbf6ee0e00a769e0425671dd11a3b6
namespace E993Transport

open Polynomial

/-- (G) on the private block `E1_k` (r31 C2-LA2; from C-F2-U's DRAFT): with `m = n + 1 ≡ 2 (mod 3)`
and `k ≤ n`, `(1+X)^{8k+7}(1+2X)^{8(n−k)+1}` strictly descends from `p* − (k+1)` to
`p* − (k+1) + 1` (margin `2k+7`). -/
lemma cb8_privateLeaf_E1_block_descent (n k : ℕ) (hmod : (n + 1) % 3 = 2) (hk : k ≤ n) :
    ((1 + X) ^ (8 * k + 7) * (1 + 2 * X) ^ (8 * (n - k) + 1) : ℤ[X]).coeff
        ((16 * (n + 1) + 4) / 3 - (k + 1) + 1) <
      ((1 + X) ^ (8 * k + 7) * (1 + 2 * X) ^ (8 * (n - k) + 1) : ℤ[X]).coeff
        ((16 * (n + 1) + 4) / 3 - (k + 1)) :=
  twoBinom_coeff_strictAnti_of_gap _ _ _ (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma E993Transport.cb8_privateLeaf_regrouped_descent 7703d38ca821385cae600e2016607165517de6ab00c9a5d28a2fd1586f049dd7
namespace E993Transport

open Polynomial

/-- (G) on the two regrouped `Π` blocks (r31 C2-LA2; from C-F2-U's DRAFT): with `m = n + 1 ≡ 2 (mod 3)`,
`(1+X)^3(1+2X)^{8n+7} + X·(1+X)(1+2X)^{8n+7}` strictly descends from `p*` to `p* + 1`
(each block has `6t − (3a+4b) = 3`). -/
lemma cb8_privateLeaf_regrouped_descent (n : ℕ) (hmod : (n + 1) % 3 = 2) :
    ((1 + X) ^ 3 * (1 + 2 * X) ^ (8 * n + 7) + X * ((1 + X) ^ 1 * (1 + 2 * X) ^ (8 * n + 7)) :
        ℤ[X]).coeff ((16 * (n + 1) + 4) / 3 + 1) <
      ((1 + X) ^ 3 * (1 + 2 * X) ^ (8 * n + 7) + X * ((1 + X) ^ 1 * (1 + 2 * X) ^ (8 * n + 7)) :
        ℤ[X]).coeff ((16 * (n + 1) + 4) / 3) := by
  rw [coeff_add, coeff_add]
  apply add_lt_add
  · exact twoBinom_coeff_strictAnti_of_gap 3 (8 * n + 7) _ (by omega) (by omega) (by omega)
  · obtain ⟨q, hq⟩ : ∃ q, (16 * (n + 1) + 4) / 3 = q + 1 :=
      ⟨(16 * (n + 1) + 4) / 3 - 1, by omega⟩
    rw [hq, coeff_X_mul, coeff_X_mul]
    exact twoBinom_coeff_strictAnti_of_gap 1 (8 * n + 7) q (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma E993Transport.cb8_privateLeaf_closedForm_descent_topRank 39b8d37276ea43e8d35a2fd508ac3a331efbcbae59e7369cd5fce08defb2808a
namespace E993Transport

open Polynomial

/-- Private leaf `c` at the closed-form level (r31 C2-LA2; re-authored from C-F2-U's
`privateLeaf_favorable_topRank` DRAFT, rebuilt by the F adjudicator; independent informal routes
C-F2-T, C-T2-F, C-T2-U): the closed form `(1+2X)G_c G^{m−1} + X(1+X)^2(1+2X)^{8m−1}` of
`I(CB(8,m) − c)` strictly descends from `p*` to `p* + 1`. Blocks: weights `C(m−1,k) ≥ 0`, (G) on
`E0_k` (`k ≥ 1`) and `E1_k` (`k ≥ 0`), and the regrouped pair `E0_0 + tail`. -/
lemma cb8_privateLeaf_closedForm_descent_topRank (m : ℕ) (hmod : m % 3 = 2) :
    ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
          ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) *
          ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3) := by
  obtain ⟨n, rfl⟩ : ∃ n, m = n + 1 := ⟨m - 1, by omega⟩
  rw [show n + 1 - 1 = n by omega, show 8 * (n + 1) - 1 = 8 * n + 7 by omega]
  set S := (16 * (n + 1) + 4) / 3 with hS
  rw [cb8_privateLeaf_blockExpansion, Finset.sum_add_distrib, Finset.sum_range_succ']
  set E0 : ℕ → ℤ[X] := fun k =>
    C (n.choose k : ℤ) * (X ^ k * ((1 + X) ^ (8 * k + 1) * (1 + 2 * X) ^ (8 * (n - k) + 8))) with hE0
  set E1 : ℕ → ℤ[X] := fun k =>
    C (n.choose k : ℤ) *
      (X ^ (k + 1) * ((1 + X) ^ (8 * k + 7) * (1 + 2 * X) ^ (8 * (n - k) + 1))) with hE1
  set tl : ℤ[X] := X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * n + 7) with htl
  have regroup : E0 0 + tl =
      (1 + X) ^ 3 * (1 + 2 * X) ^ (8 * n + 7) + X * ((1 + X) ^ 1 * (1 + 2 * X) ^ (8 * n + 7)) := by
    rw [← cb8_privateLeaf_regroup n]
    simp only [hE0, htl, Nat.choose_zero_right, Nat.cast_one, map_one, one_mul, pow_zero,
      Nat.sub_zero, mul_zero, zero_add, pow_one]
  have hE0_le : ∀ i ∈ Finset.range n, (E0 (i + 1)).coeff (S + 1) ≤ (E0 (i + 1)).coeff S := by
    intro i hi
    have hin : i < n := Finset.mem_range.mp hi
    simp only [hE0]
    rw [coeff_C_mul, coeff_C_mul, coeff_X_pow_mul', coeff_X_pow_mul', if_pos (by omega),
      if_pos (by omega)]
    have hpos : (0 : ℤ) ≤ n.choose (i + 1) := by positivity
    apply mul_le_mul_of_nonneg_left _ hpos
    rw [show S + 1 - (i + 1) = S - (i + 1) + 1 by omega]
    exact le_of_lt (cb8_privateLeaf_E0_block_descent n (i + 1) hmod hin)
  have hE1_le : ∀ k ∈ Finset.range (n + 1), (E1 k).coeff (S + 1) ≤ (E1 k).coeff S := by
    intro k hk
    have hkn : k ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hk)
    simp only [hE1]
    rw [coeff_C_mul, coeff_C_mul, coeff_X_pow_mul', coeff_X_pow_mul', if_pos (by omega),
      if_pos (by omega)]
    have hpos : (0 : ℤ) ≤ n.choose k := by positivity
    apply mul_le_mul_of_nonneg_left _ hpos
    rw [show S + 1 - (k + 1) = S - (k + 1) + 1 by omega]
    exact le_of_lt (cb8_privateLeaf_E1_block_descent n k hmod hkn)
  have s0 := Finset.sum_le_sum hE0_le
  have s1 := Finset.sum_le_sum hE1_le
  have hreg : (E0 0).coeff (S + 1) + tl.coeff (S + 1) < (E0 0).coeff S + tl.coeff S := by
    rw [← coeff_add, ← coeff_add, regroup]
    exact cb8_privateLeaf_regrouped_descent n hmod
  simp only [coeff_add, finsetSum_coeff] at s0 s1 ⊢
  linarith

end E993Transport
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN theorem E993Transport.cb8_leafDeletion_closedForms_descent_topRank 93acf3cc7326a0de9b538f3c76ef1425fca0e7789d5d3dc84a2dbfd5de658fc9
namespace E993Transport

open Polynomial

/-- r31 C2-LA2 terminal (frozen by the Cycle 2 synthesis, `### C2-LA2`): Darroch/Newton-free
favorability at the closed-form level, both leaf classes. At the forward-difference index of record
`Δ_p = i_{p+1} − i_p`, `p = p* = (16m+4)/3`, both closed forms — `I(CB(8,m) − v)` and
`I(CB(8,m) − c)` — strictly descend. A statement about closed-form polynomials over `ℤ[X]`, not
about `cbGraph`; `107 ≤ m` is unused (fence 1). -/
theorem cb8_leafDeletion_closedForms_descent_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3) ∧
    ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3)
 :=
  ⟨cb8_armLeaf_closedForm_descent_topRank m hmod, cb8_privateLeaf_closedForm_descent_topRank m hmod⟩

end E993Transport
-- VERITYOS ENTRY 28 END

