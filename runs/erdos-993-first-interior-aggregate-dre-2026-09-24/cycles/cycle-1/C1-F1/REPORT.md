# C1-F1 search report

**Orientation F; cycle 1; novelty_claimed: false.** The frozen target remains unresolved from this seat: I found no exact positive eligible aggregate and no universal proof. The order-243 T-family check is a larger exact target instance, not a counterexample and not evidence for all trees.

## Exact target replay

I copied the admitted `sources/standing-controls/ordinary_tree.py` evaluator byte-for-byte into this scratch directory and evaluated with Python 3 integer arithmetic. My `x` routine checks all integer ranks through `alpha`, including the contract's terminal zero-extension value `Delta_alpha=-1`; it does not use the copied evaluator's `first_strict_descent`, which omits that terminal rank. For each original leaf tag separately, I computed `Delta_p(T-v)`, retained it iff strictly negative, then computed `Delta_(p-1)(H_v)-Delta_(p-1)(R_v)`. The script records the complete selector count, multiplicity of every distinct summand value, and their sum in `evidence.json`.

The family `T_m` is the admitted r19 construction from the evaluator: a root joined to one pendant path of length two and to `m` disjoint `K_{1,3}` arms (each arm is root–center–three leaves). These are ordinary trees. At the actual target rank, the `m=22` tree has order 91, `alpha=68`, `x=32`, `p=66=alpha-2`, so `x+2=34<=66`. All 67 original leaves pass the strict selector, with one summand `-2079` and 66 summands `-2208`, giving the complete sum `-147807`. At the larger fresh member `m=60`, order 243, `alpha=182`, `x=87`, `p=180=alpha-2`, and `89<=180`. All 181 original leaves pass; one summand is `-15930`, 180 are `-16287`, and the complete sum is `-2947590`.

As a bounded check, the same target-rank eligibility predicate was evaluated on every labeled Prüfer tree of orders 2 through 8 (275,392 labeled trees total). There were zero eligible rows in this range. This does not extend the existing complete ordinary-tree census, and it is not a counterexample search with any positive coverage at the target rank.

## Falsified shortcut and standing fences

A potentially tempting strengthening, that every favorable-leaf summand is nonpositive at every eligible rank, is false. The exact `T_22` row at `p=34=x+2` has all 67 original leaves favorable, one summand `+212336130412243110`, 66 summands `-7560098737536570631`, and complete sum `-498754180547001418536`. The exact `T_60` row at `p=90=x+3` similarly has one positive summand `2935177632783649903488454322226807645411570590073000`, 180 equal negative summands, and complete sum `-1058142362147652597702654588268394677176033202323316960380`. Both rows are below `alpha-2` (their `alpha` values are 68 and 182), so they falsify the broad pointwise shortcut but do **not** falsify a pointwise claim restricted to the target rank, and neither is a target counterexample. These checks align with the admitted r24 record that positive summands occur inside negative complete sums.

The inherited universal tree log-concavity/real-rootedness mechanisms are refuted in the registry and cannot justify the aggregate here; I used neither. Universal pointwise beta and support-fibre signs are also refuted, with T22 at order 91 as an admitted witness. Hall, tag-closed Hall, and raw edge-addition monotonicity are refuted mechanisms for earlier proof routes; none is needed for the coefficient computation or supplies a target witness. Their failures leave the primary coefficient inequality open. The predecessor r26 theorem applies only at `p=alpha-1` under residuality, so it cannot establish or refute this `p=alpha-2`, all-tree target.

## Replay and limits

From the run root, replay with:

```sh
python3 cycles/cycle-1/C1-F1/summary.py
```

The script imports only the byte-copy `cycles/cycle-1/C1-F1/ordinary_tree_copy.py`. It deterministically rebuilds the two T-family trees and the bounded labeled sweep, then prints the evidence JSON. The construction function is the copied `t_family(m)`; its edges are given by the explicit family description above.

No silent residual, log-concavity, positivity, or other residual hypothesis was used. No Lean build was run. The bounded Prüfer sweep contains no eligible target rows, and the two larger rows are family instances only. I did not discover a positive complete sum, a general summand theorem, or a proof covering trees outside `T_m`; therefore the frozen primary claim remains open. All scripts and generated data are under this seat's scratch directory; no background jobs remain.
