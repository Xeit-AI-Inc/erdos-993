# C3-CU-F1 critique

## Scope and source validation

I reviewed the sole required claim, `E993-PATH-STAR-COFACTOR-JENSEN-EXPONENT-ADJACENT-ARITY-BALANCING`, and completed the scalar-certificate audit assigned by `C3-CRITIQUE-SOURCE-RECONCILIATION.md`. The packet's two allowed C3-F1 files match their packet hashes. All 86 members of `C3-COMMON-DISPATCH.json`, the four C3-F1 dispatch members, and the transport/reconciliation members in `C3-TRANSPORT-CLARIFICATION.json` and `C3-CRITIQUE-TRANSPORT.json` match their manifests. The v3/v4 seat runner prompt construction includes the shared-source clarification and keeps case files additive to shared neutral sources. This resolves the earlier C3-F1 report's source-access limitation; that limitation was a dispatch interpretation, not a mathematical objection. I did not invoke a runner or controller operation.

For the actual family context, the original ordinary-tree tags remain vertex 2 and each branch’s original r_i private tips (r_i in {2,3,4}); supports are not recomputed after deletion. The parent is P=C+zL^q and x is the least natural k with Delta_k P<0, including the terminal difference. Actual eligible lower-half p retains all guards x+2<=p, 3p<2alpha+1, and 2p<=alpha. With j=p-2, current-p selectors remain e0=1[Delta_p A0<0] and ei=1[Delta_p Ai<0], with each selected branch weighted by its original r_i multiplicity. The abstract balancing claim neither changes nor relaxes these definitions.

The exponent-balancing claim is correct at its stated scope. For `M>=10`, `0<=k<=M`, `3k>=M`, and zero-extended binomials, if `k=M` all three `g_r` vanish. Otherwise set `y=M-k`, `K=binom(M-2,k-1)/binom(M,k)>0`, `u=(y-1)/(M-2)`, `v=(y-2)/(M-3)`. Direct quotient cancellation gives

`g2-2g3+g4 = K(4/5 - 12u/7 + 8uv/9)`.

Since `y<=2M/3`, `0<=u<=(2M/3-1)/(M-2)<=5/7` for `M>=9`. Also `u-v=(M-y-1)/((M-2)(M-3))>=0`. If `y=1`, `uv=0`; if `y>=2`, then `v>=0` and `uv<=u^2`. Hence the bracket is at least `4/5-12u/7+8u^2/9`. Its derivative `-12/7+16u/9` is negative on `[0,5/7]`, and its value at `5/7` is `64/2205>0`. Thus the three-point sequence is discretely convex. At fixed branch count `m'` and weighted count `M`, replacing one arity-2 and one arity-4 block by two arity-3 blocks cannot increase the Jensen exponent. Repetition yields the adjacent-arity mixture bracketing `M/m'` and the two formulas in the registered identity. This orders only the rational Jensen exponents; it does not order actual cofactor coefficients, prove actual first-descent or selector facts, or establish MASS/payment.

## Independent scalar-certificate audit

I copied the producer evaluator into this scratch before replaying it. I also independently enumerated the protocol grid and recomputed the balancing exponent with `Fraction`, direct binomial coefficients, the degree-12 Taylor polynomial, and exact integer cross multiplication. The replay command is:

```sh
cd cycles/cycle-3/C3-CU-F1
PYTHONDONTWRITEBYTECODE=1 python3 independent_balanced_finite.py
```

The copied producer replay and independent evaluator agree on all per-`m` state counts, exclusions, exact minimum ratios, and minimizers. The independent run covers every `m=70..119`, `2m<=N<=4m`, `r=2,3,4`, the protocol's cofactor feasibility interval `2(m-1)<=N-r<=4(m-1)`, and integer `j` with `5j>2N-1` and `2j<=N-2`; it uses the full listed coefficient vectors `GF_2=(1,2)`, `GF_3=(2,5,2)`, and `GF_4=(3,9,7,2)`. It visits 799,895 states, excludes zero, and passes the strict target in every state. Minimum exact ratio and witness are retained per `m` in the evidence JSON.

The rank-to-shift guard is valid throughout this grid. Since `5j>2N-1` and both sides are integers, `5j>=2N`. For `0<=s<=r-1`, `3(j-s)>=6N/5-3r+3`; this is at least `N-r` when `N>=10r-15`. Here `N>=2m>=140`, so this holds for every `r<=4`. Also `M=N-r>=136`, and `2j<=N-2` with `r<=4` gives `j-s<=M`. Thus every `k=j-s` is in `[0,M]`, satisfies `3k>=M`, and has `M>=10`. The protocol's relaxed grid is sufficient for the coefficient bound; it is not a census of actual parent descents or eligible ranks. An actual rank still has the contract's full guards `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`, with `j=p-2`, and the actual `x` is the least strict descent including the terminal difference.

I checked the lower-bound arithmetic and its dependencies. For fixed-size uniform `k`-subsets of the `M` tips, expanding `product_i(1+X_i/r_i)` gives the exact occupancy identity for `Q[k]/binom(M,k)`; no independence is assumed. Finite Jensen and `log(1+1/r)>=2/(2r+1)` give exponent `E=sum a_r g_r`. Adjacent-arity balancing lowers this exponent only. The exact floor `f=floor(1000E)` satisfies `f/1000<=E`; the positive polynomial `sum_{h=0}^{12}(f/1000)^h/h!` is increasing and bounded above by `exp(E)`. Its common denominator is exactly `1000^12*12!`, with numerator weights `1000^(12-h)*(12!/h!)`. Multiplying each `GF_r[s]` term by `binom(N-r,j-s)/binom(N,j)` gives the stated convolution ratio, and the certificate compares it strictly against `(3/2)(N+1-j)(N-2j-1)/(j+1)` using positive integer denominators.

This is bounded exact evidence for the relaxed coefficient grid, conditional on the occupancy/Jensen bridge and the proved exponent-balancing inequality. It supplies neither selector information nor a structural all-parameter theorem by itself. In particular, actual current-`p` strict flags and original endpoint/private-tip multiplicities remain as defined in the contract. It does not exclude endpoint-only selection, settle selected MASS outside the composed conditions, or prove the exact-ratio primary payment. No Lean verification was run.

## Evidence files

- `independent_balanced_finite.py`: independent exact-rational evaluator.
- `independent_balanced_finite.json`: state counts, exclusions, minima, and witnesses.
- `copied_producer_balanced_finite.py`, `copied_producer_balanced_finite.json`, `producer_replay.log`: copied-source replay record.
