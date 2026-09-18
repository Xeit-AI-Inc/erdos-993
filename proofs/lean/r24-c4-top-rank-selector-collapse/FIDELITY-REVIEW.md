# Formalization Fidelity Review

- Run: `lean-2026-09-15-c4-top-rank-selector-collapse`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `f41a661e85a05d6876e19e7df73451dd1b39147f5a574726e421028930f08029`
- Contract projection SHA-256: `e76aba81b6680d44289db33434c7ab01aec35740d87e9c263589e638b17d55a8`
- Lean binding projection SHA-256: `026498570b08b8fdd9c5661ece66191c435743cf74d9b4b6c08e9093081a6a9b`
- Contract source SHA-256: `9faa81ad73f1dec562b84a8c9a3173ff2b1565ff4b3f80c350d6f297d3358090`
- Lean source SHA-256: `e2bc48690fe44b769687461ac8bfad867b6710cca93c6de81bd1ac7ad05d253a`
- Kernel receipt SHA-256: `760881ace78c6f74ae1c2f1252bbc9c3f4887c4c5360cd92ea445d5c9310644c`

## Check Counts

- Passed checks: 25
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `binders_quantifiers_hypotheses_conclusion` `independent_review` (independent_reviewer, `e8ceb71304eb9dec`): The declaration retains the full arbitrary finite V binder form with Fintype and DecidableEq, arbitrary SimpleGraph G, DecidableRel G.Adj, universal v, and the exact IsTree, alpha >= 2, and unique-neighbor leaf hypotheses. Its conclusion is exactly IsFavorableAt G v (G.indepNum - 1). Expected `"semantic fidelity"`; observed `"match"`.
- `note` `definitions` `independent_review` (independent_reviewer, `d0738d961c776177`): All six contracted definitions match the Lean source: indepNum, unique-neighbor leaf, original-vertex-type deletion coefficient, integer forward difference, strict favorability, and Nat alpha-minus-one rank. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `dependencies_kernel_axioms` `independent_review` (independent_reviewer, `9c4d43505c0603b3`): The source imports Mathlib; the pinned Mathlib revision and content hash agree across contract, binding, and kernel evidence. The kernel receipt is verified with passed build, single-file, source-immutability, axiom-policy, and axiom-probe checks. The reported axioms are exactly Classical.choice, Quot.sound, and propext, all permitted by the explicit classical policy. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `expected_statement` `independent_review` (independent_reviewer, `32e26240e43dbd92`): C4LA1.topRankSelectorCollapse matches the contract's exact expected statement, including binder order and all hypothesis and conclusion terms. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `headline_boundary` `independent_review` (independent_reviewer, `2d9ae65e77a4e955`): The reviewed artifacts establish only the per-leaf strict top-rank selector-collapse theorem. They do not establish an aggregate sign, residual inequality or classification, interior-window result, semantic transport, governed-tree result, E993-BETA-AGG, or Erdos #993 headline. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `tree_hypothesis_scope` `independent_review` (independent_reviewer, `ae619bc8bf0b8732`): _hTree : G.IsTree is retained in the exact contracted declaration but unused in the proof body. This proves a stronger internal implication while preserving the stipulated finite-tree theorem without weakening or rescoping its declared claim. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `c4-la1-terra-fidelity-20260915` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `c4-la1-terra-fidelity-attestation-20260915-9967066e-c38b-4e35-8c0d-fa53b4a9bbc0`
- Completed: `2026-09-15T23:27:11Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
