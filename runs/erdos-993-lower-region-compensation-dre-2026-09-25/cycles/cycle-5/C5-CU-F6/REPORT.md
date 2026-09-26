# C5-CU-F6 independent critique (orientation U)

## Scope and disposition

I audited both source claims in the sealed C5-F6 case. Both are **retained** at their stated limited scopes. The low-cover example is a valid witness that the proposed universal `tau(T) >= 7` shortcut fails. The finite six-arm census reproduces exactly. Neither claim proves or refutes the primary aggregate or a general pointwise sign.

## Independent replay and arithmetic

I copied the pinned `COMPUTE.py` to this worker directory and ran that copy in the foreground; its JSON output is `REPLAY.json`. Separately, `AUDIT.py` builds explicit adjacency lists and computes independence polynomials of induced forests through an include/exclude tree dynamic program. It tests every original degree-one vertex for the fixed strict selector, constructs both deletions from the original support, and sums only selected terms. This second implementation independently reproduces the census and the witness data in `AUDIT-RESULTS.json`.

For the witness, take root 0, six centers `1,4,8,12,16,20`, and arm leaf counts `(2,3,3,3,3,3)`. Center 1 is adjacent to leaves 2,3; center 4 to 5,6,7; center 8 to 9,10,11; center 12 to 13,14,15; center 16 to 17,18,19; and center 20 to 21,22,23. Each center is adjacent to 0. This is an ordinary tree with 24 vertices. Its count vector from rank 0 through alpha is

`(1,24,253,1566,6400,18419,38970,62650,78593,78515,63348,41582,22199,9548,3240,836,154,18,1)`.

Thus `alpha=18`; `Delta_8=78515-78593=-78`, and the zero-extended terminal difference is `Delta_18=-1`, so the first descent is `x=8`. For `p=10`, `x+2=p` and `3p=30<37=2alpha+1`. Deleting any one of the two leaves on the 2-leaf arm gives selector difference `Delta_10(T-v)=-13234`; each of the other 15 leaves gives `-12357`. Hence the fixed selector contains all 17 original leaves. Their support-deletion and closed-neighborhood differences are respectively `(-8532)-(-3657)=-4875` twice and `(-9409)-(-1872)=-7537` fifteen times. Therefore the exact full sum is `2(-4875)+15(-7537)=-122805`.

The six centers cover all edges. Choosing one pendant edge at each center gives a matching of size six, so the vertex-cover number is exactly six. This verifies the counterexample to a universal eligible-tree lower bound of seven. Its negative selected terms and negative full sum explicitly do not refute the sought sign statements.

## Bounded family census

The family consists only of a root joined to six centers, each center having `d_i >= 0` pendant leaves, with sorted tuple and `sum d_i=2p-3`. For `p=10,11,12,13`, there are respectively `163,235,331,454` sorted tuples. The independent graph-DP census found one eligible row at `p=10`, namely `(2,3,3,3,3,3)`, and none at the other three ranks. In the sole eligible row all 17 selected terms are negative: two are `-4875` and fifteen are `-7537`; in particular there is no positive selected pointwise term. The replay covers every sorted tuple in this specified family and makes no graph-isomorphism or all-tree claim beyond it.

## Limitations

- The census covers only this root-plus-six-centers family for `p=10..13`, not all ordinary trees of those orders or all low-cover trees.
- The low-cover witness only refutes the proposed `tau>=7` shortcut; its full selected sum is negative.
- No general third-shell pointwise-sign result, sufficient low-cover replacement, or primary aggregate proof/refutation is established.
