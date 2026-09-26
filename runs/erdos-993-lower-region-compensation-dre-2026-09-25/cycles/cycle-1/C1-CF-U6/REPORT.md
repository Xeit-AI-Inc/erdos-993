# C1-CF-U6 cross-orientation critique

## Disposition

`C1-U6-1`: **retained** at its stated parameterwise and sign-neutral scope; proposed status remains `proposed_partial`.

The bipartition argument proves `|V(T)| <= 2 alpha(T)`. For fixed `a`, there are only finitely many simple tree isomorphism classes of order at most `2a`; filtering by `alpha=a` gives the fixed-parameter domain. This is a finite decision domain for each fixed eligible `p`, not a uniform finite domain as `a` varies.

For leaves `v,w` with common original support `s`, transposing `v,w` fixes every other vertex and is an automorphism. It identifies `T-v` with `T-w` and `T-{v,s}` with `T-{w,s}`. The graph `T-N_T[s]` does not depend on which leaf is named. Thus both selector values and summands agree. The strict selector consequently selects all leaves at `s` or none, and multiplying a selected common summand by the number of leaves at `s` exactly preserves the distinct-tag aggregate.

The route's coefficient record also retains enough information to check the registered guards: coefficients through `a+1` give `Delta_a` using zero extension, hence allow `x` to be computed through its terminal rank; original `a,p` retain `x+2<=p` and the strict `3p<2a+1` check. These checks are necessary when a finite enumeration is actually run. The route does not claim an enumeration or any universal sign.

## Controls and limits

The supplied controls are consistent with the narrow claim and block stronger sign readings. `K_(1,12)` is a nonempty eligible lower-region example with 12 tagged leaves at one support and negative full sum `-1980`. In `T_22` and `T_60`, a positive selected leaf term coexists with a negative complete sum. Same-support compression preserves these multiplicities and signs; it gives no cross-support compensation bound. These are supplied bounded controls, not independent exhaustive verification by this critique.

I find no defect in the stated finite reduction or the same-support identity. The exact target remains unresolved: there is no uniform bound on `a`, no search result, no bound on the sum across distinct supports, and no proof or counterexample for the primary inequality. The review is not a status award.
