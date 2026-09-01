# Proof Architecture Status

Date: 2026-09-01

Erdős Problem #993 remains open. The completed r8 research provides a coherent
universal-proof architecture, but not a proof of the conjecture.

## Current Shape

```text
Assume a counterexample exists.
        |
Choose a minimum-order first-recovery tree T with ranks p < q.
        |
Analyze the leaf deletions T-v and T-{v,w_v}.
        |
Prove strict endpoint signs D_p(T)>0 and D_q(T)<0.     [OPEN]
        |
Force one leaf v with a_p(v)<0<a_q(v).                 [OPEN]
        |
Construct a smaller first-recovery tree from that leaf. [CONDITIONAL]
        |
Contradict minimality and conclude TREE.
```

The beginning of this route is substantially developed. First recovery and
minimum-order carriers are precisely defined; exact leaf-deletion, aggregate,
residual, and extension-profile identities provide local information for every
original leaf; and multiple auxiliary declarations are formally verified in
the included Lean packages.

The ending is available only conditionally. Once a single original leaf is
shown to cross both endpoint margins, the accepted descent argument produces a
smaller first-recovery carrier and contradicts the minimum-order choice.

## Central Gap

The unresolved middle has two layers:

1. prove the noncircular endpoint signs `D_p(T)>0` and `D_q(T)<0` for every
   hypothetical minimum first-recovery tree; and
2. convert those separate aggregate signs into one common leaf satisfying
   `a_p(v)<0<a_q(v)`.

Separate favorable marginals do not imply common-leaf overlap. The missing
result is therefore a tree-realizable strict paired-incidence, or positive
same-leaf diagonal-mass, theorem.

Several tempting shortcuts have been eliminated at exact scopes, including
unguarded Hall carriers, invariance-only selectors, compressed decoder states,
and tested scalar or cross-term reductions. These refutations narrow the
search, but they do not refute the conjecture.

## Evidence Boundary

- The seven r8 Lean packages contain eight governed auxiliary declarations.
- None proves the endpoint signs, common-leaf theorem, TREE, FOREST, TRANSFER,
  a counterexample, or Erdős #993.
- Bounded zero searches cannot prove a universal statement.
- The complete r8 status and exact scopes are recorded in the
  [experiment summary](../experiments/r8-extension-profile-same-leaf.md) and
  [verification record](../evidence/verification-2026-09-01-r8.md).

The fairest assessment is that the proof's opening reduction, substantial
supporting infrastructure, and conditional conclusion are present. The
load-bearing middle bridge remains open and may contain most of the theorem's
difficulty.
