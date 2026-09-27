# r30-c5-la1-gk-weighted-hall-every-eligible-rank

Declaration `E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank`, exported byte-for-byte from the sealed internal run `erdos-993-weighted-transport-dre-2026-09-26` (`runs/lean-2026-09-27-c5-la1-gk-weighted-hall-every-eligible-rank`; r30 — see
[`experiments/r30-weighted-transport.md`](../../../experiments/r30-weighted-transport.md)). Award `C5-LA1`; registry effect `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem gk_lowerRegionWeightedHall_everyEligibleRank (k : ℕ) :
    (gkGraph k).IsTree ∧
    ∀ p : ℕ, C5LA1.crossingIndex (gkGraph k) + 2 ≤ p → 3 * p < 2 * (gkGraph k).indepNum + 1 →
      ∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> For every k : Nat, the graph G_k = gkGraph k on Fin (3k+5) (root 0; leaf 1; cherry 2 with leaves 3, 4; k arms 0 - a_i - b_i - c_i) is a tree, and for every rank p with crossingIndex(G_k) + 2 <= p and 3p < 2 indepNum(G_k) + 1 the transport network of SOLUTION-CONTRACT section 2 at rank p with tag set F_p(G_k) = favorableLeaves (gkGraph k) p admits a saturating integral flow. hLow is carried and unused. Proof DAG: N0 carried (C4-LA1 entries 1-112, first-interior entry 14); N1 gkGraph_isTree (U1); N4a count bridge i_(j+1) = u_(j+1) + u_j, i_0 = u_0 (gkHalfCount); N4b u_j <= u_(j+2) for j + 2 <= k + 1; N4 = GK-MONO in Lean (0 <= Delta_j for j <= k); N2 k + 1 <= crossingIndex iff no descent at j <= k (C-U1-F); N3 reduction to C4-LA1 lemma entry 110 (C-U1-F); terminal = <N1, N3 o N2 o N4>. Fences: G_k only; deletion-supported flows (C4-LA1's); not (HALL) at full scope; not 'every tree'; nothing about the primary aggregate beyond G_k; not an RTree statement; not the strict GK-SIGN; G_k is not a second family for gate ruling 39; the k = 3 row (n = 14, p = 6) lies in the formally closed band n <= 2p+2 and is covered without re-proving that band; no statement about switch arcs or cuts; no status change of (HALL), the primary aggregate or any refuted key; (HALL) is asserted at no scope other than this theorem's own family. Companions: GK-MONO (key E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE) is stated on the face as a companion; its Lean form is the lemma gk_forwardDifference_nonneg (N4); this contract asserts no grade for any companion (the controller rules). Eligible set nonempty iff k >= 3 (informal companion fact, SR-C4-8; indepNum = 2k+3 not authored). Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport; award C5-LA1; key on closure E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK (separate from C4-LA1's key). Attribution: mechanism and the lower-region run: Codex GPT-6; definition layers: first-interior (Codex) entries 1-18 incl. C5LA1.crossingIndex (entry 14), the r26/r24/r25 carried layers; C1-LA1/C1-LA2 (r30); the G_k flow: C4-LA1 (r30 Cycle 4; CT-1 by critic C-F2-T, R2' by the Cycle 4 F adjudicator); gkGraph_isTree: U1 (Claude Sonnet 5); GK-MONO: C-U1-T and C-U1-F (Claude Opus 5.5); the Lean reduction: C-U1-F; the composition and DAG: the Cycle 5 U adjudicator (Claude Opus 5.5); count bridge fibre count, N4b re-pairing and integer closing step, and Lean assembly: the C5-LA1 formalizer (Claude Opus 5.5); r29 high tail: not used.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
active-tag transport network on finite simple graphs or on the named tree family; nothing about (HALL) at full scope, the lower-region
aggregate beyond the named family, `E993-BETA-AGG`, no-recovery, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
