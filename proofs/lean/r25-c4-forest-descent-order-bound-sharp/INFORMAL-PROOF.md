# Informal proof — `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`

Award group 2, Cycle 4 Stage 7, run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`.
Governing text: `cycles/cycle-4/stage6/SYNTHESIS.md` `## Lean awards`, "Award group 2"
(the statement of record), corroborated by `cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md`
E3 and `## Lean readiness`.

## 1. Definitions (verbatim G1, `SEMANTIC-CONTRACT.md` entries 1–3)

```lean
noncomputable def Erdos993G1.indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)
noncomputable def Erdos993G1.coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0
noncomputable def Erdos993G1.delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k
```

Only these three of the twelve verbatim G1 definitions are used; the theorem needs
no tree/guard/residual machinery. `i_k(F)` denotes `indepCount F k` for `k : ℕ`
(actual independent `k`-subsets, counted once; integer zero extension for
negative indices is irrelevant here since `k ≥ 0` throughout).

## 2. Statement

```lean
theorem forest_descent_order_bound {X : Type u} [Finite X]
    (G : SimpleGraph X) (hG : G.IsAcyclic) (k : ℕ) (hk : 1 ≤ k)
    (hneg : Erdos993G1.delta G (k : ℤ) < 0) :
    Nat.card X ≤ (k + 1) ^ 2
```

Hypotheses are exactly: `X` finite; `G` acyclic (a forest, not required connected,
not required nonempty); `k ≥ 1`; a strict descent at rank `k`
(`delta G k = coeff G (k+1) - coeff G k < 0`).

## 3. Proof architecture

### 3.1 Proof by contradiction, no small-`n` case split needed

We prove the contrapositive form directly: assume for contradiction
`(k+1)^2 < Nat.card X`, i.e. `n := Nat.card X ≥ (k+1)^2 + 1`, and derive
`delta G k ≥ 0`, contradicting `hneg`. Because `(k+1)^2 + 1 > k+1` for every
`k ≥ 0` (indeed `(k+1)^2+1 - (k+1) = k^2+k+1 > 0`), the branch `n < k+1`
described in the Stage 7 brief's proof sketch (where `coeff (k+1) = 0` forces
`Δ_k = -i_k ≤ 0` trivially) never needs to be handled separately: every `n` in
the contradiction hypothesis already satisfies `n ≥ k+1` (in fact `n ≥ 2k+1`,
used below), so the single Bonferroni argument covers the whole regime. This is
a genuine simplification over the brief's two-branch sketch, not a weakening:
the conclusion proved is identical, and the `n < k+1` regime is subsumed for
free because `Nat.card X ≤ (k+1)^2` is trivially true whenever `Nat.card X` is
small (in particular at `n = 0`, the empty forest, where `Nat.card X = 0 ≤
(k+1)^2` holds with no argument at all — this is exactly how condition (ii)'s
vacuous-hypothesis case is discharged: no separate lemma is needed because the
conclusion is trivial there, not because `hneg` is shown false).

### 3.2 Forest edge bound (condition (ii); the only use of acyclicity)

For a finite acyclic graph, `Nat.card G.edgeSet + Nat.card G.ConnectedComponent
= Nat.card X` (edges plus components equals order — sum the tree identity
`|E(component)| + 1 = |V(component)|` over components, itself from
`SimpleGraph.IsTree.card_edgeFinset` applied to each component's induced tree,
`IsAcyclic.isTree_connectedComponent`). When `Nat.card X > 0`, `X` is nonempty
so `Nat.card G.ConnectedComponent ≥ 1`, hence

  `Nat.card G.edgeSet ≤ Nat.card X - 1`.

This reproduces the frozen G1 lemma `forest_card_edges_add_components`
(`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`, entry 58, SHA-256
`aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`); this run
re-proves it byte-for-byte from the same argument (permitted by the Stage 7
protocol and the controller's capsule authorization) rather than importing
across Lean projects. No other forest structure is used anywhere in this proof.

### 3.3 Trivial upper bound

`i_k(G) ≤ C(n,k)`: independent `k`-sets are among all `k`-subsets, so
`(G.indepSetFinset k).card ≤ n.choose k` by `Finset.card_le_card` on the subset
relation `G.indepSetFinset k ⊆ (Finset.univ : Finset X).powersetCard k`.

### 3.4 Level-one Bonferroni union bound (the only non-trivial Lean step)

Every `(k+1)`-subset `S` that is **not** independent contains an edge of `G`
(two of its elements are adjacent). Indexing by `G.edgeFinset` and using
`e.toFinset` (the underlying 2-element `Finset X` of an edge `e : Sym2 X`, since
`G` is loopless so every edge is non-diagonal), the non-independent
`(k+1)`-subsets are covered by

  `⋃_{e ∈ G.edgeFinset} { S ∈ (univ.powersetCard (k+1)) : e.toFinset ⊆ S }`.

For a fixed edge `e = {a,b}`, the fiber `{ S ∈ univ.powersetCard (k+1) : {a,b}
⊆ S }` has **exactly** `C(n-2, (k+1)-2) = C(n-2,k-1)` elements — this is exactly
Mathlib's `Finset.card_filter_powersetCard_subset` applied with the fixed
2-element subset `{a,b}` (an ready-made "`n`-subsets of `t` containing `s`"
formula, no bespoke bijection needed). Summing the fiber bound over
`G.edgeFinset` via `Finset.card_biUnion_le` gives, in the **additive ℕ form**
that avoids truncated subtraction:

  `(univ.powersetCard (k+1)).filter (¬IsIndepSet) |>.card ≤
     Nat.card G.edgeSet * C(n-2,k-1)`.

Splitting `univ.powersetCard (k+1)` into the independent and non-independent
parts (`Finset.card_filter_add_card_filter_not`, exactly as the frozen G1
lemma `card_nonindep_pairs` does for pairs) gives the headline inequality:

  `C(n,k+1) ≤ i_{k+1}(G) + Nat.card G.edgeSet · C(n-2,k-1)`.

Combined with the edge bound (§3.2), for `n ≥ 1`:

  `C(n,k+1) ≤ i_{k+1}(G) + (n-1) · C(n-2,k-1)`.      (★)

### 3.5 Two division-free binomial identities

**Identity 1** (Mathlib `Nat.choose_succ_right_eq`, no proof obligation beyond
citing it): `C(n,k+1)·(k+1) = C(n,k)·(n-k)`.

**Identity 2** (derived from Mathlib's "subset of a subset" identity
`Nat.choose_mul {n k s} (hsk : s ≤ k) : n.choose k * k.choose s = n.choose s *
(n-s).choose (k-s)`, at `s = 2`, `k ↦ k+1`, together with `Nat.choose_succ_right_eq
n 1` and `Nat.choose_succ_right_eq (k+1) 1` to clear the `(k+1).choose 2` and
`n.choose 2` factors in division-free multiplicative form):

  `n.choose(k+1) · (k+1).choose 2 = n.choose 2 · (n-2).choose(k-1)`
  `⟹ (multiplying by 2, substituting n.choose 2 · 2 = n·(n-1) and
      (k+1).choose 2 · 2 = (k+1)·k)`
  `n.choose(k+1) · (k+1) · k = n·(n-1) · (n-2).choose(k-1)`,

which, combined with Identity 1 (`n.choose(k+1)·(k+1) = n.choose k·(n-k)`), gives

  `C(n,k) · k · (n-k) = C(n-2,k-1) · n · (n-1)`.

Both identities are stated and proved exactly as multiplicative equalities of
natural numbers — no division, no real/rational intermediate values.

### 3.6 The quadratic and the closing step

Write `A = C(n,k)`, `B = C(n,k+1)`, `D = C(n-2,k-1)`. The target chain
(§3.1–3.4) reduces, via one ℕ addition-cancellation (no subtraction), to:

  it suffices that `A + (n-1)·D ≤ B`,

because then `i_k(G) ≤ A ≤ B - (n-1)·D ≤ i_{k+1}(G)` (stated additively via
(★) and the cancellation `Nat.add_le_add_iff_right`, never by literal ℕ
subtraction), i.e. `i_k(G) ≤ i_{k+1}(G)`, i.e. `delta G k ≥ 0`.

Using Identity 1 to clear `B` and Identity 2 to clear `D` (multiply the target
by the positive quantity `(k+1)·n` and use `A·(k+1)·n ≥ 0`, cancelling the
common factor `A·(k+1)` when `A > 0`, trivial when `A = 0`), the sufficient
condition `A + (n-1)·D ≤ B` reduces exactly to the quadratic inequality

  `(k+1)·(n + k·(n-k)) ≤ (n-k)·n`,

which (expanding over ℤ, valid since `n ≥ k` in the regime `n ≥ (k+1)^2+1`) is
exactly

  `q(n) := n² − (k²+3k+1)·n + k²(k+1) ≥ 0`.

**Evaluations** (both critics, adjudicator-verified, `E3`):
`q((k+1)²) = -k(k+1) < 0` and `q((k+1)²+1) = 2 > 0`, with the vertex
`(k²+3k+1)/2` strictly left of `(k+1)²+1` (since `k²+k+3 > 0`), so `q` is
strictly increasing on `[(k+1)²+1, ∞)` and `q(n) ≥ q((k+1)²+1) = 2 > 0` for
every integer `n ≥ (k+1)²+1`. The Lean closing step substitutes
`n = (k+1)² + 1 + s` for `s : ℕ` (from the contradiction hypothesis
`(k+1)^2 < n`) and closes the resulting polynomial inequality in `k, s` with
`nlinarith`.

### 3.7 Assembling the terminal theorem

`classical; letI := Fintype.ofFinite X` (the bridge used by the earlier G1
awards) supplies the `Fintype`/`DecidableEq`/`DecidableRel` instances needed
for `Finset`-level reasoning about `X`. `by_contra` on `Nat.card X ≤ (k+1)^2`,
apply §3.2–3.6 to derive `i_k(G) ≤ i_{k+1}(G)`, convert to
`delta G (k:ℤ) ≥ 0` via `coeff_nat`/`delta_nat` (cast lemmas relating `coeff`,
`delta` at natural-number indices to `indepCount`), contradicting `hneg`.

## 4. Attribution (condition (i))

The `k²+3k` form of the order bound is seat T4's (`cycles/cycle-4/stage3/returns/T4/RETURN.md`
§4, "Order Bound Lemma"). The **sharp** `(k+1)²` form submitted here is
CRITIC-ATTRIBUTED jointly to C-T4-F (`cycles/cycle-4/stage4/critics/T4/F/CRITIQUE.md`,
finding 1, `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`) and C-T4-U
(`cycles/cycle-4/stage4/critics/T4/U/CRITIQUE.md` §4, "Sharp Order Bound
(C-T4-U)"), who derived the exact closed form `n ≤ (k+1)²` independently of
each other from the same union-bound method; adjudicator-verified
(`cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md` E3, ruling (a)). This
Lean proof re-derives the sharp form directly (it does not merely cite the
critics' arithmetic) using the division-free identities of §3.5, per the
Stage 7 brief's instruction to re-derive the exact quadratic rather than trust
the record.

## 5. Scope exclusions (mandatory fences, brief §2)

This theorem makes **no** tightness claim beyond `k = 1` (true maxima are
`4, 8, 11, 15` at `k = 1..4`; the word "TIGHT" is not used). It states **no**
linear ceiling. It is **not** a no-recovery statement (it says nothing about
`x(G)`, `firstDescent`, or any later rank) and implies none. It makes **no**
transfer to Tier 1 (`E993-R25-UNR-FOREST-WIDE`), the `K₁`-addition target
(`T-C4-04`), NR1, FOREST, TREE, TRANSFER, or Erdős #993. The `x ≤ 4` rank
closure (`E6`/`E993-R25-FOREST-DESCENT-ORDER-BOUND-RANK-4`, which carries an
undischarged external dependency — Hunter's spanning-tree inequality, cited
but not proved in the record) is **not** bundled with this theorem in any way;
this proof depends on nothing from that closure. This theorem is submitted in
the **sharp** `(k+1)²` form as the terminal declaration; the `k²+3k` form is
not registered as a separate corollary lemma in this run (not required by the
brief; only the sharp form is mandatory).

## 6. Dependency closure

`Mathlib` (binomial algebra: `Nat.choose_succ_right_eq`, `Nat.choose_mul`,
`Nat.choose_one_right`, `Finset.card_filter_powersetCard_subset`,
`Finset.card_biUnion_le`, `Finset.card_filter_add_card_filter_not`,
`Sym2.toFinset_mk_eq`, `Sym2.card_toFinset_of_not_isDiag`,
`SimpleGraph.not_isDiag_of_mem_edgeSet`, `SimpleGraph.isIndepSet_iff`,
`SimpleGraph.IsAcyclic.isTree_connectedComponent`,
`SimpleGraph.IsTree.card_edgeFinset`) plus the three verbatim G1 definitions
(§1) plus elementary re-derivations of the forest edge bound and the
level-one Bonferroni bound (both closed, elementary, nothing
registered-but-unformalised, per the synthesis's own materiality judgment for
this award group). No registered-but-unformalised claim, no matching/cover
machinery, no G1 tuple/guard machinery, and no prior Lean award is a
dependency of this theorem.
