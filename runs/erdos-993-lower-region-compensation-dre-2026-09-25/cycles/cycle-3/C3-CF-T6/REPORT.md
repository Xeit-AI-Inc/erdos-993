# C3-CF-T6 critique of C3-T6

## Disposition

**retained** — `C3-T6-T4-PENDANT-GRAFT-SELECTOR-CLOSURE` is correct at its stated exact finite scope. The evidence verifies the specified (T_4) and its one-leaf graft at root 0 for (p=9), using the original supports and complete strict selector. It does not establish closure under arbitrary rooted grafts.

## Independent scope and arithmetic audit

The construction has path edges (0-1-2), four three-leaf claws attached by their centers to 0, and, in the second case, one additional leaf at 0. Thus the orders are (3+4(4)=19) and (20). The independence vectors in the route evidence give (alpha=14) in both cases. The differences through rank 14 have first negative entry at rank 7: at rank 6 they are respectively (259) and (1341), and at rank 7 they are (-1235) and (-1405). Therefore (x=7), (x+2=9=p), and (3p=27<29=2\alpha+1).

The original leaves of (T_4) are exactly the twelve claw leaves, in four support fibers of size three. The graft adds a thirteenth original leaf with support 0. All selector values are strict: Δ_9(T_4-v) is (-652) for each old leaf; after graft it is (-1395) for each old leaf and (-1536) for the new leaf. Hence the complete favorable sets are exactly the listed twelve and thirteen leaves, respectively. No support fiber is collapsed.

For an old leaf, the row values give (q(8)=1728,q(9)=912) before graft and (q(8)=3192,q(9)=1848) after graft. Since the summand is (q(9)-q(8)), these are (-816) and (-1344). For the new leaf the corresponding values are (1686,831), giving (-855). Summing each original leaf separately gives

- (S(T_4,9)=12(-816)=-9792);
- (S(T_4^+,9)=12(-1344)-855=-16983).

The recurrence (I(G^+;z)=I(G;z)+zI(G-r;z)) also gives the reported old-leaf selector update Δ_9(G^+-v)=Δ_9(G-v)+Δ_8(G-\{v,r\})); the displayed change (-652) to (-1395) is consistent with an added (-743). Deleting the new leaf recovers (T_4), consistent with its selector value (-1536).

## Replay and evidence

I copied the assigned `COMPUTE.py` into this scratch directory and ran that copy. Its JSON output matches the assigned `EVIDENCE.json` structurally and exactly; the replay confirms both eligibility checks, selector-row completeness, row-sum equality, and the two totals. `REPLAY.json` and the replayed `COMPUTE.py` are the only evidence paths cited in the return.

## Limits

This verifies two individual ordinary trees at one rank and one graft location. It is not an exhaustive family computation and gives no induction over (m), rank, root, or branch shape. Neither the favorable-selector closure nor the negative full sums imply a universal inequality or settle the primary lower-region aggregate. The replay reruns the route's transparent exact-integer recursion; the scope of the conclusion remains bounded to the explicit encodings and arithmetic above.
