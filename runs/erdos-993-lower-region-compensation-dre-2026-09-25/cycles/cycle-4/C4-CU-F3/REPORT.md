# C4-CU-F3 critique (orientation U)

## Disposition

**C4-F3-TM5-EXACT-REPLAY — retained.** The stated exact-tree claim is correct at its narrow, one-instance scope. An independent reconstruction and rooted include/exclude forest recurrence give the same order, independence number, first negative difference, full favorable set, every selected summand, and full aggregate. See [AUDIT.json](AUDIT.json); [audit.py](audit.py) is the replayable independent checker.

## Independent checks

I reconstructed the stated graph: 23 vertices and 22 edges, connected by graph traversal, hence a tree. Reconstructing original degree-one vertices gives endpoint 2 and the 15 private claw leaves. The independent checker counts each required deletion forest using a rooted include/exclude recurrence, separately from the case replay. It obtains alpha=17, x=8, and at p=10 the guards are 8+2<=10 and 30<35. Every one of the 16 original leaves is strictly selected: the endpoint deletion has Delta_10=-8147 and each claw-leaf deletion has Delta_10=-6751. The endpoint summand is -1430; each of the other 15 summands is -5519; their complete sum is -84215. Thus the claimed exact S value and its eligibility survive independent verification.

## Corrections to supporting material

The case REPORT.md says alpha=16 and writes 30<33. This conflicts with its own EVIDENCE.json and replay.py, and with the graph: the correct independence number is 17, making the guard 30<35. The claim remains eligible with this correction.

The replay's auxiliary multiply-marked count is out of scope. Its `containing(S)` helper deletes S and its neighbors from the original T, but omits the already deleted leaf and support defining H_v. For a claw-leaf tag this gives 16619; counting in H_v as required gives 7263 per tag, or total C=108945 over the 15 claw tags (the endpoint tag has C=0). Consequently the reported C=249285 and E=kU+C=1788780 are not validated incidence values. With the corrected C, the arithmetic kU+C is 1648440; this critique did not independently enumerate actual addability E and does not certify an incidence identity. This defect does not change the direct full-sum calculation, which independently gives -84215.

## Limits

This verifies one T_5 instance only. It proves no bound for other family members or all eligible ordinary trees, and provides no feasibility or Hall certificate for the mixed network. The auxiliary incidence interpretation remains unverified. No literature bridge or universal proof is used.
