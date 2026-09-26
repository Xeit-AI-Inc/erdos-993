# C5-T5 search report

## Result: unsigned incidence rank on tagged matching blocks

This route constructs an unsigned inclusion map on a restricted matching class. It proves injectivity on a strict low-rank window. It does not prove the lower-region aggregate or a cross-tag capacity inequality for general leaf-deletion forests.

Let `J_h` be a disjoint union of `h` edges, with no isolated vertices. Write `Omega_r` for its independent `r`-sets. Let `V_r` be the real vector space with basis `Omega_r`, with the basis orthonormal. Define the unsigned up map

`U_r : V_r -> V_(r+1)`,  `U_r[A] = sum_(z addable to A) [A union {z}]`,

and let `D_(r+1)=U_r^*` be the down map. For an occupied edge of `A`, replacing its chosen endpoint by the other endpoint gives another member of `Omega_r`. Let `R_r` be the adjacency operator that sums these endpoint swaps.

For every basis vector `[A]`, the diagonal coefficient of `D_(r+1)U_r` is `2(h-r)`, while that of `U_(r-1)D_r` is `r`. Their off-diagonal coefficients cancel except for endpoint swaps: a swap can occur after deleting an occupied endpoint and then adding its mate, but that mate was not addable before the deletion. Consequently,

`D_(r+1)U_r - U_(r-1)D_r = (2h-3r) I - R_r`.

The swap graph on `Omega_r` is a disjoint union of `r`-dimensional hypercubes, one for each choice of the `r` occupied edges. It is `r`-regular, so the symmetric adjacency operator satisfies `||R_r|| <= r`. Thus for every `f in V_r`,

`||U_r f||^2 - ||D_r f||^2 = <((2h-3r)I-R_r)f,f> >= (2h-4r)||f||^2`.

For integer `r < h/2`, the right side is strictly positive for nonzero `f`, proving that `U_r` is injective and has rank `|Omega_r| = binom(h,r) 2^r`.

### Leaf-tag enlargement and marked columns

For a finite tag set `L`, suppose each tag `v` has a graph `H_v` isomorphic to `J_(h_v)`. Retain the tag in both bases and define

`Psi_r : direct_sum_(v in L) V_r(H_v) -> direct_sum_(v in L) V_(r+1)(H_v)`

as the block-diagonal unsigned inclusion map, with arcs `(v,A) -> (v,A union {z})` for each actually addable `z`. If `r < min_(v in L) h_v/2`, every block is injective, so `Psi_r` is injective and its rank is `sum_v binom(h_v,r)2^r`. Tags remain distinct even if their original leaves share a support. For any marked sets `W_v subset V(H_v)`, the span of independent `r`-sets meeting `W_v` is a subspace of the domain; its restriction remains injective. Each such column maps only to supersets still meeting `W_v`.

This is a rank statement for a tagged unsigned incidence relation. It does not identify the distinct tag blocks, give a matching across different tags, or imply Hall capacity after those blocks are merged. It also does not bound the difference between single-marked and multiply-marked upper sets in the primary budget. In particular, injectivity is not the inequality `sum(D_v+C_v) >= (2a+1-3p) sum q_v(p-1)`.

## Relation to the registered target and gaps

For the target, `H_v=T-{v,s_v}` and `W_v=N_T(s_v)\\{v}` vary with the original leaf tag, and the selected set is the strict original selector `F(T,p)`. This route has not proved that all selected `H_v` lie in the matching class, nor that the rank condition `p-1 < h_v/2` follows from `x(T)+2<=p` and `3p<2 alpha(T)+1`. Even when the local matching hypotheses hold, the block-diagonal map keeps tags separate, while the primary assertion asks for a global signed budget over all favorable tags. The result therefore supplies a concrete unsigned rank lemma, not a proof or refutation of the primary assertion.

No tree counterexample, complete favorable selector, or full positive aggregate was found or claimed. No external theorem or computation is used. The result is an elementary restricted operator identity with its proof and exact graph/rank scope above.
