# C1-CU-T3 critique of C1-T3

## Dispositions

- **C1-T3-1 — retained.** The marked incidence identity is an exact finite counting identity for the stated bipartite domain. Its ordinary-tree specialization is valid for each selected original leaf tag, and summing it preserves repeated supports. It is a reformulation of the summand, not a proof of its sign.
- **C1-T3-2 — retained_narrowed.** The complete target is exactly the aggregate marked-shadow cardinality inequality. An injection in the disjoint union of the per-tag incidence graphs is only a sufficient condition, and the standing controls show that this condition fails tagwise even when the complete target sum is negative. No global proof or eligible positive witness is provided.

No claim is rejected as mathematically false. The only adjustment is to the strength and usefulness of the proposed matching reduction.

## Audit of the incidence identity and tree specialization

Let `Q_j` count independent `j`-sets meeting `W` in a bipartite graph `H`, with `alpha(H) <= h` and `1 <= k <= h`. For each marked independent `k`-set `A`, write `e(A)` for its actual addable vertices and

`D = sum_A (2(h-k)-e(A))`.

For either color class `X`, the union of `A` and the vertices in `X` addable to `A` is independent: all added vertices are individually nonadjacent to `A`, and vertices within `X` are pairwise nonadjacent. Thus `e_X(A) <= h-k`; summing over the two classes gives `e(A) <= 2(h-k)`, so `D >= 0`.

Count pairs `(A,z)` with `z` addable to marked independent `A` of size `k`. A marked independent `(k+1)`-set meeting `W` exactly once contributes `k` pairs, one for each deletion of an unmarked vertex. A set meeting `W` at least twice contributes `k+1` pairs, since every deletion leaves a marked set. If `C` counts the latter sets once each, then

`sum_A e(A) = k Q_(k+1) + C`,

and hence `k Q_(k+1) + C = 2(h-k)Q_k - D`, with `C,D >= 0`. This also covers `W=empty` (all quantities vanish) and boundary `k=h` (no independent `(k+1)`-sets and no addable vertices).

For a tree leaf `v` with support `s`, `H=T-{v,s}` is a forest and therefore bipartite. Also `alpha(H)=alpha(T)-1`: every independent set of `H` can be enlarged in `T` by `v` if it meets `N(s)\\{v}`, and by `s` otherwise, so `alpha(H) <= alpha(T)-1`; a maximum independent set of `T` contains exactly one of `v,s`, and deleting that vertex leaves an independent set of `H` of size `alpha(T)-1`. The strict lower-region guard implies `k=p-1 >= 1` and `k <= h=alpha(T)-1`. Set `W=N(s)\\{v}` and `R=T-N_T[s]=H-W`. Then `q_j=i_j(H)-i_j(R)` counts the independent `j`-sets of `H` meeting `W`.

With `g_v=Delta_k(H)-Delta_k(R)`, the definitions give `g_v=q_v(k+1)-q_v(k)`. Equivalently, the checked incidence identity and `2h-3k=2a+1-3p` give

`k*g_v=(2h-3k)q_v(k)-(D_v+C_v)=k(q_v(k+1)-q_v(k))`.

Since `k>=1`, the formula follows for each selected tag. The fixed selector remains `Delta_p(T-v)<0`; nothing in this derivation changes or relaxes it. Summing over the original selected leaf tags, including leaves sharing a support, yields the exact equivalence

`S(T,p) = sum_(v in F(T,p)) (q_v(k+1)-q_v(k))`.

Thus the corresponding deficit budget is equivalent, by this same identity, to `sum_F q_v(k+1) <= sum_F q_v(k)`. Nonnegativity of `D_v,C_v` alone does not establish that inequality: the coefficient `2a+1-3p` is positive in this region and the needed quantitative budget is still unproved.

## Matching critique and standing controls

For a fixed tag, the natural containment graph has marked independent `(k+1)`-sets on one side and marked independent `k`-sets on the other. An injection of all upper sets into lower sets would imply `q_v(k+1) <= q_v(k)` for that tag. In the **disjoint union by tag**, a matching cannot transfer unused lower capacity from a negative tag to a positive tag. Consequently, a full upper-to-lower matching in that disjoint union is stronger than the complete sum inequality and requires every component to satisfy its own cardinality inequality.

I replayed the sums of the supplied order-91 and order-243 control rows from local copies in `evidence/`. For `T_22` (`a=68,x=32,p=34`), 67 selected leaf tags sum to `-498754180547001418536`, while one tag has `g=+212336130412243110`. For `T_60` (`a=182,x=87,p=90`), 181 tags sum to `-1058142362147652597702654588268394677176033202323316960380`, while one tag has `g=+2935177632783649903488454322226807645411570590073000`. Since `g=q(k+1)-q(k)`, the positive tag violates the necessary cardinality condition for a tagwise injection in each control. The full negative sums confirm that tagwise Hall matching is not necessary for the target and that the disjoint-union-by-tag injection cannot be a universal proof mechanism.

The handoff's `K_(1,12)` check also replays directly: `a=12,x=6,p=8`, all twelve original leaves are selected, `h=11,k=7`, each has `q(7)=C(11,7)=330`, `q(8)=C(11,8)=165`, hence each summand is `-165` and `S=-1980`. This is only a finite control.

A different incidence construction with edges allowed to move between tags could in principle pool capacity, but the route supplies no such edge rule, injection, or proof that it preserves the marked-set incidences. A global matching would therefore be new work, not a consequence of the stated disjoint union. Nor does the exact shadow reformulation itself decide the primary assertion: it names the same missing aggregate inequality in another form. No eligible tree with positive complete sum is supplied.

## Evidence grade and limitations

The incidence identity and per-tag algebraic specialization are direct proofs, not bounded computations. The controls are finite exact observations only. I checked the control JSON pins and independently re-summed all listed summands for `T_22` and `T_60` from scratch copies; I did not regenerate these large graph rows or independently replay their tree-DP generation. The `K_(1,12)` binomial arithmetic is elementary. No outside theorem or citation is used. The target remains open on this evidence: no proof of the selected aggregate shadow inequality, no full eligible counterexample, and no matching theorem that overcomes the positive-tag controls.
