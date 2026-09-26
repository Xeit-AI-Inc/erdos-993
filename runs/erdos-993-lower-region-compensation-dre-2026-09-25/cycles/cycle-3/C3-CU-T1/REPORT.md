# C3-CU-T1 critique of C3-T1

## Reviewed claim and disposition

**Claim:** `C3-T1.COVER-BUDGET-AND-FIRST-MARK-SUBCLASS`  
**Disposition:** `retained_narrowed`  
**Proposed status:** `proposed_open`

The first-mark residual-size criterion proves the stated sufficient subclass. The cover-number coefficient bound in the same claim is false as written, so it is excluded from the retained statement. The retained result does not establish the complete lower-region aggregate.

## Decisive countercheck to the cover bound

Take `T=K2`, choose the vertex cover `C=V(T)` of size `c=2`, so `N=n-c=0`, and take `r=1`. The asserted lower bound has

- `d_1(0)=binom(0,2)-binom(0,1)=0`;
- `m_0(0)=d_0(0)=-1`;
- `m_0(-1)=binom(0,0)-binom(0,-1)=1`.

It therefore gives `L(2,2,1)=0+binom(2,1)(-1)+binom(2,2)(1)=-1`. But `i_1(K2)=2`, `i_2(K2)=0`, hence `Delta_1(K2)=-2`, which does not satisfy the asserted `Delta_1(T)>=L`; in fact `-2 < -1`.

The defect is the `a=r+1` term: its contribution is `+1` per independent `a`-set in `C`, while replacing that number by the larger `binom(c,a)` need not give a lower bound. For `a<=r`, `m_N(r-a)<=0` (the choice `b=0` gives a nonpositive value), so the upper bound `binom(c,a)` is safe for those terms. One repair is to use the actual number of independent `(r+1)`-sets of `C` for the positive term. A weaker repair is to omit that nonnegative term from the lower bound. Neither repair by itself yields the claimed closed-form cover threshold or the target inequality.

## Audit of the retained first-mark statement

For a fixed original leaf `v`, its original support `s`, `H=T-{v,s}`, and `W=N_T(s)\\{v}`, the target leaf summand is indeed

`Delta_k(H)-Delta_k(H-W)=q_(k+1)-q_k`, where `k=p-1` and `q_j=i_j(H)-i_j(H-W)`.

For an ordering `w_1,...,w_t` of `W`, the sets meeting `W` partition by their first included mark. Once `w_i` is chosen, the other vertices must avoid `N_H[w_i]` by independence and must avoid the earlier marks by firstness. Thus the residual is exactly `J_i=H-(N_H[w_i] union {w_1,...,w_(i-1)})`; earlier neighborhoods are correctly not deleted. Consequently `q_j=sum_i i_(j-1)(J_i)` for `j>=1`, and the difference is the stated sum of `i_k(J_i)-i_(k-1)(J_i)`.

For any graph `J` of order `m`, count pairs consisting of an independent `k`-set and one of its `k` deletions. The same pairs are bounded above by choosing an independent `(k-1)`-set and one of at most `m-k+1` additional vertices. Hence `k i_k(J) <= (m-k+1)i_(k-1)(J)`. If `m<=2k-1`, this implies each residual difference is nonpositive. Since `|V(H)|=2p+d=2k+2+d`, a deletion union of size at least `d+3` leaves at most `2k-1` vertices, exactly as claimed.

Applying this separately to every `v` in the fixed original favorable set `F(T,p)` proves `S(T,p)<=0` under the stated structural condition. Leaves sharing a support remain separate terms. The reduction uses the selector only to specify which original leaves are summed; it does not silently change the favorable set. The report's shell formula `n=2p+2+d` is consistent with the above `|H|=n-2` calculation.

## Scope, standing controls, and unresolved points

The sufficient condition is not shown to follow from `x(T)+2<=p`, `3p<2alpha(T)+1`, or `Delta_p(T-v)<0`. No bridge from the defective cover bound to that condition exists. The route correctly labels the arbitrary eligible-tree target unresolved. Its first-mark argument only covers instances where the deletion-size condition holds for every selected original leaf; residual orders `2k` and above remain outside its incidence estimate.

The route presents algebraic derivations and no computation, citation, imported theorem, or new counterexample to the primary sum. Accordingly, no replay was necessary for this review. The `K2` calculation above is a direct exact arithmetic check of the stated universal cover-bound formula. The contract's fixed selector, original supports and neighborhoods, strict lower-region guard, and complete tagged sum remain the governing target; this review supplies no sign for the unhandled instances.

## Exact retained statement

For each fixed instance and each original leaf in the fixed favorable set `F(T,p)`, if some ordering of its mark set `W` has every first-mark deletion union of size at least `d+3`, where `|V(T)|=2p+2+d` and `d>=1`, then that leaf's summand is nonpositive. If the condition holds for every leaf in `F(T,p)`, the complete selected sum is nonpositive. This is a sufficient structural subclass only. The cover-number bound as stated is rejected; its positive `a=r+1` term requires an exact independent-set count or omission.
