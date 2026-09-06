# Verification Record — r15 + r16 Export (2026-09-06)

Binds `proofs/lean/r15-beta-descent`, `r16-constructor`, and
`r16-integration` to their sealed source runs (internal archive:
`erdos-993-beta-condition-dre-2026-09-05`, nine cycles, sealed;
`erdos-993-identification-constructor-dre-2026-09-05`, six cycles, sealed
with terminal seals and closing records).

All three packages: sources byte-identical to gated artifacts (sha256
tables in `proofs/lean/R15R16-ASSEMBLY-RECEIPTS.md`; one disclosed
import-line repair in r15-beta-descent, diffed there); built cold at the
pin (Lean 4.32.2 f3b06c70, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`,
cache manifest `52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
verified before/after every build); exit 0; **242/242 checked declarations
within `[propext, Classical.choice, Quot.sound]`**; zero live `sorry`.
Inside the source runs the constructor and integration carry seven-leg,
five-seat elaboration registers with byte-identical axiom blocks.

The order-22 census evidence is recorded separately at
`evidence/order22-census-2026-09-06.md`.

## Claim boundary

Nothing in this export proves or refutes TREE, FOREST, or TRANSFER;
exhibits a counterexample; or establishes independence. (β) and
`AmbientTargetDeg2` remain OPEN; the integration's premises (K, K-SCOPE)
ride on its face; every zero-hit search cited is bounded evidence and
never universal. Grades are the source runs' rubric grades; nothing is
`formally_verified`.
