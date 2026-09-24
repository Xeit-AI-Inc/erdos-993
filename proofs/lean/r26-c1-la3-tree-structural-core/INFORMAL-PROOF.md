# INFORMAL PROOF — C1-LA3, the tree-structural core (`R26LA3`)

Award group `C1-LA3`, Cycle 1, r26 (`erdos-993-math-dre-20260923-r26-top-rank-residual-sign`).
Producer: `c1-la3-formalizer-opus-20260924` (governed Stage 7 formalizer seat).
Governing text: `cycles/cycle-1/stage6/SYNTHESIS.md` `## Lean awards`, "C1-LA3 — the tree-structural
core", as narrowed and repaired by `control/C1-STAGE7-FORMALIZER-BRIEF-LA3.md` §2.

This document is the **informal-audit input**. It is not a verification claim. It covers **every
declaration registered in `FORMALIZATION-STATE.json`**, at statement-level granularity, in
registration order. For each declaration it records: the exact registered statement; the informal
argument of record; the Mathlib anchors at the pinned revision; the hypotheses actually consumed;
and the provenance of the compiled derivation.

**Pinned environment.** Lean `leanprover/lean4:v4.32.2`; Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`; shared read-only project
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project`.

**Attribution on the face of this award** (synthesis §2, fence 7). Route: **U3**
(`cycles/cycle-1/stage3/returns/U3/RETURN.md`) — the twelve sorry-free tree-structural declarations.
Critic extensions: **`C-U3-T`** (`cycles/cycle-1/stage4/critics/U3/T/CRITIQUE.md`) — the sharp form of
(c), `L ∩ C = ∅`, `λ ≡ 0` on `L`, `j·|C_j| ≤ ℓ`, `k₂ ≤ ⌊ℓ/2⌋`, and the eligible-class `k₂ = 0`;
**`C-U3-F`** (`cycles/cycle-1/stage4/critics/U3/F/CRITIQUE.md`) — the same four extension facts
compiled independently under its own names, and the corrected `IsTree` form of the induced-complement
lemma. Informal proofs and Mathlib anchors: **T3** (`cycles/cycle-1/stage3/returns/T3/RETURN.md` §5,
lemmas (i)–(iv)), **verified at file and line against the pinned project by both T3 critics**
(`C-T3-F` §"Mathlib anchor audit"; `C-T3-U`, "every cited line number is exact and every statement
says what the return says it says"). Definitions of record: the frozen r24 **C5-LA1** award source
(`sources/r24/c5-la1/LeanProject/LeanProof/Main.lean`,
`0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b`).

**Reconciliation ruling carried onto the face of this proof** (synthesis, C1-LA3): *T3's informal
lemmas and U3's compiled declarations are the same facts; the award carries **one** derivation of
each — the compiled one — with T3's informal proofs and Mathlib anchors as the informal-audit input.*
Where the compiled derivation takes a different informal route from T3's, this document says so
explicitly and names both.

**Excluded conclusions** (synthesis §2; an award that states any of these is not this award):
nothing about the aggregate `S`, nothing about `W_III`, nothing about the families (I)/(II)/(III),
nothing about (RC). **No registered declaration consumes `(★)` (`hyp-residual`)**; `hyp-residual` does
not occur anywhere in this project's source. T3's lemmas (v) (the deletion injection) and (vi)
(`α = ℓ + a`) correspond to **no** registered declaration here: (v) is award group `C1-LA2` and (vi) is
the gate node inside `C1-LA1`. They are named here only to record that they were deliberately not
carried.

---

## 0. Notation

`V` is a finite type with decidable equality; `G : SimpleGraph V` with `[DecidableRel G.Adj]`.
`L := C5LA1.leafSet G` is the leaf set and `ℓ := |L|`; `α := G.indepNum`;
`λ(s) := C5LA1.leafDegree G s` is the number of leaves adjacent to `s`;
`support G v` is the unique neighbour of a leaf `v`; `C(G) := R26LA3.supportSet G` is the image of `L`
under `support`; `C_j := {s : λ(s) = j}` and `k_2 := |C_2|`; `x(G) := C5LA1.crossingIndex G`.
`hyp-tree` is `G.IsTree`, `hyp-alpha` is `2 ≤ α`, `hyp-eligible` is `x(G) + 2 ≤ α − 1`.

---

## 1. Definition layer (registered byte-identically; nothing re-stated)

Entries 1–8 are the C5-LA1 award entries reproduced **byte-identically** from the frozen source, with
their frozen entry digests reproduced exactly (see `FORMALIZER-REPORT.md` §"C5-LA1 digest matches").
They are definitions of record and carry no proof obligation here; their meaning is stated for the
auditor.

1. **`C4LA1.IsGraphLeaf`** — `(G : SimpleGraph V) (v : V) : Prop`, namely `∃! u, G.Adj v u`.
   A leaf is a vertex with exactly one neighbour. Mathlib anchor for the equivalence with
   `G.degree v = 1`: `SimpleGraph.degree_eq_one_iff_existsUnique_adj`
   (`Combinatorics/SimpleGraph/Finite.lean:244`) — verbatim `IsGraphLeaf` (T3 (i); both T3 critics
   confirmed the line).
2. **`C5LA1.support`** — `(G : SimpleGraph V) (v : V) : V`. The unique neighbour of a leaf, realised by
   `Classical.choose` over the unique-neighbour witness; unconstrained off the leaf set. Noncomputable.
3. **`C5LA1.leafSet`** — `(G : SimpleGraph V) : Finset V`, namely `Finset.univ.filter (IsGraphLeaf G)`.
4. **`C5LA1.leafDegree`** — `(G : SimpleGraph V) [DecidableRel G.Adj] (s : V) : Nat`, namely
   `((leafSet G).filter fun v => G.Adj v s).card`. Zero off supports by construction.
5. **`C5LA1.indepSetsAvoiding`** — `I_k(G − D)`, the independent `k`-subsets of `V` avoiding `D`.
6. **`C5LA1.indepSetCount`** — `i_k(G − D) = |I_k(G − D)|`.
7. **`C5LA1.forwardDifferenceDel`** — `Δ_k(G − D) = i_{k+1}(G − D) − i_k(G − D)` in `ℤ`.
8. **`C5LA1.crossingIndex`** — `x(G) : Nat`, the least `k` with `Δ_k(G) < 0`; well-defined because
   `Δ_α(G) = −i_α(G) < 0`, which the frozen source proves inline using
   `SimpleGraph.exists_isNIndepSet_indepNum` (`Combinatorics/SimpleGraph/Clique.lean:997`).
   Entries 5–8 are registered **only** because `hyp-eligible` mentions `x(G)`; no declaration in this
   award unfolds them.
9. **`R26LA3.supportSet`** — `(G : SimpleGraph V) : Finset V`, namely `(leafSet G).image (support G)`.
   This is `C(G)` of `SEMANTIC-CONTRACT.md` §1, presented as the **image** of the leaf set under
   `support`. Origin: `C-U3-T`. It is the only definition this award adds to the C5-LA1 layer.
   *Equivalence with the filter presentation `{s : λ(s) > 0}` used in `SEMANTIC-CONTRACT.md` §1 and in
   T3 (ii): `s ∈ (leafSet G).image (support G)` iff some leaf `v` has `support G v = s`, iff (by
   `adj_iff_support_eq`, entry 11) some leaf `v` has `G.Adj v s`, iff `λ(s) > 0` — the fibre of the
   filter defining `λ` is nonempty exactly when the image contains `s`. The award registers the image
   form only; it does not register the equivalence, because no registered declaration needs it.*

---

## 2. C5-LA1 lemma layer (registered byte-identically)

10. **`C5LA1.support_spec`** — `(hv : IsGraphLeaf G v) : G.Adj v (support G v) ∧ ∀ y, G.Adj v y →
    y = support G v`. The defining property of `support`, discharged by `Classical.choose_spec`.
11. **`C5LA1.adj_iff_support_eq`** — `(hv : IsGraphLeaf G v) : G.Adj v s ↔ support G v = s`. Immediate
    from 10 in both directions.
12. **`C5LA1.leafDegree_eq_filter_support`** — `λ(s) = ((leafSet G).filter fun v => support G v = s).card`.
    By 11 the two filters agree pointwise on `L`, so the two cardinalities agree. This is the identity
    that turns `λ` from an adjacency count into a **fibre count of the function `support`**, and it is
    what makes §3's counting arguments fibre arguments (T3 (iii) Step 1: "fibres of a function over
    distinct points are disjoint by definition"; no tree structure is used).

---

## 3. Award lemma layer

### 13. `R26LA3.closed_reachable` — reachability transports a step-closed predicate

`(hP : ∀ x y : V, P x → G.Adj x y → P y) : ∀ {a b : V}, G.Walk a b → P a → P b`

**Hypotheses consumed:** none beyond `hP`. No tree, no connectivity, no `hyp-alpha`.
**Proof.** Induction on the walk. `nil`: the conclusion is the premise. `cons h p ih`: from `P a` and
the first edge `h` get `P` at the next vertex by `hP`, then apply `ih`. ∎
**Role.** This is the *adjacency-closure* engine. Together with `IsTree.connected.preconnected` it
replaces T3's nested `SimpleGraph.induce` route in (b) and (e) — exactly the substitution the
synthesis makes binding at repair 9 ("the adjacency-closure argument with connectivity consumed
explicitly … not T3's nested `induce`"). Provenance: **U3**.

### 14. `R26LA3.card_leafSet_ge_two_of_nontrivial` — a nontrivial finite tree has ≥ 2 leaves

`(hTree : G.IsTree) [Nontrivial V] : 2 ≤ (leafSet G).card`

**Hypotheses consumed:** `hyp-tree` (both acyclicity, through the edge count, and **connectivity**,
through the degree positivity), and `Nontrivial V`. No `hyp-alpha`.
**Proof (the handshake argument; T3 (i) Step 4).** First, `L = {v : G.degree v = 1}` by
`degree_eq_one_iff_existsUnique_adj` (`Finite.lean:244`). Write `n := Fintype.card V ≥ 2`. A tree has
`#E + 1 = n` (`SimpleGraph.IsTree.card_edgeFinset`, `Combinatorics/SimpleGraph/Acyclic.lean:296`) and
`∑_v deg(v) = 2·#E` (`SimpleGraph.sum_degrees_eq_twice_card_edges`,
`Combinatorics/SimpleGraph/DegreeSum.lean:102`), so `∑_v deg(v) = 2(n − 1)`. **Connectivity step:**
every vertex has `deg(v) ≥ 1` by `SimpleGraph.Preconnected.degree_pos_of_nontrivial`
(`Combinatorics/SimpleGraph/Connectivity/Connected.lean:279`) applied to
`hTree.connected.preconnected` — this is false for a disconnected graph, so connectedness is
essential, not just acyclicity. Split the vertex set into the degree-1 vertices and the rest: the
degree-1 part contributes exactly its own cardinality; every vertex of the rest has `deg ≠ 1` and
`deg ≥ 1`, hence `deg ≥ 2`, so the rest contributes at least twice its cardinality. If `ℓ ≤ 1` then
`∑_v deg(v) ≥ ℓ + 2(n − ℓ) = 2n − ℓ ≥ 2n − 1 > 2(n − 1)`, a contradiction. Hence `ℓ ≥ 2`. ∎
**`ℕ`-subtraction audit.** The single `ℕ`-subtraction is `n − 1` inside `2(n − 1)`; it does not
truncate because `n ≥ 2`. In the compiled derivation the whole final contradiction is discharged by
`omega` from the four recorded linear facts (`#E + 1 = n`, `∑deg = 2#E`, the two filter-sum bounds,
`2 ≤ n`), so no subtraction is performed by hand.
**Difference from T3 (i).** T3 splits into the cases `ℓ = 0` and `ℓ = 1`; the compiled derivation
proves the single inequality `2·|{deg ≠ 1}| ≤ ∑_{deg ≠ 1} deg` and lets `omega` close both cases at
once. Same mechanism, same anchors. Provenance: **U3**.

### 15. `R26LA3.tree_two_le_indepNum_two_le_leafSet` — item 9 (a)

`(hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) : 2 ≤ (leafSet G).card`

**Hypotheses consumed:** `hyp-tree`, `hyp-alpha`.
**Proof.** By `SimpleGraph.exists_isNIndepSet_indepNum` (`Clique.lean:997`) pick `s` with
`|s| = α ≥ 2`; since `s ⊆ univ`, `Fintype.card V ≥ 2`, so `Nontrivial V`
(`Fintype.one_lt_card_iff_nontrivial`). Apply 14. ∎
**Note.** `hyp-alpha` is consumed **only** to produce `Nontrivial V`. T3 (i) additionally derives
`3 ≤ |V|`; the award does not register that strengthening, because no registered declaration uses it
(the compiled route to (e) does not need it). Provenance: **U3**.

### 16. `R26LA3.tree_two_le_indepNum_no_adjacent_leaves` — item 9 (b)

`(hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) : ∀ v w : V, IsGraphLeaf G v → IsGraphLeaf G w → ¬ G.Adj v w`

**Hypotheses consumed:** `hyp-tree` (connectivity only), `hyp-alpha`.
**Proof (adjacency closure; the repair-9 route).** Suppose leaves `v, w` with `G.Adj v w`. Each leaf
has a unique neighbour, so `w` is `v`'s unique neighbour and `v` is `w`'s. Then the predicate
`P x := (x = v ∨ x = w)` is closed under one adjacency step: a neighbour of `v` must be `w` and a
neighbour of `w` must be `v`. **Connectivity step:** `hTree.connected.preconnected` gives a walk from
`v` to every `u`, so by `closed_reachable` (13) every vertex is `v` or `w`, i.e. `V = {v, w}` as a
predicate. Now take a maximum independent set `s` with `|s| = α ≥ 2`; by `Finset.one_lt_card` it
contains two distinct elements `x ≠ y`, and each is `v` or `w`, so `{x, y} = {v, w}` and the
independence of `s` contradicts `G.Adj v w`. ∎
**Difference from T3 (ii) Step 1.** T3 deletes the leaf `v` and uses
`SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one` (`Acyclic.lean:516`) plus
`Preconnected.degree_pos_of_nontrivial` on the induced graph. The compiled derivation avoids the
induced subgraph entirely and consumes connectivity once, directly, through `closed_reachable`. Both
routes are sound; the award carries the compiled one. Provenance: **U3**.

### 17. `R26LA3.leafDegree_eq_zero_of_not_mem_supportSet` — item 9 (c), **in the sharp form**

`{d : V} (hd : d ∉ supportSet G) : leafDegree G d = 0`

**Hypotheses consumed:** none. **No `hyp-tree`, no `hyp-alpha`, and no inert `¬ IsGraphLeaf G d`.**
**Proof.** By `leafDegree_eq_filter_support` (12), `λ(d)` counts the leaves whose support is `d`. If
some leaf `v` had `support G v = d`, then `d` would lie in the image `(leafSet G).image (support G) =
supportSet G`, contradicting `hd`. So the filter is empty and its cardinality is `0`. ∎
**Repair record (binding, synthesis §2 and brief §2).** U3's own lemma
`R26U3.interior_leafDegree_eq_zero` carries an **unused** hypothesis `¬ IsGraphLeaf G d`; both critics
demonstrated it is inert by compiling the hypothesis-free form. The award therefore states (c) in the
sharp form and **does not carry U3's body**. Two critic spellings of this same fact exist:
`C-U3-T`'s `leafDegree_eq_zero_of_not_mem_supportSet` (membership in `supportSet`) and `C-U3-F`'s
`interior_leafDegree_eq_zero'` (`∀ v, IsGraphLeaf G v → support G v ≠ d`). They are the same statement
modulo unfolding `supportSet` through `Finset.mem_image`. **One derivation is carried — `C-U3-T`'s.**
Provenance: **`C-U3-T`**, co-derived by **`C-U3-F`**.

### 18. `R26LA3.leaf_not_mem_supportSet` — no leaf is a support

`(hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (hv : IsGraphLeaf G v) : v ∉ supportSet G`

**Hypotheses consumed:** `hyp-tree`, `hyp-alpha` (both only through 16).
**Proof.** If `v ∈ supportSet G`, then `v = support G w` for some leaf `w`; by `adj_iff_support_eq`
(11), `G.Adj w v`; so `w` and `v` are adjacent leaves, contradicting 16. ∎
Provenance: **`C-U3-T`** (`C-U3-F` proves the pointwise variant `leaf_not_support`,
`support G w ≠ v`, not carried).

### 19. `R26LA3.disjoint_leafSet_supportSet` — `L ∩ C(G) = ∅`

`(hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) : Disjoint (leafSet G) (supportSet G)`

**Hypotheses consumed:** `hyp-tree`, `hyp-alpha`.
**Proof.** By `Finset.disjoint_left`: a member of both would be a leaf lying in `supportSet G`,
contradicting 18. ∎
**Role.** This is exactly `SEMANTIC-CONTRACT.md` §3's Fact "Leaves and supports are disjoint when
`α ≥ 2`" (T3 (ii) Step 2), which seat U3 did not state as a declaration.
Provenance: **`C-U3-T`**; `C-U3-F` compiled the same fact as `leafSet_disjoint_supports`, stated with
the image `(leafSet G).image (support G)` written out — definitionally the same statement. **One
derivation is carried.**

### 20. `R26LA3.leaf_leafDegree_eq_zero` — `λ ≡ 0` on `L`

`(hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (hv : IsGraphLeaf G v) : leafDegree G v = 0`

**Hypotheses consumed:** `hyp-tree`, `hyp-alpha`.
**Proof.** Apply 17 to the membership fact 18. ∎
**Note (carry finding).** This is the one **name collision** in the corpus: `C-U3-T` and `C-U3-F` both
compiled a declaration called `leaf_leafDegree_eq_zero` at the identical statement, with different
proofs (`C-U3-T` composes 17 ∘ 18; `C-U3-F` re-runs the filter argument against 16 directly). The
award carries **`C-U3-T`'s** single derivation and records `C-U3-F`'s as an independent confirmation
that is not carried. Together with 17 this is the whole of `SEMANTIC-CONTRACT.md` §3's "`λ(v) = 0` for
`v ∈ L ∪ D`" (T3 (ii) Step 3).

### 21. `R26LA3.sum_leafDegree_eq_card_leafSet` — item 9 (d) part 1, **at no hypotheses**

`: ∑ s : V, leafDegree G s = (leafSet G).card`

**Hypotheses consumed: none.** No `hyp-tree`, no `hyp-alpha`. (Synthesis repair: "record (iii) at
**no** hypotheses"; T3 (iii) states `hyp-tree` ambiently but its derivation does not use it.)
**Proof.** By `leafDegree_eq_filter_support` (12), `λ(s)` is the cardinality of the fibre of
`support : V → V` over `s`, restricted to `L`. Summing the fibre cardinalities of a function over all
of `univ` recovers the cardinality of the domain: `Finset.card_eq_sum_card_fiberwise`, applied with
the trivial `MapsTo` obligation `support G v ∈ univ`. ∎
**Difference from T3 (iii) Step 2.** T3 derives the identity by the `sum_card_filter_comm`
double-counting engine (frozen C5-LA1 entry 23) plus `degree = #neighborFinset`
(`Finite.lean:200`) and `degree_eq_one_iff_existsUnique_adj` (`Finite.lean:244`). The compiled
derivation uses the fibrewise cardinality lemma instead, which is the same double count packaged as a
single Mathlib call; consequently `C5LA1.sum_card_filter_comm` is **not** among the registered
C5-LA1 entries, because no registered declaration depends on it. Provenance: **U3**.

### 22. `R26LA3.card_C1_le_card_leafSet` — item 9 (d) part 2, **at no hypotheses**

`: (univ.filter (fun s => leafDegree G s = 1)).card ≤ (leafSet G).card`

**Hypotheses consumed: none.**
**Proof.** Each `s ∈ C_1` contributes exactly `1 = λ(s)` to the sum, so `|C_1| = ∑_{s ∈ C_1} λ(s)`;
extend the index set to all of `univ` by `Finset.sum_le_sum_of_subset`
(`Algebra/Order/BigOperators/Group/Finset.lean:418`, valid in `ℕ` with no nonnegativity side
condition), and apply 21. ∎ (T3 (iii) Step 3.) Provenance: **U3**.

### 23. `R26LA3.mul_card_leafDegree_fiber_le_card_leafSet` — `j·|C_j| ≤ ℓ`, **at no hypotheses**

`(j : ℕ) : j * (univ.filter (fun s => leafDegree G s = j)).card ≤ (leafSet G).card`

**Hypotheses consumed: none.**
**Proof.** Identical to 22 with the constant `j` in place of `1`: `j·|C_j| = ∑_{s ∈ C_j} j =
∑_{s ∈ C_j} λ(s) ≤ ∑_{s : V} λ(s) = ℓ`, the middle step by `Finset.sum_le_sum_of_subset` and the last
by 21. ∎
**Role.** Strictly generalizes 22 (`j = 1`), which seat U3 proved only in the `j = 1` case.
Provenance: **`C-U3-T`**; `C-U3-F` compiled the identical statement as `mul_card_leafDegree_eq_le` —
the name the synthesis prints for this fact. **One derivation is carried**; the alias is recorded, not
registered.

### 24. `R26LA3.two_mul_card_C2_le_card_leafSet` — `k_2 ≤ ⌊ℓ/2⌋`, **at no hypotheses**

`: 2 * (univ.filter (fun s => leafDegree G s = 2)).card ≤ (leafSet G).card`

**Hypotheses consumed: none.**
**Proof.** Instance `j := 2` of 23. ∎
**`ℕ`-division note.** `SEMANTIC-CONTRACT.md` §4 states this as `k_2 ≤ ⌊ℓ/2⌋`. The award states the
**multiplication form** `2·k_2 ≤ ℓ`, which is equivalent in `ℕ` by `Nat.le_div_iff_mul_le` with
`0 < 2` (T3 (iii) Step 4), and which avoids introducing a division at all. The award does **not**
register the division form. Provenance: **`C-U3-T`** (`C-U3-F`'s `two_mul_card_C2_le` is the same
statement; not carried).

### 25. `R26LA3.eligible_three_le_indepNum` — item 9 (f)

`(hEligible : crossingIndex G + 2 ≤ G.indepNum - 1) : 3 ≤ G.indepNum`

**Hypotheses consumed:** `hyp-eligible` only. **No `hyp-tree`, no `hyp-alpha`.**
**Proof.** Pure truncated-`ℕ` arithmetic: `x + 2 ≤ α − 1` in `ℕ`. If `α ≤ 2` then `α − 1 ≤ 1 < 2 ≤ x + 2`,
contradiction; so `α ≥ 3`. Discharged by `omega`, which reasons about `Nat.sub` exactly and therefore
handles the truncation without a side condition. ∎
**`ℕ`-subtraction audit.** `α − 1` is the only subtraction and it is **truncating** when `α = 0`; the
argument is valid precisely because `omega` models `Nat.sub` truncation faithfully rather than
assuming `α ≥ 1`. Provenance: **U3**.

### 26. `R26LA3.nonleaf_degree_eq_two_of_leafSet_card_eq_two` — exactly two leaves forces every non-leaf to have degree 2

`(hTree : G.IsTree) (hLeafCard : (leafSet G).card = 2) : ∀ v : V, ¬ IsGraphLeaf G v → G.degree v = 2`

**Hypotheses consumed:** `hyp-tree` (acyclicity through the edge count; **connectivity** through
degree positivity), `ℓ = 2`. **No `hyp-alpha`.**
**Proof (degree-sum tightness; T3 (iv) Step 2).** As in 14, `L = {v : deg(v) = 1}`, `∑_v deg(v) =
2(n − 1)`, and every degree is `≥ 1` by `Preconnected.degree_pos_of_nontrivial`
(`Connected.lean:279`); `Nontrivial V` comes from `SimpleGraph.nontrivial_of_degree_ne_zero` applied
to either of the two leaves, so `ℓ = 2` supplies the nontriviality that 14 had to assume. The degree-1
part contributes exactly `2`, so the non-leaf part contributes exactly `2(n − 1) − 2 = 2(n − 2)` while
each of its `n − 2` terms is `≥ 2`. **Tightness:** if some non-leaf `v` had `deg(v) ≥ 3`, then erasing
`v` from the non-leaf set and bounding the rest below by `2` each would give a strict excess, which
`omega` refutes against the exact equality. Hence every non-leaf degree is exactly `2`. ∎
**`ℕ`-subtraction audit.** `n − 1` and the erase-cardinality bookkeeping `|T.erase v| + 1 = |T|` are
the only subtractions; both are supplied to `omega` as exact linear facts
(`Finset.card_erase_add_one`), never computed by hand. Provenance: **U3**.

### 27. `R26LA3.leafDegree_two_indepNum_eq_two_core` — the `P_3` lemma (carried derivation)

`(hTree : G.IsTree) (hLeafCard : (leafSet G).card = 2) {s : V} (hDeg2 : leafDegree G s = 2) : G.indepNum = 2`

**Hypotheses consumed:** `hyp-tree` (acyclicity via 26; **connectivity** via `closed_reachable`),
`ℓ = 2`, `λ(s) = 2`. **No `hyp-alpha`** — this is the synthesis's binding repair "(iv′) without
`hyp-alpha`", matching the C1-LA1 DAG's `ell_two_lambda_two_imp_alpha_two` (L-7, "connectivity; no
hyp-alpha").
**Proof.**
*Step 1 (the two leaves both attach to `s`).* Write `L = {t₁, t₂}` with `t₁ ≠ t₂`
(`Finset.card_eq_two`). Since `λ(s) = 2 = |L|` and the `λ`-filter is a subset of `L`, the filter **is**
`L` (`Finset.eq_of_subset_of_card_le`), so `G.Adj t₁ s` and `G.Adj t₂ s`. By uniqueness of a leaf's
neighbour, `s` is the unique neighbour of each, and `t₁, t₂` are not adjacent to each other.
*Step 2 (`s` is not a leaf, so `deg(s) = 2`).* If `s` were a leaf, its unique neighbour would equal
both `t₁` and `t₂`, contradicting `t₁ ≠ t₂`. Hence by 26, `deg(s) = 2`.
*Step 3 (`N(s) = {t₁, t₂}`).* `{t₁, t₂} ⊆ N(s)` and `|{t₁,t₂}| = 2 = deg(s) = |N(s)|`
(`SimpleGraph.card_neighborFinset_eq_degree`), so `Finset.eq_of_subset_of_card_le` gives equality.
*Step 4 (`V = {t₁, s, t₂}` — the connectivity step).* The predicate `P x := (x = t₁ ∨ x = s ∨ x = t₂)`
is closed under one adjacency step: a neighbour of `t₁` is `s` (uniqueness), a neighbour of `t₂` is
`s`, and a neighbour of `s` is `t₁` or `t₂` by Step 3. By `hTree.connected.preconnected` and
`closed_reachable` (13), every vertex satisfies `P`.
*Step 5 (`α = 2`).* `{t₁, t₂}` is independent (Step 1), so `α ≥ 2`
(`IsIndepSet.card_le_indepNum`). Conversely any maximum independent `M` is contained in
`{t₁, s, t₂}` (Step 4), whose cardinality is exactly `3`; and `|M| = 3` is impossible because it would
force `M = {t₁, s, t₂}`, which contains the adjacent pair `t₁, s`. So `|M| ≤ 2` and `α = 2`. ∎
**Difference from T3 (iv).** T3 concludes `V = {v₁, s, v₂} ∧ α(G) = 2` under `hyp-tree`, `hyp-alpha`,
`ℓ = 2`, `∃ s, λ(s) = 2`, and reaches `n = 3` by applying
`Connected.induce_compl_singleton_of_degree_eq_one` (`Acyclic.lean:516`) **twice** (Step 4). The
compiled derivation (i) drops `hyp-alpha`, (ii) states only the `α = 2` conclusion and not the vertex
identification, and (iii) replaces the doubly nested `induce` by one adjacency-closure argument —
precisely the synthesis's repair 9. Provenance: **U3**.
**Packaging note.** This declaration carries U3's compiled derivation. It is registered under the name
`…_core` for the reason given at 30; the award-named declaration is 30 and its statement is
byte-identical to this one.

### 28. `R26LA3.no_leafDegree_two_of_eligible` — no `λ = 2` support on the eligible class when `ℓ = 2`

`(hTree : G.IsTree) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1) (hLeafCard : (leafSet G).card = 2) (s : V) : leafDegree G s ≠ 2`

**Hypotheses consumed:** `hyp-tree`, `hyp-eligible`, `ℓ = 2`. **No `hyp-alpha`.**
**Proof.** Suppose `λ(s) = 2`. By 25, `hyp-eligible` forces `α ≥ 3`. By 27, `ℓ = 2` and `λ(s) = 2`
force `α = 2`. `omega` closes the contradiction. ∎
**Role.** This is the `ℓ = 2` step of the candidate finish as `C1-ALLOCATION.md` item 1(f) states it
("`ℓ = 2` (`N_2 = 0` unless `G = P_3`, which `hyp-eligible` excludes via `α ≥ 3`)") — the composition
T3 named in its (iv) coda and U3 left unassembled. **Fence:** the declaration says nothing about `N_2`,
the families, `W_III`, `S`, or (RC); `N_2` is not defined in this project. Provenance: **`C-U3-T`**.

### 29. `R26LA3.card_C2_eq_zero_of_eligible` — `k_2 = 0` on the eligible class when `ℓ = 2`

`(hTree : G.IsTree) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1) (hLeafCard : (leafSet G).card = 2) : (univ.filter (fun s => leafDegree G s = 2)).card = 0`

**Hypotheses consumed:** `hyp-tree`, `hyp-eligible`, `ℓ = 2`.
**Proof.** By 28 the filter predicate is false at every `s`, so the filter is empty
(`Finset.filter_false_of_mem`) and its cardinality is `0`. ∎ Provenance: **`C-U3-T`**.

---

## 4. Terminal declaration

### 30. `R26LA3.leafDegree_two_indepNum_eq_two` — **the terminal `theorem`**

```lean
theorem leafDegree_two_indepNum_eq_two (G : SimpleGraph V) [DecidableRel G.Adj]
    (hTree : G.IsTree) (hLeafCard : (C5LA1.leafSet G).card = 2) {s : V}
    (hDeg2 : C5LA1.leafDegree G s = 2) :
    G.indepNum = 2
```

**Hypotheses:** exactly `hTree`, `hLeafCard`, `hDeg2` — the three hypotheses the contract records.
**Statement.** Byte-identical to U3's compiled `R26U3.leafDegree_two_indepNum_eq_two` (the `P_3`
lemma, item 9 (e)), which the brief names as the deepest tree fact of the award.
**Proof.** Direct application of 27: `leafDegree_two_indepNum_eq_two_core G hTree hLeafCard hDeg2`.
This is **not a second derivation** — it is the award-named presentation of the single carried
derivation.

**Why the split into 27 + 30 (packaging finding, disclosed).** The formalization registrar admits
**exactly one** declaration of kind `theorem` and requires it to be the **last** registered entry;
every earlier entry must be a `definition` or a `lemma`
(`skills/lean-formalization/scripts/prepare_lean_formalization.py`, `KIND_ORDER` and
`register_entry`). But declarations 28 and 29 — which the synthesis names on the face of the award
(`card_C2_eq_zero_of_eligible`) — **consume** the `P_3` fact, so in any topological order they must
appear *after* it, while the brief pins the terminal `theorem` to the name
`R26LA3.leafDegree_two_indepNum_eq_two`. The two constraints cannot both be met by a single
declaration. The award therefore registers the carried U3 derivation as the `lemma`
`…_eq_two_core` (27), lets 28 and 29 consume it, and registers the award-named terminal `theorem`
(30) last, with the statement unchanged and the proof a one-term application. Nothing is weakened,
nothing is derived twice, and every fact the synthesis names is registered.

---

## 5. Declarations deliberately **not** carried, and why

| Declaration | Origin | Reason |
|---|---|---|
| `R26U3.interior_leafDegree_eq_zero` | U3 | Statement **repaired** by the synthesis to the sharp form; re-derived (not carried) as 17 from `C-U3-T`. |
| `R26U3.degree_one_mem_support_eq_endpoint` | U3 | Exists only to serve `connected_induce_compl_pair`; with that dropped it has no consumer in the award. |
| `R26U3.connected_induce_compl_pair` | U3 | Brief §2, binding: "do NOT carry `connected_induce_compl_pair` … as a DAG step". The compiled route to (b) and (e) uses `closed_reachable` instead. |
| `R26CritU3F.isTree_induce_compl_pair` | `C-U3-F` | The corrected `IsTree` form is carried "only if some declaration needs it" (brief §2). No registered declaration needs it. Recorded here so that `C-U3-F`'s correction of U3's "Beyond the six" paragraph is not lost. |
| `R26CritU3F.interior_leafDegree_eq_zero'`, `leaf_leafDegree_eq_zero`, `leaf_not_support`, `leafSet_disjoint_supports`, `mul_card_leafDegree_eq_le`, `two_mul_card_C2_le` | `C-U3-F` | Independent second derivations of facts 17, 20, 18, 19, 23, 24. "ONE derivation of each fact, the compiled one" — `C-U3-T`'s are carried; these are recorded as corroboration. |
| `R26CritU3T.supportSet` filter/image reconciliation | — | Three incompatible spellings of `supportSet` exist across the corpus; this award registers only the image form and uses no equivalence lemma. |
| `C5LA1.support_ne_self`, `C5LA1.sum_card_filter_comm` | C5-LA1 | Named in brief R1 "as needed"; **no registered declaration depends on either**, so neither is registered (nothing is re-stated, and nothing unused is imported). |
| T3 (v) `deletion injection`, T3 (vi) `α = ℓ + a` | T3 | Excluded conclusions for this award: (v) is `C1-LA2`; (vi) is the gate node inside `C1-LA1`. |

---

## 6. Axiom and method policy

Permitted axioms exactly `propext`, `Classical.choice`, `Quot.sound`. No `sorry`, no `admit`, no
`native_decide`, no `axiom`, and no `decide` over an enumeration standing in for a universal step.
Every registered declaration's `#print axioms` output is recorded in
`EVIDENCE/axioms-all-declarations.txt`, written before kernel verification; the kernel receipt's own
`EVIDENCE/axioms.txt` records the terminal declaration's probe. `C4LA1.IsGraphLeaf` depends on no
axioms at all; every other declaration depends on exactly the three permitted axioms.

## 7. Status

This document makes **no** verification claim and **no** claim about (RC), the aggregate `S`, Erdős
#993, TREE, FOREST, `E993-BETA-AGG`, the transport, or the all-rank aggregate. It records the informal
content of a compiled candidate. The award becomes `formally_verified` only when the independent
informal proof-integrity audit, the kernel receipt and the independent formalization-fidelity receipt
all pass under the controller's assignment.
