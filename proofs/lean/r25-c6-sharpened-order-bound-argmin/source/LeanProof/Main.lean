import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition ErdosR25T2.zchoose 98d662eca03b40810fd62810206069cb47a938a5d67e69b7d8c42c6d038c1845
namespace ErdosR25T2

/-- Zero-extended integer binomial coefficient: `C(a,b)` for `a, b : ℤ`,
zero whenever `a < 0` or `b < 0` (and, via `Nat.choose`, zero when
`b > a ≥ 0` as well). Re-registered verbatim from seat T2's
`scratchpad/c6-T2/LeanDraft/LeanProof/Main.lean`. -/
def zchoose (a b : ℤ) : ℤ :=
  if 0 ≤ a then (if 0 ≤ b then ((a.toNat).choose (b.toNat) : ℤ) else 0) else 0

end ErdosR25T2
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition ErdosR25T2.Hbound ab6c47caf6fcd5b6e36a20ee6344d3b32bbf14c5a01fde9f747a123f8d2dc409
namespace ErdosR25T2

/-- `H(n,k,e,c_e)` (T3 `RETURN.md` §3, Cycle 5 `SYNTHESIS.md` line 1322),
zero-extended, lifted to all of `ℤ`. Re-registered verbatim (up to the
enclosing namespace) from seat T2's compiled `Hbound`. -/
def Hbound (n k e ce : ℤ) : ℤ :=
  zchoose n (k + 1) - e * zchoose (n - 2) (k - 1) + (e - ce) * zchoose (n - 3) (k - 2)
    + (ce - 1) * zchoose (n - 4) (k - 3)

end ErdosR25T2
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition ErdosR25T2.W 4a4966f3de9d7a41d6980900ba3b3857a27c70df0abeb992090405dc826d8461
namespace ErdosR25T2

/-- `W(n,k,e) := H(n,k,e, min(e, n−e))`, the worst-case-`c_e` reduction of T3
`RETURN.md` §4 ("Consequence"), taken here as given (`proved_informal`
upstream) and the starting point for node N8. -/
def W (n k e : ℤ) : ℤ := Hbound n k e (min e (n - e))

end ErdosR25T2
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN lemma ErdosR25T2.zchoose_nonneg 77290a901cf95d73b553a3b69060a5fd4ed4525d7ff77c51ebc5d402f4cae3f7
namespace ErdosR25T2

lemma zchoose_nonneg (a b : ℤ) : 0 ≤ zchoose a b := by
  unfold zchoose
  split_ifs
  · exact Int.natCast_nonneg _
  · exact le_refl 0
  · exact le_refl 0

end ErdosR25T2
-- VERITYOS ENTRY 4 END

-- VERITYOS ENTRY 5 BEGIN lemma ErdosR25T2.zchoose_pascal e375c0277c2d51baf1445443118964b2a51b811f14bf898aee4a8bc816922f9d
namespace ErdosR25T2

/-- Integer Pascal recurrence for `zchoose`, valid for every `b : ℤ` once
`1 ≤ a`. -/
lemma zchoose_pascal {a : ℤ} (ha : 1 ≤ a) (b : ℤ) :
    zchoose a b = zchoose (a - 1) (b - 1) + zchoose (a - 1) b := by
  have haT : a.toNat = (a - 1).toNat + 1 := by omega
  unfold zchoose
  split_ifs with h1 h2 h3 h4
  · -- 0 ≤ a, 0 ≤ b, 0 ≤ a-1, 0 ≤ b-1  (main case, b ≥ 1)
    have hbT : b.toNat = (b - 1).toNat + 1 := by omega
    rw [haT, hbT, Nat.choose_succ_succ]
    push_cast
    ring
  · -- 0 ≤ a, 0 ≤ b, 0 ≤ a-1, ¬(0 ≤ b-1)  ⇒ b = 0
    have hb0 : b = 0 := by omega
    subst hb0
    simp only [Int.toNat_zero, Nat.choose_zero_right, Nat.cast_one]
    ring
  all_goals omega

end ErdosR25T2
-- VERITYOS ENTRY 5 END

-- VERITYOS ENTRY 6 BEGIN lemma ErdosR25T2.pascal_step1 bc4c458cd99f0052e20e89fbac410b0d371afb4058baf703099d2c5be081ea27
namespace ErdosR25T2

lemma pascal_step1 (n k : ℤ) (hn : 4 ≤ n) :
    zchoose (n - 2) (k - 1) = zchoose (n - 3) (k - 2) + zchoose (n - 3) (k - 1) := by
  have h := zchoose_pascal (a := n - 2) (by omega : (1:ℤ) ≤ n - 2) (k - 1)
  have e1 : n - 2 - 1 = n - 3 := by ring
  have e2 : k - 1 - 1 = k - 2 := by ring
  rw [e1, e2] at h
  exact h

end ErdosR25T2
-- VERITYOS ENTRY 6 END

-- VERITYOS ENTRY 7 BEGIN lemma ErdosR25T2.pascal_step2 a2803627716ceca50684533049b63c48a4f7d22f7ea213f22199c19093be0dd5
namespace ErdosR25T2

lemma pascal_step2 (n k : ℤ) (hn : 4 ≤ n) :
    zchoose (n - 3) (k - 2) = zchoose (n - 4) (k - 3) + zchoose (n - 4) (k - 2) := by
  have h := zchoose_pascal (a := n - 3) (by omega : (1:ℤ) ≤ n - 3) (k - 2)
  have e1 : n - 3 - 1 = n - 4 := by ring
  have e2 : k - 2 - 1 = k - 3 := by ring
  rw [e1, e2] at h
  exact h

end ErdosR25T2
-- VERITYOS ENTRY 7 END

-- VERITYOS ENTRY 8 BEGIN lemma ErdosR25T2.pascal_step3 475adadd6adf0bd3e375ead5c8176cc5ff1da52390fa8b2124304d867bed07f1
namespace ErdosR25T2

lemma pascal_step3 (n k : ℤ) (hn : 4 ≤ n) :
    zchoose (n - 3) (k - 1) = zchoose (n - 4) (k - 2) + zchoose (n - 4) (k - 1) := by
  have h := zchoose_pascal (a := n - 3) (by omega : (1:ℤ) ≤ n - 3) (k - 1)
  have e1 : n - 3 - 1 = n - 4 := by ring
  have e2 : k - 1 - 1 = k - 2 := by ring
  rw [e1, e2] at h
  exact h

end ErdosR25T2
-- VERITYOS ENTRY 8 END

-- VERITYOS ENTRY 9 BEGIN lemma ErdosR25T2.W_antitone 9e098e3fb21f3c9a4c464ca2165c50ec677ef295a63d4d46a921c8827a447cc4
namespace ErdosR25T2

/-- The argmin step (Candidate D's single open node), proved unconditionally
in `k`, with no case split on the regime. `W(n,k,e) := H(n,k,e,min(e,n−e))`
is non-increasing on consecutive `e`, for every `n ≥ 4` (the range
hypotheses `_he1`, `_he2` are unused, exactly as in the seat's own file —
critic C-T2-F's finding F5 records this as a strengthening, not a gap).
Registered as `lemma` (the seat's file uses `theorem`; the keyword change is
cosmetic only — `theorem` and `lemma` are the same Lean 4 declaration kind —
made so that `candidateD_argmin` is the file's single `theorem`-kind entry,
per the governed registrar's definition/lemma/theorem ordering rule). -/
lemma W_antitone (n k e : ℤ) (hn : 4 ≤ n) (_he1 : 1 ≤ e) (_he2 : e + 1 ≤ n - 1) :
    W n k (e + 1) ≤ W n k e := by
  have hdelta : min (e + 1) (n - (e + 1)) ≥ min e (n - e) - 1 := by omega
  have p1 := pascal_step1 n k hn
  have p2 := pascal_step2 n k hn
  have p3 := pascal_step3 n k hn
  have n1 := zchoose_nonneg (n - 4) (k - 2)
  have n2 := zchoose_nonneg (n - 4) (k - 1)
  have hprod : (0:ℤ) ≤ (min (e + 1) (n - (e + 1)) - min e (n - e) + 1) * zchoose (n - 4) (k - 2) :=
    mul_nonneg (by omega) n1
  unfold W Hbound
  nlinarith [p1, p2, p3, n1, n2, hprod]

end ErdosR25T2
-- VERITYOS ENTRY 9 END

-- VERITYOS ENTRY 10 BEGIN lemma ErdosR25T2.W_min_at_spanning_tree b6a337276a4896c0ff87abe827af49ef210c0fab529f292413eff00dee014aa6
namespace ErdosR25T2

/-- **The minimum of `W(n,k,·)` over `1 ≤ e ≤ n−1` is attained at `e = n−1`.**
Proved by finite downward induction from `e` to `n−1` along the antitone
step above — no scan, no bound on `k`, no bound on `n` beyond `n ≥ 4`.
Registered as `lemma` for the same cosmetic reason as `W_antitone` above (the
seat's file uses `theorem`). -/
lemma W_min_at_spanning_tree (n k : ℤ) (hn : 4 ≤ n) (e : ℤ)
    (he1 : 1 ≤ e) (he2 : e ≤ n - 1) : W n k (n - 1) ≤ W n k e := by
  obtain ⟨m, hm⟩ : ∃ m : ℕ, e + (m : ℤ) = n - 1 := ⟨(n - 1 - e).toNat, by omega⟩
  clear he2
  induction m generalizing e with
  | zero =>
    have he : e = n - 1 := by simp at hm; omega
    rw [he]
  | succ m ih =>
    have hstep : W n k (e + 1) ≤ W n k e := by
      apply W_antitone n k e hn he1
      push_cast at hm
      omega
    have he1' : 1 ≤ e + 1 := by omega
    have hm' : (e + 1) + (m : ℤ) = n - 1 := by push_cast at hm ⊢; omega
    exact le_trans (ih (e + 1) he1' hm') hstep

end ErdosR25T2
-- VERITYOS ENTRY 10 END

-- VERITYOS ENTRY 11 BEGIN lemma ErdosR25T2.ce_at_spanning_tree 2edcc8aae1ac7afe65356a2315cfd9a0414f86ef509d3a71966d0fd31102a37e
namespace ErdosR25T2

/-- Critic C-T2-F's bridge: at the argmin `e = n−1`, `c_e = min(n−1, n−(n−1))
= 1`, so the `e = n−1` minimiser is `H(n,k,n−1,1)` exactly — the `c_e = 1`
half of Candidate D's step, stated in Candidate D's own words (re-registered
from `scratchpad/c6-crit-T2-F/CriticT2F.lean`, where it is also a `theorem`;
registered here as `lemma` for the same cosmetic ordering reason). -/
lemma ce_at_spanning_tree (n : ℤ) (hn : 2 ≤ n) : min (n - 1) (n - (n - 1)) = 1 := by
  omega

end ErdosR25T2
-- VERITYOS ENTRY 11 END

-- VERITYOS ENTRY 12 BEGIN theorem ErdosR25T2.candidateD_argmin 6e63b3780b3904087b6535c5007884e9d4bd735abbf683ce4b1373c519da0fbf
namespace ErdosR25T2

/-- **`candidateD_argmin`, the terminal declaration of this award (a scope
update of `E993-R25-FOREST-ORDER-BOUND-SHARPENED`; no new registration).**
Candidate D's missing step, in Candidate D's own words: `e = n−1, c_e = 1`
minimises `H(n,k,e,min(e,n−e))`, for every `n ≥ 4`, every integer `k`, every
`e ∈ [1, n−1]`. Built on `W_min_at_spanning_tree` (seat T2) and
`ce_at_spanning_tree` (critic C-T2-F's bridge), exactly as compiled in
`scratchpad/c6-crit-T2-F/CriticT2F.lean`. -/
theorem candidateD_argmin (n k e : ℤ) (hn : 4 ≤ n) (he1 : 1 ≤ e) (he2 : e ≤ n - 1) :
    Hbound n k (n - 1) 1 ≤ Hbound n k e (min e (n - e)) := by
  have h := W_min_at_spanning_tree n k hn e he1 he2
  unfold W at h
  rwa [ce_at_spanning_tree n (by omega)] at h

end ErdosR25T2
-- VERITYOS ENTRY 12 END

