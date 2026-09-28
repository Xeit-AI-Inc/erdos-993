# C4-U3 independent search report

## Scope and source integrity

Reviewed the Cycle 4 packet, sealed protocol, solution contract, status-grade clarification, neutral handoff, search allocation, and the registered identities for the guarded shifted-C individual and weighted-tip-deck claims. The SHA-256 check of all 174 members of `manifests/C4-COMMON-DISPATCH.json` had zero mismatches. The packet has no additional case files. The current-cycle directions, predecessor structural reductions, and main-mark margin were used as mathematical inputs; the producer witness script was not run.

The primary all-parameter exact-ratio selected-payment predicate remains distinct from these auxiliary likelihood-ratio (LR) candidates. Neither a guarded LR proof nor bounded success below establishes the primary payment. The known unguarded rank-77 witness is outside `2k <= N+2`, as recorded in the neutral handoff, so it does not refute either guarded candidate.

## Conditional selector bridge

Let `W = sum_i r_i A_i` with each branch's original private-tip multiplicity retained. Assume the proposed weighted comparison

`W[p+1] C[p-1] <= W[p] C[p]`

at the actual eligible `p`, and the accepted first-descent fact `Delta_x C < 0`. Since `C=G product_i B_(r_i)` is positive on its coefficient support and log-concave, its adjacent ratios are nonincreasing. The guards give `p >= x+2`; hence

`C[p]/C[p-1] <= C[x+1]/C[x] < 1`.

Also `W[p] > 0` in this domain (each `A_i` contains `z L^N`, and `p` lies in its positive support). Dividing the assumed shifted inequality by positive coefficients yields

`W[p+1]/W[p] <= C[p]/C[p-1] < 1`,

so `Delta_p W < 0`. But `Delta_p W = sum_i r_i Delta_p A_i`; if no branch were strictly selected, every `Delta_p A_i >= 0` and this sum could not be negative. Therefore some branch is strictly selected, with its `r_i` distinct original tip tags. This bridge needs no endpoint selector. It is a conditional proof only: the guarded weighted LR comparison itself remains open. The individual LR comparison would imply the same tip-selection consequence branchwise, but is stronger than needed for this bridge.

## Exact bounded adversarial checks

`shifted_audit.py` independently constructs the literal polynomials with integer multiplication and zero-extended coefficient access. For every nonempty count triple `(a2,a3,a4)` with `a2+a3+a4 <= 18`, it checked every branch instance and every `1 <= k` with `2k <= N+2` for

`A_i[k] C[k] - A_i[k+1] C[k-1] >= 0`,

and checked the same margin with `W` in place of `A_i`. This covered 1,329 profiles, 406,977 individual comparisons, and 27,954 weighted comparisons; there were no negative margins. These computations do not establish universal truth.

As a targeted actual-eligibility check, for 22 distinct arity-3 branches the script reconstructs `P`, finds its least strict descent (including the defined coefficient convention), then checks the literal lower-half guards. It finds `x=32`, `p=34`, `N=66`, `alpha=68`; `Delta_p P=-34715071200280547854`, `Delta_p W=-1487457400844219699268`, and all 22 branch selectors are strict. The guarded individual and weighted LR margins at that rank are positive (minimum individual `3519646978509896300712980023674737675664`; weighted `232296700581653155847056681562532686593824`). This is one bounded row, not proof of the selector bridge's LR premise.

Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 shifted_audit.py
```

The deterministic output is `shifted_audit.json`. No graph census, Lean build, or external source was used. No computation here tests or awards selected MASS, the exact-ratio payment, or an aggregate.

## Proposed disposition and limits

The two registered guarded LR predicates remain `proposed_open`: no proof route or counterexample was completed. The conditional weighted-LR-to-tip-selector bridge is `proposed_informal_proof` at exactly its stated conditional scope. It gives a useful route for a future proof because it reduces selector sufficiency to one weighted comparison, but it does not establish the needed comparison or any payment bound. The actual first strict descent, strict current-`p` selector, lower-half guards, and original multiplicities are retained throughout. No authoritative status change is proposed.
