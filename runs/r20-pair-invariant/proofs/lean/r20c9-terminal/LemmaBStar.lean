import Mathlib

/-
R20C8-T3 — LEMMA B* (L2 of `E993-PAIR-BROOM-DOMINATION`), WITH ITS
HYPOTHESIS. R20C9-T3 CLEAN RE-SHIP: this header replaces a fabricated
charter quotation struck by `R20C8-ADJ-T` RULING R-T3-06 (`CRIT-T3-U`
MAJOR-1) — the phrases "first-argmax((1+x)a)", "counter-witness
a=[3,5,0,7]", and "load-bearing" never occur in `control/
CYCLE8-ALLOCATION.md`. The allocation's actual T-3 cell says only, of
this object: "…the L2 restricted Lemma B* WITH its hypothesis." (the
final clause of the T-3 cell, quoted in full at `LemmaA.lean`'s header).
The parenthetical detail below (weakly unimodal nonneg a, a_0 > 0:
first-argmax((1+x)a) >= first-argmax(a); the hypothesis is load-bearing
— counter-witness a=[3,5,0,7] on the C7 gate face) is this seat's own
restatement of the registered `E993-PAIR-BROOM-DOMINATION` L2 text,
quoted verbatim in the STATEMENT FIDELITY block below — it was never in
the allocation and is not attributed there.

STATEMENT FIDELITY (verbatim, live registry, `E993-PAIR-BROOM-
DOMINATION`, `status: VERIFIED`, registry pin `03250a5b035bb71e…`, 77
   SUPERSESSION NOTE (r20 C9 terminal): the pin above is the C8-era
   03250a5b…/77-claim registry; C9's binding pin is 7a605065…/79. The
   quoted L1/L2 texts remain byte-identical to the live 79-claim rows;
   only the pin is stale.
claims):

> "L2 Lemma B* WITH HYPOTHESIS (for nonnegative WEAKLY UNIMODAL a with
> a_0 > 0: p((1+x)a) >= p(a) at first-argmax — the hypothesis is
> LOAD-BEARING: a=[3,5,0,7] gives p=3 -> p=1, registrar counter-witness
> at the C7 gate)."

NOTATION RECONCILIATION, DISCLOSED ON THE FACE (not silently resolved).
Two DIFFERENT formulas for "first-argmax" `p` are live in this run's own
sealed materials: `R20C7-ADJ-T` §0.3 states `p(S) := min{k : S_{k+1} ≤
S_k}`; `control/c7-registrar-verification.py` line 10 — the ACTUAL CODE
that produced the registered counter-witness receipt — computes
`first_argmax(a) = max(range(len(a)), key=lambda i: (a[i], -i))`, i.e.
the LEFTMOST index of the GLOBAL maximum value.

**R20C9-T3 CLEAN RE-SHIP — CORRECTED CONVENTION CLAIM.** The C8 face of
this file asserted the two rules "COINCIDE whenever `a` is weakly
unimodal … but DIVERGE on non-unimodal input." That sentence is FALSE
and is STRUCK, per `R20C8-ADJ-T` RULING R-T3-04 (`CRIT-T3-F` MAJOR-1,
sustained and strengthened): witness `t=[1,1,2]` is weakly unimodal
(turning point `p=2`) yet the two rules disagree (leftmost-max gives
`2`; the `S_{k+1}≤S_k` rule fires at `k=0`). `R20C8-ADJ-T`'s exhaustive
scan of every weakly-unimodal nonnegative integer sequence with
`len ≤ 5`, values `0..4`, `a₀ > 0` found **202 of 790** such sequences
(25.6%) where the two conventions diverge — the honest sentence:
**the two conventions diverge on plateau-before-mode sequences**
(`R20C8-ADJ-T`'s NC-ADJT-1: divergence occurs exactly when the sequence
has a plateau strictly BEFORE its mode, which the `S_{k+1}≤S_k` rule
mistakes for the mode itself). `firstArgmax_le_turningPoint` below
proves only `k ≤ p` (true, and all this file's proof uses); it does not
itself certify which convention is in force off unimodal input, and no
such claim is made here.

Checked directly on the registered counter-witness `a=[3,5,0,7]` (own
computation, this seat, exact integers, `decide`-verified below): under
the `S_{k+1}≤S_k` rule, `p(a)=1` and `p((1+x)a)=1` — NO violation
(`1≥1`). Under the leftmost-max-index rule, `p(a)=3` and `p((1+x)a)=1`
— a genuine violation (`1<3`), EXACTLY matching the registered receipt.
**This file adopts the leftmost-max-index convention** (`IsFirstArgmax`
below), because it is the convention that actually PRODUCED the
registered certificate and the counter-witness this lemma's hypothesis
is charted against; the divergence between the run's two sealed prose
conventions is flagged as a compliance observation on the face document
(`R20C8-T3.md` §6), not silently resolved here.

EXACT INTEGERS THROUGHOUT (NOTATION PIN); no floating point anywhere.
-/

namespace R20C8T3LemmaBStar

/-- **`k` IS THE FIRST-ARGMAX of `a` on `[0,d]`** (leftmost index of the
maximum value, matching `control/c7-registrar-verification.py`'s
`first_argmax`). A relation, not a computable function: the theorem
below is proved for an arbitrary witness of this predicate (it has at
most one witness for given `(d,a)`, though uniqueness is never invoked).
(1) in range; (2) dominates every value on `[0,d]`; (3) reached
STRICTLY — every earlier index has a strictly smaller value, which is
exactly what rules out `k` being a non-leftmost tie. -/
def IsFirstArgmax (d : ℕ) (a : ℕ → ℤ) (k : ℕ) : Prop :=
  k ≤ d ∧ (∀ j, j ≤ d → a j ≤ a k) ∧ (∀ j, j < k → a j < a k)

/-- **WEAKLY UNIMODAL on `[0,d]`**: nondecreasing up to a turning point
`p ≤ d`, nonincreasing from `p` to `d`. Plateaus allowed on both sides —
the registered hypothesis's own notion, no stronger. -/
def WeaklyUnimodal (d : ℕ) (a : ℕ → ℤ) : Prop :=
  ∃ p ≤ d, (∀ i, i < p → a i ≤ a (i + 1)) ∧ (∀ i, p ≤ i → i < d → a (i + 1) ≤ a i)

/-- `(1+x)·a`'s coefficient sequence, exactly: `b 0 = a 0`,
`b (i+1) = a (i+1) + a i`. Matches `Polynomial.coeff_mul` for
`(1+X) * A` when `a` is `A`'s coefficient function — reproduced directly
on `ℕ → ℤ`, no `Polynomial` machinery needed for this elementary a
statement (matching the charge's "elementary, universal" framing for
this lane's sibling Lemma A). -/
def shiftAdd (a : ℕ → ℤ) : ℕ → ℤ
  | 0 => a 0
  | (i + 1) => a (i + 1) + a i

/-- A sequence that is nondecreasing on every adjacent pair below `p` is
nondecreasing on the whole range `[0,p]` — the transitive closure of
`WeaklyUnimodal`'s first clause. Standard `Nat.le_induction`. -/
theorem mono_of_adjacent_le {a : ℕ → ℤ} {p : ℕ}
    (hmono : ∀ i, i < p → a i ≤ a (i + 1)) (i : ℕ) :
    ∀ j, i ≤ j → j ≤ p → a i ≤ a j := by
  intro j hij
  induction j, hij using Nat.le_induction with
  | base => intro _; exact le_refl _
  | succ n hn ih =>
    intro hnp1
    have hnp : n < p := by omega
    exact (ih (by omega)).trans (hmono n hnp)

/-- Dually, a sequence that is nonincreasing on every adjacent pair from
`p` to `d` is nonincreasing over any offset from a base point `i ≥ p`
that stays within `[p,d]`. Induction on the offset `n`. -/
theorem anti_of_adjacent_le_offset {a : ℕ → ℤ} {p d : ℕ}
    (hanti : ∀ i, p ≤ i → i < d → a (i + 1) ≤ a i) :
    ∀ n i, p ≤ i → i + n ≤ d → a (i + n) ≤ a i := by
  intro n
  induction n with
  | zero => intro i _ _; simp
  | succ m ih =>
    intro i hpi hind
    have h1 : a (i + m) ≤ a i := ih i hpi (by omega)
    have h2 : a (i + (m + 1)) ≤ a (i + m) := hanti (i + m) (by omega) (by omega)
    exact h2.trans h1

/-- Corollary, in the `[p,d]`-interval form matching `mono_of_adjacent_le`'s
shape: for `p ≤ i ≤ j ≤ d`, `a j ≤ a i`. -/
theorem anti_of_adjacent_le {a : ℕ → ℤ} {p d : ℕ}
    (hanti : ∀ i, p ≤ i → i < d → a (i + 1) ≤ a i) (j : ℕ) (hjd : j ≤ d) :
    ∀ i, p ≤ i → i ≤ j → a j ≤ a i := by
  intro i hpi hij
  have h := anti_of_adjacent_le_offset hanti (j - i) i hpi (by omega)
  have hji : i + (j - i) = j := by omega
  rwa [hji] at h

/-- The two definitional equations of `shiftAdd`, exposed as rewrite
lemmas (both `rfl`, since `shiftAdd` is a direct pattern match). -/
theorem shiftAdd_zero (a : ℕ → ℤ) : shiftAdd a 0 = a 0 := rfl
theorem shiftAdd_succ (a : ℕ → ℤ) (i : ℕ) : shiftAdd a (i + 1) = a (i + 1) + a i := rfl

/-- A weakly-unimodal sequence's first-argmax never exceeds its own
turning point: if it did, `IsFirstArgmax`'s domination clause and the
nonincreasing chain would force equality at `p`, contradicting the
STRICT clause. -/
theorem firstArgmax_le_turningPoint {d : ℕ} {a : ℕ → ℤ} {k p : ℕ}
    (hk : IsFirstArgmax d a k) (hpd : p ≤ d)
    (hanti : ∀ i, p ≤ i → i < d → a (i + 1) ≤ a i) :
    k ≤ p := by
  by_contra h
  rw [not_le] at h
  obtain ⟨hkd, hdom, hstrict⟩ := hk
  have h1 : a k ≤ a p := anti_of_adjacent_le hanti k hkd p (le_refl p) (le_of_lt h)
  have h2 : a p ≤ a k := hdom p hpd
  have h3 : a p < a k := hstrict p h
  omega

/-- **LEMMA B*, WITH ITS HYPOTHESIS** — the registered statement of
`E993-PAIR-BROOM-DOMINATION` L2, exactly: for `a` nonnegative, weakly
unimodal on `[0,d]`, with `a 0 > 0`, the first-argmax of `(1+x)a` is at
least the first-argmax of `a`. `a 0 > 0` and full nonnegativity are
carried for fidelity to the registered hypothesis; the proof below uses
nonnegativity of `a` at the `k = 0` boundary case only (to compare
`shiftAdd a 0 = a 0` against `shiftAdd a k1 = a k1 + a (k1-1)`, which
needs `a (k1-1) ≥ 0`) and does not need `a 0 > 0` itself — disclosed,
not silently dropped (the registered hypothesis is still stated in
full below). -/
theorem lemma_B_star {d : ℕ} {a : ℕ → ℤ}
    (hnonneg : ∀ i, 0 ≤ a i) (ha0 : 0 < a 0)
    (hunimodal : WeaklyUnimodal d a)
    {k1 k2 : ℕ} (hk1 : IsFirstArgmax d a k1)
    (hk2 : IsFirstArgmax (d + 1) (shiftAdd a) k2) :
    k1 ≤ k2 := by
  by_contra hcon
  rw [not_le] at hcon
  obtain ⟨p, hpd, hmono, hanti⟩ := hunimodal
  have hkp : k1 ≤ p := firstArgmax_le_turningPoint hk1 hpd hanti
  obtain ⟨hk1d, hk1dom, hk1strict⟩ := hk1
  obtain ⟨hk2d1, hk2dom, hk2strict⟩ := hk2
  have hk1pos : 1 ≤ k1 := by omega
  -- The key bound: every k < k1 has `shiftAdd a k < shiftAdd a k1`.
  have hkey : ∀ k, k < k1 → shiftAdd a k < shiftAdd a k1 := by
    intro k hk
    have hstep : a (k1 - 1) < a k1 := hk1strict (k1 - 1) (by omega)
    have hbk1 : shiftAdd a k1 = a k1 + a (k1 - 1) := by
      have hk1eq : k1 = (k1 - 1) + 1 := by omega
      conv_lhs => rw [hk1eq]
      rw [shiftAdd_succ, ← hk1eq]
    rcases Nat.eq_zero_or_pos k with hk0 | hkpos
    · subst hk0
      rw [shiftAdd_zero, hbk1]
      have hle : a 0 ≤ a (k1 - 1) := mono_of_adjacent_le hmono 0 (k1 - 1) (by omega) (by omega)
      have hnn : 0 ≤ a (k1 - 1) := hnonneg (k1 - 1)
      linarith
    · rw [hbk1]
      have hkeq : k = (k - 1) + 1 := by omega
      have hbk : shiftAdd a k = a k + a (k - 1) := by
        conv_lhs => rw [hkeq]
        rw [shiftAdd_succ, ← hkeq]
      rw [hbk]
      have hle1 : a k ≤ a (k1 - 1) := mono_of_adjacent_le hmono k (k1 - 1) (by omega) (by omega)
      have hle2 : a (k - 1) ≤ a (k1 - 1) := mono_of_adjacent_le hmono (k - 1) (k1 - 1) (by omega) (by omega)
      linarith
  have hcontra1 : shiftAdd a k1 ≤ shiftAdd a k2 := hk2dom k1 (by omega)
  have hcontra2 : shiftAdd a k2 < shiftAdd a k1 := hkey k2 hcon
  omega

/-! ### THE HYPOTHESIS IS LOAD-BEARING: the registered counter-witness

`a = [3,5,0,7]` (registered, `E993-PAIR-BROOM-DOMINATION` L2's scope
line, and `control/c7-registrar-verification.py`'s registrar receipt).
`a` is nonnegative with `a 0 = 3 > 0` — every hypothesis of Lemma B*
holds EXCEPT weak unimodality — and yet `firstArgmax(shiftAdd a) = 1 <
3 = firstArgmax(a)`: the conclusion fails. This is not merely "for this
`a` the conclusion happens to fail" — `counterNotUnimodal` below proves
`a` genuinely violates `WeaklyUnimodal`, so the failure is exactly
attributable to the missing hypothesis, not to some other unstated
defect. All four facts are closed, finite, decidable checks. -/

/-- The registered counter-witness sequence, zero-extended. -/
def counterA : ℕ → ℤ
  | 0 => 3
  | 1 => 5
  | 2 => 0
  | 3 => 7
  | _ => 0

theorem counterA_isFirstArgmax : IsFirstArgmax 3 counterA 3 := by
  refine ⟨by decide, ?_, ?_⟩ <;> decide

theorem counterB_isFirstArgmax : IsFirstArgmax 4 (shiftAdd counterA) 1 := by
  refine ⟨by decide, ?_, ?_⟩ <;> decide

/-- `counterA` is genuinely NOT weakly unimodal on `[0,3]` — the
hypothesis Lemma B* needs is the one thing missing here, not merely a
coincidental numerical failure. Each of the four possible turning
points `p ∈ {0,1,2,3}` is refuted by one concrete adjacent comparison
(`counterA` dips `5 → 0` at index 1→2, then rises `0 → 7` at 2→3, which
no single nondecreasing/nonincreasing split can accommodate). -/
theorem counterA_not_weaklyUnimodal : ¬ WeaklyUnimodal 3 counterA := by
  rintro ⟨p, hp, hmono, hanti⟩
  interval_cases p
  · exact absurd (hanti 0 le_rfl (by omega)) (by decide)
  · exact absurd (hanti 2 (by omega) (by omega)) (by decide)
  · exact absurd (hmono 1 (by omega)) (by decide)
  · exact absurd (hmono 1 (by omega)) (by decide)

/-- `counterA` is nonnegative at every natural index (zero beyond its
support, by construction). -/
theorem counterA_nonneg (i : ℕ) : 0 ≤ counterA i := by
  rcases Nat.lt_or_ge i 4 with h | h
  · interval_cases i <;> decide
  · have hi : i = (i - 4) + 4 := by omega
    rw [hi]
    simp [counterA]

/-- **THE HYPOTHESIS IS LOAD-BEARING.** `counterA` satisfies every OTHER
hypothesis of `lemma_B_star` (nonnegative everywhere, `a 0 > 0`) and its
own first-argmax is `3`; `shiftAdd counterA`'s first-argmax is `1 < 3`.
So `lemma_B_star`'s conclusion (`k1 ≤ k2`) genuinely requires the weak-
unimodality hypothesis — dropping it breaks the theorem on this exact
registered witness, exactly as the registered scope line states
("p=3 -> p=1"). -/
theorem hypothesis_load_bearing :
    (∀ i, 0 ≤ counterA i) ∧ 0 < counterA 0 ∧
      IsFirstArgmax 3 counterA 3 ∧ IsFirstArgmax 4 (shiftAdd counterA) 1 ∧
      ¬ (3 ≤ 1) ∧ ¬ WeaklyUnimodal 3 counterA :=
  ⟨counterA_nonneg, by decide, counterA_isFirstArgmax, counterB_isFirstArgmax,
    by decide, counterA_not_weaklyUnimodal⟩
