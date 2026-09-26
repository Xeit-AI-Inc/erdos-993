# C2-U1 search report: ordinary-leaf order-band audit

**Authority:** proposed worker finding only. The packet has `stage=search`, `orientation=U`, and allocates the exact registered key `E993-ORDINARY-LEAF-ORDER-BAND`. Hashes of every source listed by `C2-COMMON.json` matched before review. The case packet lists no additional worker files. No Lean build or formal award was made.

## Result

The ordered-first-mark proof is valid for the registered ordinary-leaf order band, with the exact hypotheses retained:

> For every finite ordinary tree `T`, every original leaf `v` with original support `s`, and every integer `p>=3` with `|V(T)|<=2p+1`,
> `Delta_(p-1)(T-{v,s}) - Delta_(p-1)(T-N_T[s]) <= 0`,
> using integer zero-extended independence counts and original-tree neighborhoods.

No favorable-selector, alpha, first-descent, or lower-region hypothesis is needed for this pointwise statement. This finding gives only the registered order-band result; it leaves the first uncovered order and the lower-region full aggregate beyond the band undecided.

## Mathematical audit

Write `H=T-{v,s}`, `W=N_T(s)\\{v}`, and `R=T-N_T[s]`. Regard all deletions as induced subgraphs. Then `R=H-W`. For `j>=0`, let `q_j` count independent `j`-sets of `H` meeting `W`. Subtracting the sets wholly in `R` gives

`q_j = i_j(H)-i_j(R)`.

With `k=p-1`, the desired leaf expression is exactly

`q_(k+1)-q_k = q_p-q_(p-1)`.

The tree order gives `|H|=|T|-2<=2p-1=2k+1`, and `p>=3` gives `k>=2`.

### Component-root coverage

Deleting `s` from a tree separates it into one component for each original neighbor of `s`. The component containing `v` is the singleton `{v}`, since `v` is an original leaf. Deleting that component leaves precisely `H`; its remaining components are in bijection with `W`. In each such component, its corresponding neighbor `w in W` is the unique vertex adjacent to `s`: a second such vertex would create a cycle through `s`. Every vertex of the component lies in `H`, and the unique path from it to `s` passes through `w`.

Thus each component of `H` has exactly one marked root in `W`. If a component has at least two vertices, its root has an incident edge in `H`, so `W` contains a nonisolated vertex. If no component has an edge, every component is a singleton and `H` is edgeless with `W=V(H)`. The empty `H` case has `W=empty` and is handled separately below. These statements include `T=K2`.

### Ordered-first-mark partition

For a finite simple graph `G`, order its marked vertices without repetition as `W={w_1,...,w_t}`. For each `i`, define the induced residual graph

`J_i = G - (N_G[w_i] union {w_1,...,w_(i-1)}).`

Every independent set of size `j>=1` meeting `W` has a unique least-indexed marked vertex `w_i`. Removing `w_i` leaves an independent `(j-1)`-set in `J_i`. Conversely, adjoining `w_i` to any independent `(j-1)`-set in `J_i` gives a set whose first marked vertex is `w_i`. Later marks remain available if nonadjacent; they must not be deleted. This proves the disjoint ordered partition

`q_j = sum_(i=1)^t i_(j-1)(J_i)`.

For `W=empty`, both sides are zero. The leaf case has `j=k+1` and `j=k`, both positive since `k>=2`.

### Unmarked adjacent-rank shadow lemma and its guards

For a finite simple graph `J` of order `N` and integer `k>=1`, double-count pairs `(B,u)` with `B` an independent `(k-1)`-set and `u` an addable vertex outside `B`. Every independent `k`-set contributes exactly `k` pairs by deleting one of its vertices. Each lower set has at most `N-k+1` possible extensions, so

`k*i_k(J) <= (N-k+1)*i_(k-1)(J)`

when `N>=k-1`. If `N<k-1`, both ranks exceed `N`, so both counts are zero. Consequently, if `N<=2k-1`, then `i_k(J)<=i_(k-1)(J)`: in the nonzero-domain case `N-k+1<=k`, and `k>0`; in the remaining case use zero counts. This split is important for a natural-number formalization: it avoids treating a negative extension bound as a cardinality.

### Nontrivial-component case

If `H` has an edge, component-root coverage supplies a nonisolated marked vertex; order it first, say `w_1`. For `J_1`, the closed neighborhood of `w_1` removes at least two vertices. For every `i>=2`, the deleted union contains the two distinct marked vertices `w_1,w_i`, whether or not they are adjacent. Therefore, with `m=|H|<=2k+1`, each `J_i` has order at most `m-2<=2k-1`.

Apply the unmarked shadow lemma to every `J_i`, then sum the termwise inequalities in the ordered partition:

`q_(k+1)=sum_i i_k(J_i) <= sum_i i_(k-1)(J_i)=q_k`.

The argument also covers a one-component `H` (there are no later terms), and empty or out-of-range residual ranks by the shadow lemma's zero-count case.

### Edgeless and empty cases

If `H` is edgeless and nonempty, component-root coverage gives `W=V(H)`. Thus `q_j=binom(m,j)` with `m=|H|`, including zero extension. Since `m<=2k+1`, the adjacent binomial layers satisfy `binom(m,k+1)<=binom(m,k)`: when `m<k`, both are zero; otherwise the standard ratio is `(m-k)/(k+1)<=1` (and this also covers `m=k`). Hence `q_(k+1)<=q_k`.

If `H` is empty, then `R` is empty and `q_k=q_(k+1)=0` because `k>=2`; the leaf expression is zero. A one-vertex tree has no degree-one original leaf, so it creates no leaf instance.

Together these cases prove the exact pointwise expression is nonpositive. The proof does not select leaves, so summing it over any fixed selected subset is valid in the same order band, but that corollary is not a result for trees outside the band.

## Lean-ready lemma list

The following interfaces are sufficient to formalize the proof; all graph counts can be `Nat` and the final difference can be compared by `Nat.le` or embedded into `Int`.

1. **Original deletion identities.** Define `H`, `R`, and `W` from `T,v,s` using original adjacency. Prove `R = H inducedOn (univ \ W)` and `q_count_split`: `markedIndependentCount H W j = indepCount H j - indepCount R j` (or an equivalent disjoint-union cardinal identity avoiding truncated subtraction).
2. **Component-root coverage.** In a connected acyclic finite simple graph with degree-one `v` and unique neighbor `s`, show every component of `H=T-{v,s}` contains exactly one vertex from `W=N_T(s)\\{v}`; prove `W` nonempty roots have the stated bijection, roots are unique by acyclicity, and a component with more than one vertex has a nonisolated root. Handle `H=empty` explicitly.
3. **Ordered partition.** For a duplicate-free list enumerating `W`, prove `markedCount G W j = sum_i indepCount (deleteClosedNeighborhoodAndEarlierMarks G w_i i) (j-1)` for `j>=1`; establish disjointness by the unique first mark and leave later marks undeleted. Add the empty-list simp case.
4. **Unmarked shadow incidence.** For `k>=1` and `N>=k-1`, prove `k * i_k <= (N-k+1) * i_(k-1)` by counting `(lower independent set, addable vertex)` and using exact `k` deletions of every upper set. Keep coefficients in `Nat` and make the `N>=k-1` guard explicit.
5. **Unmarked adjacent-rank corollary.** Derive `i_k<=i_(k-1)` from the incidence lemma under `N<=2*k-1`; split `N<k-1` and discharge it from both counts being zero. Do not invoke the incidence inequality outside its natural-number domain.
6. **Residual-order bounds.** Show `card(J_1)<=m-2` when the first mark is nonisolated; for `i>1`, `card(J_i)<=m-2` because two distinct marks are deleted. Combine with `m<=2*k+1` to derive `card(J_i)<=2*k-1`.
7. **Edgeless marked case.** From `H` edgeless and tree component-root coverage, prove `W=univ`; reduce marked counts to binomial coefficients. Prove adjacent-binomial monotonicity for `m<=2*k+1`, splitting ranks beyond `m` as needed.
8. **Empty `H` case.** Establish both positive-rank counts vanish (or use item 7 with empty vertex type); this avoids any component-root or first-mark witness requirement.
9. **Rank and polynomial shift.** For `k=p-1`, prove `k>=2`, `card(H)=card(T)-2<=2*p-1=2*k+1`, `q_(k+1)=q_p`, and `q_k=q_(p-1)`. Reassociate the deletion count identity to obtain the registered `Delta_(p-1)` expression.
10. **Registered conclusion.** Apply `q_(k+1)<=q_k` and the rank-shift identity for each original leaf, retaining original support and original `N_T[s]`. If deriving the selected-sum order-band corollary, sum over the fixed selector only after the pointwise theorem; it does not alter the allocated pointwise key.

The interfaces deliberately separate the graph counting lemmas from the tree deletion/component facts. The most delicate formal bookkeeping is induced-subgraph cardinality and the zero-rank/out-of-range split, not a hidden mathematical premise.

## Dependency comparison with the generic marked-isolate route

The generic route works for arbitrary finite simple graphs when `W` contains every isolate and `m<=2k+1`. It counts actual addable vertices for marked lower sets, proves

`k(q_(k+1)-q_k)=(m-2k)q_k-B-C`,

then at `m=2k+1` partitions into `b(A)=0` and `b(A)>0`. The positive-neighborhood sets pay into `B`; a fixed nonisolated vertex extends each all-isolate bad set injectively into a multiply marked upper set counted by `C`. If the graph is edgeless, `W=V` and complement pairs the two layers. This has broader scope than the leaf proof, but needs the extension-incidence identity, exact once-per-upper-set correction `C`, good/bad partition, injection recovery argument, isolate coverage, and edgeless complement case.

The ordered-first-mark route is shorter for the ordinary-leaf specialization: tree geometry gives a marked nonisolated root whenever `H` has an edge, after which the ordinary unmarked adjacent-rank shadow lemma applies term by term; the edgeless case is direct. Its generic sufficient condition is that `W` contain a nonisolated vertex, not the isolate-coverage condition. It therefore does not replace the generic marked-isolate theorem on arbitrary graphs (for example, it gives no first nonisolated mark when all marks are isolates and a separate nonisolated component exists). Conversely, the generic route's proof does not need rooted tree components. This is a dependency comparison only, not an estimate of actual Lean effort or a formal result.

## Limitations

- Informal proof audit only; no Lean file, build, kernel check, or formal award.
- The registered scope keeps `p>=3` and `|T|<=2p+1`; the proof may suggest broader cases, but none are proposed here.
- This pointwise order band neither proves the first shell `|T|=2p+2` nor the unrestricted lower-region aggregate.
- No public-literature theorem was needed. No new computation was run.
