# C4-CU-F4 critique of C4-F4

## Disposition: retained

The route claim is retained as a bounded computational probe only. It correctly avoids claiming a proof, refutation, or universal selector statement. Its finite result is restricted to the exact populations and sample seed below.

## Checks

All 183 source hashes listed across the case and common packets matched. I copied the listed `REPLAY.py` and `EVIDENCE.json` into this scratch root, ran the copied replay, and compared the generated evidence object with the copied source evidence: they match exactly. The replay records exhaustive labeled-tree enumeration for orders 2 through 7 (18,248 trees, with no eligible tree/parameter rows) and 40 seeded Prüfer samples at each order 16 through 60 (seed 20260926). The 2,535 guarded sample rows have nonempty selectors; their favorable sets equal their complete original degree-one sets, their selected deletion differences are negative, their term sums reproduce the recorded full sums, and none is positive. Checks of the full inventory's fields accompany replay reproducibility; they are not a second independent implementation of every sampled count.

I independently reconstructed the first order-17 sample from its edge list and counted independent sets by literal vertex-subset enumeration. This gives polynomial `[1,17,120,462,1075,1586,1516,945,383,99,15,1]`, hence `alpha=11` and first descent `x=5` when the terminal zero-extended difference is included. At `p=7`, the guards hold: `x+2=7<=p` and `3p=21<2alpha+1=23`. All eight original leaves are selected. The eight summands in leaf order are `-205,-219,-219,-172,-111,-200,-172,-145`, giving `S=-1443`. Leaves 1 and 2 are distinct selected tags sharing original support 7. The complete fixture details are in `AUDIT-EVIDENCE.json`.

The route's root check evaluates its recurrence from all 17 roots of this same fixture and reports matching polynomials, including all eight leaf roots. This supports only the implementation check on that one tree. It does not prove a general rooted recurrence or selector theorem.

## Scope and limitations

The exact exhaustive boundary is orders 2 through 7. Larger cases are 40 deterministic samples per order from 16 through 60; no sampled tree at orders 8 through 15 or unsampled larger-order tree is covered. The finding that all sampled selectors equal all original leaves does not establish that proper selectors cannot occur. The selected full sums are nonpositive in the tested inventory only. No universal aggregate proof or counterexample, or global compensation mechanism, follows.
