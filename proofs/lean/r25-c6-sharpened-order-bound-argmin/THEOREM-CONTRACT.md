# Theorem Contract: Candidate D's argmin step (C6-LA6; T2's node N8; RE-FROZEN contract; scope update of E993-R25-FOREST-ORDER-BOUND-SHARPENED)

- Contract ID: `c6-la6-c6-sharpened-order-bound-argmin-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `6d9de6c29d22337ea7f5144690917e07d5d9a39551d2c9f526ade62a6750d2ab`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Let C(a,b) denote the zero-extended integer binomial coefficient (0 whenever a < 0 or b < 0, or b > a >= 0). Let H(n,k,e,c_e) := C(n,k+1) - e*C(n-2,k-1) + (e-c_e)*C(n-3,k-2) + (c_e-1)*C(n-4,k-3), and W(n,k,e) := H(n,k,e, min(e, n-e)). For every integer n >= 4, every integer k, and every integer e with 1 <= e <= n-1: H(n,k,n-1,1) <= W(n,k,e). That is, e = n-1, c_e = 1 minimises H(n,k,e,min(e,n-e)) over 1 <= e <= n-1 (Candidate D's own missing step, in Candidate D's own words). NO graph token occurs anywhere in this statement: it is purely about zero-extended integer binomial coefficients, uniform in k, with the n >= 4 fence TIGHT (the Pascal-derived closed form underlying the proof fails at n = 3, k = 1, e = 1 and below; EVIDENCE/argmin_evidence_check.py Check B). d, nu, tau and x(F) < r occur nowhere. This is NOT the forest order bound: the seat's own separate frozen contract of RETURN.md Section 4.1 (graph theorem, declaration name Erdos993G1.ForestOrderBound.forest_descent_order_bound_sharpened) is explicitly NOT dispatched by this contract -- no shipped fragment proves it (a token sweep of every compiled source finds no SimpleGraph, IsAcyclic, indepCount or Erdos993G1 occurrence). Registry effect: no new E993-R25-... registration; a SCOPE UPDATE of the already-registered E993-R25-FOREST-ORDER-BOUND-SHARPENED (whose scope text names this exact argmin as its own open step) -- "the argmin step is now kernel-checked" -- never a grade change.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem ErdosR25T2.candidateD_argmin`
- Statement SHA-256: `2e1091783be18af5014ec227dfdccf1d45910e539c9182704ce96519f76ad139`

```lean
theorem candidateD_argmin (n k e : ℤ) (hn : 4 ≤ n) (he1 : 1 ≤ e) (he2 : e ≤ n - 1) :
    Hbound n k (n - 1) 1 ≤ Hbound n k e (min e (n - e))
```

## Quantifiers

- `forall n` over `domain-int`
- `forall k` over `domain-int`
- `forall e` over `domain-int`

## Hypotheses

- `hyp-n`: 4 <= n (tight; the underlying closed form fails at n = 3, k = 1, e = 1)
- `hyp-e-lower`: 1 <= e
- `hyp-e-upper`: e <= n - 1

## Conclusion

- `conclusion`: Hbound n k (n - 1) 1 <= Hbound n k e (min e (n - e))

## Dependencies

- `def-zchoose` -> `def-hbound`
- `def-hbound` -> `def-w`
- `domain-int` -> `hyp-n`
- `domain-int` -> `hyp-e-lower`
- `domain-int` -> `hyp-e-upper`
- `def-hbound` -> `conclusion`
- `def-w` -> `conclusion`
- `hyp-n` -> `conclusion`
- `hyp-e-lower` -> `conclusion`
- `hyp-e-upper` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-critic-t2f`: `EVIDENCE/originating-source/CriticT2F.lean` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-seat-t2-main`: `EVIDENCE/originating-source/T2-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
