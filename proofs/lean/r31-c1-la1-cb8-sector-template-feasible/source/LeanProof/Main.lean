import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition E993Transport.State8 884fdd9e379f185b40bfdaf38a618d127a913f453bb2a996dd9b51c951c2f32f
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- Choke states at the template level: pairs `(β, γ)` of naturals with `β + γ ≤ 8`. -/
abbrev State8 : Type := {s : ℕ × ℕ // s.1 + s.2 ≤ 8}

end E993Transport
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition E993Transport.cb8Bpb 73870f47921e5341c4d65de84325c367a35d963bb636883af86487062559ed9a
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
-- Table entered literally from sources/c1-stage7-sources/ADJ-T/adj_alloc_out.json (sha256 7d635805...4b13)
-- via DRAFTS/gen_table.py; byte-checked against the JSON (36 cells).
namespace E993Transport

/-- The 36 intercepts `B_pb(β,γ)` (cells with `β ≥ 1`) of the T adjudicator's table of record
`adj_alloc_out.json` (sha256 `7d635805…4b13`), entered literally; every other cell is `0` (a `pb` cell with
`β = 0` never enters `Out` or `In` with a nonzero weight). -/
def cb8Bpb : ℕ × ℕ → ℚ
  | (1, 0) => 3/2
  | (1, 1) => (-197/28)
  | (1, 2) => (-44/3)
  | (1, 3) => (-753/40)
  | (1, 4) => (-76/5)
  | (1, 5) => (-7/12)
  | (1, 6) => 0
  | (1, 7) => 31/16
  | (2, 0) => 13/4
  | (2, 1) => 73/12
  | (2, 2) => 429/40
  | (2, 3) => 733/40
  | (2, 4) => 365/12
  | (2, 5) => 189/4
  | (2, 6) => 793/16
  | (3, 0) => 23/6
  | (3, 1) => 231/40
  | (3, 2) => 171/20
  | (3, 3) => 149/12
  | (3, 4) => 171/10
  | (3, 5) => 271/16
  | (4, 0) => 33/8
  | (4, 1) => 223/40
  | (4, 2) => 89/12
  | (4, 3) => 189/20
  | (4, 4) => 749/80
  | (5, 0) => 43/10
  | (5, 1) => 65/12
  | (5, 2) => 33/5
  | (5, 3) => 539/80
  | (6, 0) => 53/12
  | (6, 1) => 21/4
  | (6, 2) => 89/16
  | (7, 0) => 9/2
  | (7, 1) => 79/16
  | (8, 0) => 73/16
  | _ => 0

end E993Transport
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition E993Transport.cb8Bpc 07124dbb5fa985c1e9185939152a3e0936e621bf97dd1d1190b1a7f0b7fe4347
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
-- Table entered literally from sources/c1-stage7-sources/ADJ-T/adj_alloc_out.json (sha256 7d635805...4b13)
-- via DRAFTS/gen_table.py; byte-checked against the JSON (36 cells).
namespace E993Transport

/-- The 36 intercepts `B_pc(β,γ)` (cells with `γ ≥ 1`) of the T adjudicator's table of record
`adj_alloc_out.json` (sha256 `7d635805…4b13`), entered literally; every other cell is `0` (a `pc` cell with
`γ = 0` never enters `Out` or `In` with a nonzero weight). -/
def cb8Bpc : ℕ × ℕ → ℚ
  | (0, 1) => 3/2
  | (0, 2) => 283/28
  | (0, 3) => 107/6
  | (0, 4) => 177/8
  | (0, 5) => 187/10
  | (0, 6) => 53/12
  | (0, 7) => 9/2
  | (0, 8) => 73/16
  | (1, 1) => (-5/28)
  | (1, 2) => (-35/12)
  | (1, 3) => (-297/40)
  | (1, 4) => (-593/40)
  | (1, 5) => (-319/12)
  | (1, 6) => (-171/4)
  | (1, 7) => (-689/16)
  | (2, 1) => (-2/3)
  | (2, 2) => (-99/40)
  | (2, 3) => (-101/20)
  | (2, 4) => (-103/12)
  | (2, 5) => (-63/5)
  | (2, 6) => (-167/16)
  | (3, 1) => (-33/40)
  | (3, 2) => (-83/40)
  | (3, 3) => (-43/12)
  | (3, 4) => (-99/20)
  | (3, 5) => (-229/80)
  | (4, 1) => (-4/5)
  | (4, 2) => (-19/12)
  | (4, 3) => (-21/10)
  | (4, 4) => (-19/80)
  | (5, 1) => (-7/12)
  | (5, 2) => (-3/4)
  | (5, 3) => 15/16
  | (6, 1) => 0
  | (6, 2) => 25/16
  | (7, 1) => 31/16
  | _ => 0

end E993Transport
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN definition E993Transport.cb8CGamma 627ca793f9410d1b7f66b8c2428ca941bf08ab315604546c5aadc63d94146589
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
-- c_gamma of record (adj_alloc_out.json key c_gamma, equal to the synthesis vector).
namespace E993Transport

/-- The switch coefficients `c = (1/7, 1/3, 3/5, 1, 5/3, 3, 7/2)` for `γ = 1..7` (table of record); `0` elsewhere. -/
def cb8CGamma : ℕ → ℚ
  | 1 => 1/7
  | 2 => 1/3
  | 3 => 3/5
  | 4 => 1
  | 5 => 5/3
  | 6 => 3
  | 7 => 7/2
  | _ => 0

end E993Transport
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN definition E993Transport.cb8Pb 8e4e560141ead78800b1d5b0981503de7ca00f2f3f38b1d8501887dc8c9d0d45
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- `pb m (β,γ) := (25m/2 + B_pb(β,γ)) / D` with `D = L/3`, `L = 200m²+82m+5`. -/
def cb8Pb (m : ℕ) (s : ℕ × ℕ) : ℚ :=
  (25 * (m : ℚ) / 2 + cb8Bpb s) / ((200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3)

end E993Transport
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN definition E993Transport.cb8Pc 2da72be6e685c0b8f9ea94120ef227a6bc36c06df1aed9db493855f00490ccee
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- `pc m (β,γ) := (25m/2 + B_pc(β,γ)) / D` with `D = L/3`, `L = 200m²+82m+5`. -/
def cb8Pc (m : ℕ) (s : ℕ × ℕ) : ℚ :=
  (25 * (m : ℚ) / 2 + cb8Bpc s) / ((200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3)

end E993Transport
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN definition E993Transport.cb8Theta f456a9f01abef92b189afb8d804718d947bcbf366a50052902843a7d397403c2
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- `θ m := 288 / L`, `L = 200m²+82m+5`. -/
def cb8Theta (m : ℕ) : ℚ := 288 / (200 * (m : ℚ) ^ 2 + 82 * m + 5)

end E993Transport
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN definition E993Transport.cb8Sigma 11e625fb114e7c4f7332a76946647544dc55c381c1ede1099455aad462bb2b8a
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- `σ m γ := c_γ · θ m`. -/
def cb8Sigma (m γ : ℕ) : ℚ := cb8CGamma γ * cb8Theta m

end E993Transport
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN definition E993Transport.cb8Out ad9aff9b44daab634598e28d1e065376a4348fff1dca6b5951e5865fc48d6026
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- `Out m (β,γ) := β·pb + γ·pc + [β = 1 ∧ 1 ≤ γ]·σ(γ)`. -/
def cb8Out (m : ℕ) (s : State8) : ℚ :=
  (s.1.1 : ℚ) * cb8Pb m s.1 + (s.1.2 : ℚ) * cb8Pc m s.1 +
    if s.1.1 = 1 ∧ 1 ≤ s.1.2 then cb8Sigma m s.1.2 else 0

end E993Transport
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN definition E993Transport.cb8In ade7ff5f7bb722fbf4e9e8156fcbb26fc43c8b3daaba3739bf4e1bd6931c064b
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- `In m (β,γ) := (8−β−γ)·(pb(β+1,γ) + pc(β,γ+1))` for `β+γ ≤ 7`, and `0` at `β+γ = 8`. -/
def cb8In (m : ℕ) (s : State8) : ℚ :=
  if s.1.1 + s.1.2 ≤ 7 then
    (8 - (s.1.1 : ℚ) - s.1.2) * (cb8Pb m (s.1.1 + 1, s.1.2) + cb8Pc m (s.1.1, s.1.2 + 1))
  else 0

end E993Transport
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN definition E993Transport.cb8R1 2efd2823db1ce7d8069b38dd96b9bc3bc2899c6d22733a8066e5ba0fa5e74e9c
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- `r1 m k := Σ_{i=0}^{min(7,k)} C(7,i)·C(8m−7, k−i)·2^{k−i}`. -/
def cb8R1 (m k : ℕ) : ℕ :=
  ∑ i ∈ Finset.range (min 7 k + 1), Nat.choose 7 i * Nat.choose (8 * m - 7) (k - i) * 2 ^ (k - i)

end E993Transport
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN definition E993Transport.cb8OutConst d08ab96d7fed27027c5cb035091d8f9d7dffe8f2ec7c751b70aae1faa2aaa84b
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- m-free part of `D·Out`. -/
def cb8OutConst (s : ℕ × ℕ) : ℚ :=
  (s.1 : ℚ) * cb8Bpb s + (s.2 : ℚ) * cb8Bpc s + if s.1 = 1 ∧ 1 ≤ s.2 then 96 * cb8CGamma s.2 else 0

end E993Transport
-- VERITYOS ENTRY 12 END

-- VERITYOS ENTRY 13 BEGIN definition E993Transport.cb8InConst 73aff8aed2068bcf4edb3995cd34d91ed5767b8aa0b4c5aeb1583a02d36c3bd7
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- m-free part of `D·In`. -/
def cb8InConst (s : ℕ × ℕ) : ℚ :=
  if s.1 + s.2 ≤ 7 then (8 - (s.1 : ℚ) - s.2) * (cb8Bpb (s.1 + 1, s.2) + cb8Bpc (s.1, s.2 + 1)) else 0

end E993Transport
-- VERITYOS ENTRY 13 END

-- VERITYOS ENTRY 14 BEGIN lemma E993Transport.cb8_state_out_const 0124793a5138ba6ea31e5ac31bd967c2f73ffa0e84bd9e958036943cacfb2f80
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_state_out_const (s : State8) :
    5 * ((s.1.1 : ℚ) + s.1.2) - 7 / 2 ≤ cb8OutConst s.1 := by
  obtain ⟨⟨b, g⟩, h⟩ := s
  simp only at h ⊢
  have hb : b ≤ 8 := by omega
  have hg : g ≤ 8 := by omega
  interval_cases b <;> interval_cases g <;> first
    | omega
    | norm_num [cb8OutConst, cb8Bpb, cb8Bpc, cb8CGamma]

end E993Transport
-- VERITYOS ENTRY 14 END

-- VERITYOS ENTRY 15 BEGIN lemma E993Transport.cb8_state_in_const c1ec745f33253db65582629741e6b7a4ee29aa92ca0b92f6f5002f057d9abd90
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_state_in_const (s : State8) :
    cb8InConst s.1 ≤ 24 - 5 / 2 * ((s.1.1 : ℚ) + s.1.2) := by
  obtain ⟨⟨b, g⟩, h⟩ := s
  simp only at h ⊢
  have hb : b ≤ 8 := by omega
  have hg : g ≤ 8 := by omega
  interval_cases b <;> interval_cases g <;> first
    | omega
    | norm_num [cb8InConst, cb8Bpb, cb8Bpc]

end E993Transport
-- VERITYOS ENTRY 15 END

-- VERITYOS ENTRY 16 BEGIN lemma E993Transport.cb8_state_intercept_lb 0beb9f4516e40c8ad4b03d5e4d4891b7c6ec7d1456a41d291a35cfaae2285d6e
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_state_intercept_lb (s : State8) : -50 ≤ cb8Bpb s.1 ∧ -50 ≤ cb8Bpc s.1 := by
  obtain ⟨⟨b, g⟩, h⟩ := s
  simp only at h ⊢
  have hb : b ≤ 8 := by omega
  have hg : g ≤ 8 := by omega
  interval_cases b <;> interval_cases g <;> first
    | omega
    | norm_num [cb8Bpb, cb8Bpc]

end E993Transport
-- VERITYOS ENTRY 16 END

-- VERITYOS ENTRY 17 BEGIN lemma E993Transport.cb8_L_pos 1772820458413f8da7961999cec990f5abf7ed3d3421ceb800a5ec39e488310a
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_L_pos (m : ℕ) : 0 < 200 * (m : ℚ) ^ 2 + 82 * m + 5 := by positivity

end E993Transport
-- VERITYOS ENTRY 17 END

-- VERITYOS ENTRY 18 BEGIN lemma E993Transport.cb8Out_eq 10369858678605519f39f1d1790272c8a39e0545ca2b317a030791ea6beb902b
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8Out_eq (m : ℕ) (s : State8) :
    cb8Out m s = (25 * (m : ℚ) / 2 * ((s.1.1 : ℚ) + s.1.2) + cb8OutConst s.1) /
      ((200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3) := by
  have hL := cb8_L_pos m
  unfold cb8Out cb8OutConst cb8Pb cb8Pc cb8Sigma cb8Theta
  split_ifs <;> field_simp <;> ring

end E993Transport
-- VERITYOS ENTRY 18 END

-- VERITYOS ENTRY 19 BEGIN lemma E993Transport.cb8In_eq 7e0bad9bf9828daf39009bc0332e075530534963c64600772f37e37a4db86aa0
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8In_eq (m : ℕ) (s : State8) :
    cb8In m s = (25 * (m : ℚ) * (8 - ((s.1.1 : ℚ) + s.1.2)) + cb8InConst s.1) /
      ((200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3) := by
  have hL := cb8_L_pos m
  obtain ⟨⟨b, g⟩, h⟩ := s
  unfold cb8In cb8InConst cb8Pb cb8Pc
  simp only at h ⊢
  split_ifs with h7
  · field_simp
    ring
  · have h8 : b + g = 8 := by omega
    have h8q : (b : ℚ) + g = 8 := by exact_mod_cast h8
    rw [h8q]
    simp

end E993Transport
-- VERITYOS ENTRY 19 END

-- VERITYOS ENTRY 20 BEGIN lemma E993Transport.cb8Out_lb 6d6f8dd2c1c2c0e97741935e4613676d705cd926d234ff51f7df7c15cea85ecb
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8Out_lb (m : ℕ) (s : State8) :
    ((25 * (m : ℚ) / 2 + 5) * ((s.1.1 : ℚ) + s.1.2) - 7 / 2) /
      ((200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3) ≤ cb8Out m s := by
  rw [cb8Out_eq]
  have hD : 0 < (200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3 := by have := cb8_L_pos m; positivity
  apply div_le_div_of_nonneg_right _ hD.le
  have := cb8_state_out_const s
  linarith

end E993Transport
-- VERITYOS ENTRY 20 END

-- VERITYOS ENTRY 21 BEGIN lemma E993Transport.cb8In_ub 37dc87f6ca61e2f8379d008ad000c309b2c234fdf41c19534f40a3c15fa8815e
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8In_ub (m : ℕ) (s : State8) :
    cb8In m s ≤ (25 * (m : ℚ) * (8 - ((s.1.1 : ℚ) + s.1.2)) + 24 - 5 / 2 * ((s.1.1 : ℚ) + s.1.2)) /
      ((200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3) := by
  rw [cb8In_eq]
  have hD : 0 < (200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3 := by have := cb8_L_pos m; positivity
  apply div_le_div_of_nonneg_right _ hD.le
  have := cb8_state_in_const s
  linarith

end E993Transport
-- VERITYOS ENTRY 21 END

-- VERITYOS ENTRY 22 BEGIN lemma E993Transport.cb8_K_cast 2cd4204ee46cd5f93c78d2eb304f3e950c5d7956e1c490df38d33797f73b0da9
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_K_cast (m : ℕ) (hm3 : m % 3 = 2) : (((16 * m + 1) / 3 : ℕ) : ℚ) = (16 * (m : ℚ) + 1) / 3 := by
  have h : 3 * ((16 * m + 1) / 3) = 16 * m + 1 := by omega
  have h' : (3 : ℚ) * (((16 * m + 1) / 3 : ℕ) : ℚ) = 16 * (m : ℚ) + 1 := by exact_mod_cast h
  linarith

end E993Transport
-- VERITYOS ENTRY 22 END

-- VERITYOS ENTRY 23 BEGIN lemma E993Transport.cb8_sum_out 5327bcf561189d82a3f5b7c2811ca7f957545c7618f799091469aacca93da648
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_sum_out (m : ℕ) (hm3 : m % 3 = 2) (c : Fin m → State8)
    (hc : ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3) :
    1 ≤ ∑ i, cb8Out m (c i) := by
  have hL := cb8_L_pos m
  have hD : 0 < (200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3 := by positivity
  have hsum : ∑ i, (((c i).1.1 : ℚ) + (c i).1.2) = (16 * (m : ℚ) + 1) / 3 := by
    rw [← cb8_K_cast m hm3, ← hc]
    push_cast
    rfl
  calc (1 : ℚ) = ∑ i : Fin m, ((25 * (m : ℚ) / 2 + 5) * (((c i).1.1 : ℚ) + (c i).1.2) - 7 / 2) /
        ((200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3) := by
          rw [← Finset.sum_div, Finset.sum_sub_distrib, ← Finset.mul_sum, hsum]
          simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
          field_simp
          ring
    _ ≤ ∑ i, cb8Out m (c i) := Finset.sum_le_sum fun i _ => cb8Out_lb m (c i)

end E993Transport
-- VERITYOS ENTRY 23 END

-- VERITYOS ENTRY 24 BEGIN lemma E993Transport.cb8_sum_in c3c4af8569fdfe16434f8b6e19db4c29762e6183ee91badc685ea04d1cb6b57f
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_sum_in (m : ℕ) (hm3 : m % 3 = 2) (c : Fin m → State8)
    (hc : ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 - 1) :
    ∑ i, cb8In m (c i) ≤ 1 := by
  have hL := cb8_L_pos m
  have hD : 0 < (200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3 := by positivity
  have hK1 : 1 ≤ (16 * m + 1) / 3 := by omega
  have hsum : ∑ i, (((c i).1.1 : ℚ) + (c i).1.2) = (16 * (m : ℚ) + 1) / 3 - 1 := by
    rw [← cb8_K_cast m hm3]
    have : ((((16 * m + 1) / 3 - 1 : ℕ)) : ℚ) = (((16 * m + 1) / 3 : ℕ) : ℚ) - 1 := by
      push_cast [Nat.cast_sub hK1]
      ring
    rw [← this, ← hc]
    push_cast
    rfl
  calc ∑ i, cb8In m (c i) ≤ ∑ i : Fin m, (25 * (m : ℚ) * (8 - (((c i).1.1 : ℚ) + (c i).1.2)) + 24 -
        5 / 2 * (((c i).1.1 : ℚ) + (c i).1.2)) / ((200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3) :=
          Finset.sum_le_sum fun i _ => cb8In_ub m (c i)
    _ = 1 := by
          rw [← Finset.sum_div, Finset.sum_sub_distrib, Finset.sum_add_distrib]
          simp only [mul_sub, Finset.sum_sub_distrib, ← Finset.mul_sum, hsum, Finset.sum_const,
            Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
          field_simp
          ring

end E993Transport
-- VERITYOS ENTRY 24 END

-- VERITYOS ENTRY 25 BEGIN lemma E993Transport.cb8CGamma_nonneg 3439cd798746d830aac994a58b7995ffade6167de23c6303e737ba257100e1f0
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8CGamma_nonneg (γ : ℕ) : 0 ≤ cb8CGamma γ := by
  unfold cb8CGamma
  split <;> norm_num

end E993Transport
-- VERITYOS ENTRY 25 END

-- VERITYOS ENTRY 26 BEGIN lemma E993Transport.cb8Theta_nonneg 7762e3de89ed3f05e20ed874c8d4cc430990a7da9ccbe2a3f248865599cb349e
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8Theta_nonneg (m : ℕ) : 0 ≤ cb8Theta m := by
  unfold cb8Theta
  have := cb8_L_pos m
  positivity

end E993Transport
-- VERITYOS ENTRY 26 END

-- VERITYOS ENTRY 27 BEGIN lemma E993Transport.cb8_sectorTemplate_nonneg_out_in_switch 0a376ba5c4ed9c189dc73adeb85e07d6fdda6a5317bf8e8246326bfe345a2f6a
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_sectorTemplate_nonneg_out_in_switch (m : ℕ) (hm : 107 ≤ m) (hm3 : m % 3 = 2) :
    (∀ s : State8, 0 ≤ cb8Pb m s.1 ∧ 0 ≤ cb8Pc m s.1 ∧ 0 ≤ cb8Sigma m s.1.2) ∧
    (∀ c : Fin m → State8, ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 →
        1 ≤ ∑ i, cb8Out m (c i)) ∧
    (∀ c : Fin m → State8, ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 - 1 →
        ∑ i, cb8In m (c i) ≤ 1) ∧
    (∀ γ : ℕ, 1 ≤ γ → γ ≤ 7 → (8 - (γ : ℚ)) * cb8Sigma m γ ≤ cb8Theta m * γ) := by
  have hL := cb8_L_pos m
  have hD : 0 < (200 * (m : ℚ) ^ 2 + 82 * m + 5) / 3 := by positivity
  have hmq : (107 : ℚ) ≤ m := by exact_mod_cast hm
  refine ⟨fun s => ?_, fun c hc => cb8_sum_out m hm3 c hc, fun c hc => cb8_sum_in m hm3 c hc,
    fun γ h1 h7 => ?_⟩
  · obtain ⟨hb, hc⟩ := cb8_state_intercept_lb s
    refine ⟨?_, ?_, ?_⟩
    · unfold cb8Pb
      apply div_nonneg _ hD.le
      linarith
    · unfold cb8Pc
      apply div_nonneg _ hD.le
      linarith
    · unfold cb8Sigma
      exact mul_nonneg (cb8CGamma_nonneg _) (cb8Theta_nonneg m)
  · have hθ := cb8Theta_nonneg m
    unfold cb8Sigma
    interval_cases γ <;> norm_num [cb8CGamma] <;> linarith

end E993Transport
-- VERITYOS ENTRY 27 END

-- VERITYOS ENTRY 28 BEGIN lemma E993Transport.cb8_choose_step d66aef151c519b4b8a706c382dad3ac5c32c6d3224e3fa1595901eddffdd9848
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_choose_step (n k k' : ℕ) (hk' : k' = k + 1) (hk : k < n) :
    (n.choose k' : ℚ) * ((k : ℚ) + 1) = (n.choose k : ℚ) * ((n : ℚ) - k) := by
  subst hk'
  have h := Nat.choose_succ_right_eq n k
  have h' : ((n.choose (k + 1) * (k + 1) : ℕ) : ℚ) = ((n.choose k * (n - k) : ℕ) : ℚ) := by rw [h]
  push_cast [Nat.cast_sub hk.le] at h'
  exact h'

end E993Transport
-- VERITYOS ENTRY 28 END

-- VERITYOS ENTRY 29 BEGIN lemma E993Transport.cb8R1_expand_top 144157fc2f61db8bd4a2d248ffad27f0db4d9b1f3c2746584d7e07e5dbb255f7
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8R1_expand_top (m a : ℕ) :
    (cb8R1 m (a + 8) : ℚ) = 2 ^ a * (2 * ((8 * m - 7).choose (a + 1) : ℚ) +
      28 * ((8 * m - 7).choose (a + 2) : ℚ) + 168 * ((8 * m - 7).choose (a + 3) : ℚ) +
      560 * ((8 * m - 7).choose (a + 4) : ℚ) + 1120 * ((8 * m - 7).choose (a + 5) : ℚ) +
      1344 * ((8 * m - 7).choose (a + 6) : ℚ) + 896 * ((8 * m - 7).choose (a + 7) : ℚ) +
      256 * ((8 * m - 7).choose (a + 8) : ℚ)) := by
  unfold cb8R1
  rw [show min 7 (a + 8) = 7 by omega]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add]
  rw [show a + 8 - 0 = a + 8 by omega, show a + 8 - 1 = a + 7 by omega,
    show a + 8 - 2 = a + 6 by omega, show a + 8 - 3 = a + 5 by omega,
    show a + 8 - 4 = a + 4 by omega, show a + 8 - 5 = a + 3 by omega,
    show a + 8 - 6 = a + 2 by omega, show a + 8 - 7 = a + 1 by omega]
  push_cast
  simp only [pow_add]
  norm_num [Nat.choose]
  ring

end E993Transport
-- VERITYOS ENTRY 29 END

-- VERITYOS ENTRY 30 BEGIN lemma E993Transport.cb8R1_expand_sub 5910302ba4101271a870e88f443b2a4db823a5cdf4229b9fbb5e3e13cb501c1c
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8R1_expand_sub (m a : ℕ) :
    (cb8R1 m (a + 7) : ℚ) = 2 ^ a * (1 * ((8 * m - 7).choose a : ℚ) +
      14 * ((8 * m - 7).choose (a + 1) : ℚ) + 84 * ((8 * m - 7).choose (a + 2) : ℚ) +
      280 * ((8 * m - 7).choose (a + 3) : ℚ) + 560 * ((8 * m - 7).choose (a + 4) : ℚ) +
      672 * ((8 * m - 7).choose (a + 5) : ℚ) + 448 * ((8 * m - 7).choose (a + 6) : ℚ) +
      128 * ((8 * m - 7).choose (a + 7) : ℚ)) := by
  unfold cb8R1
  rw [show min 7 (a + 7) = 7 by omega]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add]
  rw [show a + 7 - 0 = a + 7 by omega, show a + 7 - 1 = a + 6 by omega,
    show a + 7 - 2 = a + 5 by omega, show a + 7 - 3 = a + 4 by omega,
    show a + 7 - 4 = a + 3 by omega, show a + 7 - 5 = a + 2 by omega,
    show a + 7 - 6 = a + 1 by omega, show a + 7 - 7 = a by omega]
  push_cast
  simp only [pow_add]
  norm_num [Nat.choose]
  ring

end E993Transport
-- VERITYOS ENTRY 30 END

-- VERITYOS ENTRY 31 BEGIN lemma E993Transport.cb8_residual_core 16a19eac22664329c2542412e5fcdae7c2abf5926107fd274e1c62c7daa83f33
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
-- Proof text generated by DRAFTS/gen_residual.py (standard-library integer arithmetic); every identity is
-- checked by Lean (`linear_combination`/`ring`), the generator is not trusted.
namespace E993Transport

/-- Residual core: the shifted positivity certificate (m = 3p+107), over abstract rationals `X_j` linked by the
choose-ratio recurrences. -/
lemma cb8_residual_core (P X0 X1 X2 X3 X4 X5 X6 X7 X8 : ℚ) (hP : 0 ≤ P) (hX0 : 0 < X0)
    (hX1 : 0 ≤ X1) (hX2 : 0 ≤ X2) (hX3 : 0 ≤ X3) (hX4 : 0 ≤ X4) (hX5 : 0 ≤ X5) (hX6 : 0 ≤ X6)
    (hX7 : 0 ≤ X7)
    (hr0 : X1 * (16 * P + 564) = X0 * (8 * P + 286))
    (hr1 : X2 * (16 * P + 565) = X1 * (8 * P + 285))
    (hr2 : X3 * (16 * P + 566) = X2 * (8 * P + 284))
    (hr3 : X4 * (16 * P + 567) = X3 * (8 * P + 283))
    (hr4 : X5 * (16 * P + 568) = X4 * (8 * P + 282))
    (hr5 : X6 * (16 * P + 569) = X5 * (8 * P + 281))
    (hr6 : X7 * (16 * P + 570) = X6 * (8 * P + 280))
    (hr7 : X8 * (16 * P + 571) = X7 * (8 * P + 279)) :
    288 / (1800 * P ^ 2 + 128646 * P + 2298579) ≤
      1 - (2 * X1 + 28 * X2 + 168 * X3 + 560 * X4 + 1120 * X5 + 1344 * X6 + 896 * X7 + 256 * X8) /
        (1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 + 128 * X7) := by
  have hF1 : X1 * (16 * P + 564) = X0 * (8 * P + 286) := by
    linear_combination hr0
  have hF2 : X2 * (16 * P + 564) * (16 * P + 565) = X0 * (8 * P + 286) * (8 * P + 285) := by
    linear_combination (16 * P + 564) * hr1 + (8 * P + 285) * hF1
  have hF3 : X3 * (16 * P + 564) * (16 * P + 565) * (16 * P + 566) = X0 * (8 * P + 286) * (8 * P + 285) * (8 * P + 284) := by
    linear_combination (16 * P + 564) * (16 * P + 565) * hr2 + (8 * P + 284) * hF2
  have hF4 : X4 * (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) = X0 * (8 * P + 286) * (8 * P + 285) * (8 * P + 284) * (8 * P + 283) := by
    linear_combination (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * hr3 + (8 * P + 283) * hF3
  have hF5 : X5 * (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) = X0 * (8 * P + 286) * (8 * P + 285) * (8 * P + 284) * (8 * P + 283) * (8 * P + 282) := by
    linear_combination (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * hr4 + (8 * P + 282) * hF4
  have hF6 : X6 * (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) = X0 * (8 * P + 286) * (8 * P + 285) * (8 * P + 284) * (8 * P + 283) * (8 * P + 282) * (8 * P + 281) := by
    linear_combination (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * hr5 + (8 * P + 281) * hF5
  have hF7 : X7 * (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) * (16 * P + 570) = X0 * (8 * P + 286) * (8 * P + 285) * (8 * P + 284) * (8 * P + 283) * (8 * P + 282) * (8 * P + 281) * (8 * P + 280) := by
    linear_combination (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) * hr6 + (8 * P + 280) * hF6
  have hF8 : X8 * (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) * (16 * P + 570) * (16 * P + 571) = X0 * (8 * P + 286) * (8 * P + 285) * (8 * P + 284) * (8 * P + 283) * (8 * P + 282) * (8 * P + 281) * (8 * P + 280) * (8 * P + 279) := by
    linear_combination (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) * (16 * P + 570) * hr7 + (8 * P + 279) * hF7
  have hkey : (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * (1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 + 128 * X7) - (1800 * P ^ 2 + 128646 * P + 2298579) * (2 * X1 + 28 * X2 + 168 * X3 + 560 * X4 + 1120 * X5 + 1344 * X6 + 896 * X7 + 256 * X8)) * ((16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) * (16 * P + 570) * (16 * P + 571)) =
      X0 * (13736854315533908060107804800 + 3485757943832316875116853760 * P + 393116201147170279914011136 * P ^ 2 + 25861741787599751845613568 * P ^ 3 + 1093718124274605922197504 * P ^ 4 + 30836007270585567805440 * P ^ 5 + 579583454459211546624 * P ^ 6 + 7003008881186045952 * P ^ 7 + 49359024738533376 * P ^ 8 + 154618822656000 * P ^ 9) := by
    linear_combination (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * 14 - (1800 * P ^ 2 + 128646 * P + 2298579) * 2) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) * (16 * P + 570) * (16 * P + 571) * hF1
      + (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * 84 - (1800 * P ^ 2 + 128646 * P + 2298579) * 28) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) * (16 * P + 570) * (16 * P + 571) * hF2
      + (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * 280 - (1800 * P ^ 2 + 128646 * P + 2298579) * 168) * (16 * P + 567) * (16 * P + 568) * (16 * P + 569) * (16 * P + 570) * (16 * P + 571) * hF3
      + (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * 560 - (1800 * P ^ 2 + 128646 * P + 2298579) * 560) * (16 * P + 568) * (16 * P + 569) * (16 * P + 570) * (16 * P + 571) * hF4
      + (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * 672 - (1800 * P ^ 2 + 128646 * P + 2298579) * 1120) * (16 * P + 569) * (16 * P + 570) * (16 * P + 571) * hF5
      + (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * 448 - (1800 * P ^ 2 + 128646 * P + 2298579) * 1344) * (16 * P + 570) * (16 * P + 571) * hF6
      + (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * 128 - (1800 * P ^ 2 + 128646 * P + 2298579) * 896) * (16 * P + 571) * hF7
      + (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * 0 - (1800 * P ^ 2 + 128646 * P + 2298579) * 256) * 1 * hF8
  have hL : 0 < (1800 * P ^ 2 + 128646 * P + 2298579) := by positivity
  have hS0 : 0 < 1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 + 128 * X7 := by
    positivity
  have hPd : 0 < (16 * P + 564) * (16 * P + 565) * (16 * P + 566) * (16 * P + 567) * (16 * P + 568) *
      (16 * P + 569) * (16 * P + 570) * (16 * P + 571) := by positivity
  have hQ : 0 ≤ X0 * (13736854315533908060107804800 + 3485757943832316875116853760 * P + 393116201147170279914011136 * P ^ 2 + 25861741787599751845613568 * P ^ 3 + 1093718124274605922197504 * P ^ 4 + 30836007270585567805440 * P ^ 5 + 579583454459211546624 * P ^ 6 + 7003008881186045952 * P ^ 7 + 49359024738533376 * P ^ 8 + 154618822656000 * P ^ 9) := by positivity
  have h1 : 0 ≤ ((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * (1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 +
      128 * X7) - (1800 * P ^ 2 + 128646 * P + 2298579) * (2 * X1 + 28 * X2 + 168 * X3 + 560 * X4 + 1120 * X5 + 1344 * X6 + 896 * X7 +
      256 * X8) := by
    rw [← hkey] at hQ
    exact nonneg_of_mul_nonneg_left hQ hPd
  have e : 1 - (2 * X1 + 28 * X2 + 168 * X3 + 560 * X4 + 1120 * X5 + 1344 * X6 + 896 * X7 + 256 * X8) / (1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 + 128 * X7) - 288 / (1800 * P ^ 2 + 128646 * P + 2298579) =
      (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * (1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 + 128 * X7) - (1800 * P ^ 2 + 128646 * P + 2298579) * (2 * X1 + 28 * X2 + 168 * X3 + 560 * X4 + 1120 * X5 + 1344 * X6 + 896 * X7 + 256 * X8)) / ((1800 * P ^ 2 + 128646 * P + 2298579) * (1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 + 128 * X7)) := by
    field_simp
    ring
  have h2 : 0 ≤ (((1800 * P ^ 2 + 128646 * P + 2298579) - 288) * (1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 + 128 * X7) - (1800 * P ^ 2 + 128646 * P + 2298579) * (2 * X1 + 28 * X2 + 168 * X3 + 560 * X4 + 1120 * X5 + 1344 * X6 + 896 * X7 + 256 * X8)) / ((1800 * P ^ 2 + 128646 * P + 2298579) * (1 * X0 + 14 * X1 + 84 * X2 + 280 * X3 + 560 * X4 + 672 * X5 + 448 * X6 + 128 * X7)) :=
    div_nonneg h1 (by positivity)
  linarith

end E993Transport
-- VERITYOS ENTRY 31 END

-- VERITYOS ENTRY 32 BEGIN lemma E993Transport.cb8_sectorTemplate_residual b90f1473bc5da5df7123373ec0975d3e048a7827ed9481bf8a274e1419bd0ccb
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

lemma cb8_sectorTemplate_residual (m : ℕ) (hm : 107 ≤ m) (hm3 : m % 3 = 2) :
    cb8Theta m ≤ 1 - (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ) := by
  obtain ⟨p, rfl⟩ : ∃ p, m = 3 * p + 107 := ⟨(m - 107) / 3, by omega⟩
  rw [show (16 * (3 * p + 107) + 1) / 3 = 16 * p + 563 + 8 by omega,
    show 16 * p + 563 + 8 - 1 = 16 * p + 563 + 7 by omega,
    cb8R1_expand_top, cb8R1_expand_sub,
    show 8 * (3 * p + 107) - 7 = 24 * p + 849 by omega,
    mul_div_mul_left _ _ (pow_ne_zero _ two_ne_zero)]
  have hθ : cb8Theta (3 * p + 107) = 288 / (1800 * (p : ℚ) ^ 2 + 128646 * p + 2298579) := by
    unfold cb8Theta
    push_cast
    ring_nf
  rw [hθ]
  set X0 : ℚ := (((24 * p + 849).choose (16 * p + 563) : ℕ) : ℚ) with hX0def
  set X1 : ℚ := (((24 * p + 849).choose (16 * p + 563 + 1) : ℕ) : ℚ) with hX1def
  set X2 : ℚ := (((24 * p + 849).choose (16 * p + 563 + 2) : ℕ) : ℚ) with hX2def
  set X3 : ℚ := (((24 * p + 849).choose (16 * p + 563 + 3) : ℕ) : ℚ) with hX3def
  set X4 : ℚ := (((24 * p + 849).choose (16 * p + 563 + 4) : ℕ) : ℚ) with hX4def
  set X5 : ℚ := (((24 * p + 849).choose (16 * p + 563 + 5) : ℕ) : ℚ) with hX5def
  set X6 : ℚ := (((24 * p + 849).choose (16 * p + 563 + 6) : ℕ) : ℚ) with hX6def
  set X7 : ℚ := (((24 * p + 849).choose (16 * p + 563 + 7) : ℕ) : ℚ) with hX7def
  set X8 : ℚ := (((24 * p + 849).choose (16 * p + 563 + 8) : ℕ) : ℚ) with hX8def
  have hr0 : X1 * (16 * (p : ℚ) + 564) = X0 * (8 * (p : ℚ) + 286) := by
    have h := cb8_choose_step (24 * p + 849) (16 * p + 563) (16 * p + 563 + 1) (by omega) (by omega)
    push_cast at h
    linear_combination h
  have hr1 : X2 * (16 * (p : ℚ) + 565) = X1 * (8 * (p : ℚ) + 285) := by
    have h := cb8_choose_step (24 * p + 849) (16 * p + 563 + 1) (16 * p + 563 + 2) (by omega) (by omega)
    push_cast at h
    linear_combination h
  have hr2 : X3 * (16 * (p : ℚ) + 566) = X2 * (8 * (p : ℚ) + 284) := by
    have h := cb8_choose_step (24 * p + 849) (16 * p + 563 + 2) (16 * p + 563 + 3) (by omega) (by omega)
    push_cast at h
    linear_combination h
  have hr3 : X4 * (16 * (p : ℚ) + 567) = X3 * (8 * (p : ℚ) + 283) := by
    have h := cb8_choose_step (24 * p + 849) (16 * p + 563 + 3) (16 * p + 563 + 4) (by omega) (by omega)
    push_cast at h
    linear_combination h
  have hr4 : X5 * (16 * (p : ℚ) + 568) = X4 * (8 * (p : ℚ) + 282) := by
    have h := cb8_choose_step (24 * p + 849) (16 * p + 563 + 4) (16 * p + 563 + 5) (by omega) (by omega)
    push_cast at h
    linear_combination h
  have hr5 : X6 * (16 * (p : ℚ) + 569) = X5 * (8 * (p : ℚ) + 281) := by
    have h := cb8_choose_step (24 * p + 849) (16 * p + 563 + 5) (16 * p + 563 + 6) (by omega) (by omega)
    push_cast at h
    linear_combination h
  have hr6 : X7 * (16 * (p : ℚ) + 570) = X6 * (8 * (p : ℚ) + 280) := by
    have h := cb8_choose_step (24 * p + 849) (16 * p + 563 + 6) (16 * p + 563 + 7) (by omega) (by omega)
    push_cast at h
    linear_combination h
  have hr7 : X8 * (16 * (p : ℚ) + 571) = X7 * (8 * (p : ℚ) + 279) := by
    have h := cb8_choose_step (24 * p + 849) (16 * p + 563 + 7) (16 * p + 563 + 8) (by omega) (by omega)
    push_cast at h
    linear_combination h
  have hX0 : 0 < X0 := by
    rw [hX0def]
    exact_mod_cast Nat.choose_pos (by omega)
  exact cb8_residual_core (p : ℚ) X0 X1 X2 X3 X4 X5 X6 X7 X8 (Nat.cast_nonneg p) hX0
    (Nat.cast_nonneg _) (Nat.cast_nonneg _) (Nat.cast_nonneg _) (Nat.cast_nonneg _) (Nat.cast_nonneg _)
    (Nat.cast_nonneg _) (Nat.cast_nonneg _) hr0 hr1 hr2 hr3 hr4 hr5 hr6 hr7

end E993Transport
-- VERITYOS ENTRY 32 END

-- VERITYOS ENTRY 33 BEGIN theorem E993Transport.cb8_topRank_sectorTemplate_feasible b1129847edfd22f7d0f8ac465c33257fafb56f5c73f42cb7a65d761bc355b0f1
-- r31 C1-LA1: authored in-run by the Stage 7 formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).
namespace E993Transport

/-- **C1-LA1 (r31).** (L-S)_top template arithmetic on the class `m ≥ 107`, `m % 3 = 2`: the closed-form
allocation of record is nonnegative, satisfies Out over every assignment with leg total `K = (16m+1)/3`, In over
every assignment with leg total `K − 1`, Switch, and the Residual `θ m ≤ 1 − r1 m K / r1 m (K − 1)`.
Template level only: not a flow on the literal network, no (HALL), no eligibility, no optimality. -/
theorem cb8_topRank_sectorTemplate_feasible (m : ℕ) (hm : 107 ≤ m) (hm3 : m % 3 = 2) :
    (∀ s : State8, 0 ≤ cb8Pb m s.1 ∧ 0 ≤ cb8Pc m s.1 ∧ 0 ≤ cb8Sigma m s.1.2) ∧
    (∀ c : Fin m → State8, ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 →
        1 ≤ ∑ i, cb8Out m (c i)) ∧
    (∀ c : Fin m → State8, ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 - 1 →
        ∑ i, cb8In m (c i) ≤ 1) ∧
    (∀ γ : ℕ, 1 ≤ γ → γ ≤ 7 → (8 - (γ : ℚ)) * cb8Sigma m γ ≤ cb8Theta m * γ) ∧
    cb8Theta m ≤ 1 - (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ) := by
  obtain ⟨h1, h2, h3, h4⟩ := cb8_sectorTemplate_nonneg_out_in_switch m hm hm3
  exact ⟨h1, h2, h3, h4, cb8_sectorTemplate_residual m hm hm3⟩

end E993Transport
-- VERITYOS ENTRY 33 END

