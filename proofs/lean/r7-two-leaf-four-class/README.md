# r7 Two-Leaf Four-Class Package

Candidate `C8-F2-02` proves `C8F202.two_leaf_four_class` and
`C8F202.coefficient_identity`: the exact four-class coefficient decomposition
and shifted-difference identity for two distinct original leaves, including
the shared-support deletion convention.

Build with `lake build C8F202`, then run `lake env lean KernelCheck.lean` and
`lake env lean AxiomCheck.lean`.

It does not prove a strict same-leaf inequality, select a leaf, or resolve a
headline target.
