import GenerationLaws
import LemmaA
import LemmaBStar

/-! R20C8-T3 — `#print axioms` receipts for EVERY declaration this
deliverable claims (every `theorem`/`def` across all three files, not
only the headline ones). Run via `lake build Check` and the output
captured verbatim into `build.log` / `build2.log`. Approved axiom set:
`[propext, Classical.choice, Quot.sound]` (Mathlib's own baseline) —
anything else appearing here is a fail-closed finding, not a pass. -/

-- GenerationLaws.lean
#print axioms R20C8T3Generation.object_class_remark
#print axioms R20C8T3Generation.disjoint_union_law
#print axioms R20C8T3Generation.edge_join_law
#print axioms R20C8T3Generation.proof_not_computation_remark
#print axioms R20C8T3Generation.pendant_not_primitive_remark
#print axioms R20C8T3Generation.mechanism_tier_remark

-- LemmaA.lean
#print axioms R20C8T3LemmaA.choose_strict_mono
#print axioms R20C8T3LemmaA.choose_mono_of_le
#print axioms R20C8T3LemmaA.lemma_A_core
#print axioms R20C8T3LemmaA.convCoeff_eq_poly_coeff
#print axioms R20C8T3LemmaA.lemma_A
#print axioms R20C8T3LemmaA.lemma_A_mono_to_half
#print axioms R20C8T3LemmaA.lemma_A_no_early_argmax
#print axioms R20C8T3LemmaA.negControl_hypothesis_needed

-- LemmaBStar.lean
#print axioms R20C8T3LemmaBStar.mono_of_adjacent_le
#print axioms R20C8T3LemmaBStar.anti_of_adjacent_le_offset
#print axioms R20C8T3LemmaBStar.anti_of_adjacent_le
#print axioms R20C8T3LemmaBStar.shiftAdd_zero
#print axioms R20C8T3LemmaBStar.shiftAdd_succ
#print axioms R20C8T3LemmaBStar.firstArgmax_le_turningPoint
#print axioms R20C8T3LemmaBStar.lemma_B_star
#print axioms R20C8T3LemmaBStar.counterA_isFirstArgmax
#print axioms R20C8T3LemmaBStar.counterB_isFirstArgmax
#print axioms R20C8T3LemmaBStar.counterA_not_weaklyUnimodal
#print axioms R20C8T3LemmaBStar.counterA_nonneg
#print axioms R20C8T3LemmaBStar.hypothesis_load_bearing
