# Theorem Contract: C1-LA1 (WID): active-tag weight / aggregate identity, E993Transport.activeWeightAggregateIdentity (key E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY)

- Contract ID: `e993-r30-c1-la1-active-tag-weight-aggregate-identity-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `539bee231e266a57c312e8efa24fab8bf3000fb2dc090bd0756ca167d21ec3c9`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Run erdos-993-math-dre-20260926-r30-weighted-transport (r30), Cycle 1 Stage 7, award group C1-LA1; Lean run root runs/lean-2026-09-26-c1-la1-active-tag-weight-identity; producer c1-la1-formalizer-opus-20260926. For every finite vertex type V with decidable equality, every simple graph G on V with decidable adjacency, and every natural p with 1 <= p: let F = F_p(G) be the original leaves of G that are strictly favorable at rank p (fixed at p). For an independent set B let w_F(B) be the number of ACTIVE tags of B, i.e. of v in F n B such that B contains another neighbour of the original support s_v of v ((B \ {v}) n W_v nonempty, W_v = N(s_v) \ {v}); never |F n B|. Then, in the integers, sum_{B in I_(p+1)(G)} w_F(B) - sum_{A in I_p(G)} w_F(A) = S(G, p) = C5LA1.aggregate G p. Graph-generic (no IsTree, no eligibility). hp is kept as in SOLUTION-CONTRACT §2 and is not needed for this form (F_0 = ∅); it is load-bearing for the general-F companion lemma layerWeight_sub_eq_sum (K_{1,3}, p = 0: 0 vs 6). Grades (this contract's list only): on this award's governed close, E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY OPEN -> VERIFIED formally_verified at exactly this statement; companion lemmas (indepFamily_eq_indepSetsAvoiding, isGraphLeaf_of_mem_favorableLeaves, tagWitnesses_subset_R, card_active_eq_tagged, layerWeight_eq_sum_card, layerWeight_sub_eq_sum, and the seven C-U2-T draft-text equivalences) carry no certificate of their own (R29-N-12); the carried first-interior lemma E993Interior.highTailAggregateFromShadow is carried only for its private helpers and is neither used nor re-graded. Equivalent-phrasing authority: C1-STAGE1-GATE.md Gate ruling 9 ("equivalent Lean phrasings with the equivalence proved"); the SOLUTION-CONTRACT §2 draft text is related to the compiled phrasing by the companions *_draftText and layerWeight_sub_eq_sum_draftBinders (C-U2-T's CriticContract.lean equivalences, re-derived). Signature deviations from the §2 draft, attributed correctly: noncomputable on tagWitnesses/activeWeight/layerWeight/favorableLeaves and classical decidability (required: the §2 text does not compile verbatim, C-U2-F ContractVerbatim.lean); layerWeight_sub_eq_sum takes an explicit G (the §2 draft has {G}), recorded as the frozen phrasing (synthesis repair 5). The terminal theorem's binders equal §2's. Excluded conclusions: (HALL) or (HALL-COND) on trees or any graph; the sign of S; E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE; any tree-only statement; RTree wording; census values; TREE/FOREST/TRANSFER; Erdős #993. transportRel, IsSaturatingFlow and WeightedHall are frozen in this file only so that they freeze once for C1-LA2; transportRel is (D) union (S) literally (exactly two neighbours, u not in B). Attribution: the active-tag weight, the mechanism and its corrections: Codex (GPT-6 Astra/Sol/Luna), lower-region run; definitions of record entries 1-18 and 42: the first-interior run (Codex) on the r24/r25/r26 definition layers (C4LA1, C5LA1); the informal proof: r30 F2 (Claude Sonnet 5); the Lean proofs: r30 U2 (Claude Sonnet 5); companions and fidelity findings: C-U2-T, C-U2-F, C-F2-T, C-F2-U (Claude Opus 5.5); reconciliation: the T/F/U adjudicators and the Cycle 1 synthesis (Claude Opus 5.5); Stage 7 formalization (carry, freeze repairs, contract): c1-la1-formalizer-opus-20260926 (Claude Opus 5.5).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.activeWeightAggregateIdentity`
- Statement SHA-256: `661470f6c5b1e6daed31e57287f7d7f7f64ef17b8b9d0369d197e89f51212323`

```lean
theorem activeWeightAggregateIdentity (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) :
    (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) - layerWeight G (favorableLeaves G p) p =
      C5LA1.aggregate G p
```

## Quantifiers

- `forall V` over `dom-vertex-type`
- `forall G` over `dom-graph`
- `forall p` over `dom-rank`

## Hypotheses

- `hyp-finite-vertex-type`: [Fintype V] [DecidableEq V] (verbatim section variables). Enters every Finset family (univ, powersetCard, filters) and the finite sums.
- `hyp-decidable-adjacency`: [DecidableRel G.Adj] (verbatim binder). Enters neighborFinset (W_v, R_v) and the independence filters.
- `hyp-rank-at-least-one`: (hp : 1 ≤ p) (verbatim binder), kept as in SOLUTION-CONTRACT §2. N/Z equivalence: under hp the natural-number subtraction p - 1 inside C5LA1.aggregate (and in the companion layerWeight_sub_eq_sum) equals the integer p - 1, and (p - 1) + 1 = p. hp is NOT needed for this specialized form, since F_0 = ∅ (for a leaf v, Delta_0(G - v) = (n - 1) - 1 >= 0, so no leaf is favorable at rank 0 and both sides vanish at p = 0). hp IS load-bearing for the general-F companion lemma layerWeight_sub_eq_sum: K_{1,3} with F its three leaves at p = 0 gives 0 against 6.

## Conclusion

- `conclusion`: (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) - layerWeight G (favorableLeaves G p) p = C5LA1.aggregate G p. In words: with F = F_p(G) fixed at rank p, the total active-tag weight of the independent (p+1)-sets (supply) minus that of the independent p-sets (capacity), in Z, equals the literal aggregate S(G, p). No sign content: nothing about (HALL), (HALL-COND), S <= 0, or any tree statement.

## Dependencies

- `def-c4-vertex-deletion-indep-set-count` -> `def-c4-vertex-deletion-forward-difference`
- `def-c4-vertex-deletion-forward-difference` -> `def-c4-is-favorable-at`
- `def-c4-is-graph-leaf` -> `def-c5-support`
- `def-c4-is-graph-leaf` -> `def-c5-leaf-set`
- `def-c5-support` -> `def-c5-h`
- `def-c5-support` -> `def-c5-r`
- `def-c5-indep-sets-avoiding` -> `def-c5-indep-set-count`
- `def-c5-indep-set-count` -> `def-c5-forward-difference-del`
- `def-c5-leaf-set` -> `def-c5-aggregate`
- `def-c4-is-favorable-at` -> `def-c5-aggregate`
- `def-c5-forward-difference-del` -> `def-c5-aggregate`
- `def-c5-h` -> `def-c5-aggregate`
- `def-c5-r` -> `def-c5-aggregate`
- `def-c5-support` -> `def-t-tag-witnesses`
- `def-t-tag-witnesses` -> `def-t-active-weight`
- `def-t-indep-family` -> `def-t-layer-weight`
- `def-t-active-weight` -> `def-t-layer-weight`
- `def-c5-leaf-set` -> `def-t-favorable-leaves`
- `def-c4-is-favorable-at` -> `def-t-favorable-leaves`
- `def-t-indep-family` -> `def-t-is-saturating-flow`
- `def-t-transport-rel` -> `def-t-is-saturating-flow`
- `def-t-active-weight` -> `def-t-is-saturating-flow`
- `def-t-indep-family` -> `def-t-weighted-hall`
- `def-t-active-weight` -> `def-t-weighted-hall`
- `def-t-transport-rel` -> `def-t-weighted-hall`
- `dom-vertex-type` -> `dom-graph`
- `dom-vertex-type` -> `hyp-finite-vertex-type`
- `dom-graph` -> `hyp-decidable-adjacency`
- `dom-rank` -> `hyp-rank-at-least-one`
- `hyp-finite-vertex-type` -> `conclusion`
- `hyp-decidable-adjacency` -> `conclusion`
- `hyp-rank-at-least-one` -> `conclusion`
- `def-t-layer-weight` -> `conclusion`
- `def-t-favorable-leaves` -> `conclusion`
- `def-c5-aggregate` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-c-u2-f-contract-verbatim`: `SOURCE/C-U2-F-ContractVerbatim.lean` (match)
- `src-c-u2-t-critic-contract`: `SOURCE/C-U2-T-CriticContract.lean` (match)
- `src-c1-synthesis`: `SOURCE/C1-STAGE6-SYNTHESIS.md` (match)
- `src-c1-u-adjudication`: `SOURCE/C1-STAGE5-U-ADJUDICATION.md` (match)
- `src-capsule-manifest`: `SOURCE/C1-LA1-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-digests`: `SOURCE/c1-stage7-sources-SOURCE-DIGESTS.json` (match)
- `src-first-interior-main`: `SOURCE/first-interior-Main.lean` (match)
- `src-first-interior-state`: `SOURCE/first-interior-FORMALIZATION-STATE.json` (match)
- `src-formalizer-brief`: `SOURCE/C1-STAGE7-FORMALIZER-BRIEF-LA1.md` (match)
- `src-frag-01`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `src-frag-02`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `src-frag-03`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `src-frag-04`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `src-frag-05`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `src-frag-06`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `src-frag-07`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-H.lean.fragment` (match)
- `src-frag-08`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-R.lean.fragment` (match)
- `src-frag-09`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `src-frag-10`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `src-frag-11`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `src-frag-12`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `src-frag-13`: `LeanProject/LeanProof/Snippets/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `src-frag-14`: `LeanProject/LeanProof/Snippets/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `src-frag-15`: `LeanProject/LeanProof/Snippets/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `src-frag-16`: `LeanProject/LeanProof/Snippets/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `src-frag-17`: `LeanProject/LeanProof/Snippets/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `src-frag-18`: `LeanProject/LeanProof/Snippets/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `src-frag-19`: `LeanProject/LeanProof/Snippets/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `src-frag-20`: `LeanProject/LeanProof/Snippets/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `src-frag-21`: `LeanProject/LeanProof/Snippets/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `src-frag-22`: `LeanProject/LeanProof/Snippets/0022-lemma-E993Interior-highTailAggregateFromShadow.lean.fragment` (match)
- `src-frag-23`: `LeanProject/LeanProof/Snippets/0023-lemma-E993Transport-indepFamily_eq_indepSetsAvoiding.lean.fragment` (match)
- `src-frag-24`: `LeanProject/LeanProof/Snippets/0024-lemma-E993Transport-isGraphLeaf_of_mem_favorableLeaves.lean.fragment` (match)
- `src-frag-25`: `LeanProject/LeanProof/Snippets/0025-lemma-E993Transport-tagWitnesses_subset_R.lean.fragment` (match)
- `src-frag-26`: `LeanProject/LeanProof/Snippets/0026-lemma-E993Transport-card_active_eq_tagged.lean.fragment` (match)
- `src-frag-27`: `LeanProject/LeanProof/Snippets/0027-lemma-E993Transport-layerWeight_eq_sum_card.lean.fragment` (match)
- `src-frag-28`: `LeanProject/LeanProof/Snippets/0028-lemma-E993Transport-layerWeight_sub_eq_sum.lean.fragment` (match)
- `src-frag-29`: `LeanProject/LeanProof/Snippets/0029-lemma-E993Transport-indepFamily_eq_draftText.lean.fragment` (match)
- `src-frag-30`: `LeanProject/LeanProof/Snippets/0030-lemma-E993Transport-tagWitnesses_eq_draftText.lean.fragment` (match)
- `src-frag-31`: `LeanProject/LeanProof/Snippets/0031-lemma-E993Transport-activeWeight_eq_draftText.lean.fragment` (match)
- `src-frag-32`: `LeanProject/LeanProof/Snippets/0032-lemma-E993Transport-layerWeight_eq_draftText.lean.fragment` (match)
- `src-frag-33`: `LeanProject/LeanProof/Snippets/0033-lemma-E993Transport-favorableLeaves_eq_draftText.lean.fragment` (match)
- `src-frag-34`: `LeanProject/LeanProof/Snippets/0034-lemma-E993Transport-transportRel_iff_draftText.lean.fragment` (match)
- `src-frag-35`: `LeanProject/LeanProof/Snippets/0035-lemma-E993Transport-layerWeight_sub_eq_sum_draftBinders.lean.fragment` (match)
- `src-frag-36`: `LeanProject/LeanProof/Snippets/0036-theorem-E993Transport-activeWeightAggregateIdentity.lean.fragment` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-u2-draft-contract`: `SOURCE/U2-THEOREM-CONTRACT-draft-WID.json` (match)
- `src-u2-main`: `SOURCE/U2-Main.lean` (match)
- `src-u2-part1`: `SOURCE/U2-e993transport_part1.lean` (match)
- `src-u2-part2`: `SOURCE/U2-e993transport_part2.lean` (match)
- `src-u2-part3`: `SOURCE/U2-e993transport_part3.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
