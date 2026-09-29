# Formalization Fidelity Review

- Run: `lean-2026-09-28-c2-la3-cb8-favorable-leaves-eq-leaf-set`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `42a751a3cabd837967ce2f33a55c4006ad268491fad5bccaf2cd7099feac7c0e`
- Contract projection SHA-256: `2ca60cfea9e33cac53acc46c112b2aa81a8566adf0c06d8c8d674f92d5963b90`
- Lean binding projection SHA-256: `b4cc01335182742a9aa739c3d27b3ca82621a3fbc76a68115c1182847fd8c02c`
- Contract source SHA-256: `f19bebf2b4689bd567a36db6df71fcf9edf485fe474f01eef7a2c41ae7a960da`
- Lean source SHA-256: `7dab4388cdcf2a922312eb04c2ae27d21c418c271a38fe02c9540910fb582b8a`
- Kernel receipt SHA-256: `29a2f834cd034134eec335f03f11429b094b0c58cae9a87e8bc4414dcb4aff0e`

## Check Counts

- Passed checks: 29
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `binding` `independent_review` (independent_reviewer, `84930ff93475328c`): Statement of record: the Lean terminal E993Transport.cb8_favorableLeaves_eq_leafSet_topRank (namespace-relative inside namespace E993Transport, Main.lean 7dab4388...) has exactly the binders (m : ℕ), hypotheses hm : 107 ≤ m and hmod : m % 3 = 2, and conclusion favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m) of the frozen synthesis block (cycles/cycle-2/stage6/SYNTHESIS.md ### C2-LA3, 260c8195...). Only plumbing differs (fully qualified name written namespace-relative; Markdown indent removed). No extra hypothesis, no dropped conjunct, no weakening; the expected_statement occurs exactly once in the source followed by ' :='. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `carries` `independent_review` (independent_reviewer, `f37133fcacc0aca7`): Entries 1-77 of Main.lean compared byte-for-byte (entry body between markers) with the frozen origin Main.lean files: 30 match C1-LA2 (a906ec17...5f3f), 28 match C2-LA2 (e75c66b2...faae; entries 1-27 byte-identical), 19 match C2-LA1 (986b5257...0c9d; entries 36, 37, 521-530, 532-538); 76 byte-identical plus entry 60, the C2-LA2 terminal with the single keyword edit theorem -> lemma (ruling R31-N-15). Reverse substitution lemma -> theorem reproduces the origin entry 28 bytes, SHA-256 93acf3cc...8fc9, equal to the origin marker digest. Each origin Main.lean equals its kernel receipt's source_sha256_before/after with verdict verified; both sources/c1-results and sources/c2-results SOURCE-DIGESTS.json manifests re-verified (462 and 1289 files, 0 mismatches). The carried C1-LA2 subset (30 of entries 1-78, the DAG's dependency closure) is the controller's ruling R31-N-16; load-bearing digests 2 c2da50eb, 60 d94a4323, 72 faa4b7f4, 74 dd382623, cbGraph 206cd488 match the synthesis. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions` `independent_review` (independent_reviewer, `2c11843fbe88120b`): Objects of record: entry 2 C4LA1.vertexDeletionForwardDifference = (i_(p+1)(G-v) : ℤ) - i_p(G-v) (the forward difference of record Δ_p = i_(p+1) - i_p); entry 3 IsFavorableAt is STRICT < 0; entry 8 favorableLeaves = (leafSet G).filter (IsFavorableAt G · p); entry 9 cbEdge is the frozen labelling r=0, s=1, v=2, u_i=3+17i, b_ij=u_i+1+2j, c_ij=u_i+2+2j with edges r-s, s-v, r-u_i, u_i-b_ij, b_ij-c_ij on Fin (17m+3); entry 10 cbGraph = SimpleGraph.fromRel (cbEdge m). These agree with SEMANTIC-CONTRACT.md §1-§2 and SOLUTION-CONTRACT §2's selector. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `408ae2ef60f1d930`): Fences and exclusions of the synthesis (as C2-LA2, adapted to the graph level) and of the formalizer brief §2 are on the contract's scope text, the terminal docstring and INFORMAL-PROOF.md: one rank p*; d = 8; the class m ≥ 107, m ≡ 2 (mod 3); the literal cbGraph m; not claimed (H), conjunct 4, (HALL) at any scope, any aggregate, TREE/FOREST/TRANSFER, Erdős #993; no grade for any companion. No fenced object ((H), conjunct 4, IsSaturatingFlow/(HALL), aggregate) occurs in any declaration. Attribution equals the synthesis list plus C-U3-T and U3, C2-LA1/C2-LA2 and the formalizer, as the brief requires. Brief §3 conditions R1-R7 are met (single-source Mathlib-only file; no forbidden tokens; contract with canonical run id; axioms.txt written before verification (05:05 vs receipt 05:10) and per-declaration list; informal proof with ℕ-subtraction and cast audit; exactly one theorem). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel` `independent_review` (independent_reviewer, `b0df4fe87943cc7e`): RECEIPTS/kernel-verification.json (29a2f834...) verdict verified; source_sha256_before = after = 7dab4388...; theorem_name matches; reported axioms [propext, Classical.choice, Quot.sound]. Independent comment/string-stripped scan: 0 sorry, admit, native_decide, decide, axiom, unsafe, implemented_by, extern, opaque, #eval; exactly one theorem keyword; import Mathlib only; 8 scoped 'set_option maxHeartbeats 4000000 in'. The formalizer's forbidden-token-scan.json lists the set_option line once (deduplicated); the count is 8, as INFORMAL-PROOF.md and FORMALIZER-REPORT.md state. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `new-declarations` `independent_review` (independent_reviewer, `91fad922776324fb`): Entries 78-80 (critU3T_cb_gadgets, critU3T_cb_minus_v_closedForm, critU3T_cb_vertexDeletion_v_eq_coeff) equal C-U3-T's frozen DRAFT CriticU3T2.lean (74a1c05c..., sources/c2-stage7-sources/crit-U3-T) lines 288-313, 315-368, 370-376 up to the declared theorem -> lemma edit and the attribution wrapper. Entries 81-87 prove N1 per (i, j) directly with no automorphism: cb8_damagedGadget gives G_c = (1+2X)^7(1+X) + X(1+X)^7 (synthesis correction 5 honoured; G' does not occur); cb8_privateLeaf_indepPoly_closedForm gives I(CB - c_ij) = (1+2X) G_c G^(m-1) + X(1+X)^2(1+2X)^(8m-1) with the contract's G = (1+2X)^8 + X(1+X)^8; cb8_vertexDeletion_privateLeaf_eq_coeff binds the carried count C4LA1.vertexDeletionIndepSetCount (cbGraph m) c_ij k to its coefficient over ℕ. I re-derived both closed forms by hand from the vertex split at r; they agree. Entries 88-89 transport C2-LA2's two ℤ[X] inequalities through Polynomial.map (Nat.castRingHom ℤ) and coeff_map to the ℕ -> ℤ cast in entry 2 (indices (16m+4)/3 + 1 and (16m+4)/3 are identical terms); entry 90 composes entries 74 and 72 (0 < m from hm). Every lemma the DAG needs is proved in the file; nothing is assumed. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non-vacuity` `independent_review` (independent_reviewer, `5570f2014f7ac47f`): Instance satisfying every hypothesis: m = 107 (107 ≤ 107, 107 % 3 = 2, p* = 572); also m = 110 (p* = 588). The conclusion is non-trivial: leafSet (cbGraph m) has 8m + 1 elements, and the equation says each is strictly favorable. A sanity-only exact computation of the closed forms at m = 107 and 110 shows both strict descents at p* (never evidence for the Lean). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection` `independent_review` (independent_reviewer, `1247d7e3c37c5c0b`): Recomputed fingerprints contract_projection_sha256 2ca60cfe...3b90 and binding_projection_sha256 b4cc0133...c02c equal the controller's. Checked the input against THEOREM-CONTRACT.yaml (f19bebf2...) and Main.lean directly: 18 definitions, 2 hypotheses, conclusion, lean_statement and permitted axioms are verbatim projections; nothing paraphrased or omitted. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `scope` `independent_review` (independent_reviewer, `7cdb15f6c1bdc28d`): The reviewer brief's generic items on Out/In quantification over every assignment and on C1-LA3's Newton/Darroch facts do not apply to this award's terminal (no Out/In object occurs); the file uses no Darroch/Newton fact, since the kernel reports only propext, Classical.choice and Quot.sound, and the only descent input is the carried C2-LA2 (G)-block route. The hypothesis hm is used only for 0 < m and passed to the carried C2-LA2 lemma, where it is unused (a linter warning in the axiom probe, as C2-LA2 records under its fence 1). This is fidelity-neutral: the statement keeps the class fence of record. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c2-la3-opus-fidelity-20260928` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c2-la3-opus-fidelity-attestation-20260928-8a80e0d4-9adc-432c-b326-703d07483fce`
- Completed: `2026-09-28T09:18:18Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
