# r26-c1-la2-deletion-injection-fibre

Declaration `R26LA2.fibreInequalitySharp`, exported byte-for-byte from the sealed internal run
`erdos-993-top-rank-residual-sign-dre-2026-09-23` (`runs/lean-2026-09-24-c1-la2-deletion-injection-fibre`; r26 — see
[`experiments/r26-top-rank-residual-sign.md`](../../../experiments/r26-top-rank-residual-sign.md)).
Award `C1-LA2`; registry effect `E993-R26-DELETION-INJECTION-FIBRE-BOUND`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem fibreInequalitySharp (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (ℓ : ℕ) : ((ℓ : ℤ) - (U.card : ℤ)) * ((indepPowerset G U).card : ℤ) ≤ ∑ A ∈ indepPowerset G U, ((ℓ : ℤ) - 2 * (A.card : ℤ))
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> Let V be a finite type with decidable equality, G a simple graph on V with decidable adjacency, U : Finset V an arbitrary vertex finset, and I(U) the finset of independent subsets of U. Then (a) 2 * (sum over A in I(U) of |A|) <= |U| * |I(U)| in the natural numbers, and (b) for EVERY natural number ℓ, ((ℓ : ℤ) - (|U| : ℤ)) * (|I(U)| : ℤ) <= sum over A in I(U) of ((ℓ : ℤ) - 2 * (|A| : ℤ)) in the integers. The terminal declaration of this contract is (b), the sharp fibre inequality. There are no hypotheses beyond finiteness: no tree, no connectivity, no hyp-alpha, no hyp-eligible, no residual hypothesis (star), and no |U| <= ℓ. Statement (a) is the in-run RE-PROOF of the occupancy bound of Andriantiana-Razanajatovo Misanantenaina-Wagner (2020), carried on the face of this contract per SOLUTION-CONTRACT.md fence 7; nothing is imported. The award asserts nothing about the residual aggregate S, about trees, about the family decomposition, about W_III, or about (RC); the instantiation of (b) at U := U(J') belongs to award group C1-LA1.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in
`source/lakefile.toml` and `source/lake-manifest.json`; the package cache is not shipped — bind a local
Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice,
Quot.sound]`; no `sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract
(`THEOREM-CONTRACT.yaml`, rendered `THEOREM-CONTRACT.md`), independent informal proof-integrity audit
(`INFORMAL-AUDIT.md`; the formalizer's `INFORMAL-PROOF.md`), kernel/axiom receipt and independent
statement-fidelity attestation (`FIDELITY-REVIEW.md`, verdict `passed`), canonical close
(`VERIFICATION-REPORT.md`, `formally_verified`). Digests and verdicts are in `receipts/RECEIPT-SUMMARY.json`;
full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration —
nothing about the all-rank aggregate, `E993-BETA-AGG`, transport, TREE, FOREST, or Erdős #993.
