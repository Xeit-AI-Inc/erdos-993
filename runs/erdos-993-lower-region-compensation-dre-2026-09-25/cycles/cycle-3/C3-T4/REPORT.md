# C3-T4 search report: the next parent order

## Target and scope

This route studies the ordinary favorable-leaf aggregate at parent order \(n=2p+3\), the next order after the supplied \(2p+2\) candidate. Set \(k=p-1\). For a fixed original leaf \(v\), use the contract's \(H=T-\{v,s_v\}\) and marked set \(W=N_T(s_v)\setminus\{v\}\). The contribution to the marked difference is
\[
q_{k+1}(H,W)-q_k(H,W)=\sum_i\big(i_k(J_i)-i_{k-1}(J_i)\big),
\]
where marks are ordered, \(w_i\) is the first mark in each independent set, and \(J_i=H-(N_H[w_i]\cup\{w_1,\ldots,w_{i-1}\})\). The selector remains the original fixed favorable set throughout; this report does not replace it by a local selector.

## Structural classification of the large first-mark residuals

Here \(|V(H)|=2p+1=2k+3\). The marks in \(W\) are pairwise nonadjacent: they are distinct neighbors of the same support in the original tree, and an edge between two of them would make a triangle. Therefore an earlier mark is never in \(N_H[w_i]\).

The deletion union defining \(J_i\) has size at least two. Consequently \(|J_i|\le 2k+1\). The boundary configurations are as follows.

* \(|J_i|=2k+1\): the deletion union has size two. This forces \(i=1\) and \(d_H(w_1)=1\). Write \(z\) for its unique neighbor. Thus this residual is exactly \(H-\{w_1,z\}\); no later first-mark class can have this order.
* \(|J_i|=2k\): the deletion union has size three. There are two possibilities: (a) \(i=1\) and \(d_H(w_1)=2\), so the removed set is \(N_H[w_1]\); or (b) \(i=2\), \(d_H(w_2)=1\), and the sole earlier mark \(w_1\) lies outside \(N_H[w_2]\), so the removed set is \(N_H[w_2]\cup\{w_1\}\). There are no other cases, since each earlier mark adds a distinct vertex outside the closed neighborhood and every closed neighborhood has at least two vertices.
* If \(|J_i|\le 2k-1\), the ordinary independent-set shadow count gives \(i_k(J_i)\le i_{k-1}(J_i)\): count incidences between independent \(k\)-sets and their \((k-1)\)-subsets, then use \(|V(J_i)|-k+1\le k\).

The even boundary here is not the first-shell even boundary. In the supplied \(2p+2\) argument, an order-\(2k\) residual is obtained by deleting exactly two vertices, and the argument controls all exterior edges through one vertex. At order \(2p+3\), an order-\(2k\) residual deletes three vertices. The supplied two-vertex edge-classification therefore does not apply without a new lemma. The odd boundary is a further new case.

## An exact odd-order sign subclass, and why order alone is insufficient

For \(J\) equal to a disjoint union of \(k\) edges and one isolated vertex (so \(|V(J)|=2k+1\)),
\[
I_J(z)=(1+2z)^k(1+z),\qquad
 i_k(J)-i_{k-1}(J)=2^{k-2}\left(4-\binom{k}{2}\right).
\]
Thus this residual subclass has positive difference at \(k=1,2,3\), and negative difference for every \(k\ge4\). This is a genuine exact sign result, but it does not establish that every such forest is realizable as a first-mark residual under the tree and selector guards. It also rules out a sign argument based on odd order alone.

More generally, for a forest residual that is a matching of size \(m\) plus \(2k+1-2m\) isolated vertices, the exact difference is
\[
\sum_{j=0}^{m}\binom{m}{j}2^j\left[\binom{2k+1-2m}{k-j}-\binom{2k+1-2m}{k-1-j}\right],
\]
with out-of-range binomial coefficients zero. This gives a checkable coefficient test for that residual family, not a theorem for arbitrary forest residuals.

## Consequence for a marked sign proof

The first-mark decomposition proves the marked sign if every residual in the two boundary cases has nonpositive \(i_k-i_{k-1}\), or if positive boundary terms are quantitatively compensated by negative terms from other first-mark classes. The small-residual terms are already nonpositive by shadow counting. This yields a focused remaining obligation: control (i) the degree-one first mark after deleting it and its neighbor, and (ii) the two degree/previous-mark cases of order \(2k\), with a global compensation bound when pointwise control fails.

That condition can be applied leaf-by-leaf to every member of the fixed favorable selector and then summed, retaining same-support leaves as separate terms. No such boundary bound or compensation theorem is proved here. In particular, the structural reduction does not show that \(S(T,p)\le0\) for all eligible trees at this order or for the full lower region.

## Status and limitations

The result is a partial structural reduction plus an exact matching-residual calculation. I did not find or prove a universal sign theorem for either boundary class, did not lift the matching example to a guarded ordinary tree with a full positive aggregate, and did not prove the required global compensation. Hence this route does not resolve the primary claim. No census or universal inference is made.
