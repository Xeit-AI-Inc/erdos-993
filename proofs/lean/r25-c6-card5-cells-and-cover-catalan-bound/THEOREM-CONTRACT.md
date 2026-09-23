# Theorem Contract: Card-5 joint-budget cells (five fixed cells) and the card-5 cover_catalan_bound (parameterized)

- Contract ID: `c6-la5-c6-card5-cells-and-cover-catalan-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `658583ce129ea0edf532b46662f48e199f06cf4ab06a1d613a47df127bf90642`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

TWO award statements bound as one terminal conjunction. (a) FIXED-CELL, five theorems Erdos993G1.ThirdWide.cell_9/11/13/15/17: for an acyclic SimpleGraph F on Fintype.card X = 2k+7 vertices (k=1..5, orders 9,11,13,15,17) with a vertex cover C0 of cardinality <= 5 (tau(F) <= 5), t_k <= delta F k with t = 9,5,9,21,42. Not uniform in d, in the order, or in r; the Lean formalisation, at these five ranks, of the registered VERIFIED E993-R25-CARD5-JOINT-BUDGET-CELLS (a grade change, not a new claim; proved_informal -> formally_verified). ALIAS IN FULL: also names E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY (OPEN, the uniform-in-d schema of which these cells are d=5 instances) and E993-GRAPH-VERTEX-COVER-DELTA-PARTITION (the cover-fiber partition the whole assembly rests on). MANDATORY: cell_9's registered content is already frozen ENTRY 175 (forest_delta_one_pos) more generally -- delivered novelty is FOUR cells, not five; the cover hypothesis is VACUOUS at orders 9 and 11 (tau <= floor(n/2) for any forest by Koenig) and cover-essential only at 15 and 17. Does NOT discharge E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST (each cell proves one rank k=r-1; that claim asks for every k<r). Far from sharp at four of five cells (true minima 19/39/56/56/43); the population at order 13 is 3,073 (tau<=5), not 3,658 (the total order-13 forest class count). (b) PARAMETERIZED in (n,k), Erdos993G1.ThirdWide.cover_catalan_bound_five, taking the controller-assigned NEW KEY E993-R25-CARD5-COVER-CATALAN-BOUND: for ANY SimpleGraph F (no acyclicity hypothesis) with a card-5 vertex cover C and Fintype.card X = n+5, n.choose(k+1) - n.choose k - 5*Cat(k-1) - 10*Cat(k-2) - 10*Cat(k-3) - 5*Cat(k-4) - Cat(k-5) <= delta F k (Cat = Mathlib's catalan, each term guarded by an if-k-large-enough zero extension). Unconditional (no hfloor hypothesis); this is the object of record per the U adjudication (C-U3-F's form, not C-U3-T's conditional form). catalan_gap5_pos / catalan_gap_five_pos (Gamma(5,k) > 0 for k>=6) is an instance of the already formally verified E993-R25-CATALAN-GAP-MONOTONE-RATIO at tau=5 and is explicitly NOT registered as new by this contract. x(F) < r is never a hypothesis anywhere in this group; the group is never c(d)=min(d,5) and never a tier statement. Frozen line spans (verified against sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean before this text was written): ENTRY 174 (cover_singleton_available) spans frozen lines 3743-3765; ENTRY 178 (cover_available_empty) spans frozen lines 3844-3861.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.ThirdWide.card5_cells_and_cover_catalan_award`
- Statement SHA-256: `cee46ec8164f9bda5912ab51b66f0568e1844e2c40ee97631d2d996e596f09ff`

```lean
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 9 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (9 : ℤ) ≤ delta F 1) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 11 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (5 : ℤ) ≤ delta F 2) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 13 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (9 : ℤ) ≤ delta F 3) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 15 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (21 : ℤ) ≤ delta F 4) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj],
        F.IsAcyclic → Fintype.card X = 17 → ∀ (C0 : Finset X), C0.card ≤ 5 →
        (∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) → (42 : ℤ) ≤ delta F 5) ∧
    (∀ {X : Type u} [Fintype X] [DecidableEq X] (F : SimpleGraph X) [DecidableRel F.Adj]
        (C : Finset X), C.card = 5 → (∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C) →
        ∀ n k : ℕ, Fintype.card X = n + 5 →
        (n.choose (k+1) : ℤ) - n.choose k - 5*(if 1 ≤ k then (catalan (k-1) : ℤ) else 0)
          - 10*(if 2 ≤ k then (catalan (k-2) : ℤ) else 0) - 10*(if 3 ≤ k then (catalan (k-3) : ℤ) else 0)
          - 5*(if 4 ≤ k then (catalan (k-4) : ℤ) else 0) - (if 5 ≤ k then (catalan (k-5) : ℤ) else 0)
          ≤ delta F (k : ℤ))
```

## Quantifiers

- `forall X` over `domain-x`
- `forall F` over `domain-x`
- `forall C0_or_C` over `domain-x`
- `forall n` over `domain-order`
- `forall k` over `domain-k`

## Hypotheses

- `hyp-acyclic-a`: F.IsAcyclic -- statement (a) only, at exactly one point in the whole DAG (budget_bound). Statement (b) carries NO acyclicity hypothesis.
- `hyp-order`: Fintype.card X = 9/11/13/15/17 (statement a, one numeral per cell) or Fintype.card X = n+5 (statement b).
- `hyp-cover`: A vertex cover of cardinality <= 5 (statement a, padded internally to exactly 5 by exists_card_five_cover) or of cardinality exactly 5 (statement b): tau(F) <= 5.
- `hyp-rank`: k a fixed literal 1..5 (statement a) or an arbitrary Nat (statement b).

## Conclusion

- `conclusion`: card5_cells_and_cover_catalan_award: the six-way conjunction of cell_9, cell_11, cell_13, cell_15, cell_17 and cover_catalan_bound_five, exactly as stated in lean_binding.expected_statement.

## Dependencies

- `def-binomcoeff` -> `def-fsingleton`
- `def-catalan` -> `conclusion`
- `def-coeff` -> `def-delta`
- `def-delta` -> `conclusion`
- `def-fsingleton` -> `conclusion`
- `def-indepcount` -> `def-coeff`
- `domain-k` -> `conclusion`
- `domain-k` -> `hyp-rank`
- `domain-order` -> `conclusion`
- `domain-order` -> `hyp-order`
- `domain-x` -> `conclusion`
- `domain-x` -> `domain-order`
- `domain-x` -> `hyp-acyclic-a`
- `domain-x` -> `hyp-cover`
- `hyp-acyclic-a` -> `conclusion`
- `hyp-cover` -> `conclusion`
- `hyp-order` -> `conclusion`
- `hyp-rank` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-adjudication`: `EVIDENCE/originating-sources/cycle6-u-adjudication.md` (match)
- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-critic-u3f`: `EVIDENCE/originating-sources/critic-u3f.lean` (match)
- `source-critic-u3f-cover`: `EVIDENCE/originating-sources/critic-u3f-cover.lean` (match)
- `source-frozen-g1`: `EVIDENCE/originating-sources/frozen-g1-thirdwide-main.lean` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-seat-u3-main`: `EVIDENCE/originating-sources/seat-u3-main.lean` (match)
- `source-seat-u3-transcribed`: `EVIDENCE/originating-sources/seat-u3-transcribed.lean` (match)
- `source-seat-u3-transcribed2`: `EVIDENCE/originating-sources/seat-u3-transcribed2.lean` (match)
- `source-synthesis`: `EVIDENCE/originating-sources/cycle6-synthesis.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
