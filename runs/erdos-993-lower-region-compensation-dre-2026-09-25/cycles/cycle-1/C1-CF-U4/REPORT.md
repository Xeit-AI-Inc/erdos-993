# C1-CF-U4 — independent critique of C1-U4-1

## Disposition: retained

The claim is correct at its stated partial scope. For every original leaf tag `v`, its decomposition and the two resulting coefficient identities have the correct rank shifts and signs. The selector is the sign test

`q_(p+1)-q_p+r_(p+1)-r_(p-1)<0`,

whereas the selected summand is `q_p-q_(p-1)`. Summing the latter over the fixed favorable set gives the exact target aggregate, one term for each selected original leaf, including leaves sharing a support. The difference between these expressions identifies a missing comparison for this direct coefficient-operator route. It is not a proof that every possible route must use one specified inequality.

The cited Chudnovsky–Seymour result is accurately scoped: Theorem 1.1 proves real-rootedness for claw-free graph independence polynomials, while the target includes ordinary trees with induced claws. The paper itself exhibits `K_{1,3}` as non-real-rooted. The theorem as stated supplies no comparison between the mixed coefficient differences under the favorable-leaf selector. This checks the cited route's hypothesis gap, not the nonexistence of other useful theorems.

The contract guards are respected: the audit uses the original support and neighborhood, preserves all leaf tags, treats the selector as strict, and relies on zero-extended coefficients. Since `p>=x+2` and `x>=0`, `p>=2`, so the `p-1` rank is defined. The lower-region slack is positive but is not itself a bound on the selected coefficient differences. There is no proof of the primary aggregate or of the optional `D+C` budget, and no counterexample is offered.

The standing controls remain consistent with this limited conclusion. `K_(1,12)` is an eligible finite negative aggregate. The `T_22` and `T_60` controls have positive marked terms but negative complete sums, so local positivity cannot decide the global statement. This route makes no new inequality prediction against those controls. I rely on their admitted values in `NEUTRAL-HANDOFF.md`; I did not replay their source computations.

The full derivation, source theorem check, exact scope, and limitations are in [independent-audit.md](evidence/independent-audit.md). No computation or source-script replay was required for this symbolic claim.
