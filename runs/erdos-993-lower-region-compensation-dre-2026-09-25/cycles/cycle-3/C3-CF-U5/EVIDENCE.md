# C3-CF-U5 independent audit evidence

## Source integrity and scope

The SHA-256 values in both assigned packets were checked against every listed common source and all three case files; all matched. The sealed C3-U5 files were copied into this seat's temporary `.replay` directory before inspection. The only route claims reviewed are the two IDs in the case packet.

## Claim: `C3-U5-EARLY-DESCENT-MARKED-OCCUPANCY-BRIDGE`

**Disposition: retained.** The stated conditional implication is valid on the target's eligible domain.

Write `a=alpha(T)`, `x=x(T)`, `k=p-1`, and for every selected original leaf `v`, let `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\\{v}`, and `R_v=H_v-W_v`. Since `v` is a leaf, `alpha(H_v)=a-1`: a maximum independent set of `T` can be converted to one in `H_v` by deleting either `s_v` if it occurs or `v` otherwise, and every independent set of `H_v` extends by adding `v`. The strict lower-region and eligibility bounds imply `p>=2` and `1<=k<=a-1`, so the tagged identity applies with `h=a-1`.

For each `v`, set `q_v(j)=i_j(H_v)-i_j(R_v)`, the count of independent `j`-sets meeting `W_v`. Then the summand in the target is `q_v(k+1)-q_v(k)`. If `Q=sum_v q_v(k)`, `E=sum_v sum_{A in I_k(H_v), A meets W_v} e_{H_v}(A)`, and `D_v=2(h-k)q_v(k)-E_v`, the marked extension count is

`k*q_v(k+1)+C_v=E_v=2(h-k)q_v(k)-D_v`,

where each extension meeting `W_v` in at least two vertices contributes once to `C_v`. The bound `e_H(A)<=2(h-k)` follows by splitting addable vertices by the two color classes; in either class, adjoining those addable vertices to `A` is independent. Hence `D_v,C_v>=0`. Subtraction gives exactly

`k*S=(2(h-k)-k)Q-sum_v(D_v+C_v)=(2a+1-3p)Q-sum_v(D_v+C_v)`.

For the earlier layer, pair counting yields `sum_{B in I_x(T)} e_T(B)=(x+1)i_{x+1}(T)`. Since `Delta_x(T)<0`, `i_x(T)>0` and the mean `E_x=(x+1)i_{x+1}/i_x < x+1 <= k`. Under the route's explicit premise `E<=E_x Q`, if `Q>0` then `sum D_v=2(h-k)Q-E>(2(h-k)-k)Q`, which makes `S<0`. If `Q=0`, nonnegativity gives `kS=-sum_v(D_v+C_v)<=0`. This establishes the full selected sum conditionally and preserves the fixed original selector and each leaf tag.

The conditional premise is not derived from the strict descent: it compares a selector-conditioned rank-`k` distribution across the `H_v` with the unconditioned rank-`x` distribution in `T`. The pair count alone supplies no such comparison. The route correctly labels this universal bridge as open.

### Exact nonvacuous check: 20-leaf star

Let `T=K_{1,20}`. Its independent counts are `i_0=1`, `i_1=21`, and `i_j=C(20,j)` for `2<=j<=20`; thus `x=10`. Set `p=12`: `x+2=12` and `3p=36<41=2a+1`. For every original leaf, `T-v` is `K_{1,19}` and `Delta_12(T-v)=C(19,13)-C(19,12)<0`, so all 20 leaves belong to the fixed selector. Here `k=11`; each `H_v` is 19 isolated vertices, `R_v` is empty, and `q_v(11)=C(19,11)=75,582`, `q_v(12)=C(19,12)=50,388`. Thus `Q=1,511,640`, `E/Q=19-11=8`, and `E_x=11*C(20,11)/C(20,10)=10`, so the conditional premise holds. Each leaf summand is `50,388-75,582=-25,194`, giving the complete sum `S=-503,880`. This verifies usefulness in one eligible example, not universality.

## Claim: `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`

**Disposition: retained_narrowed.** Retain this only as the exact registered lower-region target statement, with status still open. The reviewed route does not prove or refute it: its only primary implication depends on the unproved universal marked-occupancy transfer inequality above. The star calculation is one negative instance and is not a general proof. No positive full-sum counterexample, bounded census, imported theorem, or further standing-control result was produced or needed to dispose of the route's stated claim.

## Limitations

No universal proof of `E<=E_x Q` or weaker sufficient aggregate budget is supplied. No exhaustive computation, imported theorem, or target counterexample is claimed. The star is a single exact example. All statuses in the return are proposed worker dispositions only.
