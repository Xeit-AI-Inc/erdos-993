/-
  Erdos993R2C2.cbg_conv_closed   and   Erdos993R2C2.cbg_terminal_band
  ------------------------------------------------------------------
  Governed DRE run: erdos-993-math-dre-20260826-r2, Cycle 2 Lean gate.

  FROZEN TARGETS (see THEOREM-CONTRACT.md):

  (1) `cbg_conv_closed`.  Let a = (a_0, ..., a_p) and b = (b_0, ..., b_q) be
      finite sequences of natural numbers, p, q >= 0.  Suppose
        (k+1) * a_(k+1) <= 2 * (p - k) * a_k   for every 0 <= k <= p-1,
        (k+1) * b_(k+1) <= 2 * (q - k) * b_k   for every 0 <= k <= q-1.
      Let c_k = sum over i+j=k, 0<=i<=p, 0<=j<=q of a_i * b_j, 0 <= k <= p+q.
      Then
        (k+1) * c_(k+1) <= 2 * (p + q - k) * c_k  for every 0 <= k <= p+q-1.
      Degenerate cases included and required: p = 0; q = 0; zero entries;
      trailing zeros; a or b identically zero.

  (2) `cbg_terminal_band`.  If (k+1) * a_(k+1) <= 2 * (D - k) * a_k for every
      0 <= k <= D-1, then a_(k+1) <= a_k for every k >= ceil((2D-1)/3), and
      a_(k+1) < a_k whenever 3k > 2D-1 and a_k > 0.

  PRIORITY FLAG.  NO NOVELTY IS CLAIMED.  A Vandermonde- or
  Keilson-Gerber-style precedent may well exist; it cannot be checked in-run
  without unauthorised retrieval.  Formalizing possibly-known mathematics with
  a self-contained proof is admissible; claiming novelty is NOT.  Nothing in
  this file asserts priority.  `novelty_claimed: false`.

  ENCODING.
    * `CBG p a` is stated multiplicatively over `Nat` on both sides and is
      SUBTRACTION-FREE: the coefficient `p - k` is named by an existential
      witness `r` with `k + r + 1 = p`, so no truncated subtraction occurs in
      either the hypothesis or the conclusion of the frozen targets.
      `CBG_iff_literal` proves this is exactly the guarded `p - k` reading.
    * No division anywhere.  The ceiling `ceil((2D-1)/3)` is expressed by the
      subtraction-free linear condition `2*D <= 3*k + 1`; `ceilBand_le_iff`
      machine-checks that this is literally `(2*D+1)/3 <= k`, and
      `Nat.ceil`-free.
    * COMPOSITION.  `Erdos993R2C2.conv` is a VERBATIM copy of the Cycle-1
      gate's in-file `conv`.  `conv_eq_cycle1` proves the two are the same
      function BY `rfl`, so `Erdos993R2C1.lc_conv_wu` and the declarations
      here are stated over one and the same convolution and compose in
      Cycle 3 without re-proof.
    * `conv_antidiagonal` additionally presents that same convolution as a sum
      over `Finset.antidiagonal`, honouring the gate's antidiagonal condition
      without disturbing the verbatim-composition condition.

  PROOF (five lines, informal).
    (k+1) * c_(k+1) = sum over i+j=k+1 of (i + j) * a_i * b_j
                    = sum over i+j=k+1 of (i * a_i) * b_j
                    + sum over i+j=k+1 of a_i * (j * b_j);
    reindex i -> i+1 in the first sum and j -> j+1 in the second, bound
    (i+1) * a_(i+1) <= 2*(p-i)*a_i and (j+1) * b_(j+1) <= 2*(q-j)*b_j
    termwise, and add: on the antidiagonal i+j=k with i<=p, j<=q one has
    2*(p-i) + 2*(q-j) = 2*(p+q-k), giving 2*(p+q-k) * c_k.

  No `sorry`, no `admit`, no `native_decide`, no new axioms.
-/

import LeanProof.Cycle1
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.BigOperators.NatAntidiagonal
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Tactic.Ring

namespace Erdos993R2C2

open Finset

/-! ## Statement-level definitions (self-contained) -/

/-- The discrete convolution `c k = ∑_{i+j=k, 0 ≤ i ≤ p, 0 ≤ j ≤ q} a i * b j`.

This is a VERBATIM copy of the Cycle-1 gate's in-file definition
`Erdos993R2C1.conv`; see `conv_eq_cycle1` below. -/
def conv (p q : ℕ) (a b : ℕ → ℕ) (k : ℕ) : ℕ :=
  ∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1), if i + j = k then a i * b j else 0

/-- **Composition receipt.**  The convolution used here is *definitionally
identical* to the one the Cycle-1 governed declaration
`Erdos993R2C1.lc_conv_wu` is stated over. -/
theorem conv_eq_cycle1 : @conv = @Erdos993R2C1.conv := rfl

/-- `CBG p a` is the Basit–Galvin ratio condition

  `(k+1) * a (k+1) ≤ 2 * (p - k) * a k`   for `0 ≤ k ≤ p - 1`,

written subtraction-free: the coefficient `p - k` is named `r + 1` through the
equation `k + r + 1 = p`, which simultaneously encodes `k ≤ p - 1`. -/
def CBG (p : ℕ) (a : ℕ → ℕ) : Prop :=
  ∀ k r : ℕ, k + r + 1 = p → (k + 1) * a (k + 1) ≤ 2 * (r + 1) * a k

/-- `CBG` is exactly the literal (guarded, truncation-free) `p - k` reading of
the frozen hypothesis. -/
theorem CBG_iff_literal (p : ℕ) (a : ℕ → ℕ) :
    CBG p a ↔ ∀ k, k < p → (k + 1) * a (k + 1) ≤ 2 * (p - k) * a k := by
  constructor
  · intro h k hk
    have h1 := h k (p - k - 1) (by omega)
    have h2 : p - k - 1 + 1 = p - k := by omega
    rwa [h2] at h1
  · intro h k r hkr
    have h1 := h k (by omega)
    have h2 : p - k = r + 1 := by omega
    rwa [h2] at h1

/-- The one-step form of `CBG`, in the guarded `p - k` shape. -/
private lemma step {p : ℕ} {a : ℕ → ℕ} (ha : CBG p a) :
    ∀ i, i < p → (i + 1) * a (i + 1) ≤ 2 * (p - i) * a i :=
  (CBG_iff_literal p a).mp ha

/-! ## Antidiagonal presentation of `conv` (gate condition 4) -/

/-- The same convolution, written as a sum over `Finset.antidiagonal k`. -/
theorem conv_antidiagonal (p q : ℕ) (a b : ℕ → ℕ) (k : ℕ) :
    conv p q a b k
      = ∑ x ∈ Finset.antidiagonal k, if x.1 ≤ p ∧ x.2 ≤ q then a x.1 * b x.2 else 0 := by
  classical
  have h1 : conv p q a b k
      = ∑ x ∈ range (p + 1) ×ˢ range (q + 1), if x.1 + x.2 = k then a x.1 * b x.2 else 0 := by
    rw [Finset.sum_product]
    rfl
  rw [h1, ← Finset.sum_filter, ← Finset.sum_filter]
  refine Finset.sum_congr ?_ (fun _ _ => rfl)
  ext x
  simp only [Finset.mem_filter, Finset.mem_product, Finset.mem_range,
    Finset.mem_antidiagonal]
  omega

/-! ## Declaration 1 : convolution closure -/

/-- Weighted split of `n * c n` into an `a`-side and a `b`-side sum. -/
private lemma conv_split (p q : ℕ) (a b : ℕ → ℕ) (n : ℕ) :
    n * conv p q a b n
      = (∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
            if i + j = n then i * a i * b j else 0)
        + (∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
            if i + j = n then a i * (j * b j) else 0) := by
  unfold conv
  rw [Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => ?_
  by_cases h : i + j = n
  · rw [if_pos h, if_pos h, if_pos h, ← h]
    ring
  · rw [if_neg h, if_neg h, if_neg h]
    simp

/-- Bound on the `a`-side sum: reindex `i ↦ i + 1` and apply the ratio bound
for `a` termwise. -/
private lemma bound_a (p q : ℕ) (a b : ℕ → ℕ) (ha : CBG p a) (k : ℕ) :
    (∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
        if i + j = k + 1 then i * a i * b j else 0)
      ≤ ∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
          if i + j = k then 2 * (p - i) * (a i * b j) else 0 := by
  have hsplit :
      (∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
          if i + j = k + 1 then i * a i * b j else 0)
        = (∑ i ∈ range p, ∑ j ∈ range (q + 1),
            if (i + 1) + j = k + 1 then (i + 1) * a (i + 1) * b j else 0)
          + (∑ j ∈ range (q + 1), if 0 + j = k + 1 then 0 * a 0 * b j else 0) :=
    Finset.sum_range_succ' _ p
  have hzero : (∑ j ∈ range (q + 1), if 0 + j = k + 1 then 0 * a 0 * b j else 0) = 0 := by
    refine Finset.sum_eq_zero ?_
    intro j _
    by_cases h : 0 + j = k + 1
    · rw [if_pos h]; simp
    · rw [if_neg h]
  rw [hsplit, hzero, Nat.add_zero]
  refine le_trans (Finset.sum_le_sum ?_)
    (Finset.sum_le_sum_of_subset (Finset.range_subset_range.mpr (Nat.le_succ p)))
  intro i hi
  simp only [Finset.mem_range] at hi
  refine Finset.sum_le_sum ?_
  intro j _
  by_cases h : i + j = k
  · rw [if_pos (show i + 1 + j = k + 1 by omega), if_pos h]
    calc (i + 1) * a (i + 1) * b j
        ≤ 2 * (p - i) * a i * b j := Nat.mul_le_mul_right _ (step ha i hi)
      _ = 2 * (p - i) * (a i * b j) := by ring
  · rw [if_neg (show ¬ (i + 1 + j = k + 1) by omega), if_neg h]

/-- Bound on the `b`-side sum: reindex `j ↦ j + 1` and apply the ratio bound
for `b` termwise. -/
private lemma bound_b (p q : ℕ) (a b : ℕ → ℕ) (hb : CBG q b) (k : ℕ) :
    (∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
        if i + j = k + 1 then a i * (j * b j) else 0)
      ≤ ∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
          if i + j = k then 2 * (q - j) * (a i * b j) else 0 := by
  refine Finset.sum_le_sum ?_
  intro i _
  have hsplit :
      (∑ j ∈ range (q + 1), if i + j = k + 1 then a i * (j * b j) else 0)
        = (∑ j ∈ range q, if i + (j + 1) = k + 1 then a i * ((j + 1) * b (j + 1)) else 0)
          + (if i + 0 = k + 1 then a i * (0 * b 0) else 0) :=
    Finset.sum_range_succ' _ q
  have hzero : (if i + 0 = k + 1 then a i * (0 * b 0) else 0) = 0 := by
    by_cases h : i + 0 = k + 1
    · rw [if_pos h]; simp
    · rw [if_neg h]
  rw [hsplit, hzero, Nat.add_zero]
  refine le_trans (Finset.sum_le_sum ?_)
    (Finset.sum_le_sum_of_subset (Finset.range_subset_range.mpr (Nat.le_succ q)))
  intro j hj
  simp only [Finset.mem_range] at hj
  by_cases h : i + j = k
  · rw [if_pos (show i + (j + 1) = k + 1 by omega), if_pos h]
    calc a i * ((j + 1) * b (j + 1))
        ≤ a i * (2 * (q - j) * b j) := Nat.mul_le_mul_left _ (step hb j hj)
      _ = 2 * (q - j) * (a i * b j) := by ring
  · rw [if_neg (show ¬ (i + (j + 1) = k + 1) by omega), if_neg h]

/-- Recombination on the antidiagonal: `2*(p-i) + 2*(q-j) = 2*(p+q-k)`. -/
private lemma combine (p q : ℕ) (a b : ℕ → ℕ) (k r : ℕ) (hkr : k + r + 1 = p + q) :
    (∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
        if i + j = k then 2 * (p - i) * (a i * b j) else 0)
      + (∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1),
          if i + j = k then 2 * (q - j) * (a i * b j) else 0)
      = 2 * (r + 1) * conv p q a b k := by
  unfold conv
  rw [Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i hi => ?_
  simp only [Finset.mem_range] at hi
  rw [Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j hj => ?_
  simp only [Finset.mem_range] at hj
  by_cases h : i + j = k
  · rw [if_pos h, if_pos h, if_pos h]
    have hc : 2 * (p - i) + 2 * (q - j) = 2 * (r + 1) := by omega
    calc 2 * (p - i) * (a i * b j) + 2 * (q - j) * (a i * b j)
        = (2 * (p - i) + 2 * (q - j)) * (a i * b j) := by ring
      _ = 2 * (r + 1) * (a i * b j) := by rw [hc]
  · rw [if_neg h, if_neg h, if_neg h]
    simp

/--
**Erdos993R2C2.cbg_conv_closed.**

Let `a = (a 0, …, a p)` and `b = (b 0, …, b q)` be finite sequences of natural
numbers, `p, q ≥ 0`.  Assume the Basit–Galvin ratio conditions

* `ha` : `(k+1) * a (k+1) ≤ 2 * (p - k) * a k` for every `0 ≤ k ≤ p - 1`;
* `hb` : `(k+1) * b (k+1) ≤ 2 * (q - k) * b k` for every `0 ≤ k ≤ q - 1`

(both in the subtraction-free `CBG` form).  Then the discrete convolution
`conv p q a b`, i.e. `c k = ∑_{i+j=k, 0 ≤ i ≤ p, 0 ≤ j ≤ q} a i * b j`,
satisfies

  `(k+1) * c (k+1) ≤ 2 * (p + q - k) * c k`  for every `0 ≤ k ≤ p + q - 1`.

Every degenerate case is a genuine instance and is excluded by no hypothesis:
`p = 0`, `q = 0`, zero entries, trailing zeros, and `a` or `b` identically
zero all satisfy `CBG` and are covered.

NO NOVELTY IS CLAIMED for this statement.
-/
theorem cbg_conv_closed (p q : ℕ) (a b : ℕ → ℕ)
    (ha : CBG p a) (hb : CBG q b) :
    CBG (p + q) (conv p q a b) := by
  intro k r hkr
  rw [conv_split p q a b (k + 1), ← combine p q a b k r hkr]
  exact Nat.add_le_add (bound_a p q a b ha k) (bound_b p q a b hb k)

/-! ## Declaration 2 : the terminal band -/

/-- `ceilBand D = ⌈(2*D - 1)/3⌉`, written division-free downstream. -/
def ceilBand (D : ℕ) : ℕ := (2 * D + 1) / 3

/-- `k ≥ ⌈(2D-1)/3⌉` is exactly the subtraction- and division-free linear
condition `2*D ≤ 3*k + 1`. -/
theorem ceilBand_le_iff (D k : ℕ) : ceilBand D ≤ k ↔ 2 * D ≤ 3 * k + 1 := by
  unfold ceilBand
  omega

/-- `3*k > 2*D - 1` is exactly `2*D ≤ 3*k` (for `D ≥ 1`; for `D = 0` the band
is empty because the hypothesis range `k < D` is empty). -/
theorem strictBand_iff (D k : ℕ) (hD : 1 ≤ D) : 2 * D - 1 < 3 * k ↔ 2 * D ≤ 3 * k := by
  omega

/-- The arithmetic core: `2*(D-k) ≤ k+1 ↔ k ≥ ⌈(2D-1)/3⌉`, for `k ≤ D`. -/
theorem band_arith (D k : ℕ) (hk : k ≤ D) :
    2 * (D - k) ≤ k + 1 ↔ ceilBand D ≤ k := by
  rw [ceilBand_le_iff]
  omega

/--
**Erdos993R2C2.cbg_terminal_band.**

If `(k+1) * a (k+1) ≤ 2 * (D - k) * a k` for every `0 ≤ k ≤ D - 1`
(i.e. `CBG D a`), then

* `a (k+1) ≤ a k` for every `k ≥ ⌈(2D-1)/3⌉` (equivalently `2*D ≤ 3*k + 1`);
* `a (k+1) < a k` whenever `3*k > 2*D - 1` (equivalently `2*D ≤ 3*k`) and
  `a k > 0`.

The index guard `k < D` is the range on which the hypothesis speaks; for a
sequence extended by zero past `D` it may be dropped, see
`cbg_terminal_band_ext`.

NO NOVELTY IS CLAIMED for this statement.
-/
theorem cbg_terminal_band (D : ℕ) (a : ℕ → ℕ) (ha : CBG D a) :
    (∀ k, k < D → 2 * D ≤ 3 * k + 1 → a (k + 1) ≤ a k)
      ∧ (∀ k, k < D → 2 * D ≤ 3 * k → 0 < a k → a (k + 1) < a k) := by
  constructor
  · intro k hk hband
    have h := ha k (D - k - 1) (by omega)
    have h2 : 2 * (D - k - 1 + 1) ≤ k + 1 := by omega
    have h3 : 2 * (D - k - 1 + 1) * a k ≤ (k + 1) * a k := Nat.mul_le_mul_right _ h2
    exact Nat.le_of_mul_le_mul_left (le_trans h h3) (Nat.succ_pos k)
  · intro k hk hband hpos
    have h := ha k (D - k - 1) (by omega)
    have h2 : 2 * (D - k - 1 + 1) ≤ k := by omega
    have h3 : 2 * (D - k - 1 + 1) * a k ≤ k * a k := Nat.mul_le_mul_right _ h2
    have h4 : k * a k < (k + 1) * a k := by
      have he : (k + 1) * a k = k * a k + a k := by ring
      omega
    exact Nat.lt_of_mul_lt_mul_left (lt_of_le_of_lt (le_trans h h3) h4)

/-- The unguarded form of `cbg_terminal_band` for a sequence extended by zero
past its last index `D`: the conclusion then holds for *every*
`k ≥ ⌈(2D-1)/3⌉`, with no upper guard. -/
theorem cbg_terminal_band_ext (D : ℕ) (a : ℕ → ℕ) (ha : CBG D a)
    (hz : ∀ i, D < i → a i = 0) :
    (∀ k, ceilBand D ≤ k → a (k + 1) ≤ a k)
      ∧ (∀ k, 2 * D ≤ 3 * k → 0 < a k → a (k + 1) < a k) := by
  obtain ⟨h1, h2⟩ := cbg_terminal_band D a ha
  constructor
  · intro k hk
    rw [ceilBand_le_iff] at hk
    by_cases hkD : k < D
    · exact h1 k hkD hk
    · rw [hz (k + 1) (by omega)]
      exact Nat.zero_le _
  · intro k hband hpos
    by_cases hkD : k < D
    · exact h2 k hkD hband hpos
    · have hkD' : D ≤ k := by omega
      rcases Nat.lt_or_ge D k with h | h
      · rw [hz k h] at hpos; exact absurd hpos (by omega)
      · have hDk : k = D := by omega
        subst hDk
        rw [hz (k + 1) (by omega)]
        exact hpos

/-! ## Sharpness: the binomial family `(1 + 2x)^p` -/

/-- Equality version: the binomial family attains the `CBG` bound exactly. -/
theorem binom_cbg_eq (p k r : ℕ) (hkr : k + r + 1 = p) :
    (k + 1) * (Nat.choose p (k + 1) * 2 ^ (k + 1))
      = 2 * (r + 1) * (Nat.choose p k * 2 ^ k) := by
  have h := Nat.choose_succ_right_eq p k
  have hr : p - k = r + 1 := by omega
  rw [hr] at h
  calc (k + 1) * (Nat.choose p (k + 1) * 2 ^ (k + 1))
      = (Nat.choose p (k + 1) * (k + 1)) * 2 ^ (k + 1) := by ring
    _ = (Nat.choose p k * (r + 1)) * 2 ^ (k + 1) := by rw [h]
    _ = 2 * (r + 1) * (Nat.choose p k * 2 ^ k) := by ring

/-- `a k = C(p,k) * 2^k` — the coefficient sequence of `(1 + 2x)^p` — satisfies
`CBG p` with EQUALITY at every index.  In particular `CBG` is non-vacuous for
every `p`, and the inequality in `cbg_conv_closed` is sharp. -/
theorem binom_cbg (p : ℕ) : CBG p (fun k => Nat.choose p k * 2 ^ k) := by
  intro k r hkr
  show (k + 1) * (Nat.choose p (k + 1) * 2 ^ (k + 1))
      ≤ 2 * (r + 1) * (Nat.choose p k * 2 ^ k)
  exact le_of_eq (binom_cbg_eq p k r hkr)

/-- The plateau locus companion (`C2:R1-C2`):
`3 * ⌈(2D-1)/3⌉ = 2D - 1` exactly when `D % 3 = 2`. -/
theorem plateau_locus (D : ℕ) (hD : 1 ≤ D) :
    3 * ceilBand D = 2 * D - 1 ↔ D % 3 = 2 := by
  unfold ceilBand
  omega

end Erdos993R2C2
