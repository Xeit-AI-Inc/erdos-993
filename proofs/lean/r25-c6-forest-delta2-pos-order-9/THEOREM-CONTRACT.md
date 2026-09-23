# Theorem Contract: Uniform forest Delta_2 positivity threshold, order >= 9 (award group C6-LA1, E993-R25-FOREST-DELTA2-POS-ORDER-9)

- Contract ID: `c6-la1-c6-forest-delta2-order-9-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `06f3bc93f80a567f99deb895215a3468715eb18956840684010e47462590e918`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite forest F (SimpleGraph X, [Finite X], F.IsAcyclic) with Nat.card X >= 9, 0 < Erdos993G1.delta F 2 (i.e. i_3(F) > i_2(F), Delta_2 in the SEMANTIC-CONTRACT.md sense), with the quantitative companion (Nat.card X)^3 - 12*(Nat.card X)^2 + 35*(Nat.card X) - 30 <= 6 * Erdos993G1.delta F 2 for Nat.card X >= 5. A grade change for the registered VERIFIED E993-R25-FOREST-DELTA2-POS-ORDER-9 (proved_informal -> formally_verified), not a new claim. SCOPE (mandatory fences): uniform in the order, no horizon, no enumeration at any order; nu (matching number), tau (vertex-cover number), the excess d, and x(F) < r (first strict descent) enter nowhere; Delta_2 > 0 is a POSITIVITY statement, the opposite sign from a no-recovery statement; this is a forest THRESHOLD theorem, never 'the run's first unconditional forest theorem'; it does not sharpen E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP (an order bound is a different object); it is not E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12; it bears on no tier, on FOREST/TREE/TRANSFER, or on Erdos #993. Alias: E993-R25-FOREST-DELTA2-POS-ORDER-9; strictly generalises frozen ENTRY 176 (Erdos993G1.ThirdWide.forest_delta_two_ten_pos, Nat.card X = 10); also aliases E993-PAIR-RANK3-FOREST-MIN. Attribution: critic-attributed jointly to C-U4-T (contract form, quantitative cubic) and C-U4-F (component-corrected bound, entry176_is_an_instance disclosure), on the frozen G1 project's own compiled lemmas; seat U4's route framed the question and settled the decide-reach question the critics' closed form routes around.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine`
- Statement SHA-256: `9344b2dc4b4143f499ac8b5e5f5b4543e236d337e240ca4d1ddc2517b3dd6299`

```lean
theorem forest_delta_two_pos_ge_nine {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 9 ≤ Nat.card X) : 0 < Erdos993G1.delta F 2
```

## Quantifiers

- `forall X` over `domain-vertex-type`
- `forall F` over `domain-forest`

## Hypotheses

- `hyp-finite`: [Finite X] -- the minimal instance burden; Erdos993G1.delta is noncomputable so no Fintype/DecidableEq/DecidableRel is needed by the statement.
- `hyp-acyclic`: hF : F.IsAcyclic -- F is a forest; enters through lem-forest-card-edges-add-components (|E|+c=n) and, via lem-indepCount-three-add-edge-incidence's own proof, through triangle-freeness in lem-triple-local-identity.
- `hyp-order-ge-nine`: hn : 9 <= Nat.card X -- the threshold hypothesis; discharges 5 <= Nat.card X for forest_delta_two_lower and, via nlinarith with n^3-12n^2+35n-30 = (n-9)^3+15(n-9)^2+62(n-9)+42, gives strict positivity.

## Conclusion

- `conclusion`: theorem forest_delta_two_pos_ge_nine {X : Type u} [Finite X] (F : SimpleGraph X) (hF : F.IsAcyclic) (hn : 9 <= Nat.card X) : 0 < Erdos993G1.delta F 2

## Dependencies

- `domain-vertex-type` -> `domain-forest`
- `def-indepcount` -> `def-coeff`
- `def-coeff` -> `def-delta`
- `def-indepcount` -> `lem-indepcount-eq-card`
- `def-coeff` -> `lem-coeff-nat`
- `def-indepcount` -> `lem-coeff-nat`
- `def-delta` -> `lem-delta-nat`
- `lem-coeff-nat` -> `lem-delta-nat`
- `lem-isnindepset-pair-iff` -> `lem-indepsetfinset-two-eq`
- `lem-sym2-tofinset-injective` -> `lem-indepsetfinset-two-eq`
- `lem-indepcount-eq-card` -> `lem-indepcount-two-add-edges`
- `lem-indepsetfinset-two-eq` -> `lem-indepcount-two-add-edges`
- `lem-sym2-tofinset-injective` -> `lem-indepcount-two-add-edges`
- `lem-indepsetfinset-eq-filter-powersetcard` -> `lem-card-nonindep-pairs`
- `lem-indepcount-two-add-edges` -> `lem-card-nonindep-pairs`
- `lem-indepcount-eq-card` -> `lem-card-nonindep-pairs`
- `lem-card-nonindep-pairs` -> `lem-sum-nonindep-pair-incidence`
- `lem-sum-card-filter-swap` -> `lem-sum-nonindep-pair-incidence`
- `lem-indepsetfinset-eq-filter-powersetcard` -> `lem-sum-indep-indicator`
- `lem-triple-local-identity` -> `lem-indepsetfinset-three-incidence`
- `lem-sum-indep-indicator` -> `lem-indepsetfinset-three-incidence`
- `lem-sum-nonindep-pair-incidence` -> `lem-indepsetfinset-three-incidence`
- `lem-indepsetfinset-three-incidence` -> `lem-indepcount-three-add-edge-incidence`
- `lem-sum-triple-centered-neighbor-pairs` -> `lem-indepcount-three-add-edge-incidence`
- `lem-indepcount-eq-card` -> `lem-indepcount-three-add-edge-incidence`
- `lem-degreedefect-nonneg` -> `lem-degreechoose-sum-lower`
- `lem-scaledchoosetwo` -> `lem-scaledchoosethree`
- `lem-components-card-pos-of-card-pos` -> `lem-forest-delta-two-lower`
- `lem-forest-card-edges-add-components` -> `lem-forest-delta-two-lower`
- `lem-indepcount-two-add-edges` -> `lem-forest-delta-two-lower`
- `lem-indepcount-three-add-edge-incidence` -> `lem-forest-delta-two-lower`
- `lem-degreechoose-sum-lower` -> `lem-forest-delta-two-lower`
- `lem-scaledchoosetwo` -> `lem-forest-delta-two-lower`
- `lem-scaledchoosethree` -> `lem-forest-delta-two-lower`
- `lem-delta-nat` -> `lem-forest-delta-two-lower`
- `def-delta` -> `lem-forest-delta-two-lower`
- `domain-vertex-type` -> `hyp-finite`
- `domain-forest` -> `hyp-acyclic`
- `domain-vertex-type` -> `hyp-order-ge-nine`
- `hyp-finite` -> `conclusion`
- `hyp-acyclic` -> `conclusion`
- `hyp-order-ge-nine` -> `conclusion`
- `lem-forest-delta-two-lower` -> `conclusion`
- `def-delta` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-critic-u4-f-fallback`: `SOURCE/originating-critic-U4-F-CriticUC604F.lean` (match)
- `source-critic-u4-t-primary`: `SOURCE/originating-critic-U4-T-CritU4T.lean` (match)
- `source-frozen-g1-main`: `SOURCE/originating-frozen-g1-Main.lean` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
