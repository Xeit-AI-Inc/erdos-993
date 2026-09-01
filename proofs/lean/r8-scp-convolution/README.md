# r8 SCP Convolution Package

Candidate `C2U2-03` proves `C2U203.scp_convolution_closed`: the abstract
universal-preserver predicate `SCP` is closed under convolution.

Build with `lake build C2U203`, then run `lake env lean KernelCheck.lean` and
`lake env lean AxiomCheck.lean`.

No tree independence sequence is shown to satisfy `SCP`. This result does not
prove TREE, FOREST, TRANSFER, a counterexample, or Erdos #993.
