import Mathlib

/-
R20C8-T3 — LEMMA A (L1 of `E993-PAIR-BROOM-DOMINATION`), AWARD-TRACK.
R20C9-T3 CLEAN RE-SHIP: this header replaces a fabricated charter
quotation struck by `R20C8-ADJ-T` RULING R-T3-06 (`CRIT-T3-U` MAJOR-1) —
the words "A_m = (1+x)^m Q" and "statement-faithful … L1 text" never
occur in `control/CYCLE8-ALLOCATION.md`. The allocation's actual T-3
cell (verbatim, the charge cell as quoted (opening label elided)): "the two mandatory lines + the
truncated third carried verbatim; the false docstring sentence and the
struck vacuity sentence repaired; the REF-4 distinguishing act is ON THE
C7 GATE RECORD (cite it); optionally a graph-faithful instance (a
concrete 2-vertex IndepUniv model from a real forest — strengthens but
is not required). Then: formalize Lemma A (award-track; elementary,
universal — the cleanest object the run has produced); the L2 restricted
Lemma B* WITH its hypothesis." The formula this file targets
(`A_{m,k} > A_{m,k-1}` for `1 <= k <= floor(m/2)`, `A_m = (1+x)^m Q`) is
this seat's own restatement of the registered `E993-PAIR-BROOM-
DOMINATION` L1 text, quoted verbatim in the STATEMENT FIDELITY block
below — it was never in the allocation and is not attributed there.

STATEMENT FIDELITY (verbatim, live registry, `E993-PAIR-BROOM-
DOMINATION`, `status: VERIFIED`, registry pin `03250a5b035bb71e…`, 77
   SUPERSESSION NOTE (r20 C9 terminal): the pin above is the C8-era
   03250a5b…/77-claim registry; C9's binding pin is 7a605065…/79. The
   quoted L1/L2 texts remain byte-identical to the live 79-claim rows;
   only the pin is stale.
claims):

> "L1 Lemma A (for any Q with Q(0)=1, Q_i >= 0: A_{m,k} > A_{m,k-1} for
> 1 <= k <= floor(m/2), hence p(A_m) >= floor(m/2) -> infinity; uses NO
> real-rootedness, log-concavity or unimodality of Q)."

DESIGN. `Q`'s coefficient sequence is `q : ℕ → ℤ` (no finite-degree
bound is needed for the inequality itself — see `convCoeff` below, whose
defining SUM is finite regardless of `q`'s support, exactly mirroring
the informal proof's own device "`C(n,j) := 0` outside `0 ≤ j ≤ n`",
here realized as natural-number range truncation instead of a negative-
index convention). `convCoeff q m k` is `((1+X)^m * Q).coeff k` when `q`
IS a genuine finite-support polynomial's coefficient function — the
connection to `Polynomial ℤ` is discharged separately
(`convCoeff_eq_poly_coeff`) so the headline theorem is stated once, at
the actual polynomial `A_m := (1+X)^m * Q` — this file's own restatement
of the L1 polynomial form (the string is not itself registry text).

EXACT INTEGERS THROUGHOUT (NOTATION PIN, exact Lean `Nat.choose` and
`ℤ`); no floating point anywhere in this file.
-/

namespace R20C8T3LemmaA

open Polynomial

/-- **THE KEY BINOMIAL STEP.** For `1 ≤ j` and `2j ≤ m`: `C(m,j) >
C(m,j-1)`, strictly. Derived from `Nat.choose_succ_right_eq` (Mathlib's
Pascal-ratio identity `C(m,k+1)*(k+1) = C(m,k)*(m-k)`) alone — no
external "classical" citation, matching the registered proof's own
elementary, self-contained character. -/
theorem choose_strict_mono {m j : ℕ} (hj : 1 ≤ j) (h2j : 2 * j ≤ m) :
    Nat.choose m (j - 1) < Nat.choose m j := by
  obtain ⟨k, rfl⟩ : ∃ k, j = k + 1 := ⟨j - 1, by omega⟩
  simp only [Nat.add_sub_cancel]
  have hid : Nat.choose m (k + 1) * (k + 1) = Nat.choose m k * (m - k) :=
    Nat.choose_succ_right_eq m k
  have hmk : k + 1 < m - k := by omega
  have hpos : 0 < Nat.choose m k := Nat.choose_pos (by omega)
  have hgt : Nat.choose m k * (k + 1) < Nat.choose m k * (m - k) :=
    mul_lt_mul_of_pos_left hmk hpos
  rw [← hid] at hgt
  exact lt_of_mul_lt_mul_right hgt (Nat.zero_le (k + 1))

/-- The nonstrict companion, needed only via `choose_strict_mono.le` in
practice, but recorded for clarity: `2j ≤ m → C(m,j-1) ≤ C(m,j)` for
`j ≥ 1` — immediate from the strict form. Also covers `j = 0`
trivially (`C(m,-1)` is not a term; callers case-split on `j`). -/
theorem choose_mono_of_le {m j : ℕ} (hj : 1 ≤ j) (h2j : 2 * j ≤ m) :
    Nat.choose m (j - 1) ≤ Nat.choose m j :=
  (choose_strict_mono hj h2j).le

/-- **`A_{m,k}`, DIRECTLY**: the coefficient-`k` formula for
`(1+X)^m * Q` where `q` is `Q`'s coefficient function. A finite sum
regardless of `q`'s support (terms past `q k`'s own range use
`Nat.choose` values that are irrelevant, but termination and finiteness
never depend on `q` vanishing anywhere). -/
def convCoeff (q : ℕ → ℤ) (m k : ℕ) : ℤ :=
  ∑ i ∈ Finset.range (k + 1), q i * (Nat.choose m (k - i) : ℤ)

/-- **LEMMA A, THE CORE INEQUALITY** (sequence form). For `q` with
`q 0 = 1`, `q i ≥ 0` for all `i`, and `1 ≤ k ≤ ⌊m/2⌋` (stated as
`2 * k ≤ m`, its exact equivalent for naturals): `convCoeff q m (k-1) <
convCoeff q m k`. Uses NO real-rootedness, log-concavity, or
unimodality of `q` — exactly the registered disclaimer, honoured by
inspection: neither hypothesis is anywhere in this proof's statement or
body. -/
theorem lemma_A_core {q : ℕ → ℤ} (hq0 : q 0 = 1) (hqnn : ∀ i, 0 ≤ q i)
    {m k : ℕ} (hk1 : 1 ≤ k) (hk2 : 2 * k ≤ m) :
    convCoeff q m (k - 1) < convCoeff q m k := by
  obtain ⟨n, rfl⟩ : ∃ n, k = n + 1 := ⟨k - 1, by omega⟩
  simp only [Nat.add_sub_cancel] at hk2 ⊢
  -- `convCoeff q m (n+1)`: peel the last term (i = n+1) from `range (n+2)`.
  have hA : convCoeff q m (n + 1)
      = (∑ i ∈ Finset.range (n + 1), q i * (Nat.choose m (n + 1 - i) : ℤ))
        + q (n + 1) * (Nat.choose m ((n + 1) - (n + 1)) : ℤ) := by
    unfold convCoeff
    exact Finset.sum_range_succ (fun i => q i * (Nat.choose m (n + 1 - i) : ℤ)) (n + 1)
  have hzero : (n + 1) - (n + 1) = 0 := by omega
  rw [hzero] at hA
  -- `convCoeff q m n`, already exactly a sum over `range (n+1)`.
  have hB : convCoeff q m n
      = ∑ i ∈ Finset.range (n + 1), q i * (Nat.choose m (n - i) : ℤ) := rfl
  have hsub : (∑ i ∈ Finset.range (n + 1), q i * (Nat.choose m (n + 1 - i) : ℤ))
      - (∑ i ∈ Finset.range (n + 1), q i * (Nat.choose m (n - i) : ℤ))
      = ∑ i ∈ Finset.range (n + 1),
          q i * ((Nat.choose m (n + 1 - i) : ℤ) - (Nat.choose m (n - i) : ℤ)) := by
    rw [← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl (fun x _ => (mul_sub (q x) _ _).symm)
  have hdiff : convCoeff q m (n + 1) - convCoeff q m n
      = q (n + 1) * (Nat.choose m 0 : ℤ)
        + ∑ i ∈ Finset.range (n + 1),
            q i * ((Nat.choose m (n + 1 - i) : ℤ) - (Nat.choose m (n - i) : ℤ)) := by
    rw [hA, hB]
    linarith [hsub]
  -- Every term of the sum is `≥ 0`; the `i = 0` term is `> 0`.
  have hterm_nonneg : ∀ i ∈ Finset.range (n + 1),
      0 ≤ q i * ((Nat.choose m (n + 1 - i) : ℤ) - (Nat.choose m (n - i) : ℤ)) := by
    intro i hi
    have hile : i ≤ n := Finset.mem_range_succ_iff.mp hi
    have hj1 : 1 ≤ n + 1 - i := by omega
    have hj2 : 2 * (n + 1 - i) ≤ m := by omega
    have hstep : Nat.choose m (n + 1 - i - 1) < Nat.choose m (n + 1 - i) :=
      choose_strict_mono hj1 hj2
    have hstep' : Nat.choose m (n - i) < Nat.choose m (n + 1 - i) := by
      have : n + 1 - i - 1 = n - i := by omega
      rwa [this] at hstep
    have hcast : (Nat.choose m (n - i) : ℤ) < (Nat.choose m (n + 1 - i) : ℤ) := by
      exact_mod_cast hstep'
    have : (0:ℤ) < (Nat.choose m (n + 1 - i) : ℤ) - (Nat.choose m (n - i) : ℤ) := by linarith
    exact mul_nonneg (hqnn i) this.le
  have hterm_pos : ∃ i ∈ Finset.range (n + 1),
      0 < q i * ((Nat.choose m (n + 1 - i) : ℤ) - (Nat.choose m (n - i) : ℤ)) := by
    refine ⟨0, Finset.mem_range.mpr (by omega), ?_⟩
    have hj1 : 1 ≤ n + 1 - (0:ℕ) := by omega
    have hj2 : 2 * (n + 1 - (0:ℕ)) ≤ m := by omega
    have hstep : Nat.choose m (n + 1 - (0:ℕ) - 1) < Nat.choose m (n + 1 - (0:ℕ)) :=
      choose_strict_mono hj1 hj2
    have hstep' : Nat.choose m (n - (0:ℕ)) < Nat.choose m (n + 1 - (0:ℕ)) := by
      have : n + 1 - (0:ℕ) - 1 = n - (0:ℕ) := by omega
      rwa [this] at hstep
    have hcast : (Nat.choose m (n - (0:ℕ)) : ℤ) < (Nat.choose m (n + 1 - (0:ℕ)) : ℤ) := by
      exact_mod_cast hstep'
    rw [hq0]
    have : (0:ℤ) < (Nat.choose m (n + 1 - (0:ℕ)) : ℤ) - (Nat.choose m (n - (0:ℕ)) : ℤ) := by
      linarith
    linarith
  have hsum_pos : 0 < ∑ i ∈ Finset.range (n + 1),
      q i * ((Nat.choose m (n + 1 - i) : ℤ) - (Nat.choose m (n - i) : ℤ)) :=
    Finset.sum_pos' hterm_nonneg hterm_pos
  have hq_last_nonneg : 0 ≤ q (n + 1) * (Nat.choose m 0 : ℤ) := by
    apply mul_nonneg (hqnn (n + 1))
    exact_mod_cast Nat.zero_le _
  have : 0 < convCoeff q m (n + 1) - convCoeff q m n := by
    rw [hdiff]; linarith
  linarith

/-- **THE GENUINE POLYNOMIAL CONNECTION**: `convCoeff` really does compute
`((1+X)^m * Q).coeff k` for an actual `Q : Polynomial ℤ`, matching this
file's own polynomial restatement `A_m := (1+x)^m Q` (unquoted; the
registry registers the coefficient inequality, not this string). Proved via `Polynomial.coeff_mul` (the
antidiagonal convolution formula), reindexed to `range (k+1)`
(`Finset.Nat.sum_antidiagonal_eq_sum_range_succ`), `(1+X)^m`'s
coefficients (`Polynomial.coeff_one_add_X_pow`), and a reflection of the
summation index (`Finset.sum_range_reflect`) to match `convCoeff`'s own
index convention (`q` increasing, `choose` decreasing) against the
convolution's natural one (`choose` increasing, `Q` decreasing). -/
theorem convCoeff_eq_poly_coeff (Q : Polynomial ℤ) (m k : ℕ) :
    ((1 + X) ^ m * Q).coeff k = convCoeff Q.coeff m k := by
  rw [Polynomial.coeff_mul]
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ
        (fun i j => ((1 + X) ^ m).coeff i * Q.coeff j) k]
  simp_rw [Polynomial.coeff_one_add_X_pow]
  rw [← Finset.sum_range_reflect (fun i => (Nat.choose m i : ℤ) * Q.coeff (k - i)) (k + 1)]
  unfold convCoeff
  apply Finset.sum_congr rfl
  intro j hj
  have hjk : j ≤ k := Nat.lt_succ_iff.mp (Finset.mem_range.mp hj)
  have h1 : k + 1 - 1 - j = k - j := by omega
  have h2 : k - (k - j) = j := by omega
  rw [h1, h2, mul_comm]

/-- **THE HEADLINE THEOREM, AT THE GENUINE POLYNOMIAL `A_m := (1+X)^m *
Q`.** Combines `lemma_A_core` with `convCoeff_eq_poly_coeff` — exactly
the registered inequality "`A_{m,k} > A_{m,k-1}` for `1 ≤ k ≤ ⌊m/2⌋`"
(E993-PAIR-BROOM-DOMINATION link L1), with the polynomial form
`A_m = (1+x)^m Q` stated unquoted as this file's own restatement, on an actual `Q : Polynomial ℤ` rather than only an
abstract coefficient sequence. -/
theorem lemma_A {Q : Polynomial ℤ} (hq0 : Q.coeff 0 = 1) (hqnn : ∀ i, 0 ≤ Q.coeff i)
    {m k : ℕ} (hk1 : 1 ≤ k) (hk2 : 2 * k ≤ m) :
    ((1 + X) ^ m * Q).coeff (k - 1) < ((1 + X) ^ m * Q).coeff k := by
  rw [convCoeff_eq_poly_coeff, convCoeff_eq_poly_coeff]
  exact lemma_A_core hq0 hqnn hk1 hk2

/-- **MODE LOWER BOUND, hence `p(A_m) → ∞`** (the registered corollary):
`convCoeff q m` is strictly increasing on `[0, ⌊m/2⌋]`, so no index
strictly before `⌊m/2⌋` can be a global maximizer of `A_m` — a strictly
larger value is always reached by index `⌊m/2⌋` itself, REGARDLESS of
`A_m`'s behaviour beyond that point (which this file makes no claim
about). This is the sequence-level content of "`p(A_m) ≥ ⌊m/2⌋`";
`⌊m/2⌋ → ∞` as `m → ∞` is immediate arithmetic, not restated as a
separate limit lemma. -/
theorem lemma_A_mono_to_half {q : ℕ → ℤ} (hq0 : q 0 = 1) (hqnn : ∀ i, 0 ≤ q i) (m i : ℕ) :
    ∀ j, i ≤ j → j ≤ m / 2 → convCoeff q m i ≤ convCoeff q m j := by
  intro j hij
  induction j, hij using Nat.le_induction with
  | base => intro _; exact le_refl _
  | succ n hn ih =>
    intro hnp1
    have hn' : n ≤ m / 2 := by omega
    have h2j : 2 * (n + 1) ≤ m := by omega
    have hstep := (lemma_A_core hq0 hqnn (m := m) (k := n + 1) (by omega) h2j)
    simp only [Nat.add_sub_cancel] at hstep
    exact (ih hn').trans hstep.le

/-- **THE MODE-STRICT-DOMINATION FORM** (no index before `⌊m/2⌋` ties or
beats it): for `j < ⌊m/2⌋`, `convCoeff q m j < convCoeff q m (m/2)` —
the exact sense in which `p(A_m) ≥ ⌊m/2⌋` at first-argmax (no earlier
index can be a leftmost maximizer, since a strictly larger value is
reached by `⌊m/2⌋`). -/
theorem lemma_A_no_early_argmax {q : ℕ → ℤ} (hq0 : q 0 = 1) (hqnn : ∀ i, 0 ≤ q i)
    (m : ℕ) {j : ℕ} (hj : j < m / 2) : convCoeff q m j < convCoeff q m (m / 2) := by
  have h2j : 2 * (j + 1) ≤ m := by omega
  have hstep := lemma_A_core hq0 hqnn (m := m) (k := j + 1) (by omega) h2j
  simp only [Nat.add_sub_cancel] at hstep
  have hrest : convCoeff q m (j + 1) ≤ convCoeff q m (m / 2) :=
    lemma_A_mono_to_half hq0 hqnn m (j + 1) (m / 2) (by omega) (by omega)
  exact hstep.trans_le hrest

/-- **NEGATIVE CONTROL, matching the registered receipt** (`control/
c7-registrar-verification.py`: "negative control: `Q=1-x` must fail at
`m=2`"): dropping `Q_i ≥ 0` breaks part (b) even at the smallest
nontrivial case. `Q = 1 - x` has `q 0 = 1`, `q 1 = -1` (violating
nonnegativity), and at `m = 2`, `k = 1` (`1 ≤ 1 ≤ ⌊2/2⌋ = 1`): `A_2 =
(1+X)^2(1-X) = [1,1,-1,-1]`, so `A_{2,1} = 1 = A_{2,0}` — the STRICT
inequality FAILS (own computation, exact integers; matches the receipt
exactly, "`A[1]>A[0]` … False, expected False"), confirming the
nonnegativity hypothesis is load-bearing here too. -/
def negControlQ : ℕ → ℤ
  | 0 => 1
  | 1 => -1
  | _ => 0

theorem negControl_hypothesis_needed :
    ¬ (convCoeff negControlQ 2 0 < convCoeff negControlQ 2 1) := by decide


