# Theorem Contract: Bd step-sign law and interior peak bound (award group C6-LA4, U-AWARD-BD-STEP-SIGN-AND-INTERIOR-PEAK)

- Contract ID: `c6-la4-c6-bd-step-sign-interior-peak-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `0d8478ca4c143522a8d7fb81bd89a85d90aaa0feecedd97dae00d49e00f30894`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

The explicit conjunction of two theorems over Z-valued functions of naturals m,g, with D(b,m) = C(b,m+1) - 2C(b,m) + C(b,m-1) the zero-extended integer binomial ranged object (SEMANTIC-CONTRACT.md zero-extension convention): (1) D_step_sign, the UNCONDITIONAL D-level step-sign law: for naturals g<m, 1<=m, m*(2m-g)*(D(2m-g-1,m)-D(2m-g,m)) = C(2m-g,m-1)*(2m-g^2+g); this together with peak_bracket_integral is the registered VERIFIED E993-R25-D-ROW-STEP-SIGN-LAW verbatim (both conjuncts) -- a GRADE CHANGE proved_informal -> formally_verified with its Cycle 5 critic attribution (C-U2-T, C-U2-F) preserved; (2) interior_peak_le_cat, the interior peak bound: for naturals 7<=m, g<=m with g^2-g>=2m and (g-1)^2-(g-1)<2m (g supplied as a WITNESS of these two inequalities, never asserted to exist -- precisely the distinction that makes D_unimodal_peak false and this true), D(2m-g,m) <= catalan(m-1); this is NEW content with no registered predecessor and takes the new key E993-R25-BD-INTERIOR-PEAK-CATALAN-BOUND. SCOPE (mandatory fences, per Cycle 6 synthesis Dispatch 4): fixed-band d=5 ARITHMETIC; no graph object occurs anywhere in the corpus; D, N, L, R are the seat's integer functions over Z with zero extension; 'unimodality' here is of the integer function g |-> D(2m-g,m) and is DERIVED from a sign identity, importing no shape premise on any i_k; this raises NOTHING else -- not E993-R25-BD-TAIL-NEGATIVE (the top-level Bd(r,r) < 0, NOT carried), not E993-R25-FOURTH-BAND-CLOSE-ALL-R, and no MaR/BdRR/[6,14]-layer object is carried into this award. Attribution: seat U2 for nodes 1, 2a, 4, 5, 6, 7; critic C-U2-F for node 2b and the interior peak bound; node 2b independently compiled by critic C-U2-T (joint attribution on that node).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem ErdosR25C6U2.bdStepSign_interiorPeak_award`
- Statement SHA-256: `729702a486b1d24d2a9bd52063de22447d4737c1bfe1b757711b57fc43d69d7b`

```lean
theorem bdStepSign_interiorPeak_award :
    (∀ m g : ℕ, g < m → 1 ≤ m →
        (m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
            * (D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) - D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ))
          = Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
              * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ))) ∧
    (∀ m g : ℕ, 7 ≤ m → g ≤ m →
        2 * (m : ℤ) ≤ (g : ℤ) ^ 2 - (g : ℤ) →
        ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * (m : ℤ) →
        D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ))
```

## Quantifiers

- None (closed proposition).

## Hypotheses

- None.

## Conclusion

- `conclusion`: theorem bdStepSign_interiorPeak_award :
    (∀ m g : ℕ, g < m → 1 ≤ m →
        (m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
            * (D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) - D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ))
          = Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
              * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ))) ∧
    (∀ m g : ℕ, 7 ≤ m → g ≤ m →
        2 * (m : ℤ) ≤ (g : ℤ) ^ 2 - (g : ℤ) →
        ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * (m : ℤ) →
        D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ))

## Dependencies

- `def-catalan-centralbinom-gap` -> `def-interior-peak-le-cat`
- `def-choose-double-step` -> `def-row-ratio`
- `def-choose-pred-pos` -> `def-d-step-down`
- `def-choose-pred-pos` -> `def-d-step-up`
- `def-choose-ratio-down` -> `def-choose-ratio-down-at`
- `def-choose-ratio-down` -> `def-d-closed-form`
- `def-choose-ratio-down-at` -> `def-d-step-sign`
- `def-choose-ratio-up` -> `def-d-closed-form`
- `def-choose-row-shift` -> `def-d-step-sign`
- `def-cz` -> `def-choose-pred-pos`
- `def-cz` -> `def-choose-ratio-down-at`
- `def-cz` -> `def-choose-row-shift`
- `def-cz` -> `def-cz-cast-add-one`
- `def-cz` -> `def-cz-cast-sub-one`
- `def-cz` -> `def-cz-natcast`
- `def-cz` -> `def-cz-nonneg`
- `def-cz` -> `def-d`
- `def-cz` -> `def-d-closed-form`
- `def-cz` -> `def-d-step-sign`
- `def-cz` -> `def-interior-peak-le-cat`
- `def-cz-cast-add-one` -> `def-d-closed-form`
- `def-cz-cast-sub-one` -> `def-choose-pred-pos`
- `def-cz-cast-sub-one` -> `def-choose-ratio-down-at`
- `def-cz-cast-sub-one` -> `def-d-closed-form`
- `def-cz-natcast` -> `def-choose-ratio-down-at`
- `def-cz-natcast` -> `def-choose-row-shift`
- `def-cz-natcast` -> `def-cz-cast-add-one`
- `def-cz-natcast` -> `def-cz-cast-sub-one`
- `def-cz-natcast` -> `def-d-closed-form`
- `def-cz-natcast` -> `def-interior-peak-le-cat`
- `def-d` -> `def-d-closed-form`
- `def-d` -> `def-d-step-down`
- `def-d` -> `def-d-step-sign`
- `def-d` -> `def-d-step-up`
- `def-d` -> `def-interior-peak-le-cat`
- `def-d-closed-form` -> `def-d-step-sign`
- `def-d-closed-form` -> `def-interior-peak-le-cat`
- `def-d-step-sign` -> `conclusion`
- `def-d-step-sign` -> `def-d-step-down`
- `def-d-step-sign` -> `def-d-step-up`
- `def-gc-ge-five` -> `def-gc-star-bound`
- `def-gc-ge-five` -> `def-interior-peak-le-cat`
- `def-gc-star-bound` -> `def-interior-peak-le-cat`
- `def-interior-peak-le-cat` -> `conclusion`
- `def-l` -> `def-l-eq`
- `def-l` -> `def-l-sub-r`
- `def-n` -> `def-d-closed-form`
- `def-n` -> `def-d-step-sign`
- `def-n` -> `def-interior-peak-le-cat`
- `def-n` -> `def-l-eq`
- `def-n` -> `def-peak-bracket-integral`
- `def-n` -> `def-r-eq`
- `def-peak-bracket-integral` -> `def-interior-peak-le-cat`
- `def-r` -> `def-l-sub-r`
- `def-r` -> `def-r-eq`
- `def-row-ratio` -> `def-interior-peak-le-cat`
- `def-three-gc-le` -> `def-gc-star-bound`
- `domain-int` -> `def-choose-pred-pos`
- `domain-int` -> `def-choose-ratio-down-at`
- `domain-int` -> `def-choose-row-shift`
- `domain-int` -> `def-cz`
- `domain-int` -> `def-cz-nonneg`
- `domain-int` -> `def-d`
- `domain-int` -> `def-d-step-down`
- `domain-int` -> `def-d-step-sign`
- `domain-int` -> `def-d-step-up`
- `domain-int` -> `def-gc-ge-five`
- `domain-int` -> `def-gc-star-bound`
- `domain-int` -> `def-interior-peak-le-cat`
- `domain-int` -> `def-l`
- `domain-int` -> `def-l-eq`
- `domain-int` -> `def-l-sub-r`
- `domain-int` -> `def-n`
- `domain-int` -> `def-peak-bracket-integral`
- `domain-int` -> `def-r`
- `domain-int` -> `def-r-eq`
- `domain-int` -> `def-three-gc-le`
- `domain-nat` -> `conclusion`
- `domain-nat` -> `def-catalan-centralbinom-gap`
- `domain-nat` -> `def-choose-double-step`
- `domain-nat` -> `def-choose-pred-pos`
- `domain-nat` -> `def-choose-ratio-down`
- `domain-nat` -> `def-choose-ratio-down-at`
- `domain-nat` -> `def-choose-ratio-up`
- `domain-nat` -> `def-choose-row-shift`
- `domain-nat` -> `def-cz-cast-add-one`
- `domain-nat` -> `def-cz-cast-sub-one`
- `domain-nat` -> `def-cz-natcast`
- `domain-nat` -> `def-d-closed-form`
- `domain-nat` -> `def-d-step-down`
- `domain-nat` -> `def-d-step-sign`
- `domain-nat` -> `def-d-step-up`
- `domain-nat` -> `def-gc-ge-five`
- `domain-nat` -> `def-gc-star-bound`
- `domain-nat` -> `def-interior-peak-le-cat`
- `domain-nat` -> `def-row-ratio`
- `domain-nat` -> `def-three-gc-le`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-originating-critic-u2-f-criticf`: `SOURCE/originating-critic-U2-F-CriticF.lean` (match)
- `source-originating-critic-u2-f-criticf2`: `SOURCE/originating-critic-U2-F-CriticF2.lean` (match)
- `source-originating-critic-u2-t-main`: `SOURCE/originating-critic-U2-T-Main.lean` (match)
- `source-originating-seat-u2-main`: `SOURCE/originating-seat-U2-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
