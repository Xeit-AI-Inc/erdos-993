# Formalization Fidelity Review

- Run: `lean-2026-09-25-c1-la3-interior-eligibility-guard`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `ad8d67f2f4213d332fe6190e25fe5a1a9385144dd8a39662a35925f46d17f751`
- Contract projection SHA-256: `32851d7b7aeb83959a331f6270499d9ddadeaa04221b7374fff3c68edd83717d`
- Lean binding projection SHA-256: `c884fae17237afa15b41e52f02e12237fafadaa43dd18159fe13a65a4759badb`
- Contract source SHA-256: `99379e6d984bfb73fc2626b2d1c27cde794c68666689ea0638ce9e80f9fe7542`
- Lean source SHA-256: `8d500fd7c6811e9a4ce560cbaeea6e6b16a208eebb925498618fb66ed133550b`
- Kernel receipt SHA-256: `062134820f927cf93000ec47d5b2c0d1ab8eb960083838dd7c98a9de10f089b3`

## Check Counts

- Passed checks: 35
- Failed findings: 0
- Warnings: 1

## Findings

- `warning` `provenance_record` `independent_review` (independent_reviewer, `7d1d99618bb053da`): The G1 definitions (entries 15–17) are token-identical but NOT byte-identical to the r25 award source sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean (736eb9df…; r25 registrar digests 5484fc21…, 21190043…, bdb46014… versus f6bc96fd…, 15ce5e34…, d7dc776c…). The r25 signatures are on one line (`def indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=`), the carried ones wrap after `{V : Type u}`, and r25 has two blank lines after `universe u` where the carried fragment has one. Whitespace-normalized, the texts are equal, so the namespace, universe, binders and bodies are the same and the elaborated definitions are identical. They do not occur in the statement. There is no semantic effect. However, the wording 'byte-identical to the r25 award' in INFORMAL-PROOF.md §5 (inherited from SYNTHESIS.md, SOLUTION-CONTRACT.md §2 and SEMANTIC-CONTRACT.md §1) is inaccurate at the byte level and should be corrected as a record to 'token-identical (whitespace-only differences)'. THEOREM-CONTRACT.yaml does not make this claim: its 'byte-identical' refers to the first-interior fragments, which is true. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions_of_record` `independent_review` (independent_reviewer, `e077b8c25b7f51e2`): All 40 carried fragments (original first-interior entries 1–17, 19–40, 43) are byte-identical to the frozen sources/first-interior/c2-primary-v2 Snippets files of the same name and occur verbatim in the frozen first-interior Main.lean (8d864da2…). Main.lean is exactly the generated header, the registrar markers, those 40 fragments and one new 770-byte terminal fragment; entries 18, 41, 42, 44 and 45 are absent. No notation, instance, macro, attribute or set_option override anywhere in the file; `G.indepNum` and `G.IsTree` resolve to Mathlib (Clique.lean:983 sSup of independent-set sizes; Acyclic.lean:60 Connected ∧ IsAcyclic). crossingIndex is Nat.find of the least k with forwardDifferenceDel G ∅ k = i_{k+1}(G) − i_k(G) < 0, i.e. the registry's x(T). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `entry_numbering` `independent_review` (independent_reviewer, `ec919c5374acba84`): The contract text and the terminal Lean comment cite original first-interior entry numbers (entry 34 indepCount_three_add_edge_incidence; entry 43 eligibleAlphaGeSeven). The run's registrar markers renumber them (33, 40). INFORMAL-PROOF.md §6 maps both numberings. No semantic effect. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences_and_scope` `independent_review` (independent_reviewer, `4cc975e161055ee5`): The contract face carries §3.1 (no no-recovery statement; no status transfer to E993-R25-UNR-FOREST-WIDE, E993-G1WIDE-NO-SIZE-CAP, NR1, FOREST, TREE, TRANSFER, E993-BETA-AGG or Erdős #993), §3.2 (E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE unchanged, relation a scope note; entry 45 not carried), §3.5 (no census value, r27 root correction or r28 Hall/SDR route; none occurs in Main.lean, the contract or INFORMAL-PROOF.md except as fence text), §3.7 (attribution on the contract, informal-proof and Lean-comment faces, matching the synthesis) and §3.8 (separate certificate). The excluded conclusions are honoured: the only conclusion is 7 ≤ α. Brief §2 lists no mathematical repair; the corrected hypothesis map is present. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `hypothesis_consumption` `independent_review` (independent_reviewer, `8a9de37f324251d2`): Hypothesis map checked against the Lean text of entry 43's Guard helpers: hT.card_edgeFinset in order_ge_alpha_succ, delta_one_nonneg, delta_two_nonneg_large/seven/eight and degree_choose_ge_fifteen_at_seven/nine_at_eight; hT.isAcyclic into Erdos993G1.indepCount_three_add_edge_incidence in all three Δ_2 branches (n ≥ 9, n = 7, n = 8); hInterior gives indepNum ≥ 4 and bounds x by 0, 1, 2. The correction of record (acyclicity in all three branches; C-T1-F, C-T1-U, T's adjudicator) is present on the contract and INFORMAL-PROOF faces. IsBipartite does not occur and is not used; it is listed in definitions only under the synthesis group-wide rule and is flagged as unused. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `nat_int_cast` `independent_review` (independent_reviewer, `648e0bf4f64a64da`): hInterior is ℕ with truncated subtraction. Checked: for indepNum < 2 the ℕ right side is 0 < 2 ≤ x + 2 and the ℤ right side is negative, so both are false; for indepNum ≥ 2 the two coincide. So the Lean hypothesis is exactly the registry hypothesis x(T) + 2 ≤ p with integer p = α(T) − 2, for every α. The conclusion is in ℕ with no cast. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `cf77a09386cfc1ea`): Instance satisfying every hypothesis: the star K_{1,8} on 9 vertices (a tree). Independent-set counts i_0..i_8 = 1, 9, 28, 56, 70, 56, 28, 8, 1, so α = 8 and Δ_0..Δ_4 = 8, 19, 28, 14, −14, giving x = 4 and x + 2 = 6 ≤ 6 = α ∸ 2. Conclusion 7 ≤ 8. K_{1,10} also qualifies (α = 10, x = 5). K_{1,7} does not (x = 4, α ∸ 2 = 5). Checked by exhaustive enumeration. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement_of_record` `independent_review` (independent_reviewer, `fc7861fdd415c21f`): Terminal declaration E993HighTail.interiorEligibilityAlphaGeSeven: the source text from `theorem` to just before ` :=` is byte-identical to the synthesis `## Lean awards` C1-LA3 block, SOLUTION-CONTRACT.md §2 Target 3, the formalizer brief §2 and the contract expected_statement (SHA-256 16f7270f20ee1f5980d1381a2297a3ea3460caf934ad0b7cc6d48299b15eac07); it occurs exactly once in Main.lean (8d500fd7…), followed by ` :=`. Binders read from the Lean text: {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (hT : G.IsTree) (hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2) ⊢ 7 ≤ G.indepNum. No extra hypothesis, no weakened hypothesis, no dropped conjunct, universally quantified over every finite vertex type. Body `E993Interior.eligibleAlphaGeSeven G hT hInterior` applies the carried entry 43 under a new terminal name (the synthesis narrowing of SOLUTION-CONTRACT §2's re-export wording), as the contract states. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la3-fable-fidelity-20260925` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la3-fable-fidelity-attestation-20260925-d6f2d444-19ba-408d-9e59-211fc3055ba7`
- Completed: `2026-09-25T07:47:28Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
