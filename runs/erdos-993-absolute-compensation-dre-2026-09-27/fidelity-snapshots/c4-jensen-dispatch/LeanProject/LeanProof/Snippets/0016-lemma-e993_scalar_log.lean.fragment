lemma e993_scalar_log {c f : ℝ} (hc : 0 < c) (hcf : c ≤ f) :
    2 * (f - c) / (f + c) ≤ Real.log (f / c) := by
  have h : 0 ≤ f / c - 1 := by
    apply sub_nonneg.mpr
    exact (le_div_iff₀ hc).2 (by simpa using hcf)
  have hlog := Real.le_log_one_add_of_nonneg h
  convert hlog using 1 <;> field_simp <;> ring
