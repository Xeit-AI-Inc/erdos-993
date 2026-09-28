# Formalization Fidelity Review

- Run: `lean-2026-09-28-c2-rank`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `6bc5338ca02483d62b69ae33559fd8a5a09228eb4c0fc45e78879fde09aa3b4b`
- Contract projection SHA-256: `4d70c464fbca6879e64347aae5ab27a283ce093e0078dc1db27e600237bf1ca8`
- Lean binding projection SHA-256: `5f6a4b87f952959f1ec7a09405835d0dafac3191044673e1aaff94a1dbfb8deb`
- Contract source SHA-256: `3d75ed4dd1d160b2652f1a221d779a2b84ddd9c81aad62b122c2df4a65a209e3`
- Lean source SHA-256: `2ca135236c2178f88235e54163a1ed09fee051e20075a8d901ac10cde76888d2`
- Kernel receipt SHA-256: `6e7ccbf50db3c363654d612a9372da354a818d040d554c1085cc5287c16b536b`

## Check Counts

- Passed checks: 24
- Failed findings: 0
- Warnings: 1

## Findings

- `warning` `projection_digest_method` `independent_review` (independent_reviewer, `7832de1064f56c9f`): The permitted materials supply the two fingerprint digest values but not their projection-preimage algorithm. I independently compared the current contract and binding facets and exact source/receipt hashes before copying the digests, but cannot claim independent recomputation of the projection SHA-256 values. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `byte_binding_and_kernel_evidence` `independent_review` (independent_reviewer, `7e03e665127ca8f9`): All 57 dispatched files within the permitted reading scope match their SHA-256 values. Current contract, source, Main, snippet, audit-input, and kernel-receipt cross-hashes agree. The kernel evidence reports successful checks of this Main hash with exactly propext, Classical.choice, and Quot.sound; Lean was not rerun. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `claim_identity_scope` `independent_review` (independent_reviewer, `77779c5013b7fa57`): This exact coefficient lemma warrants a separate identity proposal. It proves only the first-descent rank clause of the existing composite first-descent/ratio key and neither its ratio clauses nor a graph, MASS, payment, or primary result. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `exact_statement_and_semantics` `independent_review` (independent_reviewer, `e3872b60d60e42cf`): The current Lean theorem and e993RankParent definition match the exact contract: all finite arity-2/3/4 lists including empty and repeated entries, every natural strict coefficient descent with zero extension, rational polynomial coefficients, and natural conclusion 2*rs.sum <= 5*k. The proof adds no premise or encoding trick. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `registration_whitespace` `independent_review` (independent_reviewer, `bf87188280d262c5`): Each of the two adapted definitions differs from its original proposal only by a newline between noncomputable and def; the registered tokens and theorem statement are unchanged. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `spread_witness_metadata` `independent_review` (independent_reviewer, `6692634df2d75e6f`): The recorded normalized spread witness has m=23 and N=82, giving ordinary path-star order N+m+3=108. This supports proposed witness-order metadata without a global minimality claim or a status change. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `C2-RANK-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `C2-RANK-FIDELITY-20260928T063131Z-5b8e1f7c`
- Completed: `2026-09-28T06:32:33Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
