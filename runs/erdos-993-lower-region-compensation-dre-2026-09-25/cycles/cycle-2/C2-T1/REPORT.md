# C2-T1 search report: the first-order shell

## Result

I obtain a conditional proof for a subclass of the eligible shell \(|T|=2p+2\), and an exact localization of the remaining ordered-root terms. The full shell claim remains open. No counterexample or theorem resolving the selector-conditioned boundary compensation is established here.

Write \(k=p-1\). For an original leaf \(v\), set \(H_v=T-\{v,s_v\}\), \(W_v=N_T(s_v)\setminus\{v\}\), and \(R_v=T-N_T[s_v]\). The marks \(W_v\) contain exactly one vertex in each component of \(H_v\): each component attaches to \(s_v\) at exactly one such vertex, by connectedness and acyclicity. For \(J_i=H_v-(N_{H_v}[w_i]\cup\{w_1,\ldots,w_{i-1}\})\), order the marks as \(w_1,\ldots,w_t\). Partitioning marked independent sets by their first selected mark gives, for every rank \(j\),

\[
q_v(j):=i_j(H_v)-i_j(R_v)=\sum_{i=1}^t i_{j-1}(J_i).
\]

This is an exact disjoint partition, including one term for each distinct original leaf tag. Consequently the leaf summand is

\[
g_v=\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)=q_v(k+1)-q_v(k)
=\sum_i\bigl(i_k(J_i)-i_{k-1}(J_i)\bigr).
\]

The rank shift follows directly from \(\Delta_{p-1}(G)=i_p(G)-i_{p-1}(G)\); no selector change is made.

## Shell shadow bound and boundary classification

For every finite graph \(J\) of order \(N\), incidence counting between independent \((k-1)\)-sets and their one-vertex independent extensions gives

\[
k i_k(J)\le (N-k+1)i_{k-1}(J).
\]

Indeed, each independent \(k\)-set has exactly \(k\) deletions, while a fixed independent \((k-1)\)-set has at most \(N-k+1\) possible extensions. Thus \(i_k(J)\le i_{k-1}(J)\) whenever \(N\le2k-1\), including zero-extended ranks.

In the first-order shell, \(|H_v|=2p=2k+2\). Since the primary guards imply that \(T\) is not a star, every \(H_v\) has a nontrivial component: if it were edgeless, all vertices of \(T-\{v,s_v\}\) would be neighbors of \(s_v\), making \(T\) a star. For completeness, a star of this order has \(x(T)=p+1\): for ranks \(j\ge2\), \(i_j=\binom{2p-1}{j}\), whose first strict descent is at \(j=p+1\). It fails \(x(T)+2\le p\).

Order a non-isolated mark first. Then \(|J_1|\le2k+1\), and in fact \(|J_1|=2k\) is possible exactly when \(w_1\) has degree one in \(H_v\). For \(i\ge2\), the removed set contains the distinct vertices \(w_i,w_1\), so \(|J_i|\le2k\). For \(i\ge3\), it contains the three distinct vertices \(w_i,w_1,w_2\), so \(|J_i|\le2k-1\). At \(i=2\), the only way fewer than three vertices are guaranteed removed is that \(w_2\) is isolated in \(H_v\): if it is non-isolated, its neighbor is in a different component from \(w_1\), and the removal has size at least three. Therefore the only terms not settled by the ordinary shadow bound are:

1. the first-root term when \(w_1\) is a leaf of \(H_v\), for which \(|J_1|=2k\);
2. the second-root term when \(w_2\) is isolated in \(H_v\), for which \(|J_2|=2k\).

If either exceptional deletion removes more vertices, its term is also nonpositive by the same bound. At the exact boundary \(|J|=2k\), the sharper incidence identity is

\[
k\bigl(i_k(J)-i_{k-1}(J)\bigr)=i_{k-1}(J)-B_J,
\qquad B_J=\sum_{A\in\mathcal I_{k-1}(J)}|N_J(A)|,
\]

where \(\mathcal I_{k-1}(J)\) is the family of independent \((k-1)\)-sets and \(N_J(A)\) is the union of their open neighborhoods. Thus its positive excess is exactly \((i_{k-1}(J)-B_J)/k\), not an uncontrolled generic term. This identity follows because the number of addable vertices for \(A\) is \(N-(k-1)-|N_J(A)|\), and each independent \(k\)-set is counted by its \(k\) deletions.

## Proved conditional shell subclass

Suppose that for every selected original leaf \(v\in F(T,p)\), the component marks of \(H_v\) can be ordered with \(\deg_{H_v}(w_1)\ge2\), and, if there is a second mark, \(\deg_{H_v}(w_2)\ge1\). Then every \(J_i\) has order at most \(2k-1\): the first closed neighborhood removes at least three vertices; the second deletion removes \(w_1,w_2\) and a neighbor of \(w_2\), all distinct because they lie in separate components; every later deletion removes at least \(w_1,w_2,w_i\). The shadow bound gives each ordered-root term nonpositive, hence \(g_v\le0\) for every selected tag and the complete sum satisfies \(S(T,p)=\sum_{v\in F}g_v\le0\). If \(F\) is empty the conclusion is immediate. The condition is structural and sufficient, not asserted to follow from favorability.

This also shows exactly where the straightforward root-order proof stops: a selected tag may have a degree-one root in the sole/first nontrivial component, or may place an isolated component root second. Such a tag can have a positive boundary excess. The complete sum could still be nonpositive through other roots or other selected supports, but the decomposition above supplies no cross-support charge.

## Missing bridge and scope

To prove the full shell, one still needs an inequality showing that, with the *fixed* strict selector \(F(T,p)=\{v:\Delta_p(T-v)<0\}\), the sum of the exact boundary excesses \((i_{k-1}(J)-B_J)/k\) over all selected tags is offset by negative terms from the remaining roots/tags. The primary guards do not in the argument here bound that excess or give a transport between supports. A positive local boundary term is not a counterexample to the complete sum. Repeated leaves at one support remain separate terms throughout.

The derivation uses the first-order shell \(|T|=2p+2\), \(k=p-1\), eligible ordinary trees, original supports and neighborhoods, and the original favorable selector. It does not settle larger orders or the full primary lower-region assertion. All deductions above are exact informal counting arguments; no external theorem, computation, exhaustive census, or formal proof is used.
