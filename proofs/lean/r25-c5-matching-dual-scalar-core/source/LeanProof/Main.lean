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

-- VERITYOS ENTRY 2 BEGIN lemma ErdosR25.E1ArithmeticCore.discriminant_factorization 6908d8a610358523ccd0fc0891af9c192746408468a005aa6aa5f96b46aca109
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
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN lemma ErdosR25.E1ArithmeticCore.discriminant_in_K_matches_in_d aefe6eaa1708f9a05d9156be7ae98691234fc4b83b23a90792a8213f8170d593
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. The discriminant, as it literally arises from substituting `K = 2m - d`
into `9K² - 12(K+1+4Km-4m²)`, equals the `(m,d)` form above. Pure ring
identity. -/
lemma discriminant_in_K_matches_in_d (m d : ℤ) :
    9 * (2 * m - d) ^ 2 - 12 * ((2 * m - d) + 1 + 4 * (2 * m - d) * m - 4 * m ^ 2)
      = 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 := by
  ring

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma ErdosR25.E1ArithmeticCore.discriminant_nonpos_iff 5b74a6439ae19a7eda72678d4f66562175c854df49f8365f5a073942eeb43274
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
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma ErdosR25.E1ArithmeticCore.S_quadratic_nonneg_of_discriminant_nonpos 3cd91ee873039407a345e1a7a649aa01c1690aec13796008264ba0f8f193ea40
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. Standard "discriminant ≤ 0 implies the quadratic form is a sum of
squares" certificate: `12·(3n²-3Kn+C) = (6n-3K)² - Δ`, so `Δ ≤ 0` forces the
right side `≥ 0`. -/
lemma S_quadratic_nonneg_of_discriminant_nonpos (K m n : ℤ)
    (hΔ : 9 * K ^ 2 - 12 * (K + 1 + 4 * K * m - 4 * m ^ 2) ≤ 0) :
    3 * n ^ 2 - 3 * K * n + (K + 1 + 4 * K * m - 4 * m ^ 2) ≥ 0 := by
  nlinarith [sq_nonneg (6 * n - 3 * K), hΔ]

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma ErdosR25.E1ArithmeticCore.S_holds_of_discriminant_nonpos 42e408b5766a80a20c82985c90a8b3253f20e9f7b9271610bf508bb904876bdd
namespace ErdosR25.E1ArithmeticCore

/-- Seat U1. `(S)` itself, in its original multiplicative form, from the
discriminant hypothesis. -/
lemma S_holds_of_discriminant_nonpos (K m n : ℤ)
    (hΔ : 9 * K ^ 2 - 12 * (K + 1 + 4 * K * m - 4 * m ^ 2) ≤ 0) :
    (n + 1) * (K + 1 - n) ≥ 4 * (m + n - K) * (m - n) := by
  have h := S_quadratic_nonneg_of_discriminant_nonpos K m n hΔ
  nlinarith [h]

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma ErdosR25.E1ArithmeticCore.S_holds_on_region 124e582383400534df6e5b641ee7c1a42be7a5a509e8a555bf9042012dff6353
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
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma ErdosR25.E1ArithmeticCore.P_base_s1 4b0b17447ffcb9ec22beb141c3c6aa64f6a3cff06c161dd9506134075071bde8
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
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma ErdosR25.E1ArithmeticCore.P_base_s2 8ba45dcbb27e2932f36b73f36bf04c16e6abbb76f9f26da62a37bef607b6c062
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
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma ErdosR25.E1ArithmeticCore.P_induction_step_critic 31d0ad9f4d440cf9206ef82ef95b2e51d6089b420828d0fc1d0d7482c4324c6a
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
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma ErdosR25.E1ArithmeticCore.P_holds_critic 89a67bb0df9416076a66728bc40caaf9180c5bda7a84f944ec6d71017ca979c4
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
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma ErdosR25.E1ArithmeticCore.P_holds_critic_general decf7f83fc7c509c609ab0576efefcd2e7b21844f0e0d42681065720593a478c
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
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN theorem ErdosR25.E1ArithmeticCore.matchingDual_scalarCore_award 0906714e27d6f560686cad7b7491b60b2c19618258ca3e525c2e2944eec2f23d
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
theorem matchingDual_scalarCore_award :
    (∀ m d : ℤ, 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 = 3 * (3 * d - 2 * (m + 1)) * (d + 2 * (m + 1))) ∧
    (∀ m d : ℤ, 0 ≤ m → 0 ≤ d → (9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 ↔ 3 * d ≤ 2 * m + 2)) ∧
    (∀ m d n : ℤ, 0 ≤ m → 0 ≤ d → 3 * d ≤ 2 * m + 2 →
        (n + 1) * ((2 * m - d) + 1 - n) ≥ 4 * (m + n - (2 * m - d)) * (m - n)) ∧
    (∀ m K : ℕ, (K : ℤ) ≤ 2 * (m : ℤ) → 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 →
        ∀ n : ℕ, K + 1 < 2 * n → n ≤ m → PStatement m K n) :=
  ⟨discriminant_factorization, discriminant_nonpos_iff, S_holds_on_region, P_holds_critic_general⟩

end ErdosR25.E1ArithmeticCore
-- VERITYOS ENTRY 13 END

