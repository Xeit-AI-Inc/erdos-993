# C4-F1 correction proposal: three distinct marked-occupancy budgets

Write `Q=sum_(v in F)q_v(p-1)` and `E=sum_(v in F)E_v` for the fixed original-leaf tags. The three gaps are:

1. Flat gap: `G_flat=(x+1)Q-E`, testing `E<=(x+1)Q`.
2. Current-rank gap: `G_current=(p-1)Q-E`, testing `E<=(p-1)Q`.
3. Actual CT_x gap: `G_CTx=(x+1)i_(x+1)(T)Q-i_x(T)E`, testing `i_x(T)E<=(x+1)i_(x+1)(T)Q`.

At `p=x+2`, `G_flat=G_current`. CT_x does **not** coincide with them: `Delta_x(T)<0` gives `i_(x+1)<i_x`, so its permitted ratio `E/Q` is strictly smaller whenever `Q>0`. In exact gap form,

`G_CTx = i_x G_flat - (x+1)(i_x-i_(x+1))Q`.

Thus a positive flat gap alone does not test CT_x. C4-F1's column and prose labeled `(x+1)Q-E` as the `CT_x` gap, and both critiques repeated that conflation. The bounded RETURN claim `E<=(x+1)Q` remains true on its exact sample scope.

The independent replay read the pinned 37 eligible-row ledger, checked all 52 brief pins, recomputed each row's `i_x` and `i_(x+1)` with a separate rooted-tree polynomial DP, and recomputed its `alpha`, `x`, original-leaf selector, and selected sum. It used the ledger's recorded `E` and `C` counts, checked their sums against recorded leaf terms, and did not re-enumerate raw marked-set transport or independently regenerate all 1,836 Prüfer words. On those 37 rows, all three gaps are positive. The minimum flat/current gap is `1001`, and the minimum actual CT_x gap is `123300`; the latter matches the separately pinned controller diagnostic row by row. No proper selector appears and every row has `p=x+2`.

For the order-11 row, `x=4`, `p=6`, `i_x=140`, `i_(x+1)=132`, `Q=505`, `E=1500`. The flat and current gaps are `5*505-1500=1025`; the actual CT_x gap is `5*132*505-140*1500=123300`. This concrete row makes the budget distinction visible. Positivity of actual CT_x on this bounded ledger is an additional checked observation, not a universal inequality or a complete test of the sampler.

The reported 37 eligible rows, zero proper selectors, negative selected sums, and lack of a universal conclusion remain properly bounded. The sample does not reach `p>x+2`, and these computations do not prove or refute the primary lower-region aggregate.
