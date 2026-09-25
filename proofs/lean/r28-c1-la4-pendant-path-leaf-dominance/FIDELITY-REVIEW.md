# Formalization Fidelity Review

- Run: `lean-2026-09-25-c1-la4-pendant-path-leaf-dominance`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `27fc19cbf4e0eec4de9315bee0689cf09a1b552df20914e0bb0773a8239ba9b3`
- Contract projection SHA-256: `3c52ff31f67c65c1d981dd90feaa65155c2e98d856ccf41df11d2278cddad8ad`
- Lean binding projection SHA-256: `cea1717e9530420cefdcdad2ae7243eb40579819462b72f4eec0655086d5dd0f`
- Contract source SHA-256: `0c3a4027ab11954ee725f6ec1c9e4766ae994aa97bf9a871cd06c70ffbad23c3`
- Lean source SHA-256: `f979e1d7a8b3df6605765969d7c2c73762c736f073f8806f494da1d8b7c8bae0`
- Kernel receipt SHA-256: `6293734d9c8453aa861d8ec916b4bdbb69f99c2d8ecb5b744ae4c68c001077df`

## Check Counts

- Passed checks: 30
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `binder_order` `independent_review` (independent_reviewer, `db2fbbc30af286f0`): Binder choice recorded: the final universal binders are (k : ℕ) (i : Fin (m + 2)), whereas the T adjudicator's forall-form quoted in SYNTHESIS.md ## Lean awards (C1-LA4) reads forall (i : Fin (m+2)) (k : ℕ). Two adjacent independent universal quantifiers commute, so the statements are logically equivalent; the typeclass binders follow Lean order and the four hypotheses are named (hinj, hadj, hdeg2, hleaf) with bodies identical to the T form. The choice is disclosed on the contract face and in FORMALIZER-REPORT.md. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `conditions_present` `independent_review` (independent_reviewer, `2852596f25f76514`): Formalizer brief section 3 conditions checked in the artifact: R1 single Mathlib-only source with the r25/r27 entries byte-identical (verified independently); R2 carry discipline (definition layer carried at declaration level from U1 with full origin SHA-256 cited in FORMALIZER-REPORT.md and INFORMAL-PROOF.md; no critic body carried; entries 7-12 recorded as re-derived in-run); R3 contract with exact lean_names, occ/slotsAtLeast/leavesAtLeast Lean text verbatim in descriptions, hypotheses verbatim, three permitted axioms, exact expected_statement, source_materials digesting INFORMAL-PROOF.md, CAPSULE-VERIFICATION.json, frozen sources and all 12 fragments, no grade field; R4 axioms exactly {propext, Classical.choice, Quot.sound} for every declaration, no sorry/admit/native_decide/axiom/decide token; R5 informal proof at statement granularity with hypotheses, cast audit, attribution, fences and carry table; R6 not triggered; R7 direct-injection route (vertex permutation via Equiv.Perm.viaEmbedding restricting to C-T1-U's two-step shift) recorded; nothing from U2. No missing repair found. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions_of_record` `independent_review` (independent_reviewer, `3829ab585d89938e`): Definitions checked against their sources of record by exact byte comparison of the VERITYOS ENTRY blocks: entry 1 Erdos993G1.indepCount and entry 6 Erdos993G1.indepCount_eq_card_indepSetFinset are byte-identical to r25 award source entries 1 and 4 (source 736eb9df...e7dfe0; entry digests 5484fc21... and 4463e7ee... reproduced); entry 2 Erdos993G1.indepDegreeSum is byte-identical to r27 C1-LA1 source entry 7 (source b49ea82a...c5aafc5a; digest a1ed32eb... reproduced) and matches SEMANTIC-CONTRACT section 1 D_k. Erdos993G1.occ, slotsAtLeast and leavesAtLeast match SOLUTION-CONTRACT section 2 and SEMANTIC-CONTRACT section 1 token for token, are in one namespace, and are declaration-level byte-identical to U1-Main.lean (74ab2108...e628e5) lines 45-49, 51-55, 57-60 (block digests 009eec1a..., 1e3005c3..., 5f3da124... reproduced). All seven carry files and both frozen award sources match SOURCE-DIGESTS.json / the brief's digests. No root-level Mathlib 'occ' exists, so 'occ' in the statement is Erdos993G1.occ. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences_honoured` `independent_review` (independent_reviewer, `2b6aeb63545208fc`): Fences checked: neither slot_leaf_sdr_exists nor tree_leaf_slot_dominance (nor any U2 declaration, nor forest_degree_lemma) occurs anywhere in LeanProject/LeanProof; the conclusion compares u i only with the leaf ending its own pendant path (not (PW)); stepwise monotonicity is not claimed; the contract's informal_statement and conclusion text carry the (PW), stepwise-REFUTED, (HS)-FALSE, no-status-transfer and (DL)-input fences and the six-critic attribution plus T1/F2 for the leaf/support case, as the synthesis requires. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `graph_general` `independent_review` (independent_reviewer, `d7a913d2fe489374`): The declaration is graph-general: no IsTree, IsAcyclic, Connected, or other structural hypothesis occurs in any declaration of Main.lean; the token IsTree appears only in the terminal docstring stating its absence ('no IsTree'). This matches the award's 'degree pattern and finiteness; no IsTree'. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `hypotheses_exact` `independent_review` (independent_reviewer, `6fb9c3ca3661de88`): Hypotheses are exactly the statement of record, no more and no fewer: injectivity of u; consecutive adjacency (forall i : Fin (m+1), G.Adj (u i.castSucc) (u i.succ)); degree 2 at the interior positions 0 < i < m + 1; degree 1 at Fin.last (m + 1); u 0 unconstrained. No k >= 1, no n >= 2, no extra hypothesis. Conclusion occ G (u i) k <= occ G (u (Fin.last (m + 1))) k for every k and every i, with no dropped conjunct (the polynomial identity is marked optional by the synthesis and is not claimed). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `index_convention` `independent_review` (independent_reviewer, `8957b0b3c78ff8aa`): Index translation checked: Lean u : Fin (m + 2) -> X has m + 2 vertices u 0..u (m+1) with leaf u (m+1); the synthesis/SR-PP path u_0..u_M = l (M >= 1) corresponds to M = m + 1. The synthesis's 'm = 1 case' (leaf and support, E993-PAIR-R-LE-G-POINTWISE (i)) is Lean m = 0, as the formalizer brief states; corroboration only, not re-registered. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_and_projection` `independent_review` (independent_reviewer, `4ca803b3c0147ba7`): kernel-verification.json (6293734d...077df) is verified, binds source f979e1d7...8bae0 before and after, and reports axioms exactly [propext, Classical.choice, Quot.sound]; build log shows no warnings. The fidelity input's contract and binding projections were checked field by field against THEOREM-CONTRACT.yaml (0c3a4027...c23c3) and the Lean source and are verbatim (no paraphrase or omission of a schema field); recomputed fingerprints equal the controller's. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `cde8bfae03c6a72a`): Non-vacuous: every hypothesis is satisfied by (a) X = Fin 2, G = K2, m = 0, u = id; (b) the spider S(3,1,1) with edges 0-1, 0-2, 0-3, 1-4, 4-5, m = 2, u = (0, 1, 4, 5), deg u0 = 3, where at k = 3 the occupancies along the path are (0, 3, 1, 3) (conclusion holds, stepwise monotonicity fails, consistent with the fence); (c) a non-tree host, triangle 0-1-2 with pendant path 0-3-4, m = 1, u = (0, 3, 4), k = 2 occupancies (1, 2, 3). Computed by exhaustive enumeration in the reviewer's scratch. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `review_scope` `independent_review` (independent_reviewer, `8a045f659d37a951`): Read-boundary limitation: the T adjudication and SR-PP second read are outside this reviewer's boundary; the statement of record was taken from SYNTHESIS.md ## Lean awards (which quotes the T adjudicator's Lean form verbatim) and the formalizer brief section 2. Controller-side notes with no effect on the artifact: the fidelity brief's mention of e/extensionCount/firstDescent does not apply (none occur in this run); the formalizer brief section 5 cross-references R7-R10 where section 3 numbers the same conditions R3-R6. The formalizer's disclosed transient /tmp write is procedural, not fidelity-bearing. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `reviewer_independence_disclosure` `independent_review` (independent_reviewer, `7fe8a812db80ea24`): Reviewer runtime reports Claude Opus 5.5 (claude-opus-5-5[1m]); FORMALIZER-REPORT.md reports the same runtime model for the producer seat. The reviewer is a separate agent instance with a distinct reviewer id and no access to the producer's context; the model identity is disclosed so the controller can weigh it. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `terminal_statement_exact` `independent_review` (independent_reviewer, `03cb01176badd652`): The terminal declaration Erdos993G1.pendant_path_leaf_dominance (Main.lean lines 359-364, entry 12) is character-for-character the formalizer brief's section 2 block (455 bytes identical; the only difference is the proof marker ' := by'), equals lean_binding.expected_statement (SHA-256 3087849e6ad2918f5afe15994f891231be627e1d5585065abb4c36179127f383), and occurs exactly once in the source f979e1d7a8b3df6605765969d7c2c73762c736f073f8806f494da1d8b7c8bae0. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `unused_registered_definitions` `independent_review` (independent_reviewer, `e447a612d1e1d871`): indepCount, indepDegreeSum, slotsAtLeast, leavesAtLeast and indepCount_eq_card_indepSetFinset are registered per the common one-definition-layer rule but are not referenced by the terminal statement; the contract says so explicitly. Harmless to fidelity. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la4-fable-fidelity-20260925` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la4-fable-fidelity-attestation-20260925-157646d3-2ddb-428d-a2dc-05d4e499a2f9`
- Completed: `2026-09-25T02:42:52Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
