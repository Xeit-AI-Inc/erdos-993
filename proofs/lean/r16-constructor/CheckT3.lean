import R16C3T

/-!
Axiom audit, T-world side (this module may not see the P-world; the clash of
record makes a single audit module impossible — `CheckP3` audits the other
side). Raw `#print axioms` transcripts are the receipts of record. The
neutral-layer declarations (`R16C3N`) are audited here once; `CheckP3`
audits only the P-world module's own declarations.
-/

-- §N1 neutral adjacency layer
#print axioms R16C3.nbAdjacent
#print axioms R16C3.nbAdjacent_comm
#print axioms R16C3.nbAdjacent_irrefl
#print axioms R16C3.nbAdjacent_nil_iff
#print axioms R16C3.nbAdjacent_cons_cons
#print axioms R16C3.not_nbAdjacent_cons_cons_of_ne
#print axioms R16C3.nbAdjacent_append_left

-- §N2 list helpers
#print axioms R16C3.dropLast_eq_take'
#print axioms R16C3.drop_dropLast_comm
#print axioms R16C3.take_mem_of_downclosed
#print axioms R16C3.singleton_headI_of_length_one

-- §N3 the neutral evaluation and its invariance engine
#print axioms R16C3.nbIndepFamily
#print axioms R16C3.mem_nbIndepFamily
#print axioms R16C3.nbSeqOn
#print axioms R16C3.nbSeqOn_coeff
#print axioms R16C3.nbSeqOn_image

-- §N4 components (the W1-general definitional extraction)
#print axioms R16C3.nbRel
#print axioms R16C3.nbRel_symm
#print axioms R16C3.nbReach
#print axioms R16C3.nbReach_symm
#print axioms R16C3.nbReach_trans
#print axioms R16C3.nbBlockOf
#print axioms R16C3.nbComponents
#print axioms R16C3.mem_nbBlockOf
#print axioms R16C3.nbBlockOf_subset
#print axioms R16C3.self_mem_nbBlockOf
#print axioms R16C3.nbBlockOf_eq_of_reach
#print axioms R16C3.nbBlockOf_eq_of_mem_inter
#print axioms R16C3.mem_of_mem_nbComponents
#print axioms R16C3.nbComponents_sup
#print axioms R16C3.nbComponents_disjoint
#print axioms R16C3.empty_notMem_nbComponents
#print axioms R16C3.nbComponents_nonempty
#print axioms R16C3.nbComponents_no_cross
#print axioms R16C3.reach_within
#print axioms R16C3.nbComponents_connected

-- §N5 tree blocks, structure theorem, edge count, normalization
#print axioms R16C3.IsNbTreeBlock
#print axioms R16C3.nbComponents_isTreeBlock
#print axioms R16C3.treeBlock_root
#print axioms R16C3.treeBlock_edge_count
#print axioms R16C3.treeBlock_normalize
#print axioms R16C3.append_left_injOn

-- §N6 σ4 neutral data
#print axioms R16C3.sSigma4block
#print axioms R16C3.sSigma4
#print axioms R16C3.threePathSeq
#print axioms R16C3.threePathSeq_coeff
#print axioms R16C3.a4
#print axioms R16C3.b4
#print axioms R16C3.c4
#print axioms R16C3.sigma4_adj_ab
#print axioms R16C3.sigma4_adj_bc
#print axioms R16C3.sigma4_nadj_ac
#print axioms R16C3.subset_triple_cases
#print axioms R16C3.sigma4_isTreeBlock
#print axioms R16C3.nbComponents_sigma4
#print axioms R16C3.nbIndepFamily_sigma4
#print axioms R16C3.nbSeqOn_sigma4

-- §T1 the T-world bridge and the general block-evaluation lemma (σ4+)
#print axioms R16C3.addr_iff_nb
#print axioms R16C3.seqOn_eq_nbSeqOn

-- §T2 W1-general: the four s-laws for the extraction
#print axioms R16C3.lawL1_components
#print axioms R16C3.lawL2_components
#print axioms R16C3.lawL3_components
#print axioms R16C3.lawL3'_components
#print axioms R16C3.hf_components

-- §T3 the general lawful pack
#print axioms R16C3.packGeneral
#print axioms R16C3.packGeneral_lawful

-- §T4 σ4 concrete witness layer
#print axioms R16C3.tPath5
#print axioms R16C3.vertices_p5
#print axioms R16C3.residual_tPath5
#print axioms R16C3.packG4_data
#print axioms R16C3.packG4_lawful
#print axioms R16C3.anchor_path5_rank1
#print axioms R16C3.anchor_path5_rank2
#print axioms R16C3.anchor_path5_rank3

-- §T5 payoff wiring (premises live, never discharged)
#print axioms R16C3.G1_closure_general

-- consumed keystones, printed at consume standing
#print axioms R16C2.lawfulT_mk
#print axioms R16C2.G1_closure_of_lawful
