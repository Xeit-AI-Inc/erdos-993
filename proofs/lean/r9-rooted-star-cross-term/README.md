# r9 Rooted-Star Cross-Term Package

Proves `RootedStarCrossTerm.centerRootedK13_crossTerm_certificate` (the center-rooted K_{1,3} linked-cross-term certificate) with the `rootedStarMinorRanks` interval identity. Closes the r8 rejected-build repair debt. A `Classical.choice` residue arrives through Mathlib automation and is enumerated in the source gate record; it does not affect the certificate.

Build with `lake build LeanProof`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at `905b95818eb32af7874a58b427f50c1711a5e96c`.
Axioms of every checked declaration are within
`[propext, Classical.choice, Quot.sound]` (verified at the pin at export).

Source modules are byte-identical to the sealed r9 quotient-decoder run's
gated artifacts (SHA-256):

| module | sealed source digest |
|---|---|
| `LeanProof.lean` | `f4dfdef8320a735eab53d24f4b47d3b60bcb474ffd2c84c77f24ae2fc75fcf31` |
| `LeanProof/Main.lean` | `5a8a3132c74227c2e284d588d321cfb665e7a63e8f7046675c9d74e5cb18f417` |



Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent fidelity review). NOT `formally_verified` under that
rubric. This package does not prove TREE, FOREST, TRANSFER, a
counterexample, or Erdős #993.
