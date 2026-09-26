# C6-F1 — T_m / cutoff-400 challenge

## Result

I found no mathematical defect in the portions of the cutoff-400 candidate checked here. The finite coefficient base and its cutoff rational inequalities replay exactly. The cited ULC convolution results cover the normalization orders used by the candidate; in particular, an order parameter may exceed the degree of a factor. These checks support a scoped (T_m)-family argument, not the arbitrary-tree primary claim. I do not recommend promoting the all-(m) family theorem from this route alone: I have not independently reconstructed every analytic mixed-minor constant and every selector-transfer step in the complete candidate.

## Exact finite work

`F1-EVIDENCE.py` recomputes (B^m), (B=1+4z+3z^2+z^3), from
\[
B(z)(B^m)'=mB'(z)B^m,
\]
then forms the four displayed family polynomials by coefficient formulas and checks every proposed central margin for (3\le m<400), (m\le j\le2m+2). The strict log-concavity and mixed-minor checks each cover 242,964 rows. The smallest values are respectively 1210 and 1243, both at ((m,Z,j)=(3,A^*,8)). The exact stream digests match the cutoff probe: LC `f9091121…376a47`, mixed `174a521a…c454a7`.

At (m=400), exact rational evaluation of the four stated cutoff quantities (C(2m+3)E(m)), for (C=24,47,431,14688/21), gives values strictly below 1; the largest is the (R) quantity, approximately 0.14122. This verifies the endpoint arithmetic. The candidate’s monotonicity argument for (E(m)) is consistent with its factors: after writing (E(m)=K(m)/m^{17}), the factors (1-17/m,2-14/m,1-39/m) increase for (m\ge400), while ((2m+3)/m^{17}) decreases. The finite replay is exact computation on the stated range, not an exhaustive claim beyond it.

The pinned `ordinary_tree_checked.py` evaluator independently checks the polynomial formulas against tree dynamic programming for (m=1,2,3), including the unique endpoint leaf and all (3m) star-arm leaves. The factorization behind the formulas is also transparent: a root-excluded star arm contributes (B); the root-selected case contributes (z(1+z)^{3m+1}); deleting the path endpoint gives ((1+z)B^m+z(1+z)^{3m}); deleting a star leaf gives ((1+2z)(1+3z+z^2)B^{m-1}+z(1+z)^{3m}). The marked-tag sum is (zR), where
\[
R=3m(2+5z+2z^2)B^{m-1}+(3m+1)(1+z)^{3m}.
\]
Thus the selected leaves are distinct tags even when their supports coincide. For the two small cases, (P_1=(1,7,15,13,6,1)) has (x=2), and (P_2=(1,11,45,91,104,75,34,9,1)) has (x=4); direct inspection with (\alpha=3m+2) shows there is no eligible (p). This matters for the (m=2) endpoint, which does not follow from the broad lower bound (x\ge m+1) alone.

## Literature bridge and remaining audit boundary

Gurvits, *A short proof, based on the mixed volume, of Liggett’s theorem on the convolution of ultra-logconcave sequences*, Theorem 1.1 and Definition (2), defines (ULC(d)) for (d\ge\) sequence degree and states that convolution adds the orders. The article therefore does not support an objection based only on an order exceeding a factor’s degree. Saumard–Wellner, *Log-concavity and strong log-concavity: a review*, Theorem 4.1(b), states convolution closure for ultra-log-concave distributions. For the candidate’s Poisson-normalized factors, the stated use is: normalize each positive finite coefficient sequence to a probability mass function, use its Poisson-relative log-concavity, then apply the closure theorem to the independent sum. The factor inequalities are finite coefficient checks in the candidate; those are distinct from the imported closure theorem.

Primary sources: [Gurvits, Electronic Journal of Combinatorics 16(1), N5 (2009)](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v16i1n5); [Saumard and Wellner, Statistics Surveys 8 (2014), DOI 10.1214/14-SS107](https://projecteuclid.org/journals/statistics-surveys/volume-8/issue-none/Log-concavity-and-strong-log-concavity-A-review/10.1214/14-SS107.pdf).

This route did not independently verify the entire large-(m) LC/mixed-minor derivation, every neighbor-ratio constant used there, or the propagation from central minors through every eligible selector rank to the full aggregate. Those are review limitations, not identified mathematical counterexamples. The direct first-descent note does give a concrete family-specific bridge (x\ge m+1) for (m\ge2) by multiplying the coefficientwise factor inequalities; it does not itself handle the (m=2) eligibility edge or prove the later selector/aggregate steps. The exact (m=1,2) checks above cover that family edge only.

No universal conclusion follows from the finite census. Nothing here resolves the arbitrary ordinary-tree lower-region aggregate, and no counterexample was found.
