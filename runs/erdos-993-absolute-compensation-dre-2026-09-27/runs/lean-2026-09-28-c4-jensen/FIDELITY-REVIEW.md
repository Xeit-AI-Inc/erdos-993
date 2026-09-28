# Formalization Fidelity Review

- Run: `lean-2026-09-28-c4-jensen`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `a634564dca571ee0e4b6e5beb85506bf32b8c0a484cd46b7b2d486bcc0c0f6c5`
- Contract projection SHA-256: `4833471dc44420a2e238632ecc63d997c5d6a84e1bfa2bb059c1cb40f17eeb53`
- Lean binding projection SHA-256: `70fc087c01c3d592cf9172da6f05ab3897ed18e7918a062360079316bf5e3668`
- Contract source SHA-256: `8a2b91971f0ca4348b7155b6b5d99a5d6a2147e5cbd18f39ec60250169aa0ff9`
- Lean source SHA-256: `a0f07019b366cb194ddd031df0f9f963f2a051f548354349e016aceab6d23e3f`
- Kernel receipt SHA-256: `63dd892ef289d48dbadc8e5c7c7c9284132387f05874b9e2507f2b59b0a54c29`

## Check Counts

- Passed checks: 36
- Failed findings: 0
- Warnings: 1

## Findings

- `warning` `fingerprint-artifact` `independent_review` (independent_reviewer, `c653d14c7a7a4697`): EVIDENCE/fidelity-fingerprints-before-review.json is absent from the snapshot and input manifest. Both projection digests were independently recomputed from the sealed fidelity-audit-input-before-review.json, but could not be compared with that requested fingerprint artifact. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `actual-subset-counting` `independent_review` (independent_reviewer, `5ab6d1414049501d`): The proof derives count-vector fibers from a Sigma-block subset equivalence, their product-of-binomial cardinality, and the guarded one-block hypergeometric marginal through an inside/outside bijection on actual powersetCard subsets. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions-and-statement` `independent_review` (independent_reviewer, `20431880298323c5`): The six global definitions match SOURCE/ENCODING-SPEC.lean byte for byte as declaration text; the complete theorem signature matches SOURCE/EXPECTED-STATEMENT.txt and the contract, with all three conjuncts. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `identity-and-kernel-binding` `independent_review` (independent_reviewer, `cea951851700b69a`): The registered key E993-FINITE-BLOCK-COEFFICIENT-JENSEN-DOMINATION has the same scope; the sealed Main.lean source SHA-256 matches the audit binding and kernel receipt, and the recorded axioms are exactly propext, Classical.choice, Quot.sound with matching dependency revisions. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `jensen-and-taylor` `independent_review` (independent_reviewer, `b5cfd91ca0ac6bfb`): The final proof applies finite Jensen to the actual uniform subset sum, uses positive supported binomial denominators and the scalar log bound, proves the displayed exponent equals the actual marginal average, and proves every nonnegative Taylor floor for arbitrary d. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `review-limitation` `independent_review` (independent_reviewer, `3e6e9de59395a1c1`): No Lean build was run by instruction. Kernel verification is assessed from the sealed source, build and axiom logs, and kernel receipt; this review independently checks formalization meaning rather than rerunning the kernel. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `sealed-inputs` `independent_review` (independent_reviewer, `7ba660a3f778148c`): All 125 input-manifest members and both dispatch-manifest members match their sealed SHA-256 hashes. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `C4-JENSEN-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `e993-c4-jensen-fidelity-ee0f7906-5e8c-47bc-9f0c-a40e105a8fcf`
- Completed: `2026-09-28T11:32:35Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
