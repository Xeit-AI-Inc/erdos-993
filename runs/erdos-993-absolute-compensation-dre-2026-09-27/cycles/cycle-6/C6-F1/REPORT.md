# C6-F1 adversarial review: exact-ratio tip-surplus tail

## Proposed disposition

For the registered claim `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`, I found no counterexample or hidden premise in the proposed `m >= 100` proof. I propose retaining that tail subcase as an informal all-parameter argument, narrowed to its stated scope. This is not a Lean award and does not establish the registered all-`m` claim: the prefix `m <= 99` remains open. It proves neither the primary payment nor an arbitrary-tree statement.

Write `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `Q=prod_i B_{r_i}`, `C=GQ`, `H_i=prod_(ell!=i)B_{r_ell}`, `U_i=G B_(r_i-1)H_i`, `E=zL^N`, and `h=1+2a_2+4a_3+7a_4`. The tail predicate audited is, for every represented tip branch `i` and every integer `1 <= k` with `2k <= N+2`,

```text
(h+1) U_i[k] C[k]
  + (k+1)(h-k+1) (E[k]C[k] - E[k+1]C[k-1]) > 0,
```

for every arity-2/3/4 profile with `m >= 100`. Coefficients are zero-extended. This statement has no actual-first-descent or selector premise; it is a stronger sufficient-condition target, not the selected payment. In divided form put `lambda=(h+1)/((k+1)(h-k+1))` and `M=E[k]C[k]-E[k+1]C[k-1]`; the target is `lambda U_i[k]C[k]+M>0`. Any later application at an actual eligible `p` must still retain the original least strict descent `x`, all three rank guards, and the current-`p` strict selectors; this review does not replace them.

## Audit of the proof

1. **Low-rank binomial component and support boundaries.** Expanding `Q` over center subsets gives terms `z^s L^(N-R)`, with `R<=4s`. At positive adjacent support the ratio of their rank-`k` coefficient to `choose(N,k)` is nondecreasing from `k-1` to `k` exactly when `s(N+1)-kR >= 0`; this follows by cross-multiplying the two binomial coefficients, so no denominator is needed. If a term appears at `k`, the new contribution is nonnegative. A positive term cannot disappear at `k` in the low band `4k<=N+1`: disappearance would force `N-R=k-1-s`, `s<=k-1`, and hence `N<=4k-4`, contradicting `N>=4k-1`. The empty subset contributes the constant ratio one. Thus `Q[k]/choose(N,k)` is nondecreasing throughout the needed adjacent ranks, including the zero-extension edges. Applying this also at `k-1` and using binomial log-concavity gives `M>=0`; for `k=1`, the second term uses `Q[-1]=0` and is positive. Since `U_i[k]C[k]>0` in the guard, the full surplus is strictly positive in this band.

2. **High-band arity comparison and midpoint.** In the complement, `4k>N+1`, so `k>N/4`. The singleton exponent contribution of an unmarked arity-`r` block is `g_r=(2r/(2r+1))*choose(N-r,k-1)/choose(N,k)`. Exact division gives `g_3/g_2=(15/14)(N-k-1)/(N-2)` and `g_4/g_3=(28/27)(N-k-2)/(N-3)`. They are at most one: the respective equivalent inequalities are `N+13<=15k` and `N+25<=28k`, which follow from `k>N/4` and `N>=200`. Also `g_4(k+1)/g_4(k)=(k+1)(N-k-3)/(k(N-k))<=1` when `4k>=N-3`, a consequence of this high-band guard. Hence its minimum occurs at `K=floor((N+2)/2)`.

   For `N=2s`, the midpoint value is `(2/9)(s+1)(s-2)(s-3)/(s(2s-1)(2s-3))`; `g_4>=1/20` reduces to `4s^3-88s^2+13s+240>=0`, positive for `s>=100` since `4s-88>0`. For `N=2s+1`, it is `(2/9)(s+1)(s-2)/((2s+1)(2s-1))`; the bound reduces to `4s^2-40s-71>0`, also positive for `s>=100`. The actual minimum boundary values at `N=200,201` are respectively `480053/8820675` and `19796/359991`, both above `1/20`. Thus each of the `m-1` unmarked factors contributes at least `1/20` to the Jensen exponent.

3. **Formal Jensen specialization, including size one.** Factor `U_i` into `G=B_1`, the marked block `B_(r_i-1)`, and the other `m-1` blocks `B_(r_ell)`. Their positive sizes sum to `N`; if `r_i=2`, the marked block has size one and is allowed. Every factor `B_a=L^a+z` has coefficients at least `choose(a,t)` at every `t<=a`, including `B_1=G`; the full C4 finite-block Jensen theorem applies at coefficient rank `k` with total size `N`, directly and without a convolution shift. Its other exponent terms are nonnegative. The result is `U_i[k] >= choose(N,k) exp((m-1)/20)`. The formal theorem is an ingredient only. This family-specific factorization and tail conclusion are not themselves formally verified.

4. **Strict Taylor estimate.** Let `a=99/20` and `t=(m-100)/20>=0`. Positivity of the Taylor coefficients gives `E_8(a+t)>=E_8(a)+t E_7(a)`. Exact arithmetic gives `E_8(a)=2162945642595007/16384000000000 > 102` and `E_7(a)=88220922596671/716800000000 > 20`. Therefore `exp((m-1)/20)>E_8(a+t)>102+20t=m+2`, with strictness also at `m=100`.

5. **Ratio floor, signs, and final deficit payment.** The C2 operator is `D_d(F)=(3+2z)F'-2dF`. Its local coefficient lists for `G,B_2,B_3,B_4` are respectively `(4)`, `(5)`, `(6,2,3)`, `(7,6,12,4)`, all nonnegative. The product rule yields `D_(N+1)(C)>=0` coefficientwise and, at rank `k-1`, `C[k]/C[k-1] >= 2(N+2-k)/(3k)`. All denominators here are positive: `1<=k`, `k<=floor((N+2)/2)`, and `C[k-1]>0`. Put `e=choose(N,k-1)>0` and `b=choose(N,k)/e=(N+1-k)/k`. Then `M/(e C[k]) >= 1-(3/2)(N+1-k)/(N+2-k) > -1/2`. Also `h>=N+1`, so `h-k+1>0`; `lambda>1/(k+1)>=2/(N+4)`; and `b>=N/(N+2)`. Combining these with the Jensen and Taylor bounds gives `lambda U_i[k]/e > 2N(m+2)/((N+4)(N+2)) >= 1/2`. The final weak inequality follows from `N<=4m`: after clearing positive denominators, the difference is `4Nm-N^2+2N-8 >= 2N-8 > 0`. Therefore `lambda U_i[k]C[k]+M>0`. Clearing the positive factor `(k+1)(h-k+1)` proves the stated strict surplus. No denominator sign changes or non-strict selector substitutions occur.

6. **Endpoint bridge boundary.** The identity `U_0-U_i=z^2(L^(r_i-1)-1)H_i` is correct and coefficientwise nonnegative, including `r_i=2`. This establishes coefficient dominance only. An endpoint shifted-minor conclusion additionally needs the separately stated endpoint main-product LR and common enlarged-order curvature argument; it does not follow from this identity alone. I make no unconditional endpoint or all-original-leaf claim here.

The registered all-`m` statement remains distinct: nothing here fills `m<=99`. The known negative E-only component, activity-layer obstruction, and the out-of-guard negative full-tip control concern different quantities or scopes, and do not contradict this `m>=100`, full-surplus guarded argument. No census expansion was run.

## Exact checks and provenance

All 275 actual member byte strings in `manifests/C6-COMMON-DISPATCH.json` matched their SHA-256 values. The dispatched `packets/C6-F1.json` has observed SHA-256 `52ed403fcd536a50c93dd58ecda5b24177b4cdf38d8e25de659707cd788cbbe8`; its `allowed_source_files` is empty. I used only common-manifest members plus that packet. The common C2 operator, C3 center-subset expansion, and C4 Jensen source reports show formal verification of those exact components; the composed tail proof remains informal.

Replay manifest verification with `PYTHONDONTWRITEBYTECODE=1 python3 verify_common_manifest.py`.

Replay the independent exact boundary checks with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_tail_arithmetic.py
```

This independently recomputes the two Taylor rationals, parity-boundary midpoint values, and the boundary tail-payment value. I also copied the authorized producer arithmetic check before execution and replayed it with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_tail_check_copy.py
```

That second script reports only bounded arithmetic checks; it is not evidence for the universal proof.
