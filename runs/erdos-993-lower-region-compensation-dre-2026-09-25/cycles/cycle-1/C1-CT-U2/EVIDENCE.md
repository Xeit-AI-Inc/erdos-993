# Checkable audit evidence for C1-U2-1

## Exact arithmetic and domains

- `k=p-1>=1` follows from `x(T)>=0` and `x(T)+2<=p`.
- `c=2a+1-3p>=1` is an integer by `3p<2a+1`.
- In particular `p<=a`, so `k<=a-1=alpha(H_v)` and the marked rank is in range.
- `2(alpha(H_v)-k)=2((a-1)-(p-1))=2(a-p)`.
- `2(a-p)-k=2a-2p-(p-1)=2a+1-3p=c`.

## Incidence count

For fixed tag `v`, marked independent `k`-sets are counted by `q_v(k)`. Their total actual addability is

`sum_A e_v(A)=2(a-p)q_v(k)-D_v`.

Every independent `(k+1)`-set meeting `W_v` in exactly one vertex contributes `k` incidences, because deleting any of its `k` unmarked vertices leaves a marked `k`-set. A set meeting `W_v` at least twice contributes `k+1`; with `C_v` counting these sets once, the incidence total is `kq_v(k+1)+C_v`. Sets disjoint from `W_v` contribute zero. Equating the totals proves the source identity without assuming each extension has a unique marked deletion.

The leaf summand expansion is

`Delta_k(H_v)-Delta_k(H_v-W_v) = [i_(k+1)(H_v)-i_(k+1)(H_v-W_v)]-[i_k(H_v)-i_k(H_v-W_v)] = q_v(k+1)-q_v(k)`.

Thus the summed equation and both implications in the source claim follow. In the converse, the per-set bound `e_v(A)<=p-1` gives `d_v(A)>=2(a-p)-(p-1)=c`; sum over the fixed tagged domain and use `C_v>=0`.

## Standing-control check (bounded facts only)

The admitted handoff records complete sums `S=-1980` for `K_(1,12)`, `S=-498754180547001418536` for order-91 `T_22`, and `S=-1058142362147652597702654588268394677176033202323316960380` for order-243 `T_60`. These values are treated as supplied bounded control facts, not replayed. Their negative totals are compatible with the claim; the positive local terms in the latter two controls do not imply the claim's antecedent `S>0`.
