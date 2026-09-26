# C1-CU-T4 critique report

## Claim audited

`C1-T4-1` gives an exact first-moment reformulation of the favorable-leaf selector and distinguishes it from the marked adjacent-rank quantity in the target summand. The double count is correct: for `G=T-v`, a uniform independent `p`-set has expected addability `(p+1)i_(p+1)(G)/i_p(G)`, so `Delta_p(G)<0` is equivalent to expectation below `p+1` whenever the denominator is positive. For a favorable leaf that denominator is necessarily positive, since zero rank-`p` count forces zero rank-`p+1` count.

The summand is `q_v(p)-q_v(p-1)` for the marked counts in `H_v`. Counting addable incidences of marked rank-`k` sets correctly yields `kq_v(k+1)+C_v`, with multiply marked extensions contributing once each to `C_v`. These computations concern different graphs, ranks, and measures; none supplies a transfer from the selector's unconditioned mean on `T-v` to the marked measure on `H_v`.

The stated deficit identity leaves the exact missing obligation

`sum_F(D_v+C_v) >= (2a+1-3p) sum_F q_v(p-1)`.

The coefficient is positive under the strict lower-region hypothesis. Nonnegativity of the deficits therefore does not prove the budget. The source correctly leaves the aggregate unresolved and claims neither an eligible counterexample nor a proof.

## Disposition

Retained as an exact partial reformulation, with its stated denominator condition. No change to the source scope is needed. This disposition does not decide the registered aggregate. The supplied finite controls do not provide the missing transfer; their positive local terms alongside negative full sums also caution against treating a local sign as a global refutation. Control values were not independently replayed because they are not used to establish this claim.

## Limitations

No proof of the global deficit budget, eligible counterexample, literature theorem bridge, or independent finite search is provided. Any use of the probability statement beyond the unconditioned rank-`p` measure would require an additional proved comparison.
