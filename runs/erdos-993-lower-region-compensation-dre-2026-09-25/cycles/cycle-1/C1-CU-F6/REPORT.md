# Critique of C1-F6-1 (opposing orientation U)

## Disposition: retained

The route's claim is a finite computational observation, not a proof or refutation of the registered universal assertion. Its two search boundaries, row counts, and “no positive complete aggregate” conclusion are accurate under the stated replay code.

## Replay and arithmetic audit

I copied the sealed route replay and the permitted standing-control `ordinary_tree.py` into this worker's `evidence/` directory. In the copied replay only, I changed `ROOT` and `HELPERS` to point at those local copies. I executed that adapted copy from this scratch root; no sealed evidence was executed in place or changed. Its output parses identically to the route's `search-results.json` across the complete JSON object.

The spider enumeration uses nondecreasing tuples of arm lengths in `1..5`, with tuple length `2..6`. The counts by arm number are 15, 35, 70, 126, and 210, totaling 456. It tests every eligible integer rank from `x+2` through `alpha`, applying the strict guard `3p < 2alpha+1`; the replay gives 53 eligible rows and no positive aggregate. The reported maximum is `-230`, at arms `(1,3,3,3,3)`, with `(alpha,x,p)=(9,4,6)`, and five favorable leaves. For this row, the full polynomial is `[1,14,78,226,371,355,202,70,13,1]`; the selector values are `(-46,-67,-67,-67,-67)`, and the five separate leaf-tagged summands are `(-86,-36,-36,-36,-36)`, summing to `-230`.

For the seeded Prüfer sample, the replay draws 220 sequences independently at each of eight orders (`18,22,26,30,34,40,48,56`) using seed `9930601`. This is a sample of sequences and may include repeated labeled trees. It records 1,760 draws, 2,022 eligible rows, and zero positive aggregates. The stated maximum `-2562` and its data match the replay. The first-descent scan includes the terminal zero-extension difference at `alpha`; `x+2<=p` and the strict lower-region bound are applied as stated. The helper computes each selector from the original tree after deleting the leaf, then forms each summand from the original support and closed neighborhood. Favorable leaves are iterated individually, so same-support leaf tags remain distinct.

As additional arithmetic controls, I independently evaluated the permitted star and T-family examples with the copied helper. `K1,12` has `(alpha,x,p)=(12,6,8)`, 12 favorable leaves, and `S=-1980`. T22 and T60 are both eligible and each has one positive summand while its full aggregate is negative: respectively `+212336130412243110` with `S=-498754180547001418536`, and `+2935177632783649903488454322226807645411570590073000` with `S=-1058142362147652597702654588268394677176033202323316960380`. Thus positive local terms cannot be treated as positive full-sum witnesses. This route makes no such inference.

## Exact scope and limitations

The claim is retained at exactly the two finite search scopes stated in the source return. The spider search exhausts its arm-multiset box, not all spiders. The Prüfer search is seeded and non-exhaustive, and repeated draws are possible. Neither search establishes the universal lower-region inequality or rules out a counterexample outside those samples. No proof gap affects the finite observation; the universal assertion remains unresolved by this evidence.

Evidence includes the copied/adapted replay, its complete output, the copied helper used by it, and the separate replay of standing controls. The local path adaptation is the only change to the source replay.
