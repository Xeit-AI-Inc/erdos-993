# C4-F1 independent critique

## Disposition

**C4-F1-bounded-CTx-selector-search — retained.** Its statement is confined to the exact seeded, labeled Prüfer sample and its bounded calculations. The retained status does not support a universal CT_x bound or the primary lower-region aggregate.

## Independent checks

The four exact case-file hashes matched their packet pins; all 179 listed common-source hashes also matched. I read the required common read-first files, the additional `C4-CRITIC-BRIEF.md`, and only the four case-listed C4-F1 files.

I executed a scratch copy of the producer replay. It regenerated 1,836 encodings (204 at each order 8 through 16), 37 eligible rows, and zero proper-selector rows. Per-order eligible counts were 0, 0, 0, 1, 0, 9, 18, 5, and 4.

I separately audited every eligible row in the regenerated ledger. For each graph, I checked the edge count, connectivity, acyclicity, and every original degree-one vertex. I reconstructed its independence polynomial with the generic induced-forest recurrence `P(G)=P(G-v)+zP(G-N[v])`, zero-extended it through the terminal ranks, and recomputed the first strict negative difference. For every original leaf, including leaf label 0 when it had degree one, I independently recalculated `Delta_p(T-v)`, selector membership, its original support, and its summand. The reconstructed selector and summands agree row by row. The audit covers 310 selected leaf tags; 36 eligible rows have distinct leaf tags sharing a support, and those tags were retained separately in each sum.

For every selected tag I also used literal independent-subset enumeration in `H` to count actual addable vertices `E` and multiply-marked upper sets `C` once per set. These counts match the ledger and satisfy `E=kU+C`; all row values satisfy `E<=(x+1)Q`. All 37 exact full sums agree with the ledger and are negative. The independent method and machine-readable check results are in `audit.py` and `AUDIT-EVIDENCE.json`; the replay output and executed replay copy are included alongside them.

## Scope and limitations

The replay is a seeded sample of labeled Prüfer encodings, with isomorphic duplicates retained, orders 8–16 only, and no proven coverage boundary. Zero proper-selector examples in this sample do not show that proper selectors cannot occur. All rows have `p=x+2`, so the sample does not separate the CT_x and current-rank budgets. Negative sampled aggregates and positive sampled budget gaps are bounded observations, not a proof, and no positive full aggregate was found. No literature theorem or external mathematical premise was used. The universal claim remains unresolved by this route.
