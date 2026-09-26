# Independent check of C5-T5-MATCHING-UP-RANK

Let `J_h` have edges `e_1,...,e_h`, and let `Omega_r` consist of sets choosing one endpoint from each of `r` distinct edges. In `D_(r+1) U_r[A]`, returning to `A` is possible by adding any of the `2(h-r)` vertices on unoccupied edges and deleting that same vertex. In `U_(r-1) D_r[A]`, returning to `A` is possible by deleting any of its `r` selected vertices and adding it back. The diagonal difference is therefore `2(h-r)-r = 2h-3r`.

For an off-diagonal basis set `B`, a nonzero transition changes one chosen vertex of `A`. If the replacement is on a previously unoccupied edge, both compositions have the same transition (delete the old endpoint/add the new endpoint in opposite orders), so it cancels in the difference. If it is the other endpoint of the same occupied edge, that endpoint is not addable while `A` is intact: the transition occurs in `U_(r-1)D_r` only. Thus the off-diagonal difference is `-1` exactly for endpoint swaps, and zero otherwise. This verifies

`D_(r+1)U_r - U_(r-1)D_r = (2h-3r) I - R_r`.

For each choice of the `r` occupied edges, the `2^r` endpoint choices form an `r`-cube under swaps. Hence `R_r` is a disjoint union of `r`-regular cube adjacency matrices. Since it is real symmetric, `|<R_r f,f>| <= r ||f||^2`. Adjointness gives

`||U_r f||^2 - ||D_r f||^2 = <((2h-3r)I-R_r)f,f> >= (2h-4r)||f||^2`.

When integer `r<h/2`, this is strictly positive for every nonzero `f`; therefore `U_r f` cannot be zero and `U_r` is injective. For `r=0`, the same argument uses the natural zero map `D_0:V_0 -> 0`; alternatively `U_0[empty]` is the nonzero sum of all vertices. If `h=0`, there is no integer `r` in the stated range.

A direct sum of injective maps on finitely many distinct tag blocks is injective. Restricting an injective map to any subspace, including the span of selected basis columns meeting a fixed marked set, preserves injectivity. This is a rank statement only: it does not merge tag blocks or prove a Hall/capacity inequality for a merged relation.
