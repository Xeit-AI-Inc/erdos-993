# C3-T2 search report: fixed-selector two-for-one weighted Hall

## Scope and result

I investigated the proposed weighted transport for the unchanged selector \(F(T,p)\). For an independent set \(B\), its weight is
\[
 w_F(B)=\#\{v\in F\cap B:(B\setminus\{v\})\cap W_v\ne\varnothing\},
 \qquad W_v=N_T(s_v)\setminus\{v\}.
\]
The proposed upper layer consists of independent \((p+1)\)-sets with supply \(w_F(B)\); the lower layer consists of independent \(p\)-sets with capacity \(w_F(D)\). Allowed edges are every one-vertex deletion and each legal two-for-one switch \(B\mapsto(B\setminus(N_T(s)\cap B))\cup\{s\}\) when \(s\notin B\) and \(|N_T(s)\cap B|=2\). The selector stays fixed at rank \(p\).

I obtained an exact rooted product decomposition of the independent-set states and of the tag weight, including the exact root-boundary interactions. This is a useful finite-state reduction for a tree DP, but it does **not** establish the required weighted Hall inequality. In particular, componentwise Hall inequalities do not follow: tags supported at the root depend on occupancy in multiple branches, and a legal switch at the root couples two branch-root occupancies while moving from the root-absent slice to the root-present slice. The unresolved step is a weighted Hall theorem for these coupled rank-constrained branch products, with arbitrary fixed selected-leaf indicators inherited from \(F(T,p)\).

No primary aggregate proof or counterexample follows. A deficient cut would refute this transport certificate, not the scalar aggregate; a saturated transport would imply the aggregate by summing capacities, but is stronger than the aggregate comparison. The supplied three \(T_m\) orbit-flow successes remain finite checks only and do not prove the missing cut theorem.

## Exact rooted decomposition

Choose any root \(r\) and let \(u_1,\ldots,u_d\) be its neighbors. Let \(T_i\) be the component below \(u_i\) after deleting \(r\), and put \(T_i^-=T_i-\{u_i\}\). Each independent set has exactly one of these forms:

* root absent: a Cartesian tuple \((A_i)_{i=1}^d\), with \(A_i\in\mathcal I(T_i)\);
* root present: \(\{r\}\cup(A_i)_{i=1}^d\), with \(A_i\in\mathcal I(T_i^-)\).

The rank is respectively \(\sum_i|A_i|\) and \(1+\sum_i|A_i|\). This is an exact disjoint partition, including empty branches and the one-vertex tree.

For each branch and root-state \(\epsilon=1_{r\in B}\), define \(w_i^\epsilon(A_i)\) to count selected leaves \(v\in F\cap A_i\) whose support is not \(r\) and for which either a vertex of \(W_v\cap V(T_i)\) lies in \(A_i\), or \(\epsilon=1\) and \(r\in W_v\). (The latter occurs when \(s_v=u_i\).) Let \(J=\{i:u_i\text{ is an original leaf of }T\text{ with }u_i\in F\}\). For branch tuples write \(z_i=1_{u_i\in A_i}\), treating \(z_i=0\) whenever the root-present slice forces \(u_i\notin A_i\). Then
\[
 w_F(B)=\sum_i w_i^{\epsilon}(A_i)+1_{r\notin B}\sum_{i\in J}z_i\,1_{\sum_{\ell\ne i}z_\ell>0}.
\]
A leaf whose support is not \(r\) has all vertices of \(W_v\) in its branch except possibly \(r\) itself, which occurs exactly when its support is \(u_i\); the root-state parameter accounts for that boundary vertex. A leaf supported at \(r\) is active precisely when it is occupied and at least one other neighbor of \(r\) is occupied; if \(r\in B\), all these leaf neighbors are absent. Thus the remaining cross-branch weight term depends only on the boundary occupancy vector \((z_i)\), not on arbitrary interior branch choices.

The legal switches also identify the precise boundary transition. A switch centered at \(s\ne r\) stays inside one branch unless \(s=u_i\) and \(r\) is one of its two occupied neighbors; in that case the switch removes \(r\) and one occupied child of \(u_i\), inserts \(u_i\), and changes root slice. A switch centered at \(r\) can occur only in the root-absent slice with exactly two occupied neighbors, say \(u_i,u_j\); it removes those two branch roots and inserts \(r\). All other branch roots must already be absent. These boundary switches change the slice and can alter the root-supported tag term; the root-centered switch couples the two affected branch factors. These facts rule out a direct product of independent branch transport problems without a boundary-state argument.

## The exact missing lemma

A sufficient next result would prove, for every rooted tree and every fixed selector \(F\), the weighted Hall inequalities
\[
 \sum_{B\in X}w_F(B)\leq\sum_{D\in N(X)}w_F(D)
\]
for all subsets \(X\) of its independent \((p+1)\)-sets, where \(N(X)\) is formed using the full deletion-plus-legal-two-for-one relation above. To make the rooted decomposition useful, one needs a valid compression/uncrossing that reduces arbitrary \(X\) to a tractable family while preserving (i) rank, (ii) fixed selected-tag weights, (iii) root boundary occupancy and root-supported tag activation, and (iv) all root-centered switch edges and their shared lower capacities. No such compression is established here. A decomposition by root occupancy alone is not enough, since arbitrary cuts can select only some interior states in each branch fiber and multiple branch pairs can compete for the same lower states.

This lemma is stronger than the scalar inequality \(S(T,p)\leq0\), since the latter only compares total upper supply with total lower capacity. Exact finite max-flow results, including the three supplied \(T_m\) cases, do not supply the universal uncrossing or injection.

## Evidence and limitations

The product decomposition and weight formula above are proved directly from the tree components and the definition of \(w_F\). This work used no exhaustive census, no imported theorem, no Lean build, and no claim of universal Hall feasibility. The packet's common-source hashes were checked: 115/115 matched. No case-specific worker files were allocated in C3-T2.json.
