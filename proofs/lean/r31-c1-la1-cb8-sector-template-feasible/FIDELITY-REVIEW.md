# Formalization Fidelity Review

- Run: `lean-2026-09-28-c1-la1-cb8-sector-template-feasible`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `02204cffc38b7e6ab24db76edca2623abd302e1bfe1f665f8a96ce92462705a3`
- Contract projection SHA-256: `2c24b80abdc29fc88757c6bda4736dd6c1f8db4296cab9e0f7d1242d0fff821f`
- Lean binding projection SHA-256: `b9391b1806ae24b03e5f696632dee34cc7abd0c2be2370a4253b3a4da2ecfc12`
- Contract source SHA-256: `e40762f18178c77a46995f447979379b5fb37d858742cda635f7ff48cfdcf3d0`
- Lean source SHA-256: `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e`
- Kernel receipt SHA-256: `d77284a70c98afb49f43dc622cd910d6bb01710e3924a345a2f37ec241ff5397`

## Check Counts

- Passed checks: 32
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `binders_hypotheses_conclusion` `independent_review` (independent_reviewer, `eb350146ae1b2fee`): Terminal binders are exactly (m : ℕ) (hm : 107 ≤ m) (hm3 : m % 3 = 2) — the class only, no extra hypothesis. Conclusion is the conjunction (i)∧(ii)∧(iii)∧(iv)∧(v) in the synthesis's order, no conjunct dropped: (i) ∀ s : State8; (ii)/(iii) ∀ c : Fin m → State8 (EVERY assignment) with ℕ leg totals exactly K = (16m+1)/3 = p*−1 and K−1 = p*−2; (iv) ∀ γ, 1≤γ≤7; (v) θ ≤ 1 − r1 K / r1 (K−1) = 1 − ρ_1 per S2. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `default_cells` `independent_review` (independent_reviewer, `6af96473b7813401`): Cells outside the 72-cell table receive intercept 0 (and c_γ = 0 off γ=1..7). Verified such cells never enter Out or In with nonzero weight (Out multiplies pb by β and pc by γ; In reads only pb(β+1,γ) and pc(β,γ+1) with β+γ≤7, which are always table cells). Conclusion (i) at those cells concerns the conventional value and is trivially true; (i) still covers every one of the 72 table cells. Not a weakening, not a widening. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definition_of_record` `independent_review` (independent_reviewer, `88005189d136577b`): B_pb (36 cells), B_pc (36 cells) and c_gamma (7 values) in cb8Bpb/cb8Bpc/cb8CGamma are value-identical to the T adjudicator's adj_alloc_out.json (7d635805…4b13, digest confirmed against sources/c1-stage7-sources/SOURCE-DIGESTS.json); cell sets are exactly {β≥1, β+γ≤8} and {γ≥1, β+γ≤8}; the explicit 0 cells B_pb(1,6) and B_pc(6,1) are table values. Repair 'table of record, not T1's generator output' is present. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definition_of_record` `independent_review` (independent_reviewer, `b8846c01960cea76`): cb8Pb/cb8Pc = (25m/2 + B)/(L/3), cb8Theta = 288/L, cb8Sigma = c_γ·θ, cb8Out = β·pb + γ·pc + [β=1 ∧ 1≤γ]·σ(γ), cb8In = (8−β−γ)(pb(β+1,γ)+pc(β,γ+1)) for β+γ≤7 else 0, cb8R1 = Σ_{i≤min(7,k)} C(7,i)C(8m−7,k−i)2^{k−i}, State8 = {s : ℕ×ℕ // s.1+s.2 ≤ 8}: each is exactly the synthesis C1-LA1 'Exact statement' and agrees with SEMANTIC-CONTRACT §2's choke-local certificate (Out = source outflow, In = in-sector deletion inflow, Switch (8−γ)σ ≤ θγ, Residual θ ≤ 1−ρ_1). Independent check: cb8R1 reproduces r30's exact recorded ρ_1 = 1354839571516225/1361543988640524 at CB(8,95) and θ(107) = 96/766193 with (1−ρ_1)/θ = 34.90 at CB(8,107) (SEMANTIC-CONTRACT data) — a definition-identity check only, no claim off the class. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `extra_declarations` `independent_review` (independent_reviewer, `e04d8ac998834962`): Beyond the synthesis's NEW list, the source adds data carriers cb8Bpb, cb8Bpc, cb8CGamma (the table and c vector the named definitions require) and proof-only helpers cb8OutConst, cb8InConst plus 19 lemmas; none occurs in the terminal statement except through the named definitions, and the contract asserts no grade for them. The two named intermediate lemmas cb8_sectorTemplate_nonneg_out_in_switch ((i)–(iv)) and cb8_sectorTemplate_residual ((v)) are present with statements matching the terminal's conjuncts. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fences` `independent_review` (independent_reviewer, `c083555c3cf7eed4`): No graph, network, flow, (HALL), eligibility, leafSet, cbGraph or optimality object occurs in Main.lean; θ = 288/L is a definition, never a hypothesis (no θ* optimality assumed); no carried fragment and no cross-award import (synthesis: 'Carried fragments. None'). The contract scope text, EVIDENCE/THEOREM-CONTRACT.md and INFORMAL-PROOF.md carry the fences, the excluded conclusions ((H), (HALL), eligibility, other m/residues/ranks/d, uniqueness/optimality), the synthesis's full attribution list plus the formalizer, and assert no grade for any companion. That Out/In/Switch/Residual transfer to the literal network is S3 (informal) and is correctly outside this award. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `input_projection` `independent_review` (independent_reviewer, `0ac43cea263dbda7`): Every canonical field of EVIDENCE/fidelity-audit-input.json (1949283f…be0d) was compared by script against THEOREM-CONTRACT.yaml (e40762f1…cfd3d0): 13 definitions, 5 domains/quantifiers, 2 hypotheses, conclusion, lean_statement, axioms, contract/source/kernel hashes; zero discrepancies. expected_statement occurs verbatim exactly once in Main.lean followed by ' :=' and its SHA-256 is f9b5bcf5…17d5. Every definition's 'Lean text of record' occurs verbatim in Main.lean. Fingerprints recomputed equal the controller's. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `4bbb5b4da648d867`): kernel-verification.json (d77284a7…5397) verdict verified; source_sha256 before=after=f0578ed7…b78e; theorem E993Transport.cb8_topRank_sectorTemplate_feasible depends on exactly [propext, Classical.choice, Quot.sound]; axioms-all-declarations lists all 33 declarations with only these axioms (State8 none). Main.lean contains no sorry/admit/native_decide/decide/axiom/set_option/attribute/macro surface; only import is Mathlib; exactly one theorem. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `nat_arithmetic` `independent_review` (independent_reviewer, `ce40b1d4a953c8cd`): K = (16m+1)/3 is exact on the class (16m+1 ≡ 0 mod 3); K−1 is ℕ subtraction with K ≥ 571; 8m−7 has m ≥ 107; k−i has i ≤ min 7 k; 8−β−γ and 8−γ are ℚ subtraction; the ℚ division in (v) has denominator r1 m (K−1) > 0 (term C(8m−7, K−1)·2^{K−1} > 0), so the x/0 = 0 convention can never degrade (v). pb/pc take the pair s.1 : ℕ×ℕ (so In can read (β+1,γ)); (i) ranges over every State8 via s.1 — faithful to 'on every state'. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `non_vacuity` `independent_review` (independent_reviewer, `78eb5992501d55d7`): m = 107 satisfies both hypotheses; the assignment 71×(8,0), 1×(3,0), 35×(0,0) meets the (ii) total K = 571 and 71×(8,0), 1×(2,0), 35×(0,0) the (iii) total 570. Independent exact-rational DP from the Lean definitions at m = 107 and m = 110: min ΣOut over all assignments with total K equals 1 and max ΣIn with total K−1 equals 1 (both tight, matching adj_alloc_out.json dp), and (i), (iv), (v) hold. The theorem is non-vacuous and not trivially true. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `repairs_and_conditions` `independent_review` (independent_reviewer, `6e5ffaed3006ee4d`): Synthesis repair 'every out-of-class literal is struck': no out-of-class m, residue, rank or d literal occurs in Main.lean, the contract or INFORMAL-PROOF.md (only table literals and the shift m = 3p+107). Formalizer brief §3: R1 vacuous (no carry); R2 case splits only over the 45 states and 7 switch values, summation universal via Finset.sum_le_sum, Residual universal in p; R3 contract valid, canonical run id present; R4 axioms.txt and per-declaration list present; R5 informal proof with ℕ-subtraction/cast audit; R7 one terminal theorem. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c1-la1-opus-fidelity-20260928` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c1-la1-opus-fidelity-attestation-20260928-b9d5b2c6-c38f-4fce-9e08-28e5f6b02159`
- Completed: `2026-09-28T04:32:15Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
