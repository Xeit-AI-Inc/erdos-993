# Formalization Fidelity Review

- Run: `lean-2026-09-28-c1-la3-two-binomial-descent`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `ec5c31aac7769744f233b2b1cd3d3970c430e79d087547544251df7fe6cb90ec`
- Contract projection SHA-256: `5a3d3baf3336864e6b6e3ddc0deb790533033c4ed052e02c2a471867663f27c2`
- Lean binding projection SHA-256: `e132ce0d0d879daaca28182984cae18fcc0200b4e799d30afbac20ce9d5d2be3`
- Contract source SHA-256: `33bc3c74a4f8fef571367a974cea3ee1a2ff761a1ec9da051f0df01b74f66bcc`
- Lean source SHA-256: `c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011`
- Kernel receipt SHA-256: `717a0830f98026711cd5714cf2f1e109364ed35b8a8dabdb6911cdcc82a6fb72`

## Check Counts

- Passed checks: 19
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `companion_lemmas` `independent_review` (independent_reviewer, `6ccd7aa8fb52fa75`): (G) E993Transport.twoBinom_coeff_strictAnti_of_gap and (E1i) E993Transport.cb8_E1_conditionI_topRank are on the face as lemmas, with binders, hypotheses and conclusions exactly the synthesis's statements. (E1i) uses a_q = 8q-1, b_q = 8(m-q)+1 as the E1 key's r_q at d = 8 (SEMANTIC-CONTRACT §2), so at q = 1 the (1+y) degree is 7 (repair 'U3's degree is 7, not 8' honoured). (E1i) is strict, as the synthesis states; it implies the criterion's non-strict (i) at p* only. All six NEW declaration names the synthesis lists are present under exactly those names. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `dependency_graph` `independent_review` (independent_reviewer, `1467ed0fb9a40ca3`): Minor contract bookkeeping: the dependency graph lists def-poly-coeff-z as a dependency of the conclusion, although its own description (correctly) says polyCoeffZ is proof-internal and absent from the terminal statement. This over-declaration does not change the meaning of the statement; no repair needed. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences_and_repairs` `independent_review` (independent_reviewer, `f3c28513bd1a1f62`): Fences honoured in the contract scope text, INFORMAL-PROOF.md and the docstrings: (BD) is a NODE of (ELIG-top)(a), not (ELIG-top)(a); (E1i) is a Tier 3 dependency reduction, never Tier 2 progress; (G) makes no family or tree claim; no favorability, no rank other than p*, threshold key's (a) not claimed off p*; no fenced object (ELIG-top, favorability, HALL, flows, trees) occurs in Main.lean. Repairs present: no Q_0 or U3 §5.6 input; degree 7; none of U3's Lean atoms (E993R31U3.doubledCoeff, doubledCoeff_succ_mul, doubledCoeff_diff_sign) occurs in Main.lean. descent_of_recurrence_logconcave has binders and hypotheses identical to C-U3-T's Critic.lean scratch (435eb4a1...23de, verified against SOURCE-DIGESTS.json): re-authored under attribution, not carried. Attribution on the contract face matches the synthesis list plus the formalizer. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `d34248926a87b36a`): Kernel receipt RECEIPTS/kernel-verification.json (SHA-256 717a0830...6fb72) has verdict verified, binds Main.lean c0605e12...3f011 before and after, and reports exactly {propext, Classical.choice, Quot.sound} for E993Transport.cb8_block_descent_topRank; all 21 declarations are within that set (EVIDENCE/axioms-all-declarations.txt). Token scan of Main.lean: no sorry, admit, native_decide, axiom, decide, opaque, extern, implemented_by or set_option. Exactly one theorem; 20 lemma/def. All 21 Snippets fragments hash to their Main.lean entry markers. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `no_newton_darroch` `independent_review` (independent_reviewer, `075c9005cf5c09e1`): No hypothesis of any declaration assumes a Newton, Darroch, real-rootedness or log-concavity fact: recurrence (R) is proved from the derivative identity, positivity and LC are proved by genuine induction on linear factors (two-by-two minor invariant on the zero-extended ℤ-indexed sequence; proof-internal choice, disclosed in INFORMAL-PROOF.md), and the gap facts are omega. (BD) and (E1i) are stated at p* on the class 107 ≤ m, m % 3 = 2 only. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `bdf17c33295cc118`): Non-vacuous: m = 107, j = 5 satisfies every hypothesis (107 % 3 = 2; 5 ≤ 5 ≤ 107), giving p* = 572, l = 565 and the claim [x^566] < [x^565] of (1+x)^40 (1+2x)^817. An exact-integer Python sanity check (a check, never proof) at m = 107, 110, 113 confirms the descent for every 5 ≤ j ≤ m and (E1i) for every 1 ≤ q ≤ m, and shows the descent fails at j ∈ {0, 1, 2}, matching SYNTHESIS S6; so the lower bound on j is load-bearing and the statement is neither vacuous nor trivially strong. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `object_of_record` `independent_review` (independent_reviewer, `1390798db31d5310`): The polynomial in (BD) is the object of record: SEMANTIC-CONTRACT §2 block decomposition I = Σ_j C(m,j)(1+2x) x^j (1+x)^(8j) (1+2x)^(8(m-j)), so block j's coefficient at x^(p*-1) vs x^(p*-2) is C(m,j)·[x^(l+1)] vs [x^l] of (1+x)^(8j)(1+2x)^(8(m-j)+1), l = p*-2-j, matching the synthesis Row 5(i) P_j and l_j. p* = (16m+4)/3 matches SEMANTIC-CONTRACT §2. No carried entries (the synthesis says none); no definition of record is re-typed; the only NEW definition, E993Transport.polyCoeffZ, is proof-internal and does not occur in the terminal statement or in (G)/(E1i). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_integrity` `independent_review` (independent_reviewer, `d588ef37a2a87de9`): Recomputed fingerprints equal the controller's: contract_projection_sha256 5a3d3baf...f27c2, binding_projection_sha256 e132ce0d...d2be3. Checked the input against THEOREM-CONTRACT.yaml (33bc3c74...bcc) and Main.lean myself: definitions (4), hypotheses (4), conclusion, quantifiers/domains (m, j : ℕ), permitted axioms and declaration name/path are verbatim projections; lean_statement equals the contract's expected_statement (SHA-256 40d79e5b...b5ed), which occurs exactly once in Main.lean and equals the source text from 'theorem' up to ' :='. No paraphrase or omission found. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `terminal_statement` `independent_review` (independent_reviewer, `2d68197a789d491e`): The terminal E993Transport.cb8_block_descent_topRank is exactly the synthesis's (BD) (cycles/cycle-1/stage6/SYNTHESIS.md, ## Lean awards, C1-LA3): binders m j : ℕ; hypotheses 107 ≤ m, m % 3 = 2, 5 ≤ j, j ≤ m, and nothing else; conclusion coeff(l+1) < coeff(l) of ((1+X)^(8j)(1+2X)^(8(m-j)+1) : ℤ[X]) with l = (16m+4)/3 - 2 - j inlined. Lean parses '... - 2 - j + 1' as (l)+1. ℕ arithmetic: under hmod, 16m+4 ≡ 0 (mod 3) so the floor division is exact and equals p*; m - j is a true value by hjm; l ≥ (13m+4)/3 - 2 ≥ 1 so no truncation. Coefficients are over ℤ (the numeral 2 : ℤ[X] is C 2). No weakening, no extra hypothesis, no dropped conjunct. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la3-opus-fidelity-20260928` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la3-opus-fidelity-attestation-20260928-59b7806b-909a-43aa-b85d-18337b6ca9e5`
- Completed: `2026-09-28T04:24:06Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
