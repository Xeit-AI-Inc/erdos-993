# C4-F5 search: exact coefficient audit of the (T_m) family

## Scope and result

I investigated the allocated ordinary family (T_m): a path (0-1-2), with (m) disjoint (K_{1,3}) branches attached to 0. This is a search result for `E993-ORDINARY-TM-LOWER-REGION-AGGREGATE`. I found no proof or refutation for all (m). The all-parameter assertion remains OPEN. The useful output is an exact orbit decomposition, an exact derivative identity, and bounded coefficient checks that keep the two original leaf orbits under their actual selector.

## Exact orbit polynomials and selector

Put (L=1+z) and (B=1+4z+3z^2+z^3=L^3+z). The independence polynomial and independence number are

\[
P_m=(1+2z)B^m+zL^{3m+1},\qquad \alpha(T_m)=3m+2.
\]

There are two original leaf orbits. Let (P_e) be the polynomial after deleting the path endpoint 2 and (P_c) the polynomial after deleting one claw tip. Direct component factorization gives

\[
P_e=LB^m+zL^{3m},\qquad
P_c=(1+2z)(1+3z+z^2)B^{m-1}+zL^{3m}.
\]

For one endpoint tag and one claw-tip tag, respectively, the difference polynomials (I(T_m-\{v,s_v\};z)-I(T_m-N[s_v];z)) are

\[
q_e=zL^{3m},\qquad q_c=z(2+z)(1+2z)B^{m-1}+zL^{3m}.
\]

Thus the selected polynomial at a rank (p) is (Q_F=q_e\,1_{\Delta_p(P_e)<0}+3m q_c\,1_{\Delta_p(P_c)<0}), and the full aggregate is (S(T_m,p)=[z^p]Q_F-[z^{p-1}]Q_F). This makes the selector orbit-specific; using the all-leaf polynomial before checking both strict inequalities would be invalid.

When both orbits are selected, (Q_{all}=q_e+3m q_c) and direct differentiation yields

\[
Q_{all}=P'_m-2B^m-4m(1+2z)B^{m-1}-L^{3m+1}.
\]

Equivalently, its coefficient at rank (j) is ((j+1)[z^{j+1}]P_m) minus the rank-(j) coefficient of the three correction terms. The target still requires the adjacent difference of these coefficients to be nonpositive at every eligible (p). The first strict descent of (P_m) alone does not bound the correction difference, nor does a total-mass comparison. In particular, (P_m) is a sum of two component polynomials, so a mode or log-concavity claim for either component does not establish the needed comparison for the sum.

## Exact bounded checks

`COMPUTE.py` uses arbitrary-precision integer polynomial multiplication and checks ranks using zero extension. For each (m=1,\dots,100), it computes the first strict descent by scanning through rank \(\alpha\), then checks every (p\ge x+2) with (3p<2\alpha+1), both deletion-polynomial selector tests, and the complete selected sum. It records every eligible row and its exact deltas and sum in `EVIDENCE.json`. The finite boundary is 100 branches; there are 2,743 eligible rows, with no positive full sum. Both endpoint and claw-tip orbits are selected in all 2,743 rows. For example, at (m=100), (x=145) and the eligible ranks are (147\le p\le201); the sums at both ends are negative (exact values are in the evidence).

The same coefficient method checks equal-arm variants with (r=1,\dots,6) leaves at each branch and (m=1,\dots,15): 347 eligible rows and no positive sum. It also checks lopsided stars with one branch having (s\in\{1,2,4,5\}) leaves and the other (m-1) branches having 3 leaves, for (2\le m\le20): 400 eligible rows and no positive sum. In these lopsided rows the endpoint, exceptional-branch tips, and regular-branch tips are all selected; no proper-selector row occurred in these parameter ranges.

`GRAPH-CROSSCHECK.py` constructs the trees by their original edges and uses the hash-pinned `inputs/ordinary_tree_checked.py` evaluator (SHA-256 `a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d`) to recompute leaves, supports, deletion polynomials, selectors, summands, and aggregates. Its 100 eligible (T_m) rows for (m\le20) agree exactly with the coefficient formulas; it also independently checks 52 eligible lopsided rows (one exceptional branch for each (s=1,2,4,5), (2\le m\le8)). These are finite checks, not a census of all trees or all parameters.

## Open bridge

The unresolved work is an all-(m) coefficient argument uniform over the full eligible rank interval, including the lower ranks just beyond (x+1), ranks near the strict upper boundary (3p<6m+5), and the orbit selector. The exact derivative identity reduces the both-orbits case to a comparison of adjacent coefficients of (P_m) and the correction polynomial, but I have no uniform sign estimate for that difference. Exponential smallness of the arm's total coefficient mass relative to the claw component (the ratio at (z=1) is \((2/3)(8/9)^m\)) is insufficient by itself to control adjacent coefficients near a mode. The lopsided checks suggest robustness only over the stated finite range; they do not establish an unequal-branch theorem.

No outside literature result was imported. No universal conclusion follows from either bounded computation. No formal or authoritative award is claimed.
