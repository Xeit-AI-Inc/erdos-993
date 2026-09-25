# C2-T3 search report — orientation T

**Proposed worker result only.** I find an end-to-end proof of the unchanged primary. The argument proves three exact steps: a tagged independent-set shadow inequality for bipartite graphs; its high-rank leaf-deletion consequence; and the fact that first-interior eligibility for a tree forces `alpha >= 7`. Combining them bounds every original-leaf summand, so it also bounds the strict-selector subset with all tags and multiplicities retained. This report proposes proofs; it does not award registry status or replace the required gate.

## 1. Tagged shadow count

Let `H` be a finite bipartite graph, `W subseteq V(H)`, and `a=alpha(H)`. Write `q_j` for the number of independent `j`-subsets of `H` meeting `W`, with all counts zero outside the feasible rank range. For `1 <= k <= a`, count pairs `(A,B)` with `A subset B`, `|A|=k`, `|B|=k+1`, and both independent and meeting `W`.

Each `B` contributes at least `k` pairs: if `B` meets `W` once, delete any of its other `k` vertices; if it meets `W` at least twice, all `k+1` deletions retain a point in `W`. Thus there are at least `k q_(k+1)` pairs.

For fixed `A`, every possible added vertex lies in the induced bipartite graph `Q=H[V(H) \\ (A union N_H(A))]`. Every independent `U` in `Q` is disjoint from `A` and `A union U` is independent in `H`, so `alpha(Q) <= a-k`. A bipartite graph on `m` vertices has an independent color class of size at least `m/2`, hence `|V(Q)| <= 2 alpha(Q) <= 2(a-k)`. Requiring the extension still meet `W` can only reduce its number. Summing over the `q_k` choices of `A` gives

`k q_(k+1) <= 2(a-k) q_k`.

If `k>a`, both `q_k` and `q_(k+1)` are zero, so the same zero conclusion is available whenever it is needed outside the displayed lemma's rank range. At `k=a`, the bound also reads correctly and `q_(a+1)=0`. This is a count comparison, not a pointwise bound on extensions of each tagged set.

## 2. High-tail sign for an original leaf

Let `G` be finite bipartite with an original degree-one vertex `v`, support `s`, and `a=alpha(G)`. Put `H=G-{v,s}`, `W=N_G(s) \\ {v}` as a subset of `H`, and `R=H-W`. These are induced subgraphs, `R=G-N_G[s]`, and `H` is bipartite. Since `v` is nonadjacent to every vertex of `H`, adjoining `v` to a maximum independent set of `H` proves `alpha(H) <= a-1`.

For every integer `j>=0`, independent `j`-sets of `R` are exactly the independent `j`-sets of `H` avoiding `W`. Thus `q_j=i_j(H)-i_j(R)`, where `q_j` is the tagged count above. With zero extension and integer differences,

`Delta_(p-1)(H)-Delta_(p-1)(R) = q_p-q_(p-1)`.

Suppose `p>=2` and `3p >= 2a+1`; set `k=p-1>=1`. The guard gives `3k >= 2(a-1) >= 2 alpha(H)`, so `k >= 2(alpha(H)-k)`. If `k>alpha(H)`, both tagged counts in question vanish. Otherwise apply the tagged shadow count and the last inequality:

`k q_p <= 2(alpha(H)-k) q_k <= k q_k`.

Since `k>0`, `q_p<=q_(p-1)`. For the remaining case `p=1`, the guard gives `a<=1`; the leaf edge gives `a>=1`, hence `a=1`. Then `alpha(H)<=0`, so `H=R` is empty and `q_1=q_0=0`. The same sign follows. Therefore the single original-leaf term is nonpositive for every `p>=1` in the stated high tail, without any selector or residual assumption.

## 3. Eligibility excludes `alpha<=6`

Let `T` be a finite connected tree, `a=alpha(T)`, `p=a-2`, and assume `x(T)+2<=p`, with `x` the first strict negative forward-difference index. Since `x>=0`, `p>=2` and `a>=4`. Also `n=|V(T)|>=a+1`: under `a>=4` the tree has an edge, so no independent set contains every vertex.

For every tree, `i_0=1`, `i_1=n`, `i_2=binom(n,2)-(n-1)=binom(n-1,2)`, and therefore `Delta_0=n-1`. The `i_2` identity removes the `n-1` edge-containing pairs; two distinct vertices in a simple graph form at most one edge. Thus `Delta_0>0` in all cases here.

If `a=4`, eligibility says `x<=0`, contradicting `Delta_0>0`.

If `a=5`, then `p=3` and `x<=1`. Since `n>=6`, `Delta_1=binom(n-1,2)-n>0`: at `n=6` it is `4`, and its increment as `n` increases is `n-2>0`. Together with `Delta_0>0`, this contradicts `x<=1`.

If `a=6`, then `p=4` and `x<=2`; `n>=7`. For any tree, count 3-vertex subsets by their induced edges. There are `(n-1)(n-2)` edge/triple incidences. A 3-set has at most two edges, since the tree has no triangle. Each double incidence is a 2-edge wedge, and the number of wedges is `sum_u binom(deg(u),2)`. Inclusion-exclusion therefore gives

`i_3 = binom(n,3) - (n-1)(n-2) + sum_u binom(deg(u),2)`,

and hence

`Delta_2 = ((n-1)(n-2)(n-9))/6 + sum_u binom(deg(u),2)`.

For `n>=9` this is nonnegative. If `n=7`, an independent 6-set exists because `a=6`; its one-vertex complement covers every tree edge, so `T=K_(1,6)`. The degree-square sum is `binom(6,2)=15`, giving `Delta_2=-10+15=5`. If `n=8`, the complement `{u,w}` of an independent 6-set is a vertex cover of the 7 edges, so `deg(u)+deg(w)>=7`. For positive integers with sum at least 7, `binom(deg(u),2)+binom(deg(w),2)>=9` (the minimum is at split `3+4`). The other degree-square terms are nonnegative, so `Delta_2>=-7+9=2`. In every order, `Delta_2>0` or `Delta_2>=0`; along with `Delta_0,Delta_1>0`, this contradicts `x<=2`. Thus `a` cannot be 4, 5, or 6, and `a>=7`.

## 4. Primary conclusion with the exact selector

For an eligible tree, `a>=7` and `p=a-2`; consequently `3p=3a-6>=2a+1`. Trees are bipartite, so Section 2 applies separately to **each** original degree-one vertex `v`, with its own `H_v`, `W_v`, `R_v`, and tagged counts. It yields

`Delta_(p-1)(H_v)-Delta_(p-1)(R_v) <= 0`

for every original leaf, whether or not `Delta_p(T-v)<0`. In particular it holds for every leaf in the exact selector `F_p(T)={v in L(T):Delta_p(T-v)<0}`. The contract sum is the sum of these integers over those leaves. A sum over an empty selector is zero; otherwise it is a finite sum of nonpositive integers and is nonpositive. Each original leaf is summed as its own tagged vertex, including distinct leaves with the same support. No residual condition, shifted rank, or selector simplification is used. This proves `S(T,p)<=0` at the original quantifiers.

Boundary checks: at `p=1` the pointwise high-tail claim has the separate `G=K_2` argument in Section 2; the primary eligibility guard itself gives `p>=2`. For `alpha=4,5,6`, the eligibility contradictions explicitly use respectively `Delta_0`, `Delta_1`, and the tree `Delta_2` formula with the order-7/8 cover cases. Ranks beyond a deletion graph's independence number have zero coefficients by definition; no terminal-rank omission or natural-number truncated subtraction is used.

## 5. Scope fences and exact larger replay

The inherited order-91 `T_22,p=34` and order-243 `T_60,p=90` positive local witnesses fail the high-tail guard; they refute lower-rank or all-window pointwise mechanisms but do not contradict this restricted implication. Their target ranks are `alpha-2` (`66` and `180`) and the pinned Cycle 1 synthesis records negative complete sums there. The Cycle 1 nonresidual eligible witnesses are also not counterexamples: the 10-vertex nonresidual witness has `S=-72`; the 12-vertex mixed residual/nonresidual witness has `S=-203`. The present proof covers both because it makes no residual assumption. The proposed positive-local boundary family at `(alpha,p)=(5,3)` and `(6,4)` falls outside eligibility; those terms do not violate the threshold. No bounded enumeration is used in the proof.

As a fresh exact falsification replay beyond the order-243 fence, `check_m200.py` constructs the tree with core path `0-1-2-3` and edges `3-(4+2j)-(5+2j)` for `0<=j<200`, order `404`. Its explicit independence-polynomial formula is

`(1+3z+z^2)(1+2z)^200 + z(1+2z)(1+z)^200`.

The script independently computes the full tree polynomial by forest tree-DP, checks that formula coefficient by coefficient, and then recomputes every deletion graph and every original-leaf selector using exact integers. It obtains `alpha=202`, `x=134`, `p=200`, so the graph is eligible; all 201 original leaves are favorable; the complete sum is `-7833822965762577593267065200163167687295739594691115072102048400`. For the leaf `0`, `H` and `R` differ by `z(1+2z)^200`; at `k=199`, the tagged-shadow count is exact equality, with both sides `31978067080753906483285045637589135790191839576277577422497382400`. This replay is a meaningful exact size check for the counting/selector bindings, not universal proof evidence. Reproduce with `python3 cycles/cycle-2/C2-T3/check_m200.py`; the JSON records the full edge list, coefficients, selectors, terms, and integers.

No owned background job was started. No Lean build, master edit, remote edit, or sibling/critic read was performed.
