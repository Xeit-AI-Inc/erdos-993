# Theorem Contract: Forest Delta-3 positivity threshold at order 12 (n >= 12 half only)

- Contract ID: `a1-la1-forest-delta3-order-12-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `a18425e1c9a53e7442e68013985c53ef7a693f999033e5cfe6cba99d152d79ad`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple graph F on a finite vertex type X, if F is acyclic (a forest, connected or not) and Nat.card X is at least 12, then Delta_3(F) = i_4(F) - i_3(F) > 0, where i_k(F) is the exact count of independent k-subsets of F (Erdos993G1.indepCount), coeff is the integer zero-extension of indepCount to negative indices, and delta is the first difference coeff(k+1) - coeff(k). This proves the first conjunct only of the registered claim E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12, whose second conjunct (sharpness at order 11, P_11 the unique minimiser, Delta_3 = -14) is explicitly excluded from this contract and stays proved_informal.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.ForestDelta3.forest_delta_three_pos_ge_twelve`
- Statement SHA-256: `f441f25004c731c5a267f349b5c4cf3e1cb7921a08aae477607cea7f577f83ec`

```lean
theorem forest_delta_three_pos_ge_twelve {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 12 ≤ Nat.card X) : 0 < Erdos993G1.delta F 3
```

## Quantifiers

- `forall X` over `domain-x`
- `forall F` over `domain-f`

## Hypotheses

- `hyp-acyclic`: F.IsAcyclic (SimpleGraph.IsAcyclic; never SimpleGraph.IsTree, so no connectivity is assumed -- disconnected forests are genuinely covered).
- `hyp-order`: 12 <= Nat.card X (the exact threshold of the n >= 12 half of E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12).

## Conclusion

- `conclusion`: 0 < Erdos993G1.delta F 3

## Dependencies

- `def-indepcount` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `domain-x` -> `domain-f`
- `domain-f` -> `hyp-acyclic`
- `domain-x` -> `hyp-order`
- `def-delta` -> `conclusion`
- `hyp-acyclic` -> `conclusion`
- `hyp-order` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-adjudication`: `SOURCE/ADJUDICATION.md` (match)
- `src-arithmetic-chain`: `SOURCE/CriticUC604FChain.lean` (match)
- `src-c6la1-import`: `SOURCE/C6-LA1-Main.lean` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-frozen-entries`: `SOURCE/C-U3-F-Transcribed.lean` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-pendant-identity`: `SOURCE/C-U3-F-Crit.lean` (match)
- `src-pendant-identity-corroboration`: `SOURCE/C-U3-T-CriticPendant.lean` (match)
- `src-return`: `SOURCE/RETURN.md` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-source-digests`: `SOURCE/SOURCE-DIGESTS.json` (match)
- `src-synthesis`: `SOURCE/SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
