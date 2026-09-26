# C1-F2 cross-orientation critique (orientation T)

## Disposition of C1-F2-1: retained

The source claim is a bounded computational observation about its stated seeded sample, not a theorem about all finite trees. I copied the worker's search program and the listed `ordinary_tree_checked.py` helper into this seat's `evidence/` directory. In the copied program I changed only the root/import path and output filename so it reads the local helper and writes `replay_results.json` under this seat's scratch root. Running that copy reproduced all 1,200 cases, 878 eligible tree-rank rows, 650 trees with an eligible row, zero rows with a positive selected summand, and zero positive complete aggregates. A JSON object comparison confirms the replay output equals the sealed `search_results.json` in full.

I independently checked the reported best row by enumerating every vertex subset on its 11-vertex edge list, testing independence directly, and recomputing deletion polynomials. Its polynomial is `[1,11,45,100,140,132,85,36,9,1]`, so `alpha=9`. Computing zero-extended differences through rank `alpha` gives `x=4`; `p=6` satisfies `x+2<=p` and `3p=18<19=2alpha+1`. All nine original leaves pass the strict selector, including each leaf as a separate tag. Direct deletion counts give four terms `-27` and five terms `-29`, hence `S=-253`. This verifies the example and arithmetic, not the complete sample by an independent implementation.

The computation is consistent with the exact target conventions: the selector uses `Delta_p(T-v)<0`, summands use rank `p-1`, and the support and closed neighborhood are taken in the original tree. The report correctly describes the search as limited to its 1,200 pseudo-randomly generated cases (seed `99320260925`, orders 9–36, and the three specified recursive/backbone modes). That generator has no exhaustive boundary over all ordinary trees, so the data do not prove or refute the universal aggregate.

No transport mechanism or pointwise-to-global inference is proposed by this source claim. The common handoff's local-positive/full-negative controls therefore do not challenge this bounded sample statement and cannot turn it into a universal result. No standing-control computation was needed to dispose of this claim.

## Limits

- The full seeded sample replay uses the copied evaluator and copied search logic, so it is a replay of the source computation rather than an independent implementation of all 1,200 rows.
- Independent subset enumeration checks only the reported closest row.
- The randomized generation is not exhaustive across trees of orders 9–36 and says nothing universal about larger trees.
- The primary lower-region aggregate remains unresolved by this claim.
