# C6-CU-F1 critique: exact-ratio tip surplus

## Disposition and scope

For `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`, I propose **retained, narrowed to the all-parameter tail `m >= 100`**, at informal-proof grade. I found no counterexample or invalid step in that tail proof. The registered claim quantifies over every nonempty profile; this review does not establish its `m <= 99` part, so the registered all-profile predicate remains open. This is not a Lean award for the composition, the stronger selected payment, or an arbitrary-tree result.

The tail statement audited is exactly: for every ordinary path-star profile with `m >= 100`, each represented branch `i` of arity `r_i in {2,3,4}`, and every integer `1 <= k` with `2k <= N+2`,

```text
(h+1) U_i[k] C[k]
 + (k+1)(h-k+1) (E[k]C[k] - E[k+1]C[k-1]) > 0,
```

where `N=sum_i r_i`, `h=1+2a_2+4a_3+7a_4`, `C=G product_i B_(r_i)`, `E=zL^N`, and `U_i=G B_(r_i-1) product_(ell!=i)B_(r_ell)`. Coefficients are in powers of `z`, zero-extended. There is no first-descent or selector condition in this surplus claim. Applying it later to an eligible deletion requires preserving the actual least strict descent, all original rank guards, the strict selectors evaluated at the current `p`, and the original `r_i` multiplicity of every selected branch.

## Independent audit of the argument

Put `M=E[k]C[k]-E[k+1]C[k-1]` and

```text
lambda = (h+1)/((k+1)(h-k+1)).
```

For this domain, `N>=200`, `k<=floor((N+2)/2)`, and `h>=N+1`. Thus `h-k+1>0`, `k+1>0`, and `lambda>0`. Clearing the denominator preserves the inequality; no sign reversal is involved.

**Low-rank region.** Expand `Q=product B_(r_i)` by center subsets as terms `z^s L^(N-R)`, with `R=sum_(i in S)r_i<=4s`. On positive adjacent support, the cross product comparing the normalized rank-`k` coefficient with rank `k-1` is

```text
choose(N,k-1) choose(N-R,k-s)
 - choose(N,k) choose(N-R,k-1-s),
```

whose sign is that of `s(N+1)-kR`, hence is nonnegative when `4k<=N+1`. This follows by multiplying through by the positive binomial denominators; no ratio with a zero denominator is used. At support boundaries, a newly appearing term contributes nonnegatively. A positive term cannot disappear in this band: disappearance forces `N-R=k-1-s`, `s<=k-1`, so `N<=4k-4`, contradicting `N>=4k-1`. The empty-subset term is constant. Therefore `Q[k]/choose(N,k)` is nondecreasing through the needed adjacent ranks, including zero-extension boundaries.

Writing `c_j=choose(N,j)` and `C=GQ` gives the exact identity

```text
M = (c_(k-1)Q[k]-c_k Q[k-1])
  + 2(c_(k-1)Q[k-1]-c_k Q[k-2]).
```

Both terms are nonnegative by the normalized-rank comparison (the second is its `k-1` instance); at `k=1`, its `Q[-1]` term is zero and the first term is positive. Since `U_i[k]C[k]>0`, the surplus is strictly positive throughout this region.

**Complementary band and Jensen exponent.** Here `4k>N+1`, hence `k>N/4`. For an unmarked block of size `r`, its exact singleton exponent term is

```text
g_r(N,k) = (2r/(2r+1)) choose(N-r,k-1)/choose(N,k).
```

All binomial denominators are positive on the stated domain. Direct cancellation gives `g_3/g_2=(15/14)(N-k-1)/(N-2)` and `g_4/g_3=(28/27)(N-k-2)/(N-3)`. The inequalities `N+13<=15k` and `N+25<=28k` make both ratios at most one. Also

```text
g_4(N,k+1)/g_4(N,k)=(k+1)(N-k-3)/(k(N-k));
```

this is at most one exactly when `4k>=N-3`, which follows from `k>N/4`. Thus the minimum over the guarded high band is at `K=floor((N+2)/2)`.

For `N=2s`, `K=s+1`, and `g_4(N,K)>=1/20` is equivalent, after clearing positive denominators, to `4s^3-88s^2+13s+240>=0`; for `s>=100`, `4s-88>0` and this is positive. For `N=2s+1`, the equivalent numerator is `4s^2-40s-71>0` for `s>=100`. At the first boundaries, the exact values are `g_4(200,101)=480053/8820675` and `g_4(201,101)=19796/359991`, both greater than `1/20`. Consequently each of the `m-1` unmarked blocks contributes at least `1/20`.

Each factor of `U_i` is `B_a=L^a+z` with positive block size; when `r_i=2`, the marked size is one and `B_1=G`. The coefficients of `B_a` dominate `choose(a,t)` for every `t<=a`. In the full finite-block Jensen theorem, only `t=1` has excess, namely one; its block exponent contribution is exactly `g_a(N,k)` and all other contributions are nonnegative. The block sizes in `U_i` sum to `1+(r_i-1)+(N-r_i)=N`, so the theorem applies directly at rank `k` without a shifted rank. The formally verified Jensen theorem allows positive size-one blocks. This yields

```text
U_i[k] >= choose(N,k) exp((m-1)/20).
```

The specialization and the composed surplus remain informal; the component theorem's formal verification does not promote this whole proof to a formal award.

For `a=99/20`, `t=(m-100)/20>=0`, positivity of Taylor coefficients gives `exp(a+t)>=E_8(a)+t E_7(a)`, where exact rational arithmetic gives

```text
E_8(99/20)=2162945642595007/16384000000000 > 102,
E_7(99/20)=88220922596671/716800000000 > 20.
```

So `exp((m-1)/20)>m+2`, strictly even at `m=100`.

**Paying the negative curvature possibility.** The coefficient operator `(3+2z)F'-2dF` has the following coefficient lists in ascending powers of **z** for `G,B_2,B_3,B_4`, respectively:

```text
(4), (5), (6,2,3), (7,6,12,4).
```

These follow by direct expansion of `B_r=(1+z)^r+z`, not by treating an `L=1+z` coefficient list as a `z` coefficient list. They are nonnegative; the product rule therefore yields `(3+2z)C'-2(N+1)C>=0` coefficientwise. At rank `k-1`, with positive `C[k-1]`, this gives

```text
C[k]/C[k-1] >= 2(N+2-k)/(3k).
```

Let `e=choose(N,k-1)>0` and `b=choose(N,k)/e=(N+1-k)/k`. The previous lower bound has positive right side; reciprocating reverses its order, giving `C[k-1]/C[k] <= 3k/(2(N+2-k))`. Hence

```text
M/(e C[k]) = 1 - b C[k-1]/C[k]
           >= 1 - 3(N+1-k)/(2(N+2-k)) > -1/2.
```

Here `C[k]>0`, and the last strict inequality uses `N+1-k < N+2-k`; division by `eC[k]` preserves signs. Also `lambda>1/(k+1)>=2/(N+4)` (the first comparison is equivalent to `k>0`), and `b>=N/(N+2)` from `2k<=N+2`. Combining these positive bounds gives

```text
lambda U_i[k]/e > 2N(m+2)/((N+4)(N+2)) >= 1/2.
```

For the last comparison all cleared factors are positive, and the numerator difference is `4Nm-N^2+2N-8 >= 2N-8 > 0`, using `N<=4m`. Thus `lambda U_i[k]C[k]+M>0`. Multiplying by the positive `(k+1)(h-k+1)` recovers the exact strict surplus.

The signs in the proof survive substitution: the normalized low-band cross products are nonnegative; the arity ratios and adjacent `g_4` ratio are at most one; the reciprocal of the positive ratio floor is at most its reciprocal; and both final lower bounds are positive. I found no step that turns a bounded check into a universal assertion: the universal portions are the displayed symbolic inequalities, while my executable checks are corroborative only.

## Reproducibility and limitations

The dispatch check verified all `275` actual common-manifest member bytes and all six additional files allowed by this packet. The observed packet SHA-256 is `3431123a3d615cdc002cd66bc4b1dd8c9fa16f600ea26b46b2bdce692b2075b0`. I copied the authorized producer arithmetic program into this scratch before running it. My separate exact-arithmetic script checks the Taylor rationals, low-band cross products on a finite grid, and high-band boundary/interior values; it is not a universal proof.

Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 verify_dispatch.py
PYTHONDONTWRITEBYTECODE=1 python3 producer_tail_check_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 audit_arithmetic.py
```

The producer script writes its adjacent JSON output; `audit_arithmetic.py` prints its exact-arithmetic summary to stdout. No Lean build, source edit, or census expansion was done. The unresolved prefix is the exact `m=1..99` scope; none of the above covers it. The accepted primary exact-ratio payment is a distinct predicate, and neither its status nor the selected MASS claim is changed by this review.
