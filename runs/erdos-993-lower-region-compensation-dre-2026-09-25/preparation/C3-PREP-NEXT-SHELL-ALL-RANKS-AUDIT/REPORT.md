# C3-PREP-NEXT-SHELL-ALL-RANKS-AUDIT — proposal to controller

**Verdict: PASS as an informal mathematical audit, with no formal award.** The proposed statement is: if `T` is a finite ordinary tree, `p` is a natural number with `p>=3`, `|V(T)|=2p+3`, and its first **strict** negative independence difference `x(T)` satisfies `x(T)+2<=p`, then for **every original leaf** `v`, with its original support `s`,

`Delta_(p-1)(T-{v,s}) - Delta_(p-1)(T-N_T[s]) <= 0`.

Here `i_j` is zero for negative or out-of-range integer ranks and `Delta_j=i_(j+1)-i_j`. There is no `alpha`, favorable-selector, aggregate, all-order, or larger-order conclusion. The `p=3,4,5` portion is vacuous; the `p>=6` portion follows below. The review changes no source status and makes no Lean claim for this new theorem.

## Source and computational evidence

The exact brief's 13 listed source files all matched their stated SHA-256 values before inspection. I read only those sources and this scratch. The pinned `inputs/C4-r27-linear-bound-intake/Main.lean` declares `Erdos993G1.forest_descent_linear_bound` at lines 1458–1460: for **any** finite acyclic simple graph and **any natural** `k`, `delta G (k:ℤ)<0` implies `Nat.card X<=4*k`. Its `coeff`/`delta` definitions at lines 24–35 use integer zero extension and strict negativity. The `ORIGIN.json` pins the same Main source hash; `kernel-verification.json` records successful project and single-file checks, allowed axioms, and unchanged source hash. The receipt's terminal theorem name is `forest_descent_restriction`, while the needed linear-bound lemma occurs in that compiled Main file. The theorem contract records a contingent provenance through the earlier degree-lemma award, which was outside this packet; I did not independently inspect that prior award or rerun Lean. The previous second-shell report is a proposal, not an award, and its reported first-wide source is not in this packet. An elementary proof of the needed first-wide inequality is supplied below, so the mathematical argument does not depend on that uninspected source.

`verify.py` independently enumerates the finite nine-vertex matching certificate, recomputes every small-rank and large-rank endpoint using exact integer binomials, and writes `EVIDENCE.json`. It checked 48 distinct rank-four sources covering the entire rank-four independent-set family of `4K2+K1`, 48 distinct rank-three subset images, and 56 available rank-three sets. This is a complete finite certificate check, not a universal computational search.

## Deletion injections for residual graphs

Use the following explicit symmetric saturated-chain decomposition (SCD) of a Boolean lattice. Starting with the singleton empty chain on zero vertices, replace each old chain `X_0 ⊂ ... ⊂ X_L` on `m` vertices, after adjoining `b`, by `X_0 ⊂ ... ⊂ X_L ⊂ X_L∪{b}` and, if `L>=1`, `X_0∪{b} ⊂ ... ⊂ X_(L-1)∪{b}`. The new chains partition the old chain times `{absent,present}`, are saturated, and have endpoint ranks summing to `m+1`. Induction proves an SCD for every finite Boolean lattice. Every chain on `m` vertices starts at rank `a<=floor(m/2)` and ends at `m-a`.

**Four matching edges, odd residual order.** Let `G` have `2k+1` vertices, `k>=4`, with four vertex-disjoint edges. Keep just those edges to form `4K2+(2k-7)K1`. Decompose the Boolean lattice on the `m=2k-7` isolated vertices. For an independent rank-`k` set with core size `j<=4`, outside rank is `k-j>=k-4`. On chains starting at `a<=k-5`, delete the outside predecessor and keep the core. This is injective within each chain. The only other chains start at `a=k-4` and end at `k-3`; each is precisely `A ⊂ A∪{b}`. Sources over this chain are `A` plus a rank-four `4K2` core, or `A∪{b}` plus a rank-three core. Strip `A`, identify `b` with vertex 8 in the checked `4K2+K1` table, apply its 48-row rank-four-to-rank-three subset injection, and reattach `A`. The table outputs use the same two outside states, and the map is injective. Different chains have disjoint outside states, so their outputs cannot collide. All images delete exactly one source vertex. Extra edges in `G` do not matter: restricting a subset deletion injection to independent source sets keeps the images independent. Consequently `i_k(G)<=i_(k-1)(G)` for all `k>=4`. At `k=4`, `m=1` and the sole chain is exactly the certificate case. No normalized-product literature theorem is needed.

**Two edges, even residual order.** We can also prove the first-wide inequality directly. Any graph on `2k` vertices with at least two edges contains either two disjoint edges or two adjacent edges; keep only those edges. In the disjoint case use the core `2K2` (vertices `0,1` and `2,3`) and `m=2k-4` isolates. In the adjacent case use the core path `0-1-2` and `m=2k-3` isolates. On outside SCD chains beginning below `k-2`, delete the outside predecessor, because every rank-`k` source has outside rank at least `k-2`. In the disjoint case the remaining central chains are singletons at outside rank `k-2`. Map their four possible core pairs by the distinct subset targets `{0,2}-> {0}`, `{0,3}->{3}`, `{1,2}->{2}`, `{1,3}->{1}`. In the path case the remaining central chains have two outside sets `A ⊂ A∪{b}` at ranks `k-2,k-1`. Their four source states map as follows: `A+{0,2}->A+{0}`, `A∪{b}+{0}->A∪{b}`, `A∪{b}+{1}->A+{1}`, `A∪{b}+{2}->A+{2}`. Each image is a distinct rank-`k-1` subset of its source. Chain outputs remain in their source chains, so this is a global injection, valid already at `k=2`. Restriction to a graph with extra edges proves `i_k<=i_(k-1)` without the previously reported formal first-wide theorem.

## Cover-five descent budget, all ranks

Suppose `tau(T)<=5`. Enlarge a cover to exactly five vertices `C` (possible at every relevant order), leaving an independent outside set `U` of size `N=2p-2`. For each independent `A⊆C`, write `b_A=|U\N_T(A)|`. The exact disjoint generating-function partition is

`I_T(z)=Σ_(A⊆C independent) z^|A|(1+z)^b_A`.

Put `E(m,t)=binom(m,t+1)-binom(m,t)` with zero extension and `Cat_t=binom(2t,t)/(t+1)` for `t>=0`. For `t>=0`, `E(m,t)>=-Cat_t`: the finite difference in `m` is `binom(m,t)-binom(m,t-1)`, changing from nonpositive to nonnegative at the center, and `E(2t,t)=-Cat_t`. Also `E(m,-1)=1` and `E(m,t)=0` for `t<=-2`. Thus all fibers with `|A|>r` contribute **nonnegatively** at rank `r` and are omitted from a lower bound. For `|A|<=r`, there are at most `binom(5,|A|)` fibers; their possibly negative contributions are bounded by the Catalan floors. The empty fiber is exact:

`Delta_r(T) >= E(N,r) - B(r)`, where `B(r)=Σ_(a=1..min(5,r)) binom(5,a) Cat_(r-a)`.

For fixed nonnegative `t`, `E(m+1,t)-E(m,t)=binom(m,t)-binom(m,t-1)>=0` whenever `m>=2t`. This is the required monotonicity in available outside size, including `t=0`. If `p>=8`, then `N>=14`. At ranks `r=0,1,2,3,4,5`, `E(14,r), B(r), E-B` are respectively `(13,0,13)`, `(77,5,72)`, `(273,15,258)`, `(637,30,607)`, `(1001,60,941)`, `(1001,146,855)`. For `6<=r<=p-2`, `N>=2r+2`, hence `E(N,r)>=E(2r+2,r)=Cat_(r+1)`. At `r=6`, `Cat_7=429` and `B(6)=5Cat_5+10Cat_4+10Cat_3+5Cat_2+Cat_1=411`, margin `18`. For each `a=1,...,5`, `Cat_(r-a)/Cat_(r+1)` decreases with `r>=6`, since it is the reciprocal of a product of `a+1` increasing Catalan ratios `Cat_(j+1)/Cat_j=2(2j+1)/(j+2)`. Thus the positive margin persists for every larger rank. This checks **every** `r<=p-2`, not just its endpoint.

For `p=6,7`, the tree has `n-1=2p+2` edges. The sum of outside degrees `d_c=|N_T(c)∩U|` over the five cover vertices counts cross edges and is at most `n-1`. Pigeonhole gives an actual `c∈C` with `d_c<=floor((n-1)/5)`, namely `2` at `p=6` and `3` at `p=7`. Its singleton `{c}` **is present** in the partition and has `b_c=N-d_c>=8` or `>=9`, respectively. Keep its actual contribution `E(b_c,r-1)`; for `r>=1`, monotonicity gives the endpoint lower bound `E(b_min,r-1)`, because `b_min>=2(r-1)` throughout the checked ranks. Charge only the other four singleton fibers to their floors and charge nonempty larger fibers at most `binom(5,a)` floors. At `r=0`, the singleton has shift `-1` and contributes `+1`; omit it and all other positive negative-rank shifts. Therefore for `1<=r<=p-2`,

`Delta_r(T) >= E(N,r)+E(b_min,r-1)-[4Cat_(r-1)+Σ_(a=2..min(5,r))binom(5,a)Cat_(r-a)]`.

The independently recomputed exact endpoints are:

| `p` | `r=0` | `r=1` | `r=2` | `r=3` | `r=4` | `r=5` |
|---:|---:|---:|---:|---:|---:|---:|
| 6 | 9 | 38 | 81 | 90 | **1** | — |
| 7 | 11 | 58 | 167 | 295 | 284 | **0** |

At `p=6,r=4`, the displayed inequality is `42+14-(4*5+10*2+10*1+5*1)=1`. At `p=7,r=5`, it is `132+0-(4*14+10*5+10*2+5*1+1*1)=0`. In particular `E(9,4)=0`, and a weak zero bound suffices: `x(T)` is defined by **strict** negativity. So `Delta_r(T)>=0` for every `r<=p-2` in both cases. Eligibility would place a strict negative difference in that range, a contradiction. Together with the `p>=8` result, every eligible parent with `p>=6` has `tau(T)>=6`.

For `p=3,4,5`, the pinned forest linear-bound lemma applies to the tree at `k=x(T)` without a lower-rank guard. Eligibility gives `x(T)<=p-2`, hence `2p+3=n<=4x(T)<=4(p-2)`. The order gaps are `9-4=5`, `11-8=3`, and `13-12=1`. Thus no eligible parent exists in these three cases. The lemma includes `k=0`; there is no hidden endpoint exception. If the external pinned lemma were unavailable, this vacuity step would remain an explicit dependency.

## Original leaf, marks, and cover loss

Fix an **original** leaf `v` and its original support `s`; set `k=p-1`, `H=T-{v,s}`, `W=N_T(s)\{v}` as a vertex set of `H`, and `R=T-N_T[s]=H-W`. For eligible `p>=6`, `|H|=2k+3` and `k>=5`. Adding `s` to any cover of `H` covers every edge of the original tree, so `tau(H)>=tau(T)-1>=5`. Deleting vertices keeps `H` a forest. There is a nonisolated mark in `W`: every component of `H` attaches to `s` in the connected original tree, and a component containing an edge attaches through a marked vertex with a neighbor in `H`. Since `tau(H)>=5`, such a component exists. Put one nonisolated mark first and list the remaining distinct marks in any order, including isolated marks.

Let `q_j` count independent `j`-sets of `H` meeting `W`. Partition each such set by its first marked vertex `w_i`. With `D_i=N_H[w_i]∪{w_1,...,w_(i-1)}` and `J_i=H-D_i`, the bijection deleting `w_i` gives the exact identity `q_j=Σ_i i_(j-1)(J_i)`. Earlier **mark vertices** are removed, not their neighborhoods, so arbitrary overlap with `N_H[w_i]` is allowed. The first `D_i` has at least two vertices because its mark is nonisolated; every later `D_i` has at least two because it includes its current and an earlier distinct mark, even if the current mark is isolated.

For any cover `K_i` of `J_i`, the set `K_i∪(D_i\{w_i})` covers `H`: an edge removed by deletion and incident to `w_i` has its other endpoint in `N_H(w_i)`, while any other removed edge has an endpoint in `D_i\{w_i}`. Hence `tau(J_i)>=tau(H)-(|D_i|-1)>=6-|D_i|`. This proof uses the actual union size, so overlap cannot invalidate it. A finite forest has cover number equal to matching number by the usual leaf-edge induction, including isolated components. Thus:

* `|D_i|=2`: `|J_i|=2k+1`, `tau(J_i)>=4`, so four disjoint edges exist; the explicit matching-four injection gives `i_k(J_i)<=i_(k-1)(J_i)`.
* `|D_i|=3`: `|J_i|=2k`, `tau(J_i)>=3`, so at least two edges exist; the explicit two-edge injection gives the same inequality. The saved first-wide theorem reported in the prior audit would also be in range with `r=k-1>=4`, but its original source was not available for inspection here.
* `|D_i|>=4`: `|J_i|<=2k-1`. Counting deletion incidences gives `k*i_k(J_i)<=(|J_i|-k+1)*i_(k-1)(J_i)<=k*i_(k-1)(J_i)` when `|J_i|>=k-1`; if `|J_i|<k-1`, then `i_k(J_i)=0` directly. Empty graphs and out-of-range coefficients cause no exception.

Summing these disjoint fibers yields `q_(k+1)<=q_k`. At every rank, `q_j=i_j(H)-i_j(R)` because the independent sets of `R` are exactly those of `H` avoiding `W`. Therefore the **original** term is `Delta_k(H)-Delta_k(R)=q_(k+1)-q_k<=0`. The argument is pointwise for every original leaf; it never selects favorable leaves or replaces original supports by later ones.

## Limits

This is a self-contained informal combinatorial proof apart from the pinned forest descent bound used for the vacuous `p=3..5` cases. The finite certificate was checked exactly, but the SCD lift, cover budget, deletion bridges, and proposed all-`p` statement were **not formalized or kernel checked** here. The pinned bound's compiled source and receipt were inspected, not rebuilt, and the external provenance condition in its theorem contract was not independently resolved. No statement about the registered lower-region aggregate, other orders, or Erdős #993 is implied. All findings and this PASS are proposals to the controller.
