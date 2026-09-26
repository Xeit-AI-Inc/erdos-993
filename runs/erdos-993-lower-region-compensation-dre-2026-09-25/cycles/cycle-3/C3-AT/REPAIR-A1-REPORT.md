# C3-AT-REPAIR-A1: proposed correction to the T4 pendant-graft row

## Scope and authority

This is a fresh, bounded proposal to the controller, with producerID `C3-AT-REPAIR-A1`. It changes no source file or registry status. I verified the SHA-256 digest of all 192 files listed in the exact brief before reading the relevant pinned sources; all matched. The independent calculation is in `INDEPENDENT-AUDIT.py`, and its full integer output is `EVIDENCE.json`. It imports no route program and enumerates every vertex subset of each of the two specified graphs. The controller's separate literal audit agrees with the independently obtained integers, but is not the basis of the result.

The contract uses the **original-tree** leaves, supports and closed neighborhoods. At rank `p=9`, a leaf `v` is selected exactly when `Delta_9(T-v)<0`. Write `H_v=T-{v,s_v}`, `R_v=T-N_T[s_v]`, and `q_v(j)=i_j(H_v)-i_j(R_v)`. Every selected leaf contributes `q_v(9)-q_v(8)` separately, even when three leaves have the same support.

## Graph and eligibility reconstruction

`T4` has vertices `0..18` and edges `(0,1),(1,2)` together with `(0,c)` and `(c,c+1),(c,c+2),(c,c+3)` for each `c` in `{3,7,11,15}`. `T4+` adds vertex 19 and edge `(0,19)`. These are connected graphs with respectively 19/18 and 20/19 vertices/edges, hence trees. In `T4`, degree 0 is 5, degree 1 is 2, centers 3,7,11,15 have degree 4, and every other vertex has degree 1. In `T4+`, degree 0 is 6 and vertex 19 has degree 1; every other degree is unchanged. Thus the complete original leaf/support list is

`(2,1), (4,3), (5,3), (6,3), (8,7), (9,7), (10,7), (12,11), (13,11), (14,11), (16,15), (17,15), (18,15)`;

`T4+` additionally has `(19,0)`. In particular, the path endpoint 2 is a thirteenth old leaf, which the route's hand-built `leaves=[]` list omitted before any selector test.

Literal enumeration of `2^19=524288` and `2^20=1048576` masks gives the parent independence vectors

| Tree | `i_0,...,i_alpha` | `alpha` | `Delta_0,...,Delta_alpha` |
|---|---|---:|---|
| `T4` | `[1,19,153,698,2028,4011,5665,5924,4689,2833,1297,438,103,15,1]` | 14 | `[18,134,545,1330,1983,1654,259,-1235,-1856,-1536,-859,-335,-88,-14,-1]` |
| `T4+` | `[1,20,171,838,2648,5753,8961,10302,8897,5806,2843,1020,255,40,3]` | 14 | `[19,151,667,1810,3105,3208,1341,-1405,-3091,-2963,-1823,-765,-215,-37,-3]` |

Both first strict descents are `x=7`. The displayed differences include the terminal zero-extended `Delta_14=-i_14`. Both guards hold: `x+2=9=p` and `3p=27<29=2alpha+1`.

## Complete strict selectors and H/R arithmetic

Every listed original leaf is strictly favorable. The following table gives **each orbit's value for every individual tag**; the evidence records a separate row, original support, `W`, deletion polynomial, and complete `H_v`/`R_v` coefficient vectors for every leaf. The four claw fibers are not collapsed in the sum.

| Tree | individual leaves | support(s) | `Delta_9(T-v)` | `i_8(H),i_9(H)` | `i_8(R),i_9(R)` | `q(8),q(9)` | summand per leaf |
|---|---|---|---:|---|---|---|---:|
| `T4` | `2` | `1` | -850 | `1437,751` | `645,256` | `792,495` | -297 |
| `T4` | `4,5,6,8,9,10,12,13,14,16,17,18` | `3,7,11,15`, three tags each | -652 | `1815,931` | `87,19` | `1728,912` | -816 |
| `T4+` | `2` | `1` | -1758 | `2601,1396` | `1809,901` | `792,495` | -297 |
| `T4+` | `4,5,6,8,9,10,12,13,14,16,17,18` | `3,7,11,15`, three tags each | -1395 | `3522,1954` | `330,106` | `3192,1848` | -1344 |
| `T4+` | `19` | `0` | -1536 | `2973,1546` | `1287,715` | `1686,831` | -855 |

For leaf 2, `W_2={0}`. Its full marked polynomial is `q_2(z)=z(1+z)^12` in both trees, giving `q_2(8)=792`, `q_2(9)=495`, and its `-297` summand. Its selector changes from `-850` to `-1758`, so it remains strictly favorable. This omitted contribution is the entire correction to each claimed full sum.

The **complete** selectors are

* `F(T4,9)={2,4,5,6,8,9,10,12,13,14,16,17,18}` (13 leaves);
* `F(T4+,9)=F(T4,9) union {19}` (14 leaves).

The corrected complete sums are

`S(T4,9)=-297+12(-816)=-10089`, and

`S(T4+,9)=-297+12(-1344)-855=-17280`.

The dependent descriptive potentials, with the complete selectors, are

| Tree | `M=sum_F -Delta_9(T-v)` | `Q=sum_F q_v(8)` | `sum_F q_v(9)` | `S=sum_F(q_v(9)-q_v(8))` |
|---|---:|---:|---:|---:|
| `T4` | 8674 | 21528 | 11439 | -10089 |
| `T4+` | 20034 | 40782 | 23502 | -17280 |

Thus the previously printed `-9792,-16983` were twelve-/thirteen-tag **partial** sums, not full-selector sums. The previously printed `(M,Q)=(7824,20736),(18276,39990)` were likewise partial. They must not be retained as claims about the complete selector. The full-sum change under this one graft happens still to be `-7191`, since the omitted arm summand is `-297` in both trees; this equality does not repair the asserted endpoints. Correct potential changes are `Delta M=11360`, `Delta Q=19254`, and `Delta(sum q(9))=12063`. No general potential inequality follows.

## Surviving recurrence and exact replacement claim

The polynomial identity `I(G+;z)=I(G;z)+z I(G-0;z)` and, for each old leaf `v`, the selector update `Delta_9(G+-v)=Delta_9(G-v)+Delta_8(G-{v,0})` remain exact. Literal enumeration verifies the first coefficient by coefficient. The selector change is `-908` for old leaf 2 and `-743` for each old claw leaf; the new leaf's deletion is `T4` and has selector `Delta_9(T4)=-1536`. Finite eligibility and the statement that *all old leaves remain favorable* survive, now with **13** old leaves.

Under the existing claimID `C3-T6-T4-PENDANT-GRAFT-SELECTOR-CLOSURE`, I **reject the original full-selector assertion as stated** and propose this replacement: *At `p=9`, the specified 19-vertex `T4` and its one-leaf graft at root 0 both have `alpha=14`, `x=7`, and `27<29`; all 13 original leaves of `T4` are strictly favorable, remain so after the graft, and the new leaf 19 is strictly favorable. The complete selectors have sizes 13 and 14 and the complete sums are `-10089` and `-17280`, respectively, with corrected `(M,Q)` equal to `(8674,21528)` and `(20034,40782)`.* This is a proposed exact two-tree computation only. It is neither a general graft theorem nor a positive complete-sum counterexample.

## Effect on the eight C3-AT dispositions

Only the T6 disposition changes, from `retained` to `rejected as written; corrected bounded replacement proposed`. The other seven claimID dispositions and their scopes remain as in the C3-AT return:

| ClaimID | Proposed effect of this repair |
|---|---|
| `C3-T1.COVER-BUDGET-AND-FIRST-MARK-SUBCLASS` | Unaffected `retained_narrowed`. |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | Unaffected `retained_narrowed`; T2's independently corrected selected-root contribution remains required and is unrelated to this leaf inventory. |
| `C3-T3-STAR-SYMMETRIC-CHAIN-SUBCASE` | Unaffected `retained`. |
| `C3-T3-T67-EXACT-BOUNDED-ROW` | Unaffected `retained`. |
| `C3-T4-ODD-SHELL-REDUCTION` | Unaffected `retained_narrowed`; its isolated-mark boundary classification, including the `(i,degree)=(2,0)` case, remains the independently corrected classification. |
| `T5-TM-COEFFICIENT-IDENTITY` | Unaffected `retained`; its arm term already counts leaf 2. |
| `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | Unaffected `retained_narrowed` at the finite T5 scope and `proposed_open` universally. These two corrected rows are negative. |
| `C3-T6-T4-PENDANT-GRAFT-SELECTOR-CLOSURE` | Original full-selector numbers rejected; exact corrected two-tree replacement above proposed. |

## Limits

This audit covers precisely two encoded trees at one rank. It uses exact finite counting, not Lean or an exhaustive tree census. The pendant recurrence has no established general selector sign or induction. Neither corrected negative sum proves the universal ordinary favorable-leaf aggregate; no positive complete sum is supplied. The weighted Hall obligation and T4 boundary compensation remain open at their original scopes. All dispositions here are proposals for controller review, with no authority award.
