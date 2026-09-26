# C5-CU-F4 — independent critique (orientation U)

## Disposition

**C5-F4.BOUNDED-PROPER-SELECTOR-SEARCH — retained.** The route makes a precisely bounded computational claim, not a universal assertion. I copied the route replay and its pinned evaluator into this seat’s scratch space, redirected the copied replay to the copied evaluator, and executed it. The complete generated evidence JSON matches the route evidence exactly.

The replay confirms the stated recipes and counts: 1,540 KL triples with no eligible rank, 1,242 centered path spiders with 166 eligible tree-rank pairs, and 425 graft constructions with 142 eligible pairs. Thus the two latter families contribute exactly 308 eligible pairs and none has a proper selector. The KL conclusion is only that there are no eligible pairs in that finite box. The strict guard is correctly encoded by `p <= floor(2 alpha/3)`, equivalent for integer `p` to `3p < 2 alpha+1`. The evaluator scans through rank `alpha`, so its first descent correctly uses integer zero-extension at the terminal rank.

## Arithmetic and realizability check

The recorded control graph is a realizable 22-vertex ordinary tree: a center joined to three disjoint paths of length seven. The replayed independence polynomial has degree 12, hence `alpha=12`; its first negative difference is at `x=6`. Rank `p=8` meets both guards (`x+2=8` and `24<25`). The three original leaves are vertices 7, 14, and 21, and each has `Delta_8(T-v)=-2483`; there are no omitted original leaves. For each leaf the original support and closed-neighborhood deletions yield the reported difference `900-1815=-915`, so the full selected sum is `-2745`. The complete edge list and coefficient vectors are preserved in the replayed evidence.

## Scope, standing, and usefulness

The finite result is useful as a checked failed search for a proper selector in these particular non-log-concave-inspired and grafted families. It neither establishes that eligible trees always have all leaves favorable nor supplies a counterexample to the primary inequality: the displayed eligible control has negative full sum. No literature theorem is needed for this finite claim, and no external hypothesis bridge is being asserted.

No proof gap affects the bounded enumeration claim after replay. The principal limitation is scope: the recipes and cutoffs are finite, and the search does not enumerate ordinary trees generally. It therefore leaves the requested proper-selector witness unresolved and leaves the universal lower-region aggregate open.
