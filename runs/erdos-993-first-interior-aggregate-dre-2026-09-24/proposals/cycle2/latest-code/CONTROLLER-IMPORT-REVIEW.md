# Code r27 import review — future Cycle 2 only
Snapshot HEAD: 8f1573372c9135b970300a3ec0aa38a95ecc55ce. The canonical registry now has 392 claims and preserves E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE as OPEN. The source snapshot contains 62 files: registry, ledger, four r27 formal packages and the r25 forest Delta2 package. All fetched bytes were hashed on the remote and checked against received bytes.

The r27 governed LA4 contract states unconditionally that a strict negative difference at natural k in a finite forest implies n <= 4k. Its firstDescent uses Nat.find. This is an order bound, not a no-recovery result. LA2 uses a different firstDescent implementation; no definitional transfer from it is authorized. Prior source provenance and attribution fences remain attached to the copied packages. No new proof award is made by this import.

Possible simplification, controller proposal only: for our eligible p=alpha-2, x<=alpha-4. A nontrivial connected tree has n>=alpha+1. Together with n<=4x this excludes alpha<=5. If alpha=6 then 7<=n<=8 and x<=2. Handle n=7 by the star forced by an independent 6-set; handle n=8 by the two-vertex cover complementary to an independent 6-set and the exact i3 formula. This avoids importing the r25 Delta2 order-9 theorem as a mathematical dependency, though that package remains available as provenance and a comparison. It does not yet discharge the small cases formally.

These are Cycle 2 proposal sources. No Cycle 1 searcher, critic, adjudicator or synthesis may read them.
