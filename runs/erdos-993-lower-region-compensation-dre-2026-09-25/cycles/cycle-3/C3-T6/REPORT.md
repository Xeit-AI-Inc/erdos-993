# C3-T6 — rooted pendant-leaf graft and selected potential

## Scope and result

I studied one rooted branch composition from the (T_m) family in the common coefficient note: (T_4^+) is obtained from (T_4) by attaching one new pendant leaf at vertex (0), the distinguished root of the path (0-1-2) and of the four root-adjacent three-leaf claws. I fixed (p=9) throughout.

For both trees, (alpha=14), (x=7), (x+2le p), and (3p<2alpha+1). Every old claw leaf remains favorable after the graft, and the new leaf is favorable. The original selector has 12 leaves for (T_4) and 13 for (T_4^+). The full selected sums are respectively (-9792) and (-16983).

This gives a bounded, exact selector-closure calculation for this particular rooted composition. It does not establish selector closure for arbitrary rooted branches, nor the primary assertion for all trees.

## Rooted recurrence and potential

For any graph (G) with a vertex (r), adjoining one new leaf at (r) gives

\[
 I(G^+;z)=I(G;z)+zI(G-r;z).
\]

Thus, for each old leaf (v\ne r),

\[
 \Delta_p(G^+-v)=\Delta_p(G-v)+\Delta_{p-1}(G-\{v,r\}).
\]

The first recurrence is the usual polynomial recurrence; the second is the useful selector update. In this instance its added term is (-743) for each old claw leaf: its selector difference changes from (-652) to (-1395). The grafted leaf's deletion polynomial is exactly (I(T_4)), so its selector difference is (Delta_9(T_4)=-1536). All 13 strict selector checks are therefore explicit.

To track the two competing masses, define for this fixed (p)

\[
 M(T,p)=\sum_{v\in F(T,p)}-\Delta_p(T-v),\qquad
 Q(T,p-1)=\sum_{v\in F(T,p)}q_v(p-1),
\]

where (q_v(j)=i_j(T-\{v,s_v\})-i_j(T-N[s_v])). Both are computed with the original supports and the full original selector of the corresponding tree. Under this single graft, ((M,Q)) changes from ((7824,20736)) to ((18276,39990)). The sum is not inferred from either potential coordinate: each summand is computed as (q_v(p)-q_v(p-1)), yielding (-816) per old leaf before graft, (-1344) per old leaf after graft, and (-855) for the new leaf.

## Exact tree and arithmetic

The canonical vertex recipe is encoded directly in [COMPUTE.py](COMPUTE.py), and the complete edge lists, independence vectors, terminal-difference checks, selector rows, (H_v) and (R_v) vectors, and sums are in [EVIDENCE.json](EVIDENCE.json). Replay with `python3 COMPUTE.py > EVIDENCE.json` from this worker directory. The code uses exact integer mask recursion (f(M)=f(M\setminus\{v\})+z f(M\setminus N[v])), with zero extension for ranks outside the polynomial support.

For (T_4), the independence vector is

`[1,19,153,698,2028,4011,5665,5924,4689,2833,1297,438,103,15,1]`.

The successive differences from rank 0 through the terminal rank 14 are

`[18,134,545,1330,1983,1654,259,-1235,-1856,-1536,-859,-335,-88,-14,-1]`.

Hence the first strict descent is exactly (x=7), including the terminal zero-extended check. For (T_4^+), the vector is

`[1,20,171,838,2648,5753,8961,10302,8897,5806,2843,1020,255,40,3]`,

with differences through rank 14

`[19,151,667,1810,3105,3208,1341,-1405,-3091,-2963,-1823,-765,-215,-37,-3]`.

Again (x=7). Both have (p=9\ge x+2=9), and (27<29=2\alpha+1).

In (T_4), the 12 original leaves occur in four support fibers of size 3, with supports (3,7,11,15). Every leaf has (Delta_9(T_4-v)=-652), (q_v(8)=1728), and summand (-816), so (S(T_4,9)=12(-816)=-9792).

In (T_4^+), the same 12 original leaf tags remain, with the same four original supports. Each has (Delta_9(T_4^+-v)=-1395), (q_v(8)=3192), and summand (-1344). The new leaf (19) has original support (0), (Delta_9(T_4^+-19)=-1536), (q_{19}(8)=1686), and summand (-855). Thus

\[
F(T_4^+,9)=F(T_4,9)\mathbin{\dot\cup}\{19\},\qquad
S(T_4^+,9)=12(-1344)-855=-16983.
\]

Here the disjoint union preserves each original leaf as an individually tagged summand; all (H_v) and (R_v) coefficient vectors are available row-by-row in the evidence file. These two eligible finite instances support the stated branch-step calculation only. They neither prove a closure rule for general branch composition nor settle the lower-region aggregate universally.

## Limitations

- This is one exact composition step at one rank and one value (m=4); no induction in (m), rank, or branch shape is proved.
- The pair ((M,Q)) is descriptive here. No general inequality relating it to (S) is established.
- The evidence is a two-tree calculation, not a census, theorem import, or resolution of the primary claim.
