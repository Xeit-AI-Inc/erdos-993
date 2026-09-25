# Formalization Fidelity Review

- Run: `lean-2026-09-25-c1-la5-btp-second-proof-on-class`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `ca83488496cab26149f4edd8af7087f146f982dd3ac568637090f0816d9736b2`
- Contract projection SHA-256: `5cd9b14af67807d38016043f1e5decc41359c20ce5e4f9616aac981417911ebc`
- Lean binding projection SHA-256: `26bddb7e75983fef9916ab0da52fbfe12721b4076712ef5afae20342bc597b90`
- Contract source SHA-256: `5d556ebb8a8bfad8f9c8b84e5a68db257f574f4b738c14f34a4170307ac550f2`
- Lean source SHA-256: `91f529100aa4e3bc4687d03705dc46e8a43323f0cefeaf707d48c7f606374ee7`
- Kernel receipt SHA-256: `7e1f80184e6b5df4ba191dd5c27c532989ffcf8c153b67e2db3e72a44a31cc3f`

## Check Counts

- Passed checks: 25
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `btp_face` `independent_review` (independent_reviewer, `29e39d3aad360f1c`): leaf_slot_dominance_on_pathlike_branch_trees is a lemma with hypotheses hT, hB and k. Its conclusion is (exists injective f : (Sigma v : {v // 3 <= deg v}, Fin (deg v.1 - 2)) -> X with deg (f s) = 1 and occ G s.1.1 k <= occ G (f s) k) and (forall t : Nat, slotsAtLeast G k t <= leavesAtLeast G k t), covering every t including t = 0. This is the synthesis's 'SDR of C1-LA3's Slot G exists, and hence forall t'. The face is inside the terminal's dependency closure (its .2 is fed to dominance_implies_degree_lemma). Route: direct own-leaves injection plus a counting argument (threshold_of_sdr), with no Hall. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `build_warning` `independent_review` (independent_reviewer, `881a9724db16630d`): The build's only warning, an unused variable hT at Main.lean:545, is in the carried entry 20 dominance_implies_degree_lemma. It is recorded there as R28-E-a (hT present but unused) and is not in the terminal theorem. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `carried_declarations` `independent_review` (independent_reviewer, `31305a6a7d165ff9`): Entries 8-12 byte-identical to C1-LA4 entries 7-11; entry 13 pendant_path_leaf_dominance identical to C1-LA4 entry 12 after the single head keyword theorem -> lemma; entries 14-19 byte-identical to C1-LA2 entries 7-12; entry 20 dominance_implies_degree_lemma identical to C1-LA2 entry 33 after the single keyword theorem -> lemma (statement = SOLUTION-CONTRACT sec. 2 verbatim). Both sibling runs read formally_verified. No body from sources/c1-stage7-sources/ is transported; all 7 carry-file digests match SOURCE-DIGESTS.json. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `class_predicate` `independent_review` (independent_reviewer, `cbf7c499096f0d53`): BranchTreeMaxDegreeLeTwo (entry 6, on the face): for every v with 3 <= G.degree v, #{w | G.Adj v w and exists z, 3 <= G.degree z and a G-walk w ~> z whose support avoids v} <= 2. Degrees are degrees in G, z = w is allowed (nil walk), z = v is excluded automatically. Entry 22 branchTreeMaxDegreeLeTwo_iff_induce (kernel-checked with the file) proves it equivalent to the synthesis wording with (G.induce {v}c).Reachable <w,_> <z,_> and z != v; its extra existential w != v is implied by G.Adj v w, so the equivalence is exactly the synthesis predicate. classical decidability of the filter does not affect the card. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions_of_record` `independent_review` (independent_reviewer, `ba3d61a0cd0ddd22`): Byte-identical at declaration level: entry 1 indepCount = r25 award entry 1 (736eb9df...); entry 7 indepCount_eq_card_indepSetFinset = r25 entry 4; entry 2 indepDegreeSum = r27 C1-LA1 entry 7 (b49ea82a...). Entries 3-5 occ/slotsAtLeast/leavesAtLeast byte-identical to the closed C1-LA4 (f979e1d7...) and C1-LA2 (64545ccd...) entries, textually equal to SOLUTION-CONTRACT.md sec. 2 and matching SEMANTIC-CONTRACT.md sec. 1 (c_v(k), slots_{>=t}, leaves_{>=t}); their declaration text occurs in U1-Main.lean (74ab2108..., SOURCE-DIGESTS verified). The brief's mention of e/extensionCount/firstDescent does not apply: none occurs in this run. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `04b97a159a1fbf48`): Neither slot_leaf_sdr_exists nor tree_leaf_slot_dominance (nor R28U2, Hall/biUnion or sdr_iff_threshold machinery) occurs in Main.lean. r27 forest_degree_lemma is neither imported nor carried; it appears only in a docstring fence. On the contract face (informal_statement and conclusion) the fences read: NOT (HS) on all trees, with T22 outside the class and the class sharp for D >= 3; NOT (DL) on all forests; the result is a scope note on E993-R27-FOREST-DEGREE-LEMMA, never a (DL) key, and the r27 face is not edited; not (PW); no status transfer. The same fences appear in the docstrings of entries 30-31 and in INFORMAL-PROOF sec. 5. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `2d09c094672e6d9a`): RECEIPTS/kernel-verification.json (7e1f8018...) verdict verified; source_sha256_before = after = 91f52910... (the bound Main.lean); every check passed; terminal axioms [propext, Classical.choice, Quot.sound]; per-declaration list (31 declarations) within the same set; Main.lean contains no sorry/admit/native_decide/axiom/decide tokens and nothing outside the 31 registrar entries except 'import Mathlib' and the generator header. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `deae2fc2d85cd0cd`): The hypotheses are jointly satisfiable. K_{1,3} is an IsTree in the class (0 internal directions). The order-9 caterpillar 0-1-2 with leaves {3,4} at 0, {5,8} at 1 and {6,7} at 2 is in the class with vertex 1 tight at 2 internal directions. A standalone enumeration confirmed (DL) and the threshold form for all k and t on both. T22 is outside the class: vertex 0 has three branch neighbours 1, 8 and 15, which is consistent with the fence. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_integrity` `independent_review` (independent_reviewer, `a4b01d5294d22424`): Input projections checked field-by-field against THEOREM-CONTRACT.yaml (5d556ebb...): 10 definitions, 3 domains, 3 quantifiers, 2 hypotheses, conclusion, lean_statement, permitted axioms, declaration name and contract id all verbatim; binding projection equals contract projection. expected_statement (sha 1a75cd03...) occurs exactly once verbatim in Main.lean followed by ' :='. Recomputed fingerprints equal the controller's: contract 5cd9b14a..., binding 26bddb7e...; input sha 771e4bc2... before attestation. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `repairs_and_conditions` `independent_review` (independent_reviewer, `04d663c679f309c4`): Formalizer brief sec. 3: R1 (single Mathlib-only source; r25 entries 1/4 and r27 entry 7 byte-identical) present. R2/R7: carry discipline and carry set present, with the two theorem -> lemma normalisations disclosed and nothing else changed. R3: the contract has exact lean_names, Lean text for occ/slotsAtLeast/leavesAtLeast, verbatim hypotheses, exactly three permitted axioms, the exact expected_statement, and no forbidden grade. R4: axioms clean. The bound axioms.txt (25d7acff...) is the verifier's probe output, and the overwrite of the pre-written file is disclosed. R5: INFORMAL-PROOF covers hypothesis entry points, the cast audit, fences, attribution and the carry table. Contract attribution matches the synthesis and brief. Hall's classical attribution is absent, which is appropriate since Hall is not used. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `reviewer_disclosure` `independent_review` (independent_reviewer, `61489300d147fa4f`): The reviewer's runtime reports model Opus 5.5 (1M context), id claude-opus-5-5[1m]. The brief charters Claude Opus 5 at high effort, and the assigned reviewer id carries a 'fable' token; that token is a label, not the runtime model. The seat cannot self-inspect its effort. No child agent was used, and the reviewer is distinct from producer c1-la5-formalizer-opus-20260925. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `terminal_statement` `independent_review` (independent_reviewer, `890f43578374bdb7`): forest_degree_lemma_on_pathlike_branch_trees is a theorem with binders {X : Type u} [Fintype X] [DecidableEq X] (G) [DecidableRel G.Adj] (hT : G.IsTree) (hB : BranchTreeMaxDegreeLeTwo G) (k : Nat), and its conclusion (Erdos993G1.indepDegreeSum G k : Int) <= 2 * k * Erdos993G1.indepCount G k is exactly the synthesis C1-LA5 composition and the sec. 2 (DL) inequality (same shape as r27 forest_degree_lemma). There is no extra hypothesis (no n >= 2, k >= 1, t >= 1) and no dropped conjunct. hT is consumed (hT.isAcyclic in exists_own_leaves via btp_sdr_exists). The Lean statement is the r27 (DL) specialised to this class, which matches its scope-note status. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la5-fable-fidelity-20260925` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la5-fable-fidelity-attestation-20260925-4fb51771-3311-4c54-bfbe-f8683bab3ea0`
- Completed: `2026-09-25T03:13:24Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
