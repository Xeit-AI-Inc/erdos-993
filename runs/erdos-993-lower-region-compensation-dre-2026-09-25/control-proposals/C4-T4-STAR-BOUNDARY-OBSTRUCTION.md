# Astra diagnostic: the proposed signed cross-tag map fails on an eligible star

Independent controller derivation, withheld from current critics. No canonical claim status changed.

Use T=K1,12 with center0 and original leaves1..12; alpha12, I_T=(1+z)^12+z, first strict descent x6, p8, k7. Both target guards hold (x+2=p and24<25). Every leaf is favorable: Delta8(T-v)=C(11,9)-C(11,8)=55-165=-110. For each leaf tag v, H_v is11 isolated vertices and W_v=V(H_v), so q8=165,q7=330. Complete S=12(165-330)=-1980.

C4-T4's map deletes a vertex from an8-set. Every resulting7-set still meets W_v. Its first rule therefore always keeps the original tag; the new retagging branch never executes. Each tag block is exactly the alternating simplicial boundary from8-subsets of11 vertices to7-subsets.

Fix v=1 and C={2,3,4,5,6,7,8,9,10}, a9-subset of H_v. Let z=sum_{u in C}(-1)^position(u,C) e_(v,C minus {u}), with a consistent zero-based order. This is a nonzero vector of K8. Applying L gives zero: every7-subset obtained by deleting two different vertices appears twice with opposite signs. This is the usual boundary-squared cancellation, directly checkable with integer coefficients. Thus the proposed L is NOT injective on an eligible tree although its complete aggregate is negative. It is a new candidate-mechanism failure, not an aggregate refutation.

Also, an SDR of nonzero matrix entries does NOT generally certify a full-rank minor for a fixed signed matrix. This same example supplies one: each8-set has8 deletion neighbors and each7-set has4 upper extensions, so for every source subfamily A,8|A|<=4|N(A)|, implying Hall. Therefore an injective combinatorial assignment exists on each block, while the signed boundary is singular. A selected matching certifies generic structural rank only if independent variables or another no-cancellation argument is supplied; it does not certify the rank of this fixed L.

The known boundary rank is C(10,7)=120, versus165 source dimensions, but no rank formula is needed: the explicit nonzero kernel vector proves failure. A change to unsigned, weighted or support-insertion arcs would be a different operator requiring a fresh exact definition and fresh tests. Do not transfer this verdict to every cross-tag map or to the registered two-for-one network.

## General obstruction to this exact signed retagging rule

There is a broader direct kernel construction. Fix a selected tag v and an independent (p+1)-set C of H_v with at least TWO marked vertices in W_v. Then every p-face C-{u} belongs to the source K_p for this same tag. Let z be its complete alternating boundary, a nonzero vector. For each (p-1)-face B obtained by deleting two vertices, both paths retain the ORIGINAL source tag v until L is applied, and the destination tau_v(B) in the proposed rule depends only on v and B, not the deleted vertex or the intervening p-face. Thus both contributions go to the same destination basis vector (or both are omitted) with opposite signs. Consequently Lz=0 even if the face B loses all marks and is retagged. The hypothesis of at least two marks ensures no source p-face was omitted. This is a structural obstruction beyond the star; it uses the exact face-only retagging rule. An altered map whose coefficients or retagging depend on more data is a different candidate and needs new tests.
