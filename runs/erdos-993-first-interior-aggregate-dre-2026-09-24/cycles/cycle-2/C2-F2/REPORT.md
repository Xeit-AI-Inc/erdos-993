# C2-F2 — F search report

**Proposed worker result only.** I found no eligible ordinary tree with `alpha <= 6` and no defect in the proposed use of r27's `n <= 4x` bound, the tree `i_2/i_3` identity, or the one-/two-vertex-cover estimates. The small-alpha exclusion proof is valid at its stated tree and strict-first-descent scope. It does not prove the tagged high-tail shadow inequality or the primary complete-sum theorem; those remain unproved/open here.

## Definitions and proof of the exclusion

Use the frozen conventions: `Delta_k=i_(k+1)-i_k` with integer zero extension, `x` the least natural `k` with `Delta_k<0`, and integer `p=alpha-2`. Eligibility `x+2<=p` is exactly `x+4<=alpha`.

The pinned r27 C1-LA4 statement is: for every finite acyclic simple graph `G`, natural `k`, and strict `Delta_k(G)<0`, `|V(G)|<=4k` (`forest_descent_linear_bound`; see its displayed Lean declaration in `proposals/cycle2/latest-code/packages/r27-c1-la4-descent-order-bounds/source/LeanProof/Main.lean` and its statement/derivation in `.../INFORMAL-PROOF.md`, §§1, 4). A finite ordinary tree meets finiteness and acyclicity. At `k=x`, the defining property of first descent gives the required strict negative difference. The coefficient and rank conventions in the r27 proof match `SEMANTIC-CONTRACT.md`; the first-descent minimality is not needed for the bound itself, only for naming `x`.

Suppose, for contradiction, that an eligible tree has `a=alpha<=6`. Since `x+4<=a`, `a>=4` and `x<=a-4`. A tree with `a>=4` has at least two vertices and at least one edge, so its full vertex set is not independent and `a+1<=n`. Combining this with r27 gives

`a+1 <= n <= 4x <= 4(a-4)`,

so `17<=3a`, hence `a=6`. Then `x<=2`; also `7<=n<=4x`, so `x=2` and `n` is either 7 or 8. Thus `Delta_x=Delta_2<0`.

For an `n`-vertex tree, every pair except an edge is independent, so `i_2=binom(n-1,2)`. For triples, inclusion-exclusion over the `n-1` edges gives

`i_3=binom(n,3)-(n-1)(n-2)+sum_u binom(deg(u),2)`.

Each edge lies in `n-2` triples. A triple containing two tree edges is uniquely a pair of incident edges at their common vertex, counted by the displayed degree sum; no triple contains three edges because a tree has no triangle. Therefore

`Delta_2=(n-1)(n-2)(n-9)/6 + sum_u binom(deg(u),2)`.

This independently checks the exact identity in `proposals/cycle2/SMALL-CASE-REDUCTION-ADDENDUM.md`; the division-by-six form is an integer identity, and multiplying by six avoids division if formalized.

If `n=7`, an independent set of size `a=6` leaves a one-vertex complement `{u}`. That complement is a vertex cover, so all six tree edges meet `u` and `deg(u)=6`. The formula gives `Delta_2=-10+binom(6,2)=5`, contradicting strict descent.

If `n=8`, a maximum independent set leaves a two-vertex vertex cover `{u,w}`. The seven edges are all incident to at least one of `u,w`, hence `d=deg(u), e=deg(w)` satisfy `d+e>=7`. For nonnegative integers with this sum, `binom(d,2)+binom(e,2)>=9`: the minimum at total 7 is the balanced split 3+4, giving 3+6, and larger totals cannot decrease the sum. Thus `Delta_2>=-7+9=2`, again a contradiction. The possible edge `uw` is counted twice in `d+e`, which only strengthens the needed `d+e>=7` inequality.

There is no hidden `alpha=4` or `5` case: the displayed linear inequalities exclude them before the tree coefficient formula is used. The `x=0` case is also excluded by `n<=4x` together with `n>=7`; no natural subtraction is used.

## Exact larger target and boundary fence

As a fresh self-built eligible target above the impossible `alpha<=6` range, use the 9-vertex tree with edges

`(0,2),(1,2),(3,2),(5,4),(7,4),(4,6),(6,2),(2,8)`.

Its exact independence counts, obtained by enumerating all subsets in the included standalone script, are `(1,9,28,42,39,22,7,1)`, so `alpha=7`. Zero extension gives differences `(8,19,14,-3,-17,-15,-6,-1)` through the terminal rank, hence `x=3`, `p=5`, and `x+2=p`; also `n=9<=12=4x`. The six original leaves are all strictly favorable at `p=5`; in leaf order `0,1,3,5,7,8` their selector/term pairs are `(-5,-10),(-5,-10),(-5,-10),(-6,-8),(-6,-8),(-5,-10)`. Thus the complete sum is exactly `-56`. This is one exact graph check, not a census or general sign evidence.

As a boundary check, `K_{1,6}` has `alpha=6`, independent counts `i_k=binom(6,k)` for `k>=1` and `i_0=1`, first strict descent `x=3`, and `p=4`; it fails eligibility because `x+2=5>4`. This agrees with the proved exclusion and is not an in-scope counterexample.

The inherited Cycle 1 eligible non-residual ten-vertex graph has `(alpha,x,p)=(7,3,5)`, all six selected terms negative, and `S=-72` (C1 synthesis report, “Finite evidence and provenance reconciliation”); it therefore does not attack the boundary claim or high-tail sign. The positive T22 local term at rank 34 is below that tree's target rank 66 and below the high-tail guard, while its target-rank sum is negative. C2's pinned scope audit likewise records T22 `(alpha,p)=(68,34)` with `3p=102<137`, and T60 `(182,90)` with `270<365`; both positive local witnesses are outside the proposed guard. These fences are relevant to a pointwise high-tail route but do not contradict the eligibility exclusion. The negative eligible family and finite witnesses from Cycle 1 also supply no attack on this exclusion.

## Scope and limitations

The exclusion is a universal mathematical consequence of the pinned forest descent bound plus the elementary tree identities above; it is not inferred from the Cycle 1 census of 280,392 labeled trees of orders 2–8. No new exhaustive tree census was run. The standalone replay covers exactly the displayed order-9 graph by all-subset enumeration. No Lean build was run, as required for this search stage.

The computation does not establish `k q_(k+1)<=2(alpha(H)-k)q_k`, the proposed bipartite leaf high-tail pointwise sign, or the primary complete favorable-leaf aggregate. Nor does failure to find an alpha<=6 attack upgrade the OPEN status of any incoming claim. The only proposed result is the precise small-alpha eligibility implication already scoped as `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`.

From the run root, replay the fresh target with:

`python3 scratchpad/C2-F2/replay_target.py`

After controller admission at the expected path:

`python3 cycles/cycle-2/C2-F2/replay_target.py`

No background jobs were started; all owned executions have terminated, and all writes are complete.
