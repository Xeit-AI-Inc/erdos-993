# C4-CT-F1 critique (orientation T)

## Reviewed claim

**C4-F1-bounded-CTx-selector-search — retained.** The statement is retained at exactly its bounded sample scope. The claim is a report of the specified 1,836 labeled Prüfer encodings and the exact counts obtained there; it makes no universal inference.

## Independent audit

All 183 common and case-listed source hashes matched (179 common entries and 4 case entries). The common read-first files, the additional `control/C4-CRITIC-BRIEF.md`, and the four exact C4-F1 case files were the materials used. The source replay was copied into this scratch root and executed here; its generated `EVIDENCE.json` is byte-for-byte identical to the pinned route evidence.

I then checked the claim independently in two ways. `CENSUS-AUDIT.py` regenerated the 200 seeded words and four fixed words at each order, decoded them with a heap-based Prüfer decoder, and applied a direct edge-conflict test to every vertex subset of all 1,836 sampled trees. It independently reproduced the eligible-row totals by order (0, 0, 0, 1, 0, 9, 18, 5, 4), for 37 total, and found no proper selector. `AUDIT.py` used direct subset enumeration again on each eligible evidence row to check connectedness and the tree edge count, every original leaf, the padded independence vector and first descent, each `T-v` selector difference, the full selected leaf list, all `H/R` terms, actual addability, once-per-set multiply-marked counts, and the aggregate. All 37 rows matched. Every row has `p=x+2`, `F` equal to the complete original leaf set, `S<0`, and positive `(x+1)Q-E`.

The incidence check is internally consistent: for each selected leaf tag, an upper marked set with one mark contributes `k` deletions and one with at least two marks contributes `k+1`; hence the reported `E=kU+C` uses actual addable vertices and counts each multiply-marked upper set once for that tag. The route's specialization and reported gaps agree with the exact per-row arithmetic. Shared supports remain separate leaf summands in the evidence.

## Disposition and limits

The finite computation supports the stated bounded claim. It does not establish the CT_x bound or the ordinary-tree aggregate. The sample is not exhaustive over labeled or unlabeled trees at any order, includes isomorphic duplicates, and reaches no eligible `p>x+2`; its zero proper-selector count is only an observation about this generator and range. The negative sums and positive CT_x gaps do not close the universal proof obligation.

No counterexample, literature bridge, or general theorem follows from these rows. Proposed status remains `proposed_bounded`; only the controller can award a verdict.
