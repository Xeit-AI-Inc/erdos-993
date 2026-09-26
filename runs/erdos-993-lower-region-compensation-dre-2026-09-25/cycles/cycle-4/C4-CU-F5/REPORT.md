# C4-CU-F5 independent critique of C4-F5

## Dispositions

### E993-ORDINARY-TM-LOWER-REGION-AGGREGATE — retained_narrowed; proposed_open

Retained only as the exact (T_m)-family subproblem in the source claim. The family formulas and finite checks are internally consistent, but they do not prove the assertion for every (m\ge1). The source itself identifies the missing uniform adjacent-coefficient sign estimate. There is no counterexample in the checked range, and no evidence here decides the universal family statement. This family subproblem is narrower than the ordinary-tree lower-region aggregate in the solution contract.

For (T_m), the factorization (P_m=(1+2z)B^m+z(1+z)^{3m+1}), with (B=1+4z+3z^2+z^3), gives α=3m+2. The orbit selector must be applied to the endpoint deletion polynomial and the claw-tip deletion polynomial separately. Each claw contributes three distinct original leaf tags with the same support; multiplying the claw-tip summand by (3m) is required. The submitted formulas preserve that multiplicity. The derivative identity is an algebraic reduction, not a sign argument: neither the first descent of (P_m) nor small total mass of a correction term controls the needed adjacent coefficient difference.

### C4-F5-TM-EXACT-BOUNDED-CHECKS — retained; proposed_bounded

I reran both computations from local scratch copies. The coefficient program regenerated an evidence object exactly equal to the sealed case evidence. I also reran the graph-DP cross-check from a local copy of the pinned ordinary-tree evaluator; its full output matched the sealed graph cross-check. In that scratch copy only, I redirected the evaluator path to the copied evaluator. No sealed evidence was changed.

Across the stated coefficient ranges there are 2,743 eligible (T_m) rows for (m=1..100), 347 equal-arm rows, and 400 lopsided rows; every recorded complete sum is nonpositive. The independent edge-based DP comparison covers 100 (T_m) rows for (m=1..20) and 52 lopsided rows for (m=2..8), with exact agreement. Spot checks include (m=3,p=7), where the endpoint and claw-tip selector deltas are −141 and −110 and (S=-1167), and (m=4,p=9), where they are −850 and −652 and (S=-10089). At (m=100), the recorded eligible interval is (147..201), with 55 rows.

The first descent was scanned through degree α using integer zero-extension. Each recorded row passes (p\ge x+2) and (3p<2α+1); endpoint and claw-tip selector deltas are strictly negative. The edge-based evaluator reconstructs the original degree-one vertices and individual tags from the full tree edges, so shared claw supports are counted once per leaf. These are finite, family-specific checks, not a census of all ordinary trees or a proof for unbounded parameters.

## Proof gaps and scope

No proof or refutation of the all-(m) (T_m) assertion is supplied. No estimate establishes the needed sign uniformly near eligible interval endpoints or around coefficient modes. The lopsided sample changes only one branch size within finite ranges; it does not cover arbitrary branch profiles. No external theorem is invoked. The worker has not proved the global compensation obligation for general ordinary trees, and none follows from these computations.

## Verification record

All 185 source hashes listed by the two packets matched. The four case artifacts were read and replayed in scratch copies; the exact evidence equality and graph-DP comparison are recorded in `EVIDENCE.json`. No formal build or external literature retrieval was used.
