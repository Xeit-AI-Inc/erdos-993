# r8 Two-Leaf Deletion Package

Candidate `C4-F3-05` proves `C4F305.two_leaf_deletion_iso_coeff_delta`: a
finite labelled tree whose exact leaf set is two distinct vertices has
isomorphic endpoint deletions, with equal zero-extended independent-set
coefficients and adjacent differences at every integer rank.

Build with `lake build C4F305`, then run `lake env lean KernelCheck.lean` and
`lake env lean AxiomCheck.lean`.

The theorem supplies no strict same-leaf inequality or common-leaf choice. It
does not prove TREE, FOREST, TRANSFER, a counterexample, or Erdos #993.
