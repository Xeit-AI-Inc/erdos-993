-- NOTE: split from the C6/C8 checks in `AxiomCheckC6.lean`. `R12C4T` (this
-- file's lineage, via `C2BetaGap`/`C4LForestBridge`/`C5LDeletionAcyclicity`)
-- and `R12C6T` (consumed only by `C6SD2GapReduction`) are two byte-identical
-- but independently-namespaced vendored copies of the same r12 corridor
-- module; importing both into a single file fails with "environment already
-- contains ..." because both declare the same names inside `namespace
-- RTree`. This is the same world-clash constraint the r16 runs' own
-- `CheckT`/`CheckP` split encodes ("no module may see both"); it is a
-- structural consequence of vendoring, not a source defect, and is not
-- counted against the two-repair cap (no vendored file's content or import
-- line changed; only the check-file split is new).
import C2BetaGap
import C4LForestBridge
import C5LDeletionAcyclicity
import Erdos993BetaC8

open RTree

-- C2BetaGap/BetaGap.lean (cycle-2/cycle-3 governed beta-gap normalization pair)
#print axioms beta_gap_eq_of_guard
#print axioms beta_bound_iff_gap_le_of_guard

-- C4LForestBridge.lean (cycle-4 governed independent-set count correspondence,
-- plus its own file's supporting theorems)
#print axioms c13DeletionGraph_adj_iff
#print axioms c13DeletionGraph_isAcyclic_of_ambient
#print axioms c13AddressFinset_card
#print axioms c13AddressFinset_subset
#print axioms c13DeletionGraph_indep_iff
#print axioms c13FinsetCarrierEquiv_apply
#print axioms c13FinsetCarrierEquiv_card
#print axioms c13DeletionGraph_indep_count_eq

-- C5LDeletionAcyclicity.lean (cycle-5 governed vertex-scoped deletion acyclicity)
#print axioms c5_vertex_scoped_deletion_acyclicity

-- Erdos993BetaC8.lean (cycle-8 governed component-extension theorem, plus its
-- own file's full supporting lemma set)
#print axioms Erdos993BetaC8.extensionAdj_symm
#print axioms Erdos993BetaC8.extensionAdj_irrefl
#print axioms Erdos993BetaC8.isIndependent_iff_isIndepSet
#print axioms Erdos993BetaC8.isIndependent_oldPart
#print axioms Erdos993BetaC8.isIndependent_rootFreePart
#print axioms Erdos993BetaC8.root_not_mem_of_y
#print axioms Erdos993BetaC8.s_not_mem_of_y
#print axioms Erdos993BetaC8.v_not_mem_of_s
#print axioms Erdos993BetaC8.old_reconstruct
#print axioms Erdos993BetaC8.rootFree_reconstruct
#print axioms Erdos993BetaC8.isIndependent_oldLift
#print axioms Erdos993BetaC8.isIndependent_rootFreeLift
#print axioms Erdos993BetaC8.isIndependent_insert
#print axioms Erdos993BetaC8.codeFinset_independent
#print axioms Erdos993BetaC8.codeFinset_card
#print axioms Erdos993BetaC8.codeToIndep_surjective
#print axioms Erdos993BetaC8.codeToIndep_injective
#print axioms Erdos993BetaC8.iCoeff_componentExtension
#print axioms Erdos993BetaC8.delta_componentExtension
#print axioms Erdos993BetaC8.rootSet_isIndependent
#print axioms Erdos993BetaC8.rootChoiceMap_injective
#print axioms Erdos993BetaC8.root_choose_le_coeffNat
#print axioms Erdos993BetaC8.root_not_mem_of_untouched
#print axioms Erdos993BetaC8.oneIncidenceMap_injective
#print axioms Erdos993BetaC8.card_untouched
#print axioms Erdos993BetaC8.oneSource_card_lower
#print axioms Erdos993BetaC8.pointedCoeff_card
#print axioms Erdos993BetaC8.one_root_count
#print axioms Erdos993BetaC8.rootSet_disjoint_rootFreeUnderlying
#print axioms Erdos993BetaC8.rootFreeUnderlying_isIndependent
#print axioms Erdos993BetaC8.isIndependent_union
#print axioms Erdos993BetaC8.threeRootMap_injective
#print axioms Erdos993BetaC8.card_rootFreeUntouched
#print axioms Erdos993BetaC8.threeSource_card_lower
#print axioms Erdos993BetaC8.three_root_strict_of_pos
#print axioms Erdos993BetaC8.iCoeff_neg
#print axioms Erdos993BetaC8.iCoeff_nonneg
#print axioms Erdos993BetaC8.delta_componentExtension_zero_pos
#print axioms Erdos993BetaC8.delta_componentExtension_one_pos
#print axioms Erdos993BetaC8.componentExtension_delta_nonpos_bounds

-- Headline declarations of record checked in THIS file (per assembly spec;
-- all already printed above): RTree.beta_gap_eq_of_guard,
-- RTree.beta_bound_iff_gap_le_of_guard, RTree.c13DeletionGraph_indep_count_eq,
-- RTree.c5_vertex_scoped_deletion_acyclicity,
-- Erdos993BetaC8.componentExtension_delta_nonpos_bounds. The sixth headline,
-- RTree.supportDegreeTwoGapReduction, is checked in AxiomCheckC6.lean (see
-- the world-clash note above).
