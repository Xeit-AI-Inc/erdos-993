# C2-CU-T3 critique report

## Disposition

**C2-T3-shell-root-shadow — retained** on the exact subclass stated in the source return. The proposed result is a valid partial shell theorem. It does not prove the registered full first-shell claim or the lower-region aggregate.

## Independent check

Let (n=2p+2), (k=p-1), and use the source's original leaf (v), support (s_v), (H_v=T-\{v,s_v\}), (W_v=N_T(s_v)\setminus\{v\}), and (R_v=H_v-W_v). Then (|H_v|=2p=2k+2). Since (T) is a tree, each component of (H_v) contains exactly one vertex of (W_v): each component after deleting (s_v) lies in one original branch, and the branch root remains as its unique mark. This includes a singleton component when another original leaf shares (s_v). Thus

\[
q_v(j)=i_j(H_v)-i_j(R_v)
\]

counts independent (j)-sets meeting (W_v), and
\[
\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)=q_v(p)-q_v(p-1)=q_v(k+1)-q_v(k).
\]
This uses the fixed original selector (F(T,p)); repeated leaves at one support remain distinct summands.

Order the marks (w_1,\ldots,w_t) and define
\[
J_i=H_v-\left(N_{H_v}[w_i]\cup\{w_1,\ldots,w_{i-1}\}\right).
\]
Partitioning by the first mark gives (q_v(j)=\sum_i i_{j-1}(J_i)) for (j\ge1): once the first mark is fixed, the remaining independent set can be any independent ((j-1))-set in (J_i); it need not avoid later marks. For any finite graph (J) of order (N) and integer (k\ge1), double-counting deletions/extensions gives
\[
k i_k(J)\le (N-k+1)i_{k-1}(J)
\]
when (k\le N); for (k>N), the desired comparison is immediate because (i_k(J)=0\le i_{k-1}(J)). Hence (i_k(J)\le i_{k-1}(J)) whenever (N\le2k-1).

Under the retained condition, (H_v) has no isolates and one marked root has degree at least two. Put that root first. Its closed neighborhood deletes at least three vertices. Every later mark is the root of a different component, so its closed neighborhood is disjoint from the first root and has at least two vertices; together with the first root it deletes at least three. Therefore every (J_i) has order at most ((2k+2)-3=2k-1), and termwise shadow comparison proves (q_v(k+1)\le q_v(k)). Summing over exactly (F(T,p)) proves the asserted subclass sum. When (F) is empty, the sum is zero.

The eligibility arithmetic is also correct. A leaf can be included in a maximum independent set by replacing its support if needed, so \(\alpha(H_v)=a-1\). Thus \(\tau(H_v)=2p-(a-1)=p+1-(a-p)\). The strict guard (3p<2a+1) implies (3p\le2a), hence (a-p\ge\lceil p/2\rceil\) and \(\tau(H_v)\le\lfloor p/2\rfloor+1\). This is a valid coordinate, but it supplies no additional layer comparison.

## Scope limits and remaining case

If a selected (H_v) is edgeless, the original tree is a star with independence polynomial \((1+z)^{2p+1}+z\), whose first strict descent is (x=p+1); that contradicts (x+2\le p\). This excludes the edgeless selected case. It does not exclude isolates together with edge components, or a forest with no isolates whose marked roots all have degree one. The source correctly leaves these cases open.

At the first shell, two deleted vertices can leave a (J_i) of order (2k), where the shadow estimate only gives \(i_k(J_i)\le(1+1/k)i_{k-1}(J_i)\). The source's bound of at most \(i_{k-1}(J_i)/k\) on such a positive excess follows. The ordering described localizes such terms; it gives no payment for them. Therefore no result here establishes their compensation over selected tags, and no full-sum sign or counterexample follows.

No arithmetic, selector, support, multiplicity, rank-domain, or realizability defect was found in the retained subclass proof. The proof is an exact combinatorial argument and does not depend on finite computation or imported literature. The source's status remains proposed and OPEN; this critique assigns no controller verdict.
