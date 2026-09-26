# C4-T1 search: early-to-current marked occupancy

## Exact reduction

For a selected original leaf tag `v`, put `H=T-{v,s_v}`, `W=N_T(s_v)\\{v}`, `R=H-W`, and `q_v(j)=i_j(H)-i_j(R)`. Thus `q_v(j)` counts independent `j`-sets of `H` meeting `W`. Let `k=p-1`, `Q=Σ_F q_v(k)`, and `U=Σ_F q_v(k+1)`. For every marked independent `(k+1)`-set `B`, let `r=|B∩W|`. In the addability double count, `B` has exactly `k` deletions preserving the mark if `r=1`, and `k+1` if `r≥2`. Since `C` counts the latter upper sets once, this gives `E=kU+C`. The target sum is `S=U-Q`, so

`kS=E-C-kQ`.

A useful conditional bridge is the allocation's `CT_x` inequality

`i_x(T) E ≤ (x+1)i_(x+1)(T) Q`.

When `Q>0`, first descent gives `i_(x+1)<i_x`, and eligibility gives `k≥x+1`. Hence this bridge implies `E < (x+1)Q ≤ kQ`, and therefore `S≤0` because `C≥0`. If `Q=0`, then every `q_v(k)=0`; each marked `k`-set has no addable extensions to marked `(k+1)`-sets, so `U=0` and `S=0`. This is a proved sufficient reduction, not a proof of `CT_x`.

In size-conditioned language, let `μ` be uniform on the independent `k`-sets of `H`, `M(A)=1[A∩W≠∅]`, and `e_H(A)` be the actual number of vertices addable to `A` in `H`. Then

`Cov_μ(M,e_H) = (E_v i_k(H) - q_v(k)(k+1)i_(k+1)(H))/i_k(H)^2`,

where `E_v=Σ_{A:|A|=k, M(A)=1} e_H(A)`. This formula identifies a precise obstacle to a negative-covariance shortcut: the covariance can be positive even on a fully eligible instance.

## Exact order-24 covariance witness and full aggregate

`COMPUTE.py` constructs the tree solely from its 23 listed edges, computes forest independence polynomials by the deletion recurrence, and independently enumerates rank-9 and rank-10 sets in each selected `H` to count actual addable vertices and multiply marked upper sets. Its complete machine-readable output is `EVIDENCE.json`.

The tree has `a=15`, independence-count vector

`(1,24,253,1553,6202,17052,33321,47118,48648,36729,20148,7898,2146,384,41,2)`,

and first negative difference `x=8` (`Δ_8=-11919`). For `p=10`, `x+2=p` and `3p=30<31=2a+1`; the zero-extended terminal difference is `Δ_15=-2`. The 11 original leaves are exactly `F`; their `Δ_10(T-v)` values, in leaf order `0,3,5,6,12,14,15,20,21,22,23`, are

`(-4599,-6417,-6279,-5715,-5818,-6471,-5345,-5345,-4599,-4599,-6769)`.

The per-tag summands in the same order are

`(-7283,-2610,-3023,-4505,-4140,-2494,-5476,-5476,-7283,-7283,-1522)`,

summing to `S=-51095`. Thus this is not a counterexample. The selector includes repeated supports (leaves `0,21,22` share support `1`; leaves `15,20` share support `8`), and all tags are counted separately.

For leaf `v=0`, `i_9(H)=13677`, `i_10(H)=6026`, `q_0(9)=13232`, and actual marked addability is `E_0=58429`. The covariance numerator is

`58429·13677 - 13232·10·6026 = 1773113 > 0`,

so `Cov_μ(M,e_H)=1773113/13677²>0`. Here the marked conditional mean extension count exceeds the mean over all rank-9 independent sets of H `(10·6026)/13677`. Yet the complete aggregate has `Q=97144`, `U=46049`, `E=436389`, and `C=21948`, with `E=9U+C`. The `CT_x` left side minus right side is `-10882565712`, so this example satisfies that sufficient bridge and has negative full sum despite its positive local covariance.

## Limitation

This exact example rules out using universal nonpositive marked/addability covariance as the route's bridge. It does not refute `CT_x` or the primary aggregate. I have not proved `CT_x` for all eligible trees, found a cross-tag mechanism to compensate positive covariance, or resolved the primary universal claim. No literature theorem was imported. All arithmetic for the displayed tree and every selector value is replayable from the two evidence files.
