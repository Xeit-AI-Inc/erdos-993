# r11 Ingredient Reductions Package

Formalizes the crossing index `RTree.crossingIndex` (x(T), the first-descent boundary of the Delta sequence) and proves kernel-checked Iff reductions of the corridor program's two exact ingredient conjectures: `RTree.theoremA_iff_Bgen_bound` (a p-favorable support above the crossing boundary forces negative whole-vertex deletion effect ⟺ a named residual bound) and `RTree.theoremB_iff_bound` (leaf deletion drops the crossing index by at most 1 ⟺ a named residual bound). **NEITHER CONJECTURE IS PROVED, REFUTED, OR ASSERTED — the reductions are the theorems.** Both residuals demand one currently-missing tool: a comparison between a tree's Delta-sequence and that of a derived forest at ranks positioned by the parent's crossing index. Exhaustive search through order 18 found no counterexample to either conjecture; per the source run's own rules that bounded zero is evidence of nothing and is cited as none.

Build with `lake build CorridorIngredients`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at
`905b95818eb32af7874a58b427f50c1711a5e96c`. At export the module compiled
at the pin and every checked declaration (3) depends on axioms within
`[propext, Classical.choice, Quot.sound]`.

The source module is byte-identical to the sealed r11 run's gated
artifact: `CorridorIngredients.lean` sha256 `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a`.
The four r11 packages are nested snapshots of one growing module — each
later package's consumed region is byte-identical to the previous
package's full source (verified at each gate).

Gate provenance: GATE-R11-D, source-only evidence shape: six independent full elaborations of identical bytes (five of record plus the controller's), three axiom-check files, six planted one-token faults all failing correctly.

Grade under the source run's rubric: `governed`. NOT `formally_verified`
under that rubric. This package does not prove TREE, FOREST, TRANSFER,
PAIR-G4, a counterexample, or Erdős #993; the corridor program's endpoint
guards are hypotheses wherever they appear and are asserted nowhere; and
no bounded zero cited in its lineage is universal evidence.
