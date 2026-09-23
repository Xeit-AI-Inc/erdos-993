# Formalization Fidelity Review

- Run: `lean-2026-09-21-c4-forest-descent-order-bound`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `5288564db2febb48ff3461dd3a3c940943217bb18dded8019943a2f6dd7e2909`
- Contract projection SHA-256: `9431699265b28a915f40675aef257a065f93e3fa3f3e76296313d13bfc89e375`
- Lean binding projection SHA-256: `2f376a55effba2d8df176bb23b672decd2804c2c1acd357b06d84b48e012b57e`
- Contract source SHA-256: `abcb0e4384a4f78345d2c67c60f72a25cbebccd767b550091bbeb0c298487e10`
- Lean source SHA-256: `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`
- Kernel receipt SHA-256: `28af1d80d207e3f8e6b3c59b783b5484b9831bd961c1c16dabefb3c2c44073f7`

## Check Counts

- Passed checks: 19
- Failed findings: 0
- Warnings: 1

## Findings

- `warning` `scope_fence_coverage` `independent_review` (independent_reviewer, `201d7c9c848f672c`): THEOREM-CONTRACT.yaml's informal_statement carries the synthesis fences on tightness (no claim beyond k=1), the no-recovery exclusion and the no-transfer list, but omits three items of Award group 2's 'Excluded conclusions': (i) 'no linear ceiling'; (ii) the K1-addition target (T-C4-04) inside the no-transfer list; (iii) 'the x <= 4 rank closure must not be bundled with it'. All three are carried verbatim in INFORMAL-PROOF.md Sec.5, which is a hash-bound contract source material (source-informal-proof, role theorem_intent, digest matched), and no artifact in the run asserts any excluded conclusion, so the omission is in the contract's own prose only. Recommend the controller quote INFORMAL-PROOF.md Sec.5's full fence list in the E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP registry entry. Attribution is present and correct: k^2+3k form to seat T4, the sharp (k+1)^2 form critic-attributed jointly to C-T4-F and C-T4-U, adjudicator-verified (contract formulation_status evidence item 3; INFORMAL-PROOF.md Sec.4). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `axiom_and_unsafe_surface` `independent_review` (independent_reviewer, `26ae20d8ba848575`): EVIDENCE/axioms.txt and EVIDENCE/axioms-all-17-declarations.txt report exactly [propext, Classical.choice, Quot.sound] for the terminal theorem and for all 17 registered declarations. RECEIPTS/kernel-verification.json reports verdict 'verified' with source_sha256_before = source_sha256_after = 736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0 and all eleven checks passed; I recomputed the receipt, build-log, axioms-log and sandbox-profile digests it records and all match. A token scan of the Lean source found no sorry, admit, native_decide, axiom, unsafe, partial, implemented_by, extern, opaque, macro_rules or set_option. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `contract_domain_imprecision` `independent_review` (independent_reviewer, `579b1ffa07879b06`): THEOREM-CONTRACT.yaml's quantifier table binds G to domain-x ('X : a finite type', lean_type 'Type u, [Finite X]'), so the canonical projection reports G's domain as 'Type u, [Finite X]' although G ranges over SimpleGraph X. The projection is faithful to the contract; the imprecision is the contract's own bookkeeping and is harmless here because lean_binding.expected_statement, the authoritative text matched verbatim against the source, types G correctly. Worth repairing in a future contract, not by editing this frozen one. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definition_verbatim_check` `independent_review` (independent_reviewer, `a29a522c4d205224`): The three G1 definitions (Erdos993G1.indepCount, coeff, delta) are token-identical to the frozen entries in sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean (SHA-256 aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4 — the same bytes as EVIDENCE/originating-source/Main.lean and as SEMANTIC-CONTRACT.md entries 1-3). The only differences are presentational: this run wraps each definition in 'namespace Erdos993G1 ... end Erdos993G1' and uses the short name, and breaks lines differently. Binders, types, bodies and resolved constants are identical; no re-declared definition differs in meaning. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `dependency_binding` `independent_review` (independent_reviewer, `2d10556405a19ef5`): The input's three dependency arrays are empty by the canonical projection; toolchain and Mathlib identity are bound instead by DEPENDENCIES.yaml, RECEIPTS/dependency-authority.json (verdict bound_read_only, copied_package_bytes false) and RECEIPTS/kernel-verification.json, which agree on Lean 4.32.2 (commit f3b06c7) and Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c, the pins SOLUTION-CONTRACT.md Sec.4 requires. The declaration depends on Mathlib and the three G1 definitions only; no registered-but-unformalised claim and no prior Lean award is a dependency. EVIDENCE/superseded-fidelity-input-1/ is empty because no formalizer-drafted input existed when the controller generated the canonical one, which FORMALIZER-REPORT.md's 'Remaining gates' section states. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `hypothesis_surface` `independent_review` (independent_reviewer, `0b3f6840c2cb0902`): The terminal statement carries exactly the contracted binders and hypotheses and no others: {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic) (k : ℕ) (hk : 1 ≤ k) (hneg : Erdos993G1.delta G (k : ℤ) < 0), concluding Nat.card X ≤ (k + 1) ^ 2 in ℕ. No Fintype, DecidableEq, DecidableRel or Nonempty instance appears in the terminal statement; 'classical' and 'letI := Fintype.ofFinite X' occur inside the proof only. hG is Mathlib's SimpleGraph.IsAcyclic (∀ v (c : G.Walk v v), ¬c.IsCycle), i.e. forests and not trees; connectivity is assumed nowhere, the counting lemma applying IsAcyclic.isTree_connectedComponent per connected component. The contract's expected_statement occurs verbatim exactly once in the hashed source and hashes to bca81d5c08164f14197f86498d2c3dcccd426a6222a3366bfeb695d71f4022d7, the contract's expected_statement_sha256. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `72ee1135ee99c597`): The hypotheses are jointly satisfiable and the conclusion is not trivial. Witnesses computed independently: K_2 at k=1 (i_1=2, i_2=0, delta=-2<0, Nat.card X=2<=4); the 4-vertex star and the 4-vertex path at k=1 (i_1=4, i_2=3, delta=-1<0, Nat.card X=4=(1+1)^2), so the bound is attained at k=1, matching the synthesis's recorded true maximum 4. An exhaustive check over every forest on at most 7 vertices for k=1..5 found no violation of the conclusion; that is bounded evidence, not a proof, and the kernel receipt carries the proof. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_reproduction` `independent_review` (independent_reviewer, `75ba9f4dd13f1133`): I re-ran control/regenerate_fidelity_input.py in --dry-run mode into my scratch directory; its output is byte-identical to EVIDENCE/fidelity-audit-input.json (SHA-256 8cc0dcd1d480fe43aec8cd3945712e71cacfb5c159d476dd1902563da8c66836). Every projected field is the contract's own text rather than a paraphrase: definitions, hypotheses and conclusion carry the contract's description/statement strings, lean_statement carries lean_binding.expected_statement, and the axiom and constructivity fields carry the contract's policy. The fingerprints I recomputed are contract 9431699265b28a915f40675aef257a065f93e3fa3f3e76296313d13bfc89e375 and binding 2f376a55effba2d8df176bb23b672decd2804c2c1acd357b06d84b48e012b57e. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `supplementary_axiom_log_provenance` `independent_review` (independent_reviewer, `3488fdabd6604c32`): EVIDENCE/axioms-all-17-declarations.txt attributes its messages to LeanProof/Main.lean:391-407 while the hashed source has 390 lines, i.e. that log was produced by a transient pass that appended 17 '#print axioms' commands to the file (the source's mtime equals the log's), after which the file was restored to the hashed content the kernel verifier then checked. The declaration names and their order in the log match the 17 registered entries exactly, and axiom dependencies propagate to the terminal declaration, whose footprint is bound by EVIDENCE/axioms.txt and the kernel receipt. Recorded so the line numbers are not misread as source drift. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c4-la2-fable-fidelity-20260921` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c4-la2-fable-fidelity-attestation-20260921-b089bf8c-b7c4-4472-ae51-41cab00a097f`
- Completed: `2026-09-21T21:21:12Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
