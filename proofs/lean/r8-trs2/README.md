# r8 TRS2 Package

The two Cycle 8 candidates share one standalone package:

- `Erdos993C8U1.trs2_iff_adjacentLogConcave` characterizes route-local `TRS2`
  for a nonzero `NNRat` sequence with positive interval support as adjacent
  log-concavity.
- `Erdos993C8U1.trs2_convolutionClosure` proves `TRS2` for the zero sequence
  and `delta0`, and closure under finite additive convolution.

Build with `lake build ManagedC8U104`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.

Neither theorem shows that a tree independence polynomial is `TRS2`, supplies
a realizable transfer class, or proves TREE, FOREST, TRANSFER, a
counterexample, or Erdos #993.
