# C2-F3 search report

## Result

I searched an explicitly bounded family of first-order-shell trees built from asymmetric rooted branch products. No eligible tree in the searched family had a positive selected summand or a positive complete favorable-leaf sum. The largest complete sum was −212 at (p=6,n=14), and −844 at (p=7,n=16). This is bounded computational evidence only; it does not establish the shell claim.

## Family and generation boundary

For each (p=3,4,5,6,7), form a support vertex (s=0) with one distinguished original leaf (v=1). Attach to (s) a multiset of rooted unlabeled trees whose total order is (2p). A rooted tree type is encoded recursively by the sorted multiset of its rooted child types. I retained precisely those branch forests with at least two components and at least two distinct rooted component types. Thus the generated ordinary tree has (2+2p=2p+2) vertices and its (H_v=T-\{v,s\}) factors as the product of the rooted branch-component independence polynomials; (R_v=T-N_T[s]) factors as the product after deleting each branch root. The distinguished leaf provides a concrete shell tag, and all other original leaves are also checked.

This enumerates every rooted branch-forest multiset meeting that asymmetry filter at each listed order, without identifying trees that become isomorphic after forgetting the distinguished support-leaf. The numbers generated were 10, 66, 430, 2,923 and 20,486, respectively. These are counts for this rooted, asymmetric family, not counts of all ordinary trees of those orders.

## Exact checks

For each generated tree the deterministic forest tree-DP in the listed `ordinary_tree_checked.py` source computed integer independence-polynomial coefficients. The script checks (x(T)) at every rank through the terminal zero-extended difference, then both eligibility guards (x+2\le p) and (3p<2\alpha+1). It forms (F(T,p)) by the strict test \(\Delta_p(T-v)<0\) on every original leaf. For every selected leaf it calculates the exact original-support summand \(\Delta_{p-1}(T-\{v,s_v\})-\Delta_{p-1}(T-N_T[s_v])\), retaining each leaf as a separate tag, including repeated supports, and sums the complete selected set.

The eligible row counts were 418 at (p=6) and 1,221 at (p=7); there were no eligible rows at (p=3,4,5). Among all 1,639 eligible generated trees, there were zero positive selected summands and zero positive complete sums. The full sorted list of all eligible (S)-values and a maximum row record with its edge list, selector, and summands are in `search_f3_results.json`. The deterministic generator/evaluator wrapper is `search_f3.py`; replay it from this worker directory with `python3 search_f3.py` while the packet-pinned common source tree is available at its specified root.

## Scope and gap

The search does not cover symmetric rooted branch products, branch forests with fewer than two components, (p\ge8), or any orders outside (n=2p+2). Rooted representatives may yield isomorphic unrooted trees multiple times, so the counts are not free-tree counts. No positive local term was found in this family, so it also gives no example of the compensation behavior sought by the route. It supplies no structural argument for excluded trees and no universal sign proof or counterexample. The registered first-shell assertion remains open on this evidence.
