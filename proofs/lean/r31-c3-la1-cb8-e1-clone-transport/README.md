# r31-c3-la1-cb8-e1-clone-transport

Declaration `E993Transport.cb8_E1_cloneTransport_topRank`, exported byte-for-byte from the sealed internal run `erdos-993-cb-uniform-switch-dre-2026-09-27` (`runs/lean-2026-09-28-c3-la1-cb8-e1-clone-transport`; r31 — see
[`experiments/r31-cb-uniform-switch.md`](../../../experiments/r31-cb-uniform-switch.md)). Award `C3-LA1`; registry effect `formal clone-level clause (scope note) on E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem cb8_E1_cloneTransport_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    e1Rho (8 * 1 - 1) (8 * (m - 1) + 1) ((16 * m + 4) / 3 - 1) =
        (cb8R1 m ((16 * m + 1) / 3) : ℚ) / (cb8R1 m ((16 * m + 1) / 3 - 1) : ℚ) ∧
    ∀ q : ℕ, 1 ≤ q → q ≤ m →
      e1Rho (8 * q - 1) (8 * (m - q) + 1) ((16 * m + 4) / 3 - q) =
          ((((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
              ((16 * m + 4) / 3 - q) : ℤ) : ℚ) /
            ((((1 + X) ^ (8 * q - 1) * (1 + 2 * X) ^ (8 * (m - q) + 1) : ℤ[X]).coeff
              ((16 * m + 4) / 3 - q - 1) : ℤ) : ℚ) ∧
      e1Rho (8 * q - 1) (8 * (m - q) + 1) ((16 * m + 4) / 3 - q) < 1 ∧
      ∀ a b j : ℕ, a = 8 * q - 1 → b = 8 * (m - q) + 1 → j = (16 * m + 4) / 3 - q →
        (∀ α ≤ a, 0 ≤ e1G a b j α ∧ 0 ≤ e1H a b j α) ∧
        (∀ α < a, e1G a b j (α + 1) + e1H a b j α = e1Rho a b j * e1T a b j α) ∧
        e1H a b j a = e1Rho a b j * e1T a b j a ∧
        e1G a b j 0 = 0 ∧
        (j ≤ a → e1G a b j j = e1S a b j j ∧ e1H a b j j = 0) ∧
        (∀ α ≤ a, 0 < e1T a b j α →
          (if α < a then ((a - α : ℕ) : ℚ) * e1G a b j (α + 1) /
              (((α + 1 : ℕ) : ℚ) * e1S a b j (α + 1)) else 0) +
          (if j - 1 - α < b then ((2 * (b - (j - 1 - α)) : ℕ) : ℚ) * e1H a b j α /
              (((j - α : ℕ) : ℚ) * e1S a b j α) else 0) = e1Rho a b j)
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and attribution are part of it):

> Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C3-LA1 (the E1 clone-level transport at the class and its rho-links), Lean run lean-2026-09-28-c3-la1-cb8-e1-clone-transport. Definitions (frozen synthesis text): e1S a b j al = [al <= j] C(a,al) C(b,j-al) 2^(j-al) in Q; e1T a b j al = [al+1 <= j] C(a,al) C(b,j-1-al) 2^(j-1-al); e1Rho a b j = (sum_{al<=a} e1S)/(sum_{al<=a} e1T); e1G a b j al = e1Rho * (sum_{i<al} e1T) - sum_{i<al} e1S; e1H = e1S - e1G. Terminal: for all m : N with 107 <= m and m % 3 = 2 (p* = (16m+4)/3 exact): (1) e1Rho (8*1-1) (8*(m-1)+1) ((16m+4)/3-1) = cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3-1) over Q (C1-LA1's cb8R1); (2) for all q with 1 <= q <= m, writing a = 8q-1, b = 8(m-q)+1, j = (16m+4)/3-q: (2a) e1Rho a b j equals the ratio of the Z-coefficients of X^j and X^(j-1) in (1+X)^a (1+2X)^b cast to Q; (2b) e1Rho a b j < 1; (2c) for all a b j equal to those values: every G_al, H_al (al <= a) is >= 0; G_(al+1) + H_al = rho T_al for al < a; H_a = rho T_a; G_0 = 0; j <= a implies G_j = S_j and H_j = 0; and for every al <= a with T_al > 0 the column sum [al<a](a-al) G_(al+1)/((al+1) S_(al+1)) + [j-1-al<b] 2(b-(j-1-al)) H_al/((j-al) S_al) = rho. Lean conventions: N truncated subtraction and floor division (all true values on the domain; audited in INFORMAL-PROOF.md), x/0 = 0 (never reached in a used branch). Proof DAG (synthesis steps 1-9): coefficient bridge; domain Sum T > 0 from carried C1-LA3 entry 14; rho < 1 from carried entry 20 through the bridge (never a hypothesis); the q = 1 link to cb8R1; in-balance/top telescoping; G_0 = 0 and saturation; absorption identities; columns incl. degenerate l = b; nonnegativity by the minor inequalities of carried entry 15 at a = 0 and b = 0 (TP-g/TP-h; no Newton, no Darroch). Fences: clone level only - NOT a statement about cbGraph m; NOT the E1 flow on the literal network; NOT conjunct 4; NOT (HALL) at any scope; NOT S(T_m, p*) <= 0; NOT progress on (L-S)_top or (ELIG-top)(a); not a new identity (a new key would be an alias, SR-C2-2 finding 5); one rank p*, d = 8, the class only; no theta* law; no Newton or Darroch. Excluded conclusions: the E1 flow on cbGraph m, the graph lift, conjunct 4, (HALL), favorability; any rank other than p*, m < 107, m not 2 mod 3, d != 8; any optimality of the template. On closure the controller registers the formal scope-note clause G-1 on the homogeneous criterion key (restricted scope); ledger row R31-C3-LA1; no key. No grade is asserted for any companion (e1_cloneTransport, e1Rho_eq_coeff_ratio, the two absorption identities, and every other lemma). Attribution (synthesis section, verbatim to the fidelity reviewer): T1 (Sonnet 5, seat C3-T-01): double counts, in-balance; T2 (seat C3-T-02): coefficient bridge, node (d), TP-g, zero-extended vocabulary; C-T1-F, C-T1-U (Opus 5.5 critics): node-(a) repair; rows, columns, g_zero; C-T2-F, C-T2-U: TP-h, nonnegativity, rho_1 link; C-F3-T, C-F3-U: E-1 exact domain, boundary closures, per-target load; U2 (seat C3-U-02): the duplicate rho_q < 1; the T adjudicator: T-A draft, degenerate-case instrument; the F adjudicator: G-F-A/G-F-B guard discipline; this synthesis: statement freeze, merged form, degenerate-case paragraph; r31 C2 T3 and critics (X-8/X-9); r30 (criterion key, CD-2, network; named seats as registered); Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL)); Codex's heterogeneous-closure run (coefficient mechanisms, as C1-LA3's face cites them); the C1-LA1 and C1-LA3 formalizers; plus the formalizer c3-la1-formalizer-opus-20260928 (chartered Claude Opus 5.5, effort high, session-applied; runtime-reported model id claude-opus-5-5).

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in `source/`; the package cache is not shipped —
bind a local Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice, Quot.sound]`; no
`sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract, independent informal proof-integrity audit, kernel/axiom receipt,
independent statement-fidelity attestation (verdict `passed`), canonical close (`formally_verified`). Digests in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration — a statement about the
caterpillar-broom trees `CB(8,m)` for `m ≥ 107`, `m ≡ 2 (mod 3)` at the single rank `(16m+4)/3` (or a component of it); nothing about (HALL)
at full scope or at any other rank, residue class or `d`, the lower-region aggregate beyond these rows, `E993-BETA-AGG`, FOREST, TREE, TRANSFER,
or Erdős #993.
