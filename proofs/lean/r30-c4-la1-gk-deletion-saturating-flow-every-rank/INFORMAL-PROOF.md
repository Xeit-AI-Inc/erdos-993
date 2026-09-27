# Informal proof — C4-LA1 (`G_k` deletion-arc saturating flow at every rank `p ≥ k + 3`)

Canonical run id: `erdos-993-math-dre-20260926-r30-weighted-transport`. Award group `C4-LA1` (Cycle 4 Stage 7, bounded
attempt). Lean run: `runs/lean-2026-09-27-c4-la1-gk-deletion-saturating-flow-every-rank/`. Producer:
`c4-la1-formalizer-opus-20260927` (chartered Claude Opus 5.5, effort high). This file is the statement-level proof that the
Lean text follows; it is not a certificate. The governing text is the admitted Cycle 4 synthesis, `## Lean awards`, "C4-LA1".

## Statement

`G_k` is the graph `gkGraph k` on `Fin (3k+5)`: root `0`; leaf `1` on `0`; support `2` on `0` with leaves `3`, `4`; and for
`i < k` the arm `0 – a_i – b_i – c_i` with labels `a_i = 5+3i`, `b_i = 6+3i`, `c_i = 7+3i`.

**Terminal theorem** (`E993Transport.gk_deletionSaturatingFlow_of_rank_ge`). For natural `k`, `p` with `k + 3 ≤ p` and every
`F ⊆ C5LA1.leafSet (gkGraph k)`, there is `f : Finset → Finset → ℕ` with `IsSaturatingFlow (gkGraph k) F p f` and
`f B A > 0 → ∃ q ∈ B, A = B.erase q`.

Companions (lemmas; `proved_informal` scope notes per R29-N-12, no certificate of their own; no grade is asserted here):
`gk_weightedHall_of_rank_ge` (the same hypotheses give `WeightedHall (gkGraph k) F p`) and `gk_aggregate_nonpos_of_rank_ge`
(`C5LA1.aggregate (gkGraph k) p ≤ 0` for every `p ≥ k + 3`).

Hypotheses consumed: `k + 3 ≤ p`, `F ⊆ leafSet`, the explicit adjacency of `G_k`, finiteness. Not consumed: `IsTree`,
eligibility, `crossingIndex`, `indepNum`, any quotient, any census value.

## Where finiteness, decidability and classical logic enter

- **Finiteness.** The vertex type is `Fin (3k+5)` (`Fintype`, `DecidableEq`). Layers `indepFamily G j` are filtered
  `powersetCard` finsets; every sum is a finite `Finset.sum`.
- **Decidability of the graph.** `gkGraph_decAdj` is a genuine decidable instance: `(gkGraph k).Adj u v` is, by
  `SimpleGraph.fromRel_adj`, `u ≠ v ∧ (gkEdge k u v ∨ gkEdge k v u)`, and `gkEdge` is a finite disjunction of equalities of
  natural numbers and one bounded quantifier `∃ i < k`, each decidable by core instances (`Nat.decEq`, the bounded-`∃`
  instance). No classical choice is needed, and none is used: `#print axioms E993Transport.gkGraph_decAdj` reports
  `[propext, Quot.sound]` (EVIDENCE/axioms-all-declarations.txt). It is registered as `@[reducible, instance] def` (what
  `instance` elaborates to) because the registrar admits definition entries by `def`; this is instance plumbing only.
- **Classical logic** enters only through the carried definitions of record (`C5LA1.support` is a `Classical.choose`;
  `leafSet`, `favorableLeaves`, `WeightedHall`, `aggregate` filter under `open Classical in`) and through Mathlib lemmas
  (`Classical.choice` is among the three permitted axioms). The one in-run `classical` (in `gk_aggregate_nonpos_of_rank_ge`)
  only names the same classical decidability instance that `favorableLeaves` already uses in its filter, so that
  `Finset.filter_subset` applies; it changes no set denoted. There is no `open scoped Classical` in any new fragment.

## Proof

Write `W_τ = tagWitnesses G τ = N(s_τ) ∖ {τ}` and call `τ ∈ F ∩ B` *active in `B`* when `(B ∖ {τ}) ∩ W_τ ≠ ∅`; the active-tag
weight `w_F(B)` counts the active tags (`activeWeight`).

### (0) Root exclusion (node N3, `gk_root_notMem`)

If `B` is independent and `0 ∈ B` then `1, 2, a_j ∉ B`, the cherry block contributes at most `{3, 4}`, and each arm
contributes at most one of `b_j, c_j`, so `|B| ≤ 1 + 2 + k = k + 3`. Every source has `|B| = p + 1 ≥ k + 4` (R2′), so `0 ∉ B`.
In Lean the count is `chainSize` over the blocks of `G_k − 0` (which cover exactly the non-root vertices,
`mem_chainVerts_gkTagFactors_iff`, and are pairwise disjoint, `chainDisjoint_gkTagFactors`), with `chainSize = |B ∖ {0}|`
(`chainSize_gkTagFactors`).

### (1) Per-tag injections give the flow (node N1, `saturatingFlow_of_perTag_deletionInjections`; any graph, any `F`)

Suppose for each `τ ∈ F` a map `φ_τ` on the τ-active `(p+1)`-sources satisfies `φ_τ(B) = B ∖ {q}` for some `q ∈ B`, keeps
`τ ∈ φ_τ(B)` active, and is injective. Put `f(B, A) = #{τ ∈ F ∩ B : τ active in B, φ_τ(B) = A}` for `B ∈ I_{p+1}` and `0`
otherwise. Then:
- `f > 0` only on `B ∈ I_{p+1}`, `A = B ∖ {q} ∈ I_p` (a subset of an independent set, of size `p`), i.e. on a (D) arc, so
  `transportRel` holds by its first disjunct and the support conjunct `∃ q ∈ B, A = B.erase q` holds;
- the row sum at `B` is `|{active tags of B}| = w_F(B)` exactly (fibres of `τ ↦ φ_τ(B)`, `Finset.card_eq_sum_card_fiberwise`);
- the column sum at `A` is `Σ_{τ ∈ F} #{B : τ active in B, φ_τ(B) = A}`; each inner count is `≤ 1` by injectivity and is `0`
  unless `τ` is active in `A` (because `φ_τ(B) = A` keeps `τ` active), so the column sum is `≤ w_F(A)`.

### (2) The tag slices (node N2 facts and node N4, `chainValid_gkTagFactors`)

`leafSet(G_k) ⊆ {1, 3, 4, c_i}` (`gk_leaf_cases`: `0, 2, a_j, b_j` each have two distinct neighbours). Supports and activity,
with `0 ∉ B` (`gk_active_*_iff`, via `not_disjoint_erase_tagWitnesses_iff`, the support being the unique neighbour):
`c_i` is active iff `a_i ∈ B`; `3` iff `4 ∈ B`; `4` iff `3 ∈ B`; `1` iff `B` meets `W_1 = {2, a_0, …, a_{k−1}}`.
So a τ-active source is `{a_i, c_i} ⊔ S` (tag `c_i`), `{3, 4} ⊔ S` (tags `3`, `4`) with `S` independent in `K_1 ⊔ kP_3`, or
`{1} ⊔ S` (tag `1`) with `S` independent in `(k+1)P_3`. In Lean the slice is realised without a type equivalence: the list
`gkTagFactors k τ` lists all blocks of `G_k − 0` (`{1}`, cherry `3–2–4`, arms `a_j–b_j–c_j`) with the tag's own block
*frozen* at its fixed value (`ChainFactor.frozen`, a one-point chain), and `ChainValid` records that every free block
restriction is an independent set of the block and the frozen block equals its fixed value. This is the recorded
alternative permitted by the synthesis for N4 (same statement; a constant rank offset replaces the equivalence).

### (3) Symmetric chains (node N5 core, `ChainFactor`, `chainDownUp`, `chainDownVertex`)

Chains per block: `K_1 = {v}`: `∅ < {v}`; path `x–y–z`: `∅ < {x} < {x, z}`, `{y}`, `{z}` (cherry `(x, y, z) = (3, 2, 4)`, arm
`(a_j, b_j, c_j)` — exactly `C-F2-T`'s choices); frozen block: one point. A block reports `(position t, chain length m)`
(`ChainFactor.code`) and the vertex whose deletion steps down (`ChainFactor.drop`: `z` from `{x, z}`, `x` from `{x}`, `v` from
`{v}`). The product of the blocks is decomposed by iterating the two-chain split: if the tail product puts `B` in a chain
of length `ℓ` at position `S` (`d' = S` steps down, `u' = ℓ − S` steps up) and the head block puts `B` at position `t` of a
chain `[0..m]`, the split `L_i = {(s, i) : s ≤ ℓ − i} ∪ {(ℓ − i, t') : i < t' ≤ m}` puts `(S, t)` in `L_t` when `t ≤ u'`
(predecessor moves in the tail; new `(d, u) = (d', u' − t + (m − t))`) and in `L_{ℓ−S}` otherwise (predecessor moves in the
head; `(d, u) = (d' + t − u', m − t)`). Proved invariants (all by induction on the block list):
- symmetry: `2·|B ∩ blocks| + u = R + d` with `R = Σ rk` (`two_mul_chainSize_add_up_eq`; per block
  `2·|B ∩ block| + m = rk + 2t`, `two_mul_card_add_len_eq`), i.e. every chain runs from rank `r` to rank `R − r`;
- `d > 0` gives a predecessor (`exists_chainDownVertex_of_down_pos`); the predecessor is `B ∖ {q}` with `q ∈ B` in a block of
  positive position (`mem_and_exists_drop_of_chainDownVertex`), stays valid and has `(d − 1, u + 1)`
  (`chainDownUp_erase_chainDownVertex`);
- a step never touches a frozen block (`notMem_verts_of_chainDownVertex`);
- the predecessor map is injective (`eq_of_chainDownVertex_erase_eq`: both steps in the tail — induction; both in the head —
  the two drop vertices coincide; mixed — impossible, since the head position differs by one and the tail's `u` by one);
- all blocks at the top of their chains give `u = 0` (`chainDownUp_snd_eq_zero_of_top`).
The pinned Mathlib has no symmetric chain decomposition (the synthesis records its LYM is Boolean only); all of this is
authored in-run. No `decide` over an enumeration is used anywhere; `k` and `p` are variables throughout.

### (4) Down-maps, level condition and the box-top property (nodes N5/N6)

`φ_τ = gkTagDown k τ` deletes `chainDownVertex (gkTagFactors k τ) B`.
- *Level condition* (`exists_chainDownVertex_gkTagFactors`): `R ≤ 2k + 5` (`chainRank_gkTagFactors_le`; the exact values are
  `2k+5` for `c_i`, `3`, `4` and `2k+4` for `1`) and `|B| = p + 1 ≥ k + 4`, so `d = 2(p+1) + u − R ≥ 3 > 0`: every τ-active source lies strictly above
  its slice's centre (`k + ½` for the free part `K_1 ⊔ kP_3`, `k + 1` for `(k+1)P_3`, as in CT-1) at every `p ≥ k + 3` (R2′).
- *τ stays active* (`gkTagDown_erase_keeps_tag_active`): for `c_i`, `3`, `4` the tag and its witness lie in the frozen block,
  which the step never touches. For `1` (`gk_one_active_after_down`, `gk_one_blocks_top_of_avoid`): if the image `B'` (size
  `p`) avoided `W_1`, then `|B'| ≤ 1 + 2 + k`, forcing `p = k + 3` and equality in every block: cherry `{3, 4}` and each arm
  `{b_j}` or `{c_j}` — every block at its chain top, so `u(B') = 0`; but a predecessor has `u(B') = u(B) + 1 ≥ 1`. (For
  `p ≥ k + 4` the size bound alone already excludes avoidance; the Lean proof handles both at once.)
- *Injectivity* (`gkTagDown_injOn`) from the predecessor injectivity.
- *Assembly* (`gk_exists_deletionSupported_saturatingFlow`, node N6): N1 with `φ = gkTagDown k`, each `τ ∈ F` a leaf by `hF`.
  The terminal theorem restates this lemma verbatim: the registrar admits no entry after the terminal theorem, and both
  companions consume the flow.
- *Companions.* `gk_weightedHall_of_rank_ge` is the carried C1-LA2 lemma `weightedHall_of_saturatingFlow` applied to that flow.
  `gk_aggregate_nonpos_of_rank_ge` takes `F = favorableLeaves (gkGraph k) p ⊆ leafSet` (`Finset.filter_subset`) and the
  carried C1-LA2 lemma `aggregate_nonpos_of_saturatingFlow` (FLOW⇒SIGN, which uses (WID) = the carried C1-LA1 identity), with
  `1 ≤ p` from `hp`.

## ℕ audit

All weights and flow values are natural numbers: `activeWeight` is a `Finset.card`, `f B A` is a `Finset.card` (or `0`).
`IsSaturatingFlow` is used exactly as carried: support on `indepFamily (p+1) × indepFamily p × transportRel`; equality
`Σ_A f B A = activeWeight G F B` on every source; `≤ activeWeight G F A` on every target. Natural subtraction occurs only in
the chain bookkeeping (`chainDownUp`), each guarded: in the tail branch `t ≤ u'` and `t ≤ m` (`code_fst_le_snd`); in the head
branch `t > u'`. The companion's `p − 1` (inside the carried aggregate) is guarded by `1 ≤ p` from `k + 3 ≤ p`. The only
integer quantity is the carried aggregate `S(G_k, p)`.

## Excluded conclusions (fences)

One explicit tree family. Not (HALL) at any other scope; the (HALL) scope clause EST-3 stays an informal composition with the
registered eligibility key at `proved_informal`. No `IsTree`, eligibility, `crossingIndex` or `indepNum` is asserted. "Every
eligible rank of `G_k`" is not claimed (it needs `x(G_k) ≥ k + 1`, open). Nothing on the primary aggregate beyond `G_k`; no
RTree statement; nothing about switch arcs elsewhere. Not `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (a matching is not
linear injectivity), not `E993-R23-LITERAL-DELETE-ONLY-HALL`, not C6-F4, not R19. GK-SIGN is not formally verified by this award
(`S ≤ 0` is weaker than GK-SIGN's strict bound at `p = k + 3`). Repairs on the face: `C-F2-T`'s `x = k + 1` (valid for `k ≥ 2`
only) is not used; the F draft's instance comment is an authored instance.

## Attribution

The network, the active-tag weight and (HALL): Codex GPT-6 (the lower-region run and its corrections). The definition entries
1–13: the first-interior run (Codex) with the r26/r24/r25 definition layers. The transport definitions and (WID): r30 C1-LA1.
FLOW⇒SIGN: r30 C1-LA2. The `G_k` family and its eligibility key: r30 Cycles 2–3. CT-1: critic `C-F2-T` (r30 Cycle 4; Claude
Opus 5.5). R2′: the r30 Cycle 4 F adjudicator (Claude Opus 5.5). The bounded `G_k` Hall record: F2 (Claude Sonnet 5), `C-F2-U`,
the controller replay CF6-1, and the synthesis instrument. r29's high-tail certificates are not used. Lean text of every new
declaration: the C4-LA1 formalizer (Claude Opus 5.5).

## Carry table (by origin award; byte-identical unless noted; digests in CAPSULE-VERIFICATION.json)

| Origin | Entries | Role here | Note |
|---|---|---|---|
| C1-LA1 (`86b59c6c…`, receipt `9e733491…`) | 1–21 (definitions) | definitions of record | byte-identical |
| C1-LA1 | 22 `E993Interior.highTailAggregateFromShadow` | its private helpers (`support_unique`, `support_adj`, `leaf_insert_indep`, `H_subset_R`, `tagged_count_split`) | NOT in the brief's list; build-required by 26 and 28 (and used by the new `not_disjoint_erase_tagWitnesses_iff`); first-interior provenance, not an r29 certificate; byte-identical |
| C1-LA1 | 23–28 (WID cone lemmas) | (WID) for FLOW⇒SIGN | byte-identical |
| C1-LA1 | 36 `activeWeightAggregateIdentity` | (WID) at `F_p` | keyword `theorem` → `lemma` only (freeze repair of the brief); origin digest `939231f2…` |
| C1-LA2 (`7c279f4b…`, receipt `dc1371a0…`) | 29 `aggregate_nonpos_of_saturatingFlow` | FLOW⇒SIGN companion | byte-identical (`ce01183c…`) |
| C1-LA2 | 33 `weightedHall_of_saturatingFlow` | FLOW⇒HALL companion | byte-identical (`89a7ffb8…`) |

C1-LA2's helper lemmas 30–32 were not needed. No cross-award `import`; no definition of record is re-typed.
