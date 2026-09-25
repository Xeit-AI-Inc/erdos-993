# Formalization Fidelity Review

- Run: `lean-2026-09-24-c2-primary-v2`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `207581e5d709708cd69c0f056cf1dfb12aa4e94c8174f2ef5e90b2669cafad25`
- Contract projection SHA-256: `9813b0e43426c673dab9a7059c2a193fb8cc37f7ee8995a500fe8075802d90c1`
- Lean binding projection SHA-256: `9ac2a8cbcbbdd532fd46c184956cf6f98cb5968e15ee135a914879a2c642c49e`
- Contract source SHA-256: `61029a5001c862684a6e8b8e96cced4af2b0e48353183a00b95efe5272cad61e`
- Lean source SHA-256: `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`
- Kernel receipt SHA-256: `9f54b701ca390dad51f95a765790049db0cb2789e5d0cd422b15816093850eaf`

## Check Counts

- Passed checks: 33
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `documentation` `independent_review` (independent_reviewer, `d457fba041dfe95f`): The inherited C5LA1.aggregate docstring calls it a top-rank residual aggregate, but its Lean body is rank-generic, has no residual premise, and the primary theorem instantiates it at indepNum - 2. This stale comment does not change the theorem meaning. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `interior-c2-fidelity-reviewer` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `interior-c2-primary-fidelity-v2`
- Completed: `2026-09-25T01:13:40Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
