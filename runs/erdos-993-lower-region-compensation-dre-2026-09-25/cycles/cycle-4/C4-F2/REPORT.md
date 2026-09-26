# C4-F2 search report

## Scope and method

I attacked the flat addability budget `(x+1)Q-E`, the separate current-rank budget `(p-1)Q-E`, and the target budget `(p-1)Q-(E-C)` as distinct finite diagnostics. For each eligible tree/rank pair, the favorable set was recomputed from the original tree by testing `Delta_p(T-v)<0` at every original degree-one vertex. For each selected leaf tag I used its original support, formed `H_v=T-{v,s_v}`, `W_v=N_T(s_v)-{v}`, and `R_v=T-N_T[s_v]`, and counted marked independent sets and actual addable vertices. `S` was independently accumulated from the coefficient differences in the pinned ordinary-tree evaluator.

The main corpus in `SEARCH.py` comprises all labeled Prüfer trees through order 7, seeded Prüfer samples at orders 8–16, brooms and path-plus-two-leaf graft profiles at orders 8–16, and every spider arm-length partition at orders 8–20. It contains 24,067 generated instances counting repetitions. It produced 339 eligible tree/rank pairs with nonempty selector. All three budget gaps were nonnegative in all 339. A separate two-hub graft profile search (`PROFILE-SEARCH.py`) found 287 eligible pairs and again no proper favorable selector; that companion search was a selector stress, not a second budget census.

## Exact stress row

For the star `K1,19`, the original leaves are vertices 1 through 19 and the center is 0. Its independence polynomial coefficients from rank 0 through 19 are recorded in `EVIDENCE.json`. The first strict descent is `x=10`, with `i_10=92,378` and `i_11=75,582`. At `p=12`, the guards hold: `x+2=p` and `3p=36<39=2 alpha+1`. Every original leaf is favorable, so `F` is the complete set of 19 leaves.

Here `k=11`. For each leaf tag, deleting its leaf and center leaves 18 isolated vertices, all in `W_v`; hence `q_v(11)=C(18,11)=31,824` and `q_v(12)=C(18,12)=18,564`. Each marked 11-set has exactly seven addable vertices, giving 222,768 total actual addabilities for that tag. Every upper 12-set is multiply marked, so `C_v=18,564`. The per-tag summand is `-13,260`, and the complete aggregate is `S=-251,940`. Summing yields `Q=604,656`, `E=4,232,592`, `C=U=352,716`; all three budget gaps are positive and are listed with arithmetic checks in `EVIDENCE.json`.

## Conclusion and limitations

This search found no finite counterexample to any of the three budgets and no positive complete aggregate. It does not establish any universal inequality. The eligible rows in both corpora had `F` equal to the full original leaf set. That is a material coverage gap for the assigned adversarial proper-selector route: the sampled trees did not test cancellation caused by excluding some leaves. The targeted two-hub profile result is only that no proper selector appeared in that stated family and parameter box; it does not prove such selectors impossible. No external literature theorem was used.

Replay the main corpus with `python3 SEARCH.py` and the selector stress with `python3 PROFILE-SEARCH.py` from this directory. Both use only the pinned `inputs/ordinary_tree_checked.py` helper and exact integer arithmetic. The source-level graph recipes, seed, boundaries, counts, complete stress row, and grades are in `EVIDENCE.json`.
