-- Split from `AxiomCheck.lean` because `R12C6T` (this file's lineage, via
-- `C6SD2GapReduction`) is a byte-identical but independently-namespaced
-- vendored copy of the same r12 corridor module as `R12C4T` (checked in
-- `AxiomCheck.lean`); importing both into one file fails with "environment
-- already contains ..." since both declare the same names inside `namespace
-- RTree`. See the note in `AxiomCheck.lean` for detail.
import C6SD2GapReduction

open RTree

-- C6SD2GapReduction/CANDIDATE.lean (cycle-6 governed support-degree-two gap
-- reduction, plus its own file's supporting theorems)
#print axioms stage7_indepCountOn_succ_within
#print axioms stage7_exists_unique_otherNeighbor
#print axioms stage7_closedNbhd_eq_of_degree_two
#print axioms supportDegreeTwoGapReduction

-- Headline declaration of record checked in THIS file (per assembly spec;
-- already printed above): RTree.supportDegreeTwoGapReduction. The other five
-- headlines are checked in AxiomCheck.lean.
