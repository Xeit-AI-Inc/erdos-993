# Support-core and pendant-path reduction

Let `T` be an ordinary tree of order at least three. Delete all original leaves and call the resulting induced tree `C`. For each `u in C`, let `m_u` be the number of original leaves adjacent to `u`. The pair `(C,(m_u))` reconstructs `T`, and a leaf at `u` is a distinct tag even though all such tags have identical deletion polynomials.

For any independent set `X` of `C`, the pendant leaves attached to `u` can be chosen freely exactly when `u` is not in `X`. Consequently

`I_T(z) = sum_{X independent in C} z^|X| product_{u notin X}(1+z)^{m_u}`.

Deleting a tagged leaf at `s` replaces `m_s` by `m_s-1`. Therefore the favorable status is constant over the `m_s` tags at `s`, and their aggregate contribution is `m_s d_s` when `Delta_p(I_{T-s-leaf})<0`, where `d_s` is the common local summand. This groups the exact target by support-core vertices without collapsing multiplicity.

There is also an exact rooted branch recursion for `d_s`. For every core neighbor `u` of `s`, orient the component of `C-s` containing `u` away from `s`. Let `A_{u|s}` be the independence polynomial of the decorated branch including `u` and all pendant leaves at its vertices; let `A^0_{u|s}` be the polynomial after deleting `u` alone. Then, for a leaf tag at `s`,

`I_{T-{leaf,s}}(z) = (1+z)^(m_s-1) product_{u~_C s} A_{u|s}(z)`,

`I_{T-N_T[s]}(z) = product_{u~_C s} A^0_{u|s}(z)`,

so

`d_s = Delta_(p-1)( (1+z)^(m_s-1) product A_{u|s} - product A^0_{u|s} )`.

The rooted states obey a two-polynomial recursion. If `Ch(u)` are the children of `u` in the orientation, then

`A^0_{u|s}=(1+z)^{m_u} product_{w in Ch(u)} A_{w|u}`,

`A_{u|s}=A^0_{u|s} + z product_{w in Ch(u)} A^0_{w|u}`.

The first line chooses no core root `u`, leaving its pendant leaves and child branches free. The second term in the second line chooses `u`, which excludes both its pendant leaves and each child root. These identities are exact polynomial equalities, so they also give a finite, coefficient-exact evaluation of the selector and full aggregate on an arbitrary decorated core. They do not bound core size or prove a sign for general branching cores.

## Star-core case

For `T=K_{1,m}` with `m>=1`, `I_T(z)=(1+z)^m+z`. For `m>=6`, its first strict descent is `x=m/2` if `m` is even and `x=(m+1)/2` if `m` is odd: `Delta_1=C(m,2)-(m+1)>0`; thereafter binomial coefficients increase to their middle, with a zero difference only at the central tie for odd `m`. For `1<=m<=5`, direct coefficients show either `x+2` violates `3p<2m+1`, or no eligible `p` exists. Hence any eligible star has `m>=6` and `p>=x+2>m/2`.

For each original leaf `v`, `T-v=K_{1,m-1}` and, since `p>=5`, `Delta_p(T-v)=C(m-1,p+1)-C(m-1,p)<0`; all `m` leaf tags are selected. Also `T-{v,s_v}` is an edgeless graph on `m-1` vertices, while `T-N[s_v]` is empty. Thus each summand is

`C(m-1,p)-C(m-1,p-1)<0`,

because its binomial ratio is `(m-p)/p<1`. Therefore

`S(K_{1,m},p)=m ( C(m-1,p)-C(m-1,p-1) )<0`

for every eligible star. This proves only the star-core subcase.

As an exact check, at `m=12`, `a=12`, the coefficients of `I_T` give `x=6`; at `p=8`, `3p=24<25=2a+1` and `x+2=p`. Each `T-v=K_{1,11}` has `Delta_8=55-165=-110`; each summand is `Delta_7(E_11)=C(11,8)-C(11,7)=165-330=-165`; all 12 leaves are selected and `S=-1980`.

This reduction supplies a compact exact representation for support grouping and pendant-path propagation. The open global difficulty remains: the selector tests the full decorated core polynomial at rank `p`, while each local coefficient difference uses the rooted branches around a support at rank `p-1`; the recursion alone gives no inequality comparing their weighted sum.
