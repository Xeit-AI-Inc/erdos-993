# C6-CU-T4 independent critique (orientation U)

## Scope and source integrity

I reviewed the three claims in the sealed C6-T4 return against its report, replay, and evidence. All 241 source hashes listed by the common and case packets matched. The applicable contract requires the unchanged favorable-leaf selector, distinct original-leaf tags, `x+2<=p`, and strict `3p<2a+1`; it leaves the arbitrary-tree lower-region aggregate OPEN. The case's own replay was not run in place. I copied the pinned `ordinary_tree_checked.py` and replay into this scratch directory, redirected the replay to those local copies, and independently reran it with the specified Python 3.11 executable. The exact output is `evidence_t22_replay.json`.

## Claim dispositions

### C6-T4-MATCHING-SLACK-DECOMPOSITION — retained

For each fixed selected tag `v` and marked independent `k`-set `A` of `H_v`, `U_v(A)` is an induced forest. Every independent subset of `U_v(A)` can be adjoined to `A`, so `alpha(U_v(A))<=h-k`. If `nu` is a maximum matching and `u=|U|-2nu`, König's theorem for finite bipartite graphs gives `alpha(U)=|U|-nu=nu+u` and `e=|U|=2nu+u`. Therefore

`2(h-k)-e = 2(h-k-alpha(U))+u`.

Both terms on the right are nonnegative, and `u` is exactly the number of vertices unmatched by a maximum matching. This is a valid per-marked-set identity, including the unmatched-addable contribution.

The incidence count is also correct tag by tag. Each upper independent `(k+1)`-set with exactly one witness mark contributes `k` marked lower deletions; one with at least two witness marks contributes `k+1`, hence the correction `C` counted once for that upper set and tag. Thus `sum e=kU+C`, and summing over distinct selected leaf tags preserves multiplicity even when supports coincide. Since `S=U-Q`, the claimed reduction `kS=(2a+1-3p)Q-D-C` follows with `h=a-1`, `k=p-1`. Eligibility gives `p>=2`; the strict alpha guard gives `p<=a`, so the ranks and nonnegative slack domain are consistent. The reduction is equivalent to the target compensation budget because `k>0`; it does not establish that budget.

### C6-T4-T22-ELIGIBLE-CROSS-TAG-CHECK — retained

The source recipe is realized by the pinned `t_family(22)` constructor: one root-support-leaf arm plus 22 root-adjacent three-leaf branches, a connected acyclic simple graph on 91 vertices. The local-copy replay independently returns `a=68`, `x=32`, `p=34`, `x+2=p`, and `3p=102<137=2a+1`. It returns the same 67-leaf fixed selector, full sum `-498754180547001418536`, and positive marked-arm term `212336130412243110`; the other 66 selected leaf terms are each `-7560098737536570631`. Their exact sum agrees with the full aggregate. It also checks the incidence identity and gives `D+C-35Q=16458887958051046811688`, equivalently `33S=-16458887958051046811688`.

This is a reproducible exact computation for one eligible tree and rank. It correctly shows that a positive selected term does not refute the complete aggregate. It is neither a census nor a universal compensation proof.

### C6-T4-UNIFORM-COMPENSATION-OPEN — retained

The route proves the matching decomposition and one compensating T22 instance, but neither supplies a lower bound for `D+C` at the required scale across arbitrary eligible trees. No theorem bridge, selector-transfer argument, matching transport, or complete counterexample is presented. The route's conclusion that it leaves the arbitrary-tree claim unresolved is properly scoped and consistent with the OPEN contract.

## Usefulness and limitations

The decomposition isolates three nonnegative sources—independence-capacity slack, unmatched addable vertices, and multiply marked upper sets—and prevents dropping the unmatched term in a matching estimate. This is useful structural bookkeeping, but it is not itself a new charging map or a proof that those terms cover `(2a+1-3p)Q`. The T22 example is useful as a realizable cross-tag control with a positive summand and negative full sum.

The route mentions frozen flow diagnostics only as finite evidence and does not rely on a quotient-lifting theorem. I did not independently re-audit the three primal-flow artifacts; they are not needed for any of the three case claims or the replayed calculation. No source-availability gap is asserted. No mathematical defect was found in the three claims at their stated scopes.
