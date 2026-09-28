# C3-CU-T1 — independent critique of C3-T1

## Dispositions

I retain C3-T1's `m >= 120` branchwise coefficient argument, and its resulting selected-MASS implication when a branch is selected or the selection is empty. The proof uses the actual least strict parent descent, including the terminal zero-extended difference, and keeps all three eligibility guards. It does not prove the all-`m` MASS or payment claims: `m < 120` and endpoint-only selection remain uncovered. In the endpoint-only case `A=0` and `b=1`, so payment would require a separate selector exclusion.

The audited shared sources, the four packet inputs, and all manifest seals matched their stated SHA-256 values. `manifest_verification.json` retains the counts and zero-mismatch result.

## Proof audit: branchwise bound for `m >= 120`

Use the contract's notation. At an actual eligible `p`, the coefficient-only theorem `E993-PATH-STAR-ARITY-2-4-ANY-STRICT-DESCENT-RANK-2N5` applies to the actual parent polynomial and gives `2N <= 5x` at its actual first strict descent `x`. Thus `x > (2N-1)/5`; the guard `x+2 <= p` gives `j=p-2 >= x`, and `2p <= alpha=N+2` gives `2j <= N-2`. These are the rank facts used below; no descent is replaced by a later or non-strict one.

Fix a represented branch of arity `r in {2,3,4}` and let `M=N-r`. The shifts in `F_r` are `s=0,...,r-2` (and the enclosing `G` adds at most one more shift), so it suffices to establish the slightly wider band `k=j-s` for `0<=s<=r-1`. Since `N>=2m>=240`, `M>=236`. From `j>(2N-1)/5`, the lower endpoint follows from `N>=10r-12`; this holds separately for `r=2,3,4`. The upper bound follows from `2j<=N-2` and `r<=4`: `k<=j<=(N-2)/2<=M/2+1`.

For the other `m-1` branch blocks, a fixed-size `k`-subset of their `M` individual leaves has normalized weight

`product_a (1 + (1/r_a) 1[block a is a singleton])`.

This is exactly the coefficient convolution for `H_i=product_{a!=i} B_(r_a)`: the singleton coefficient of `B_r=(1+z)^r+z` is `r+1`, so each of its `r` singleton subsets receives weight `1+1/r`. If `p_a` is the probability that a size-`k` uniform subset intersects a size-`a` block once, then

`H_i[k]/binom(M,k) = E product_a(1 + 1/r_a * 1[singleton])`

`>= exp(sum_a p_a log(1+1/r_a)) >= exp(sum_a 2p_a/(2r_a+1))`.

The first inequality is Jensen for the convex exponential; the second follows from `log(1+u)>=2u/(2+u)` at `u=1/r_a`. On `M/3<=k<=M/2+1`, the exact hypergeometric probability is `p_a=a*binom(M-a,k-1)/binom(M,k)`. For `a=2`, it is `2k(M-k)/(M(M-1))`, a concave quadratic whose minimum on the interval is at an endpoint; both endpoint values are at least `1/8`. For `a=3`, factoring the probability and using `k/M>=1/3`, `M-k>=M/2-1`, and `M-k-1>=M/2-2` gives `p_3 >= (M-4)/(4(M-1)) >= 7/40`. For `a=4`, the real extension is decreasing on the band: its logarithmic derivative is at most `1/k-3/(M-k)<=0`, since `k>=M/3`. Its value at `M/2+1` is `(M+2)(M-4)(M-6)/(4M(M-1)(M-3)) >=9/40`; after clearing positive denominators this last inequality is `M^3-44M^2+13M+480>=0`, which equals `d^3+88d^2+1949d+1052` for `d=M-44>=0`. Thus in all three cases `2p_a/(2a+1)>=1/20`. There are `m-1` blocks, so

`H_i[k] >= exp((m-1)/20) binom(M,k)`.

Because `F_r` contains `L^(r-2)` and all coefficients are nonnegative, convolving these shiftwise bounds gives

`T_i[j] >= exp((m-1)/20) [z^j](G L^(N-2))`.

The coefficient ratio to `binom(N,j)` is `1-j(j-1)/(N(N-1))`, at least `3/4` from `2j<=N-2`. Also

`delta D_j/binom(N,j) = (N+1-j)(N-2j-1)/(j+1) < 3(N-3)/10 < 3N/10 <= 6m/5`.

For the strict inequality, the numerator after clearing positive denominators is `f(j)=-20j^2+(33N+1)j-10N^2+3N+1`. It vanishes at `(2N-1)/5`; at `(N-2)/2` it is `(3N^2-19N-40)/2>0` for `N>=240`. Concavity puts `f` above its endpoint chord, and the actual rank bound puts `j` strictly between those endpoints. Therefore it is positive.

Finally, put `a=119/20` and `t=(m-120)/20>=0`. For `E_d(u)=sum_{h=0}^d u^h/h!`, nonnegative expansion gives `exp((m-1)/20)>=E_8(a+t)>=E_8(a)+tE_7(a)`. Exact rational values are

`E_8(a)=48232104261912983/147456000000000 > 288`,

`E_7(a)=265545425322997/921600000000 > 48`.

Hence `exp((m-1)/20)>12m/5`. Combining the coefficient and debt bounds yields

`T_i[j]/binom(N,j) > (3/4)(12m/5)=9m/5 > (3/2)delta D_j/binom(N,j)`,

so the stronger strict inequality `2T_i[j] > 3 delta D_j` holds for every represented branch throughout `m>=120`. This establishes the corresponding restriction of the all-`m` branchwise MASS claim without selector assumptions.

## Selector consequences and limits

At the actual current `p`, retain `e0=1[Delta_p A0<0]`, `ei=1[Delta_p Ai<0]`, `w=sum_i r_i ei`, `b=e0+w`, and `A=sum_i r_i ei T_i[j]`. Original branch-tip multiplicity is `r_i`, and endpoint multiplicity is one. If any branch is selected then `w>=2`, so `A>(3/2)w delta D_j >= (w+e0)delta D_j=b delta D_j`. If no tag is selected, `A=b=0`. Thus selected MASS holds for `m>=120` in those cases. MASS implies the exact-ratio payment because its coefficient after division by `C[j]` is `delta-(delta-1)t_C >=1`, where `t_C=C[j+1]/C[j]` and the contract requires `0<t_C<1`.

If only the endpoint is selected, `w=0,e0=1`, so `A=0` and `b=1`; neither MASS nor payment follows. No endpoint-only exclusion was proved. Nothing here settles `m<120`, the universal MASS claim, or the all-profile primary exact-ratio payment. Finite checks below are corroboration only, not universal proof. There is no counterexample to the exact target in this review.

## Evidence and replay

The packet-authorized T1 report/return/audit files matched their packet hashes. All 86 common-dispatch entries and all members of the two clarification transport manifests matched; the 4 packet files matched. The exact results are retained in `manifest_verification.json`.

I copied T1's `audit_m120.py` into this scratch before running it. It checked exact Taylor constants, 64,095 singleton rows for `44<=M<=500`, 198,780 debt rows for `28<=N<=2000`, and five `m=120` profiles (including an empty eligible-rank case). These are bounded probes. A separate short checker is also retained here: it independently reproduces the Taylor constants and checks 64,095 singleton rows and 196,088 coefficient/debt rows for `240<=N<=2000` with exact fractions.

From the experiment run root, replay with:

- `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-3/C3-CU-T1/verify_manifests.py "$PWD"`
- `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-3/C3-CU-T1/independent_m120_checks.py`
- `cd cycles/cycle-3/C3-CU-T1 && PYTHONDONTWRITEBYTECODE=1 python3 audit_m120.py`

No Lean build, source modification, installation, or background process was used.
