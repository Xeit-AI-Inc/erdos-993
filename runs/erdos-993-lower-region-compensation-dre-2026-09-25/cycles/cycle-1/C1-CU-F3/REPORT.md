# C1-CU-F3 critique of C1-F3-1

## Disposition

**retained** as the stated exact finite observation, with its stated bounded scope. The claim correctly says this pair does not resolve the universal lower-region aggregate. It supplies a concrete failure of termwise sign preservation under this graft: the retained favorable leaf 2 changes from a negative term to a positive term, while both complete selected sums stay negative.

## Exact replay and domain checks

I copied the listed replay script and `inputs/ordinary_tree_checked.py` into this seat's `evidence/` directory. In the copied script only, I redirected the evaluator import to that copy and the output to `evidence/graft_pair.replayed.json`; the sealed source was not run as a writer or modified. Running the copied script produced JSON structurally equal to the sealed `graft_pair.json`. The comparison and exact audit totals are recorded in `evidence/audit.json`; the complete replay is in `evidence/graft_pair.replayed.json`.

The base graph is the stated path `0-1-2` and 22 root-adjacent 3-leaf stars, and the second graph adds `4-91-92-93`. The edge and vertex counts (91/90 and 94/93) are consistent with finite ordinary trees; the construction attaches a path at one existing leaf, preserving connectedness and acyclicity. For the base, the replay gives `alpha=68`, terminally checked `x=32`, and `p=35`; hence `x+2=34<=35` and `3p=105<137=2alpha+1`. For the graft it gives `alpha=69`, terminally checked `x=33`, and the same `p`; hence `35<=35` and `105<139`. The full independence vectors and `Delta_j` arrays include rank `alpha`, so the zero-extended terminal difference is considered in finding `x`.

Each tree has 67 original leaves and all 67 have strictly negative `Delta_35(T-v)` in the replay; thus the selected favorable set is complete in both. The base aggregate is the exact sum `-838171658290934690688`; every term is negative. In the graft, old leaf 4 is no longer a leaf, new leaf 93 is favorable, and all 66 remaining old leaves plus 93 are selected. Leaf 2 remains favorable and its term changes from `-212336130412243110` to `+424672260824486220`. It is the only positive selected term. Summing every selected term gives `-2341400510849661617965`, matching the recorded full sum.

## Scope and fences

This evidence supports only one exact pair and one fixed rank. The graft does not preserve the selector set: it changes the underlying graph, loses an old leaf tag, and gains a new one. Therefore the pair blocks an inference that every retained favorable leaf term stays nonpositive under this graft, but it does not show that any complete eligible sum is positive or that the target inequality fails.

The supplied standing controls are consistent with this scope. The order-91 `T_22` control has a positive marked term but a negative complete sum at its listed rank; `T_60` likewise has a positive marked term and negative complete sum. The `K_(1,12)` lower-region fixture has negative complete sum. These controls do not convert a local positive term or a changed term into a full-sum counterexample. The replayed graft pair itself is another local-positive/full-negative example. No transport principle, global deficit budget, or proof of the universal target is established here.

## Limitations

- Only the sealed pair was replayed. The report's exploratory family searches have no retained complete enumeration data, so their bounds and outputs were not independently replayed and support no exhaustive claim.
- This finite pair does not prove or refute the universal lower-region aggregate and says nothing new about the separate tagged incidence identity.
- No public theorem or external citation is used.
