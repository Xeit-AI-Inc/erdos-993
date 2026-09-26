# C5-F5 search report

## Assigned question

F5 asks for an attack on a specified mixed-boundary or unsigned cross-tag map, ideally on an asymmetric CB or T_m control, by an exact kernel, deficient cut, or rigorously lifted orbit certificate for the *actual* relation. The C5 allocation and required common handoff name an expanded unsigned two-for-one Hall relation, but the read-first material does not specify its source and target bases, edge incidence, capacities, weights, or which mixed-boundary transitions are included. Without those data there is no determined matrix/network on which to certify a kernel or Hall cut. I therefore do not claim a refutation of that global relation.

## Exact bounded obstruction to tagwise charging

I audited the hash-pinned `inputs/standing-controls/t22-order91.json` (its hash is recorded in `EVIDENCE.json`). The common handoff identifies this as the T22 control. Its recorded exact row has `n=91`, `a=68`, `x=32`, and `p=34`; hence `x+2=p` and `3p=102<137=2a+1`. The control reports 67 favorable leaves, comprising one distinguished marked leaf and 66 equivalent claw-tip leaves, and gives each selected tag's exact summand `g`.

Put `k=p-1=33`. For the distinguished tag, `g=212336130412243110`, so `kg=7007092303604022630>0`. For each of the 66 other tags, `g=-7560098737536570631`, so `kg=-249483258338706830823`. Direct integer addition reproduces the full selected aggregate:

`212336130412243110 + 66(-7560098737536570631) = -498754180547001418536`.

This is an exact deficient *single-tag* budget for any proposed charging that insists every tag pay its own local demand, alongside a negative full sum. It shows why a deletion-sector or pointwise-tag shortfall cannot by itself refute the full unsigned cross-tag network: any successful global construction must allow genuine transfer across tags and explain the distinguished tag's positive deficit. The evidence does not include an incidence-level construction of that transfer, and it does not establish that one is impossible.

## Result and limits

This route found a concrete boundary stress on the T22 control and an exact obstruction to pointwise/tagwise charging. It did not produce a deficient cut for a fully specified cross-tag relation, a kernel of a named unsigned map, or a lifted orbit certificate. The T22 row is a pinned standing control, not a new exhaustive search or an independent replay of its graph polynomial/selector evaluator. In particular, its negative full sum is not a counterexample to the primary aggregate. The primary and the global unsigned relation remain unresolved by this work.
