# C2-U4 evidence: weighted flow/cut equivalence

Let `I_r(T)` denote the independent `r`-sets, with integer zero extension for coefficient counts. Fix the original set `F(T,p)` selected by `Delta_p(T-v)<0`; do not vary it between the two ranks. For each `v in F`, define `H_v`, `R_v`, and `W_v` as in the solution contract. The elementary set identity `H_v-W_v=R_v` implies

`q_v(j)=i_j(H_v)-i_j(R_v)=|{A in I_j(H_v): A intersect W_v is nonempty}|`.

The map `A -> A union {v}` is a bijection from this set onto the sets `B in I_(j+1)(T)` satisfying `v in B` and `(B minus {v}) intersect W_v != empty`. It is injective by deletion of `v`; the reverse implication uses that `v` is a leaf and `A subset H_v`, hence `s_v notin A`. Counting `(v,B)` pairs, with `v` retaining its original identity even for equal supports, proves

`sum_(v in F) q_v(j)=sum_(B in I_(j+1)(T)) w_F(B)`.

Then the summand identity `Delta_(p-1)(H_v)-Delta_(p-1)(R_v)=q_v(p)-q_v(p-1)` proves the global two-layer formula for `S`.

For a finite bipartite deletion graph with upper side `L=I_(p+1)(T)`, lower side `R=I_p(T)`, and adjacency `A subset B`, let upper supplies and lower capacities be the nonnegative integers `u(B)=w_F(B)` and `c(A)=w_F(A)`. Standard max-flow/min-cut applies to source arcs of capacity `u`, deletion arcs of capacity `M=sum_L u+sum_R c+1`, and sink arcs of capacity `c`. A cut with source-side upper set `X` has finite minimum capacity `sum_(B notin X)u(B)+sum_(A in N_-(X))c(A)`; any cut crossing a deletion arc has capacity at least `M`, strictly greater than total source supply, so cannot obstruct saturation. Thus a saturating flow exists iff `u(X)<=c(N_-(X))` for every `X subseteq L`. Integer capacities give an integer flow. If total supply is zero, the zero flow handles the empty case.

This exact equivalence is the evidence for the route's certificate characterization. It is a finite combinatorial reduction, not evidence that all its cuts hold for eligible trees, and not evidence that a cut failure exists in an eligible tree. Even if the full-layer cut holds, proper-cut validity remains necessary for this flow method; only scalar `S<=0` is the original desired conclusion.
