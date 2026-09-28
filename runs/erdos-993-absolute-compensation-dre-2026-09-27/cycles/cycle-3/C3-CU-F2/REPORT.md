# C3-CU-F2 independent critique

## Disposition

I retain `C3-F2-SMALL-PREFIX-PRIMARY-AND-MASS-BOUNDED` as **exact bounded evidence** for precisely `1 <= m <= 69`. The packet's registered identity snapshot contains no separate key for this worker's finite-prefix claim; the nearby all-`m` selected MASS key remains `OPEN`. This review does not change either universal status.

## Independent check

I copied and replayed the assigned producer script, then ran `evidence/review_prefix.py`, a separate direct-factor polynomial evaluator. It constructs `Q` by multiplying the `B_r` factors and obtains each `H_i` through exact constant-one division, asserting reconstruction. It enumerates every count profile `(c2,c3,c4)` for `1 <= c2+c3+c4 <= 69` and counts `sum_{m=1}^{69} binom(m+2,2)=59,639` profiles. The complete optimized scan finds exactly 68,129 eligible rows, with row totals at each `m` agreeing with the replay.

For every profile it forms `P=C+zL^q`, takes the least `k` with `Delta_k P<0` over the zero-extended sequence including terminal degree, applies all guards `x+2<=p`, `3p<2alpha+1`, and `2p<=alpha`, and evaluates strict current-`p` flags. It preserves each original private-tip multiplicity `c_r*r`. No row has a zero or negative primary or MASS margin.

The minimum primary integer margin is `2348398634845436222199118708110999411248850`; minimum MASS margin is `6064669113032908632786`. Both occur at `(c2,c3,c4)=(0,22,0)`: `m=22`, `N=66`, ordinary-tree order `n=3+m+N=91`, `alpha=68`, `q=67`, `x=32`, `p=34`, `j=32`, `delta=35`. The guards read `34<=34`, `102<137`, and `68<=68`. The flags are `e0=1` and all 22 arity-3 branch flags are 1, so `b=67`. Exact values are `A=6562597338849618725736`, `D_j=212336130412243110`, `C[j]=297795845939942115337`, and `C[j+1]=295365112846734182630`.

The common dispatch (86 members), both transport clarifications (3 members each), and all four packet inputs match their SHA-256 manifests; replay this check with `PYTHONDONTWRITEBYTECODE=1 python3 evidence/verify_transport.py`. Producer replay: `PYTHONDONTWRITEBYTECODE=1 python3 evidence/producer_prefix_replay.py > evidence/producer_prefix_replay.json`. Independent replay: `PYTHONDONTWRITEBYTECODE=1 python3 evidence/review_prefix.py > evidence/review_prefix_result.json`.

## Limits

This is a finite exact scan, not an all-parameter proof, selector theorem, or Lean result. It does not extend the established tail or settle the primary/all-`m` MASS. All universal claim scopes, actual first descent, strict selectors, rank guards, and original multiplicities above are held fixed.
