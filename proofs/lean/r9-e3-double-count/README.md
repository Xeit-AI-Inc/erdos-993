# r9 E3 Double-Count Package

The `R9C3C` module: 19 contracted statements of the repaired generating-function double count, exact by independent statement diffs at two critic desks. Governed AS A MODULE AND NOT SEVERABLE BELOW IT: E3-08/-11/-16/-17 are not orientation-bearing in their own statements and may not be cited severed from the module.

Build with `lake build DoubleCount`, then run
`lake env lean KernelCheck.lean` and `lake env lean AxiomCheck.lean`.
Toolchain: Lean 4.32.2; Mathlib pinned at `905b95818eb32af7874a58b427f50c1711a5e96c`.
Axioms of every checked declaration are within
`[propext, Classical.choice, Quot.sound]` (verified at the pin at export).

Source modules are byte-identical to the sealed r9 quotient-decoder run's
gated artifacts (SHA-256):

| module | sealed source digest |
|---|---|
| `DoubleCount.lean` | `1b1f94ff546b22bb9d09a75c3b53facb4ef79c7623297b34e1680e3eaeb37ab3` |



Grade under the source run's rubric: `governed` (Lean kernel + pinned
Mathlib + independent fidelity review). NOT `formally_verified` under that
rubric. This package does not prove TREE, FOREST, TRANSFER, a
counterexample, or Erdős #993.
