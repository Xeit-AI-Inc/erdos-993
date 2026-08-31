# r7 Containment-Stub Package

Candidate `C8-T3-AUX-CONTAINMENT-STUB` proves
`C8T3ContainmentStub.containment_stub_theorem`: exact guarded
containment/stub marginals, supported-leaf deletion identities, raw nested
extension identity, acyclic component correction, and global marginal sums.

Build with `lake build C8T3ContainmentStub`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.

It is an exact identity package only. It proves no endpoint sign, common leaf,
strict overlap, or headline target.
