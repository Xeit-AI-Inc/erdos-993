# Formalization Fidelity Review

- Run: `lean-2026-09-28-c6-surplus-tail`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `7fb4a5f4c63896d4f932621231ae6f43da8652c3faa888ac8375ed9e0c500d8e`
- Contract projection SHA-256: `67ea0d7341fdff6f44428166547bb7a59cdc3c2ed13119804f0f41ee794ccc21`
- Lean binding projection SHA-256: `fa1e4fad7afcfdccacca514ed178ee0aa5b819eda1088e6edaaa7daee8273d17`
- Contract source SHA-256: `01cdacd246c3f41d099eba4e7b88ecd72c8442ca20f1cf7ff4940a0f0771699d`
- Lean source SHA-256: `5cb8504d9461fec67f54f045c184c34d4896c14b8fa0e62ce1effcefaf433bfc`
- Kernel receipt SHA-256: `839743e9d51ee55dfd326cdad134cf1676c434e701c8753814d514574ea12e64`

## Check Counts

- Passed checks: 34
- Failed findings: 0
- Warnings: 1

## Findings

- `warning` `scope` `independent_review` (independent_reviewer, `de7ca4e27d270e6e`): The theorem covers only m>=100. It does not formally verify the registered all-m key or the endpoint, shifted comparison, MASS, payment, arbitrary-tree, or Erdos993 claims. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `claim_binding` `independent_review` (independent_reviewer, `95284c3592d88f23`): The six literal real-polynomial definitions, exact theorem statement, elaborated terminal type, and registered declaration bind to the m>=100 guarded tip surplus without extra hypotheses. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `input_integrity` `independent_review` (independent_reviewer, `723eab2bbfffd55f`): All 331 sealed input hashes match; both independently recomputed audit projection digests match the immutable fingerprints. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_evidence` `independent_review` (independent_reviewer, `1f1ff10ca8a352b6`): Sealed kernel evidence binds the unchanged Main.lean source, reports build and single-file success, and prints only propext, Classical.choice, and Quot.sound. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `mathematical_coverage` `independent_review` (independent_reviewer, `2ca64c2393b46285`): The full finite-block specialization, strict high-band payment, low-band zero-extended minor proof, support and denominator checks, and even/odd inclusive endpoints cover every allowed labeled profile and marked branch. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `proof_fidelity` `independent_review` (independent_reviewer, `08855008332577d3`): All 138 entry bodies match their registered snippets and proposals; the 42 reused Jensen bodies match the sealed source, and real-ring ratio and center bridges are explicit. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `review_limit` `independent_review` (independent_reviewer, `9c97d977e34ae61c`): Lean was not rerun and external canonical run and package files were not read, as required by the dispatch; this review uses the immutable sealed snapshot and its kernel evidence. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `C6-TAIL-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c6-tail-fidelity-a6dffc7a-953d-471a-a0c3-e493a33ff4be`
- Completed: `2026-09-29T05:02:42Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
