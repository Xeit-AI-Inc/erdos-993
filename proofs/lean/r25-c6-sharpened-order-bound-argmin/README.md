# r25-c6-sharpened-order-bound-argmin

Declaration `ErdosR25T2.candidateD_argmin`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-22-c6-sharpened-order-bound-argmin`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 6 award `C6-LA6`; registry identity `(scope update) E993-R25-FOREST-ORDER-BOUND-SHARPENED`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem candidateD_argmin (n k e : ℤ) (hn : 4 ≤ n) (he1 : 1 ≤ e) (he2 : e ≤ n - 1) :
    Hbound n k (n - 1) 1 ≤ Hbound n k e (min e (n - e))
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> Let C(a,b) denote the zero-extended integer binomial coefficient (0 whenever a < 0 or b < 0, or b > a >= 0). Let H(n,k,e,c_e) := C(n,k+1) - e*C(n-2,k-1) + (e-c_e)*C(n-3,k-2) + (c_e-1)*C(n-4,k-3), and W(n,k,e) := H(n,k,e, min(e, n-e)). For every integer n >= 4, every integer k, and every integer e with 1 <= e <= n-1: H(n,k,n-1,1) <= W(n,k,e). That is, e = n-1, c_e = 1 minimises H(n,k,e,min(e,n-e)) over 1 <= e <= n-1 (Candidate D's own missing step, in Candidate D's own words). NO graph token occurs anywhere in this statement: it is purely about zero-extended integer binomial coefficients, uniform in k, with the n >= 4 fence TIGHT (the Pascal-derived closed form underlying the proof fails at n = 3, k = 1, e = 1 and below; EVIDENCE/argmin_evidence_check.py Check B). d, nu, tau and x(F) < r occur nowhere. This is NOT the forest order bound: the seat's own separate frozen contract of RETURN.md Section 4.1 (graph theorem, declaration name Erdos993G1.ForestOrderBound.forest_descent_order_bound_sharpened) is explicitly NOT dispatched by this contract -- no shipped fragment proves it (a token sweep of every compiled source finds no SimpleGraph, IsAcyclic, indepCount or Erdos993G1 occurrence). Registry effect: no new E993-R25-... registration; a SCOPE UPDATE of the already-registered E993-R25-FOREST-ORDER-BOUND-SHARPENED (whose scope text names this exact argmin as its own open step) -- "the argmin step is now kernel-checked" -- never a grade change.

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
