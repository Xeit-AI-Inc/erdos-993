# C1-U3 search report: tagged layer transport

## Exact target and scope

Let `T` be an ordinary finite tree, `a=alpha(T)`, `x` the first strict descent computed through the zero-extended rank `a`, and let `p` satisfy `x+2<=p` and `3p<2a+1`. The selected set is the fixed original-leaf set `F={v: Delta_p(T-v)<0}`. For each selected original leaf `v`, put

- `H_v=T-{v,s_v}`,
- `W_v=N_T(s_v)\\{v}`,
- `R_v=H_v-W_v`,
- `h=a-1`, `k=p-1`, and
- `q_v(j)=i_j(H_v)-i_j(R_v)`, the number of independent `j`-sets of `H_v` meeting `W_v`.

Every `v` remains a distinct tag, including leaves sharing a support.

## Exact layer-count reformulation

Since `Delta_k(H_v)-Delta_k(R_v)=q_v(k+1)-q_v(k)`, the complete selected sum is exactly

`S(T,p)=sum_{v in F}(q_v(k+1)-q_v(k))`.

Thus the primary is equivalent to the aggregate tagged layer inequality

`sum_{v in F} q_v(k+1) <= sum_{v in F} q_v(k)`.

This reformulation keeps the original selector: no leaf is selected by a condition on `H_v` or on a support fibre.

The supplied bipartite tagged-incidence identity gives a second exact expression. For every row `v`, let `e_v(A)` be the number of actual vertices addable to a marked independent `k`-set `A` in `H_v`, `D_v=sum_A(2(h-k)-e_v(A))`, and `C_v` count each independent `(k+1)`-set meeting `W_v` at least twice once. Then

`sum_A e_v(A)=k q_v(k+1)+C_v`,

`D_v+C_v=2(h-k)q_v(k)-kq_v(k+1)`, and, because `2(h-k)-k=2a+1-3p`,

`k(q_v(k+1)-q_v(k))=(2a+1-3p)q_v(k)-(D_v+C_v)`.

Summing this equality over the unchanged `F` recovers the contract's identity. The positive lower-region coefficient is therefore exactly a layer-growth budget; nonnegativity of `D_v,C_v` alone supplies no such budget.

## Fractional transport formulation

Construct a finite bipartite graph `G_F` with left side `U` and right side `L`:

- `U` has one node `(v,B)` for every `v in F` and every independent `(k+1)`-set `B` of `H_v` meeting `W_v`;
- `L` has one node `(v,A)` for every `v in F` and every independent `k`-set `A` of `H_v` meeting `W_v`;
- connect `(v,B)` to `(v,A)` exactly when `A subset B`.

The `v` tag on both sides is mandatory; no cross-leaf edge is asserted. Give each left node unit demand and each right node unit capacity. The fractional transport feasibility LP is

`sum_{A: A subset B, A meets W_v} z_(v,B),(v,A)=1` for each `(v,B) in U`,

`sum_{B: A subset B} z_(v,B),(v,A)<=1` for each `(v,A) in L`,

`z>=0`.

A feasible solution transports every selected upper-layer configuration to lower-layer configurations without overusing any lower node. Summing its constraints proves `|U|<=|L|`, exactly the desired aggregate layer inequality. The LP is a sufficient certificate, not an equivalent reformulation: the scalar cardinality inequality can hold even when no matching exists.

Because this is a bipartite incidence graph, the unit-capacity matching theorem gives an exact dual obstruction to this certificate: a set `X subset U` with `|N(X)|<|X|`. Equivalently, max flow is below `|U|`. Such a deficient set only rejects this transport proof; it does not make `|U|>|L|`, and so it does not refute the primary. The common handoff explicitly warns that universal Hall/SDR slot dominance is already refuted. This construction claims no universal Hall property.

A weighted version uses a nonnegative demand `w_(v,B)` and lower capacities `c_(v,A)` with flow conservation and capacity bounds. Any feasible flow certifies `sum_U w <= sum_L c`. For the exact target the unweighted choice `w=c=1` is the natural instance. Choosing other weights would need a proved conversion back to the unweighted count target; none is supplied here.

## Tree-realizability and selector fence

An abstract pair of layer profiles `(q_v(k),q_v(k+1))`, an abstract deficient Hall set, or arbitrary bipartite marked graph data do not constitute a counterexample. A primary witness must come from one connected ordinary tree `T`, with all rows induced by its original leaves and their original supports; the same `a` and `x` must satisfy both strict rank guards; `F` must be exactly the leaves satisfying `Delta_p(T-v)<0`; and all same-support leaves must remain separate summands. Conversely, to use this transport as a proof, feasibility must be established for the disjoint union of the tagged row graphs for every such eligible tree and its exact selected set. No such universal feasibility theorem is proved here.

No finite computation, external theorem, or imported profile is used in this report. This is an exact reformulation and a sound sufficient-certificate scheme, with its dual obstruction characterized, but it leaves the primary OPEN. In particular, failure of the stronger Hall certificate is not an eligible positive full-sum witness.
