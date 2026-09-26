# C3-CT-F1 critique of C3-F1

## Disposition

**Claim `C3-F1.literal-two-for-one-flow-prefix`: retained** at exactly the deterministic first-five eligible-row prefix for each of orders 16, 17, and 18 in the supplied rank-7 census results. This is a bounded flow-feasibility claim, not a proof of a universal transport lemma or of the primary aggregate.

## Independent replay

I copied the sealed case files and the two hash-pinned census inputs into this seat's scratch area. I redirected the copied `run_flow.py` to those copies and to this scratch root, then ran it in the foreground. The replayed complete `EVIDENCE.json` equals the route's stored evidence as parsed JSON. All 15 rows report an integral flow equal to upper supply, and each residual-cut deficit is zero.

For each row the replay decodes the stated centroid code into an ordinary tree, computes its independence polynomial by vertex-deletion recurrence, obtains `alpha` and the first strict descent `x`, checks `p=7`, `x+2<=p`, and `3p<2alpha+1`, then recomputes every original leaf's `Delta_p(T-v)` selector. It uses the original support and original closed neighborhood to calculate every selected term and the full sum. In every row the recomputed sum is `supply - capacity`.

The flow graph is the stated literal-set graph. Its left nodes are positive-weight independent 8-sets, its right nodes are all independent 7-sets with capacity `w_F`, and its legal arcs are one-vertex deletions or the specified absent-vertex move that removes exactly two neighbors and adds that absent vertex. The replay checks the moved set has size 7 and is independent. Dinic's integral flow is checked against legal arcs, node capacities, total inflow and outflow, and the residual cut. Thus the recorded saturation follows for these specific networks.

## Scope checks and limitations

The row lists used are the first five eligible rows in stored order from each of the supplied order-16, order-17, and corrected-scope order-17/18 results, for 15 rows total. The underlying source files are hash-pinned in the case evidence and common packet; the route's 115 common-source pins also verified. This audit did not rerun census generation. The other 4,976 eligible rank-7 rows, all ranks beyond this sample, and all larger trees remain outside the replay.

The flow identity `S = supply - capacity` makes saturation sufficient to show `S<=0` on a tested row. It does not establish that these networks always admit such a flow. Nor would failure of this particular transport suffice to refute the scalar aggregate. No imported theorem or universal proof bridge is offered. The primary lower-region aggregate therefore remains unresolved by this claim. No formal award or status change is proposed.
