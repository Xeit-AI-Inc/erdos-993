# C3-CU-T4 critique of C3-T4

## Disposition

**C3-T4-ODD-SHELL-REDUCTION: retained_narrowed.** The first-mark partition identity, the shadow bound for residuals of order at most `2k-1`, and the matching-plus-isolate coefficient calculation are valid. The stated exhaustive classification of the two largest residual orders is false as written: it assumes every marked vertex has a neighbor in `H`. An ordinary leaf adjacent to the selected support becomes isolated in `H`, and this occurs for a favorable leaf in an eligible instance.

The exact narrowed statement is: for any fixed ordering of `W`, the first-mark classes partition independent sets meeting `W`, and their contributions to `q_(k+1)-q_k` are `i_k(J_i)-i_(k-1)(J_i)`. For `|V(J_i)|<=2k-1`, the incidence count gives `i_k(J_i)<=i_(k-1)(J_i)`. If `J_i` is a matching of `k` edges plus one isolate, then `i_k-i_(k-1)=2^(k-2)(4-binomial(k,2))`. No exhaustive classification of the boundary residuals follows without separately treating isolated marks.

## Decisive residual-classification counterexample

The replay tree has vertices `0..22` and edges `0-1, 1-2, 1-3, 0-4`, and, for `j=0..5`, `4-(5+3j), (5+3j)-(6+3j), (5+3j)-(7+3j)`. This is a connected acyclic 23-vertex tree. At `p=10`, its independence-count vector from rank 0 through `alpha=15` is recorded in `critique-evidence.json`. The first negative forward difference is at `x=7` (the preceding difference at rank 6 is positive); hence `x+2=9<=10` and `3p=30<31=2alpha+1`.

For selected original leaf `v=2`, support `s=1`, the exact value `Delta_10(T-v)=-3434`, so `v` belongs to the fixed selector. In `H=T-{2,1}`, `W={0,3}`; their `H`-degrees are respectively 1 and 0. With the nonisolated mark first, the first-mark residual for the second mark is `J_2=H-{0,3}`: the removed set is the current closed neighborhood `{3}` together with the earlier **mark vertex** `{0}`, and `|J_2|=19=2k+1` for `k=9`. This is an order-`2k+1` residual with `i=2` and `d_H(w_i)=0`, absent from the route's claimed unique case (`i=1`, degree 1). If the isolate is ordered first instead, its closed neighborhood has size 1 and `J_1` has order 20=`2k+2`, contradicting the claimed general order bound. The first-mark identity itself replays exactly: the two boundary differences are `-2628` and `-1437`, summing to `q_10-q_9=-4065`.

This instance also has the complete favorable-leaf set and all 14 individual aggregate summands in the evidence file. Its full aggregate is `-44250`, so it is not a counterexample to the primary inequality. The other leaves sharing a support remain separate selector entries in the replay.

## Other checks and limits

The matching-plus-isolate polynomial expansion gives
`i_r=2^r binomial(k,r)+2^(r-1)binomial(k,r-1)`; subtracting at `r=k` and `r=k-1` yields the route's displayed formula. The residual shadow estimate follows by counting `k`-set / `(k-1)`-set incidences: each lower set has at most `|V(J)|-k+1<=k` extensions when `|V(J)|<=2k-1`.

All 118 packet-listed source hashes were checked with no mismatch. The three route files and the permitted evaluator were copied into this scratch root before replay; the replay script reads the local evaluator copy. No external theorem, census-wide inference, or status award is used. This critique identifies a missing boundary case; it neither proves nor refutes the complete lower-region aggregate.
