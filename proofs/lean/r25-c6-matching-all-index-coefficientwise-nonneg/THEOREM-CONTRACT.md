# Theorem Contract: Coefficientwise nonnegativity of N_j for every j <= m (award group C6-LA3, clause (a) of E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY)

- Contract ID: `c6-la3-c6-matching-all-index-coefficientwise-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `61492702ab332d4d86dd25fde9079169bc47a342587a878d7601ef6f23bc5850`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

Coefficientwise-in-t nonnegativity of the certificate-dual polynomial N_j, for EVERY index j <= m (clause (a) only of E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY). For every m, K, d : Nat with K + d = 2m and the chartered region 3d <= 2m+2: for every j <= m, the Polynomial Z object Nj K m j = sum_{i<=j} (K+1-2i) * 2^i * C(m,i) * A_i(t) * B_i(t) (A_i(t) = prod_{l<i}(t+K+1-l), B_i(t) = prod_{i<l<=j}(t+l)) has every coefficient >= 0. Uniform in d, m AND j; no horizon, no census; no ν, τ, x(F) < r anywhere; no SimpleGraph, indepCount, delta, or firstDescent occurs anywhere in the corpus -- the sixth award's PStatement and P_holds_critic_general are imported byte-identically and never re-proved. The rank substitution t = r - K: since the Polynomial Z statement is substitution-free, coefficientwise nonnegativity implies 0 <= (Nj K m j).eval t for every integer t >= 0, in particular at t = r - K for every r >= K; on the region m <= K+1 (region_le), so r >= K already implies the standing condition r >= m-1 that E993-R25-CLAMPED-DUAL-DOMINATION needs. No Lean identifier in this project mentions r. SCOPE (mandatory fences): this discharges CLAUSE (a) ONLY of E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY; clause (b) (mu_j^g(t) >= 0, denominator positivity, clamp persistence) is formalised NOWHERE, so the registered claim as a whole stays proved_informal -- 'the coefficientwise positivity lemma is formal' must never be shortened to 'the all-index dual positivity claim is formal'. The j = m instance IS the sufficiency half of the separately registered E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF (Q_{m,d} = m! * N_m); two registry keys, not one. The CONVERSE half of that iff is NOT formalised. This bears NOT AT ALL on E993-R25-MATCHING-BRANCH-UNIFORM-SIGN, which stays OPEN. The region 3d <= 2m+2 is exactly sharp (off-region witness (m,d) = (1,2): N_1 = -t-1) -- evidence, not on the theorem's own face. No graph, forest, G1 tuple, tier, FOREST, TREE, TRANSFER or Erdos #993 statement occurs anywhere. Attribution: seat U1 for the apparatus and the j = m assembly; the general-j lift critic-attributed jointly to C-U1-T and C-U1-F (independently); the imported sixth award's induction step is C-U1-F (primary, toolkit-free)/C-U1-T (induction-principle scaffold) of Cycle 5, already on that award's own face.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem ErdosR25.E1CoeffWise.Nj_nonneg_all_index`
- Statement SHA-256: `96b34976948db682ff3e8dec69af2964c801d38237cf9e7a0ae4683789952600`

```lean
theorem Nj_nonneg_all_index {m K d : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) :
    ∀ j ≤ m, CoeffNonneg (Nj K m j)
```

## Quantifiers

- `forall m` over `domain-nat`
- `forall K` over `domain-nat`
- `forall d` over `domain-nat`
- `forall j` over `domain-nat`

## Hypotheses

- `hyp-hkd`: K + d = 2 * m
- `hyp-hregion`: 3 * d ≤ 2 * m + 2
- `hyp-hjm`: j ≤ m

## Conclusion

- `conclusion`: CoeffNonneg (Nj K m j)

## Dependencies

- `domain-nat` -> `def-pstatement`
- `domain-nat` -> `def-afac`
- `domain-poly` -> `def-afac`
- `domain-nat` -> `def-bfac`
- `domain-poly` -> `def-bfac`
- `domain-nat` -> `def-ishard`
- `domain-nat` -> `def-partner`
- `domain-nat` -> `def-wcoef`
- `domain-nat` -> `def-njterm`
- `domain-poly` -> `def-njterm`
- `def-afac` -> `def-njterm`
- `def-bfac` -> `def-njterm`
- `def-wcoef` -> `def-njterm`
- `domain-nat` -> `def-nj`
- `domain-poly` -> `def-nj`
- `def-njterm` -> `def-nj`
- `domain-poly` -> `def-coeffnonneg`
- `domain-int` -> `def-discriminant-factorization`
- `domain-int` -> `def-discriminant-in-k-matches-in-d`
- `domain-int` -> `def-discriminant-nonpos-iff`
- `def-discriminant-factorization` -> `def-discriminant-nonpos-iff`
- `domain-int` -> `def-s-quadratic-nonneg`
- `domain-int` -> `def-s-holds-of-discriminant-nonpos`
- `def-s-quadratic-nonneg` -> `def-s-holds-of-discriminant-nonpos`
- `domain-int` -> `def-s-holds-on-region`
- `def-discriminant-nonpos-iff` -> `def-s-holds-on-region`
- `def-discriminant-in-k-matches-in-d` -> `def-s-holds-on-region`
- `def-s-holds-of-discriminant-nonpos` -> `def-s-holds-on-region`
- `def-pstatement` -> `def-p-base-s1`
- `def-pstatement` -> `def-p-base-s2`
- `def-pstatement` -> `def-p-induction-step-critic`
- `def-s-holds-of-discriminant-nonpos` -> `def-p-induction-step-critic`
- `def-pstatement` -> `def-p-holds-critic`
- `def-discriminant-nonpos-iff` -> `def-p-holds-critic`
- `def-discriminant-in-k-matches-in-d` -> `def-p-holds-critic`
- `def-p-base-s1` -> `def-p-holds-critic`
- `def-p-base-s2` -> `def-p-holds-critic`
- `def-p-induction-step-critic` -> `def-p-holds-critic`
- `def-p-holds-critic` -> `def-p-holds-critic-general`
- `def-discriminant-factorization` -> `def-matchingdual-scalarcore-award`
- `def-discriminant-nonpos-iff` -> `def-matchingdual-scalarcore-award`
- `def-s-holds-on-region` -> `def-matchingdual-scalarcore-award`
- `def-p-holds-critic-general` -> `def-matchingdual-scalarcore-award`
- `def-afac` -> `def-afac-split`
- `def-bfac` -> `def-bfac-split`
- `domain-nat` -> `def-extra-eq`
- `domain-poly` -> `def-extra-eq`
- `def-afac-split` -> `def-reflection-identity-poly`
- `def-bfac-split` -> `def-reflection-identity-poly`
- `def-extra-eq` -> `def-reflection-identity-poly`
- `domain-nat` -> `def-region-le`
- `def-region-le` -> `def-partner-spec`
- `def-ishard` -> `def-partner-spec`
- `def-partner` -> `def-partner-spec`
- `def-partner` -> `def-partner-injon`
- `def-pstatement` -> `def-term-sign`
- `def-wcoef` -> `def-term-sign`
- `def-coeffnonneg` -> `def-coeffnonneg-add`
- `def-coeffnonneg` -> `def-coeffnonneg-zero`
- `def-coeffnonneg` -> `def-coeffnonneg-sum`
- `def-coeffnonneg` -> `def-coeffnonneg-mul`
- `def-coeffnonneg` -> `def-coeffnonneg-one`
- `def-coeffnonneg-mul` -> `def-coeffnonneg-prod`
- `def-coeffnonneg-one` -> `def-coeffnonneg-prod`
- `def-coeffnonneg` -> `def-coeffnonneg-smul`
- `def-coeffnonneg` -> `def-nonneglinfac`
- `def-bfac` -> `def-nonnegbfacfn`
- `def-coeffnonneg-prod` -> `def-nonnegbfacfn`
- `def-nonneglinfac` -> `def-nonnegbfacfn`
- `def-afac` -> `def-nonnegafacfn`
- `def-coeffnonneg-prod` -> `def-nonnegafacfn`
- `def-nonneglinfac` -> `def-nonnegafacfn`
- `def-njterm` -> `def-nonnegeasyterm`
- `def-ishard` -> `def-nonnegeasyterm`
- `def-coeffnonneg-smul` -> `def-nonnegeasyterm`
- `def-nonnegafacfn` -> `def-nonnegeasyterm`
- `def-nonnegbfacfn` -> `def-nonnegeasyterm`
- `def-coeffnonneg-mul` -> `def-nonnegeasyterm`
- `def-njterm` -> `def-nonnegpairedblock`
- `def-reflection-identity-poly` -> `def-nonnegpairedblock`
- `def-term-sign` -> `def-nonnegpairedblock`
- `def-coeffnonneg-smul` -> `def-nonnegpairedblock`
- `def-nonnegafacfn` -> `def-nonnegpairedblock`
- `def-nonnegbfacfn` -> `def-nonnegpairedblock`
- `def-coeffnonneg-mul` -> `def-nonnegpairedblock`
- `def-nj` -> `def-nj-nonneg`
- `def-region-le` -> `def-nj-nonneg`
- `def-ishard` -> `def-nj-nonneg`
- `def-partner` -> `def-nj-nonneg`
- `def-partner-spec` -> `def-nj-nonneg`
- `def-partner-injon` -> `def-nj-nonneg`
- `def-coeffnonneg-add` -> `def-nj-nonneg`
- `def-coeffnonneg-sum` -> `def-nj-nonneg`
- `def-nonnegeasyterm` -> `def-nj-nonneg`
- `def-nonnegpairedblock` -> `def-nj-nonneg`
- `def-p-holds-critic-general` -> `def-nj-nonneg`
- `def-partner-spec` -> `def-partner-mem-range`
- `def-nj` -> `def-nj-nonneg-general`
- `def-region-le` -> `def-nj-nonneg-general`
- `def-partner-spec` -> `def-nj-nonneg-general`
- `def-partner-injon` -> `def-nj-nonneg-general`
- `def-coeffnonneg-add` -> `def-nj-nonneg-general`
- `def-coeffnonneg-sum` -> `def-nj-nonneg-general`
- `def-nonnegeasyterm` -> `def-nj-nonneg-general`
- `def-nonnegpairedblock` -> `def-nj-nonneg-general`
- `def-p-holds-critic-general` -> `def-nj-nonneg-general`
- `def-nj-nonneg-general` -> `def-nj-nonneg-is-instance`
- `domain-nat` -> `hyp-hkd`
- `domain-nat` -> `hyp-hregion`
- `domain-nat` -> `hyp-hjm`
- `hyp-hkd` -> `conclusion`
- `hyp-hregion` -> `conclusion`
- `hyp-hjm` -> `conclusion`
- `def-nj-nonneg-general` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `classical_allowed`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `source-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `source-informal-proof`: `INFORMAL-PROOF.md` (match)
- `source-originating-award-scalarcoreimport`: `SOURCE/originating-award-ScalarCoreImport.lean` (match)
- `source-originating-critic-u1-f-criticf`: `SOURCE/originating-critic-U1-F-CriticF.lean` (match)
- `source-originating-critic-u1-t-criticgeneralj`: `SOURCE/originating-critic-U1-T-CriticGeneralJ.lean` (match)
- `source-originating-seat-u1-main`: `SOURCE/originating-seat-U1-Main.lean` (match)

## Validation Notes

- Errors: none
- Warnings: none
