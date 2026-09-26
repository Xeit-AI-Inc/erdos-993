# C2-U3 evidence notes

The shell parameters are `k=p-1`, `|T|=2p+2`, and `|H_v|=|T|-2=2p=2k+2`. For an original leaf `v` and its original support `s`, `H_v=T-{v,s}`, `R_v=T-N_T[s]`, and `W_v=N_T(s)\\{v}`. Since `H_v-W_v=R_v`, subtraction of independence counts is exactly counting sets meeting `W_v`.

In a tree, the components left after deleting `s` each contain at most one neighbor of `s`; otherwise there is a cycle. Deleting the leaf `v` leaves exactly one marked vertex in each component of `H_v`. Every isolated component is therefore a marked singleton. For any ordering of marks, a set meeting `W_v` has a unique earliest mark `w_i`; its remaining vertices avoid `N[w_i]` and all earlier marks, which proves `q_j=sum_i i_(j-1)(J_i)` without assumptions on later marks.

For a graph `J` with `N` vertices, each independent `k`-set has `k` deletions to independent `(k-1)`-sets. Each independent `(k-1)`-set has at most `N-k+1` possible one-vertex extensions, before imposing independence. Hence `k i_k(J)<= (N-k+1)i_(k-1)(J)`. The signs and the order-`2k` excess bound in the report follow by substituting `N<=2k-1` and `N=2k` respectively.

The chosen ordering makes the boundary enumeration exhaustive: first-root closed neighborhood has size two exactly when its degree is one; an isolated second mark is disjoint from the first root; later non-isolated roots lie in distinct forest components; and at index three or later the earlier marks alone contribute at least two distinct deletions in addition to the current mark. This proves the stated order bounds for all `J_i`.

For the excluded edgeless `H_v` case, connectivity forces all vertices other than `v,s` to be adjacent to `s`, so `T` is a star. Its polynomial at this shell is `(1+z)^(2p+1)+z`. For `p>=3`, the perturbation `+z` does not alter differences at ranks `j>=2`; the binomial sequence of order `2p+1` first decreases at `j=p+1`. Thus `x(T)=p+1`, incompatible with `x(T)+2<=p`.
