import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition Erdos993G1.U3.Gamma 2eb608ab627d48b6038b5944ccf541dd4cebb6fa0715dfafdf327f1a80f1fbf8
namespace Erdos993G1.U3

open Nat Finset

/-! ### `Gamma τ k` — the Catalan-dominance gap, guarded so it is total.

Condition (ii): the guard `if j ≤ k then catalan (k - j) else 0` is a
CONVENTION OF RECORD, cited from `SEMANTIC-CONTRACT.md`'s integer
zero-extension convention, not from `SOLUTION-CONTRACT-ADDENDUM-1.md` §A2
(which is silent on `Cat_{k-j}` for `k < j`). It is what decides `K(1) = 0`.
-/


noncomputable
def Gamma (τ k : ℕ) : ℤ :=
  (catalan (k + 1) : ℤ) -
    ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) *
      (if j ≤ k then (catalan (k - j) : ℤ) else 0)

/-! ### Part 0: the Catalan recurrence as a pure integer identity

Mathlib gives `succ_mul_catalan_eq_centralBinom` and
`succ_mul_centralBinom_succ`; composing them yields the classical
multiplicative recurrence `(n+2) * catalan (n+1) = (4*n+2) * catalan n`
with no division anywhere. This is the sole finitary engine behind
everything below. -/
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN lemma Erdos993G1.U3.catalan_pos b8929afc66c366bc9a779b0dc1e4b3097ebd112254feb659b763f017f73233f2
lemma catalan_pos (n : ℕ) : 0 < catalan n := by
  have h := succ_mul_catalan_eq_centralBinom n
  have hc : 0 < Nat.centralBinom n := Nat.centralBinom_pos n
  rcases Nat.eq_zero_or_pos (catalan n) with h0 | h0
  · rw [h0, mul_zero] at h; omega
  · exact h0
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN lemma Erdos993G1.U3.catalan_mul_recurrence f36d3cd21aebf7348e8a461319f9625bd9362b6e7aface508b0c1c56b07788d7
lemma catalan_mul_recurrence (n : ℕ) :
    (n + 2) * catalan (n + 1) = (4 * n + 2) * catalan n := by
  have h1 : (n + 1) * catalan n = Nat.centralBinom n := succ_mul_catalan_eq_centralBinom n
  have h2 : (n + 1 + 1) * catalan (n + 1) = Nat.centralBinom (n + 1) :=
    succ_mul_catalan_eq_centralBinom (n + 1)
  have h3 : (n + 1) * Nat.centralBinom (n + 1) = 2 * (2 * n + 1) * Nat.centralBinom n :=
    Nat.succ_mul_centralBinom_succ n
  have h4 : (n + 1) * ((n + 2) * catalan (n + 1)) = (n + 1) * ((4 * n + 2) * catalan n) := by
    have : (n + 1) * ((n + 1 + 1) * catalan (n + 1)) = (n + 1) * Nat.centralBinom (n + 1) := by
      rw [h2]
    rw [h3, ← h1] at this
    calc (n + 1) * ((n + 2) * catalan (n + 1))
        = (n + 1) * ((n + 1 + 1) * catalan (n + 1)) := by ring_nf
      _ = 2 * (2 * n + 1) * ((n + 1) * catalan n) := this
      _ = (n + 1) * ((4 * n + 2) * catalan n) := by ring
  exact Nat.eq_of_mul_eq_mul_left (Nat.succ_pos n) h4

/-! ### Part 1: strict log-convexity of the Catalan numbers (condition (i):
renamed from `catalan_strict_logConcave`), and the cross-index monotonicity
it implies. This is the finitary route: `f(i) = (i+1)/(4i-2) > 1/4` is
exactly the always-true polynomial fact `(4n+6)*(n+2) > (4n+2)*(n+3)`
(⟺ `12 > 6`) used below, cleared of division. -/
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma Erdos993G1.U3.catalan_strict_logConvex 291966e37b65b15f76e849c9b1995c3653c54d9ddf207c131f3cbd56bb194ea9
lemma catalan_strict_logConvex (n : ℕ) :
    catalan (n + 1) * catalan (n + 1) < catalan n * catalan (n + 2) := by
  have r0 := catalan_mul_recurrence n
  have r1 := catalan_mul_recurrence (n + 1)
  simp only [show n + 1 + 1 = n + 2 by omega, show n + 1 + 2 = n + 3 by omega,
    show 4 * (n + 1) + 2 = 4 * n + 6 by ring] at r1
  have p0 := catalan_pos n
  have p1 := catalan_pos (n + 1)
  have lhs_eq : (n + 2) * (n + 3) * (catalan (n + 1) * catalan (n + 1)) =
      (4 * n + 2) * (n + 3) * (catalan n * catalan (n + 1)) := by
    have step : (n + 2) * (n + 3) * (catalan (n + 1) * catalan (n + 1)) =
        (n + 3) * ((n + 2) * catalan (n + 1)) * catalan (n + 1) := by ring
    rw [step, r0]; ring
  have rhs_eq : (n + 2) * (n + 3) * (catalan n * catalan (n + 2)) =
      (4 * n + 6) * (n + 2) * (catalan n * catalan (n + 1)) := by
    have step : (n + 2) * (n + 3) * (catalan n * catalan (n + 2)) =
        catalan n * ((n + 2) * ((n + 3) * catalan (n + 2))) := by ring
    rw [step, r1]; ring
  have hpos : 0 < catalan n * catalan (n + 1) := mul_pos p0 p1
  have hcoef : (4 * n + 2) * (n + 3) < (4 * n + 6) * (n + 2) := by nlinarith
  have hgoal : (n + 2) * (n + 3) * (catalan (n + 1) * catalan (n + 1)) <
      (n + 2) * (n + 3) * (catalan n * catalan (n + 2)) := by
    rw [lhs_eq, rhs_eq]
    exact mul_lt_mul_of_pos_right hcoef hpos
  exact lt_of_mul_lt_mul_left hgoal (Nat.zero_le _)

/-- The cross-index strict inequality that drives the monotone-ratio lemma:
for `a < b`, `catalan a * catalan (b+1) > catalan (a+1) * catalan b`. Proved
by induction on `b` from the log-convexity step, with no limits. -/
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma Erdos993G1.U3.catalan_cross_strict 3ce4f1aeab1512355c86b7f7414746a70f1e23a6a38b9bd508b1f6b6932e841b
lemma catalan_cross_strict (a b : ℕ) (hab : a < b) :
    catalan (a + 1) * catalan b < catalan a * catalan (b + 1) := by
  induction b, hab using Nat.le_induction with
  | base => exact catalan_strict_logConvex a
  | succ b hb ih =>
    have hlc := catalan_strict_logConvex b
    have pa := catalan_pos a
    have pb1 := catalan_pos (b + 1)
    have stepA : catalan (a + 1) * catalan b * catalan (b + 1) <
        catalan a * catalan (b + 1) * catalan (b + 1) :=
      mul_lt_mul_of_pos_right ih pb1
    have stepB : catalan a * (catalan (b + 1) * catalan (b + 1)) <
        catalan a * (catalan b * catalan (b + 2)) :=
      mul_lt_mul_of_pos_left hlc pa
    have stepA' : catalan (a + 1) * catalan b * catalan (b + 1) <
        catalan a * (catalan (b + 1) * catalan (b + 1)) := by
      have e : catalan a * catalan (b + 1) * catalan (b + 1) =
          catalan a * (catalan (b + 1) * catalan (b + 1)) := by ring
      rwa [e] at stepA
    have chained : catalan (a + 1) * catalan b * catalan (b + 1) <
        catalan a * (catalan b * catalan (b + 2)) := lt_trans stepA' stepB
    have final : catalan b * (catalan (a + 1) * catalan (b + 1)) <
        catalan b * (catalan a * catalan (b + 2)) := by
      have e1 : catalan (a + 1) * catalan b * catalan (b + 1) =
          catalan b * (catalan (a + 1) * catalan (b + 1)) := by ring
      have e2 : catalan a * (catalan b * catalan (b + 2)) =
          catalan b * (catalan a * catalan (b + 2)) := by ring
      rwa [e1, e2] at chained
    exact lt_of_mul_lt_mul_left final (Nat.zero_le _)

/-! ### `Gamma_unfold`, `Gamma_zero` -/
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma Erdos993G1.U3.Gamma_unfold 5106efd4d95d73f01f91c89be409fa0da6eaba6812e6140217a42be32c83a6af
lemma Gamma_unfold {τ k : ℕ} (hk : τ ≤ k) :
    Gamma τ k = (catalan (k + 1) : ℤ) -
      ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k - j) : ℤ) := by
  unfold Gamma
  congr 1
  apply Finset.sum_congr rfl
  intro j hj
  rw [Finset.mem_Icc] at hj
  rw [if_pos (le_trans hj.2 hk)]
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma Erdos993G1.U3.Gamma_zero 419cedcfa550ff243bc4540c91079adbb90f1d91e9b0315f6faf41053ab45f20
lemma Gamma_zero (τ : ℕ) : Gamma τ 0 = 1 := by
  unfold Gamma
  have : ∀ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) *
      (if j ≤ 0 then (catalan (0 - j) : ℤ) else 0) = 0 := by
    intro j hj
    rw [Finset.mem_Icc] at hj
    rw [if_neg (by omega)]
    ring
  rw [Finset.sum_congr rfl this, Finset.sum_const_zero]
  norm_num

/-! ### Part 2: general in `τ` — obligation (1), the gating Lean node. -/
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma Erdos993G1.U3.catalan_le_succ b606bbb3ceebfe08833f56e9a466f05f73d9fdcf25ae9e1ae8b422aed9bbb1fd
lemma catalan_le_succ (n : ℕ) : catalan n ≤ catalan (n + 1) := by
  have r := catalan_mul_recurrence n
  have hcoef : n + 2 ≤ 4 * n + 2 := by omega
  have : (n + 2) * catalan n ≤ (n + 2) * catalan (n + 1) := by
    calc (n + 2) * catalan n ≤ (4 * n + 2) * catalan n := by
          exact Nat.mul_le_mul_right _ hcoef
      _ = (n + 2) * catalan (n + 1) := r.symm
  exact Nat.le_of_mul_le_mul_left this (Nat.succ_pos (n + 1))
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma Erdos993G1.U3.catalan_strict_two_step f957f4987eb32eda00ad7caf6a5094473e351bb35c2ac2aa32b42ca0b72c1e88
lemma catalan_strict_two_step (n : ℕ) : catalan n < catalan (n + 2) := by
  have r1 := catalan_mul_recurrence (n + 1)
  simp only [show n + 1 + 1 = n + 2 by omega, show n + 1 + 2 = n + 3 by omega,
    show 4 * (n + 1) + 2 = 4 * n + 6 by ring] at r1
  have hmono := catalan_le_succ n
  have pn := catalan_pos n
  have hcoef : n + 3 < 4 * n + 6 := by omega
  have step1 : (n + 3) * catalan n ≤ (n + 3) * catalan (n + 1) :=
    Nat.mul_le_mul_left _ hmono
  have step2 : (n + 3) * catalan (n + 1) < (4 * n + 6) * catalan (n + 1) :=
    (Nat.mul_lt_mul_right (catalan_pos (n + 1))).mpr hcoef
  have step3 : (n + 3) * catalan n < (n + 3) * catalan (n + 2) := by
    calc (n + 3) * catalan n ≤ (n + 3) * catalan (n + 1) := step1
      _ < (4 * n + 6) * catalan (n + 1) := step2
      _ = (n + 3) * catalan (n + 2) := r1.symm
  exact Nat.lt_of_mul_lt_mul_left step3

/-- The `τ = 1` base case, `K(1) = 0`: `Gamma 1 k > 0` for every `k`
(no lower bound needed at all, matching `Γ(τ,0) = 1` for every `τ` and the
Cycle 1/2 record). -/
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma Erdos993G1.U3.gamma_one_pos e49de0da3947143e85d4ec480e900c99e641aebe4135f66275ce00897d11849f
lemma gamma_one_pos (k : ℕ) : 0 < Gamma 1 k := by
  unfold Gamma
  rw [Finset.Icc_self]
  simp only [Finset.sum_singleton, Nat.choose_self, Nat.cast_one, one_mul]
  rcases Nat.eq_zero_or_pos k with hk0 | hk1
  · subst hk0; norm_num
  · rw [if_pos (by omega : 1 ≤ k)]
    have h := catalan_strict_two_step (k - 1)
    have heq : k - 1 + 2 = k + 1 := by omega
    rw [heq] at h
    have hz : (catalan (k - 1) : ℤ) < (catalan (k + 1) : ℤ) := by exact_mod_cast h
    linarith

/-- **Obligation (1), the gating Lean node.** For `τ ≥ 1` and `k ≥ τ`, the
ratio `Gamma τ k / catalan (k+1)` strictly increases at `k`; stated
denominator-free (condition (v), statement of record) as required for an
integer formalisation. Proof: the finitary route — expand both sides via
`Gamma_unfold`, reduce the difference to a sum of `catalan`-cross-terms, and
close each term with `catalan_cross_strict` (itself powered only by
`catalan_strict_logConvex`, i.e. by the always-true polynomial fact
`12 > 6` cleared of `f(i) = (i+1)/(4i-2) > 1/4`). No limit, no real/rational
analysis anywhere. -/
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma Erdos993G1.U3.monotone_ratio 5e75f8d871ae572497e56516969b5a57dcaacbe142b8ab830d0eccabf1464eb4
lemma monotone_ratio (τ k : ℕ) (hτ : 1 ≤ τ) (hk : τ ≤ k) :
    Gamma τ k * (catalan (k + 2) : ℤ) < Gamma τ (k + 1) * (catalan (k + 1) : ℤ) := by
  have hk1 : τ ≤ k + 1 := le_trans hk (Nat.le_succ k)
  rw [Gamma_unfold hk, Gamma_unfold hk1]
  have expand :
      ((catalan (k + 2) : ℤ) -
          ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k + 1 - j) : ℤ)) *
        (catalan (k + 1) : ℤ) -
      ((catalan (k + 1) : ℤ) -
          ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k - j) : ℤ)) *
        (catalan (k + 2) : ℤ) =
      ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) *
        ((catalan (k - j) : ℤ) * (catalan (k + 2) : ℤ) -
          (catalan (k + 1 - j) : ℤ) * (catalan (k + 1) : ℤ)) := by
    have e1 : (∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k - j) : ℤ)) *
        (catalan (k + 2) : ℤ) =
        ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k - j) : ℤ) * (catalan (k + 2) : ℤ) :=
      Finset.sum_mul _ _ _
    have e2 : (∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k + 1 - j) : ℤ)) *
        (catalan (k + 1) : ℤ) =
        ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k + 1 - j) : ℤ) * (catalan (k + 1) : ℤ) :=
      Finset.sum_mul _ _ _
    have step1 :
        ((catalan (k + 2) : ℤ) -
            ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k + 1 - j) : ℤ)) *
          (catalan (k + 1) : ℤ) -
        ((catalan (k + 1) : ℤ) -
            ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k - j) : ℤ)) *
          (catalan (k + 2) : ℤ) =
        (∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k - j) : ℤ) * (catalan (k + 2) : ℤ)) -
        (∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k + 1 - j) : ℤ) * (catalan (k + 1) : ℤ)) := by
      rw [sub_mul, sub_mul, e1, e2]; ring
    rw [step1, ← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro j _
    ring
  have hsum_pos :
      0 < ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) *
        ((catalan (k - j) : ℤ) * (catalan (k + 2) : ℤ) -
          (catalan (k + 1 - j) : ℤ) * (catalan (k + 1) : ℤ)) := by
    apply Finset.sum_pos
    · intro j hj
      rw [Finset.mem_Icc] at hj
      have hjk : j ≤ k := le_trans hj.2 hk
      have hcross := catalan_cross_strict (k - j) (k + 1) (by omega)
      have hshift : k - j + 1 = k + 1 - j := by omega
      rw [hshift] at hcross
      have hchoose_pos : 0 < (Nat.choose τ j : ℤ) := by
        have := Nat.choose_pos hj.2
        exact_mod_cast this
      have hbracket_pos : (0:ℤ) < (catalan (k - j) : ℤ) * (catalan (k + 2) : ℤ) -
          (catalan (k + 1 - j) : ℤ) * (catalan (k + 1) : ℤ) := by
        have : ((catalan (k + 1 - j) : ℕ) : ℤ) * (catalan (k + 1) : ℤ) <
            (catalan (k - j) : ℤ) * (catalan (k + 2) : ℤ) := by exact_mod_cast hcross
        linarith
      exact mul_pos hchoose_pos hbracket_pos
    · exact ⟨τ, by rw [Finset.mem_Icc]; omega⟩
  linarith [expand, hsum_pos]

/-! ### Part 3: positivity propagation from a base rank. -/
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma Erdos993G1.U3.gamma_pos_of_base 708207aa73d99a574e28261fd9caa2906c94e568a6c2b0daeab78e01159c3236
lemma gamma_pos_of_base (τ K : ℕ) (hτ : 1 ≤ τ) (hK : τ ≤ K) (hbase : 0 < Gamma τ K) :
    ∀ k, K ≤ k → 0 < Gamma τ k := by
  intro k hk
  induction k, hk using Nat.le_induction with
  | base => exact hbase
  | succ k hk ih =>
    have hkτ : τ ≤ k := le_trans hK hk
    have hm := monotone_ratio τ k hτ hkτ
    have hcat2 := catalan_pos (k + 2)
    have hcat2z : (0:ℤ) < (catalan (k + 2) : ℤ) := by exact_mod_cast hcat2
    have hprod1 : 0 < Gamma τ k * (catalan (k + 2) : ℤ) := mul_pos ih hcat2z
    have hlt : 0 < Gamma τ (k + 1) * (catalan (k + 1) : ℤ) := lt_trans hprod1 hm
    have hcat1 := catalan_pos (k + 1)
    have hcat1z : (0:ℤ) < (catalan (k + 1) : ℤ) := by exact_mod_cast hcat1
    exact (mul_pos_iff_of_pos_right hcat1z).mp hlt

/-! ### Part 4: `K(1..7) = 0, 2, 3, 4, 6, 12, 70`, machine-checked. Each
`gamma_base_τ` is a concrete, kernel-decided numeric fact (`catalan`
rewritten to `Nat.centralBinom` closed form first — the raw recursive
`catalan` does not reduce under `decide`, `centralBinom`/`Nat.choose` does,
up to `Nat.choose 142 71`, a 42-digit number (condition (vi): corrected from
the originating return's "41 digits"), in seconds); each `gamma_pos_τ` then
combines it with `monotone_ratio` via `gamma_pos_of_base` for the
general-`k` conclusion. `τ = 1` uses `gamma_one_pos` directly (`K(1) = 0 < τ`
sits outside `monotone_ratio`'s domain). -/
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma Erdos993G1.U3.gamma_base_2 dbf30f00b8995262e3f5215571acacb4ae6476e75b99ecace59fff65645be200
set_option maxRecDepth 4000 in
lemma gamma_base_2 : 0 < Gamma 2 2 := by
  rw [Gamma_unfold (by norm_num : (2:ℕ) ≤ 2)]; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma Erdos993G1.U3.gamma_base_3 8f41dfe6c5f5979e1a825860642c06286077f87ce4831a002194683546527118
set_option maxRecDepth 4000 in
lemma gamma_base_3 : 0 < Gamma 3 3 := by
  rw [Gamma_unfold (by norm_num : (3:ℕ) ≤ 3)]; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma Erdos993G1.U3.gamma_base_4 daf121dcafe5d2a207b4b0daf3a7716010f28be6dc1faf181657de25e132c255
set_option maxRecDepth 4000 in
lemma gamma_base_4 : 0 < Gamma 4 4 := by
  rw [Gamma_unfold (by norm_num : (4:ℕ) ≤ 4)]; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma Erdos993G1.U3.gamma_base_5 abd1607b432791c1ed1de802abd50243e616e7bf4178f9e4e9f5557cba0fbae2
set_option maxRecDepth 4000 in
lemma gamma_base_5 : 0 < Gamma 5 6 := by
  rw [Gamma_unfold (by norm_num : (5:ℕ) ≤ 6)]; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma Erdos993G1.U3.gamma_base_6 f41691adc9504d3f9653a059cd0a9aa86ff07251634a62d0bee1cc930398d748
set_option maxRecDepth 4000 in
lemma gamma_base_6 : 0 < Gamma 6 12 := by
  rw [Gamma_unfold (by norm_num : (6:ℕ) ≤ 12)]; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma Erdos993G1.U3.gamma_base_7 b386e9266fac49af02c82938dec6d3b58b4cb4ad2a780945dce01c711665313a
set_option maxRecDepth 10000 in
lemma gamma_base_7 : 0 < Gamma 7 70 := by
  rw [Gamma_unfold (by norm_num : (7:ℕ) ≤ 70)]; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma Erdos993G1.U3.gamma_pos_1 9d07932107ad794e4d7bd5eb37aa0afc224ffe0c565d57a201515449a97fb44c
/-- `K(1) = 0`. -/
lemma gamma_pos_1 (k : ℕ) (_hk : 0 ≤ k) : 0 < Gamma 1 k := gamma_one_pos k
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma Erdos993G1.U3.gamma_pos_2 10e6b5edec3762b5805b47dc3deb023e0a7e5d4af56c2314191f58c83fadefda
/-- `K(2) = 2`. -/
lemma gamma_pos_2 (k : ℕ) (hk : 2 ≤ k) : 0 < Gamma 2 k :=
  gamma_pos_of_base 2 2 (by norm_num) (by norm_num) gamma_base_2 k hk
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma Erdos993G1.U3.gamma_pos_3 00305d58892aa7893e246c66e2e8a055a937cb8eac7a9574bdbd11dfcbc8a2b4
/-- `K(3) = 3`. -/
lemma gamma_pos_3 (k : ℕ) (hk : 3 ≤ k) : 0 < Gamma 3 k :=
  gamma_pos_of_base 3 3 (by norm_num) (by norm_num) gamma_base_3 k hk
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma Erdos993G1.U3.gamma_pos_4 25f77e36de9cc1228c2bfd00b78f1fd33d950a42ec5c055319730eec5b0d6ff9
/-- `K(4) = 4`. -/
lemma gamma_pos_4 (k : ℕ) (hk : 4 ≤ k) : 0 < Gamma 4 k :=
  gamma_pos_of_base 4 4 (by norm_num) (by norm_num) gamma_base_4 k hk
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma Erdos993G1.U3.gamma_pos_5 8e8438b86d58d89b0cdcbd55292980ab593a48d728d5a38c0a68d03c0d5a3a5f
/-- `K(5) = 6`. -/
lemma gamma_pos_5 (k : ℕ) (hk : 6 ≤ k) : 0 < Gamma 5 k :=
  gamma_pos_of_base 5 6 (by norm_num) (by norm_num) gamma_base_5 k hk
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma Erdos993G1.U3.gamma_pos_6 9a4373680ab5c31c7b512a36f6482f67b630a248da8c64a2ced142634bf91a40
/-- `K(6) = 12`. -/
lemma gamma_pos_6 (k : ℕ) (hk : 12 ≤ k) : 0 < Gamma 6 k :=
  gamma_pos_of_base 6 12 (by norm_num) (by norm_num) gamma_base_6 k hk
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma Erdos993G1.U3.gamma_pos_7 a4706ca69790a6f61e472dc09d3335b6f318329ce679b1907b09592100188362
/-- `K(7) = 70`. -/
lemma gamma_pos_7 (k : ℕ) (hk : 70 ≤ k) : 0 < Gamma 7 k :=
  gamma_pos_of_base 7 70 (by norm_num) (by norm_num) gamma_base_7 k hk

/-! ### Part 5: the `τ ≥ 8` ceiling, `Gamma τ k < 0` for every `k ≥ τ`.
Same finitary engine as Part 1, run in the other direction: `catalan (m+i)
< 4^i * catalan m` (from `catalan_succ_lt_four_mul`, itself the same
`f(i) > 1/4` fact as Part 1) lower-bounds every term of the gap sum, and
the binomial theorem plus `5^τ ≥ 5·4^τ` for `τ ≥ 8` (Addendum §A2's
`(5/4)^τ − 1 < 4 ⟺ τ ≤ 7`, used at the complementary threshold) makes the
lower bound exceed `catalan (k+1)`. No limit anywhere. -/
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma Erdos993G1.U3.catalan_succ_lt_four_mul 85f568f8476ac98257bcc668e9e6b92634b01018edb1e84cde0785d2070b933d
lemma catalan_succ_lt_four_mul (m : ℕ) : catalan (m + 1) < 4 * catalan m := by
  have r := catalan_mul_recurrence m
  have hp := catalan_pos m
  have hcoef : 4 * m + 2 < 4 * (m + 2) := by omega
  have step : (m + 2) * catalan (m + 1) < (m + 2) * (4 * catalan m) := by
    rw [r]
    calc (4 * m + 2) * catalan m < (4 * (m + 2)) * catalan m :=
          (Nat.mul_lt_mul_right hp).mpr hcoef
      _ = (m + 2) * (4 * catalan m) := by ring
  exact Nat.lt_of_mul_lt_mul_left step
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma Erdos993G1.U3.catalan_pow_bound a3e4b03c1d8ecbbd4846be6aad48861b9d0c88dae7ac1e8b1aa8bbd45b8a8ae9
lemma catalan_pow_bound (m i : ℕ) (hi : 1 ≤ i) : catalan (m + i) < 4 ^ i * catalan m := by
  induction i, hi using Nat.le_induction with
  | base => simpa using catalan_succ_lt_four_mul m
  | succ i hi ih =>
    have step : catalan (m + i + 1) < 4 * catalan (m + i) := catalan_succ_lt_four_mul (m + i)
    have heq : m + (i + 1) = m + i + 1 := by omega
    rw [heq]
    calc catalan (m + i + 1) < 4 * catalan (m + i) := step
      _ < 4 * (4 ^ i * catalan m) := mul_lt_mul_of_pos_left ih (by norm_num)
      _ = 4 ^ (i + 1) * catalan m := by ring
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma Erdos993G1.U3.catalan_cross_lower 6d26e70143dbd67d2bfbab68bf0bac7aecc548f2b9e61ba6f20480ed18b83aeb
lemma catalan_cross_lower (k j : ℕ) (hjk : j ≤ k) :
    catalan (k + 1) < 4 ^ (j + 1) * catalan (k - j) := by
  have h := catalan_pow_bound (k - j) (j + 1) (by omega)
  have heq : (k - j) + (j + 1) = k + 1 := by omega
  rwa [heq] at h

/-- The binomial-theorem identity behind the ceiling: `Σ_{j=1}^{τ} C(τ,j)
4^{τ-j} = 5^{τ} - 4^{τ}` (the `j = 0` term peeled from `(1+4)^τ = 5^τ`). -/
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma Erdos993G1.U3.binom_five_pow_split 1c621735d2364e756c7a096ad5e9f86268499006158f5cd13c323f1ec9ecba45
lemma binom_five_pow_split (τ : ℕ) :
    ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * 4 ^ (τ - j) + 4 ^ τ = 5 ^ τ := by
  have hbin := add_pow (1 : ℕ) 4 τ
  simp only [Nat.cast_id] at hbin
  rw [show (1:ℕ) + 4 = 5 from rfl] at hbin
  have hsplit : Finset.range (τ + 1) = insert 0 (Finset.Icc 1 τ) := by
    ext x
    simp only [Finset.mem_range, Finset.mem_insert, Finset.mem_Icc]
    omega
  rw [hsplit, Finset.sum_insert (by simp)] at hbin
  have hcongr : ∑ j ∈ Finset.Icc 1 τ, (1:ℕ) ^ j * 4 ^ (τ - j) * τ.choose j =
      ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * 4 ^ (τ - j) := by
    apply Finset.sum_congr rfl; intro j _; ring
  rw [hcongr] at hbin
  have hfirst : (1:ℕ) ^ 0 * 4 ^ (τ - 0) * τ.choose 0 = 4 ^ τ := by
    simp [Nat.choose_zero_right]
  rw [hfirst] at hbin
  omega
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma Erdos993G1.U3.five_pow_ge 2d4b3ffced7eedc33da56029842105363aa5eb79b65e0e1c3dacf8b532da9c20
/-- `(5/4)^τ ≥ 5` for `τ ≥ 8`, cleared of division: `5^τ ≥ 5 * 4^τ`. -/
lemma five_pow_ge (τ : ℕ) (hτ : 8 ≤ τ) : 5 * 4 ^ τ ≤ 5 ^ τ := by
  induction τ, hτ using Nat.le_induction with
  | base => norm_num
  | succ τ _ ih =>
    have : 5 * 4 ^ (τ + 1) ≤ 5 * (5 * 4 ^ τ) := by
      have : 4 ^ (τ + 1) ≤ 5 * 4 ^ τ := by ring_nf; omega
      nlinarith
    calc 5 * 4 ^ (τ + 1) ≤ 5 * (5 * 4 ^ τ) := this
      _ ≤ 5 * 5 ^ τ := by nlinarith
      _ = 5 ^ (τ + 1) := by ring

/-- **The `τ ≥ 8` ceiling, closing obligation (1).** `Gamma τ k < 0` for
every `k ≥ τ` once `τ ≥ 8` — no upper bound on `k`, and general in `τ`. -/
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma Erdos993G1.U3.gamma_neg_of_ge_eight d65b067f56f00e00f0887b3fbcd9c25063885769b52001e86c32e3f53f676f61
lemma gamma_neg_of_ge_eight (τ k : ℕ) (hτ : 8 ≤ τ) (hk : τ ≤ k) : Gamma τ k < 0 := by
  rw [Gamma_unfold hk]
  have hnat : catalan (k + 1) < ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k - j) := by
    have hcancel :
        catalan (k + 1) * 4 ^ (τ + 1) <
          (∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k - j)) * 4 ^ (τ + 1) := by
      have hterm : ∀ j ∈ Finset.Icc 1 τ,
          Nat.choose τ j * catalan (k + 1) * 4 ^ (τ - j) <
            Nat.choose τ j * catalan (k - j) * 4 ^ (τ + 1) := by
        intro j hj
        rw [Finset.mem_Icc] at hj
        have hjk : j ≤ k := le_trans hj.2 hk
        have hcl := catalan_cross_lower k j hjk
        have hchoose_pos : 0 < Nat.choose τ j := Nat.choose_pos hj.2
        have hstep : catalan (k + 1) * 4 ^ (τ - j) < catalan (k - j) * 4 ^ (τ + 1) := by
          have heq : 4 ^ (j + 1) * 4 ^ (τ - j) = (4:ℕ) ^ (τ + 1) := by
            rw [← pow_add]; congr 1; omega
          calc catalan (k + 1) * 4 ^ (τ - j)
              < (4 ^ (j + 1) * catalan (k - j)) * 4 ^ (τ - j) :=
                (Nat.mul_lt_mul_right (by positivity)).mpr hcl
            _ = catalan (k - j) * (4 ^ (j + 1) * 4 ^ (τ - j)) := by ring
            _ = catalan (k - j) * 4 ^ (τ + 1) := by rw [heq]
        calc Nat.choose τ j * catalan (k + 1) * 4 ^ (τ - j)
            = Nat.choose τ j * (catalan (k + 1) * 4 ^ (τ - j)) := by ring
          _ < Nat.choose τ j * (catalan (k - j) * 4 ^ (τ + 1)) :=
              (Nat.mul_lt_mul_left hchoose_pos).mpr hstep
          _ = Nat.choose τ j * catalan (k - j) * 4 ^ (τ + 1) := by ring
      have hsum_lt : ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k + 1) * 4 ^ (τ - j) <
          ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k - j) * 4 ^ (τ + 1) :=
        Finset.sum_lt_sum_of_nonempty ⟨τ, by rw [Finset.mem_Icc]; omega⟩ hterm
      have hlhs : ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k + 1) * 4 ^ (τ - j) =
          catalan (k + 1) * ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * 4 ^ (τ - j) := by
        rw [Finset.mul_sum]; apply Finset.sum_congr rfl; intro j _; ring
      have hrhs : ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k - j) * 4 ^ (τ + 1) =
          (∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k - j)) * 4 ^ (τ + 1) :=
        (Finset.sum_mul _ _ _).symm
      rw [hlhs, hrhs] at hsum_lt
      have hsplit := binom_five_pow_split τ
      have hge := five_pow_ge τ hτ
      have hbound : 4 ^ (τ + 1) ≤ ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * 4 ^ (τ - j) := by
        have : 4 ^ τ + 4 ^ (τ + 1) ≤ 5 ^ τ := by
          have hpow : 4 ^ (τ + 1) = 4 * 4 ^ τ := by ring
          omega
        omega
      calc catalan (k + 1) * 4 ^ (τ + 1) ≤
          catalan (k + 1) * ∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * 4 ^ (τ - j) :=
            Nat.mul_le_mul_left _ hbound
        _ < (∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k - j)) * 4 ^ (τ + 1) := hsum_lt
    exact Nat.lt_of_mul_lt_mul_right hcancel
  have hz : (catalan (k + 1) : ℤ) <
      (∑ j ∈ Finset.Icc 1 τ, Nat.choose τ j * catalan (k - j) : ℕ) := by exact_mod_cast hnat
  push_cast at hz
  linarith

/-! ### Condition (iii): threshold-minimality witnesses (added).

`Γ(2,1) = 0` (a **plateau**, not a strict negative), `Γ(3,2) = −1`,
`Γ(4,3) = −4`, `Γ(5,5) = −14`, `Γ(6,11) = −1563`,
`Γ(7,69) = −799363812466329793611557404284949737`. The `τ = 2,3,4`
witnesses sit at `k < τ`, outside `Gamma_unfold`'s domain, so the guard is
load-bearing for the minimality half too; they are decided directly from
`Gamma`'s raw definition. The `τ = 5,6,7` witnesses sit at `k ≥ τ` and go
through `Gamma_unfold` exactly as the base values do. Every witness is
independently reconfirmed by exact-integer Python
(`EVIDENCE/generate_gamma_witnesses.py`). -/
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma Erdos993G1.U3.gamma_min_2 f89542f1a330c1af9fd623b796980ea7872ec5b4afac163199b0871b6aa1ae1a
set_option maxRecDepth 2000 in
lemma gamma_min_2 : Gamma 2 1 = 0 := by
  unfold Gamma; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma Erdos993G1.U3.gamma_min_3 eb2b4d960fb63162087098ee710cafe6085fdac138358ee53aab726a10e8fef1
set_option maxRecDepth 2000 in
lemma gamma_min_3 : Gamma 3 2 = -1 := by
  unfold Gamma; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma Erdos993G1.U3.gamma_min_4 924c1a21721c86b7f9ed20f16924fcd387ae9bdb76e1e45467d83bbb2c10aa1a
set_option maxRecDepth 2000 in
lemma gamma_min_4 : Gamma 4 3 = -4 := by
  unfold Gamma; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma Erdos993G1.U3.gamma_min_5 0a3f7d4bddf22344f24ab776ad6ce422a0e8fd42d801a53c5e75e185b2bea391
set_option maxRecDepth 4000 in
lemma gamma_min_5 : Gamma 5 5 = -14 := by
  rw [Gamma_unfold (by norm_num : (5:ℕ) ≤ 5)]; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma Erdos993G1.U3.gamma_min_6 7973c8c4bf8b038db006df723348c349beebc4463b2e1969ba84a090b2eb5dc2
set_option maxRecDepth 4000 in
lemma gamma_min_6 : Gamma 6 11 = -1563 := by
  rw [Gamma_unfold (by norm_num : (6:ℕ) ≤ 11)]; simp only [catalan_eq_centralBinom_div]; decide
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma Erdos993G1.U3.gamma_min_7 3ef81dc216a225d3c048bce79d614766adb87454028bebb44588af868ed9892f
set_option maxRecDepth 10000 in
lemma gamma_min_7 : Gamma 7 69 = -799363812466329793611557404284949737 := by
  rw [Gamma_unfold (by norm_num : (7:ℕ) ≤ 69)]; simp only [catalan_eq_centralBinom_div]; decide

/-! ### Terminal declaration.

The single `theorem` the governed workflow binds: the explicit conjunction
of the four parts of the award. Every component above is a lemma; this is
the only `theorem` in the project. -/
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN theorem Erdos993G1.U3.catalanGap_monotone_ratio_award e7c7f540034ef640e48208014b313fefdd437949b2b61e2ae01d1bfc89b9ef19
theorem catalanGap_monotone_ratio_award :
    (∀ τ k : ℕ, 1 ≤ τ → τ ≤ k →
        Gamma τ k * (catalan (k + 2) : ℤ) < Gamma τ (k + 1) * (catalan (k + 1) : ℤ)) ∧
    (∀ τ K : ℕ, 1 ≤ τ → τ ≤ K → 0 < Gamma τ K → ∀ k : ℕ, K ≤ k → 0 < Gamma τ k) ∧
    ((∀ k, 0 ≤ k → 0 < Gamma 1 k) ∧ (∀ k, 2 ≤ k → 0 < Gamma 2 k) ∧
     (∀ k, 3 ≤ k → 0 < Gamma 3 k) ∧ (∀ k, 4 ≤ k → 0 < Gamma 4 k) ∧
     (∀ k, 6 ≤ k → 0 < Gamma 5 k) ∧ (∀ k, 12 ≤ k → 0 < Gamma 6 k) ∧
     (∀ k, 70 ≤ k → 0 < Gamma 7 k)) ∧
    (∀ τ k : ℕ, 8 ≤ τ → τ ≤ k → Gamma τ k < 0) :=
  ⟨monotone_ratio, gamma_pos_of_base,
    ⟨gamma_pos_1, gamma_pos_2, gamma_pos_3, gamma_pos_4, gamma_pos_5, gamma_pos_6, gamma_pos_7⟩,
    gamma_neg_of_ge_eight⟩

end Erdos993G1.U3
-- VERITYOS ENTRY 38 END

