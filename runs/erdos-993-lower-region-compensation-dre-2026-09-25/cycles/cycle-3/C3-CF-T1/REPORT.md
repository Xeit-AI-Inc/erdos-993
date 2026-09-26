# C3-T1 cross-orientation critique (F)

## Disposition

**Retained_narrowed.** The first-mark residual-size criterion is a valid sufficient subclass result. The claimed cover-number coefficient lower bound is false as stated, so it and the conclusions depending on it are excluded from the retained scope. The route's combined claim is therefore narrowed to the first-mark subclass only.

## Cover-budget derivation: rejected component

The coefficient decomposition itself is exact: fixing an independent set `X` in a vertex cover `C`, the allowed vertices outside `C` form an independent set of size `b_X`, giving `z^|X|(1+z)^b_X`. The subsequent lower bound mishandles the endpoint `a=r+1`. There `s=r-a=-1` and `d_{-1}(b)=1`; its contribution is positive once per *independent* `(r+1)`-set in `C`, not once per arbitrary subset of `C`. Replacing the actual count by `binom(c,r+1)` is an upper bound on a positive contribution and cannot establish a lower bound.

A four-vertex star gives an exact failure, even with a tree and a valid cover. Take `C=V(T)`, so `c=4,N=0`, and take `r=1`. The independence counts are `i_0=1,i_1=4,i_2=3`, hence `Delta_1=-1`. The proposed expression is `d_1(0)+binom(4,1)m_0(0)+binom(4,2)m_0(-1)=0-4+6=2`, since `m_0(0)=-1` and `m_0(-1)=1`. It asserts `-1>=2`, which is false. Thus neither the displayed bound nor its claimed necessary condition for early descent is established.

A repair would need the actual number of independent `(r+1)`-subsets of `C` for this endpoint (and then re-state and re-check the result); this critique does not rely on such a repair. The counterexample concerns the auxiliary bound only. It is not an eligible counterexample to the primary aggregate and makes no claim about the primary verdict.

## First-mark residual-size criterion: retained

Fix one original leaf `v`, its original support `s`, `H=T-{v,s}`, `W=N_T(s)\\{v}`, and `k=p-1`. For any ordering of `W`, the independent sets of `H` meeting `W` partition by their first included mark `w_i`. After choosing `w_i`, the remaining vertices avoid `N_H[w_i]` and all earlier mark vertices, exactly the deletion set defining `J_i`. Therefore `q_j=sum_i i_(j-1)(J_i)` for `j>=1`, and the leaf summand is `q_(k+1)-q_k=sum_i(i_k(J_i)-i_(k-1)(J_i))`.

For a graph `J` of order `m<=2k-1`, count pairs `(A,y)` where `A` is an independent `(k-1)`-set and `y` extends it to an independent `k`-set. Each independent `k`-set contributes exactly `k` pairs; each `A` has at most `m-k+1<=k` extensions. Thus `k i_k(J)<=k i_(k-1)(J)`, including cases where either count is zero, and each residual difference is nonpositive.

In the claimed shell `|V(T)|=2p+2+d`, `d>=1`, deleting `v,s` leaves `|V(H)|=2k+2+d`. If an ordering makes each union `N_H[w_i]` with the earlier mark vertices have size at least `d+3`, every `J_i` has order at most `2k-1`; the leaf summand is nonpositive. Applying this condition to each leaf in the fixed original favorable set and summing proves `S(T,p)<=0` on that structural subclass. Repeated leaves at one support remain repeated summands; they do not change the per-tag argument.

This implication is independent of the strict selector once the selected set is fixed, but the route supplies no reason every eligible tree or every selected leaf satisfies the residual-size condition. The condition is a direct sufficient certificate when checked, but the route gives no example of an eligible tree with a nonempty favorable set satisfying it; its practical reach is therefore unestablished. It gives no reduction of the full lower-region target. The `2k` and `2k+1` residual boundary remains untreated by this criterion.

## Scope and standing controls

The route establishes no full-target proof, no target counterexample, and no census. The star above only refutes one auxiliary derivation. No literature theorem is invoked. Favorability, terminal descent, the strict alpha guard, and the complete selector are not used to show that the structural condition holds. Accordingly the registered primary aggregate remains open on this evidence. All claims here are proposed worker assessments only.
