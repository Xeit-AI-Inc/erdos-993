# r7 Component-Selector Package

Candidate `C8-U3-AUX-SELECTOR` proves
`C8U3Selector.fixedComponentIdentity` and
`C8U3Selector.componentSelectorCharacterization`: the guarded
fixed-component difference identity and an exact selector characterization for
each component of a finite nonempty forest.

Build with `lake build C8U3Selector`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.

It does not prove selector nonemptiness, a common selector, forest recovery,
TRANSFER, TREE, FOREST, or Erdős #993.
