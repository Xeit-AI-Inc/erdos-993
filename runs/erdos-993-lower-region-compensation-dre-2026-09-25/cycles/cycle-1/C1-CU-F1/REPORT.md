# C1-CU-F1 critique of C1-F1-1

## Disposition

**retained** as a bounded exact computation claim, with the scope stated by the source. It is not evidence for the universal lower-region aggregate. The source return's `proposed_verified` status is warranted only for its finite observation.

## Audit

I verified the SHA-256 digests listed in both assigned packets. The F1 claim says its deterministic run evaluated 30 seeded recipes and every eligible rank for each, totaling 582 rows, with no positive complete aggregate. I copied the pinned evaluator and search program into this seat's evidence directory and changed only the evaluator import and result-output paths. The source evidence was not executed or modified. The replay's complete JSON result equals the source `search_results.json`: 30 candidates, 582 rows, zero positive totals; row counts are 137 at order 91 and 445 at order 243. The generation function returned 14 recipes for each target order and adds the two stated anchors.

The graph recipe is connected and acyclic: each hub attaches to the root, each pendant leaf attaches to its hub, and each subdivided arm is a separate root-support-leaf path; direct leaves attach to the root. For a forest, the evaluator's recursion uses the usual disjoint alternatives at each rooted vertex: exclude it and combine each child's included/excluded states, or include it and require each child excluded. Polynomial multiplication therefore counts independent sets by size exactly. `alpha` is the degree of this polynomial. The evaluator checks `delta` for ranks 0 through `alpha`, including the terminal zero-extended difference. Its eligible-rank loop starts at `x+2` and ends at `floor(2a/3)`, which is equivalent for integer `p` to the strict guard `3p<2a+1`. For every rank, it loops over original leaves, uses the original support and original closed neighborhood, applies the strict selector `Delta_p(T-v)<0`, and adds the rank-`p-1` difference. Leaves sharing a support remain separate loop entries.

The order-91 and order-243 standing controls replay with the same `(a,x,p)`, favorable-leaf counts, one positive marked term each, and exact negative complete sums. The controls use a different labeling for the subdivided arm, so their leaf IDs differ; the matching is by the stated isomorphic recipe and exact values, not literal IDs. This is the relevant local-positive/full-negative behavior: it confirms that a positive summand does not refute the complete aggregate.

## Limits

The seed and recipe rule sample a bounded set; they do not exhaust even the described multi-hub family. The result does not prove a compensation inequality, a deficit budget, or the universal target, and it supplies no counterexample. The replay uses a copy of the same pinned dynamic-programming evaluator, so it checks reproducibility and output consistency rather than providing an independent implementation of the counting algorithm. I found no arithmetic, selector, rank, or scope defect in the bounded claim.

## Evidence

- `evidence/search_families_replay.py` and `evidence/ordinary_tree_checked.py`: scratch-local copies used for replay; only local paths were changed in the replay script.
- `evidence/replay_results.json`: exact replay output.
- `evidence/replay_audit.json`: equality and row-count/guard checks against the allowed source output.
- `evidence/control_replay.json`: replay of the two standing positive-term/full-negative controls.
