# C6-F5 search report: direct heterogeneous switch flows

## Result

I directly generated independent sets and the deletion plus two-for-one relation for two heterogeneous trees in the allocated branch family. Each tree has vertices `0-1-2` as a path; distinct branch centers are adjacent to `0`; center `i` has `r_i` private leaves. Bit `i` in the replay masks records whether vertex `i` is selected. The edge lists and all replay output are in `EVIDENCE.json`; `direct_audit.py` reproduces it using the specified Python 3.11 executable.

For an upper independent set `I` of size `p+1`, its supply is the number of favorable original leaves in `I`. Its allowed lower neighbors are obtained either by deleting one selected vertex, or by choosing an absent vertex with exactly two neighbors in `I`, deleting those two neighbors, and inserting the chosen vertex. A lower set's capacity is the number of favorable leaves it contains. The computation deduplicates identical resulting lower sets, enumerates every allowed relation edge, and runs integer max flow. It independently checks source and sink conservation, their respective weight bounds, and equality of the summed positive arc flows to the max-flow value.

| Arity profile | `n` | `alpha` | `x` | Eligible `p` checked | `S(T,p)` | Upper supply | Lower capacity | Exact flow | Relation arcs |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `(2,3,4)` | 15 | 11 | 5 | 7 | -1218 | 1563 | 2969 | 1563 | 2025 |
| `(2,2,4,3)` | 18 | 13 | 6 | 8 | -5434 | 8751 | 15468 | 8751 | 11691 |

For the first tree, `x+2=7` and `3p=21<23=2 alpha+1`. For the second, `x+2=8` and `3p=24<27`. The displayed rank is the only eligible rank in each instance. The full tree independence vectors, first descent, each original leaf's `Delta_p(T-v)`, the complete favorable set, and each distinct selected summand are recorded in the evidence. Thus the selector is computed from the original tree and every endpoint/private leaf remains a separately tagged summand.

In both finite networks the max flow equals total upper supply, so no deficient cut exists in these two tested instances for this relation and these fixed weights. The exact positive-flow arc lists are provided as `[upper_mask, lower_mask, amount]` triples. The graph labels, local adjacency rule, and integer flow checks make these bounded certificates replayable without orbit compression.

## Scope and limitations

This is bounded exact computation on two stated unequal-arity trees at their eligible ranks. It provides neither a theorem for all heterogeneous profiles nor a proof of the lower-region aggregate for arbitrary ordinary trees. Saturating the relation network in these examples is not a general lifting or compensation theorem. The quotient/orbit lifting obligation for the separately pinned homogeneous `T_m` certificates was not used or reviewed here; the source map identifies the protocol and artifacts, and this report makes no claim that those materials are unavailable or audited. The two nonpositive aggregate values are bounded outcomes, not a universal conclusion and not a counterexample.
