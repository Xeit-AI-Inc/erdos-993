# r7 Boundary-Factorization Package

Candidate `C8-U2-AUX-BOUNDARY-FACTORIZATION` proves
`C8U2BoundaryFactorization.componentwise_boundary_factorization`: each
component outside a connected induced carrier in a tree has one boundary edge,
and the exact independence-polynomial and coefficient factorization follows.

Build with `lake build C8U2BoundaryFactorization`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.

It does not exhibit a recovering carrier, numerical correction margin,
recovery preservation, TRANSFER, TREE, FOREST, or a counterexample.
