# Lean Verification Receipt — 2026-08-29

## Result

**Passed.** The public Lean package built from a fresh local clone and fresh
dependency cache on 2026-08-29.

## Commands

```bash
./scripts/verify-lean.sh
```

The script ran:

```bash
lake build Erdos993GapBridge
lake env lean check/Kernel.lean
lake env lean check/Axioms.lean
```

## Environment

- Lean: `v4.32.2`
- Mathlib: `905b95818eb32af7874a58b427f50c1711a5e96c`
- Build result: 3,050 jobs completed successfully

## Verified Statements

- `Erdos993GapBridge.three_twoSets_union_four_has_two_intersections`
- `Erdos993GapBridge.tree_plc4_of_card_ge_27`

The main result states that every finite nonempty simple tree `T` with at least
27 vertices satisfies

```text
i_4(T)^2 > i_3(T) * i_5(T).
```

## Axiom Receipt

Both checked declarations depend transitively only on:

```text
propext
Classical.choice
Quot.sound
```

The build emitted non-fatal style-linter warnings about unused section
variables and simplification forms. It emitted no proof, kernel, or axiom-gate
failure.

## Claim Boundary

This receipt verifies the included formal package. It does not establish TREE,
FOREST, TRANSFER, a counterexample, or formal independence for Erdős #993.
