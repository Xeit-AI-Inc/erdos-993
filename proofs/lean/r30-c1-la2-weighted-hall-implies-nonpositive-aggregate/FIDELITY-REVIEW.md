# Formalization Fidelity Review

- Run: `lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `6b2f197229423792a88e0348ae11bca71248534cf3a18536bcc833e5ac9ab01e`
- Contract projection SHA-256: `f2c19850df2662bb7d8528dbf04d7c04a9cb1f17d87214920a388d8213400604`
- Lean binding projection SHA-256: `d20ef61c7ff4017dce7773390c33ee312e50fbc5999e06cdf10011fa147fe4ef`
- Contract source SHA-256: `c9c16b09f06d9477e945e5f0909d2ad6a91c596b54a3bacd9f3dd6169a8b4edc`
- Lean source SHA-256: `7c279f4b25a07d022ace7154af11c01259057885a55bfabd5e5a07e0c32349f8`
- Kernel receipt SHA-256: `dc1371a05f2228a8154f48812c803f8f85e599b27e4202d6bbfeb033f1776803`

## Check Counts

- Passed checks: 41
- Failed findings: 0
- Warnings: 1

## Findings

- `warning` `cross_award_identity` `independent_review` (independent_reviewer, `1fb96b6d18ca0623`): Byte-identity of entries 14-21 and of the C1-LA1 chain (entries 23-28) with C1-LA1's frozen fragments was not checked here: the sibling C1-LA1 run root is fenced from this review. Both awards were to take the same synthesis-frozen U2 text, and this run matches that text; the controller should compare entry digests with C1-LA1 before any cross-award reliance. Not a defect of this statement's fidelity. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definition_fidelity_carried` `independent_review` (independent_reviewer, `db3f7bbbd6e6944e`): Entries 1-13 (C4LA1.vertexDeletionIndepSetCount, vertexDeletionForwardDifference, IsFavorableAt, IsGraphLeaf; C5LA1.support, leafSet, H, R, indepSetsAvoiding, indepSetCount, forwardDifferenceDel, aggregate; E993Interior.taggedFamily) and entry 22 (E993Interior.highTailAggregateFromShadow with its private Leaf.* helpers) are byte-identical to first-interior entries 1-6, 8-13, 18 and 42 in the frozen Main.lean (8d864da2...a7d9) AND to the frozen Snippets/ fragments; each registrar marker hash equals the SHA-256 of the entry body. No text sits outside registrar markers except the import/header. C5LA1.aggregate in the conclusion is the object of record. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definition_fidelity_new` `independent_review` (independent_reviewer, `96d8d3bdf6548bb9`): The eight E993Transport definitions (indepFamily, tagWitnesses, activeWeight, layerWeight, favorableLeaves, transportRel, IsSaturatingFlow, WeightedHall) are verbatim substrings of the frozen U2 compiled text (U2-Main.lean 1505-1555, sha256 110c2751...2743) and equal SOLUTION-CONTRACT §2 / brief §2 up to the `noncomputable` modifiers and omitted docstrings, under `open SimpleGraph` / `open scoped Classical` as U2 compiled. activeWeight counts ACTIVE tags: ((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v)).card with tagWitnesses G v = (N(s_v)).erase v; never |F ∩ B|. transportRel is exactly (D) ∃ q ∈ B, A = B.erase q, or (S) ∃ u, u ∉ B ∧ |N(u) ∩ B| = 2 ∧ A = insert u (B \ N(u)): no wider, no narrower. WeightedHall quantifies over every X ⊆ indepFamily G (p+1) with N(X) filtered from indepFamily G p; IsSaturatingFlow has the support, exact-row-sum and column-capacity clauses of SEMANTIC-CONTRACT §1.2. Decidability instances are propositionally irrelevant to every count. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `431e79426ae77838`): Fences honoured by the contract scope text and the Lean file: graph-generic; activeWeight via B.erase v against tagWitnesses; F fixed at p; (D) ∪ (S) literal; the face states that (HALL-COND) is hypothesised for every X, used mathematically only at X = I_(p+1), and that the converse is not asserted; excluded conclusions ((HALL), tree/eligible-row instances of (HALL-COND), the primary aggregate key, census values, RTree wording, TREE/FOREST/TRANSFER, the parent problem) are listed and none is asserted. Carried entry 42 is a public lemma with a conditional high-tail sign conclusion; it is a mandated byte-identical carry of record (synthesis carry table; brief R1) whose helpers the WID chain needs, and it is not a claim of this award. The phrase 'the converse is false as a statement' is synthesis R5's registered wording (strictly stronger as a statement; no separating instance known), which the contract repeats faithfully; it is not a proved refutation. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `6b45cd2376d2e44e`): RECEIPTS/kernel-verification.json (sha256 dc1371a0...6803) verdict verified; source_sha256_before = after = 7c279f4b...49f8 (the Main.lean I read); theorem_name E993Transport.aggregate_nonpos_of_weightedHall; reported axioms exactly [propext, Classical.choice, Quot.sound]; incomplete_proof_scan and unsafe_execution_scan passed; my own scan of Main.lean finds no sorry/admit/native_decide/axiom/decide. The one build message (Main.lean:391 'Try this: intro w hw hadj') is a linter suggestion inside carried entry 42, cosmetic. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `45be5ad55b2b8b06`): Every hypothesis is satisfiable non-trivially. K_{1,3} (centre 0, leaves 1,2,3), p = 2: Δ_2(K_{1,2}) = 0 - 1 < 0, so F_2 = all three leaves; the single source {1,2,3} has active weight 3, the three leaf pairs weight 2 each; WeightedHall holds (3 ≤ 6, checked exhaustively) and S = supply - capacity = 3 - 6 = -3 ≤ 0. Also K_{1,4}, p = 2 (S = 0, boundary) and further stars; the one-vertex graph at p = 1 is a trivial instance. Reviewer bounded check (scratchpad/c1-s7-fidelity-LA2/nonvacuity.py), independent re-implementation; bounded_computation, not proof. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_integrity` `independent_review` (independent_reviewer, `4c28c9435150c0fc`): Recomputed fingerprints: contract_projection_sha256 f2c19850...0604, binding_projection_sha256 d20ef61c...4fe4ef (equal to the controller's). Input SHA-256 before attestation 6e58d892...30f7 as briefed. Checked by hand: every definitions[].canonical equals the contract's description (26/26, same ids and order) on both sides; hypotheses (hyp-p, hyp-hall), conclusion, domains, quantifiers and lean_statement equal the contract verbatim; lean_statement equals expected_statement (sha256 174fc753...6a73), which occurs exactly once in Main.lean and is followed by ' := by'. No paraphrase or omission found. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `repairs` `independent_review` (independent_reviewer, `89b7e0828fbfc634`): Brief §2 repairs present: (1) layerWeight_sub_eq_sum and exists_saturatingFlow_of_weightedHall are lemmas (also activeWeightAggregateIdentity and weightedHall_iff_exists_saturatingFlow); (2) hpk2 removed (body otherwise verbatim U2 1679-1706); (3) noncomputable/open scoped Classical as U2 compiled, open Classical in not introduced (allowed: 'only if it compiles identically'); (4) N8 closing rfl kept, kernel-accepted; (5) explicit G of layerWeight_sub_eq_sum recorded as frozen phrasing in contract and INFORMAL-PROOF; (6) contract rebuilt (exact expected_statement, 26 definitions by lean_name, closed DAG, hp note, 'Gate ruling 9'); (7) every new declaration minted through the registrar, numbered as this single-source run's entries 14-21 and 23-35 rather than a literal '46+' (administrative, not fidelity-relevant); (8) no .bak1/Check.lean in LeanProof/; (9) C-U2-T CriticContract.lean equivalences documented (INFORMAL-PROOF §4; EVIDENCE/contract-equivalence-check.log rc=0; I read CriticContract.lean itself, not the DRAFTS harness, which lies outside my read boundary). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement_fidelity` `independent_review` (independent_reviewer, `9f6c46466388c088`): Terminal declaration equals the synthesis `## Lean awards` C1-LA2 expected statement token for token: binders (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ), with implicit {V} [Fintype V] [DecidableEq V] from the section variable; hypotheses exactly hp : 1 ≤ p and h : WeightedHall G (favorableLeaves G p) p (F fixed at rank p, network at rank p); conclusion exactly C5LA1.aggregate G p ≤ 0 in ℤ. No extra hypothesis, no weakening, no dropped conjunct, no IsTree/eligibility. Exactly one `theorem` in the file; every companion is a `lemma`. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la2-fable-fidelity-20260926` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la2-fable-fidelity-attestation-20260926-097b9d52-5006-4106-8d4a-528d7fec6d22`
- Completed: `2026-09-26T19:05:06Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
