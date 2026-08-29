# Rooted Residual-Profile Lean Verification — 2026-08-29

## Result

**Passed.** The added public Lean package built from a clean package build
directory against the pinned, verified Mathlib dependency cache on 2026-08-29.
The repository-wide verification script also rechecked the existing gap-bridge
package.

## Command

```bash
./scripts/verify-lean.sh
```

For each public package, the script runs its named build target followed by
kernel declaration and transitive-axiom checks.

## Environment

- Lean: `v4.32.2`
- Mathlib: `905b95818eb32af7874a58b427f50c1711a5e96c`
- Added-package build result: 8,658 jobs completed successfully

## Verified Statements

- `LeanProof.positiveLogConcave_descent_persists`
- `Erdos993C8U1.tail_contradiction_from_occurrence_interface`

The exact governed source hashes were preserved:

```text
1b1cf7ca9e206d66ac083cf089a9e676fdc2edf59391caf88407461b12b9ccf7  RatioNoRecovery.lean
5b890f6cb91b8816aac832bbb6d9c587a8ff7a7f8058f871728d9f5364be1f24  OccurrenceInterface.lean
```

## Axiom Receipt

`LeanProof.positiveLogConcave_descent_persists` depends transitively only on:

```text
propext
Quot.sound
```

`Erdos993C8U1.tail_contradiction_from_occurrence_interface` depends
transitively only on:

```text
propext
Classical.choice
Quot.sound
```

## Claim Boundary

The ratio theorem is a sequence-level auxiliary result. The occurrence-
interface theorem assumes the load-bearing `hMult` capacity inequality. This
receipt does not establish that inequality, `TREE`, `FOREST`, `TRANSFER`, a
counterexample, or formal independence for Erdős #993.
