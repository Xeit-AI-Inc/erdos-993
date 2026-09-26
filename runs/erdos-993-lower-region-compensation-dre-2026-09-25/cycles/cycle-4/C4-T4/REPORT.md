# C4-T4 report: a cross-tag relative-boundary operator

## Result

I reformulate the selected sum as the rank difference of an aggregate relative simplicial chain space and give one fully specified linear map that can transfer a tag when a deletion destroys its marked condition. Injectivity of this map would prove the target. I have not proved injectivity or found a counterexample to it, so this is a proposed mechanism only; the registered lower-region aggregate remains unresolved by this route.

## Exact scope and algebra

Let `T` be a finite ordinary tree, `a=alpha(T)`, and `x` its first negative forward difference using zero extension as in the contract. Take an integer `p` satisfying `x+2<=p` and `3p<2a+1`, and retain the fixed set `F={v original leaf: Delta_p(T-v)<0}`. For each original leaf `v` (including each leaf separately when supports are shared), put `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, and `R_v=H_v-W_v`. Set `k=p-1`.

For `j>=0`, let `K_j` be the rational vector space with basis the tagged pairs `(v,A)` where `v in F`, `A` is an independent `j`-set of `H_v`, and `A` meets `W_v`. This is the degree-`j` relative simplicial chain space of the pair `(Ind(H_v),Ind(R_v))`, summed over the fixed leaf tags. Thus `dim K_j = sum_{v in F} q_v(j)` where `q_v(j)=i_j(H_v)-i_j(R_v)`. Since `R_v` is the induced subgraph deleting `W_v`, the counted difference is exactly the independent sets meeting `W_v`, with no overlap correction.

The contract's summand identity gives

`S(T,p)=dim K_{k+1}-dim K_k`.

Consequently any injective linear map `K_{k+1}->K_k` proves `S(T,p)<=0`. This is a sufficient bridge, not an equivalence: failure of injectivity alone would not show a positive rank difference. The selector is held fixed throughout; no tag is added or removed because its favorable condition is recomputed.

## Explicit tag-changing map

Fix once and for all the natural order on the original vertices of `T` (or supply any total order as part of the map data). For a basis pair `(v,A)` of `K_{k+1}`, order the elements of `A` by that order. For each `u in A`, put `B=A\{u}` and assign a tag `tau_v(B)` by this rule:

1. If `B` meets `W_v`, set `tau_v(B)=v`.
2. Otherwise, if there is a `w in F` for which `B` is an independent set of `H_w` and meets `W_w`, set `tau_v(B)` to the least such `w` in the fixed order on original leaves.
3. If no such `w` exists, omit this deletion term.

Define

`L(v,A)=sum_{u in A: tau_v(A\{u}) exists} (-1)^(position(u,A)-1) (tau_v(A\{u}), A\{u})`.

Every displayed output is a basis element of `K_k`, so this defines a rational linear map `L:K_{k+1}->K_k`. It is block-preserving when deleting `u` leaves the original tag valid, and transfers the tag only when the deletion removes the sole `W_v` element. The least-tag convention makes the rule single-valued even if several other favorable leaves could mark the same face. Distinct deletions from a fixed input have distinct underlying `B`; collisions can nevertheless occur between different input pairs, so column-wise nonzero images do not imply injectivity.

The exact missing property for this candidate is `rank_Q(L)=dim K_{k+1}` for every eligible `(T,p)`. A stronger combinatorial route would give a system of distinct representatives assigning to each tagged `(k+1)`-face one of its displayed tagged `k`-faces, with no lower pair used twice; that would certify a full-rank minor. Neither property follows from the relative-boundary definition or from the favorable-leaf selector, and I have no proof of either. In particular, the direct-sum relative boundary that never changes tags is block diagonal, so it does not itself address the T22 obstruction recorded in the handoff.

## Checks and limits

The formal rank domains are `k=p-1>=x+1>=1`; target eligibility also gives `p>=2`. The construction uses original supports and neighborhoods, keeps every selected original leaf as its own tag, and includes precisely the strict selector `Delta_p(T-v)<0` in `F`. If `F` is empty, both aggregate chain spaces are zero and the target is immediate. If `F` is nonempty, the only conclusion here is the exact rank-difference representation and the conditional injectivity bridge. No finite census, literature theorem, global budget, or universal sign is claimed.
