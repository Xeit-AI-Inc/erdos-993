# r9 Fresh-Root Sectors Package

Proves `Erdos993.C12.FreshRootSectors.{attachGraph_isTree, attachGraph_degree_eq_one_iff, lean_c12_t1_fresh_root_sectors}`: the literal fresh-root attachment graph of a finite tagged family of rooted trees is a tree, its degree-one vertices are classified exactly, and the fresh-root sector statement holds at graph level. Closes the r8 kernel-verification gap for fresh-root sectors.

Build with `lake build C12FreshRootSectors`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at `905b95818eb32af7874a58b427f50c1711a5e96c`.
Axioms of every checked declaration are within
`[propext, Classical.choice, Quot.sound]` (verified at the pin at export).

Source modules are byte-identical to the sealed r9 quotient-decoder run's
gated artifacts (SHA-256):

| module | sealed source digest |
|---|---|
| `C12FreshRootSectors.lean` | `427af7ed7580f4c1bc8498c3a7ca33817440b71b4ad21e0cfd96957442c7d303` |
| `C12FreshRootSectors/FreshRootSectors.lean` | `f69c45fa794ca8e9987daef79916804612b5f65a19176154c5a96bf58d4e2a69` |
| `C12FreshRootSectors/Main.lean` | `c5f5538a85f311fda480ec5d34a97619bd9ca54ecba5c79aa7ac73c609d9c255` |

The `Scratch.lean` file of the sealed workspace is deliberately NOT included: the source gate proved it off the import path with a zero-delta deletion build.

Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent fidelity review). NOT `formally_verified` under that
rubric. This package does not prove TREE, FOREST, TRANSFER, a
counterexample, or Erdős #993.
