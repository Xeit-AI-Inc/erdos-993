# r24-c4-top-rank-selector-collapse

Declaration `C4LA1.topRankSelectorCollapse`, exported byte-for-byte from the sealed internal run
`erdos-993-direct-favorable-leaf-aggregate-dre-2026-09-14` (see
[`experiments/r24-direct-favorable-leaf-aggregate.md`](../../../experiments/r24-direct-favorable-leaf-aggregate.md)).
Cycle 4 award `C4-LA1` (Codex); one of three Cycle 4 award groups, the other two (`C4-LA2`, `C4-LA3`) blocked fail-closed.

Statement:

```lean
(G : SimpleGraph V) [DecidableRel G.Adj] (_hTree : G.IsTree) (hAlpha : 2 ≤ G.indepNum) (v : V) (hvLeaf : IsGraphLeaf G v) : IsFavorableAt G v (G.indepNum - 1)
```

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/lakefile.toml`
and `source/lake-manifest.json`; the package cache is not shipped — bind a
local Mathlib checkout at that revision, never `lake update`). Axioms exactly
`[propext, Classical.choice, Quot.sound]`; no `sorry`/`admit`/`native_decide`.
Governed workflow: frozen theorem contract (`THEOREM-CONTRACT.yaml`, rendered
`THEOREM-CONTRACT.md`), independent informal proof-integrity audit
(`INFORMAL-AUDIT.md`; the formalizer's `INFORMAL-PROOF.md`), kernel/axiom
receipt and independent statement-fidelity attestation (`FIDELITY-REVIEW.md`),
canonical close (`VERIFICATION-REPORT.md`). Digests and verdicts are in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run.
Internal grade `formally_verified`; published as `verified`. Claim boundary:
Lean kernel validity plus independent statement fidelity — nothing about the
aggregate sign, `(RC)`, transport, `E993-BETA-AGG`, or Erdős #993.
