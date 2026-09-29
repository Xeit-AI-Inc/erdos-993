# r31-c1-la2-cb8-definition-layer

Declaration `E993Transport.cb8_topRank_of_descent_and_flow`, exported byte-for-byte from the sealed internal run `erdos-993-cb-uniform-switch-dre-2026-09-27` (`runs/lean-2026-09-28-c1-la2-cb8-definition-layer`; r31 — see
[`experiments/r31-cb-uniform-switch.md`](../../../experiments/r31-cb-uniform-switch.md)). Award `C1-LA2`; registry effect `ledger record R31-C1-LA2 (the CB(8,m) layer and the terminal reduction; no key)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem cb8_topRank_of_descent_and_flow (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)
    (hE : C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3)
    (hH : ∃ f, IsSaturatingFlow (cbGraph m)
      (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f) :
    (cbGraph m).IsTree ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C1-LA2 (r31 Cycle 1; the U adjudicator's AG-U-A); governed run lean-2026-09-28-c1-la2-cb8-definition-layer; key on closure: named by the synthesis ## Registrations (the controller registers it after the award closes and the matching second read passes). OBJECT: the CB(8,m) structural layer over the carried definitions of record: cbGraph m : SimpleGraph (Fin (17*m+3)) = SimpleGraph.fromRel (cbEdge m) with the FROZEN labelling 0 = r, 1 = s, 2 = v, u_i = 3+17i, b_ij = u_i+1+2j, c_ij = u_i+2+2j (i < m, j < 8; edges r-s, s-v, r-u_i, u_i-b_ij, b_ij-c_ij), with the computable instance cbGraph_decAdj. STRUCTURAL FACTS (lemmas on the face, companions with no certificate of their own): cbGraph_isTree (every m); cbGraph_indepNum_eq (0 < m): indepNum = 9m+1; mem_leafSet_cbGraph_iff (0 < m): leafSet = {v} u {c_ij}; cb_leafSet_card (0 < m): card = 8m+1; mem_cb_tagWitnesses_v_iff: W_v = {r} (the unused hm dropped); mem_cb_tagWitnesses_leaf_iff: W_{c_ij} = {u_i}; cb_lowWindow (0 < m): 3*((16m+4)/3) < 2*indepNum+1; favorableLeaves_eq_leafSet_of_all (graph-generic, conditional on its all-favorable hypothesis); mem_neighborFinset_choke_iff: N(u_i) = {r} u {b_ij}; mem_neighborFinset_root_iff: N(r) = {s} u {u_i}; choke_degree: deg u_i = 9. TERMINAL (the one theorem): for every natural m with 107 <= m and m % 3 = 2, IF (hE) C5LA1.crossingIndex (cbGraph m) + 2 <= (16m+4)/3 AND (hH) there is a saturating flow of the transport network of cbGraph m at rank (16m+4)/3 with the derived selector favorableLeaves (cbGraph m) ((16m+4)/3), THEN the SOLUTION-CONTRACT section 2 terminal body holds: IsTree AND the descent conjunct AND the low window AND the flow conjunct. That is, the section 2 terminal reduces to its conjuncts 2 and 4: conjunct 1 (tree) and conjunct 3 (low window) are discharged; conjuncts 2 and 4 are HYPOTHESES and are NOT asserted. hres is carried for the class shape and is not used. FENCES: structural facts only; no rank claim beyond the low window; no (HALL); no favorability; no descent; the terminal asserts neither conjunct 2 nor conjunct 4. EXCLUDED CONCLUSIONS: everything beyond the listed structural facts, in particular Tier 1, (HALL) at any scope, the favorability key, E1, (ELIG-top)(a), any aggregate, TREE, FOREST, TRANSFER and Erdos #993. INFRASTRUCTURE, NOT Tier 2 progress. No grade is asserted for any companion lemma; a compiled declaration has no grade until the governed award closes. Carried definitions of record: r30 C6-LA2 Snippets entries 1-21 (identical to r30 C1-LA1), 0035 C5LA1.crossingIndex, 0123 support_eq_of_isGraphLeaf_of_adj, 0124 mem_tagWitnesses_iff_of_adj, byte-identical and bound to the C6-LA2 kernel receipt (CAPSULE-VERIFICATION.json); never r30 C1-LA2 0014-0021 (pre-freeze bytes, synthesis R-8); never U1's own file. Attribution (the synthesis section's list, verbatim, plus the formalizer): structural content: r30's CB record (R30-CB-RECORD) and its seats; Lean layer: r31 U1; leaf-card and terminal reduction: C-U1-T; interface lemmas: C-U1-F; the integration check: the U adjudicator; the network definitions: r30 awards; Lean text of record, assembly, registration and verification: the formalizer c1-la2-formalizer-opus-20260928 (Claude Opus 5.5; chartered Claude Opus 5.5 effort high on dispatch-record authority; runtime-reported model id claude-opus-5-5).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
caterpillar-broom trees `CB(8,m)` for `m ≥ 107`, `m ≡ 2 (mod 3)` at the single rank `(16m+4)/3` (or a component of it); nothing about (HALL)
at full scope or at any other rank, residue class or `d`, the lower-region aggregate beyond these rows, `E993-BETA-AGG`, FOREST, TREE, TRANSFER,
or Erdős #993.
