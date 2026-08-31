# r7 Finite-Coupling Package

Candidate `C5-T3-04-C5-T3-05` proves
`C5T304C5T305.C5_T3_04_C5_T3_05`: the exact finite coupling-cost lower bound,
its strict-cost positive-diagonal consequence, and a common
positive-marginal-class conclusion.

Build with `lake build C5T304C5T305`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.

It does not construct a tree-generated coupling, derive its cost hypotheses,
or prove a strict tree attachment-loss bound or headline target.
