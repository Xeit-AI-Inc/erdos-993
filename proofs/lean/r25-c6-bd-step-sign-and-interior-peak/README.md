# r25-c6-bd-step-sign-and-interior-peak

Declaration `ErdosR25C6U2.bdStepSign_interiorPeak_award`, exported byte-for-byte from the sealed internal run
`erdos-993-uniform-residual-no-recovery-dre-2026-09-20` (`runs/lean-2026-09-22-c6-bd-step-sign-interior-peak`; see
[`experiments/r25-uniform-residual-no-recovery.md`](../../../experiments/r25-uniform-residual-no-recovery.md)).
Cycle 6 award `C6-LA4`; registry identities `E993-R25-D-ROW-STEP-SIGN-LAW`, `E993-R25-BD-INTERIOR-PEAK-CATALAN-BOUND`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem bdStepSign_interiorPeak_award :
    (∀ m g : ℕ, g < m → 1 ≤ m →
        (m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
            * (D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) - D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ))
          = Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
              * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ))) ∧
    (∀ m g : ℕ, 7 ≤ m → g ≤ m →
        2 * (m : ℤ) ≤ (g : ℤ) ^ 2 - (g : ℤ) →
        ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * (m : ℤ) →
        D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ))
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope
fences and attribution are part of it):

> The explicit conjunction of two theorems over Z-valued functions of naturals m,g, with D(b,m) = C(b,m+1) - 2C(b,m) + C(b,m-1) the zero-extended integer binomial ranged object (SEMANTIC-CONTRACT.md zero-extension convention): (1) D_step_sign, the UNCONDITIONAL D-level step-sign law: for naturals g<m, 1<=m, m*(2m-g)*(D(2m-g-1,m)-D(2m-g,m)) = C(2m-g,m-1)*(2m-g^2+g); this together with peak_bracket_integral is the registered VERIFIED E993-R25-D-ROW-STEP-SIGN-LAW verbatim (both conjuncts) -- a GRADE CHANGE proved_informal -> formally_verified with its Cycle 5 critic attribution (C-U2-T, C-U2-F) preserved; (2) interior_peak_le_cat, the interior peak bound: for naturals 7<=m, g<=m with g^2-g>=2m and (g-1)^2-(g-1)<2m (g supplied as a WITNESS of these two inequalities, never asserted to exist -- precisely the distinction that makes D_unimodal_peak false and this true), D(2m-g,m) <= catalan(m-1); this is NEW content with no registered predecessor and takes the new key E993-R25-BD-INTERIOR-PEAK-CATALAN-BOUND. SCOPE (mandatory fences, per Cycle 6 synthesis Dispatch 4): fixed-band d=5 ARITHMETIC; no graph object occurs anywhere in the corpus; D, N, L, R are the seat's integer functions over Z with zero extension; 'unimodality' here is of the integer function g |-> D(2m-g,m) and is DERIVED from a sign identity, importing no shape premise on any i_k; this raises NOTHING else -- not E993-R25-BD-TAIL-NEGATIVE (the top-level Bd(r,r) < 0, NOT carried), not E993-R25-FOURTH-BAND-CLOSE-ALL-R, and no MaR/BdRR/[6,14]-layer object is carried into this award. Attribution: seat U2 for nodes 1, 2a, 4, 5, 6, 7; critic C-U2-F for node 2b and the interior peak bound; node 2b independently compiled by critic C-U2-T (joint attribution on that node).

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
