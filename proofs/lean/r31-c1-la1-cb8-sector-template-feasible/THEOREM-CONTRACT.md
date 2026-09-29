# Theorem Contract: C1-LA1 (r31): (L-S)_top template arithmetic, E993Transport.cb8_topRank_sectorTemplate_feasible (key on closure: named by the synthesis ## Registrations, R-1, registered by the controller after the award closes and SR-1 passes)

- Contract ID: `e993-r31-c1-la1-cb8-toprank-sector-template-feasible-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `e40762f18178c77a46995f447979379b5fb37d858742cda635f7ff48cfdcf3d0`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Run erdos-993-math-dre-20260927-r31-cb-uniform-switch (r31), Cycle 1 Stage 7, award group C1-LA1; Lean run root runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible; producer c1-la1-formalizer-opus-20260928 (chartered Claude Opus 5.5, high; runtime-reported model id claude-opus-5-5). For every natural m with 107 <= m and m % 3 = 2, put K := (16m+1)/3 (exact on the class), L := 200m^2+82m+5, D := L/3 over Q, State8 := {(b,g) : N x N // b+g <= 8}; pb m (b,g) := (25m/2 + B_pb(b,g))/D, pc m (b,g) := (25m/2 + B_pc(b,g))/D with the 72 intercepts of the table of record (adj_alloc_out.json, 7d635805...4b13) entered literally (0 on cells outside the table, which never enter Out/In with nonzero weight), theta m := 288/L, sigma m g := c_g theta m with c = (1/7,1/3,3/5,1,5/3,3,7/2); Out m (b,g) := b pb + g pc + [b = 1 and 1 <= g] sigma(g); In m (b,g) := (8-b-g)(pb(b+1,g) + pc(b,g+1)) for b+g <= 7 and 0 at b+g = 8; r1 m k := sum_{i=0}^{min(7,k)} C(7,i) C(8m-7,k-i) 2^(k-i). Then (i) 0 <= pb, 0 <= pc, 0 <= sigma on every state; (ii) for every c : Fin m -> State8 with sum_i (b_i+g_i) = K, 1 <= sum_i Out m (c i); (iii) for every c with sum_i (b_i+g_i) = K-1, sum_i In m (c i) <= 1; (iv) (8-g) sigma m g <= theta m g for g = 1..7; (v) theta m <= 1 - r1 m K / r1 m (K-1) (= 1 - rho_1, K = p*-1). Hypotheses: the class only. Fences: template level only - NOT a flow on the literal network, NO (HALL) claim (the network bridge S3 is informal and not formalized here), NO eligibility; one rank p*, the class only (m >= 107, m % 3 = 2); no optimality; the theta* law is never a hypothesis. Excluded conclusions: (H), (HALL), eligibility, any statement at other m, residues, ranks or d, and uniqueness or optimality of the allocation. Grades: this contract asserts no grade for any companion lemma or helper definition (cb8OutConst, cb8InConst and every lemma other than the terminal); on the award's governed close only the terminal statement is the certified object. Attribution (the synthesis section's list, verbatim in substance): allocation: r31 T1 (seat of origin), independently C-F2-U and C-F1-T; Residual: C-T1-F and C-T1-U, with C-F1-T, C-F2-T and C-F2-U; table shipped by C-T1-U and the T adjudicator; template method and certificate: r30, the Cycle 6 certificate method of record and its named seats as registered; mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run; Lean: the Stage 7 seat, formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.cb8_topRank_sectorTemplate_feasible`
- Statement SHA-256: `f9b5bcf5596caa39995ea99d5880e937be3afecf28f6dd190eaf37ce854e17d5`

```lean
theorem cb8_topRank_sectorTemplate_feasible (m : ℕ) (hm : 107 ≤ m) (hm3 : m % 3 = 2) :
    (∀ s : State8, 0 ≤ cb8Pb m s.1 ∧ 0 ≤ cb8Pc m s.1 ∧ 0 ≤ cb8Sigma m s.1.2) ∧
    (∀ c : Fin m → State8, ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 →
        1 ≤ ∑ i, cb8Out m (c i)) ∧
    (∀ c : Fin m → State8, ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 - 1 →
        ∑ i, cb8In m (c i) ≤ 1) ∧
    (∀ γ : ℕ, 1 ≤ γ → γ ≤ 7 → (8 - (γ : ℚ)) * cb8Sigma m γ ≤ cb8Theta m * γ) ∧
    cb8Theta m ≤ 1 - (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ)
```

## Quantifiers

- `forall m` over `dom-m`
- `forall s (conclusion i)` over `dom-state`
- `forall c (conclusion ii)` over `dom-assignment`
- `forall c (conclusion iii)` over `dom-assignment`
- `forall γ (conclusion iv)` over `dom-gamma`

## Hypotheses

- `hyp-m-ge-107`: (hm : 107 ≤ m) (verbatim binder).
- `hyp-m-mod-3`: (hm3 : m % 3 = 2) (verbatim binder). Makes (16*m+1)/3 exact: 3·((16m+1)/3) = 16m+1.

## Conclusion

- `conclusion`: (∀ s : State8, 0 ≤ cb8Pb m s.1 ∧ 0 ≤ cb8Pc m s.1 ∧ 0 ≤ cb8Sigma m s.1.2) ∧ (∀ c : Fin m → State8, ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 → 1 ≤ ∑ i, cb8Out m (c i)) ∧ (∀ c : Fin m → State8, ∑ i, ((c i).1.1 + (c i).1.2) = (16 * m + 1) / 3 - 1 → ∑ i, cb8In m (c i) ≤ 1) ∧ (∀ γ : ℕ, 1 ≤ γ → γ ≤ 7 → (8 - (γ : ℚ)) * cb8Sigma m γ ≤ cb8Theta m * γ) ∧ cb8Theta m ≤ 1 - (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ). In words: conclusions (i)-(v) of the synthesis section at template level; (v) is θ ≤ 1 − ρ_1.

## Dependencies

- `def-bpb` -> `def-pb`
- `def-bpc` -> `def-pc`
- `def-cgamma` -> `def-sigma`
- `def-theta` -> `def-sigma`
- `def-state8` -> `def-out`
- `def-pb` -> `def-out`
- `def-pc` -> `def-out`
- `def-sigma` -> `def-out`
- `def-state8` -> `def-in`
- `def-pb` -> `def-in`
- `def-pc` -> `def-in`
- `def-bpb` -> `def-outconst`
- `def-bpc` -> `def-outconst`
- `def-cgamma` -> `def-outconst`
- `def-bpb` -> `def-inconst`
- `def-bpc` -> `def-inconst`
- `def-state8` -> `dom-state`
- `dom-m` -> `dom-assignment`
- `def-state8` -> `dom-assignment`
- `dom-m` -> `hyp-m-ge-107`
- `dom-m` -> `hyp-m-mod-3`
- `hyp-m-ge-107` -> `conclusion`
- `hyp-m-mod-3` -> `conclusion`
- `dom-state` -> `conclusion`
- `dom-assignment` -> `conclusion`
- `dom-gamma` -> `conclusion`
- `def-pb` -> `conclusion`
- `def-pc` -> `conclusion`
- `def-sigma` -> `conclusion`
- `def-theta` -> `conclusion`
- `def-out` -> `conclusion`
- `def-in` -> `conclusion`
- `def-r1` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-adj-alloc-instrument`: `SOURCE/ADJ-T-adj_alloc.py` (match)
- `src-c1-synthesis`: `SOURCE/C1-STAGE6-SYNTHESIS.md` (match)
- `src-capsule-manifest`: `SOURCE/C1-LA1-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-ct1f-residual-instrument`: `SOURCE/C-T1-F-crit_t1f_residual.py` (match)
- `src-ct1f-residual-output`: `SOURCE/C-T1-F-crit_t1f_residual_out.json` (match)
- `src-ct1u-table`: `SOURCE/C-T1-U-crit_alloc_out.json` (match)
- `src-formalizer-brief`: `SOURCE/C1-STAGE7-FORMALIZER-BRIEF-LA1.md` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-residual-generated`: `DRAFTS/residual.lean.txt` (match)
- `src-residual-generator`: `DRAFTS/gen_residual.py` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-stage7-protocol`: `SOURCE/C1-STAGE7-PROTOCOL.md` (match)
- `src-stage7-source-digests`: `SOURCE/c1-stage7-sources-SOURCE-DIGESTS.json` (match)
- `src-table-generated`: `DRAFTS/table.lean.txt` (match)
- `src-table-generator`: `DRAFTS/gen_table.py` (match)
- `src-table-of-record`: `SOURCE/ADJ-T-adj_alloc_out.json` (match)

## Validation Notes

- Errors: none
- Warnings: none
