-- See AxiomCheck.lean for the world-clash note: R12C4T (this file's lineage)
-- and R12C6T (checked in KernelCheckC6.lean) are independently-namespaced
-- vendored copies of the same r12 corridor module and cannot both be
-- imported into one file.
import C2BetaGap
import C4LForestBridge
import C5LDeletionAcyclicity
import Erdos993BetaC8

open RTree

#check @beta_gap_eq_of_guard
#check @beta_bound_iff_gap_le_of_guard
#check @c13DeletionGraph_indep_count_eq
#check @c5_vertex_scoped_deletion_acyclicity
#check @Erdos993BetaC8.componentExtension_delta_nonpos_bounds
