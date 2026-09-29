/- Controller preparation only. No compiled or formal claim. -/
import Mathlib
open scoped BigOperators

noncomputable
def e993TailB (a : ℕ) : Polynomial ℝ := (1 + Polynomial.X)^a + Polynomial.X

def e993TailN {m : ℕ} (r : Fin m → ℕ) : ℕ := ∑ i, r i

def e993TailH {m : ℕ} (r : Fin m → ℕ) : ℕ :=
  1 + ∑ i, if r i = 2 then 2 else if r i = 3 then 4 else 7

noncomputable
def e993TailC {m : ℕ} (r : Fin m → ℕ) : Polynomial ℝ :=
  e993TailB 1 * ∏ i, e993TailB (r i)

noncomputable
def e993TailU {m : ℕ} (r : Fin m → ℕ) (i : Fin m) : Polynomial ℝ :=
  e993TailB 1 * e993TailB (r i - 1) *
    ∏ j ∈ (Finset.univ : Finset (Fin m)).erase i, e993TailB (r j)

noncomputable
def e993TailE {m : ℕ} (r : Fin m → ℕ) : Polynomial ℝ :=
  Polynomial.X * (1 + Polynomial.X)^e993TailN r

/- Proposed exact terminal statement; no proof asserted.
theorem e993_guarded_tip_surplus_tail
    (m : ℕ) (hm : 100 ≤ m) (r : Fin m → ℕ)
    (hr : ∀ i, r i = 2 ∨ r i = 3 ∨ r i = 4)
    (i : Fin m) (k : ℕ) (hk : 1 ≤ k) (hguard : 2 * k ≤ e993TailN r + 2) :
    0 < ((e993TailH r : ℝ) + 1) * (e993TailU r i).coeff k * (e993TailC r).coeff k +
      ((k : ℝ) + 1) * ((e993TailH r : ℝ) - (k : ℝ) + 1) *
        ((e993TailE r).coeff k * (e993TailC r).coeff k -
          (e993TailE r).coeff (k + 1) * (e993TailC r).coeff (k - 1))
-/
