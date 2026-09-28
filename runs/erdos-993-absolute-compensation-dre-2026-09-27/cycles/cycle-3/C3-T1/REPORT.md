# C3-T1 — independent audit of the large-branch local mass route

## Disposition and exact statement

I independently prove the proposed branchwise bound on the restricted range `m >= 120`:

> For an ordinary path-star with `m >= 120`, distinct branches `r_i in {2,3,4}`, `N=sum_i r_i`, `q=N+1`, `alpha=N+2`, `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `F_r=sum_{h=0}^{r-2} L^h`, `C=G product_i B_(r_i)`, `T_i=G F_(r_i) product_{h!=i}B_(r_h)`, and `P=C+zL^q`, let `x` be the least natural `k` with `Delta_k P<0`, using integer zero extension through the terminal difference. For every natural `p` satisfying `x+2<=p`, `3p<2alpha+1`, and `2p<=alpha`, put `j=p-2`, `delta=q-j`, and `D_j=binom(N,j+1)-binom(N,j)`. Then every represented branch satisfies the strict inequality `2 T_i[j] > 3 delta D_j`.

This is only the `m>=120` subcase of `E993-PATH-STAR-ARITY-2-4-ALL-M-ACTUAL-ELIGIBLE-BRANCHWISE-THREE-HALVES-MASS`. It does not establish that registry claim on `m<120`, selected MASS, the exact-ratio payment in endpoint-only cases, or a Lean award.

## Proof

All coefficients below are zero-extended. The formally verified coefficient-only rank lemma `2N<=5k` at every strict descent applies to this actual `P`. Thus `5x>=2N`, hence `5x>2N-1`. The actual guard `x+2<=p` gives `j>=x`; the third guard gives `j<= (N-2)/2`. These are the only rank inputs used below, and `x` remains the actual first strict descent (including its terminal convention).

Fix branch `i`, write `r=r_i` and `M=N-r`. For every shift `s=0,...,r-1` in `GF_r`, set `k=j-s`. The lower bound `k>=M/3` follows separately for each arity: from `j>=x>(2N-1)/5`, it is enough that

`(2N-1)/5-r+1 >= (N-r)/3`,

which is equivalent to `N>=10r-12`. Here `N>=2m>=240`, so this holds for `r=2,3,4`. Also `k<=j<=(N-2)/2 <= M/2+1`, and `M>=N-4>=236`.

Write `H_i=product_{h!=i}B_(r_h)`. Regard a uniformly chosen `k`-subset of the `M` individual elements as partitioned into the other `m-1` branch blocks. In block `a` of size `r_a`, the coefficient of `B_(r_a)` equals the ordinary subset count, with each singleton subset receiving one extra unit. Therefore

`H_i[k]/binom(M,k) = E product_a (1 + 1/r_a * 1[block a is a singleton])`.

Jensen's inequality for `exp`, plus `log(1+1/a)>=2/(2a+1)`, bounds this ratio below by the exponential of the sum of singleton probabilities times `2/(2a+1)`. For a block of size `a`, its singleton probability is

`p_a(M,k)=a*binom(M-a,k-1)/binom(M,k)`.

On `M/3<=k<=M/2+1`, the following elementary bounds give `2p_a/(2a+1)>=1/20` for all three arities when `M>=44`:

- `a=2`: concavity of `k(M-k)` puts its minimum on this interval at an endpoint. Substitution gives endpoint values `4M/(9(M-1))` and `(M^2-4)/(2M(M-1))`, both at least `1/8`.
- `a=3`: `3k/M>=1`, and the two remaining factors give `p_3 >= (M-4)/(4(M-1)) >= 7/40`.
- `a=4`: `p_4(k+1)/p_4(k)=(k+1)(M-k-3)/(k(M-k))<=1` on the integer band. The real extension has logarithmic derivative `1/k-1/(M-k)-1/(M-k-1)-1/(M-k-2)<=1/k-3/(M-k)<=0`, so is decreasing on this band. Its value at `M/2+1` is `(M+2)(M-4)(M-6)/(4M(M-1)(M-3)) >= 9/40`; after clearing positive denominators the last inequality is `M^3-44M^2+13M+480>=0`, equal to `d^3+88d^2+1949d+1052` for `d=M-44>=0`.

Consequently `H_i[k] >= exp((m-1)/20) binom(M,k)` for every shift above. For an exact finite continuation, let `E_d(u)=sum_{h=0}^d u^h/h!`, `a=119/20`, and `t=(m-120)/20>=0`. Nonnegative binomial expansion gives `exp((m-1)/20)>=E_8(a+t)>=E_8(a)+t E_7(a)`. Exact rational arithmetic gives `E_8(a)=48232104261912983/147456000000000 >288` and `E_7(a)=265545425322997/921600000000 >48`; hence `exp((m-1)/20)>12m/5`.

Since `F_r` contains `L^(r-2)` and all coefficients are nonnegative,

`T_i[j] >= exp((m-1)/20) [z^j](G L^(N-2))`.

The exact quotient `[z^j](G L^(N-2))/binom(N,j)` is `1-j(j-1)/(N(N-1))`, at least `3/4` when `2j<=N-2`. Further,

`delta D_j/binom(N,j) = (N+1-j)(N-2j-1)/(j+1) < 3(N-3)/10 < 3N/10 <= 6m/5`.

For the strict inequality, clearing positive denominators reduces it to `f(j)>0`, where `f(j)=-20j^2+(33N+1)j-10N^2+3N+1`. This concave quadratic vanishes at `j=(2N-1)/5`, is positive at `j=(N-2)/2`, where it equals `(3N^2-19N-40)/2`, and the actual rank lemma gives `j>(2N-1)/5`; concavity places `f` above its endpoint chord. Combining the bounds yields

`T_i[j]/binom(N,j) > (3/4)(12m/5)=9m/5 > (3/2)delta D_j/binom(N,j)`,

as required.

## Consequence for the actual selectors

At the same actual `p`, retain the strict current-p flags `e0=1[Delta_p A0<0]` and `e_i=1[Delta_p A_i<0]`, where `A0=LQ+zL^N`, `A_i=G B_(r_i-1)H_i+zL^N`, and `Q=product_i B_(r_i)`. Keep the original tags: branch `i` has multiplicity `r_i`; the endpoint has multiplicity one. Thus `b=e0+sum_i r_i e_i` and `A=sum_i r_i e_i T_i[j]`.

If any branch is selected, `w=sum_i r_i e_i>=2`, so the strict local bound gives `A>(3/2)w delta D_j >= (w+e0)delta D_j=b delta D_j`. If no branch and no endpoint is selected, both sides are zero. Therefore selected MASS holds on this `m>=120` range whenever selection is not endpoint-only. Since MASS implies the exact-ratio payment under the contract's `0<t<1`, this also pays the primary predicate on those selector cases. No endpoint-only exclusion is proved here; that case remains open to this route, and no accepted aggregate-sign result was used as a premise.

## Exact checks and limits

Run `PYTHONDONTWRITEBYTECODE=1 python3 audit_m120.py` from this directory. `audit_m120.json` records exact checks of the finite Taylor constants, singleton bounds for `44<=M<=500`, the debt ratio for `28<=N<=2000`, and actual first-descent branch coefficients at five `m=120` profiles (homogeneous arities 2, 3, 4 and two balanced mixtures). The all-r2 profile has no actual eligible ranks; that empty set is recorded. These checks are adversarial spot checks only; the proof above supplies the universal `m>=120` argument. No broad profile census was run.

The computation is integer/rational and self-contained. No Lean build, source edit, or background process was used. The input packet has no `source_hashes` field; its own SHA-256 was `d92450935aa862abca2d0016d76d445370b7a90d0c6748ce75c58f81ee337302`. Every used shared source named in the common dispatch manifest matched its listed SHA-256.
