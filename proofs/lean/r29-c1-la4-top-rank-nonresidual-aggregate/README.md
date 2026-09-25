# r29-c1-la4-top-rank-nonresidual-aggregate

Declaration `E993HighTail.topRankNonResidualAggregate`, exported byte-for-byte from the sealed internal run
`erdos-993-high-tail-certification-dre-2026-09-25` (`runs/lean-2026-09-25-c1-la4-top-rank-nonresidual-aggregate`; r29 — see
[`experiments/r29-high-tail-certification.md`](../../../experiments/r29-high-tail-certification.md)).
Award `C1-LA4`; registry effect `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem topRankNonResidualAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1) :
    C5LA1.aggregate G (G.indepNum - 1) ≤ 0
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> For every finite ordinary tree T with alpha = alpha(T), x = x(T) and integer rank p = alpha - 1: if x + 2 <= p, then S(T, p) = sum over original leaves v with Delta_p(T - v) < 0 of [Delta_(p-1)(T - {v, s_v}) - Delta_(p-1)(T - N_T[s_v])] <= 0. Key E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE (TRN), award C1-LA4 of r29 (canonical run id erdos-993-math-dre-20260925-r29-high-tail-certification).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in
`source/lakefile.toml` and `source/lake-manifest.json`; the package cache is not shipped — bind a local
Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice,
Quot.sound]`; no `sorry`/`admit`/`native_decide`. Every definition of record in the source is a byte-identical
registrar carry of the verified first-interior award source. Governed workflow: frozen theorem contract
(`THEOREM-CONTRACT.yaml`, rendered `THEOREM-CONTRACT.md`), independent informal proof-integrity audit
(`INFORMAL-AUDIT.md`; the formalizer's `INFORMAL-PROOF.md`), kernel/axiom receipt and independent
statement-fidelity attestation (`FIDELITY-REVIEW.md`, verdict `passed`), canonical close
(`VERIFICATION-REPORT.md`, `formally_verified`). Digests and verdicts are in `receipts/RECEIPT-SUMMARY.json`;
full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration —
a counting/sign statement about independent sets of finite bipartite graphs or trees at the stated ranks; nothing about
the lower region `3p < 2α + 1`, `E993-BETA-AGG`, no-recovery, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
