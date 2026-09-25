# Formalization Fidelity Review

- Run: `lean-2026-09-25-c1-la4-top-rank-nonresidual-aggregate`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `be40ab6e5d68fc959a6afc6d874904f57604b5221b323ac3d07110e14562db58`
- Contract projection SHA-256: `7bc41310cdd16933ffabd4fa91eda91a156364c8d5d2740ed7a65d73a12c7d8b`
- Lean binding projection SHA-256: `411fe943702e59710a0e35b8a75d474ab86ba6fb0577849d8c674ca0014ec5c6`
- Contract source SHA-256: `beb1d60b6e3cd41c79f677a0ca12a02c8c5950e0db4af6dc45c80653348cad8e`
- Lean source SHA-256: `0c8037390b351effdef9f4f30f56b3341e852a10de0ffb80da7641403f24330b`
- Kernel receipt SHA-256: `babd83eb53e762d67fdb0ba0603f653f033d1b12ffd924b6f38fb43f2272a7e3`

## Check Counts

- Passed checks: 33
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `attribution` `independent_review` (independent_reviewer, `e94705c2f14e29a9`): Attribution on the face matches the synthesis list (Codex/GPT-6 Astra proposal; r26 C5LA1 layer and α ≥ 4 ingredient; r24 C4-LA1 selector/leaf definitions; T2, C-T2-F, C-T2-U, F and U adjudicators, C-U1-T, U adjudicator base candidate). The contract additionally credits Codex for entry 18; the synthesis's LA1 text credits entry 18's definition to the first-interior source, which is Codex's C2 package, so this is consistent. Companion S7 (topRankEligibleAlphaGeFour) is correctly marked STATED pending SR-5. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions_of_record` `independent_review` (independent_reviewer, `ecefaa3ea8b3c88c`): All 18 carried registrar units (entries 1–14, 18, 41, 42, 44) are byte-identical to the frozen first-interior Main.lean (8d864da2…d7a9) entry bodies and to its Snippets/ fragments (bodies between VERITYOS markers hashed and compared; every marker digest equals its body digest). Registrar-local indices 15–18 map to first-interior 18, 41, 42, 44. The definition blocks of entries 1–14 also occur verbatim in the frozen r26 source, so C5LA1.aggregate / crossingIndex are the same objects as in R26LA1.topRankResidualSign. No Erdos993G1 definition is carried or used, so the r25 G1 comparison is not applicable. The six new lemmas (indepSetCount_zero, indepSetCount_one, forwardDifferenceDel_zero_eq, indepNum_le_card, crossingIndex_negative, topRankEligibleAlphaGeFour) and the terminal theorem are exactly the new declarations the synthesis/SOLUTION-CONTRACT plan names; no re-typed definition of record. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `ac637583ad6595ad`): Contract scope text honours SOLUTION-CONTRACT §3.1 (no status transfer to the listed keys or Erdős #993), §3.2 (r26 and first-interior awards not re-registered or widened; r26 remains proof of record on the residual class; scope notes with statuses unchanged), §3.3 (lower region untouched), §3.7 (attribution) and §3.8 (separate certificate; entries 41, 42, 44 context only). Excluded conclusions match the synthesis (no strict inequality, no other rank, E993-R23 stays OPEN, no bipartite/forest statement in the terminal theorem, no E993-BETA-AGG transport). No fenced object occurs in Main.lean (no R26LA1, firstInteriorAggregate, eligibleAlphaGeSeven, census value, lower-region mechanism, r27 correction or Hall/SDR route); the contract and INFORMAL-PROOF mention the lower region and the census maximum only as fence/exclusion statements. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `hypothesis_consumption` `independent_review` (independent_reviewer, `95fec9152b733ed8`): hT is consumed only as hT.isAcyclic.isBipartite (Mathlib SimpleGraph.IsAcyclic.isBipartite, Acyclic.lean:617, verified at Mathlib 905b9581); connectivity unused, the brief's preferred route. Mathlib citations in the contract verified at the pinned revision: IsAcyclic Acyclic.lean:56, IsTree :60, IsTree.isBipartite :598, IsAcyclic.isBipartite :617, IsBipartite Bipartite.lean:286 (Colorable 2), indepNum Clique.lean:983, Finset.univ Data/Fintype/Defs.lean:92. The selector IsFavorableAt is not consumed (every leaf term is bounded), which does not change the statement. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `input_projection` `independent_review` (independent_reviewer, `665d4205815f86fb`): Fingerprints recomputed: contract_projection_sha256 7bc41310…2c7d8b and binding_projection_sha256 411fe943…4ec5c6, equal to the controller's. The input's theorem_contract and lean_binding projections carry the contract's 20 definition descriptions, both hypothesis statements, the conclusion, the lean statement and the permitted axioms verbatim; contract_sha256 and declaration_source_sha256 equal the files on disk. No paraphrase or omission of a canonical field found. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `23ec757d7fc027bd`): kernel-verification.json: verdict verified, source_sha256_before = after = 0c803739…330b, axioms exactly {propext, Classical.choice, Quot.sound}; receipt SHA-256 babd83eb…a7e3 as briefed. No sorry, admit, native_decide, decide, axiom, unsafe, extern or implemented_by token in Main.lean; per-declaration probe shows only the three axioms (IsGraphLeaf none). Build warnings are confined to carried entries 41 (unused hk) and 42 (Try this). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `nat_int_equivalence` `independent_review` (independent_reviewer, `8985c4b4d3b29ced`): hEligible is in ℕ with truncated subtraction. For α ≥ 1 it is literally the integer premise x + 2 ≤ α − 1; for α = 0 (ℕ side 0, ℤ side −1) and α = 1 (both 0) both premises are false. Equivalent for every α, as the contract's hyp-eligible states. Under hEligible, α ≥ 4 (topRankEligibleAlphaGeFour), so the conclusion's rank G.indepNum − 1 equals the integer α − 1 and the aggregate's inner p − 1 equals α − 2; entry 44's hp (2 ≤ α−1) and hTail (2α+1 ≤ 3(α−1) ⟺ α ≥ 4) are exact consequences. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `e45bcd729e4d5ed1`): Instance satisfying every hypothesis: the star K_{1,8} (a tree, n = 9). α = 8; Δ_k = i_{k+1} − i_k over the literal counts gives Δ_0 = 8, Δ_1 = 19, Δ_2 = 28, Δ_3 = 14, Δ_4 = −14, so x = 4 and x + 2 = 6 ≤ 7 = α − 1. At p = 7 every leaf v is favorable (K_{1,7} has i_8 − i_7 = −1 < 0), and each term is Δ_6(7 isolates) − Δ_6(empty) = (1 − 7) − 0 = −6, so S = −48 ≤ 0 with a nonempty favorable filter. Hand-derived; cross-checked by a non-certifying scratch instrument (scratchpad/c1-s7-fidelity-LA4/nonvacuity.py). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `process_disclosure` `independent_review` (independent_reviewer, `d3e3fd307a630c6a`): Outside statement fidelity, recorded for the controller: FORMALIZER-REPORT discloses one transient write outside the run root (/tmp/null_reg_out, registrar stdout, deleted) and that EVIDENCE/axioms.txt was rewritten by the kernel verifier after the formalizer's pre-verification write (the receipt binds the rewritten a48f43b4…1856). Neither affects the declaration or this verdict. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `repairs` `independent_review` (independent_reviewer, `a21374556f32adab`): All T2 draft-contract repairs required by the synthesis/brief are present: Nat.sub, entry 44 and IsTree.isBipartite are absent from definitions; C4LA1.vertexDeletionIndepSetCount, vertexDeletionForwardDifference, IsFavorableAt, IsGraphLeaf, C5LA1.leafSet, indepSetsAvoiding, indepSetCount are present by exact lean_name with verbatim fragment text and digest; the ℕ/ℤ equivalence is stated for every α; hyp-tree depends only on domain-g and def-tree (no Nonempty); the attribution is on the face. Required definitions SimpleGraph.IsBipartite, SimpleGraph.indepNum, SimpleGraph.IsTree, Finset.univ and E993Interior.taggedFamily are present. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement_binding` `independent_review` (independent_reviewer, `c89e6b8fd8d52a25`): Terminal declaration E993HighTail.topRankNonResidualAggregate (the only theorem, registrar entry 25, placed last) has binders {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj], hypotheses exactly hT : G.IsTree and hEligible : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 1, and conclusion C5LA1.aggregate G (G.indepNum - 1) ≤ 0 (ℤ). The contract's expected_statement (SHA-256 b21887c0…0e44e, recomputed) occurs exactly once in Main.lean followed by ' :=' and verbatim in SOLUTION-CONTRACT.md §2, the synthesis '## Lean awards' C1-LA4 text and the formalizer brief §2. No extra hypothesis, no dropped conjunct, no weakening. Identifier resolution checked: no namespace E993HighTail.C5LA1 or E993Interior.C5LA1 exists, so the opened namespaces cannot capture C5LA1.crossingIndex / C5LA1.aggregate. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la4-fable-fidelity-20260925` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la4-fable-fidelity-attestation-20260925-34a7b6d2-f48b-45d3-bdaa-e40be948311b`
- Completed: `2026-09-25T07:48:39Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
