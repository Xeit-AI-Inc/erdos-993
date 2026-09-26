# Potential shorter formal proof route for the first shell

Controller proof strategy, not a new award or a change to the frozen first-shell candidate. These are possible internal lemmas. No active C2 route receives this file.

Always use the single-mark partition, for w in W:

    q_j(G,W) = i_(j-1)(G-N[w]) + q_j(G-w,W minus {w}).

This is enough to avoid formalizing a fully ordered list of marks.

A. Any marked family on a graph of order at most2k has q_(k+1)<=q_k for k>=1, by k marked-preserving deletions per upper set and at most m-k extensions per lower set. Handle ranks beyond order separately or work in integers.

B. If G has order at most2k+1, k>=2, and at least2 edges, then the same inequality holds for ANY W. If W empty it is trivial; choose w otherwise. The second term of the partition is covered by A. For the first term, J=G-N[w] has order at most2k. If order<=2k-1, use ordinary unmarked shadow. If order=2k then m=2k+1 and w is isolated, so J retains at least2 edges; the existing sharp first-wide graph classification at r=k-1 gives i_k(J)<=i_(k-1)(J).

C. If G has order2k+2, tau(G)>=3, k>=2, and W contains a non-isolated w, split at w. For J=G-N[w], order<=2k. If it equals2k, the deleted pair is {w,z}, all deleted edges are incident to z, and J having at most1 edge would give a cover of G of size2. Thus J has at least2 edges and the sharp classification applies; smaller J uses unmarked shadow. For the second partition term G-w has order2k+1 and at least2 edges (otherwise w plus one residual-edge endpoint covers G), so B applies to W minus {w}. Add the inequalities.

C is the marked cover lemma in the frozen first-shell proof. Its tree application and the independent cover<=3 early-descent exclusion remain exactly as stated there. A/B/C are proposed internal mathematical lemmas, not separately registered formal awards. B has different hypotheses from the marked-isolate theorem and must not be conflated with it.
