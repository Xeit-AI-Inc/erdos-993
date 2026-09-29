# C5-CT-F3 critique report

## Integrity and disposition

The 237 files in `manifests/C5-COMMON-DISPATCH.json` match their sealed SHA-256 values; the three packet-listed C5-F3 files also match. I copied the packet's producer script into this scratch before replaying it with `PYTHONDONTWRITEBYTECODE=1`. I independently rebuilt the exact arithmetic in `independent_coefficient_floor_audit.py`.

**Covered claim — `C5-F3-COEFFICIENT-FLOOR-DOES-NOT-IMPLY-SHIFTED-MINOR`: retain at its stated generic finite-block scope.** The example is an admissible one-block input to the formally verified finite-block coefficient/Jensen theorem. It proves that this theorem's coefficient floor and Jensen conclusion alone do not force the analogous shifted minor to be nonnegative. It is not a path-star or marked-deletion counterexample and says nothing against the registered graph comparison or payment.

## Exact check

Use one positive block of size `r=M=2` and monomial-in-`z` coefficients `f=(1,2,100)`. The block binomial coefficients are `(1,2,1)`, so the coefficient-floor hypotheses hold termwise. The products are `H=1+2z+100z^2` and `C=(1+z)^2=1+2z+z^2`, with zero extension above degree two. The uniform-subset expectations of the product weights for ranks `k=0,1,2` are exactly `1,1,100`; the theorem's `y_k` values are `0,0,198/101`. Thus the actual uniform-subset law and the theorem's hypotheses are met, not merely a formal coefficient floor.

At `k=1`, both analogous guards hold: `1<=k` and `2k=2<=M+2=4`. The shifted minor is

`H[1]C[1]-H[2]C[0] = 2*2-100*1 = -96`.

All factors used to normalize are positive (`C[0]=1`, `C[1]=2`), so division preserves the sign: the normalized difference is `H[1]/C[0]-H[2]/C[1]=2-50=-48`. Equivalently, since `H[1]>0`, a nonnegative minor would require `H[2]/H[1] <= C[1]/C[0]`; the actual ratios are `50>2`. No multiplication or division by a negative factor is used. At the other guarded rank, the upper boundary `k=2` gives the zero-extended minor `H[2]C[2]-H[3]C[1]=100>0`; so the negative interior-rank result is exact and localized, not a support-boundary artifact.

The script uses monomial coefficients in `z` throughout; no coefficient list in powers of `L=1+z` is treated as a `z`-basis list. Replay with `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-5/C5-CT-F3/independent_coefficient_floor_audit.py`.

## Application boundary

For the graph application, the handoff's marked factors are `C=G B_{r_i}H_i`, `A_i=U_i+E`, with `U_i=G B_{r_i-1}H_i` and common additive term `E=zL^N`; the original branch multiplicity remains `r_i`. An abstract coefficient floor provides no identity connecting these factors and no quantitative lower bound for `M_k(U_i)` that compensates a negative `M_k(E)`. The endpoint `A_0` also needs its own bridge. The actual first descent, strict selectors at the same current `p`, and every primary rank guard cannot be supplied by this abstract example or by coefficient domination. Consequently this critique neither revises any graph claim's grade nor proposes a primary award.

The evidence here is an exact finite counterexample to a proposed implication, plus a direct check of the finite-block hypotheses. There is no universal graph theorem, actual graph witness, or formal verification claim in this result.
