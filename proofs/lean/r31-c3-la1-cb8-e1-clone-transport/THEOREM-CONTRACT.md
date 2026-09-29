# Theorem Contract: C3-LA1 (r31): the E1 clone-level transport at the class and its rho-links - at p* = (16m+4)/3 for every 1 <= q <= m on the class m >= 107, m = 2 (mod 3), d = 8, clone level only

- Contract ID: `erdos-993-r31-c3-la1-cb8-e1-clone-transport-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `35b5dd525bee32f80f93125922f9933c376a194faea4fe8aa996ea3a542fb26c`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C3-LA1 (the E1 clone-level transport at the class and its rho-links), Lean run lean-2026-09-28-c3-la1-cb8-e1-clone-transport. Definitions (frozen synthesis text): e1S a b j al = [al <= j] C(a,al) C(b,j-al) 2^(j-al) in Q; e1T a b j al = [al+1 <= j] C(a,al) C(b,j-1-al) 2^(j-1-al); e1Rho a b j = (sum_{al<=a} e1S)/(sum_{al<=a} e1T); e1G a b j al = e1Rho * (sum_{i<al} e1T) - sum_{i<al} e1S; e1H = e1S - e1G. Terminal: for all m : N with 107 <= m and m % 3 = 2 (p* = (16m+4)/3 exact): (1) e1Rho (8*1-1) (8*(m-1)+1) ((16m+4)/3-1) = cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3-1) over Q (C1-LA1's cb8R1); (2) for all q with 1 <= q <= m, writing a = 8q-1, b = 8(m-q)+1, j = (16m+4)/3-q: (2a) e1Rho a b j equals the ratio of the Z-coefficients of X^j and X^(j-1) in (1+X)^a (1+2X)^b cast to Q; (2b) e1Rho a b j < 1; (2c) for all a b j equal to those values: every G_al, H_al (al <= a) is >= 0; G_(al+1) + H_al = rho T_al for al < a; H_a = rho T_a; G_0 = 0; j <= a implies G_j = S_j and H_j = 0; and for every al <= a with T_al > 0 the column sum [al<a](a-al) G_(al+1)/((al+1) S_(al+1)) + [j-1-al<b] 2(b-(j-1-al)) H_al/((j-al) S_al) = rho. Lean conventions: N truncated subtraction and floor division (all true values on the domain; audited in INFORMAL-PROOF.md), x/0 = 0 (never reached in a used branch). Proof DAG (synthesis steps 1-9): coefficient bridge; domain Sum T > 0 from carried C1-LA3 entry 14; rho < 1 from carried entry 20 through the bridge (never a hypothesis); the q = 1 link to cb8R1; in-balance/top telescoping; G_0 = 0 and saturation; absorption identities; columns incl. degenerate l = b; nonnegativity by the minor inequalities of carried entry 15 at a = 0 and b = 0 (TP-g/TP-h; no Newton, no Darroch). Fences: clone level only - NOT a statement about cbGraph m; NOT the E1 flow on the literal network; NOT conjunct 4; NOT (HALL) at any scope; NOT S(T_m, p*) <= 0; NOT progress on (L-S)_top or (ELIG-top)(a); not a new identity (a new key would be an alias, SR-C2-2 finding 5); one rank p*, d = 8, the class only; no theta* law; no Newton or Darroch. Excluded conclusions: the E1 flow on cbGraph m, the graph lift, conjunct 4, (HALL), favorability; any rank other than p*, m < 107, m not 2 mod 3, d != 8; any optimality of the template. On closure the controller registers the formal scope-note clause G-1 on the homogeneous criterion key (restricted scope); ledger row R31-C3-LA1; no key. No grade is asserted for any companion (e1_cloneTransport, e1Rho_eq_coeff_ratio, the two absorption identities, and every other lemma). Attribution (synthesis section, verbatim to the fidelity reviewer): T1 (Sonnet 5, seat C3-T-01): double counts, in-balance; T2 (seat C3-T-02): coefficient bridge, node (d), TP-g, zero-extended vocabulary; C-T1-F, C-T1-U (Opus 5.5 critics): node-(a) repair; rows, columns, g_zero; C-T2-F, C-T2-U: TP-h, nonnegativity, rho_1 link; C-F3-T, C-F3-U: E-1 exact domain, boundary closures, per-target load; U2 (seat C3-U-02): the duplicate rho_q < 1; the T adjudicator: T-A draft, degenerate-case instrument; the F adjudicator: G-F-A/G-F-B guard discipline; this synthesis: statement freeze, merged form, degenerate-case paragraph; r31 C2 T3 and critics (X-8/X-9); r30 (criterion key, CD-2, network; named seats as registered); Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL)); Codex's heterogeneous-closure run (coefficient mechanisms, as C1-LA3's face cites them); the C1-LA1 and C1-LA3 formalizers; plus the formalizer c3-la1-formalizer-opus-20260928 (chartered Claude Opus 5.5, effort high, session-applied; runtime-reported model id claude-opus-5-5).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.cb8_E1_cloneTransport_topRank`
- Statement SHA-256: `dbfb841103b661707e67104284d8dd9e87c7dc6310d9ea12e5101d34354cd935`

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

## Quantifiers

- `forall m` over `domain-m`
- `forall q` over `domain-q`
- `forall a` over `domain-abj`
- `forall b` over `domain-abj`
- `forall j` over `domain-abj`
- `forall α` over `domain-alpha`

## Hypotheses

- `hyp-m-ge-107`: hm : 107 ≤ m (verbatim). Load-bearing through carried entry 20 (rho < 1) and the domain 1 <= j <= a + b + 1.
- `hyp-m-mod-3`: hmod : m % 3 = 2 (verbatim). Makes (16 * m + 4) / 3 = p* exact and (16 * m + 4) / 3 - 1 = (16 * m + 1) / 3 in conjunct 1.

## Conclusion

- `conclusion`: e1Rho (8 * 1 - 1) (8 * (m - 1) + 1) ((16 * m + 4) / 3 - 1) =
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

## Dependencies

- `def-polynomial-int` -> `def-indeterminate-x`
- `def-polynomial-int` -> `def-coeff`
- `def-coeff` -> `def-poly-coeff-z`
- `def-choose` -> `def-cb8r1`
- `def-finset-sum` -> `def-cb8r1`
- `def-choose` -> `def-e1s`
- `def-choose` -> `def-e1t`
- `def-e1s` -> `def-e1rho`
- `def-e1t` -> `def-e1rho`
- `def-finset-sum` -> `def-e1rho`
- `def-e1rho` -> `def-e1g`
- `def-e1s` -> `def-e1g`
- `def-e1t` -> `def-e1g`
- `def-finset-sum` -> `def-e1g`
- `def-e1s` -> `def-e1h`
- `def-e1g` -> `def-e1h`
- `domain-m` -> `hyp-m-ge-107`
- `domain-m` -> `hyp-m-mod-3`
- `hyp-m-ge-107` -> `conclusion`
- `hyp-m-mod-3` -> `conclusion`
- `domain-q` -> `conclusion`
- `domain-abj` -> `conclusion`
- `domain-alpha` -> `conclusion`
- `def-polynomial-int` -> `conclusion`
- `def-indeterminate-x` -> `conclusion`
- `def-coeff` -> `conclusion`
- `def-cb8r1` -> `conclusion`
- `def-e1s` -> `conclusion`
- `def-e1t` -> `conclusion`
- `def-e1rho` -> `conclusion`
- `def-e1g` -> `conclusion`
- `def-e1h` -> `conclusion`
- `def-poly-coeff-z` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCE/C3-STAGE7-FORMALIZER-BRIEF-LA1.md` (match)
- `src-c1-la1-kernel-receipt`: `SOURCE/C1-LA1-kernel-verification.json` (match)
- `src-c1-la1-main`: `SOURCE/C1-LA1-Main.lean` (match)
- `src-c1-la1-state`: `SOURCE/C1-LA1-FORMALIZATION-STATE.json` (match)
- `src-c1-la3-kernel-receipt`: `SOURCE/C1-LA3-kernel-verification.json` (match)
- `src-c1-la3-main`: `SOURCE/C1-LA3-Main.lean` (match)
- `src-c1-la3-state`: `SOURCE/C1-LA3-FORMALIZATION-STATE.json` (match)
- `src-capsule-manifest`: `SOURCE/C3-LA1-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carried-0001`: `LeanProject/LeanProof/Snippets/0001-definition-E993Transport-polyCoeffZ.lean.fragment` (match)
- `src-carried-0002`: `LeanProject/LeanProof/Snippets/0002-definition-E993Transport-cb8R1.lean.fragment` (match)
- `src-carried-0008`: `LeanProject/LeanProof/Snippets/0008-lemma-E993Transport-descent_of_recurrence_logconcave.lean.fragment` (match)
- `src-carried-0009`: `LeanProject/LeanProof/Snippets/0009-lemma-E993Transport-twoBinom_derivative_identity.lean.fragment` (match)
- `src-carried-0010`: `LeanProject/LeanProof/Snippets/0010-lemma-E993Transport-twoBinomCoeff_recurrence.lean.fragment` (match)
- `src-carried-0011`: `LeanProject/LeanProof/Snippets/0011-lemma-E993Transport-polyCoeffZ_natCast.lean.fragment` (match)
- `src-carried-0012`: `LeanProject/LeanProof/Snippets/0012-lemma-E993Transport-polyCoeffZ_of_neg.lean.fragment` (match)
- `src-carried-0013`: `LeanProject/LeanProof/Snippets/0013-lemma-E993Transport-polyCoeffZ_one.lean.fragment` (match)
- `src-carried-0014`: `LeanProject/LeanProof/Snippets/0014-lemma-E993Transport-polyCoeffZ_linear_mul.lean.fragment` (match)
- `src-carried-0015`: `LeanProject/LeanProof/Snippets/0015-lemma-E993Transport-strongLC_linear_step.lean.fragment` (match)
- `src-carried-0016`: `LeanProject/LeanProof/Snippets/0016-lemma-E993Transport-twoBinom_succ_left.lean.fragment` (match)
- `src-carried-0017`: `LeanProject/LeanProof/Snippets/0017-lemma-E993Transport-twoBinom_succ_right.lean.fragment` (match)
- `src-carried-0018`: `LeanProject/LeanProof/Snippets/0018-lemma-E993Transport-polyCoeffZ_linear_mul_nonneg_pos.lean.fragment` (match)
- `src-carried-0019`: `LeanProject/LeanProof/Snippets/0019-lemma-E993Transport-twoBinomCoeffZ_nonneg_pos.lean.fragment` (match)
- `src-carried-0020`: `LeanProject/LeanProof/Snippets/0020-lemma-E993Transport-twoBinomCoeff_pos.lean.fragment` (match)
- `src-carried-0021`: `LeanProject/LeanProof/Snippets/0021-lemma-E993Transport-twoBinomCoeffZ_strongLC.lean.fragment` (match)
- `src-carried-0022`: `LeanProject/LeanProof/Snippets/0022-lemma-E993Transport-twoBinomCoeff_logConcave.lean.fragment` (match)
- `src-carried-0023`: `LeanProject/LeanProof/Snippets/0023-lemma-E993Transport-twoBinom_coeff_strictAnti_of_gap.lean.fragment` (match)
- `src-carried-0024`: `LeanProject/LeanProof/Snippets/0024-lemma-E993Transport-cb8_gap_E1_conditionI.lean.fragment` (match)
- `src-carried-0025`: `LeanProject/LeanProof/Snippets/0025-lemma-E993Transport-cb8_E1_conditionI_topRank.lean.fragment` (match)
- `src-draft-adj-t-advance`: `SOURCE/ADJ-T-t1-Advance.lean` (match)
- `src-draft-c-t1-u`: `SOURCE/C-T1-U-CriticT1U.lean` (match)
- `src-draft-c-t1-u-column`: `SOURCE/C-T1-U-CriticT1UColumn.lean` (match)
- `src-draft-c-t2-f`: `SOURCE/C-T2-F-Critic.lean` (match)
- `src-draft-c-t2-u`: `SOURCE/C-T2-U-CriticSection.lean.part` (match)
- `src-draft-t1`: `SOURCE/T1-CloneQuotient.lean` (match)
- `src-draft-t2-main`: `SOURCE/T2-Main.lean` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-path-check`: `SOURCE/PATH-CHECK-C3-LA1.json` (match)
- `src-protocol`: `SOURCE/C3-STAGE7-PROTOCOL.md` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/cycle-3-SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
