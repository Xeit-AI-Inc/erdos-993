# C4-T3 search: mixed boundary on the matching sector

## Scope and setup

I isolate the hub-and-arm upper sector specified in the C4 colored-shadow direction. With the central root and arm leaf fixed in an upper source, stripping them leaves a rank-491 independent set in 736 disjoint support-leaf edges for CB(8,92). Identify each edge with a color having two possible vertices. This is the rank-491 level of the product poset on 736 two-element choices. The calculation below concerns ordinary deletions that keep the two fixed vertices. It is not a calculation of the complete favorable-leaf sum.

## Exact arbitrary-subfamily bound

Let `A` be any subfamily of this rank-491 level, and let `D(A)` be the union of its one-element deletion targets in rank 490. Each source has exactly 491 deletion edges. A rank-490 target extends to at most `2(736-490)=492` rank-491 members: choose one of the 246 unused colors and one of its two vertices. Double-counting the edges from `A` gives

`491 |A| <= 492 |D(A)|`, hence `|D(A)| >= (491/492)|A|`.

This needs no compression assumption and applies to every source subset. For the whole level, every rank-490 target has all 492 extensions in the level, so equality holds. The source and target level sizes are respectively `binom(736,491) 2^491` and `binom(736,490) 2^490`; their ratio is exactly `492/491`. The exact deletion-only shortfall for the whole level is `binom(736,491)2^491 / 492` sources (an integer).

Thus an unweighted colored lower-shadow estimate, even at its sharp whole-level value, leaves a positive deficit in this sector. Additional hub-insertion targets are numerically necessary if one seeks to route every source. The argument does not show that those targets are available: their capacity may already be demanded by sources outside this sector, and a target can be shared by demands from different leaf tags.

## Mixed-boundary bottleneck

For a genuine weighted Hall argument, a subfamily must be tested against the union of its deletion and insertion targets with the insertion capacity reduced by competing source demands. The bound above controls only the deletion boundary. It neither proves a compression preserves the insertion boundary nor bounds the competing demand at a hub-present lower target. The local one-support branch route recorded in the common direction handles only a specified subfamily, so it does not fill this arbitrary-subfamily gap.

I found no complete mixed-boundary inequality for CB(8,92) or the all-parameter tree target in this route. In particular, the exact deletion deficit is a necessary accounting amount for the full matching-sector level, not a counterexample to the complete aggregate: insertion arcs and other source families have not been jointly routed here.

## Evidence grade and limitations

The level sizes, degrees, ratio, and arbitrary-subfamily edge inequality are exact elementary counting. No colored-shadow theorem is imported. The result is a sector-level necessary bound only; the complete selected-tag graph, external competing demand, all favorable leaves, and full aggregate remain untreated. No universal conclusion follows.
