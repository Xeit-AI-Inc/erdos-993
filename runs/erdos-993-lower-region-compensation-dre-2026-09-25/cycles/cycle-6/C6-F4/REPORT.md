# C6-F4 search: support-injective matching charge

## Result

I tested a concrete per-independent-set charging rule: for each independent set `B` of rank `p+1`, inject every active selected leaf tag in `B` into a distinct support vertex in `N(B)`, using the bipartite incidence graph with parts `B` and `N(B)`. Here “active” means `v in F(T,p) intersect B` and `N_T(s_v) intersect (B minus {v})` is nonempty, exactly the fixed-selector weight in the pinned global-coordinate formulation.

This rule fails on the ordinary tree `T_22` at `p=34`. Its order is `91`, independence number `a=68`, and first strict descent is `x=32`; hence `x+2=34<=p` and `3p=102<137=2a+1`. The exact selector has all `67` original leaves. The replay constructs an independent `B` of size `35` and finds `33` active selected leaf tags supported on only `11` distinct support vertices (three tags per support). Thus no matching in the `B`–`N(B)` incidence graph can give each active tag its own distinct support vertex. This is a realizable obstruction to this injective support-capacity mechanism under both primary guards.

The full selected aggregate on this same tree is `S=-498754180547001418536`, computed as the sum of all 67 original-tree-selected summands. In particular, the witness refutes only the stated matching rule; it is not a counterexample to the lower-region aggregate. A mechanism allowing multiple tags to share a support, or charging additional slack/correction elsewhere, is not addressed.

## Exact scope and replay

`REPLAY.py` constructs the exact labelled `T_22` graph by the pinned `ordinary_tree_checked.t_family(22)` recipe, computes tree independence polynomials by forest dynamic programming, checks the first descent including zero extension, forms the fixed favorable selector using each original leaf deletion, and emits every summand. It then constructs the rank-35 independent set and counts the active tags and support vertices directly. Run from this worker directory with:

```sh
/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 REPLAY.py > EVIDENCE.json
```

The helper is the common pinned `inputs/ordinary_tree_checked.py` (its SHA-256 matched the common packet). Its terminal descent scans through the last nonzero coefficient, as required. This is one exact witness only; it is not a census or a universal statement. The complete graph recipe, selector, all summands, guards, `B`, active tags, and support counts are in `EVIDENCE.json`.

## Limitations

- No claim is made that the primary aggregate is false; this example has a negative full sum.
- The failure is limited to the explicitly stated one-active-tag-per-distinct-support matching rule. It does not refute weighted or multi-tag support charging.
- No general matching/slack budget, flow, or rank comparison is proved.
- This is a single reproducible tree, not an exhaustive search.
