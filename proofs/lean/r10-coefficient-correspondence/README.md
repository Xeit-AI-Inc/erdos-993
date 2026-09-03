# r10 Coefficient Correspondence Package

Proves `RTree.indepNNSeq_coeff_eq_indepPoly_coeff` and its three supporting lemmas — the coefficient-level identification of the NNSeq admission term with the recurrence package's polynomial, joining the two in the kernel rather than by definitional inspection.

Build with `lake build R10C2B05`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at
`905b95818eb32af7874a58b427f50c1711a5e96c`. At export, all modules compiled
at the pin and every checked declaration (4) depends on axioms within
`[propext, Classical.choice, Quot.sound]`.

Source modules are byte-identical to the sealed r10 run's gated artifacts
(SHA-256):

| module | sealed source digest |
|---|---|
| `Erdos993C8U1Base.lean` | `a45c61b8acc15e4ba6fbedbcc42274659c9cac864f23c586e34101728647c0da` |
| `ExtensionProfile.lean` | `740370914fae08e77197edd5f8fa7216d0e02110a7b2facd78ceb0a4181534aa` |
| `NNSeqAdmission.lean` | `185fc06da631f8ffed247b804d48826c518206738aa9824f131617eba99c249f` |
| `R10C2B05.lean` | `05fb7a378a105a9c99aa5747c1edfbfb28904efc5ea9a45dfeb5cf0392ce6b0a` |

The three imported modules are CONSUMED dependencies at their own gate standings.

Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent dual critic rebuilds + adversarial mutants). NOT
`formally_verified` under that rubric. This package does not prove TREE,
FOREST, TRANSFER, a counterexample, or Erdős #993, and no bounded zero
cited anywhere in its lineage is universal evidence.
