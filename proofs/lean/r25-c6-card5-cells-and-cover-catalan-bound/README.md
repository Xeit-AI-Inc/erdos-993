# r25-c6-card5-cells-and-cover-catalan-bound

Declaration `Erdos993G1.ThirdWide.card5_cells_and_cover_catalan_award`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-22-c6-card5-cells-and-cover-catalan-repair-1`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 6 award `C6-LA5`; registry identities `E993-R25-CARD5-JOINT-BUDGET-CELLS`, `E993-R25-CARD5-COVER-CATALAN-BOUND`.

Statement (the contract's `expected_statement`, namespace-relative):

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

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> TWO award statements bound as one terminal conjunction. (a) FIXED-CELL, five theorems Erdos993G1.ThirdWide.cell_9/11/13/15/17: for an acyclic SimpleGraph F on Fintype.card X = 2k+7 vertices (k=1..5, orders 9,11,13,15,17) with a vertex cover C0 of cardinality <= 5 (tau(F) <= 5), t_k <= delta F k with t = 9,5,9,21,42. Not uniform in d, in the order, or in r; the Lean formalisation, at these five ranks, of the registered VERIFIED E993-R25-CARD5-JOINT-BUDGET-CELLS (a grade change, not a new claim; proved_informal -> formally_verified). ALIAS IN FULL: also names E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY (OPEN, the uniform-in-d schema of which these cells are d=5 instances) and E993-GRAPH-VERTEX-COVER-DELTA-PARTITION (the cover-fiber partition the whole assembly rests on). MANDATORY: cell_9's registered content is already frozen ENTRY 175 (forest_delta_one_pos) more generally -- delivered novelty is FOUR cells, not five; the cover hypothesis is VACUOUS at orders 9 and 11 (tau <= floor(n/2) for any forest by Koenig) and cover-essential only at 15 and 17. Does NOT discharge E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST (each cell proves one rank k=r-1; that claim asks for every k<r). Far from sharp at four of five cells (true minima 19/39/56/56/43); the population at order 13 is 3,073 (tau<=5), not 3,658 (the total order-13 forest class count). (b) PARAMETERIZED in (n,k), Erdos993G1.ThirdWide.cover_catalan_bound_five, taking the controller-assigned NEW KEY E993-R25-CARD5-COVER-CATALAN-BOUND: for ANY SimpleGraph F (no acyclicity hypothesis) with a card-5 vertex cover C and Fintype.card X = n+5, n.choose(k+1) - n.choose k - 5*Cat(k-1) - 10*Cat(k-2) - 10*Cat(k-3) - 5*Cat(k-4) - Cat(k-5) <= delta F k (Cat = Mathlib's catalan, each term guarded by an if-k-large-enough zero extension). Unconditional (no hfloor hypothesis); this is the object of record per the U adjudication (C-U3-F's form, not C-U3-T's conditional form). catalan_gap5_pos / catalan_gap_five_pos (Gamma(5,k) > 0 for k>=6) is an instance of the already formally verified E993-R25-CATALAN-GAP-MONOTONE-RATIO at tau=5 and is explicitly NOT registered as new by this contract. x(F) < r is never a hypothesis anywhere in this group; the group is never c(d)=min(d,5) and never a tier statement. Frozen line spans (verified against sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean before this text was written): ENTRY 174 (cover_singleton_available) spans frozen lines 3743-3765; ENTRY 178 (cover_available_empty) spans frozen lines 3844-3861.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`
(pinned in `source/lakefile.toml` and `source/lake-manifest.json`; the package cache is not
shipped — bind a local Mathlib checkout at that revision, never `lake update`). Axioms
exactly `[propext, Classical.choice, Quot.sound]`; no `sorry`/`admit`/`native_decide`.
Governed workflow: frozen theorem contract (`THEOREM-CONTRACT.yaml`, rendered
`THEOREM-CONTRACT.md`), independent informal proof-integrity audit (`INFORMAL-AUDIT.md`; the
formalizer's `INFORMAL-PROOF.md`), kernel/axiom receipt and independent statement-fidelity
attestation (`FIDELITY-REVIEW.md`, verdict `passed`), canonical close
(`VERIFICATION-REPORT.md`, `formally_verified`). Digests and verdicts are in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal
grade `formally_verified`; published as `verified`. Claim boundary: Lean kernel validity plus
independent statement fidelity — nothing about Tier 1, Tier 2, any Tier 3 schema, FOREST,
TREE, TRANSFER, or Erdős #993.
