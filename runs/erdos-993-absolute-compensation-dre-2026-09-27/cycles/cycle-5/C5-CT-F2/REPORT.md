# C5-CT-F2 critique

## Scope and integrity

I reviewed the C5-F2 report, return, and four authorized instruments listed in my packet, alongside the authorized neutral handoff, solution contract, and targeted registered-identity lookup. The packet sources all match their listed SHA-256 values. All 237 members of `manifests/C5-COMMON-DISPATCH.json` exist and match their manifest hashes. The two case claim IDs do not occur in the current identity snapshot; I assess the packet's exact worker-local claims and do not assign canonical status.

I copied the producer scripts into this scratch directory before execution. Replay commands (from this directory):

```sh
PYTHONDONTWRITEBYTECODE=1 python3 root_mixture_producer_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 ulc_surplus_producer_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py
```

The first two reproduce the supplied instruments; `independent_audit.py` reconstructs the two required counterexamples separately using exact integers and fractions. Its output is `independent_audit.json`.

## Required claim dispositions

### `C5-F2-DIFFERENT-DENOMINATOR-SUM-OBSTRUCTION` — retain at stated abstract scope

Take two coefficient pairs over ranks 0,1:

- `(A1,C1)=((1,90),(1,100))`, with minor `A1[1]C1[0]-A1[0]C1[1]=-10`;
- `(A2,C2)=((80,0),(100,1))`, with minor `A2[1]C2[0]-A2[0]C2[1]=-80`.

Both denominators are positive. Each input ratio decreases from rank 0 to 1. After componentwise addition, `A=(81,90)`, `C=(101,101)` and the minor is `90*101-81*101=909>0`; the summed ratio increases. Multiplication by the positive denominator product preserves these ratio-order signs. This exactly refutes arbitrary pair-sum closure for different denominators. It is an abstract example, not a path-star counterexample.

The useful valid repair is the same-denominator statement: for fixed `w_i>=0`,

`(sum_i w_i X_i[k+1])C[k] - (sum_i w_i X_i[k])C[k+1] = sum_i w_i (X_i[k+1]C[k]-X_i[k]C[k+1])`.

Thus componentwise nonpositive minors imply a nonpositive weighted minor. If the relevant denominator coefficients are positive, division by their positive product preserves the ratio direction. In the selected setting, `r_i e_i` are fixed nonnegative weights evaluated at the actual current `p`; this closure only combines already-proved individual inequalities at that same rank. It establishes neither those individual inequalities nor the payment.

### `C5-F2-ROOT-MIXTURE-ALL-RANK-MONOTONICITY-OBSTRUCTION` — retain at stated coefficient-rank scope

For homogeneous counts `(a2,a3,a4)=(10,0,0)`, `m=10`, `N=20`, `n=33`, `alpha=22`, the exact factors are `B2=(1,3,1)`, `C=(1+2z)B2^10`, and `d=z(1+z)^21`. At `k=4`,

`(d[k],d[k+1],C[k],C[k+1])=(1330,5985,27315,125586)`

and `d[k+1]C[k]-d[k]C[k+1]=-3,549,105<0`. Since `C[k]C[k+1]>0`, this means `d[k+1]/C[k+1] < d[k]/C[k]`. The mixture weight is `u/(1+u)` for `u=d/C`; for `u>=0`, this map is strictly increasing (cross multiplication uses positive denominators), so the mixture weight also decreases across this step. No inequality is reversed by a negative factor here; the signed minor directly has the same direction as the ratio comparison after division by a positive product.

The simple comparison-band guard holds: `1<=k` and `2k=8<=N+2=22`. For the payment lower-half rank guards, `3k=12<2alpha+1=45` and `2k=8<=alpha=22` also hold, but the independently reconstructed full parent has first strict descent `x=11`, so `x+2=13<=p=4` fails. Therefore this is only a counterexample to the all-rank mixture-monotonicity shortcut. It is not a guarded actual-eligibility counterexample, nor a deletion, strict-selector, payment, or primary witness. The source claim correctly keeps that limitation.

## Other audited evidence and limits

The copied ULC diagnostic reproduces 1,770 profiles and 109,175 guarded tip/rank evaluations through `m<=20`; no exact-ratio-surplus failure appears in that finite scan. Its crude ratio-floor sufficient margin is negative at counts `(0,0,4)`, represented tip arity 4, `N=16,h=29,k=8`, with margin `-87,840`. The negative value invalidates that sufficient bound at this point, not the exact-ratio condition or the underlying comparison. This is bounded computation, not a universal proof; actual first-descent eligibility is not part of this diagnostic.

Neither example evaluates the actual current-p strict selectors `e0,ei`, deletes a tagged vertex, or changes the original `r_i` multiplicity of tip tags. The mixture rank is not actual eligible `p`, so no selector or payment inference is available from it. No universal proof of the registered guarded individual/weighted comparison, and no full path-star payment counterexample, follows from these two mechanism-level obstructions. No Lean or formal verification was performed.
