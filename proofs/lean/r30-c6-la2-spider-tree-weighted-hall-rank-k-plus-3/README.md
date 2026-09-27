# r30-c6-la2-spider-tree-weighted-hall-rank-k-plus-3

Declaration `E993Transport.spiderOneTwoThrees_treeWeightedHall_kPlus3`, exported byte-for-byte from the sealed internal run `erdos-993-weighted-transport-dre-2026-09-26` (`runs/lean-2026-09-28-c6-la2-spider-tree-weighted-hall-rank-k-plus-3`; r30 — see
[`experiments/r30-weighted-transport.md`](../../../experiments/r30-weighted-transport.md)). Award `C6-LA2`; registry effect `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5 (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem spiderOneTwoThrees_treeWeightedHall_kPlus3 (k : ℕ) (hk : 5 ≤ k) :
    (spiderOneTwoThrees k).IsTree ∧
    C5LA1.crossingIndex (spiderOneTwoThrees k) + 2 ≤ k + 3 ∧
    3 * (k + 3) < 2 * (spiderOneTwoThrees k).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (spiderOneTwoThrees k)
      (favorableLeaves (spiderOneTwoThrees k) (k + 3)) (k + 3) f
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> Canonical run id erdos-993-math-dre-20260926-r30-weighted-transport; award C6-LA2; key on closure E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-TREE-WEIGHTED-HALL-AT-RANK-K-PLUS-3-FOR-K-AT-LEAST-5 (a SEPARATE key from the registered proved_informal spider key). For every natural k >= 5, the spider S(1,2,3^k) = spiderOneTwoThrees k on Fin (3k+4) (root 0; pendant leaf 1; pendant path 0-2-3; k pendant paths 0-a_i-b_i-c_i with a_i = 4+3i, b_i = 5+3i, c_i = 6+3i) is a tree; its first strict descent x = C5LA1.crossingIndex satisfies x + 2 <= k + 3; 3(k+3) < 2*alpha + 1 with alpha = indepNum; and the transport network of the spider at rank p = k+3 with the fixed original strict selector F = favorableLeaves (spider) (k+3) has a saturating integral flow (IsSaturatingFlow: positive only on transportRel arcs = (D) deletion union (S) two-for-one switch; every source in I_{k+4} sends exactly its activeWeight, the number of ACTIVE tags; every target in I_{k+3} receives at most its activeWeight). That is: the rank k+3 is eligible and (HALL) holds there. The hypothesis 5 <= k is used only for the low window. Fences on the face: S(1,2,3^k) only; rank k+3 only; k >= 5 only (the statement is FALSE for k <= 4 because the low window 3(k+3) < 2*alpha+1 = 4k+5 is empty there); deletion-supported flows. NOT (HALL) at full scope; NOT every eligible rank of the spider (needs N3b, whose Newton dependency is undischarged; the registered proved_informal spider key E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2 keeps that scope and is NOT superseded at other ranks); NOT every tree; mechanism is not aggregate: nothing on the primary aggregate; not an RTree statement; no statement about switch arcs; no status change of (HALL), the primary aggregate, E993-R23-..., BETA-AGG, TREE, FOREST, TRANSFER, any refuted key or #993; the per-tag deletion on this one family is family-scoped and revives nothing (the universal per-leaf key is REFUTED). No grade is asserted for any companion lemma (R29-N-12). Attribution: mechanism, active-tag weight, relation, the (HALL) key and the lower-region run: Codex GPT-6 (Astra/Sol/Luna); the sharp boundary 3p < 2alpha+1 and high-tail certificates: r29 (Claude, Fable-controlled); definition entries 1-18 incl. C5LA1.crossingIndex (entry 14): the first-interior run (Codex) and the r26/r24/r25 layers; the network definitions: C1-LA1 (r30 Cycle 1); the graph-generic chain machinery and the per-tag composition (entry 75): C4-LA1 (r30 Cycle 4); the spider family theorem: r30 Cycle 5 (critic C-F2-U, Claude Opus 5.5; E-2 per-tag sufficiency: F2, Claude Sonnet 5; hook discharge: the Cycle 5 F adjudicator; SR-C5-2 reader); r30 Cycle 6: U1 (Claude Sonnet 5) the spider definition and tree layer; C-U1-F (Claude Opus 5.5) alpha equality, the low window, the composition face, the root split; C-U1-T (Claude Opus 5.5) the chain carry, the block assignment, the root split, the alpha lower bound; the U adjudicator (Claude Opus 5.5) node (F0) and the carry verification; the tree-layer pattern: C5-LA1 (r30 Cycle 5 formalizer). Lean text: the C6-LA2 formalizer (producer c6-la2-formalizer-opus-20260928; chartered Claude Opus 5.5; runtime-reported model id claude-opus-5-5[1m]).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
active-tag transport network on finite simple graphs or on the named tree family; nothing about (HALL) at full scope, the lower-region
aggregate beyond the named family, `E993-BETA-AGG`, no-recovery, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
