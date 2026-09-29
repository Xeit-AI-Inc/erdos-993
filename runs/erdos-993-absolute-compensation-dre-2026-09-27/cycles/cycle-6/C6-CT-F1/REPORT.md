# C6-CT-F1 independent critique: exact-ratio ULC surplus tail

## Disposition

For `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`, I find the proposed strict tail proof valid for `m >= 100`, every represented tip branch, and every integer `1 <= k` with `2k <= N+2`. I found no hidden premise or counterexample. This is a proposed narrowed informal proof of the tail subcase; the registered all-`m` claim still needs `m <= 99`. It is neither a Lean award nor a proof of selected payment, MASS, or an arbitrary-tree statement.

The claim under review is exactly

```text
(h+1) U_i[k] C[k]
 + (k+1)(h-k+1) (E[k]C[k] - E[k+1]C[k-1]) > 0,
```

where `N=sum r_i`, `h=1+2a_2+4a_3+7a_4`, `C=G product B_(r_i)`, `U_i=G B_(r_i-1) product_(ell!=i)B_(r_ell)`, `E=z(1+z)^N`, and all arrays are monomial coefficients in `z`, zero-extended. The target has no first-descent or selector premise. Any later use for actual original-tip tags must separately retain the actual least strict descent, all rank guards, current-`p` strict selectors, and original `r_i` multiplicities. The endpoint is not covered by this claim.

## Independent proof audit

1. **Low ranks, including support edges.** Expand `Q=product B_(r_i)` as `sum_S z^s (1+z)^(N-R)`, where `R=sum_(i in S)r_i <= 4s`. On positive adjacent support, comparing a term's coefficient divided by `choose(N,k)` at ranks `k` and `k-1` has cross-product sign `s(N+1)-kR`; this follows from the exact ratio `(N-R-k+s+1)/(k-s)` versus `(N-k+1)/k`, with positive denominators. Thus it is nonnegative when `4k<=N+1`. New support at `k` contributes nonnegatively. A term positive at `k-1` and absent at `k` would force `N-R=k-1-s`, `s<=k-1`, hence `N<=4k-4`, contradicting `4k<=N+1`. The empty subset contributes ratio one. So `Q[k]/choose(N,k)` is nondecreasing on the required low band, including zero-extension boundaries.

   Put `c_t=choose(N,t)`. Expanding `C=GQ` gives
   `M_k(E)=c_(k-1)Q[k]-c_kQ[k-1] + 2(c_(k-1)Q[k-1]-c_kQ[k-2])`.
   The first bracket is nonnegative by the rank-`k` ratio comparison. For `k>=2`, apply the same comparison at `k-1`; binomial log-concavity `c_(k-1)^2>=c_k c_(k-2)` supplies the needed second bracket. For `k=1`, `Q[-1]=0` makes that bracket positive. Thus `M_k(E)>=0`; `U_i[k]` and `C[k]` are positive on this support, making the surplus strict.

2. **The high-band singleton exponent.** Here `4k>N+1`, so `k>N/4`; for `m>=100`, `N>=200`. The exact positive ratios
   `g_3/g_2=(15/14)(N-k-1)/(N-2)` and
   `g_4/g_3=(28/27)(N-k-2)/(N-3)` are at most one precisely when `N+13<=15k` and `N+25<=28k`, respectively. These follow from `k>N/4` and `N>=200`; all denominators and binomial factors are positive in this band. Also `g_4(k+1)/g_4(k)=(k+1)(N-k-3)/(k(N-k))<=1` exactly when `4k>=N-3`, which follows from the high-band guard. Hence the minimum over this band is at `K=floor((N+2)/2)`.

   For `N=2s`, substitution gives `g_4(N,K)=(2/9)(s+1)(s-2)(s-3)/(s(2s-1)(2s-3))`; clearing its positive denominator, `g_4>=1/20` is `4s^3-88s^2+13s+240>=0`, true for `s>=100`. For `N=2s+1`, it gives `(2/9)(s+1)(s-2)/((2s+1)(2s-1))`; the cleared condition is `4s^2-40s-71>0`, true for `s>=100`. The boundary values at `N=200,201` are exactly `480053/8820675` and `19796/359991`, both above `1/20`.

3. **Full Jensen theorem used at the correct rank.** `U_i` factors as `B_1`, `B_(r_i-1)`, and the `m-1` unmarked factors. Their positive block sizes sum to `N`; in particular the marked block has size one when `r_i=2`, which satisfies the theorem's strict-positive-size hypothesis. Each `B_a=(1+z)^a+z` coefficient dominates `choose(a,t)` for `t<=a`, including `B_1=G`. The formal full coefficient-Jensen theorem therefore applies directly at coefficient rank `k`, total size `N`, without a convolution shift. The root and marked blocks have nonnegative exponent contributions, and each unmarked branch contributes at least `1/20`; consequently `U_i[k]>=choose(N,k) exp((m-1)/20)`. This is a valid application of the formal ingredient, not a formalization of the family-specific factorization or tail.

4. **Strict Taylor bound.** For `a=99/20` and `t=(m-100)/20>=0`, nonnegative Taylor terms give `E_8(a+t)>=E_8(a)+t E_7(a)`. Exact fractions are `E_8(a)=2162945642595007/16384000000000>102` and `E_7(a)=88220922596671/716800000000>20`. Thus `exp((m-1)/20)>E_8(a+t)>102+20t=m+2`, including `m=100`; the first strictness follows from the positive omitted exponential terms.

5. **Ratio floor and deficit payment.** The differential operator is `D_d(F)=(3+2z)F'-2dF`. Its local coefficients are nonnegative: `D_1(G)=4`, `D_2(B_2)=5`, `D_3(B_3)=6+2z+3z^2`, and `D_4(B_4)=7+6z+12z^2+4z^3`. The weighted product rule gives `D_(N+1)(C)>=0`. Correct coefficient extraction at degree `k-1` is
   `3k C[k]-2(N+2-k)C[k-1]>=0`;
   this confirms the cited ratio floor `C[k]/C[k-1]>=2(N+2-k)/(3k)`. Both coefficients are positive in the guarded band. Taking reciprocals reverses this positive ratio inequality; multiplying by positive `b=(N+1-k)/k` preserves it, and subtracting from one reverses it again. With `e=choose(N,k-1)>0`, this yields
   `M_k(E)/(e C[k]) >= 1-(3/2)(N+1-k)/(N+2-k)>-1/2`.

   Also `h>=N+1`, so `h-k+1>0`; `lambda=(h+1)/((k+1)(h-k+1))>1/(k+1)>=2/(N+4)`; and `b=choose(N,k)/e >= N/(N+2)`. Every denominator is positive. Jensen and Taylor give `lambda U_i[k]/e > 2N(m+2)/((N+4)(N+2)) >= 1/2`. For the final inequality, replacing `4Nm` by its lower bound `N^2` using `N<=4m` leaves difference `4N(m+2)-(N+4)(N+2)>=2N-8>0`. Summing the strict positive contribution with the deficit bound proves `lambda U_i[k]C[k]+M_k(E)>0`; multiplication by `(k+1)(h-k+1)>0` gives the exact strict target. Negative `M_k(E)` is allowed in this step; it is paid by the positive Jensen term.

6. **Scope of the endpoint identity.** `U_0-U_i=z^2((1+z)^(r_i-1)-1)H_i` is coefficientwise nonnegative, including `r_i=2`. This alone is not an LR or shifted-minor implication. A separate endpoint main-product LR argument and the common curvature bound are still required for an endpoint conclusion. No endpoint or all-original-leaf extension is inferred here.

## Independent exact checks and provenance

I checked all 275 members in `manifests/C6-COMMON-DISPATCH.json` and all six packet `allowed_source_files` against their recorded SHA-256 values; there were no mismatches. I read only those shared inputs and the packet. I copied the producer arithmetic script into my scratch before running it.

The exact arithmetic replay commands are:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_tail_arithmetic.py
PYTHONDONTWRITEBYTECODE=1 python3 producer_tail_check_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_profile_check.py
```

The first replay confirms both Taylor fractions, the two parity boundary values, and the `m=100,N=200` tail-payment constant `100/101>1/2`. The copied producer script is bounded arithmetic evidence only. My separate profile script constructs the explicit monomial-`z` coefficient arrays from binomial coefficients, then computes the actual `C`, `U_i`, exact ratio floor, `M_k(E)`, and signed strict target. It checks the first high-band rank and midpoint at `N=200`, the first high-band rank and midpoint at `N=300`, `N=400,k=101`, and a heterogeneous profile `(a_2,a_3,a_4)=(40,30,30)` at `N=290,k=100`; every exact ratio floor and target is positive. Retained outputs are in `independent_profile_evidence.json`. These are boundary/interior spot checks, not a census or universal proof.

## Limitations

- The universal argument covers only the tail `m>=100`; the all-`m` registry claim remains open pending an exact base for `m=1..99`.
- The tail surplus itself has no first-descent or selector guard. Any downstream selected comparison must preserve actual first descent, all original rank guards, strict selectors at current `p`, and original tip multiplicity `r_i`.
- This critique neither runs Lean nor promotes the full primary payment, MASS, endpoint, or arbitrary-tree statements. Computations are exact spot checks only.
