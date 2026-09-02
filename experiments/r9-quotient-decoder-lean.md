# r9 Quotient-Decoder Formalization Experiment

Completed: 2026-09-02

## Terminal State

The six-cycle formalization run `erdos-993-math-dre-20260901-r9-quotient-decoder-lean`
closed at its committed terminal cycle. It is an infrastructure run: it
formalizes the dependent quotient decoder stack and clears prior Lean debt.

| Target | Status |
|---|---|
| TREE | Open |
| FOREST | Open |
| TRANSFER | Open |
| Literal counterexample | Open |

No proof, counterexample, or independence result for Erdős #993 is claimed.
Nothing in the run is graded `formally_verified`; the run's ceiling grade is
`governed` (Lean 4.32.2 kernel + pinned Mathlib + independent fidelity
review), and every closure below carries its exact scope.

## Closures

Six at `governed`:

| Item | Scope boundary |
|---|---|
| Fresh-root sector lemmas | Graph-level treehood and exact output-leaf classification; closes an r8 kernel-verification gap |
| Rooted-star cross-term package | Closes an r8 rejected-build debt; Classical.choice residue enumerated |
| Quotient-decoder core | Representative independence, recursion congruence, decoder/attachment descent, against a frozen non-self-authored contract |
| E3 double-count receipt | Module-scope severance; four declarations not orientation-bearing severed from their module |
| Encoder–decoder fidelity | NARROWED: an eight-constituent sub-statement only; the full row (encoder attachment commutation + endpoint pairs) remains open |
| Marker-transport (M3) | NARROWED: support-marker transport half only; deletion data and finite-tree fidelity unreached |

Two at `proved_informal`: the marker recurrence `OB-M2` (a naming act plus
three definitional unfoldings; the gate declined `governed` on
`rfl`-reachable clauses and records why), and the representation-sufficiency
question `OB-REP-G4` (bounded to the attach-generated population to order
14; the reachability residue is carried open verbatim).

## Findings Of Record

- Two frozen contract rows were proved FALSE at the Lean kernel by routes
  that built exactly what was frozen (cycles 4 and 5), each repaired by a
  subsequent contract act. A contract can be text-correct,
  digest-reproducing, balanced at every delimiter — and false at a
  registered row; the run finding this twice is evidence its grades mean
  what they say.
- The sector functional factors exactly through unrooted isomorphism to
  order 14 (fibres are the unrooted classes, verified by three independent
  canonicalisations) — a sizing datum, not a headline result.
- Root-fixing and root-moving isomorphism invariance are different results
  and are never conflated on any face of the record.

## Integrity

Per-cycle sealed stages; frozen theorem contracts with recomputed block
digests and balance censuses; dual independent critic rebuilds with
byte-identical `.olean` under a declared invocation form; pinned read-only
Mathlib cache verified before and after every invocation, zero drift.
Source digests are bound in
`evidence/verification-2026-09-02-three-engine.md`.
