# C2-F1 search report: the (p=7, |T|=16) first shell

## Result

I exhaustively enumerated the 19,320 unlabeled ordinary trees on 16 vertices using the pinned centroid generator. At (p=7), 1,696 trees satisfied both primary guards (x(T)+2\le p) and (3p<2\alpha(T)+1). Every eligible tree had \(\alpha(T)=11\) and \(x(T)=5\). All 1,696 complete selected-leaf sums were negative: the maximum was \(-906\), the minimum \(-1759\); there were no zero or positive sums. This is bounded computation at one order and rank. It does not prove or refute the universal first-order-shell assertion.

The unabridged replay data are in [RESULT.json](RESULT.json): each eligible row has its centroid encoding, full independence polynomial, terminal difference, first strict descent, every original leaf's \(\Delta_7(T-v)\), the resulting fixed favorable set, and each distinct favorable-leaf summand with its \(\Delta_6\) values on the two original deletions. Same-support leaves remain separate rows. [COMPUTE.py](COMPUTE.py) is the foreground replay program.

## Exact scope and guards

The finite census concerns exactly \(|T|=16\) and \(p=7\), hence the registered shell \(|T|=2p+2\) at this rank. For each candidate tree, the full tree-DP independence polynomial is computed with integer coefficients. The first strict descent is scanned at every rank from zero through \(\alpha(T)\); at \(j=\alpha(T)\), zero extension gives \(\Delta_\alpha=-i_\alpha<0\), so the terminal descent is included. Eligibility is then tested exactly as \(x+2\le7\) and \(21<2\alpha+1\). The observed eligible rows all have \(x=5,\alpha=11\), and therefore meet both guards.

For every eligible tree, selector values are computed for every original leaf from \(I(T-v)\), with selection iff \(\Delta_7(T-v)<0\). The sum is evaluated over precisely that fixed selected set. For each selected leaf \(v\) and its original support \(s_v\), the two terms use the original vertex sets \(T-\{v,s_v\}\) and \(T-N_T[s_v]\), at rank difference 6. The JSON stores these values and their difference for each tag, including repeated supports.

## Generation boundary and replay

`COMPUTE.py` imports only the authorized [ordinary_tree_checked.py](../../../../inputs/ordinary_tree_checked.py) evaluator and the pinned [forest24.py](../../../../instruments/p6-order14-15/forest24.py) centroid generator. It runs `rooted(8)` and `visit_trees(16, ..., codes_all=True)`. The rooted branch-size bound is 8 in the bicentroid case; the unicentroid branch bound is 7. The generator's independent free-tree class count is 19,320. Every emitted centroid code is required to be unique, the order is checked to be 16, and the first nine packed coefficients are compared against a separately computed tree-DP polynomial. A missing code, repeated code, coefficient mismatch, or failed subset replay raises an assertion.

For each of the 1,696 eligible rows, subset replay scans all \(2^{16}\) vertex masks, independently checks independence, and accumulates rank counts for the whole tree and every distinct original deletion universe needed by the leaves. It verifies the full-tree polynomial, all selector decisions, all selected deletion differences, and the complete sum. Reproduce from this directory with `python3 COMPUTE.py`; the script rewrites `RESULT.json` after all assertions pass. Exact source pins for the two imported files are recorded in the common packet and were verified before this work.

## Limitations

- This covers only order 16 at rank 7. It says nothing by itself about other shell ranks, other orders, or the universal target.
- The no-positive-result census is bounded computation, not a proof-grade inequality.
- No literature theorem or additional mathematical lemma is claimed.
- Status remains proposed and controller-owned; this worker makes no award.
