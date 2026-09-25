# Theorem Contract: C1-LA2 (HTP): bipartite leaf high-tail pointwise sign, key E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE, with the (HTA) aggregate companion on its face

- Contract ID: `erdos-993-math-dre-20260925-r29-high-tail-certification-c1-la2-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `7ef3f53a84e9abe33a773b8f71ae053580ff83681057ae5d3f0d28a8d2664ece`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite simple bipartite graph G, every original degree-one vertex v of G with support s, and every integer p >= 1 with 3p >= 2 alpha(G) + 1: Delta_(p-1)(G - {v, s}) - Delta_(p-1)(G - N_G[s]) <= 0, where Delta_k(G - D) = i_(k+1)(G - D) - i_k(G - D) counts independent sets on the ORIGINAL carrier avoiding D. No selector, residual, connectivity or nonemptiness hypothesis. Companion (HTA), a lemma on the same face: under G bipartite, p >= 1 and 3p >= 2 alpha(G) + 1, the aggregate S(G, p) = C5LA1.aggregate G p <= 0 (original strict selector Delta_p(G - v) < 0; one tag per original leaf).

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

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993HighTail.bipartiteLeafHighTailPointwise`
- Statement SHA-256: `805b158547459c55f9ffe2268be7a038d567fd0304528f2fc1a458e5567031d2`

```lean
theorem bipartiteLeafHighTailPointwise {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hBip : G.IsBipartite) (v : V) (hv : C4LA1.IsGraphLeaf G v)
    (p : ℕ) (hp : 1 ≤ p) (hTail : 2 * G.indepNum + 1 ≤ 3 * p) :
    C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0
```

## Quantifiers

- `forall V` over `domain-vertex-type`
- `forall G` over `domain-g`
- `forall v` over `domain-leaf-vertex`
- `forall p` over `domain-p`

## Hypotheses

- `hyp-hbip`: hBip : G.IsBipartite
- `hyp-hv`: hv : C4LA1.IsGraphLeaf G v
- `hyp-hp`: hp : 1 ≤ p
- `hyp-htail`: hTail : 2 * G.indepNum + 1 ≤ 3 * p

## Conclusion

- `conclusion`: C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) - C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1) ≤ 0

## Dependencies

- `def-vertexdeletionindepsetcount` -> `def-vertexdeletionforwarddifference`
- `def-vertexdeletionforwarddifference` -> `def-isfavorableat`
- `def-isgraphleaf` -> `def-support`
- `def-isgraphleaf` -> `def-leafset`
- `def-finset-univ` -> `def-leafset`
- `def-leafset` -> `def-leafdegree`
- `def-support` -> `def-h`
- `def-support` -> `def-r`
- `def-finset-univ` -> `def-indepsetsavoiding`
- `def-indepsetsavoiding` -> `def-indepsetcount`
- `def-indepsetcount` -> `def-forwarddifferencedel`
- `def-leafset` -> `def-aggregate`
- `def-isfavorableat` -> `def-aggregate`
- `def-forwarddifferencedel` -> `def-aggregate`
- `def-h` -> `def-aggregate`
- `def-r` -> `def-aggregate`
- `def-forwarddifferencedel` -> `def-crossingindex`
- `domain-vertex-type` -> `domain-g`
- `domain-vertex-type` -> `domain-leaf-vertex`
- `def-simplegraph-isbipartite` -> `hyp-hbip`
- `domain-g` -> `hyp-hbip`
- `def-isgraphleaf` -> `hyp-hv`
- `domain-g` -> `hyp-hv`
- `domain-leaf-vertex` -> `hyp-hv`
- `domain-p` -> `hyp-hp`
- `def-simplegraph-indepnum` -> `hyp-htail`
- `domain-g` -> `hyp-htail`
- `domain-p` -> `hyp-htail`
- `hyp-hbip` -> `conclusion`
- `hyp-hv` -> `conclusion`
- `hyp-hp` -> `conclusion`
- `hyp-htail` -> `conclusion`
- `def-forwarddifferencedel` -> `conclusion`
- `def-h` -> `conclusion`
- `def-r` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCE/intent/C1-STAGE7-FORMALIZER-BRIEF-LA2.md` (match)
- `src-capsule-manifest`: `SOURCE/intent/C1-LA2-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-adj-t-carryla2-lean`: `SOURCE/frozen/c1-stage7-sources/ADJ-T-CarryLA2.lean` (match)
- `src-carry-adj-u-awards-la2-main-lean`: `SOURCE/frozen/c1-stage7-sources/ADJ-U-awards-LA2-Main.lean` (match)
- `src-carry-adj-u-tails-la2-lean`: `SOURCE/frozen/c1-stage7-sources/ADJ-U-tails-LA2.lean` (match)
- `src-carry-c-u1-f-la2-main-lean`: `SOURCE/frozen/c1-stage7-sources/C-U1-F-LA2-Main.lean` (match)
- `src-carry-source-digests-json`: `SOURCE/frozen/c1-stage7-sources/SOURCE-DIGESTS.json` (match)
- `src-carry-u1-e993hightail-append-lean`: `SOURCE/frozen/c1-stage7-sources/U1-E993HighTail-append.lean` (match)
- `src-companion-statement-hta`: `SOURCE/COMPANION-STATEMENT.txt` (match)
- `src-contract-face`: `SOURCE/CONTRACT-FACE.json` (match)
- `src-fragment-0001`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-fragment-0002`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-fragment-0003`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-fragment-0004`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-fragment-0005`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `src-fragment-0006`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-fragment-0007`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-leafDegree.lean.fragment` (match)
- `src-fragment-0008`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-H.lean.fragment` (match)
- `src-fragment-0009`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-R.lean.fragment` (match)
- `src-fragment-0010`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-fragment-0011`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-fragment-0012`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `src-fragment-0013`: `LeanProject/LeanProof/Snippets/0013-definition-C5LA1-aggregate.lean.fragment` (match)
- `src-fragment-0014`: `LeanProject/LeanProof/Snippets/0014-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `src-fragment-0015`: `LeanProject/LeanProof/Snippets/0015-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `src-fragment-0016`: `LeanProject/LeanProof/Snippets/0016-lemma-E993Interior-taggedShadowBound.lean.fragment` (match)
- `src-fragment-0017`: `LeanProject/LeanProof/Snippets/0017-lemma-E993Interior-highTailAggregateFromShadow.lean.fragment` (match)
- `src-fragment-0018`: `LeanProject/LeanProof/Snippets/0018-lemma-E993HighTail-indepSetCount_zero.lean.fragment` (match)
- `src-fragment-0019`: `LeanProject/LeanProof/Snippets/0019-lemma-E993HighTail-indepSetCount_one.lean.fragment` (match)
- `src-fragment-0020`: `LeanProject/LeanProof/Snippets/0020-lemma-E993HighTail-forwardDifferenceDel_zero_eq.lean.fragment` (match)
- `src-fragment-0021`: `LeanProject/LeanProof/Snippets/0021-lemma-E993HighTail-leafTermAtOne_eq_degSubOne.lean.fragment` (match)
- `src-fragment-0022`: `LeanProject/LeanProof/Snippets/0022-lemma-E993HighTail-leafEndpointAtOne.lean.fragment` (match)
- `src-fragment-0023`: `LeanProject/LeanProof/Snippets/0023-lemma-E993HighTail-leafHighTailPointwiseAux.lean.fragment` (match)
- `src-fragment-0024`: `LeanProject/LeanProof/Snippets/0024-lemma-E993HighTail-bipartiteHighTailAggregateAllRanks.lean.fragment` (match)
- `src-fragment-0025`: `LeanProject/LeanProof/Snippets/0025-theorem-E993HighTail-bipartiteLeafHighTailPointwise.lean.fragment` (match)
- `src-frozen-first-interior-main`: `SOURCE/frozen/first-interior/Main.lean` (match)
- `src-frozen-first-interior-state`: `SOURCE/frozen/first-interior/FORMALIZATION-STATE.json` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-semantic-contract`: `SOURCE/intent/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/intent/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/intent/SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
