# r31-c1-la1-cb8-sector-template-feasible

Declaration `E993Transport.cb8_topRank_sectorTemplate_feasible`, exported byte-for-byte from the sealed internal run `erdos-993-cb-uniform-switch-dre-2026-09-27` (`runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible`; r31 — see
[`experiments/r31-cb-uniform-switch.md`](../../../experiments/r31-cb-uniform-switch.md)). Award `C1-LA1`; registry effect `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107 (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

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

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> Run erdos-993-math-dre-20260927-r31-cb-uniform-switch (r31), Cycle 1 Stage 7, award group C1-LA1; Lean run root runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible; producer c1-la1-formalizer-opus-20260928 (chartered Claude Opus 5.5, high; runtime-reported model id claude-opus-5-5). For every natural m with 107 <= m and m % 3 = 2, put K := (16m+1)/3 (exact on the class), L := 200m^2+82m+5, D := L/3 over Q, State8 := {(b,g) : N x N // b+g <= 8}; pb m (b,g) := (25m/2 + B_pb(b,g))/D, pc m (b,g) := (25m/2 + B_pc(b,g))/D with the 72 intercepts of the table of record (adj_alloc_out.json, 7d635805...4b13) entered literally (0 on cells outside the table, which never enter Out/In with nonzero weight), theta m := 288/L, sigma m g := c_g theta m with c = (1/7,1/3,3/5,1,5/3,3,7/2); Out m (b,g) := b pb + g pc + [b = 1 and 1 <= g] sigma(g); In m (b,g) := (8-b-g)(pb(b+1,g) + pc(b,g+1)) for b+g <= 7 and 0 at b+g = 8; r1 m k := sum_{i=0}^{min(7,k)} C(7,i) C(8m-7,k-i) 2^(k-i). Then (i) 0 <= pb, 0 <= pc, 0 <= sigma on every state; (ii) for every c : Fin m -> State8 with sum_i (b_i+g_i) = K, 1 <= sum_i Out m (c i); (iii) for every c with sum_i (b_i+g_i) = K-1, sum_i In m (c i) <= 1; (iv) (8-g) sigma m g <= theta m g for g = 1..7; (v) theta m <= 1 - r1 m K / r1 m (K-1) (= 1 - rho_1, K = p*-1). Hypotheses: the class only. Fences: template level only - NOT a flow on the literal network, NO (HALL) claim (the network bridge S3 is informal and not formalized here), NO eligibility; one rank p*, the class only (m >= 107, m % 3 = 2); no optimality; the theta* law is never a hypothesis. Excluded conclusions: (H), (HALL), eligibility, any statement at other m, residues, ranks or d, and uniqueness or optimality of the allocation. Grades: this contract asserts no grade for any companion lemma or helper definition (cb8OutConst, cb8InConst and every lemma other than the terminal); on the award's governed close only the terminal statement is the certified object. Attribution (the synthesis section's list, verbatim in substance): allocation: r31 T1 (seat of origin), independently C-F2-U and C-F1-T; Residual: C-T1-F and C-T1-U, with C-F1-T, C-F2-T and C-F2-U; table shipped by C-T1-U and the T adjudicator; template method and certificate: r30, the Cycle 6 certificate method of record and its named seats as registered; mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run; Lean: the Stage 7 seat, formalizer c1-la1-formalizer-opus-20260928 (Claude Opus 5.5).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
caterpillar-broom trees `CB(8,m)` for `m ≥ 107`, `m ≡ 2 (mod 3)` at the single rank `(16m+4)/3` (or a component of it); nothing about (HALL)
at full scope or at any other rank, residue class or `d`, the lower-region aggregate beyond these rows, `E993-BETA-AGG`, FOREST, TREE, TRANSFER,
or Erdős #993.
