# C1-U5 search report

I derived an exact support-core compression and rooted pendant-path recursion for the ordinary-tree target, and proved the target for all eligible stars. The compression retains the multiplicity of original leaf tags at each support. It gives an exact evaluation method on arbitrary cores, but does not yet provide the sign comparison needed for branching cores.

For a tree of order at least three, the leaf-stripped core `C` plus pendant multiplicities `m_u` reconstructs the tree. Its independence polynomial is

`I_T(z)=sum_{X in Ind(C)} z^|X| product_{u notin X}(1+z)^{m_u}`.

For a leaf at support `s`, favorability depends only on `s`, so the support's full contribution is either zero or `m_s` times one common summand. For every core neighbor `u`, define `A_{u|s}` as the polynomial of its decorated rooted branch and `A^0_{u|s}` as the polynomial after deleting its root. The two local deletion polynomials are

`I_{T-{v,s}}=(1+z)^(m_s-1) product_{u~_C s} A_{u|s}` and `I_{T-N[s]}=product_{u~_C s} A^0_{u|s}`.

The branch recursion is `A^0_{u|s}=(1+z)^{m_u} product_w A_{w|u}` and `A_{u|s}=A^0_{u|s}+z product_w A^0_{w|u}` over children `w`. These formulas are established directly by splitting independent sets according to whether each core root is selected. Full statement and derivation are in the evidence file.

For `K_{1,m}`, the first descent for `m>=6` occurs at `m/2` for even `m` and `(m+1)/2` for odd `m`; orders `m<=5` have no rank satisfying both eligibility guards. Thus any eligible star has `p>m/2`. Every leaf is favorable in `K_{1,m}-v`, and its summand is `C(m-1,p)-C(m-1,p-1)<0`, proving `S<0` for this subfamily. The exact `K_{1,12}` check is `(a,x,p)=(12,6,8)`, `Delta_8(K_{1,11})=-110`, 12 summands of `-165`, and `S=-1980`.

The general bottleneck remains that the global selector uses `Delta_p(I_{T-v})`, while each weighted local term is a rank-`p-1` coefficient difference of products of branches. No universal comparison between these two quantities follows from the recursion. I found no eligible counterexample and make no claim for nonsingleton branching cores. The exact result is a representation/reduction plus the star-core theorem, not a resolution of the registered primary.

The source pins in `packets/C1-COMMON.json` were verified by SHA-256. No external literature or sibling worker material was used. No bounded exhaustive search was run.
