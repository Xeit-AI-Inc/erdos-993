# C1-LA2 (r31): the CB(8,m) definition layer. Informal proof at statement level

Canonical run id: `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Award: C1-LA2, a bounded attempt funded by the admitted
Cycle 1 synthesis (`cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards`, "### C1-LA2 (r31) — CB(8,m) definition layer"; this
is the U adjudicator's AG-U-A). Governed run: `runs/lean-2026-09-28-c1-la2-cb8-definition-layer/`. Producer:
`c1-la2-formalizer-opus-20260928`. Model disclosure (two-part): chartered Claude Opus 5.5, effort high (dispatch-record
authority); runtime-reported model id `claude-opus-5-5`.

**Status of this text.** It explains the Lean declarations in `LeanProject/LeanProof/Main.lean`. It asserts no grade. A compiled
declaration has no grade until the governed award closes (SOLUTION-CONTRACT §4), and a companion lemma on this face carries no
certificate of its own.

## Attribution (on the face)

This is the synthesis section's "Attribution" list, verbatim, plus the formalizer:

- structural content: r30's CB record (`R30-CB-RECORD`) and its seats;
- Lean layer: r31 U1;
- leaf-card and terminal reduction: C-U1-T;
- interface lemmas: C-U1-F;
- the integration check: the U adjudicator;
- the network definitions: r30 awards;
- Lean text of record for this award, assembly, registration and verification: the formalizer `c1-la2-formalizer-opus-20260928`
  (Claude Opus 5.5).

## Fences and excluded conclusions (on the face)

- **Structural facts only.** The layer makes no rank claim beyond the low window `3p* < 2α+1`. It claims no (HALL), no
  favorability and no descent.
- **Excluded conclusions.** Everything beyond the listed structural facts. In particular, nothing here asserts conjunct 2
  (`C5LA1.crossingIndex (cbGraph m) + 2 ≤ p*`, the descent/eligibility part) or conjunct 4 (a saturating flow for
  `favorableLeaves (cbGraph m) p*` at `p*`) of the SOLUTION-CONTRACT §2 terminal. Both enter the terminal only as hypotheses
  `hE` and `hH`.
- Nothing is claimed for Tier 1, (HALL) at any scope, the favorability key, E1, the parent descent (ELIG-top)(a), any aggregate,
  TREE, FOREST, TRANSFER or Erdős #993.
- **Tier 2 progress? No.** This is infrastructure that later formal awards consume. It proves no Tier 2 lemma and is not counted
  as material progress.
- `favorableLeaves_eq_leafSet_of_all` is a graph-generic interface. It turns the hypothesis "every leaf is favorable at `p`" into
  `favorableLeaves G p = leafSet G`. It does not prove favorability for CB or for any graph.

## Objects (carried definitions of record, and the NEW CB layer)

**Carried, byte-identical** (r30 C6-LA2 `Snippets/`, bound to that award's kernel receipt; see `CAPSULE-VERIFICATION.json`):
entries 1–21, which are identical to r30 C1-LA1's, then 0035 `C5LA1.crossingIndex`, 0123 `support_eq_of_isGraphLeaf_of_adj` and
0124 `mem_tagWitnesses_iff_of_adj`. The carried definitions this layer reads are the following.
- `C4LA1.IsGraphLeaf G v := ∃! u, G.Adj v u`.
- `C5LA1.support G v` is the unique neighbour of a leaf, chosen by `Classical.choose`.
- `C5LA1.leafSet G := univ.filter IsGraphLeaf`.
- `tagWitnesses G v := (neighborFinset (support G v)).erase v`, which is `W_v = N(s_v) ∖ {v}`.
- `favorableLeaves G p := (leafSet G).filter (IsFavorableAt G · p)`.
- `IsSaturatingFlow` and `C5LA1.crossingIndex`, both unchanged.
- The carried lemmas: 0123 says that the support of a leaf `v` adjacent to `s` is `s`. 0124 says that
  `w ∈ W_v ↔ w ≠ v ∧ Adj s w` at such a leaf.

**NEW (the CB(8,m) layer; frozen labelling).** Vertices are `Fin (17m+3)`. The labels are `0 = r`, `1 = s`, `2 = v`, and for
`i < m`, `j < 8`: `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`.
- `cbEdge m u v` is the directed relation with the following pairs: `(0,1)`, `(1,2)`, `(0, 3+17i)`, `(3+17i, 3+17i+1+2j)` and
  `(3+17i+1+2j, 3+17i+2+2j)`, for `i < m` and `j < 8`.
- `cbGraph m := SimpleGraph.fromRel (cbEdge m)`, the symmetrized relation with the diagonal removed.
- `cbGraph_decAdj` is a computable `@[reducible, instance]` decision procedure (bounded `∃ i < m`, `∃ j < 8`).
- `cbVertex m n := ⟨n % (17m+3), _⟩`.
- The helper definitions `cbParentVal`, `cbParent`, `cbChildEdge` and `cbLowerWitness`.

This is `CB(8,m)` of SEMANTIC-CONTRACT §2: the path `r–s–v`, `m` chokes on `r`, 8 supports on each choke, and one private leaf on
each support. `n = 3 + m(2·8+1) = 17m+3`.

## The DAG (statement level), following the synthesis

Node groups: (A) labels and adjacency, (B) tree, (C) leaves, (D) independence number, (E) witness sets, (F) low window,
(G) leaf count, (H) interfaces, (T) terminal. Every step below is a universal statement in the variables `m, i, j, n, w, τ, S`.
No enumeration stands in for a universal step. The finite case splits are over the six label shapes, `j < 8` and parity. Each
case is proved by `omega` on linear ℕ facts with the variables kept symbolic.

### (A) Labels and adjacency

- **A1 `cbVertex_val`.** If `n < 17m+3` then `(cbVertex m n).val = n` (`Nat.mod_eq_of_lt`).
- **A2 `eq_cbVertex_iff`.** Under the same bound, `v = cbVertex m n ↔ v.val = n`.
- **A3 `cbGraph_adj_iff` / `cbGraph_adj_iff_val`.** `Adj u v ↔ cbEdge m u v ∨ cbEdge m v u`. The diagonal clause of `fromRel` is
  redundant: every `cbEdge` pair has distinct labels, and in each of the 5 shapes the right label exceeds the left one.
- **A4 (named edges).** `cbGraph_adj_r_s`, `_s_v`, `_r_choke`, `_choke_support` and `_support_leaf` follow from A1 and A3. Each
  label is `< 17m+3` because `i < m` and `j < 8`, for example `3+17i+2+2j ≤ 17(m−1)+19 = 17m+2`.
- **`cbGraph_adj_of_val`** is the one-directional form of A3.

### (B) Tree: `cbGraph_isTree (m) : (cbGraph m).IsTree`

- **B1 `cb_val_cases` / reachability case split.** Every label `n < 17m+3` is exactly one of the following: `0`, `1`, `2`,
  `3+17i`, `3+17i+1+2j` or `3+17i+2+2j` (`i < m`, `j < 8`). Take `n ≥ 3`, `i = (n−3)/17` and `q = (n−3)%17`. Then `q = 0`, or
  `q = 1+2j` with `q` odd, or `q = 2+2j` with `q` even and `q ≥ 2`.
- **B2 `cbGraph_reachable_zero`, `cbGraph_connected`.** Every vertex is reached from `r` by a path of length at most 3 along the
  A4 edges, so the graph is connected.
- **B3 parent map.** `cbParentVal n` returns the following: `0` for `n = 1`; `1` for `n = 2`; `0` for a choke; `3+17i` for a
  support; `3+17i+1+2j` for a private leaf.
  - `cbParentVal_lt`: `cbParentVal n < n` for `n ≥ 1`.
  - `cbParentVal_at_*`: the parent at each label shape.
  - `cbGraph_adj_parent`: every non-root vertex is adjacent to its parent.
- **B4 edge bijection.** `cbChildEdge` sends a non-root `v` to `s(v, parent v)`.
  - It is injective (`cbChildEdge_injective`). If `s(v, p v) = s(w, p w)` with `v ≠ w`, then `v = p w` and `w = p v`. This gives
    `v < w < v`, which is impossible.
  - Its range is exactly the edge set (`cbChildEdge_range`). Every `cbEdge a b` has `b ≠ 0` and `parent b = a`, checked shape by
    shape through B3.
- **B5 counting.** `cbGraph_card_nonroot` gives `#{v : v ≠ 0} + 1 = 17m+3`. So `|E| = |V| − 1`, and with B2,
  `isTree_iff_connected_and_card` gives the tree.

### (C) Leaves: `mem_leafSet_cbGraph_iff (m) (hm : 0 < m) (τ)`

`τ ∈ leafSet(cbGraph m) ↔ τ.val = 2 ∨ ∃ i < m, ∃ j < 8, τ.val = 3+17i+2+2j`, that is, `leafSet = {v} ∪ C`.
- (⇒) `cb_leaf_cases`: a leaf has a unique neighbour. Each of the other shapes has two neighbours with distinct labels:
  - `r` has `s` and `u_0`, which exists because `0 < m`; this is where `hm` is used;
  - `s` has `r` and `v`;
  - `u_i` has `r` and `b_{i0}`;
  - `b_ij` has `u_i` and `c_ij`.
- (⇐) `cb_isGraphLeaf_of_cases`: every neighbour of `v` is `s`, and every neighbour of `c_ij` is `b_ij`. This follows by
  unfolding `cbEdge` in both orientations; each alternative either contradicts the label or forces the neighbour's label.
- For `m = 0`, `r` is a leaf, so the hypothesis `0 < m` is necessary for the statement as written.

### (D) Independence number: `cbGraph_indepNum_eq (m) (hm : 0 < m) : (cbGraph m).indepNum = 9m+1`

- **D1 lower bound (`cbGraph_indepNum_ge`, valid for every `m`).** Let `cbLowerWitness m = {s} ∪ {u_i} ∪ {c_ij}`.
  - `mem_cbLowerWitness_iff` characterizes its members.
  - `cbLowerWitness_card = 9m+1` because the three parts are pairwise disjoint and each image map is injective on labels.
  - `cbLowerWitness_isIndepSet`: no `cbEdge` pair lies inside it. The case split is 3×3 membership shapes by 10 edge
    alternatives, all by `omega`.
- **D2 upper bound (`cbGraph_indepNum_le`, uses `0 < m`).** Split an independent `S` into three parts:
  - `SA = S ∩ ({r} ∪ {u_i})`: `|SA| ≤ m`. If `r ∈ S`, then `SA ⊆ {r}`, so `|SA| ≤ 1 ≤ m` (this uses `hm`). Otherwise
    `SA ⊆ {u_i}`, so `|SA| ≤ m`.
  - `SB = S ∩ {s, v}`: `|SB| ≤ 1`, because `s ~ v`.
  - `SC = S ∩ {b_ij, c_ij}`: `|SC| ≤ 8m`. The map `x ↦ ((x−3)/17, ((x−3)%17 − 1)/2)` sends both `b_ij` and `c_ij` to `(i, j)`.
    It is injective on `SC` because `b_ij ~ c_ij`, and it lands in `range m × range 8`.
  - B1 shows the three parts cover `S`, so `|S| ≤ m + 1 + 8m = 9m+1`.
- **D3.** `indepNum` is attained by some `S` (`exists_isNIndepSet_indepNum`), and antisymmetry with D1 gives equality. This
  agrees with SEMANTIC-CONTRACT §2: `α(CB(d,m)) = m(d+1)+1` at `d = 8`.

### (E) Witness sets

- **E1 `mem_cb_tagWitnesses_v_iff (m) (w)`.** `w ∈ tagWitnesses(cbGraph m)(v) ↔ w.val = 0`, that is, `W_v = {r}`.
  - `v` is a leaf with neighbour `s` (C and A4). The carried 0124 turns membership into `w ≠ v ∧ Adj s w`.
  - Unfolding `cbEdge` at `s = 1`, the neighbours of `s` are `r` (label 0) and `v` (label 2). Removing `v` leaves `r`.
  - The unused binder `hm` of the seat's version is dropped, per the synthesis and the U adjudicator's precondition. The proof
    never used it: `v` is a leaf for every `m`.
- **E2 `mem_cb_tagWitnesses_leaf_iff (m i j) (hi : i < m) (hj : j < 8) (w)`.** `w ∈ W_{c_ij} ↔ w.val = 3+17i`, that is,
  `W_{c_ij} = {u_i}`. `c_ij` is a leaf with neighbour `b_ij`. The neighbours of `b_ij` are `u_i` and `c_ij`, and removing `c_ij`
  leaves `u_i`. The index arithmetic is linear: a neighbour label `3+17i'+1+2j'`, `3+17i'` or `3+17i'+2+2j'` equal to
  `3+17i+1+2j` forces `i' = i`, `j' = j` because every offset is `< 17`.

### (F) Low window: `cb_lowWindow (m) (hm : 0 < m) : 3 * ((16m+4)/3) < 2 * (cbGraph m).indepNum + 1`

By D3, the right side is `2(9m+1)+1 = 18m+3`. ℕ floor division gives `3·⌊(16m+4)/3⌋ ≤ 16m+4`, and `16m+4 < 18m+3 ⟺ 1 < 2m ⟺ m ≥ 1`.
No residue hypothesis is needed. This is the only rank-shaped statement of the layer, and it is exactly the low window
`3p* < 2α+1`.

### (G) Leaf count: `cb_leafSet_card (m) (hm : 0 < m) : (C5LA1.leafSet (cbGraph m)).card = 8m+1`

- `cb_leafSet_eq_image` rewrites `leafSet` as `insert v (image (i,j) ↦ c_ij over range m × range 8)`, using C.
- `v ∉` the image, because label 2 is not of the form `3+17i+2+2j ≥ 5`.
- The image map is injective on `range m × range 8`: from `17a₁+2a₂ = 17b₁+2b₂` with `a₂, b₂ < 8` we get `2|a₂−b₂| < 17`, so
  `a₁ = b₁` and `a₂ = b₂` (`omega`).
- So the card is `1 + 8m`.

### (H) Interfaces

- **H1 `favorableLeaves_eq_leafSet_of_all` (graph-generic).** If every `v ∈ leafSet G` satisfies `IsFavorableAt G v p`, then
  `favorableLeaves G p = leafSet G` (`Finset.filter_true_of_mem`). It is conditional on its hypothesis and claims no
  favorability.
- **H2 `mem_neighborFinset_choke_iff (m i) (hi : i < m) (w)`.** `N(u_i) = {r} ∪ {b_ij : j < 8}`, by unfolding `cbEdge` at label
  `3+17i`.
- **H3 `mem_neighborFinset_root_iff (m) (w)`.** `N(r) = {s} ∪ {u_i : i < m}`.
- **H4 `choke_degree (m i) (hi : i < m)`.** `deg u_i = 9`. By H2, `N(u_i) = insert r (image j ↦ b_ij over range 8)`, the image
  map is injective, and `r` is not in the image. So the degree is `1 + 8`.

### (T) Terminal: `E993Transport.cb8_topRank_of_descent_and_flow`

Exact statement (namespace-relative, from `theorem` up to but excluding ` :=`):

```lean
theorem cb8_topRank_of_descent_and_flow (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)
    (hE : C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3)
    (hH : ∃ f, IsSaturatingFlow (cbGraph m)
      (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f) :
    (cbGraph m).IsTree ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f
```

**Meaning.** The conclusion is the SOLUTION-CONTRACT §2 terminal's four-conjunct body verbatim, over the carried definitions and
`cbGraph`. The theorem reduces that terminal to its conjuncts 2 (`hE`) and 4 (`hH`):
- conjunct 1 is discharged by `cbGraph_isTree m`;
- conjunct 3 is discharged by `cb_lowWindow m (by omega)`, since `107 ≤ m` implies `0 < m`;
- conjuncts 2 and 4 are returned from the hypotheses unchanged.

The terminal does **not** assert conjunct 2 or conjunct 4. `hres` is carried to keep the class shape of the §2 terminal. The
proof does not use it. The residue enters nothing in this layer.

## Audit of ℕ subtraction, division and casts

- **Every label is a natural number,** with no casts. The only cast-bearing objects are the carried `forwardDifferenceDel`
  (ℤ-valued) inside `C5LA1.crossingIndex`. The terminal mentions them only through the hypothesis `hE`, verbatim, and does not
  reason about them.
- **`n − 3` (B1, B3, D2) is taken only when `n ≥ 3`.** B1 covers the case `¬ n ≤ 2`. In B3, the `n = 1` and `n = 2` branches come
  first, and `cbParentVal_lt` requires `n ≥ 1`. In D2, `n ≥ 3` holds on `SC` by the membership shape. At `n = 0`, `cbParentVal 0`
  is defined (truncation gives `0`) but is never used: the root is excluded from `cbChildEdge` by `v.val ≠ 0`.
- **`q − 1` and `q − 2` for `q = (n−3)%17` are exact.** B1 takes `q − 1` only for odd `q ≥ 1` and `q − 2` only for even
  `q ≠ 0`, so `q ≥ 2`. In `cbParentVal`, the last branch is reached only when `q ≠ 0` and `q` is even. In D2, the injection uses
  `(q − 1)/2` with `q ∈ {1+2j, 2+2j}`, so `q ≥ 1`.
- **`i = (n−3)/17 < m` follows from `n < 17m+3`.** `j ≤ 7` follows from `q ≤ 16`.
- **Division.** `(16m+4)/3` is ℕ floor division. `3·⌊x/3⌋ ≤ x` is the only property used (F). Exactness when `m ≡ 2 (mod 3)`
  (SEMANTIC-CONTRACT §2) is **not** used, and not claimed.
- **Labels are in range.** `cbVertex m n` is `n % (17m+3)`. Every lemma that reads a label back through A1 first proves
  `n < 17m+3` from `i < m` and `j < 8`.

## Verification pointers

- The source is `LeanProject/LeanProof/Main.lean`, with 78 registered entries: 24 carried and 54 new.
- `EVIDENCE/axioms-all-declarations.txt` gives `#print axioms` for every entry, fully qualified. Every one is within `propext`,
  `Classical.choice`, `Quot.sound`.
- The kernel receipt is `RECEIPTS/kernel-verification.json`.
- Python and scratch instruments are checks, never proof.
