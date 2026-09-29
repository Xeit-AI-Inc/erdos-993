# C6-CF-T2 independent critique

## Disposition

The proposed analytic tail for `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS` is correct as stated for every profile with `m>=100`, every represented tip, and every integer `1<=k` with `2k<=N+2`. I found no sign, support, parity, or factorization defect. This is a narrowed informal proof of the tail, not a resolution of the registered all-`m` claim. The complete `m=1..99` result in the authorized C6-T2 case is one exact instrument; this critic has not independently replayed the whole prefix with a second implementation. It remains bounded evidence pending the independent implementation/reconciliation required by the prefix protocol.

## Independent check of the tail argument

Write `B_r=L^r+z`, `Q=prod B_{r_i}`, `C=GQ`, `E=zL^N`, `U_i=G B_{r_i-1} H_i`, and

`S_i(k)=(h+1)U_i[k]C[k]+(k+1)(h-k+1)M_k(E)`,

where `M_k(E)=E[k]C[k]-E[k+1]C[k-1]`. Here `N>=2m>=200`, `h=1+2a_2+4a_3+7a_4>=N+1`, and the guard gives `1<=k<=floor((N+2)/2)`. All coefficients below are in the monomial `z` basis and zero-extended.

**Low band, including support boundaries.** Expand

`Q=sum_{S subset [m]} z^s L^(N-R)`, with `s=|S|` and `R=sum_{i in S}r_i<=4s`.

For one summand `f=z^sL^(N-R)`, on positive adjacent support the sign of

`f[k]/binom(N,k) - f[k-1]/binom(N,k-1)`

is the sign of `s(N+1)-kR`: cross multiplication gives `k(N-R-k+s+1)-(k-s)(N-k+1)=s(N+1)-kR`. Thus for `4k<=N+1` this difference is nonnegative. If the term first appears at `k`, its contribution is nonnegative. A positive term cannot disappear from `k-1` to `k` in this band: disappearance would give `N-R=k-1-s`, `s<=k-1`; with `R<=4s` this implies `N+4<=4k`, contradicting `4k<=N+1`. Therefore the zero-extended term comparison holds at both support edges. Summing over `S` gives `Q[k]/c_k>=Q[k-1]/c_(k-1)`, `c_j=binom(N,j)`. The same comparison at rank `k-1` is available when `k>=2`.

Since `C[k]=Q[k]+2Q[k-1]`,

`c_(k-1)C[k]-c_k C[k-1] = (c_(k-1)Q[k]-c_kQ[k-1]) + 2(c_(k-1)Q[k-1]-c_kQ[k-2]) >=0`.

For `k=1`, the second bracket is positive by `Q[-1]=0`; the first is nonnegative. As `E[k]=c_(k-1)` and `E[k+1]=c_k`, this proves `M_k(E)>=0` throughout the low band. Each factor of `U_i` has positive coefficients on its full interval support and their degrees sum to `N`, so `U_i[k]C[k]>0` for `1<=k<=N`. Also `h-k+1>0`. Hence `S_i(k)>0` in the low band.

**High band, marked-block Jensen floor.** The complementary band is `4k>N+1`, hence `k>N/4`. For a block of size `r`, the exact full coefficient theorem applied to `U_i=G B_(r_i-1) prod_(ell!=i) B_(r_ell)` at total size `N` and the same rank `k` gives

`U_i[k]>=binom(N,k) exp(sum block_exponents)`.

The block sizes sum to `1+(r_i-1)+(N-r_i)=N`; when `r_i=2`, the marked block is size one and is still an ordinary `B_1` block. The root and marked block contribute nonnegative exponent. Each unmarked block of size `r` contributes

`g_r(N,k)=(2r/(2r+1))*binom(N-r,k-1)/binom(N,k)`.

The positive arity ratios are `g_3/g_2=(15/14)(N-k-1)/(N-2)` and `g_4/g_3=(28/27)(N-k-2)/(N-3)`. They are at most one because respectively `15k>=N+13` and `28k>=N+25`; these follow from `k>N/4` and `N>=200`. Thus `g_r>=g_4`. Also

`g_4(N,k+1)/g_4(N,k)=(k+1)(N-k-3)/(k(N-k))<=1`

in this band, as this is equivalent to `N-4k-3<=0`. So the minimum occurs at the largest guarded rank `K=floor((N+2)/2)`.

For `N=2s`, `K=s+1` and

`g_4(N,K)=(2/9)*(s+1)(s-2)(s-3)/(s(2s-1)(2s-3))`.

After multiplying by the positive denominator, `g_4>=1/20` is equivalent to `4s^3-88s^2+13s+240=4s^2(s-22)+13s+240>=0`, true for `s>=100`. For `N=2s+1`,

`g_4(N,K)=(2/9)*(s+1)(s-2)/((2s+1)(2s-1))`;

clearing its positive denominator gives `4s^2-40s-71=4(s-100)^2+760(s-100)+35929>0`. Hence every unmarked block contributes at least `1/20`.

There are `m-1` unmarked blocks, so `U_i[k]>=binom(N,k)exp((m-1)/20)`. Put `a=99/20` and `t=(m-100)/20>=0`. The positive-coefficient Taylor polynomial satisfies `exp(a+t)>=E_8(a+t)>=E_8(a)+tE_7(a)>102+20t=m+2`; exact fractions are in `audit_tail_arithmetic.json`. Consequently

`U_i[k]/E[k] > ((N+1-k)/k)(m+2)`,

where `E[k]=binom(N,k-1)>0`.

**Paying the negative curvature allowance.** For a factor `F` of degree `d`, define `D_d(F)=(3+2z)F'-2dF`. In the monomial basis, direct expansion gives `G=B_1=(1,2): (4)`, `B_2=(1,3,1): (5)`, `B_3=(1,4,3,1): (6,2,3)`, and `B_4=(1,5,6,4,1): (7,6,12,4)`. These are nonnegative; they are not coefficient lists in powers of `L`. The product rule `D_(d+e)(FG)=G D_d(F)+F D_e(G)` therefore proves `D_(N+1)(C)>=0` coefficientwise.

Its coefficient at `z^(k-1)` is `3k C[k]-2(N+2-k)C[k-1]>=0`, giving

`C[k]/C[k-1]>=rho=2(N+2-k)/(3k)>0`.

All divisions here use positive `C[k-1]`, `C[k]`, and `rho`. Let `b=E[k+1]/E[k]=(N+1-k)/k>0`. Then

`M_k(E)/(E[k]C[k]) = 1-b*C[k-1]/C[k] >= 1-b/rho = 1-(3/2)(N+1-k)/(N+2-k)>-1/2`.

The inverse-ratio step preserves order; multiplying by `-b<0` reverses it. The final inequality is strict because `(N+1-k)/(N+2-k)<1`.

Set `lambda=(h+1)/((k+1)(h-k+1))`; its denominator is positive, `h+1>h-k+1` since `k>0`, and the guard gives `k+1<=(N+4)/2`. Thus `lambda>1/(k+1)>=2/(N+4)`. The function `b=(N+1-k)/k` decreases with `k`; at the guarded maximum it is `N/(N+2)` for even `N` and `1` for odd `N`, so `b>=N/(N+2)`. From `N<=4m` and `N>=200`,

`4N(m+2)-(N+4)(N+2) >= 2N-8>0`,

so `2N(m+2)/((N+4)(N+2))>=1/2`. Combining the positive lower bounds,

`lambda U_i[k]/E[k] > 2N(m+2)/((N+4)(N+2)) >=1/2`.

Thus `lambda U_i[k]C[k]+M_k(E)>0`. Multiplication by the positive `(k+1)(h-k+1)` yields `S_i(k)>0`. This covers the entire high band and completes the `m>=100` tail.

## Exact spot checks and evidence limits

`audit_tail_arithmetic.py` uses `Fraction` and integer binomials. It checks the even/odd closed forms against direct `g_4` at `N=200,201,202,203,400,401`; the low/high transition and guarded endpoints around `N=200..203`; exact `E_8(99/20)>102`, `E_7(99/20)>20`; monomial differential-operator arrays; and inequality direction under a negative multiplier. At the boundary `N=200,k=101`, for example, `g_4=480053/8820675>1/20` and the normalized curvature lower bound is `-49/101>-1/2`. These checks corroborate boundary arithmetic; the universal proof is the inequalities above, not sampling.

I verified all 275 actual member hashes in `manifests/C6-COMMON-DISPATCH.json` and all 115 packet source hashes against their listed SHA-256 values; there were no mismatches. The authorized C6-T2 report records complete exact `m=1..99` coverage (171,699 profiles; 56,245,000 represented-tip/rank rows) and minimum margin `98`. Inspection of its frozen array instrument confirms `B_1=(1,2)`, zero extension, all represented types and the unfiltered guard. That is one instrument only; I did not execute it or its control script. I therefore treat its finite result as bounded evidence, not as an independently duplicated prefix certificate. The C6 full Jensen theorem is a dependency; this tail composition is not itself a Lean award. No actual-first-descent, selectors, original multiplicities, endpoint, individual/weighted comparison, selected MASS, exact-ratio payment, or arbitrary-tree conclusion follows from this tip-surplus proof alone.

Replay my exact arithmetic checks from this directory with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 audit_tail_arithmetic.py > audit_tail_arithmetic.json
```
