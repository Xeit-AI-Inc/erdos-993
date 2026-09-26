# C1-U5-1 audit evidence

## Disposition and exact scope

Disposition: `retained` for the route's stated subclaim. For each finite ordinary star `K_{1,m}` with an eligible rank, the selected aggregate is strictly negative. For each ordinary tree of order at least three, the support-core polynomial and rooted branch recurrences stated in the route are exact coefficient identities and preserve the multiplicity of each original leaf tag. These results do not prove or refute the primary lower-region aggregate on trees with a nonsingleton branching core.

## Independent domain and sign check for stars

For `K_{1,m}`, `I(z)=(1+z)^m+z`; for ranks `j>=2`, `i_j=binom(m,j)`, while `i_1=m+1`. Thus for `m>=6`, `Delta_1=binom(m,2)-(m+1)>0`, the binomial sequence increases to its middle, and the first negative difference is at `x=m/2` for even `m` or `x=(m+1)/2` for odd `m` (the odd central difference is zero). The eligibility condition `x+2<=p` and `3p<2m+1` implies `p>m/2`; indeed for even `m` it forces `m>10`, and for odd `m` it forces `m>13`. Direct coefficients for `m=1,...,5` give respectively `x=1,1,1,2,3`; in each case `3(x+2)>=2m+1`, so no eligible `p` exists. If `K_{1,0}` is included as a star convention, its singleton has no eligible rank either.

For every eligible star, `p>=5`. Removing any leaf gives `K_{1,m-1}`, and its rank-`p` difference is

`Delta_p = binom(m-1,p+1)-binom(m-1,p)<0`,

since `(m-1-p)/(p+1)<1`. Hence every leaf tag is selected. Deleting the leaf and its support leaves an edgeless graph on `m-1` vertices; deleting the support's closed neighborhood leaves the empty graph. The summand is

`binom(m-1,p)-binom(m-1,p-1)<0`,

because the ratio of the first binomial coefficient to the second is `(m-p)/p<1`. Summing over all `m` distinct tags gives the strict negative star result. The supplied `m=12,p=8` check is consistent: `Delta_8(K_{1,11})=55-165=-110`, each summand is `165-330=-165`, and `S=-1980`.

## Independent check of the general recurrences

For an independent core set `X`, a pendant leaf at `u` is available precisely when `u` is absent, giving the factor `(1+z)^{m_u}`. Summing over all independent `X` proves the stated formula for `I_T`. In a branch rooted at `u`, deleting `u` leaves its `m_u` pendant leaves and all child branches unrestricted, giving `A^0_{u|s}=(1+z)^{m_u}\prod_w A_{w|u}`. Selecting `u` forbids its pendant leaves and each child root, giving the additional term `z\prod_w A^0_{w|u}` in `A_{u|s}`. At a selected support `s`, deleting one tagged leaf leaves `m_s-1` isolated support leaves and the full branches at each core neighbor; deleting `N[s]` removes each such neighbor root but leaves that root's pendant leaves, exactly the `A^0` state. These give both local deletion-polynomial formulas as written.

Since leaf deletion changes only one of the `m_s` indistinguishable pendant factors, `Delta_p(T-v)` is identical for all tags at `s`, as is the local summand. The aggregate therefore weights the support summand by exactly `m_s`; grouping does not discard tags. For trees of order at least three, the leaf-stripped induced core is nonempty and connected (the only tree with empty 1-core is the two-vertex edge), so the branch decomposition applies.

## Primary-target and control audit

No selector-to-local-summand inequality is proved by these polynomial identities. They are an exact evaluation recursion, not a sign transport. This distinction is necessary: the common handoff's ordinary lower-region controls have positive marked/local terms but negative complete sums (`T_22`: `+212336130412243110` term and `S=-498754180547001418536`; `T_60`: `+2935177632783649903488454322226807645411570590073000` term and `S=-1058142362147652597702654588268394677176033202323316960380`). Those controls do not contradict the route's star theorem or formulas, and they rule out interpreting either as a universal termwise-negativity mechanism. The `K_{1,12}` control is within the proved star subfamily. No bounded exhaustive search, source-script replay, external theorem, or status transfer is used here.
