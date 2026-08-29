/-
  Erdos993R2C1.lc_conv_wu
  ------------------------------------------------------------------
  Governed DRE run: erdos-993-math-dre-20260826-r2, Cycle 1 Lean gate.

  FROZEN TARGET (see THEOREM-CONTRACT.md):

    Let a = (a_0, ..., a_p) and b = (b_0, ..., b_q) be finite sequences of
    natural numbers with p, q >= 0.  Suppose
      (i)   a_k >= 1 for every 0 <= k <= p;
      (ii)  a_k * a_k >= a_(k-1) * a_(k+1) for every 1 <= k <= p-1;
      (iii) b is weakly unimodal: there is m with 0 <= m <= q such that
            b_0 <= ... <= b_m >= ... >= b_q.
    Let c_k = sum over i+j=k, 0<=i<=p, 0<=j<=q of a_i * b_j, 0 <= k <= p+q.
    Then c is weakly unimodal.

  PRIORITY FLAG.  This may well be a known theorem (Keilson-Gerber type;
  cf. total positivity / Polya frequency sequences).  Formalizing
  possibly-known mathematics with a self-contained proof is admissible;
  claiming novelty is NOT.  Nothing here asserts priority.

  ENCODING.  Everything is subtraction-free over `Nat` in the sense that no
  `Int` is used and every sign/comparison fact is phrased as an inequality
  between products of naturals.  `Nat` truncated subtraction appears only in
  (a) index arithmetic `k - i` guarded by `i <= k`, and (b) the definitions
  of the forward/backward increments of `b`, where the truncation is
  immediately discharged by the monotonicity hypotheses.

  PROOF STRATEGY (ratio domination).
    * Extend `a`, `b` by zero outside their index ranges to `A`, `B`.
    * Split the increments of `B` at its mode `m` into a nonnegative "up"
      part `U` and a nonnegative "down" part `V`, so that termwise
        B (n+1) + V (n+1) = B n + U (n+1).
      Convolving with `A` gives the subtraction-free difference identity
        c (k+1) + N (k+1) = c k + P (k+1),   P := A*U,  N := A*V.
      Hence `c` descends at step `k+1` exactly when `P (k+1) < N (k+1)`.
    * Log-concavity of `A` with no internal zeros yields the spread
      inequality  A w * A (w+d+e) <= A (w+d) * A (w+e),  whence the ratio
      domination  P l * N k <= P k * N l  for k <= l.
    * Therefore once `c` strictly descends it never ascends again, which is
      exactly weak unimodality.

  No `sorry`, no `admit`, no new axioms.
-/

import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Tactic.Ring

namespace Erdos993R2C1

open Finset

/-! ## Statement-level definitions (self-contained) -/

/-- `WeaklyUnimodal n f` says `f 0 ≤ f 1 ≤ ⋯ ≤ f m ≥ ⋯ ≥ f n` for some
`m ≤ n`.  This is literally hypothesis (iii) / the conclusion of the target. -/
def WeaklyUnimodal (n : ℕ) (f : ℕ → ℕ) : Prop :=
  ∃ m, m ≤ n ∧ (∀ k, k < m → f k ≤ f (k + 1)) ∧ (∀ k, m ≤ k → k < n → f (k + 1) ≤ f k)

/-- The discrete convolution `c k = ∑_{i+j=k, 0 ≤ i ≤ p, 0 ≤ j ≤ q} a i * b j`. -/
def conv (p q : ℕ) (a b : ℕ → ℕ) (k : ℕ) : ℕ :=
  ∑ i ∈ range (p + 1), ∑ j ∈ range (q + 1), if i + j = k then a i * b j else 0

/-! ## Auxiliary machinery -/

/-- Extension of a finite sequence `f = (f 0, …, f n)` by zero. -/
private def trunc (n : ℕ) (f : ℕ → ℕ) (i : ℕ) : ℕ := if i ≤ n then f i else 0

/-- Convolution of two everywhere-defined sequences. -/
private def cnv (f g : ℕ → ℕ) (n : ℕ) : ℕ := ∑ i ∈ range (n + 1), f i * g (n - i)

/-- `shift f n s` is `f (n - s)` when `s ≤ n`, and `0` otherwise; this keeps
all index arithmetic guarded. -/
private def shift (f : ℕ → ℕ) (n s : ℕ) : ℕ := if s ≤ n then f (n - s) else 0

private lemma cnv_swap (f g : ℕ → ℕ) (n : ℕ) : cnv f g n = cnv g f n := by
  unfold cnv
  rw [← Finset.sum_range_reflect (fun i => g i * f (n - i)) (n + 1)]
  refine Finset.sum_congr rfl ?_
  intro i hi
  simp only [Finset.mem_range] at hi
  have h1 : n + 1 - 1 - i = n - i := by omega
  have h2 : n - (n - i) = i := by omega
  simp only [h1, h2]
  exact Nat.mul_comm _ _

/-- Rewrite a convolution as a sum over the *second* argument's index,
extended to any range large enough. -/
private lemma cnv_ext (f g : ℕ → ℕ) (n M : ℕ) (h : n ≤ M) :
    cnv f g n = ∑ s ∈ range (M + 1), g s * shift f n s := by
  rw [cnv_swap]
  have h1 : cnv g f n = ∑ s ∈ range (n + 1), g s * shift f n s := by
    unfold cnv
    refine Finset.sum_congr rfl ?_
    intro s hs
    simp only [Finset.mem_range] at hs
    simp only [shift, if_pos (show s ≤ n by omega)]
  rw [h1]
  have hsub : range (n + 1) ⊆ range (M + 1) :=
    Finset.range_subset_range.mpr (by omega)
  refine Finset.sum_subset hsub ?_
  intro s _ hs2
  simp only [Finset.mem_range, not_lt] at hs2
  simp only [shift, if_neg (show ¬ s ≤ n by omega), Nat.mul_zero]

/-! ### Log-concavity: the spread inequality -/

section LogConcave

variable {A : ℕ → ℕ} {p : ℕ}

/-- With no internal zeros, vanishing propagates upward. -/
private lemma van (hpos : ∀ i, i ≤ p → 1 ≤ A i) (hzero : ∀ i, p < i → A i = 0) :
    ∀ j, A j = 0 → A (j + 1) = 0 := by
  intro j hj
  by_cases h : j + 1 ≤ p
  · have := hpos j (by omega); omega
  · exact hzero _ (by omega)

/-- One-step spread: for `u ≤ v`, `A u * A (v+1) ≤ A (u+1) * A v`.
Stated as `v = u + e` to stay subtraction-free. -/
private lemma stepLem (hpos : ∀ i, i ≤ p → 1 ≤ A i) (hzero : ∀ i, p < i → A i = 0)
    (hlc : ∀ i, A i * A (i + 2) ≤ A (i + 1) * A (i + 1)) :
    ∀ e u, A u * A (u + e + 1) ≤ A (u + 1) * A (u + e) := by
  intro e
  induction e with
  | zero => intro u; simpa using Nat.le_of_eq (Nat.mul_comm (A u) (A (u + 1)))
  | succ e ih =>
    intro u
    have hgoal : u + (e + 1) + 1 = (u + e + 1) + 1 := by omega
    have hgoal2 : u + (e + 1) = (u + e) + 1 := by omega
    rw [hgoal, hgoal2]
    rcases Nat.eq_zero_or_pos (A (u + e + 1)) with h | h
    · have h2 : A (u + e + 1 + 1) = 0 := van hpos hzero _ h
      simp [h2]
    · have key : (A u * A (u + e + 1 + 1)) * A (u + e + 1)
          ≤ (A (u + 1) * A (u + e + 1)) * A (u + e + 1) := by
        have e1 : u + e + 1 + 1 = (u + e) + 2 := by omega
        calc (A u * A (u + e + 1 + 1)) * A (u + e + 1)
            = (A u * A (u + e + 1)) * A (u + e + 1 + 1) := by ring
          _ ≤ (A (u + 1) * A (u + e)) * A (u + e + 1 + 1) :=
              Nat.mul_le_mul_right _ (ih u)
          _ = A (u + 1) * (A (u + e) * A ((u + e) + 2)) := by rw [e1]; ring
          _ ≤ A (u + 1) * (A ((u + e) + 1) * A ((u + e) + 1)) :=
              Nat.mul_le_mul_left _ (hlc (u + e))
          _ = (A (u + 1) * A (u + e + 1)) * A (u + e + 1) := by ring
      exact Nat.le_of_mul_le_mul_right key h

/-- Spread inequality, first form: pulling the two indices apart by `d`
decreases the product. -/
private lemma spread (hpos : ∀ i, i ≤ p → 1 ≤ A i) (hzero : ∀ i, p < i → A i = 0)
    (hlc : ∀ i, A i * A (i + 2) ≤ A (i + 1) * A (i + 1)) :
    ∀ d w y, w + d ≤ y → A w * A (y + d) ≤ A (w + d) * A y := by
  intro d
  induction d with
  | zero => intro w y _; simp
  | succ d ih =>
    intro w y hwy
    have h1 : A w * A ((y + 1) + d) ≤ A (w + d) * A (y + 1) := ih w (y + 1) (by omega)
    have he : y = (w + d) + (y - (w + d)) := by omega
    have h2 := stepLem hpos hzero hlc (y - (w + d)) (w + d)
    rw [← he] at h2
    have hy : y + (d + 1) = (y + 1) + d := by omega
    have hw : w + (d + 1) = (w + d) + 1 := by omega
    rw [hy, hw]
    exact le_trans h1 h2

/-- Spread inequality, symmetric form.  This is the only consequence of
log-concavity used downstream. -/
private lemma spread2 (hpos : ∀ i, i ≤ p → 1 ≤ A i) (hzero : ∀ i, p < i → A i = 0)
    (hlc : ∀ i, A i * A (i + 2) ≤ A (i + 1) * A (i + 1)) :
    ∀ w d e, A w * A (w + d + e) ≤ A (w + d) * A (w + e) := by
  intro w d e
  rcases le_total d e with h | h
  · have h1 := spread hpos hzero hlc d w (w + e) (by omega)
    have h2 : w + e + d = w + d + e := by omega
    rwa [h2] at h1
  · have h1 := spread hpos hzero hlc e w (w + d) (by omega)
    calc A w * A (w + d + e) ≤ A (w + e) * A (w + d) := h1
      _ = A (w + d) * A (w + e) := Nat.mul_comm _ _

/-- Termwise ratio-domination inequality for the shifted kernel. -/
private lemma shiftTerm (hpos : ∀ i, i ≤ p → 1 ≤ A i) (hzero : ∀ i, p < i → A i = 0)
    (hlc : ∀ i, A i * A (i + 2) ≤ A (i + 1) * A (i + 1))
    (k l s t : ℕ) (hkl : k ≤ l) (hst : s < t) :
    shift A l s * shift A k t ≤ shift A k s * shift A l t := by
  by_cases htk : t ≤ k
  · have hsk : s ≤ k := by omega
    have hsl : s ≤ l := by omega
    have htl : t ≤ l := by omega
    simp only [shift, if_pos hsk, if_pos hsl, if_pos htk, if_pos htl]
    have e1 : k - s = (k - t) + (t - s) := by omega
    have e2 : l - t = (k - t) + (l - k) := by omega
    have e3 : l - s = (k - t) + (t - s) + (l - k) := by omega
    rw [e1, e2, e3]
    calc A ((k - t) + (t - s) + (l - k)) * A (k - t)
        = A (k - t) * A ((k - t) + (t - s) + (l - k)) := Nat.mul_comm _ _
      _ ≤ A ((k - t) + (t - s)) * A ((k - t) + (l - k)) :=
          spread2 hpos hzero hlc (k - t) (t - s) (l - k)
  · simp only [shift, if_neg htk, Nat.mul_zero, Nat.zero_le]

end LogConcave

/-! ### The up/down splitting of the increments of a unimodal sequence -/

/-- Forward increments of `B` up to the mode `m` (and `B 0` at index `0`). -/
private def up (m : ℕ) (B : ℕ → ℕ) (t : ℕ) : ℕ :=
  if t = 0 then B 0 else if t ≤ m then B t - B (t - 1) else 0

/-- Backward increments of `B` past the mode `m`. -/
private def dn (m : ℕ) (B : ℕ → ℕ) (t : ℕ) : ℕ :=
  if t = 0 then 0 else if m + 1 ≤ t then B (t - 1) - B t else 0

private lemma up_zero (m : ℕ) (B : ℕ → ℕ) : up m B 0 = B 0 := by simp [up]

private lemma dn_zero (m : ℕ) (B : ℕ → ℕ) : dn m B 0 = 0 := by simp [dn]

private lemma up_supp (m : ℕ) (B : ℕ → ℕ) : ∀ s, up m B s ≠ 0 → s ≤ m := by
  intro s hs
  rcases Nat.eq_zero_or_pos s with h | h
  · omega
  · by_contra hcon
    rw [up, if_neg (by omega), if_neg (by omega)] at hs
    exact hs rfl

private lemma dn_supp (m : ℕ) (B : ℕ → ℕ) : ∀ t, dn m B t ≠ 0 → m + 1 ≤ t := by
  intro t ht
  rcases Nat.eq_zero_or_pos t with h | h
  · rw [dn, if_pos h] at ht; exact absurd rfl ht
  · by_contra hcon
    rw [dn, if_neg (by omega), if_neg (by omega)] at ht
    exact ht rfl

/-- The subtraction-free increment identity: `B (n+1) + V (n+1) = B n + U (n+1)`. -/
private lemma up_dn_step (m : ℕ) (B : ℕ → ℕ)
    (hinc : ∀ n, n + 1 ≤ m → B n ≤ B (n + 1))
    (hdec : ∀ n, m ≤ n → B (n + 1) ≤ B n) :
    ∀ n, B (n + 1) + dn m B (n + 1) = B n + up m B (n + 1) := by
  intro n
  by_cases h : n + 1 ≤ m
  · have h1 := hinc n h
    rw [up, if_neg (by omega), if_pos h, dn, if_neg (by omega), if_neg (by omega)]
    simp only [Nat.add_sub_cancel]
    omega
  · have h2 := hdec n (by omega)
    rw [up, if_neg (by omega), if_neg h, dn, if_neg (by omega), if_pos (by omega)]
    simp only [Nat.add_sub_cancel]
    omega

/-! ### The convolved difference identity -/

private lemma conv_identity (A B U V : ℕ → ℕ)
    (h0 : B 0 + V 0 = U 0)
    (hstep : ∀ n, B (n + 1) + V (n + 1) = B n + U (n + 1)) (k : ℕ) :
    cnv A B (k + 1) + cnv A V (k + 1) = cnv A B k + cnv A U (k + 1) := by
  have hBk : cnv A B k = ∑ i ∈ range (k + 1 + 1), A i * (if i ≤ k then B (k - i) else 0) := by
    rw [Finset.sum_range_succ, if_neg (show ¬ (k + 1 ≤ k) by omega), Nat.mul_zero,
      Nat.add_zero]
    unfold cnv
    refine Finset.sum_congr rfl ?_
    intro i hi
    simp only [Finset.mem_range] at hi
    rw [if_pos (show i ≤ k by omega)]
  have e1 : cnv A B (k + 1) + cnv A V (k + 1)
      = ∑ i ∈ range (k + 1 + 1), (A i * B (k + 1 - i) + A i * V (k + 1 - i)) := by
    rw [Finset.sum_add_distrib]; rfl
  have e2 : (∑ i ∈ range (k + 1 + 1), A i * (if i ≤ k then B (k - i) else 0))
        + cnv A U (k + 1)
      = ∑ i ∈ range (k + 1 + 1),
          (A i * (if i ≤ k then B (k - i) else 0) + A i * U (k + 1 - i)) := by
    rw [Finset.sum_add_distrib]; rfl
  rw [hBk, e1, e2]
  refine Finset.sum_congr rfl ?_
  intro i hi
  simp only [Finset.mem_range] at hi
  by_cases hik : i ≤ k
  · rw [if_pos hik]
    have hn : k + 1 - i = (k - i) + 1 := by omega
    rw [hn]
    have hs := hstep (k - i)
    calc A i * B ((k - i) + 1) + A i * V ((k - i) + 1)
        = A i * (B ((k - i) + 1) + V ((k - i) + 1)) := by ring
      _ = A i * (B (k - i) + U ((k - i) + 1)) := by rw [hs]
      _ = A i * B (k - i) + A i * U ((k - i) + 1) := by ring
  · have hik2 : i = k + 1 := by omega
    subst hik2
    rw [if_neg hik]
    simp only [Nat.sub_self, Nat.mul_zero, Nat.zero_add]
    calc A (k + 1) * B 0 + A (k + 1) * V 0
        = A (k + 1) * (B 0 + V 0) := by ring
      _ = A (k + 1) * U 0 := by rw [h0]

/-! ### Ratio domination -/

private lemma ratio_dom {A : ℕ → ℕ} {p : ℕ}
    (hpos : ∀ i, i ≤ p → 1 ≤ A i) (hzero : ∀ i, p < i → A i = 0)
    (hlc : ∀ i, A i * A (i + 2) ≤ A (i + 1) * A (i + 1))
    (m : ℕ) (U V : ℕ → ℕ)
    (hU : ∀ s, U s ≠ 0 → s ≤ m) (hV : ∀ t, V t ≠ 0 → m + 1 ≤ t)
    (k l : ℕ) (hkl : k ≤ l) :
    cnv A U l * cnv A V k ≤ cnv A U k * cnv A V l := by
  rw [cnv_ext A U l l (le_refl l), cnv_ext A V k l hkl, cnv_ext A U k l hkl,
    cnv_ext A V l l (le_refl l), Finset.sum_mul_sum, Finset.sum_mul_sum]
  refine Finset.sum_le_sum ?_
  intro s _
  refine Finset.sum_le_sum ?_
  intro t _
  by_cases hs : U s = 0
  · simp [hs]
  by_cases ht : V t = 0
  · simp [ht]
  have hst : s < t := by
    have h1 := hU s hs
    have h2 := hV t ht
    omega
  calc (U s * shift A l s) * (V t * shift A k t)
      = (U s * V t) * (shift A l s * shift A k t) := by ring
    _ ≤ (U s * V t) * (shift A k s * shift A l t) :=
        Nat.mul_le_mul_left _ (shiftTerm hpos hzero hlc k l s t hkl hst)
    _ = (U s * shift A k s) * (V t * shift A l t) := by ring

/-- A purely arithmetic cross-multiplication contradiction over `Nat`. -/
private lemma nat_cross (P1 N1 P2 N2 : ℕ) (h1 : P1 < N1) (h2 : N2 < P2)
    (h3 : P2 * N1 ≤ P1 * N2) : False := by
  have a1 : (N2 + 1) * N1 ≤ P2 * N1 := Nat.mul_le_mul_right _ h2
  have a2 : (P1 + 1) * N2 ≤ N1 * N2 := Nat.mul_le_mul_right _ h1
  have a3 : N2 * N1 = N1 * N2 := Nat.mul_comm _ _
  rw [Nat.succ_mul] at a1 a2
  omega

/-! ### The abstract main theorem -/

private theorem main_abstract (p q : ℕ) (A B : ℕ → ℕ)
    (hpos : ∀ i, i ≤ p → 1 ≤ A i) (hzero : ∀ i, p < i → A i = 0)
    (hlc : ∀ i, A i * A (i + 2) ≤ A (i + 1) * A (i + 1))
    (m : ℕ) (hinc : ∀ n, n + 1 ≤ m → B n ≤ B (n + 1))
    (hdec : ∀ n, m ≤ n → B (n + 1) ≤ B n) :
    WeaklyUnimodal (p + q) (cnv A B) := by
  classical
  set U := up m B with hUdef
  set V := dn m B with hVdef
  have h0 : B 0 + V 0 = U 0 := by
    rw [hVdef, hUdef, dn_zero, up_zero]
    exact Nat.add_zero _
  have hstep := up_dn_step m B hinc hdec
  have hid : ∀ k, cnv A B (k + 1) + cnv A V (k + 1) = cnv A B k + cnv A U (k + 1) :=
    fun k => conv_identity A B U V h0 hstep k
  have hUs : ∀ s, U s ≠ 0 → s ≤ m := up_supp m B
  have hVs : ∀ t, V t ≠ 0 → m + 1 ≤ t := dn_supp m B
  by_cases hS : ∃ k, k ≤ p + q ∧ cnv A B (k + 1) < cnv A B k
  · refine ⟨Nat.find hS, (Nat.find_spec hS).1, ?_, ?_⟩
    · intro k hk
      have hmin := Nat.find_min hS hk
      have hkpq : k ≤ p + q := by
        have := (Nat.find_spec hS).1
        omega
      by_contra hc
      exact hmin ⟨hkpq, Nat.lt_of_not_le hc⟩
    · intro k hMk _
      set M := Nat.find hS with hMdef
      have hMd : cnv A B (M + 1) < cnv A B M := (Nat.find_spec hS).2
      have hPN : cnv A U (M + 1) < cnv A V (M + 1) := by
        have := hid M
        omega
      by_contra hcon
      have hcon' : cnv A B k < cnv A B (k + 1) := Nat.lt_of_not_le hcon
      have hNP : cnv A V (k + 1) < cnv A U (k + 1) := by
        have := hid k
        omega
      have hrd := ratio_dom hpos hzero hlc m U V hUs hVs (M + 1) (k + 1) (by omega)
      exact nat_cross _ _ _ _ hPN hNP hrd
  · refine ⟨p + q, le_refl _, ?_, fun k _ hk2 => absurd hk2 (by omega)⟩
    intro k hk
    by_contra hc
    exact hS ⟨k, by omega, Nat.lt_of_not_le hc⟩

/-! ### Bridging the statement-level convolution to `cnv` -/

private lemma conv_eq (p q : ℕ) (a b : ℕ → ℕ) (k : ℕ) :
    conv p q a b k = cnv (trunc p a) (trunc q b) k := by
  classical
  have inner : ∀ i, i ∈ range (p + 1) →
      (∑ j ∈ range (q + 1), if i + j = k then a i * b j else 0)
        = if i ≤ k then trunc p a i * trunc q b (k - i) else 0 := by
    intro i hi
    simp only [Finset.mem_range] at hi
    have hip : i ≤ p := by omega
    by_cases hik : i ≤ k
    · rw [if_pos hik]
      by_cases hjq : k - i ≤ q
      · rw [Finset.sum_eq_single (k - i)]
        · rw [if_pos (by omega)]
          simp only [trunc, if_pos hip, if_pos hjq]
        · intro j _ hne
          rw [if_neg (by omega)]
        · intro hmem
          exact absurd (Finset.mem_range.mpr (by omega)) hmem
      · rw [Finset.sum_eq_zero]
        · simp only [trunc, if_neg hjq, Nat.mul_zero]
        · intro j hj
          simp only [Finset.mem_range] at hj
          rw [if_neg (by omega)]
    · rw [if_neg hik, Finset.sum_eq_zero]
      intro j _
      rw [if_neg (by omega)]
  unfold conv
  rw [Finset.sum_congr rfl inner]
  have s1 : ∑ i ∈ range (p + 1), (if i ≤ k then trunc p a i * trunc q b (k - i) else 0)
      = ∑ i ∈ range (p + k + 1),
          (if i ≤ k then trunc p a i * trunc q b (k - i) else 0) := by
    have hsub : range (p + 1) ⊆ range (p + k + 1) :=
      Finset.range_subset_range.mpr (by omega)
    refine Finset.sum_subset hsub ?_
    intro x _ hx2
    simp only [Finset.mem_range, not_lt] at hx2
    have hx0 : trunc p a x = 0 := by simp only [trunc, if_neg (show ¬ x ≤ p by omega)]
    simp [hx0]
  have s2 : cnv (trunc p a) (trunc q b) k
      = ∑ i ∈ range (p + k + 1),
          (if i ≤ k then trunc p a i * trunc q b (k - i) else 0) := by
    unfold cnv
    have t1 : ∑ i ∈ range (k + 1), trunc p a i * trunc q b (k - i)
        = ∑ i ∈ range (k + 1),
            (if i ≤ k then trunc p a i * trunc q b (k - i) else 0) := by
      refine Finset.sum_congr rfl ?_
      intro i hi
      simp only [Finset.mem_range] at hi
      rw [if_pos (by omega)]
    rw [t1]
    have hsub : range (k + 1) ⊆ range (p + k + 1) :=
      Finset.range_subset_range.mpr (by omega)
    refine Finset.sum_subset hsub ?_
    intro x _ hx2
    simp only [Finset.mem_range, not_lt] at hx2
    rw [if_neg (by omega)]
  rw [s1, s2]

/-! ## The frozen target theorem -/

/--
**Erdos993R2C1.lc_conv_wu.**

Let `a = (a 0, …, a p)` and `b = (b 0, …, b q)` be finite sequences of natural
numbers.  Assume

* `hpos` : `a k ≥ 1` for every `0 ≤ k ≤ p`;
* `hlc`  : `a k * a (k+2) ≤ a (k+1) * a (k+1)` whenever `k + 2 ≤ p` — i.e.
  `a k * a k ≥ a (k-1) * a (k+1)` for every `1 ≤ k ≤ p - 1`;
* `hb`   : `b` is weakly unimodal on `0, …, q`.

Then the discrete convolution `conv p q a b`, i.e.
`c k = ∑_{i+j=k, 0 ≤ i ≤ p, 0 ≤ j ≤ q} a i * b j`, is weakly unimodal on
`0, …, p + q`.

Degenerate cases `p = 0`, `q = 0`, `b ≡ 0`, and arbitrary plateaus in `b` are
all covered: no positivity, strictness or nondegeneracy assumption is placed
on `b`, and `p`, `q` range over all of `ℕ`.
-/
theorem lc_conv_wu (p q : ℕ) (a b : ℕ → ℕ)
    (hpos : ∀ k, k ≤ p → 1 ≤ a k)
    (hlc : ∀ k, k + 2 ≤ p → a k * a (k + 2) ≤ a (k + 1) * a (k + 1))
    (hb : WeaklyUnimodal q b) :
    WeaklyUnimodal (p + q) (conv p q a b) := by
  classical
  obtain ⟨m, hmq, hbinc, hbdec⟩ := hb
  have hApos : ∀ i, i ≤ p → 1 ≤ trunc p a i := by
    intro i hi; simp only [trunc, if_pos hi]; exact hpos i hi
  have hAzero : ∀ i, p < i → trunc p a i = 0 := by
    intro i hi; simp only [trunc, if_neg (show ¬ i ≤ p by omega)]
  have hAlc : ∀ i, trunc p a i * trunc p a (i + 2)
      ≤ trunc p a (i + 1) * trunc p a (i + 1) := by
    intro i
    by_cases h : i + 2 ≤ p
    · simp only [trunc, if_pos (show i ≤ p by omega), if_pos h,
        if_pos (show i + 1 ≤ p by omega)]
      exact hlc i h
    · simp only [trunc, if_neg (show ¬ i + 2 ≤ p by omega), Nat.mul_zero, Nat.zero_le]
  have hBinc : ∀ n, n + 1 ≤ m → trunc q b n ≤ trunc q b (n + 1) := by
    intro n hn
    simp only [trunc, if_pos (show n ≤ q by omega), if_pos (show n + 1 ≤ q by omega)]
    exact hbinc n (by omega)
  have hBdec : ∀ n, m ≤ n → trunc q b (n + 1) ≤ trunc q b n := by
    intro n hn
    by_cases h : n + 1 ≤ q
    · simp only [trunc, if_pos (show n ≤ q by omega), if_pos h]
      exact hbdec n hn (by omega)
    · simp only [trunc, if_neg (show ¬ n + 1 ≤ q by omega), Nat.zero_le]
  obtain ⟨M, hM1, hM2, hM3⟩ :=
    main_abstract p q (trunc p a) (trunc q b) hApos hAzero hAlc m hBinc hBdec
  refine ⟨M, hM1, ?_, ?_⟩
  · intro k hk; rw [conv_eq, conv_eq]; exact hM2 k hk
  · intro k hk1 hk2; rw [conv_eq, conv_eq]; exact hM3 k hk1 hk2

end Erdos993R2C1
