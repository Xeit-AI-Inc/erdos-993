# C2-CT-F2 — constructive T critique of C2-F2

**Authority:** proposed worker critique only. I recommend retaining both assigned incoming claims at their exact scopes. Neither establishes the primary favorable-leaf aggregate. I found no false step to repair in the small-alpha proof. A new order-245 tree tests the proposed high-tail pointwise route beyond the inherited order-243 local witness; it has negative terms and a negative complete sum, so it is a falsification *target checked*, not a falsification.

## Source boundary and replay

I read only the pinned `cycles/cycle-2/C2-F2/{REPORT.md,RETURN.json,replay_target.py}`, this case and review protocol, the worker and semantic/solution contracts, `packets/C2-T1-v2.json`, and the following historical files listed there: `packets/C2-COMMON-NEUTRAL.md`, `proposals/cycle2/SMALL-CASE-REDUCTION-ADDENDUM.md`, `control/C2-SCOPE-AUDIT.md`, and `proposals/cycle2/latest-code/packages/r27-c1-la4-descent-order-bounds/{THEOREM-CONTRACT.md,INFORMAL-PROOF.md,VERIFICATION-REPORT.md,receipts/RECEIPT-SUMMARY.json,source/LeanProof/Main.lean}`. The three C2-F2 source hashes matched the case packet. The imported r27 source hash also matched the common packet. No current sibling returns or unlisted controller notes were read.

I copied the origin script into this scratchpad as `origin_replay_copy.py`, then ran it here. Independently, `audit.py` counts independent sets by the include/exclude tree recursion: for a rooted vertex, the polynomial with the vertex absent is the product of the sums of its children's absent/present polynomials; with it present, it is `z` times the product of children's absent polynomials. Component polynomials multiply. This exact integer recurrence is valid for every induced forest used below. On the nine-vertex origin graph it agrees with the all-subsets origin replay, including every selector and term. The independent path-245 calculation also agrees coefficient by coefficient with `i_k(P_245)=binom(246-k,k)` for `0<=k<=123`.

Replay from the run root:

```
python3 scratchpad/C2-CT-F2/origin_replay_copy.py
python3 scratchpad/C2-CT-F2/audit.py
```

After admission, use the corresponding `cycles/cycle-2/C2-CT-F2/` paths. Both commands completed successfully. No Lean build was run.

## Incoming `C2-F2-ELIGIBILITY-ALPHA-GE-SEVEN`: retain

Here `a=alpha(T)`, `n=|V(T)|`, `x=min{k>=0: Delta_k(T)<0}`, and integer `p=a-2`. Eligibility is exactly `x+4<=a`, so `a>=4`. The pinned r27 `forest_descent_linear_bound` declaration in `.../source/LeanProof/Main.lean` states for every finite acyclic simple graph, every natural `k`, and `delta G (k:Z)<0`, that `n<=4k`. Its `indepCount` counts independent finsets, `coeff` gives integer zero extension, and `delta=coeff(k+1)-coeff(k)`, matching this contract. The package reports formal verification, kernel verification, and fidelity passage; the critique uses that imported result and makes no new Lean claim. A connected tree is an acyclic graph, and `Delta_x<0` by definition, so `n<=4x` applies without a first-descent-minimality premise.

Assume `a<=6`. Since `a>=4`, the tree has an edge, whence `a+1<=n`. Therefore

```
a+1 <= n <= 4x <= 4(a-4),  hence 17 <= 3a.
```

With integer `a<=6`, this forces `a=6`; then `x<=2`, while `7<=n<=4x` forces `x=2` and `n in {7,8}`. These inequalities also exclude `x=0`, `a=4`, and `a=5`; no truncated natural subtraction is used.

For a tree, `i_2=binom(n-1,2)`. Inclusion-exclusion over its `n-1` edges gives

```
i_3 = binom(n,3) - (n-1)(n-2) + sum_u binom(deg(u),2),
6 Delta_2 = (n-1)(n-2)(n-9) + 6 sum_u binom(deg(u),2).
```

Each edge forbids exactly `n-2` triples, and a triple with two edges is a wedge counted at its unique centre. A triangle would be needed for three tree edges in a triple, so there is no further inclusion-exclusion term. This verifies the exact identity in the pinned `SMALL-CASE-REDUCTION-ADDENDUM.md` independently.

At `n=7`, a six-element independent set has a one-vertex complementary cover. Every one of the six edges meets that vertex, so its degree is six and `Delta_2>=-10+binom(6,2)=5>0`. At `n=8`, a six-element independent set has a two-vertex complementary cover `{u,w}`. Every one of the seven edges meets this cover, so `d(u)+d(w)>=7` (an edge `uw` can count twice). The minimum of `binom(d,2)+binom(e,2)` over nonnegative integers with `d+e>=7` is nine: reduce a larger total to seven without increasing the expression, then balance seven as `3+4`. Hence `Delta_2>=-7+9=2>0`. Both contradict the strict `Delta_x=Delta_2<0`. Thus eligibility implies `a>=7` at the exact ordinary connected tree scope. This is a theorem conditional on the separately verified r27 bound, with elementary remaining steps; it is not an aggregate sign or a forest eligibility statement.

## Incoming `C2-F2-FRESH-ELIGIBLE-ORDER-NINE-REPLAY`: retain

The origin edge set is `(0,2),(1,2),(3,2),(5,4),(7,4),(4,6),(6,2),(2,8)`. It has nine vertices, eight edges, and is connected, so is a tree. Both independent calculations give counts `(1,9,28,42,39,22,7,1)` through its top degree; `a=7`, `x=3`, `p=5`, and `x+2=p`. The original leaves are exactly `0,1,3,5,7,8`. In that order, their pairs `(Delta_p(T-v), Delta_(p-1)(H_v)-Delta_(p-1)(R_v))` are

```
(-5,-10), (-5,-10), (-5,-10), (-6,-8), (-6,-8), (-5,-10).
```

All six selector differences are strictly negative. The four leaves at support 2 remain four separate tags, so the complete selected sum is `4*(-10)+2*(-8)=-56`. The origin's `(-3)` first descent is at rank three, before the rank-five selector. The fresh graph establishes one exact eligible instance with negative complete sum, no universal sign conclusion.

## Fresh larger falsification target

Define a 245-vertex tree by retaining the origin's eight edges, adding `(0,9)`, then all edges `(j,j+1)` for `9<=j<=243`. It is the origin core with one pendant path from vertex 0 through 244. The recurrence in `audit.py` checks all induced deletion polynomials at the target rank. Its outputs are `a=125`, `x=69`, `p=123`, with `x+2=71<=123`, `n=245<=4x=276`, and `3p=369>=2a+1=251`. Thus it lies in the ordinary eligible and proposed high-tail scopes, and is larger than the inherited 243-vertex witness. Its original leaves are `1,3,5,7,8,244`; original vertex 0 is no longer a leaf. Their exact selector/term pairs are

```
1:   (-7144,-8523976)
3:   (-7144,-8523976)
5:   (-7145,-8523974)
7:   (-7145,-8523974)
8:   (-7144,-8523976)
244: (-281435,-7975276)
```

All six are favorable, and the complete sum is `-50595152`. The first descent is exact: `i_69=248177032609558773421853034986622438512689031891670` and `i_70=238999118532800403028567901575211069706033443389980`; the recurrence checks all earlier adjacent differences to identify `x=69`. The rank-near-target coefficients are `i_122=4093202801`, `i_123=8538266`, `i_124=7146`. As a second large arithmetic cross-check, the independent path `P_245` has `(a,x,p)=(123,68,121)`, is eligible, has two favorable leaf tags each with selector `-310001` and term `-9071249`, and complete sum `-18142498`. The path calculation is cross-checked against the closed binomial formula. These are two specified graphs, not a sweep; neither gives a positive local term or complete sum.

The inherited order-91 and order-243 positive local witnesses in `control/C2-SCOPE-AUDIT.md` sit below the proposed `3p>=2a+1` high-tail guard. The order-245 tests above do satisfy it. I did not test a universal high-tail proof, all tree shapes, or an asymptotic family sign.

## Disposition and limits

Both incoming IDs are retained at their statements, with no extension to the primary `S(T,p)<=0` theorem. The proposed alpha-seven exclusion combines a verified imported r27 forest bound with the explicit small-tree arithmetic. The order-nine replay is exact finite evidence and is novel only as that displayed graph check. The order-245 construction is a new computational target with negative margins, not a counterexample. No own background jobs remain running; all owned executions have terminated.
