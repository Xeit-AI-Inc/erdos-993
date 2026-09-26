# Formalization Fidelity Review

- Run: `lean-2026-09-25-c3-first-shell`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `77c2a81304e225f47a42805736bd1b1a3b00245b2474aa3ef66d01254de79286`
- Contract projection SHA-256: `0112514a50fec2648b0edd08d8f825d41ead752f4300caa3c178f7e17e644caf`
- Lean binding projection SHA-256: `5c3bba04b2202aae3adc85f29132ed26403e7372e652a7b3b01ce0d98251c657`
- Contract source SHA-256: `1cf37db1ec45656b89d7b0fece737ec60cfc3f5f081707ae2d6c2c4d8fc8e122`
- Lean source SHA-256: `0397b7bedd1ff695d8debd73a24cff430434e88f2d9ac56c49459843d155f17f`
- Kernel receipt SHA-256: `a916df3baf4e440df0a62e7dede1ac7718882d37caa2d5192cbbec21928b9e89`

## Check Counts

- Passed checks: 34
- Failed findings: 0
- Warnings: 0

## Findings

No fidelity findings.

## Independent Review

- Reviewer: `C3-LA1-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c3-la1-first-shell-fidelity-v1`
- Completed: `2026-09-26T03:51:25Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
