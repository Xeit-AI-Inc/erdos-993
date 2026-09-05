import R12C4T
import R12C4TAdj

open RTree

-- T1/T2, consumed (governed, GATE-R12-C)
#print axioms a_support_eq_a_add_b_sub_Bgen
#print axioms a_support_neg_of_favorable_and_bBound

-- Targets.lean (R12C4-T route's own)
#print axioms alphaCounterexample_iff
#print axioms alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one
#print axioms betaCounterexample_iff_not
#print axioms stmtA_leafWitnessed_of_beta_kA_ge_two
#print axioms stmtA_leafWitnessed_of_alpha_beta

-- BrFact1.lean (R12C4-T route's own)
#print axioms toPieces_subset_of_subset_fromPieces
#print axioms fromPieces_mono
#print axioms indepPolyOn_fromPieces_eq_prod
#print axioms vertices_sdiff_closedNbhd_root_eq
#print axioms indepPolyOn_Bgen_root_eq_prod
#print axioms indepCountOn_Bgen_root_eq_coeff

-- AdjCorr.lean (R12C5-CORR-1 adjudicator theorems, re-hosted here via
-- import-line-adjusted copy; see receipts for the single changed line)
#print axioms AdjQ
#print axioms adj_KA_ge_one_iff
#print axioms adjQ_iff_TheoremA_unconditional
#print axioms adj_TheoremA_of_alpha_beta

-- Headline declarations of record for this package (per assembly spec):
-- stmtA_leafWitnessed_of_alpha_beta, adj_TheoremA_of_alpha_beta,
-- adjQ_iff_TheoremA_unconditional, alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one
-- (all already printed above)
