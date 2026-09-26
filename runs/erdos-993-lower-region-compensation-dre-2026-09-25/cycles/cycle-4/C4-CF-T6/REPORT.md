# C4-CF-T6 critique (orientation F)

## Dispositions

### C4-T6-ROOTED-MESSAGE-REDUCTION — retained

The rooted recurrence follows by splitting independent sets according to root inclusion. The three leaf formulas follow by splitting at the support and multiplying over disjoint neighbor branches. The formula for `T-v` includes every other branch at the support, including branches for other original leaves. Each original leaf remains a distinct selector tag and summand, even when supports coincide. The empty-product cases and zero-extended coefficient extraction are consistent with the contract.

Scope retained: the displayed polynomial identities hold for all finite ordinary trees and arbitrary tagged original leaves. They provide an exact finite-input evaluator only; the favorable selector and first-descent rank remain separate inputs, and no uniform sign follows.

### C4-T6-PRIMARY-GLOBAL-BOUND — retained

The source return says the route did not resolve the lower-region aggregate. That accurately describes its evidence: exact message identities but no uniform coefficient comparison, eligible positive full sum, or proof of the global inequality. This is not evidence that the target is false or that no message invariant can exist. The target remains open under precisely the contract's guards `x(T)+2<=p` and `3p<2 alpha(T)+1`.

## Audit checks

I independently derived the messages and deletion identities from independent-set decomposition, rather than treating the worker's formulas as proof. Rank `k=p-1` yields the selected local coefficient difference only after the selector `Delta_p(T-v)<0` is applied; the recurrences do not silently change that rank or selector. The report preserves original supports, closed neighborhoods, and distinct leaves sharing a support. The route contains no specific graph witness or computation whose numerical arithmetic could establish the global claim.

Hash check: all 179 common listed sources and all 3 case-listed files matched their packet SHA-256 values. No code replay was applicable because the case includes no replay source; the derivation above is the independent check. No Lean build or background process was used.

See `EVIDENCE.md` for the complete derivation and scope check.

## Limitations

This review verifies the algebraic recurrence but does not test it against an exhaustive or sampled graph census. It supplies no global compensation argument and no eligible refutation. The primary target therefore remains unresolved; all statuses below are proposed only.
