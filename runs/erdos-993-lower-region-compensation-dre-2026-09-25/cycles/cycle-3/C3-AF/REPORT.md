# C3-AF neutral adjudication of the six F routes

This is a proposed worker adjudication. I reviewed C3-F1 through C3-F6 and both assigned opposing-orientation critiques for each route. Both packet inventories were verified before substantive reading: 115/115 exact case-file SHA-256 pins and 115/115 common-source pins matched. The seven distinct source claim IDs are all disposed of below. `EVIDENCE.json` in this worker directory carries the exact finite data, source-return claim text, packet pins, and arithmetic checks so synthesis need not reopen route or critic files.

## Contract, identity, and certificate boundary

For a finite ordinary tree, put `a=alpha(T)`, extend independent-set numbers by zero, and let `x` be the first rank with `Delta_x(T)<0`, including the terminal difference `Delta_a=-i_a`. At a natural `p` with `x+2<=p` and the strict `3p<2a+1`, fix **all** original leaves satisfying `Delta_p(T-v)<0`. Each leaf contributes separately, even if its support is shared. The registered target is the complete sum

`S(T,p)=sum_(v in F)[Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v])] <= 0`.

For each original leaf, let `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, and `R_v=H_v-W_v=T-N_T[s_v]`. Set `q_v(j)=i_j(H_v)-i_j(R_v)`: this counts independent `j`-sets of `H_v` meeting `W_v`. For an independent set `B` of the original tree define

`w_F(B)=#{v in F intersect B : (B-{v}) intersect W_v is nonempty}`.

Deleting a tagged leaf gives a bijection between its contributing independent `r`-sets `B` and the independent `(r-1)`-sets counted by `q_v(r-1)`. Therefore `sum_(|B|=p+1) w_F(B)=sum_F q_v(p)`, `sum_(|A|=p) w_F(A)=sum_F q_v(p-1)`, and **exactly** `S=upper supply-lower capacity`. The identity is independent of the candidate flow arcs. The proposed two-for-one network joins an upper `B` to every deletion `B-{u}` and to `(B-(N_T(s) intersect B)) union {s}` whenever `s` is absent and has exactly two neighbors in `B`. The latter is independent and has size `p`. An integral flow saturating all upper supply implies `S<=0` for that row. A scalar `S<=0` need not yield such a flow; failure of this particular flow would not refute the aggregate.

## Dispositions and reconciliation

### `C3-F1.literal-two-for-one-flow-prefix` — retained, bounded

The exact first five stored eligible `p=7` rows at each of orders 16, 17, and 18 have saturated integral flows in the literal network. For all 15 rows, both guards, the strict original-leaf selector, every original-support term, `S=upper-lower`, legal arcs, integer capacities, flow conservation, and zero residual deficit were checked. The adjudicator checked the arithmetic in the packaged data; both critics replayed the computation, and CU independently audited arc legality and capacities. The table lists all row totals in stored order; full centroid encodings, selected tags, terms, and positive flow arcs are in this worker's `EVIDENCE.json`.

| order | `a` | `x` | `|F|` | `S` | upper | lower | flow |
|---:|---:|---:|---:|---:|---:|---:|---:|
|16|11|5|7|-1386|1717|3103|1717|
|16|11|5|7|-1356|1708|3064|1708|
|16|11|5|8|-1571|1980|3551|1980|
|16|11|5|7|-1410|1738|3148|1738|
|16|11|5|8|-1577|1991|3568|1991|
|17|11|5|6|-1544|1964|3508|1964|
|17|11|5|7|-1811|2325|4136|2325|
|17|11|5|6|-1480|1746|3226|1746|
|17|11|5|6|-1396|1678|3074|1678|
|17|11|5|7|-1664|2018|3682|2018|
|18|11|5|5|-1550|1792|3342|1792|
|18|11|5|5|-1369|1544|2913|1544|
|18|11|5|5|-1366|1572|2938|1572|
|18|11|5|6|-1452|1749|3201|1749|
|18|11|5|5|-1262|1426|2688|1426|

The deterministic prefix depends on the pinned order-16 cycle-2 result and corrected-scope order-17/18 result. Census generation was not rerun. The other 4,976 reported eligible `p=7` rows were not flow-tested here. Neither critic sought a broader interpretation, so there is no substantive dispute to resolve. This is a finite flow certificate, not a universal Hall proof.

### `C3-F2-CB-ELIGIBLE-REPLAY` — retained, bounded

Define `CB(8,m)` by `h-s-v` and, for each `i=1..m`, `h-c_i` with eight arms `c_i-u_ij-l_ij`. It has order `3+17m`. Exact tree-polynomial replay gives:

| `m` | order | `a` | `x` | `p` | strict lower guard | favorable original leaves | sign of complete `S` |
|---:|---:|---:|---:|---:|---|---:|---|
|92|1567|829|490|492|`1476<1659`|737, all|negative|
|93|1584|838|496|498|`1494<1677`|745, all|negative|

In both cases `x+2=p`. The selected leaves form the arm-leaf orbit of multiplicity one and a branch-leaf orbit of multiplicity `8m`. Each orbit's exact `Delta_p(T-v)` is negative; the two multiplicity-weighted summands add to the exact 351-digit and 355-digit negative `S` values in `EVIDENCE.json`, and independently equal its upper-minus-lower totals. The source replay checks the displayed recurrence against the pinned CB evaluator; both critics reran it from copies. This is exact arithmetic for two trees, with no full flow or universal conclusion. The old neighborhood cut envelope has a negative **lower bound** on deficit in both rows, so it certifies no deficient cut.

### `C3-F2-HUB-ARM-ARC-CLASSIFICATION` — retained, exact local classification

For an independent upper set containing `h` and `v` in either stated CB row, `s` is absent and has exactly the occupied neighbors `h,v`, so its arm-support insertion is legal. Every `c_i` is absent because `h` is present; its occupied neighbors are `h` and the occupied supports in branch `i`, so its choke insertion is legal exactly when that branch has one occupied support. An absent support has at most its leaf occupied, and an absent leaf has only its support as neighbor. These cases exhaust the vertices. Thus the listed arm-support and one-support-choke switches are **all** the two-for-one switches from this restricted source family. Their exact aggregate counts are in `EVIDENCE.json` and follow from `A(z)=(1+2z)^8` for branch states and `Q_1(z)=8z(1+z)^7` for a one-support branch. This says nothing about upper sets lacking `h` or `v`; both critics agree.

### `C3-F2-QUALIFYING-CHOKE-ROUTING` — retained, bounded partial routing

In either CB row, take an upper set containing `h,v` with some branch having exactly one occupied support and at least four occupied leaves among its other seven pairs. Choose the first such branch. Inserting its choke and deleting `h` and that support is a legal size-`p` switch. The output's unique choke identifies the chosen branch; if it has `ell>=4` leaves there, a preimage could restore the removed support only at one of `8-ell` leaf-free pairs. The at least `ell` active selected leaf tags at that choke give capacity at least `ell`, so `8-ell<=ell` bounds its incoming units. The qualifying branch polynomial is `Q(z)=8 sum_(ell=4)^7 binom(7,ell) z^(ell+1)`, and the exactly routed supply is `[z^(p-1)](A(z)^m-(A(z)-Q(z))^m)`. The exact routed and still-unrouted integers for both rows are in `EVIDENCE.json`. Both critics checked legality, the unique output fiber, and capacity. Unrouted upper supply is positive and includes other source families, so this is no saturation claim.

### `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — retained_narrowed to five instances; universal claim open

The source statement quantifies over **every** eligible ordinary tree and rank, but its proof data cover exactly five hand-selected trees. Build each from hub `0`, arm `0-1-2`, and for each listed length `L` add a hub-adjacent center with three disjoint paths of lengths `1,1,L`. The only tested rank is `p=x+2`; all original leaves happened to be favorable. Direct finite set enumeration and integral max flow give:

| long lengths | order | `a` | `x` | `p` | `|F|` | `S` | upper | lower | flow |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
|1,1,2|16|11|5|7|10|-1577|2241|3818|2241|
|1,1,3|17|12|6|8|10|-2566|2276|4842|2276|
|1,2,3|18|12|6|8|10|-3641|3597|7238|3597|
|1,1,2,3|22|15|7|9|13|-30552|61967|92519|61967|
|1,1,2,4|23|15|8|10|13|-52336|59277|111613|59277|

The exact vectors, original edges, selector deltas, every selected term, guards, and network totals are packaged in `EVIDENCE.json`. Both critics replayed them and reached the same narrowed scope. The adjudicator checked `S=sum terms=upper-lower`, all strict selector deltas, both guards, and saturation totals. The recorded max-flow outputs depend on the route's literal Dinic implementation and critic replays; the packaged five-row summary is not an independent arc-by-arc flow certificate. There is no universal cut argument, no test of selector loss, and no rank beyond `x+2` in these five cases. The universal stronger Hall assertion remains proposed open; no flow failure or complete-sum counterexample is supplied.

### `C3-F5-FINITE-WEIGHTED-HALL` — retained, bounded

One canonical sorted multiset of 2–5 branch types was generated for each hub-tree recipe of order at most 18. A branch is `P_l`, a path of `l=1..4` vertices off the hub, or `C_t`, a hub-adjacent center with `t=2..4` terminal leaves. The generation has 633 recipes and 138 ranks satisfying both strict target guards. All 138 have nonempty fixed selectors, directly computed `S` from `-9828` through `-224`, and saturated full upper supply under all deletion and exact two-neighbor switch arcs. The source and two critics replayed the same generation and flow algorithm; this is reproducibility, not an independent enumeration or universal reduction.

For the explicit `P2,C3,C4` row, the edges are `(0,1),(1,2),(0,3),(3,4),(3,5),(3,6),(0,7),(7,8),(7,9),(7,10),(7,11)`. Its polynomial is `[1,12,55,130,184,172,107,43,10,1]`, so `(a,x,p)=(9,4,6)`, `x+2=p`, and `18<19`. The full favorable set is `{2,4,5,6,8,9,10,11}`. The selector deltas are `-35,-27,-27,-27,-25,-25,-25,-25`, and original-support terms are `-14,-35,-35,-35,-39,-39,-39,-39`, separately including all shared-support leaves. Thus `S=-275=259-534`; the flow routes all 259 upper units. The entire 138-row claim retains its stated generation boundary only. The source evidence records aggregate sweep summaries and this representative row; its program and the critic replays are the dependency for the remaining per-row flows.

### `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — F4 retained_narrowed, F6 retained bounded; universal target open

F4 reports an exact **ineligible** positive full sum. Its 11-vertex tree has edges `01,02,03,04,05,06,07,08,19,9-10`, polynomial `[1,11,45,105,161,161,105,43,10,1]`, `a=9`, `x=5`, and `p=4`. The complete strict rank-4 selector is `{2,3,4,5,6,7,8,10}`. Seven original leaves at support 0 contribute `+19` each and leaf 10 at support 9 contributes `+14`, for `S=147`; however `x+2=7>4`. It is a valid sharpness control against deleting the early-descent guard, not a refutation. The separate marked `K1,7` control has one marked leaf, `k=3`, cover number 1, `q_3=15`, `q_4=20`; it only shows failure of a relaxed marked-shadow inequality without a `tau>=3` premise. At parent order `n=2p+3`, `p=3` cannot qualify because `Delta_1=19>0` at `n=9`; `p=4` cannot qualify because at `n=11`, `Delta_2=30+sum_v binom(d(v),2)>0`, with earlier differences positive. F4's seeded Prüfer samples use seed `20260925`, 12,000 labeled draws per `p=6..10`, and report early-descent counts `355,10727,11951,11998,12000`, with no positive favorable local term. The sample is nonexhaustive. F4 did not verify the imported first-wide classification or Catalan floor of the separate first-shell candidate, and supplies no `n=2p+3` theorem. CT called this bounded/open report retained, while CU used retained_narrowed to guard against reading it as a proof. I adopt the narrower wording; their arithmetic and eligibility conclusions agree.

F6's bounded result covers three parameter sweeps, not all trees. Let `T_m` be `0-1-2` plus `m` root-adjacent centers, each with three pendant leaves. First, graft a path of length `1..8` at root, for `m=0..8`, with or without one extra root-adjacent three-leaf center: 254 eligible parameter/rank rows. Second, graft at support 1 or the first claw center (the latter for `m>=1`), again `m=0..8`, length `1..8`: 254 rows. Third, join `T_m` and `T_k`, `m,k=0..6`, by a path of length `1..4`: 477 rows. The total is 985 eligible parameter/rank rows, not 985 nonisomorphic trees. The exact rooted exclude/include recurrence and original-support induced-subgraph polynomials give `S<0` in every row; the overall range is `-6208530780984` to `-242`. Every row's parameter, polynomial, terminal-aware `x`, guards, selected leaf/support tags, strict selector deltas, individual terms, and sum are in this worker's `EVIDENCE.json`. The adjudicator checked the recorded arithmetic on all 985 rows; both critics replayed the source implementation, and CU independently enumerated the fully displayed 13-vertex row.

For that row, take `T_2` with a length-two root path. Its edges are `(0,1),(1,2),(0,3),(3,4),(3,5),(3,6),(0,7),(7,8),(7,9),(7,10),(0,11),(11,12)`, polynomial `[1,13,66,174,265,248,149,56,12,1]`, `(a,x,p)=(9,4,6)`, `x+2=p`, and `18<19`. Its complete selector is `{2,4,5,6,8,9,10,12}` with support map `2->1`, `{4,5,6}->3`, `{8,9,10}->7`, `12->11`. Selector deltas are `-52,-38,-38,-38,-38,-38,-38,-52`; terms are `-14,-51,-51,-51,-51,-51,-51,-14`; the full `S=-334`. Neither F6 nor its critics derive an unbounded graft inequality. Their bounded result is retained exactly at its parameter horizon. The universal registered aggregate remains proposed open.

## Outstanding obligations

No reviewed route supplies a universal proof of the complete selected sum or an eligible ordinary-tree positive full-sum witness. The flow mechanism is stronger than the scalar target and remains unproved outside its finite tests. The CB routing leaves positive unrouted supply; its cut envelopes do not certify failure. The first-shell candidate and rank-7 census are distinct common-context results, not new awards from these six routes. Flow sample dependencies include pinned stored census rows; full sweeps rely largely on same-implementation replay. No Lean build, external theorem, or new exhaustive ordinary-tree census was used. All statuses here are proposed worker dispositions for controller review.
