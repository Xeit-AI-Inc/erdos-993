# C2 Lean integration producer report

The exact terminal declaration `E993Interior.firstInteriorAggregate` compiled with exit 0 against the pinned Lean project. The public intermediate `E993Interior.bipartiteHighTailAggregate` also compiled. The terminal has precisely the contract premises `G.IsTree` and `C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2`, and conclusion `C5LA1.aggregate G (G.indepNum - 2) ≤ 0`.

The final `STAGING/integration/Check.lean` source order is exactly:

1. The common `STAGING/BASE.lean`, changing only its `taggedFamily` declaration block to the exact bytes of `STAGING/registration-base/018-section.lean.fragment`, as authorized by `EVIDENCE/REGISTRATION-SPELLING-DECISION.json`. All other BASE bytes retain their order.
2. The sealed, unchanged `STAGING/core/Core.lean.fragment`.
3. The sealed, unchanged `STAGING/leaf/Leaf.lean`.
4. The sealed, unchanged `STAGING/guard/Guard.lean.fragment`.
5. New `STAGING/integration/Helper.lean.fragment`, declaring only `lemma E993Interior.bipartiteHighTailAggregate`.
6. New `STAGING/integration/Terminal.lean.fragment`, declaring only `theorem E993Interior.firstInteriorAggregate`.

The helper discharges the universal shadow assumption of `highTailAggregateFromShadow` using `taggedShadowBound` and bipartiteness. The terminal obtains `7 ≤ G.indepNum` from the sealed guard, invokes the helper with `hT.isBipartite`, and proves both rank guards by `omega`. No extra mathematical hypothesis was added. The imported core, leaf, guard, and spelling-section fragments were read from sealed remote sources and were not edited.

The final draft check command was `/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake env /Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean /Users/ashtonsperry/VerityOS/experiments/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2/STAGING/integration/Check.lean`, run from the canonical `LeanProject` with the pinned binary directory prepended to `PATH`. Its actual output is `Check.log`, and its actual exit code is in `Check.exit-code` (0).

A separate `Axioms.lean` appended `#print axioms E993Interior.firstInteriorAggregate` to the same checked source. Its actual output is `Axioms.log`, and `Axioms.exit-code` is 0. It reported exactly `[propext, Classical.choice, Quot.sound]`. No `sorry`, `admit`, `native_decide`, or new axiom appears in either new fragment.

There is no remaining integration proof gap. Canonical source registration, kernel receipt, independent fidelity review, and final verdict remain controller-owned. No producer job remains running.
