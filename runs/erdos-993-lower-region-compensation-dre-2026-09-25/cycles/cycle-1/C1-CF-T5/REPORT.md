# Cross-orientation critique of C1-T5

**Worker:** C1-CF-T5 · **Cycle:** 1 · **Stage:** critique · **Orientation:** F

## Findings

The support-fibre identity in C1-T5-1 is correct. For each original support `s`, deleting a selected leaf and its support leaves the other pendant leaves and all rooted non-leaf branches, while deleting `N_T[s]` leaves each branch with its root removed. Hence the two deletion polynomials are `P_s` and `Q_s`; partition at the support gives `I(T-v)=P_s+zQ_s`. This proves the selector is constant on the fibre, each leaf summand is `Delta_(p-1)(P_s-Q_s)`, and the complete sum carries the multiplicity `m_s`. The derivation does not use eligibility and remains valid with zero-extended coefficients.

The rooted recurrence is a useful exact transfer representation. It does not control the sign of the sum: selector and contribution use different ranks and different polynomial combinations, and no compensation between selected support fibres is established. The source correctly leaves this as a gap.

I replayed the recurrence on the standing `T_22` and `T_60` local-positive/full-negative controls using a standalone DP and the original tree deletion operations. For every leaf, the rooted polynomials matched direct deletion polynomials; each support-fibre selector matched the direct `T-v` selector. The replay reproduced `(a,x,p)=(68,32,34)` and `S=-498754180547001418536` for `T_22`, and `(182,87,90)` and `S=-1058142362147652597702654588268394677176033202323316960380` for `T_60`. In both controls the marked leaf is selected and has a positive summand (`+212336130412243110` and `+2935177632783649903488454322226807645411570590073000`, respectively). Thus these controls validate the identity while confirming that a pointwise sign invariant cannot prove the global assertion.

The primary-target source claim is retained narrowly as “no proof or eligible counterexample was supplied by this route; the target remains unresolved on this evidence.” This is not a verdict on the registered mathematical claim. Neither the formula nor the two finite controls establish the lower-region inequality or produce an eligible refutation.

## Claim dispositions

- `C1-T5-1`: **retained** — exact support-fibre identity, with multiplicities and the stated original-graph deletions.
- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: **retained_narrowed** — only the source's report that its transfer reduction did not settle the target; the global assertion remains outside the result proved here.

## Limitations

The replay covers exactly two named control trees and is not an exhaustive generation. No positive complete sum, universal bound, induction invariant, or imported theorem is supplied. The independent recurrence replay and detailed audit are in `evidence/rooted_transfer_replay.py`, `evidence/rooted_transfer_replay.json`, and `evidence/critique-audit.md`.
