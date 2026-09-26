# C5-CT-F2 critique of C5-F2

## Disposition

**Retained** as an exact, bounded computational result with the source claim's stated scope and proposed-open status. The route claim is C5-F2-HETEROGENEOUS-BOUNDED-AUDIT. Its 55-profile census claim is reproducible, and the added “no positive local summand” statement is also supported by the listed summand records: the maximum selected local term is -14. The route's bounded conclusion is not a proof or refutation of the universal lower-region aggregate or of a heterogeneous extension.

## Independent checks

The case source pins matched the packet. I executed a scratch copy of COMPUTE.py and its parsed output exactly matched the pinned RESULTS.json. I also recomputed the data with a separate rooted-forest two-state polynomial dynamic program. The DP regenerated the path-and-star graphs, calculated polynomials for induced forests by excluded/included root states and multiplication over children and components, and independently rebuilt alpha, the first negative difference through the terminal rank, the eligible rank list, every strict leaf selector, each original support, every H/R difference, and each full sum.

Across all nondecreasing multisets of 1–5 branch arities in {2,3,4}, the two implementations agree on 55 full coefficient vectors, 62 eligible ranks, and 928 selected summands. Every strict selector contains every original leaf in each eligible row. The largest selected summand is -14, and the largest full S is -275. The whole-tree coefficient vectors have no log-concavity failures in this census. The source's hub-factor coefficient formula also matches the deletion recurrence on all 55 profiles.

The graph construction is finite, simple, connected, and acyclic: the path 0-1-2 with each branch center joined to 0 and its stated pendant leaves. Repeated arities remain separate branches, so the multiset enumeration preserves multiplicity. The rank test is exactly x+2 <= p <= alpha and 3p < 2alpha+1. In computing x, the terminal difference Delta_alpha=-i_alpha is included; later zero-extended differences are zero and cannot be the first negative value. Each leaf is treated as its own tag even when supports coincide.

## Exact scope and gaps

This validates the advertised finite boundary only: 1–5 branches, arities 2, 3, or 4, with the stated path attachment. It supplies no evidence beyond that family and those eligible ranks. Since all eligible leaves are selected, it does not test changing or proper selectors. Whole-tree coefficient log-concavity on these examples does not imply log-concavity or the needed minors for distributed marked polynomials, nor does it prove the global D+C budget. No imported theorem or universal conclusion is used. The primary ordinary-tree lower-region aggregate remains open on this evidence.

The independent replay summary and profile-by-profile outcomes are in EVIDENCE.json.
