import R14C4T
import Check.Axioms

open RTree

-- R14C4-T deliverable declarations (band theorem, premise-free; the 13
-- headline declarations of record for this package). Reproduces the
-- gated Check/Axioms.lean list verbatim.
#print axioms RTree.indepSet_subset
#print axioms RTree.succ_mul_indepCountOn_le
#print axioms RTree.DeltaOn_nonpos_of_card_le_two_mul
#print axioms RTree.residual_nonpos_of_card_le_band
#print axioms RTree.ambientInstance_of_card_le_band
#print axioms RTree.residual_eq_zero_of_card_le_band_on_G2
#print axioms RTree.not_lymViolation
#print axioms RTree.not_bandPositive
#print axioms RTree.one_le_degree_of_otherNbr
#print axioms RTree.ambientInstance_of_order_le_two_mul
#print axioms RTree.ambientTargetDeg2_of_G1wide_G2wide
#print axioms RTree.wideHG1_of_HG1
#print axioms RTree.wideHG2_of_sharpHG2
