# Formalization Fidelity Review

- Run: `lean-2026-09-25-c1-la1-tagged-shadow-bound`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `e6db650cf10e47d8f160065dfeb96589fbde93d09c613258fb6bddc69971e6ea`
- Contract projection SHA-256: `b09db23cf248cdac1de9ca67fdd1bae139f444552ecd24afc86cd33ebfbf8236`
- Lean binding projection SHA-256: `460fabf610808f50b7c855653f6b7b3c874a541967b15ef781adfb5cab2a4698`
- Contract source SHA-256: `32aa0f3bd021e4e58b5b35b52fc0b2dc44d4fe8ed6890e9b27a573320348b19e`
- Lean source SHA-256: `efafb79b0f33e1319c72d6d102d26212580110d76283c12edaad1938f97bb55c`
- Kernel receipt SHA-256: `bd40a69b7a4c17100629e5f6dbc17acec143e60a899d2b1ace802a8d2967f345`

## Check Counts

- Passed checks: 23
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `attribution` `independent_review` (independent_reviewer, `85acd5bd8ccb29c8`): Attribution (Codex GPT-6 Luna/Sol/Astra for the mechanism, entry 41 and the proposed statement; first-interior source for entry 18; r29 T1, C-T1-F, C-T1-U, U1, C-U1-T, C-U1-F, U's adjudicator, F1, C-F1-T, C-F1-U) matches the synthesis on the contract, the informal proof and the formalizer report; the Lean source comments attribute entries 3-4 to U's adjudicator base candidate. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `cast_equivalence` `independent_review` (independent_reviewer, `a6937cfcade02c27`): N/Z: the only truncated subtraction is H.indepNum - k in entry 41 and the N companion; under hka Nat.cast_sub gives ((alpha - k : N) : Z) = (alpha : Z) - k, so the integer statement equals the registry text on 1 <= k <= a. The Z statement is the one of record; no truncation leaks into the terminal conclusion. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `companion_scope` `independent_review` (independent_reviewer, `d87bbd4067be06ce`): The N companion E993HighTail.bipartiteTaggedShadowBoundNat (no k <= a) is a lemma, matching the optional companion named in SOLUTION-CONTRACT section 2 and the synthesis; the excluded-conclusion fence (no k = 0 or k > a clause) concerns the terminal theorem only and is honoured. Exactly one theorem, placed last; no trailing prime; no sorry/admit/native_decide/axiom/decide/set_option/notation/macro/instance in the source. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definition_of_record` `independent_review` (independent_reviewer, `8085c8dc45945809`): E993Interior.taggedFamily (run entry 1) and E993Interior.taggedShadowBound with its four private Core helpers (run entry 2) are byte-identical (cmp and SHA-256) to first-interior fragments 0018 (cb43feeb...fa1e) and 0041 (50dcce4a...583f) and to the ENTRY 18 / ENTRY 41 bodies of the frozen first-interior Main.lean (8d864da2...a7d9). Nothing outside the four registrar entries except the import Mathlib line and the generator header comment. No G1, C4LA1 or C5LA1 definition is used, so the r25 G1 comparison and the r26 comparison are not applicable to LA1. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `0a9eaa9e36801e2f`): Fences 3.1, 3.4, 3.7, 3.8 are stated on the contract (informal_statement), the informal proof and the formalizer report. No fenced object occurs: no leaf/tree/selector/aggregate statement, no lower-region, census, r27 root-correction or Hall/SDR text, no firstInteriorAggregate or R26LA1 reference; the refuted E993-C3-G1-POINTWISE-ADDABILITY-BOUND appears only in negation (the per-set 2(a-k) bound on bipartite graphs is not an alias of 'at most r addable vertices'). The contract's 'OPEN -> VERIFIED by this award only' is conditional and the formulation evidence disclaims any formally_verified claim. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `hypothesis_scope` `independent_review` (independent_reviewer, `a1f1edd101126455`): hk : 1 <= k is unused by the proof (linter warning at the carried entry 41, Main.lean:178:5). It is required by the statement of record and recorded as statement scope on the contract (hyp-k-pos), the informal proof, the formalizer report and a source comment, satisfying the brief section 2 repair. hBip is load-bearing (consumed in Core.card_extension_le; B4 K_1 + K_5 with W the isolate, k = 1 violates the inequality 5 > 2, recomputed by brute force). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `f5a3127e4e9a5ae0`): kernel-verification.json (bd40a69b...f345) verdict verified, source hash before = after = efafb79b...b55c, axioms exactly {propext, Classical.choice, Quot.sound} for the terminal theorem and for all eight declarations (axioms-all-declarations.txt); incomplete-proof and unsafe-execution scans passed. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `mathlib_semantics` `independent_review` (independent_reviewer, `dc109ec7c4d3d9d7`): Mathlib citations checked at the pinned revision 905b9581: IsBipartite := Colorable 2 (Bipartite.lean:286), IsIndepSet := Pairwise not-Adj (Clique.lean:843), indepNum := sSup {n | exists s, IsNIndepSet n s} (Clique.lean:983), IsIndepSet.card_le_indepNum [Finite] (Clique.lean:991), Finset.univ (Data/Fintype/Defs.lean:92). On a Fintype carrier indepNum is the true maximum independent-set size, so a = alpha(H) as in the registry text. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `d15d60d06a65e4eb`): All hypotheses are jointly satisfiable with nonzero counts: V = Fin 2, H = bottom, W = {0}, k = 1 gives alpha = 2, q_1 = 1, q_2 = 1, 1 <= 2; H = 2K_2 on Fin 4, W = {0}, k = 1 gives alpha = 2, q_1 = 1, q_2 = 2, equality 2 = 2 (recomputed by brute force). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `review_boundary` `independent_review` (independent_reviewer, `72fde53d2ffbb30b`): Not independently re-checked (outside this reviewer's read boundary): declaration-level byte identity of entries 3-4 against sources/c1-stage7-sources/ADJ-U-awards-LA1-Main.lean (d88f6043...62ce). Fidelity does not depend on it: the statements were checked verbatim against the record and the proofs are kernel-verified. The input's lean_binding facets are the contract's canonical text by the projection rule; the semantic comparison above was made against the Lean declarations directly. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `reviewer_identity` `independent_review` (independent_reviewer, `1545e9cf47c8b7bd`): The assigned reviewer_id string contains 'fable'; the seat was chartered as Claude Opus 5.5 (effort high) on dispatch-record authority and the runtime reports model id claude-opus-5-5[1m]. The id is used exactly as assigned in RECEIPTS/reviewer-assignment.json; it differs from the producer id c1-la1-formalizer-opus-20260925. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement_of_record` `independent_review` (independent_reviewer, `d57ea8ac2dc59719`): Terminal declaration E993HighTail.bipartiteTaggedShadowBound (Main.lean efafb79b...b55c, entry 4) is character-identical to the award statement of record in cycles/cycle-1/stage6/SYNTHESIS.md ## Lean awards C1-LA1, to the formalizer brief section 2 and to SOLUTION-CONTRACT.md section 2 Target 1; expected_statement occurs exactly once in the source (SHA-256 87b98c29...9f68). Binders V, H, W, k universal; hypotheses exactly hBip : H.IsBipartite, hk : 1 <= k, hka : k <= H.indepNum; conclusion (k:Z)*q_{k+1} <= 2*((H.indepNum:Z)-k)*q_k with q_j = (taggedFamily H Finset.univ W j).card. No extra hypothesis, no dropped conjunct, no weakening. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la1-fable-fidelity-20260925` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la1-fable-fidelity-attestation-20260925-8a284664-c670-4914-a082-5d054d2bdbdb`
- Completed: `2026-09-25T07:45:00Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
