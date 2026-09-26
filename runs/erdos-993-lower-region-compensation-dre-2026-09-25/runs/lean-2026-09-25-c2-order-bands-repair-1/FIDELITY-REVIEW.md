# Formalization Fidelity Review

- Run: `lean-2026-09-25-c2-order-bands-repair-1`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `9e3c6e7c2cff707b5191734ca43318991b77b69db02203d8ae71474c1a825189`
- Contract projection SHA-256: `532b436e602a23cddd070ad1e78d963a10585510df244b6efd6386d07ecc212f`
- Lean binding projection SHA-256: `d18f0a71642336ef1cc4e23b989a52da025b621d96094cdb4190364430028a2b`
- Contract source SHA-256: `2ce40be51ec0024f796cbd8bcc190fc0e577b2137cadced4512ed6d65620656b`
- Lean source SHA-256: `a45f8e2e218d27d528e2513e5cb8413d38780d9e6c01f8c34b171366f0bf3bde`
- Kernel receipt SHA-256: `2323b5f2c76c322d0f61c1b7c8dd4f9dbfe7d26bbe44d6862bfe44e0f46fae9f`

## Check Counts

- Passed checks: 38
- Failed findings: 0
- Warnings: 1

## Findings

- `warning` `review_scope` `independent_review` (independent_reviewer, `df9a2730ec588c43`): This is a proposal for the exact two-conjunct theorem and pinned evidence. Lean and the authoritative fidelity audit were not rerun; external shared-package files were outside the listed sources, and the contract still marks broader formulation status open. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `contract_binding` `independent_review` (independent_reviewer, `9931356cdbb06304`): The v3 contract, fidelity input, theorem-contract receipt, and actual E993OrderBand.markedIsolateAndOrdinaryLeafOrderBand header agree. The v2-to-v3 rebinding changes header spelling while preserving the post-colon theorem type and the informal claim. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `fingerprint_canonicalization` `independent_review` (independent_reviewer, `227aac06786012ab`): Both projection hashes were freshly recomputed. The earlier raw-section discrepancy is canonicalization: the audit script hashes sorted compact UTF-8 JSON with a terminal newline, and the binding projection wraps lean_binding together with kernel_evidence. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `generic_semantics` `independent_review` (independent_reviewer, `d5d1fad54b6afd76`): IsolateCovered marks every original graph isolate; markedCount counts each independent set meeting W once. The relative incidence proof and bad/good correction yield q_(k+1) <= q_k for every finite graph under exactly k >= 2 and |V| <= 2k+1. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_contract_pins` `independent_review` (independent_reviewer, `0f23d5efad4182bf`): The source and contract hashes, verified kernel receipt hash, reported allowed axioms, toolchain and log hashes, 10 dependency rows, and nine manifest revisions agree with the listed pinned evidence. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `leaf_semantics` `independent_review` (independent_reviewer, `7f02bece5cb8b432`): IsGraphLeaf and support use original adjacency; H deletes the leaf and support, R deletes the original closed neighborhood of the support. Tree connectivity covers isolates of T-H, and the exact all-rank count split turns the marked inequality at k=p-1 into the stated integer forward-difference inequality. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `source_integrity` `independent_review` (independent_reviewer, `e52c08f24d6ff89c`): All 184 brief-listed files matched their SHA-256 pins. The actual Main.lean header, its namespace, all 43 registered entry bodies, and eight inherited definitions were compared with the pinned fragments. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `C2-LA1-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c2-la1-order-band-fidelity-v3-r2`
- Completed: `2026-09-25T09:47:29Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
