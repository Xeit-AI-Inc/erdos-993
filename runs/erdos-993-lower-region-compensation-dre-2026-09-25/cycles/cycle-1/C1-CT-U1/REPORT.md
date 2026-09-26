# C1-CT-U1 critique of C1-U1 (orientation T)

## Dispositions

### C1-U1-1 — retained

The tagged-incidence identity is correct on its stated domain. For each marked independent `k`-set `A`, every actually addable vertex lies outside `A`. In a bipartition `L,R`, both `A ∪ (E(A)∩L)` and `A ∪ (E(A)∩R)` are independent, so each color side of `E(A)` has at most `h-k` vertices, using `alpha(H)≤h`. Thus `e(A)≤2(h-k)` and each summand of `D` is nonnegative. `C≥0` by its definition.

For an independent `(k+1)`-set meeting `W` once, deleting any of its `k` unmarked vertices gives exactly `k` incidences from marked `k`-sets. A set meeting `W` at least twice gives all `k+1` deletions, one more than the base contribution; counting that set once in `C` gives the total `k q_(k+1)+C`. Summing actual addable vertices instead gives `2(h-k)q_k-D`. This also handles `k=h`: all addable sets and `(h+1)`-sets are absent and both sides are zero. The argument does not require `h=alpha(H)`.

### C1-U1-2 — retained

The specialization and rearrangement are exact. For each original leaf tag, `H_v=T-{v,s_v}` and `R_v=H_v-W_v`, so `q_v(j)=i_j(H_v)-i_j(R_v)` and the selected summand is `q_v(k+1)-q_v(k)`. The equality `alpha(H_v)=a-1` follows by taking a maximum independent set containing `v` (replace `s_v` by `v` if necessary), then deleting `v`; conversely, any independent set of `H_v` can be enlarged by `v`. Eligibility gives `p≥2`, and `3p<2a+1` implies `p<a`; hence `1≤k=p-1≤a-2≤h=a-1`.

Summing the auxiliary identity over the unchanged favorable selector `F(T,p)` yields

`kS=(2h-3k)Σ_F q_v(k)-Σ_F(D_v+C_v)=(2a+1-3p)Σ_F q_v(k)-Σ_F(D_v+C_v)`.

Therefore the budget margin is `Σ_F(D_v+C_v)-(2a+1-3p)Σ_F q_v(k)=-kS=kΣ_F(q_v(k)-q_v(k+1))`. The fixed-selector budget is exactly equivalent to `Σ_F q_v(k+1)≤Σ_F q_v(k)`. This does not establish that monotonicity or the primary aggregate. In particular, `D_v,C_v≥0` supplies no lower bound by the positive coefficient times `Σ_F q_v(k)` without an additional argument. The derivation retains distinct leaf tags, even for equal supports.

## Scope checks and controls

The exact target remains the strict lower region and strict selector: `x(T)+2≤p`, `3p<2a+1`, and `F={v: Δ_p(T-v)<0}`. No claim here shifts the selector to a residual graph or changes the rank `p-1`. The route proves the auxiliary identity and a conditional reformulation only; it proves neither the primary aggregate nor its negation, and makes no claim about the separate high-tail obligation.

The common controls are consistent with this narrow conclusion. `K_(1,12)` has a negative complete sum. The eligible order-91 `T22` and order-243 `T60` controls each have a positive selected leaf term but negative full sums (`-498754180547001418536` and `-1058142362147652597702654588268394677176033202323316960380`, respectively). Thus these controls preclude treating a positive local term as a refutation or assuming all selected terms are nonpositive; they do not challenge the identity or the exact reformulation. The control summary records its expected values as matching, but this critique did not replay the control computations.

## Limitations

- No proof of the selector-level monotonicity `Σ_F q_v(k+1)≤Σ_F q_v(k)` or of the primary lower-region aggregate is supplied.
- No eligible ordinary-tree counterexample is supplied.
- The control observations are finite supplied controls, not exhaustive computation; no source program was run or copied for replay.
- No external theorem or literature bridge is used.
