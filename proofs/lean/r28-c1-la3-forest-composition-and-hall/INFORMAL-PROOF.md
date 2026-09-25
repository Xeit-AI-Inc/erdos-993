# Informal Proof — C1-LA3 (r28 Cycle 1 Stage 7): (FC) corrected and the SDR/threshold equivalence

Run `lean-2026-09-25-c1-la3-forest-composition-and-hall` (experiment run id of record
`erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`). Producer: governed formalizer seat
`c1-la3-formalizer-opus-20260925` (Claude Opus 5 per the dispatch record; the seat cannot inspect its own
runtime model or effort). Governing text: `cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards`, "C1-LA3".
Source of the formal text: `LeanProject/LeanProof/Main.lean` of this run.

This document states, at statement-level granularity, what each registered declaration says, where each
hypothesis enters, and where every declaration comes from. It proves nothing beyond the exact Lean
statements. Grades used are `SOLUTION-CONTRACT.md` §4's only; nothing here is `formally_verified` until
the informal audit, the kernel receipt and the fidelity review all pass.

## 1. The two keys and their faces

**Key `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES` (FC) — terminal `theorem`
`Erdos993G1.forest_degree_lemma_of_tree_degree_lemma`.**

```lean
theorem forest_degree_lemma_of_tree_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ)
    (htree : ∀ {Y : Type u} [Fintype Y] [DecidableEq Y] (T : SimpleGraph Y) [DecidableRel T.Adj], T.IsTree →
      ∀ a ≤ k, (Erdos993G1.indepDegreeSum T a : ℤ) ≤ 2 * a * Erdos993G1.indepCount T a) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

In words: if the degree lemma `D_a(T) ≤ 2a·i_a(T)` holds for every finite tree `T` on any carrier in the
universe `u` at every size `a ≤ k`, then `D_k(G) ≤ 2k·i_k(G)` for every finite forest `G`. Here
`i_a = Erdos993G1.indepCount` (r25 entry 1) and `D_a = Erdos993G1.indepDegreeSum` (r27 entry 7). This is the
corrected hypothesis of erratum R28-E-c: the SOLUTION-CONTRACT §2 single-`k` component hypothesis is not
used, because it does not compose (witness `K_4 ⊔ K_4`, `k = 2`: each `K_4` has `i_2 = 0` and `D_2 = 0`, so the
single-`k` bound holds on both components, while the union has `i_2 = 16`, `D_2 = 16·6 = 96 > 64 = 2·2·16`;
the every-`a` hypothesis fails there already at `a = 1`, `D_1(K_4) = 12 > 8`).

**Key `E993-R28-SDR-THRESHOLD-EQUIVALENCE` — `lemma` `Erdos993G1.sdr_iff_threshold_pos_of_tree`.**

```lean
lemma sdr_iff_threshold_pos_of_tree {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ) :
    (∃ f : R28U2.Slot G → X, Function.Injective f ∧
        ∀ s, G.degree (f s) = 1 ∧ R28U2.occ G s.1.1 k ≤ R28U2.occ G (f s) k) ↔
      (∀ t, 1 ≤ t → R28U2.slotsAtLeast G k t ≤ R28U2.leavesAtLeast G k t)
```

with `R28U2.Slot G := Σ v : R28U2.Branch G, Fin (G.degree v.1 - 2)` and
`R28U2.Branch G := {v : X // 3 ≤ G.degree v}` (U2's type; it unfolds to the synthesis's
`Σ v : {v // 3 ≤ G.degree v}, Fin (G.degree v − 2)`). In words: on a finite tree, for each `k`, an injective
assignment of the `deg v − 2` slots of every branch vertex `v` to leaves `ℓ` with `c_v(k) ≤ c_ℓ(k)` exists
iff `slots_{≥t}(k) ≤ leaves_{≥t}(k)` for every `t ≥ 1`. It is an equivalence per `(G, k)` and is never
evidence for either side.

The two keys register independently: the SDR face does not depend on any (FC) declaration and the (FC)
face does not depend on any SDR declaration (the dependency lists in §3 and §4 are disjoint apart from the
G1 entries).

## 2. Definitions (run-local layer, one namespace `R28U2`; U2's text of the SOLUTION-CONTRACT §2 definitions)

- `occ G v k := ((G.indepSetFinset k).filter (fun J => v ∈ J)).card` — `c_v(k)`, the number of independent
  `k`-sets containing `v`.
- `slotsAtLeast G k t := ∑ v ∈ (Finset.univ : Finset X).filter (fun v => 3 ≤ G.degree v ∧ t ≤ occ G v k), (G.degree v - 2)`.
- `leavesAtLeast G k t := ((Finset.univ : Finset X).filter (fun ℓ => G.degree ℓ = 1 ∧ t ≤ occ G ℓ k)).card`.
- `indepFinsetOn G S k := (G.indepSetFinset k).filter (fun J => J ⊆ S)`; `indepCountOn G S k` its card;
  `indepDegreeSumOn G S k := ∑ J ∈ indepFinsetOn G S k, ∑ v ∈ J, G.degree v` — Finset-relative counts with
  the AMBIENT degree `G.degree`.
- `Branch G`, `LeafT G := {ℓ : X // G.degree ℓ = 1}`, `Slot G` as above; private `splitPair`, `joinPair`
  (the maps `J ↦ (J ∩ S, J ∩ T)` and `(J₁, J₂) ↦ J₁ ∪ J₂`).

G1 entries of record: `Erdos993G1.indepCount` (r25 entry 1, ℤ-valued `Nat.card` of `IsNIndepSet k`
finsets), `Erdos993G1.indepCount_eq_card_indepSetFinset` (r25 entry 4), `Erdos993G1.indepDegreeSum` (r27
entry 7, ℕ-valued). U2's own re-typed copies of these three are NOT transported; the registrar entries,
byte-identical to the award entries (digests in §7), are the copies of record.

## 3. Proof of (FC), statement level

Hypotheses in scope: `X` finite with decidable equality, `G.Adj` decidable. Any finite graph unless stated.

**(FC-1) Two-piece convolution — `R28U2.indepCountOn_union`, `R28U2.indepDegreeSumOn_union` (U2).** For
finsets `S`, `T` of one ambient graph with `hsep : ∀ x ∈ S, ∀ y ∈ T, ¬ G.Adj x y` and `hdisj : Disjoint S T`,
and every `k`:
`i_k(S ∪ T) = Σ_{a=0}^{k} i_a(S)·i_{k−a}(T)` and
`D_k(S ∪ T) = Σ_{a=0}^{k} [D_a(S)·i_{k−a}(T) + i_a(S)·D_{k−a}(T)]` (Finset-relative, ambient degree).
Proof: fibre the `k`-independent subsets `J ⊆ S ∪ T` by `a = |J ∩ S|` (`interS_card_mem_range`: `a ≤ k`);
on each fibre `J ↦ (J ∩ S, J ∩ T)` is a bijection onto `indepFinsetOn S a × indepFinsetOn T (k − a)` with
inverse `(J₁, J₂) ↦ J₁ ∪ J₂` (`splitPair_mem`, `joinPair_mem`, `join_splitPair`, `splitPair_joinPair`);
`isIndepSet_union_iff` is where `hsep` enters (a union of independent sets on separated pieces is
independent), and `hdisj` enters in `splitPair_joinPair` / `joinPair_mem` (the pieces' cardinalities add, and
the split of a join returns the pair). BOTH are necessary: without `hsep` a cross edge makes `J₁ ∪ J₂`
dependent (`K_2` split into its two vertices: `i_2(S ∪ T) = 0 ≠ 1 = i_1(S)·i_1(T)`); without `hdisj`,
overlapping pieces are double counted (`S = T = {v}` in `K_1`: `i_1(S ∪ T) = 1 ≠ 2 = i_1(S)i_0(T) + i_0(S)i_1(T)`;
`hsep` holds there vacuously because `K_1` has no edges). The degree sum splits because
`Σ_{v∈J} deg v = Σ_{v∈J∩S} deg v + Σ_{v∈J∩T} deg v` (`indepDegreeSumOn_union_filter_sum`). No acyclicity, no
connectivity.

**(FC-2) Two-piece inequality — `R28CritU2T.degree_lemma_on_union` (C-U2-T); independently
`R28CritU2F.dl_union` (C-U2-F).** With `hsep`, `hdisj`, and the bound `D_a ≤ 2a·i_a` on `S` and on `T` at
EVERY `a ≤ k`: `D_k(S ∪ T) ≤ 2k·i_k(S ∪ T)`. Proof: termwise on the convolution,
`D_a(S) i_{k−a}(T) + i_a(S) D_{k−a}(T) ≤ 2a·i_a(S) i_{k−a}(T) + i_a(S)·2(k−a)·i_{k−a}(T) = 2k·i_a(S) i_{k−a}(T)`.
The hypothesis at every `a ≤ k` (not only at `k`) is what the termwise step consumes.

**(FC-3) Bridge — `R28CritU2T.bridge` (C-U2-T).** For `s : Set X` closed under adjacency
(`∀ v ∈ s, ∀ w, G.Adj v w → w ∈ s`) and every `k`: `D_k(G.induce s) = indepDegreeSumOn G (univ.filter (· ∈ s)) k`
and `|I_k(G.induce s)| = indepCountOn G (univ.filter (· ∈ s)) k`. Proof: `J ↦ J.map (subtype)` is a bijection
of independent `k`-sets; the degrees agree because a closed set contains every neighbour
(`SimpleGraph.degree_induce_of_neighborSet_subset`). Closure is where the ambient degree is justified.

**(FC-4) Components are closed — `R28CritU2T.supp_closed` (C-U2-T).** `C.supp` is adjacency-closed for any
graph (`SimpleGraph.ConnectedComponent.mem_supp_congr_adj`).

**(FC-5) Peel over components — `R28CritU2T.degree_lemma_of_components` (C-U2-T), scope declaration.** For
ANY finite simple graph `G` and `k`, if for every connected component `C` and every `a ≤ k`,
`(D_a(G.induce C.supp) : ℤ) ≤ 2a·i_a(G.induce C.supp)`, then `(D_k(G) : ℤ) ≤ 2k·i_k(G)`. Proof: bridge each
component to Finset-relative counts; induct on finsets of components (`Finset.induction_on`) applying (FC-2)
to one new component and the union of the previous ones (separated and disjoint because distinct
components' supports are disjoint and closed); the union of all supports is `univ`
(`indepDegreeSumOn_univ`, `indepCountOn_univ`); the final cast uses `indepCount_eq_card_indepSetFinset`.
No acyclicity. Independent Finset-level core: `R28CritU2F.dl_closed_of_components` (strong induction on
adjacency-closed finsets, peeling the component of a chosen vertex; `mem_of_reachable_of_closed`) and
`R28CritU2F.degree_lemma_of_component_supports` (C-U2-F).

**(FC-6) Contract-shaped face — `R28CritU2T.forest_degree_lemma_of_components_allk` (C-U2-T), scope
declaration.** The same with `_hG : G.IsAcyclic` on the face; `hG` is unused.

**(FC-7) Components of a forest are trees — `R28CritU2T.induce_supp_isTree` (C-U2-T).** For
`hG : G.IsAcyclic` and a component `C`, `(G.induce C.supp).IsTree`: connected by
`ConnectedComponent.maximal_connected_induce_supp`, acyclic by `IsAcyclic.induce`. **This is the only place
acyclicity is consumed.**

**(FC-8) Terminal — `Erdos993G1.forest_degree_lemma_of_tree_degree_lemma` (in-run wrapper).** Apply (FC-5)
with the component hypothesis `fun C a ha => htree (G.induce C.supp) (induce_supp_isTree G hG C) a ha`. The
carrier `↥C.supp` lives in `Type u`, so `htree`'s universe-`u` quantification covers it. C-U2-T's
`R28CritU2T.forest_degree_lemma_of_tree_degree_lemma` (hypothesis at every `a : ℕ`, explicit `Y`) is the
compiled model and is carried as a scope declaration; the terminal face weakens its hypothesis to
`∀ a ≤ k` with an implicit `{Y}`, as the award statement specifies.

Hypothesis ledger (FC): `IsTree` enters only through `htree`'s antecedent; `IsAcyclic` only in (FC-7); no
`n ≥ 2`, no `k ≥ 1` (at `k = 0` both sides are `0`), no connectivity of `G`.

## 4. Proof of the SDR equivalence, statement level

**(S-1) Nested Hall reduction — `R28U2.nested_hall_iff_threshold` (U2).** For finite types `α`, `β` and
`f : α → ℕ`, `g : β → ℕ`: Hall's condition for the relation `f a ≤ g b` over ALL `A : Finset α` is equivalent
to the threshold family `∀ t, #{a | t ≤ f a} ≤ #{b | t ≤ g b}`. (⇒) take `A = {a | t ≤ f a}`; its
neighbourhood lies in `{b | t ≤ g b}`. (⇐) for nonempty `A` pick `a₀ ∈ A` minimising `f`; the
neighbourhood of `A` is exactly `{b | f a₀ ≤ g b}` (nestedness) and `A ⊆ {a | f a₀ ≤ f a}`; apply the
threshold at `t = f a₀`. Graph-free.

**(S-2) Abstract SDR — `R28U2.sdr_iff_threshold_abstract` (U2).** (S-1) composed with Mathlib's Hall theorem
`Fintype.all_card_le_filter_rel_iff_exists_injective` (`Mathlib/Combinatorics/Hall/Basic.lean:196`, itself
built on `Finset.all_card_le_biUnion_card_iff_existsInjective'`): an injection `h : α → β` with
`f a ≤ g (h a)` exists iff the threshold family holds.

**(S-3) Graph-general SDR — `R28U2.sdr_iff_threshold` (U2), scope declaration.** For ANY finite simple
graph and every `k`: `(∃ f : Slot G → LeafT G, Injective f ∧ ∀ s, occ G s.1.1 k ≤ occ G (f s).1 k) ↔
∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t`. Proof: (S-2) with `f := occ ∘ slot vertex`,
`g := occ ∘ leaf`; the counting bridges `card_filter_slot_eq` (slots with occupancy `≥ t` number
`slotsAtLeast`: a `Finset.sigma` over branch vertices, each contributing `Fin (deg v − 2)`, summed via
`sum_filter_subtype_eq`, which uses `Fintype.sum_equiv` — `to_additive` of `Fintype.prod_equiv`,
`Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:722`) and `card_filter_leaf_eq`. No tree hypothesis;
all `t : ℕ` including `t = 0`.

**(S-4) Tree `t = 0` row — `R28CritU2F.tree_slots_zero_le` (C-U2-F).** For `hT : G.IsTree` and every `k`:
`slotsAtLeast G k 0 ≤ leavesAtLeast G k 0`. Proof (in ℤ): per vertex,
`[deg ≥ 3](deg − 2) − [deg = 1] = (deg − 2) + 2·[deg = 0]` (case split; the ℕ subtraction `deg − 2` is cast
only under its guard `3 ≤ deg`); summing, `slots − leaves = Σ_v deg v − 2n + 2·#iso = 2|E| − 2n + 2·#iso
= 2·#iso − 2` by the handshake (`sum_degrees_eq_twice_card_edges`) and `|E| + 1 = n`
(`IsTree.card_edgeFinset`, acyclicity + connectivity); `#iso ≤ 1` (`R28CritU2F.card_isolated_le_one`,
connectivity). Hence `slots − leaves ≤ 0`. Covers `n = 1` (`#iso = 1`, both sides `0`) and `n ≥ 2`
(`#iso = 0`, leaves − slots = 2) with no `n ≥ 2` hypothesis; `k` plays no role at `t = 0`.

**(S-5) Tree form, LeafT codomain — `R28CritU2F.sdr_iff_threshold_pos_of_tree` (C-U2-F).** On a tree, (S-3)'s
`∀ t : ℕ` equals `∀ t ≥ 1` because the `t = 0` row is (S-4).

**(S-6) SDR face — `Erdos993G1.sdr_iff_threshold_pos_of_tree` (in-run).** The award statement's codomain
`X` with `G.degree (f s) = 1` is equivalent to the codomain `LeafT G` (`f ↦ fun s => ⟨f s, _⟩` and
`f ↦ Subtype.val ∘ f`; injectivity transfers through `Subtype.val` / `Subtype.ext`); then (S-5).

Hypothesis ledger (SDR): tree used only in (S-4), where both connectivity and acyclicity are consumed; the
graph-general face (S-3) is over all `t : ℕ`; the tree face is over `t ≥ 1`. `t ≥ 1` alone is insufficient
off trees: `K_4`, `k = 2` (four degree-3 vertices give four slots, no leaves; no independent 2-set so every
`occ = 0` and every `t ≥ 1` row reads `0 ≤ 0`, while `t = 0` reads `4 ≤ 0` and no injection into the empty
leaf set exists). No `k ≥ 1`, no `n ≥ 2`.

## 5. ℕ/ℤ cast audit

- `deg v − 2` (ℕ) occurs in `slotsAtLeast` and in `Slot`'s `Fin (G.degree v.1 − 2)`; in both it is guarded by
  `3 ≤ G.degree v` (the filter, resp. the `Branch` subtype), so truncation never occurs.
- `k − a` (ℕ) in the convolutions ranges over `a ∈ range (k + 1)`, i.e. `a ≤ k`; `degree_lemma_on_union`
  rewrites `k = a + c` before the arithmetic, `dl_union` uses `2k = 2a + 2(k − a)` justified by `omega` under
  `a ≤ k`.
- All Finset-relative inequalities are proved in ℕ; the passage to the ℤ face uses
  `Erdos993G1.indepCount_eq_card_indepSetFinset` and `exact_mod_cast`; `indepDegreeSum` is ℕ and cast.
- The slot count at `t = 0` is computed in ℤ (`tree_slots_zero_le`), and the result is cast back.
- `2 * a * Erdos993G1.indepCount T a` in `htree`: `a : ℕ` is cast to ℤ by elaboration (same shape as the
  conclusion).

## 6. Attribution, fences and excluded conclusions

- (FC): r27 `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION` (its r27 derivation; SR-JOIN JN-2); U2 (seat)
  for the convolution in Lean; C-U2-T (critic) for the two-piece inequality, `bridge`, the peel and the
  end-to-end composition; C-U2-F (critic) for the independent Finset-level core. The terminal wrapper and
  the SDR-face codomain change are in-run text of this seat.
- SDR: T2 (seat, Lemma SAP, informal); C-F1-T (rank lemma, informal); Hall (classical, via Mathlib); U2 (seat,
  graph-general Lean); C-U2-F (tree form and the `t = 0` lemma); SR-PP (PP-3).
- Common: the mechanism r27 critic `C-T2-U` (Finding 6, Steps A–D); the `2 ≤ n` correction the r27 T
  adjudicator; the reformulation's second read SR-JOIN (JN-3; JN-2 for the convolution); the degree lemma
  Fang–Lu–Nevo–Yao–Zheng 2026 §8 (formal (DL) of record: r27 C1-LA1); Hall's theorem classical via Mathlib.
- Fences: (FC) is NEVER composed with r27's `Erdos993G1.forest_degree_lemma` to present a "second proof" of
  (DL); r27's `forest_degree_lemma` is not carried into this project. (FC) is the formal consequence clause
  of the r27 convolution key, a scope note there (the §2 single-`k` defect recorded with witness
  `K_4 ⊔ K_4`, `k = 2`). The SDR equivalence is an equivalence per `(G, k)`, never evidence for either side;
  after the refutation of (HS) it says that `T22`'s threshold failure is exactly a matching failure. No status
  transfer (SOLUTION-CONTRACT §3.1).
- Excluded: U2's `R28U2.slot_leaf_sdr_exists` (a `sorry`ed FALSE statement) and
  `R28U2.tree_leaf_slot_dominance` (FALSE, `T22`; SR-HS-REF) are NOT transported and nothing here depends on
  them. The name `tree_leaf_slot_dominance` occurs once in `Main.lean`, inside the docstring of the carried
  C-U2-T declaration `R28CritU2T.forest_degree_lemma_of_tree_degree_lemma` (byte-identical carried prose);
  it is a comment, not a reference.
- Repairs of U2's certification literals (adjudicated): "all four" names three declarations;
  `Fintype.sum_equiv` is at `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:722` (as `to_additive` of
  `Fintype.prod_equiv`; confirmed at the pin by this seat); U2's "byte-identical" G1 copies hold at
  declaration level only (entry 1 `5484fc21…`, entry 4 `4463e7ee…`) — here the registrar entries are
  byte-identical as entries; SR-JOIN's figure for the convolution is 5,625 pairs, not 841; `compiled` is
  not a grade.

## 7. Carry table

Carry files verified against `sources/c1-stage7-sources/SOURCE-DIGESTS.json` before transport:
`U2-Main.lean` `5d71c16bfd340aad85de5291e537ee28c8e6d2e0ef60ffb98a8a611ff644c6cc` (24,884 B),
`C-U2-T-CritU2T.lean` `46be4587c0514b05a9fd9bf9b51ac0e7cf8046753b17960a12b57c32c805fa34` (10,299 B),
`C-U2-F-CritAdvance.lean` `824c760943f02e1e7d28af13bb3e62c34e1110dae4387c3276fb686f98e2660d` (9,008 B).
Award sources: r25 `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`, r27
`b49ea82a33edc55f8185379c3abd44e13a17914b7f8b9ab0bf5e2aaac5aafc5a`.

Transport rule (mechanical, `DRAFTS/transport.py`). Each declaration's text span (docstring, any
`omit … in` line, modifiers, statement and proof) is copied from the frozen file into its own fragment,
wrapped in the source's own namespace/`open`/`variable`/section context (wrappers are not bodies). Two
registrar-grammar normalizations were needed, and each is mechanically reversed by the script to reproduce
the original span byte-for-byte:
- **N1** the keyword `theorem` at the declaration head becomes `lemma` (the registrar admits exactly one
  `theorem`, the terminal; a `lemma` kind must match `^\s*lemma <name>`). Lean elaborates `lemma` as
  `theorem`; the declaration produced is the same.
- **N2** a modifier `private` or `@[simp]` that shared the keyword's line is followed by a line break
  instead of a space (the registrar's regex requires the keyword at line start). Whitespace only.
Declarations with no normalization are byte-identical at declaration level. C-U2-F's trailing
`#print axioms` commands (commands, not declarations) and the import lines are not transported.
Leaf-name collisions are resolved by namespace: `R28CritU2F.sdr_iff_threshold_pos_of_tree` (carried, LeafT
codomain) vs `Erdos993G1.sdr_iff_threshold_pos_of_tree` (in-run, `X` codomain);
`R28CritU2T.forest_degree_lemma_of_tree_degree_lemma` (carried model) vs
`Erdos993G1.forest_degree_lemma_of_tree_degree_lemma` (in-run terminal). The two-piece inequality exists in
two independent critic versions under different names (`R28CritU2T.degree_lemma_on_union`,
`R28CritU2F.dl_union`); both are carried, neither is a copy of the other.

| # | Declaration | Kind | Origin (file, lines) | Author | Transport | Original decl SHA-256 | Transported decl SHA-256 | Registered entry SHA-256 |
|---|---|---|---|---|---|---|---|---|
| 1 | `Erdos993G1.indepCount` | definition | r25 award source `736eb9df…`, entry 1 | G1 (r25 award) | byte-identical ENTRY (registrar) | — | — | `5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb` |
| 2 | `Erdos993G1.indepDegreeSum` | definition | r27 C1-LA1 award source `b49ea82a…`, entry 7 | r27 C1-LA1 award | byte-identical ENTRY (registrar) | — | — | `a1ed32eb12b137ac5915bf15255c1173593296f3eb22127e2dcf0fab2ea9f38e` |
| 3 | `R28U2.occ` | definition | `U2-Main.lean` 49–50 | U2 (seat) | byte-identical | `436fae4cef4b0534155780cf527dbc2919c4ab8cff896faf0569d6607e531f52` | `436fae4cef4b0534155780cf527dbc2919c4ab8cff896faf0569d6607e531f52` | `dd5dba734553ed76a9e3c6b41c0a19ef2a639d00a8adc540f184041b37206433` |
| 4 | `R28U2.slotsAtLeast` | definition | `U2-Main.lean` 52–55 | U2 (seat) | byte-identical | `9f0c7bf796e215571cae25e4ebdc3ca79e1816621d38bcb2edbccaf236ae4d8b` | `9f0c7bf796e215571cae25e4ebdc3ca79e1816621d38bcb2edbccaf236ae4d8b` | `ba7eee89b6e73147bea7c9f2825b14546b645581c6380eb5728e6f51134278f2` |
| 5 | `R28U2.leavesAtLeast` | definition | `U2-Main.lean` 57–59 | U2 (seat) | byte-identical | `d9681338ff1ecec5f09f5565d58a8f3d6677a5b4249c6caf40c5de58dd43da17` | `d9681338ff1ecec5f09f5565d58a8f3d6677a5b4249c6caf40c5de58dd43da17` | `cdcddd1d3d3e8af0f2964275effa07e2df7abd96823a32748decfe23cbd2db2f` |
| 6 | `R28U2.indepFinsetOn` | definition | `U2-Main.lean` 78–80 | U2 (seat) | byte-identical | `ea20c82d133be06e609b7ba55ec993856e39654bb38f35533d2e84b42eb0a482` | `ea20c82d133be06e609b7ba55ec993856e39654bb38f35533d2e84b42eb0a482` | `e61ddb08a2cbbee185938b4eedb720e3ea823c19f025303f4ddb1e569cb2098e` |
| 7 | `R28U2.indepCountOn` | definition | `U2-Main.lean` 82–83 | U2 (seat) | byte-identical | `07c759f77e6878197b7cb44d111e27054c06edc709c8412354dcc6dcd2bf216d` | `07c759f77e6878197b7cb44d111e27054c06edc709c8412354dcc6dcd2bf216d` | `58dae1b489315cb9dafe6339c6e344133ac7b3bd9ce6be527efe7707b6b7dfbd` |
| 8 | `R28U2.indepDegreeSumOn` | definition | `U2-Main.lean` 85–87 | U2 (seat) | byte-identical | `faa7d6b48f9fc1c4e6f102dc14e4cff026d8f48077c8debfeac82ccf31f9b1e1` | `faa7d6b48f9fc1c4e6f102dc14e4cff026d8f48077c8debfeac82ccf31f9b1e1` | `7bdd5644f3ddcd6441c514d2d8084b25c73753c3cf5c4575d6efc2d8837cd261` |
| 9 | `R28U2.splitPair` | definition | `U2-Main.lean` 121–122 | U2 (seat) | N2 (`private`) | `82df787625e824bf870de4a31db0157d867aab8c5a47b58b5ab50465b75e8c1e` | `1fb78f8d7e24855d872dc90c8549f3592561d79b5bf6a4d42996d3ee099d70fc` | `920149a54ace4724e0e40b32a6c48e5ff8522f7351720737d610e07de581ff25` |
| 10 | `R28U2.joinPair` | definition | `U2-Main.lean` 124–125 | U2 (seat) | N2 (`private`) | `845980628934fba4a859505d8cc71acc06d5cdda5db6e9cb9b2052b7314cc131` | `881525e2ce43e7aa4482d75d5d83354bbcff3e366a2562bffd163f0dee7c10ca` | `673d19ca34e7831a1d8a3f1d8ccf1528946d4606070cf5f64ebb248734e7c633` |
| 11 | `R28U2.Branch` | definition | `U2-Main.lean` 383–384 | U2 (seat) | byte-identical | `1cd8d4a09a6b5e66277838b66e00b9a3dd580a42941c8a1aeed67f60e0b11acf` | `1cd8d4a09a6b5e66277838b66e00b9a3dd580a42941c8a1aeed67f60e0b11acf` | `cf0e0e8502d90f7e563d17f42e856166a52b9c38ae3773d6b14f5df3384a8983` |
| 12 | `R28U2.LeafT` | definition | `U2-Main.lean` 386–387 | U2 (seat) | byte-identical | `6270ad3c0e7b386f5d34cacbafe1f74f362f4f8035598f5e0a45cf9dcb31b99e` | `6270ad3c0e7b386f5d34cacbafe1f74f362f4f8035598f5e0a45cf9dcb31b99e` | `c75cc80b344c11bc94aa5b892692f284b8018d28715ac4d3879dd1671f99d772` |
| 13 | `R28U2.Slot` | definition | `U2-Main.lean` 389–390 | U2 (seat) | byte-identical | `a91a9bd0a6918fcb2263d90e2f0b221992475fe452b03d1f6b0bf3c4e82d9b2c` | `a91a9bd0a6918fcb2263d90e2f0b221992475fe452b03d1f6b0bf3c4e82d9b2c` | `4717d4e89800de6de4c630b710430d65b999f44eb87edfcebc1c9d61c879b36d` |
| 14 | `Erdos993G1.indepCount_eq_card_indepSetFinset` | lemma | r25 award source `736eb9df…`, entry 4 | G1 (r25 award) | byte-identical ENTRY (registrar) | — | — | `4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac` |
| 15 | `R28U2.indepFinsetOn_univ` | lemma | `U2-Main.lean` 89–92 | U2 (seat) | N2 (`@[simp]`) | `c2575fdbe9432849c07c21d7d95cc6d000198c98c4abb67b5b5e7f39c8acaf2b` | `54a48ac4f0f498f9daf910bbcb043424bffe4ddecf49d124171a2d4cf623cd79` | `25fa6f7139682e93145d69ae00947519dc7e1b765cc42d1f60e38a7a49da9a9c` |
| 16 | `R28U2.indepCountOn_univ` | lemma | `U2-Main.lean` 94–96 | U2 (seat) | N2 (`@[simp]`) | `9cc935b0843c9ca9fcb8cd6dd098dc0321302a73ca8b486c390524040dc9538c` | `e8bb6cfc68b9aac0aa5ea1e786cca3ee4fd18dfb306d6536b92c8ab66e79dce1` | `92b26dcb667eb95ff5564afc490d58dde45d4528c97f7e604af28043d7a7b098` |
| 17 | `R28U2.indepDegreeSumOn_univ` | lemma | `U2-Main.lean` 98–100 | U2 (seat) | N2 (`@[simp]`) | `ca627b5f13d8053976bca36fae8fd325a48809007093052115bccc3a4c086e7f` | `5bc41df7c15bd64bc7477df91cd5d8591c2d8ee47fd97968fad332b34476c72a` | `6b18cbcadc739946f57f5c7f4da006356ebcc0eac3cd955662c7dc6cc34f8f54` |
| 18 | `R28U2.isIndepSet_union_iff` | lemma | `U2-Main.lean` 106–119 | U2 (seat) | N2 (`private`) | `af3756480413b00ea8499c0b014cd7e83a1bac19a93c61cc2c8510d01df3779b` | `245d58f55c22741254574dfcd2f634e1d29cd03d0953038b09a3e0d40ed3c6d7` | `0a49d7a638e5153547952269bbd4f4a4d7cbdce501f994ef66702a414d1e6e4f` |
| 19 | `R28U2.join_splitPair` | lemma | `U2-Main.lean` 127–134 | U2 (seat) | N2 (`private`) | `128b6647b870bd8308b214cbc44091cccc17662410265225373538614416f2d7` | `8add118d39d4ce2cbee864a47a3acf912e19dad4d4c98a513608527c8547daef` | `8bbc6f78463dbf6352a1129d518db9046d483e917d085454f2f89ed51c8cd5c9` |
| 20 | `R28U2.splitPair_joinPair` | lemma | `U2-Main.lean` 136–149 | U2 (seat) | N2 (`private`) | `3dc98900dc136b430fe1659fe8f9f1e2166d1275191380519633f44295b08fe6` | `317bad9d758ed7e7dd740e5483ad4b826ef15b33b992bb1b722aec7403f519ff` | `c52d9441fa4222730f74dde040a04f2fcc4a4f430a73de6021731a0b21d06037` |
| 21 | `R28U2.splitPair_mem` | lemma | `U2-Main.lean` 151–176 | U2 (seat) | N2 (`private`) | `b79c4e2c9e7f8f51055a9d8fa134026aafac237dcd84d7aae7d26288d4d37d9b` | `c9b8eb0fe7c9a0f9cdeb77da615a0e7d0649f9cc5f698106363576f3a904d4d6` | `c4531c1f2430611c946c190e512bba5d685fe1794fa2807f4547f1d7b52abc9e` |
| 22 | `R28U2.joinPair_mem` | lemma | `U2-Main.lean` 178–208 | U2 (seat) | N2 (`private`) | `4906b3b111355b1d2f64434848153f6a8808b1f3e1b73fc55ef51e168d610047` | `3520be3e9b58b875cc37313c6fa55e56bf7b5c147573520e6c9c9a19b4763381` | `6e96881edf60e01dddd0f166c5f861a54a604d1202d1612d262d1b1899b8c79a` |
| 23 | `R28U2.indepCountOn_union_filter_card` | lemma | `U2-Main.lean` 210–228 | U2 (seat) | N1 | `d670937869f5227df1995991706cd8fcd3bf9b5e9f0ea3a249c7738e8b3cd809` | `71a92c494b5d6b020bb31e7dd5a663114ef3540551245cabdc131fbd30183900` | `cc83dc07de583300be13f9470076004e8702b8b77f2e14795c64af1584ea544f` |
| 24 | `R28U2.indepDegreeSumOn_union_filter_sum` | lemma | `U2-Main.lean` 230–261 | U2 (seat) | N1 | `d49ab5283c0cc9c3c32f5b6ac0abdf43d4e3092d4da49259324f3bcb28077512` | `02cb2ace8063a2c182fa429e42818fd93b8e1f937b9ff92f2fc7932164743d65` | `0a6152a59998a1e91ef51a772326a8acc29bf42965f9109c6cd9de7f7bb22b0c` |
| 25 | `R28U2.interS_card_mem_range` | lemma | `U2-Main.lean` 263–270 | U2 (seat) | N2 (`private`) | `f666c3cb7cb9e855156e6867948822a6301e778421d4e2cb7fd1b3bc3288c023` | `796c097ebc9a92ac80f26440cafa928875fa99b68e1450833fc2244c9eb6568f` | `bc3da5c26ee431881ef1fefda7ebb8c95bf13c3fb5b7a4b3e5cb43de3b5ad1e7` |
| 26 | `R28U2.indepCountOn_union` | lemma | `U2-Main.lean` 272–281 | U2 (seat) | N1 | `1d546a1896ed9c0922fcaf761153f245db86ffc3132c477f3dbedc4778f40299` | `90dae34d4e17bf11d796a60fff88e32d1b78c1513e568516124ff87b12a80996` | `35b055ec37d8c606e36cf0b8a9cae101902679453b6589e9ae01de4903201949` |
| 27 | `R28U2.indepDegreeSumOn_union` | lemma | `U2-Main.lean` 283–311 | U2 (seat) | N1 | `5574c48ac219f58626a3691904a49c743ff59044aaef4cfeab98f56ffb1af607` | `f6037c3755a1ceedd6f8012200c21ea7caece62e38d266d1db5c75945ef27f90` | `756679f68a4b62b94917fe24f452ea13d28e559da5a3d5570c4c329b8ab2c4a7` |
| 28 | `R28U2.nested_hall_iff_threshold` | lemma | `U2-Main.lean` 328–360 | U2 (seat) | N1 | `0b34046978ba2b795c569f54939deba841e9e3d6f64432ee4f1b0d3139acf21b` | `2aa6617c55215c488e11ea61d96ef05192c54a499ab94cd452902dd823560765` | `291b912b208c422d73a4c0fa9c061311948faf0d18ec7fe23d410d7e6a2fc2be` |
| 29 | `R28U2.sdr_iff_threshold_abstract` | lemma | `U2-Main.lean` 362–370 | U2 (seat) | N1 | `2dc193fda39af179b8d50d1947fe8a95e57fa76b9432b2e3205ecbc01d9d42ca` | `250f5aeca0d073d1ed3f89263ab00baa8092dce7c65073d109f2140cd67e1236` | `efa1c4d53ac0d36fd4f43ca41ac13271e8392075adccbdaa19c0be2e1351d652` |
| 30 | `R28U2.card_filter_subtype_eq` | lemma | `U2-Main.lean` 392–400 | U2 (seat) | N2 (`private`) | `bc1151af7749c193cf06687d9197896f79145140ded42eac4c6be03ae0cbca13` | `f41e2228b6f7cacb68faa44091dde84af19cbf827977f6c797c31e5697f31550` | `23f549ff306f7a3a61ed1ca8e5e2869df6af2f2b6ecbf2b1f70ea2b06493ad89` |
| 31 | `R28U2.sum_filter_subtype_eq` | lemma | `U2-Main.lean` 402–412 | U2 (seat) | N2 (`private`) | `6abf0023e9405ce84f8074614dbc0d56a2c3b3ae078ed4255f61344fb735160e` | `5bc4e980f274ed41d7a73d688d9f4b12f28eb9f88ec62be96e1a6ca55bfa4616` | `d96f8233898ae15c64098205a2d0a97f25bc295c710f06779301b62e8e02d7ff` |
| 32 | `R28U2.card_filter_slot_eq` | lemma | `U2-Main.lean` 414–426 | U2 (seat) | N2 (`private`) | `8cdf151d97f45d4e8601c82e2d1a2be09a248729842c9eb9c1a987d44f019692` | `e7f5282e0f0825fe67bcd848258694e5cc62e771c490eebd4f3b12677532c856` | `58a54c0662c791736aaa9dc628e7a8258ada7f7732b34726721446ffd989b932` |
| 33 | `R28U2.card_filter_leaf_eq` | lemma | `U2-Main.lean` 428–431 | U2 (seat) | N2 (`private`) | `8e49ab89b50833239e273bf7d36ecf74ca8af654a1f5c010637aec6b05156fc6` | `4bc9b7b27e6046980fa43c32bc4190cdd4c7409786c57df41010bc27bd4b4b32` | `a276cc9963d8d71fa77ec06c720a5e433939341b4ce0fa6cc7661fa9d6528b88` |
| 34 | `R28U2.sdr_iff_threshold` | lemma | `U2-Main.lean` 433–444 | U2 (seat) | N1 | `decd3abf81978844c709c45d16dff0210ce591da07c08b7f103db036a06ae652` | `dd3e7e5a24e25e1b3f26a6ba18006e2114338613132ade659867421e839396e3` | `96f879ee99e5381185e12e5908dc249812c91f52d55baae563a07c71908c5ad9` |
| 35 | `R28CritU2T.degree_lemma_on_union` | lemma | `C-U2-T-CritU2T.lean` 22–39 | C-U2-T (critic) | N1 | `fe59948d09e3b4582b76a49ac89c1aa6285effad110a7a71fb223de4fa5adc63` | `ab14e55224faa62e09568b9afb3477ea941b5a4cf03d3a621811f6548a56ac76` | `67ff442bcf37dd47f6073fcab2fdb3e68b0931cbb14231996bd20ac14fee96b4` |
| 36 | `R28CritU2T.sum_empty_on` | lemma | `C-U2-T-CritU2T.lean` 41–46 | C-U2-T (critic) | byte-identical | `fdde0fbd084c72708fc6f3b1c0e13e37c6adee7d8d6c04d272fa56399a75656c` | `fdde0fbd084c72708fc6f3b1c0e13e37c6adee7d8d6c04d272fa56399a75656c` | `018d2df47acb0bcb8c1671ae08269519ed6bed40ba73e2e35d72eb913cfe9619` |
| 37 | `R28CritU2T.bridge` | lemma | `C-U2-T-CritU2T.lean` 48–108 | C-U2-T (critic) | N1 | `d01f098a96d2acf447197c6a6e9012d9e1082fa064510de1fd402419124649e0` | `17bd83e49e30f3eaf27c58d0fb9c43c71b30f4f796530f829daee6962b77bbb7` | `20d0191e642b632b34bf13eacdf82ae360924c7702d903753589cbdbf52900c0` |
| 38 | `R28CritU2T.supp_closed` | lemma | `C-U2-T-CritU2T.lean` 110–114 | C-U2-T (critic) | byte-identical | `1cd388ec1fd8bf0af49bab1494d493cf5a4244b004eb23fb6f5f5cc4d2b2c723` | `1cd388ec1fd8bf0af49bab1494d493cf5a4244b004eb23fb6f5f5cc4d2b2c723` | `22db38cac7bfaa81649ff297330943d58c4d7ce9926ccd591636557e26bf8a96` |
| 39 | `R28CritU2T.degree_lemma_of_components` | lemma | `C-U2-T-CritU2T.lean` 116–173 | C-U2-T (critic) | N1 | `dfd51c757fe3f0ca424a74334f82f42575a66e72761cef157193e7ccbf49dbaf` | `647b5936972d5ee650a95c0ceaa1277b9389bc6fec394da63f18712b93e7aefe` | `d9dfb9a70d1c7f5c153911ddbf701113860b622c61a38bf25877a0edde707593` |
| 40 | `R28CritU2T.forest_degree_lemma_of_components_allk` | lemma | `C-U2-T-CritU2T.lean` 175–182 | C-U2-T (critic) | N1 | `6eb1b2ecbcd39f726ff01f3abec5fe74d09558cfbcfea57edec420c7d08d63ca` | `0091f2e30c84e44a692ec0eb8e1cfaceb19fcb587608eabc93087688582692cf` | `5347e7031aacd894274a1f0936a238c4aa6e9a4d47740ab4548806f75fe5bc05` |
| 41 | `R28CritU2T.induce_supp_isTree` | lemma | `C-U2-T-CritU2T.lean` 184–188 | C-U2-T (critic) | byte-identical | `c52261fec2d83bb2bb31819281ac9039eb8c86e837098ac44b85b08e8dd4e7cd` | `c52261fec2d83bb2bb31819281ac9039eb8c86e837098ac44b85b08e8dd4e7cd` | `892b3dc12bf5a7eb656f6f07816d34c1e1f8edb7b92080dc2fe1f951d12af376` |
| 42 | `R28CritU2T.forest_degree_lemma_of_tree_degree_lemma` | lemma | `C-U2-T-CritU2T.lean` 190–199 | C-U2-T (critic) | N1 | `83e2b39d3ef8344567eff85273b09bb7892cd481971c29c8d4564153180c3bfb` | `dded893b5d427d6b8d123e65f7d5ca36997fcb4eda95d14605f85f0539e0795c` | `caf15263f6e7ea32eb687e16f68914706885be4b4828040d49286c0533fe68d4` |
| 43 | `R28CritU2F.dl_union` | lemma | `C-U2-F-CritAdvance.lean` 14–30 | C-U2-F (critic) | N1 | `4a1df3fbc0225d1eebdf2573f175f4e4d5a64c3f460eb546260d1fcaf3058eea` | `ababbd964953f3e31d1aee5a83ce8e4849871987e27826ead730c505646ddddc` | `f6feac9c01d2b756135daf54b098136338e931a77a562f2b62da6077f256cce9` |
| 44 | `R28CritU2F.card_isolated_le_one` | lemma | `C-U2-F-CritAdvance.lean` 32–44 | C-U2-F (critic) | N1 | `44f6639f0ffe870856740a2e7cf5e1181e478042a2d978bb02f90ed6045e11ce` | `96ea81072dd11ef49c2e4c4bc95d689208a7d3e31b4f3f1b09046ffacadfb326` | `4cb656d841721c281b53e9008548a03696e71dd933c1fb289c85d26a1e5b2bc2` |
| 45 | `R28CritU2F.tree_slots_zero_le` | lemma | `C-U2-F-CritAdvance.lean` 46–92 | C-U2-F (critic) | N1 | `c6f9ff630181d1279ffd1a29f65686f4ad71ac7095f8fcae53e5c7f80445b8dd` | `0c0e903784a9f702925fa63e6e19929a7867759a81eca56f7d82d4d6a46e4bf5` | `989705c8d7085d66fca2d59e849a1432676ecfbd1a347ca39eb842ec53499c34` |
| 46 | `R28CritU2F.sdr_iff_threshold_pos_of_tree` | lemma | `C-U2-F-CritAdvance.lean` 94–106 | C-U2-F (critic) | N1 | `cc5872d0cb89301eafafcb8c83596618ee16d91f9a5dd7d5998a25b2b5576bfe` | `44d142fd57e5037b8d8392ddf9882b81d8974ba95fd23cc981e2674b4254b673` | `6e6c6520694c3679797e4f0d5fe7acbe23f8ec9f673a2197da3da8ff2b2fe274` |
| 47 | `R28CritU2F.mem_of_reachable_of_closed` | lemma | `C-U2-F-CritAdvance.lean` 109–116 | C-U2-F (critic) | N1 | `8930797d61227c42bc64acb9b4fbe00343e1e66e5819c7f477be1afca3309cc9` | `7ada56c45c7a437f001ec220b47ad912019ea064d72cec0400d21b80ced426b4` | `9c915bda6219b8909bd79a77f48b6579d620953d6aca98cb596bad51cd503b66` |
| 48 | `R28CritU2F.dl_closed_of_components` | lemma | `C-U2-F-CritAdvance.lean` 118–169 | C-U2-F (critic) | N1 | `f227dba8c6310d9e28ed1cfb14a4c489f23bf8a4e3e3e8b2302b411091f3ec98` | `dbd87269f2558bd2067b1c086305c81bb606a64306e045db05b2c235555849a1` | `d61ea90169836feff63292640992406cb9c0d68139f93c5593eda1efb00ec1c2` |
| 49 | `R28CritU2F.degree_lemma_of_component_supports` | lemma | `C-U2-F-CritAdvance.lean` 171–181 | C-U2-F (critic) | N1 | `9f0910e7eff4db9eb45037f9fe34d6416ebaed058479263a4c35c8cb214db963` | `624d103e511857d80538c45504807f1284583682390707b410f1fbfbbac9b5f3` | `14f9886cad0e2f99ccbba64b2670980ccd994a5922ea5c2bb778d639c25492f1` |
| 50 | `Erdos993G1.sdr_iff_threshold_pos_of_tree` | lemma | in-run (`DRAFTS/inrun/`) | this seat | authored in-run | — | — | `fa8cfc72dae188191e5687376ca7ce8abb1a27f9b48284ae098750bc574e89f5` |
| 51 | `Erdos993G1.forest_degree_lemma_of_tree_degree_lemma` | theorem | in-run (`DRAFTS/inrun/`) | this seat | authored in-run | — | — | `1e72e521f6ffe8d6e3664206123115c2a7f6d26ad1d62156ea00ce65215839d7` |

Transport legend: `byte-identical` — the declaration span is transported unchanged; `N1` — keyword
`theorem` → `lemma` only; `N2 (…)` — line break after the named modifier only. For N1/N2 rows the
original span's SHA-256 (column 7) is what `DRAFTS/transport.py` recovers exactly by reversing the
normalization. Registered entry SHA-256 is the registrar's digest of the whole fragment (declaration plus its
namespace/`open`/`variable`/section wrapper). Full per-declaration record: `DRAFTS/carry-table.json`;
fragment manifest: `DRAFTS/fragment-manifest.json`.

Not transported from the carry set: U2's `R28U2.slot_leaf_sdr_exists` and `R28U2.tree_leaf_slot_dominance`
(excluded: false / `sorry`ed; U2-Main.lean lines 463–479); U2's re-typed copies of `Erdos993G1.indepCount`,
`Erdos993G1.indepCount_eq_card_indepSetFinset`, `Erdos993G1.indepDegreeSum` (replaced by the registrar
entries of record); C-U2-F's `#print axioms` commands.

## 8. Dependency DAG (closed)

G1 entries → run-local definitions (`occ`, `slotsAtLeast`, `leavesAtLeast`, `indepFinsetOn`,
`indepCountOn`, `indepDegreeSumOn`, `splitPair`, `joinPair`, `Branch`, `LeafT`, `Slot`) →
(FC-1) convolution lemmas → (FC-2) `degree_lemma_on_union` / `dl_union` → (FC-3) `bridge`, (FC-4)
`supp_closed` → (FC-5) `degree_lemma_of_components` (+ `sum_empty_on`, `indepCount_eq_card_indepSetFinset`)
→ (FC-7) `induce_supp_isTree` → (FC-8) terminal. SDR: (S-1) → (S-2) → counting bridges → (S-3)
`sdr_iff_threshold`; `card_isolated_le_one` → (S-4) `tree_slots_zero_le` → (S-5) → (S-6) SDR face. Every node
is a registered declaration of this run's `Main.lean`; no node is open; Mathlib supplies Hall's theorem, the
handshake lemma, `IsTree.card_edgeFinset`, `maximal_connected_induce_supp`, `IsAcyclic.induce`,
`mem_supp_congr_adj`, `degree_induce_of_neighborSet_subset`, `Fintype.sum_equiv`.
