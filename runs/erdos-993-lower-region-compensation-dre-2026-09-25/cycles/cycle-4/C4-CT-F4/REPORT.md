# C4-CT-F4 critique of C4-F4

## Disposition

**C4-F4-BOUNDED-SELECTOR-RECURRENCE-PROBE — retained.** The claim accurately describes a bounded computation and expressly makes no universal inference. Its finite conclusions are supported by the pinned replay and checked against an independent exact audit of its first eligible fixture. This is not evidence that the lower-region aggregate is universally true, or that every favorable selector contains every original leaf.

## Independent checks

All four hashes in the case packet and all 179 hashes in the common packet matched. I ran the pinned `REPLAY.py` only after copying it into this worker's scratch directory. The copied source hash and regenerated `EVIDENCE.json` hash equal their packet pins. The deterministic replay reports all 18,248 labeled trees of orders 2–7 (with no eligible parameters), then 40 seeded Prüfer samples at each order 16–60 and 2,535 eligible tree/parameter rows. The replay inventory reports zero positive full sums, zero proper favorable selectors, and no selector membership change. Those large-sample aggregate counts are the replay's recorded results; I did not independently regenerate every sampled tree or every row.

I independently recomputed the first eligible order-17 tree by literal enumeration of all vertex subsets. Its edge list, polynomial, first descent, and original leaves are recorded in `INDEPENDENT-CHECK.json`. The polynomial is

`[1,17,120,462,1075,1586,1516,945,383,99,15,1]`,

so `alpha=11`, `x=5`, and `p=7` satisfies `x+2<=p` and the strict guard `3p=21<23=2alpha+1`. For every original leaf, I recomputed `Delta_p(T-v)` to form the selector; all eight leaves are favorable. Recomputing both deletion polynomials for every selected leaf gives terms `-205,-219,-219,-172,-111,-200,-172,-145`, hence the complete `S=-1443`. Leaves 1 and 2 share support 7 and are retained as distinct summands. A separately coded rooted include/exclude recurrence gave the same whole-tree polynomial at all 17 choices of root, including all eight leaf roots.

These checks support the reported example and its recurrence-boundary check. They do not certify the whole order-17–60 sample inventory independently, nor do they establish a general root-invariance theorem for selector behavior. The exhaustive small-order search has no eligible rows, so it provides no small eligible counterexample or proof.

## Scope and limitations

The route's return is appropriately `proposed_open`: it proves neither the primary aggregate nor a refutation, and it does not prove proper selectors impossible. The exact computational boundary remains all labeled orders 2–7 plus 40 deterministic samples at each order 16–60, with every eligible integer parameter tested in each sample. No unlisted source or imported theorem is needed for this critique. Replay is available from the copied worker directory using `python3 REPLAY.py`; the script regenerates `EVIDENCE.json` there.
