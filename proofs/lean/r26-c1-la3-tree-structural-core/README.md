# r26-c1-la3-tree-structural-core

Declaration `R26LA3.leafDegree_two_indepNum_eq_two`, exported byte-for-byte from the sealed internal run
`erdos-993-top-rank-residual-sign-dre-2026-09-23` (`runs/lean-2026-09-24-c1-la3-tree-structural-core`; r26 — see
[`experiments/r26-top-rank-residual-sign.md`](../../../experiments/r26-top-rank-residual-sign.md)).
Award `C1-LA3`; registry effect `E993-R26-TREE-STRUCTURAL-CORE`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem leafDegree_two_indepNum_eq_two (G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree) (hLeafCard : (C5LA1.leafSet G).card = 2) {s : V} (hDeg2 : C5LA1.leafDegree G s = 2) : G.indepNum = 2
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> For every finite simple graph G on a finite vertex type with decidable equality and decidable adjacency, if G is a tree, its leaf set has exactly two elements, and some vertex s has leaf degree exactly 2 (both leaves are adjacent to s), then G.indepNum = 2. The declaration is the deepest fact of award group C1-LA3, whose registered declarations are the tree-structural core of C1-ALLOCATION.md item 9 (a)-(f) in the sharp forms ruled by the Cycle 1 synthesis, together with the critic-compiled extensions L intersect C(G) = empty, lambda identically zero on the leaf set, j*|C_j| <= |L| hence k_2 <= floor(|L|/2), and k_2 = 0 on the eligible class when |L| = 2. No registered declaration mentions the aggregate S, W_III, the families, or (RC), and none consumes hyp-residual.

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
