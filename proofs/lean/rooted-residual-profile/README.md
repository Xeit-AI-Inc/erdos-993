# Rooted Residual-Profile Lean Package

This publication copy contains two governed auxiliary theorems from the
completed rooted residual-profile experiment.

## Declarations

- `LeanProof.positiveLogConcave_descent_persists`: a strictly positive,
  adjacent-log-concave finite natural sequence cannot recover after an
  adjacent descent within its support.
- `Erdos993C8U1.tail_contradiction_from_occurrence_interface`: a finite
  occurrence interface, the assumed capacity inequality `hMult`, and a strict
  normalized deficit are contradictory.

The second theorem proves the downstream wrapper after the capacity
inequality. It does not prove that inequality. Neither declaration is a tree
or forest theorem, and neither solves Erdős #993.

## Build

From this directory:

```bash
lake build Erdos993RootedResidualProfile
lake env lean check/Kernel.lean
lake env lean check/Axioms.lean
```

The project pins Lean `v4.32.2` and Mathlib revision
`905b95818eb32af7874a58b427f50c1711a5e96c`.

The expected transitive axioms are `propext` and `Quot.sound` for the ratio
theorem, and `propext`, `Classical.choice`, and `Quot.sound` for the occurrence
interface theorem.
