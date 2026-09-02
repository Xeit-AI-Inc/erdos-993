# r9 Encoder-Decoder Fidelity (Narrowed) Package

Proves the EIGHT-CONSTITUENT narrowed fidelity sub-statement of record, including `Erdos993.QDecoder.Fidelity.{encodeQ_realizable, coeffZ_specY1_FTot, realizableRawEquivInvariant}`. THE FULL FIDELITY ROW DOES NOT CLOSE: encoder attachment commutation and endpoint pairs remain open residues carried verbatim in the source run; this package is the narrowed closure only.

Build with `lake build FidelityProofs`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at `905b95818eb32af7874a58b427f50c1711a5e96c`.
Axioms of every checked declaration are within
`[propext, Classical.choice, Quot.sound]` (verified at the pin at export).

Source modules are byte-identical to the sealed r9 quotient-decoder run's
gated artifacts (SHA-256):

| module | sealed source digest |
|---|---|
| `Contracts.lean` | `f9838bda6e3c8c490b46611e6abe037674ac415562588ce4d7a7030cf3949ab4` |
| `Definitions.lean` | `6383365e5a823dc45348e76092aba8e6ac9497c03652f479fd8ae016d98829a9` |
| `Fidelity.lean` | `d4d303bdf8ed6329167c8ebf8d2b367baf0bd2438af22edd69503b6d9397a7fb` |
| `FidelityContracts.lean` | `12ad057e5a6376469d15633add360a5ca457b407780257954a030d03a7c0cb17` |
| `FidelityProofs.lean` | `e2ce1e3efef45c5dc2bed165155eb3c32b678f16988c61cfcde1c313f6449c99` |



Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent fidelity review). NOT `formally_verified` under that
rubric. This package does not prove TREE, FOREST, TRANSFER, a
counterexample, or Erdős #993.
