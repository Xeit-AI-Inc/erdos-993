import R14C2P

-- R14C3-P deliverable declarations (the forest-corollary dichotomy chain,
-- incl. dichotomy_premise_free; fully-qualified names grepped directly
-- from R14C2P/TreeInstantiation.lean, R12C2P/P1.lean, Forest.lean,
-- ExtensionProfile.lean, NNSeqAdmission.lean, and R14C1P/ForestCorollaries.lean).
-- Reproduces the gated check/Axioms.lean list verbatim.
#print axioms R14C2P.fseq
#print axioms R14C2P.ford
#print axioms R14C2P.prod_fseq
#print axioms R14C2P.sum_ford
#print axioms R14C2P.order_pos
#print axioms R14C2P.hKL_transport
#print axioms R14C2P.RForest.indepNNSeq_nil
#print axioms R14C2P.RForest.indepNNSeq_cons
#print axioms R14C2P.RForest.unimodal_nil
#print axioms R14C2P.RForest.split
#print axioms R14C2P.coreList
#print axioms R14C2P.mem_coreList
#print axioms R14C2P.RForest.trs2_logConcavePart
#print axioms R14C2P.RForest.unimodal_of_at_most_one_nonTRS2
#print axioms R14C2P.RForest.core_reduction
#print axioms R14C2P.RForest.forest_of_core
#print axioms R14C2P.RForest.dichotomy
#print axioms R14C2P.RForest.order_ge_52
#print axioms R14C2P.RForest.order_ge_52_of_disjunct_b
#print axioms R14C2P.RForest.core_order_ge_26k
#print axioms R14C2P.dichotomy_premise_free
#print axioms R14C2P.RForest.dichotomy_premise_free
#print axioms R14C2P.dichotomy_LC
#print axioms R14C2P.RForest.dichotomy_LC
#print axioms R14C2P.core_order_ge_26
#print axioms R14C2P.core_prod_singleton
#print axioms R14C2P.core_order_sum_ge
#print axioms R14C2P.core_empty_of_small
#print axioms R14C2P.unimodal_of_order_le_25
#print axioms R14C2P.RForest.order_ge_26
#print axioms R14C2P.RForest.order_ge_27
#print axioms R14C2P.reshaped_transfer
#print axioms R14C2P.reshaped_transfer_sharp
#print axioms R14C2P.RForest.reshaped_transfer_sharp

#print axioms P1_NNSeq
#print axioms RForest.indepNNSeq_eq_prod
#print axioms transfer_to_forest
#print axioms RTree.TRS2_iff_adjacentLogConcave
#print axioms RTree.indepNNSeq_ne_zero
#print axioms RTree.indepNNSeq_positiveIntervalSupport
#print axioms card_fromPieces
#print axioms R14C1P.core_reduction
#print axioms R14C1P.transfer_reshaped
#print axioms R14C1P.forest_counterexample_dichotomy
#print axioms R14C1P.forest_counterexample_order_ge_52
#print axioms R14C1P.forest_unimodal_of_at_most_one_nonTRS2
