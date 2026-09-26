# C4-U5 search report — selector-dependent tree decomposition

## Result

This route gives an exact support-level encoding of the selected aggregate and an exact rank-truncated rooted-tree recurrence for its polynomial inputs. It does not prove the aggregate inequality or produce a counterexample. The proposed finding is a concrete induction bottleneck: favorable status is computed from the full-tree polynomial after deleting a leaf, and cannot in general be assigned to a rooted subtree before its exterior context is known.

## Support-indexed identity

Write the independence polynomial of a finite graph (G) as (I_G(z)=\sum_j i_j(G)z^j). For each vertex (u), let (L(u)) be its original degree-one neighbors and (m_u=|L(u)|). For (v\in L(u)), let (C_w=T_{w|u}) be the component on the (w)-side of the edge (uw), and set (J_w=I(C_w)), (A_w=I(C_w-w)). Products below range over (w\in N_T(u)\setminus\{v\}), with an empty product equal to 1. Define

\[
P_{u,v}(z)=\prod_w J_w+z\prod_w A_w,\qquad
Q_{u,v}(z)=\prod_w J_w-\prod_w A_w.
\]

Splitting independent sets according to whether (u) is absent or present gives (P_{u,v}=I(T-v)). Removing (u,v) leaves the branches (C_w), while removing (N_T[u]) leaves (C_w-w); hence (Q_{u,v}=I(T-\{u,v\})-I(T-N_T[u])). These identities use original-tree neighborhoods and supports.

Put (d_p(P)=[z^{p+1}]P-[z^p]P=\Delta_p(T-v)), and (c_p(Q)=[z^p]Q-[z^{p-1}]Q). Then the contract's complete selected sum has the exact form

\[
S(T,p)=\sum_u m_u\,\mathbf 1\{d_p(P_{u,v})<0\}\,c_p(Q_{u,v}),
\]

where for each support (u), any (v\in L(u)) can be used. Indeed the branch at (v) is a singleton, so (P_{u,v}) and (Q_{u,v}) are independent of which leaf in (L(u)) is chosen. Thus all same-support leaves have the same selector and the same summand, with multiplicity (m_u); they are not dropped. The (Q) coefficient difference is exactly the original summand at rank (p-1).

This is a re-expression, not a sign estimate. In particular, it does not replace the strict selector by an unselected sum.

## Exact rooted-tree computation state

For a rooted subtree at (r), let (E_r(z)) count independent sets with (r) excluded and (O_r(z)) count those with (r) included. The recurrences are

\[
E_r=\prod_{c\text{ child of }r}(E_c+O_c),\qquad
O_r=z\prod_{c\text{ child of }r}E_c.
\]

They are exact by the root's two possible states. For any fixed target rank (p\ge2), polynomial vectors truncated after degree (p+1) suffice to obtain every \,\(d_p(P)\) and \,\(c_p(Q)\) above: multiplication is performed in \(\mathbb Z[z]/(z^{p+2})\). The same rooted dynamic program can carry the maximum independent-set size as a separate max-plus coordinate. For the eligibility test, (x(T)+2\le p) is equivalent to the existence of a negative \(\Delta_j(T)\) among \(0\le j\le p-2\), since (x) is the first negative rank. Coefficients through degree (p-1) decide this test; track \(\alpha(T)\) separately for \(3p<2\alpha(T)+1\). These state coordinates are sufficient to check the global guards and all required rank coefficients for a fixed (p).

To obtain (P_{u,v}) and (Q_{u,v}) for every support, one also needs directed-edge (rerooted) branch messages (I(C_w)) and (I(C_w-w)). The displayed product formulas then give every support record. A correct implementation can defer selector evaluation until all branch context has been combined and can preserve multiplicities explicitly.

## Induction bottleneck

The ordinary rooted recurrence is compositional for the independence polynomial, but the target is not a sum of locally preclassified subtree terms. Each support record needs two context-sensitive quantities: the sign of the coefficient difference in (I(T-v)), and the coefficient difference in (I(T-\{u,v\})-I(T-N[u])). Attaching branches changes these polynomials by products and root-state sums. A recurrence that stores only a subtree's already-selected aggregate, or only the number of favorable leaves, loses the coefficient data needed to decide whether an exposed support is selected after gluing. The threshold indicator \(\mathbf1\{d_p<0\}\) is nonlinear, so a linear additive subtree statistic does not follow from the independence-polynomial recurrence.

A viable fixed-(p) transfer would need a context-closed state retaining truncated polynomial messages and unresolved support records (or an equivalent signature sufficient to update each record under every allowed attachment), together with a proof that the final selector and full aggregate are recovered. This route has not supplied a bounded state that compresses those records while proving \(S\le0\), nor a monotonicity or compensation lemma controlling their signs. This is the explicit missing bridge; the state description alone is not an induction proof.

## Scope and limitations

No outside theorem or literature claim is used. The algebra above applies to finite ordinary trees and exact coefficient arithmetic. No computational census was run. No universal conclusion follows from this reduction. The primary claim and the optional tagged-incidence identity remain unresolved by this route; no status award is proposed.
