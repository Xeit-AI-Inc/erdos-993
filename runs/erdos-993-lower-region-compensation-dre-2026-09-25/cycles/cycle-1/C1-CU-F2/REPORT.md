# C1-CU-F2 critique of C1-F2-1

## Disposition

**retained** as a bounded-computation observation only. The exact claim is that, for the source script's fixed seed, 1,200 generated trees and documented order/mode ranges, its 878 eligible tree-rank rows contain no positive full aggregate and no positive tagged summand. It does not establish the universal lower-region inequality.

## Replay and arithmetic

I copied the source replay into this seat's `evidence/` and changed only its evaluator import root and result output path. The adapted replay uses the hash-pinned `inputs/ordinary_tree_checked.py` and writes its result under this seat's scratch. `replay_comparison.json` shows exact equality with the pinned source result for the seed, generation descriptor, counts, best complete row, all 1,200 cases and positive rows. Thus the finite counts and the reported closest-to-zero row replay exactly.

The row with largest aggregate is sample index 886, order 11, mode 1. Its edge list is the double star with central edge 0--1, four leaves at 1 and five leaves at 0. Its independence polynomial is `[1,11,45,100,140,132,85,36,9,1]`, so `alpha=9`. Using the evaluator's zero-extended difference through rank `alpha`, `x=4`; `p=6` meets `x+2<=p` and `3p=18<19=2alpha+1`. All nine original leaves satisfy the strict selector: four have `Delta_6(T-v)=-21`, five have `-20`. The nine separately tagged summands are four `-27` and five `-29`, giving `S=-253`. The replay also finds no positive summand or aggregate in any sampled eligible row.

The generator constructs ordinary trees: modes 0 and 1 attach each new vertex to one earlier vertex, and mode 2 attaches connected rooted gadgets to a path backbone. Those recipes give connected acyclic graphs, but the random fixed-seed sample is not a complete generation of trees at any order. No theorem or structural exclusion bridges it to all ordinary trees.

## Scope, controls, and usefulness

The result is useful as a reproducible negative search observation within these three seeded construction modes (orders 9--36). It cannot resolve the registered claim; it has no proof gap to repair because it asserts no universal theorem. The absence of positive summands is also sample-specific. The common handoff's order-91 and order-243 controls have a positive selected local term but negative complete sums, so local positivity alone cannot refute the aggregate. Its `K_(1,12)` lower-region example is likewise a finite negative check, not a proof. These controls are consistent with the reported sample and add no universal inference.

No transport mechanism or sufficient condition is proposed by the source claim, so there is no proposed mechanism to test against the local-positive/full-negative controls. There is no imported citation, and the separate tagged-incidence identity is not invoked.

## Replay limitation

The sealed `search.py` sets `ROOT` to `Path(__file__).resolve().parents[3]`. At its admitted location this resolves to the `cycles` directory, making the subsequent `/inputs` import path incorrect. Its final write also targets the adjacent sealed `search_results.json`. Therefore the report's literal instruction to run that file in place is not safe/reproducible as written. I did not run it in place: the copied replay in this evidence folder uses the authorized project input and writes only here. With that disclosed path adaptation, its substantive output reproduces exactly.

No standing-control scripts that write into their source directories were run. No source evidence was modified.
