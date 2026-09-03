# r10 Extension-Profile Recurrences Package

Proves the three-state extension-profile recurrences for rooted trees against an independently defined ground-truth model (`RTree`): `RTree.{Ipoly_leaf, Apoly_leaf, Bpoly_leaf, Ipoly_node, Apoly_node, Bpoly_node, Fpoly, Fpoly_eval_one}` — the Included/Available/Blocked bivariate triple, its product recurrences (including the blocked-state difference of products), and the specialization F(x,1) = the independence polynomial, all derived from an explicit bijection on independent sets, never assumed.

Build with `lake build ExtensionProfile`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at
`905b95818eb32af7874a58b427f50c1711a5e96c`. At export, all modules compiled
at the pin and every checked declaration (8) depends on axioms within
`[propext, Classical.choice, Quot.sound]`.

Source modules are byte-identical to the sealed r10 run's gated artifacts
(SHA-256):

| module | sealed source digest |
|---|---|
| `ExtensionProfile.lean` | `740370914fae08e77197edd5f8fa7216d0e02110a7b2facd78ceb0a4181534aa` |

Gate provenance: the r10 C2 controller gate act, five item-5 clauses met, module reproduced byte-identically by eight parties across the source run.

Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent dual critic rebuilds + adversarial mutants). NOT
`formally_verified` under that rubric. This package does not prove TREE,
FOREST, TRANSFER, a counterexample, or Erdős #993, and no bounded zero
cited anywhere in its lineage is universal evidence.
