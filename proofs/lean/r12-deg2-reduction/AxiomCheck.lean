import R12C6T

open RTree

-- Deg2Reduction.lean (this route's own), full declaration set
#print axioms indepCountOn_succ_on
#print axioms DeltaOn_eq_add_Bgen_on
#print axioms a_eq_Bgen_add_Bgen_support
#print axioms a_support_lt_zero_iff
#print axioms exists_unique_otherNbr
#print axioms closedNbhd_eq_of_deg2
#print axioms vertices_sdiff_closedNbhd_support_eq_of_deg2
#print axioms a_eq_deltaOn_of_deg2

-- Headlines of record for this package
#print axioms alphaCounterexampleDeg2_iff
#print axioms alphaCounterexampleDeg2_imp_alphaCounterexample
#print axioms alphaTargetDeg2_iff
#print axioms alphaTargetDeg2_iff_ambientTargetDeg2
