# C2-CF-U5 critique report

## Disposition

**U5-pendant-extension-tagged-sum-change — retained_narrowed.** The exact encoded pair verifies the route's finite claim: a pendant extension can change the favorable leaf tags and the complete aggregate while the same rank remains eligible on both trees. The aggregate changes from -4256 to -6267, with both values negative. This provides no full-sum counterexample and no proof of the primary inequality.

I narrow the recurrence component to the correct case distinction stated in EVIDENCE.md. In the route's residual-graph discussion, “if u survives outside R” is an invalid condition because R=T-N_T[s]; the intended case is that u is deleted from R as a neighbor of s, while the new leaf survives as an isolate. If u=s, the new leaf is deleted as well. The generic pendant polynomial identity, old-leaf selector formula, new-leaf selector and new-leaf H/R formulas check out.

## Independent replay

I reconstructed the two ordinary trees from the exact edge recipe and replayed them using a scratch copy of the packet-listed ordinary_tree_checked.py. The replay checked all coefficient vectors through terminal zero extension, the first descent, every current leaf's strict selector value at p=8, each selected original leaf as a separate tag, and each summand in the full sum. It also directly checked the pendant-extension polynomial recurrence and the old-leaf H/R cases. Exact values and the runnable replay are in EVIDENCE.md and replay.py.

The route correctly distinguishes this operation-specific obstruction to carrying tags/aggregates unchanged from a refutation of the target sign. Its example does not establish any universal extension behavior, selector stability, guard-preserving reduction, or primary resolution.

## Limitations

- Only the stated 18- and 19-vertex pair was replayed; there is no exhaustive generation or census claim.
- Both full selected sums are negative; no positive full-sum witness was found.
- No class-wide sign theorem or valid minimal-counterexample reduction follows from this pair.
- The generic recurrence audit corrects one residual-graph case phrase; that correction does not enlarge the verified finite example's scope.
