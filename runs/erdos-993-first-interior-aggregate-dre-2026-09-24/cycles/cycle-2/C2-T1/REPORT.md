# C2-T1 (T search): tagged-shadow bound

## Verdict

The registered OPEN identity `E993-BIPARTITE-TAGGED-SHADOW-BOUND` has a complete finite-set incidence proof at its exact scope. The proof is informal and exact; it does not claim a formal/Lean award. It establishes the OPEN auxiliary for every finite bipartite graph, every tag set (including empty), and every integer rank `1 <= k <= alpha(H)`. It does not prove the primary aggregate or the separate OPEN eligibility auxiliary `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`.

## Definitions and proof

Let `H=(V,E)` be a finite bipartite graph, `W subseteq V`, and `a=alpha(H)`. Let `q_j` count independent `j`-subsets meeting `W`, with zero extension outside the possible ranks. Fix `1 <= k <= a`. Count pairs `(X,u)` where `X` is an independent `(k+1)`-set meeting `W`, `u in X`, and `X\{u}` still meets `W`.

For each such `X`, write `t=|X intersect W|`. If `t=1`, exactly the `k` deletions of vertices outside `W` preserve a tag. If `t>=2`, all `k+1` deletions preserve a tag. Thus every tagged `X` contributes at least `k` incidences, so the incidence count is at least `k q_(k+1)`.

For a fixed tagged independent `k`-set `J`, let

`A(J) = {z in V\\J : z has no neighbor in J}`.

Every extension counted at `J` is a vertex of `A(J)`. There are no edges from `J` to `A(J)`, so the induced graph on `J union A(J)` is the disjoint union of the independent set `J` and `H[A(J)]`. Consequently `k + alpha(H[A(J)]) <= a`, hence `alpha(H[A(J)]) <= a-k`. The induced graph `H[A(J)]` is bipartite. In any bipartite graph on `m` vertices, the larger side of a bipartition is independent, so `m <= 2 alpha`; applying this to `A(J)` gives `|A(J)| <= 2(a-k)`. Therefore each tagged `J` is incident with at most `2(a-k)` counted pairs. Summing over the `q_k` choices of `J` gives at most `2(a-k)q_k` incidences. Combining the bounds proves

`k q_(k+1) <= 2(a-k) q_k`.

The argument permits disconnected H and uses no tree, leaf, selector, residual, descent, or log-concavity hypothesis. For `k=a`, the same count is valid and `q_(a+1)=0`; when `W` is empty all `q_j=0`. No division or nonzero-tag assumption is needed for the inequality.

## Sharpness and checks

The coefficient bound has nontrivial equality even on a connected tree. Let `H=P4` with edges `{0-2, 0-3, 1-2}`, `W={1}`, and `k=1`. Then `a=2`, `q_1=1`, and `q_2=2`; both sides equal 2. This checks that the incidence coefficient/rank form cannot simply be made strictly smaller in general.

Fresh exact falsification/boundary checks were run with the self-written `check_tagged_shadow.py` (standard-library Python, exact integer counts). It checked all 682 labeled bipartite graphs with left/right sizes independently in `{1,2,3}` (orders at most 6) for empty/full tags, each side, and each singleton, 6,568 graph-tag instances total, all ranks `1..alpha`. No violation occurred; there were 722 positive equalities. This is bounded evidence only.

A larger, explicitly constructed target is `K_{11,13}` (all 143 cross edges), with `W` the 11-vertex side. Here `alpha=13`; independent tagged sets of positive size lie in the tagged side, so `q_j=C(11,j)` for `1<=j<=11`, otherwise zero. At `k=5`, `q_5=q_6=462`; `kq_6=2310` and `2(13-5)q_5=7392` (slack 5082). The script checks every rank `1..13` for this and the reversed-side tag. This is a direct larger boundary check, not a universal proof; the incidence argument is the universal proof.

Replay from the run root:

`python3 scratchpad/C2-T1/check_tagged_shadow.py > scratchpad/C2-T1/checks.json`

## Consequence for the leaf formula (conditional bridge only)

For any bipartite `G` with an original leaf `v` and support `s`, set `H=G-{v,s}`, `W=N_G(s)\\{v}`, and `R=H-W=G-N_G[s]`. The sets counted by `q_j` are exactly the independent `j`-sets of `H` not wholly in `R`, so `q_j=i_j(H)-i_j(R)`. Since `v` is isolated from `H`, adjoining `v` to any independent set of `H` gives `alpha(H)<=alpha(G)-1`.

For `p>=2`, let `k=p-1`. If `3p>=2alpha(G)+1`, then `3k>=2alpha(G)-2>=2alpha(H)`, so `2(alpha(H)-k)<=k`; the proved inequality gives `q_p<=q_(p-1)`. This is exactly `Delta_(p-1)(H)-Delta_(p-1)(R)<=0`. If `k>alpha(H)`, both q terms are zero, so the same conclusion holds by zero extension. At `p=1`, the high-tail guard forces `alpha(G)<=1`; the existence of a leaf then forces the nontrivial component to be `K2` and there can be no other vertices (any isolate or other component would increase alpha). Thus `H=R=empty` and the difference is zero. This separately handles the unavailable `k=0` incidence premise.

At the primary rank `p=alpha(T)-2`, the proposed high-tail guard is equivalent to `alpha(T)>=7`. Therefore use on the eligible primary class still depends on the distinct OPEN eligibility statement; this report supplies no proof of that statement. And even if the bridge applies, only the proposed per-leaf signs are obtained after eligibility, rather than a proof of the full primary under all its ranks.

## Inherited fences and scope

All 89 REFUTED mechanism identities remain confined to their admitted exact scopes. The neighboring fences reviewed here do not obstruct this distinct count inequality: `E993-BETA-TARGET` (order-243 and order-91 governed beta witnesses) and `E993-BETA-AGG-SUPPORT` (order-91 positive support fibre) concern lower-than-high-tail ranks and different coefficient objects; `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` bounds addable vertices for each independent set in a full-G1 residual, not the average tagged-set incidence count proved here. `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-R23-TAG-CLOSED-CUT-HALL`, and the associated hot-tag/Delete-only Hall fences concern a Delete/Retag relation and cut inequalities; no such relation is used here. These fences are not reopened and do not provide evidence for or against this lemma.

The primary `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` remains OPEN: the result here is only its proposed bipartite counting auxiliary plus a conditional high-tail translation, and the eligibility bridge has not been established. The verified r26 result is separately scoped to top rank `alpha-1` under residuality and is not invoked.

## Limitations and execution

The exhaustive check is only the stated finite range and tag families; the larger check covers one explicit order-24 graph and all its ranks. Neither finite computation is used as a universal proof. The proof was checked directly from finite-set incidence and bipartition facts. No Lean build or other imported script was run. All outputs and the script are in this worker's assigned scratch directory; no background process remains active.
