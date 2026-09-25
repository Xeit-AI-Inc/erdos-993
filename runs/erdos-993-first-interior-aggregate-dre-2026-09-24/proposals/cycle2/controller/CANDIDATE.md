# Unreviewed controller candidate for the next cycle
Not an award or a current-cycle synthesis input. Do not expose this proposal to isolated Cycle 1 seats. Root-derived counting argument; independent review and exact Lean fidelity are required. novelty_claimed: false.

## Local tagged-shadow bound
Let G be finite bipartite with a degree-one vertex v, support s, a=alpha(G). H=G-{v,s}, W=N_G(s)\{v}, R=H-W=G-N_G[s]. Let q_j count independent j-subsets of H meeting W, so q_j=i_j(H)-i_j(R). Every independent set in H extends by v in G; hence alpha(H)<=a-1.
For integer k>=1, double-count pairs (A,B), A subset B, |A|=k, |B|=k+1, both independent in H and meeting W.
For each A, an extension vertex lies in H-N_H[A]. This is bipartite with independence number at most alpha(H)-k<=a-1-k (because any independent subset there unions with A). A bipartite graph has at most twice its independence number (one color class has at least half the vertices). Thus A has at most 2(a-1-k) extensions. Each B has at least k deletions preserving meeting W: at most the sole vertex of B intersect W can be a bad deletion. Therefore
k*q_(k+1) <= 2(a-1-k)*q_k.
For k=a-3, the right factor is 4. If a>=7, k>=4, hence q_(a-2)<=q_(a-3). This proves every original leaf summand at p=a-2 is nonpositive, without any selector or residual hypothesis. Thus the complete favorable sum is nonpositive.
More generally 3k>=2(a-1) implies the same sign, i.e. p=k+1 with 3p>=2a+1. This is a tail restriction; known all-window pointwise counterexamples at much lower ranks do not contradict it.

## Remaining small-alpha eligibility exclusion
Need rigorous proof that an eligible ordinary tree at p=a-2 has a>=7. Eligibility gives x<=a-4. For a<=3 impossible because x>=0. For a=4, x<=0 but n>=a+1>=5 and Delta_0=n-1>0. For a=5, x<=1 but n>=6, Delta_0>0 and Delta_1=C(n-1,2)-n>0.
For a=6, x<=2; n>=7. Delta_0,Delta_1 positive. For every n-vertex tree,
i_2=C(n-1,2),
i_3=C(n,3)-(n-1)(n-2)+sum_u C(deg(u),2),
Delta_2=((n-1)(n-2)(n-9))/6 + sum_u C(deg(u),2).
For n>=9 this is nonnegative. If n=7 and a=6, the complement of an independent six-set is a single vertex; all six tree edges meet it, so the tree is K_1,6, Delta_2=5. If n=8 and a=6, the complement of an independent six-set is a two-vertex cover {u,w}; deg(u)+deg(w)>=7. Thus C(deg(u),2)+C(deg(w),2)>=9 (minimum split 3+4; if larger sum, no lower). Consequently Delta_2>=-7+9=2. Therefore x>=3, contrary to x<=2. Every case excludes a<=6.
Need independently validate exact triple-count identity, graph degeneracies, extension/deletion pair counts, integer/Nat conversion, and coefficient/selector binding. This might resolve the primary target if all checks survive; no status change now.

## External inspiration and limits
A fresh primary-author search found the known last-third decreasing coefficient result for bipartite graphs discussed in Galvin's paper https://www3.nd.edu/~dgalvin1/pdf/journal/Qdfixed_J.pdf (Levit-Mandrescu attribution). The proposal above is a direct reconstructed tagged-family double count, not an asserted corollary of that paper. Its exact inequalities and small-case argument need independent scrutiny. No literature priority or novelty claim.
