import R16C3P

/-!
Axiom audit, P-world side (this module may not see the T-world; `CheckT3`
audits the other side and the shared neutral layer). Raw `#print axioms`
transcripts are the receipts of record.
-/

-- §P1 the P-world bridge and the P-side general evaluation
#print axioms R16C3.addrP_iff_nb
#print axioms R16C3.indepNNSeq_eq_nbSeqOn

-- §P2 the realization theorem
#print axioms R16C3.exists_tree_of_downclosed
#print axioms R16C3.exists_realizer

-- §P3 LAW IV′ at general block shapes (the RES-12 content)
#print axioms R16C3.lawIVPrime_of_treeBlocks
#print axioms R16C3.lawIVPrime_components

-- §P4 σ4 concrete non-vacuity
#print axioms R16C3.lawIVPrime_sigma4
#print axioms R16C3.sigma4_realizer

-- consumed keystone of the P-lineage, printed at consume standing
#print axioms R16C2.LawIVPrime
#print axioms R16C2.indepNNSeq_coeff_one
#print axioms RTree.indepNNSeq_coeff
