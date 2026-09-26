# C4-CT-F3 critique report

## Disposition: retained

Reviewed the sole required source claim, `C4-F3-TM5-EXACT-REPLAY`. Its stated exact instance is supported. This is a bounded validation of one ordinary tree and does not prove or refute the registered all-tree lower-region aggregate or an all-parameter `T_m` assertion.

## Independent checks

I copied the case-listed replay into this seat's scratch root and executed that copy. Separately, `independent_audit.py` reconstructed the graph from the stated construction and computed independence polynomials through rooted include/exclude states on each forest component. It checked connectedness and `|E|=|V|-1`, reconstructed every original degree-one vertex from the full graph, calculated the first negative difference including the terminal zero extension, applied the strict deletion selector to all original leaves, and directly summed each selected support/neighborhood term.

The independent result is: order 23, alpha 17, x 8, p 10, and 16 selected leaves. The selected leaves are vertex 2 (the path endpoint) and all 15 private claw leaves. Their selector differences are -8147 and -6751 respectively. The full sum is -1430 + 15(-5519) = -84215. Both guards hold: x+2=p and 3p=30<35=2alpha+1. These agree with the executed source replay, including its count and incidence cross-check.

## Source inconsistency and limits

The source REPORT.md contains one inconsistent sentence listing `a=16`; its evidence JSON, return claim, graph construction, and both executions give alpha 17. The graph polynomial has a nonzero coefficient at rank 17 and none above. This isolated prose error does not alter the exact claim, so I retain the claim as stated and flag the correction here.

This check covers one graph at one rank, with no random sampling or family census. A negative full sum is consistent with the proposed aggregate and supplies no universal proof. No feasibility or deficient-cut certificate for the proposed mixed Hall network was independently established; aggregate orbit counts do not settle that network question.
