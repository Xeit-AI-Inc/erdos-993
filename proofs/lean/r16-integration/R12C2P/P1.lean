import Erdos993C8U1Base

open Erdos993C8U1
open scoped Classical
noncomputable section

theorem conv_coeff (a b : NNSeq) (n : ℤ) :
    (a * b).coeff n = ∑ k ∈ a.coeff.support, a.coeff k * b.coeff (n - k) := by
  classical
  rw [AddMonoidAlgebra.coeff_mul]
  rw [Finsupp.sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finsupp.sum]
  have hcond : ∀ a_1 : ℤ, (k + a_1 = n) ↔ (a_1 = n - k) := by intro a_1; omega
  simp only [hcond]
  rw [Finset.sum_ite_eq' b.coeff.support (n - k) (fun a_1 => a.coeff k * b.coeff a_1)]
  by_cases hmem : (n - k) ∈ b.coeff.support
  · simp [hmem]
  · simp only [Finsupp.mem_support_iff, not_not] at hmem
    simp [hmem]

theorem conv_coeff_swap (a b : NNSeq) (n : ℤ) :
    (a * b).coeff n = ∑ j ∈ b.coeff.support, b.coeff j * a.coeff (n - j) := by
  rw [mul_comm]; rw [conv_coeff]

theorem conv_coeff_swap_ext (a b : NNSeq) (n : ℤ) (K : Finset ℤ)
    (hK : b.coeff.support ⊆ K) :
    (a * b).coeff n = ∑ j ∈ K, b.coeff j * a.coeff (n - j) := by
  rw [conv_coeff_swap]
  apply Finset.sum_subset hK
  intro j _ hj
  simp only [Finsupp.mem_support_iff, not_not] at hj
  simp [hj]

def shiftBack : NNSeq := AddMonoidAlgebra.single (-1 : ℤ) (1 : NNRat)

theorem shiftBack_coeff (b : NNSeq) (j : ℤ) :
    (shiftBack * b).coeff j = b.coeff (j + 1) := by
  unfold shiftBack
  rw [AddMonoidAlgebra.coeff_single_mul_apply]
  simp only [one_mul]
  congr 1
  ring

theorem succ_via_shift (a b : NNSeq) (n : ℤ) :
    (a * b).coeff (n + 1) = (a * (shiftBack * b)).coeff n := by
  have h1 : a * (shiftBack * b) = shiftBack * (a * b) := by
    rw [← mul_assoc, mul_comm a shiftBack, mul_assoc]
  rw [h1, shiftBack_coeff]

theorem conv_coeff_pair (a b : NNSeq) (n : ℤ) (K : Finset ℤ)
    (hK1 : b.coeff.support ⊆ K) (hK2 : (shiftBack * b).coeff.support ⊆ K) :
    (a * b).coeff n = ∑ j ∈ K, b.coeff j * a.coeff (n - j) ∧
    (a * b).coeff (n + 1) = ∑ j ∈ K, b.coeff (j + 1) * a.coeff (n - j) := by
  constructor
  · exact conv_coeff_swap_ext a b n K hK1
  · rw [succ_via_shift]
    rw [conv_coeff_swap_ext a (shiftBack * b) n K hK2]
    apply Finset.sum_congr rfl
    intro j _
    rw [shiftBack_coeff]

/-! ## Unimodal, for `NNSeq` -/

/-- A `NNSeq` is (weakly) unimodal when it is non-decreasing up to some
mode `m` and non-increasing from `m` onward. Since `NNRat` is already
nonnegative and `NNSeq` is finitely supported by construction, this is
exactly the informal notion "nonnegative, finitely-supported, rises then
falls" at this scope. Invariance: the choice of witnessing `m` is not
unique in general (any point in a plateau at the maximum works), but the
PROPERTY `Unimodal b` does not depend on which witness is exhibited. -/
def Unimodal (b : NNSeq) : Prop :=
  ∃ m : ℤ, (∀ i : ℤ, i < m → b.coeff i ≤ b.coeff (i + 1)) ∧
           (∀ i : ℤ, m ≤ i → b.coeff (i + 1) ≤ b.coeff i)

theorem Unimodal.zero : Unimodal (0 : NNSeq) := by
  refine ⟨0, ?_, ?_⟩ <;> intro i _ <;> simp

/-! ## The rational-valued difference decomposition `d_n = U(n) - V(n)` -/

section Core
variable (a b : NNSeq) (m : ℤ)

def Kset : Finset ℤ := b.coeff.support ∪ (shiftBack * b).coeff.support

theorem sub_Kset : b.coeff.support ⊆ Kset b := Finset.subset_union_left
theorem sub_Kset' : (shiftBack * b).coeff.support ⊆ Kset b := Finset.subset_union_right

noncomputable def Uw (n : ℤ) : ℚ :=
  ∑ j ∈ (Kset b).filter (· < m), ((b.coeff (j + 1) : ℚ) - (b.coeff j : ℚ)) * (a.coeff (n - j) : ℚ)

noncomputable def Vw (n : ℤ) : ℚ :=
  ∑ j ∈ (Kset b).filter (m ≤ ·), ((b.coeff j : ℚ) - (b.coeff (j + 1) : ℚ)) * (a.coeff (n - j) : ℚ)

theorem dn_eq (n : ℤ) :
    ((a * b).coeff (n + 1) : ℚ) - ((a * b).coeff n : ℚ) = Uw a b m n - Vw a b m n := by
  obtain ⟨hcn, hcn1⟩ := conv_coeff_pair a b n (Kset b) (sub_Kset b) (sub_Kset' b)
  have hcnQ : ((a * b).coeff n : ℚ) = ∑ j ∈ Kset b, (b.coeff j : ℚ) * (a.coeff (n - j) : ℚ) := by
    rw [hcn]; push_cast; ring
  have hcn1Q : ((a * b).coeff (n + 1) : ℚ)
      = ∑ j ∈ Kset b, (b.coeff (j + 1) : ℚ) * (a.coeff (n - j) : ℚ) := by
    rw [hcn1]; push_cast; ring
  rw [hcnQ, hcn1Q]
  unfold Uw Vw
  rw [← Finset.sum_filter_add_sum_filter_not (Kset b) (· < m)
      (fun j => (b.coeff (j + 1) : ℚ) * (a.coeff (n - j) : ℚ))]
  rw [← Finset.sum_filter_add_sum_filter_not (Kset b) (· < m)
      (fun j => (b.coeff j : ℚ) * (a.coeff (n - j) : ℚ))]
  have hnot : ∀ j : ℤ, ¬ (j < m) ↔ m ≤ j := by intro j; omega
  simp only [hnot]
  have eU : ∀ j : ℤ, ((b.coeff (j + 1) : ℚ) - (b.coeff j : ℚ)) * (a.coeff (n - j) : ℚ)
      = (b.coeff (j + 1) : ℚ) * (a.coeff (n - j) : ℚ) - (b.coeff j : ℚ) * (a.coeff (n - j) : ℚ) := by
    intro j; ring
  have eV : ∀ j : ℤ, ((b.coeff j : ℚ) - (b.coeff (j + 1) : ℚ)) * (a.coeff (n - j) : ℚ)
      = (b.coeff j : ℚ) * (a.coeff (n - j) : ℚ) - (b.coeff (j + 1) : ℚ) * (a.coeff (n - j) : ℚ) := by
    intro j; ring
  simp only [eU, eV, Finset.sum_sub_distrib]
  ring

theorem Uw_nonneg (hb : ∀ i : ℤ, i < m → b.coeff i ≤ b.coeff (i + 1)) (n : ℤ) :
    0 ≤ Uw a b m n := by
  unfold Uw
  apply Finset.sum_nonneg
  intro j hj
  simp only [Finset.mem_filter] at hj
  have h1 : (b.coeff j : ℚ) ≤ (b.coeff (j + 1) : ℚ) := by exact_mod_cast hb j hj.2
  have h2 : (0 : ℚ) ≤ (a.coeff (n - j) : ℚ) := by exact_mod_cast (a.coeff (n - j)).2
  nlinarith

theorem Vw_nonneg (hb : ∀ i : ℤ, m ≤ i → b.coeff (i + 1) ≤ b.coeff i) (n : ℤ) :
    0 ≤ Vw a b m n := by
  unfold Vw
  apply Finset.sum_nonneg
  intro j hj
  simp only [Finset.mem_filter] at hj
  have h1 : (b.coeff (j + 1) : ℚ) ≤ (b.coeff j : ℚ) := by exact_mod_cast hb j hj.2
  have h2 : (0 : ℚ) ≤ (a.coeff (n - j) : ℚ) := by exact_mod_cast (a.coeff (n - j)).2
  nlinarith

/-- **The key rearrangement inequality**, the sole place `Toeplitz2 a` is
used, and used exactly once per pair `(j, j')`, `j < m ≤ j'`. -/
theorem UV_cross (hToep : Toeplitz2 a)
    (hbUp : ∀ i : ℤ, i < m → b.coeff i ≤ b.coeff (i + 1))
    (hbDown : ∀ i : ℤ, m ≤ i → b.coeff (i + 1) ≤ b.coeff i)
    (n1 n2 : ℤ) (hn : n1 < n2) :
    Uw a b m n2 * Vw a b m n1 ≤ Uw a b m n1 * Vw a b m n2 := by
  unfold Uw Vw
  rw [Finset.sum_mul_sum, Finset.sum_mul_sum]
  apply Finset.sum_le_sum
  intro j hj
  apply Finset.sum_le_sum
  intro j' hj'
  simp only [Finset.mem_filter] at hj hj'
  have hjj' : j < j' := lt_of_lt_of_le hj.2 hj'.2
  have hToe := hToep j j' n1 n2 hjj' hn
  have hToeQ : (a.coeff (n2 - j) : ℚ) * (a.coeff (n1 - j') : ℚ)
      ≤ (a.coeff (n1 - j) : ℚ) * (a.coeff (n2 - j') : ℚ) := by exact_mod_cast hToe
  have hb1 : (0 : ℚ) ≤ (b.coeff (j + 1) : ℚ) - (b.coeff j : ℚ) := by
    have h := hbUp j hj.2
    have h' : (b.coeff j : ℚ) ≤ (b.coeff (j + 1) : ℚ) := by exact_mod_cast h
    linarith
  have hb2 : (0 : ℚ) ≤ (b.coeff j' : ℚ) - (b.coeff (j' + 1) : ℚ) := by
    have h := hbDown j' hj'.2
    have h' : (b.coeff (j' + 1) : ℚ) ≤ (b.coeff j' : ℚ) := by exact_mod_cast h
    linarith
  have hprod : (0 : ℚ) ≤ ((b.coeff (j + 1) : ℚ) - (b.coeff j : ℚ)) *
      ((b.coeff j' : ℚ) - (b.coeff (j' + 1) : ℚ)) := mul_nonneg hb1 hb2
  nlinarith [mul_le_mul_of_nonneg_left hToeQ hprod]

/-- **No down-up pair.** With `Toeplitz2 a` and `Unimodal b` witnessed at
`m`, the difference sequence of `a*b` cannot dip below zero at `n1` and
later rise above zero at `n2 > n1`. -/
theorem no_down_up (hToep : Toeplitz2 a)
    (hbUp : ∀ i : ℤ, i < m → b.coeff i ≤ b.coeff (i + 1))
    (hbDown : ∀ i : ℤ, m ≤ i → b.coeff (i + 1) ≤ b.coeff i)
    (n1 n2 : ℤ) (hn : n1 < n2) :
    ¬ (((a * b).coeff (n1 + 1) : ℚ) < (a * b).coeff n1 ∧
       ((a * b).coeff n2 : ℚ) < (a * b).coeff (n2 + 1)) := by
  rintro ⟨h1, h2⟩
  have e1 := dn_eq a b m n1
  have e2 := dn_eq a b m n2
  have hU1nn := Uw_nonneg a b m hbUp n1
  have hV1nn := Vw_nonneg a b m hbDown n1
  have hU2nn := Uw_nonneg a b m hbUp n2
  have hV2nn := Vw_nonneg a b m hbDown n2
  have hcross := UV_cross a b m hToep hbUp hbDown n1 n2 hn
  have hVw1pos : 0 < Vw a b m n1 := by nlinarith
  have hUw2pos : 0 < Uw a b m n2 := by nlinarith
  have hprodpos : 0 < Uw a b m n1 * Vw a b m n2 := by nlinarith
  have hUw1pos : 0 < Uw a b m n1 := by
    rcases hU1nn.lt_or_eq with h | h
    · exact h
    · exfalso; rw [← h, zero_mul] at hprodpos; exact lt_irrefl 0 hprodpos
  have hVw2pos : 0 < Vw a b m n2 := by
    rcases hV2nn.lt_or_eq with h | h
    · exact h
    · exfalso; rw [← h, mul_zero] at hprodpos; exact lt_irrefl 0 hprodpos
  nlinarith [mul_pos hUw2pos hVw1pos, mul_pos hUw1pos hVw2pos]

end Core

/-! ## From "no down-up pair" to `Unimodal` -/

theorem step_chain (f : ℤ → ℚ) (n0 : ℤ) (k : ℕ)
    (h : ∀ j : ℕ, j < k → f (n0 + j + 1) ≤ f (n0 + j)) :
    f (n0 + k) ≤ f n0 := by
  induction k with
  | zero => simp
  | succ k ih =>
      have hk : f (n0 + k + 1) ≤ f (n0 + k) := h k (by omega)
      have hprev : f (n0 + (k : ℤ)) ≤ f n0 := ih (fun j hj => h j (by omega))
      have hcast : (n0 + ((k : ℕ) + 1 : ℕ) : ℤ) = n0 + (k : ℤ) + 1 := by push_cast; ring
      rw [hcast]
      exact le_trans hk hprev

theorem step_chain' (f : ℤ → ℚ) (n0 : ℤ) (k : ℕ)
    (h : ∀ j : ℕ, j < k → f (n0 + j) ≤ f (n0 + j + 1)) :
    f n0 ≤ f (n0 + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
      have hk : f (n0 + k) ≤ f (n0 + k + 1) := h k (by omega)
      have hprev : f n0 ≤ f (n0 + (k : ℤ)) := ih (fun j hj => h j (by omega))
      have hcast : (n0 + ((k : ℕ) + 1 : ℕ) : ℤ) = n0 + (k : ℤ) + 1 := by push_cast; ring
      rw [hcast]
      exact le_trans hprev hk

/-- **Existence of a mode.** Any `NNSeq` whose consecutive-difference
sequence never dips below zero and later rises above zero (in the
`no_down_up` sense) is `Unimodal`: take the mode at (any) global maximizer
of the finite support, then show monotonicity on each side by
contradiction, converting a hypothetical bad step into either a direct
"down-up" pair or a telescoped inequality that beats the global maximum. -/
theorem unimodal_of_no_down_up (c : NNSeq)
    (hndu : ∀ n1 n2 : ℤ, n1 < n2 →
      ¬ (((c.coeff (n1 + 1) : ℚ) < c.coeff n1) ∧ ((c.coeff n2 : ℚ) < c.coeff (n2 + 1)))) :
    Unimodal c := by
  by_cases hS : c.coeff.support.Nonempty
  · obtain ⟨mstar, hmstarS, hmstarmax⟩ :=
      Finset.exists_max_image c.coeff.support (fun n => (c.coeff n : ℚ)) hS
    have hglobal : ∀ n : ℤ, (c.coeff n : ℚ) ≤ (c.coeff mstar : ℚ) := by
      intro n
      by_cases hn : n ∈ c.coeff.support
      · exact hmstarmax n hn
      · simp only [Finsupp.mem_support_iff, not_not] at hn
        rw [hn]
        exact_mod_cast (c.coeff mstar).2
    refine ⟨mstar, ?_, ?_⟩
    · intro i hi
      by_contra hcon
      push Not at hcon
      have hcon' : (c.coeff (i + 1) : ℚ) < (c.coeff i : ℚ) := by exact_mod_cast hcon
      by_cases hex : ∃ n2, i < n2 ∧ (c.coeff n2 : ℚ) < c.coeff (n2 + 1)
      · obtain ⟨n2, hin2, hn2⟩ := hex
        exact hndu i n2 hin2 ⟨hcon', hn2⟩
      · push Not at hex
        set k : ℕ := (mstar - (i + 1)).toNat with hk
        have hkcast : (i + 1) + (k : ℤ) = mstar := by
          have : mstar - (i + 1) ≥ 0 := by omega
          simp only [hk]
          omega
        have hchain : ∀ j : ℕ, j < k →
            (c.coeff (i + 1 + j + 1) : ℚ) ≤ (c.coeff (i + 1 + j) : ℚ) := by
          intro j hj
          have hgt : i < i + 1 + j := by omega
          exact hex (i + 1 + j) hgt
        have hres := step_chain (fun n => (c.coeff n : ℚ)) (i + 1) k hchain
        rw [hkcast] at hres
        have hfin : (c.coeff mstar : ℚ) ≤ (c.coeff (i + 1) : ℚ) := hres
        linarith [hglobal i]
    · intro i hi
      by_contra hcon
      push Not at hcon
      have hcon' : (c.coeff i : ℚ) < (c.coeff (i + 1) : ℚ) := by exact_mod_cast hcon
      by_cases hex : ∃ n1, n1 < i ∧ (c.coeff (n1 + 1) : ℚ) < c.coeff n1
      · obtain ⟨n1, hn1i, hn1⟩ := hex
        exact hndu n1 i hn1i ⟨hn1, hcon'⟩
      · push Not at hex
        set k : ℕ := (i - mstar).toNat with hk
        have hkcast : mstar + (k : ℤ) = i := by
          have : i - mstar ≥ 0 := by omega
          simp only [hk]; omega
        have hchain : ∀ j : ℕ, j < k →
            (c.coeff (mstar + j) : ℚ) ≤ (c.coeff (mstar + j + 1) : ℚ) := by
          intro j hj
          have hlt : mstar + (j : ℤ) < i := by omega
          exact hex (mstar + j) hlt
        have hres := step_chain' (fun n => (c.coeff n : ℚ)) mstar k hchain
        rw [hkcast] at hres
        have hgi1 : (c.coeff (i + 1) : ℚ) ≤ (c.coeff mstar : ℚ) := hglobal (i + 1)
        linarith
  · simp only [Finset.not_nonempty_iff_eq_empty, Finsupp.support_eq_empty] at hS
    refine ⟨0, ?_, ?_⟩ <;> intro i _ <;> rw [hS] <;> rfl

/-! ## P1-NNSeq -/

/-- **P1-NNSeq**, exactly RULING 4 of `FC-R12-3`: the convolution of a
nonzero TRS2 sequence with a weakly unimodal nonnegative finitely-supported
sequence is weakly unimodal. Attribution per `FC-R12-3` condition 3: *the
discrete strong-unimodality theorem attributed to Keilson–Gerber (1971);
statement verified against Saumard–Wellner (2014); primary text
unconfirmed.* No step below cites the 1971 paper's method. -/
theorem P1_NNSeq (a b : NNSeq) (ha : TRS2 a) (hb : Unimodal b) : Unimodal (a * b) := by
  rcases ha with h0 | ⟨_hInterval, hToep⟩
  · rw [h0, zero_mul]; exact Unimodal.zero
  · obtain ⟨m, hbUp, hbDown⟩ := hb
    apply unimodal_of_no_down_up
    intro n1 n2 hn
    exact no_down_up a b m hToep hbUp hbDown n1 n2 hn

#print axioms P1_NNSeq

/-! ## Domain-exclusion corroboration (not on `P1_NNSeq`'s critical path)

`FC-R12-4`'s "P1 (control 3)" verdict records a counterexample to the BARE
termwise reading of log-concavity: `(1,0,0,1) ⋆ (1,1) = (1,1,0,1,1)`, which
falls to `0` then rises, hence is not unimodal. `P1_NNSeq` above is stated
for `TRS2`, not bare termwise log-concavity; the lemmas below confirm, by an
independent Lean computation, that the witness sequence `(1,0,0,1)` is
excluded from `TRS2`'s domain (it fails `PositiveIntervalSupport`, having a
zero gap between two positive coefficients), so the counterexample gate does
not apply to the statement actually formalized. -/

/-- The witness sequence `(1,0,0,1)` on support `{0,3}`
(`control/WITNESS-REGISTRY.md` row 3 / A16 row 20 of `C1-SYNTHESIS.md`), as
an `NNSeq`. -/
noncomputable def witnessA : NNSeq :=
  AddMonoidAlgebra.single (0 : ℤ) (1 : NNRat) + AddMonoidAlgebra.single (3 : ℤ) (1 : NNRat)

theorem witnessA_coeff (k : ℤ) :
    witnessA.coeff k = (AddMonoidAlgebra.single (0 : ℤ) (1 : NNRat)).coeff k
      + (AddMonoidAlgebra.single (3 : ℤ) (1 : NNRat)).coeff k := by
  unfold witnessA
  rw [AddMonoidAlgebra.coeff_add]
  rfl

theorem witnessA_coeff0 : witnessA.coeff 0 = 1 := by
  rw [witnessA_coeff, AddMonoidAlgebra.coeff_single, AddMonoidAlgebra.coeff_single]; simp

theorem witnessA_coeff1 : witnessA.coeff 1 = 0 := by
  rw [witnessA_coeff, AddMonoidAlgebra.coeff_single, AddMonoidAlgebra.coeff_single]; simp

theorem witnessA_coeff3 : witnessA.coeff 3 = 1 := by
  rw [witnessA_coeff, AddMonoidAlgebra.coeff_single, AddMonoidAlgebra.coeff_single]; simp

theorem witnessA_not_PIS : ¬ PositiveIntervalSupport witnessA := by
  rintro ⟨l, u, hlu, hsupp⟩
  have h0 : l ≤ 0 ∧ 0 ≤ u := (hsupp 0).mp (by rw [witnessA_coeff0]; norm_num)
  have h3 : l ≤ 3 ∧ 3 ≤ u := (hsupp 3).mp (by rw [witnessA_coeff3]; norm_num)
  have h1 : 0 < witnessA.coeff 1 := (hsupp 1).mpr ⟨by omega, by omega⟩
  rw [witnessA_coeff1] at h1
  exact lt_irrefl 0 h1

theorem witnessA_ne_zero : witnessA ≠ 0 := by
  intro h
  have heq : witnessA.coeff 0 = (0 : NNSeq).coeff 0 := by rw [h]
  rw [witnessA_coeff0] at heq
  simp at heq

theorem witnessA_not_TRS2 : ¬ TRS2 witnessA := by
  rintro (h0 | ⟨hpis, _⟩)
  · exact witnessA_ne_zero h0
  · exact witnessA_not_PIS hpis

#print axioms witnessA_not_TRS2
