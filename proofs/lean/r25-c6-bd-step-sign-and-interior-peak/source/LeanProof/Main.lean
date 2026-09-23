import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition ErdosR25C6U2.Cz 50ded33609638bf6719076c100789683490e55e56bfd1eb7a60c23de4225c84e
namespace ErdosR25C6U2

/-- Zero-extended integer binomial coefficient: `Cz n k = C(n,k)` for
`0 ≤ k ≤ n` (the `k > n` case is already zero by `Nat.choose` itself), and
`0` for negative `n` or `k`. This is the run's zero-extension convention
(`SEMANTIC-CONTRACT.md`) applied to `C`. -/
def Cz (n k : ℤ) : ℤ :=
  if 0 ≤ n ∧ 0 ≤ k then (Nat.choose n.toNat k.toNat : ℤ) else 0

end ErdosR25C6U2
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

-- VERITYOS ENTRY 6 BEGIN lemma ErdosR25C6U2.Cz_natCast a2532457b7656bbe6f0f947a1348aeef7019069224b59db669cd4539b709728d
namespace ErdosR25C6U2

lemma Cz_natCast (n k : ℕ) : Cz (n : ℤ) (k : ℤ) = (Nat.choose n k : ℤ) := by
  simp [Cz]

end ErdosR25C6U2
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma ErdosR25C6U2.Cz_cast_add_one 677e3b00613e57265d155ca6ccb0e43c515fdd20f78d60f7a608a2c5412e00e5
namespace ErdosR25C6U2

lemma Cz_cast_add_one (n k : ℕ) : Cz (n : ℤ) ((k : ℤ) + 1) = (Nat.choose n (k + 1) : ℤ) := by
  have hh : ((k : ℤ) + 1) = ((k + 1 : ℕ) : ℤ) := by push_cast; ring
  rw [hh]; exact Cz_natCast n (k + 1)

end ErdosR25C6U2
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma ErdosR25C6U2.Cz_cast_sub_one 3228e85a936e4e60223f64d03187b8d77082af7573a01ba713ac943403d6517a
namespace ErdosR25C6U2

lemma Cz_cast_sub_one (n k : ℕ) (hk : 1 ≤ k) :
    Cz (n : ℤ) ((k : ℤ) - 1) = (Nat.choose n (k - 1) : ℤ) := by
  have hh : ((k : ℤ) - 1) = ((k - 1 : ℕ) : ℤ) := by
    rw [Nat.cast_sub hk]; push_cast; ring
  rw [hh]; exact Cz_natCast n (k - 1)

end ErdosR25C6U2
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma ErdosR25C6U2.choose_ratio_up ee21fa8970bb189a473f9fdf151f4902cf6e9077a2e9f296ae94bd0015d7367c
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
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma ErdosR25C6U2.choose_ratio_down 6024954cd047dd7479464e1bf0597da8c5c63a6ee99290dfa23b91319d0ee9a3
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
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma ErdosR25C6U2.D_closed_form 4b0502be89360fdeb4df0bb14f9d0b9251b54b32d75a1553b21f62835c45a599
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
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN lemma ErdosR25C6U2.L_eq 5b84b5e6509b6b744f65108e80193faf9ae39aff65417b5aafe46c5acf175aef
namespace ErdosR25C6U2

lemma L_eq (m g : ℤ) : L m g = (m + 1 - g) * N m (g + 1) := by unfold L N; ring

end ErdosR25C6U2
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN lemma ErdosR25C6U2.R_eq 9543941c4fdfc3d463191afb71b5b361b9c37bdd7a40a31f87810e9e3af449c6
namespace ErdosR25C6U2

lemma R_eq (m g : ℤ) : R m g = (2 * m - g) * N m g := by unfold R N; ring

end ErdosR25C6U2
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma ErdosR25C6U2.L_sub_R 722a0cc9194d1713d439d779750241e89d56061df47624871fdd55df3a1f6a06
namespace ErdosR25C6U2

/-- **Node (2a), the ratio-test identity** (seat U2).
`L(g) − R(g) = (m+1)(2m−g²+g)`. -/
lemma L_sub_R (m g : ℤ) : L m g - R m g = (m + 1) * (2 * m - g ^ 2 + g) := by
  unfold L R; ring

end ErdosR25C6U2
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma ErdosR25C6U2.peak_bracket_integral 04c03dd25bb1678ba41999f1fc7b5b85e497a125779030e81334d139bef6c46a
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
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma ErdosR25C6U2.gc_ge_five 2bce262893b5cc45037a62cae866e4198d94345e533c3be42044fe52f7adf5d3
namespace ErdosR25C6U2

/-- `g_c(m) ≥ 5` for `m ≥ 7` (seat U2, node 7 apparatus). -/
lemma gc_ge_five (m : ℤ) (g : ℕ) (hm : 7 ≤ m) (hpass : 2 * m ≤ (g : ℤ) ^ 2 - g) :
    5 ≤ g := by
  by_contra h
  push_neg at h
  interval_cases g <;> norm_num at hpass <;> omega

end ErdosR25C6U2
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma ErdosR25C6U2.three_gc_le fde6377af9dab8359827145a426500f478802a8269e3da4f661f0111640e9aac
namespace ErdosR25C6U2

/-- `3·g_c ≤ 2m + 2` for `m ≥ 7` (seat U2, node 7 apparatus). -/
lemma three_gc_le (m : ℤ) (g : ℕ) (hg1 : 1 ≤ g) (hm : 7 ≤ m)
    (hfail : ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * m) :
    3 * (g : ℤ) ≤ 2 * m + 2 := by
  nlinarith [hfail, hm, sq_nonneg ((g : ℤ) - m), hg1]

end ErdosR25C6U2
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma ErdosR25C6U2.gc_star_bound f6efc49695fc03f13279c6ccea2a15e1922addb9865c47c80acdb002a44b4844
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
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma ErdosR25C6U2.choose_double_step 4fc30785cd30e717b8d428c317b4adbf81500eaed9f41b2668e445914d284450
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
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma ErdosR25C6U2.row_ratio b3b4e0ad34d458e0a2f82bd10a6f4bb8814b0fcc175ac5f4e7e00aa17fbbfcfd
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
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma ErdosR25C6U2.catalan_centralBinom_gap 86a4bd4a017f7a302a2abd65045121625c01cd82fc5397e32e83f6930a5c4be1
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
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma ErdosR25C6U2.choose_row_shift f5b320af01270f892ccc97499375322d3aa4014e530191141cc0d4a7eb9953c8
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
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma ErdosR25C6U2.choose_ratio_down_at b76ea973857ff645b7fff41c8cf6708cd4cbc33f7d2b876a71736315bde1a33f
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
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma ErdosR25C6U2.D_step_sign 9036306875bd1a1be88db4187958e021cec56b212d1c76c93a5b158041adea21
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
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma ErdosR25C6U2.choose_pred_pos d63e7f056d641f66f6e76462815deabb37557a0660e12469c843a09ccff1c7e1
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
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma ErdosR25C6U2.D_step_up 7d7ad19191ac0f730f6d8fbb28ea4d3ad61c689cc7d0961b66ab047285c470db
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
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma ErdosR25C6U2.D_step_down 1083410fa6a5ea0856365e7ce869c156d94036ef0918a61e2533b5c0225d0109
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
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma ErdosR25C6U2.Cz_nonneg 66eaa1519f1679bfad51ca5e44e30906dd5622919ccb6abf2d8331e3bffedfae
namespace ErdosR25C6U2

lemma Cz_nonneg (n k : ℤ) : 0 ≤ Cz n k := by
  unfold Cz; split
  · exact Int.ofNat_nonneg _
  · exact le_refl 0

end ErdosR25C6U2
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma ErdosR25C6U2.interior_peak_le_cat 6867f52fd9f996b9727876984363291337ff90355bda649bcfb771255969b494
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
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN theorem ErdosR25C6U2.bdStepSign_interiorPeak_award db7f8b3899d9bdc63f83fcd9a9b8439d347d4aa1affd965350cd4ef88fd21040
namespace ErdosR25C6U2

/-- **`U-AWARD-BD-STEP-SIGN-AND-INTERIOR-PEAK` terminal declaration.** The
explicit conjunction of `D_step_sign` (the unconditional D-level step-sign
law — together with `peak_bracket_integral`, registering the VERIFIED
`E993-R25-D-ROW-STEP-SIGN-LAW`, both conjuncts, as `formally_verified`) and
`interior_peak_le_cat` (new content, `E993-R25-BD-INTERIOR-PEAK-CATALAN-BOUND`).
Fixed-band `d = 5` arithmetic; no graph content; the maximiser is supplied
as a witness of the two bracket inequalities and never asserted to exist.
Raises nothing else: not `E993-R25-BD-TAIL-NEGATIVE`, not
`E993-R25-FOURTH-BAND-CLOSE-ALL-R`. -/
theorem bdStepSign_interiorPeak_award :
    (∀ m g : ℕ, g < m → 1 ≤ m →
        (m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
            * (D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) - D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ))
          = Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
              * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ))) ∧
    (∀ m g : ℕ, 7 ≤ m → g ≤ m →
        2 * (m : ℤ) ≤ (g : ℤ) ^ 2 - (g : ℤ) →
        ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * (m : ℤ) →
        D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ)) :=
  ⟨fun m g hg hm => D_step_sign m g hg hm,
   fun m g hm hgm hpass hfail => interior_peak_le_cat m g hm hgm hpass hfail⟩

end ErdosR25C6U2
-- VERITYOS ENTRY 30 END

