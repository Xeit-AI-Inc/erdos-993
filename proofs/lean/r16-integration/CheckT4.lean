import R16C4T

/-!
Axiom audit, T-world side (this module may not see the P-world; `CheckP4`
audits the other side). Raw `#print axioms` transcripts are the receipts of
record. The two new integration declarations are audited together with the
sealed declarations they consume, so the printed closure covers the whole
wired chain at this build.
-/

-- §1 the two NEW integration theorems (this route's only declarations)
#print axioms R16C4.G1wide_closure_of_constructed_identification
#print axioms R16C4.ambientTargetDeg2_of_KL_KSCOPE_HG2wide

-- §2 the consumed sealed constructor chain (T-half; re-audited at this build)
#print axioms R16C3.packGeneral
#print axioms R16C3.packGeneral_lawful
#print axioms R16C3.G1_closure_general
#print axioms R16C2.G1_closure_of_lawful
#print axioms R14C3P.G1_closure_of_identification

-- §3 the consumed sealed adopted-surface chain (re-audited at this build)
#print axioms RTree.AmbientTargetDeg2
#print axioms RTree.ambientTargetDeg2_of_G1wide_G2wide
#print axioms RTree.two_le_of_K_A_eq_one
