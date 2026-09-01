# r8 Extension-Set Bridge Package

Candidate `E1` proves `E1ExtensionSplit.extension_set_sum_bridge`: for a
labelled graph disjoint union and an independent set, its one-vertex extension
set is equivalent to the sum of the factor extension sets, and the extension
counts add.

Build with `lake build E1ExtensionSplit`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.

This is an exact bridge identity. It does not prove TREE, FOREST, TRANSFER, a
counterexample, or Erdos #993.
