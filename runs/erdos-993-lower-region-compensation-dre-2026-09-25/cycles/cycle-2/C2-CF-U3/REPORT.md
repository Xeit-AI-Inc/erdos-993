# C2-CF-U3 critique of C2-U3

## Coverage and disposition

This review covers exactly the two source claims `E993-LOWER-REGION-FIRST-ORDER-SHELL` and `C2-U3-ORDERED-SHELL-BOUND`.

- `E993-LOWER-REGION-FIRST-ORDER-SHELL` — **retained_narrowed**. The report establishes a valid conditional reduction for the registered shell, not the shell assertion itself. The exact retained content is: if the route's selector-conditioned inequality (Comp) holds for the fixed favorable set, then the complete shell sum is nonpositive. The primary shell assertion remains open; no refutation or proof follows from this route.
- `C2-U3-ORDERED-SHELL-BOUND` — **retained_narrowed**. The first-mark identity and the boundary-term estimate are valid per original leaf in an eligible shell tree; the selector is not needed for this per-leaf lemma. The estimate concerns the positive parts of the ordered decomposition, not the sign of the whole leaf term.

## Independent check of the ordered decomposition

Fix an original leaf `v` with its original support `s`, and put `H=T-{v,s}`, `R=T-N_T[s]`, `W=N_T(s)\\{v}`, and `k=p-1`. Since `R=H-W`, `q_j=i_j(H)-i_j(R)` counts the independent `j`-sets of `H` meeting `W`. Removing `s` from a tree leaves one branch per neighbor; after removing `v`, every component of `H` has exactly one vertex in `W`. A nontrivial component's marked vertex is non-isolated, and an isolated component is its marked singleton.

For the stated ordering `w_1,...,w_t`, a marked independent set has a unique earliest mark `w_i`. Its other vertices avoid `N_H[w_i]` and all earlier marks, and are otherwise unrestricted by later marks. Thus they are exactly the independent sets in `J_i` of one smaller size. This proves `q_j=Σ_i i_(j-1)(J_i)`, including zero-extended ranks, and subtraction at `j=k+1,k` gives

`q_(k+1)-q_k = Σ_i (i_k(J_i)-i_(k-1)(J_i))`.

Also `q_(k+1)-q_k=Δ_k(H)-Δ_k(R)`, exactly the original leaf summand. `F(T,p)` is unchanged: applying this calculation to `v∈F` and summing preserves each original leaf tag, including multiple leaves with the same support. The proof does not replace the selector by a rank-varying set.

For a graph `J` of order `N`, count deletions from independent `k`-sets and possible extensions of independent `(k-1)`-sets to obtain `k i_k(J)≤(N-k+1)i_(k-1)(J)`. This remains valid when a layer is empty, with the extension count interpreted as an upper bound. It implies `i_k-i_(k-1)≤0` for `N≤2k-1`; at `N=2k` it gives the sharper positive-part bound `[i_k-i_(k-1)]_+≤i_(k-1)/k`.

On the shell, `|H|=2p=2k+2`. In the chosen order, `J_1` has order `2k` precisely when the first non-isolated mark has degree one; otherwise it has order at most `2k-1`. If there is an isolated mark, it is second; its `J_2` has order `2k`, since it and the first mark are in distinct components. Every other `J_i` removes at least three distinct vertices: a later non-isolated mark removes itself and a neighbor, plus an earlier mark in another component; from the third index onward the current and two earlier distinct marks suffice. These cases exhaust the ordering. Therefore only the two named terms can be positive, and their total positive part is at most `(L_root+L_iso)/k`.

The edgeless case is also correctly excluded for an eligible shell. If `H` is edgeless, connectedness forces `T` to be the star centered at `s`, with `2p+1` leaves and polynomial `(1+z)^(2p+1)+z`. Since `Δ_0(T)=|T|-1>0`, eligibility gives `p≥3`. At ranks `j≥2` the added `z` does not change coefficients; for the odd binomial order `2p+1`, `Δ_p=0` and the first negative difference is `Δ_(p+1)`, so `x(T)=p+1`, contradicting `x(T)+2≤p`. Thus `H` is nonempty (indeed not edgeless) in the eligible shell. The lower-region guard is part of the registered shell scope but is not needed for the local decomposition or its boundary estimate.

## Gap in the shell assertion

For each selected leaf, write the decomposition terms as boundary and nonboundary terms. The latter are nonpositive. The displayed estimate bounds the sum of positive boundary terms by `(L_root+L_iso)/k`; it does not bound the sum of those quantities over the fixed selector. Consequently the stated (Comp), if true, is sufficient: multiplying the nonboundary slack by `k` and summing would cancel the maximum positive boundary excess. The algebra of that implication is sound, including an empty favorable set. But neither the first-descent condition nor the strict tests `Δ_p(T-v)<0` have been shown to imply (Comp). It is a real missing global bridge, not a proven inequality. A positive local term would not refute the complete sum, and no full-sum witness or exhaustive generation boundary is offered.

The local estimate is consistent with the handoff's standing controls: the positive local rows at orders 91 and 243 lie outside this shell boundary; the order-252 eligible shell row is a bounded example and does not establish the universal compensation. No supplied computation or imported theorem is needed for the retained lemmas, and none is treated as a universal result here.

## Limitations

- The exact selected-sum assertion for `|T|=2p+2` is neither proved nor refuted; (Comp) remains unproved.
- No extension to the unrestricted lower-region aggregate, pointwise signs, or support-fibre signs follows.
- This review is an informal combinatorial proof audit. It contains no code replay, census, or finite-generation claim.
