# Theorem Contract: C1-LA3 (r31): two-binomial descent — the block descent (BD) at l = (16m+4)/3 - 2 - j for every 5 <= j <= m on the class m >= 107, m = 2 (mod 3), with (E1i) and (G) as lemmas on the face

- Contract ID: `erdos-993-r31-c1-la3-two-binomial-descent-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `33bc3c74a4f8fef571367a974cea3ee1a2ff761a1ec9da051f0df01b74f66bcc`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Canonical run id erdos-993-math-dre-20260927-r31-cb-uniform-switch; award C1-LA3 (two-binomial descent: E1(i) at p* and the block-descent node). Terminal (BD): for all natural numbers m and j with 107 <= m, m % 3 = 2, 5 <= j <= m, and l := (16m+4)/3 - 2 - j (natural-number floor division and truncated subtraction, all true values on the domain), the coefficient of X^(l+1) in (1+X)^(8j) (1+2X)^(8(m-j)+1) over Z is strictly less than the coefficient of X^l. Companion lemmas on the face (same Lean file): (G) for a b t : N with 1 <= t, t <= a+b, 3a+4b+2 <= 6t, ((1+X)^a (1+2X)^b).coeff (t+1) < ((1+X)^a (1+2X)^b).coeff t over Z; (E1i) for 107 <= m, m % 3 = 2, 1 <= q <= m: ((1+X)^(8q-1) (1+2X)^(8(m-q)+1)).coeff ((16m+4)/3 - q) < ((1+X)^(8q-1) (1+2X)^(8(m-q)+1)).coeff ((16m+4)/3 - q - 1). Proof DAG (synthesis): (R) the three-term recurrence (k+1) r(k+1) = (a+2b-3k) r(k) + 2(a+b-k+1) r(k-1) from the derivative identity (1+X)(1+2X) P' = (a(1+2X) + 2b(1+X)) P; positivity of r on [0, a+b]; log-concavity by induction on linear factors (two-by-two minor invariant; no Newton, no Darroch); the closing step descent_of_recurrence_logconcave; the gap identities 2q+1 and 2j-8 (omega). Fences on the face: (BD) is a NODE of (ELIG-top)(a), not (ELIG-top)(a), which also needs the S_5 certificate and the block identity; (E1i) (the lemma E993Transport.cb8_E1_conditionI_topRank) is an instance of the registered threshold key's (a) at p* on the class, a Tier 3 dependency reduction, never Tier 2 progress; (G) (the lemma E993Transport.twoBinom_coeff_strictAnti_of_gap) is a companion tool with no certificate of its own and makes no family or tree claim. Excluded conclusions: (ELIG-top)(a) itself; E1-R's flow; favorability; any rank other than p*; the threshold key's (a) off p*; any residue class other than m % 3 = 2; any m < 107; (HALL); any aggregate, TREE, FOREST, TRANSFER or Erdos #993. Repairs carried in: U3's 'any fixed Q_0 immediate' and its section 5.6 are never inputs; U3's degree is 7, not 8; nothing from U3's Lean atoms is on this DAG. No Newton inequality and no Darroch mode theorem is used. No grade is asserted for any companion lemma. Attribution: Lemma A and the closing step: C-U3-T; the q = 1 case: r31 U3; corroboration: C-U3-F; the (BD) instance and its role in (ELIG-top)(a): the r31 Cycle 1 synthesis, from C-U3-T's Lemma B; the E1 criterion, threshold and r_q: r30; the mechanism: Codex GPT-6; Codex's heterogeneous-closure binomial-block mechanisms are cited as templates only, not as carried fragments. Lean text: the C1-LA3 formalizer (producer c1-la3-formalizer-opus-20260928; chartered Claude Opus 5.5; runtime-reported model id claude-opus-5-5).

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993Transport.cb8_block_descent_topRank`
- Statement SHA-256: `40d79e5b5b80cf51af08966cba8015869a1816516d5dbd1b361bcfe72fa7b5ed`

```lean
theorem cb8_block_descent_topRank (m j : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) (hj : 5 ≤ j)
    (hjm : j ≤ m) :
    ((1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - 2 - j + 1) <
      ((1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1) : ℤ[X]).coeff
        ((16 * m + 4) / 3 - 2 - j)
```

## Quantifiers

- `forall m` over `domain-m`
- `forall j` over `domain-j`

## Hypotheses

- `hyp-m-ge-107`: hm : 107 ≤ m (verbatim).
- `hyp-m-mod-3`: hmod : m % 3 = 2 (verbatim). Makes (16 * m + 4) / 3 = p* exact.
- `hyp-j-ge-5`: hj : 5 ≤ j (verbatim). Gives the gap 2j - 8 >= 2.
- `hyp-j-le-m`: hjm : j ≤ m (verbatim). Makes m - j a true value.

## Conclusion

- `conclusion`: ((1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1) : ℤ[X]).coeff ((16 * m + 4) / 3 - 2 - j + 1) < ((1 + X) ^ (8 * j) * (1 + 2 * X) ^ (8 * (m - j) + 1) : ℤ[X]).coeff ((16 * m + 4) / 3 - 2 - j) — (BD): the block descent B_j(l+1) < B_j(l) at l = p* - 2 - j, p* = (16m+4)/3, over Z. A node of (ELIG-top)(a), not (ELIG-top)(a).

## Dependencies

- `def-polynomial-int` -> `def-indeterminate-x`
- `def-polynomial-int` -> `def-coeff`
- `def-coeff` -> `def-poly-coeff-z`
- `domain-m` -> `hyp-m-ge-107`
- `domain-m` -> `hyp-m-mod-3`
- `domain-j` -> `hyp-j-ge-5`
- `domain-j` -> `hyp-j-le-m`
- `domain-m` -> `hyp-j-le-m`
- `hyp-m-ge-107` -> `conclusion`
- `hyp-m-mod-3` -> `conclusion`
- `hyp-j-ge-5` -> `conclusion`
- `hyp-j-le-m` -> `conclusion`
- `def-polynomial-int` -> `conclusion`
- `def-indeterminate-x` -> `conclusion`
- `def-coeff` -> `conclusion`
- `def-poly-coeff-z` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-brief`: `SOURCE/C1-STAGE7-FORMALIZER-BRIEF-LA3.md` (match)
- `src-c-u3-t-critic-lean`: `SOURCE/C-U3-T-Critic.lean` (match)
- `src-c-u3-t-critique`: `SOURCE/cycle-1-C-U3-T-CRITIQUE.md` (match)
- `src-capsule-manifest`: `SOURCE/C1-LA3-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-path-check`: `SOURCE/PATH-CHECK-C1-LA3.json` (match)
- `src-protocol`: `SOURCE/C1-STAGE7-PROTOCOL.md` (match)
- `src-r30-c1-la1-main-format`: `SOURCE/r30-C1-LA1-Main.lean` (match)
- `src-r30-c6-la2-contract-format`: `SOURCE/r30-C6-LA2-THEOREM-CONTRACT.yaml` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/cycle-1-SYNTHESIS.md` (match)
- `src-u-adjudication`: `SOURCE/cycle-1-U-ADJUDICATION.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
