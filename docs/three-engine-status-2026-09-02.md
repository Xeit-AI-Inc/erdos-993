# Three-Engine Research Status — 2026-09-02

Consolidated status after the 2026-09-01 six-workstream split of the proof
program across three research efforts. Headline targets — TREE, FOREST,
TRANSFER, literal counterexample — all remain OPEN. Nothing below moves
them.

## Workstream Scorecard

| Workstream | Status |
|---|---|
| 1 — PAIR-G4 (the decisive diagonal gap) | **Open — active front** |
| 2 — G1/G2 endpoint strict units | **Open — active front** |
| 3 — Dependent quotient decoder formalization | Complete to authorized ceiling; exact-statement residues named |
| 4 — Order-20 census | **Complete** (zero hits, full receipts) |
| 5 — TRS2 witness question | **Closed negatively (erratum, 2026-09-03)** — universal tree TRS2 is refuted at order 26; the conditional theorem stands; see the correction addendum |
| 6 — Lean debt | **Complete** (all items `governed`) |

## The Three Named Targets Now At The Front

1. **The corridor transport lemma (WS1).** The r9 PAIR-G4 run reduced the
   decisive gap to one theorem shape: under the governed closest-corridor
   theorem, an `HminTree`-specific two-rank transport along the unique
   path between the closest p-/q-favorable supports must force a common
   crossing leaf, a doubly-strict typed path edge, or a smaller
   counterexample. Weaker forms are provably insufficient.
2. **`HminTree`-specific strict units (WS2).** Exact certificates show
   saturation, surplus, and unmatched cardinality do not by themselves
   force the strict endpoint signs; the strict units must come from
   first-recovery history.
3. **A blocked-root closure argument (WS5).** The blocked-root state in
   the rooted-tree extension-profile recurrence is a difference of
   products, so convolution closure alone cannot drive a universal
   tree-TRS2 induction; the subtraction needs its own closure argument.
   The witness branch is now bounded below: no negative-total-minor tree
   exists through order 20.

## What Changed Since 2026-09-01

- The exclusion frontier is authenticated and contiguous through order 20
  under one frozen byte contract (previously clean through 17, weaker at
  18–19): any literal first-recovery counterexample has order ≥ 21, at
  bounded tier.
- The decoder formalization stack is gated: decoder core, fidelity
  (narrowed), marker transport (narrowed) at `governed`; recurrence and
  representation-sufficiency at `proved_informal` with residues named.
- Two frozen contract rows were kernel-refuted and repaired inside the
  formalization run — the process catching its own specification errors.
- Eight unguarded proof mechanisms are fenced with exact certificates.

## Claim Boundary

No result here is a headline theorem. Bounded computation is evidence,
never proof. Narrowed closures are not closures of their full rows. See
`evidence/verification-2026-09-02-three-engine.md` for source bindings.

## Addendum (2026-09-03): Workstream 5's Terminal State

The r10 run closed workstream 5 at its ceiling. Four governed Lean
packages now form one kernel-checked chain ending at the conditional
transfer theorem — if every component tree's independence sequence is
TRS2, the forest's is (`proofs/lean/r10-*`; summary at
`experiments/r10-trs2-bt-closure.md`). The condition is the point — the
theorem asserts the implication, never its antecedent — and no headline
target moves. **[Corrected 2026-09-03: the original text here called the
universal antecedent "the open universal tree-TRS2 question." It is not
open; it is refuted at order 26 — see the correction addendum at the end
of this document.]** The run also closed its own search program by
measurement (closure candidates weaker than TRS2 are unfalsifiable
through order 20; every measured stronger candidate failed on 34–98% of
trees; the cross-term counterexample trail carries a strictly positive
compensation margin everywhere it fires). **[Corrected 2026-09-03: the
original text here said one open proposition remained on this axis. That
proposition is refuted — nothing remains open on the universal-TRS2 axis;
the blocked-root subtraction obstruction is moot for a refuted target.]**
Workstreams 1 and 2 (the corridor transport lemma; the strict endpoint
units) are unchanged and remain the open fronts.

## Correction Addendum (2026-09-03): Universal Tree TRS2 Is Refuted

The 09-03 addendum above described workstream 5's residue as "one
proposition, statable in one line of Lean," needing "a structural proof
idea." That framing was wrong. Tree TRS2 is exactly log-concavity of the
raw independence sequence (kernel-checked equivalence, `r8-trs2`), and
universal tree log-concavity is refuted from order 26 by Kadrawi–Levit
(arXiv:2305.01784, reference 4 of `references.md`): T(3,4,4) fails at
rank 13 with deficit −378 while remaining unimodal. The universal branch
is therefore closed negatively; the search-program "pincer" the r10 run
measured was an artifact of probing entirely below order 26. The
conditional `transfer_to_forest` theorem stands, with the bounded
corollary that every forest whose components all have at most 25 vertices
is unimodal. Workstreams 1 and 2 are unaffected — the corridor program
assumes log-concavity nowhere, and the r11 ingredient targets hold on all
tested order-26-to-32 witnesses. Full details:
`erratum-2026-09-03-universal-tree-trs2.md`; replayable witness:
`../evidence/kl-order26-trs2-witness/`.
