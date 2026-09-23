# Formalization Fidelity Review

- Run: `lean-2026-09-22-c6-sharpened-order-bound-argmin`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `2ea404c5197971a1914eb5ae33919f20d34587fa6e7d602a36b3ef5115e7ed29`
- Contract projection SHA-256: `094b8b8dd3a9ff82aab8f5f6cf5c93c96c948b81228ae2404f4f5065ae0ad8d4`
- Lean binding projection SHA-256: `3f5e4fe7c9ddf895638511c1b64f502801e0067527bf0102c14efdb090d8b104`
- Contract source SHA-256: `6d9de6c29d22337ea7f5144690917e07d5d9a39551d2c9f526ade62a6750d2ab`
- Lean source SHA-256: `eacfd4ce67289a651db7fda05e16ad870ebfdcf0e6e4cbcf719604b849b02245`
- Kernel receipt SHA-256: `1f480dd5c32418735ab825755fd5bc944f2c094d36925cc9c04f3c0162640bb7`

## Check Counts

- Passed checks: 19
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `contract-dependency-listing` `independent_review` (independent_reviewer, `617929a97be7ad5e`): THEOREM-CONTRACT.yaml's dependency_graph lists only definition, domain, hypothesis and conclusion ids; it names no Mathlib lemmas, whereas the controller's formalizer brief section 5 step 5 asks for a 'closed dependency graph (Mathlib names listed)'. This is documentation completeness, not statement fidelity, and no dependency is concealed: the DAG closes against pinned Mathlib alone (Nat.choose_succ_succ, Nat.choose_zero_right, Int.natCast_nonneg, mul_nonneg, le_trans, plus omega/nlinarith elaboration), Main.lean imports only Mathlib, the declared/observed dependency lists are empty and mutually consistent on both projection sides and in the kernel evidence, and the trusted base is independently bounded by the kernel receipt and by #print axioms on all twelve registered declarations. The governed theorem-contract validator passed the graph (dependency_graph: true, verdict valid_for_formalization). Flagged so the controller may escalate if it reads the brief's parenthetical as mandatory contract content. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `declaration-kind` `independent_review` (independent_reviewer, `8f82cbecc9a7d991`): W_antitone, W_min_at_spanning_tree and ce_at_spanning_tree are registered here with the lemma keyword where seat T2's and critic C-T2-F's originating sources use theorem. Lean 4's lemma and theorem produce the identical declaration kind; I compared the three statements and their proof scripts against EVIDENCE/originating-source/T2-Main.lean and CriticT2F.lean (digests 9e9acb72... and d54c1199..., both matching the capsule's declared values) and they agree character for character apart from the keyword and the namespace rename. The change is disclosed in INFORMAL-PROOF.md section 2, in FORMALIZER-REPORT.md section 5 and in each declaration's docstring, and was made to satisfy the registrar's definition*/lemma*/theorem? ordering so that candidateD_argmin is the file's single theorem-kind entry. No effect on what is proved or on what it is proved from. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fence-language` `independent_review` (independent_reviewer, `e9b580922fd4641b`): The contract's informal_statement calls the n >= 4 fence TIGHT. The parenthetical that follows it is accurate and load-bearing: what fails below n = 4 is the Pascal-derived closed form underlying the proof (pascal_step2/pascal_step3 instantiate zchoose_pascal at a = n-3, which needs 1 <= n-3), and I reproduced the named witness independently (n = 3, k = 1, e = 1: difference -1 against closed form 0). The top-level conclusion itself is NOT falsified at n = 3: my own direct scan of Hbound n k (n-1) 1 <= Hbound n k e (min e (n-e)) at n = 3 over k in [-20, 20], e in {1, 2} found no violation. INFORMAL-PROOF.md section 8 and FORMALIZER-REPORT.md section 3(iv) both state this distinction explicitly and disclaim any n = 3 counterexample, so nothing is overstated in the run. Recorded only so that 'the n >= 4 fence is TIGHT' is never read downstream as 'the theorem is false at n = 3'. No statement-fidelity defect: the Lean declaration carries 4 <= n exactly as the contract and the statement of record require, and n >= 4 is neither dropped nor widened. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c6-la6-fable-fidelity-20260922` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c6-la6-fable-fidelity-attestation-20260922-09311cb6-5864-48a7-972e-9b4d198c3b0c`
- Completed: `2026-09-22T23:08:15Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
