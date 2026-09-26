# Formalization Fidelity Review

- Run: `lean-2026-09-25-c3-first-shell-repair-2`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `8a0c5507da661c86f590e161bf64f875f67b78b55ff6080f371f075b4b73bc87`
- Contract projection SHA-256: `6cb09e2598faa16463e2845cf9fb29a24cfb45aca127ab0a256e21f20193f737`
- Lean binding projection SHA-256: `973fe099721eca7999fcff8c59f6f26321aa71b5708cd4a41ed4790f66d25e61`
- Contract source SHA-256: `1cf37db1ec45656b89d7b0fece737ec60cfc3f5f081707ae2d6c2c4d8fc8e122`
- Lean source SHA-256: `0397b7bedd1ff695d8debd73a24cff430434e88f2d9ac56c49459843d155f17f`
- Kernel receipt SHA-256: `5131d0578a565c41322b9621c7e983c9619dc7c8d498662505d09aef9148c2d3`

## Check Counts

- Passed checks: 34
- Failed findings: 0
- Warnings: 0

## Findings

No fidelity findings.

## Independent Review

- Reviewer: `C3-LA1-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c3-la1-first-shell-repair2-fidelity-v1`
- Completed: `2026-09-26T04:14:11Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
