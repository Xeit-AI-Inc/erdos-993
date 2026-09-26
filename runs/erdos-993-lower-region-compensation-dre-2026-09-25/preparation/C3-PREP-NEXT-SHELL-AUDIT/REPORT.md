# C3-PREP-NEXT-SHELL-AUDIT — proposal to controller

**Verdict: PASS, informal mathematical audit of the bounded second-shell pointwise claim.** This is a proposed conclusion, conditional on the exact prior first-wide graph theorem in the pinned source. The alternative Boolean-chain proof makes the matching-four step independent of the uninspected literature product theorem. No new Lean build, kernel verification, formal theorem, registry award, or aggregate claim was made. The proof is for ordinary trees with `|T|=2p+3`, `p>=8`, and `x(T)+2<=p`, and for **each original leaf**. It gives no claim at smaller `p`, arbitrary larger orders, weighted Hall, or Erdős #993.

## Evidence and exact source contracts

All 16 sources listed in the control brief matched their SHA-256 pins before reading; `HASHES.json` records the comparisons. The finite 48-row check and bounded chain experiments are reproducible with `verify_lift.py` and recorded in `EVIDENCE.json`. Those computations validate finite data and sample the lift; the universal argument is below. The prior verification report is a report about its own run, not a new kernel check here.

The exact saved Lean dependency is `Erdos993G1.firstWide_nonpos_of_two_edges` in `G1FirstWideMain.lean:2513–2524`: for a finite simple graph `G`, natural `r`, `1<=r`, `Nat.card Y=2*r+2`, and at least two edges, `Erdos993G1.delta G (r:ℤ)<=0`. The required use is `r=k-1`, giving `i_k(J)<=i_(k-1)(J)` when `|J|=2k` and `k>=2`. `R25Card5Main.lean:993–1020` supplies `ThirdWide.binomDelta_floor` for all natural top parameters and ranks and the guarded shifted version; its `binomDelta_mono_center` at lines 954–961 supplies the top-parameter monotonicity from `2r`. The arithmetic used below also has an elementary proof. These saved files were inspected, not built.

`FirstInteriorMain.lean:125–145,203–229` defines `H={v,s_v}`, `R=N_T[s_v]`, the favorable-filtered aggregate, and `crossingIndex` as the least rank with negative forward difference. Its terminal at lines 1483–1492 assumes a high-tail condition involving `indepNum-2`; it is **not** a second-shell theorem. The proposed pointwise claim uses the original-leaf definition and these original deletion sets, with no favorable or alpha assumption.

## 1. Four matching edges: two derivations and their limits

Let `G` be a graph on `2k+1` vertices, `k>=4`, with four disjoint edges. Delete all edges except these four and call the resulting graph `M`. Its remaining `2k-7` vertices are isolated. The independence polynomial is

`A(z)=(1+2z)^4(1+z)^(2k-7)`.

The candidate's normal-poset route is **conditional**: if the stated product theorem grants normalized downward matching for this product, then for the downset of independent sets of `G`, `i_k(G)/A_k <= i_(k-1)(G)/A_(k-1)`. This is the correct direction: the downward shadow of a family at rank `k` lies in the downset at rank `k-1`. Every factor has nonzero ranks, so the divisions are valid. The primary literature itself is outside the allowed packet, so that product theorem was not checked or treated as kernel evidence.

The coefficient algebra is independently checkable. Write `a=k-4`, `C=binom(2a+1,a)`, and `B_t=binom(2a+1,t)`, zero outside range. Expansion gives

`A_k-A_(k-1) = (B_(a+4)-B_(a+3)) + 8(B_(a+3)-B_(a+2)) + 24(B_(a+2)-B_(a+1)) + 32(B_(a+1)-B_a) + 16(B_a-B_(a-1))`.

Using `B_(a+1)=B_a=C`, `B_(a+2)/C=a/(a+2)`, `B_(a+3)/C=a(a-1)/((a+2)(a+3))`, and `B_(a+4)/C=a(a-1)(a-2)/((a+2)(a+3)(a+4))` yields

`(A_k-A_(k-1))/C = -6a(a-1)/((a+2)(a+3)(a+4)) -32a/((a+2)(a+3)) -16/(a+2) = -6(9a²+39a+32)/((a+2)(a+3)(a+4)) < 0`.

The binomial-ratio equalities hold at `a=0,1` by the zero convention, so there is no endpoint exception. This coefficient calculation alone does **not** prove the downset inequality.

The **self-contained alternative** supplies a deletion injection. In the nine-vertex core `4K2+K1`, the pinned JSON has exactly 48 rows. An independent enumeration found exactly 48 independent rank-four sets and 56 independent rank-three sets. Every row has a distinct rank-four source, every source occurs, every target is independent of rank three, every target is a proper subset of its source, and all 48 targets are distinct. Thus the table is a complete injection from rank four to rank three, not merely a cardinality check.

Here is the universal lift, including its standard ingredient. The Boolean lattice on `m` vertices has a symmetric saturated-chain decomposition by induction. Begin with the singleton chain at `m=0`. If an old chain is `X_0 ⊂ ... ⊂ X_L`, replace it after adjoining vertex `b` by the chain `X_0 ⊂ ... ⊂ X_L ⊂ X_L∪{b}` and, if `L>=1`, by `X_0∪{b} ⊂ ... ⊂ X_(L-1)∪{b}`. These partition all sets associated with the old chain, advance one rank per step, and have endpoint ranks summing to `m+1`; induction proves the decomposition. This elementary construction is the only general Boolean-chain fact needed.

Apply it to the `m=2k-7` vertices outside the four edges. Every chain starts at rank `a<=floor(m/2)=k-4` and ends at `m-a`. For an independent rank-`k` set, its matching-core rank `j` is at most four, so its outside rank `k-j>=k-4`.

* If its chain starts at `a<=k-5`, its outside set is above the chain bottom. Replace that outside set by its unique predecessor, leaving the core fixed. This deletes one vertex and is injective within the chain, even when different core sets are present.
* The only remaining chains start at `a=k-4`, end at `k-3`, and have precisely two sets `A` and `A∪{b}`. Identifying `b` with isolated core vertex 8, a rank-`k` source corresponds exactly to a rank-four state of `4K2+K1`: core size four over `A`, or core size three over `A∪{b}`. Apply the verified 48-row map, replace vertex 8 by `b`, and reattach `A`. Its output has rank `k-1`, lies in the same chain and is a subset of the source. The correspondence is one-to-one on both source and target states, so the finite injection remains injective.

Different chains partition the outside subsets, so their outputs cannot collide. Both cases delete exactly one vertex. Restricting this global injection to independent sets of any graph `G` containing the four matching edges remains valid: every image is a subset of its source, hence is still independent under all extra edges. Therefore `i_k(G)<=i_(k-1)(G)` for every such `G`. This proves the matching-four lemma without the normal-product premise. `EVIDENCE.json` additionally tests the lift for `k=4,...,8`; those tests are a check on the construction, not its justification.

## 2. A cover of five forces later first descent

Let `|T|=2p+3`, `p>=8`, and suppose `tau(T)<=5`. Extend a cover to exactly five vertices `C`; its complement `U` has `N=2p-2>=14` vertices and no edges. For each independent `X⊆C`, let `b_X=|U\N_T(X)|`. The exact polynomial partition is

`I_T(z)=Σ_(X⊆C independent) z^|X|(1+z)^b_X`.

Define `E(m,t)=binom(m,t+1)-binom(m,t)` with zero coefficients at negative ranks. At rank `r`, the empty fiber contributes `E(N,r)`. A fiber with `|X|=a` contributes `E(b_X,r-a)`. For `t>=0`, `E(m,t)>=-Cat_t`: by Pascal, its increment as `m` grows is `binom(m,t)-binom(m,t-1)`, nonpositive up to the center and nonnegative thereafter, and `E(2t,t)=-Cat_t`. At `t=0` the same bound is `m-1>=-1`. For `t=-1`, the contribution is **+1**; for `t<=-2`, it is zero. These nonnegative positive-shift contributions are omitted, not charged as negative Catalan values. There are at most `binom(5,a)` independent cover subsets of size `a`. Thus, for every `0<=r<=p-2`, precisely the safe lower bound is

`Delta_r(T) >= E(N,r) - Σ_(a=1..min(5,r)) binom(5,a) Cat_(r-a)`.

For fixed `r`, `E(m+1,r)-E(m,r)=binom(m,r)-binom(m,r-1)>=0` once `m>=2r` (with `r=0` immediate). For `r<=5`, `N>=14`; direct exact arithmetic at top parameter 14 gives:

| `r` | `E(14,r)` | negative budget | margin |
|---:|---:|---:|---:|
| 0 | 13 | 0 | 13 |
| 1 | 77 | 5 | 72 |
| 2 | 273 | 15 | 258 |
| 3 | 637 | 30 | 607 |
| 4 | 1001 | 60 | 941 |
| 5 | 1001 | 146 | 855 |

For `r>=6`, `N>=2r+2`, so `E(N,r)>=E(2r+2,r)=Cat_(r+1)`. At `r=6` the budget is `5Cat_5+10Cat_4+10Cat_3+5Cat_2+Cat_1=411`, while `Cat_7=429`, leaving 18. For each fixed `a=1,...,5`, `Cat_(r-a)/Cat_(r+1)` decreases with `r`: it is the reciprocal product of the `a+1` consecutive ratios `Cat_(j+1)/Cat_j=2(2j+1)/(j+2)`, and these ratios strictly increase. Hence the total budget divided by `Cat_(r+1)` cannot exceed its value at `r=6`; strict positivity persists at every larger `r`. This covers every rank, including the first six endpoints.

Therefore `Delta_r(T)>0` for all `0<=r<=p-2`. But `x(T)` is the first negative difference. If `x(T)+2<=p`, then `x(T)<=p-2`, contradicting this positivity. An eligible tree must have `tau(T)>=6`. No single-rank positivity inference is used.

## 3. Leaf bridge, first-hit partition, and residual cases

Take any **original** leaf `v` with support `s`. Put `H=T-{v,s}` and `W=N_T(s)\{v}` as vertices of `H`; then `R=T-N_T[s]=H-W`. Since adding `s` to any cover of `H` covers all edges of `T` (the only edge at `v` meets `s`), `tau(T)<=tau(H)+1`; hence `tau(H)>=5`. Its order is `2p+1=2k+3` with `k=p-1>=7`. A forest has `tau=nu`, its matching number: choose a leaf `u` with neighbor `w`; a minimum cover can contain `w` by replacing `u` if necessary, and a maximum matching can contain `uw` by exchanging any edge at `w`; remove `u,w` and induct. Isolated vertices do nothing. Thus the cover statements below imply matching statements without importing a general graph matching theorem.

There is a nonisolated mark in `W`. Indeed `tau(H)>=5` gives an edge in some component of `H`; connectivity of the original tree forces that component to attach to `s` through some `w∈W`. The component is nontrivial, so `w` has a neighbor in `H`. Order the distinct marks with such a `w` first.

For `j>=0`, write `q_j(H,W)` for independent `j`-sets meeting `W`. Partition by the **first** mark `w_i` present. The exact disjoint identity is

`q_j(H,W)=Σ_i i_(j-1)(J_i)`, where `J_i=H-D_i` and `D_i=N_H[w_i]∪{w_1,...,w_(i-1)}`.

Only the earlier mark **vertices** are forbidden. The first mark has a neighbor and every later mark has an earlier distinct mark, so `|D_i|>=2`, even when a later mark is isolated. For every `i`, the set `D_i\{w_i}` covers every edge of `H` that is absent from `J_i`: an edge touching `w_i` has its other endpoint in `N_H(w_i)`, and every other removed edge has an endpoint in `D_i\{w_i}`. Combining this set with any cover of `J_i` gives a cover of `H`, so

`tau(J_i)>=tau(H)-(|D_i|-1)>=6-|D_i|`.

This handles all overlaps among the closed neighborhood and earlier marks; no disjointness is assumed. The three exhaustive cases are:

* `|D_i|=2`: `|J_i|=2k+1`, `tau(J_i)>=4`, and `J_i` is a forest. It has four disjoint matching edges, so Section 1 gives `i_k(J_i)<=i_(k-1)(J_i)`.
* `|D_i|=3`: `|J_i|=2k`, `tau(J_i)>=3`, so `J_i` has at least two edges. Call the pinned first-wide theorem with `r=k-1>=1` to get the same inequality.
* `|D_i|>=4`: `|J_i|<=2k-1`. The ordinary deletion-shadow incidence count gives `k i_k(J_i) <= (|J_i|-k+1)i_(k-1)(J_i) <= k i_(k-1)(J_i)` when `|J_i|>=k-1`; if the order is smaller, `i_k=0` directly. This yields the inequality, including out-of-range ranks.

Summing the disjoint first-hit fibers yields `q_(k+1)(H,W)<=q_k(H,W)`. Because `q_j(H,W)=i_j(H)-i_j(R)` at every rank, the exact original-leaf term is

`Delta_k(H)-Delta_k(R)=q_(k+1)(H,W)-q_k(H,W)<=0`, with `k=p-1`.

## Remaining obligations and limits

I found no mathematical counterexample or unhandled finite/offset case in the bounded claim. The normal-product route remains **unverified as a literature dependency** because its primary text is not in the allowed packet; the constructive route avoids it. The finite certificate is checked by an independent scratch script, but no Lean formalization or kernel check of the chain lift, cover-five exclusion, first-hit argument, subtype count bridges, or final pointwise statement was done. A C4 formalization would have to establish those declarations and bridge the original-deletion definitions to induced graphs, while preserving the pinned first-wide theorem's exact hypotheses. This report and its `PASS` are proposals to the controller only.
