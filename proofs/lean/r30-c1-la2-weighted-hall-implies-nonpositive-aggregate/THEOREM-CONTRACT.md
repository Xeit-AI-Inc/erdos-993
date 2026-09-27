# Theorem Contract: C1-LA2 (r30, run erdos-993-math-dre-20260926-r30-weighted-transport): weighted Hall at the fixed selector implies a nonpositive aggregate, E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (STATED)

- Contract ID: `e993-r30-c1-la2-weighted-hall-implies-nonpositive-aggregate-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `open`
- Contract SHA-256: `c9c16b09f06d9477e945e5f0909d2ad6a91c596b54a3bacd9f3dd6169a8b4edc`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite vertex type V, every simple graph G on V and every natural p >= 1: if the weighted Hall condition (HALL-COND) holds for the transport network at rank p with the fixed original selector F = F_p(G) (active-tag weights w_F on the independent (p+1)-sets and p-sets; relation (D) ∪ (S) literally), i.e. for every X ⊆ I_(p+1)(G) the w_F-weight of X is at most the w_F-weight of the targets joined to X, then C5LA1.aggregate G p = S(G, p) <= 0. Graph-generic (no IsTree, no eligibility). The hypothesis is (HALL-COND) for EVERY X; the conclusion depends on it only at X = I_(p+1); the converse is false as a statement and is not asserted (synthesis R5). A composition of FLOW=>SIGN (P2) and HALL=>FLOW (P3), first compiled as one declaration by critic C-U2-T, hence STATED: it registers formally_verified only after an isolated second read AND this award's close. Attribution: active-tag weight, mechanism and corrections: Codex (GPT-6 Astra/Sol/Luna), lower-region run; definitions of record entries 1-18 and 42: the first-interior run (Codex) on the r24/r25/r26 definition layers (C4LA1, C5LA1); informal proof: r30 F2 (Claude Sonnet 5); Lean proofs: r30 U2 (Claude Sonnet 5); companions and fidelity findings: C-U2-T, C-U2-F, C-F2-T, C-F2-U (Claude Opus 5.5), with C-U2-T and C-U2-F for the converse, the iff and the layer closure; reconciliation: the T/F/U adjudicators and the synthesis (Claude Opus 5.5). Phrasing: the compiled binder text (explicit G and p; explicit G of layerWeight_sub_eq_sum) is an equivalent Lean phrasing of the SOLUTION-CONTRACT §2 draft per Gate ruling 9 (control/C1-STAGE1-GATE.md), the equivalence compiled (C-U2-T CriticContract.lean re-run against this run's declarations).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.aggregate_nonpos_of_weightedHall`
- Statement SHA-256: `174fc753c5df290d0d85fbb2376bcdfe942f0f8ceb0c660716761581d9456a73`

```lean
theorem aggregate_nonpos_of_weightedHall (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
    (hp : 1 ≤ p) (h : WeightedHall G (favorableLeaves G p) p) :
    C5LA1.aggregate G p ≤ 0
```

## Quantifiers

- `forall V` over `dom-v`
- `forall G` over `dom-g`
- `forall p` over `dom-p`

## Hypotheses

- `hyp-p`: hp : 1 ≤ p (Nat). Kept exactly as frozen. It makes the Nat subtraction p - 1 inside C5LA1.aggregate the integer p - 1 (for p >= 1 the Nat and Int values agree). In the proof of record it enters through activeWeightAggregateIdentity / layerWeight_sub_eq_sum (the j = p step needs j >= 1 and (p - 1) + 1 = p) and is passed to aggregate_nonpos_of_saturatingFlow. For this F = F_p(G) form it is mathematically dispensable (F_0(G) is empty so S(G, 0) = 0; C-U2-F's activeWeightAggregateIdentity_unguarded, not carried); it is load-bearing for the general-F companion layerWeight_sub_eq_sum (K_{1,3}, p = 0: 0 against 6).
- `hyp-hall`: h : WeightedHall G (favorableLeaves G p) p. (HALL-COND) for EVERY subfamily X ⊆ I_(p+1) at the fixed selector F = F_p(G), active-tag weights, relation (D) ∪ (S). The conclusion depends on it only at X = I_(p+1) (whole-layer instance: supply <= sum over N(I_(p+1)) <= capacity); the proof of record composes HALL=>FLOW (Hall's marriage theorem on the clone expansion, which consumes every X) with FLOW=>SIGN. The converse (S(G, p) <= 0 implies WeightedHall) is false as a statement and is not asserted: (HALL-COND) is strictly stronger as a statement than S <= 0 (synthesis R5); no separating instance is known. This hypothesis is never discharged here: no tree or eligible-row instance of it is claimed.

## Conclusion

- `conclusion`: C5LA1.aggregate G p ≤ 0 (Int): the aggregate S(G, p) = sum over v in F_p(G) of (Delta_(p-1)(G - H_v) - Delta_(p-1)(G - R_v)) is nonpositive. Exactly the implication (HALL-COND at F_p(G)) => S(G, p) <= 0 on every finite simple graph with p >= 1. EXCLUDED conclusions: (HALL) itself; any tree or eligible-row instance of (HALL-COND); the primary aggregate key E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE (it moves only if a future (HALL) award composes with this implication); any sign of S beyond this implication; any census value; no governed-model (rooted-tree) wording; no TREE/FOREST/TRANSFER programme key; not the parent problem.

## Dependencies

- `def-m-univ` -> `def-vertex-deletion-indep-set-count`
- `def-m-powerset-card` -> `def-vertex-deletion-indep-set-count`
- `def-m-is-indep-set` -> `def-vertex-deletion-indep-set-count`
- `def-vertex-deletion-indep-set-count` -> `def-vertex-deletion-forward-difference`
- `def-vertex-deletion-forward-difference` -> `def-is-favorable-at`
- `def-is-graph-leaf` -> `def-support`
- `def-m-univ` -> `def-leaf-set`
- `def-is-graph-leaf` -> `def-leaf-set`
- `def-support` -> `def-h`
- `def-support` -> `def-r`
- `def-m-neighbor-finset` -> `def-r`
- `def-m-univ` -> `def-indep-sets-avoiding`
- `def-m-powerset-card` -> `def-indep-sets-avoiding`
- `def-m-is-indep-set` -> `def-indep-sets-avoiding`
- `def-indep-sets-avoiding` -> `def-indep-set-count`
- `def-indep-set-count` -> `def-forward-difference-del`
- `def-leaf-set` -> `def-aggregate`
- `def-is-favorable-at` -> `def-aggregate`
- `def-forward-difference-del` -> `def-aggregate`
- `def-h` -> `def-aggregate`
- `def-r` -> `def-aggregate`
- `def-m-powerset-card` -> `def-tagged-family`
- `def-m-is-indep-set` -> `def-tagged-family`
- `def-m-disjoint` -> `def-tagged-family`
- `def-m-univ` -> `def-indep-family`
- `def-m-powerset-card` -> `def-indep-family`
- `def-m-is-indep-set` -> `def-indep-family`
- `def-support` -> `def-tag-witnesses`
- `def-m-neighbor-finset` -> `def-tag-witnesses`
- `def-tag-witnesses` -> `def-active-weight`
- `def-m-disjoint` -> `def-active-weight`
- `def-indep-family` -> `def-layer-weight`
- `def-active-weight` -> `def-layer-weight`
- `def-leaf-set` -> `def-favorable-leaves`
- `def-is-favorable-at` -> `def-favorable-leaves`
- `def-m-neighbor-finset` -> `def-transport-rel`
- `def-indep-family` -> `def-is-saturating-flow`
- `def-transport-rel` -> `def-is-saturating-flow`
- `def-active-weight` -> `def-is-saturating-flow`
- `def-indep-family` -> `def-weighted-hall`
- `def-active-weight` -> `def-weighted-hall`
- `def-transport-rel` -> `def-weighted-hall`
- `dom-v` -> `dom-g`
- `dom-p` -> `hyp-p`
- `dom-g` -> `hyp-hall`
- `dom-p` -> `hyp-hall`
- `def-weighted-hall` -> `hyp-hall`
- `def-favorable-leaves` -> `hyp-hall`
- `hyp-p` -> `conclusion`
- `hyp-hall` -> `conclusion`
- `def-aggregate` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `frag-01`: `LeanProject/LeanProof/Snippets/0001-definition-C4LA1-vertexDeletionIndepSetCount.lean.fragment` (match)
- `frag-02`: `LeanProject/LeanProof/Snippets/0002-definition-C4LA1-vertexDeletionForwardDifference.lean.fragment` (match)
- `frag-03`: `LeanProject/LeanProof/Snippets/0003-definition-C4LA1-IsFavorableAt.lean.fragment` (match)
- `frag-04`: `LeanProject/LeanProof/Snippets/0004-definition-C4LA1-IsGraphLeaf.lean.fragment` (match)
- `frag-05`: `LeanProject/LeanProof/Snippets/0005-definition-C5LA1-support.lean.fragment` (match)
- `frag-06`: `LeanProject/LeanProof/Snippets/0006-definition-C5LA1-leafSet.lean.fragment` (match)
- `frag-07`: `LeanProject/LeanProof/Snippets/0007-definition-C5LA1-H.lean.fragment` (match)
- `frag-08`: `LeanProject/LeanProof/Snippets/0008-definition-C5LA1-R.lean.fragment` (match)
- `frag-09`: `LeanProject/LeanProof/Snippets/0009-definition-C5LA1-indepSetsAvoiding.lean.fragment` (match)
- `frag-10`: `LeanProject/LeanProof/Snippets/0010-definition-C5LA1-indepSetCount.lean.fragment` (match)
- `frag-11`: `LeanProject/LeanProof/Snippets/0011-definition-C5LA1-forwardDifferenceDel.lean.fragment` (match)
- `frag-12`: `LeanProject/LeanProof/Snippets/0012-definition-C5LA1-aggregate.lean.fragment` (match)
- `frag-13`: `LeanProject/LeanProof/Snippets/0013-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `frag-14`: `LeanProject/LeanProof/Snippets/0014-definition-E993Transport-indepFamily.lean.fragment` (match)
- `frag-15`: `LeanProject/LeanProof/Snippets/0015-definition-E993Transport-tagWitnesses.lean.fragment` (match)
- `frag-16`: `LeanProject/LeanProof/Snippets/0016-definition-E993Transport-activeWeight.lean.fragment` (match)
- `frag-17`: `LeanProject/LeanProof/Snippets/0017-definition-E993Transport-layerWeight.lean.fragment` (match)
- `frag-18`: `LeanProject/LeanProof/Snippets/0018-definition-E993Transport-favorableLeaves.lean.fragment` (match)
- `frag-19`: `LeanProject/LeanProof/Snippets/0019-definition-E993Transport-transportRel.lean.fragment` (match)
- `frag-20`: `LeanProject/LeanProof/Snippets/0020-definition-E993Transport-IsSaturatingFlow.lean.fragment` (match)
- `frag-21`: `LeanProject/LeanProof/Snippets/0021-definition-E993Transport-WeightedHall.lean.fragment` (match)
- `frag-22`: `LeanProject/LeanProof/Snippets/0022-lemma-E993Interior-highTailAggregateFromShadow.lean.fragment` (match)
- `frag-23`: `LeanProject/LeanProof/Snippets/0023-lemma-E993Transport-isGraphLeaf_of_mem_favorableLeaves.lean.fragment` (match)
- `frag-24`: `LeanProject/LeanProof/Snippets/0024-lemma-E993Transport-tagWitnesses_subset_R.lean.fragment` (match)
- `frag-25`: `LeanProject/LeanProof/Snippets/0025-lemma-E993Transport-card_active_eq_tagged.lean.fragment` (match)
- `frag-26`: `LeanProject/LeanProof/Snippets/0026-lemma-E993Transport-layerWeight_eq_sum_card.lean.fragment` (match)
- `frag-27`: `LeanProject/LeanProof/Snippets/0027-lemma-E993Transport-layerWeight_sub_eq_sum.lean.fragment` (match)
- `frag-28`: `LeanProject/LeanProof/Snippets/0028-lemma-E993Transport-activeWeightAggregateIdentity.lean.fragment` (match)
- `frag-29`: `LeanProject/LeanProof/Snippets/0029-lemma-E993Transport-aggregate_nonpos_of_saturatingFlow.lean.fragment` (match)
- `frag-30`: `LeanProject/LeanProof/Snippets/0030-lemma-E993Transport-card_sigma_fiber_filter.lean.fragment` (match)
- `frag-31`: `LeanProject/LeanProof/Snippets/0031-lemma-E993Transport-exists_saturatingFlow_of_weightedHall.lean.fragment` (match)
- `frag-32`: `LeanProject/LeanProof/Snippets/0032-lemma-E993Transport-transportRel_mem_indepFamily.lean.fragment` (match)
- `frag-33`: `LeanProject/LeanProof/Snippets/0033-lemma-E993Transport-weightedHall_of_saturatingFlow.lean.fragment` (match)
- `frag-34`: `LeanProject/LeanProof/Snippets/0034-lemma-E993Transport-weightedHall_iff_exists_saturatingFlow.lean.fragment` (match)
- `frag-35`: `LeanProject/LeanProof/Snippets/0035-theorem-E993Transport-aggregate_nonpos_of_weightedHall.lean.fragment` (match)
- `src-axioms-all`: `EVIDENCE/axioms-all-declarations.txt` (match)
- `src-brief`: `SOURCE/C1-STAGE7-FORMALIZER-BRIEF-LA2.md` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carry-digests`: `SOURCE/c1-stage7-SOURCE-DIGESTS.json` (match)
- `src-contract-equivalence-log`: `EVIDENCE/contract-equivalence-check.log` (match)
- `src-cu2f-critic`: `SOURCE/C-U2-F-Critic.lean` (match)
- `src-cu2t-advance`: `SOURCE/C-U2-T-CriticAdvance.lean` (match)
- `src-cu2t-contract`: `SOURCE/C-U2-T-CriticContract.lean` (match)
- `src-first-interior-main`: `SOURCE/first-interior-Main.lean` (match)
- `src-first-interior-state`: `SOURCE/first-interior-FORMALIZATION-STATE.json` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/C1-SYNTHESIS.md` (match)
- `src-u2-main`: `SOURCE/U2-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: `formulation_truth_unverified`
