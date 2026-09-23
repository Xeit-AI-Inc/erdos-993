# Theorem Contract: Bd tail negativity, r >= 6 (r25 ADDENDUM lane B, seat B-LA1)

- Contract ID: `b-la1-bd-tail-negative-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `92ff817bfc020da51f59b0b176067a13e9f62989ed976e776780bd48be695163`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

With D(b,m) = C(b,m+1) - 2C(b,m) + C(b,m-1) (zero-extended integer binomial coefficients) and the RANGED Bd(r,r) = D(2r-1,r) + sum_{a=1}^{6} C(6,a) * max(0, max_{0<=b<=2r-1-a} D(b,r-a)) (C-U2-F's integer-rank MaR/BdRR of record, CriticF2.lean verbatim): Bd(r,r) < 0 for every integer r >= 6. This is the r >= 6 half of the registry claim E993-R25-BD-TAIL-NEGATIVE; the parenthetical sharpness half (Bd(r,r) >= 0 exactly at r in {2,3,4,5}) is out of scope. No graph object occurs; this is pure binomial-integer arithmetic.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem ErdosR25AddBdTail.bdTailNegative_award`
- Statement SHA-256: `6ea44d128e32c813684f5d897f69dc2c59ff8593a320b18b30dd94c0f3710b85`

```lean
theorem bdTailNegative_award : ∀ r : ℕ, 6 ≤ r → BdRR r < 0
```

## Quantifiers

- `forall r` over `domain-r`

## Hypotheses

- `hyp-r6`: 6 <= r

## Conclusion

- `conclusion`: BdRR r < 0

## Dependencies

- `def-cz` -> `def-d`
- `def-d` -> `def-mar`
- `def-d` -> `def-bdrr`
- `def-mar` -> `def-bdrr`
- `domain-r` -> `hyp-r6`
- `def-bdrr` -> `conclusion`
- `hyp-r6` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `c3la1-award-main`: `SOURCE/C3LA1-award-Main.lean` (match)
- `c6la4-award-main`: `SOURCE/C6LA4-award-Main.lean` (match)
- `capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `critt-main-reference`: `SOURCE/CritT-Main.lean` (match)
- `cu2f-criticf`: `SOURCE/CU2-CriticF.lean` (match)
- `cu2f-criticf2`: `SOURCE/CU2-CriticF2.lean` (match)
- `cu2f-criticf3`: `SOURCE/CU2-CriticF3.lean` (match)
- `cu2f-main`: `SOURCE/CU2-Main.lean` (match)
- `informal-proof`: `INFORMAL-PROOF.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
