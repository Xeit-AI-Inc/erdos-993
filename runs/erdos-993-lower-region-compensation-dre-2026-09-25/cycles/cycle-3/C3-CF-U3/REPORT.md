# C3-CF-U3 cross-orientation critique

## Scope and disposition

This F-orientation review covers exactly the two C3-U3 claims named in the case packet. I retain both at the route's informal proof grade. The graph claim is a valid marked-shadow inequality at the exact order (2k+2) under its vertex-cover and mark hypotheses. The tree claim follows at the exact parent order (2p+2) under early first descent. Neither result addresses larger parent orders, proves the registered all-order lower-region aggregate, or carries formal proof status.

## C3-U3-MARKED-COVER-SHELL — retained

Let (G) have (2k+2) vertices, (k\ge2), τ(G)\ge3, and let (W) contain a non-isolated vertex. The two-part split in the route is sound. Choose (w\in W) non-isolated and partition a marked independent (j)-set according to whether it contains (w):

\[
q_j(G,W)=i_{j-1}(G-N[w])+q_j(G-w,W\setminus\{w\}).
\]

For the first term, (J=G-N[w]) has at most (2k) vertices. If it has at most (2k-1), the ordinary deletion-extension incidence count gives (i_k(J)\le i_{k-1}(J)): each independent (k)-set has (k) deletions, while a ((k-1))-set has at most |V(J)|-(k-1)\le k extensions. Thus the two incidence counts give the desired inequality (with zero-extension boundary cases immediate). If |V(J)|=2k, exactly two vertices were deleted, namely (w) and its only neighbor (z). All edges not internal to (J) are incident to (z). If (J) had at most one edge, (z) and one endpoint of that edge would cover (G), contrary to τ(G)\ge3. Thus (J) has at least two edges, and the registered exact first-wide theorem applies with (r=k-1\ge1), giving (i_k(J)\le i_{k-1}(J)).

For the second term, (G-w) has at least two edges. Otherwise the edges of (G-w), if any, together with (w)'s incident edges are covered by (w) and at most one endpoint of the sole edge of (G-w), contradicting τ(G)\ge3. Apply the route's order-≤2k+1 arbitrary-mark lemma. Its proof is valid: split at any mark; the closed-neighborhood residual has order at most (2k), with the exact (2k) case forcing the split mark to be isolated and leaving the required at-least-two-edge first-wide instance; the remaining marked part is covered by the ≤2k shadow count. The route's marked-set shadow count uses at least (k) mark-preserving deletions from each marked ((k+1))-set and at most (k) extensions of each marked (k)-set when the graph order is at most (2k). Adding the two inequalities proves (q_{k+1}(G,W)\le q_k(G,W)).

I checked both exact two-vertex residual arguments; neither silently removes earlier marks or mistakes a local edge condition for a larger-order theorem. The only imported graph result is used at its exact order and parameter. This is an informal derivation using the registered graph theorem, not a new formal verification.

## C3-U3-FIRST-SHELL-POINTWISE — retained

For (n=2p+2), (p\ge3), suppose (x(T)+2\le p). I checked the cover-three contradiction as follows. If τ(T)\le3, extend a cover to a three-vertex cover (C); its complement has (2p-1) independent vertices. Decomposing the independence polynomial by the independent part (X\subseteq C), each term is (z^{|X|}(1+z)^{b_X}). At every (0\le r\le p-2), the empty-(X) term contributes

\[
E(2p-1,r)=\binom{2p-1}{r+1}-\binom{2p-1}{r},
\]

and the at-most |\binom{3}{a}| terms with |X|=a contribute no less than (-\binom{3}{a}\,\mathrm{Cat}_{r-a}), with the stated zero extension for negative indices. Since (2p-1\ge2r+3), monotonicity of (E(N,r)) gives the route's lower bound with (E(2r+3,r)). Its positivity is correct: for (r=0,1) the margins are (2,2); for (r\ge2), (E(2r+3,r)=\frac{2(2r+3)}{r+3}\mathrm{Cat}_{r+1}\ge2\mathrm{Cat}_{r+1}\ge8\mathrm{Cat}_{r-1}), while the three subtracted terms total at most (7\mathrm{Cat}_{r-1}). Hence Δ_r(T)>0 for every (r\le p-2), contradicting (x(T)+2\le p). Therefore τ(T)\ge4. This uses the all-ranks bound, not just positivity at one rank.

The terminal descent index is well-defined under integer zero extension: at (j=\alpha(T)), Δ_j(T)=0-i_{\alpha(T)}(T)=-1. Thus the contradiction with (x(T)\le p-2) is justified.

For each original leaf (v) with original support (s), (H=T-\{v,s\}) satisfies α(H)=α(T)-1 (exchange (v) for (s) in the pendant edge), hence τ(H)=τ(T)-1\ge3). Each component of (H) is an original branch rooted at a vertex of (W=N_T(s)\setminus\{v\}). As τ(H)\ge3), at least one such branch has an edge, so (W) contains a non-isolated vertex. With (k=p-1\ge2), |V(H)|=2k+2, and (R=H-W=T-N_T[s]), the marked-shadow conclusion is exactly

\[
q_p(H,W)-q_{p-1}(H,W)=\Delta_{p-1}(H)-\Delta_{p-1}(R)\le0,
\]

the original leaf summand. It applies to every original leaf; selecting those with the fixed strict condition Δ_p(T-v)<0 preserves the inequality. Leaves with a shared support remain separate tags and summands.

## Limits

Both dispositions are `retained`, with `proposed_informal` status only. The first-wide graph classification is used only at exact order (2(k-1)+2=2k), and the binomial-difference Catalan floor only at the stated arithmetic scope. The shell proof remains an informal proof sketch dependent on these common results; no Lean build or kernel check was run. No selector arithmetic is needed beyond retaining the exact fixed original selector after proving the stronger every-leaf sign. The proof gives no conclusion for |V(T)|\ge2p+3 and cannot resolve the full lower-region assertion there.
