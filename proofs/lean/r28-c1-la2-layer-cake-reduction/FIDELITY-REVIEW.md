# Formalization Fidelity Review

- Run: `lean-2026-09-25-c1-la2-layer-cake-reduction`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `41efd1b1c9717cb48402681e6346b236cd95e25ebfe67f89cf996d191b9c0ac5`
- Contract projection SHA-256: `fd2878daf3e19c8a6d240c38a8fb1b00be6552ed5cfc767ba778d593c302e63e`
- Lean binding projection SHA-256: `c1efe266ed6ef60155a0357096e532a718cbf5257e062fea9e3d14ba7a496b62`
- Contract source SHA-256: `095fc227d29def02ec248714e87fa2493a27547f56f3918b7d14c620165b0526`
- Lean source SHA-256: `64545ccd0b20ffe2da540fc4ae9d365825d43b73929201a1dab915925f109efc`
- Kernel receipt SHA-256: `4098942a546ef2a5f70b1d0cfe30241ec2dc8f12e469f391cdfc632eba71cc6f`

## Check Counts

- Passed checks: 20
- Failed findings: 0
- Warnings: 1

## Findings

- `warning` `attribution_scope` `independent_review` (independent_reviewer, `9390213d5f11597e`): SOLUTION-CONTRACT §3.6 and the synthesis 'Attribution common to every face' list Hall's theorem (classical, via Mathlib); the C1-LA2 contract face omits Hall (the controller's formalizer brief §2 list also omits it). LA2 does not use Hall, so this does not affect statement fidelity; the controller may add the common Hall line or record it as inapplicable at registration. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `carry_integrity` `independent_review` (independent_reviewer, `acd7dfa9520c6cec`): All 7 carry files match sources/c1-stage7-sources/SOURCE-DIGESTS.json (full SHA-256 and bytes). Each of the 29 carried declarations occurs exactly once, as a complete block, in its frozen source: U1-Main.lean ×9 verbatim; C-U1-F-Critic.lean ×13 and C-U1-T-CriticCheck.lean ×7 verbatim except the declaration keyword theorem→lemma (semantically inert); the critic variable/open lines are verbatim. The terminal proof block after ':= by' is U1's verbatim; U1's own statement differs from §2 only by the Erdos993G1. qualifiers, which resolve identically inside namespace Erdos993G1. All 33 entry-header digests reproduce from the entry bodies, equal the Snippets fragments and RECEIPTS/formalization.json. Critic bodies keep critic namespaces (Erdos993G1.CriticU1F, CriticU1T) and are critic-attributed. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions_of_record` `independent_review` (independent_reviewer, `e4b91a099bc55833`): Erdos993G1.indepCount (entry 1) and Erdos993G1.indepCount_eq_card_indepSetFinset (entry 6) are byte-identical to r25 award entries 1 and 4 of sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean (736eb9df…; entry digests 5484fc21…, 4463e7ee…). Erdos993G1.indepDegreeSum (entry 2) is byte-identical to r27 C1-LA1 entry 7 (b49ea82a…; a1ed32eb…). Same Lean 4.32.2 / Mathlib 905b9581… pins and same file prelude (import Mathlib only). occ, slotsAtLeast, leavesAtLeast equal the SOLUTION-CONTRACT §2 / SEMANTIC-CONTRACT §1 text exactly (argument order occ G v k, slotsAtLeast G k t, leavesAtLeast G k t; deg − 2 guarded by 3 ≤ deg in the filter) and occur verbatim in U1-Main.lean. The brief's e/extensionCount/firstDescent are not r28 SEMANTIC-CONTRACT §1 objects and do not occur in the project (N/A). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `0ab4c47ac3c44230`): Neither slot_leaf_sdr_exists nor tree_leaf_slot_dominance occurs anywhere under LeanProject (Main.lean, Snippets, .lake/build, .lake/config; the shared packages symlink not followed), nor does forest_degree_lemma, any R28U2 name or any U2/C-U2 content. The contract face states: instance-wise implication, not a proof of (DL) and not a second proof of (DL); hypothesis fails at (T22, 11) and (T22, 12) with (HS) REFUTED; no composition with tree_leaf_slot_dominance; reformulation companions are a scope note on E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2, never a new key; no status transfer (§3.1). The scope declaration (graph-general, t ≥ 1, no acyclicity/connectivity) is carried by CriticU1T.dominance_implies_degree_lemma_graph_general and Erdos993G1.CriticU1F.dominance_implies_degree_lemma_general, both with h : ∀ t, 1 ≤ t → …; the companions (weight identity, leaf/branch identity with the 2·Σ_{deg 0} term and its no-isolated form, tree identity, biconditional, ℤ slot count, tree t = 0 lemma, quantifier bridge) are present with the hypotheses the synthesis names. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `e6c9864c1938417f`): RECEIPTS/kernel-verification.json (4098942a…) verdict verified, source hash before/after 64545ccd…, axioms of the terminal theorem exactly [propext, Classical.choice, Quot.sound] (EVIDENCE/axioms.txt 713d4677…; all 33 declarations likewise per axioms-all-declarations.txt); no sorry, admit, native_decide, axiom or decide token in Main.lean; the only finite split is interval_cases over d ∈ {0,1,2}, not an enumeration for a universal step. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `367a5fd57608ca36`): Hypotheses are jointly satisfiable: K_{1,3} (Fin 4, center of degree 3, one slot) is a tree and h holds at every t for every k (k=1: all c=1, slots_{≥1}=1 ≤ 3; k=2: c_center=0, c_leaf=2, slots_{≥t}=0 for t ≥ 1 and 1 ≤ 3 at t=0; k ≥ 4: all counts 0); P_2 satisfies h trivially (Br = ∅). Reviewer recomputation also reproduced the fence: T22 violates h exactly at k ∈ {11, 12} (e.g. k=12, t=18: 1 > 0). Context: the conclusion is (DL) on trees, already formally verified unconditionally by r27 C1-LA1; the award's content is the implication (LC), which the face correctly presents as instance-wise and not a proof of (DL). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_scope` `independent_review` (independent_reviewer, `9e4f8e78427361db`): Recomputed fingerprints equal the controller's (contract fd2878da…, binding c1efe266…). Input projections checked against THEOREM-CONTRACT.yaml (095fc227…) and Main.lean (64545ccd…): definitions, hypotheses and conclusion are verbatim, lean_statement equals expected_statement, axioms are the sorted permitted list, source/contract/kernel hashes match. The domains/quantifiers facets project only the contract's top-level quantifier binders X, G, k; the contract domain dom-threshold (t : ℕ, bound inside h) has no separate facet, but its content (∀ t : ℕ, t = 0 included) is carried verbatim in hyp-threshold's canonical text and in lean_statement, so nothing is paraphrased or lost. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `repairs` `independent_review` (independent_reviewer, `85f5703c3a48a4d5`): All synthesis/brief repairs present: 'carried byte-identically' is not claimed for U1's indepDegreeSum (the r27 entry is registered; U1's copy stated NOT carried, rfl-equal per C-U1-F Audit.lean); no formally_verified_conditional or compiled grade word (formulation_status 'established' is a validator enum; 'compiled' occurs only as prior-evidence prose); def-occ has no dependencies (the false def-occ → indepDegreeSum edge is gone); the informal_statement is fenced and tree-scoped with the graph-general form labelled as the scope declaration. Erratum R28-E-a is on the face (docstring and contract). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement_identity` `independent_review` (independent_reviewer, `c621c65eea461d6c`): Terminal declaration Erdos993G1.dominance_implies_degree_lemma: statement text (theorem ... up to ' :=') is character-for-character the SOLUTION-CONTRACT.md §2 block (sha256 82e14d0c768d70724486ffb9cccdd1d4ac07d07caede3a2357f94c60f6d60895), occurs exactly once in Main.lean (64545ccd…) followed by ' := by', equals the synthesis C1-LA2 statement of record (whitespace-normalized) and the formalizer brief §2 block. Binders {X : Type u} [Fintype X] [DecidableEq X] (G) [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ) (h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t); conclusion (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k. hT present and unused (linter warning Main.lean:737:26); the ∀ t quantifier ranges over all of ℕ (t = 0 included); no k ≥ 1, n ≥ 2 or extra hypothesis; no conjunct dropped. Exactly one theorem-keyword declaration in the file. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la2-fable-fidelity-20260925` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la2-fable-fidelity-attestation-20260925-5eb1c0b0-a81c-493e-90cc-969d3fe5c389`
- Completed: `2026-09-25T02:40:32Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
