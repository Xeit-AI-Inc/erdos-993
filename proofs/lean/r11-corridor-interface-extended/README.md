# r11 Corridor Interface Extended Package

Extends the corridor interface with 24 theorems, including the generalized vertex-deletion identity `RTree.Delta_eq_A_add_Bgen` (whole-tree Delta decomposed through any vertex's deletion quantity plus the boundary generator `RTree.Bgen`) and the integer-extended rank domain. Every consumed line is byte-identical to the r11-corridor-interface source.

Build with `lake build CorridorIngredients`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at
`905b95818eb32af7874a58b427f50c1711a5e96c`. At export the module compiled
at the pin and every checked declaration (2) depends on axioms within
`[propext, Classical.choice, Quot.sound]`.

The source module is byte-identical to the sealed r11 run's gated
artifact: `CorridorIngredients.lean` sha256 `d78627e852075fd68b013ef73dac6b37ea3a19a1c628729cf3de76de071cd4f1`.
The four r11 packages are nested snapshots of one growing module — each
later package's consumed region is byte-identical to the previous
package's full source (verified at each gate).

Gate provenance: GATE-R11-B, two dispatched critic rebuild legs.

Grade under the source run's rubric: `governed`. NOT `formally_verified`
under that rubric. This package does not prove TREE, FOREST, TRANSFER,
PAIR-G4, a counterexample, or Erdős #993; the corridor program's endpoint
guards are hypotheses wherever they appear and are asserted nowhere; and
no bounded zero cited in its lineage is universal evidence.
