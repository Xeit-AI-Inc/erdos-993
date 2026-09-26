# C2 order-band audit — proposed worker findings

**Authority:** proposal to the controller only. The pinned brief's eleven listed source hashes all match. I made no source, registry, or Lean edits and did not build Lean.

## Verdict and exact scope

| Registered key | Audit result | Recommendation |
| --- | --- | --- |
| `E993-MARKED-ISOLATE-ORDER-BAND` | **PASS, informal proof** | Retain exactly: finite simple graph, `W` contains every isolate, `k>=2`, `m<=2k+1`. The order and rank guards are substantive. |
| `E993-ORDINARY-LEAF-ORDER-BAND` | **PASS, informal corollary** | Retain original tree, original leaf/support/closed neighborhood, `p>=3`, `|T|<=2p+1`, integer zero extension. No favorability premise is needed. |
| `E993-LOWER-REGION-FIRST-ORDER-SHELL` | **UNCERTAIN** | Retain **OPEN**. It is the next disjoint order shell, and it is nonempty, but this audit gives no universal sign proof there. |

The 412-record identity snapshot has 412 distinct keys. Neither proved order-band scope duplicates another record in that snapshot. `E993-BETA-TARGET` and `R17-BETA-D2-PGE7` are refuted over unrestricted order, while the new ordinary-leaf inequality imposes `|T|<=2p+1`; the order-91 and order-243 positive local controls have respectively `91>2·34+1` and `243>2·90+1`. Their complete favorable aggregates are negative, not counterexamples to the aggregate. `E993-BIPARTITE-TAGGED-SHADOW-BOUND` and the tagged deficit identity use bipartiteness and an independence-number cap; they do not have this arbitrary-graph marked-isolate scope. `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` uses `3p>=2a+1`, disjoint from the strict lower region. The verified first-interior claim is in that high-tail region at its eligible rank. Ordinary G1 residual-order claims concern a different graph and rank. The first-shell key is a proper slice of the OPEN lower-region aggregate, not an alias of either order-band key.

## Complete informal proof and inference ledger

Let `I_j(G;W)` be the independent `j`-sets meeting `W`, and put `q_j=|I_j(G;W)|`. For `A∈I_k(G;W)`, let `b(A)=|N_G(A)|`, where `N_G(A)` is the union of **open** neighborhoods, `B=Σ_A b(A)`, and let `C` count each independent `(k+1)`-set with at least two marks **once**.

| Step | Inference | Audit |
| --- | --- | --- |
| 1 | Independence gives `A∩N_G(A)=∅`; exactly `m-k-b(A)` vertices extend `A`. | Correct, including empty families and ranks above `alpha(G)`; count in integers so `m-k` is not truncated. |
| 2 | An upper set with exactly one mark has `k` marked-preserving deletions; one with at least two marks has `k+1`. | Correct. The latter contributes the **single** correction `C`, independent of its number of marks. |
| 3 | Double counting gives `k q_(k+1)+C=(m-k)q_k-B`, hence `k(q_(k+1)-q_k)=(m-2k)q_k-B-C`. | Correct. For `m<=2k`, all terms on the right are nonpositive. |
| 4 | At `m=2k+1`, call `A` bad when `b(A)=0`. It then consists entirely of isolates; every other marked `A` contributes at least one to `B`. | Correct for a simple graph. Thus `B>=#good`. The isolate condition ensures every isolate-only `k`-set is marked. |
| 5 | If a non-isolate `y` exists, `A↦A∪{y}` maps bad sets injectively into upper sets counted by `C`: `y∉A`, all isolates are nonadjacent to `y`, and the image has at least `k>=2` marks. | Correct. The fixed `y` is recovered by deletion, even if `y∈W`; hence `C>=#bad`. |
| 6 | Therefore `B+C>=q_k`, making the step-3 right side nonpositive. If no non-isolate exists, the graph is edgeless, `W=V`, and complement pairs the `k` and `k+1` layers at `m=2k+1`. | Correct. The empty graph falls under `m<=2k`; `W=∅` with no isolates and `k>alpha` also give zero marked layers. Division is only by positive `k`. |
| 7 | For an original leaf `v` with support `s`, put `H=T-{v,s}`, `W=N_T(s)\{v}`, `R=T-N_T[s]`. Every isolate `u` of `H` has an original neighbor by connectivity; it cannot be `v`, and any neighbor besides `s` would survive in `H`, so `u∈W`. | Correct for all ordinary trees with a degree-one leaf, including the two-vertex tree where `H=W=R=∅`. A one-vertex tree has no leaf. The neighborhoods must be taken in original `T`. |
| 8 | `R=H-W` as induced graphs, so `q_j=i_j(H)-i_j(R)` at every nonnegative rank, with zero extension. Taking `k=p-1` gives `q_p-q_(p-1)=Δ_(p-1)(H)-Δ_(p-1)(R)<=0`. | Correct: `p>=3` gives `k>=2`, and `|H|=|T|-2<=2k+1`. The selector does not enter. |
| 9 | In a nonempty tree, `Δ_0(T)=|T|-1>=0`, hence `x(T)>=1`. Eligibility `p>=x+2` entails `p>=3`; summing step 8 over the fixed favorable set gives `S(T,p)<=0` whenever `|T|<=2p+1`. | Correct; an empty tree, if admitted by a convention, has no leaves and `S=0`. No statement is transferred to other orders. |

The guards have visible boundaries. At `k=1,m=3`, one edge plus one isolated marked vertex gives `q_2=2>q_1=1`, so the generic `k>=2` cannot be dropped. At `m=2k+2`, take `G=K_(1,2k+1)` and mark one pendant vertex. For `j>=2`, `q_j=binom(2k,j-1)`, so `q_(k+1)-q_k=binom(2k,k)-binom(2k,k-1)>0`. This proves the generic order cutoff is sharp.

For the tree embedding, attach a support `s` to the marked vertex `w` and a new leaf `v` to `s`. At `p=k+1`, `|T|=2k+4=2p+2`, `alpha(T)=2k+2`, and the `v`-summand is the same positive binomial difference. Writing `n_0=2k`,

`I(T,z)=(1+z)^(n_0)(1+3z+z²)+z+2z²`.

The base product is symmetric of degree `2k+2`. Its adjacent differences are positive through rank `k`: below `k` this follows from binomial unimodality, and at `k` the difference is `2[binom(2k,k)-binom(2k,k-1)]+[binom(2k,k-1)-binom(2k,k-2)]>0`. The added polynomial changes `Δ_0,Δ_1,Δ_2` by `+1,+1,-2`; the base `Δ_2=n_0(n_0-1)(n_0+4)/6-2n_0-1>=7`. Symmetry gives a negative base difference at `k+1`, where the correction is zero. Thus `x(T)=k+1=p`, and the shell example fails the primary guard `p>=x+2` even though its local term is positive. This is a parameterized boundary diagnostic, not a shell refutation.

## First remaining shell and bounded falsification

For each eligible `p`, the proved band ends at `|T|=2p+1`; the next integer order is exactly `|T|=2p+2`. The proposed first-shell class is therefore disjoint from the proved band and has the fixed original-leaf selector and full aggregate specified in the contract. It is nonempty: take six centers in a path, each with two pendant leaves. At `p=8`, this tree has order `18=2p+2`, `alpha=12`, `x=6`, `3p=24<25=2alpha+1`, twelve favorable leaves, and `S=-4256`. Its independence vector and edge list are in `AUDIT-CHECK.json`; brute subset enumeration matched the forest DP. A single negative instance gives no general shell verdict.

The replayable `audit_check.py` independently enumerated every labeled graph of orders 0–5 and every admissible `W` (`1100` graphs, `29078` graph/mark pairs, `173545` rank cases), plus deterministic samples at orders 6–7 (`1991` graphs, `11560` graph/mark pairs, `75258` rank cases). It checked both the exact incidence identities and the inequality, with no failure. It also checked all `18248` labeled trees of orders 2–7, all original leaves and in-band ranks (`405290` leaf/rank cases), with no failure. **None** of those small trees satisfied the lower-region favorable-aggregate guards, so that census is not aggregate evidence. The sharpness tree family was checked at `k=2..6`, with local excesses `2,5,14,42,132` and `x=p` each time. The controller's separate order-5 receipt reports `28217` marked cases; its graph/order/rank boundary differs from this script's broader enumeration. The listed order-91, order-243 and order-247 controls have internally consistent sums of their stated summands; the order-247 receipt has `n=2p+1` and negative aggregate, so it is finite support for the band only.

## Pinned Lean source: reusable interface and plan

The read-only source pin matches `FirstInteriorMain.lean`. Public definitions already encode literal original deletion counts and zero extension: `C4LA1.IsGraphLeaf`, `C4LA1.IsFavorableAt`, `C5LA1.support`, `H`, `R`, `indepSetsAvoiding`, `forwardDifferenceDel`, `aggregate`, `crossingIndex`, and `E993Interior.taggedFamily`. The existing public `E993Interior.taggedShadowBound` uses bipartite coloring and an alpha cap, so it does not prove the arbitrary-graph order-band lemma. The private `H_subset_R` and `tagged_count_split` arguments in `E993Interior.Leaf` show how to bridge the original deletion sets to marked counts; a future formalization must reprove or expose those helpers in a separately controlled source extension.

A formal plan is: (1) define isolate coverage and the marked family on `Finset.univ`; (2) prove the exact incidence identity in `ℤ`, with `B` and once-per-upper-set `C`; (3) prove the bad-set injection and edgeless complement case, including `m<k`; (4) prove original-tree isolate coverage and the `H/R` count split; (5) instantiate at `k=p-1` and sum over `C5LA1.aggregate`'s existing favorable filter. Every proposed theorem statement should retain the displayed rank and order guards. This plan is unbuilt and makes no Lean or formal-award claim.
