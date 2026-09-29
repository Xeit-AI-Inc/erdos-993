# r31-c2-la1-cb8-parent-descent-and-eligibility

Declaration `E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3`, exported byte-for-byte from the sealed internal run `erdos-993-cb-uniform-switch-dre-2026-09-27` (`runs/lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree`; r31 — see
[`experiments/r31-cb-uniform-switch.md`](../../../experiments/r31-cb-uniform-switch.md)). Award `C2-LA1`; registry effect `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    (cbGraph m).IsTree ∧
    C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 1) <
      C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 2) ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C2-LA1 (r31 Cycle 2; (ELIG-top)(a) on the literal tree and conjuncts 1-3 of the terminal; the U adjudicator's group U-A plus the synthesis's added descent conjunct); governed run lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree; key on closure: none new — the synthesis ## Registrations names the scope update this award enables (the ELIG key to formally_verified at its exact scope; the controller applies it after the award closes and the matching isolated second read SR-C2-4 passes). OBJECT: for every natural m with 107 <= m and m % 3 = 2, at the one rank p* = (16m+4)/3: (1) cbGraph m is a tree; (2) the literal parent descent C5LA1.indepSetCount (cbGraph m) ∅ (p*−1) < C5LA1.indepSetCount (cbGraph m) ∅ (p*−2); (3) conjunct 2, C5LA1.crossingIndex (cbGraph m) + 2 <= p*; (4) conjunct 3, the low window 3p* < 2·indepNum + 1. FACE COMPANIONS (ungraded; no grade is asserted for any companion): CriticU1T.cb8_elig_top_a ((cb8I m).coeff (p*−1) < (cb8I m).coeff (p*−2)); the ℕ closed form critU3T_cb_indepPoly_closedForm (I(cbGraph m) = (1+2X)·G^m + X·((1+X)(1+2X)^(8m)) over ℕ) with critU3T_cb_indepSetCount_eq_coeff (count = coefficient); AdjU.cb8_topRank_of_flow (the SOLUTION-CONTRACT §2 terminal from conjunct 4 alone, via carried C1-LA2 entry 78). FENCES: one rank p*; the class only; (H) not claimed; conjunct 4 not claimed; no FLOW => SIGN; no aggregate or (HALL) status; not a new E993-R31- identity (it formalizes the registered ELIG key and the r30 closed-form node). EXCLUDED CONCLUSIONS: (H); conjunct 4; favorability; (HALL) at any scope; S(T_m, p*) <= 0; any rank other than p*; m < 107; m ≢ 2 (mod 3); d ≠ 8. REPAIRS CARRIED: U1's "(E)" wording narrowed; U3's import edit (P4) replaced by a clean import (single source, import Mathlib only); the extra descent conjunct added. CARRIES: C1-LA3 entries 1-21 (Main.lean c0605e12…3011) and C1-LA2 entries 1-78 (Main.lean a906ec17…5f3f), merged into one Main.lean with re-keyed entry markers, bound to each origin's kernel receipt (CAPSULE-VERIFICATION.json); 97 byte-identical; the two origin TERMINALS (C1-LA3 21, C1-LA2 78) carried keyword-rekeyed (theorem -> lemma only; reverse substitution reproduces the origin digest) because the registrar and R7 admit exactly one theorem — recorded for controller ruling. All other declarations are DRAFT text re-authored under attribution (origin named on each). ATTRIBUTION: U1 (Sonnet 5, seat C2-U-01); C-U1-T (Opus 5.5, critic; node 2); U3 (C2-U-03; Node 0); C-U3-T (critic; closed-form link); the U adjudicator (composition, cast bridge); C-U1-F (independent symbolic derivation of N_5, not in the DAG); SR-4 (the certificate method of record); C1-LA2 and C1-LA3 (r31 C1 formalizers); r30 (closed forms, T1 of r30 Cycle 6; network definitions, named seats); Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL)); Codex's heterogeneous-closure run as C1-LA3's face cites it (C1-LA3 face line: "Codex's heterogeneous-closure binomial-block mechanisms are cited as templates only, not as carried fragments (none was opened as a Lean source in this run)."); plus the formalizer c2-la1-formalizer-opus-20260928 (Claude Opus 5.5).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
caterpillar-broom trees `CB(8,m)` for `m ≥ 107`, `m ≡ 2 (mod 3)` at the single rank `(16m+4)/3` (or a component of it); nothing about (HALL)
at full scope or at any other rank, residue class or `d`, the lower-region aggregate beyond these rows, `E993-BETA-AGG`, FOREST, TREE, TRANSFER,
or Erdős #993.
