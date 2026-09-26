# C3-CF-U5 critique of C3-U5

## Dispositions

- `C3-U5-EARLY-DESCENT-MARKED-OCCUPANCY-BRIDGE`: **retained**. The conditional implication follows from exact marked extension counting and the earlier-layer double count. Its transfer premise remains an independent unproved condition.
- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: **retained_narrowed** as the exact lower-region target, but still open. The route neither proves the universal statement nor refutes it.

## Audit

For each original selected leaf, the difference in the target summand is `q_v(p)-q_v(p-1)`, where `q_v(j)` counts independent sets of `H_v` meeting `W_v`. With `k=p-1`, the bipartite marked extension identity is valid: extensions with one marked vertex have `k` deletions leaving a marked `k`-set, while extensions with at least two marked vertices have `k+1`; the latter are counted once in `C_v`. Addable vertices split across the two color classes, with at most `h-k` in either class, so the deficit `D_v` is nonnegative. This yields

`k*S=(2a+1-3p)Q-sum_v(D_v+C_v)`.

The first strict descent gives mean addability `E_x=(x+1)i_(x+1)(T)/i_x(T)<x+1<=k`. If the route's transfer condition `E<=E_x Q` holds, then the deficit term is strictly larger than the positive coefficient times `Q` when `Q>0`; when `Q=0`, the identity gives `S<=0` directly. Rank-domain guards are met: `p>=2`, `k>=1`, and `k<=a-1` from `3p<2a+1`.

The missing step is the universal transfer condition. It compares sets selected by meeting the leaf-neighbor marks in deletion graphs at rank `p-1` against all rank-`x` sets in the original tree. The earlier-layer pair count does not compare these distributions. The selector is fixed once from the original tree and every leaf, including leaves with the same support, remains a separate tag in the argument.

The exact 20-leaf-star calculation in `EVIDENCE.md` shows the condition can hold with nonzero `Q` and all same-support leaf tags, but is only a single instance. No target counterexample, exhaustive census, imported theorem, or broader standing-control replay is claimed.

## Conclusion

The conditional bridge is correct and useful as a sufficient criterion. The lower-region ordinary aggregate remains unresolved on the reviewed evidence because the criterion's transfer premise has no universal proof here.
