# C2-CF-T1 critique (orientation F)

## Scope and disposition

I audited both claims in the C2-T1 return against the first-order shell contract. The claims are retained at their stated scopes. The first is a valid conditional shell theorem; the second remains an open full-shell assertion. No full-sum counterexample, exhaustive census, or source replay is claimed.

## C2-T1-SHELL-ORDERED-ROOT-SUBCLASS — retained

Put (k=p-1), (H_v=T-\{v,s_v\}), and (W_v=N_T(s_v)\setminus\{v\}). Every component of (H_v) has exactly one vertex in (W_v): connectivity forces at least one attachment to (s_v), and two attachments from one component would make a cycle. For any ordering (w_1,\ldots,w_t) of these distinct marks, assigning a marked independent set to its first mark gives the disjoint partition

\[
q_v(j)=i_j(H_v)-i_j(H_v-W_v)=\sum_{i=1}^t i_{j-1}(J_i),\qquad
J_i=H_v-\bigl(N_{H_v}[w_i]\cup\{w_1,\ldots,w_{i-1}\}\bigr).
\]

Thus the original leaf term is (g_v=q_v(k+1)-q_v(k)=\sum_i(i_k(J_i)-i_{k-1}(J_i))). This rank shift is correct, and the same fixed (F(T,p)) is used throughout. Distinct original leaves with a shared support remain distinct summands; identical profiles do not erase their multiplicity.

Here (|H_v|=2p=2k+2). Under the stated ordering condition, (J_1) loses at least three vertices because (w_1) has degree at least two. If a second mark exists, (J_2) loses (w_1,w_2) and a neighbor of (w_2), three distinct vertices because the marks lie in separate components. For (i\ge3), it loses the three distinct marks (w_1,w_2,w_i). Hence every (|J_i|\le2k-1).

For a graph (J) of order (N\le2k-1), incidence counting gives (k i_k(J)\le(N-k+1)i_{k-1}(J)\le k i_{k-1}(J)) when (N\ge k-1). If (N<k-1), both counts vanish by zero extension. This small-rank case split repairs the route's overbroad assertion that the displayed incidence inequality itself holds unchanged for all zero-extended ranks. In either case (i_k(J)\le i_{k-1}(J)). Summing proves (g_v\le0) for each selected tag and then (S\le0); the empty selector also gives zero. The conditional claim is therefore established by an exact informal counting proof, without assuming that favorability forces its structural condition.

## E993-LOWER-REGION-FIRST-ORDER-SHELL — retained as open

The route correctly stops short of proving the complete shell. Its exceptional ordered-root terms have order exactly (2k), and their individual sign is not controlled merely by the (N\le2k-1) shadow bound. A positive term would not refute the global sum, and the route supplies no transport or inequality charging those terms against negative terms across roots, supports, or selected leaf tags. The strict selector remains the original (F(T,p)=\{v:\Delta_p(T-v)<0\}); no selector substitution occurs.

There is a permitted registered result that further sharpens the gap. `E993-GRAPH-FIRST-WIDE-SHARP-CLASSIFICATION` states, for every finite simple graph (G) of order (2r+2), (r\ge1), that \(\Delta_r(G)>0\) iff (G) has at most one edge (and records positivity at every rank (0\le j\le r) in the zero- and one-edge cases). For an exceptional residual (J_i) of order (2k=2(k-1)+2), take (r=k-1\). Eligibility for a nonempty ordinary tree implies (x(T)\ge1), hence (p\ge3) and (r\ge1\). Since

\[
\Delta_{k-1}(J_i)=i_k(J_i)-i_{k-1}(J_i),
\]

the classification applies at exactly the required graph and rank. Thus an order-(2k) residual with at least two edges has a nonpositive term; a positive exceptional term can occur only when that residual has zero or one edge. This result does not handle the sparse residual cases or compare them across selected tags, so it does not settle the shell assertion. It also does not extend to larger residual orders.

The star check in the route is consistent: for the star on (2p+2) vertices, (i_j=\binom{2p+1}{j}) for (j\ge2), and the first strict descent is at (j=p+1), since \(\binom{2p+1}{j+1}<\binom{2p+1}{j}\) first holds there. Therefore it fails (x(T)+2\le p\). In any eligible tree, Δ₀(T)=|T|-1>0, so (x(T)\ge1); this also justifies (p\ge3) and avoids a spurious (p=2) use of the (r\ge1) classification.

No external theorem, fresh finite computation, or copied-code replay was needed. The registered classification is used only at its exact order/rank scope. This critique neither proves nor refutes the full shell.
