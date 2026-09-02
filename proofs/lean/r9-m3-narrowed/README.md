# r9 Marker-Transport (Narrowed) Package

Proves the support-marker transport half of the marker-preservation obligation: `Erdos993.QDecoder.M3.{supportSharing_invariant, attach_rootSupportFibre, supportSharing_attach_transport, attach_RootFibreIsClass}` at the frozen ten-row contract texts. Residues "deletion data" and "finite-tree fidelity" are NOT reached; `M3-06` is sufficient and is not necessary, and no reader may cite it otherwise.

Build with `lake build Proofs`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at `905b95818eb32af7874a58b427f50c1711a5e96c`.
Axioms of every checked declaration are within
`[propext, Classical.choice, Quot.sound]` (verified at the pin at export).

Source modules are byte-identical to the sealed r9 quotient-decoder run's
gated artifacts (SHA-256):

| module | sealed source digest |
|---|---|
| `Definitions.lean` | `bfe43e837af64240b00d36866a19f7837d32dd1f30c95d51b2888f348a585502` |
| `M3Contracts.lean` | `6d1df6cc738e3509ae76b7c93bbe58070e2b610fb63a0e4a876554b35ed006ff` |
| `Proofs.lean` | `c968280117848fd9b4d3ce4d2e8bc4dcd72a4eda294ce27f4d13c5347d87cba1` |



Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent fidelity review). NOT `formally_verified` under that
rubric. This package does not prove TREE, FOREST, TRANSFER, a
counterexample, or Erdős #993.
