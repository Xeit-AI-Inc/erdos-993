# Formalization Fidelity Review

- Run: `lean-2026-09-26-c1-la1-active-tag-weight-identity`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `57bdd9e5f03eaa0116e1deab2dab4078f43ef699503ef24faad1b0b91b175633`
- Contract projection SHA-256: `1f14dece5db778ccd03a69a0bd5cbfc90a49670a7ea314e15137edfbd189e050`
- Lean binding projection SHA-256: `0047fdbbaa716f6a1f087cca56c4f311e9e5c2ac624e647686b7210a4185593d`
- Contract source SHA-256: `539bee231e266a57c312e8efa24fab8bf3000fb2dc090bd0756ca167d21ec3c9`
- Lean source SHA-256: `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb`
- Kernel receipt SHA-256: `9e7334914b8ea5a4532d89d2f039aacc13b3be92a98b09685d8a7f1cb5c5d00a`

## Check Counts

- Passed checks: 37
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `definitions_of_record` `independent_review` (independent_reviewer, `b9248a952c36d1eb`): The 14 carried fragments (run entries 1-13 and 22 = first-interior entries 1-6, 8-13, 18, 42) are byte-identical to the frozen first-interior Main.lean (8d864da2...) entry bodies and to its Snippets fragments; marker digests equal the synthesis carry table. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `evidence_scope` `independent_review` (independent_reviewer, `c8a56535290366ef`): The formalizer's pp.all identity log for repair 3 (DRAFTS/defs-pp-all.log) is outside this reviewer's read boundary and is not relied on. The meaning of each definition does not depend on which Decidable instance is chosen (Finset.filter is instance-irrelevant up to propositional equality). The textual carry checks and the kernel-checked draft-text companions are sufficient. Per controller note 0c, the textual divergence from C1-LA2's definition wrappers is a controller record, not a finding. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `01dc883dabc7c02c`): The Lean source and contract assert nothing about (HALL)/(HALL-COND), the sign of S, trees, RTree, census values, TREE/FOREST/TRANSFER or Erdős #993. Fenced terms occur only in exclusion text. The only sign content in Main.lean is the carried first-interior lemma E993Interior.highTailAggregateFromShadow (entry 42), which is conditional on hShadow and the high tail. The synthesis authorizes its whole-fragment carry, it is not used by the terminal theorem, and the contract does not re-grade it. Minor wording: the contract says transportRel 'occurs in no statement of this award', but the companion transportRel_iff_draftText mentions it. That companion is a pure definitional iff with no HALL content. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_binding` `independent_review` (independent_reviewer, `ab0b174b053d32ce`): kernel-verification.json verdict verified; source_sha256 before=after=86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb (= Main.lean on disk); terminal axioms exactly [propext, Classical.choice, Quot.sound]; reviewer scan of Main.lean finds no sorry/admit/native_decide/axiom/decide token; exactly one `theorem` keyword (entry 36). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `new_definitions` `independent_review` (independent_reviewer, `09f13b8e440b7fd5`): The eight E993Transport definitions and six U2 lemmas are byte-identical at the declaration level to sources/c1-stage7-sources/U2-Main.lean (110c2751...) at the cited lines; favorableLeaves and WeightedHall differ only by the `open Classical in` prefix (repair 3). Meanings agree with the synthesis frozen text and SOLUTION-CONTRACT §2: activeWeight filters F ∩ B by ¬ Disjoint (B.erase v) (tagWitnesses G v) with tagWitnesses = (N(s_v)).erase v (active tags, never |F ∩ B|); transportRel is exactly (D) ∃ q ∈ B, A = B.erase q, or (S) ∃ u ∉ B with |N(u) ∩ B| = 2 and A = insert u (B \ N(u)), neither wider nor narrower; favorableLeaves = leafSet filtered by IsFavorableAt at the single rank p (F fixed at p). The kernel-checked companions 29-35 tie each compiled definition to the §2 draft text. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `47a58d48a68cbe45`): The hypotheses are satisfiable by every finite graph with p ≥ 1. The reviewer's literal brute-force transcription (bounded_computation, not proof) confirms the identity with nonzero, discriminating values: K_{1,3} p=1 gives 6 = 6 (the |F ∩ B| variant gives 3); K_{1,12} p=8 gives supply 1980, capacity 3960, S = -1980 (the SEMANTIC-CONTRACT fixed point); non-tree and disconnected graphs (triangle with pendants, C4 with pendants, K2 + K_{1,4}) also agree. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_integrity` `independent_review` (independent_reviewer, `9ce3e28753b6f3a6`): Reviewer recomputed both projections (contract 1f14dece5db778ccd03a69a0bd5cbfc90a49670a7ea314e15137edfbd189e050, binding 0047fdbbaa716f6a1f087cca56c4f311e9e5c2ac624e647686b7210a4185593d) and checked every projected field against THEOREM-CONTRACT.yaml (539bee23...) and Main.lean: 21 definitions (id, description) complete and in order, domains, quantifiers, hypotheses, conclusion, permitted axioms, lean_statement = expected_statement (sha 661470f6...) occurring verbatim once in Main.lean before ' :='; every definition's Lean text of record occurs verbatim in Main.lean. No paraphrase or omission. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `prose_erratum` `independent_review` (independent_reviewer, `9b6a3e6154dca8de`): SEMANTIC-CONTRACT §1.2 ('(B ∖ {v}) ∩ W_v = B ∩ N(s_v)') and §3 ('B ∩ N_T(s_v) ≠ ∅') literally include v itself, since v ∈ N(s_v). This is erratum R30-E-b. The compiled definition, the contract and INFORMAL-PROOF.md all use the corrected meaning ('another neighbour of s_v', i.e. B.erase v meets N(s_v).erase v). Per SEMANTIC-CONTRACT, where prose and Lean disagree the Lean governs, and the Lean is the intended object. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `repairs` `independent_review` (independent_reviewer, `6f5764c4fde6a735`): Synthesis repairs 1-9 are present. (1) layerWeight_sub_eq_sum is a lemma. (2) hpk2 is removed; otherwise identical to U2. (3) noncomputable, with `open Classical in` on favorableLeaves/WeightedHall only. (4) The closing rfl is kernel-accepted. (5) The explicit G is recorded, and the draftBinders companion covers the §2 {G} form. (6) The contract is rebuilt: expected_statement, 21 definitions, dependency edges, hp note, attribution, 'Gate ruling 9'. (8) There is no Main.lean.bak1 or Check.lean. (9) The seven C-U2-T equivalences are named companions. For (7), new declarations were minted through the registrar as run entries 14-21 and 23-36, not '46+': that numbering belongs to the first-interior index space, while a fresh single-source registrar numbers from 1. This is an index-space difference only; the substance of repair 7 is met. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `terminal_statement` `independent_review` (independent_reviewer, `f6fa8ab6adf592d1`): activeWeightAggregateIdentity is exactly the synthesis statement of record: binders {V} [Fintype V] [DecidableEq V] (G) [DecidableRel G.Adj] (p) (hp : 1 ≤ p); conclusion (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) - layerWeight G (favorableLeaves G p) p = C5LA1.aggregate G p, with both layer weights cast to ℤ (no truncated subtraction). No extra hypothesis, no dropped conjunct, no IsTree or eligibility. The hp note is correct: F_0 = ∅ because Δ_0(G - v) = (n-1) - 1 ≥ 0 for any leaf; hp is load-bearing for the general-F lemma (K_{1,3}, p = 0: 0 vs 6, reproduced by the reviewer). Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la1-fable-fidelity-20260926` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la1-fable-fidelity-attestation-20260926-53efd6fd-574e-4ca2-b58b-2297b2393a22`
- Completed: `2026-09-26T19:07:48Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
