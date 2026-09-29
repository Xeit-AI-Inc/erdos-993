# Formalization Fidelity Review

- Run: `lean-2026-09-28-c2-la2-cb8-leaf-deletion-closed-forms-descent`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `da0eafc2eed899994630bb5f197b72216dea44cc5164a9cc6fb7ceed01eee820`
- Contract projection SHA-256: `57628ae6e95c0b2b3510ef0fed14f0bd6323c6a6ba11723eb236c4706ffab965`
- Lean binding projection SHA-256: `4ca65566e663ca1679c794e70110adf4b2dbbe7bb3bf521b80c3506d3360d351`
- Contract source SHA-256: `26f71a554e927b5cf903899b32465d6eab5118c3ef1b6fc4a024ee9a8440126b`
- Lean source SHA-256: `e75c66b2eee237d04354da33ab9fb941c5fb77be98cf8db42720a681361bfaae`
- Kernel receipt SHA-256: `4dd32752f8e2aec1cd82b39112d4755cdbcfda9454b5e81ab545c3fb8d9a3de8`

## Check Counts

- Passed checks: 17
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `brief_boilerplate` `independent_review` (independent_reviewer, `9e494f501f522762`): The reviewer brief's generic points about Out/In quantified over every assignment do not apply: this award has no Out/In, flow or assignment objects. Recorded so the omission is visible. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `carried_fragments` `independent_review` (independent_reviewer, `190c8f605324d28f`): Entries 1-17 are byte-identical (BEGIN/END header lines, kind, name, digest and body) to the frozen C1-LA3 origin sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean (c0605e12...3011). That source is bound to the origin kernel receipt (717a0830...fb72: verdict verified, source_sha256_before = after = c0605e12...3011) and to the origin FORMALIZATION-STATE.json entries 1-17 (index, kind, name, source_sha256 all equal). Each entry's recorded digest equals the SHA-256 of its body. Load-bearing entry 17 twoBinom_coeff_strictAnti_of_gap has hypotheses 1 <= t, t <= a + b, 3a + 4b + 2 <= 6t as the synthesis states. Log-concavity in the carries is proved by factor induction (strongLC_linear_step, twoBinomCoeffZ_strongLC). No Newton or Darroch fact is assumed. C1-LA3 entries 18-21 (its (BD)/(E1i) terminal layer) are not carried, so the brief's (BD)/(E1i) point does not arise. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `conditions_R1_R7` `independent_review` (independent_reviewer, `43273c2ea4e6d5d1`): Formalizer brief section 3: R1 single-source project, carries byte-identical and receipt-bound (verified above), no cross-award import. R2 uniform proofs, no enumeration. R3 contract validated; expected_statement is exact; all 34 source_materials digests recomputed and match; canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch is on the contract, CAPSULE-VERIFICATION.json and FORMALIZER-REPORT.md. R4 axioms.txt present; the formalizer reports a pre-verification digest that the verifier later rewrote (disclosed). axioms-all-declarations.txt lists all 28 declarations fully qualified, each within the allowlist. R5 INFORMAL-PROOF.md follows the DAG and carries the N-subtraction/division/cast audit, fences, exclusions and attribution. R6 not triggered. R7 exactly one terminal theorem (entry 28); every other declaration is a lemma or the carried def. No condition is missing. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `contract_metadata` `independent_review` (independent_reviewer, `91209862ce9f3855`): Cosmetic, no effect on fidelity: the contract's dependency graph has an edge def-poly-coeff-z -> conclusion, and the conclusion lists def-poly-coeff-z as a dependency, although polyCoeffZ does not occur in the terminal statement (the definition's own description correctly says it is proof-internal). The canonical projection also carries the whole two-conjunct conclusion, with its prose gloss, as a single clause. I reviewed both conjuncts separately in the Lean source. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions_of_record` `independent_review` (independent_reviewer, `904e55d8f4c4664f`): Checked against SEMANTIC-CONTRACT.md (7cc0bf43...226e) section 2 at d = 8: G = (1+2X)^8 + X(1+X)^8 and G_c = (1+2X)^7(1+X) + X(1+X)^7 are transcribed exactly; the arm polynomial (1+X)G^m + X(1+2X)^(8m) is I(CB - v) and the private polynomial (1+2X)G_c G^(m-1) + X(1+X)^2(1+2X)^(8m-1) is I(CB - c). p* = (16m+4)/3 in N is exact on the class (16m+4 = 0 mod 3); m - 1 and 8m - 1 are exact since m % 3 = 2 forces m >= 2. All objects are Mathlib Polynomial over Z (coeff : Z[X] -> N -> Z, zero above the degree), numerals are Z[X] numerals, and no local X shadows Polynomial.X (the only def in the file is the carried polyCoeffZ). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `e31d6316bdb82016`): Formalizer brief section 2 fences, each honoured and stated on the contract's informal_statement: (1) closed-form polynomials over Z[X] only, with no cbGraph, IsFavorableAt or favorableLeaves in any declaration (the one 'cbGraph' token is in the terminal docstring, which says the statement is not about cbGraph); (2) no status transfer to the favorability key's graph statement; (3) one rank p*; (4) d = 8; (5) the class m >= 107, m = 2 (mod 3); (6) not Tier 2 progress. The excluded conclusions of the synthesis (IsFavorableAt, (H), Tier 2) appear in the contract's exclusion list. Attribution on the contract face and on INFORMAL-PROOF.md is exactly the synthesis ### C2-LA2 list plus the formalizer, and no grade is asserted for any companion. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `index_of_record` `independent_review` (independent_reviewer, `ca716974210fadbc`): Each conjunct reads coeff(p*+1) < coeff(p*), which is exactly Delta_(p*) < 0 for the forward difference of record Delta_p = i_(p+1) - i_p at p = p* (the SEMANTIC-CONTRACT section 1 clarification and synthesis R-1). No Delta_(p*-1) or other rank occurs. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_axioms` `independent_review` (independent_reviewer, `3409fbd3d79758a1`): RECEIPTS/kernel-verification.json (4dd32752...a3de8): verdict verified, source_sha256_before = after = e75c66b2...afbaae, theorem_name is the terminal, and all checks passed. Terminal axioms are exactly [propext, Classical.choice, Quot.sound] (EVIDENCE/axioms.txt); the only diagnostic is the expected unused-variable warning for hm. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `833e778dd18d86bc`): m = 107 satisfies every hypothesis (107 >= 107; 107 % 3 = 2), with p* = 572 exact. A reviewer check (python3 -B, integer polynomial arithmetic; a check, not proof) gives both conjuncts true with nonzero coefficients at m = 2, 5, 107, 110 and 200. A literal tree DP of I(CB(8,m) - v) and I(CB(8,m) - c_11) equals the two Lean closed forms at m = 1, 2, 3, 5 and 8, which supports the transcription of the closed forms of record. Their general proof remains the excluded r30 proved_informal node. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `proved_not_assumed` `independent_review` (independent_reviewer, `0fa1a447a0880aff`): The block expansions cb8_armLeaf_blockExpansion (weights C(m,j)) and cb8_privateLeaf_blockExpansion (weights C(m-1,k) with E0_k, E1_k) are hypothesis-free lemmas proved by add_pow and ring. The regrouping cb8_privateLeaf_regroup is proved by ring. Arm weights are proved > 0 (Nat.choose_pos with j <= m) and private weights >= 0 (positivity on a Nat cast), inside the proofs of entries 21 and 27. Every block descent (entries 19, 20, 24, 25, 26) is an instance of the carried (G) whose side conditions are discharged by omega over variables. No sorry/admit/native_decide/decide/axiom tokens; no set_option, attributes, instances or macros. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `scope_hypothesis` `independent_review` (independent_reviewer, `c9abce4df79138b4`): hm : 107 <= m is unused by the proof (the lint warning confirms it); the statement also holds for smaller class values. This is the frozen scoping choice (fence 1; synthesis 'Hypotheses: 107 <= m (unused; fence 1)'), not a fidelity defect, and the contract discloses it. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement_identity` `independent_review` (independent_reviewer, `efe2985d8df34089`): Terminal E993Transport.cb8_leafDeletion_closedForms_descent_topRank (Main.lean e75c66b2...afbaae, entry 28) is byte-identical to the frozen block in cycles/cycle-2/stage6/SYNTHESIS.md (260c8195...6024) ### C2-LA2 after exactly the two recorded plumbing changes (namespace-relative name inside namespace E993Transport; removal of the 2-space Markdown list indentation). Checked programmatically: dedented synthesis block == contract expected_statement (sha256 d6407ad2...56d5) == input lean_statement (both sides), and it occurs exactly once in the source. Binders (m : N), hypotheses hm : 107 <= m, hmod : m % 3 = 2 and the two-conjunct conclusion match the statement of record; no extra hypothesis, no dropped conjunct, no weakening. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c2-la2-opus-fidelity-20260928` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c2-la2-opus-fidelity-attestation-20260928-5063f9c6-a9a0-45f9-9419-7964fb7a1b15`
- Completed: `2026-09-28T07:39:52Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
