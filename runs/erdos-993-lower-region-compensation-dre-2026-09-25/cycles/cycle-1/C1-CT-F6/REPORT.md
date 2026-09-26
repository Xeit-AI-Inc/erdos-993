# C1-F6 cross-orientation critique (orientation T)

## Disposition

**C1-F6-1: retained_narrowed.** The exact bounded observation replays. Its spider count is 456 generated arm-length multisets, not a claim of 456 nonisomorphic trees; its Prüfer count is 1,760 seeded sequence draws, not a deduplicated tree census. The result is limited to those generated cases and eligible ranks.

## Audit and replay

The source route has one claim: no positive complete selected aggregate occurred in its bounded spider and seeded Prüfer searches. I copied its replay script and the listed `ordinary_tree.py` helper to this seat’s `evidence/` directory, changed only the helper lookup to the local copied helper, and directed stdout to `evidence/replayed-results.json`. The sealed source script and results were not modified. A structural JSON comparison of the replay output and the source `search-results.json` returned identical results.

The spider loop ranges over arm counts 2 through 6 and nondecreasing arm lengths in 1 through 5. This yields 15+35+70+126+210 = 456 parameter multisets and covers every spider parameter choice in that box. It yields 53 eligible rank rows, none positive; the maximal aggregate is -230 at arms (1,3,3,3,3), with alpha=9, x=4, p=6. The stated polynomial is [1,14,78,226,371,355,202,70,13,1]. Its first negative difference is Delta_4=-16, and the strict lower guard is 3p=18<19=2alpha+1. The five original leaves have Delta_6(T-v)=(-46,-67,-67,-67,-67), so all five enter the fixed selector; their summands (-86,-36,-36,-36,-36) sum to -230.

The Prüfer loop draws 220 sequences at each of orders 18, 22, 26, 30, 34, 40, 48, and 56 using seed 9930601, for 1,760 draws and 2,022 eligible rank rows. No aggregate is positive; the greatest is -2562 at order 18, alpha=12, x=6, p=8, with eight favorable leaves. The source result stores the exact graph, coefficient vector, selector leaves, and all summands for this maximum. Both search loops calculate x by scanning all ranks 0 through alpha, including the terminal zero-extension difference. Eligibility is checked with x+2<=p and strict 3p<2alpha+1. The helper evaluates the full sum over original leaves selected by Delta_p(T-v)<0 and preserves distinct leaf entries even at repeated supports.

This is a reproducible bounded computation, not a proof or counterexample for the universal lower-region claim. The spider parameter box is finite but not an exhaustive census of ordinary trees; the seeded Prüfer draws can repeat labeled trees and are not exhaustive even within their orders. No asymptotic or transport inequality is established.

## Standing controls and scope fences

The admitted order-91 T22 lower-region control has alpha=68, x=32, p=34, 67 favorable leaves, and complete sum -498754180547001418536 despite one favorable marked summand +212336130412243110. The order-243 T60 control has alpha=182, x=87, p=90, 181 favorable leaves, and complete sum -1058142362147652597702654588268394677176033202323316960380 despite a marked summand +2935177632783649903488454322226807645411570590073000. Both satisfy the strict lower-region guards. These controls reinforce why the source route correctly reports complete sums rather than drawing conclusions from local signs. The five listed Kadrawi-Levit fixtures are non-log-concave and evaluated without a log-concavity filter; their stored aggregate rows do not alter the bounded scope here.

The r28 order-22 T22 slot-dominance counterexample, refuted pointwise/support-fibre claims, and auxiliary tagged identities do not decide this finite-search claim or promote its scope. The route invokes no theorem from the literature and proposes no proof bridge. No claim beyond the exact finite observations is retained.

## Evidence files

- `evidence/replay_search.py`: source replay copy with only scratch-local helper-path adaptation.
- `evidence/ordinary_tree.py`: listed helper copied for scratch-only replay.
- `evidence/replayed-results.json`: exact replay output matching the listed source JSON.
