# C2-T4 search report

## Route and scope

This route followed the T4 occupancy lens for the registered
`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. Its exact selector
remains `F(T,p)={v original leaf: Delta_p(T-v)<0}` at every rank used.
Eligibility is `x(T)+2<=p` and the strict lower-region condition
`3p<2 alpha(T)+1`; all supports and neighborhoods are from the original
ordinary tree, and leaves with a common support remain distinct tags.

The packet lists no case-specific source files and no required covered claim
IDs. All 27 hashes listed in the common packet were checked against their
listed SHA-256 values. I read the four common read-first files, the T4 lens
in `control/C2-SEARCH-ALLOCATION.json`, and the supplied fixed-selector weight
coordinates. No outside theorem or computation was used.

## Exact occupancy comparison

For fixed `F`, define the weight `w_F(B)` on independent sets of the original
`T` as in EVIDENCE.md. The bijection `A -> A union {v}` proves
`sum_F q_v(j)=sum_(|B|=j+1)w_F(B)`, with the selector fixed while rank varies.
Because each summand of `S` is `q_v(p)-q_v(p-1)`, the full sum is

`S=sum_(|B|=p+1)w_F(B)-sum_(|B|=p)w_F(B)`

or, for uniform rank measures, `S=i_(p+1)(T) E_(p+1)[w_F] -
i_p(T) E_p[w_F]`. Thus T4's exact sufficient-and-necessary occupancy inequality
is a comparison of the weighted expectations after accounting for the
unweighted layer sizes. This identity itself supplies no monotonicity.

## Established class result

For every eligible path `P_n` with `n>=4`, the selector consists of both
endpoints and the supports are distinct. The recurrence for path independence
polynomials reduces the entire selected sum to

`S(P_n,p)=2*(i_(p-1)(P_(n-4))-i_(p-2)(P_(n-4)))<=0`.

The rank-ratio argument in EVIDENCE.md proves the final inequality under the
actual path first-descent guard, and therefore proves the occupancy comparison
on this two-support class. Zero extension handles ranks past the path support.
As a bounded arithmetic cross-check, the path formula was evaluated for
`4<=n<=150`: 449 eligible `(n,p)` rows over 117 orders, all negative; the
observed full-sum range was from `-140598451215242502192647212080` to
`-38896`. EVIDENCE.md gives the exact replay loop. The theorem above, not this
finite check, supports the path-class conclusion.

## Remaining gap

For branching trees, the needed dependence premise is exactly

`i_(p+1)(T) E_(p+1)[w_F] <= i_p(T) E_p[w_F]`

for the fixed strict selector `F(T,p)`, under both primary guards. The weight
is not shown to be negatively associated, and the leafwise path recurrence
does not extend to a general tree. Neither the supplied pointwise bound on
`w_F(B)` nor the path case compares adjacent weighted ranks for general
branching trees. This route therefore leaves the registered primary OPEN;
no universal proof or counterexample was found.
