# C6-CU-F1 independent critique (orientation U)

## Disposition

**C6-F1.Tm-cutoff400-audit — retained_narrowed; proposed status `proposed_open`.** The exact finite computation, four endpoint rational inequalities, and the stated tiny-tree polynomial checks replay from copies in this worker directory. They support only those bounded computational statements. I found no mathematical defect in those checked portions. They do not establish the all-parameter T_m aggregate, much less the arbitrary-tree lower-region aggregate.

## Independent replay

Before reviewing the case, I verified all four case-file pins and all 237 common-source pins listed in the packets; none mismatched.

I copied F1's replay source and the pinned tree evaluator into this scratch directory, adapted the copy to import only the local evaluator copy, and ran it with `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3`. The copied replay recomputed all three auxiliary polynomials for each `3 <= m <= 399`; at every central rank `m <= j <= 2m+2`, it checked strict LC and mixed-minor inequalities. This is 242,964 checks of each margin. The resulting stream digests and minima agree with F1: LC minimum 1210 and mixed-minor minimum 1243, both at `(m,Z,j)=(3,Astar,8)`. The four exact fractions at `m=400` are positive and below one. The local evaluator agrees with the displayed family polynomial and endpoint/star-leaf deletion polynomials for `m=1,2,3`, with the reported orders, independence numbers, and leaf counts. The exact results are in `EVIDENCE.json`; replay instructions and copied sources are `REPLAY.py` and `ordinary_tree_checked.py`.

The count is consistent with `3 * sum_{m=3}^{399}(m+3) = 242,964`. The cutoff candidate's falling-factorial estimate has positive factors on the stated range; its consecutive-ratio calculation has the stated direction, and its endpoint lower bounds yield the displayed `E(m)` denominator. The monotonicity reduction of `(2m+3)E(m)` to its value at 400 is also directionally correct. These observations check the new cutoff arithmetic, not every analytic inequality inherited from the larger-cutoff candidates.

## Scope and proof gaps

The route claim is narrowed because its evidence does not reconstruct the complete all-m family argument. In particular, the finite replay does not establish the uniform analytic LC and mixed-minor estimates for `m >= 400`, nor does it prove the complete selector-to-aggregate transfer. The cutoff note says those constants and propagation are retained from earlier candidates; a bounded replay cannot certify those analytic steps. The direct first-descent note supplies the stated family crossing lower bound for `m >= 2`, with `m=1` handled finitely, but it explicitly leaves the later minor, selector, and aggregate steps open.

The cited Gurvits and Saumard–Wellner convolution results are not needed for the finite replay. Their order/closure bridge is summarized in the pinned common primary-source bridge, and its stated order-at-least-degree convention resolves the specific order-size concern. I did not independently retrieve the papers in this bounded critique, and I do not treat that summary as an independent citation audit. This limitation is not a mathematical counterexample.

No selector computation here establishes all favorable original leaves or their complete tagged sum for arbitrary `T_m`; no computation addresses arbitrary ordinary trees. The disposition concerns only the finite checks and arithmetic described above. It is not an award of the family theorem or of the primary target.
