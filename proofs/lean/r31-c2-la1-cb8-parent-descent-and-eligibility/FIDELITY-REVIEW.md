# Formalization Fidelity Review

- Run: `lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `f8a2d3b6e2fed4b999b3ddd61854284d6933a764338dcd6f0f19d0c960bf44c5`
- Contract projection SHA-256: `7eef96aa898716d29ab89a7ddce69b9e86decd65fb254a77a5877781e8a954b7`
- Lean binding projection SHA-256: `ca9f522e0ddee0ab5723b9392e992229b91ac32dff924f46f8827b0575c92261`
- Contract source SHA-256: `2158db77f8b21a86164fddb26f9e6f2f135e4bcdc02d5297f3dce29bcc1e587d`
- Lean source SHA-256: `986b525702a5a0d03f205da6ffbe6faf675ef4841473a498b33ef27e70190c9d`
- Kernel receipt SHA-256: `adb8068403b9cae47d3f9f8d98874698d7c2a7aad009a694e901a28217c3a3ee`

## Check Counts

- Passed checks: 54
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `attribution` `independent_review` (independent_reviewer, `c915ae4ad7154387`): Contract scope text and INFORMAL-PROOF.md carry exactly the synthesis Attribution list plus the formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5); C1-LA3's face line is copied verbatim and verified against its frozen INFORMAL-PROOF.md: "Codex's heterogeneous-closure binomial-block mechanisms are cited as templates only, not as carried fragments (none was opened as a Lean source in this run)." Expected `"semantic fidelity"`; observed `"match"`.
- `note` `carried_fragments` `independent_review` (independent_reviewer, `840f286bcb41fe87`): Independent carry check: 97 run entries byte-identical to origin fragments (C1-LA3 1-20; C1-LA2 1-77), each origin fragment matching its FORMALIZATION-STATE digest and its Main.lean entry; origin Main.lean digests c0605e12...3011 and a906ec17...5f3f match their kernel receipts (verdict verified). Entries 57 and 105 (ruling R31-N-15): replacing the first `lemma ` by `theorem ` reproduces C1-LA3 entry 21 (1afd4f7d...) and C1-LA2 entry 78 (df7623e2...) byte-for-byte; no other difference. All 99 origin entries are covered. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `certificate_audit` `independent_review` (independent_reviewer, `868355317c0d3074`): S_5 generator audit: shipped gen_lean_s5.py 53d4731b... and crit_u1t_Poly_u.json f75d2f19... match the frozen C2 sources (SOURCE-DIGESTS.json, 687/687). Reviewer check (a check, never proof): the literal 51-coefficient polynomial in cb8Poly_pos and in cb8S5_scaled equals Poly(u) (exponents 0..50, all positive); the definitional cb8S5(3u+107) satisfies 2^45·120·(16u+571)!·(8u+292)!·S_5 = 2^(16u+570)·(24u+817)!·Poly(u) at u = 0, 1, 2, 5, 31; all 252 bc*A/B lemmas agree numerically at u = 0 and 3. Read by hand: choose_base_form, choose_small, tail_coeff, coeff_one_add_two_X_pow, two_pow_block_*, bc0A_0, bc3A_5, bc5B_20, blk0, blkT, cb8S5_scaled, cb8Poly_pos, cb8S5_pos: every one is universal in u and closed by linear_combination / positivity, not an enumeration. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions_of_record` `independent_review` (independent_reviewer, `c9761dc8e36dbc80`): Statement-level objects are carried byte-identically from C1-LA2 (entries 10 indepSetCount, 11 forwardDifferenceDel, 22 crossingIndex, 23-25 cbEdge/cbGraph/cbGraph_decAdj) plus Mathlib SimpleGraph.IsTree / indepNum. crossingIndex = Nat.find of forwardDifferenceDel G ∅ k < 0 with forwardDifferenceDel = (i_{k+1} : ℤ) − i_k, the forward-difference index of record Δ_p = i_{p+1} − i_p; cbEdge is the frozen labelling (0 = r, 1 = s, 2 = v, u_i = 3+17i, b_ij = u_i+1+2j, c_ij = u_i+2+2j on Fin (17m+3)). New proof-internal cb8G = X(1+X)^8 + (1+2X)^8 is the contract's G = (1+2X)^8 + X(1+X)^8 with summands commuted; cb8I, cb8P, cb8S5 match SEMANTIC-CONTRACT §2 and SR-4's pooled quantity; the ℕ closed form critU3T_cb_indepPoly_closedForm is stated with the non-swapped G. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `documentation` `independent_review` (independent_reviewer, `0a20f824f9db357a`): Non-semantic: the docstring of cb8S5 (entry 35), inherited from U1's seed, still says node (2) 'is NOT proved in this seat ... isolated here as a named hypothesis'; the formalizer's adjacent comment correctly records its discharge by CriticU1T.cb8S5_pos. Options on the face: maxHeartbeats 4000000 appears ×3, not the synthesis tally ×5 (the other two C-U3-T declarations are off the DAG); disclosed in INFORMAL-PROOF.md and FORMALIZER-REPORT.md. Neither affects the statement. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences_and_scope` `independent_review` (independent_reviewer, `c43e678c273fb383`): Contract scope text carries every synthesis fence (one rank p*; the class only; (H) not claimed; conjunct 4 not claimed; no FLOW ⇒ SIGN; no aggregate or (HALL) status; not a new E993-R31- identity) and every excluded conclusion ((H); conjunct 4; favorability; (HALL) at any scope; S(T_m,p*) ≤ 0; other ranks; m < 107; m ≢ 2 mod 3; d ≠ 8). No fenced object occurs in the terminal; IsSaturatingFlow appears only as the hypothesis of the ungraded companion AdjU.cb8_topRank_of_flow, which the synthesis lists; the contract asserts no grade for any companion. Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch present. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `da180ed914b9cf66`): Non-vacuous: m = 107 satisfies 107 ≤ m and m % 3 = 2. Reviewer instance check (closed form over ℤ, itself cross-checked against the literal cbEdge tree at m = 1..3): p* = 572, α = 964 = 9m+1, first descent x = 570, i_571 < i_570, x+2 ≤ p* (tight), 3p* = 1716 < 1929 = 2α+1 — agreeing with the registered fixed point CB(8,107)/572. No ℕ-subtraction truncation in the statement (p* ≥ 572). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_granularity` `independent_review` (independent_reviewer, `15b71b6f89cd2c6b`): The contract projects the conclusion as a single clause (the whole four-conjunct conjunction); the deterministic comparison is therefore at whole-conclusion granularity. This review checked each of the four conjuncts separately against the synthesis. The Out/In-assignment and Newton/Darroch checks in the brief's generic list do not apply to this award (no flow or LP object in the statement; the carried C1-LA3 layer is byte-identical to its verified origin). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `proof_dependencies` `independent_review` (independent_reviewer, `312d493e0355e271`): Every DAG node is a proved declaration; no lemma is assumed. cb8_elig_top_a_conditional's hS5 is discharged by CriticU1T.cb8S5_pos; the carried (BD) entry 21 is used within its scope 5 ≤ j ≤ m (for j ≥ 6). Kernel receipt adb80684... verified; terminal axioms and all 549 per-declaration axiom lists are within {propext, Classical.choice, Quot.sound}; independent token scan finds no sorry/admit/native_decide/axiom/decide/opaque/notation/attribute beyond the carried cbGraph_decAdj instance; interval_cases only over the fixed gadget index j' < 8. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `repairs` `independent_review` (independent_reviewer, `6616b16806d0c6ec`): All three synthesis repairs are present: U1's (E) wording narrowed (entry 111 comment: conditional (ELIG-top)(a) for cb8I only; (E) stated only by the terminal); U3's P4 import edit replaced by a clean single-source `import Mathlib` (entry 521 comment; Main.lean line 1 is the only import); the extra parent-descent conjunct added (cb8_indepSetCount_parentDescent and the terminal's second conjunct). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement_identity` `independent_review` (independent_reviewer, `45b1ec66b1074e53`): Terminal E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3 read in Main.lean (986b5257...): binders (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) and the four-conjunct conclusion are exactly the synthesis's frozen C2-LA1 terminal (namespace prefix supplied by `namespace E993Transport`, the only difference). No extra hypothesis, no dropped conjunct, no weakening; both hypotheses are used. Exactly one `theorem` in the file. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c2-la1-opus-fidelity-20260928` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c2-la1-opus-fidelity-attestation-20260928-17e33fe2-8b98-49e4-920f-55d71502c56e`
- Completed: `2026-09-28T08:10:36Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
