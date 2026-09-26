# C5-CF-U5 critique: support-star sector

## Disposition

**C5-U5.support-star-sector — retained.** The stated star-family conclusion follows for every eligible rank, with the original strict selector. This is a realized ordinary-tree subclass result; it does not prove the general lower-region aggregate.

## Independent audit

Let `T=K_{1,d}`, `d>=12`, with center `s`, and let `h=d-1`. Then `alpha(T)=d`. Its independence counts are `i_0=1`, `i_1=d+1`, `i_j=binomial(d,j)` for `2<=j<=d`, and zero thereafter. In particular `Delta_1=binomial(d,2)-(d+1)>0`. For `j>=2`, including the terminal zero-extension step at `j=d`,

`Delta_j = binomial(d,j) * (d-2j-1)/(j+1)`.

Thus the first negative difference is `x=floor((d+1)/2)`; a possible zero at the middle rank for odd `d` is not a negative difference. These counts also verify terminal descent.

Deleting any original leaf gives `T-v=K_{1,d-1}`. The same calculation gives `x(T-v)=floor(d/2)`. Eligibility has `p>=x(T)+2`, hence `p>x(T-v)`; the upper guard ensures `p<=floor(2d/3)<d-1=alpha(T-v)` for `d>=12`. The binomial tail of `T-v` strictly decreases after its first negative difference, so `Delta_p(T-v)<0` for every original leaf. Therefore the actual fixed selector is `F(T,p)=L(T)`, all `d` original leaves, including the repeated common support `s` with each leaf retained as a separate tag.

For each such leaf, the original support is `s`; `H_v=T-{v,s}` is the edgeless graph on `h` vertices, `W_v=N_T(s)\{v}=V(H_v)`, and `R_v=T-N_T[s]` is empty. Since `k=p-1>=1`,

`q_v(k)=binomial(h,k)` and `q_v(k+1)=binomial(h,k+1)`

with zero extension. Directly from the summand definition, the summand is `q_v(k+1)-q_v(k)`. The eligibility lower bound gives `k>=x+1`. If `d=2m`, then `x=m` and `2k>=2m+2`; if `d=2m+1`, then `x=m+1` and `2k>=2m+4`. In both cases `2k>=d-2`, so

`binomial(h,k+1)/binomial(h,k)=(h-k)/(k+1) <= 1`

whenever both terms are nonzero. If `k>=h`, both the difference and its zero-extended version are nonpositive directly. Hence every selected summand is nonpositive and the full sum is nonpositive.

The source report states the weaker bound `2k+2>=d-1` before asserting this ratio comparison; that weaker bound alone would not imply the comparison. The eligibility calculation above supplies the stronger bound `2k>=d-2`, repairing that presentation gap without changing the claim or its scope.

The boundary-count account also checks: for each marked `k`-set, there are exactly `h-k` actual addable vertices, so `E=(h-k)Q`; every `(k+1)`-set meets `W_v` at least twice, so `C=U=binomial(h,k+1)`. Then `E=kU+C` by `(h-k)binomial(h,k)=(k+1)binomial(h,k+1)`. This is consistent with `kS=E-C-kQ`, but the direct summand calculation already proves the restricted result.

## Scope and limitations

Stars are finite simple connected acyclic graphs, so this is a realizable ordinary-tree result. It covers only `K_{1,d}` for `d>=12` and eligible `p`; some `d` may have no eligible rank, in which case the universal conditional is vacuous. It gives no inequality for `H_v` with edges, no mixed marked/unmarked sector bound, and no result for general trees. No computation or external theorem was needed. All case and common packet source pins verified; no sealed source was modified or replayed.
