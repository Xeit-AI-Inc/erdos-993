# C3-CT-U2 independent critique (orientation T)

## Disposition

**Claim `E993-LOWER-REGION-AGGREGATE-RANK-LE-SEVEN`: retained.** The route’s exact rank-restricted statement is supported as a proposed, census-dependent composition. This does not decide the unrestricted lower-region claim, any rank `p >= 8`, or a governed-tree version. Proposed status remains `proposed_open`.

## Independent scope and reduction audit

For a nonempty ordinary tree, zero extension gives `Delta_0(T)=|V(T)|-1 >= 0` and `Delta_alpha(T)=-1`, so the first strict descent exists and `x>=1`. From `x+2<=p`, `p>=3` and `x<=p-2`. The cited global forest bound `Delta_k<0 => n<=4k` is an admitted formal result in the registered identity; it is only an order bound. The values `M(1..5)=(4,8,11,15,18)` retain their separate bounded-computation grade. Monotonicity is needed only across this finite list: for each `p=3..7`, `n<=M(x)<=M(p-2)`. The strict alpha guard is not used to strengthen this order cutoff; the finite rows and their filters retain it exactly.

The resulting cases are exhaustive: at `p=3,4,5`, the ceilings `4,8,11` are within `n<=2p+1`; at `p=6`, only `n=14,15` remain after the band; at `p=7`, only `n=16,17,18` remain. There is no rank 1 or 2 case under eligibility. The `K1` case has no eligible `p`; it does not create a missing row.

For the order band, put `H=T-{v,s_v}`, `W=N_T(s_v)\\{v}`, `R=T-N_T[s_v]=H-W`, and `k=p-1>=2`. Every isolate of `H` has an original neighbor by connectedness; it cannot be adjacent to `v`, whose sole neighbor is `s_v`, so it must be adjacent to `s_v` and is in `W`. Thus the marked-isolate lemma applies. Its `q_j=i_j(H)-i_j(H-W)` gives

`q_p-q_(p-1)=Delta_(p-1)(H)-Delta_(p-1)(R)`,

which is exactly the original leaf summand. Also `|H|=n-2<=2p-1=2k+1` for `n<=2p+1`. The lemma’s incidence identity is consistent: summing actual addable vertices over marked independent `k`-sets gives `(m-k)q_k-B`; upper sets with at least two marks contribute the excess `C`, so `k q_(k+1)+C=(m-k)q_k-B`. At `m=2k+1`, non-isolated `y` maps each bad set of isolates `A` injectively to `A union {y}` counted by `C`, and good sets each contribute at least one to `B`; if there is no non-isolated vertex then `W=V` and complementation gives equality. For `m<=2k`, the same identity gives the sign directly. No selector premise is needed for this termwise result.

The fixed selector is nevertheless respected in the composition: each residual result filters the original `T` at its given `p` using `x+2<=p`, `3p<2alpha+1`, and `Delta_p(T-v)<0`, then sums over the full original-leaf set. The route and result descriptions preserve original supports/neighborhoods and do not collapse distinct leaves that share a support. The summand identity uses `p-1` throughout; under `p>=3`, it is an ordinary nonnegative rank.

## Finite evidence and arithmetic

The pinned protocols define complete free-tree generation by order, exact eligibility filters, coefficient/DP checks, and independent vertex-subset replay of every eligible row and required deletion universe. The sealed result summaries report:

| Rank/order | Generated trees | Eligible and subset-replayed | Nonnegative sums | Maximum sum |
|---|---:|---:|---:|---:|
| 6 / 14 | 3,159 | 240 | 0 | -222 |
| 6 / 15 | 7,741 | 1 | 0 | -192 |
| 7 / 16 | 19,320 | 1,696 | 0 | -906 |
| 7 / 17 | 48,629 | 2,955 | 0 | -966 |
| 7 / 18 | 123,867 | 340 | 0 | -864 |

I independently summed the stored per-tree aggregates for the five stored result arrays in the common packet and checked each maximum and nonnegative count against its summary: p6/order14 sum `-78,526`; p6/order15 `-192`; p7/order17 `-4,552,313`; p7/order18 `-465,920`; all have zero nonnegative rows. C2-F1’s p7/order16 report and exact result contain 1,696 rows; I independently summed them to `-2,369,025` and checked zero nonnegative rows and maximum `-906`. This is a source audit and arithmetic check, not a generator or subset replay in this seat. The p7 order-17/18 scope correction is correctly applied: its receipt changes the scope label from orders 14/15 to 17/18 and says the mathematical rows are unchanged.

## Limits

The order-band proof is an informal mathematical argument, not a formal award. `M(1..5)` and all five residual slices remain bounded-computation inputs; I did not rerun their generators or subset enumerations. The composition therefore survives only at the stated rank-at-most-seven scope and proposed evidence grade. It establishes no all-rank primary result and no governed-tree transport.

All packet-listed case and common source hashes verified before review: 3/3 case files and 115/115 common files, with no mismatches. All read and audit work used the packet’s allowed files. No source replay or Lean build was run.
