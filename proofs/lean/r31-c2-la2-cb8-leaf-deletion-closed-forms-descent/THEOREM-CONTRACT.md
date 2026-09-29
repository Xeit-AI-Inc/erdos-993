# Theorem Contract: C2-LA2 (r31): Darroch/Newton-free favorability at the closed-form level, both leaf classes — Delta_(p*) < 0 for the closed forms of I(CB(8,m) - v) and I(CB(8,m) - c) over Z[X], p* = (16m+4)/3, on the class m >= 107, m = 2 (mod 3)

- Contract ID: `erdos-993-r31-c2-la2-cb8-leaf-deletion-closed-forms-descent-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `26f71a554e927b5cf903899b32465d6eab5118c3ef1b6fc4a024ee9a8440126b`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C2-LA2 (Darroch/Newton-free favorability at the closed-form level, both leaf classes); Lean run lean-2026-09-28-c2-la2-cb8-leaf-deletion-closed-forms-descent. Terminal: for every natural number m with 107 <= m and m % 3 = 2, with p* = (16m+4)/3 (natural-number floor division, exact on the class), G = (1+2X)^8 + X(1+X)^8 and G_c = (1+2X)^7(1+X) + X(1+X)^7 over Z[X]: (arm leaf v) the coefficient of X^(p*+1) in (1+X)G^m + X(1+2X)^(8m) is strictly less than the coefficient of X^(p*); and (private leaf c) the coefficient of X^(p*+1) in (1+2X)G_c G^(m-1) + X(1+X)^2(1+2X)^(8m-1) is strictly less than the coefficient of X^(p*) (m - 1 and 8m - 1 are exact natural-number subtractions on the class, since m % 3 = 2 forces m >= 2). These polynomials are the closed forms of record of I(CB(8,m) - v) and I(CB(8,m) - c) (r30), and the inequalities are Delta_(p*) < 0 at the forward-difference index of record. Proof DAG (synthesis ### C2-LA2; INFORMAL-PROOF.md): arm leaf - E993Transport.cb8_armLeaf_blockExpansion (binomial block expansion with weights C(m,j)), cb8_armLeaf_block_descent ((G) on V_j = (1+X)^(8j+1)(1+2X)^(8(m-j)), margin 2j+3), cb8_armLeaf_remainder_descent ((G) on R = X(1+2X)^(8m), margin 0), cb8_armLeaf_closedForm_descent_topRank (positive weights C(m,j) > 0); private leaf - cb8_privateLeaf_blockExpansion (weights C(m-1,k); E0_k, E1_k), cb8_privateLeaf_regroup (E0_0 + tail = (1+X)^3(1+2X)^(8m-1) + X(1+X)(1+2X)^(8m-1), 1+3X+X^2 = (1+X)^2 + X), cb8_privateLeaf_E0_block_descent (margin 2k+3, used k >= 1), cb8_privateLeaf_E1_block_descent (margin 2k+7), cb8_privateLeaf_regrouped_descent (two (G) blocks, 6t-(3a+4b) = 3 each), cb8_privateLeaf_closedForm_descent_topRank (weights C(m-1,k) >= 0); terminal = conjunction. All from the carried C1-LA3 entry 17 (G) (hypotheses 1 <= t, t <= a+b, 3a+4b+2 <= 6t). Fences on the face: a statement about closed-form polynomials over Z[X], NOT about cbGraph (no IsFavorableAt, no favorableLeaves); no status transfer to the r30 favorability key's graph statement (until C2-LA3 or U-C closes); one rank p* = (16m+4)/3 at the forward-difference index of record Delta_p = i_(p+1) - i_p (synthesis R-1); d = 8; the class m >= 107, m = 2 (mod 3); 107 <= m is unused (fence 1). Not Tier 2 progress: a dependency removal (the gate object FAV_darroch_free), not a new result. No grade is asserted for any companion: (G) = E993Transport.twoBinom_coeff_strictAnti_of_gap and the carried C1-LA3 entries 1-16 are kernel-checked companions with no grade of their own. Excluded conclusions: IsFavorableAt (cbGraph m) w p*; favorableLeaves (cbGraph m) p* = leafSet; (H); (HALL); conjunct 4; any rank other than p*; any d other than 8; any residue class other than m % 3 = 2; any m < 107; any Tier 2 progress; any aggregate, TREE, FOREST, TRANSFER or Erdos #993; the closed forms of record for I(CB(8,m) - v) and I(CB(8,m) - c) themselves (they remain the r30 proved_informal node). No Newton inequality, no Darroch mode theorem, no M_0, no finite certificate. Carried fragments: C1-LA3 LeanProject/LeanProof/Main.lean (c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011) entries 1-17, byte-identical, keyed by (C1-LA3, entry, digest) and bound to C1-LA3's kernel receipt (verdict verified); load-bearing entry 17 E993Transport.twoBinom_coeff_strictAnti_of_gap (b39cd78768d02c83194f21b48717af69a8354afb36719755c5979769c3d6589c). DRAFT specifications re-authored under attribution, never carried: C-F2-U CritFav.lean (1cf346061b7e...65d0; rebuilt by the F adjudicator) and C-T1-U Crit.lean (9e40094637bf...15f1; rebuilt by the T adjudicator). Statement plumbing change recorded: the frozen text's fully qualified name E993Transport.cb8_leafDeletion_closedForms_descent_topRank is written namespace-relative (theorem cb8_leafDeletion_closedForms_descent_topRank inside namespace E993Transport), and the Markdown list indentation (2 spaces) is removed; binders, hypotheses, types and conclusion are byte-identical to the synthesis block. Attribution (exactly the synthesis ### C2-LA2 list): T1 (seat, arm leaf); C-T1-F, C-T1-U (arm-leaf Lean); C-F2-U (both leaves, regrouping, Lean); C-F2-T, C-T2-F, C-T2-U (independent private-leaf proofs); r30 (closed forms, pairing, favorability key); C1-LA3 (G). Plus the formalizer c2-la2-formalizer-opus-20260928 (Claude Opus 5.5; chartered effort high, session-applied; runtime-reported model id claude-opus-5-5).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.cb8_leafDeletion_closedForms_descent_topRank`
- Statement SHA-256: `d6407ad2414d35226616fcc2308cc0ea21d70b4874f5cbe9cc5e4892c85056d5`

```lean
theorem cb8_leafDeletion_closedForms_descent_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3) ∧
    ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
      ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
        X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3)

```

## Quantifiers

- `forall m` over `domain-m`

## Hypotheses

- `hyp-m-ge-107`: hm : 107 ≤ m (verbatim). Unused in the proof (fence 1): it scopes the award to the class.
- `hyp-m-mod-3`: hmod : m % 3 = 2 (verbatim). Makes (16 * m + 4) / 3 = p* exact and forces m >= 2, so m - 1 and 8 * m - 1 are exact.

## Conclusion

- `conclusion`: ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) < ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3) ∧ ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) + X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) < ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) + X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3) — Delta_(p*) < 0 for the closed forms of I(CB(8,m) - v) and I(CB(8,m) - c) over Z[X]; closed-form level only, not a graph statement.

## Dependencies

- `def-polynomial-int` -> `def-indeterminate-x`
- `def-polynomial-int` -> `def-coeff`
- `def-coeff` -> `def-poly-coeff-z`
- `domain-m` -> `hyp-m-ge-107`
- `domain-m` -> `hyp-m-mod-3`
- `hyp-m-ge-107` -> `conclusion`
- `hyp-m-mod-3` -> `conclusion`
- `def-polynomial-int` -> `conclusion`
- `def-indeterminate-x` -> `conclusion`
- `def-coeff` -> `conclusion`
- `def-nat-div` -> `conclusion`
- `def-nat-sub` -> `conclusion`
- `def-poly-coeff-z` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-adj-f-critfav-log`: `SOURCE/adj-F-critfav.log` (match)
- `src-c-f2-u-critfav-lean`: `SOURCE/C-F2-U-CritFav.lean` (match)
- `src-c-t1-u-crit-lean`: `SOURCE/C-T1-U-Crit.lean` (match)
- `src-c1-la3-origin-formalization-state-json`: `SOURCE/c1-la3-origin/FORMALIZATION-STATE.json` (match)
- `src-c1-la3-origin-kernel-verification-json`: `SOURCE/c1-la3-origin/kernel-verification.json` (match)
- `src-c1-la3-origin-main-lean`: `SOURCE/c1-la3-origin/Main.lean` (match)
- `src-c1-la3-origin-theorem-contract-yaml`: `SOURCE/c1-la3-origin/THEOREM-CONTRACT.yaml` (match)
- `src-c2-la2-packet-manifest-json`: `SOURCE/C2-LA2-PACKET-MANIFEST.json` (match)
- `src-c2-stage7-formalizer-brief-la2-md`: `SOURCE/C2-STAGE7-FORMALIZER-BRIEF-LA2.md` (match)
- `src-c2-stage7-protocol-md`: `SOURCE/C2-STAGE7-PROTOCOL.md` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carried-c1-la3-0001-definition-e993transport-polycoeffz-lean-fragment`: `SOURCE/carried-c1-la3/0001-definition-E993Transport-polyCoeffZ.lean.fragment` (match)
- `src-carried-c1-la3-0002-lemma-e993transport-descent-of-recurrence-logconcave-lean-fragment`: `SOURCE/carried-c1-la3/0002-lemma-E993Transport-descent_of_recurrence_logconcave.lean.fragment` (match)
- `src-carried-c1-la3-0003-lemma-e993transport-twobinom-derivative-identity-lean-fragment`: `SOURCE/carried-c1-la3/0003-lemma-E993Transport-twoBinom_derivative_identity.lean.fragment` (match)
- `src-carried-c1-la3-0004-lemma-e993transport-twobinomcoeff-recurrence-lean-fragment`: `SOURCE/carried-c1-la3/0004-lemma-E993Transport-twoBinomCoeff_recurrence.lean.fragment` (match)
- `src-carried-c1-la3-0005-lemma-e993transport-polycoeffz-natcast-lean-fragment`: `SOURCE/carried-c1-la3/0005-lemma-E993Transport-polyCoeffZ_natCast.lean.fragment` (match)
- `src-carried-c1-la3-0006-lemma-e993transport-polycoeffz-of-neg-lean-fragment`: `SOURCE/carried-c1-la3/0006-lemma-E993Transport-polyCoeffZ_of_neg.lean.fragment` (match)
- `src-carried-c1-la3-0007-lemma-e993transport-polycoeffz-one-lean-fragment`: `SOURCE/carried-c1-la3/0007-lemma-E993Transport-polyCoeffZ_one.lean.fragment` (match)
- `src-carried-c1-la3-0008-lemma-e993transport-polycoeffz-linear-mul-lean-fragment`: `SOURCE/carried-c1-la3/0008-lemma-E993Transport-polyCoeffZ_linear_mul.lean.fragment` (match)
- `src-carried-c1-la3-0009-lemma-e993transport-stronglc-linear-step-lean-fragment`: `SOURCE/carried-c1-la3/0009-lemma-E993Transport-strongLC_linear_step.lean.fragment` (match)
- `src-carried-c1-la3-0010-lemma-e993transport-twobinom-succ-left-lean-fragment`: `SOURCE/carried-c1-la3/0010-lemma-E993Transport-twoBinom_succ_left.lean.fragment` (match)
- `src-carried-c1-la3-0011-lemma-e993transport-twobinom-succ-right-lean-fragment`: `SOURCE/carried-c1-la3/0011-lemma-E993Transport-twoBinom_succ_right.lean.fragment` (match)
- `src-carried-c1-la3-0012-lemma-e993transport-polycoeffz-linear-mul-nonneg-pos-lean-fragment`: `SOURCE/carried-c1-la3/0012-lemma-E993Transport-polyCoeffZ_linear_mul_nonneg_pos.lean.fragment` (match)
- `src-carried-c1-la3-0013-lemma-e993transport-twobinomcoeffz-nonneg-pos-lean-fragment`: `SOURCE/carried-c1-la3/0013-lemma-E993Transport-twoBinomCoeffZ_nonneg_pos.lean.fragment` (match)
- `src-carried-c1-la3-0014-lemma-e993transport-twobinomcoeff-pos-lean-fragment`: `SOURCE/carried-c1-la3/0014-lemma-E993Transport-twoBinomCoeff_pos.lean.fragment` (match)
- `src-carried-c1-la3-0015-lemma-e993transport-twobinomcoeffz-stronglc-lean-fragment`: `SOURCE/carried-c1-la3/0015-lemma-E993Transport-twoBinomCoeffZ_strongLC.lean.fragment` (match)
- `src-carried-c1-la3-0016-lemma-e993transport-twobinomcoeff-logconcave-lean-fragment`: `SOURCE/carried-c1-la3/0016-lemma-E993Transport-twoBinomCoeff_logConcave.lean.fragment` (match)
- `src-carried-c1-la3-0017-lemma-e993transport-twobinom-coeff-strictanti-of-gap-lean-fragment`: `SOURCE/carried-c1-la3/0017-lemma-E993Transport-twoBinom_coeff_strictAnti_of_gap.lean.fragment` (match)
- `src-cycle-2-f-adjudication-md`: `SOURCE/cycle-2-F-ADJUDICATION.md` (match)
- `src-cycle-2-synthesis-md`: `SOURCE/cycle-2-SYNTHESIS.md` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-path-check-c2-la2-json`: `SOURCE/PATH-CHECK-C2-LA2.json` (match)
- `src-semantic-contract-md`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract-md`: `SOURCE/SOLUTION-CONTRACT.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
