import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition ErdosR25C6U2.Cz 49645210782b68375cd0dcbc0b198dcba9e7012c79b1da7fc5c018058a905e20
namespace ErdosR25C6U2

/-- Zero-extended integer binomial coefficient: `Cz n k = C(n,k)` for
`0 ≤ k ≤ n` (the `k > n` case is already zero by `Nat.choose` itself), and
`0` for negative `n` or `k`. This is the run's zero-extension convention
(`SEMANTIC-CONTRACT.md`) applied to `C`. -/
def Cz (n k : ℤ) : ℤ :=
  if 0 ≤ n ∧ 0 ≤ k then (Nat.choose n.toNat k.toNat : ℤ) else 0

end ErdosR25C6U2

-- The addendum formalizer's addition (not part of the byte-identical award
-- content above, whose digest is cited separately in the contract's
-- `source_materials`): opened here, at top level, outside any
-- namespace/section, so the scope persists across every subsequently
-- registered fragment in this project (`ErdosR25C6U2.Cz`/`D`/... can then be
-- referenced unqualified from the addendum's own `ErdosR25AddBdTail`
-- namespace, exactly as the lane-b brief's DAG states them).
open ErdosR25C6U2
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition ErdosR25C6U2.D 3be46c922db447811955f0ee8f84621e1ef6cfce368f2484685983b4a9c34a6a
namespace ErdosR25C6U2

/-- `D(b,m) = C(b,m+1) - 2C(b,m) + C(b,m-1)`, the ranged object, over ℤ. -/
def D (b m : ℤ) : ℤ := Cz b (m + 1) - 2 * Cz b m + Cz b (m - 1)

end ErdosR25C6U2
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition ErdosR25C6U2.N c3f254edef4aeb51892031730bbdfd846c51e81bfb7bc96bc32861f1003a0f86
namespace ErdosR25C6U2

/-- `N(g) = g² + g − 2m − 2`, the sign-governing numerator of `D(2m−g,m)`. -/
def N (m g : ℤ) : ℤ := g ^ 2 + g - 2 * m - 2

end ErdosR25C6U2
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition ErdosR25C6U2.L 10cdc21bf7f0503382e64ebc4365e07d65f9b72a65ce14f58d2c1d7f297b3aeb
namespace ErdosR25C6U2

/-- `L(g) = (m+1−g)·N(g+1)`. -/
def L (m g : ℤ) : ℤ := (m + 1 - g) * (g ^ 2 + 3 * g - 2 * m)

end ErdosR25C6U2
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition ErdosR25C6U2.R 4dcd3ec15c367c759476f329c7aeae93ee63fab411104793afc7743974a996c9
namespace ErdosR25C6U2

/-- `R(g) = (2m−g)·N(g)`. -/
def R (m g : ℤ) : ℤ := (2 * m - g) * (g ^ 2 + g - 2 * m - 2)

end ErdosR25C6U2
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition Erdos993G1.U3.Gamma 21792329354651d36a5fb071115156ec2c2df30187cc34796f8fe879aa5d6333
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

end Erdos993G1.U3

-- The addendum formalizer's addition (not part of the byte-identical
-- award content above): `open Nat Finset` was declared once, inside the
-- unclosed `Erdos993G1.U3` block, in the source project (whose own Main.lean
-- keeps that namespace open across all 38 of its entries, closing only at
-- its own terminal theorem, entry 38 -- which this run excludes). Re-declared
-- here, once, at top level, so every subsequent self-contained entry below
-- keeps exactly the same unqualified-name resolution the source project had.
open Nat Finset
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition ErdosR25AddBdTail.MaR b12933696b14ab01398a67c3412fc6c1acff65a96430f8c843c754c08ca5139b
namespace ErdosR25AddBdTail

/-- The ranged Hall maximum `M_a(r) = max_{0 ≤ b ≤ 2r−1−a} D(b, r−a)`, verbatim
from C-U2-F's `CriticF2.lean` (integer inner rank, unconditionally nonempty range). -/
noncomputable
def MaR (a r : ℕ) : ℤ :=
  (Finset.range (2 * r - 1 - a + 1)).sup'
    (by rw [Finset.nonempty_range_iff]; omega)
    (fun b => D (b : ℤ) ((r : ℤ) - (a : ℤ)))

end ErdosR25AddBdTail
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition ErdosR25AddBdTail.BdRR ae901b00c06913150d759ceef8a94231bedeb42ccfcbfd308008324c65f5269f
namespace ErdosR25AddBdTail

/-- `Bd(r,r) = D(2r−1, r) + Σ_{a=1}^{6} C(6,a)·max(0, M_a(r))`, verbatim from
C-U2-F's `CriticF2.lean`. -/
noncomputable
def BdRR (r : ℕ) : ℤ :=
  D (2 * (r : ℤ) - 1) (r : ℤ)
    + ∑ a ∈ Finset.Icc 1 6, (Nat.choose 6 a : ℤ) * max 0 (MaR a r)

end ErdosR25AddBdTail
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition ErdosR25AddBdTail.transitionExists 261ff2a608ccf6bac24777eafebe4be263d7eeec47b324e306239cf61677092c
namespace ErdosR25AddBdTail

/-- Existence of a transition point: `g = m+1` always satisfies
`2m ≤ g² − g`, since `(m+1)² − (m+1) = (m+1)·m ≥ 2m` for every `m : ℕ`.
Registered as a `def` (kind `definition`) rather than `lemma` so that `gc`
below (also a `definition`) may depend on it under the registrar's
kind-ordering rule (all definitions precede all lemmas). -/
def transitionExists (m : ℕ) : ∃ g : ℕ, 2 * m ≤ g ^ 2 - g := by
  refine ⟨m + 1, ?_⟩
  have hle : (m + 1) ≤ (m + 1) ^ 2 := by nlinarith
  rw [Nat.le_sub_iff_add_le hle]
  nlinarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition ErdosR25AddBdTail.gc 41810485c969631d6146cf32a2240c10a23e0f656c3816e2eb31b3793835d68a
namespace ErdosR25AddBdTail

/-- `g_c(m)`, the transition point, as `Nat.find` on the decidable predicate
`g² − g ≥ 2m` over `ℕ`. Never asserted to exist independently of this witness. -/
def gc (m : ℕ) : ℕ := Nat.find (transitionExists m)

end ErdosR25AddBdTail
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma ErdosR25C6U2.Cz_natCast a2532457b7656bbe6f0f947a1348aeef7019069224b59db669cd4539b709728d
namespace ErdosR25C6U2

lemma Cz_natCast (n k : ℕ) : Cz (n : ℤ) (k : ℤ) = (Nat.choose n k : ℤ) := by
  simp [Cz]

end ErdosR25C6U2
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma ErdosR25C6U2.Cz_cast_add_one 677e3b00613e57265d155ca6ccb0e43c515fdd20f78d60f7a608a2c5412e00e5
namespace ErdosR25C6U2

lemma Cz_cast_add_one (n k : ℕ) : Cz (n : ℤ) ((k : ℤ) + 1) = (Nat.choose n (k + 1) : ℤ) := by
  have hh : ((k : ℤ) + 1) = ((k + 1 : ℕ) : ℤ) := by push_cast; ring
  rw [hh]; exact Cz_natCast n (k + 1)

end ErdosR25C6U2
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma ErdosR25C6U2.Cz_cast_sub_one 3228e85a936e4e60223f64d03187b8d77082af7573a01ba713ac943403d6517a
namespace ErdosR25C6U2

lemma Cz_cast_sub_one (n k : ℕ) (hk : 1 ≤ k) :
    Cz (n : ℤ) ((k : ℤ) - 1) = (Nat.choose n (k - 1) : ℤ) := by
  have hh : ((k : ℤ) - 1) = ((k - 1 : ℕ) : ℤ) := by
    rw [Nat.cast_sub hk]; push_cast; ring
  rw [hh]; exact Cz_natCast n (k - 1)

end ErdosR25C6U2
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma ErdosR25C6U2.choose_ratio_up ee21fa8970bb189a473f9fdf151f4902cf6e9077a2e9f296ae94bd0015d7367c
namespace ErdosR25C6U2

lemma choose_ratio_up (b m : ℕ) (hbm : m ≤ b) :
    (Nat.choose b (m + 1) : ℤ) * (m + 1 : ℤ)
      = (Nat.choose b m : ℤ) * ((b : ℤ) - (m : ℤ)) := by
  have h := Nat.choose_succ_right_eq b m
  have hcast : ((Nat.choose b (m + 1) * (m + 1) : ℕ) : ℤ)
      = ((Nat.choose b m * (b - m) : ℕ) : ℤ) := by exact_mod_cast h
  push_cast [Nat.cast_sub hbm] at hcast
  linear_combination hcast

end ErdosR25C6U2
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma ErdosR25C6U2.choose_ratio_down 6024954cd047dd7479464e1bf0597da8c5c63a6ee99290dfa23b91319d0ee9a3
namespace ErdosR25C6U2

lemma choose_ratio_down (b m : ℕ) (hm : 1 ≤ m) (hbm : m ≤ b) :
    (Nat.choose b m : ℤ) * (m : ℤ)
      = (Nat.choose b (m - 1) : ℤ) * ((b : ℤ) - (m : ℤ) + 1) := by
  have hk : m - 1 + 1 = m := by omega
  have h := Nat.choose_succ_right_eq b (m - 1)
  rw [hk] at h
  have hbm' : m - 1 ≤ b := by omega
  have hcast : ((Nat.choose b m * m : ℕ) : ℤ)
      = ((Nat.choose b (m - 1) * (b - (m - 1)) : ℕ) : ℤ) := by exact_mod_cast h
  push_cast [Nat.cast_sub hbm', Nat.cast_sub hm] at hcast
  linear_combination hcast

end ErdosR25C6U2
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma ErdosR25C6U2.D_closed_form 4b0502be89360fdeb4df0bb14f9d0b9251b54b32d75a1553b21f62835c45a599
namespace ErdosR25C6U2

/-- **Node (1), the closed form** (seat U2). For natural `g ≤ m`, `1 ≤ m`,
writing `b = 2m − g`:
`D(2m−g,m)·(m+1)·(m−g+1) = C(2m−g,m)·N(g)`. -/
lemma D_closed_form (m g : ℕ) (hg : g ≤ m) (hm : 1 ≤ m) :
    D (2 * (m : ℤ) - g) (m : ℤ) * ((m : ℤ) + 1) * ((m : ℤ) - g + 1)
      = Cz (2 * (m : ℤ) - g) (m : ℤ) * N (m : ℤ) (g : ℤ) := by
  set b : ℕ := 2 * m - g with hbdef
  have hbm : m ≤ b := by omega
  have hbZ : 2 * (m : ℤ) - (g : ℤ) = (b : ℤ) := by
    have hbn : (b : ℤ) = ((2 * m - g : ℕ) : ℤ) := by rw [hbdef]
    rw [hbn, Nat.cast_sub (show g ≤ 2 * m by omega)]
    push_cast; ring
  rw [hbZ]
  have e1 : (Nat.choose b (m + 1) : ℤ) * ((m : ℤ) + 1)
      = (Nat.choose b m : ℤ) * ((b : ℤ) - (m : ℤ)) := choose_ratio_up b m hbm
  have e2 : (Nat.choose b m : ℤ) * (m : ℤ)
      = (Nat.choose b (m - 1) : ℤ) * ((b : ℤ) - (m : ℤ) + 1) := choose_ratio_down b m hm hbm
  have hgb : (b : ℤ) - (m : ℤ) = (m : ℤ) - (g : ℤ) := by rw [← hbZ]; ring
  rw [hgb] at e1 e2
  unfold D N
  rw [Cz_cast_add_one b m, Cz_natCast b m, Cz_cast_sub_one b m hm]
  linear_combination ((m : ℤ) - (g : ℤ) + 1) * e1 - ((m : ℤ) + 1) * e2

end ErdosR25C6U2
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma ErdosR25C6U2.L_eq 5b84b5e6509b6b744f65108e80193faf9ae39aff65417b5aafe46c5acf175aef
namespace ErdosR25C6U2

lemma L_eq (m g : ℤ) : L m g = (m + 1 - g) * N m (g + 1) := by unfold L N; ring

end ErdosR25C6U2
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma ErdosR25C6U2.R_eq 9543941c4fdfc3d463191afb71b5b361b9c37bdd7a40a31f87810e9e3af449c6
namespace ErdosR25C6U2

lemma R_eq (m g : ℤ) : R m g = (2 * m - g) * N m g := by unfold R N; ring

end ErdosR25C6U2
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma ErdosR25C6U2.L_sub_R 722a0cc9194d1713d439d779750241e89d56061df47624871fdd55df3a1f6a06
namespace ErdosR25C6U2

/-- **Node (2a), the ratio-test identity** (seat U2).
`L(g) − R(g) = (m+1)(2m−g²+g)`. -/
lemma L_sub_R (m g : ℤ) : L m g - R m g = (m + 1) * (2 * m - g ^ 2 + g) := by
  unfold L R; ring

end ErdosR25C6U2
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma ErdosR25C6U2.peak_bracket_integral 04c03dd25bb1678ba41999f1fc7b5b85e497a125779030e81334d139bef6c46a
namespace ErdosR25C6U2

/-- **Node (4), the INTEGRAL peak bracket** (sharpened, critic C-U2-F). If
`g − 1` fails the transition test (`(g−1)² − (g−1) < 2m`) then
`N(g) ≤ 4g − 5` as an INTEGER inequality. -/
lemma peak_bracket_integral (m g : ℤ) (h : (g - 1) ^ 2 - (g - 1) < 2 * m) :
    N m g ≤ 4 * g - 5 := by
  unfold N
  have hInt : (g - 1) ^ 2 - (g - 1) ≤ 2 * m - 1 := by omega
  nlinarith [hInt]

end ErdosR25C6U2
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma ErdosR25C6U2.gc_ge_five 2bce262893b5cc45037a62cae866e4198d94345e533c3be42044fe52f7adf5d3
namespace ErdosR25C6U2

/-- `g_c(m) ≥ 5` for `m ≥ 7` (seat U2, node 7 apparatus). -/
lemma gc_ge_five (m : ℤ) (g : ℕ) (hm : 7 ≤ m) (hpass : 2 * m ≤ (g : ℤ) ^ 2 - g) :
    5 ≤ g := by
  by_contra h
  push_neg at h
  interval_cases g <;> norm_num at hpass <;> omega

end ErdosR25C6U2
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma ErdosR25C6U2.three_gc_le fde6377af9dab8359827145a426500f478802a8269e3da4f661f0111640e9aac
namespace ErdosR25C6U2

/-- `3·g_c ≤ 2m + 2` for `m ≥ 7` (seat U2, node 7 apparatus). -/
lemma three_gc_le (m : ℤ) (g : ℕ) (hg1 : 1 ≤ g) (hm : 7 ≤ m)
    (hfail : ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * m) :
    3 * (g : ℤ) ≤ 2 * m + 2 := by
  nlinarith [hfail, hm, sq_nonneg ((g : ℤ) - m), hg1]

end ErdosR25C6U2
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma ErdosR25C6U2.gc_star_bound f6efc49695fc03f13279c6ccea2a15e1922addb9865c47c80acdb002a44b4844
namespace ErdosR25C6U2

/-- **Node (7), `(**)` itself**, seat U2 — renamed `gc_star_bound`. The
chartered name `star_star` collides with Mathlib's root `star_star`
(`star (star a) = a`); this is the mandatory rename recorded in
`INFORMAL-PROOF.md` condition (iii) and the Cycle 6 synthesis Dispatch 4.
For `m ≥ 7` and `g_c : ℕ` the exact transition point
(`g_c² − g_c ≥ 2m`, `(g_c−1)² − (g_c−1) < 2m`, `1 ≤ g_c`):
`8(2m−1)(g_c−1) ≤ 2^{g_c}·(m+1)(m+1−g_c)`. -/
lemma gc_star_bound (m : ℤ) (g : ℕ) (hm : 7 ≤ m)
    (hpass : 2 * m ≤ (g : ℤ) ^ 2 - g) (hg1 : 1 ≤ g)
    (hfail : ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * m) :
    8 * (2 * m - 1) * ((g : ℤ) - 1) ≤ (2 : ℤ) ^ g * (m + 1) * (m + 1 - g) := by
  have h5 : 5 ≤ g := gc_ge_five m g hm hpass
  have h3 : 3 * (g : ℤ) ≤ 2 * m + 2 := three_gc_le m g hg1 hm hfail
  have hpow : (32 : ℤ) ≤ (2 : ℤ) ^ g := by
    calc (32 : ℤ) = (2 : ℤ) ^ 5 := by norm_num
    _ ≤ (2 : ℤ) ^ g := by
          apply pow_le_pow_right₀ (by norm_num) h5
  have hnn : (0 : ℤ) ≤ (m : ℤ) + 1 - (g : ℤ) := by linarith [h3, hm]
  nlinarith [hpow, h3, hm, hnn, mul_le_mul_of_nonneg_right hpow hnn]

end ErdosR25C6U2
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma ErdosR25C6U2.choose_double_step 4fc30785cd30e717b8d428c317b4adbf81500eaed9f41b2668e445914d284450
namespace ErdosR25C6U2

lemma choose_double_step (b m : ℕ) (hb2m : b + 1 ≤ 2 * m) :
    2 * Nat.choose b m ≤ Nat.choose (b + 1) m := by
  have h := Nat.choose_mul_succ_eq b m
  have hle : 2 * (b + 1 - m) ≤ b + 1 := by omega
  have step : 2 * (Nat.choose b m * (b + 1)) ≤ Nat.choose (b + 1) m * (b + 1) := by
    calc 2 * (Nat.choose b m * (b + 1))
        = 2 * (Nat.choose (b + 1) m * (b + 1 - m)) := by rw [h]
      _ = Nat.choose (b + 1) m * (2 * (b + 1 - m)) := by ring
      _ ≤ Nat.choose (b + 1) m * (b + 1) := by gcongr
  have hb1pos : 0 < b + 1 := Nat.succ_pos b
  have step' : (2 * Nat.choose b m) * (b + 1) ≤ Nat.choose (b + 1) m * (b + 1) := by
    calc (2 * Nat.choose b m) * (b + 1) = 2 * (Nat.choose b m * (b + 1)) := by ring
      _ ≤ Nat.choose (b + 1) m * (b + 1) := step
  exact Nat.le_of_mul_le_mul_right step' hb1pos

end ErdosR25C6U2
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma ErdosR25C6U2.row_ratio b3b4e0ad34d458e0a2f82bd10a6f4bb8814b0fcc175ac5f4e7e00aa17fbbfcfd
namespace ErdosR25C6U2

/-- **Node (5), the row-ratio telescope** (seat U2).
`2^g · C(2m−g,m) ≤ C(2m,m)`, for every `g ≤ m`. -/
lemma row_ratio (m g : ℕ) : g ≤ m →
    2 ^ g * Nat.choose (2 * m - g) m ≤ Nat.choose (2 * m) m := by
  induction g with
  | zero => intro _; simp
  | succ g ih =>
    intro hg
    have hgm : g ≤ m := by omega
    have hstep : 2 * Nat.choose (2 * m - (g + 1)) m ≤ Nat.choose (2 * m - g) m := by
      have hb : 2 * m - (g + 1) + 1 = 2 * m - g := by omega
      have hb2m : 2 * m - (g + 1) + 1 ≤ 2 * m := by omega
      have hcs := choose_double_step (2 * m - (g + 1)) m hb2m
      rwa [hb] at hcs
    have ihg := ih hgm
    calc 2 ^ (g + 1) * Nat.choose (2 * m - (g + 1)) m
        = 2 ^ g * (2 * Nat.choose (2 * m - (g + 1)) m) := by ring
      _ ≤ 2 ^ g * Nat.choose (2 * m - g) m := by gcongr
      _ ≤ Nat.choose (2 * m) m := ihg

end ErdosR25C6U2
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma ErdosR25C6U2.catalan_centralBinom_gap 86a4bd4a017f7a302a2abd65045121625c01cd82fc5397e32e83f6930a5c4be1
namespace ErdosR25C6U2

/-- **Node (6), the Catalan/centralBinom identity** (seat U2).
`C(2m,m) = 2(2m−1)·catalan(m−1)`, for `m ≥ 1`. -/
lemma catalan_centralBinom_gap (m : ℕ) (hm : 1 ≤ m) :
    (Nat.choose (2 * m) m : ℤ) = 2 * (2 * (m : ℤ) - 1) * (catalan (m - 1) : ℤ) := by
  have hk : m - 1 + 1 = m := by omega
  have hc1 := Nat.succ_mul_centralBinom_succ (m - 1)
  have hc2 := succ_mul_catalan_eq_centralBinom (m - 1)
  rw [hk] at hc1 hc2
  have hcb : Nat.centralBinom m = Nat.choose (2 * m) m := Nat.centralBinom_eq_two_mul_choose m
  have hcast1 : ((m * Nat.centralBinom m : ℕ) : ℤ)
      = ((2 * (2 * (m - 1) + 1) * Nat.centralBinom (m - 1) : ℕ) : ℤ) := by exact_mod_cast hc1
  have hcast2 : ((m * catalan (m - 1) : ℕ) : ℤ) = ((Nat.centralBinom (m - 1) : ℕ) : ℤ) := by
    exact_mod_cast hc2
  rw [hcb] at hcast1
  push_cast [Nat.cast_sub hm] at hcast1
  push_cast at hcast2
  have key : (m : ℤ) * (Nat.choose (2 * m) m : ℤ)
      = (m : ℤ) * (2 * (2 * (m : ℤ) - 1) * (catalan (m - 1) : ℤ)) := by
    linear_combination hcast1 - 2 * (2 * (m : ℤ) - 1) * hcast2
  have hm0 : (m : ℤ) ≠ 0 := by exact_mod_cast (show m ≠ 0 by omega)
  exact mul_left_cancel₀ hm0 key

end ErdosR25C6U2
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma ErdosR25C6U2.choose_row_shift f5b320af01270f892ccc97499375322d3aa4014e530191141cc0d4a7eb9953c8
namespace ErdosR25C6U2

/-- Row-shift, over ℤ, at `b = 2m − g` (critic C-U2-F). -/
lemma choose_row_shift (m g : ℕ) (hg : g < m) :
    Cz (2 * (m : ℤ) - (g : ℤ) - 1) (m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
      = Cz (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) * ((m : ℤ) - (g : ℤ)) := by
  have hn : (2 * m - g - 1) + 1 = 2 * m - g := by omega
  have h := Nat.choose_mul_succ_eq (2 * m - g - 1) m
  rw [hn] at h
  have hsub : 2 * m - g - m = m - g := by omega
  rw [hsub] at h
  have hc1 : Cz (2 * (m : ℤ) - (g : ℤ) - 1) (m : ℤ)
      = (Nat.choose (2 * m - g - 1) m : ℤ) := by
    have : (2 * (m : ℤ) - (g : ℤ) - 1) = ((2 * m - g - 1 : ℕ) : ℤ) := by
      rw [Nat.cast_sub (by omega), Nat.cast_sub (by omega)]; push_cast; ring
    rw [this]; exact Cz_natCast _ _
  have hc2 : Cz (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) = (Nat.choose (2 * m - g) m : ℤ) := by
    have : (2 * (m : ℤ) - (g : ℤ)) = ((2 * m - g : ℕ) : ℤ) := by
      rw [Nat.cast_sub (by omega)]; push_cast; ring
    rw [this]; exact Cz_natCast _ _
  rw [hc1, hc2]
  have hcast : ((Nat.choose (2 * m - g - 1) m * (2 * m - g) : ℕ) : ℤ)
      = ((Nat.choose (2 * m - g) m * (m - g) : ℕ) : ℤ) := by exact_mod_cast h
  push_cast [Nat.cast_sub (show g ≤ 2 * m by omega), Nat.cast_sub (show g ≤ m by omega)] at hcast
  linear_combination hcast

end ErdosR25C6U2
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma ErdosR25C6U2.choose_ratio_down_at b76ea973857ff645b7fff41c8cf6708cd4cbc33f7d2b876a71736315bde1a33f
namespace ErdosR25C6U2

/-- `C(2m−g, m)·m = C(2m−g, m−1)·(m−g+1)`, over ℤ (critic C-U2-F). -/
lemma choose_ratio_down_at (m g : ℕ) (hg : g ≤ m) (hm : 1 ≤ m) :
    Cz (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) * (m : ℤ)
      = Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1) * ((m : ℤ) - (g : ℤ) + 1) := by
  set b : ℕ := 2 * m - g with hbdef
  have hbm : m ≤ b := by omega
  have hbZ : 2 * (m : ℤ) - (g : ℤ) = (b : ℤ) := by
    rw [hbdef, Nat.cast_sub (show g ≤ 2 * m by omega)]; push_cast; ring
  rw [hbZ, Cz_natCast b m, Cz_cast_sub_one b m hm]
  have e2 := choose_ratio_down b m hm hbm
  have hgb : (b : ℤ) - (m : ℤ) = (m : ℤ) - (g : ℤ) := by rw [← hbZ]; ring
  rw [hgb] at e2
  linear_combination e2

end ErdosR25C6U2
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma ErdosR25C6U2.D_step_sign 9036306875bd1a1be88db4187958e021cec56b212d1c76c93a5b158041adea21
namespace ErdosR25C6U2

/-- **NODE 2b (critic C-U2-F, PRIMARY; independently compiled by critic
C-U2-T, FALLBACK — joint attribution on this node, per Cycle 6 synthesis
Dispatch 4).** The `D`-level, UNCONDITIONAL step-sign law: with
`h(g) = D(2m−g, m)`,
`m·(2m−g)·(h(g+1) − h(g)) = C(2m−g, m−1)·(2m − g² + g)`, for `g < m`, `1 ≤ m`.
No hypothesis on `N(g)`; no unimodality premise; `D` over ℤ throughout. -/
lemma D_step_sign (m g : ℕ) (hg : g < m) (hm : 1 ≤ m) :
    (m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
        * (D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) - D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ))
      = Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
          * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ)) := by
  have E1 := D_closed_form m g (le_of_lt hg) hm
  have E2 := D_closed_form m (g + 1) (by omega) hm
  have hcast : ((g + 1 : ℕ) : ℤ) = (g : ℤ) + 1 := by push_cast; ring
  rw [hcast] at E2
  have E3 := choose_row_shift m g hg
  have E4 := choose_ratio_down_at m g (le_of_lt hg) hm
  have halign : 2 * (m : ℤ) - ((g : ℤ) + 1) = 2 * (m : ℤ) - (g : ℤ) - 1 := by ring
  rw [halign] at E2 ⊢
  unfold N at E1 E2
  have hm1 : ((m : ℤ) + 1) ≠ 0 := by positivity
  have hmg1 : ((m : ℤ) - (g : ℤ) + 1) ≠ 0 := by
    have : (g : ℤ) < (m : ℤ) := by exact_mod_cast hg
    intro hcon; omega
  have hmg : ((m : ℤ) - (g : ℤ)) ≠ 0 := by
    have : (g : ℤ) < (m : ℤ) := by exact_mod_cast hg
    intro hcon; omega
  have key : ((m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
        * (D (2 * (m : ℤ) - (g : ℤ) - 1) (m : ℤ) - D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ)))
      * (((m : ℤ) + 1) * (((m : ℤ) - (g : ℤ) + 1) * ((m : ℤ) - (g : ℤ))))
      = (Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
          * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ)))
      * (((m : ℤ) + 1) * (((m : ℤ) - (g : ℤ) + 1) * ((m : ℤ) - (g : ℤ)))) := by
    linear_combination
      ((m : ℤ) * (2 * (m : ℤ) - (g : ℤ)) * ((m : ℤ) - (g : ℤ) + 1)) * E2
      - ((m : ℤ) * (2 * (m : ℤ) - (g : ℤ)) * ((m : ℤ) - (g : ℤ))) * E1
      + ((m : ℤ) * ((m : ℤ) - (g : ℤ) + 1)
          * ((g : ℤ) ^ 2 + 3 * (g : ℤ) - 2 * (m : ℤ))) * E3
      + (((m : ℤ) - (g : ℤ)) * ((m : ℤ) + 1)
          * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ))) * E4
  have hne : (((m : ℤ) + 1) * (((m : ℤ) - (g : ℤ) + 1) * ((m : ℤ) - (g : ℤ)))) ≠ 0 :=
    mul_ne_zero hm1 (mul_ne_zero hmg1 hmg)
  exact mul_right_cancel₀ hne key

end ErdosR25C6U2
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma ErdosR25C6U2.choose_pred_pos d63e7f056d641f66f6e76462815deabb37557a0660e12469c843a09ccff1c7e1
namespace ErdosR25C6U2

lemma choose_pred_pos (m g : ℕ) (hg : g < m) (hm : 1 ≤ m) :
    0 < Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1) := by
  set b : ℕ := 2 * m - g with hbdef
  have hbZ : 2 * (m : ℤ) - (g : ℤ) = (b : ℤ) := by
    rw [hbdef, Nat.cast_sub (show g ≤ 2 * m by omega)]; push_cast; ring
  rw [hbZ, Cz_cast_sub_one b m hm]
  have : m - 1 ≤ b := by omega
  exact_mod_cast Nat.choose_pos this

end ErdosR25C6U2
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma ErdosR25C6U2.D_step_up 7d7ad19191ac0f730f6d8fbb28ea4d3ad61c689cc7d0961b66ab047285c470db
namespace ErdosR25C6U2

/-- **Node 3, step up** (critic C-U2-F). While the transition test fails
(`g² − g < 2m`) the step is strictly upward. -/
lemma D_step_up (m g : ℕ) (hg : g < m) (hm : 1 ≤ m)
    (hlt : (g : ℤ) ^ 2 - (g : ℤ) < 2 * (m : ℤ)) :
    D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) < D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) := by
  have hkey := D_step_sign m g hg hm
  have hC := choose_pred_pos m g hg hm
  have hpos : 0 < Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
      * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ)) := by
    apply mul_pos hC; linarith
  rw [← hkey] at hpos
  have hb : (0 : ℤ) < (m : ℤ) * (2 * (m : ℤ) - (g : ℤ)) := by
    have h1 : (0 : ℤ) < (m : ℤ) := by exact_mod_cast hm
    have h2 : (g : ℤ) < (m : ℤ) := by exact_mod_cast hg
    nlinarith
  nlinarith [hpos, hb]

end ErdosR25C6U2
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma ErdosR25C6U2.D_step_down 1083410fa6a5ea0856365e7ce869c156d94036ef0918a61e2533b5c0225d0109
namespace ErdosR25C6U2

/-- **Node 3, step down** (critic C-U2-F). Once the transition test passes
(`g² − g ≥ 2m`) the step is non-increasing. -/
lemma D_step_down (m g : ℕ) (hg : g < m) (hm : 1 ≤ m)
    (hge : 2 * (m : ℤ) ≤ (g : ℤ) ^ 2 - (g : ℤ)) :
    D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) ≤ D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) := by
  have hkey := D_step_sign m g hg hm
  have hC := choose_pred_pos m g hg hm
  have hnp : Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
      * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ)) ≤ 0 := by
    apply mul_nonpos_of_nonneg_of_nonpos (le_of_lt hC); linarith
  rw [← hkey] at hnp
  have hb : (0 : ℤ) < (m : ℤ) * (2 * (m : ℤ) - (g : ℤ)) := by
    have h1 : (0 : ℤ) < (m : ℤ) := by exact_mod_cast hm
    have h2 : (g : ℤ) < (m : ℤ) := by exact_mod_cast hg
    nlinarith
  nlinarith [hnp, hb]

end ErdosR25C6U2
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN lemma ErdosR25C6U2.Cz_nonneg 66eaa1519f1679bfad51ca5e44e30906dd5622919ccb6abf2d8331e3bffedfae
namespace ErdosR25C6U2

lemma Cz_nonneg (n k : ℤ) : 0 ≤ Cz n k := by
  unfold Cz; split
  · exact Int.ofNat_nonneg _
  · exact le_refl 0

end ErdosR25C6U2
-- VERITYOS ENTRY 33 END

-- VERITYOS ENTRY 34 BEGIN lemma ErdosR25C6U2.interior_peak_le_cat 6867f52fd9f996b9727876984363291337ff90355bda649bcfb771255969b494
namespace ErdosR25C6U2

/-- **NODE 8 core (critic C-U2-F): `interior_peak_le_cat`.** For `m ≥ 7` and
`g_c ≤ m` the transition point (`g_c² − g_c ≥ 2m` and `(g_c−1)² − (g_c−1) < 2m`
— `g_c` entering only as a WITNESS of these two inequalities, never asserted
to exist: precisely the distinction that makes `D_unimodal_peak` false and
this true), the interior value of `D` at the peak is at most `catalan (m−1)`:
`D(2m − g_c, m) ≤ catalan (m − 1)`. -/
lemma interior_peak_le_cat (m g : ℕ) (hm : 7 ≤ m) (hgm : g ≤ m)
    (hpass : 2 * (m : ℤ) ≤ (g : ℤ) ^ 2 - (g : ℤ))
    (hfail : ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * (m : ℤ)) :
    D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ) := by
  have hmZ : (7 : ℤ) ≤ (m : ℤ) := by exact_mod_cast hm
  have hg5 : 5 ≤ g := gc_ge_five (m : ℤ) g hmZ hpass
  have hg5Z : (5 : ℤ) ≤ (g : ℤ) := by exact_mod_cast hg5
  have hgmZ : (g : ℤ) ≤ (m : ℤ) := by exact_mod_cast hgm
  have E1 := D_closed_form m g hgm (by omega)
  have E4 : N (m : ℤ) (g : ℤ) ≤ 4 * (g : ℤ) - 5 := peak_bracket_integral _ _ hfail
  have E5n := row_ratio m g hgm
  have E5 : (2 : ℤ) ^ g * (Nat.choose (2 * m - g) m : ℤ) ≤ (Nat.choose (2 * m) m : ℤ) := by
    exact_mod_cast E5n
  have E6 := catalan_centralBinom_gap m (by omega)
  have E7 := gc_star_bound (m : ℤ) g hmZ hpass (by omega) hfail
  have hbZ : 2 * (m : ℤ) - (g : ℤ) = ((2 * m - g : ℕ) : ℤ) := by
    rw [Nat.cast_sub (show g ≤ 2 * m by omega)]; push_cast; ring
  have hCz : Cz (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) = (Nat.choose (2 * m - g) m : ℤ) := by
    rw [hbZ]; exact Cz_natCast _ _
  set A : ℤ := (Nat.choose (2 * m - g) m : ℤ) with hA
  set K : ℤ := (catalan (m - 1) : ℤ) with hK
  set h : ℤ := D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) with hh
  have hA0 : 0 ≤ A := by positivity
  have hK0 : 0 ≤ K := by positivity
  have hpow0 : (0 : ℤ) < (2 : ℤ) ^ g := by positivity
  have hMG : (0 : ℤ) < (m : ℤ) - (g : ℤ) + 1 := by linarith
  have hM1 : (0 : ℤ) < (m : ℤ) + 1 := by linarith
  rw [hCz] at E1
  unfold N at E4
  have step1 : h * ((m : ℤ) + 1) * ((m : ℤ) - (g : ℤ) + 1) ≤ A * (4 * (g : ℤ) - 5) := by
    rw [E1]; exact mul_le_mul_of_nonneg_left E4 hA0
  have h4g5 : (0 : ℤ) ≤ 4 * (g : ℤ) - 5 := by linarith
  have step2 : (2 : ℤ) ^ g * (h * ((m : ℤ) + 1) * ((m : ℤ) - (g : ℤ) + 1))
      ≤ (Nat.choose (2 * m) m : ℤ) * (4 * (g : ℤ) - 5) := by
    calc (2 : ℤ) ^ g * (h * ((m : ℤ) + 1) * ((m : ℤ) - (g : ℤ) + 1))
        ≤ (2 : ℤ) ^ g * (A * (4 * (g : ℤ) - 5)) :=
          mul_le_mul_of_nonneg_left step1 (le_of_lt hpow0)
      _ = ((2 : ℤ) ^ g * A) * (4 * (g : ℤ) - 5) := by ring
      _ ≤ (Nat.choose (2 * m) m : ℤ) * (4 * (g : ℤ) - 5) :=
          mul_le_mul_of_nonneg_right E5 h4g5
  have hm1pos : (0 : ℤ) < 2 * (m : ℤ) - 1 := by linarith
  have step3 : (Nat.choose (2 * m) m : ℤ) * (4 * (g : ℤ) - 5)
      ≤ (8 * (2 * (m : ℤ) - 1) * ((g : ℤ) - 1)) * K := by
    rw [E6]
    have : 2 * (2 * (m : ℤ) - 1) * (4 * (g : ℤ) - 5)
        ≤ 8 * (2 * (m : ℤ) - 1) * ((g : ℤ) - 1) := by nlinarith
    calc 2 * (2 * (m : ℤ) - 1) * K * (4 * (g : ℤ) - 5)
        = (2 * (2 * (m : ℤ) - 1) * (4 * (g : ℤ) - 5)) * K := by ring
      _ ≤ (8 * (2 * (m : ℤ) - 1) * ((g : ℤ) - 1)) * K :=
          mul_le_mul_of_nonneg_right this hK0
  have step4 : (8 * (2 * (m : ℤ) - 1) * ((g : ℤ) - 1)) * K
      ≤ ((2 : ℤ) ^ g * ((m : ℤ) + 1) * ((m : ℤ) + 1 - (g : ℤ))) * K :=
    mul_le_mul_of_nonneg_right E7 hK0
  have chain : (2 : ℤ) ^ g * ((m : ℤ) + 1) * ((m : ℤ) - (g : ℤ) + 1) * h
      ≤ (2 : ℤ) ^ g * ((m : ℤ) + 1) * ((m : ℤ) - (g : ℤ) + 1) * K := by
    have := step2.trans (step3.trans step4)
    nlinarith [this]
  have hfac : (0 : ℤ) < (2 : ℤ) ^ g * ((m : ℤ) + 1) * ((m : ℤ) - (g : ℤ) + 1) := by
    apply mul_pos (mul_pos hpow0 hM1) hMG
  exact le_of_mul_le_mul_left chain hfac

end ErdosR25C6U2
-- VERITYOS ENTRY 34 END

-- VERITYOS ENTRY 35 BEGIN lemma Erdos993G1.U3.catalan_pos 6423ca7f5a1a8bff9d683a5eab08c0d9ddbc193d6817320b8780d9c9a4cf76c6
namespace Erdos993G1.U3

lemma catalan_pos (n : ℕ) : 0 < catalan n := by
  have h := succ_mul_catalan_eq_centralBinom n
  have hc : 0 < Nat.centralBinom n := Nat.centralBinom_pos n
  rcases Nat.eq_zero_or_pos (catalan n) with h0 | h0
  · rw [h0, mul_zero] at h; omega
  · exact h0

end Erdos993G1.U3
-- VERITYOS ENTRY 35 END

-- VERITYOS ENTRY 36 BEGIN lemma Erdos993G1.U3.catalan_mul_recurrence cdef0918e5dbd6e121ad65de48dac77286e891799a20e42e99e6d349fc200845
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 36 END

-- VERITYOS ENTRY 37 BEGIN lemma Erdos993G1.U3.catalan_strict_logConvex b6a98bdbdf42278016fdc987d94383a4cc9b604cd8571ec079927de6e01ea7e0
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 37 END

-- VERITYOS ENTRY 38 BEGIN lemma Erdos993G1.U3.catalan_cross_strict 140391982c697fa0a4d5c6479ec71a6f842b3821e8f43ec9a03f3c3c08bf18a8
namespace Erdos993G1.U3

/-- The cross-index strict inequality that drives the monotone-ratio lemma:
for `a < b`, `catalan a * catalan (b+1) > catalan (a+1) * catalan b`. Proved
by induction on `b` from the log-convexity step, with no limits. -/
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

end Erdos993G1.U3
-- VERITYOS ENTRY 38 END

-- VERITYOS ENTRY 39 BEGIN lemma Erdos993G1.U3.Gamma_unfold 60c135a0f7ae5309aa26dbbc3bb1de855e34ca6fff16c1c5bfade411668daeec
namespace Erdos993G1.U3

lemma Gamma_unfold {τ k : ℕ} (hk : τ ≤ k) :
    Gamma τ k = (catalan (k + 1) : ℤ) -
      ∑ j ∈ Finset.Icc 1 τ, (Nat.choose τ j : ℤ) * (catalan (k - j) : ℤ) := by
  unfold Gamma
  congr 1
  apply Finset.sum_congr rfl
  intro j hj
  rw [Finset.mem_Icc] at hj
  rw [if_pos (le_trans hj.2 hk)]

end Erdos993G1.U3
-- VERITYOS ENTRY 39 END

-- VERITYOS ENTRY 40 BEGIN lemma Erdos993G1.U3.Gamma_zero a7c347145bf2fb54fba1914c86dccc2b15ef7acafc1fd28723d7e86bf63a61be
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 40 END

-- VERITYOS ENTRY 41 BEGIN lemma Erdos993G1.U3.catalan_le_succ 7c3040d61b308e870ec62232e80d35217ead228748fe38b85bfb7c75ddeedec2
namespace Erdos993G1.U3

lemma catalan_le_succ (n : ℕ) : catalan n ≤ catalan (n + 1) := by
  have r := catalan_mul_recurrence n
  have hcoef : n + 2 ≤ 4 * n + 2 := by omega
  have : (n + 2) * catalan n ≤ (n + 2) * catalan (n + 1) := by
    calc (n + 2) * catalan n ≤ (4 * n + 2) * catalan n := by
          exact Nat.mul_le_mul_right _ hcoef
      _ = (n + 2) * catalan (n + 1) := r.symm
  exact Nat.le_of_mul_le_mul_left this (Nat.succ_pos (n + 1))

end Erdos993G1.U3
-- VERITYOS ENTRY 41 END

-- VERITYOS ENTRY 42 BEGIN lemma Erdos993G1.U3.catalan_strict_two_step e73d0b67e900599953ca1b0144bdc80e0081d940fb9106cc4385e046ca71fc70
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 42 END

-- VERITYOS ENTRY 43 BEGIN lemma Erdos993G1.U3.gamma_one_pos 2234dabd459160354acdebb8beaf8f70ab6a8a85132d08f034f26332a103843e
namespace Erdos993G1.U3

/-- The `τ = 1` base case, `K(1) = 0`: `Gamma 1 k > 0` for every `k`
(no lower bound needed at all, matching `Γ(τ,0) = 1` for every `τ` and the
Cycle 1/2 record). -/
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

end Erdos993G1.U3
-- VERITYOS ENTRY 43 END

-- VERITYOS ENTRY 44 BEGIN lemma Erdos993G1.U3.monotone_ratio 0ded5267a81bbeee64cbd950073dc99a7e71db5f30920be381a8d5b464d2da84
namespace Erdos993G1.U3

/-- **Obligation (1), the gating Lean node.** For `τ ≥ 1` and `k ≥ τ`, the
ratio `Gamma τ k / catalan (k+1)` strictly increases at `k`; stated
denominator-free (condition (v), statement of record) as required for an
integer formalisation. Proof: the finitary route — expand both sides via
`Gamma_unfold`, reduce the difference to a sum of `catalan`-cross-terms, and
close each term with `catalan_cross_strict` (itself powered only by
`catalan_strict_logConvex`, i.e. by the always-true polynomial fact
`12 > 6` cleared of `f(i) = (i+1)/(4i-2) > 1/4`). No limit, no real/rational
analysis anywhere. -/
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

end Erdos993G1.U3
-- VERITYOS ENTRY 44 END

-- VERITYOS ENTRY 45 BEGIN lemma Erdos993G1.U3.gamma_pos_of_base fe508686b9aa5c9e17a2dfa498b7b58b7544080d88dbcf6517bcb2dd3dbe0114
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 45 END

-- VERITYOS ENTRY 46 BEGIN lemma Erdos993G1.U3.gamma_base_2 2754cf2532ce60e243a930be7b4f3cecbc0fd0459f6f927fca315c5f19d2c0ba
namespace Erdos993G1.U3

set_option maxRecDepth 4000 in
lemma gamma_base_2 : 0 < Gamma 2 2 := by
  rw [Gamma_unfold (by norm_num : (2:ℕ) ≤ 2)]; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 46 END

-- VERITYOS ENTRY 47 BEGIN lemma Erdos993G1.U3.gamma_base_3 66631468935a52d760cb355b63256be93c34c5037bf4bad54bafd462dd42c492
namespace Erdos993G1.U3

set_option maxRecDepth 4000 in
lemma gamma_base_3 : 0 < Gamma 3 3 := by
  rw [Gamma_unfold (by norm_num : (3:ℕ) ≤ 3)]; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 47 END

-- VERITYOS ENTRY 48 BEGIN lemma Erdos993G1.U3.gamma_base_4 236c8b32dd8008511cf91bbe75bc3fdb758aad94041f182cb6b67249b3404af3
namespace Erdos993G1.U3

set_option maxRecDepth 4000 in
lemma gamma_base_4 : 0 < Gamma 4 4 := by
  rw [Gamma_unfold (by norm_num : (4:ℕ) ≤ 4)]; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 48 END

-- VERITYOS ENTRY 49 BEGIN lemma Erdos993G1.U3.gamma_base_5 70282f0c68e9287e7b82ac404954c4dc6af67b20f9a9cc1fc688c02fa7ffac08
namespace Erdos993G1.U3

set_option maxRecDepth 4000 in
lemma gamma_base_5 : 0 < Gamma 5 6 := by
  rw [Gamma_unfold (by norm_num : (5:ℕ) ≤ 6)]; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 49 END

-- VERITYOS ENTRY 50 BEGIN lemma Erdos993G1.U3.gamma_base_6 2dc8d53ce11df204c7e948bd8787fb331bc56eead08fa6c4f91d432171e0c6b7
namespace Erdos993G1.U3

set_option maxRecDepth 4000 in
lemma gamma_base_6 : 0 < Gamma 6 12 := by
  rw [Gamma_unfold (by norm_num : (6:ℕ) ≤ 12)]; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 50 END

-- VERITYOS ENTRY 51 BEGIN lemma Erdos993G1.U3.gamma_base_7 79c2776953123e6e9860f514a9caf843bf9422f78ecd03567d6dbb810f6ecffe
namespace Erdos993G1.U3

set_option maxRecDepth 10000 in
lemma gamma_base_7 : 0 < Gamma 7 70 := by
  rw [Gamma_unfold (by norm_num : (7:ℕ) ≤ 70)]; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 51 END

-- VERITYOS ENTRY 52 BEGIN lemma Erdos993G1.U3.gamma_pos_1 306d3223ff919449e2fda898aab5e96ad40695e452938a18fd0160903b12ee10
namespace Erdos993G1.U3

/-- `K(1) = 0`. -/
lemma gamma_pos_1 (k : ℕ) (_hk : 0 ≤ k) : 0 < Gamma 1 k := gamma_one_pos k

end Erdos993G1.U3
-- VERITYOS ENTRY 52 END

-- VERITYOS ENTRY 53 BEGIN lemma Erdos993G1.U3.gamma_pos_2 25f0cc8d11647748c56b4900b4f38d26323f3bd388029cc77f38940b2966feba
namespace Erdos993G1.U3

/-- `K(2) = 2`. -/
lemma gamma_pos_2 (k : ℕ) (hk : 2 ≤ k) : 0 < Gamma 2 k :=
  gamma_pos_of_base 2 2 (by norm_num) (by norm_num) gamma_base_2 k hk

end Erdos993G1.U3
-- VERITYOS ENTRY 53 END

-- VERITYOS ENTRY 54 BEGIN lemma Erdos993G1.U3.gamma_pos_3 bfd9e8d48f71c50d31cdc414901edd509198312db51da06a4055350d43025b02
namespace Erdos993G1.U3

/-- `K(3) = 3`. -/
lemma gamma_pos_3 (k : ℕ) (hk : 3 ≤ k) : 0 < Gamma 3 k :=
  gamma_pos_of_base 3 3 (by norm_num) (by norm_num) gamma_base_3 k hk

end Erdos993G1.U3
-- VERITYOS ENTRY 54 END

-- VERITYOS ENTRY 55 BEGIN lemma Erdos993G1.U3.gamma_pos_4 784f1aed5d8a8d2f0493174a5b1f4f8e4d771d487b13d3df552b0b3f89d239ff
namespace Erdos993G1.U3

/-- `K(4) = 4`. -/
lemma gamma_pos_4 (k : ℕ) (hk : 4 ≤ k) : 0 < Gamma 4 k :=
  gamma_pos_of_base 4 4 (by norm_num) (by norm_num) gamma_base_4 k hk

end Erdos993G1.U3
-- VERITYOS ENTRY 55 END

-- VERITYOS ENTRY 56 BEGIN lemma Erdos993G1.U3.gamma_pos_5 54b02dd3ad7edb8b01514d5337ad16b3ac2be183c59b1d4a73b7b06e81f8cf02
namespace Erdos993G1.U3

/-- `K(5) = 6`. -/
lemma gamma_pos_5 (k : ℕ) (hk : 6 ≤ k) : 0 < Gamma 5 k :=
  gamma_pos_of_base 5 6 (by norm_num) (by norm_num) gamma_base_5 k hk

end Erdos993G1.U3
-- VERITYOS ENTRY 56 END

-- VERITYOS ENTRY 57 BEGIN lemma Erdos993G1.U3.gamma_pos_6 090788c9ac83147c32528b674743344f6810e252f812d543b1f5c8fe49ad06a1
namespace Erdos993G1.U3

/-- `K(6) = 12`. -/
lemma gamma_pos_6 (k : ℕ) (hk : 12 ≤ k) : 0 < Gamma 6 k :=
  gamma_pos_of_base 6 12 (by norm_num) (by norm_num) gamma_base_6 k hk

end Erdos993G1.U3
-- VERITYOS ENTRY 57 END

-- VERITYOS ENTRY 58 BEGIN lemma Erdos993G1.U3.gamma_pos_7 a6fcba7f3274418f9685cdd085876c3ab52e5aa5045d2a32cbc3a8de8c635290
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 58 END

-- VERITYOS ENTRY 59 BEGIN lemma Erdos993G1.U3.catalan_succ_lt_four_mul 930c81b7dd0ffe2813ee3c0a64a39a99dedaf539d0c118ec464b2768557969b2
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 59 END

-- VERITYOS ENTRY 60 BEGIN lemma Erdos993G1.U3.catalan_pow_bound 4ca0d3b85a1e18096a7c8b2c552ff362b43809bd3778ef605afe404ff7a4bafa
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 60 END

-- VERITYOS ENTRY 61 BEGIN lemma Erdos993G1.U3.catalan_cross_lower dc11d53307bf3fbdfb05ad0d551a6a2ca8ee850e52a8eb807b0c5315c873f60b
namespace Erdos993G1.U3

lemma catalan_cross_lower (k j : ℕ) (hjk : j ≤ k) :
    catalan (k + 1) < 4 ^ (j + 1) * catalan (k - j) := by
  have h := catalan_pow_bound (k - j) (j + 1) (by omega)
  have heq : (k - j) + (j + 1) = k + 1 := by omega
  rwa [heq] at h

end Erdos993G1.U3
-- VERITYOS ENTRY 61 END

-- VERITYOS ENTRY 62 BEGIN lemma Erdos993G1.U3.binom_five_pow_split 850b77001b81603a8c0bc5a68742c51fbcc344f6494af8ad81af491998fa00a7
namespace Erdos993G1.U3

/-- The binomial-theorem identity behind the ceiling: `Σ_{j=1}^{τ} C(τ,j)
4^{τ-j} = 5^{τ} - 4^{τ}` (the `j = 0` term peeled from `(1+4)^τ = 5^τ`). -/
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

end Erdos993G1.U3
-- VERITYOS ENTRY 62 END

-- VERITYOS ENTRY 63 BEGIN lemma Erdos993G1.U3.five_pow_ge 148896dd9b1595bb61f4455b910af15a4b930b7810d75d0c230012d48125788d
namespace Erdos993G1.U3

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

end Erdos993G1.U3
-- VERITYOS ENTRY 63 END

-- VERITYOS ENTRY 64 BEGIN lemma Erdos993G1.U3.gamma_neg_of_ge_eight 4bf2db51b71d3d7eebaeaa8eddc35ffa01694560bd1b4e011d5ab92f09ce1077
namespace Erdos993G1.U3

/-- **The `τ ≥ 8` ceiling, closing obligation (1).** `Gamma τ k < 0` for
every `k ≥ τ` once `τ ≥ 8` — no upper bound on `k`, and general in `τ`. -/
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

end Erdos993G1.U3
-- VERITYOS ENTRY 64 END

-- VERITYOS ENTRY 65 BEGIN lemma Erdos993G1.U3.gamma_min_2 3260a8c4d61944fff253cb832c12e3d924322575c49b79d1bfe8b34c305dd1ce
namespace Erdos993G1.U3

set_option maxRecDepth 2000 in
lemma gamma_min_2 : Gamma 2 1 = 0 := by
  unfold Gamma; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 65 END

-- VERITYOS ENTRY 66 BEGIN lemma Erdos993G1.U3.gamma_min_3 29e02af05d48beae1b0d5bd4405e41f8dc66757598ef0b53cc72ac5b4afedb94
namespace Erdos993G1.U3

set_option maxRecDepth 2000 in
lemma gamma_min_3 : Gamma 3 2 = -1 := by
  unfold Gamma; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 66 END

-- VERITYOS ENTRY 67 BEGIN lemma Erdos993G1.U3.gamma_min_4 3f61a73282893cb1f0fdc29cdeedcffbf96c0f1a5dda2cca4f669b32b3b82f75
namespace Erdos993G1.U3

set_option maxRecDepth 2000 in
lemma gamma_min_4 : Gamma 4 3 = -4 := by
  unfold Gamma; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 67 END

-- VERITYOS ENTRY 68 BEGIN lemma Erdos993G1.U3.gamma_min_5 1acdaa0c8b1145bf1e59947a19e074562bbe7eda7d2b7449a779f5cacc7f40a5
namespace Erdos993G1.U3

set_option maxRecDepth 4000 in
lemma gamma_min_5 : Gamma 5 5 = -14 := by
  rw [Gamma_unfold (by norm_num : (5:ℕ) ≤ 5)]; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 68 END

-- VERITYOS ENTRY 69 BEGIN lemma Erdos993G1.U3.gamma_min_6 13465d6fae1efb18f4208e439fc142517740bbd23fffa39c21c59708bcc37df4
namespace Erdos993G1.U3

set_option maxRecDepth 4000 in
lemma gamma_min_6 : Gamma 6 11 = -1563 := by
  rw [Gamma_unfold (by norm_num : (6:ℕ) ≤ 11)]; simp only [catalan_eq_centralBinom_div]; decide

end Erdos993G1.U3
-- VERITYOS ENTRY 69 END

-- VERITYOS ENTRY 70 BEGIN lemma Erdos993G1.U3.gamma_min_7 849fa58e1779955d9788ad4640189d9d6101b421c793806e4c69c95c3a3387b7
namespace Erdos993G1.U3

set_option maxRecDepth 10000 in
lemma gamma_min_7 : Gamma 7 69 = -799363812466329793611557404284949737 := by
  rw [Gamma_unfold (by norm_num : (7:ℕ) ≤ 69)]; simp only [catalan_eq_centralBinom_div]; decide

/-! ### Terminal declaration.

The single `theorem` the governed workflow binds: the explicit conjunction
of the four parts of the award. Every component above is a lemma; this is
the only `theorem` in the project. -/

end Erdos993G1.U3
-- VERITYOS ENTRY 70 END

-- VERITYOS ENTRY 71 BEGIN lemma ErdosR25AddBdTail.sq_ge_self 27f413d010a4315bb57b7059b2fcf182f69c94eba42e28636105c974a5c44595
namespace ErdosR25AddBdTail

/-- `g ≤ g²` for every natural `g` (so the ℕ subtraction `g² − g` never
truncates). -/
lemma sq_ge_self (g : ℕ) : g ≤ g ^ 2 := Nat.le_self_pow (by norm_num) g

end ErdosR25AddBdTail
-- VERITYOS ENTRY 71 END

-- VERITYOS ENTRY 72 BEGIN lemma ErdosR25AddBdTail.gc_le_self 8f3b85e4243619db10561c20e964972859d61efb123542cfe3e94a632d97df68
namespace ErdosR25AddBdTail

/-- `g_c(m) ≤ m` for `m ≥ 3`: `g = m` itself already passes the transition
test, so minimality gives the bound. -/
lemma gc_le_self (m : ℕ) (hm : 3 ≤ m) : gc m ≤ m := by
  apply Nat.find_min' (transitionExists m)
  have hle : m ≤ m ^ 2 := sq_ge_self m
  rw [Nat.le_sub_iff_add_le hle]
  nlinarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 72 END

-- VERITYOS ENTRY 73 BEGIN lemma ErdosR25AddBdTail.gc_hpass_int 8bf60710eda6d68d99350327bad3357f2753dbe61e133ad281b28f3425274144
namespace ErdosR25AddBdTail

/-- The ℤ-cast pass bracket: `2m ≤ g_c(m)² − g_c(m)`. -/
lemma gc_hpass_int (m : ℕ) : 2 * (m : ℤ) ≤ (gc m : ℤ) ^ 2 - (gc m : ℤ) := by
  have hspec := Nat.find_spec (transitionExists m)
  have hle : gc m ≤ (gc m) ^ 2 := sq_ge_self (gc m)
  have hz : (2 * m : ℤ) ≤ (((gc m) ^ 2 - gc m : ℕ) : ℤ) := by exact_mod_cast hspec
  rw [Nat.cast_sub hle] at hz
  push_cast at hz
  linarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 73 END

-- VERITYOS ENTRY 74 BEGIN lemma ErdosR25AddBdTail.gc_pos 611e35262f7f9269764514f06b6dd98060a1b511b7220fa536a71c67abd96075
namespace ErdosR25AddBdTail

/-- `g_c(m) ≠ 0` for `m ≥ 1` (from `gc_hpass_int`, since `0² − 0 = 0 < 2m`). -/
lemma gc_pos (m : ℕ) (hm : 1 ≤ m) : 1 ≤ gc m := by
  by_contra h
  push Not at h
  have h0 : gc m = 0 := by omega
  have := gc_hpass_int m
  rw [h0] at this
  simp at this
  omega

end ErdosR25AddBdTail
-- VERITYOS ENTRY 74 END

-- VERITYOS ENTRY 75 BEGIN lemma ErdosR25AddBdTail.gc_hfail_int 186c4d7dad63533131a88fd3a48858bda062ed0bad3e26f9b8637335f5933125
namespace ErdosR25AddBdTail

/-- The ℤ-cast fail bracket at `g_c(m) − 1`. -/
lemma gc_hfail_int (m : ℕ) (hm : 1 ≤ m) :
    ((gc m : ℤ) - 1) ^ 2 - ((gc m : ℤ) - 1) < 2 * (m : ℤ) := by
  have hpos := gc_pos m hm
  have hlt : gc m - 1 < gc m := by omega
  have hmin := Nat.find_min (transitionExists m) hlt
  -- hmin : ¬ (2 * m ≤ (gc m - 1) ^ 2 - (gc m - 1))
  have hle : (gc m - 1) ≤ (gc m - 1) ^ 2 := sq_ge_self (gc m - 1)
  have hnat : (gc m - 1) ^ 2 - (gc m - 1) < 2 * m := by omega
  have hz : (((gc m - 1) ^ 2 - (gc m - 1) : ℕ) : ℤ) < (2 * m : ℤ) := by exact_mod_cast hnat
  have hcastpow : (((gc m - 1) ^ 2 - (gc m - 1) : ℕ) : ℤ)
      = ((gc m - 1 : ℕ) : ℤ) ^ 2 - ((gc m - 1 : ℕ) : ℤ) := by
    rw [Nat.cast_sub hle]; push_cast; ring
  have hcastsub : ((gc m - 1 : ℕ) : ℤ) = (gc m : ℤ) - 1 := by
    have h1 : (1 : ℕ) ≤ gc m := hpos
    omega
  rw [hcastpow, hcastsub] at hz
  linarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 75 END

-- VERITYOS ENTRY 76 BEGIN lemma ErdosR25AddBdTail.D_peak_le_cat 9fc4f77be719c65a5a05c5bc4c71a1ba298bb37614ab43f5aeee82c39a66720e
namespace ErdosR25AddBdTail

/-- `D` at the transition witness `g_c(m)` is at most `Cat_{m-1}`, for `m ≥ 7`. -/
lemma D_peak_le_cat (m : ℕ) (hm : 7 ≤ m) :
    D (2 * (m : ℤ) - (gc m : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ) :=
  interior_peak_le_cat m (gc m) hm (gc_le_self m (by omega)) (gc_hpass_int m)
    (gc_hfail_int m (by omega))

end ErdosR25AddBdTail
-- VERITYOS ENTRY 76 END

-- VERITYOS ENTRY 77 BEGIN lemma ErdosR25AddBdTail.D_mono_up 790336cc1722f8250fb40394bf8e35e089877e5cb7f7f780e294cea4c7fa2ce9
namespace ErdosR25AddBdTail

/-- Ascending chain below the transition point (re-proved on this project's
frame, using the imported `D_step_up`). -/
lemma D_mono_up (m : ℕ) (hm : 1 ≤ m) (g : ℕ) :
    ∀ j : ℕ, g ≤ j → j ≤ m →
      (∀ i : ℕ, g ≤ i → i < j → (i : ℤ) ^ 2 - (i : ℤ) < 2 * (m : ℤ)) →
      D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ D (2 * (m : ℤ) - (j : ℤ)) (m : ℤ) := by
  intro j
  induction j with
  | zero =>
    intro h1 _ _
    have hg0 : g = 0 := Nat.le_zero.mp h1
    rw [hg0]
  | succ n ih =>
    intro h1 h2 h3
    rcases Nat.lt_or_ge n g with hlt | hge
    · have hgn : g = n + 1 := by omega
      rw [hgn]
    · have step : D (2 * (m : ℤ) - (n : ℤ)) (m : ℤ)
          < D (2 * (m : ℤ) - ((n : ℤ) + 1)) (m : ℤ) :=
        D_step_up m n (by omega) hm (h3 n hge (by omega))
      have prev := ih hge (by omega) (fun i hi hi2 => h3 i hi (by omega))
      have hcast : ((n + 1 : ℕ) : ℤ) = (n : ℤ) + 1 := by push_cast; ring
      rw [hcast]
      linarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 77 END

-- VERITYOS ENTRY 78 BEGIN lemma ErdosR25AddBdTail.D_mono_down 226eff3846df666f0c50954fd36af51cc1a99b2bc3b99af322acab4f1f973df0
namespace ErdosR25AddBdTail

/-- Descending chain from the transition point (re-proved on this project's
frame, using the imported `D_step_down`, which is already non-strict). -/
lemma D_mono_down (m : ℕ) (hm : 1 ≤ m) (gcc : ℕ) :
    ∀ j : ℕ, gcc ≤ j → j ≤ m →
      (∀ i : ℕ, gcc ≤ i → i < j → 2 * (m : ℤ) ≤ (i : ℤ) ^ 2 - (i : ℤ)) →
      D (2 * (m : ℤ) - (j : ℤ)) (m : ℤ) ≤ D (2 * (m : ℤ) - (gcc : ℤ)) (m : ℤ) := by
  intro j
  induction j with
  | zero =>
    intro h1 _ _
    have : gcc = 0 := Nat.le_zero.mp h1
    rw [this]
  | succ n ih =>
    intro h1 h2 h3
    rcases Nat.lt_or_ge n gcc with hlt | hge
    · have : gcc = n + 1 := by omega
      rw [this]
    · have step : D (2 * (m : ℤ) - ((n : ℤ) + 1)) (m : ℤ) ≤ D (2 * (m : ℤ) - (n : ℤ)) (m : ℤ) :=
        D_step_down m n (by omega) hm (h3 n hge (by omega))
      have prev := ih hge (by omega) (fun i hi hi2 => h3 i hi (by omega))
      have hcast : ((n + 1 : ℕ) : ℤ) = (n : ℤ) + 1 := by push_cast; ring
      rw [hcast]
      linarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 78 END

-- VERITYOS ENTRY 79 BEGIN lemma ErdosR25AddBdTail.below_gc_fails 00eab02cf45438de7606b518a882cc16ab7789cf33a1ccd92f2bfd6be377b840
namespace ErdosR25AddBdTail

/-- Every index below `g_c(m)` fails the transition test (ℤ-cast form):
immediate from the minimality of `Nat.find`. -/
lemma below_gc_fails (m i : ℕ) (hi : i < gc m) :
    (i : ℤ) ^ 2 - (i : ℤ) < 2 * (m : ℤ) := by
  have hmin := Nat.find_min (transitionExists m) hi
  have hle : i ≤ i ^ 2 := sq_ge_self i
  have hnat : i ^ 2 - i < 2 * m := by omega
  have hz : ((i ^ 2 - i : ℕ) : ℤ) < (2 * m : ℤ) := by exact_mod_cast hnat
  rw [Nat.cast_sub hle] at hz
  push_cast at hz
  linarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 79 END

-- VERITYOS ENTRY 80 BEGIN lemma ErdosR25AddBdTail.sq_sub_self_mono 6604312ff85ca122ebba2b2fbc64a023495c2825d9e727a0d007997dcc6e6110
namespace ErdosR25AddBdTail

/-- The function `g ↦ g² − g` (over ℤ, `g ≥ 0`) is monotone: if `a ≤ b` then
`a² − a ≤ b² − b`. -/
lemma sq_sub_self_mono {a b : ℤ} (ha : 0 ≤ a) (hab : a ≤ b) : a ^ 2 - a ≤ b ^ 2 - b := by
  nlinarith [sq_nonneg (b - a)]

end ErdosR25AddBdTail
-- VERITYOS ENTRY 80 END

-- VERITYOS ENTRY 81 BEGIN lemma ErdosR25AddBdTail.D_range_le_cat 0e90ae5c981ff6083fbd0bac1c36e84b32a1dc101fce5749211e3cd521907337
namespace ErdosR25AddBdTail

/-- **Node 8, the full lift.** For `m ≥ 7` and every `g ≤ m`,
`D(2m−g,m) ≤ Cat_{m-1}` — the step-sign law walks every `g` to the transition
witness `g_c(m)` (`D_step_up` below it, `D_step_down` at/above it), which is
then bounded by `interior_peak_le_cat`. The maximiser is never asserted to
exist independently of the `Nat.find` witness. -/
lemma D_range_le_cat (m : ℕ) (hm : 7 ≤ m) (g : ℕ) (hg : g ≤ m) :
    D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ) := by
  rcases Nat.le_total g (gc m) with h | h
  · have hstep : D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ D (2 * (m : ℤ) - (gc m : ℤ)) (m : ℤ) :=
      D_mono_up m (by omega) g (gc m) h (gc_le_self m (by omega))
        (fun i _ hi => below_gc_fails m i hi)
    exact le_trans hstep (D_peak_le_cat m hm)
  · have hstep : D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ D (2 * (m : ℤ) - (gc m : ℤ)) (m : ℤ) :=
      D_mono_down m (by omega) (gc m) g h hg
        (fun i hi _ => by
          have hcast : (gc m : ℤ) ≤ (i : ℤ) := by exact_mod_cast hi
          exact le_trans (gc_hpass_int m) (sq_sub_self_mono (by positivity) hcast))
    exact le_trans hstep (D_peak_le_cat m hm)

end ErdosR25AddBdTail
-- VERITYOS ENTRY 81 END

-- VERITYOS ENTRY 82 BEGIN lemma ErdosR25AddBdTail.catalan_ge_one eadc27b96a8ccce0384eb36f08dc3fbaba32468f1e67af4fcd2055faecc0f6bb
namespace ErdosR25AddBdTail

/-- Every Catalan number is at least `1`. -/
lemma catalan_ge_one (n : ℕ) : 1 ≤ catalan n := by
  rcases Nat.eq_zero_or_pos (catalan n) with h0 | hpos
  · exfalso
    have heq := succ_mul_catalan_eq_centralBinom n
    rw [h0, mul_zero] at heq
    have hcb : 0 < Nat.centralBinom n := by
      rw [Nat.centralBinom_eq_two_mul_choose]
      exact Nat.choose_pos (by omega)
    omega
  · exact hpos

end ErdosR25AddBdTail
-- VERITYOS ENTRY 82 END

-- VERITYOS ENTRY 83 BEGIN lemma ErdosR25AddBdTail.D_blt_m_eq 9ea0605aa60863f0e696c91b8c1c456e5d748db83513fbcd41750419510bdb34
namespace ErdosR25AddBdTail

/-- **The `b < m` region.** `D(b,m) = C(b,m-1)` (the other two `Cz` terms
vanish since `b < m ≤ m+1` and `b < m`), so `D(b,m) ≤ 1 ≤ Cat_{m-1}`. -/
lemma D_blt_m_eq (b m : ℕ) (hb : b < m) : D (b : ℤ) (m : ℤ) = Cz (b : ℤ) ((m : ℤ) - 1) := by
  have h1 : Cz (b : ℤ) ((m : ℤ) + 1) = 0 := by
    rw [Cz_cast_add_one b m, Nat.choose_eq_zero_of_lt (by omega)]
    norm_num
  have h2 : Cz (b : ℤ) (m : ℤ) = 0 := by
    rw [Cz_natCast b m, Nat.choose_eq_zero_of_lt hb]
    norm_num
  unfold D
  rw [h1, h2]
  ring

end ErdosR25AddBdTail
-- VERITYOS ENTRY 83 END

-- VERITYOS ENTRY 84 BEGIN lemma ErdosR25AddBdTail.Cz_blt_m_le_one de845dde4d50d6cf22c26ec0ac439f67a762a08b7703cbfaec457d9b1bcb2125
namespace ErdosR25AddBdTail

lemma Cz_blt_m_le_one (b m : ℕ) (hb : b < m) : Cz (b : ℤ) ((m : ℤ) - 1) ≤ 1 := by
  have hmz : (m : ℤ) - 1 = ((m - 1 : ℕ) : ℤ) := by omega
  rw [hmz, Cz_natCast]
  rcases Nat.lt_or_ge b (m - 1) with hlt | hge
  · rw [Nat.choose_eq_zero_of_lt hlt]; norm_num
  · have : b = m - 1 := by omega
    rw [this, Nat.choose_self]
    norm_num

end ErdosR25AddBdTail
-- VERITYOS ENTRY 84 END

-- VERITYOS ENTRY 85 BEGIN lemma ErdosR25AddBdTail.D_blt_m_le_cat d1b8e162b0dea72926aa5fc5da9d5e6d7e4f20f93f935d899bd9e33ca77e3257
namespace ErdosR25AddBdTail

lemma D_blt_m_le_cat (b m : ℕ) (hb : b < m) : D (b : ℤ) (m : ℤ) ≤ (catalan (m - 1) : ℤ) := by
  rw [D_blt_m_eq b m hb]
  have h1 := Cz_blt_m_le_one b m hb
  have h2 : (1:ℤ) ≤ (catalan (m-1) : ℤ) := by exact_mod_cast catalan_ge_one (m - 1)
  linarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 85 END

-- VERITYOS ENTRY 86 BEGIN lemma ErdosR25AddBdTail.D_tail_closed_form 74a2f6bb6a882c5e6d479a6c9c7a6b053d2ba6ac116da6c79016300e345316ed
namespace ErdosR25AddBdTail

/-- **Node 9's tail clause, the closed form.** At `b = 2m+j` (`j ≥ 0`),
the SAME algebraic derivation as `D_closed_form` (via `choose_ratio_up` and
`choose_ratio_down` at `b = 2m+j`, always in Pascal range since `m ≤ 2m+j`)
gives `D(2m+j,m)·(m+1)·(m+j+1) = C(2m+j,m)·(j² − j − 2m − 2)`. -/
lemma D_tail_closed_form (m j : ℕ) (hm : 1 ≤ m) :
    D (2 * (m : ℤ) + (j : ℤ)) (m : ℤ) * ((m : ℤ) + 1) * ((m : ℤ) + (j : ℤ) + 1)
      = Cz (2 * (m : ℤ) + (j : ℤ)) (m : ℤ) * ((j : ℤ) ^ 2 - (j : ℤ) - 2 * (m : ℤ) - 2) := by
  set b : ℕ := 2 * m + j with hbdef
  have hbm : m ≤ b := by omega
  have hbZ : 2 * (m : ℤ) + (j : ℤ) = (b : ℤ) := by rw [hbdef]; push_cast; ring
  rw [hbZ]
  have e1 : (Nat.choose b (m + 1) : ℤ) * ((m : ℤ) + 1)
      = (Nat.choose b m : ℤ) * ((b : ℤ) - (m : ℤ)) := choose_ratio_up b m hbm
  have e2 : (Nat.choose b m : ℤ) * (m : ℤ)
      = (Nat.choose b (m - 1) : ℤ) * ((b : ℤ) - (m : ℤ) + 1) := choose_ratio_down b m hm hbm
  have hgb : (b : ℤ) - (m : ℤ) = (m : ℤ) + (j : ℤ) := by rw [← hbZ]; ring
  rw [hgb] at e1 e2
  unfold D
  rw [Cz_cast_add_one b m, Cz_natCast b m, Cz_cast_sub_one b m hm]
  linear_combination ((m : ℤ) + (j : ℤ) + 1) * e1 - ((m : ℤ) + 1) * e2

end ErdosR25AddBdTail
-- VERITYOS ENTRY 86 END

-- VERITYOS ENTRY 87 BEGIN lemma ErdosR25AddBdTail.D_tail_le_cat 75775e260f769e0b1d3935fc6c36850d6b3e3058d6bd17e080aad383388dbb9d
namespace ErdosR25AddBdTail

/-- **Node 9's tail clause.** For `m ≥ 9` and `j = 1..5` (i.e. `a − 1 ≤ 5`
indices `b = 2m+j ∈ [2m+1, 2m+a−1]`, `a ≤ 6`), `D(2m+j,m) ≤ 0 ≤ Cat_{m-1}`
— NOT a blanket non-positivity claim above `2m` (`D(100,1) = 4751 > 0`), only
on exactly these five indices at this rank floor. -/
lemma D_tail_le_cat (m j : ℕ) (hm : 9 ≤ m) (hj1 : 1 ≤ j) (hj5 : j ≤ 5) :
    D (2 * (m : ℤ) + (j : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ) := by
  have hcf := D_tail_closed_form m j (by omega)
  have hCnn : 0 ≤ Cz (2 * (m : ℤ) + (j : ℤ)) (m : ℤ) := Cz_nonneg _ _
  have hsign : (j : ℤ) ^ 2 - (j : ℤ) - 2 * (m : ℤ) - 2 ≤ 0 := by nlinarith
  have hrhs_nonpos : Cz (2 * (m : ℤ) + (j : ℤ)) (m : ℤ)
      * ((j : ℤ) ^ 2 - (j : ℤ) - 2 * (m : ℤ) - 2) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hCnn hsign
  have hfacpos : (0 : ℤ) < ((m : ℤ) + 1) * ((m : ℤ) + (j : ℤ) + 1) := by positivity
  have hDnonpos : D (2 * (m : ℤ) + (j : ℤ)) (m : ℤ) ≤ 0 := by
    by_contra hcon
    push Not at hcon
    have : 0 < D (2 * (m : ℤ) + (j : ℤ)) (m : ℤ) * ((m : ℤ) + 1) * ((m : ℤ) + (j : ℤ) + 1) := by
      apply mul_pos (mul_pos hcon (by linarith)) (by linarith)
    rw [hcf] at this
    linarith
  have hcat0 : (0:ℤ) ≤ (catalan (m-1) : ℤ) := by positivity
  linarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 87 END

-- VERITYOS ENTRY 88 BEGIN lemma ErdosR25AddBdTail.centralBinom_eq_two_mul_choose_pred 883f45a88edacbd69eafb9541b90bf6a0d950c928c434fa482bc24e1d4a34b74
namespace ErdosR25AddBdTail

/-- Pascal symmetry + the standard `(n+1)·Cat_n = centralBinom n` identity give
`C(2r,r) = 2·C(2r−1,r)` for `r ≥ 1`. -/
lemma centralBinom_eq_two_mul_choose_pred (r : ℕ) (hr : 1 ≤ r) :
    Nat.choose (2 * r) r = 2 * Nat.choose (2 * r - 1) r := by
  have hpascal := Nat.choose_succ_succ' (2 * r - 1) (r - 1)
  have heq1 : 2 * r - 1 + 1 = 2 * r := by omega
  have heq2 : r - 1 + 1 = r := by omega
  rw [heq1, heq2] at hpascal
  -- hpascal : (2r).choose r = (2r-1).choose (r-1) + (2r-1).choose (r-1+1)
  have hsymm := Nat.choose_symm (n := 2 * r - 1) (k := r) (by omega)
  have hidx : (2 * r - 1) - r = r - 1 := by omega
  rw [hidx] at hsymm
  -- hsymm : (2r-1).choose (r-1) = (2r-1).choose r
  omega

end ErdosR25AddBdTail
-- VERITYOS ENTRY 88 END

-- VERITYOS ENTRY 89 BEGIN lemma ErdosR25AddBdTail.D_outer_eq_neg_cat aed3b29e5cac050ce3164d266c3547ee0bffa93acb26c4fe75c0c8612cf9d7ce
namespace ErdosR25AddBdTail

/-- **Node 9, the outer identity.** `D(2r−1,r) = −Cat_r`, `r ≥ 1`: from
`D_closed_form` at `g = 1` (`N(1) = −2r`), Pascal symmetry
(`C(2r,r) = 2·C(2r−1,r)`) and the standard `(r+1)·Cat_r = C(2r,r)`. -/
lemma D_outer_eq_neg_cat (r : ℕ) (hr : 1 ≤ r) :
    D (2 * (r : ℤ) - 1) (r : ℤ) = -(catalan r : ℤ) := by
  have E1 := D_closed_form r 1 (by omega) hr
  -- E1 : D(2r-1,r)*(r+1)*(r-1+1) = C(2r-1,r)*N(1),  N(1) = 1+1-2r-2 = -2r
  have hcast : ((1:ℕ):ℤ) = (1:ℤ) := by norm_num
  have hrsub : (r:ℤ) - (1:ℤ) + 1 = (r:ℤ) := by ring
  unfold N at E1
  rw [hcast, hrsub] at E1
  -- E1 : D(2r-1,r) * (r+1) * r = C(2r-1,r) * (1+1-2r-2) = C(2r-1,r) * (-2r)
  have hpascal : (Nat.choose (2*r) r : ℤ) = 2 * (Nat.choose (2*r-1) r : ℤ) := by
    exact_mod_cast centralBinom_eq_two_mul_choose_pred r hr
  have hcatalan : ((r:ℤ)+1) * (catalan r : ℤ) = (Nat.choose (2*r) r : ℤ) := by
    have h := succ_mul_catalan_eq_centralBinom r
    have hcb : Nat.centralBinom r = Nat.choose (2*r) r := Nat.centralBinom_eq_two_mul_choose r
    rw [hcb] at h
    exact_mod_cast h
  have hCz : Cz (2 * (r:ℤ) - 1) (r:ℤ) = (Nat.choose (2*r-1) r : ℤ) := by
    have hbZ : 2 * (r:ℤ) - 1 = ((2*r-1 : ℕ):ℤ) := by
      have h1 : (1:ℕ) ≤ 2*r := by omega
      rw [Nat.cast_sub h1]; push_cast; ring
    rw [hbZ]; exact Cz_natCast _ _
  rw [hCz] at E1
  have hr0 : (r:ℤ) ≠ 0 := by exact_mod_cast (show r ≠ 0 by omega)
  have hr1 : ((r:ℤ)+1) ≠ 0 := by positivity
  have key : D (2 * (r : ℤ) - 1) (r : ℤ) * (r:ℤ) * ((r:ℤ)+1)
      + (catalan r:ℤ) * (r:ℤ) * ((r:ℤ)+1) = 0 := by
    linear_combination E1 + (r:ℤ) * hpascal + (r:ℤ) * hcatalan
  have hfac : ((r:ℤ) * ((r:ℤ)+1)) ≠ 0 := mul_ne_zero hr0 hr1
  have key2 : (D (2 * (r : ℤ) - 1) (r : ℤ) + (catalan r:ℤ)) * ((r:ℤ) * ((r:ℤ)+1)) = 0 := by
    linear_combination key
  rcases mul_eq_zero.mp key2 with h | h
  · linarith
  · exact absurd h hfac

end ErdosR25AddBdTail
-- VERITYOS ENTRY 89 END

-- VERITYOS ENTRY 90 BEGIN lemma ErdosR25AddBdTail.MaR_le_cat b1187bc0f856ca3ed13a2e07ed69dcc679a4f260fe811ddcbcdd01dfbce98261
namespace ErdosR25AddBdTail

/-- **Node 10.** `M_a(r) ≤ Cat_{r-1-a}` for `1 ≤ a ≤ 6`, `r ≥ 15`: `Finset.sup'_le`
over the Hall range, split into the three cases `b < m`, `m ≤ b ≤ 2m`,
`2m < b ≤ 2m + a - 1` with `m = r - a ≥ 9`. -/
lemma MaR_le_cat (a r : ℕ) (ha1 : 1 ≤ a) (ha6 : a ≤ 6) (hr : 15 ≤ r) :
    MaR a r ≤ (catalan (r - 1 - a) : ℤ) := by
  set m : ℕ := r - a with hmdef
  have hrma : r = m + a := by omega
  have hm9 : 9 ≤ m := by omega
  have hmZ : (r : ℤ) - (a : ℤ) = (m : ℤ) := by
    rw [hmdef]; push_cast [Nat.cast_sub (show a ≤ r by omega)]; ring
  have hm1a : r - 1 - a = m - 1 := by omega
  rw [hm1a]
  unfold MaR
  rw [hmZ]
  apply Finset.sup'_le
  intro b hb
  rw [Finset.mem_range] at hb
  -- hb : b < 2 * r - 1 - a + 1, i.e. b ≤ 2 * r - 1 - a = 2m + a - 1
  have hbound : b ≤ 2 * m + a - 1 := by omega
  rcases Nat.lt_or_ge b m with hcase1 | hcase1
  · -- b < m
    exact D_blt_m_le_cat b m hcase1
  · rcases Nat.lt_or_ge (2 * m) b with hcase2 | hcase2
    · -- 2m < b ≤ 2m + a - 1
      set j : ℕ := b - 2 * m with hjdef
      have hj1 : 1 ≤ j := by omega
      have hj5 : j ≤ 5 := by omega
      have hbeq : (b : ℤ) = 2 * (m : ℤ) + (j : ℤ) := by
        have hbj : b = 2 * m + j := by omega
        rw [hbj]; push_cast; ring
      rw [hbeq]
      exact D_tail_le_cat m j hm9 hj1 hj5
    · -- m ≤ b ≤ 2m : write b = 2m - g
      set g : ℕ := 2 * m - b with hgdef
      have hgm : g ≤ m := by omega
      have hbeq : (b : ℤ) = 2 * (m : ℤ) - (g : ℤ) := by
        have hbg : b = 2 * m - g := by omega
        rw [hbg]
        have h2mg : g ≤ 2 * m := by omega
        push_cast [Nat.cast_sub h2mg]
        ring
      rw [hbeq]
      exact D_range_le_cat m (by omega) g hgm

end ErdosR25AddBdTail
-- VERITYOS ENTRY 90 END

-- VERITYOS ENTRY 91 BEGIN lemma ErdosR25AddBdTail.node11_bridge ac8bcab13ba9cc84f89babef0dc7ddedd04b85dc34dacb14e747987a13f23452
namespace ErdosR25AddBdTail

/-- **Node 11.** `Cat_r − Σ_{a=1}^{6} C(6,a)·Cat_{r−1−a} = Γ(6, r−1)` — a
definitional bridge to the C3 award's `Erdos993G1.U3.Gamma 6 (r-1)` (zero
extension inactive on this range since `a ≤ 6 ≤ r − 1`). -/
lemma node11_bridge (r : ℕ) (hr : 7 ≤ r) :
    (catalan r : ℤ) - ∑ a ∈ Finset.Icc 1 6, (Nat.choose 6 a : ℤ) * (catalan (r - 1 - a) : ℤ)
      = Erdos993G1.U3.Gamma 6 (r - 1) := by
  rw [Erdos993G1.U3.Gamma_unfold (show 6 ≤ r - 1 by omega)]
  have hre : r - 1 + 1 = r := by omega
  rw [hre]

end ErdosR25AddBdTail
-- VERITYOS ENTRY 91 END

-- VERITYOS ENTRY 92 BEGIN lemma ErdosR25AddBdTail.BdRR_le_neg_gamma 561dc299070c13ae0ba5f439e47a67085763d2c57707aac43eb98e0a04815ef7
namespace ErdosR25AddBdTail

/-- **Assembly.** `BdRR r ≤ −Γ(6, r−1)`, `r ≥ 15`: node 9's outer identity,
node 10's pointwise bound summed via `Finset.sum_le_sum`, and node 11's bridge. -/
lemma BdRR_le_neg_gamma (r : ℕ) (hr : 15 ≤ r) :
    BdRR r ≤ -(Erdos993G1.U3.Gamma 6 (r - 1)) := by
  unfold BdRR
  rw [D_outer_eq_neg_cat r (by omega)]
  have hsum : ∑ a ∈ Finset.Icc 1 6, (Nat.choose 6 a : ℤ) * max 0 (MaR a r)
      ≤ ∑ a ∈ Finset.Icc 1 6, (Nat.choose 6 a : ℤ) * (catalan (r - 1 - a) : ℤ) := by
    apply Finset.sum_le_sum
    intro a ha
    have ha1 : 1 ≤ a := (Finset.mem_Icc.mp ha).1
    have ha6 : a ≤ 6 := (Finset.mem_Icc.mp ha).2
    have hcnn : (0 : ℤ) ≤ (Nat.choose 6 a : ℤ) := Int.natCast_nonneg _
    have hcatnn : (0:ℤ) ≤ (catalan (r-1-a) : ℤ) := by positivity
    have hmax : max 0 (MaR a r) ≤ (catalan (r-1-a) : ℤ) :=
      max_le hcatnn (MaR_le_cat a r ha1 ha6 hr)
    exact mul_le_mul_of_nonneg_left hmax hcnn
  have hbridge := node11_bridge r (by omega)
  linarith [hsum, hbridge]

end ErdosR25AddBdTail
-- VERITYOS ENTRY 92 END

-- VERITYOS ENTRY 93 BEGIN lemma ErdosR25AddBdTail.BdRR_neg_ge15 071e8be966f1c9f04e3155aa9b2ffbedfb7fae20e5922fcbde67b20e0fd07827
namespace ErdosR25AddBdTail

/-- `BdRR r < 0` for `r ≥ 15`: the assembly bound composed with the C3 award's
`gamma_pos_6`. -/
lemma BdRR_neg_ge15 (r : ℕ) (hr : 15 ≤ r) : BdRR r < 0 := by
  have hle := BdRR_le_neg_gamma r hr
  have hpos := Erdos993G1.U3.gamma_pos_6 (r - 1) (by omega)
  linarith

end ErdosR25AddBdTail
-- VERITYOS ENTRY 93 END

-- VERITYOS ENTRY 94 BEGIN lemma ErdosR25AddBdTail.layer_fixed_points 7d2d257ef8024963364b36da9e7f6db08586704749c3cb4b00090d442cf0a13c
namespace ErdosR25AddBdTail

/-- Fixed-point validation, reproduced by `decide` on this project's `MaR`/`BdRR`
before anything else (the definition-of-record check). -/
lemma layer_fixed_points : BdRR 4 = 48 ∧ BdRR 5 = 33 ∧ BdRR 6 = -16 ∧ BdRR 10 = -14406 := by
  decide

end ErdosR25AddBdTail
-- VERITYOS ENTRY 94 END

-- VERITYOS ENTRY 95 BEGIN lemma ErdosR25AddBdTail.layer_six_to_fourteen 55641145c6e95b9612b9e505f4156b45625dc2c39a47042af873a18a319f7d4d
namespace ErdosR25AddBdTail

set_option maxRecDepth 8000 in
/-- **Node 13, the `[6,14]` layer.** `Bd(r,r) < 0` for every `r ∈ [6,14]`, by
plain `decide` through the assembled `BdRR` — a separate case, never folded
into the general `r ≥ 15` argument. -/
lemma layer_six_to_fourteen (r : ℕ) (h6 : 6 ≤ r) (h14 : r ≤ 14) : BdRR r < 0 := by
  interval_cases r <;> decide

end ErdosR25AddBdTail
-- VERITYOS ENTRY 95 END

-- VERITYOS ENTRY 96 BEGIN theorem ErdosR25AddBdTail.bdTailNegative_award a2307d14cf605c826d9393931adf87e4adeb6f1d3d627b621caa693340d4eab9
namespace ErdosR25AddBdTail

/-- **Terminal.** `Bd(r,r) < 0` for every `r ≥ 6`, by cases on `r ≤ 14`
(the layer) versus `r ≥ 15` (the assembly). -/
theorem bdTailNegative_award : ∀ r : ℕ, 6 ≤ r → BdRR r < 0 := by
  intro r hr
  by_cases h : r ≤ 14
  · exact layer_six_to_fourteen r hr h
  · exact BdRR_neg_ge15 r (by omega)

end ErdosR25AddBdTail
-- VERITYOS ENTRY 96 END

