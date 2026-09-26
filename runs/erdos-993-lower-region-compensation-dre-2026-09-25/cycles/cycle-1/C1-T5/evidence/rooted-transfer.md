# Rooted transfer formulas for the selected aggregate

All polynomials below are independence polynomials with integer coefficients and ordinary powers of `z`.

For a rooted tree `(U,r)`, let `J(U,r)=I_U(z)` and `E(U,r)=I_{U-r}(z)`. If the components below the children `r_i` of `r` are `U_i`, then

`E(U,r) = product_i J(U_i,r_i)`

and

`J(U,r) = product_i J(U_i,r_i) + z product_i E(U_i,r_i)`.

The first term chooses no root; the second chooses `r` and therefore excludes every child root. The empty products handle a one-vertex rooted tree.

Now fix a support vertex `s` and let `L_s` be its original leaf neighbors, with `m_s=|L_s|`. Let `N_s` be the neighbors of `s` that are not original leaves. For each `w in N_s`, let `C_{s,w}` be the component of `T-s` containing `w`, rooted at `w`, and put `J_{s,w}=I(C_{s,w})` and `E_{s,w}=I(C_{s,w}-w)`. The other `m_s-1` leaf-neighbor components contribute `(1+z)^(m_s-1)` to `H_v` and `1` to `R_v`.

Define

`P_s=(1+z)^(m_s-1) product_{w in N_s} J_{s,w}`,
`Q_s=product_{w in N_s} E_{s,w}`.

Then for every original leaf `v in L_s`,

`I(H_v)=P_s`, `I(R_v)=Q_s`, `I(T-v)=P_s+z Q_s`.

The last identity partitions independent sets of `T-v` according to whether they contain `s`. The first two follow by deleting `s`, then deleting all its remaining neighbors. In particular the selector is constant on the support fibre `L_s`: either all its leaves are favorable or none are. If `k=p-1`, its contribution when selected is

`Delta_k(P_s)-Delta_k(Q_s)=Delta_k(P_s-Q_s)`.

Consequently the full target has the exact support-fibre form

`S(T,p)=sum_{s: Delta_p(P_s+zQ_s)<0} m_s Delta_(p-1)(P_s-Q_s)`.

This is a useful recurrence input because `P_s` and `Q_s` are products of rooted branch messages, including the multiplicity of original leaves. It does not give a sign: the selector tests a coefficient difference at rank `p`, while the summand tests a different polynomial difference at rank `p-1`.

For a complete rooted transfer state, retain the full coefficient vectors of `J` and `E` on every oriented edge, the original-leaf multiplicity at each support, and the resulting `P_s,Q_s` pairs. The displayed two-polynomial recurrence composes the edge messages. From the resulting `I_T`, compute `a=deg I_T`, all `Delta_j(T)` through the zero-extended terminal rank `a`, and `x`; only then apply `x+2<=p` and `3p<2a+1`. The branch messages give each strict selector value and every summand exactly. A smaller summary such as just alpha and the first descent cannot recover the rank-`p` selector or the rank-`p-1` contribution.

The remaining proof obligation in this state is precisely

`sum_{s: Delta_p(P_s+zQ_s)<0} m_s Delta_(p-1)(P_s-Q_s) <= 0`

under those two global guards. This is a restatement in compositional coordinates, not a derived inequality. Positive selected summands occur in the supplied lower-region controls, so a pointwise nonpositivity invariant cannot close the induction; an induction would need a proved compensation invariant over distinct support fibres. No such invariant is established here.
