# C3-CU-F4 critique report

## Scope and disposition

I reviewed the single source claim `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` from C3-F4 in opposing orientation U. **Disposition: retained_narrowed; proposed status: proposed_open.** The route accurately reports bounded controls and no resolution. Its claim is retained only as a report of those checks; it supplies neither a proof nor an eligible counterexample to the registered complete-sum statement.

## Independent arithmetic and scope audit

I copied the sealed route computation and the packet-pinned ordinary-tree evaluator into this scratch directory and replayed the copied computation in the foreground. The evaluator import was redirected only in the local script copy. `REPLAY.json` records the reproduced output. The marked `K1,7` control has `q_3=15`, `q_4=20`, and cover number 1, so it disproves the relaxed marked-shadow inequality without its cover-at-least-3 hypothesis; it does not concern an eligible ordinary-tree row.

For the listed order-11 tree, the replay gives independence polynomial `[1,11,45,105,161,161,105,43,10,1]`, alpha 9, and terminal first strict descent x=5. All eight listed leaves satisfy the strict rank-4 selector, with seven separate leaves at support 0 contributing +19 each and the leaf at support 9 contributing +14; the complete fixed-selector sum is +147. This verifies the calculation and same-support multiplicity. But `x+2=7>4`, so the example is ineligible and cannot refute the target.

The p=3 and p=4 exclusions at parent order `n=2p+3` check out: for p=3, `Delta_1=19>0`, and for p=4, `Delta_2=30+sum_v binom(d(v),2)>0` with earlier differences positive. These imply the required early-descent bounds fail. The 12,000-draw-per-rank Prüfer sample reproduces counts 355, 10,727, 11,951, 11,998, and 12,000 eligible rows for p=6 through 10, respectively, and finds no positive favorable local term. It is a seeded sample, not exhaustive evidence.

## Proof and limitation audit

The route does not claim to prove the first-order shell result; it explicitly says it did not independently verify the imported first-wide classification or Catalan-floor premises. Its bounded checks do not validate that candidate proof, nor do they settle orders `n>=2p+3`. The candidate's cover threshold, marked-shadow argument, and leaf specialization therefore remain outside this route claim's proven results here. In particular, the route's positive full sum is not target evidence because it fails the strict first-descent guard. No change to the registered theorem status follows.

The route's exact computation and its narrow conclusion are consistent with the source packet. I find no arithmetic, selector, support multiplicity, or eligibility error in its reported examples. I narrow the retained claim to the reproduced controls and sample and leave the primary mathematical obligation open.
