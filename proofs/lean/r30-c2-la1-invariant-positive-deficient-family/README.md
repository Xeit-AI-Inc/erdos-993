# r30-c2-la1-invariant-positive-deficient-family

Declaration `E993Transport.exists_aut_invariant_deficient_of_not_weightedHall`, exported byte-for-byte from the sealed internal run `erdos-993-weighted-transport-dre-2026-09-26` (`runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family`; r30 — see
[`experiments/r30-weighted-transport.md`](../../../experiments/r30-weighted-transport.md)). Award `C2-LA1`; registry effect `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem exists_aut_invariant_deficient_of_not_weightedHall {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (h : ¬ WeightedHall G (favorableLeaves G p) p) :
    ∃ X ⊆ indepFamily G (p + 1),
      (∀ γ : G ≃g G, famMap G γ X = X) ∧
      (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
      ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
          activeWeight G (favorableLeaves G p) A <
        ∑ B ∈ X, activeWeight G (favorableLeaves G p) B
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport. For every finite type V with decidable equality, every simple graph G on V with decidable adjacency, and every p in N, let F = favorableLeaves G p (the fixed strict selector F_p(G)). If WeightedHall G F p fails, then there is a family X of independent (p+1)-sets (X a subset of I_(p+1)(G)) such that (i) famMap G gamma X = X for every graph automorphism gamma : G ≃g G, where famMap G gamma X is the image under gamma of each member set of X; (ii) every member B of X has active weight activeWeight G F B > 0 (active tags: v in F intersect B with (B minus {v}) meeting W_v); and (iii) the total active weight of the targets N(X) = {A in I_p(G) : some B in X has transportRel G B A}, under exactly (D) union (S), is strictly less than the total active weight of X. The witness is X_min, the least maximizer of phi = supply - cov. Graph-generic; hypotheses are finiteness and decidability only (no IsTree, no eligibility, no p >= 1). Companions on the face (weightedHall_iff_invariant, weightedHall_iff_phi_nonpos, favorableLeaves_map_aut, activeWeight_map_aut, transportRel_map_aut, phi_supermodular, canonMin_isMaximizer, canonMin_famMap, canonMin_pos, filter_eq_covered) are lemmas with no certificate of their own.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
active-tag transport network on finite simple graphs or on the named tree family; nothing about (HALL) at full scope, the lower-region
aggregate beyond the named family, `E993-BETA-AGG`, no-recovery, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
