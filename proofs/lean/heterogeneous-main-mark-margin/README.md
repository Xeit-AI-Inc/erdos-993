# Main-mark relative-binomial margin

Byte-identical governed Lean source for the arbitrary-profile arity-2,3,4 coefficient theorem `e993_main_mark_relative_margin`. The terminal theorem has no extra likelihood-ratio, log-concavity or finite-census premise. It does not prove the selected aggregate or Erdős 993.

Toolchain: Lean 4.32.2. Mathlib: `905b95818eb32af7874a58b427f50c1711a5e96c`. Dependencies are external and are not bundled. With the pinned toolchain and dependencies available, run `lake build`, then `lake env lean LeanProof/Main.lean`. The governed kernel verification reports only `propext`, `Classical.choice`, and `Quot.sound` for the terminal declaration.

The accompanying receipt summary is a publication-safe projection, not the byte-identical internal receipt. Original receipt hashes are retained for provenance. Internal failed attempts and administrative closeout corrections remain archived with the canonical experiment.
