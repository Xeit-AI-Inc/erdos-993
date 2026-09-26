# C2-U2 search report

## Result

I independently audited the proposed proof of `E993-MARKED-ISOLATE-ORDER-BAND` at its exact generic graph scope. The proof is valid as an informal argument; no correction to the registered statement is needed. The key boundary step at `m=2k+1` is that the open-neighborhood sum pays for every marked k-set containing a non-isolate, while adjoining one fixed non-isolate injects the remaining all-isolate sets into upper sets counted by the multiple-mark correction.

## Exact statement

Let `G` be a finite simple graph with `m` vertices, let `W` contain every isolate of `G`, and let `k>=2` with `m<=2k+1`. Let `q_j` be the number of independent j-subsets meeting `W`. Then `q_(k+1)<=q_k`.

## Proof audit

For a marked independent k-set `A` (that is, `A` meets `W`), put `b(A)=|N_G(A)|`, where `N_G(A)` is the union of open neighborhoods. Since `A` is independent, `N_G(A)` is disjoint from `A`; exactly `m-k-b(A)` vertices can be added to `A` while preserving independence. Let `B=sum_A b(A)`. Let `C` count each independent (k+1)-set meeting `W` in at least two vertices once.

Count pairs `(A,y)` with `A` a marked independent k-set and `y` addable to `A`. An upper set with exactly one vertex in `W` contributes `k` such pairs, since precisely its marked-vertex deletion preserves a mark. An upper set with at least two vertices in `W` contributes `k+1`. Hence

`k*q_(k+1)+C=(m-k)*q_k-B`,

and therefore

`k*(q_(k+1)-q_k)=(m-2k)*q_k-B-C`.

Both `B` and `C` are nonnegative. If `m<=2k`, the right side is nonpositive, proving the result.

Suppose `m=2k+1`. Call a marked k-set bad if `b(A)=0`, and good otherwise. The equality `b(A)=0` says every vertex of `A` is an isolate. Since all isolates lie in `W`, every such k-set is indeed marked. Each good set has integer `b(A)>=1`, so `B>=#good`.

If `G` has a non-isolated vertex `y`, map every bad `A` to `A union {y}`. A bad set contains only isolates, so this union is independent; also `y` is not in `A`. Its upper set has at least `k>=2` vertices in `W`, so it contributes to `C`. The map is injective because deleting the fixed vertex `y` recovers `A`. Thus `C>=#bad`. Since the good and bad sets partition the `q_k` marked k-sets, `B+C>=q_k`. At `m=2k+1` the identity reduces to `k*(q_(k+1)-q_k)=q_k-B-C<=0`; as `k>0`, this gives the claimed inequality.

If `G` has no non-isolated vertices, it is edgeless and `W=V(G)`. Every k-subset and every (k+1)-subset is independent and meets `W`. Complementation in the `(2k+1)`-vertex set bijects k-subsets with (k+1)-subsets, so `q_(k+1)=q_k`.

This also covers empty marked families: the sums and both counts are zero where applicable. The argument uses no bipartiteness, tree, selector, or first-descent hypothesis.

## Scope and limitations

This establishes only the stated generic marked-isolate order band, as a proposed informal result. The condition `k>=2` is used in the boundary injection to make its image have at least two marks. No transfer to a leaf-specific statement or to the lower-region favorable-leaf aggregate is claimed. No Lean formalization or external theorem is used.
