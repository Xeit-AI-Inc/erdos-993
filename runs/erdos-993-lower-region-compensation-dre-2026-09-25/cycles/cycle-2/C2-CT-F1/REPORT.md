# C2-CT-F1 cross-orientation critique (orientation T)

## Disposition

**retained_narrowed.** The one route claim is the registered `E993-LOWER-REGION-FIRST-ORDER-SHELL` assertion. Its exact statement has the intended ordinary-tree, first-descent, strict lower-region, fixed favorable-leaf selector, original support/neighborhood, and full-sum scope. The route does not prove that universal assertion. It does supply a bounded census at `p=7`, `|V(T)|=16`, i.e. the `|T|=2p+2` shell at one rank. I therefore retain only that finite computation as supported evidence; the universal shell claim remains open.

## Independent audit of the finite computation

I replayed the route computation from scratch-local copies of its listed `ordinary_tree_checked.py` and `forest24.py` sources. `REPLAY.py` differs from the sealed `COMPUTE.py` only by redirecting imports to those local copies and redirecting output to `REPLAY-RESULT.json`. The replayed JSON object is identical to the listed `RESULT.json` (including all 1,696 full rows); both have SHA-256 `3ca4842362f1945434c7e8e3be2280a5b16a187f6fa1f101c50888d64faac`.

The replay generated 19,320 distinct order-16 free-tree encodings and found 1,696 eligible trees. Every eligible tree has `alpha=11`, `x=5`; at `p=7`, the guards are exactly `5+2<=7` and `21<23`. The complete selected sums range from `-1759` to `-906`, with zero nonnegative rows. Each row includes the full independence polynomial, every original leaf's `Delta_7(T-v)`, the strict selected set, and each selected leaf's separate `Delta_6` values and summand.

The rank arithmetic uses zero extension. The evaluator scans through `j=alpha`; since `i_(alpha+1)=0` and `i_alpha>0`, `Delta_alpha=-i_alpha<0`, so the terminal descent is included. For each original leaf, selection is tested on `T-v` at `p=7`. For selected leaves the code separately evaluates `T-{v,s_v}` and `T-N_T[s_v]` at rank difference 6, using the original graph's support and closed neighborhood. It iterates over leaves rather than supports, so equal-support leaves retain multiplicity. Its subset replay independently checks independence masks and rank counts for the full tree and every required deletion universe, then checks all selector decisions, terms, and the total.

The generation boundary is exactly order 16. The pinned generator constructs rooted classes through size 8 and uses unicentroid components up to size 7 and the equal-halves bicentroid case; its callback checks unique centroid codes and the expected free-tree count 19,320. I reviewed and replayed that generator, but did not give a separate proof of its canonical centroid enumeration. No other shell order or rank is established.

## Standing controls and use

The standing order-91 and order-243 controls each have a positive selected local summand but a negative complete aggregate, so they do not furnish counterexamples to this full-sum claim; they are relevant fences against inferring a global failure from one leaf. The fresh order-252 shell control is also a complete eligible row with negative aggregate, but it is a different order/rank and does not enlarge this replayed census. The five named non-log-concave fixtures reinforce that the evaluator must not rely on log-concavity; this computation uses direct integer independence counts and no such filter. The p=7 census is useful as an exact bounded shell check with complete selectors and multiplicities, while the universal shell gap remains untouched.

## Proof gaps and scope

There is no derivation reducing arbitrary shell trees to order 16, no inequality for arbitrary `p`, and no counterexample. A finite negative census, however complete within its stated boundary, cannot settle the registered universal assertion. The report's claim wording is universal while its evidence is finite; the narrowed statement below makes that distinction explicit. No imported theorem or unregistered lemma is needed for this computation, and no controller status is awarded.

## Limitations

- Evidence covers only all generated unlabeled ordinary trees at `p=7`, order 16; it does not cover any other shell rank/order or prove the universal shell claim.
- The replay uses the pinned generator and evaluator implementations; this critique independently reran them and checked complete row equality, but does not independently formalize/prove the generator's canonical-class theorem.
- Computation is exact integer evidence at a finite boundary only.
- This worker proposes dispositions and awards no authoritative status.
