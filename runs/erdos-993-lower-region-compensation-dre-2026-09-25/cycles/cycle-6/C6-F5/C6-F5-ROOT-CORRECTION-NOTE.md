# Root correction of C6-F5 weights; original evidence immutable

The producer counts every favorable leaf contained in B, omitting the required active-tag witness condition. The contract weight is w_F(B)=sum_{v in F intersect B} 1{(B minus {v}) intersects N_T(s_v) minus {v}}. The wrong reported network supply-capacity differences (-1406,-6717) do not equal the correct recorded aggregates (-1218,-5434). Thus the original flow certificates prove a different weighted network and must not be awarded as the assigned relation.

The root copied direct_audit.py to C6-F5-root-corrected-direct-audit.py outside all sealed producer material, changed the weight to include the support-neighborhood witness, allowed omission of valid zero-capacity target nodes, and added assert upper_supply-lower_capacity==S. Exact direct replay on the identical two trees and ranks gives:

- profile(2,3,4), n15, a11, x5, p7: supply1483, capacity2701, flow1483, S=-1218;2025arcs,431positivearcs.
- profile(2,2,4,3), n18, a13, x6, p8: supply8033, capacity13467, flow8033, S=-5434;11691arcs,2134positivearcs.

These are root-origin corrected finite certificates, not a rewrite of the producer finding or a universal theorem. C6-F5-ROOT-CORRECTED-FLOW-EVIDENCE.json contains full positive arcs. The opposing critics should independently review the original record before any root correction is supplied to adjudication. The final adjudicator must independently validate any corrected certificate it retains and clearly distinguish the two different weight functions. Original REPORT/RETURN/code/evidence and their seals remain unchanged. No controller award at this stage.
