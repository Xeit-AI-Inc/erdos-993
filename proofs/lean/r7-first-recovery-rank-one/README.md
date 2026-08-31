# r7 First-Recovery Rank-One Package

Candidate `C2-T1-05` proves `C2T105.no_first_recovery_at_one`: no finite
nonempty labelled tree has the exact plateau-safe predicate `FR(T,1,q)` for
any `q > 1`.

Build with `lake build Erdos993MarkedExtensionCharge`, then run
`lake env lean check/C2T105Kernel.lean` and
`lake env lean check/C2T105Axioms.lean`.

This is an auxiliary rank-one exclusion only. It proves no case beginning at
rank two or higher and no TREE, FOREST, TRANSFER, counterexample, or Erdős
#993 headline.
