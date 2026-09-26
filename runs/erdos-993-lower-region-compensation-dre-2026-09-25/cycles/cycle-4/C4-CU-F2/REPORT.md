# C4-CU-F2 critique

## Disposition

**C4-F2-BOUNDED-BUDGET-SEARCH — retained.** The claim is accurate as a bounded search result at the exact generation scope reported by C4-F2. It does not establish any universal budget or the primary aggregate.

## Independent audit

I verified the packet hashes for all listed common and case files. I read the exact case evidence, search scripts, report, return, required common files, and the additional critic brief. I replayed both case scripts from scratch-local copies, using a scratch-local copy of the hash-pinned `ordinary_tree_checked.py` helper. The copied scripts had only their import path redirected to the scratch root. The replay reproduced all material counters in the submitted evidence: 24,067 main generated instances; 339 eligible pairs, all with nonempty favorable set; zero proper favorable subsets; no flat, current, or target budget violations; and 287 eligible pairs in the two-hub selector stress with no proper selector. The latter script assesses selector incidence only. Replay output is summarized in `REPLAY-RESULTS.json`.

I independently reconstructed the fully reported star row by binomial formulas. For K1,19, the coefficients are i0=1, i1=20, and ij=binomial(19,j) for j>=2. The terminal zero extension is consistent; the first strict descent is x=10, since Delta9=0 and Delta10=-16,796. At p=12, x+2=p and 36<39. Deleting any original leaf gives K1,18 and Delta12=binomial(18,13)-binomial(18,12)=-9,996, so all 19 leaf tags, including all same-support tags, are selected. For each tag H is 18 isolated vertices, W is all 18, and R is empty. Thus q11=31,824, q12=18,564, there are seven actual addable vertices per marked 11-set, and every 12-set is multiply marked. This gives E=222,768, C=18,564, and summand -13,260 per tag. The complete sums and both displayed identities agree exactly with the source evidence; calculations are in `STAR-CHECK.json`.

## Scope and gaps

The generation boundary is exactly the small-order exhaustive Prüfer range, seeded samples, stated broom and graft families, and spider partitions in the source report/evidence, plus the stated bounded two-hub profile box. The replay supports the claim about those finite populations. The repeated search is not a proof of a universal inequality and does not exercise proper-selector cancellation: every eligible pair in both reported populations has F equal to the full original leaf set. The star row checks arithmetic and realizability, but is not a positive aggregate or a counterexample. No citation or proof bridge is offered, and none is needed for the bounded search claim.

The scripts use exact integer counts and their rank loop correctly implements 3p<2alpha+1 for integer p as p<=floor(2alpha/3), with an explicit strict guard. The evaluator's first-descent scan includes the terminal rank against zero extension. The route therefore has no identified scope, selector, arithmetic, or standing defect as a finite computational observation. Its principal usefulness is a reproducible negative search and an explicit indication that its samples miss the proper-selector regime; it leaves the registered primary assertion OPEN.

