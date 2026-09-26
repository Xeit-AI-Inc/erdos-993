# Lower-region compensation DRE, 2026-09-25/26

This six-cycle experiment studied the exact region left by the r29 high-tail result. For an ordinary tree `T`, let `Δ_j(T)=i_(j+1)(T)-i_j(T)` with integer zero extension, `x(T)` be its first strict descent, `a=α(T)`, and `F(T,p)` be the original leaves `v` for which `Δ_p(T-v)<0`. At `x+2≤p` and `3p<2a+1`, the primary asks whether the **complete selected sum**

```text
S(T,p) = Σ_(v∈F(T,p)) [Δ_(p-1)(T-{v,s_v}) - Δ_(p-1)(T-N_T[s_v])] ≤ 0.
```

Supports, closed neighborhoods, and the strict selector belong to the original tree. Leaves with the same support remain distinct tags. The arbitrary-tree primary is **OPEN**; no eligible positive complete sum was established. The governed beta aggregate, TREE, FOREST, TRANSFER, and Erdős #993 also remain open. [Terminal report](../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/REPORT.md), [controller final analysis](../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/FINAL-ANALYSIS.md), and [research notepad](../../runs/erdos-993-lower-region-compensation-dre-2026-09-25/RESEARCH-NOTEPAD.md) give the full evidence and limits.

## Formal awards at exact scope

Two governed Lean packages support four registered keys:

| Scope | Registered key |
|---|---|
| A finite simple graph with `m≤2k+1`, `k≥2`, and all isolates in the marked set has no more marked independent `(k+1)`-sets than marked `k`-sets. | `E993-MARKED-ISOLATE-ORDER-BAND` |
| Every original-leaf summand is nonpositive at `p≥3`, `n≤2p+1`. | `E993-ORDINARY-LEAF-ORDER-BAND` |
| Every original-leaf summand is nonpositive at `n=2p+2`, `p≥3`, `x+2≤p`. | `E993-FIRST-ORDER-SHELL-POINTWISE-EARLY-DESCENT` |
| The complete favorable-original-leaf sum is nonpositive on that first shell under the lower-region guards. | `E993-LOWER-REGION-FIRST-ORDER-SHELL` |

The packages are [lower-region order bands](../../proofs/lean/lower-region-order-bands/README.md) and [lower-region first shell](../../proofs/lean/lower-region-first-shell/README.md). These statements give formal order-band coverage through `n≤2p+2` at the stated guards, without extending the award to the remaining orders.

## Adjudicated mathematical and finite evidence

The marked-incidence identity is retained at informal grade. Put `k=p-1`, `H_v=T-{v,s_v}`, `W_v=N_T(s_v)-{v}`, and let `q_v(j)` count independent `j`-sets of `H_v` meeting `W_v`. Over the fixed favorable tags, write `Q=Σq_v(k)`, `U=Σq_v(k+1)` and `S=U-Q`. If `E` sums actual addability of marked `k`-sets and `C` counts marked `(k+1)`-sets meeting at least two marked vertices, then `E=kU+C` and

```text
kS = (2a+1-3p)Q-D-C,
```

where `D=Σ(2(a-1-k)-e_H(A))≥0`. The coefficient of `Q` is positive in the lower region. The missing uniform theorem is `D+C≥(2a+1-3p)Q`, or another inequality giving the selected sign.

For the `T_m` family (a three-vertex path with `m` three-tip stars attached at one end), an all-parameter, computer-assisted and adjudicated proof establishes the complete eligible aggregate sign. Its finite base and analytic tail are separate from the formal awards; the Cycle 6 cutoff-400 certificate shortens the finite base for the same family claim. The bounded heterogeneous arity-2–4 census covers 12,340 unordered profiles through 40 branches and 191,016 eligible profile/rank rows, all with negative complete sums. That finite census does not cover branches 41–1999.

The Cycle 6 restricted heterogeneous family arguments give exact-factor, computer-assisted proof coverage for arities 2–4 from 2,000 branches and arities 2–12 from 100,000,000 branches, at their separate analytic hypotheses. They do not fill the finite prefixes or establish an arbitrary-tree claim. The equal-length-three spider argument and the finite-group weighted orbit-flow lift are accepted narrow informal theorems; neither is a new formal award or a universal mixed Hall theorem. Family unimodality was known in the literature; no novelty claim is made for that fact.

## Refuted shortcuts and corrected weights

Exact eligible examples refute per-leaf unsigned deletion injectivity, same-current-rank weighted occupancy domination, the specified alternating-sign face-only retagging map, and local marked-indicator/addability nonpositive covariance. Their complete selected sums remain nonpositive. These findings limit the mechanisms, not the primary. `CT_x`, flat addability, current-rank addability, and the actual budget `E-C≤kQ` have different scopes.

Both the original F5 heterogeneous flows and U5 `CB(8,92)` sector discussion used a wrong active-tag weight. For an independent set `B`, the relevant capacity is

```text
w_F(B)=#{v∈F∩B : (B-{v})∩(N_T(s_v)-{v}) ≠ ∅}.
```

The original F5 flow certificates use the weight `|F∩B|`; independently checked corrected active-weight certificates apply only to the same two finite trees. In the `CB(8,92)` root-plus-arm sector, only the arm tag is active. The corrected upper/lower pair-poset ratio is `492/491`, giving a deletion-only deficit. Two-for-one switches may leave the sector and add capacity, so this does not refute the expanded mixed relation. The full eligible `CB` aggregate is negative.

## Remaining frontier

The formal order bands and the forest descent ceiling restrict unresolved eligible rows to `2p+3≤n≤4p-8`, hence `p≥6`. Exact low-rank instruments and census-dependent maxima cover the remaining `p=6,7` cases only at a computational composition grade. The next finite test boundary is `p=8`, `n=19..22`, using `M(6)=22`. Unawarded second-shell and third-shell preparation does not enlarge the formal frontier. An order-eight labeled census with zero eligible rows tests no guarded sign instance.

The strongest next mathematical target is a uniform selected compensation budget or a correctly weighted mixed-boundary transport theorem that handles arbitrary source subsets. Structural closure beyond the solved families and a complete implication chain to TREE and FOREST remain separate obligations. This experiment used all six authorized cycles and is closed; a successor requires its own authorization.
