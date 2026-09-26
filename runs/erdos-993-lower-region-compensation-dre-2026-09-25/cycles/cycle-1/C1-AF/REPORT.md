# C1-AF neutral adjudication, origin F, cycle 1

## Decision boundary and method

This adjudication covers exactly `C1-F1-1` through `C1-F6-1` and both cross-orientation critiques of each claim. All 16 common-source and 95 case-source SHA-256 pins matched their packets. The attached `audit.py` and `AUDIT.json` independently check the stored result summaries, guards and selected-term sums where the sealed results expose them. The critics' copied-program replays check the broader finite runs; those replays largely share the pinned counting dynamic program, so they are reproducibility checks, not formal universal proofs. No unlisted worker result or external theorem is used.

The primary assertion remains unresolved by these six routes. For a finite ordinary tree `T`, let `i_j(T)` count independent `j`-sets with integer zero extension, `Delta_j(T)=i_(j+1)(T)-i_j(T)`, `x(T)=min{j>=0:Delta_j(T)<0}`, and `a=alpha(T)`. For natural `p` with `x(T)+2<=p` and **strict** `3p<2a+1`, define the fixed set of original leaves `F(T,p)={v:Delta_p(T-v)<0}`. With each original support `s_v`, the target is

`S(T,p)=sum_(v in F(T,p)) [Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v])]<=0`.

Leaves sharing a support are distinct tags. The empty sum is zero. All graph operations use the original tree. The finite results below test this exact lower region; none establishes a universal global deficit budget or supplies an eligible positive full sum. They do not decide the separately open high-tail region or the separately registered tagged-incidence identity.

The shared computational dependency is the pinned ordinary-tree independence-polynomial evaluator. For each rooted forest component, the polynomial when its root is excluded is the product of `(excluded child + included child)` polynomials; when its root is included it is `z` times the product of excluded-child polynomials. Multiplying component polynomials counts every independent set exactly once with integer coefficients. Applying the same recurrence to each original-tree deletion computes the selector and summand. `a` is the last nonzero coefficient rank, `x` must be scanned through `a`, and integer eligibility is exactly `x+2<=p<=floor(2a/3)`. The critics' replays test the programs using this recurrence; the extra subset enumeration for F2's 11-vertex row and F4's independent whole-tree polynomial check are narrower independent checks.

| Claim | Pinned route evidence used | Two critics considered |
|---|---|---|
| F1 | `C1-F1/evidence/search_families.py`, `search_results.json` | `C1-CT-F1`, `C1-CU-F1` |
| F2 | `C1-F2/evidence/search.py`, `search_results.json` | `C1-CT-F2`, `C1-CU-F2` |
| F3 | `C1-F3/evidence/graft_pair.py`, `graft_pair.json` | `C1-CT-F3`, `C1-CU-F3` |
| F4 | `C1-F4/evidence/symmetric_hub_census.py`, `census.json` | `C1-CT-F4`, `C1-CU-F4` |
| F5 | `C1-F5/evidence/LP-RELAXATION.json` | `C1-CT-F5`, `C1-CU-F5` |
| F6 | `C1-F6/evidence/replay_search.py`, `search-results.json` | `C1-CT-F6`, `C1-CU-F6` |

All table paths have prefix `cycles/cycle-1/`; the listed files and each critic report/return are hash-pinned by the case packet. The exact admissible claims and arithmetic follow in this report, so downstream synthesis need not read those dependencies.

## Claim dispositions

### C1-F1-1 — retained as bounded computation

**Exact surviving statement.** The fixed seed `99320260925` generated 14 root multi-hub recipes of order 91 and 14 of order 243, plus one unperturbed anchor of each order. For each target order the generator chooses hub count within two of 22 or 60, respectively; `r` subdivided root–support–leaf arms with `1<=r<=4`; `c` direct root leaves with `0<=c<=3`; and hub leaf counts `1<=d_i<=6`. It balances the counts to meet the target order, performs 10–80 legal random unit transfers, and shuffles. The tree has root 0, one root-adjacent hub carrying `d_i` leaves per hub, the subdivided arms, and direct root leaves. The 30 generated recipes are a sample and are not asserted distinct. Across **all eligible ranks of those 30 generated trees**, 582 rows (137 at order 91, 445 at order 243) have `S<=0`; their largest stored sum is `-53258302527237050580`. There is no positive full sum in this sample.

**Checks and dependence.** The source computes the forest independence polynomial by integer include/exclude tree dynamic programming, scans `Delta_j(T)` through `j=a` including the terminal zero-extended difference, checks `x+2<=p` and `3p<2a+1`, and tests each original leaf with strict `Delta_p(T-v)<0`. It computes each rank-`p-1` summand from original support and closed neighborhood. Both critics retained the claim: CT rechecked all 582 ranks and stored selected terms; CU reproduced the complete source JSON. The adjudicator checked the 582 stored row guards and signs. The order-91 anchor has `(a,x,p)=(68,32,34)`, 67 selected leaves, a positive marked term `+212336130412243110` at leaf 90 in the route's labeling, and full `S=-498754180547001418536`. The order-243 anchor has `(182,87,90)`, 181 selected leaves, a positive term `+2935177632783649903488454322226807645411570590073000` at leaf 242, and full `S=-1058142362147652597702654588268394677176033202323316960380`. These are exact finite compensation examples. Source script, sealed result and both critics' replays are the dependencies; running the sealed source script at its final admission path requires path/output adaptation, as the critics did.

**Limit.** Seeded recipes do not exhaust this multi-hub family or ordinary trees. A positive local term coexisting with negative `S` gives no universal compensation theorem.

### C1-F2-1 — retained_narrowed to the actual generator

**Exact surviving statement.** With seed `99320260925`, the actual source program generates 1,200 cases of orders 9–36 and checks every eligible rank in each case. Modes cycle by case index: mode 0 grows a rooted recursive tree with parent weights `1+d`; mode 1 uses weight `1+3d` for root 0 and **`2d+2` for a non-root parent**; mode 2 starts with a random 1–3 vertex path backbone, attaches gadgets of at most seven vertices to random backbone vertices, and grows each gadget with a randomly chosen local weight rule `1+d`, `1+3d`, or `1+(2d if d>1 else 1)`. Here `d` is the current parent degree. The 1,200 draws contain 650 cases with eligible ranks and 878 eligible tree/rank rows. No row has a positive selected term or positive full `S`; the largest `S` is `-253`.

**Correction and checks.** The route report and sealed output's human-readable generation descriptor say mode-1 non-root weight `2d+1`, but the executable expression is `1+(2*d+1)=2d+2`. Both critics retained the bounded counts after copied-program replay, but neither flagged this discrepancy. The count and seed describe the actual source program; the written rule is narrowed accordingly. CT also checked the best row by direct subset enumeration. It is the 11-vertex double star with central edge `0–1`, leaves `2,3,4,5` at 1 and `6,7,8,9,10` at 0. Its independence vector is `[1,11,45,100,140,132,85,36,9,1]`; `(a,x,p)=(9,4,6)` and `18<19`. All nine leaves pass: selector values are four `-21` and five `-20`. Their terms are four `-27` and five `-29`, so `S=4(-27)+5(-29)=-253`. The adjudicator checked this selected-term sum, the source case count, and the 878 stored case rank counts. CU correctly noted that the sealed script's relative import/output paths require scratch-local adaptation for safe replay.

**Limit.** These are seeded draws, not an exhaustive order-9–36 tree census. The absence of positive terms in this sample does not rule out the admitted positive-local controls or establish the universal target.

### C1-F3-1 — retained as one exact graft-pair observation

**Exact surviving statement.** Construct the order-91 base tree with path `0–1–2` and 22 root-adjacent three-leaf stars, first center 3 with leaves 4, 5, 6. Construct the order-94 tree by attaching the new path `4–91–92–93` at original leaf 4. At fixed `p=35`, the base has `(a,x)=(68,32)` and the grafted tree `(69,33)`; hence `x+2<=35` in both and `105<137`, `105<139`, respectively. Each has 67 original leaves and all 67 satisfy its own strict selector. The base full sum is `-838171658290934690688`, with 67 negative terms. The grafted full sum is `-2341400510849661617965`, with one positive and 66 negative selected terms. Old leaf 4 ceases to be a leaf, new leaf 93 enters, and retained selected leaf 2 changes term from `-212336130412243110` to `+424672260824486220`.

**Checks and dependence.** Both critics retained this exact pair after reconstructing the graphs and matching complete independence vectors, all terminally checked differences, every original-leaf selector, each selected term, and both sums with the sealed pair evidence. The adjudicator checked `x` against the stored full difference vectors, selector sets against every listed leaf value, all 67 terms per tree, and the sums. Graph connectivity and acyclicity follow because the base consists of branches attached once to root 0 and the graft adds one path at a single existing vertex.

**Limit.** One graft shows failure of a universal termwise sign-preservation rule. Both complete sums are negative; the source's other exploratory searches have no retained complete enumeration and are not carried as results. No universal graft lemma or counterexample follows.

### C1-F4-1 — retained with parameter-configuration scope

**Exact surviving statement.** For every integer triple `2<=m<=6`, `1<=d<=4`, `2<=L<=5`, build one central root adjacent to `m` hubs, each carrying `d` pendant paths of `L` edges. These **80 parameter configurations** produce 151 eligible `(configuration,p)` rows, all with strictly negative full selected sum: 151 negative, none zero or positive. This is a complete census of the parameter box only. Distinctness of the resulting trees up to isomorphism is not needed or asserted.

**Proof sketch and checks.** Each construction adds fresh vertices along branches and has order `1+m(1+dL)`. If `A_L` is the path-on-`L`-vertices independence polynomial, `A_0=1`, `A_1=1+z`, `A_L=A_(L-1)+zA_(L-2)`, then conditioning on a hub and then the center gives `Q=A_L^d+zA_(L-1)^d` and `I_T=Q^m+zA_L^(dm)`. CU checked this polynomial formula against tree DP for all 80 configurations. Both critics reproduced the census JSON and checked terminal-rank `x`, both strict guards, the original-leaf selector, rank shift, original-tree deletions, and separate same-support tags. The adjudicator checked the stored counts and six sample rows. For instance `(m,d,L,p)=(2,3,3,8)` gives order 21, `(a,x)=(13,6)`, six selected leaves and `S=-3894`; `(3,3,3,12)` gives order 31, `(a,x)=(19,9)`, nine selected leaves and `S=-597924`.

**Limit.** No sign is established outside this finite box or for mixed hub degrees/path lengths. The source output stores counts and six sample rows, while the critics' replay establishes agreement of the full computation; this is a computational result, not a symbolic proof of a family-wide inequality.

### C1-F5-1 — retained_narrowed to scalar and necessary tree identities

**Exact surviving statement.** The equation-only scalar incidence-deficit relaxation permits `(h,k,q_k,q_(k+1),D,C)=(5,2,1,3,0,0)`: `kq_(k+1)+C=6=2(h-k)q_k-D`, and for `g=q_(k+1)-q_k` it yields `g=2>0`. This is an abstract integer point, not a verified bipartite graph, rooted forest, selected leaf, or counterexample. For an actual original leaf `v` at support `s`, put `H=T-{v,s}`, `W=N_T(s)\{v}`, `R=T-N_T[s]=H-W`, `r_j=i_j(R)`, `q_j=i_j(H)-i_j(R)`. Deleting `s` splits a tree into components, one per neighbor of `s`; after removing `v`, every component of `H` has exactly one root in `W`. If `H_i` is rooted at `w_i`, set `A_i=I(H_i)` and `B_i=I(H_i-w_i)`. Then `I(H)=prod_i A_i`, `I(R)=prod_i B_i`, and `A_i=B_i+zI(H_i-N[w_i])`. Conditioning `T-v` on `s` gives `I(T-v)=I(H)+zI(R)=q(z)+(1+z)I(R)`, so the **correct** strict selector equation is

`Delta_p(T-v)=q_(p+1)-q_p+r_(p+1)-r_(p-1)<0`.

Every original leaf at the same support has the same selector value and local term up to relabeling, so all such tags enter together with their multiplicity. These necessary couplings do not prove a complete-sum sign.

**Critic dispute resolved.** CT retained a narrowed equation-only interpretation and gave the correct selector identity. CU retained the source's limited conclusion but wrote `q_(p+1)-q_p+r_p-r_(p-1)` in its report and audit. That expression is algebraically wrong: taking differences of `q+(1+z)R` gives `(q_(p+1)+r_(p+1)+r_p)-(q_p+r_p+r_(p-1))`, so the `r_p` terms cancel and `r_(p+1)` remains. The source F5 formula is correct. The CU formula is rejected as evidence while its scalar arithmetic and component decomposition remain valid. The adjudicator checked the point and this coefficient algebra directly.

For context, the separately stated tagged-incidence identity has a direct double-counting proof at its own domain: for bipartite `H`, marked `W`, `h>=alpha(H)`, and `1<=k<=h`, a marked independent `k`-set has `e(A)` actual addable vertices, at most `2(h-k)` because each bipartition class of the addable graph can join `A` to form an independent set of size at most `h`. Hence `D=sum_A(2(h-k)-e(A))>=0`. A marked independent `(k+1)`-set with exactly one mark has `k` deletions retaining a mark; one with at least two marks has `k+1`. Counting extension incidences gives `kq_(k+1)+C=2(h-k)q_k-D`, `C>=0`. For a tree leaf, `alpha(H)=a-1`: adjoining `v` to any independent set in `H` gives one direction, and deleting either `v` or `s` from a maximum independent set of `T` gives the other. With `k=p-1`, the identity rearranges for the **same fixed** `F(T,p)` to

`kS=(2a+1-3p) sum_(v in F) q_v(k)-sum_(v in F)(D_v+C_v)`.

Since `2a+1-3p>0`, the required global budget is `sum_F(D_v+C_v)>=(2a+1-3p)sum_F q_v(k)`. Neither `D,C>=0` nor the scalar positive point proves or refutes it. The order-91 and order-243 controls above have positive local terms and negative complete sums, so pointwise positivity is insufficient.

**Limit.** The point has no certified realization or selector values, and no global budget follows after imposing the necessary rooted-product and selector constraints. No award on the registered auxiliary identity or primary target is proposed by this source-claim disposition.

### C1-F6-1 — retained_narrowed to generated spider multisets and Prüfer draws

**Exact surviving statement.** The source enumerates each nondecreasing arm-length tuple with 2–6 arms of lengths 1–5, forming a rooted spider from a common root. The counts by arm number are 15, 35, 70, 126, 210, totaling **456 parameter multisets**; these need not be 456 nonisomorphic unrooted trees. They have 53 eligible rows and no positive full `S`. The largest is `-230` at arms `(1,3,3,3,3)`, with `(a,x,p)=(9,4,6)`, `18<19`, independence vector `[1,14,78,226,371,355,202,70,13,1]`, five selected leaves with selector values `(-46,-67,-67,-67,-67)` and terms `(-86,-36,-36,-36,-36)`. Separately, seed `9930601` generates 220 Prüfer-sequence draws at each order 18, 22, 26, 30, 34, 40, 48, 56: **1,760 draws** and 2,022 eligible rows, with no positive full `S`. The largest is `-2562` at order 18, `(a,x,p)=(12,6,8)`, eight selected leaves. Prüfer draws are not deduplicated.

**Checks and dependence.** The source constructs each spider arm by a fresh path and decodes each Prüfer sequence into a labeled tree. It computes exact tree-DP coefficients, scans `x` through `a` including terminal zero extension, checks both strict guards, and sums every strictly selected original-leaf term with original supports. CT retained the result while narrowing “456 trees” to parameter multisets and “1,760 trees” to draws; CU retained with the same effective scope. Both replayed the complete source output after scratch-local path adaptation. The adjudicator checked stored counts, maximum-row guards, strict selector values for selected terms, and their exact sums.

**Limit.** This is exhaustive only in the stated spider parameter box; the Prüfer part is a seeded sample. Neither is a census of ordinary trees. Neither supplies a universal bound or positive counterexample.

## Synthesis handoff

The six source claims survive as five bounded observations and one partial scalar/structural analysis, with the F2 generation correction and F5 critic-algebra correction made explicit. All source claims are disposed of in `RETURN.json`; the two critics for every claim were considered. The finite cases are consistent with `S<=0`, including examples where one selected term is positive but the full sum is negative. They do not control arbitrary ordinary trees. The remaining exact primary obligation is a proof of the full selected sum under both strict guards, equivalently a proof of the displayed global deficit budget if the incidence route is used, or a fully eligible ordinary-tree witness with positive **complete** `S`. The separately registered tagged-incidence identity has the elementary derivation above but its application does not close that budget. No controller-owned mathematical status is assigned here.
