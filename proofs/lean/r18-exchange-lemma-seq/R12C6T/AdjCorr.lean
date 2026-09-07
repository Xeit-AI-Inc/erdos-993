import R12C6T.Targets

/-! Adjudicator's own check (stage-5, C4): is the composition theorem's
conclusion a RESTRICTION of (A), or is it (A) itself?  Mechanized here. -/

noncomputable section
namespace RTree

/-- The composition theorem's universally-closed conclusion. -/
def AdjQ : Prop :=
  ∀ (t : RTree) (v : List ℕ) (p : ℕ),
    v ∈ t.leaves → 1 ≤ K_A t p → t.a v p < 0 → t.a (t.support v) p < 0

theorem adj_KA_ge_one_iff (t : RTree) (p : ℕ) :
    1 ≤ K_A t p ↔ t.crossingIndex + 1 ≤ p := by
  unfold K_A; omega

/-- **ADJUDICATOR CHECK: `AdjQ` is EXACTLY `TheoremA_unconditional`.** -/
theorem adjQ_iff_TheoremA_unconditional : AdjQ ↔ TheoremA_unconditional := by
  constructor
  · intro h t s p hp hpf
    obtain ⟨v, hv, hvs, ha⟩ := hpf
    have := h t v p hv ((adj_KA_ge_one_iff t p).mpr hp) ha
    rw [hvs] at this; exact this
  · intro h t v p hv hk ha
    exact h t (t.support v) p ((adj_KA_ge_one_iff t p).mp hk) ⟨v, hv, rfl, ha⟩

/-- **ADJUDICATOR CHECK: (α) ∧ (β) ⟹ THEOREM (A), in full, unrestricted.** -/
theorem adj_TheoremA_of_alpha_beta (hA : AlphaTarget) (hB : BetaTarget) : TheoremA :=
  theoremA_iff_unconditional.mpr
    (adjQ_iff_TheoremA_unconditional.mp (stmtA_leafWitnessed_of_alpha_beta hA hB))

end RTree
end
