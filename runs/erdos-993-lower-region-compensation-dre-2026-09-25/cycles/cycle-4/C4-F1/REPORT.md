# C4-F1 search report

## Scope and disposition

This route investigated the F1 lens: stress the early-to-current marked-occupancy bound on varied trees, prioritizing eligible rows with a proper favorable-leaf selector. The bounded run found no proper-selector row and no positive full aggregate. It does not prove the proposed bound or the registered aggregate. Both remain open at this route's evidence grade.

## Exact bounded protocol

I verified all 179 SHA-256 entries listed in `packets/C4-COMMON.json` against their exact paths (179 matched, none missing or mismatched). I read the five common read-first files and `control/C4-SEARCH-ALLOCATION.json`; the C4-F1 packet listed no additional source files. The route computation uses only the protocol below and does not import a research source.

`REPLAY.py` enumerates 200 seeded pseudorandom Prüfer words at each order 8 through 16, using `random.Random(993041)` continuously in increasing order, then appends four fixed shape-biased words at each order: the constant-zero word, the constant-`floor(n/2)` word, alternating 0/1, and paired residues modulo `max(2,floor(n/3))`. This gives 204 labeled encodings per order, 1,836 encodings total. Isomorphic duplicates are retained. The complete generator definition and seed are embedded in `EVIDENCE.json`. This is a sample, not a census of trees.

For each encoding, edges come from the standard smallest-current-leaf Prüfer decoder. Degrees and original leaves are reconstructed from those edges. A bit-mask recurrence enumerates every independent set once and accumulates the exact independence polynomial of `T` and each `T-v`. Counts are integer vectors padded with zeros beyond rank `n`; `x` is the first negative difference in that zero-extended vector. The selector tests each original degree-one vertex using its own `Delta_p(T-v)`. For each selected leaf, its unique original support gives `H=T-{v,s_v}` and `R=T-N[s_v]`; exact independent-set enumeration gives `q(k)`, `q(k+1)`, actual addability `E`, and the once-per-set multiply-marked count `C`. The script asserts, row by row, both `E=kU+C` and `kS=(2a+1-3p)Q-D-C`, where `D=2(a-1-k)Q-E`. It records every eligible row, its graph edges, `i_j(T)`, all `Delta_j(T)`, each leaf's selector difference and membership, every selected support and summand, and the aggregate quantities.

Eligibility was checked exactly as `p>=x+2` and `3p<2a+1`. For this integer search the latter is implemented by scanning all `p` through `floor(2a/3)`. Every eligible row is included in the evidence, including the proper-selector Boolean; the proper count is zero.

## Results

| Order | Encodings | Eligible rows | Proper-selector rows |
|---:|---:|---:|---:|
| 8 | 204 | 0 | 0 |
| 9 | 204 | 0 | 0 |
| 10 | 204 | 0 | 0 |
| 11 | 204 | 1 | 0 |
| 12 | 204 | 0 | 0 |
| 13 | 204 | 9 | 0 |
| 14 | 204 | 18 | 0 |
| 15 | 204 | 5 | 0 |
| 16 | 204 | 4 | 0 |
| **Total** | **1,836** | **37** | **0** |

The 37 eligible rows came from 37 distinct sampled encodings. Every one had `p=x+2`; none sampled a higher eligible `p`. All original leaves passed the strict selector test in each row, so `F` was the full leaf set every time. There were 22 degree profiles among eligible rows; their maximum degrees ranged from 3 to 15. Across the complete sample, each order had 11–30 distinct degree profiles, and sampled maximum degree rose as high as 15. Thus the input encodings include highly branched and varied degree profiles, but the eligible portion did not yield a proper selector. This observed obstruction is limited to this generator and boundary.

For the eligible rows, `alpha` ranged from 9 to 15, `x` from 4 to 8, and `p` from 6 to 10. The exact aggregate `S` ranged from `-15015` to `-222`; there was no positive row. The CT_x gap `(x+1)Q-E` ranged from `1001` to `120120`, positive throughout. Since every row had `p=x+2`, the current-rank gap `(p-1)Q-E` equals the CT_x gap in this sample; the run therefore does not distinguish those two budgets. The full row-level values and arithmetic are in `EVIDENCE.json` and can be regenerated with `python3 REPLAY.py`.

## Mathematical conclusion and gaps

The search gives bounded stress evidence only. It supplies neither a universal CT_x compensation argument nor a counterexample. In particular, zero proper-selector samples do not establish that a proper selector cannot occur. A useful next bounded search would target eligible trees with asymmetric leaf supports and seek rank variation among the values `Delta_p(T-v)`; proving such a construction or a structural obstruction remains open here. No literature theorem was used.
