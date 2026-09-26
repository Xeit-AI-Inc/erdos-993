# C3-CF-U2 critique of C3-U2

## Disposition

**Retained_narrowed; proposed status: `proposed_open`.** The claimed rank-at-most-seven composition is internally consistent and covers every eligible rank and residual order, conditional on the cited descent-maxima and residual-census certificates being complete and correct. The evidence grade remains bounded computation. This seat did not rerun the full tree or forest generators.

## Independent rank and order audit

For any nonempty tree, `Delta_0=n-1 >= 0`; at the terminal rank, zero extension gives `Delta_alpha=-i_alpha<0`. Thus the first strict descent exists and `x>=1` (including `K1`, where `x=1`). The guard `x+2<=p` then forces `p>=3`, and for `p<=7` gives `1<=x<=5`. The strict alpha guard is equivalent, for integral parameters, to `2 alpha>=3p`, so the ranks in use are within the independence-polynomial range.

A tree with `Delta_x<0` is among the forests counted by `M(x)`. The cited maxima `M(1..5)=(4,8,11,15,18)` therefore give order ceilings for `p=3..7` of `4,8,11,15,18`, respectively: use `x<=p-2` and compare the displayed finite list only. No general monotonicity of `M` is needed.

For an original leaf `v` with original support `s`, let `H=T-{v,s}` and `W=N_T(s)-{v}`. If a vertex is isolated in `H`, connectedness of the original tree forces its original neighbor to be `s` or `v`; it cannot neighbor the degree-one vertex `v`, so it belongs to `W`. Hence the marked-isolate lemma applies. Its marked count difference is

`q_p-q_(p-1) = Delta_(p-1)(H)-Delta_(p-1)(H-W)`,

which is exactly the summand. With `k=p-1`, `n<=2p+1` implies `|H|=n-2<=2k+1`, so every leaf summand is nonpositive in that band. This argument applies to every original leaf and therefore also to the fixed favorable subset; repeated supports remain separate leaf tags.

The order split is exhaustive: for `p=3,4,5`, the ceilings `4,8,11` lie at or below `2p+1`; for `p=6`, ceiling 15 leaves only orders 14 and 15 outside the band; for `p=7`, ceiling 18 leaves only 16, 17 and 18. No eligible rank or intervening order is omitted.

## Bounded evidence audit

The pinned summaries report:

- `p=6`, orders 14 and 15: 3,159 and 7,741 free trees; 240 and 1 eligible rows; all eligible rows subset-replayed; no nonnegative aggregate; per-order maximum `-222` and `-192`.
- `p=7`, order 16: 19,320 free trees and 1,696 eligible rows, all subset-replayed; no nonnegative aggregate; maximum `-906`.
- `p=7`, orders 17 and 18: 48,629 and 123,867 free trees; 2,955 and 340 eligible rows, all subset-replayed; no nonnegative aggregate; maxima `-966` and `-864`.

The p7 17–18 raw result retains the old 14–15 scope string although its rows are orders 17 and 18. The listed correction receipt changes only that scope label; its corrected summary and the protocol agree on orders 17–18. Counts add to 241 residual p6 cases and 4,991 residual p7 cases. The order-16 p7 values agree with its listed report. Arithmetic in the composition and the displayed maxima was checked directly.

## Limits

The marked-isolate proof and rank/order deductions are checked here. The maxima `M(1..5)` retain their registered `bounded_computation` grade, and all five residual slices are finite computations. I verified the packet pins and audited the recorded protocols, summaries and correction record, but did not rerun the full generators or independently regenerate every row. Thus this review retains only the rank-3-through-7 composition at that evidence grade; it supplies no p>=8, all-rank, governed-tree, or authoritative-status conclusion.
