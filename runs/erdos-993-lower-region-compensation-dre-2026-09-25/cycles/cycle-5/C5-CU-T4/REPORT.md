# C5-CU-T4 critique of C5-T4

## Disposition

**C5-T4-SELECTOR-PENDANT-PATH-RECURRENCE: retained.** The root occupancy decomposition proves the stated identity exactly. The path-polynomial recurrence and its indexing are correct for every attachment length m>=1, with P_0=1 and P_1=1+z. Coefficient extraction then gives the strict selector test at every integer rank, including zero extension above the degree.

For an old leaf v distinct from the attachment root, deleting v commutes with the attachment. Applying the identity to T-v rooted at r therefore evaluates that leaf's exact selector condition after attachment. This is tagwise, so leaves with the same support are still evaluated separately. If r was an original degree-one leaf, it ceases to be a leaf after attachment. Deleting the new endpoint gives the shorter attachment, including the m=1 case where the result is T. These facts support the claim's stated interface.

There is a narrow bookkeeping boundary for a singleton base tree: when m=1 the formerly isolated root becomes a leaf of the result, though it was not an original degree-one leaf. The claim promises selector tests for surviving original leaves and the new endpoint, not a full inventory of all newly created leaves; this does not invalidate the claim as written.

## Example and primary-scope check

The K1,7 calculation is correct: for an old leaf v, T-v=K1,6 has coefficients (1,7,15,20,15,6,1), so Delta_3=-5. For the rooted state, A=(1+z)^6 and B=z, with Delta_2(A)=5; after attaching one leaf, T'-v=K1,7 has coefficients (1,8,21,35,35,21,7,1), so Delta_3=0. Thus the strict selector can change under attachment.

This example does not address the primary aggregate. For K1,7 the first negative difference is x=4, while p=3, so x+2<=p fails. More generally, the recurrence proves no preservation of x, alpha, the strict lower-region guard, or the complete selected sum S. No conclusion on the OPEN primary claim follows.

The derivation and exact coefficient check are recorded in EVIDENCE.json. No imported theorem or computation is needed.

## Limitations

- The result is a selector-evaluation identity for the specified attachment, not an eligibility-preserving closure theorem.
- It gives no bound on changes in the full selected aggregate and does not prove or refute that aggregate.
- The exhibited strict-sign change is outside primary eligibility.
