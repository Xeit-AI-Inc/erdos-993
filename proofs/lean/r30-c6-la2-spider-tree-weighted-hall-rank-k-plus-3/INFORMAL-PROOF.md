# Informal proof — C6-LA2 (spider `S(1,2,3^k)`: tree face, eligibility and (HALL) at rank `k+3`, `k ≥ 5`)

Canonical run id: `erdos-993-math-dre-20260926-r30-weighted-transport`. Award `C6-LA2`, the terminal Stage 7 of r30.
Formalizer: `c6-la2-formalizer-opus-20260928` (chartered Claude Opus 5.5 on dispatch-record authority; runtime-reported
model id `claude-opus-5-5[1m]`). Governing text: `control/C6-STAGE7-FORMALIZER-BRIEF-LA2.md` §2 and the Cycle 6 synthesis
`## Lean awards` "C6-LA2". This document is at statement level. It follows the proof of record: the mathematics of FLOW is the
registered spider key (`E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2`,
`proved_informal`, confirmed by the isolated second read SR-C5-2), and the Lean text follows critic `C-U1-T`'s block
assignment (r30 Cycle 6 F2/F3), verified step by step by the r30 Cycle 6 U adjudicator. No grade is asserted for any
companion lemma; the only graded object is the terminal theorem, whose grade the workflow assigns after its gates.

## 0. Statement

For every natural `k ≥ 5`, with `G = S(1,2,3^k)` on `Fin (3k+4)`:

1. `G` is a tree;
2. `x(G) + 2 ≤ k + 3`, where `x(G) = C5LA1.crossingIndex G` is the first strict descent of the independence sequence;
3. `3(k+3) < 2α(G) + 1`;
4. there is a saturating integral flow of the transport network of `G` at rank `p = k+3` with tag set
   `F = favorableLeaves G (k+3)` (the fixed original strict selector), i.e. (HALL) at the eligible rank `k+3`.

Items 2 and 3 say that `p = k+3` is eligible. `hk : 5 ≤ k` is used ONLY for item 3: `α = 2k+2`, and
`3(k+3) < 2(2k+2)+1 ⇔ 3k+9 < 4k+5 ⇔ k > 4`. The statement is FALSE for `k ≤ 4` because the low window is empty there
(`3(k+3) ≥ 4k+5`), so no rank is eligible at `k+3`; the other three items hold for every `k ≥ 1`. The root split (item 2)
consumes only the consequence `1 ≤ k`.

Labels of record (U1 `Spider.lean`; the registered key's labels): `0` the root; `1` the pendant leaf; `0–2–3` the pendant path
(`3` the cherry leaf); arm `i < k`: `a_i = 4+3i`, `b_i = 5+3i`, `c_i = 6+3i`, the pendant path `0–a_i–b_i–c_i`. Edges:
`0–1`, `0–2`, `2–3`, `0–a_i`, `a_i–b_i`, `b_i–c_i`. Every label is a natural `< 3k+4`; the only ℕ subtractions in labels are
`(n−4)/3`, `(n−6)/3` and `n−1`, each used only under a hypothesis (`4 ≤ n`, `6 ≤ n`, `n ≠ 0`) from which `omega` closes the
arithmetic.

## 1. Definitions used (all carried byte-identically except the spider layer)

- `indepFamily G j` = `I_j(G)`; `tagWitnesses G v = N(s_v) ∖ {v}`; `activeWeight G F B = #{v ∈ F ∩ B : (B∖{v}) ∩ W_v ≠ ∅}`
  (ACTIVE tags); `favorableLeaves G p = {v ∈ leafSet G : Δ_p(G − v) < 0}`; `transportRel G B A` = (D) ∪ (S) literally;
  `IsSaturatingFlow G F p f`: `f` positive only on (REL) arcs between layers `I_{p+1}` and `I_p`, every source sends exactly its
  active weight, every target receives at most its active weight. These are C1-LA1's definitions, carried through C4-LA1's
  `Snippets/` (entries 14–20).
- `C5LA1.leafSet`, `C5LA1.support`, `C4LA1.IsGraphLeaf` (entries 4–6), `C5LA1.indepSetsAvoiding/indepSetCount/
  forwardDifferenceDel` (entries 9–11; `forwardDifferenceDel` is ℤ-valued: `(i_{k+1} : ℤ) − i_k`, no truncated ℕ
  subtraction), `C5LA1.crossingIndex` (first-interior entry 14: `Nat.find` of `Δ_k(G) < 0`).
- The chain machinery (C4-LA1 entries 25–37): `ChainFactor` blocks `single v`, `path x y z` (chains `∅<{x}<{x,z}`, `{y}`,
  `{z}`), `frozen vs s`; `code`, `drop`, `rk`, `Valid`, `chainDownUp` (steps down/up in the iterated two-chain decomposition),
  `chainDownVertex`, `chainVerts`, `chainSize`, `chainRank`, `ChainValid`, `ChainDisjoint`.
- NEW (namespace `E993Transport`): `spiderEdge`, `spiderOneTwoThrees` (`SimpleGraph.fromRel spiderEdge`),
  `spiderOneTwoThrees_decAdj` (the decidability of adjacency: `spiderEdge` is a finite disjunction of ℕ equalities and a
  bounded `∃ i < k`; registered as `@[reducible, instance] def`; no classical choice), `spiderVertex`, `spiderParentVal`,
  `spiderParent`, `spiderChildEdge`, `spiderCell`, `spiderPartner`, `spiderIndepWitness`, the blocks `spiderLeafBlock`,
  `spiderMidBlock = path(3,2,0)`, `spiderArmBlock`, `spiderArmIndex`, the block list `spiderTagFactors k τ =
  [β₁(τ), path(3,2,0), A_0 … A_{k−1}]`, the down-map `spiderTagDown`, the root-split map `spiderRootSplitDown` and its missed
  witness `spiderRootSplitWitness`.

Finiteness enters through `Fin (3k+4)` (every `Finset` layer is finite; `Fintype` and `DecidableEq` are the core instances).
Decidability of adjacency enters through `spiderOneTwoThrees_decAdj`, which is the `DecidableRel` instance every carried
definition is elaborated against.

## 2. N1 — `S(1,2,3^k)` is a tree (`spiderOneTwoThrees_isTree`)

Every non-root vertex `v` has a parent `spiderParent v` of smaller label adjacent to it (`1,2 ↦ 0`, `3 ↦ 2`, `a_i ↦ 0`,
`b_i ↦ a_i`, `c_i ↦ b_i`). Connectivity: every vertex is reached from `0` by a walk of length `≤ 3`. Edge count: the map
`v ↦ s(v, parent v)` from the `3k+3` non-root vertices to `Sym2` is injective (two children with swapped parents would have
each label smaller than the other) and its range is exactly the edge set (each edge `u–v` listed in `spiderEdge` has its
larger label's parent equal to the smaller). So `|E| = |V| − 1`, and Mathlib's `isTree_iff_connected_and_card` gives `IsTree`.
Seeded from U1's `Spider.lean` (U1, Claude Sonnet 5), which transcribes the child–parent bijection of C5-LA1's `gkGraph_isTree`
(entries 121–143 there).

## 3. α — `α(S(1,2,3^k)) = 2k+2` (`spiderOneTwoThrees_indepNum_eq`)

Lower bound (critic `C-U1-T`): the set of labels that are nonzero and `≢ 2 (mod 3)` is `{1,3} ∪ {a_i, c_i}` and is independent
(every edge has an endpoint labelled `0`, `2` or `b_i = 5+3i ≡ 2`); its size is `2k+2` by induction on `k` over
`Finset.range (3k+4)` (the `k = 0` base case is a closed evaluation; the step adds labels `3k+4, 3k+5, 3k+6`, two of which
count). Upper bound (critic `C-U1-F`): the `2k+2` cells `{0,1}`, `{2,3}`, `{a_i,b_i}`, `{c_i}` partition the vertices; two
distinct vertices in one cell are adjacent, so an independent set meets each cell at most once; `card_le_card_of_injOn` into
`range (2k+2)`.

Low window (`spider_lowWindow_kPlus3`, critic `C-U1-F`): `3(k+3) < 2(2k+2)+1` for `k ≥ 5`, by `omega`. This is the only use of
`hk`.

## 4. N3a — the root split: `x(S(1,2,3^k)) ≤ k+1` for `k ≥ 1` (`spiderOneTwoThrees_crossingIndex_le`)

Registered SR-C5-2 content; the proof is the Newton-free root split of critics `C-U1-T` (F3) and `C-U1-F` (F4), found
independently.

- **Root bound** (`spider_card_le_of_root_mem`). If `0 ∈ B` independent, then `1, 2, a_i ∉ B`, so on the unfrozen list
  `L₀ = [single 1, path(3,2,0), path(a_i,b_i,c_i)]` the block `{1}` meets `B` in `0`, `path(3,2,0)` in `1 + [3 ∈ B]`, and each arm
  in at most `1` (`b_i`, `c_i` adjacent). Since the blocks partition `V` (`chainVerts = univ`, pairwise disjoint), `|B| =
  chainSize L₀ B` (carried entry 70) `≤ k + 1 + [3 ∈ B]` (carried entries 55, 71). Hence `|B| ≤ k+2`, and `|B| ≤ k+1` if `3 ∉ B`.
  Consequences: a root-present `(k+2)`-set contains `3` (`spider_three_mem_of_root_mem`); an independent set of size
  `p+1 ≥ k+3` avoids the root (`spider_root_notMem`, used in FLOW as (F1)).
- **The map** `ψ : I_{k+2} → I_{k+1}` (`spiderRootSplitDown`): if `0 ∈ B`, `ψ B = B ∖ {3}` (and `3 ∈ B`); if `0 ∉ B`, `ψ B =
  B ∖ {q}` with `q = chainDownVertex L₀ B`. `L₀` is `ChainValid` on every independent set (`path(3,2,0)` and the arm paths are
  paths of the tree), `chainRank L₀ = 1 + 2 + 2k = 2k+3`, and `chainSize = |B| = k+2`, so carried entry 63
  (`2·chainSize + up = chainRank + down`) gives `down = 1 + up ≥ 1` and carried entry 65 gives `q`, with `q ∈ B`
  (entry 64). In both cases `ψ B` is a single deletion, so it lies in `I_{k+1}` (carried entry 74).
- **Injective.** Root membership is preserved (`0 ≠ 3`, and a root-free `B` has root-free `ψ B`), so the two cases do not mix;
  root-present: `B = insert 3 (B ∖ {3})`; root-free: carried entry 68 (`eq_of_chainDownVertex_erase_eq`) under
  `ChainDisjoint L₀` and `ChainValid` on both sources.
- **Missed witness** (`spiderRootSplitWitness`): `W = {labels ≡ 0 (mod 3)} ∖ {3k+3} = {0, 3, c_0, …, c_{k−2}}` — `{0,3}` plus
  one vertex from each of `k−1` arms. It is independent (no edge joins two labels `≡ 0 (mod 3)`), has `k+1` elements (the
  multiples of 3 below `3k+4` are `k+2` by induction on `k`, minus `3k+3`), and for `k ≥ 1` contains both `0` and `3`. It is
  not an image: a root-present image lacks `3`; a root-free image lacks `0`.
- **Count.** `ψ` maps `I_{k+2}` injectively into `I_{k+1} ∖ {W}`, so `i_{k+2} ≤ i_{k+1} − 1 < i_{k+1}`
  (`card_indepFamily_spider_succ_lt`). COUNT BRIDGE: `C5LA1.indepSetCount G ∅ j` is `(indepSetsAvoiding G ∅ j).card` by
  definition (entry 10), and carried entry 46 `indepFamily_eq_indepSetsAvoiding` rewrites `indepFamily G j` to
  `indepSetsAvoiding G ∅ j`; no new bridge lemma is authored. So `forwardDifferenceDel G ∅ (k+1) = (i_{k+2} : ℤ) − i_{k+1} < 0`
  (ℤ throughout; `spiderOneTwoThrees_forwardDifferenceDel_neg`), and `Nat.find_le` on the definition of record gives
  `crossingIndex ≤ k+1`.

## 5. FLOW — `spiderOneTwoThrees_deletionFlow (k p) (hp : k+2 ≤ p) (F ⊆ leafSet)`

The registered spider key's flow clause (`proved_informal`, SR-C5-2); the Lean proof follows `C-U1-T`'s block assignment.
Only `hp : k+2 ≤ p` is consumed; the terminal instantiates `p = k+3`.

- **(F0) leaves and witnesses** (the U adjudicator's node). `leafSet = {1, 3} ∪ {c_i}` (`mem_leafSet_spiderOneTwoThrees_iff`,
  both directions: `0`, `2`, `a_i`, `b_i` each have two distinct neighbours; `1`, `3`, `c_i` each have exactly one), with
  `W_1 = {2} ∪ {a_j}`, `W_3 = {0}`, `W_{c_i} = {a_i}` (`mem_tagWitnesses_spider_{one,three,armTip}_iff`, via the graph-generic
  `support_eq_of_isGraphLeaf_of_adj` and `mem_tagWitnesses_iff_of_adj`). Activity of `τ` in `B` is `∃ w ∈ B, w ∈ W_τ`
  (`not_disjoint_erase_tagWitnesses_iff_exists_mem`, graph-generic).
- **(F1) root absence**: an independent `B` with `|B| = p+1 ≥ k+3` avoids `0` (§4 root bound).
- **(F2) tag-3 vacuity**: `W_3 = {0}`, so a `3`-active source contains the root, impossible by (F1); entry 75's obligations are
  vacuous for `τ = 3`.
- **(F3) blocks**: `𝓑_τ = [β₁(τ), path(3,2,0), A_0 … A_{k−1}]`, `β₁ = frozen({1},{1})` if `τ = 1` else `single 1`,
  `A_j = frozen({a_j,b_j,c_j},{a_j,c_j})` if `j = spiderArmIndex τ` (i.e. `τ = c_j`) else `path(a_j,b_j,c_j)` (C4-LA1's
  `ChainFactor` constructors, entry 25). `ChainDisjoint 𝓑_τ` by labels; `chainVerts 𝓑_τ = univ`, so `chainSize 𝓑_τ B = |B|`
  (entry 70). `path(3,2,0)` has the root as its `z`-vertex and carries the `2–3` edge.
- **(F4) validity** on a `τ`-active independent `B ∋ τ`: `single` blocks are always valid; `frozen({1},{1})` because `1 = τ ∈ B`;
  `path(3,2,0)` and unfrozen arm paths because `B` is independent; for `τ = c_j`, activity gives `a_j ∈ B`, hence `b_j ∉ B`, and
  `c_j = τ ∈ B`, so `B ∩ {a_j,b_j,c_j} = {a_j,c_j}`.
- **(F5) totality**: `chainRank 𝓑_τ ≤ 2k+5` for every `τ` (`2k+4` for `τ = 1`, `2k+5` for `τ = c_j`); with `chainSize = p+1 ≥
  k+3`, entry 63 gives `down ≥ 2(p+1) − (2k+5) ≥ 1`, and entry 65 gives `q = chainDownVertex 𝓑_τ B`, `q ∈ B` (entry 64).
- **(F6) activity after the step.** A frozen block never drops (entry 67), so for `τ = 1` and `τ = c_j` the tag survives, and
  for `τ = c_j` the witness `a_j` survives. For `τ = 1` (`spider_one_active_after_down`, the CARDINALITY argument — NOT
  C4-LA1's box-top entry 107, which is gk-specific and fails for the spider at `p = k+2`): suppose `B ∖ {q}` has no element of
  `W_1`. Then every block of `𝓑_1` meets `B` at most once: `{1}` trivially; `path(3,2,0)` because `0 ∉ B` (`0 ~ 1 ∈ B`) and
  `2, 3` are not both in `B`; an arm with `a_j ∉ B` because `b_j, c_j` are not both in `B`; an arm with `a_j ∈ B` forces `a_j = q`
  (otherwise `a_j ∈ B ∖ {q}` is a witness), the block that dropped `q` is then arm `j` (blocks are disjoint and `q = a_j`
  lies only in arm `j`; the frozen leaf block drops nothing and `path(3,2,0)` does not contain `a_j`), and `drop` of
  `path(a_j,b_j,c_j)` returns `c_j` whenever `c_j ∈ B`, so `c_j ∉ B`, and `b_j ∉ B` since `a_j ∈ B`. By entry 71,
  `|B| = chainSize ≤ length 𝓑_1 = k+2 < k+3 ≤ p+1 = |B|`, a contradiction.
- **(F7) composition**: `φ τ B = spiderTagDown k τ B` (the `Option`-unwrapped form: `B ∖ {q}` when `chainDownVertex = some q`,
  `B` otherwise — the latter never occurs on active sources, by (F5)). By cases on the leaf class of `τ` (`1`, `3`, `c_j`; other
  vertices are not leaves, and `hF : F ⊆ leafSet` with (F0) excludes them): `φ` is a single deletion of `q ∈ B`, keeps `τ`,
  keeps `τ` active (`spiderTagDown_erase_keeps_tag_active`), lands in `I_p` (entry 74, inside entry 75), and is injective on
  the `τ`-active sources (`spiderTagDown_injOn`, entry 68 with `ChainValid` on both sources). Entry 75
  (`saturatingFlow_of_perTag_deletionInjections`) then gives a deletion-supported saturating flow
  (`spiderOneTwoThrees_exists_deletionSupported_saturatingFlow`, companion) and hence the saturating flow of FLOW.

## 6. Assembly (terminal `spiderOneTwoThrees_treeWeightedHall_kPlus3`)

`⟨N1, N3a ⇒ crossingIndex + 2 ≤ k+3 (omega, using 1 ≤ k from hk), low window (hk), FLOW at p = k+3 (k+2 ≤ k+3) with
F = favorableLeaves G (k+3) ⊆ leafSet (Finset.filter_subset)⟩`. This is the compiled composition pattern
`spider_kPlus3_terminal_of_nodes` of critic `C-U1-F` with FLOW and N3a discharged as lemmas. The terminal is not proved by
calling an identically stated lemma; FLOW is invoked at a derived selector `F = favorableLeaves … (k+3)`, never hard-coded.

## 7. Carry table by origin award

| Origin | Entries | Role |
|---|---|---|
| r30 C4-LA1 (`Main.lean` `66db6c73…`, receipt `dd9c21f7…`), `Snippets/` byte-identical | 1–21 | definition layer (`C4LA1.*`, `C5LA1.support/leafSet/H/R/indepSetsAvoiding/indepSetCount/forwardDifferenceDel/aggregate`, `E993Interior.taggedFamily`, `E993Transport.indepFamily/tagWitnesses/activeWeight/layerWeight/favorableLeaves/transportRel/IsSaturatingFlow/WeightedHall`); 1–13 originate in the first-interior layer and r30 C1-LA1 entries 1–13, 14–21 in C1-LA1 (cross-checked by digest) |
| r30 C4-LA1 | 25–37 | `ChainFactor` and the chain definitions |
| first-interior `c2-primary-v2` (`Main.lean` `8d864da2…`) | 14 | `C5LA1.crossingIndex` (`378868ab…`) |
| r30 C4-LA1 | 45–54 | r29 shadow lemma (45), the C1-LA1 WID cone incl. 46 `indepFamily_eq_indepSetsAvoiding` and 47–52, the C1-LA2 lemmas 53–54 (companions, carried so `weightedHall_of_saturatingFlow` is available) |
| r30 C4-LA1 | 55–75 | chain lemmas (63, 64, 65, 67, 68, 70, 71 used) and the per-tag composition (75) |

Not carried: C4-LA1 22–24, 38–44, 76–113 (gk-specific or its terminal); C5-LA1 113–183 (C5-LA1's text is a pattern source
only); `HookChain.lean`, `SpiderDraft.lean`, the seats' `Carried.lean` / `CarriedC4LA1*.lean`.

## 8. Attribution

Mechanism, active-tag weight, relation, the (HALL) key and the lower-region run: Codex GPT-6 (Astra/Sol/Luna). The sharp boundary
`3p < 2α+1` and the high-tail certificates: r29 (Claude, Fable-controlled). Definition entries 1–18 incl. `C5LA1.crossingIndex`
(entry 14): the first-interior run (Codex) and the r26/r24/r25 layers. The network definitions: C1-LA1 (r30 Cycle 1). The
graph-generic chain machinery and the per-tag composition (entry 75): C4-LA1 (r30 Cycle 4). The spider family theorem: r30
Cycle 5 (critic `C-F2-U`, Claude Opus 5.5; E-2 per-tag sufficiency: F2, Claude Sonnet 5; hook discharge: the Cycle 5 F
adjudicator; the SR-C5-2 reader). r30 Cycle 6: U1 (Claude Sonnet 5) the spider definition and tree layer; `C-U1-F` (Claude
Opus 5.5) the `α` equality, the low window, the composition face, the root split; `C-U1-T` (Claude Opus 5.5) the chain carry,
the block assignment, the root split, the `α` lower bound; the U adjudicator (Claude Opus 5.5) node (F0) and the carry
verification. The tree-layer pattern: C5-LA1 (r30 Cycle 5 formalizer). Lean text of this award: the C6-LA2 formalizer
(Claude Opus 5.5).

## 9. Fences and excluded conclusions

`S(1,2,3^k)` only; rank `k+3` only; `k ≥ 5` only; deletion-supported flows. NOT (HALL) at full scope; NOT "every eligible
rank" of the spider (that needs a lower bound `x ≥ k+1`, N3b, whose Newton dependency is undischarged; the registered
`proved_informal` spider key keeps that scope and is NOT superseded at other ranks); NOT "every tree". Mechanism ≠ aggregate:
nothing on the primary aggregate. Not an RTree statement; no statement about switch arcs (the flow uses deletion arcs only).
No status change of (HALL), the primary aggregate, `E993-R23-…`, BETA-AGG, TREE, FOREST, TRANSFER, any refuted key or #993.
The per-tag deletion on this ONE family is family-scoped and revives nothing (the universal per-leaf key is REFUTED).
