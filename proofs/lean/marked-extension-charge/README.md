# Marked-Extension Charge Lean Package

This package contains the governed marked-extension theorem from the completed
proof-gap completion experiment.

For a finite labelled tree `T`, rank `r >= 1`, and every independent
`(r-1)`-set `X`, let:

- `ext_T(X)` be the vertices that can extend `X` while preserving independence;
- `e_X = |ext_T(X)|`;
- `R_spec(T,X) = T[ext_T(X)]`; and
- `m_X = |E(R_spec(T,X))|`.

The declaration
`MarkedExtensionCharge.labelled_tree_marked_extension_charge_identity`
proves the one-mark, unordered two-mark, and aggregate charge identities:

```text
sum_X e_X = r i_r(T),
sum_X (choose(e_X,2)-m_X) = choose(r+1,2)i_(r+1)(T),
sum_X [e_X(e_X-r-2)-2m_X] = r(r+1)(i_(r+1)(T)-i_r(T)).
```

The last identity is in `Int`. The source explicitly proves both marked
bijections and the residual nonedge count.

## Build

From this directory:

```bash
lake build Erdos993MarkedExtensionCharge
lake env lean check/Kernel.lean
lake env lean check/Axioms.lean
```

The project pins Lean `v4.32.2` and Mathlib revision
`905b95818eb32af7874a58b427f50c1711a5e96c`. The expected transitive axioms
are `propext`, `Classical.choice`, and `Quot.sound`.

## Claim Boundary

The theorem concerns only the explicitly defined residual graph `R_spec`.
It does not identify an opaque run residual `R_run`, prove a residual sign,
establish a first-recovery contradiction, or solve any TREE, FOREST, TRANSFER,
or Erdős #993 headline target.
