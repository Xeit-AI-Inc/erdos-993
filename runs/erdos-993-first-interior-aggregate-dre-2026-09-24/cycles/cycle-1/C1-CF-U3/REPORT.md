# C1-CF-U3: F critique of C1-U3

Disposition for `C1-U3-EXACT-COUNT-OBSTRUCTION`: **proposed_retained_narrowed**. The coefficient and selector identities are exact for the frozen ordinary-tree definitions. The phrase “obstruction” must mean an unclosed proof obligation, not a proof that no theorem can connect the selector and aggregate under the eligibility hypothesis. This route neither proves the primary inequality nor supplies an eligible positive complete sum. `novelty_claimed: false`.

## Exact check

For an original leaf `v` with original support `s`, set `W=N_T(s)\{v}`. By direct set subtraction, `V(R_v)=V(H_v)\W`. Every independent set of `R_v` is exactly an independent set of `H_v` avoiding `W`, so `I_H-I_R` counts, with coefficient one, precisely the independent sets of `H_v` meeting `W`. If `a_{v,k}` is their count at cardinality `k`, then `a_{v,k}=i_k(H_v)-i_k(R_v)`, including zero-extended ranks. Hence the complete favorable-leaf sum is `S(T,p)=sum_{v in F_p}(a_{v,p}-a_{v,p-1})=A_p-A_{p-1}`. The sum retains one term per original leaf, including multiple leaves of one support. Eligibility implies `p>=2`, so the adjacent ranks are within the natural count range; the identity itself also holds with integer zero extension.

In `T-v`, partition independent sets according to whether they contain `s`. Those omitting it are sets in `H_v`; those containing it are `{s}` plus a set in `R_v`. Thus `I_{T-v}=I_H+z I_R` and exactly `Delta_p(T-v)=Delta_p(H_v)+Delta_{p-1}(R_v)`. This selector inequality compares different coefficient differences from the aggregate summand `Delta_{p-1}(H_v)-Delta_{p-1}(R_v)`. Algebra alone yields no sign for that summand or for their complete selected sum. This is a missing implication, not a counterexample to a possible implication using additional tree or first-descent structure.

## Independent replay and falsification checks

I independently implemented a forest polynomial recurrence in `replay.py`, rather than importing or executing the source evaluator. On the seven-vertex path it compares the set interpretation of `i_k(H)-i_k(R)` against literal subset enumeration for both original leaves at every `k=0,...,7`. For the stated `T_m` construction I used one marked leaf and one representative ordinary arm leaf, then multiplied the latter contribution by the exact `3m` automorphism multiplicity. I checked the `I_{T-v}` decomposition coefficientwise for both leaf types. The first strict descent scan includes `k=alpha` and the zero coefficient beyond the degree.

| m | order | alpha | x | p | favorable leaves | marked summand | ordinary summand | complete S |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 75 | 303 | 227 | 109 | 225 | 226 | -24,975 | -25,422 | -5,744,925 |
| 100 | 403 | 302 | 145 | 300 | 301 | -44,550 | -45,147 | -13,588,650 |
| 150 | 603 | 452 | 217 | 450 | 451 | -100,575 | -101,472 | -45,762,975 |

All three satisfy `x+2<=p`, and all original leaves in these rows pass the strict selector. The results reproduce `C1-U3/fresh_family_results.json`. Replay from the run root after admission: `python3 cycles/cycle-1/C1-CF-U3/replay.py`; the exact captured output is `cycles/cycle-1/C1-CF-U3/replay_results.json`. These three family rows are finite tests only, not a universal sign proof or a census.

The inherited fences cited by C1-U3 are applicable as limits on possible proof shortcuts. The admitted rejected-mechanism registry records the pointwise and support-fibre failures at T22/order 91 (`p=34`), the fixed-Gamma Hall failure at the same row, and a tag-closed Hall failure at CB(8,92)/order 1567 (`p=492`). Their recorded complete aggregate signs are negative where stated, so none is an interior positive-complete-sum counterexample. The order-243 governed beta witness has a semantic-adequacy caveat for ordinary trees and is only an older formal certificate; the order-91 computational refinement is also recorded. The r26 `N2<=M` failure and top-rank residual theorem have different hypotheses/ranks. None is invoked to prove the identity; these facts only restrict interpretation of any later Hall, pointwise, support or top-rank argument. Sources: assigned `cycles/cycle-1/C1-U3/REPORT.md`, `RETURN.json`, `fresh_family.py`, `fresh_family_results.json`, `ordinary_tree_copy.py`; `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `WORKER-PROTOCOL.md`, `packets/C1-REVIEW-PROTOCOL.md`, and common authority listed in `packets/C1-T1.json` (`packets/C1-COMMON-NEUTRAL.md`, `control/CAPSULE-COVERAGE.md`, selected records in `control/REJECTED-MECHANISMS.json`).

No other return or critique was inspected. No Lean build, exhaustive tree census, or unbounded search was performed. The replay commands completed; no owned background jobs remain.
