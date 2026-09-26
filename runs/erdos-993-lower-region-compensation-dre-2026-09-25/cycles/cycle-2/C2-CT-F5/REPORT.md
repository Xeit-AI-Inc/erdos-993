# C2-CT-F5 critique of C2-F5-P6-SHELL-LP

## Disposition

**retained**, as the stated bounded order-14, p=6 computation. The evidence supports the exact finite claim that every eligible ordinary tree of order 14 has S(T,6) <= -222 and that equality is attained. It does not establish the universal first-order shell or the primary lower-region aggregate.

## Independent checks

I verified every SHA-256 listed in both assigned packets before review. The source claim is the single claim C2-F5-P6-SHELL-LP. Its own scope is appropriately bounded: n=14=2p+2 at p=6, with the lower-region guards x(T)+2<=p and 3p<2alpha(T)+1. It does not claim a result at other orders or ranks.

I replayed the listed instrument from temporary copies under this worker's scratch root. The copies of ordinary_tree_checked.py, forest24.py, and run.py were used; only the copied runner's order loop was restricted from (14,15) to (14,), and the temporary copies and outputs were removed after extraction. The replay produced 3,159 distinct order-14 free-tree codes, 240 eligible trees, and 240 subset replays. All 240 records matched the sealed C2-F5 table on canonical code, order, p, alpha, x, favorable-leaf count and identities, and S. The replay evidence, including every replayed row and its full summands, is in EVIDENCE.json.

The generation scheme's boundary is the tree center. For n=14, the unique-center construction uses a multiset of rooted branches of sizes at most 6 and total size 13; the two-center construction joins an unordered pair of rooted trees of size 7. Rooted codes recursively sort child codes, so these constructions cover the one-center and two-center cases canonically. The runner rejects duplicate generated codes and checks the 3,159 count. Each generated tree's packed polynomial is checked against the ordinary tree-DP coefficients at ranks 0 through 8. The subset replay separately counts independent sets in T and the required T-v, H_v=T-{v,s_v}, and R_v=T-N[s_v] universes for every eligible tree.

The guards and rank conventions are handled correctly in the evaluator: out-of-range coefficients are zero, Delta_j=i_(j+1)-i_j, and first_strict_descent scans through the terminal alpha-to-zero difference. Each leaf is selected only when the strict Delta_6(T-v)<0 test succeeds. The sum loops over original leaves individually, computes support and closed neighborhood in the original tree, and counts every same-support leaf tag separately. Its summand at p=6 is Delta_5(H_v)-Delta_5(R_v), as required. The replay also verifies that its independently enumerated selected leaves and full sum match the tree-DP row for every eligible tree.

The aggregate range is [-404,-222], with zero nonnegative rows. The attaining row has tree code U:(((((()))()))((((()))()))()), alpha=9, x=4, and favorable leaves [5,6,11,12,13]. Thus x+2=6 and 3p=18<19=2alpha+1. Its five original-tag summands are -30,-53,-30,-53,-56, totaling -222.

The LP statement is valid but adds no generality beyond this complete finite column set: for lambda_T>=0 with sum lambda_T=1, the objective is a convex average of the listed S values. The dual y=-222 satisfies y>=S_T for every listed column, and a column attaining -222 proves the LP optimum. This does not furnish a dual constraint system for all shell trees or variable p.

## Limitations

This is bounded evidence for exactly order 14 and p=6. It proves neither the shell statement for other p (or other shell orders) nor the primary assertion for all eligible ordinary trees. No positive realizable instance was found in this finite slice. The replay shares the pinned centroid-generation method; its finite completeness rests on the recursive rooted-code and center decomposition described above and the checked class count. No mathematical verdict or controller status is proposed beyond this bounded computation.
