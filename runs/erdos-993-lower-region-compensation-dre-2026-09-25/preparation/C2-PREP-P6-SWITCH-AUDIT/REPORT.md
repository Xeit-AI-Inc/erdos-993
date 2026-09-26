# Proposed C2-PREP-P6-SWITCH-AUDIT result

**Authority and grade:** proposal to the controller; `bounded_computation` only. No formal award, registered status change, or universal theorem is proposed.

## Pin and scope

I read the exact task brief first and verified SHA-256 for all ten listed source files. The verified hashes are recorded in `RESULTS.json`. The pinned census contains 240 eligible order-14 rows and one eligible order-15 row, each at rank `p=6`. The switch-flow artifact has exactly the same 241 distinct centroid recipes in the same order and identifies the pinned census hash. These are the exact cases checked. Completeness here means exact coverage of that pinned census; I did not independently generate every free tree at orders 14 and 15.

The independent checker is `audit.py` in this scratch directory. It reads only the brief and its listed source files, imports no producer or ordinary-tree module, and writes `RESULTS.json` here. `python3 audit.py` completed with every assertion passing. The producer scripts were not run or edited.

## Independent mathematics and calculation

The checker parses each centroid recipe into an original numbered tree and checks the saved edge list. It enumerates every independent set by a bitmask recurrence and derives the independence polynomial, its degree `α`, and its first strict descent `x`. For each original leaf `v` with support `s_v`, it counts independent sets on `D_v=T−v`, `H_v=T−{v,s_v}`, and `R_v=T−N_T[s_v]` by restricting the original independent bitmasks. Thus it independently tests the strict favorable condition `i_{p+1}(D_v)−i_p(D_v)<0` and computes

`q_v(j)=i_j(H_v)−i_j(R_v)=#{A independent in H_v: |A|=j, A∩(N_T(s_v)−{v})≠∅}`.

Every saved original selected leaf, support, witness set, `q_v(5)`, `q_v(6)`, summand, and complete aggregate matched these counts. All 241 cases have `x=4`, `α=9`, so `x+2≤6` and `18<2α+1=19` hold.

The selected set `F=F(T,6)` was fixed at both ranks. For an independent set `B`, the checker computed `w_F(B)` as the number of selected leaves in `B` whose original support has another neighbor in `B`. The bijection `A↦A∪{v}` from the sets counted by `q_v(j)` proves

`Σ_{|B|=j+1} w_F(B)=Σ_{v∈F}q_v(j)`.

Accordingly, the independently calculated rank-7 supply minus rank-6 capacity equaled the full aggregate in every row. The selected set was never recomputed at rank 7.

For every saved positive-flow arc `S→T`, the checker independently confirmed positive integral amount, distinct endpoints, both endpoints independent and of ranks 7 and 6, and one of exactly two literal moves: delete one vertex, or insert one absent vertex while removing precisely its two neighbors in `S`. It reconstructed the entire arc count between positive-weight endpoints as an additional check. It then summed each upper set's outgoing flow and each lower set's incoming flow against their separately computed weights, and verified total conservation and upper-supply saturation. This validates a primal feasible flow of the saved value; since every upper source capacity is saturated, that value is automatically maximum for each checked finite network. No independent max-flow algorithm was needed or run.

## Exact outcome

| Check | Result |
| --- | ---: |
| Pinned cases covered | 241 of 241 (240 order 14, 1 order 15) |
| Reconstructed possible positive-weight arcs | 163,011 |
| Saved positive arcs validated | 33,426 |
| Positive deletion arcs | 25,243 |
| Positive two-for-one arcs | 8,183 |
| Cases using at least one two-for-one arc | 241 |
| Total weighted rank-7 supply | 71,225 |
| Total weighted rank-6 capacity | 149,943 |
| Total validated flow | 71,225 |
| Aggregate range over rows | −404 to −192 |
| Failed row checks or unsaturated saved flows | 0 |

`RESULTS.json` records a per-row audit summary and all verified source hashes. The 33,426 saved positive arcs were checked individually. The fact that each saved flow uses a switch does not establish that switches are necessary for saturation.

## Limits

This is an exact finite certificate check relative to the pinned census and artifacts. It does not independently establish that the census exhausts all tree classes at these orders, nor does it prove the universal ordinary-tree favorable-leaf aggregate or transfer to a governed `RTree` statement. The registered ordinary lower-region claim and `E993-BETA-AGG` remain open in the listed claim identity source. Feasibility of these 241 literal-set networks supplies bounded evidence only. The prior orbit audit is context, not a substitute for any check reported here.
