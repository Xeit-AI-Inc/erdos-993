# r29-c1-la3-interior-eligibility-guard

Declaration `E993HighTail.interiorEligibilityAlphaGeSeven`, exported byte-for-byte from the sealed internal run
`erdos-993-high-tail-certification-dre-2026-09-25` (`runs/lean-2026-09-25-c1-la3-interior-eligibility-guard`; r29 — see
[`experiments/r29-high-tail-certification.md`](../../../experiments/r29-high-tail-certification.md)).
Award `C1-LA3`; registry effect `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN (OPEN → VERIFIED)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem interiorEligibilityAlphaGeSeven {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) :
    7 ≤ G.indepNum
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> For every finite ordinary tree T with integer p = α(T) − 2: if x(T) + 2 ≤ p, where x(T) is the least k with Δ_k(T) = i_{k+1}(T) − i_k(T) < 0, then α(T) ≥ 7. Lean: for every finite type V with decidable equality and every G : SimpleGraph V with decidable adjacency, G.IsTree and C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2 (ℕ) imply 7 ≤ G.indepNum. The hypothesis hInterior is an inequality in ℕ with truncated subtraction: crossingIndex G + 2 ≤ G.indepNum - 2. It is equivalent to the integer hypothesis (crossingIndex G : ℤ) + 2 ≤ (G.indepNum : ℤ) - 2 for EVERY value of indepNum: when indepNum < 2 the ℕ right side is 0 and the ℤ right side is negative, while the left side is ≥ 2, so both are false; when indepNum ≥ 2 the ℕ subtraction equals the ℤ one and the two are identical. So the Lean hypothesis is exactly the registry hypothesis x(T) + 2 ≤ p with integer p = α(T) − 2. Terminal declaration E993HighTail.interiorEligibilityAlphaGeSeven, body E993Interior.eligibleAlphaGeSeven G hT hInterior: a NEW terminal name applying the carried entry 43, not a byte-identical re-export. Fences (SOLUTION-CONTRACT §3): §3.1 not a no-recovery statement; no status transfer to E993-R25-UNR-FOREST-WIDE, E993-G1WIDE-NO-SIZE-CAP, NR1, FOREST, TREE, TRANSFER, E993-BETA-AGG or Erdős #993. §3.2 E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE (VERIFIED, first-interior award) unchanged and never re-registered; the relation is a scope note. §3.5 no census value, r27 root correction or r28 Hall/SDR route. §3.7 attribution on every face. §3.8 separate certificate; entry 43's presence inside the first-interior package is context, never a certificate. Excluded conclusions: no aggregate sign; no statement at any other depth; no no-recovery or unimodality claim; no re-certification of E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE. Attribution: Codex (GPT-6): entry 43's proof (the three low-α exclusions) and the proposed statement; r25: the G1 definitions (entries 15–17) and the Erdos993G1 counting layer as carried in the first-interior source; r24 C4-LA1 / r26: the C4LA1 / C5LA1 definition layer; r29 T1's extraction as corrected by C-T1-F, C-T1-U and the T adjudicator (acyclicity in all three branches); the U adjudicator's recomputation and scratch candidate (terminal declaration text). Key: E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN (OPEN → VERIFIED by this award only, after every gate). Canonical DRE run id: erdos-993-math-dre-20260925-r29-high-tail-certification.

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
