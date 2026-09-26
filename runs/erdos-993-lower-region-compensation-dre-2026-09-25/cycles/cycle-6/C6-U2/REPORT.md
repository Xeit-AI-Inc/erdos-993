# C6-U2 bounded profile census

## Scope and result

I enumerated every unordered multiset of branch arities $r_i\in\{2,3,4\}$ for $1\le m\le40$, for the ordinary tree consisting of path $0-1-2$ with $m$ centers adjacent to $0$, each center having $r_i$ private leaves. There are $\sum_{m=1}^{40}\binom{m+2}{2}=12{,}340$ profiles. For every rank satisfying the exact contract guards, I evaluated the first descent, both rank guards, the strict selector for each original leaf type, and the full distinct-tag sum.

There are 191,016 eligible profile/rank pairs. The endpoint leaf is selected in all 191,016. Private leaves are selected by their arity type, with each of the $r_i$ original leaves counted separately; 18,940,012 private-leaf tags were selected over the census. Every one of the 191,016 complete selected sums is strictly negative; none is zero or positive. This is a finite computation for the specified family only. It does not decide the arbitrary-tree aggregate or any uncovered prefix claim.

Exact profile and eligible-row counts by $m=1,\ldots,40$ are in `EVIDENCE.json` under `by_m` (the eligible-row counts, in order, are: 0, 1, 7, 18, 36, 62, 100, 156, 225, 308, 405, 519, 652, 807, 993, 1207, 1447, 1711, 2005, 2325, 2677, 3068, 3502, 3979, 4491, 5041, 5629, 6265, 6942, 7674, 8459, 9298, 10192, 11131, 12121, 13166, 14269, 15445, 16689, 17994). At $m=1$ there are 3 profiles and no eligible rank. Across $m$, profile count is exactly $\binom{m+2}{2}$.

## Exact recurrence and guards

All arithmetic used Python arbitrary-precision integers. Write $L=1+z$, $B_r=L^r+z$, $Q=\prod_i B_{r_i}$, $N=\sum_i r_i$, and $H_r$ for the product omitting one branch of arity $r$. The independence polynomial and deletion polynomials used for selectors are

$$
P=(1+2z)Q+zL^{N+1},\quad A_0=LQ+zL^N,\quad A_r=(1+2z)B_{r-1}H_r+zL^N.
$$

Here $A_0$ deletes endpoint $2$, and $A_r$ deletes one private leaf on an arity-$r$ branch. The maximum independent-set size is $\alpha=N+2$. For each profile, $x$ is the first $j\ge0$ with $\Delta_j(P)<0$, including the terminal rank with zero extension. The exact eligible interval checked was $x+2\le p\le\lfloor2\alpha/3\rfloor$, equivalent to both $x+2\le p$ and strict $3p<2\alpha+1$.

For a fixed private leaf on an arity-$r$ branch, set $F_r=(L^{r-1}-1)/z$ and $Z_r=(1+2z)F_rH_r+L^N$; for the endpoint set $Z_0=L^N$. Direct deletion gives $i(H_v)-i(R_v)=zZ_r$ (or $zZ_0$ at the endpoint). Thus each selected leaf contributes exactly $Z_r[p-1]-Z_r[p-2]$ to the contracted summand. The full sum accumulated one term per original selected leaf, preserving multiplicities for branches with shared supports. Selection itself was checked from $\Delta_p(A_0)<0$ or $\Delta_p(A_r)<0$; it was not inferred from the sum formula.

## Independent graph checks and central margins

Using the pinned `inputs/ordinary_tree_checked.py` forest dynamic program, I independently built six fixed trees with profiles `(2)`, `(2,2)`, `(2,3,4)`, ten 2s, twenty 4s, and the $m=40$ profile with 14 2s, 13 3s, and 13 4s. Across these checks, 164 polynomial comparisons covered $P$, endpoint deletion, private-leaf deletions, and $i(H_v)-i(R_v)=zZ_r$; all matched exactly. The explicit profile recipes and comparison outcomes are in `EVIDENCE.json`. This is a cross-check on selected instances, not a second exhaustive graph enumeration.

I also checked exact log-concavity margins $c_j^2-c_{j-1}c_{j+1}$ for $P,A_0,A_r,Z_r,\widetilde Z_r$ at every central rank $\lceil N/4\rceil\le j\le\lfloor2N/3+3\rfloor$ where the margin is defined. Here $\widetilde Z_r=(1+2z)F_rH_r+(N+1)L^N/N$ is the endpoint-redistributed candidate marked polynomial. For that rational polynomial I checked the integer-scaled coefficients $N\widetilde Z_r$, which preserve the sign of every margin. There were 5,253,954 margin checks and zero negative margins, including zero failures at the profile's first descent. Thus this bounded census found no central-margin failure inside or outside eligible ranks for these tracked polynomials. It does not check every mixed minor or establish the uniform analytic argument in the candidate proof.

The enumeration is deterministic, with no random seed. `census.py` is the replay program; run it with `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3`. It writes the exact result to `EVIDENCE.json` and compares the fixed graph instances with the separately implemented tree DP.

## Disposition and limits

This supports only the bounded computational statement above. The result covers $1\le m\le40$, not the $m<2000$ prefix as a whole, not an infinite heterogeneous family, and not arbitrary ordinary trees. It supplies no theorem about the primary target and no status award. The central-margin check is finite and limited to the listed polynomials and rank interval. The common source hashes (237 of 237) matched before use.
