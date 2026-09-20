# C1 G1 proof package

The exact governed declaration is `Erdos993G1.lowRankForestClassificationAndG1`. `LeanProof/Main.lean` is byte-identical to its closed internal source; the pinned project configuration is also unchanged. Read the [experiment summary](../../../experiments/g1-large-residual-dre-2026-09-13.md) and [verification record](../../../evidence/verification-2026-09-20-g1.md) for the exact scope.

From this directory, run:

```sh
lake build LeanProof
lake env lean check/Kernel.lean
lake env lean check/Axioms.lean
```

Lean and all dependency revisions are pinned. Expected axioms: `propext`, `Classical.choice`, `Quot.sound`. The public check drivers are new reproduction interfaces; the original theorem contract, receipts, and workflow report are preserved under `runs/g1-large-residual-dre-2026-09-13/verification/C1`. No unrestricted G1, TREE, FOREST or TRANSFER theorem is asserted.
