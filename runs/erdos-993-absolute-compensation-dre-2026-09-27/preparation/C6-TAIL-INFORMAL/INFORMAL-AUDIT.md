---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: C6-TAIL-FORMALIZER
critic_id: C6-TAIL-INFORMAL
attestation_id: e993-c6-tail-informal-2026-09-28
claim_sha256: 44697c8441f595f89b6f3e4eb316c5a1cac9cce9b091fb50d5ef490c947f27e7
---

# Informal Proof Integrity Audit

## Intended Claim

For every natural m>=100, every function r from Fin m to the natural numbers with r_i in {2,3,4}, every i in Fin m, and every natural k with 1<=k and 2k<=N+2, put N=sum_j r_j, h=1+sum_j w(r_j), where w(2)=2,w(3)=4,w(4)=7. In the real polynomial ring let L=1+X, B_a=L^a+X, C=B_1 product_j B_(r_j), U_i=B_1 B_(r_i-1) product_(j!=i) B_(r_j), and E=X L^N. Then (h+1)U_i[k]C[k]+(k+1)(h-k+1)(E[k]C[k]-E[k+1]C[k-1]) is strictly positive. Brackets mean actual monomial coefficients with zero extension. The subtraction h-k+1 in the expression is real subtraction; k>=1 guards the natural coefficient index k-1. All repeated and mixed arity profiles and both parity endpoints are included. There is no actual-first-descent, selector, assumed ULC, main-product LR or numerical-prefix hypothesis. No assertion is made for m<100, for the endpoint deletion, for a full shifted-comparison minor, for selected payment, or for arbitrary trees.

I recomputed SHA-256 of `' '.join(informal_statement.split()).encode()` from `THEOREM-CONTRACT.yaml`: `44697c8441f595f89b6f3e4eb316c5a1cac9cce9b091fb50d5ef490c947f27e7`. All 17 files listed by `C6-TAIL-INFORMAL-INPUTS.json` existed and matched their individual SHA-256 values, including both receipts, both contract views, the encoding, the three verified mathematical sources and their reports. The theorem-contract receipt says structural validity, expressly not mathematical truth; the reviewer-assignment receipt identifies this reviewer separately from the producer and fidelity reviewer. The mathematical argument below uses the permitted sources only for their actual statements and direct bridges to these polynomials.

## Reproduced Mathematical Evidence

### Literal encoding and positive ranges

Write `Q=∏_j B_(r_j)` and `c_t=binom(N,t)`, with binomial coefficients zero outside `0<=t<=N`. The six definitions in `ENCODING-SPEC.lean` are exactly `B_a=(1+X)^a+X`, `N=∑r_j`, `h=1+∑w(r_j)` (the fallback weight 7 applies only to arity 4), `C=B_1 Q`, `U_i=B_1 B_(r_i-1)∏_(j≠i)B_(r_j)`, and `E=X(1+X)^N`. The `Finset.erase i` product is over the labeled indices other than `i`, so repeated arities still give distinct factors. Since every arity is 2, 3 or 4, `2m<=N<=4m`, `h>=N+1`, and `N>=200`. The guard gives `1<=k<=K=floor((N+2)/2)<=N`. In particular `h-k+1>=N+2-k>0` **as a real number**, and the natural index `k-1` is well-defined without truncation ambiguity. The monomial coefficient of `E` is `E[k]=c_(k-1)` and `E[k+1]=c_k`.

Every factor `B_a` with `a>=1` is coefficientwise at least `L^a`. Hence `U_i>=L^N` coefficientwise and `C>=L^(N+1)` coefficientwise: at every guarded rank, `U_i[k]>=c_k>0` and `C[k]>=binom(N+1,k)>0`. This includes the root `B_1=1+2X` and the marked `B_(r_i-1)=B_1` when `r_i=2`. All later divisions use positive quantities.

Put `M=E[k]C[k]-E[k+1]C[k-1]` and `S=(h+1)U_i[k]C[k]+(k+1)(h-k+1)M`. The two bands `4k<=N+1` and `4k>N+1` partition every guarded integer rank.

### Low band: the exact binomial minor

Expanding each `B_r=L^r+X` by its chosen `X` term gives, with `s=|T|` and `R=∑_(j∈T)r_j`, the literal polynomial identity

`Q=∑_(T⊆Fin m) X^s L^(N-R)`, where `0<=R<=4s`.

The `T` term at rank `j` is `q_T(j)=binom(N-R,j-s)` with zero extension. This is the C3 center expansion specialized from its natural-coefficient polynomial to the same integer coefficients embedded in `Polynomial ℝ`; no theorem is inferred merely from a matching name. If `q_T(k-1)` and `q_T(k)` are both positive, comparison after multiplication by `c_(k-1)c_k>0` has the sign of

`k(N-R-k+s+1)-(k-s)(N-k+1)=s(N+1)-kR>=s(N+1-4k)>=0`.

If a term appears at `k`, its contribution to `c_(k-1)Q[k]-c_k Q[k-1]` is nonnegative. If a term were positive at `k-1` and absent at `k`, its upper support boundary would give `N-R=k-1-s`, with `s<=k-1`. Consequently `N=R+k-1-s<=k-1+3s<=4k-4`, contradicting `4k<=N+1`. Thus no disappearing term is missed. The empty subset has normalized value one throughout. Summing proves `Q[k]/c_k>=Q[k-1]/c_(k-1)`. For `k>=2`, the identical argument at rank `k-1` is valid because `4(k-1)<=N+1`.

Since `C=Q+2XQ`, expansion gives

`M=[c_(k-1)Q[k]-c_k Q[k-1]] + 2[c_(k-1)Q[k-1]-c_k Q[k-2]]`.

The first bracket is nonnegative by the comparison just proved. For `k>=2`, normalized rise at the **preceding** rank says `Q[k-1]/c_(k-1)>=Q[k-2]/c_(k-2)`. Multiplying by positive denominators and using binomial log concavity `c_(k-1)^2>=c_k c_(k-2)` proves the second bracket nonnegative. Both facts are needed. For `k=1`, `Q[-1]=0` by monomial zero extension and the second bracket is `c_0 Q[0]>0`. Thus `M>=0` throughout the low band, while `(h+1)U_i[k]C[k]>0`; hence `S>0` there.

### Complementary band: direct full Jensen application

Now `4k>N+1`, so `k>N/4`. Form a finite block index set consisting of a root block, the marked block, and the `m-1` other labeled branches. Assign sizes `1`, `r_i-1`, and `r_j` for `j≠i`; each is positive and their sum is `1+(r_i-1)+(N-r_i)=N`. The C4 theorem `e993_finite_block_coefficient_jensen` applies to the product of the coefficient arrays `f_a(t)=binom(a,t)+1_(t=1)` for these blocks. Indeed `∑_(t=0)^a f_a(t)X^t=B_a` for every `a>=1`, including **both** size-one blocks; the excess at coefficient one is exactly **1**, so `f_a(1)=a+1`, not an excess of `a`. Its block product is literally `U_i`, its block mass is `c_k`, and its rank hypothesis is `k<=N`. The coefficient floor holds for every `0<=t<=a`.

In the C4 exponent formula, the nonnegative block contribution at `t=1` for a block of size `a` is

`g_a(N,k)=[2a/(2a+1)] binom(N-a,k-1)/binom(N,k)`.

The marginal weight is `binom(a,1)binom(N-a,k-1)/c_k = a binom(N-a,k-1)/c_k`; multiplying by the normalized excess `2((a+1)-a)/((a+1)+a)=2/(2a+1)` gives exactly `g_a`. All other terms are zero for these literal factors; in particular root and marked contributions are nonnegative. On this band `k>=1`, `k<=K`, `N>=200`, and `a<=4`, so every displayed binomial and denominator is positive.

For the unmarked sizes, cancellation of positive binomial ratios yields

`g_3/g_2=(15/14)(N-k-1)/(N-2)` and `g_4/g_3=(28/27)(N-k-2)/(N-3)`.

These are at most one exactly when `N+13<=15k` and `N+25<=28k`. Since `k>N/4` and `N>=200`, the first follows from `15k>15N/4>=N+13`; the second follows from `28k>7N>=N+25`. Thus `g_2>=g_3>=g_4`. Also

`g_4(N,k+1)/g_4(N,k)=(k+1)(N-k-3)/(k(N-k))<=1`

exactly when `4k+3>=N`, which follows from `4k>N+1`. For successive ranks up to `K`, all factors are positive. Hence the smallest `g_4` in the band is its value at `K`, including the even case `K=N/2+1` and the odd case `K=(N+1)/2`.

For `N=2s`, `s>=100`, direct factorial cancellation at `K=s+1` gives

`g_4=(2/9)(s+1)(s-2)(s-3)/[s(2s-1)(2s-3)]`.

After multiplication by its positive denominator, `g_4>=1/20` is exactly `4s^3-88s^2+13s+240=4s^2(s-22)+13s+240>=0`. For `N=2s+1`, `s>=100`, `K=s+1`, the exact value is

`g_4=(2/9)(s+1)(s-2)/[(2s+1)(2s-1)]`;

the equivalent cleared numerator is `4s^2-40s-71>0`. Therefore each of the `m-1` unmarked blocks contributes at least `1/20` to the C4 exponent. Its full theorem, after the explicit product and exponent bridges above, gives

`U_i[k]>=c_k exp((m-1)/20)`.

For `A=99/20` and `t=(m-100)/20>=0`, `(m-1)/20=A+t`. With `E_d(x)=∑_(j=0)^d x^j/j!`, my exact rational calculations give

`E_7(A)=88220922596671/716800000000 >20`,

`E_8(A)=2162945642595007/16384000000000 >102`.

Every term of the polynomial shift is nonnegative, and its constant and linear terms yield `E_8(A+t)>=E_8(A)+t E_7(A)>102+20t=m+2`. The exponential series is at least `E_8(A+t)` for nonnegative `A+t`. Thus the strict, universal coefficient bound is `U_i[k]>c_k(m+2)`.

### Exact deficit payment

Let `D_d(P)=(3+2X)P'-2dP`. Direct monomial expansion for `B_1,B_2,B_3,B_4` gives `D_a(B_a)` coefficient lists `(4)`, `(5)`, `(6,2,3)`, `(7,6,12,4)` respectively; their `B_a` lists are `(1,2)`, `(1,3,1)`, `(1,4,3,1)`, `(1,5,6,4,1)`. These are the actual monomial-`X` coefficients. The C2 product identity `D_(a+b)(PQ)=D_a(P)Q+P D_b(Q)`, together with nonnegative coefficients, therefore gives `D_(N+1)(C)>=0` coefficientwise. Here the C2 rational polynomial identities transfer to the literal real `C` by coefficient inclusion; the root has size 1 and the other sizes sum to `N`. At coefficient `k-1`, direct differentiation gives

`3k C[k]-2(N+2-k)C[k-1]>=0`, hence `C[k]/C[k-1]>=2(N+2-k)/(3k)>0`.

Set `e=c_(k-1)>0`, `b=c_k/e=(N+1-k)/k>0`, and `λ=(h+1)/[(k+1)(h-k+1)]>0`. The reciprocal of the positive C-ratio bound gives

`M/(e C[k])=1-b C[k-1]/C[k]>=1-(3/2)(N+1-k)/(N+2-k)>-1/2`.

The last strict inequality is equivalent, after multiplying by the positive `N+2-k`, to `2k<N+3`; the guard gives `2k<=N+2`. Also `λ>1/(k+1)>=2/(N+4)`: the first inequality uses `h+1>h-k+1`, and the second uses `2k<=N+2`. Finally

`b=(N+1-k)/k>=N/(N+2)`

because cross multiplication reduces to `(N+1)(N+2-2k)>=0`. Using `U_i[k]>c_k(m+2)=eb(m+2)`, all factors being positive, gives

`λ U_i[k]/e > 2N(m+2)/[(N+4)(N+2)] > 1/2`.

The final strict sign clears through positive denominators to `4N(m+2)>(N+4)(N+2)`. Indeed `N<=4m` implies the left-minus-right difference is at least `2N-8>0`, since `N>=200`. Thus `λ U_i[k]/e+M/(e C[k])>0`. Multiplication by `e C[k](k+1)(h-k+1)>0` recovers exactly `S>0`, with the contract's real subtraction and its unshifted coefficients.

## Independent Critic Pass

- **Support and endpoints.** I derived the cross product before using a ratio, checked new and disappearing subset terms with zero extension, and treated `k=1` separately. The binomial log concavity step is indispensable for the second bracket. At even `N=200`, the guard endpoint is `k=101`; at odd `N=201`, it is `k=101`. Neither endpoint is dropped by the band split.
- **Jensen fidelity.** The C4 source theorem assumes positive block sizes, a coefficient floor and `k<=sum sizes`; all three are proved above for the exact root/marked/unmarked product. The hypergeometric marginal has factor `a`, while the local excess is one. Treating the excess as `a` would produce a false exponent. The root and marked size-one factors are valid and contribute nonnegative exponent terms. No shifted convolution or assumed independence is used.
- **Inequality directions.** The C-ratio is divided and reciprocated only after positivity is established. The E-minor can be negative in the complementary band; the proof uses its explicit lower bound, not an unjustified nonnegativity claim. The strict half-margin survives the inclusive guard endpoint. The real factor `h-k+1` is positive by the actual profile weights; it is never interpreted as a truncated natural subtraction.
- **Independent exact diagnostics.** Integer convolution of the literal monomial arrays, with zero extension, checked `m=100` profiles all-2, all-3, all-4, the mixed labeled sequence `(2,3,4)` repeated 33 times followed by `2` (marking a 3), and 99 twos followed by a marked 4. For each, I checked `k=1`, the last low-band rank, the first complementary rank, an interior rank, and `K`. Every computed surplus was strictly positive. The E-minor was negative at `k=151` for all-3, at `k=133,201` for all-4, and at the mixed odd endpoint `k=150`, confirming that the complementary argument pays an actual adverse term. Exact independent midpoint values are `g_4(200,101)=480053/8820675>1/20` and `g_4(201,101)=19796/359991>1/20`. These are diagnostics, not a finite substitute for the universal proof.
- **Scope and dependencies.** The C3 expansion, C4 full finite-block theorem and C2 operator identities were read at their actual definitions and matched to these polynomials by the explicit bridges above. The supplied reports describe those source results as separately verified; this audit did not run Lean or certify the new specialization in Lean. It assumes ordinary polynomial coefficient algebra, binomial identities and the stated full C4 Jensen theorem. No actual first descent, eligibility, selector, assumed ULC, assumed main-product LR, finite-prefix evidence or target axiom enters this proof. Source prose that discusses endpoint or full-minor implications is outside this claim.

## Verdict

**Passed as an independent informal proof-integrity audit of the exact strict `m>=100` tip surplus.** The proof covers every labeled mixed or repeated arity-2/3/4 profile, every marked index, and every guarded natural rank, including both parity endpoints. This verdict is mathematical and informal; it is not a Lean build, a formalization fidelity award, a canonical receipt, or a statement about `m<100`, endpoint deletion, full shifted minors, selected payment or arbitrary trees.
