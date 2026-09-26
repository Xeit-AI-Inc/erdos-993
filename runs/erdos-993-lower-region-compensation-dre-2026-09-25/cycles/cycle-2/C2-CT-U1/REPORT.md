# C2-CT-U1 critique: ordinary-leaf order band

**Stage:** critique, orientation T. **Source:** the sole sealed claim in C2-U1. The common and case packet hashes verified against their listed SHA-256 values before review. This is an informal independent proof audit; no formalization or computation is claimed.

## Disposition

**E993-ORDINARY-LEAF-ORDER-BAND — retained.** The source proof establishes the exact registered pointwise statement for finite ordinary trees, original degree-one leaves and original supports, integer p>=3, and |V(T)|<=2p+1. It correctly makes no favorable-leaf, alpha, first-descent, lower-region, or residual assumption. I find no proof defect requiring narrowing. The disposition does not award an authoritative status and does not extend the registered scope to p=2.

## Independent check

Let H=T-{v,s}, W=N_T(s)\\{v}, and R=T-N_T[s]. All sets here use the original tree adjacency. Then R=H-W. For each j>=0 define q_j as the number of independent j-sets of H meeting W. Since independent sets of H either meet W or lie wholly in R,

    q_j = i_j(H)-i_j(R).

With k=p-1, the claimed expression is

    Delta_(p-1)(H)-Delta_(p-1)(R)
      = [i_(k+1)(H)-i_k(H)]-[i_(k+1)(R)-i_k(R)]
      = q_(k+1)-q_k.

Thus it remains to prove q_(k+1)<=q_k. The guards give k>=2 and m=|V(H)|=|V(T)|-2<=2p-1=2k+1.

Deleting s from T separates one component for each neighbor of s. The v-component is the singleton {v}; after removing it, the remaining components are exactly those of H and each contains its unique neighbor w of s. These distinct w are precisely W. A component cannot contain two neighbors of s, since their paths through that component together with s would give a cycle. If H has an edge, at least one component has size at least two, and its root w in W is nonisolated in H.

Order W as w_1,...,w_t, taking a nonisolated root first when H has an edge. For each i let

    J_i = H - (N_H[w_i] union {w_1,...,w_(i-1)}).

Every independent j-set meeting W has a unique first marked vertex w_i. Deleting w_i leaves an independent (j-1)-set in J_i, and adjoining w_i to any such set recovers exactly the sets whose first mark is w_i. In particular, later marks must remain available in J_i. Hence, for j>=1,

    q_j = sum_i i_(j-1)(J_i).

When H has an edge, J_1 omits w_1 and one of its neighbors. For i>1, the omitted union contains the two distinct marks w_1 and w_i, regardless of whether they are adjacent. Therefore every J_i has at most m-2<=2k-1 vertices.

For any finite simple graph J of order N and k>=1, count pairs (B,u) where B is an independent (k-1)-set and u is a vertex addable to B. Each independent k-set contributes exactly k pairs by deleting one of its vertices. Each B has at most N-k+1 extensions, so when N>=k-1,

    k*i_k(J) <= (N-k+1)*i_(k-1)(J).

If N<=2k-1, then N-k+1<=k and this gives i_k(J)<=i_(k-1)(J). If N<k-1, both ranks exceed N and both counts are zero; this handles the natural-number boundary without using a negative extension count. Applying the inequality to each J_i and summing the first-mark partition gives q_(k+1)<=q_k.

If H is edgeless and nonempty, every component is a singleton and the tree component argument gives W=V(H). Thus q_j=binom(m,j) for the positive ranks at issue. Since m<=2k+1, binom(m,k+1)<=binom(m,k): it is immediate when m<k, and otherwise follows from the adjacent-layer ratio (m-k)/(k+1)<=1. If H is empty, both q_k and q_(k+1) vanish since k>=2. This includes the two-vertex tree case. A one-vertex tree has no degree-one leaf instance.

This verifies component-root coverage, first-mark uniqueness, graph deletion order, multiplicities, the adjacent-rank shadow coefficient and its zero-extension cases, and the conversion back to the original leaf expression. The proof is realizable for every stated tree and leaf; it is a pointwise order-band fact, so summing its terms over a selected set is valid only when the tree is in this same band.

## Scope and standing controls

The claim concerns exactly p>=3 and |T|<=2p+1. The order91/rank34 and order243/rank90 standing controls lie outside this order band (91>2*34+1 and 243>2*90+1), so their positive local rows do not conflict with this statement. Nor do they establish the claim beyond its band. The claim does not settle the first shell |T|=2p+2 or the full lower-region favorable-leaf aggregate. The separate generic marked-isolate theorem is not needed for this tree-specific argument.

## Limitations

- Informal proof review only; no Lean build, kernel check, or formal award.
- No scope beyond the registered p>=3 order band is asserted.
- No source replay was needed; the reviewed route claim is a mathematical proof, not a computational result.
- No conclusion is drawn here about the first shell or the primary complete selected-sum assertion.
