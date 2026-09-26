# C5-CF-T4 critique

## Disposition

**C5-T4-SELECTOR-PENDANT-PATH-RECURRENCE — retained.** The exact polynomial identity follows by partitioning independent sets according to whether the attachment root is absent or present. The root-absent branch contributes `I(G-r)P_m`; the root-present branch contributes `z I(G-N[r])P_(m-1)`. These cases partition all independent sets, so their sum is exact.

For each old original leaf `v != r`, apply this identity to `G=T-v`, rooted at `r`; taking coefficients `p+1` and `p` gives exactly the strict selector test after attachment. The computation is per vertex tag, so equal supports do not collapse tags. If `r` was an old leaf, its degree changes and it is no longer an original leaf. The new endpoint is tested by deleting it, which leaves the shorter attachment `T_(m-1)` (with `T_0=T`). Polynomial coefficients outside the degree, including negative exponents, are zero, so the coefficient rule is valid at every integer rank.

The K1,7 arithmetic checks: before attachment the tested deletion is K1,6 and `Delta_3=15-20=-5`; with `A=(1+z)^6`, the one-vertex attachment changes this delta by `Delta_2(A)=20-15=5`, yielding zero. This example correctly demonstrates failure of strict selector preservation. It is ineligible for the primary statement because `x(K1,7)=4` and `p=3` does not satisfy `x+2<=p`.

## Scope and limitations

The claim is retained exactly as a selector propagation identity for finite rooted forests / ordinary-tree leaf tags under the stated pendant-path operation. It proves no preservation of `x`, `alpha`, or the lower-region guard, and gives no inequality or comparison for the full selected sum. Thus it neither proves nor refutes the primary aggregate. No external theorem or computation was needed. The source packets' listed hashes matched at intake. Independent arithmetic and decomposition checks are itemized in `EVIDENCE.json`.
