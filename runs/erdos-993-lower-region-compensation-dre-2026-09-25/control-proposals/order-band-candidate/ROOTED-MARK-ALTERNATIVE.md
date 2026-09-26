# Alternative direct proof candidate for ordinary leaf order band

Controller discovery; pending independent review, not an award. This is an alternative proof of the registered ordinary-leaf order-band scope and may reduce its Lean dependency burden.

For an arbitrary finite graph G on m vertices with ordered marks W={w_1,...,w_t}, partition each marked independent set by its first marked vertex. With J_i=G-(N_G[w_i] union {w_1,...,w_(i-1)}), this gives exactly q_j=sum_i i_(j-1)(J_i), including original mark multiplicities once per selected first mark. The remaining vertices need not avoid later marks.

Every finite graph J of order N has k*i_k(J)<= (N-k+1)*i_(k-1)(J) for k>=1: each independent upper k-set has k deletions, while each lower (k-1)-set has at most N-k+1 extensions. In particular N<=2k-1 implies i_k(J)<=i_(k-1)(J). If k-1>N, both counts are zero; the count inequality can be stated with nonnegative truncated extension bound or handled separately.

Suppose m<=2k+1 and W contains a non-isolated vertex y. Order y first. J_1 has at most m-2 vertices because N[y] contains y and a neighbor. For i>=2, the deletion union contains w_i and the earlier distinct y, whether or not they are adjacent; hence all J_i have at most m-2<=2k-1 vertices. Applying the preceding bound termwise gives q_(k+1)<=q_k. This needs k>=1 and no isolate-containment hypothesis.

For an original tree leaf deletion H=T-{v,s}, each component of H has exactly one mark in W=N_T(s) minus {v}, by connectivity and acyclicity. If H has a nontrivial component, its marked root is non-isolated, so the preceding argument applies. If every component is a singleton, H is edgeless and W=V(H), giving q_j=binom(m,j) for j>=1; m<=2k+1 implies q_(k+1)<=q_k by the binomial adjacent ratio, including k>m. Empty H is immediate.

Thus the ordinary leaf conclusion actually follows for p=k+1>=2 and n<=2p+1; the registered p>=3 scope is included. Do not silently change its registered guard or award a broader statement. The conclusion uses no bipartite-alpha cap, favorability or first descent. This avoids the full generic marked-isolate theorem when formalizing the ordinary leaf band. It may be particularly suitable for a direct proof using deletion telescoping, unmarked shadow bounds and tree component root coverage.
