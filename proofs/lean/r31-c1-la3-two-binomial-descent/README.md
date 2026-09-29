# r31-c1-la3-two-binomial-descent

Declaration `E993Transport.cb8_block_descent_topRank`, exported byte-for-byte from the sealed internal run `erdos-993-cb-uniform-switch-dre-2026-09-27` (`runs/lean-2026-09-28-c1-la3-two-binomial-descent`; r31 — see
[`experiments/r31-cb-uniform-switch.md`](../../../experiments/r31-cb-uniform-switch.md)). Award `C1-LA3`; registry effect `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-BLOCK-PRODUCT-1-PLUS-X-TO-8J-TIMES-1-PLUS-2X-TO-8M-MINUS-8J-PLUS-1-COEFFICIENTS-STRICTLY-DESCEND-AT-INDEX-16M-MINUS-2-OVER-3-MINUS-J-FOR-5-LE-J-LE-M (new; VERIFIED formally_verified)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem cb8_block_descent_topRank (m j : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hj : 5 ≤ j)
    (hjm : j ≤ m) :
    ((1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - 2 - j + 1) <
      ((1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - 2 - j)
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C1-LA3 (two-binomial descent: E1(i) at p* and the block-descent node). Terminal (BD): for all natural numbers m and j with 107 <= m, m % 3 = 2, 5 <= j <= m, and l := (16m+4)/3 - 2 - j (natural-number floor division and truncated subtraction, all true values on the domain), the coefficient of X^(l+1) in (1+X)^(8j) (1+2X)^(8(m-j)+1) over Z is strictly less than the coefficient of X^l. Companion lemmas on the face (same Lean file): (G) for a b t : N with 1 <= t, t <= a+b, 3a+4b+2 <= 6t, ((1+X)^a (1+2X)^b).coeff (t+1) < ((1+X)^a (1+2X)^b).coeff t over Z; (E1i) for 107 <= m, m % 3 = 2, 1 <= q <= m: ((1+X)^(8q-1) (1+2X)^(8(m-q)+1)).coeff ((16m+4)/3 - q) < ((1+X)^(8q-1) (1+2X)^(8(m-q)+1)).coeff ((16m+4)/3 - q - 1). Proof DAG (synthesis): (R) the three-term recurrence (k+1) r(k+1) = (a+2b-3k) r(k) + 2(a+b-k+1) r(k-1) from the derivative identity (1+X)(1+2X) P' = (a(1+2X) + 2b(1+X)) P; positivity of r on [0, a+b]; log-concavity by induction on linear factors (two-by-two minor invariant; no Newton, no Darroch); the closing step descent_of_recurrence_logconcave; the gap identities 2q+1 and 2j-8 (omega). Fences on the face: (BD) is a NODE of (ELIG-top)(a), not (ELIG-top)(a), which also needs the S_5 certificate and the block identity; (E1i) (the lemma E993Transport.cb8_E1_conditionI_topRank) is an instance of the registered threshold key's (a) at p* on the class, a Tier 3 dependency reduction, never Tier 2 progress; (G) (the lemma E993Transport.twoBinom_coeff_strictAnti_of_gap) is a companion tool with no certificate of its own and makes no family or tree claim. Excluded conclusions: (ELIG-top)(a) itself; E1-R's flow; favorability; any rank other than p*; the threshold key's (a) off p*; any residue class other than m % 3 = 2; any m < 107; (HALL); any aggregate, TREE, FOREST, TRANSFER or Erdos #993. Repairs carried in: U3's 'any fixed Q_0 immediate' and its section 5.6 are never inputs; U3's degree is 7, not 8; nothing from U3's Lean atoms is on this DAG. No Newton inequality and no Darroch mode theorem is used. No grade is asserted for any companion lemma. Attribution: Lemma A and the closing step: C-U3-T; the q = 1 case: r31 U3; corroboration: C-U3-F; the (BD) instance and its role in (ELIG-top)(a): the r31 Cycle 1 synthesis, from C-U3-T's Lemma B; the E1 criterion, threshold and r_q: r30; the mechanism: Codex GPT-6; Codex's heterogeneous-closure binomial-block mechanisms are cited as templates only, not as carried fragments. Lean text: the C1-LA3 formalizer (producer c1-la3-formalizer-opus-20260928; chartered Claude Opus 5.5; runtime-reported model id claude-opus-5-5).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
caterpillar-broom trees `CB(8,m)` for `m ≥ 107`, `m ≡ 2 (mod 3)` at the single rank `(16m+4)/3` (or a component of it); nothing about (HALL)
at full scope or at any other rank, residue class or `d`, the lower-region aggregate beyond these rows, `E993-BETA-AGG`, FOREST, TREE, TRANSFER,
or Erdős #993.
