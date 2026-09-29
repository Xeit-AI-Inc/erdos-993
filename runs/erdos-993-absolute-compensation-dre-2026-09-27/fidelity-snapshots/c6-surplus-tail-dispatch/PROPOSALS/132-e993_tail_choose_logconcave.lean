lemma e993_tail_choose_logconcave (N j : ℕ)
    (hj : 1 ≤ j) (hjN : j + 1 ≤ N) :
    (N.choose (j - 1) : ℝ) * (N.choose (j + 1) : ℝ) ≤
      (N.choose j : ℝ) ^ 2 := by
  let a : ℝ := (N.choose (j - 1) : ℝ)
  let b : ℝ := (N.choose j : ℝ)
  let c : ℝ := (N.choose (j + 1) : ℝ)
  have ha : 0 < a := by
    dsimp [a]
    exact_mod_cast Nat.choose_pos (by omega : j - 1 ≤ N)
  have hb : 0 < b := by
    dsimp [b]
    exact_mod_cast Nat.choose_pos (by omega : j ≤ N)
  have hjR : (0 : ℝ) < j := by exact_mod_cast hj
  have h1 : b * (j : ℝ) = a * ((N : ℝ) + 1 - (j : ℝ)) :=
    e993_tail_choose_adjacent N j hj (by omega)
  have h2 : c * ((j : ℝ) + 1) = b * ((N : ℝ) - (j : ℝ)) := by
    have h := e993_tail_choose_adjacent N (j + 1) (by omega) hjN
    push_cast at h
    convert h using 1 <;> ring
  have h1m := congrArg (fun x : ℝ => x * b * ((j : ℝ) + 1)) h1
  have h2m := congrArg (fun x : ℝ => x * a * (j : ℝ)) h2
  have hcross : (b ^ 2 - a * c) * (j : ℝ) * ((j : ℝ) + 1) =
      a * b * ((N : ℝ) + 1) := by nlinarith [h1m, h2m]
  have hnonneg : 0 ≤ a * b * ((N : ℝ) + 1) := by positivity
  have hres : 0 ≤ b ^ 2 - a * c := by nlinarith [hcross, hnonneg]
  dsimp [a, b, c] at hres ⊢
  linarith
