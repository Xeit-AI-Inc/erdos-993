# r7 Double-Broom D1 Package

Candidate `C3-F3-04` proves `C3F304.C3_F3_04`: every labelled double-broom
`D_(1,m)` for `m >= 1` is free of the exact plateau-safe first-recovery
predicate at every natural rank pair.

Build with `lake build C3F304`, then run `lake env lean KernelCheck.lean` and
`lake env lean AxiomCheck.lean`.

This covers only the stated proper family; it proves no arbitrary tree,
FOREST, TRANSFER, counterexample, or Erdős #993 headline.
