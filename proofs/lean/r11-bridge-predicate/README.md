# r11 Bridge Predicate Package

Defines `RTree.BridgePredicate` — for a support-bearing vertex s and rank p: if s is p-favorable then its whole-vertex deletion effect A_p(s) is negative — with `RTree.bridgeAntecedent_eq_PFavorableAt` identifying the antecedent with the already-proved favorable-support notion by definitional equality (Iff.rfl). This is the empirically live limb of the corridor search, here made statable in the kernel. THE PREDICATE IS DEFINED, NOT PROVED: no instance of it is asserted for any tree.

Build with `lake build CorridorIngredients`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at
`905b95818eb32af7874a58b427f50c1711a5e96c`. At export the module compiled
at the pin and every checked declaration (2) depends on axioms within
`[propext, Classical.choice, Quot.sound]`.

The source module is byte-identical to the sealed r11 run's gated
artifact: `CorridorIngredients.lean` sha256 `b7cec761722028a7cab068b58091a78debeebfc17dd1830bd1a1f780e33cba0f`.
The four r11 packages are nested snapshots of one growing module — each
later package's consumed region is byte-identical to the previous
package's full source (verified at each gate).

Gate provenance: GATE-R11-C, 3-of-2 agreeing legs; a semantic-adequacy residual travels on the source gate record (an argued correspondence at its definitional locus, not a semantic proof).

Grade under the source run's rubric: `governed`. NOT `formally_verified`
under that rubric. This package does not prove TREE, FOREST, TRANSFER,
PAIR-G4, a counterexample, or Erdős #993; the corridor program's endpoint
guards are hypotheses wherever they appear and are asserted nowhere; and
no bounded zero cited in its lineage is universal evidence.
