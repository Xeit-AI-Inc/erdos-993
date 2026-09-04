# r11 Corridor Interface Package

The corridor-interface layer over the ground-truth rooted-tree model: leaf deletion via induced-set counts, the Delta sequence, the leaf profile `RTree.a` (a_r(v) = Delta_r(T−v)), the crossing-leaf predicate, and the concrete favorable-support notion `RTree.PFavorableAt` — the ingredient vocabulary of the minimum-counterexample corridor program, formalized and proved well-formed. The r10 extension-profile model is inlined byte-identically as the foundation.

Build with `lake build CorridorIngredients`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at
`905b95818eb32af7874a58b427f50c1711a5e96c`. At export the module compiled
at the pin and every checked declaration (2) depends on axioms within
`[propext, Classical.choice, Quot.sound]`.

The source module is byte-identical to the sealed r11 run's gated
artifact: `CorridorIngredients.lean` sha256 `4180da7c8150f1a03746c8a32bbcaad67fbfa9c1f4571a41187f1bf0fadabd63`.
The four r11 packages are nested snapshots of one growing module — each
later package's consumed region is byte-identical to the previous
package's full source (verified at each gate).

Gate provenance: GATE-R11-A, three agreeing critic rebuild legs at one .olean digest.

Grade under the source run's rubric: `governed`. NOT `formally_verified`
under that rubric. This package does not prove TREE, FOREST, TRANSFER,
PAIR-G4, a counterexample, or Erdős #993; the corridor program's endpoint
guards are hypotheses wherever they appear and are asserted nowhere; and
no bounded zero cited in its lineage is universal evidence.
