# r10 Transfer-to-Forest Package

Proves `transfer_to_forest`: IF every component tree of a forest has a TRS2 independence sequence THEN the forest's independence sequence is TRS2 — via the forest product decomposition `RForest.indepNNSeq_eq_prod` and `trs2_finset_prod`, composing the r8 convolution-closure theorem (transplanted at source, byte-faithful, proved here; no r8 receipt transported). **THIS IS A CONDITIONAL THEOREM AND THE CONDITION IS THE POINT: its hypothesis — every tree is TRS2 — is precisely the open universal branch of the tree-TRS2 obligation. This package closes no headline problem; TREE, FOREST, and TRANSFER remain open. It asserts the implication, never its antecedent.**

Build with `lake build Forest`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at
`905b95818eb32af7874a58b427f50c1711a5e96c`. At export, all modules compiled
at the pin and every checked declaration (3) depends on axioms within
`[propext, Classical.choice, Quot.sound]`.

Source modules are byte-identical to the sealed r10 run's gated artifacts
(SHA-256):

| module | sealed source digest |
|---|---|
| `Convolution.lean` | `4795a9263dc76870ab79d320b1e27509270ea9e2e64f942e8979230dedb5d7a4` |
| `Erdos993C8U1Base.lean` | `a45c61b8acc15e4ba6fbedbcc42274659c9cac864f23c586e34101728647c0da` |
| `ExtensionProfile.lean` | `740370914fae08e77197edd5f8fa7216d0e02110a7b2facd78ceb0a4181534aa` |
| `Forest.lean` | `828b2e68e622294a930ba434d6e5d80c3833c26046054f9633becc775a2dfc4c` |
| `NNSeqAdmission.lean` | `185fc06da631f8ffed247b804d48826c518206738aa9824f131617eba99c249f` |

The E-10 scope determination travels with the source gate record: the sibling unimodality-nonclosure result is disjoint from (and the classical motivation for) the TRS2 closure consumed here.

Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent dual critic rebuilds + adversarial mutants). NOT
`formally_verified` under that rubric. This package does not prove TREE,
FOREST, TRANSFER, a counterexample, or Erdős #993, and no bounded zero
cited anywhere in its lineage is universal evidence.

## Erratum note (2026-09-03)

The universal form of this theorem's hypothesis — every finite tree's
independence sequence is TRS2 — is **refuted**: tree TRS2 is exactly
log-concavity of the raw independence sequence (this repository's
`r8-trs2` equivalence theorem), and Kadrawi–Levit exhibit non-log-concave
trees from order 26 (arXiv:2305.01784; replayable check under
`evidence/kl-order26-trs2-witness/`). The theorem itself is unaffected —
it asserts the implication, never its antecedent — but it cannot carry a
universal tree result to forests. Its correct use is per-forest with the
premise verified per component, which yields at bounded computational
tier: every forest whose components all have at most 25 vertices has a
log-concave, hence weakly unimodal, independence sequence; a minimal
forest counterexample to unimodality must contain a component of order at
least 26. See `docs/erratum-2026-09-03-universal-tree-trs2.md`.
