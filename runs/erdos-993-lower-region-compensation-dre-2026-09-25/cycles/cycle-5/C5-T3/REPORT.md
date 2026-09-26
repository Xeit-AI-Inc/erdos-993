# C5-T3 search report — selected matching-slack charging

## Result

I tested the proposed strategy of charging each marked independent set's addability slack solely from the maximum matching size of its ambient forest. That strategy fails even on an addability graph arising from an original leaf deletion in a small ordinary tree. The failure is caused by unmatched addable vertices. I give an exact matching decomposition that makes the missing term explicit. This is a counterexample to that particular sufficient bound, not a counterexample to the registered lower-region aggregate.

## Exact setup and obstruction

Take the ordinary tree with edges `sv, sw, sz, zy1, zy2`. Its original leaves are `v,w,y1,y2`; in particular, for leaf `v` the original support is `s`. Then

`H_v = T - {v,s}`

has vertices `w,z,y1,y2` and edges `zy1,zy2`; thus it is the disjoint union of an isolated vertex and a 2-leaf star. Its independence number is `h=3`, and its maximum matching size is `nu(H_v)=1`. The marked set determined by the original support is `W_v=N_T(s)\{v}={w,z}`.

At rank `k=1`, the marked set `A={w}` is independent and meets `W_v`. A vertex is addable to `A` if it is outside `A` and has no neighbor in `A`. Since `w` is isolated in `H_v`, all three other vertices are addable, so `e(A)=3`. Here `r=h-k=2`; the per-set slack from the contract's auxiliary identity is `2r-e(A)=1`, whereas the proposed matching-only lower bound `2(r-nu(H_v))` is `2`. Hence that bound is false. In the full marked incidence count for this example, the upper independent pair `{w,z}` is multiply marked, so it contributes once to `C`; this does not change the failure of the proposed lower bound on `D_A` itself.

This is a genuine `H_v,W_v` configuration from an ordinary tree and uses original support data. It is not an eligible primary-target row: the tree has `a=4`, and its independence counts are `(1,6,10,6,1)`, giving `x=2`; `p=k+1=2` fails `x+2<=p`, and also fails the strict lower-region guard. Thus it establishes no sign for `S(T,p)` and is not offered as a full-sum witness.

## Exact decomposition for a fixed maximum matching

Let `H` be any finite graph with a fixed maximum matching `M`, and let `A` be an independent set. Let `J_A` be the induced graph on vertices addable to `A`. Partition the edges of `M` into: `m_2(A)` edges with both endpoints in `J_A`, `m_1(A)` edges with exactly one endpoint in `J_A`, and `m_0(A)` edges with no endpoint in `J_A`. Let `u(A)` be the number of vertices of `J_A` unmatched by `M`. These are disjoint categories and every addable vertex is either an endpoint of exactly one matching edge or unmatched, so exactly

`e(A)=2m_2(A)+m_1(A)+u(A)`.

Writing `r=h-k` and `|M|=nu(H)=m_2+m_1+m_0`, the slack has the exact decomposition

`2r-e(A)=2(r-nu(H))+2m_0(A)+m_1(A)-u(A)`.

This identifies why ambient matching size alone cannot supply the desired lower bound: the potentially large `u(A)` term has the adverse sign. In `H_v` above, `m_2=0,m_1=0,m_0=1,u=3`, and the identity gives `4-3=1`.

For the actual selected family, summing the identity over every `v` in the fixed strict selector and every marked independent `k`-set `A` gives an exact expression for `sum D_v`. It does not prove the required budget, because no bound has been established here that controls the aggregate unmatched-addable term together with `C_v` by the positive coefficient `(2a+1-3p)Q`. In particular, a positive termwise or local obstruction does not refute the complete selected sum.

## Disposition and limits

The exact decomposition and finite counterexample above are established by direct counting. No public theorem is invoked. No exhaustive search was run. I did not establish a new infinite tree class, verify an eligible selector family, or prove the global inequality. The primary target and the optional global budget remain unresolved by this route. A next step would need a selector-weighted bound on `sum(u(A)-2m_0(A)-m_1(A))` that includes the multiply marked correction `C_v`, or a different charging invariant that controls unmatched addable vertices across tags.
