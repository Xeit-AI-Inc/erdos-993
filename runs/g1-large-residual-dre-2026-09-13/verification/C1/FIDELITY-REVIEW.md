# Formalization Fidelity Review

- Run: `lean-2026-09-13`
- Verdict: `passed`
- Fail closed: `false`
- Deterministic precheck: `passed`
- Independent semantic review: `passed`

## Bound Evidence

- Input SHA-256: `6f349f4dfbab202590ddf7a7d2b028a6b730d656d032c4e8169440a110d06a53`
- Contract projection SHA-256: `79b0205289248d5df85681baa468d288d6affcc9e61c7721ddf7ef3d2209abb5`
- Lean binding projection SHA-256: `0c891a44e59db21b1f3645f61016a449b8f8ccb46c852f7039c8e11cb072d9d1`
- Contract source SHA-256: `7b82ab6422d309aa8493dbaa4e4c07dbc097c29d6207f8a2ecb60d0e85c1f686`
- Lean source SHA-256: `32ac508e828f7bccd484acec90b3cb7ea75a0449bd9ee4ff20e8b535566bee85`
- Kernel receipt SHA-256: `3a7ea486e677b3d57b2b9f431fc710639c877cf3bfc5f9bb0bfab343fb094b0c`

## Check Counts

- Passed checks: 65
- Failed findings: 0
- Warnings: 0

## Findings

- `note` `count_identities_discharged` `independent_review` (independent_reviewer, `cd532c4ca5815beb`): The auxiliary theorem at Main.lean:1038-1124 accepts pair/triple identities, but Main.lean:1227-1236 supplies both from proved graph-counting lemmas. Component count, degree-sum bounds, connectedness and maximum degree two are proved internally rather than added as final hypotheses. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `finite_domain` `independent_review` (independent_reviewer, `6c249330f9f55698`): The final classification requires only Finite V and acyclicity in addition to its stated numerical guards. Empty vertex types, disconnected forests and isolated vertices are in scope. Fintype and decidability are introduced inside the proof at Main.lean:1232-1236. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `full_graph_isomorphism` `independent_review` (independent_reviewer, `5e61ecfa88194d4f`): Main.lean:801-883 constructs an isomorphism on all vertices using a spanning longest path and tree minimal connectedness. Mathlib pathGraph 8 has vertex type Fin 8. The P8 counts 20 and 5, and delta 3=-15, are proved at Main.lean:690-715 and transported through an actual graph isomorphism. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `independent_subset_counting` `independent_review` (independent_reviewer, `2f44ec9032283bf5`): Main.lean:10-33 counts actual Finset independent subsets via Nat.card, extends coefficients by zero at negative integers, and defines delta as the next coefficient minus the current one. Main.lean:140-248 proves the required finite support, strict-descent nonemptiness and minimality facts. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `kernel_and_axioms` `independent_review` (independent_reviewer, `b85944ba72ea1858`): The sealed kernel receipt reports verified project and single-file checks on the exact unchanged source. EVIDENCE/axioms.txt:111 reports exactly propext, Classical.choice and Quot.sound, all permitted by the contract. This reviewer did not compile or issue a kernel receipt. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `natural_arithmetic` `independent_review` (independent_reviewer, `b0fa261d64ff32d9`): The guards 2*p-3<Nat.card V and firstDescent F<p-2 use natural subtraction. The G1 conclusion uses the distinct integer index (pT:Z)-2. Cases p<=2 are vacuous because the crossing guard would require a natural to be negative; p=3,4 are excluded by internally derived coefficient inequalities. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `ordinary_g1_guards` `independent_review` (independent_reviewer, `90d9a0d3d2c35fed`): Every ordinaryG1Guards conjunct is retained at Main.lean:89-98. The corollary at 1241-1251 uses residual acyclicity and the classification to establish pT=5 and the required nonpositive delta. Unused structural and Gamma assumptions remain in the proposition; no LC, unimodality, connected-residual, cap or bridge premise is introduced. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `original_neighborhood_deletions` `independent_review` (independent_reviewer, `aca9b21f6c1c1c44`): Main.lean:45-84 defines A, H and U as induced graphs on the exact original-tree survivor subtypes. Main.lean:1133-1219 proves the nested-deletion isomorphisms, original residual deletion-set equality and survival of g; Main.lean:262-313 supplies general subset-count and delta transport. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `quantifier_scope` `independent_review` (independent_reviewer, `8650f8a27d341434`): Main.lean:1257-1273 is a conjunction of separately universally quantified implications in arbitrary universe u. V/F/p and W/T/v/s/g/pT have separate scopes. Nonempty (F ≃g pathGraph 8) is in the classification conclusion, with no existential witness required as a premise. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `registration_compatibility` `independent_review` (independent_reviewer, `924af6f139fbbd85`): The disclosed run-local adapter changes declaration spelling recognition for qualified names and noncomputable definitions. Its source does not rewrite Lean payloads or modify downstream fidelity logic. The actual qualified theorem and its bodies were reviewed; the adapter is administrative compatibility evidence, not mathematical proof. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `scope_and_authority` `independent_review` (independent_reviewer, `02a0488b048c9b42`): Verdict match applies only to the frozen ordinary finite-forest p<=5 classification and ordinary G1 p<=5 corollary. It grants no RTree transport, unrestricted G1, informal-audit verdict or workflow closeout. Root must import this unchanged attestation and run the original canonical audit and close. Expected `"semantic fidelity"`; observed `"match"`.
- `note` `sealed_inputs` `independent_review` (independent_reviewer, `2c98a2b432441ee2`): Manifest SHA256 and all 21 sealed file hashes match. Full 1275-line managed Main.lean was inspected; source and contract match the assigned hashes. Expected `"semantic fidelity"`; observed `"match"`.

## Independent Review

- Reviewer: `C1-LEAN-FIDELITY` (independent-mathematical-formalization-fidelity-reviewer)
- Attestation: `C1-LEAN-FIDELITY-aa49d970-af9a-479f-bb4a-d986bdb3148d`
- Completed: `2026-09-14T03:56:33Z`
- Verdict: `match`

## Interpretation

Only `passed` means the verified Lean declaration faithfully matches the bound
theorem contract. A kernel pass without a current independent semantic
attestation is not a fidelity pass. This Markdown file is rendered from the
canonical JSON receipt and is not an independent source of truth.
