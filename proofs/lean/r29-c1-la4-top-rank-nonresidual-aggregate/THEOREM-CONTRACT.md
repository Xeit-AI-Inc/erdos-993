# Theorem Contract: Top-rank non-residual favorable-leaf aggregate on trees (TRN)

- Contract ID: `e993-r29-c1-la4-top-rank-nonresidual-aggregate-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `beb1d60b6e3cd41c79f677a0ca12a02c8c5950e0db4af6dc45c80653348cad8e`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite ordinary tree T with alpha = alpha(T), x = x(T) and integer rank p = alpha - 1: if x + 2 <= p, then S(T, p) = sum over original leaves v with Delta_p(T - v) < 0 of [Delta_(p-1)(T - {v, s_v}) - Delta_(p-1)(T - N_T[s_v])] <= 0. Key E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE (TRN), award C1-LA4 of r29 (canonical run id erdos-993-math-dre-20260925-r29-high-tail-certification).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993HighTail.topRankNonResidualAggregate`
- Statement SHA-256: `b21887c09fcf9d7c68abd02b3465e7f3e297ccdf3e2ba9b62089feedfeb0e44e`

```lean
theorem topRankNonResidualAggregate {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree)
    (hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1) :
    C5LA1.aggregate G (G.indepNum - 1) ≤ 0
```

## Quantifiers

- `forall V` over `domain-v`
- `forall G` over `domain-g`

## Hypotheses

- `hyp-tree`: hT : G.IsTree. G is a finite ordinary tree (connected and acyclic). Consumption: ONLY through acyclicity, as hT.isAcyclic.isBipartite (Mathlib IsAcyclic.isBipartite, Acyclic.lean:617), which feeds G.IsBipartite to the carried entry 44. Connectivity is not consumed; no Nonempty V, edge count or IsTree.card_edgeFinset is used. The bipartite 2-colouring is used only inside the carried entry 41 (Core.card_extension_le / Core.indep_union_color).
- `hyp-eligible`: hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1, in Nat with truncated subtraction: x(G) + 2 <= alpha(G) - 1. Nat/Int equivalence for EVERY alpha: for alpha >= 1, alpha - 1 (Nat) equals the integer alpha - 1, so the premise is literally the integer premise x + 2 <= p with p = alpha - 1; for alpha = 0 the Nat right side is 0 and the integer right side is -1, and for alpha = 1 both are 0, so both premises are false when alpha <= 1. Nothing is added or strengthened. Consumption: only in lemma E993HighTail.topRankEligibleAlphaGeFour (S7), which derives 4 <= alpha (alpha >= 3 by arithmetic; alpha = 3 would force x = 0, contradicting Delta_0(G) = n - 1 >= 2). Consequently the rank G.indepNum - 1 equals the integer alpha - 1 >= 3 and the aggregate's inner p - 1 equals the integer alpha - 2; entry 44's side conditions 2 <= p and 2 * alpha + 1 <= 3 * p are discharged by omega.

## Conclusion

- `conclusion`: C5LA1.aggregate G (G.indepNum - 1) ≤ 0: with integer p = alpha(G) - 1, the sum over every original leaf v with Delta_p(G - v) < 0 of Delta_(p-1)(G - {v, s_v}) - Delta_(p-1)(G - N_G[s_v]) is nonpositive. Non-strict inequality only.

## Dependencies

- `def-acyclic` -> `def-tree`
- `def-univ` -> `def-vdel-count`
- `def-vdel-count` -> `def-vdel-delta`
- `def-vdel-delta` -> `def-favorable`
- `def-leaf` -> `def-support`
- `def-leaf` -> `def-leafset`
- `def-univ` -> `def-leafset`
- `def-leafset` -> `def-leafdegree`
- `def-support` -> `def-h`
- `def-support` -> `def-r`
- `def-univ` -> `def-avoiding`
- `def-avoiding` -> `def-count`
- `def-count` -> `def-delta`
- `def-leafset` -> `def-aggregate`
- `def-favorable` -> `def-aggregate`
- `def-h` -> `def-aggregate`
- `def-r` -> `def-aggregate`
- `def-delta` -> `def-aggregate`
- `def-delta` -> `def-crossing`
- `def-alpha` -> `def-crossing`
- `def-univ` -> `def-tagged`
- `domain-v` -> `domain-g`
- `domain-g` -> `hyp-tree`
- `def-tree` -> `hyp-tree`
- `def-alpha` -> `hyp-eligible`
- `def-crossing` -> `hyp-eligible`
- `hyp-tree` -> `conclusion`
- `hyp-eligible` -> `conclusion`
- `def-aggregate` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `Classical.choice`, `Quot.sound`, `propext`

## Source Evidence

- `source-1`: `INFORMAL-PROOF.md` (match)
- `source-10`: `SOURCE/c1-stage7-sources/SOURCE-DIGESTS.json` (match)
- `source-11`: `SOURCE/c1-stage7-sources/ADJ-U-awards-LA4b-Main.lean` (match)
- `source-12`: `SOURCE/c1-stage7-sources/ADJ-T-CarryLA4.lean` (match)
- `source-13`: `SOURCE/c1-stage7-sources/ADJ-U-awards-LA4a-Main.lean` (match)
- `source-14`: `SOURCE/c1-stage7-sources/C-U1-F-LA4-Main.lean` (match)
- `source-15`: `SOURCE/c1-stage7-sources/C-T2-U-CritTRN.lean` (match)
- `source-16`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `source-17`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `source-18`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `source-19`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `source-2`: `CAPSULE-VERIFICATION.json` (match)
- `source-20`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `source-21`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `source-22`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-leafDegree.lean.fragment` (match)
- `source-23`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-H.lean.fragment` (match)
- `source-24`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-R.lean.fragment` (match)
- `source-25`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `source-26`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `source-27`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `source-28`: `LeanProject/LeanProof/Snippets/0013-definition-C5LA1-aggregate.lean.fragment` (match)
- `source-29`: `LeanProject/LeanProof/Snippets/0014-definition-C5LA1-crossingIndex.lean.fragment` (match)
- `source-3`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `source-30`: `LeanProject/LeanProof/Snippets/0015-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `source-31`: `LeanProject/LeanProof/Snippets/0016-lemma-E993Interior-taggedShadowBound.lean.fragment` (match)
- `source-32`: `LeanProject/LeanProof/Snippets/0017-lemma-E993Interior-highTailAggregateFromShadow.lean.fragment` (match)
- `source-33`: `LeanProject/LeanProof/Snippets/0018-lemma-E993Interior-bipartiteHighTailAggregate.lean.fragment` (match)
- `source-4`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `source-5`: `SOURCE/SYNTHESIS.md` (match)
- `source-6`: `SOURCE/C1-STAGE7-FORMALIZER-BRIEF-LA4.md` (match)
- `source-7`: `SOURCE/C1-STAGE7-PROTOCOL.md` (match)
- `source-8`: `SOURCE/first-interior/Main.lean` (match)
- `source-9`: `SOURCE/first-interior/FORMALIZATION-STATE.json` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
