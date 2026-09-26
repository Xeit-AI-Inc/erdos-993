# C1-AT exact checks and provenance

## Pin audit

The assigned `C1-AT.json` lists 63 worker source files and `C1-COMMON.json` lists 16 common files. A foreground SHA-256 check of the bytes of every listed file against its packet digest returned zero mismatches. Only packet-listed files were read. This evidence file and `REPORT.md` are new C1-AT artifacts, not source pins.

## Direct small control

For `T=K_(1,12)`, the coefficient vector of `I_T=(1+z)^12+z`, from rank 0 to 12, is

`[1,13,66,220,495,792,924,792,495,220,66,12,1]`.

The first negative adjacent difference is `Delta_6=792-924=-132`; `Delta_5=924-792=132`, and the binomial sequence before rank 5 is increasing. Thus `a=12`, `x=6`. With `p=8`, `x+2=8<=p` and `3p=24<25=2a+1`. For every one of the 12 leaves, `T-v=K_(1,11)` has coefficient vector

`[1,12,55,165,330,462,462,330,165,55,11,1]`;

therefore `Delta_8(T-v)=55-165=-110<0`. The graph `H=T-{v,s_v}` is 11 isolates, with vector

`[1,11,55,165,330,462,462,330,165,55,11,1]`.

`R=T-N_T[s_v]` is empty, with polynomial 1. At `k=p-1=7`, `Delta_7(H)=165-330=-165`, `Delta_7(R)=0`, and the full sum of all 12 selected tags is `12*(-165)=-1980`. Pair pruning gives precisely `H`, with `a'=11` and `x'=6` (`Delta_5=462-462=0`, `Delta_6=330-462=-132`), so `3p=24<23=2a'+1` fails.

## Large standing-row arithmetic

The two pinned files `inputs/standing-controls/t22-order91.json` and `inputs/standing-controls/t60-order243.json` each contain a `complete_row.summands` array with one dictionary per selected original leaf. Summing the integer `g` field of **all** 67 and 181 dictionaries, respectively, gives their recorded complete aggregates:

| Pinned control | Order | `a` | `x` | `p` | Guard `3p<2a+1` | Selected tags | First marked `g` | Sum of every `g` |
| --- | ---: | ---: | ---: | ---: | --- | ---: | ---: | ---: |
| `T_22` | 91 | 68 | 32 | 34 | `102<137` | 67 | `+212336130412243110` | `-498754180547001418536` |
| `T_60` | 243 | 182 | 87 | 90 | `270<365` | 181 | `+2935177632783649903488454322226807645411570590073000` | `-1058142362147652597702654588268394677176033202323316960380` |

The guards `x+2<=p` read `34<=34` and `89<=90`. This adjudicator checked the integer row sums and packet pins, but did not rerun their tree construction or dynamic program. The C1-CF-T5 critic reports an independent two-tree recurrence replay, and C1-CU-T5 explicitly limits its check to recorded-row grouping. These controls justify rejecting pointwise or per-tag matching as a universal proof strategy; both full selected sums are negative.

## Proof dependencies

The star theorem, deletion recurrences, bipartite marked-incidence identity, expectation double count, rooted support-fibre formula, and full-simplex diagnostic in `REPORT.md` each have elementary proofs there. The finite control rows depend on the pinned JSON data for their stated graph-specific values. The broader Ehrenborg–Hetyei forest homotopy citation is reported as a source-route dependency only; no adjudicated aggregate implication uses it. No computation here is an exhaustive generation of eligible trees.
