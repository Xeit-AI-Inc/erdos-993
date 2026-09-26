# C2-CT-U2 critique report

## Disposition

**E993-MARKED-ISOLATE-ORDER-BAND — retained.** I independently checked the incidence identity and both cases at the sharp boundary. The proof establishes the registered generic graph statement at exactly its stated scope.

## Independent audit

Let \(\mathcal A_k\) be the marked independent k-sets, let \(b(A)=|N_G(A)|\), and put \(B=\sum_{A\in\mathcal A_k} b(A)\). Since A is independent, its open neighborhood is disjoint from A. Exactly
\[
e(A)=m-k-b(A)
\]
vertices can be added while preserving independence.

Count pairs (A,y) with A in \(\mathcal A_k\) and y addable. An independent (k+1)-set X meeting W in exactly one vertex has k deletions that leave a marked k-set. If X has at least two vertices in W, all k+1 deletions leave a marked k-set. If C counts such multiply marked X once, the same pairs therefore number \(kq_{k+1}+C\). Counting by A instead gives \((m-k)q_k-B\). Thus
\[
k(q_{k+1}-q_k)=(m-2k)q_k-B-C.
\]
All counts and B,C are nonnegative, so m<=2k proves the desired inequality, including empty layers and k>m (where the incidence family is empty).

At m=2k+1, partition \(\mathcal A_k\) into good A with b(A)>0 and bad A with b(A)=0. A is bad exactly when all its vertices are isolates. Since W contains every isolate, every bad A is marked. Each good A contributes at least one to B, so B is at least the number of good A.

If G has a non-isolated vertex y, fix it. For every bad A, y is not in A and A union {y} is independent. This upper set has at least k marked vertices, hence at least two because k>=2; it is counted by C. The map is injective since deleting y recovers A, giving C at least the number of bad A. Thus B+C>=q_k and the identity yields the result. If G has no non-isolated vertices, G is edgeless and W=V(G); complement in the 2k+1 vertices bijects the k-subsets with the (k+1)-subsets, giving equality. These arguments also cover q_k=0.

## Scope and limits

The argument uses the isolate coverage exactly at the boundary and uses k>=2 to ensure the injection lands among upper sets counted by C. It proves no order band beyond m<=2k+1 and no tree-specific or selector-conditioned statement. The result is an informal proof audit; there is no formalization or kernel receipt. No unresolved gap was found in the source claim.

