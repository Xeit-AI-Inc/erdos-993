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

-- VERITYOS ENTRY 2 BEGIN definition E993Transport.cb8R1 2efd2823db1ce7d8069b38dd96b9bc3bc2899c6d22733a8066e5ba0fa5e74e9c
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- `r1 m k := Σ_{i=0}^{min(7,k)} C(7,i)·C(8m−7, k−i)·2^{k−i}`. -/
def cb8R1 (m k : ℕ) : ℕ :=
  ∑ i ∈ Finset.range (min 7 k + 1), Nat.choose 7 i * Nat.choose (8 * m - 7) (k - i) * 2 ^ (k - i)

end E993Transport
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition E993Transport.e1S 64515e4266aaa1dc84b088cd2f78f56ddf9d216c6e905c285844b15cc1cb9fe4
-- r31 C3-LA1: frozen text of the Cycle 3 synthesis (### C3-LA1, "Definitions (new; frozen text)"), from T2's
-- zero-extended `Nterm`/`Sterm` (seat C3-T-02) and F's guard form; registered by the Stage 7 formalizer
-- c3-la1-formalizer-opus-20260928 (Claude Opus 5.5). Only the namespace/`open` wrapper is repeated per fragment.
namespace E993Transport
open Polynomial

/-- Zero-extended source clone count `C(a,α)·C(b,j−α)·2^(j−α)`, `0` unless `α ≤ j`. -/
def e1S (a b j α : ℕ) : ℚ :=
  if α ≤ j then ((a.choose α * b.choose (j - α) * 2 ^ (j - α) : ℕ) : ℚ) else 0

end E993Transport
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition E993Transport.e1T 2d83311994d917f0a76fa94cecabdf9b614fac6f4827278a67627d6ed5d887ae
-- r31 C3-LA1: frozen text of the Cycle 3 synthesis (### C3-LA1), from T2's zero-extended `Tterm` (seat C3-T-02)
-- and F's guard form; registered by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- Zero-extended target clone count `C(a,α)·C(b,j−1−α)·2^(j−1−α)`, `0` unless `α + 1 ≤ j`. -/
def e1T (a b j α : ℕ) : ℚ :=
  if α + 1 ≤ j then ((a.choose α * b.choose (j - 1 - α) * 2 ^ (j - 1 - α) : ℕ) : ℚ) else 0

end E993Transport
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition E993Transport.e1Rho b3eb8bc2f5f3384f2365e3a4979371a1ac345f25168769ffde5af7b78838b1ad
-- r31 C3-LA1: frozen text of the Cycle 3 synthesis (### C3-LA1); `ρ = r(j)/r(j−1)` of r30's E1 criterion as a
-- ratio of clone totals; registered by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- `ρ = r(j) / r(j − 1)`, as a ratio of clone totals. -/
def e1Rho (a b j : ℕ) : ℚ :=
  (∑ α ∈ Finset.range (a + 1), e1S a b j α) / ∑ α ∈ Finset.range (a + 1), e1T a b j α

end E993Transport
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition E993Transport.e1G 52bc5461551275da42206911ac9f6fb778204d58784abdfcc75eb7f970f113a3
-- r31 C3-LA1: frozen text of the Cycle 3 synthesis (### C3-LA1); T1's `g` (seat C3-T-01) over the guarded
-- objects; registered by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- Boolean transport mass of type `α`: `ρ·Tc(α) − Sc(α)` (strict prefix sums). -/
def e1G (a b j α : ℕ) : ℚ :=
  e1Rho a b j * (∑ i ∈ Finset.range α, e1T a b j i) - ∑ i ∈ Finset.range α, e1S a b j i

end E993Transport
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition E993Transport.e1H f75b2564612bc5c5dc334e0b3b4e1ffa74469fce218f99e713df9a6fcbfcd6f0
-- r31 C3-LA1: frozen text of the Cycle 3 synthesis (### C3-LA1); T1's `h` (seat C3-T-01) in merged form
-- `S_α − G_α`; registered by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- Ternary transport mass of type `α`: `S_α − G_α` (so the row identity is definitional). -/
def e1H (a b j α : ℕ) : ℚ := e1S a b j α - e1G a b j α
end E993Transport
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma E993Transport.descent_of_recurrence_logconcave 7be63ac8eb845bce953cef4e1c3f1b473c9eb06bea85ba3eb52ca2ad4d95d679
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
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma E993Transport.twoBinom_derivative_identity 63ad7e5309d3418f643650fc656162f808ef36f1c0a0191950a5151d88753b71
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
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma E993Transport.twoBinomCoeff_recurrence d60b214129419ccdf8cd12a466c639c1f83da6cce1f52f3b1d61366905f7b891
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
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma E993Transport.polyCoeffZ_natCast 4c3bf9dcf2a367fb88d5a49b18837f0e18768a66d4d5774b7e5a28979ac1c940
namespace E993Transport

open Polynomial

/-- `polyCoeffZ` agrees with `Polynomial.coeff` at natural indices. -/
lemma polyCoeffZ_natCast (p : ℤ[X]) (n : ℕ) : polyCoeffZ p (n : ℤ) = p.coeff n := by
  simp [polyCoeffZ]

end E993Transport
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma E993Transport.polyCoeffZ_of_neg 3cd1bd212783c3eb57c95fb443c9ea94cfa4ae19f40c37e9d1e83520fe737c08
namespace E993Transport

open Polynomial

/-- `polyCoeffZ` vanishes at negative indices. -/
lemma polyCoeffZ_of_neg (p : ℤ[X]) (i : ℤ) (hi : i < 0) : polyCoeffZ p i = 0 := by
  simp [polyCoeffZ, hi]

end E993Transport
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma E993Transport.polyCoeffZ_one 124ae5c48f85f9b8ae1fe5842db3164f7c6feb80ac516db56dce2bd533cbd456
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
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma E993Transport.polyCoeffZ_linear_mul 3459fc88eb9ce095b0f01978ec725389ed51de6ad1fd7d21fac1d2f7c5d703ed
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
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma E993Transport.strongLC_linear_step d787f5498d99542c3aa877607acadf4da9083888cfad1282baad7d96ef6bcceb
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
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma E993Transport.twoBinom_succ_left a661a5422e938a23adf197c83ce03c17d6e749a9313c245a5031a6d5a1a5876c
namespace E993Transport

open Polynomial

/-- Peeling one factor `1 + X`. -/
lemma twoBinom_succ_left (a b : ℕ) :
    ((1 + X) ^ (a + 1) * (1 + 2 * X) ^ b : ℤ[X]) =
      (1 + C 1 * X) * ((1 + X) ^ a * (1 + 2 * X) ^ b) := by
  simp only [map_one]; ring

end E993Transport
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma E993Transport.twoBinom_succ_right 2759f45c072c96b98ad9a6be9e94af7e61dd6c2ca2e31d7a55fe3d7235370be0
namespace E993Transport

open Polynomial

/-- Peeling one factor `1 + 2X`. -/
lemma twoBinom_succ_right (a b : ℕ) :
    ((1 + X) ^ a * (1 + 2 * X) ^ (b + 1) : ℤ[X]) =
      (1 + C 2 * X) * ((1 + X) ^ a * (1 + 2 * X) ^ b) := by
  simp only [map_ofNat]; ring

end E993Transport
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma E993Transport.polyCoeffZ_linear_mul_nonneg_pos 9b25fa4db728eee090ffbdf7182be9c750e8bf8d07f2a0f8d5d75e865900c12b
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
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma E993Transport.twoBinomCoeffZ_nonneg_pos 8db51d28180bafedd83eb8bca3225379c85c478498b64681f87a0671c7de8a58
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
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma E993Transport.twoBinomCoeff_pos 768f4ab5ed5dd35057de158c05a06727d928906d103861fe4dcd70a6e039a9ac
namespace E993Transport

open Polynomial

/-- Positivity of the coefficients of `(1+X)^a (1+2X)^b` on `[0, a + b]`. -/
lemma twoBinomCoeff_pos (a b k : ℕ) (hk : k ≤ a + b) :
    0 < ((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff k := by
  have := (twoBinomCoeffZ_nonneg_pos a b).2 (k : ℤ) (by positivity) (by exact_mod_cast hk)
  rwa [polyCoeffZ_natCast] at this

end E993Transport
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma E993Transport.twoBinomCoeffZ_strongLC 61e8794fec4ff00b103505614f6cce53efdcf341ae98866fdc89686abaf57dc0
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
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma E993Transport.twoBinomCoeff_logConcave 77460852bfb43435d294720f9480f9713283eb6aa46af6491b6c0d8e25255b02
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
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma E993Transport.twoBinom_coeff_strictAnti_of_gap b39cd78768d02c83194f21b48717af69a8354afb36719755c5979769c3d6589c
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
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma E993Transport.cb8_gap_E1_conditionI c905770686d71203599336a24e247a5da6369676badeab131842c644d3687df5
namespace E993Transport

open Polynomial

/-- Gap identity for (E1i): `6t - (3a + 4b) = 2q + 1` at `t = p* - q - 1`, `p* = (16m+4)/3`. -/
lemma cb8_gap_E1_conditionI (m q : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hq1 : 1 ≤ q)
    (hqm : q ≤ m) :
    6 * ((16 * m + 4) / 3 - q - 1) = 3 * (8 * q - 1) + 4 * (8 * (m - q) + 1) + (2 * q + 1) := by
  omega

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma E993Transport.cb8_E1_conditionI_topRank 8da112b4d0a8c184e9ea9d8c749c1342d53211159d575679999b3d73c7db6a3a
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
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma E993Transport.coeff_one_add_two_mul_X_pow 7a1fef14f01969d7d878d80ce61136ea2bb3921877217f58616c8e7ec338f818
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `coeff_one_add_two_mul_X_pow` (seat C3-T-02,
-- scratch, never carried) by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- Coefficients of `(1 + 2X)^b` over `ℤ`: `C(b,k)·2^k` (commutative binomial theorem). -/
lemma coeff_one_add_two_mul_X_pow (b k : ℕ) :
    ((1 + 2 * X : ℤ[X]) ^ b).coeff k = (b.choose k : ℤ) * 2 ^ k := by
  have hC2 : (C (2 : ℤ) : ℤ[X]) = 2 := by simp
  have h := add_pow (2 * X : ℤ[X]) (1 : ℤ[X]) b
  have e : (1 + 2 * X : ℤ[X]) = (2 * X + 1 : ℤ[X]) := by ring
  have eterm : ∀ i : ℕ, (2 * X : ℤ[X]) ^ i * 1 ^ (b - i) * (b.choose i : ℤ[X])
      = C ((2 : ℤ) ^ i * b.choose i) * X ^ i := by
    intro i
    rw [one_pow, mul_one, mul_pow, ← hC2, ← C_pow, ← C_eq_natCast, C_mul]
    ring
  rw [e, h, finsetSum_coeff]
  simp_rw [eterm]
  rw [Finset.sum_eq_single k]
  · rw [coeff_C_mul_X_pow, if_pos rfl]; ring
  · intro i _ hi
    rw [coeff_C_mul_X_pow, if_neg (fun hcon => hi hcon.symm)]
  · intro hk
    have hbk : b.choose k = 0 :=
      Nat.choose_eq_zero_of_lt (by rw [Finset.mem_range] at hk; omega)
    rw [coeff_C_mul_X_pow, if_pos rfl, hbk]; push_cast; ring

end E993Transport
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma E993Transport.cb8R1_eq_coeffQ e89e75b52efbe82e04b3ec11b3ff5b14103ed2dfb2a4da8d64dcce355117bccc
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `cb8R1_eq_coeffQ` (seat C3-T-02; the R-4 bridge of
-- the Cycle 2 synthesis) by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5). `cb8R1` is
-- C1-LA1 entry 11, carried byte-identically.
namespace E993Transport
open Polynomial

/-- The `cb8R1` coefficient bridge: `cb8R1 m k` is the coefficient of `X^k` in `(1+X)^7 (1+2X)^(8m−7)`. -/
lemma cb8R1_eq_coeffQ (m k : ℕ) :
    ((((1 + X) ^ 7 * (1 + 2 * X) ^ (8 * m - 7) : ℤ[X]).coeff k : ℤ) : ℚ) = (cb8R1 m k : ℚ) := by
  have key : ((1 + X) ^ 7 * (1 + 2 * X) ^ (8 * m - 7) : ℤ[X]).coeff k = (cb8R1 m k : ℤ) := by
    unfold cb8R1
    rw [coeff_mul,
      Finset.Nat.sum_antidiagonal_eq_sum_range_succ
        (fun i l => ((1 + X) ^ 7 : ℤ[X]).coeff i * ((1 + 2 * X) ^ (8 * m - 7) : ℤ[X]).coeff l) k]
    have hterm : ∀ i : ℕ,
        ((1 + X) ^ 7 : ℤ[X]).coeff i * ((1 + 2 * X) ^ (8 * m - 7) : ℤ[X]).coeff (k - i)
          = ((Nat.choose 7 i * Nat.choose (8 * m - 7) (k - i) * 2 ^ (k - i) : ℕ) : ℤ) := by
      intro i
      rw [coeff_one_add_X_pow, coeff_one_add_two_mul_X_pow]; push_cast; ring
    simp_rw [hterm]
    rw [Nat.cast_sum]
    symm
    apply Finset.sum_subset
    · exact Finset.range_subset_range.mpr (by omega)
    · intro i hi hni
      simp only [Finset.mem_range] at hi hni
      have h7 : 7 < i := by omega
      simp [Nat.choose_eq_zero_of_lt h7]
  rw [key]; push_cast; rfl

end E993Transport
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma E993Transport.e1S_nonneg 8095404ab2a26d11be72a0ddd4d442c3c3b78dcfd83ce72bf30fb3131f701b7a
-- r31 C3-LA1: new (Stage 7 formalizer c3-la1-formalizer-opus-20260928, Claude Opus 5.5); cf. C-T2-F/C-T2-U's
-- DRAFT `Sterm_nonneg`.
namespace E993Transport
open Polynomial

lemma e1S_nonneg (a b j α : ℕ) : 0 ≤ e1S a b j α := by
  unfold e1S; split_ifs <;> positivity

end E993Transport
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma E993Transport.e1T_nonneg 40cf10d22c5c13612d7ea0558ddc0174e17b42ad327c4f68e58c8ca991472ea7
-- r31 C3-LA1: new (Stage 7 formalizer c3-la1-formalizer-opus-20260928, Claude Opus 5.5); cf. C-T2-F/C-T2-U's
-- DRAFT `Tterm_nonneg`.
namespace E993Transport
open Polynomial

lemma e1T_nonneg (a b j α : ℕ) : 0 ≤ e1T a b j α := by
  unfold e1T; split_ifs <;> positivity

end E993Transport
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma E993Transport.e1T_eq_e1S_pred 99f3ddb118b6fb291c8753637d302787de3fb130ff05c6c8e8e362578abbf78b
-- r31 C3-LA1: new (Stage 7 formalizer c3-la1-formalizer-opus-20260928, Claude Opus 5.5); the guard identity
-- `T(j) = S(j−1)` for `1 ≤ j` (T2's `Tterm_eq_Nterm` in the synthesis vocabulary; F's guard discipline).
namespace E993Transport
open Polynomial

lemma e1T_eq_e1S_pred (a b j α : ℕ) (hj : 1 ≤ j) : e1T a b j α = e1S a b (j - 1) α := by
  unfold e1T e1S
  by_cases h : α + 1 ≤ j
  · rw [if_pos h, if_pos (by omega : α ≤ j - 1)]
  · rw [if_neg h, if_neg (by omega : ¬ α ≤ j - 1)]

end E993Transport
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma E993Transport.e1S_sum_eq_coeff 9ec8b43ebb7fc10cbd6201454e42bc77607fc001f415d0d45dcf46f36a84ca77
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `rr_eq_coeff` (seat C3-T-02; synthesis DAG step 1,
-- the coefficient bridge) by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- DAG step 1: `Σ_{α ≤ a} S_α = [X^j] (1+X)^a (1+2X)^b`. -/
lemma e1S_sum_eq_coeff (a b j : ℕ) :
    ∑ α ∈ Finset.range (a + 1), e1S a b j α =
      ((((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff j : ℤ) : ℚ) := by
  rw [coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ
      (fun i l => ((1 + X) ^ a : ℤ[X]).coeff i * ((1 + 2 * X) ^ b : ℤ[X]).coeff l) j]
  rw [Int.cast_sum]
  have hterm : ∀ i ∈ Finset.range (j + 1),
      ((((1 + X) ^ a : ℤ[X]).coeff i * ((1 + 2 * X) ^ b : ℤ[X]).coeff (j - i) : ℤ) : ℚ)
        = e1S a b j i := by
    intro i hi
    have hij : i ≤ j := Nat.lt_succ_iff.mp (Finset.mem_range.mp hi)
    rw [coeff_one_add_X_pow, coeff_one_add_two_mul_X_pow, e1S, if_pos hij]
    push_cast; ring
  rw [Finset.sum_congr rfl hterm]
  rcases le_total a j with h | h
  · refine Finset.sum_subset (Finset.range_subset_range.mpr (by omega)) ?_
    intro i _ hni
    simp only [Finset.mem_range, not_lt] at hni
    simp [e1S, Nat.choose_eq_zero_of_lt (by omega : a < i)]
  · refine (Finset.sum_subset (Finset.range_subset_range.mpr (by omega)) ?_).symm
    intro i _ hni
    simp only [Finset.mem_range, not_lt] at hni
    simp [e1S, show ¬ (i ≤ j) by omega]

end E993Transport
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma E993Transport.e1T_sum_eq_coeff c773364acec6102f48aaaa5be68e09aca8b68c42152e48b1f2494d41dd1445ce
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `sum_Tterm` (seat C3-T-02; DAG step 1) by the Stage 7
-- formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- DAG step 1: `Σ_{α ≤ a} T_α = [X^{j−1}] (1+X)^a (1+2X)^b` for `1 ≤ j`. -/
lemma e1T_sum_eq_coeff (a b j : ℕ) (hj : 1 ≤ j) :
    ∑ α ∈ Finset.range (a + 1), e1T a b j α =
      ((((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (j - 1) : ℤ) : ℚ) := by
  rw [← e1S_sum_eq_coeff]
  exact Finset.sum_congr rfl (fun α _ => e1T_eq_e1S_pred a b j α hj)

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma E993Transport.e1Rho_eq_coeff_ratio 25ec3684ee10e50bec2b6afd9abacd73a32ffdd639d72043a2c05dc92ceda7a7
-- r31 C3-LA1: new companion (the generic coefficient bridge named in the synthesis; ungraded), Stage 7 formalizer
-- c3-la1-formalizer-opus-20260928 (Claude Opus 5.5), from T2's bridge.
namespace E993Transport
open Polynomial

/-- The generic coefficient bridge: `e1Rho a b j = [X^j]/[X^{j−1}]` of `(1+X)^a (1+2X)^b`, `1 ≤ j`. -/
lemma e1Rho_eq_coeff_ratio (a b j : ℕ) (hj : 1 ≤ j) :
    e1Rho a b j = ((((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff j : ℤ) : ℚ) /
      ((((1 + X) ^ a * (1 + 2 * X) ^ b : ℤ[X]).coeff (j - 1) : ℤ) : ℚ) := by
  rw [e1Rho, e1S_sum_eq_coeff, e1T_sum_eq_coeff a b j hj]

end E993Transport
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma E993Transport.e1T_sum_pos d2d3319720f5f91ccd5f070357110ad2131b3febfe8d9e524e5aaa31f49f9edd
-- r31 C3-LA1: new (Stage 7 formalizer c3-la1-formalizer-opus-20260928, Claude Opus 5.5); DAG step 2 (domain),
-- from carried C1-LA3 entry 14 through the bridge.
namespace E993Transport
open Polynomial

/-- DAG step 2: `Σ T > 0` on the domain `1 ≤ j ≤ a + b + 1`. -/
lemma e1T_sum_pos (a b j : ℕ) (hj : 1 ≤ j) (hjab : j ≤ a + b + 1) :
    0 < ∑ α ∈ Finset.range (a + 1), e1T a b j α := by
  rw [e1T_sum_eq_coeff a b j hj]
  exact_mod_cast twoBinomCoeff_pos a b (j - 1) (by omega)

end E993Transport
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma E993Transport.e1Rho_mul_sum_e1T 57e9ff03bdcfd9d8eae503dbe6e2deaeb840e83e89ab91bd4aee1e7a7acc439b
-- r31 C3-LA1: new (Stage 7 formalizer c3-la1-formalizer-opus-20260928, Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- `ρ · Σ T = Σ S` whenever `Σ T ≠ 0`. -/
lemma e1Rho_mul_sum_e1T (a b j : ℕ) (hT : (∑ α ∈ Finset.range (a + 1), e1T a b j α) ≠ 0) :
    e1Rho a b j * ∑ α ∈ Finset.range (a + 1), e1T a b j α =
      ∑ α ∈ Finset.range (a + 1), e1S a b j α := by
  rw [e1Rho]
  exact div_mul_cancel₀ _ hT

end E993Transport
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma E993Transport.cb8Rho_lt_one 047c7ba210bcf8d6dff76e45b78561766d4f892118c8938b6fc20383e396d0c0
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `cb8Rho_lt_one` (seat C3-T-02, node (d); U2's
-- duplicate `ρ_q < 1`, seat C3-U-02, deduplicated here) by the Stage 7 formalizer c3-la1-formalizer-opus-20260928
-- (Claude Opus 5.5). DAG step 3: the strict carried C1-LA3 entry 20 over the positive entry-14 denominator.
namespace E993Transport
open Polynomial

/-- DAG step 3: `ρ_q < 1` for `1 ≤ q ≤ m` on the class, as an explicit coefficient ratio. -/
lemma cb8Rho_lt_one (m q : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hq1 : 1 ≤ q) (hqm : q ≤ m) :
    ((((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - q) : ℤ) : ℚ) /
      ((((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - q - 1) : ℤ) : ℚ) < 1 := by
  have hlt := cb8_E1_conditionI_topRank m q hm hmod hq1 hqm
  have hpos : 0 < ((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
      ((16 * m + 4) / 3 - q - 1) :=
    twoBinomCoeff_pos (8 * q - 1) (8 * (m - q) + 1) ((16 * m + 4) / 3 - q - 1) (by omega)
  rw [div_lt_one (by exact_mod_cast hpos)]
  exact_mod_cast hlt

end E993Transport
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma E993Transport.e1Rho_one_eq_cb8R1_ratio e2f458dc0309e9ffc12e25d093bd17823abc7cd1946243e95f9f96502f13416c
-- r31 C3-LA1: re-authored under attribution from C-T2-F's DRAFT `critF_cb8Rho1_eq_c1la1_ratio` and C-T2-U's DRAFT
-- `critic_cb8R1_rho1_lt_one_LA1form` (the C1-LA1-syntax ρ₁ link; DAG step 4) by the Stage 7 formalizer
-- c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- DAG step 4, the `q = 1` link: `ρ_1` equals C1-LA1's `cb8R1` ratio at `K = (16m+1)/3`, for `1 ≤ m`. -/
lemma e1Rho_one_eq_cb8R1_ratio (m : ℕ) (hm : 1 ≤ m) :
    e1Rho (8 * 1 - 1) (8 * (m - 1) + 1) ((16 * m + 4) / 3 - 1) =
      (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ) := by
  rw [e1Rho_eq_coeff_ratio _ _ _ (by omega), show 8 * 1 - 1 = 7 from rfl,
    show 8 * (m - 1) + 1 = 8 * m - 7 by omega, show (16 * m + 4) / 3 - 1 = (16 * m + 1) / 3 by omega,
    cb8R1_eq_coeffQ, cb8R1_eq_coeffQ]

end E993Transport
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma E993Transport.e1_boolean_double_count 54bed46d4763994431c0d16c1c6df1cd30e98a4dd09f6e9afb834536b8974afe
-- r31 C3-LA1: re-authored under attribution from T1's DRAFT `boolean_double_count` (seat C3-T-01), re-proved over
-- the guarded objects (only `α < j` is used), by the Stage 7 formalizer c3-la1-formalizer-opus-20260928
-- (Claude Opus 5.5). DAG step 7, first absorption identity (a companion, ungraded).
namespace E993Transport
open Polynomial

/-- DAG step 7: `(α+1)·S_{α+1} = (a−α)·T_α` for `α + 1 ≤ j`. -/
lemma e1_boolean_double_count (a b j α : ℕ) (hα : α + 1 ≤ j) :
    ((α + 1 : ℕ) : ℚ) * e1S a b j (α + 1) = ((a - α : ℕ) : ℚ) * e1T a b j α := by
  rw [e1S, if_pos hα, e1T, if_pos hα, show j - (α + 1) = j - 1 - α by omega]
  have hc : a.choose (α + 1) * (α + 1) = a.choose α * (a - α) := Nat.choose_succ_right_eq a α
  have key : (α + 1) * (a.choose (α + 1) * b.choose (j - 1 - α) * 2 ^ (j - 1 - α)) =
      (a - α) * (a.choose α * b.choose (j - 1 - α) * 2 ^ (j - 1 - α)) := by
    calc (α + 1) * (a.choose (α + 1) * b.choose (j - 1 - α) * 2 ^ (j - 1 - α))
        = (a.choose (α + 1) * (α + 1)) * (b.choose (j - 1 - α) * 2 ^ (j - 1 - α)) := by ring
      _ = (a.choose α * (a - α)) * (b.choose (j - 1 - α) * 2 ^ (j - 1 - α)) := by rw [hc]
      _ = (a - α) * (a.choose α * b.choose (j - 1 - α) * 2 ^ (j - 1 - α)) := by ring
  rw [← Nat.cast_mul, ← Nat.cast_mul, key]

end E993Transport
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma E993Transport.e1_ternary_double_count 1b19b941b1e591c414e370b5c7a87117870b72dd8fe6a5b237ed46dd4a7665ec
-- r31 C3-LA1: re-authored under attribution from T1's DRAFT `ternary_double_count` (seat C3-T-01), re-proved over
-- the guarded objects (only `α < j` is used), by the Stage 7 formalizer c3-la1-formalizer-opus-20260928
-- (Claude Opus 5.5). DAG step 7, second absorption identity (a companion, ungraded).
namespace E993Transport
open Polynomial

/-- DAG step 7: `(j−α)·S_α = 2(b−(j−1−α))·T_α` for `α + 1 ≤ j`. -/
lemma e1_ternary_double_count (a b j α : ℕ) (hα : α + 1 ≤ j) :
    ((j - α : ℕ) : ℚ) * e1S a b j α = ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) * e1T a b j α := by
  rw [e1S, if_pos (by omega : α ≤ j), e1T, if_pos hα, show j - α = (j - 1 - α) + 1 by omega]
  have hc : b.choose (j - 1 - α + 1) * (j - 1 - α + 1) = b.choose (j - 1 - α) * (b - (j - 1 - α)) :=
    Nat.choose_succ_right_eq b (j - 1 - α)
  have key : (j - 1 - α + 1) * (a.choose α * b.choose (j - 1 - α + 1) * 2 ^ (j - 1 - α + 1)) =
      (2 * (b - (j - 1 - α))) * (a.choose α * b.choose (j - 1 - α) * 2 ^ (j - 1 - α)) := by
    calc (j - 1 - α + 1) * (a.choose α * b.choose (j - 1 - α + 1) * 2 ^ (j - 1 - α + 1))
        = a.choose α * (b.choose (j - 1 - α + 1) * (j - 1 - α + 1)) * 2 ^ (j - 1 - α + 1) := by ring
      _ = a.choose α * (b.choose (j - 1 - α) * (b - (j - 1 - α))) * 2 ^ (j - 1 - α + 1) := by rw [hc]
      _ = (2 * (b - (j - 1 - α))) * (a.choose α * b.choose (j - 1 - α) * 2 ^ (j - 1 - α)) := by ring
  rw [← Nat.cast_mul, ← Nat.cast_mul, key]

end E993Transport
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma E993Transport.e1_rows_identity 52104555accf0b09e4347af135b888d8141de209bbf078cf9cd7cb5c9cc013fb
-- r31 C3-LA1: re-authored under attribution from C-T1-U's DRAFT `rows_identity` (Opus 5.5 critic) by the Stage 7
-- formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5). Definitional in the merged form.
namespace E993Transport
open Polynomial

/-- The rows identity `G_α + H_α = S_α`. -/
lemma e1_rows_identity (a b j α : ℕ) : e1G a b j α + e1H a b j α = e1S a b j α := by
  unfold e1H; ring

end E993Transport
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma E993Transport.e1_g_zero 6f3d2e6515ff1768b26447cfb305136a606f6770ccae5996346acbabb435bcd1
-- r31 C3-LA1: re-authored under attribution from C-T1-U's DRAFT `g_zero` (Opus 5.5 critic) by the Stage 7
-- formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5). DAG step 6, first half.
namespace E993Transport
open Polynomial

/-- DAG step 6: `G_0 = 0`. -/
lemma e1_g_zero (a b j : ℕ) : e1G a b j 0 = 0 := by
  simp [e1G]

end E993Transport
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma E993Transport.e1_in_balance 1b0d36b8e6ca5d1dd2098d35839643e6219899cdc41829ab0cff9c87aa22fbb4
-- r31 C3-LA1: re-authored under attribution from T1's DRAFT `in_balance` (seat C3-T-01) by the Stage 7 formalizer
-- c3-la1-formalizer-opus-20260928 (Claude Opus 5.5). DAG step 5, telescoping of the prefix sums.
namespace E993Transport
open Polynomial

/-- DAG step 5 (in-balance): `G_{α+1} + H_α = ρ·T_α`, for every `α`. -/
lemma e1_in_balance (a b j α : ℕ) :
    e1G a b j (α + 1) + e1H a b j α = e1Rho a b j * e1T a b j α := by
  unfold e1H e1G
  simp only [Finset.sum_range_succ]
  ring

end E993Transport
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma E993Transport.e1_top c835aac88cac254b97b065a1207a2b2ee0f8acc426bf771199f63e2bf1e5d0f5
-- r31 C3-LA1: new (Stage 7 formalizer c3-la1-formalizer-opus-20260928, Claude Opus 5.5); DAG step 5, the top
-- `H_a = ΣS − ρ(ΣT − T_a) = ρT_a` (synthesis).
namespace E993Transport
open Polynomial

/-- DAG step 5 (top): `H_a = ρ·T_a` whenever `Σ T ≠ 0`. -/
lemma e1_top (a b j : ℕ) (hT : (∑ α ∈ Finset.range (a + 1), e1T a b j α) ≠ 0) :
    e1H a b j a = e1Rho a b j * e1T a b j a := by
  have h1 := e1Rho_mul_sum_e1T a b j hT
  rw [Finset.sum_range_succ, Finset.sum_range_succ] at h1
  unfold e1H e1G
  linear_combination (-1 : ℚ) * h1

end E993Transport
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma E993Transport.e1_saturation e7eabde834aea2c73ac2e702eff3c99af7693dc32f0a17955c5ed95720db7faa
-- r31 C3-LA1: new (Stage 7 formalizer c3-la1-formalizer-opus-20260928, Claude Opus 5.5); DAG step 6: all mass lies
-- at indices `≤ j`, so `Tc(j) = ΣT` and `Sc(j+1) = ΣS` (synthesis).
namespace E993Transport
open Polynomial

/-- DAG step 6: for `j ≤ a`, `G_j = S_j` and `H_j = 0` (whenever `Σ T ≠ 0`). -/
lemma e1_saturation (a b j : ℕ) (hT : (∑ α ∈ Finset.range (a + 1), e1T a b j α) ≠ 0)
    (hja : j ≤ a) : e1G a b j j = e1S a b j j ∧ e1H a b j j = 0 := by
  have hTc : ∑ i ∈ Finset.range j, e1T a b j i = ∑ α ∈ Finset.range (a + 1), e1T a b j α := by
    refine Finset.sum_subset (Finset.range_subset_range.mpr (by omega)) ?_
    intro i _ hni
    simp only [Finset.mem_range, not_lt] at hni
    simp [e1T, show ¬ (i + 1 ≤ j) by omega]
  have hSc : ∑ i ∈ Finset.range (j + 1), e1S a b j i = ∑ α ∈ Finset.range (a + 1), e1S a b j α := by
    refine Finset.sum_subset (Finset.range_subset_range.mpr (by omega)) ?_
    intro i _ hni
    simp only [Finset.mem_range, not_lt] at hni
    simp [e1S, show ¬ (i ≤ j) by omega]
  have h1 := e1Rho_mul_sum_e1T a b j hT
  have hG : e1G a b j j = e1S a b j j := by
    unfold e1G
    rw [hTc, h1, ← hSc, Finset.sum_range_succ]
    ring
  refine ⟨hG, ?_⟩
  unfold e1H
  rw [hG]; ring

end E993Transport
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma E993Transport.e1S_eq_polyCoeffZ d66d1cbe343ec98a560552fe281d49b8971fc9d4b1c77ceff93d3157df80f672
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `Sterm_eq_Nterm` (seat C3-T-02; the zero-extended
-- vocabulary) by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- `S_α = C(a,α)·f(j−α)` with `f` the zero-extended coefficient sequence of `(1+X)^0 (1+2X)^b`. -/
lemma e1S_eq_polyCoeffZ (a b j α : ℕ) :
    e1S a b j α = (((a.choose α : ℤ) *
      polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - α) : ℤ) : ℚ) := by
  unfold e1S
  split_ifs with h
  · rw [show (j : ℤ) - α = ((j - α : ℕ) : ℤ) by omega, polyCoeffZ_natCast, pow_zero, one_mul,
      coeff_one_add_two_mul_X_pow]
    push_cast; ring
  · rw [polyCoeffZ_of_neg _ _ (by omega)]; simp

end E993Transport
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma E993Transport.e1T_eq_polyCoeffZ f3f0fabcd2408899db96d63503edba319d197f18fe0137bccafa355086be30b3
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `Tterm_eq_Nterm` (seat C3-T-02; the zero-extended
-- vocabulary) by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- `T_α = C(a,α)·f(j−1−α)` with `f` the zero-extended coefficient sequence of `(1+X)^0 (1+2X)^b`. -/
lemma e1T_eq_polyCoeffZ (a b j α : ℕ) :
    e1T a b j α = (((a.choose α : ℤ) *
      polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - α) : ℤ) : ℚ) := by
  unfold e1T
  split_ifs with h
  · rw [show (j : ℤ) - 1 - α = ((j - 1 - α : ℕ) : ℤ) by omega, polyCoeffZ_natCast, pow_zero, one_mul,
      coeff_one_add_two_mul_X_pow]
    push_cast; ring
  · rw [polyCoeffZ_of_neg _ _ (by omega)]; simp

end E993Transport
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma E993Transport.e1_likelihood_ratio e82b65087bfff07a0176b6bc86c70971007ba59509b53193c51637d15e34fc7f
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `likelihood_ratio` (seat C3-T-02; TP-g) by the Stage 7
-- formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5). DAG step 9, alternative route: carried C1-LA3
-- entry 15 at `a = 0` (the two-by-two minors of `f`; no Newton, no Darroch).
namespace E993Transport
open Polynomial

/-- For `x < y`: `S_x·T_y ≤ S_y·T_x`. -/
lemma e1_likelihood_ratio (a b j x y : ℕ) (hxy : x < y) :
    e1S a b j x * e1T a b j y ≤ e1S a b j y * e1T a b j x := by
  rw [e1S_eq_polyCoeffZ, e1S_eq_polyCoeffZ, e1T_eq_polyCoeffZ, e1T_eq_polyCoeffZ]
  have hs := twoBinomCoeffZ_strongLC 0 b ((j : ℤ) - y) ((j : ℤ) - 1 - x) (by omega)
  rw [show (j : ℤ) - y - 1 = (j : ℤ) - 1 - y by ring,
    show (j : ℤ) - 1 - x + 1 = (j : ℤ) - x by ring] at hs
  have hnn : (0 : ℤ) ≤ (a.choose x : ℤ) * (a.choose y : ℤ) := by positivity
  have step := mul_le_mul_of_nonneg_left hs hnn
  rw [← Int.cast_mul, ← Int.cast_mul, Int.cast_le]
  calc (a.choose x : ℤ) * polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - x) *
        ((a.choose y : ℤ) * polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - y))
      = (a.choose x : ℤ) * (a.choose y : ℤ) *
          (polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - y) *
            polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - x)) := by ring
    _ ≤ (a.choose x : ℤ) * (a.choose y : ℤ) *
          (polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - y) *
            polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - x)) := step
    _ = (a.choose y : ℤ) * polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - y) *
          ((a.choose x : ℤ) * polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - x)) := by
        ring

end E993Transport
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma E993Transport.e1_likelihood_ratio_h 05b3449e53396671dd3f52b4390bd64b7344a8f4b2487fcd3a783e2439353109
-- r31 C3-LA1: re-authored under attribution from C-T2-U's DRAFT `critic_likelihood_ratio_h` and C-T2-F's DRAFT
-- `critF_shifted_pair` (TP-h; Opus 5.5 critics) by the Stage 7 formalizer c3-la1-formalizer-opus-20260928
-- (Claude Opus 5.5). DAG step 9, alternative route: carried C1-LA3 entry 15 at `b = 0` (minors of `C(a,·)`).
namespace E993Transport
open Polynomial

/-- For `x + 1 ≤ z`: `S_{z+1}·T_x ≤ T_z·S_{x+1}`. -/
lemma e1_likelihood_ratio_h (a b j x z : ℕ) (hxz : x + 1 ≤ z) :
    e1S a b j (z + 1) * e1T a b j x ≤ e1T a b j z * e1S a b j (x + 1) := by
  rw [e1S_eq_polyCoeffZ, e1S_eq_polyCoeffZ, e1T_eq_polyCoeffZ, e1T_eq_polyCoeffZ,
    show (j : ℤ) - ((z + 1 : ℕ) : ℤ) = (j : ℤ) - 1 - z by push_cast; ring,
    show (j : ℤ) - ((x + 1 : ℕ) : ℤ) = (j : ℤ) - 1 - x by push_cast; ring]
  have hs := twoBinomCoeffZ_strongLC a 0 ((x : ℤ) + 1) (z : ℤ) (by omega)
  rw [show (x : ℤ) + 1 - 1 = ((x : ℕ) : ℤ) by ring,
    show (z : ℤ) + 1 = ((z + 1 : ℕ) : ℤ) by push_cast; ring,
    show (x : ℤ) + 1 = ((x + 1 : ℕ) : ℤ) by push_cast; ring] at hs
  simp only [polyCoeffZ_natCast, pow_zero, mul_one, coeff_one_add_X_pow] at hs
  have hf1 := (twoBinomCoeffZ_nonneg_pos 0 b).1 ((j : ℤ) - 1 - z)
  have hf2 := (twoBinomCoeffZ_nonneg_pos 0 b).1 ((j : ℤ) - 1 - x)
  have hnn := mul_nonneg hf1 hf2
  have step := mul_le_mul_of_nonneg_right hs hnn
  rw [← Int.cast_mul, ← Int.cast_mul, Int.cast_le]
  calc ((a.choose (z + 1) : ℤ) * polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - z)) *
        ((a.choose x : ℤ) * polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - x))
      = (a.choose x : ℤ) * (a.choose (z + 1) : ℤ) *
          (polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - z) *
            polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - x)) := by ring
    _ ≤ (a.choose (x + 1) : ℤ) * (a.choose z : ℤ) *
          (polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - z) *
            polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - x)) := step
    _ = ((a.choose z : ℤ) * polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - z)) *
          ((a.choose (x + 1) : ℤ) * polyCoeffZ ((1 + X) ^ 0 * (1 + 2 * X) ^ b : ℤ[X]) ((j : ℤ) - 1 - x)) := by
        ring

end E993Transport
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma E993Transport.e1G_nonneg 160a05c661e5d782c721fe1ecd6099aa38a5f1f0a5a7207766bd431698e0eef1
-- r31 C3-LA1: re-authored under attribution from T2's DRAFT `cb8_typePath_ii1` (seat C3-T-02; TP-g) and C-T2-U's
-- DRAFT `critic_typePath_totals_nonneg` (the class nonnegativity) by the Stage 7 formalizer
-- c3-la1-formalizer-opus-20260928 (Claude Opus 5.5). DAG step 9, Boolean half.
namespace E993Transport
open Polynomial

/-- DAG step 9: `G_α ≥ 0` for `α ≤ a` whenever `Σ T > 0`. -/
lemma e1G_nonneg (a b j α : ℕ) (hα : α ≤ a) (hpos : 0 < ∑ i ∈ Finset.range (a + 1), e1T a b j i) :
    0 ≤ e1G a b j α := by
  have hρ := e1Rho_mul_sum_e1T a b j hpos.ne'
  have hS : ∑ i ∈ Finset.range (a + 1), e1S a b j i =
      (∑ i ∈ Finset.range α, e1S a b j i) + ∑ i ∈ Finset.Ico α (a + 1), e1S a b j i :=
    (Finset.sum_range_add_sum_Ico _ (by omega)).symm
  have hT : ∑ i ∈ Finset.range (a + 1), e1T a b j i =
      (∑ i ∈ Finset.range α, e1T a b j i) + ∑ i ∈ Finset.Ico α (a + 1), e1T a b j i :=
    (Finset.sum_range_add_sum_Ico _ (by omega)).symm
  have hcross : (∑ y ∈ Finset.Ico α (a + 1), e1T a b j y) * ∑ x ∈ Finset.range α, e1S a b j x ≤
      (∑ y ∈ Finset.Ico α (a + 1), e1S a b j y) * ∑ x ∈ Finset.range α, e1T a b j x := by
    rw [Finset.sum_mul_sum, Finset.sum_mul_sum]
    apply Finset.sum_le_sum
    intro y hy
    apply Finset.sum_le_sum
    intro x hx
    simp only [Finset.mem_Ico] at hy
    simp only [Finset.mem_range] at hx
    rw [mul_comm (e1T a b j y)]
    exact e1_likelihood_ratio a b j x y (by omega)
  have key : (∑ i ∈ Finset.range (a + 1), e1T a b j i) * e1G a b j α =
      (∑ y ∈ Finset.Ico α (a + 1), e1S a b j y) * (∑ x ∈ Finset.range α, e1T a b j x) -
        (∑ y ∈ Finset.Ico α (a + 1), e1T a b j y) * ∑ x ∈ Finset.range α, e1S a b j x := by
    have e : (∑ i ∈ Finset.range (a + 1), e1T a b j i) * e1G a b j α =
        (e1Rho a b j * ∑ i ∈ Finset.range (a + 1), e1T a b j i) * (∑ x ∈ Finset.range α, e1T a b j x) -
          (∑ i ∈ Finset.range (a + 1), e1T a b j i) * ∑ x ∈ Finset.range α, e1S a b j x := by
      unfold e1G; ring
    rw [e, hρ, hS, hT]; ring
  by_contra hneg
  have := mul_neg_of_pos_of_neg hpos (not_le.mp hneg)
  linarith

end E993Transport
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma E993Transport.e1H_nonneg 7ce7dd7e7b4e5367a2cce02cf7d5d14dbdb2d4767e07827f5098eb0ee76c2f41
-- r31 C3-LA1: re-authored under attribution from C-T2-U's DRAFT `critic_typePath_ii2` and C-T2-F's DRAFT
-- `critF_cb8_typePath_ii2` (TP-h; Opus 5.5 critics) and C-T2-U's `critic_typePath_totals_nonneg` by the Stage 7
-- formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5). DAG step 9, ternary half.
namespace E993Transport
open Polynomial

/-- DAG step 9: `H_α ≥ 0` for `α ≤ a` whenever `Σ T > 0`. -/
lemma e1H_nonneg (a b j α : ℕ) (hα : α ≤ a) (hpos : 0 < ∑ i ∈ Finset.range (a + 1), e1T a b j i) :
    0 ≤ e1H a b j α := by
  have hρ := e1Rho_mul_sum_e1T a b j hpos.ne'
  have hS : ∑ i ∈ Finset.range (a + 1), e1S a b j i =
      (∑ i ∈ Finset.range (α + 1), e1S a b j i) +
        ∑ k ∈ Finset.range (a - α), e1S a b j (α + 1 + k) := by
    rw [← Finset.sum_range_add_sum_Ico _ (by omega : α + 1 ≤ a + 1), Finset.sum_Ico_eq_sum_range,
      show a + 1 - (α + 1) = a - α by omega]
  have hT : ∑ i ∈ Finset.range (a + 1), e1T a b j i =
      (∑ i ∈ Finset.range α, e1T a b j i) + ∑ k ∈ Finset.range (a + 1 - α), e1T a b j (α + k) := by
    rw [← Finset.sum_range_add_sum_Ico _ (by omega : α ≤ a + 1), Finset.sum_Ico_eq_sum_range]
  have hTge : ∑ k ∈ Finset.range (a - α), e1T a b j (α + k) ≤
      ∑ k ∈ Finset.range (a + 1 - α), e1T a b j (α + k) := by
    rw [show a + 1 - α = (a - α) + 1 by omega, Finset.sum_range_succ]
    linarith [e1T_nonneg a b j (α + (a - α))]
  have hSle : ∑ x ∈ Finset.range α, e1S a b j (x + 1) ≤ ∑ i ∈ Finset.range (α + 1), e1S a b j i := by
    rw [Finset.sum_range_succ']
    linarith [e1S_nonneg a b j 0]
  have hcross : (∑ k ∈ Finset.range (a - α), e1S a b j (α + 1 + k)) *
        ∑ x ∈ Finset.range α, e1T a b j x ≤
      (∑ k ∈ Finset.range (a - α), e1T a b j (α + k)) * ∑ x ∈ Finset.range α, e1S a b j (x + 1) := by
    rw [Finset.sum_mul_sum, Finset.sum_mul_sum]
    apply Finset.sum_le_sum
    intro k _
    apply Finset.sum_le_sum
    intro x hx
    simp only [Finset.mem_range] at hx
    have h := e1_likelihood_ratio_h a b j x (α + k) (by omega)
    rwa [show α + k + 1 = α + 1 + k by omega] at h
  have hmono : (∑ k ∈ Finset.range (a - α), e1T a b j (α + k)) *
        ∑ x ∈ Finset.range α, e1S a b j (x + 1) ≤
      (∑ k ∈ Finset.range (a + 1 - α), e1T a b j (α + k)) * ∑ i ∈ Finset.range (α + 1), e1S a b j i :=
    mul_le_mul hTge hSle (Finset.sum_nonneg (fun x _ => e1S_nonneg a b j (x + 1)))
      (Finset.sum_nonneg (fun k _ => e1T_nonneg a b j (α + k)))
  have key : (∑ i ∈ Finset.range (a + 1), e1T a b j i) * e1H a b j α =
      (∑ k ∈ Finset.range (a + 1 - α), e1T a b j (α + k)) * (∑ i ∈ Finset.range (α + 1), e1S a b j i) -
        (∑ k ∈ Finset.range (a - α), e1S a b j (α + 1 + k)) * ∑ x ∈ Finset.range α, e1T a b j x := by
    have e : (∑ i ∈ Finset.range (a + 1), e1T a b j i) * e1H a b j α =
        (∑ i ∈ Finset.range (a + 1), e1T a b j i) * (∑ i ∈ Finset.range (α + 1), e1S a b j i) -
          (e1Rho a b j * ∑ i ∈ Finset.range (a + 1), e1T a b j i) *
            ∑ x ∈ Finset.range α, e1T a b j x := by
      unfold e1H e1G
      rw [Finset.sum_range_succ _ α]
      ring
    rw [e, hρ, hS, hT]; ring
  by_contra hneg
  have := mul_neg_of_pos_of_neg hpos (not_le.mp hneg)
  linarith

end E993Transport
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma E993Transport.e1_column_inflow_clone 382439d0dabee9265d81448ddc2005d12fa511add3bdd240af1749056670037e
-- r31 C3-LA1: re-authored under attribution from C-T1-U's DRAFT `column_inflow_clone` (Opus 5.5 critic; the
-- non-degenerate case), with the degenerate columns of the synthesis's DAG step 8 (the `ℓ = b` sub-case and the
-- `α = a` top) new, by the Stage 7 formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

/-- DAG step 8: for `α ≤ a` with `T_α > 0` (and `Σ T ≠ 0`), the column inflow equals `ρ`. -/
lemma e1_column_inflow_clone (a b j α : ℕ) (hα : α ≤ a)
    (hT : (∑ i ∈ Finset.range (a + 1), e1T a b j i) ≠ 0) (hTα : 0 < e1T a b j α) :
    (if α < a then ((a - α : ℕ) : ℚ) * e1G a b j (α + 1) /
        (((α + 1 : ℕ) : ℚ) * e1S a b j (α + 1)) else 0) +
      (if j - 1 - α < b then ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) * e1H a b j α /
        (((j - α : ℕ) : ℚ) * e1S a b j α) else 0) = e1Rho a b j := by
  have hαj : α + 1 ≤ j := by
    by_contra h
    rw [e1T, if_neg h] at hTα
    exact lt_irrefl _ hTα
  have hlb : j - 1 - α ≤ b := by
    by_contra h
    rw [e1T, if_pos hαj, Nat.choose_eq_zero_of_lt (by omega : b < j - 1 - α)] at hTα
    simp at hTα
  have hB : (if α < a then ((a - α : ℕ) : ℚ) * e1G a b j (α + 1) /
        (((α + 1 : ℕ) : ℚ) * e1S a b j (α + 1)) else 0) =
      (if α < a then e1G a b j (α + 1) else 0) / e1T a b j α := by
    split_ifs with h
    · rw [e1_boolean_double_count a b j α hαj]
      have hne : ((a - α : ℕ) : ℚ) ≠ 0 := by
        have : 0 < a - α := by omega
        exact_mod_cast this.ne'
      exact mul_div_mul_left _ _ hne
    · simp
  have hTer : (if j - 1 - α < b then ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) * e1H a b j α /
        (((j - α : ℕ) : ℚ) * e1S a b j α) else 0) = e1H a b j α / e1T a b j α := by
    split_ifs with h
    · rw [e1_ternary_double_count a b j α hαj]
      have hne : ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) ≠ 0 := by
        have : 0 < 2 * (b - (j - 1 - α)) := by omega
        exact_mod_cast this.ne'
      exact mul_div_mul_left _ _ hne
    · -- degenerate column `ℓ = j − 1 − α = b`: every `i < α` has `S_i = T_i = 0`, and `S_α = 0`.
      have hSα : e1S a b j α = 0 := by
        rw [e1S, if_pos (by omega), Nat.choose_eq_zero_of_lt (by omega : b < j - α)]; simp
      have hSc : ∑ i ∈ Finset.range α, e1S a b j i = 0 := by
        refine Finset.sum_eq_zero (fun i hi => ?_)
        simp only [Finset.mem_range] at hi
        rw [e1S, if_pos (by omega), Nat.choose_eq_zero_of_lt (by omega : b < j - i)]; simp
      have hTc : ∑ i ∈ Finset.range α, e1T a b j i = 0 := by
        refine Finset.sum_eq_zero (fun i hi => ?_)
        simp only [Finset.mem_range] at hi
        rw [e1T, if_pos (by omega), Nat.choose_eq_zero_of_lt (by omega : b < j - 1 - i)]; simp
      have hH : e1H a b j α = 0 := by
        unfold e1H e1G; rw [hSα, hSc, hTc]; ring
      rw [hH, zero_div]
  have hnum : (if α < a then e1G a b j (α + 1) else 0) + e1H a b j α = e1Rho a b j * e1T a b j α := by
    split_ifs with h
    · exact e1_in_balance a b j α
    · rw [zero_add, show α = a by omega]
      exact e1_top a b j hT
  rw [hB, hTer, ← add_div, hnum]
  exact mul_div_cancel_right₀ _ hTα.ne'

end E993Transport
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma E993Transport.e1_cloneTransport 23ffd9496fdd51055419527b51c6c248a099469ecc85cbb29b1858a5b5d9a8ce
-- r31 C3-LA1: the face companion (ungraded; frozen text of the Cycle 3 synthesis, re-authored), registered as
-- `lemma` (the synthesis prints `theorem`; exactly one terminal `theorem` per the brief). Stage 7 formalizer
-- c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

lemma e1_cloneTransport (a b j : ℕ) (hj : 1 ≤ j) (hjab : j ≤ a + b + 1) :
    (∀ α ≤ a, 0 ≤ e1G a b j α ∧ 0 ≤ e1H a b j α) ∧
    (∀ α < a, e1G a b j (α + 1) + e1H a b j α = e1Rho a b j * e1T a b j α) ∧
    e1H a b j a = e1Rho a b j * e1T a b j a ∧
    e1G a b j 0 = 0 ∧
    (j ≤ a → e1G a b j j = e1S a b j j ∧ e1H a b j j = 0) ∧
    (∀ α ≤ a, 0 < e1T a b j α →
      (if α < a then ((a - α : ℕ) : ℚ) * e1G a b j (α + 1) /
          (((α + 1 : ℕ) : ℚ) * e1S a b j (α + 1)) else 0) +
      (if j - 1 - α < b then ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) * e1H a b j α /
          (((j - α : ℕ) : ℚ) * e1S a b j α) else 0) = e1Rho a b j) := by
  have hpos := e1T_sum_pos a b j hj hjab
  have hT := hpos.ne'
  exact ⟨fun α hα => ⟨e1G_nonneg a b j α hα hpos, e1H_nonneg a b j α hα hpos⟩,
    fun α _ => e1_in_balance a b j α, e1_top a b j hT, e1_g_zero a b j,
    fun hja => e1_saturation a b j hT hja, fun α hα hTα => e1_column_inflow_clone a b j α hα hT hTα⟩

end E993Transport
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN theorem E993Transport.cb8_E1_cloneTransport_topRank 596b4d7f0d6b2ff47412fb437bd627e70f8ff411b869b346fe52fbcce75a199e
-- r31 C3-LA1 terminal: frozen text of the Cycle 3 synthesis (### C3-LA1, "Terminal (frozen)"). Clone level only;
-- NOT a statement about `cbGraph m`, NOT the E1 flow on the literal network, NOT conjunct 4, NOT (HALL), NOT
-- `S(T_m, p*) ≤ 0`, NOT progress on (L-S)_top or (ELIG-top)(a), not a new identity; one rank `p*`, `d = 8`, the
-- class only; no θ* law; no Newton or Darroch. Attribution: T1 (Sonnet 5, seat C3-T-01) double counts,
-- in-balance; T2 (seat C3-T-02) coefficient bridge, node (d), TP-g, zero-extended vocabulary; C-T1-F, C-T1-U (Opus
-- 5.5 critics) node-(a) repair, rows, columns, g_zero; C-T2-F, C-T2-U TP-h, nonnegativity, ρ₁ link; C-F3-T, C-F3-U
-- E-1 exact domain, boundary closures, per-target load; U2 (seat C3-U-02) the duplicate ρ_q < 1; the T adjudicator
-- T-A draft, degenerate-case instrument; the F adjudicator G-F-A/G-F-B guard discipline; the Cycle 3 synthesis
-- statement freeze, merged form, degenerate-case paragraph; r31 C2 T3 and critics (X-8/X-9); r30 (criterion key,
-- CD-2, network; named seats as registered); Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL));
-- Codex's heterogeneous-closure run (coefficient mechanisms, as C1-LA3's face cites them); the C1-LA1 and C1-LA3
-- formalizers; formalizer c3-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport
open Polynomial

theorem cb8_E1_cloneTransport_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    e1Rho (8 * 1 - 1) (8 * (m - 1) + 1) ((16 * m + 4) / 3 - 1) =
        (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ) ∧
    ∀ q : ℕ, 1 ≤ q → q ≤ m →
      e1Rho (8 * q - 1) (8 * (m - q) + 1) ((16 * m + 4) / 3 - q) =
          ((((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
              ((16 * m + 4) / 3 - q) : ℤ) : ℚ) /
            ((((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
              ((16 * m + 4) / 3 - q - 1) : ℤ) : ℚ) ∧
      e1Rho (8 * q - 1) (8 * (m - q) + 1) ((16 * m + 4) / 3 - q) < 1 ∧
      ∀ a b j : ℕ, a = 8 * q - 1 → b = 8 * (m - q) + 1 → j = (16 * m + 4) / 3 - q →
        (∀ α ≤ a, 0 ≤ e1G a b j α ∧ 0 ≤ e1H a b j α) ∧
        (∀ α < a, e1G a b j (α + 1) + e1H a b j α = e1Rho a b j * e1T a b j α) ∧
        e1H a b j a = e1Rho a b j * e1T a b j a ∧
        e1G a b j 0 = 0 ∧
        (j ≤ a → e1G a b j j = e1S a b j j ∧ e1H a b j j = 0) ∧
        (∀ α ≤ a, 0 < e1T a b j α →
          (if α < a then ((a - α : ℕ) : ℚ) * e1G a b j (α + 1) /
              (((α + 1 : ℕ) : ℚ) * e1S a b j (α + 1)) else 0) +
          (if j - 1 - α < b then ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) * e1H a b j α /
              (((j - α : ℕ) : ℚ) * e1S a b j α) else 0) = e1Rho a b j) := by
  refine ⟨e1Rho_one_eq_cb8R1_ratio m (by omega), fun q hq1 hqm => ?_⟩
  have hj1 : 1 ≤ (16 * m + 4) / 3 - q := by omega
  refine ⟨e1Rho_eq_coeff_ratio _ _ _ hj1, ?_, ?_⟩
  · rw [e1Rho_eq_coeff_ratio _ _ _ hj1]
    exact cb8Rho_lt_one m q hm hmod hq1 hqm
  · intro a b j ha hb hj
    subst ha hb hj
    exact e1_cloneTransport _ _ _ hj1 (by omega)

end E993Transport
-- VERITYOS ENTRY 53 END

