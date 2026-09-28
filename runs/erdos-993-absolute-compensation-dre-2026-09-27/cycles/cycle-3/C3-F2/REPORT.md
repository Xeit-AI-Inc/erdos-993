# C3-F2 independent prefix audit

## Scope and method

I evaluated every arity-count profile `(c2,c3,c4)` with `1 <= c2+c3+c4 <= 69` directly from the contract polynomials using Python integers. The evaluator forms `Q=prod B_r`, `C=GQ`, `P=C+zL^q`, and each original-tip deletion polynomial `T_i` and selector polynomial `A_i`; all polynomial operations are exact convolution/addition. Differences use integer zero extension. The first descent is the first `k` with `Delta_k P < 0` in a scan that includes the terminal degree. Each tested p is filtered by all three guards `x+2<=p`, `3p<2alpha+1`, and `2p<=alpha`; flags are strict `Delta_p A<0`. For each selected arity the contribution is multiplied by `c_r*r`, preserving all original individual tip tags.

Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 small_prefix_independent.py > small_prefix_result.json
```

The finite scan covered exactly `sum_{m=1}^{69} binom(m+2,2)=59,639` profiles and 68,129 eligible profile/rank rows, matching the frozen scope counts. The script found no negative exact-ratio payment margin and no negative MASS margin on any row.

## Exact extremal row

The minimum signed integer primary target margin over all rows was

`(delta*C[j]-(delta-1)*C[j+1])*A - b*delta*D_j*C[j]`

`= 2,348,398,634,845,436,222,199,118,708,110,999,411,248,850`.

It occurs at the profile with 22 branches all of arity 3: `m=22`, `N=66`, `n=3+m+N=91`, `alpha=68`, `q=67`, first strict descent `x=32`, `p=34`, `j=32`, `delta=35`. The guards hold at equality/strictness as required: `x+2=p=34`, `3p=102<137=2alpha+1`, and `2p=68=alpha`. Here `e0=1` and every one of the 22 identical arity-3 branch flags is `1`, so `b=1+22*3=67`. Exact coefficients are `A=6,562,597,338,849,618,725,736`, `D_j=212,336,130,412,243,110`, `C[j]=297,795,845,939,942,115,337`, and `C[j+1]=295,365,112,846,734,182,630`.

The minimum MASS margin `A-b*delta*D_j` was `6,064,669,113,032,908,632,786`, at the same row. Both minima are positive. `small_prefix_result.json` records the extrema and confirms empty lists of negative witnesses.

## Limits

This is exact bounded evidence for the stated prefix only. It is not an all-m proof, does not prove any selector theorem, does not extend the accepted m>=238 MASS result, and is not a Lean award. The packet lists no `allowed_source_files`; accordingly this review independently implemented the contract evaluator and did not read producer scripts, data, or private work. Primary and all-m MASS remain OPEN at their registered scopes.
