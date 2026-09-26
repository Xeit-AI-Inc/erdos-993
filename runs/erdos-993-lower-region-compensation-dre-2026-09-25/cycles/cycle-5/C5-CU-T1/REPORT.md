# C5-CU-T1 critique of C5-T1

## Disposition

**Claim:** `C5-T1.TM-LOWER-REGION-AGGREGATE`  
**Disposition:** `retained_narrowed`  
**Proposed status:** `proposed_open`

Retain the result only for the exact family `T_m` in the route, with the admitted forest descent bound and the stated finite-base computation as dependencies. It supplies no conclusion for arbitrary ordinary trees or for the registered all-tree target. I did not independently reproduce the finite-base run, so I do not propose a verified status.

## Audit

The tree order and independence number are `4m+3` and `3m+2`. The two original leaf types are the path endpoint `a` and the `3m` distinct private tips. Splitting on `r` gives

`P=(1+2z)B^m+z(1+z)^(3m+1)`, where `B=1+4z+3z^2+z^3`.

Deleting `a` gives the route's `A0`; deleting a private tip gives its `A*`. The support calculations use deletion of both the tip and its center for `H_v`, and deletion of the closed neighborhood of that center for `R_v`. They yield

`q_a=z(1+z)^(3m)`,

`q_c=z(2+z)(1+2z)B^(m-1)+z(1+z)^(3m)`.

Counting all private tips as distinct tags gives `Q=q_a+3m q_c=zR` with the displayed `R` in the route. Therefore, if all original leaves are selected, the complete sum is `S=R_(p-1)-R_(p-2)=Delta_(p-2)(R)`. This is the complete sum; no single-leaf or support-fibre sign is substituted for it.

The strict alpha guard gives `p<=2m+1`. Eligibility then gives `x<=2m-1`. Using the admitted forest bound `4m+3<=4x` gives `x>=m+1`, placing `x` in the claimed central interval. For `m=1,2`, the route gives first descents 2 and 4, so there is no eligible `p`.

For `m>=1000`, the finite-order ULC argument correctly treats `B` as ULC of order 4 (normalized coefficients `1,1,1/2,1/4`). The stated convolution theorem is used on positive interval-supported factors, and the short-factor coefficient inequalities imply the displayed product-ratio bounds. The central ULC margin is at least `a_j^2/(j+1)`; the perturbation estimate must dominate its negative cross terms. The Cauchy-Binet mixed-minor orientation is consistent: a positive `A_j P_(j+1)-A_(j+1)P_j` puts the ratio for the deleted-tree polynomial below the ratio for `P`. The listed short coefficient vectors have nonnegative ordered minors, with the stated `(0,1)` minors `1,1,21m`. If the supplied bounds and cutoff comparisons hold, the strict selector and coefficient-ratio propagation follow as written.

The graph and rank bridge is coherent: `Delta_x(P)<0` and the strict mixed minor imply `Delta_x(A0), Delta_x(A*)<0`; log-concavity propagates these inequalities to `p`, so every original leaf satisfies the fixed strict selector. Log-concavity of `R` propagates from `x` to `p-2`, making the complete `S` negative.

## Finite computation and limits

All 4 case-file hashes and all 237 common-file hashes listed by the assigned packets matched. I copied the pinned `REPLAY.py` into this scratch directory before attempting execution. The local Python shim could not run it: its interpreter invocation was blocked by the host Xcode license prompt (and the shim also reported that its pyenv rehash location is not writable). Thus I did not reproduce the finite checks or the reported exact minima/counts. The copied replay is retained as the only evidence file; the source `RESULTS.json` values have not been independently confirmed here.

The reported finite base covers `m=3..999`; the analytic argument is intended to cover `m>=1000`. The proof also depends on the admitted forest descent bound, which this route does not prove. The cited Gurvits Theorem 1.1 was checked against the primary arXiv text: it states that convolution of ULC(l) and ULC(d) sequences is ULC(l+d), matching the positive finite factor sequences used here. No proof-kernel certificate was checked. The unreplayed finite base keeps the family result at proposed-open status. This family-only result does not challenge the all-tree claim either way.
