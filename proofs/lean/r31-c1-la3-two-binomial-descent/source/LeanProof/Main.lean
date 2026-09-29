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

-- VERITYOS ENTRY 18 BEGIN lemma E993Transport.cb8_gap_E1_conditionI c905770686d71203599336a24e247a5da6369676badeab131842c644d3687df5
namespace E993Transport

open Polynomial

/-- Gap identity for (E1i): `6t - (3a + 4b) = 2q + 1` at `t = p* - q - 1`, `p* = (16m+4)/3`. -/
lemma cb8_gap_E1_conditionI (m q : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hq1 : 1 ≤ q)
    (hqm : q ≤ m) :
    6 * ((16 * m + 4) / 3 - q - 1) = 3 * (8 * q - 1) + 4 * (8 * (m - q) + 1) + (2 * q + 1) := by
  omega

end E993Transport
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma E993Transport.cb8_gap_block_descent 1c8c67c5617a91f7a76b0473afc00a32464c6d9b83882fec5a296d82ab04bf1e
namespace E993Transport

open Polynomial

/-- Gap identity for (BD): `6l - (3a + 4b) = 2j - 8` at `l = p* - 2 - j`, `p* = (16m+4)/3`. -/
lemma cb8_gap_block_descent (m j : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hj : 5 ≤ j)
    (hjm : j ≤ m) :
    6 * ((16 * m + 4) / 3 - 2 - j) + 8 = 3 * (8 * j) + 4 * (8 * (m - j) + 1) + 2 * j := by
  omega

end E993Transport
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma E993Transport.cb8_E1_conditionI_topRank 8da112b4d0a8c184e9ea9d8c749c1342d53211159d575679999b3d73c7db6a3a
namespace E993Transport

open Polynomial

/-- (E1i): E1's condition (i) at `p* = (16m+4)/3` for every `1 ≤ q ≤ m` on the class
`107 ≤ m`, `m % 3 = 2`. A Tier 3 dependency reduction on the face, never Tier 2 progress; an
instance of the registered threshold key's (a) at `p*` only. -/
lemma cb8_E1_conditionI_topRank (m q : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hq1 : 1 ≤ q)
    (hqm : q ≤ m) :
    ((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - q) <
      ((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - q - 1) := by
  have hg := cb8_gap_E1_conditionI m q hm hmod hq1 hqm
  have h := twoBinom_coeff_strictAnti_of_gap (8 * q - 1) (8 * (m - q) + 1)
    ((16 * m + 4) / 3 - q - 1) (by omega) (by omega) (by omega)
  rwa [show (16 * m + 4) / 3 - q - 1 + 1 = (16 * m + 4) / 3 - q by omega] at h

end E993Transport
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN theorem E993Transport.cb8_block_descent_topRank 1afd4f7df25576b0bef0f3fafe2624b8f231691ca46c2c37ee0f2eec62a1b92f
namespace E993Transport

open Polynomial

/-- (BD), terminal: the block descent at `l = (16m+4)/3 - 2 - j` for every `5 ≤ j ≤ m` on the
class `107 ≤ m`, `m % 3 = 2`. A NODE of (ELIG-top)(a), not (ELIG-top)(a) (which also needs the
`S_5` certificate and the block identity); no favorability; no rank other than `p*`.
Attribution: Lemma A and closing step C-U3-T; `q = 1` case r31 U3; corroboration C-U3-F; the
(BD) instance and its role r31 synthesis (from C-U3-T's Lemma B); E1 criterion, threshold and
`r_q` r30; mechanism Codex GPT-6; formalizer c1-la3-formalizer-opus-20260928 (Claude Opus 5.5). -/
theorem cb8_block_descent_topRank (m j : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hj : 5 ≤ j)
    (hjm : j ≤ m) :
    ((1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - 2 - j + 1) <
      ((1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - 2 - j) := by
  have hg := cb8_gap_block_descent m j hm hmod hj hjm
  exact twoBinom_coeff_strictAnti_of_gap (8 * j) (8 * (m - j) + 1)
    ((16 * m + 4) / 3 - 2 - j) (by omega) (by omega) (by omega)

end E993Transport
-- VERITYOS ENTRY 21 END

