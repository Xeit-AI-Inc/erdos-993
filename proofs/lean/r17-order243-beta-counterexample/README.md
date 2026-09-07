# Order-243 (β) Counterexample Package — Kernel-Verified

Proves `Order243.T60_not_BetaTarget : ¬ RTree.BetaTarget` — the exact
order-243 refutation of the program's (β) condition (star-60 tree,
`p = 90`, `K_A = 3`), kernel-checked against the r17 run's frozen
theorem contract (statement sha256
`1c20e5a9ca790929c0f90b3cf0a7c53b9b5d5f055714614b535072b95c9c2d36`,
exact match). `RTreeBase.lean` is the inherited definition authority,
byte-identical to the verified prior source (`64fd06c887c65d9c…`).

Build with `lake build LeanProof`, or check the single file with
`lake env lean LeanProof/Main.lean`. Toolchain: Lean 4.32.2; Mathlib
pinned at `905b95818eb32af7874a58b427f50c1711a5e96c`. Axioms of all 107
declarations are within `[propext, Classical.choice, Quot.sound]`
(0 outside; no `native_decide` anywhere; verified per-declaration at
the pin, and the controller independently reran the kernel check).

Grade under the program rubric: **`governed`** — frozen contract →
kernel-verified formalization → informal audit → independent hostile
statement-fidelity review (PASS-WITH-NOTES) → controller closeout.
NOT `formally_verified` under that rubric.

**BINDING SCOPE CAVEAT (D9):** the refutation is certified over the
program's address-labelled `RTree` model — the vocabulary in which (β)
is registered. The semantic-adequacy bridge to ordinary finite trees is
unproved and deliberately outside the frozen contract; any
ordinary-finite-tree phrasing carries this caveat. This package does
not prove or refute TREE, FOREST, TRANSFER, (α), or Erdős #993.
Source: `runs/lean-2026-09-07-claude` (sealed, `a54e08a6…`) in the r17
counterexample experiment; award record `CONTROLLER-AWARD.md`
(`c31b53e7…`).
