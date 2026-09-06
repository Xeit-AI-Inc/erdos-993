-- The axiom-check role for this package is fulfilled by the four vendored
-- gated audit files CheckT3.lean/CheckP3.lean (cycle 3, carried forward
-- byte-identical from r16-constructor) and CheckT4.lean/CheckP4.lean
-- (cycle 4, new) — already-comprehensive `#print axioms` transcripts. This
-- file adds the r12-pattern `#check` signatures for this package's own
-- headline: the integrated theorem with premise set exactly
-- {Premise K, K-SCOPE}. Both headline declarations live in `R16C4T.lean`
-- under namespace `R16C4`, which imports only the T-world lineage (never
-- the P-world), so — unlike the cycle-3 constructor pair — a single file
-- suffices here.
import R16C4T

open R16C4

#check @G1wide_closure_of_constructed_identification
#check @ambientTargetDeg2_of_KL_KSCOPE_HG2wide
