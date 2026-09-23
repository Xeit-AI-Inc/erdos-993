# Theorem Contract: Forest descent order bound, sharp (k+1)^2 form

- Contract ID: `c4-la2-forest-descent-order-bound-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `abcb0e4384a4f78345d2c67c60f72a25cbebccd767b550091bbeb0c298487e10`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite acyclic simple graph G on a finite vertex type X and every integer k >= 1: if Erdos993G1.delta G k < 0 (a strict descent in the independent-set-count sequence at rank k, verbatim G1 definitions) then Nat.card X <= (k+1)^2. Uniform in k and in G (any forest, connected or not, including the empty forest); no tightness claim beyond k=1; not a no-recovery statement; no transfer to Tier 1, NR1, FOREST, TREE, TRANSFER or Erdos #993.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.ForestOrderBound.forest_descent_order_bound`
- Statement SHA-256: `bca81d5c08164f14197f86498d2c3dcccd426a6222a3366bfeb695d71f4022d7`

```lean
theorem forest_descent_order_bound {X : Type u} [Finite X]
    (G : SimpleGraph X) (hG : G.IsAcyclic) (k : ℕ) (hk : 1 ≤ k)
    (hneg : Erdos993G1.delta G (k : ℤ) < 0) :
    Nat.card X ≤ (k + 1) ^ 2
```

## Quantifiers

- `forall X` over `domain-x`
- `forall G` over `domain-x`
- `forall k` over `domain-k`

## Hypotheses

- `hyp-acyclic`: G.IsAcyclic (G is a forest: no cyclic walk; not required connected, not required nonempty). The only use of forest structure anywhere in the proof is the edge bound e(G) <= Nat.card X - 1 for Nat.card X >= 1 (INFORMAL-PROOF.md Sec.3.2); condition (ii) is discharged because the conclusion is trivially true when Nat.card X = 0, not by a separate vacuous-hypothesis lemma.
- `hyp-k-lb`: 1 <= k. Load-bearing: used in the union-bound rank shift (k+1 >= 2, so C(n-2,k-1) is meaningful) and in the choose_mul absorption identity (Nat.choose_mul needs 2 <= k+1).
- `hyp-descent`: Erdos993G1.delta G (k : ℤ) < 0, i.e. coeff G (k+1) - coeff G k < 0, i.e. (for k >= 0) indepCount G (k+1) < indepCount G k: a strict descent at rank k.

## Conclusion

- `conclusion`: forest_descent_order_bound: Nat.card X <= (k+1)^2, exactly as stated in lean_binding.expected_statement.

## Dependencies

- `def-indep-count` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `domain-x` -> `hyp-acyclic`
- `domain-k` -> `hyp-k-lb`
- `domain-x` -> `hyp-descent`
- `domain-k` -> `hyp-descent`
- `def-delta` -> `hyp-descent`
- `def-delta` -> `conclusion`
- `domain-x` -> `conclusion`
- `domain-k` -> `conclusion`
- `hyp-acyclic` -> `conclusion`
- `hyp-k-lb` -> `conclusion`
- `hyp-descent` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-originating-project`: `EVIDENCE/originating-source/Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
