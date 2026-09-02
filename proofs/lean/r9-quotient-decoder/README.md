# r9 Quotient-Decoder Core Package

Proves `Erdos993.QDecoder.{repIndependence, recCongruence, decoderDescends, attachDescends, deltaS1Discharged, c3Bundle}` against the frozen non-self-authored decoder contract: representative independence, recursion congruence, decoder and attachment descent to the quotient, and the kernel-witnessed emptiness of the DELTA-S1 delta.

Build with `lake build Proofs`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at `905b95818eb32af7874a58b427f50c1711a5e96c`.
Axioms of every checked declaration are within
`[propext, Classical.choice, Quot.sound]` (verified at the pin at export).

Source modules are byte-identical to the sealed r9 quotient-decoder run's
gated artifacts (SHA-256):

| module | sealed source digest |
|---|---|
| `Contracts.lean` | `616265b431047e13f90a118870f8348a535df82e11e078bbd62e0fba183b8092` |
| `Definitions.lean` | `bfe43e837af64240b00d36866a19f7837d32dd1f30c95d51b2888f348a585502` |
| `Proofs.lean` | `4e5169c7e2fb3052fccbed664f8dea82cf19137a5ec156b96943640cd95d2d89` |

SEVERANCE CAVEAT (binding on consumers, from the source gate record): `attachSec_F` is named-not-gated; no consumer may cite it as evidence of the S2 eq.(2)/S3 sector agreement.

Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent fidelity review). NOT `formally_verified` under that
rubric. This package does not prove TREE, FOREST, TRANSFER, a
counterexample, or Erdős #993.
