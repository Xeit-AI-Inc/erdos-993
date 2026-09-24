# r26-c1-la1-top-rank-residual-sign

Declaration `R26LA1.topRankResidualSign`, exported byte-for-byte from the sealed internal run
`erdos-993-top-rank-residual-sign-dre-2026-09-23` (`runs/lean-2026-09-24-c1-la1-top-rank-residual-sign`; r26 — see
[`experiments/r26-top-rank-residual-sign.md`](../../../experiments/r26-top-rank-residual-sign.md)).
Award `C1-LA1`; registry effect `E993-R26-TOP-RANK-RESIDUAL-SIGN`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem topRankResidualSign (G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree)
    (hAlpha : 2 ≤ G.indepNum) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    aggregate G (G.indepNum - 1) ≤ 0
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> For every finite simple graph G on a finite vertex type with decidable equality and decidable adjacency: if G is a tree, 2 <= alpha(G), x(G) + 2 <= alpha(G) - 1, and every leaf of G belongs to every maximum independent set of G, then the literal top-rank residual aggregate satisfies S(G, alpha(G)-1) <= 0. The proof composes the verified (RI) identity S = ell M - W with the exact budget identity sum_{s in B cap C}(lambda(s)-1) + (a - |B cap D|) + h(B) = 1 on I_{alpha-1}(G), the three-family classification (I) A_C empty, (II) A_C = {s} with lambda(s) = 2, (III) |A_D| = a - 1 obtained by forced-neighbour pruning under (star), the exact counts |family I| = ell M and N_2 <= k_2 M with k_2 <= floor(ell/2), and the nonnegativity of the family-(III) weight sum via the deletion injection, giving S <= -ell(ell-2) M - (ell-4) N_2 and hence S <= 0 in each of the branches ell >= 4, ell = 3 and ell = 2. The statement is NON-STRICT and is confined to rank alpha-1 on the eligible residual class.

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
