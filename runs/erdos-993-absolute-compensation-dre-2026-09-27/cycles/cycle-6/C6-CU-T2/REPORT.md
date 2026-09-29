# C6-CU-T2 independent critique

## Claim and disposition

**Required claim:** `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`.

I propose **retained, narrowed**: the proposed analytic argument proves the registered surplus strictly for every profile with `m >= 100` and every represented tip arity `r`, throughout the exact guard `1 <= k` and `2k <= N+2`. The bounded prefix report covers `m=1..99`, but I did not recompute its full 56,245,000 rows. Therefore this critique does not certify the global all-m surplus at a computer-assisted grade. The claim remains OPEN pending independent full-prefix validation under the two-implementation protocol. This is not an actual-descent/eligibility statement, not a selector/payment result, and not a statement about endpoint `A_0`. No first descent or strict selector is present in this auxiliary claim; original tip identity is represented by each occurring arity, and no `r_i` multiplicity is inserted into this per-tip inequality.

## Tail argument audit (`m >= 100`)

Write `c_j=binom(N,j)`, `C=(1+2z)Q`, `e=E[k]=binom(N,k-1)`, `b=binom(N,k)/binom(N,k-1)=(N+1-k)/k`, and

`lambda=(h+1)/((k+1)(h-k+1))`.

All divisions below are by positive quantities. In the tail `N>=2m>=200`; the guard gives `1<=k< N`, `C[k],C[k-1]>0`, `e>0`, `h>=N+1`, and `h-k+1>0`.

1. **Low-rank E curvature.** Expand `Q=sum_S z^s L^(N-R)`, with `s=|S|`, `R=sum_(i in S) r_i <=4s`. The coefficient of a term is `binom(N-R,k-s)`. After cross multiplication against the positive binomial normalizers, the adjacent normalized difference has sign
   `k(N-R-k+s+1)-(k-s)(N-k+1)=s(N+1)-kR`.
   Hence it is nonnegative if `4k<=N+1`. Zero-extension boundaries do not create a negative term: a newly appearing term contributes nonnegatively; a disappearing positive term would force `N+4<=4k`, contrary to `4k<=N+1`. The empty-subset term is constant. Thus `Q[k]/c_k >= Q[k-1]/c_(k-1)` in this band and, for `k>=2`, also at `k-1`. Expanding
   `M_k(E)=c_(k-1)Q[k]-c_kQ[k-1]+2(c_(k-1)Q[k-1]-c_kQ[k-2])`
   proves `M_k(E)>=0`; at `k=1` the second bracket is positive by `Q[-1]=0`. The first surplus term is strictly positive because all factors of `U_i` and `C` have positive coefficients throughout their relevant support.

2. **Complementary-band singleton exponent.** When `4k>N+1`, each unmarked branch contributes
   `g_r=(2r/(2r+1))*binom(N-r,k-1)/binom(N,k)`.
   Direct cancellation gives `g3/g2=(15/14)(N-k-1)/(N-2)` and `g4/g3=(28/27)(N-k-2)/(N-3)`. These are at most one precisely when `N+13<=15k` and `N+25<=28k`, both implied by `4k>N+1` for `N>=200`. Thus `g2>=g3>=g4`. Also
   `g4(k+1)/g4(k)=(k+1)(N-k-3)/(k(N-k))<=1`
   whenever `4k>=N-3`; this condition holds throughout the complementary band. The minimum is therefore at `K=floor((N+2)/2)`. For `N=2s`, `g4(N,K)>=1/20` reduces to `4s^3-88s^2+13s+240>=0`; for `N=2s+1`, it reduces to `4s^2-40s-71>=0`. Both hold for `s>=100` (the even polynomial is `4s^2(s-22)+13s+240`).

3. **Jensen application to the literal marked product.** `U_i=G B_(r_i-1) product_(ell!=i) B_(r_ell)` has block sizes `1, r_i-1`, and the other `r_ell`; these are positive and sum to `N`, including `r_i=2` where the marked factor is `B_1=G`. Every coefficient floor hypothesis of the formally verified finite-block Jensen theorem applies to each `B_a=L^a+z`, with integer monomial coefficients. The root and marked-block exponent contributions are nonnegative. The `m-1` unmarked blocks each contribute at least `1/20`, so
   `U_i[k] >= binom(N,k) exp((m-1)/20)`.
   Put `a=99/20`, `t=(m-100)/20>=0`. The degree-8 and degree-7 Taylor polynomials have positive coefficients, so `E8(a+t)>=E8(a)+t E7(a)>102+20t=m+2`; and `exp(x)>=E8(x)` for `x>=0`. This establishes `exp((m-1)/20)>m+2`. Exact rational checks give `E8(99/20)=2162945642595007/16384000000000>102` and `E7(99/20)=88220922596671/716800000000>20`.

4. **Pay the deficit with signs preserved.** The coefficient lists in powers of `z` for `(3+2z)F'-2 deg(F)F` are `G:[4,0]`, `B2:[5,0,0]`, `B3:[6,2,3,0]`, `B4:[7,6,12,4,0]`. The product rule gives `(3+2z)C'-2(N+1)C >=0` coefficientwise. Its `z^(k-1)` coefficient yields the positive ratio bound `C[k]/C[k-1] >= 2(N+2-k)/(3k)`. Inverting positive ratios gives `C[k-1]/C[k] <= 3k/(2(N+2-k))`. Consequently
   `M_k(E)/(e C[k]) = 1-b C[k-1]/C[k] >= 1-3(N+1-k)/(2(N+2-k)) > -1/2`.
   The minus sign matters: replacing the upper bound on `C[k-1]/C[k]` inside `-b C[k-1]/C[k]` reverses the inequality; it does not preserve it. Here `b>0`, and `N+2-k>0`.

   Since `h>=N+1`, `lambda>1/(k+1)>=2/(N+4)` under `2k<=N+2`; also `b>=N/(N+2)`. All multiplier factors are positive. Thus
   `lambda U_i[k]/e > 2N(m+2)/((N+4)(N+2)) >=1/2`,
   because `4N(m+2)-(N+4)(N+2)=4Nm-N^2+2N-8 >=2N-8>0` using `N<=4m` and `N>=200`. Combining this strict positive quantity with `M_k(E)/(eC[k])>-1/2` proves `lambda U_i[k]C[k]+M_k(E)>0`. Multiplication by the positive `(k+1)(h-k+1)` gives the proposed strict surplus. This division and multiplication do not reverse order; the only negative multiplier above is handled explicitly.

I independently evaluated the factor operator coefficients and exact parity-midpoint floor over `N=200..2000` at every complementary-band rank, and exact Taylor constants; this is a spot check, not the universal proof. The universal inequalities above follow from the displayed algebra.

## Finite-prefix instrument review

The authorized C6-T2 report declares a complete `m=1..99` run: 171,699 profiles, 56,245,000 represented-type/rank tests, no negative margins, minimum `98` at `(a2,a3,a4)=(1,0,0), N=2,h=3,r=2,k=1`, and no eligibility filtering. Its source is monomial-array arithmetic and exact constant-one cofactor division. I inspected the report, frozen source, per-m aggregate, protocol and expected-count table. The coverage formula and totals agree; the report states all per-m counts matched the expected table. I did not rerun all rows or independently audit all checkpoint minima. Thus those results remain finite bounded evidence in this critique, not an independent second full implementation.

I independently constructed direct factor products (without cofactor division) for exact spot checks. The minimum witness gives `U[1]=4, C[1]=5, C[0]=1, E[1]=1, E[2]=2`, hence `S=98` and full tip minor `19`. The `n=91` isolated-E negative control has the reported positive full tip minor; `n=122, (38,0,1), r=4,k=77` reproduces full minor `-49239834336` and is outside the guard (`floor((N+2)/2)=41`). The arrays are in monomial `z` powers: `B1=[1,2]`, `B2=[1,3,1]`, `B3=[1,4,3,1]`, `B4=[1,5,6,4,1]`; no coefficient list was interpreted as powers of `L`.

The prefix protocol calls for two independently authored implementations for a computer-assisted promotion. My spot checks do not satisfy that requirement. No failed argument or realizable guarded surplus counterexample was found. A negative `E` term/control alone is not a full tip failure, and the supplied `k=77` negative full-minor control lies outside this claim's guard.

## Integrity, replay and scope

All 275 actual member byte hashes in `manifests/C6-COMMON-DISPATCH.json` match; every packet-listed source hash also matches. I used only the common dispatch members and C6-T2 packet sources. I copied the producer prefix script into my scratch before any source examination/execution; the producer was not executed. My independent scripts use only Python standard library and were run with `PYTHONDONTWRITEBYTECODE=1`:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CU-T2/analytic_tail_checks.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CU-T2/independent_spotcheck.py
```

Retained independent outputs: `cycles/cycle-6/C6-CU-T2/independent_spotcheck_result.json`. `producer_prefix_A_review_copy.py` is preserved only as a review copy and was not run. No finite prefix result implies the tail; no tail-only theorem proves `m<100`; neither implies primary payment, strict selectors, first descent, original-tag multiplicity summation, or the primary aggregate. No Lean build was run.
