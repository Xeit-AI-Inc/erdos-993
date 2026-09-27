# r30-c1-la2-weighted-hall-implies-nonpositive-aggregate

Declaration `E993Transport.aggregate_nonpos_of_weightedHall`, exported byte-for-byte from the sealed internal run `erdos-993-weighted-transport-dre-2026-09-26` (`runs/lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate`; r30 — see
[`experiments/r30-weighted-transport.md`](../../../experiments/r30-weighted-transport.md)). Award `C1-LA2`; registry effect `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem aggregate_nonpos_of_weightedHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) (h : WeightedHall G (favorableLeaves G p) p) :
    C5LA1.aggregate G p ≤ 0
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> For every finite vertex type V, every simple graph G on V and every natural p >= 1: if the weighted Hall condition (HALL-COND) holds for the transport network at rank p with the fixed original selector F = F_p(G) (active-tag weights w_F on the independent (p+1)-sets and p-sets; relation (D) ∪ (S) literally), i.e. for every X ⊆ I_(p+1)(G) the w_F-weight of X is at most the w_F-weight of the targets joined to X, then C5LA1.aggregate G p = S(G, p) <= 0. Graph-generic (no IsTree, no eligibility). The hypothesis is (HALL-COND) for EVERY X; the conclusion depends on it only at X = I_(p+1); the converse is false as a statement and is not asserted (synthesis R5). A composition of FLOW=>SIGN (P2) and HALL=>FLOW (P3), first compiled as one declaration by critic C-U2-T, hence STATED: it registers formally_verified only after an isolated second read AND this award's close. Attribution: active-tag weight, mechanism and corrections: Codex (GPT-6 Astra/Sol/Luna), lower-region run; definitions of record entries 1-18 and 42: the first-interior run (Codex) on the r24/r25/r26 definition layers (C4LA1, C5LA1); informal proof: r30 F2 (Claude Sonnet 5); Lean proofs: r30 U2 (Claude Sonnet 5); companions and fidelity findings: C-U2-T, C-U2-F, C-F2-T, C-F2-U (Claude Opus 5.5), with C-U2-T and C-U2-F for the converse, the iff and the layer closure; reconciliation: the T/F/U adjudicators and the synthesis (Claude Opus 5.5). Phrasing: the compiled binder text (explicit G and p; explicit G of layerWeight_sub_eq_sum) is an equivalent Lean phrasing of the SOLUTION-CONTRACT §2 draft per Gate ruling 9 (control/C1-STAGE1-GATE.md), the equivalence compiled (C-U2-T CriticContract.lean re-run against this run's declarations).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
active-tag transport network on finite simple graphs or on the named tree family; nothing about (HALL) at full scope, the lower-region
aggregate beyond the named family, `E993-BETA-AGG`, no-recovery, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
