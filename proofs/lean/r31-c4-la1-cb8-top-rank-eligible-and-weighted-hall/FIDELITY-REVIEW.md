# Formalization Fidelity Review

- Run: `lean-2026-09-29-c4-la1-cb8-top-rank-eligible-and-weighted-hall`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `6f3bc96c1cb2a38726c530ed392ff857204a774fb4561d89822132d59cdded34`
- Contract projection SHA-256: `8276105b6b6099adcf13d1ef6d8f1b16fa4aee419aa7a5c92bc4df3beb08cccd`
- Lean binding projection SHA-256: `f3432239f5c45f0f33195e91d4ebb973febe284e9a95e08cbc183f29294ed4db`
- Contract source SHA-256: `6a950375f85d5034fe69321a484fcd9b318f81274c754b496f70275e0ef4b410`
- Lean source SHA-256: `c1ef9d638a18077cbccfdfa80064309343d8cd3b98262c645dea18cb569e699b`
- Kernel receipt SHA-256: `c5765c150077a97033df81be3ceb110de5fb31e1b6bd626a26cdff211008a883`

## Check Counts

- Passed checks: 80
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `definitions_of_record` `independent_review` (independent_reviewer, `996b9e6acd0c0793`): Carry audit recomputed from the origin Snippets (each origin Main.lean re-hashed against its verified kernel receipt; every origin snippet occurs in its receipted Main): all 50 CARRIED contract definitions match their stated (award, entry, fragment SHA-256) and occur exactly once in Main.lean. Across all 758 entries: 622 byte-identical governed fragments, 5 origin terminals rekeyed theorem -> lemma only (C1-LA1 0033, C1-LA2 0078, C1-LA3 0021, C2-LA2 0028, C2-LA3 0090; the single keyword substitution is reversible and reproduces the origin bytes), r30 C1-LA2 0030/0031 byte-identical, C2-LA1 0547 AdjU.cb8_topRank_of_flow byte-identical (d2c95cbd...2787); 131 new entries, none sharing a name with any origin snippet: no carried fragment is re-typed. The network definitions (indepFamily, tagWitnesses, activeWeight, favorableLeaves, transportRel, IsSaturatingFlow, WeightedHall) are byte-identical to r30 C1-LA1 Snippets 0014-0021 and declaration-identical to r30 C1-LA2 0014-0021 (only the recorded Classical-scope wrapper differs, inherited from r31 C1-LA2's audited freeze repair 3); C5LA1.crossingIndex and its chain are byte-identical to first-interior c2-primary-v2 entries 1-6, 10-12, 14. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences_and_repairs` `independent_review` (independent_reviewer, `ea8353edf142fcf0`): Contract scope text, the terminal docstring and INFORMAL-PROOF.md section 7 carry every fence (one rank p*, d = 8, the class only, selector derived, x through α, no Newton/Darroch, theta* never used, no LP optimality) and every excluded conclusion ((HALL) elsewhere; full (HALL), primary aggregate, TREE, FOREST, TRANSFER, #993 OPEN; S(T_m,p*) ≤ 0 not claimed, no status transfer); no grade is asserted for any companion; attribution matches the synthesis lists plus the formalizer. Repairs present: no print_axioms.sh reference, no reserved-name comment, N8's Part A comment points to this file, choke_neighborFinset_inter_card kept distinct with the _n45 rename, one no_choke_of_root_mem. Options census: 0 set_option/native_decide/admit in new or re-authored text; the 442 set_option lines (maxHeartbeats, maxRecDepth, exponentiation.threshold only) all lie inside byte-identical carried fragments, as the contract's constructivity rationale states; none affects kernel soundness. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `frozen_texts` `independent_review` (independent_reviewer, `3ec39d2ce39c00c7`): All 20 frozen theorem headers of control/C4-FROZEN-STATEMENTS.lean (0fc723d7...e1) occur exactly once in Main.lean with their docstrings/'open Classical in' preambles, the only change being 'theorem' -> 'lemma' (0 occurrences as 'theorem'); the frozen cb8GSec definition block (21 lines) is byte-identical and occurs once. Type-hash parity (EVIDENCE/frozen-type-hash-parity.json) reports all 21 equal to the base; I did not rebuild to recompute those hashes (no build per the brief). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `249649ade9e8b827`): RECEIPTS/kernel-verification.json (c5765c15...a883) verdict verified; source_sha256_before = after = c1ef9d638a18077cbccfdfa80064309343d8cd3b98262c645dea18cb569e699b (Main.lean recomputed by tool); EVIDENCE/axioms.txt (01fd5b9d...1e43, bound in the receipt) reports the terminal on exactly [propext, Classical.choice, Quot.sound]; axioms-all-declarations.txt: 755 axiom lines, every one a subset of those three; forbidden-token scan 0 sorry/admit/native_decide/axiom/decide/unsafe/implemented_by/extern/opaque; every literal 'sorry' in Main.lean is inside a docstring; sorry-walk [] with positive and negative controls. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `f7c0a0cee1777a37`): m = 107 satisfies both hypotheses (107 ≤ 107; 107 % 3 = 2), giving p* = (16*107+4)/3 = 572 exactly (the registered CB(8,107)/572 row); the class is infinite (m = 107 + 3k). The flow conjunct is not trivially satisfiable by f = 0: an independent (p*+1)-set containing r and v exists (r, v plus 571 of the 856 legs), its weight is ≥ 1 because v ∈ leafSet = favorableLeaves on the class (C2-LA3) and r ∈ N(s) \ {v}. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_integrity` `independent_review` (independent_reviewer, `edc2f7985f211ba1`): Fingerprints recomputed: contract_projection_sha256 8276105b6b6099adcf13d1ef6d8f1b16fa4aee419aa7a5c92bc4df3beb08cccd, binding_projection_sha256 f3432239f5c45f0f33195e91d4ebb973febe284e9a95e08cbc183f29294ed4db (both equal the controller's). Input checked field by field against THEOREM-CONTRACT.yaml (6a950375...b410): 69/69 definitions (id, description verbatim, in order), domain m : ℕ, forall m, hypotheses hm/hres verbatim, conclusion verbatim, permitted axioms, lean_statement = lean_binding.expected_statement. No paraphrase or omission. By the canonical projection rule the binding-side facets mirror the contract text; the Lean-side semantics were therefore reviewed directly in Main.lean (below), not inferred from the projection. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `semantic_review` `independent_review` (independent_reviewer, `f39690f340937a62`): Read in Lean: cbEdge encodes exactly the frozen labelling 0 = r, 1 = s, 2 = v, u_i = 3+17i, b_ij = u_i+1+2j, c_ij = u_i+2+2j (i < m, j < 8) with edges r-s, s-v, r-u_i, u_i-b_ij, b_ij-c_ij on Fin (17m+3) (max label 17m+2), cbGraph = SimpleGraph.fromRel cbEdge = CB(8,m). favorableLeaves = leafSet filtered by i_(p+1)(G-v) - i_p(G-v) < 0 (the strict original selector, derived at p*, never assumed); activeWeight = #{v in F ∩ B : (B \ {v}) meets N(s_v) \ {v}}; transportRel = deletion (A = B \ {q}) or switch (u ∉ B, |N(u) ∩ B| = 2, A = (B \ N(u)) ∪ {u}); IsSaturatingFlow = ℕ-valued flow supported on (I_(p+1), I_p, transportRel) arcs, source sums = w_F, target sums ≤ w_F; crossingIndex = least k with i_(k+1) - i_k < 0 in ℤ (counts through rank α, zero above); Mathlib IsTree = connected ∧ acyclic, indepNum = sSup of independent-set sizes. These are SEMANTIC-CONTRACT section 1-2's objects; conjuncts 2-3 are (E), conjunct 4 is (H) at p* (saturating flow form of (HALL)). New Cycle 4 definitions (E1 layer, ChokeState, cb8GSec) do not occur in the terminal statement. No Newton/Darroch fact or theta* law can enter: the terminal has no hypothesis beyond hm, hres and the axiom set is standard. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `terminal_statement` `independent_review` (independent_reviewer, `c1a78b33247ae73b`): The source text of E993Transport.cb8_topRank_eligible_and_weightedHall from 'theorem' up to ' :=' is byte-equal to the contract expected_statement, SOLUTION-CONTRACT section 2, the synthesis ### C4-LA1 block and the formalizer brief section 2 (SHA-256 c17cc9cf5bcc01c53709dd764f02fe37cc481f85794fd5f65affd6efc4174952 for each). Binders: m : ℕ only; hypotheses exactly hm : 107 ≤ m and hres : m % 3 = 2 (no hfav, no extra hypothesis); conclusion the four conjuncts (IsTree; crossingIndex + 2 ≤ p*; 3 p* < 2 indepNum + 1; ∃ f, IsSaturatingFlow ... at the derived selector favorableLeaves (cbGraph m) p*) with none dropped or weakened. Exactly one 'theorem' keyword line in Main.lean; the reserved name occurs only on the terminal declaration (its second occurrence is the registrar-generated '-- VERITYOS ENTRY 758 BEGIN' marker line, not authored text). No new declaration shadows cbGraph, favorableLeaves, IsSaturatingFlow or C5LA1.crossingIndex; no new instance/notation/scoped option leaks into the terminal's entry (all namespace blocks balanced per entry). Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c4-la1-opus-fidelity-20260929` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c4-la1-opus-fidelity-attestation-20260929-6c369119-0984-4199-8876-5e1f3903ea45`
- Completed: `2026-09-29T06:22:29Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
