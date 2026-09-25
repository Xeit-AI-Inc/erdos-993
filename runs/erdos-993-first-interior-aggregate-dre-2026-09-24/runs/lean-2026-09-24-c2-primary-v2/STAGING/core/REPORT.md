# C2 Lean core producer report

The exact public intermediate interface `E993Interior.taggedShadowBound` is implemented as a `lemma` and compiled successfully against the unchanged common `STAGING/BASE.lean`. Its statement is universal over finite bipartite graphs, arbitrary `U W`, the independent-set capacity bound `hcap`, and `1 ≤ k`; its conclusion retains the specified natural subtraction coefficient.

Private helper lemmas in `E993Interior.Core`:

- `indep_union_color`: a color class can be adjoined to an independent set when every extension vertex avoids all its edges.
- `card_extension_le`: the actual two-coloring partitions every available vertex, including isolates, and bounds extension vertices by `2 * (a - A.card)`.
- `tagged_deletions_lower`: a tagged `(k+1)`-set has at least `k` distinct tagged deletions, using one surviving tag and injectivity of erase.
- `tagged_extensions_upper`: the extension sets inject into the singleton subsets of the available-vertex finset, then the color bound applies.

`taggedShadowBound` combines the last two helpers with Mathlib's finite bipartite double-counting theorem. There are no new top-level definitions and no `sorry`, `admit`, `native_decide`, or axioms in the fragment.

The draft check was built by concatenating the unchanged common `STAGING/BASE.lean` and `STAGING/core/Core.lean.fragment` into `STAGING/core/Check.lean`. The check command, with the pinned binary directory prepended to `PATH`, was:

`/Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lake env /Users/ashtonsperry/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean /Users/ashtonsperry/VerityOS/experiments/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2/STAGING/core/Check.lean`

Working directory: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-first-interior-aggregate-dre-2026-09-24/runs/lean-2026-09-24-c2-primary-v2/LeanProject`.

The final command exited 0. Its genuine output is `STAGING/core/Check.log` (mirrored locally). Remaining gaps in the assigned core interface: none. Integration, canonical registration, full kernel gate, and independent fidelity review belong to the controller. No producer job remains running.
