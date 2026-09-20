# Formalization Fidelity Review

- Run: `lean-2026-09-20`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `9664dc3a159864be738225e651f2db5de8d44f8fe97b07ea4294c9ed59e0bafa`
- Contract projection SHA-256: `9fb36ddcd847e9e2e1103ad76638ef62e293b362208922cb7794a6f9bfb49966`
- Lean binding projection SHA-256: `d84970ae9a85d41396bcf897ef04f1acf9f5c54ebd251589fd7463d564997360`
- Contract source SHA-256: `cefa43a16f47adb113e623795665555250830fd3465be6d8b7b1377b76e87327`
- Lean source SHA-256: `beabf73950968ea22e71fb7b02a946eb849b7cdce3a0541fa80a59f7bc485d89`
- Kernel receipt SHA-256: `8417c0a5d551d4729a61440405f40df3b9acfff3a44550af34e7b143dba48cc2`

## Check Counts

- Passed checks: 76
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `graph_counts_and_bridges` `independent_review` (independent_reviewer, `b0fdce26a5c6dff8`): indepCount counts actual independent Finset vertex subsets once; Nat.card G.edgeSet counts actual unordered Sym2 edges. The disjoint-edge incidence argument and the center/triangle subset-count bridges prove their graph premises internally before invoking arithmetic adapters; no count or incidence formula remains a terminal hypothesis. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `ordinary_g1_fidelity` `independent_review` (independent_reviewer, `96ead07b86eaab6c`): All ten ordinaryG1Guards components and original-tree neighborhood survivor subtypes are preserved. The only added corollary hypothesis is residualOrder=2*p-2. The crossing guard proves p>=3 and the source proves the exact natural-to-integer p-2 conversion and residual order 2*(p-2)+2. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `projection_and_registration_boundary` `independent_review` (independent_reviewer, `984a181e8e13b94b`): The original audit module recomputes both sealed fingerprints and returns 76 deterministic checks without findings. Flat copied projection descriptions and the disclosed spelling-only registration adapter were not treated as mathematical proof; semantic scope and graph identifications were reviewed in the complete source. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `rank_and_first_descent` `independent_review` (independent_reviewer, `a2bee30bca5f2f02`): Coefficient extension and differences use integers, including vanishing negative ranks. The first strict negative difference exists for every finite graph. Rank one and history index zero are covered explicitly, and positivity includes the upper endpoint. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `review_limit` `independent_review` (independent_reviewer, `b76c482eae7f3c74`): This independent match verdict applies only to the frozen first-wide classification/history and literal G1 corollary. It makes no unrestricted G1, larger-size, forest-unimodality, RTree transport, novelty, or publication claim. Canonical audit and workflow closeout remain controller-owned. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `statement_scope` `independent_review` (independent_reviewer, `d327d3f660d0bf30`): The exact terminal declaration has three separately universal branches over arbitrary finite vertex types and ordinary SimpleGraph values. Classification and exceptional history have no forest, connectedness, first-descent, degree, rank-cap, LC, unimodality, or numerical-comparator assumptions beyond the frozen branch premises. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `supporting_crossing_lemma_scope` `independent_review` (independent_reviewer, `8717971d943f7dc1`): Registered firstWide_crossing_sign proves delta_r<=0 for every finite ordinary simple graph of order 2*r+2 with natural r>=1 and firstDescent G<r, without a forest or G1 premise. It is a supporting graph consequence of this contract and does not itself create another contracted theorem or automatic separate award. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `C2-LEAN-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `C2-LEAN-FIDELITY-cf401c09-2ea6-4af6-83bd-595e1f7e6a39`
- Completed: `2026-09-20T07:09:56Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
