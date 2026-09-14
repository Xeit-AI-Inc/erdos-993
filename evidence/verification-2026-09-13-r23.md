# Verification Record: r23 Actual-Tree Delete/Retag (2026-09-13)

This record binds the curated public release to the sealed terminal experiment
without publishing raw model returns, hidden prompts, worker scratch, or local
filesystem paths.

## Terminal Binding

| Artifact | SHA-256 |
|---|---|
| Final manifest | `d166a2e3ee5f50225813a97adef10882950d2d43fddf61d382b436c4e2eaba89` |
| Final reconciliation | `3b079d6f8c157d6d7fc72ce2c63bd69acb6d29fbc2a49e288d6c09e0e15ec250` |
| Terminal report | `d0c809e4d6a505994648a435a637cf858caa00478c7d4d20680f2f20c622cde8` |
| Terminal checkpoint | `e6bc01d51a11dbbebd30a5579048b10ad0d0dbe1f5c00d7868fab9cfaf676216` |
| Terminal ledger | `fe527845d5e4ee54a685ff466effc29e987f6deefaca80f008fc6738766c80b2` |
| Cycle 1 synthesis | `e166c0fbc0325c58b02955e00570b4d63d0898183a5727686285f93d4e456821` |
| Stage 7 result | `14752cae5eb57d0b8fa2c85fc796005a1c631c8364cc0df051fc1fda4fea6192` |
| Stage 7 seal | `cf9c762e9b9d91c6b74e9bd954138da2dede4142ba8d990045d619c9b0137b53` |
| Closeout claim lint | `5a52010583374fe38313f200b9b8ff32f08c2a17ee04923da81668eca4205df8` |
| Closeout path check | `fede239212065741b5a859c6f28e894b1ae00701196538bfc889ef49bfd5e0fb` |

The claim linter exited zero with no blocking findings. Its 26 warnings are
inherited historical unregistered-refutation rows, not r23 status regressions.
The path check found zero disallowed external paths across 996 durable files;
cache, package, and scratch roots were enumerated as intentional exclusions.

## Exact Counterexample Evidence

The independently replayed ordinary-tree evaluator records for `T_22,p=34`:

```text
tree order                         91
first crossing x(T_22)             32
strictly favorable original leaves 67
source-cut size                     1020660578375268831042
target-container size               1006434057637648542672
positive excess                     14226520737620288370
complete aggregate                  -498754180547001418536
```

The mathematical container argument proves every literal Delete/Retag image
of the center-free source cut lies in the displayed target container. Exact
cardinality then refutes Hall for the literal ordinary-tree relation. The
complete aggregate's negative sign prevents any inference against
`E993-BETA-AGG`.

## Lean Binding

| Artifact | SHA-256 |
|---|---|
| Theorem contract | `f7ec822a8698140d00888c9c49b1c232efe28887df154cb0d0bb7a817493ad4a` |
| Exact Lean source | `d9849dfa976f4f36d35ffa73b3ea054d75119108f188a1bc04be2c2f509485c6` |
| Kernel receipt | `3b4b4634b52117a636ec94a37b8dd38facd6566989c1b501b6dea2745ec70046` |
| Fidelity receipt | `fbe44d010e17c79098945ca705e3b414f441ca4b9318c6bd934b80922bf2c11c` |
| Workflow report | `47f6e81f29479169801c075aa63ec5cfde513700c3c610d0dc349cc7bb4e9e05` |

The source uses Lean `4.32.2` and Mathlib revision
`905b95818eb32af7874a58b427f50c1711a5e96c`. Kernel verification passed with
no `sorry` or `admit`; reported axioms are within `propext`,
`Classical.choice`, and `Quot.sound`. Independent fidelity review passed.

## Scope Ceiling

The terminal contracted theorem is
`T22NoCenterHallFailureCertificate`, the closed arithmetic statement comparing
the two `Z` values. The public package includes byte-identical source. It is not
a Lean proof of the T22 graph/counting bridge, literal Hall refutation,
aggregated beta-prime, TREE, FOREST, TRANSFER, or Erdős #993.
