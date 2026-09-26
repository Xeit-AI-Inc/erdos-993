# C1-CT-F1 critique of C1-F1-1

## Disposition

**retained.** C1-F1-1 is an accurate bounded-computation claim at exactly its stated scope. The route does not prove the universal lower-region aggregate and does not present the finite sample as a refutation or proof.

## Independent replay and arithmetic

I replayed the copied search and checked evaluator entirely under this seat's scratch root. The adaptation changes only path resolution and local output naming, then extends the copied output to retain every original leaf's selector value and every selected term for each row. The copied evaluator is byte-for-byte the pinned `inputs/ordinary_tree_checked.py`; the adapted search preserves the route's generator, seed, graph construction, and arithmetic. `replay_audit.py` checks all 582 full rows against the route's sealed `tested_rows`, confirms the exact eligible rank interval for each recipe, checks every selector, verifies that the selected leaf IDs are exactly those with strict negative selector, and recomputes each full sum from the listed terms.

The 30 connected acyclic constructions consist of 14 seeded recipes at each target order plus the two specified anchors (15 recipes per order). The independent audit recovers 137 eligible ranks at order 91 and 445 at order 243. Their recipe form gives a root with hub branches and pendant leaves, plus root leaves and root–support–leaf arms; all hub leaf counts are in [1,6]. The sample uses Python seed 99320260925 and does not deduplicate recipes. It samples this construction family and is not an exhaustive generation of trees or even of the stated family.

The replay confirms zero positive complete sums. For the order-91 anchor at `(a,x,p)=(68,32,34)`, it recovers 67 selected leaves, the positive marked term `+212336130412243110` at leaf 90, and complete sum `-498754180547001418536`. For the order-243 anchor at `(182,87,90)`, it recovers 181 selected leaves, the positive marked term `+2935177632783649903488454322226807645411570590073000` at leaf 242, and complete sum `-1058142362147652597702654588268394677176033202323316960380`. Both match the listed standing control records. The `K1,12` lower-region control independently replays at `(12,6,8)` with 12 selected leaves and `S=-1980`.

The first descent is computed directly by the route program with `delta(poly,j)<0` for `j=0,...,alpha`, including the terminal zero-extension difference; it does not call the standing helper's known incomplete descent routine. Eligibility is the strict selector `Delta_p(T-v)<0`, `p-1` is used for each summand, and every original leaf is visited individually, so leaves sharing a support remain separate tags. Supports and closed neighborhoods are computed on the original tree. The full row records preserve each selected leaf's support, selector, and term.

## Scope and limitations

The claim is useful as a reproducible empirical check in the sampled root multi-hub family. In particular, the anchors show that a positive local term can coexist with a negative complete sum. That compensation observation supplies no transport principle for arbitrary ordinary trees. No structural deficit-budget or compensation inequality is proved, no eligible positive witness is given, and no conclusion follows for the universal lower-region assertion. The finite observation remains bounded computation only.
