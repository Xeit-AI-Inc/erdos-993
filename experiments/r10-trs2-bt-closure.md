# r10 TRS2 B_T-Closure Experiment

Completed: 2026-09-03

## Terminal State

The six-cycle r10 experiment `erdos-993-math-dre-20260902-r10-trs2-bt-closure`
closed at its designed terminal cycle, with two controller study interludes
(one redirected the run mid-course; one performed the final verification and
repairs).

| Target | Status |
|---|---|
| TREE | Open |
| FOREST | Open |
| TRANSFER | Open |
| Literal counterexample | Open |

No proof, counterexample, or independence result for Erdős #993 is claimed.
Nothing in the run is graded `formally_verified` under its own rubric.

## Published Formal Results

Four governed packages forming one kernel-checked chain, exported to
`proofs/lean/r10-*`:

| Package | Content | Scope boundary |
|---|---|---|
| `r10-extension-profile-recurrences` | The Included/Available/Blocked extension-profile recurrences, proved against an independent ground-truth model | Theorems about the `RTree` model; nothing about TRS2 |
| `r10-nnseq-admission` | A tree's independence sequence as an abstract `NNSeq` term; the TRS2 ⟺ adjacent-log-concavity characterization discharged for it | Asserts neither side of the biconditional |
| `r10-coefficient-correspondence` | The coefficient identification joining the admission term to the recurrence polynomial | Joins two constructions in the kernel; asserts no sequence property |
| `r10-transfer-to-forest` | **`transfer_to_forest`: if every component tree's sequence is TRS2, the forest's is** — the forest product decomposition composed with the r8 convolution closure | **CONDITIONAL. The hypothesis is exactly the open universal tree-TRS2 question. Closes no headline problem** |

## Measured Negative Results

The run's search program was closed by measurement rather than exhaustion of
patience, and the receipts travel:

- **The invariant-search pincer.** A closure-candidate whose consequent is
  TRS2 or weaker is unfalsifiable on every reachable population (zero TRS2
  failures among all rooted trees through order 20 — five independent
  in-run parties plus the independently sealed order-20 census); every
  measured stronger candidate failed on 34–98% of trees, too strong to
  carry an induction. Roughly a dozen candidate designs died across three
  cycles; the program is suspended with a stated re-entry condition (a
  permutation-invariant predicate class with failure rate strictly between
  0 and 1).
- **The summand-family object was ill-posed as stated**: order-dependent
  under child permutation, hence never a function of the tree — found by
  two isolated parties from opposite directions.
- **The cross-term counterexample trail is closed**: the negative linked
  cross-term is a definitional residual with strictly positive margin on
  all 104,678 firing instances at orders ≤ 17; the compensation identity
  is a definition unpacked, not a mechanism.

## What Remains

Exactly one proposition on this line: universal tree-TRS2 (the hypothesis
of the exported conditional theorem), now statable in one line of Lean
against governed objects. Bounded computation cannot decide it, and the
run's own receipts bound what invariant search can contribute below order
21 (nothing). A successor needs a structural proof idea; the blocked-root
subtraction obstruction identified in the program's earlier analysis still
bars the convolution-only induction.

## Integrity

Per-cycle sealed stages; frozen contracts; dual critic rebuilds with
byte-identical artifacts under a declared invocation form; adversarial
one-token mutants on every headline theorem, all correctly failing; a
final controller cold rebuild reproducing every awarded artifact
byte-identically; pinned read-only Mathlib cache verified before and after
every invocation by every party, zero drift. Source digests bound in
`evidence/verification-2026-09-03-r10.md`.
