# Replay record

The route generator and `ordinary_tree_checked.py` evaluator were copied into this worker's scratch directory before execution. The copied route script was adapted only to load `ordinary_tree_checked.py` beside itself (using its own file path); its generator, filter, eligibility tests, evaluator calls, and result construction were unchanged. Execution was foreground, from `evidence/`, using Python 3: `python3 replay_search_f3.py`. The output JSON was compared as parsed data with the pinned route result and was exactly equal.

| p | n | generated filtered forests | eligible | positive local terms | positive complete sums | eligible S range |
|---:|---:|---:|---:|---:|---:|---:|
| 3 | 8 | 10 | 0 | 0 | 0 | none |
| 4 | 10 | 66 | 0 | 0 | 0 | none |
| 5 | 12 | 430 | 0 | 0 | 0 | none |
| 6 | 14 | 2,923 | 418 | 0 | 0 | -387 to -212 |
| 7 | 16 | 20,486 | 1,221 | 0 | 0 | -1,495 to -844 |

For the maximum rows, p=6 has `a=9`, `x=4`, six favorable leaves, and S=-212; p=7 has `a=11`, `x=5`, eight favorable leaves, and S=-844. Both satisfy `x+2<=p` and `3p<2a+1`. In the copied evaluator, the first-descent loop includes `rank=len(poly)-1`; coefficient lookup is zero outside the stored polynomial, so this checks the terminal zero-extended difference. Favorability is strict `Delta_p(T-v)<0`; `aggregate_row` retains every original leaf passing that test, and computes each original-support term separately.

The family generator enumerates rooted unlabeled branch-tree types as sorted multisets of rooted child types and then multisets of total branch order `2p`. It filters to at least two branch components and at least two distinct rooted component types. This is not an enumeration of all trees of order `2p+2`; no exhaustive conclusion outside this filtered family and p=3,...,7 is supported.
