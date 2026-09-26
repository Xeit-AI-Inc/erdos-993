# C6-CT-U3 critique (orientation T)

## Reviewed claim

`C6-U3-ABSORB-BOUNDED-20` is retained at its stated finite scope. I independently replayed the worker program from a copy under this seat’s scratch root, changing only its output directory so the sealed source was not modified. It completed 361 parameter pairs and 1,444 polynomials, found no case without finite ULC by q=4, reproduced the minimum-q counts (273, 80, 7, 1), and passed its 121-row comparison against the pinned one-factor certificate. The generated coefficient census is included as evidence.

The finite-order test is correct for positive coefficients and integer order d at least the polynomial degree n. At each 1<=j<n, normalized log-concavity is equivalent to `(d-j) A_j >= R_j`, where `A_j=j*a_j^2-(j+1)*a_(j-1)*a_(j+1)` and `R_j=(j+1)*a_(j-1)*a_(j+1)>0`. Thus A_j<=0 rules out every finite order, and for A_j>0 the least permissible integer d at that index is `j+ceil(R_j/A_j)`. Taking the maximum with n gives the claimed least order. The replay checks all such inequalities at each reported order; the positive constant coefficient and nonnegative binomial convolutions give positive coefficients on the full interval.

## Scope and limits

The exact arithmetic and its summary are supported on 2<=r,s<=20 and q in {1,2,3,4}. The smallest successful q is 1 for 273 pairs, 2 for 80, 3 for 7, and 4 for 1; 97 individual (pair,q) polynomials fail the finite-order criterion, but every pair succeeds by q=4. The order can exceed the degree, as correctly allowed by the criterion.

This does not establish a uniform absorption theorem, arbitrary mixed-factor behavior, a convolution theorem application, or any graph, deletion, selector, or ordinary-tree aggregate implication. The claim itself makes none of those deductions. I inspected the assigned source map and handoff; they likewise reserve those wider bridges for separate arguments. No mathematical defect was found in the claim at its declared bounded scope.

## Reproducibility

The sealed source pins matched before review. The reviewer replay is `absorption_census_replay.py`; it writes `ABSORPTION-CENSUS.json` and reports the summary in `AUDIT-EVIDENCE.json`. The replay uses exact integer coefficients and contains assertions for the 121-row comparison and all claimed order checks.
