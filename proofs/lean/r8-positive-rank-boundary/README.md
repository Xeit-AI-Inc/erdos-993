# r8 Positive-Rank Boundary Package

Candidate `C5-T2-POSITIVE-RANK-REPAIR` proves
`C6PositiveRank.C5_T2_POSITIVE_RANK_REPAIR`: under the stated finite
minimum-first-recovery tree hypothesis, the selected rank is positive, the
next coefficient is positive and within the carrier bound, and the rank-zero
adjacent difference has its exact positive form.

Build with `lake build LeanProof`, then run `lake env lean KernelCheck.lean`
and `lake env lean AxiomCheck.lean`.

This is a legality boundary for downstream endpoint identities. It does not
prove TREE, FOREST, TRANSFER, a counterexample, B4, a same-leaf inequality, or
Erdos #993.
