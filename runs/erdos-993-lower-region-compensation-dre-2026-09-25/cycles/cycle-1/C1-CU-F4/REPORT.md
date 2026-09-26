# C1-CU-F4 critique of C1-F4-1

## Disposition

**retained.** The sole source claim is an exact bounded census, not a universal theorem or a refutation. Its stated parameter box, eligible-row count, aggregate signs, and listed sample rows reproduce exactly. I found no material arithmetic or scope defect in this bounded claim.

## Replay and checks

I copied the source census script and the hash-pinned `inputs/ordinary_tree_checked.py` into this worker's `evidence/` directory and adapted only the import root so execution reads and writes inside this scratch directory. The replay output exactly equals the sealed `census.json`: 80 parameter triples, 151 eligible `(T,p)` rows, all 151 aggregate values negative, no zero or positive rows, and identical sample rows.

The loop covers every integer triple in `2<=m<=6`, `1<=d<=4`, `2<=L<=5` (5·4·4=80). For each tree it computes the first descent directly over `j=0,...,alpha`, including the terminal zero-extension difference; it tests `p` from `x+2` through `alpha` and retains precisely those satisfying `3p<2alpha+1`. This does not miss any eligible `p`: the strict inequality implies `p<alpha` for the family (indeed for `alpha>=1`), and the case constraints also require `p>=x+2`.

The selected set is tested leaf by leaf using `Delta_p(T-v)<0`. The helper forms `H=T-{v,s_v}` and `R=T-N_T[s_v]` from the original tree and computes the required difference at rank `p-1`. It stores and sums one row per favorable leaf, so leaves sharing a support remain separate summands. The sign and rank shift agree with the contract.

As a structural cross-check, I compared tree-DP independence polynomials for all 80 generated graphs against the displayed hub formula `I_T=Q^m+z A_L^(dm)`, with `Q=A_L^d+z A_(L-1)^d`; all matched. Every generated graph has one fewer edge than vertices. Replay and check artifacts are in this worker's `evidence/` directory.

The pinned standing controls further illustrate why termwise transport cannot be inferred: T22 has a marked term `+212336130412243110` and complete sum `-498754180547001418536`; T60 has a marked term `+2935177632783649903488454322226807645411570590073000` and complete sum `-1058142362147652597702654588268394677176033202323316960380`. In each control, the listed summands add to the full aggregate. These are controls, not rows in the audited family, and they do not establish this route's claim beyond its census.

## Exact scope and limitations

The retained claim is only that the stated 80 symmetric root-hub trees have 151 eligible lower-region rows and each has negative complete fixed-selector sum. It supplies neither a proof for the full family outside the box nor a theorem for arbitrary ordinary trees. It gives no positive counterexample. The exact coefficient arithmetic relies on the pinned forest dynamic-programming helper; the independent structural check verifies its whole-tree polynomial against the family formula, while the full leaf-deletion census uses that helper for each deleted forest. No universal claim follows from these finite computations.
