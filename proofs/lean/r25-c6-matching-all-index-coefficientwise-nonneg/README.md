# r25-c6-matching-all-index-coefficientwise-nonneg

Declaration `ErdosR25.E1CoeffWise.Nj_nonneg_all_index`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-22-c6-matching-all-index-coefficientwise`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 6 award `C6-LA3`; registry identity `E993-R25-MATCHING-ALL-INDEX-COEFFICIENTWISE-NONNEG`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem Nj_nonneg_all_index {m K d : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) :
    ∀ j ≤ m, CoeffNonneg (Nj K m j)
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> Coefficientwise-in-t nonnegativity of the certificate-dual polynomial N_j, for EVERY index j <= m (clause (a) only of E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY). For every m, K, d : Nat with K + d = 2m and the chartered region 3d <= 2m+2: for every j <= m, the Polynomial Z object Nj K m j = sum_{i<=j} (K+1-2i) * 2^i * C(m,i) * A_i(t) * B_i(t) (A_i(t) = prod_{l<i}(t+K+1-l), B_i(t) = prod_{i<l<=j}(t+l)) has every coefficient >= 0. Uniform in d, m AND j; no horizon, no census; no ν, τ, x(F) < r anywhere; no SimpleGraph, indepCount, delta, or firstDescent occurs anywhere in the corpus -- the sixth award's PStatement and P_holds_critic_general are imported byte-identically and never re-proved. The rank substitution t = r - K: since the Polynomial Z statement is substitution-free, coefficientwise nonnegativity implies 0 <= (Nj K m j).eval t for every integer t >= 0, in particular at t = r - K for every r >= K; on the region m <= K+1 (region_le), so r >= K already implies the standing condition r >= m-1 that E993-R25-CLAMPED-DUAL-DOMINATION needs. No Lean identifier in this project mentions r. SCOPE (mandatory fences): this discharges CLAUSE (a) ONLY of E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY; clause (b) (mu_j^g(t) >= 0, denominator positivity, clamp persistence) is formalised NOWHERE, so the registered claim as a whole stays proved_informal -- 'the coefficientwise positivity lemma is formal' must never be shortened to 'the all-index dual positivity claim is formal'. The j = m instance IS the sufficiency half of the separately registered E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF (Q_{m,d} = m! * N_m); two registry keys, not one. The CONVERSE half of that iff is NOT formalised. This bears NOT AT ALL on E993-R25-MATCHING-BRANCH-UNIFORM-SIGN, which stays OPEN. The region 3d <= 2m+2 is exactly sharp (off-region witness (m,d) = (1,2): N_1 = -t-1) -- evidence, not on the theorem's own face. No graph, forest, G1 tuple, tier, FOREST, TREE, TRANSFER or Erdos #993 statement occurs anywhere. Attribution: seat U1 for the apparatus and the j = m assembly; the general-j lift critic-attributed jointly to C-U1-T and C-U1-F (independently); the imported sixth award's induction step is C-U1-F (primary, toolkit-free)/C-U1-T (induction-principle scaffold) of Cycle 5, already on that award's own face.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`
(pinned in `source/lakefile.toml` and `source/lake-manifest.json`; the package cache is not
shipped — bind a local Mathlib checkout at that revision, never `lake update`). Axioms
exactly `[propext, Classical.choice, Quot.sound]`; no `sorry`/`admit`/`native_decide`.
Governed workflow: frozen theorem contract (`THEOREM-CONTRACT.yaml`, rendered
`THEOREM-CONTRACT.md`), independent informal proof-integrity audit (`INFORMAL-AUDIT.md`; the
formalizer's `INFORMAL-PROOF.md`), kernel/axiom receipt and independent statement-fidelity
attestation (`FIDELITY-REVIEW.md`, verdict `passed`), canonical close
(`VERIFICATION-REPORT.md`, `formally_verified`). Digests and verdicts are in
`receipts/RECEIPT-SUMMARY.json`; full receipts stay in the sealed internal run. Internal
grade `formally_verified`; published as `verified`. Claim boundary: Lean kernel validity plus
independent statement fidelity — nothing about Tier 1, Tier 2, any Tier 3 schema, FOREST,
TREE, TRANSFER, or Erdős #993.
