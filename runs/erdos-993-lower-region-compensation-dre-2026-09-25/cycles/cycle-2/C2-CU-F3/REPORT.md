# C2-CU-F3 critique of C2-F3

## Disposition

**E993-LOWER-REGION-FIRST-ORDER-SHELL — retained (bounded scope only).** The source claim is the finite computational statement in C2-F3's return: for the explicitly generated asymmetric rooted branch-forest family and p=3,...,7, every eligible generated tree has nonpositive complete favorable-leaf sum, and no eligible row has a positive selected summand. It is not a proof of the registered first-shell claim over all ordinary trees. The source return itself marks the evidence `proposed_open`; that status is appropriate.

## Audit and replay

I replayed the copied generator and copied ordinary-tree evaluator in this worker's scratch. The only script adaptation changes the evaluator import path to the local copied file; the family generation, filter, guards, selector, summands, and aggregate calculation remain as supplied. The replay result equals the pinned result JSON exactly. `evidence/replay_notes.md` records the commands, exact row counts, and maxima; the copied executable files and result are in `evidence/`.

The generator's rooted type recursion canonically represents rooted tree components by sorted child-type multisets; the outer nondecreasing multiset recursion enumerates component multisets of total order 2p. The actual filter is `len(f)>=2` and `len(set(f))>=2`, matching the report's stated condition of at least two components and at least two distinct rooted types. A code comment says “at least two non-leaf component types,” which is stricter than the executable predicate; it is stale prose, not the applied filter, and the report/claim correctly state the executable filter. The distinguished support-leaf adds two vertices, so all generated parent trees have n=2p+2 and are connected acyclic graphs.

The copied evaluator computes independence polynomials by forest tree-DP. It trims trailing zeros but uses zero extension in coefficient lookup; its first-descent loop includes the last stored rank, where the difference is the negative top coefficient, so it checks the terminal descent. For each row it applies both required guards `x+2<=p` and `3p<2a+1`, fixes F using the strict test `Delta_p(T-v)<0` on all original leaves, and sums every such leaf separately using its original support and original closed neighborhood. Thus repeated supports remain repeated tags. No family row is selected by the distinguished leaf alone.

The exact replay totals are: p=3,4,5 have 10, 66, 430 filtered forests respectively and no eligible rows; p=6 has 2,923 generated, 418 eligible and S range [-387,-212]; p=7 has 20,486 generated, 1,221 eligible and S range [-1,495,-844]. There are zero positive local terms and zero positive complete sums in all 1,639 eligible rows. The maximum p=6 row has a=9, x=4, six selected leaves and S=-212; the maximum p=7 row has a=11, x=5, eight selected leaves and S=-844. Both maximum rows pass both primary guards.

## Limits

This computation does not establish the shell assertion for all ordinary trees. It omits symmetric rooted products, forests with fewer than two components or with one rooted component type, p outside 3,...,7, and every other tree representation not in its explicitly filtered family. Rooted representatives may duplicate unrooted trees. It finds no positive local term, so it does not test compensation from positive summands. It gives neither a structural argument for omitted cases nor a refutation. The full registered primary and first-shell universal claim remain open.
