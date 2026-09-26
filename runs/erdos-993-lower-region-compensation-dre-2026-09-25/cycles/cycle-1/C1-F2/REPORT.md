# C1-F2 bounded asymmetric tree search

## Target and method

I searched for an ordinary finite tree and rank satisfying the exact primary target's eligibility conditions, then evaluated the full tagged favorable-leaf aggregate with the corrected evaluator in `inputs/ordinary_tree_checked.py`. Each eligible `p` was checked against the original tree's strict first descent `x`, with `x+2<=p` and `3p<2alpha+1`; for each original leaf the selector was the strict test `Delta_p(T-v)<0`. The evaluator's leaf loop preserves distinct leaf tags when supports coincide and computes deletions from the original supports and closed neighborhoods.

The reproducible search uses Python's `random.Random(99320260925)`, 1,200 cases, and orders selected uniformly from 9 through 36. Modes cycle in order. Mode 0 grows a rooted recursive tree by attaching each new vertex to a prior vertex with weight `1+degree`; mode 1 uses root-parent weight `1+3*degree` and other-parent weight `2*degree+1`; mode 2 makes a 1-3 vertex path backbone and attaches randomly sized rooted gadgets of at most seven vertices at random backbone vertices, growing each gadget with one of three degree-weight rules. The script evaluates every integer p in the eligible interval. All arithmetic is integer polynomial dynamic programming. Run from this directory with `python3 evidence/search.py`; it rewrites `evidence/search_results.json`.

## Result

The sample contains 1,200 trees. Of these, 650 had at least one eligible rank, yielding 878 eligible tree-rank rows. No row had a positive complete aggregate; in fact, there were no positive individual tagged summands in any evaluated row. This is a bounded observation for the stated seeded generator and order range, not a proof for all trees.

The closest aggregate to zero was `-253`, at sample index 886, mode 1, order 11, `alpha=9`, `x=4`, `p=6`; both guards hold (`4+2=6` and `18<19`). Its Prüfer-free edge list is encoded in the evidence JSON. Its independence polynomial is `[1,11,45,100,140,132,85,36,9,1]`. All nine original leaves are favorable, with `Delta_6(T-v)=-21` for leaves 2-5 (support 1) and `-20` for leaves 6-10 (support 0). Their tagged aggregate summands are respectively four copies of `-27` and five copies of `-29`, giving full `S=-253`. This near-boundary row is still far from a sign reversal; the sampled rows therefore do not probe the anticipated compensation mechanism through a positive local term either.

## Input integrity and limits

Every SHA-256 listed in `packets/C1-COMMON.json` for the common read-first and authorized shared inputs was checked against its file and matched. The F2 packet assigns search orientation F2, the stated scratch root, and no additional allowed source files; the F2 lens is the bounded exact asymmetric rooted-gadget search. No sibling worker evidence was used. The generation is randomized and restricted to rooted-recursive and small-backbone gadget constructions at orders 9-36. It does not cover all finite trees, does not furnish a structural exclusion theorem, and does not resolve the registered aggregate claim. The mathematical status remains open.
