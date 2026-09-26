# C6-F4 critique: support-injection witness

## Disposition

**C6-F4.MATCHING-SUPPORT-INJECTION — retained.** The route's single-instance claim is correctly scoped: on the specified eligible ordinary tree and rank-35 independent set, this particular rule cannot inject every active selected leaf tag into a distinct own-support vertex in `N(B)`. It does not refute the lower-region aggregate or every weighted, multi-tag, or transport argument.

## Independent checks

I ran a scratch copy of the route replay against a scratch copy of the pinned `inputs/ordinary_tree_checked.py`; `replay.json` agrees exactly with the sealed `EVIDENCE.json`. The graph recipe has 91 vertices, independence number 68, first strict descent 32, and `p=34`. Thus `x+2=p` and `3p=102<137=2a+1`. The fixed selector is computed from the strict condition `Delta_p(T-v)<0` for each original leaf; it contains all 67 original leaves. The replay computes all 67 original-tree summands, whose exact sum is `-498754180547001418536`.

The recorded set `B` has rank 35 and is independent. Its active selected tags are the 33 members of `B` that lie in the selector and whose original support has another neighbor in `B`. Each such tag has its own support as its only neighbor in the tag-to-own-support incidence relation; that support lies in `N(B)` because the tagged leaf is in `B`. These 33 tags use only 11 distinct own-support vertices (three tags per support), so Hall's condition fails for the stated distinct-support injection. This is an exact pigeonhole obstruction, not a heuristic about capacities.

The source-map's two-for-one flow materials concern a different relation. Their protocol explicitly retains a separate symmetry-lifting obligation; no flow result is needed to establish this local obstruction. The witness is useful for rejecting this proposed unit-capacity-per-support rule under both primary guards, while offering no global charge or slack estimate.

## Limits

No primary proof or counterexample is established: the full selected sum here is negative. The result addresses only the exact rule stated in the route claim and its explicit witness. Weighted support capacities, charging multiple tags to a support, and compensation from other ranks or sets remain untested. This is one tree and one independent set, not an exhaustive search. No mathematical defect was found in the route claim; no inference is made from unreviewed computations or unrelated transport schemes.
