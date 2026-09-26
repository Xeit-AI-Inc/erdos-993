# C6-CU-F6 critique

## Disposition

**C6-F6.SPIDER-SELECTOR-BOUNDED: retained.** The route's claim is explicitly limited to the equal-length-three rooted spiders with `2 <= m <= 40`, and its exact census is correct on that scope. This is a bounded computational result, not a theorem for all `m` or for arbitrary ordinary trees.

## Independent checks

I copied the assigned `replay.py` into this scratch directory and ran it with the specified Python 3.11 executable. It reported 39 profiles and 222 eligible `(m,p)` rows; every computed first descent is `x=m`, every eligible selector contains all `m` original endpoints, and every complete sum is negative. The regenerated `evidence.json` is byte-identical to the case evidence.

I also checked every row against root-conditioned formulas independently of the forest-DP replay. With `Q=1+3z+z^2` and `V=1+2z`, the original tree and endpoint deletion polynomials are

`P=Q^m+zV^m`, and `I(T-c_i)=VQ^(m-1)+z(1+z)V^(m-1)`.

For each original endpoint `c_i` with support `b_i`, direct conditioning gives
`I(T-{b_i,c_i})-I(T-N[b_i])=zQ^(m-1)`. Therefore every endpoint has the same selector value, and each selected term is `Delta_(p-2)(Q^(m-1))`. `formula_audit.py` checks these formulas against the full saved vectors, selectors, support-tagged summands, guards, and sums in all 222 eligible rows; its summary is `formula-audit.json`.

The rank audit uses `x` from the first negative zero-extended difference, checks `x+2<=p` and `3p<2alpha+1`, and retains each endpoint as a distinct summand. For `m=2..5` there are no eligible ranks; the first eligible row is `(m,p)=(6,8)`, with six terms of `-355` and total `-2130`.

## Scope limits

This retains only the finite census claim. It does not prove the proposed first-descent bound or selector transfer for unbounded `m`, and does not close the non-star lead's disjoint-image gap. No route evidence refutes or proves the registered arbitrary-tree aggregate. No mathematical defect was found in the bounded claim; the remaining limitations are its finite boundary and the unproved extensions above.

## Pin and replay record

All four case-file hashes and all 237 common allowed-source hashes matched their packet pins. The relevant source-map entries identify the non-star lead and the corrected ordinary-tree evaluator; the lead itself labels its descent bridge and injection disjointness as unresolved. The replay scripts and all generated evidence are stored in this worker directory.
