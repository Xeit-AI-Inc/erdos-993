# r8 Extension-Profile Specialization Package

Candidate `C1F1-REP-01` proves
`C1F1Rep01.extensionProfile_specialize_one`: evaluating the inner variable of
the exact encoded extension-profile polynomial at one recovers the
integer-embedded independent-set coefficient at each rank.

Build with `lake build C1F1Rep01`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.

This is a representation-specialization identity only. It does not prove
TREE, FOREST, TRANSFER, a counterexample, or Erdos #993.
