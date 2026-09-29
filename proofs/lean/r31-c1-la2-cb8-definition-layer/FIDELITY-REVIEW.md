# Formalization Fidelity Review

- Run: `lean-2026-09-28-c1-la2-cb8-definition-layer`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `4d580ee28a825f0e186abb93a5b0f41a83ae9074e495080edec4594aa972c526`
- Contract projection SHA-256: `d0f52bfdebc197c13367019c3df465bf36f67cebe5a1261f4e16664ce1c7ba23`
- Lean binding projection SHA-256: `11a907609447a247e4a54222b53c47329eeebb799ba98a2cc913e4f27c9aa756`
- Contract source SHA-256: `2ccf0c3b6dede75d6b36321e472cb0723f3d972d04b8480879e96645318408cf`
- Lean source SHA-256: `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f`
- Kernel receipt SHA-256: `dde486d347ccb497fa345d8e80b5126a3989f844428d55f9653270b8d427e6f6`

## Check Counts

- Passed checks: 47
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `carried_definitions` `independent_review` (independent_reviewer, `eda680b02d11afe3`): All 24 carried entries (Main.lean ENTRY 1-21, 22, 31, 32) are byte-identical to r30 C6-LA2 Snippets 0001-0021, 0035, 0123, 0124 (sources/r30/lean/lean-2026-09-28-c6-la2-spider-tree-weighted-hall-rank-k-plus-3), whose fragments are bound by that award's FORMALIZATION-STATE.json source_sha256 and whose Main.lean df5e2870... matches its verified kernel receipt; digests match the synthesis citations (0001 7e0a588e, 0014 73df20a8, 0015 113d9521, 0018 16b0c767, 0019 b1b9ac6c, 0020 a9d81c26, 0021 63534ffb, 0035 378868ab2e660af8, 0123 16687f86fa9b55f6, 0124 772a13c0522f1c4b) and appear in sources/SOURCE-DIGESTS.json. Entries 1-21 are also byte-identical to r30 C1-LA1's; r30 C1-LA2 0014-0021 differ from the carried bytes, confirming the pre-freeze bytes were not used. crossingIndex equals first-interior entry 0014 (378868ab...). Each Main.lean entry body equals its Snippets fragment and its marker hash; nothing lies outside the entry blocks except the generated header. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `component_statements` `independent_review` (independent_reviewer, `fa1298d37d3ee65a`): Every companion statement in the synthesis set is present with the stated signature: cbGraph_isTree (m) unconditional; cbGraph_indepNum_eq (m) (hm : 0 < m) : indepNum = 9*m+1; mem_leafSet_cbGraph_iff (m) (hm : 0 < m) (tau) : leafSet = {v} u {c_ij}; cb_leafSet_card (m) (hm : 0 < m) : card = 8*m+1; mem_cb_tagWitnesses_v_iff (m) (w) : W_v = {r} (label 0); mem_cb_tagWitnesses_leaf_iff (m i j) (hi) (hj) (w) : W_{c_ij} = {u_i}; cb_lowWindow (m) (hm : 0 < m) : 3*((16m+4)/3) < 2*indepNum+1; favorableLeaves_eq_leafSet_of_all (graph-generic, conditional); mem_neighborFinset_choke_iff (N(u_i) = {r} u {b_ij}); mem_neighborFinset_root_iff (N(r) = {s} u {u_i}); choke_degree (= 9). The 0 < m hypotheses are necessary (at m = 0, r is a leaf and alpha = 2) and do not narrow the r31 class. Mathlib indepNum is sSup {n | exists s, IsNIndepSet n s} and IsTree is connected-and-acyclic, the intended meanings. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `639e0ab380439d18`): Fences honoured: no declaration proves a rank claim other than the low window, (HALL)/WeightedHall, favorability, or descent. In the new layer, crossingIndex, IsSaturatingFlow and favorableLeaves occur only in the terminal's hypotheses and pass-through conclusion; IsFavorableAt occurs only as the hypothesis of the graph-generic favorableLeaves_eq_leafSet_of_all; WeightedHall and aggregate are carried but unused. The contract scope text carries the fences, the excluded conclusions, 'infrastructure, not Tier 2 progress', no grade for any companion, and the synthesis attribution list verbatim plus the formalizer. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `housekeeping` `independent_review` (independent_reviewer, `8113050d515424b5`): Outside the statement: the kernel receipt names an axiom probe file (EVIDENCE/axioms-probe-vp4fct07.lean) that is not retained; its output is preserved in axioms.txt and build.log. EVIDENCE/superseded-fidelity-input-1/ is an empty directory. Neither affects fidelity. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `637d28536cc4ebbe`): RECEIPTS/kernel-verification.json (dde486d3...) verdict verified; binds source a906ec17... before and after; theorem E993Transport.cb8_topRank_of_descent_and_flow; EVIDENCE/axioms.txt reports exactly [propext, Classical.choice, Quot.sound]; axioms-all-declarations.txt lists all 78 entries fully qualified, each within the three standard axioms; Main.lean contains no sorry/admit/native_decide/decide/axiom/set_option/elab/extern token outside comments; exactly one `theorem` keyword (the terminal). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `mandatory_repairs` `independent_review` (independent_reviewer, `60b207d1faa434ac`): Mandated repair present: the unused binder (hm : 0 < m) is dropped from mem_cb_tagWitnesses_v_iff (present in the seed at CriticAdvance.lean line 1102, absent in Main.lean); the only other recorded edit is theorem -> lemma for companions (one terminal theorem). Carry rules honoured (C6-LA2 bytes only; not r30 C1-LA2 0014-0021; not U1's comment-stripped file). Axiom log with fully qualified names shipped (EVIDENCE/axioms-all-declarations.txt). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `new_definitions` `independent_review` (independent_reviewer, `bbf1471918f28215`): cbEdge realizes CB(8,m) under the FROZEN labelling exactly: pairs (0,1)=r-s, (1,2)=s-v, (0,3+17i)=r-u_i, (3+17i,3+17i+1+2j)=u_i-b_ij, (3+17i+1+2j,3+17i+2+2j)=b_ij-c_ij, for i<m, j<8; every label is <17m+3 and blocks of 17 do not overlap, so cbGraph m = SimpleGraph.fromRel (cbEdge m) on Fin (17m+3) has n = 3+m(2d+1) at d=8 and no extra edges (SEMANTIC-CONTRACT section 2; SOLUTION-CONTRACT section 2 draft shape). cbGraph_decAdj is an @[reducible, instance] def as drafted; the Decidable instance cannot change meaning. Helper defs (cbVertex, cbParentVal, cbParent, cbChildEdge, cbLowerWitness) do not occur in the terminal statement. Text agrees with the seed C-U1-T CriticAdvance.lean (c94ef3bd...). Python check (not proof) at m=1..6: tree, 8m+1 leaves incl. v, alpha = 9m+1 by tree DP, deg u_i = 9. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `e1aa223ed36ec849`): Instance: m = 107 satisfies hm and hres (107 mod 3 = 2), with p* = 572. hE and hH are exactly the open conjuncts, so their joint satisfiability rests on records at non-formal grades: x(CB(8,107)) = 570 <= 570 (SEMANTIC-CONTRACT section 5 fixed point; bounded_computation), and (HALL) at CB(8,107)/572 by the registered r30 row key E993-R30-CB-8-M-95-TO-107-... (computer_assisted), giving an integral saturating flow through r30's kernel-checked Hall-to-flow companion. A formal witness would be Tier 1 content itself; this is inherent to a reduction theorem and not a defect. Every companion lemma is non-vacuous at m = 1 (hypotheses 0 < m, i < m, j < 8 satisfiable). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_integrity` `independent_review` (independent_reviewer, `126b26addff93852`): fidelity-audit-input.json checked field by field against THEOREM-CONTRACT.yaml (2ccf0c3b...) and Main.lean: definitions (id, description), hypotheses (id, statement), conclusion, domains, quantifiers, permitted axioms and declaration name are verbatim; lean_statement equals lean_binding.expected_statement (sha256 daf83423...) and occurs exactly once verbatim in Main.lean followed by ` :=`. Recomputed fingerprints equal the controller's (contract d0f52bfd..., binding 11a90760...). The schema's definition object carries only name/canonical, so omission of lean_name is by schema, not a paraphrase. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `scope_reading` `independent_review` (independent_reviewer, `c5736ea589032051`): Reading caution, not a defect: because conjuncts 2 and 4 are passed through from hE and hH, the terminal's own mathematical content is (cbGraph m).IsTree and the low window at m >= 107. The terminal must never be cited as the Tier 1 theorem, (HALL), eligibility, favorability or descent; the contract's scope text, INFORMAL-PROOF.md and the formalizer report all state this explicitly. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `terminal_statement` `independent_review` (independent_reviewer, `5bb9dfb8629ae8be`): Terminal binders and hypotheses are exactly the statement of record: (m : N) (hm : 107 <= m) (hres : m % 3 = 2) from the SOLUTION-CONTRACT section 2 draft, plus hE = conjunct 2 and hH = conjunct 4 verbatim as hypotheses (synthesis C1-LA2; formalizer brief section 2). The conclusion is the section 2 four-conjunct body verbatim, character for character; no conjunct dropped, no extra hypothesis, no weakening. Conjuncts 1 and 3 are discharged by cbGraph_isTree and cb_lowWindow; conjuncts 2 and 4 are returned from hE and hH. hres is unused by the proof (by design, class shape). Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la2-opus-fidelity-20260928` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la2-opus-fidelity-attestation-20260928-70a05fb9-2e9a-40fc-bceb-eb20796aba7c`
- Completed: `2026-09-28T04:28:36Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
