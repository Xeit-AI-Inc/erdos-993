# r29-c1-la2-leaf-high-tail-pointwise

Declaration `E993HighTail.bipartiteLeafHighTailPointwise`, exported byte-for-byte from the sealed internal run
`erdos-993-high-tail-certification-dre-2026-09-25` (`runs/lean-2026-09-25-c1-la2-leaf-high-tail-pointwise`; r29 — see
[`experiments/r29-high-tail-certification.md`](../../../experiments/r29-high-tail-certification.md)).
Award `C1-LA2`; registry effect `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE (OPEN → VERIFIED), with E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE as the companion lemma on its face`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem bipartiteLeafHighTailPointwise {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> For every finite simple bipartite graph G, every original degree-one vertex v of G with support s, and every integer p >= 1 with 3p >= 2 alpha(G) + 1: Delta_(p-1)(G - {v, s}) - Delta_(p-1)(G - N_G[s]) <= 0, where Delta_k(G - D) = i_(k+1)(G - D) - i_k(G - D) counts independent sets on the ORIGINAL carrier avoiding D. No selector, residual, connectivity or nonemptiness hypothesis. Companion (HTA), a lemma on the same face: under G bipartite, p >= 1 and 3p >= 2 alpha(G) + 1, the aggregate S(G, p) = C5LA1.aggregate G p <= 0 (original strict selector Delta_p(G - v) < 0; one tag per original leaf).

TERMINAL LEAN STATEMENT (namespace E993HighTail; SHA-256 805b158547459c55f9ffe2268be7a038d567fd0304528f2fc1a458e5567031d2):
theorem bipartiteLeafHighTailPointwise {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0

COMPANION STATEMENT FIELD (HTA certificate ruling (i); key E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE; declaration E993HighTail.bipartiteHighTailAggregateAllRanks, kind lemma, placed before the terminal theorem; exact SOLUTION-CONTRACT section 2 text; SHA-256 752a355bfd0e80bc28d0413435770e3a24885ac315341f91abc8c295078096af; also bound byte-exactly as source material SOURCE/COMPANION-STATEMENT.txt):
lemma bipartiteHighTailAggregateAllRanks {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.aggregate G p ≤ 0
Companion axiom-coverage note: The kernel verifier's #print axioms probe binds only the terminal declaration; the terminal theorem does not depend on the companion. The companion is kernel-checked by the same lake build and single-file check that the receipt binds, and its #print axioms (exactly [propext, Classical.choice, Quot.sound]) is recorded in EVIDENCE/axioms-all-declarations.txt, which is not receipt-bound. Whether condition (iii) is met is the controller's ruling.

NAT/INT EQUIVALENCE:
- p - 1 is Nat subtraction; under hp : 1 ≤ p it equals the integer p - 1, so the Lean statement at Nat rank p - 1 is exactly the registry statement at integer rank p - 1 for every integer p ≥ 1.
- hTail : 2 * G.indepNum + 1 ≤ 3 * p is a Nat inequality without subtraction; it is literally 3p ≥ 2 alpha(G) + 1.
- Every difference in the conclusion is an Int difference of Nat counts cast to Int (forwardDifferenceDel).
- In the proof, alpha - 1 (Nat) is exact whenever an independent set exists (alpha ≥ 1), and a - k with a = alpha - 1 is exact on the branch k ≤ a where it is used; |V| - |D| is exact by |D| ≤ |V| (Nat.cast_sub).

HYPOTHESIS CONSUMPTION:
- hBip : G.IsBipartite -- only on the p ≥ 2 branch: E993Interior.taggedShadowBound G hBip (entry 41) at U = univ \ H_v, W = R_v, a = alpha - 1; inside entry 41 only at Core.card_extension_le. Not consumed on the p = 1 branch.
- hv : C4LA1.IsGraphLeaf G v -- support_adj / support_unique; H_subset_R; leaf_indep_cap; |H_v| = 2 and N(s) = {v} at p = 1. In the companion, supplied by membership in leafSet.
- hp : 1 ≤ p -- makes Nat p - 1 the integer rank; with p < 2 pins p = 1.
- hTail : 2 * G.indepNum + 1 ≤ 3 * p -- p = 1: alpha ≤ 1 (leafEndpointAtOne). p ≥ 2: 2((alpha - 1) - (p - 1)) ≤ p - 1 (leaf_tagged_monotone).
- (none) -- No selector, residual, connectivity, IsTree or Nonempty hypothesis appears in any hypothesis text.

FENCES:
- §3.1: a statement about independent-set counts on finite bipartite graphs; not a no-recovery statement; no status transfer to E993-R25-UNR-FOREST-WIDE, E993-G1WIDE-NO-SIZE-CAP, NR1, FOREST, TREE, TRANSFER, E993-BETA-AGG or Erdős #993.
- §3.3: nothing below the guard; the lower region 3p < 2 alpha + 1 is out of scope.
- §3.4: NOT E993-BETA-TARGET (REFUTED; its witnesses fail the guard); not an alias of any refuted key.
- §3.7: attribution travels on every face.
- §3.8: a separate certificate; E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE changes OPEN → VERIFIED only by this award's close; the carried internal lemmas (entries 41–42) are context, never certificates.

ATTRIBUTION:
- Codex (GPT-6 Luna/Sol/Astra): the tagged-shadow mechanism, entries 41/42, the proposed statement, the identification of the p = 1 gap and the bipartite-free endpoint observation (prior art).
- r24 C4-LA1: entries 1–4 (selector and leaf definitions); r26: entries 5–14 (the C5LA1 layer); the first-interior source: entry 18.
- r29: T1 (the p = 1 endpoint; deg(s) − 1); C-T1-F (A1), C-T1-U (two-branch), C-F1-T (A3), C-F1-U (A3), U adjudicator (leafEndpointAtOne): the bipartite-free endpoint; U1 and the critics: compiles; T2: the aggregate corollary's use.
- Bodies of the new declarations: carried byte-identically from the U adjudicator's scratch candidate ADJ-U-tails-LA2.lean (5db83f7b23f0afaad7bc844402b1ffd9435f76390063e0ff133e9b720d15ca0a), the plan of record (critic/adjudicator-attributed).
- Formalizer seat: c1-la2-formalizer-opus-20260925, chartered Claude Opus 5.5 high; runtime-reported id claude-opus-5-5[1m].

EXCLUDED CONCLUSIONS:
- No sign below the guard; the guard is sharp (B1).
- No favorable-selector, eligibility or residual statement.
- No non-bipartite p ≥ 2 statement (false: P_3 ⊔ 2K_3, B4). The graph-general p = 1 companion (leafEndpointAtOne) is a lemma, not a registered claim until SR-1.
- No transfer to E993-BETA-AGG, to the all-rank E993-R23-…, or to any no-recovery key.
- No strict sign.

The same fields, structured, are bound as source material SOURCE/CONTRACT-FACE.json.

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
