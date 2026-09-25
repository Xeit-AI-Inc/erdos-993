# C2-U2 — semantic transport audit (U)

**Proposed worker audit only; no registry status changes.** The first-interior target remains OPEN. The proposed composition is mathematically coherent if its three OPEN inputs are proved and the listed carrier equalities are formalized. The pinned r26 theorem cannot itself prove the target: it is at rank `alpha-1` and assumes residuality. The r27 forest order bound can support the proposed eligibility reduction, but only after the original-tree first-descent and coefficient carriers are explicitly identified with its G1 carriers.

## Authority and exact target

The target is the integer-rank statement in `SOLUTION-CONTRACT.md` §§1–2: for an ordinary finite connected tree `T`, integer `p=alpha(T)-2`, eligibility `x(T)+2<=p`, and the complete sum over every favorable original degree-one vertex with tags retained, prove/refute `S(T,p)<=0`. The definitions in `SEMANTIC-CONTRACT.md` §§1–2 require strict negative descent, zero extension, the selector `Delta_p(T-v)<0` at the unshifted rank, and integer `p`. In particular, eligibility itself gives `p>=2`, hence `alpha>=4`, before converting to Nat ranks.

The r26 source defines `C4LA1.vertexDeletionIndepSetCount`, `vertexDeletionForwardDifference`, and `IsFavorableAt` as Nat-ranked counts of independent subsets avoiding the selected original vertex and an integer-cast forward difference (pinned r26 `source/LeanProof/Main.lean`, lines 14–46). Its C5 layer defines support, leaf tags, deletion sets `H` and `R`, avoiding-set counts, Nat-rank differences, and the exact sum over the favorable leaf-set filter (lines 63–92, 116–205). This is the right *representation* for the primary sum, but it is not the stated top-rank residual theorem: the pinned contract for `R26LA1.topRankResidualSign` uses `indepNum-1` and a residual hypothesis (pinned r26 `THEOREM-CONTRACT.md`, “Intended Theorem” and “Exact Lean Binding”; source terminal declaration at `Main.lean` lines 3978–3982). It must not be applied at `indepNum-2` or with residuality omitted.

## Required coefficient/deletion agreement obligations

The primary coefficients can be transported to r26 C4/C5 by finite-set bijections; no change of rank is allowed:

1. For every `G`, vertex `v`, and `k:Nat`, prove `C4LA1.vertexDeletionIndepSetCount G v k = C5LA1.indepSetCount G {v} k`. Both sides count the same `k`-subsets of `univ.erase v` / `univ \ {v}` satisfying `G.IsIndepSet`; this is extensional equality of the filtered finite sets. Cast both counts to `Int` and subtract at `k+1,k` to identify `C4LA1.vertexDeletionForwardDifference G v k` with the primary `Delta_k(G-v)`.
2. For `v` satisfying `IsGraphLeaf G v`, prove the chosen `C5LA1.support G v` is its unique original neighbor. Then identify `C5LA1.H G v` with `{v,s_v}` and `C5LA1.R G v` with `{s_v} union neighborFinset(s_v)`. `C5LA1.indepSetCount G D k` is an original-vertex-type encoding of independent `k`-sets in the induced deletion `G-D`; the required lemma identifies it with the primary induced-subgraph coefficient, for every Nat `k`, including zero ranks above the induced graph's alpha.
3. With `p>=2`, prove `C5LA1.forwardDifferenceDel G (H G v) (p-1)` is exactly integer `Delta_(p-1)(H_v)` and likewise for `R`. The Nat `p-1` here is safe only after deriving `2<=p`; otherwise truncated subtraction can change the index. The selector equality must be `C4LA1.IsFavorableAt G v p ↔ Delta_p(T-v)<0`, not a selector at `p-1` or a rank shifted to `alpha-1`.
4. Prove `C5LA1.leafSet G` is exactly the finite set of original degree-one vertices and rewrite the double sum without replacing it by a support image. The C5 aggregate already filters and sums by leaf vertex, so two original leaves at the same support occur twice as required. Off-leaf arbitrary values of the noncomputable `support` are harmless only after keeping support-dependent rewrites under the leaf proof.
5. Bind `G.indepNum` to the ordinary maximum independent-set number `alpha(T)` and convert the integer equation `p=alpha-2` to Nat `p=G.indepNum-2` using the proved positivity guard. For the first-descent coefficients, count equality must hold at every nonnegative rank; negative integer ranks use the primary/G1 zero convention. This yields the primary aggregate definition only, not a sign.

These are exact finite counting identities and should be straightforward Lean lemmas, but they are not included in the pinned r26 top-rank theorem as an interior theorem. The r27 coefficient `Erdos993G1.indepCount` is an `Int` cast of `Nat.card` of a subtype (r27 LA4 `Main.lean`, lines 12–25); `coeff` sets negative integer ranks to zero and `delta` is the forward difference (lines 20–35). Its `coeff_nat` / `delta_nat` lemmas (lines 1220–1238) identify nonnegative ranks, but the C5-to-G1 count equality above is still needed.

## First-descent/order-bound transport and eligibility reduction

The public r27 LA4 package defines `firstDescent` by `Nat.find` on the G1 strict-negative-delta predicate (source lines 341–346), proves `delta_firstDescent_neg` (1258–1268), and states the unconditional finite-forest order bound `forest_descent_linear_bound`: `Delta_k<0 -> Nat.card X<=4*k` (1427–1460). The contract states that the only structural hypothesis is acyclicity; connected trees satisfy it. The G1 count uses `Nat.card` on finite subtypes, so transporting from an `Fintype` tree additionally requires `Nat.card_eq_fintype_card` and the count bijection.

The exact descent bridge is:

- first prove `C5LA1.forwardDifferenceDel G ∅ k = Erdos993G1.delta G (k:ℤ)` for every Nat `k` from the full-graph coefficient equality and `delta_nat`;
- then identify the two least indices, `C5LA1.crossingIndex G = Erdos993G1.firstDescent G`, by equality of their Nat.find predicates (both source definitions are Nat.find after this transport); or prove the bound directly at the primary `x` with `delta_firstDescent_neg` after the same equality.

There is a distinct indexing hazard in the adjacent r27 package: LA2's `firstDescent` carrier is `Nat.sInf {k | delta ...<0}` (LA2 source lines 89–100), while LA4's record is the `Nat.find` definition above. The common packet is right to warn that this is not definitional equality. If importing LA2 declarations, supply a set-infimum/Nat.find equality; do not quietly identify the constants. Likewise, the primary `x` is the first *strict* negative index, not a first maximum or weak descent.

After the bridge, set `x=C5LA1.crossingIndex G`. Applying r27 LB at this actual descent gives `n<=4x` with no extra rank offset. Eligibility at `p=alpha-2` gives `x+2<=alpha-2`, hence `x<=alpha-4`; therefore `n<=4(alpha-4)`. The following exact small-case argument supports the proposed OPEN eligibility lemma `alpha>=7`:

- Eligibility already gives `alpha>=4`. If `alpha=4` or `5`, `n>=alpha` contradicts `n<=4(alpha-4)`.
- If `alpha=6`, then `n<=8`. A connected tree with alpha equal to its order is edgeless, so `n!=6`; thus `n=7` or `8`. Also `Delta_0=n-1>0`; at `n=7` or `8`, `i_2 = binom(n,2)-(n-1)` is respectively 15 or 21, exceeding `i_1=n`, so `Delta_1>0`. As `x<=2`, this forces `x=2` and `Delta_2<0`.
- At `n=7`, alpha 6 means a vertex cover of size one, so connectedness makes the tree the 6-leaf star. Then `i_2=15`, `i_3=20`, hence `Delta_2=5`, contradiction.
- At `n=8`, fix an independent 6-set `A`; its complement `C` has two vertices and is a vertex cover. There are 21 independent pairs, so `Delta_2<0` requires `i_3<=20`. The 20 triples from `A` already attain that count. Each `c in C` therefore has no independent triple with two vertices of `A`, forcing c adjacent to at least five of A. This requires at least ten A–C edges, impossible in a 7-edge tree.

This is a compact informal proof of eligibility from the r27 order bound plus exact tree counting, but it is not a formally admitted auxiliary proof in the current packet. It must retain its own OPEN ID until formalized/adjudicated. The package's `Nat.card` order and the ordinary `n` must be bridged as above.

## Pointwise tagged-shell transport and conditional end-to-end check

For an original leaf `v` with support `s`, define `H=T-{v,s}`, `W=N_T(s)\\{v}` as a subset of `H`, and `R=T-N_T[s]`. The exact set identity is `R=H-W`. Thus, for `q_j` the number of independent `j`-subsets of `H` meeting `W`, prove `q_j=i_j(H)-i_j(R)`. Direct subtraction then gives

`Delta_(p-1)(H)-Delta_(p-1)(R) = q_p-q_(p-1)`.

The selector's corresponding branch recurrence is `I(T-v)=I(H)+z I(R)`, so `Delta_p(T-v)=Delta_p(H)+Delta_(p-1)(R)`. This recurrence controls which tags enter the sum, but the proposed pointwise shadow sign does not use favorability; it would suffice for all original leaves.

The registered OPEN tagged-shadow statement counts independent `j`-sets of a bipartite `H` that meet an arbitrary `W`, with `a=alpha(H)`, and proposes `k*q_(k+1)<=2(a-k)*q_k` for `1<=k<=a`. For the target's `p>=2`, set `k=p-1>=1`. Prove `alpha(H)<=alpha(T)-1` by extending every independent set in H with the deleted leaf v. If `k>alpha(H)`, both q counts vanish; otherwise, under `3p>=2alpha(T)+1`, obtain `3k>=2alpha(T)-2>=2alpha(H)`, so the tagged inequality yields `q_(k+1)<=q_k` by integer arithmetic. At `p=1`, the OPEN high-tail pointwise claim needs a separate case (the guard forces alpha<=1; a graph with a degree-one vertex and alpha=1 is K2, for which H is empty). This endpoint is irrelevant to the eligible primary but cannot be omitted from the broader registered pointwise statement.

At the primary rank, the guard is exact: `3(alpha-2)>=2alpha+1` iff `alpha>=7`. Thus, if the OPEN eligibility claim and OPEN tagged-shadow count inequality are proved, every original leaf term is nonpositive for every eligible primary tree, and summing over the exact favorable filter with multiplicity gives `S<=0`. I found no index shift or selector loss in this composition. However, the tagged-shadow statement and eligibility statement are not established by the r26/r27 carrier packages, and the required coefficient/deletion and descent equalities above have not been supplied as a formal proof in this search. Therefore this is a conditional route, not an end-to-end proof of the primary. It neither uses residuality nor settles any stronger all-rank/forest/governed claim.

## Inherited obstruction fences and exact fresh check

The C2 scope audit and rejected-mechanism registry make the relevant inherited fences precise. `E993-BETA-TARGET` is refuted for its governed RTree/h-index support expression and broader rank scope; `E993-BETA-AGG-SUPPORT` is refuted for favorable support-fibre totals at broader ranks; neither is the proposed ordinary-bipartite tagged-count inequality. In particular, the order-91 T22 positive local term at rank 34 and order-243 T60 positive local term at rank 90 fail the proposed high-tail guard (`3p<2alpha+1` for the recorded alpha values), while their first-interior target-rank rows are negative. They do not refute the restricted high-tail route or the primary. The refuted `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` bounds extensions for every full-G1 residual independent set; it is not a ratio between tagged independent-set counts. No ordinary-tree/RTree equivalence is inferred. The eligible non-residual examples in the Cycle 1 synthesis (including its order-7 and order-12 certificates) remain important checks: the proposed route has no residual premise, and their complete sums are negative, not primary counterexamples. These are scope checks only; all inherited REFUTED scopes remain unchanged.

I also built and exactly evaluated a fresh larger ordinary tree for this route, the explicit `T_151` construction in `fresh_large_target.py`: one root, a length-two arm, and 151 root-adjacent centers each with three leaves. It has 607 vertices, 606 edges, and 454 original leaf tags. The script computes the independence polynomial by exact integer tree dynamic programming, then recomputes the deleted-vertex, H, and R polynomials for every tag. It includes the terminal rank in first-descent search. The exact output is in `fresh_large_target.json`: `alpha=455`, `p=453`, `x=219`, eligible; all 454 leaves are favorable (selectors `-905` for the marked arm leaf and `-454` for each star leaf); the corresponding terms are `-101925` and `-102828` respectively, complete `S=-46683009`, and terminal `Delta_alpha=-1`. This finite check is not a proof and does not validate the auxiliary lemma universally. The inherited family census includes through m=150; m=151 is a self-built order-607 check beyond that listed family range and beyond T60's order 243.

Replay from the run root: `python3 scratchpad/C2-U2/fresh_large_target.py > scratchpad/C2-U2/fresh_large_target.json`. This was one deterministic construction, not an unbounded search. No source evaluator was run in place. No Lean build or background job was started.

## Proposed claim

`C2-U2-TRANSPORT-AND-CONDITIONAL-COMPOSITION` — **proposed_unresolved**. Exact scope: the semantic bridges and conditional entailment above, with the primary still open until the tagged-shadow and eligibility auxiliaries plus formal carrier lemmas are proved. This is a U search finding, not a claim that any incoming or registry status has changed.

## Limits

No Lean source was built. I did not prove the registered tagged-shadow inequality, prove/adjudicate the alpha-at-least-seven auxiliary, or complete Lean carrier equalities. One larger exact tree and inherited scope fences were checked; there was no universal computational search. The r26 rank-`alpha-1` residual theorem remains outside the primary scope. All writes completed and no owned job remains running.
