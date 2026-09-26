# Formalization Fidelity Review

- Run: `lean-2026-09-25-c3-first-shell-repair-1`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `19966f904d0081f9b9c4983ded9d74e7d69c64febd767a44a64eb2a9f09fcd8e`
- Contract projection SHA-256: `0112514a50fec2648b0edd08d8f825d41ead752f4300caa3c178f7e17e644caf`
- Lean binding projection SHA-256: `90e05e93c46e6309f4931f85d61268cbeeffceff7f71b831aedd80df1e602aad`
- Contract source SHA-256: `1cf37db1ec45656b89d7b0fece737ec60cfc3f5f081707ae2d6c2c4d8fc8e122`
- Lean source SHA-256: `0397b7bedd1ff695d8debd73a24cff430434e88f2d9ac56c49459843d155f17f`
- Kernel receipt SHA-256: `0dbcddc48cf6b7127d1cac84e39708183e804aae6615c38ceee2c2884830d759`

## Check Counts

- Passed checks: 34
- Failed findings: 0
- Warnings: 0

## Findings

No fidelity findings.

## Independent Review

- Reviewer: `C3-LA1-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c3-la1-first-shell-repair1-fidelity-v1`
- Completed: `2026-09-26T04:03:02Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
