# Formalization Fidelity Review

- Run: `lean-2026-09-20-c3`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `5b0ec7520846fd401b4b40862f60e2f4ec15ce9ef5c87cefdc704126bd3dd7c7`
- Contract projection SHA-256: `0e14c466f5ab8a4c182e293556416feee24ae90784950cf8c8f5ca6c61145efe`
- Lean binding projection SHA-256: `2dcbeac93b5b81d82a7ec6174741f4be1f97360a897cd1bec3928748152943c6`
- Contract source SHA-256: `4bc0bea5fa8e1e22e4c5ae16de395f66c4a8671ccd75483ca611a433827ec5df`
- Lean source SHA-256: `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`
- Kernel receipt SHA-256: `14e70b56dedb0fa2839f79a8d4c8b99a889a65f3021b405a39447ea9c23f0dfa`

## Check Counts

- Passed checks: 63
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `actual_counts_and_indices_verified` `independent_review` (independent_reviewer, `1e7f5613619d1c2d`): The full definition prefix and relevant Mathlib definitions use actual independent Finset subsets counted by Nat.card, integer zero extension, and the least natural strict negative difference. Finite descent-set nonemptiness is proved from maximum independent-set support. The residual is the induced survivor graph after deleting both original T closed neighborhoods, and p>=3 reconciles natural and integer subtraction internally. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `frozen_evidence_and_dependency_identity_verified` `independent_review` (independent_reviewer, `006749a51700b6c2`): The frozen source and contract hashes, 187 registered entries (14 definitions, 172 lemmas, one theorem), unchanged 135-entry C2 prefix, actual verified kernel receipt, and axiom output match. All ten dependency projections match actual nine package Git heads and marker hashes plus Lean 4.32.2 and Lake binary hashes; tracked package trees are clean. Package content hashes identify canonical identity objects, not full package-tree hashes. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `internal_graph_bridges_verified` `independent_review` (independent_reviewer, `a49f3f25c34f49f4`): The forest matching-or-cover certificate, actual five-edge deletion incidences, all-r positive integer weight identities, actual cover-subset counting bijection, Catalan floors, and all pre-r small-rank cases are proved inside the selected source chain. No matching, cover, count identity, log-concavity, unimodality, or target-sign assumption has been added to the terminal theorem. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `semantic_scope_verified` `independent_review` (independent_reviewer, `c809990550ba0025`): The actual terminal declaration is the conjunction of the two separately universal contract outputs: every finite ordinary forest with r>=1, order 2*r+4 and firstDescent<r has delta_r<=0; every full ordinary G1 tuple with original residualOrder=2*p has delta at integer(p)-2<=0. All ten original G1 guards are preserved. No unrestricted G1, RTree transport, or next-band theorem is concluded. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `C3-LEAN-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `C3-LEAN-FIDELITY-1c3147dc-e8cf-4302-bd7a-517af833c5af`
- Completed: `2026-09-20T14:35:02Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
