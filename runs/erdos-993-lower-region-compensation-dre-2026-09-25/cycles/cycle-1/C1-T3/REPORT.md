# C1-T3: lower-region global matching / cover search

## Exact target and setup

The target is the ordinary-tree assertion that, for each finite ordinary tree `T`, `a=alpha(T)`, `x` the first strict descent of the zero-extended independence sequence, and natural `p` with `x+2<=p` and `3p<2a+1`, the sum over original leaves `v` satisfying `Delta_p(T-v)<0` of

`Delta_(p-1)(T-{v,s_v}) - Delta_(p-1)(T-N_T[s_v])`

is nonpositive. Original leaf tags are retained when supports coincide.

For a fixed selected leaf tag `v`, put `H_v=T-{v,s_v}`, `R_v=T-N_T[s_v]`, `W_v=N_T(s_v)\\{v}`, `h=a-1`, `k=p-1`, and `q_v(j)=i_j(H_v)-i_j(R_v)`. Thus `q_v(j)` counts independent `j`-sets of `H_v` meeting `W_v`.

## Exact incidence identity and cancellation

For any finite bipartite graph `H` with `alpha(H)<=h`, marked set `W`, and `1<=k<=h`, let `Q_j` count independent `j`-sets meeting `W`. For each marked independent `k`-set `A`, let `e(A)` count vertices addable to `A`, and set `D=2(h-k)Q_k-sum_A e(A)`. Then `D>=0`: write the bipartition as `X,Y`; for either part, `A` together with all vertices in that part addable to `A` is independent, so there are at most `h-k` such addable vertices in each part.

Count pairs `(A,z)` where `A` is a marked independent `k`-set and `z` is addable. Each marked independent `(k+1)`-set meeting `W` once contributes `k` pairs (delete one of its `k` unmarked vertices); each such set meeting `W` at least twice contributes `k+1` pairs. If `C` counts the latter sets once each, then `sum_A e(A)=kQ_(k+1)+C`. Consequently

`k Q_(k+1)+C=2(h-k)Q_k-D`, with `C,D>=0`.

Apply this identity to each selected `H_v,W_v`, using the fixed original selector. The contract's summand has the exact form

`k*g_v=(2h-3k)q_v(k)-(D_v+C_v)`.

Since `D_v+C_v=2(h-k)q_v(k)-kq_v(k+1)`, this simplifies to

`g_v=q_v(k+1)-q_v(k)`.

Therefore the complete target sum is exactly

`S(T,p)=sum_(v in F(T,p)) (q_v(k+1)-q_v(k))`.

This equality counts every original leaf tag separately. It does not require or imply a nonpositive summand, a nonpositive support-fibre sum, or a universal Hall condition. It also shows that proving the stated global deficit budget is precisely equivalent to proving the aggregate tagged-shadow inequality `sum_F q_v(k+1)<=sum_F q_v(k)`; the positive lower-region coefficient does not by itself provide the missing budget.

## Matching interpretation and exact gap

For each selected tag `v`, form the incidence graph between marked independent `k`-sets and marked independent `(k+1)`-sets of `H_v`, joining a lower set to an upper set when it is contained in it. A matching that injects all upper sets into lower sets would imply `q_v(k+1)<=q_v(k)` for that tag. A matching across the disjoint union of tagged incidence graphs would imply the desired global inequality. The identity above counts these incidence resources with actual addable vertices and multiply-marked upper sets counted once, but supplies no matching of the required cardinality: the sign of `q_v(k+1)-q_v(k)` is not forced by `D_v,C_v>=0` alone. In particular, the exact unclosed step is a Hall/cover bound on the union of *selected* tagged incidence graphs, or a different proof of its total cardinality inequality. No claim is made that universal Hall cuts hold; the admitted refutation fence forbids that shortcut.

The selector constrains each tag by `Delta_p(T-v)<0`, and eligibility gives `k=p-1>=x+1`; however, I found no verified implication from these constraints to the needed total incidence matching/cover inequality. Abstract matching feasibility would also need a separate realization argument if used to claim an ordinary-tree counterexample. No eligible positive complete sum or proof of the aggregate inequality is established here.

## Exact finite check

For the admitted lower-region control `T=K_(1,12)`, `a=12`, `x=6`, `p=8`, hence `k=7`, `h=11`, and all 12 original leaves are selected. For each leaf, `H_v` is the edgeless graph on 11 vertices, `W_v=V(H_v)`, and `R_v` is empty. Thus `q_v(7)=C(11,7)=330` and `q_v(8)=C(11,8)=165`; each summand is `-165` and the complete sum is `-1980`. This is a replay of a finite control, not a universal argument.

## Result and limitations

The incidence identity and cancellation are established by direct finite counting under the stated bipartite hypotheses. The primary target remains unresolved by this route. The exact remaining bridge is a global cardinality/matching inequality for the selector-weighted disjoint union of tagged incidence graphs. No literature result was imported, no bounded search is claimed, and no controller status is assigned.
