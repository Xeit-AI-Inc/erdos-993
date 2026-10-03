# Weighted Adjacent Coefficient Identity

Declaration: `StableTrial.weighted_adjacent_identity`.
Research run: `erdos-993-unified-binomial-stable-release-trial-2026-10-01`.
Native verification run: `lean-2026-10-01`.
Publication: 3 October 2026.

The five project/source files are byte-identical to the sealed governed project.
The exact [statement projection](statement-contract.json) and
[receipt summary](verification-summary.json) retain original hashes. They are
sanitized public projections, not complete native receipts or a new award.

The theorem quantifies over arbitrary `a : Nat -> Real`, nonzero real `lam,Z`,
and any `n : Nat`, including zero. It asserts only the scalar equality in
[`LeanProof/Main.lean`](LeanProof/Main.lean). It proves no positivity, mean-center,
graph, recursive-composition, selector or unimodality theorem. This is known
elementary algebra, not a claim of mathematical novelty.

The original governed workflow reports independent informal and fidelity passes,
successful kernel/axiom checks and no workflow failures. The transitive axioms
are `propext`, `Classical.choice`, `Quot.sound`. The existing proof emits a
nonblocking unnecessary-sequence-focus linter warning; it has not been edited.

## Reproduce

Requires elan/Lake and dependencies at the lockfile pins. Lean is
`leanprover/lean4:v4.32.2`; Mathlib is
`905b95818eb32af7874a58b427f50c1711a5e96c`.
With dependencies available, from this directory:

```sh
lake build LeanProof
lake env lean LeanProof/Main.lean
lake env lean AxiomCheck.lean
```

`AxiomCheck.lean` is a publication-only inspection wrapper, not part of the
original source award. It imports the exact theorem and prints its statement
and axioms. A local public-package replay, when recorded, is a reproduction
check only and does not replace the governed statement-fidelity receipt.
Do not run `lake update` to silently change the dependency pins.

VerityOS uses read-only shared dependencies; no `.lake/packages`, cache or raw
worker return is included in this publication. The broader repository-wide
verification script is historical and does not invoke this new package.

See the [cycle account](../../../experiments/stable-release-unification-cycle-2026-10-01.md)
and [verification record](../../../evidence/verification-2026-10-03-stable-cycle.md).
