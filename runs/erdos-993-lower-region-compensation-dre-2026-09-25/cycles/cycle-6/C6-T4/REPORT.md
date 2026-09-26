# C6-T4 search: matching slack across selected leaf tags

## Result

For every eligible ordinary tree and its unchanged fixed selector `F(T,p)`, the incidence identity reduces the target to a precise weighted budget. I derive a matching-sensitive decomposition of its slack on each marked `k`-set. It identifies three sources of compensation: unused independence capacity in the addable forest, unmatched addable vertices, and upper sets meeting a tag set at least twice. This is a valid structural reduction, but I do not prove the required lower bound for their sum on all eligible trees.

An exact tree-DP check on the eligible `T_22`, `p=34` control has one positive selected leaf term and a negative complete sum. This confirms why a pointwise leaf claim cannot substitute for the across-tag budget. It is one tree, not a census or universal result.

## Fixed-selector identity

Fix an eligible `(T,p)` and the original set `F=F(T,p)` throughout. For each `v in F`, write

`H_v=T-{v,s_v}`, `W_v=N_T(s_v)\\{v}`, `R_v=H_v-W_v`, `h=alpha(T)-1=alpha(H_v)`, and `k=p-1`.

Let `q_v(j)` count independent `j`-sets of `H_v` meeting `W_v`. For a marked `k`-set `A` (that is, an independent `k`-set meeting `W_v`), let `U_v(A)=V(H_v)\\N_{H_v}[A]` be the vertices individually addable to `A`, and let `e_v(A)=|U_v(A)|`. Define `D= sum_(v in F,A) (2(h-k)-e_v(A))`. Define `C` to count, once per selected tag `v`, independent `(k+1)`-sets of `H_v` meeting `W_v` in at least two vertices. Finally put `Q=sum_F q_v(k)` and `U=sum_F q_v(k+1)`.

Every extension from a marked `k`-set gives an upper marked `(k+1)`-set. An upper set with exactly one mark has `k` deletions that leave a marked lower set; with at least two marks, it has `k+1`. Counting these incidences gives `sum_(v,A) e_v(A)=kU+C`. By the definition of `D`, this gives `kU=2(h-k)Q-D-C`.

The selected summand for `v` is `q_v(k+1)-q_v(k)`, so `S=U-Q`. Therefore

`k S = (2h-3k)Q-D-C = (2 alpha(T)+1-3p)Q-D-C`.

The last coefficient is positive under the contract's strict guard. Thus nonnegativity of `D` and `C` alone still does not imply the target: the needed statement is `D+C >= (2 alpha(T)+1-3p)Q`.

## Matching-slack decomposition

For each fixed `(v,A)`, `U_v(A)` induces a forest, since `H_v` is a forest. Every independent subset of `U_v(A)` can be adjoined to `A`; hence `alpha(U_v(A)) <= h-k`. Let `nu_v(A)` be the maximum matching size of this induced forest and `u_v(A)=|U_v(A)|-2 nu_v(A)`, the number of vertices left unmatched by a maximum matching.

The forest is bipartite. König's theorem gives `alpha(U_v(A))=|U_v(A)|-nu_v(A)=nu_v(A)+u_v(A)`. (For a finite bipartite graph this follows from the alternating-path construction of a minimum vertex cover from a maximum matching.) Consequently, exactly,

`2(h-k)-e_v(A) = 2(h-k-alpha(U_v(A))) + u_v(A) >= u_v(A)`.

Thus the unresolved global budget has the more informative sufficient form

`sum_(v in F,A) [2(h-k-alpha(U_v(A))) + u_v(A)] + C >= (2 alpha(T)+1-3p)Q`.

This formulation explicitly retains the unmatched-addable contribution; dropping it in a matching estimate loses a nonnegative part of the available slack. It also retains `C` once per multiply-marked upper set, as required by the incidence count. The derivation proves the decomposition, not the displayed global inequality. In particular it supplies no new bound from the first-descent selector, and it does not prove a compensating map for arbitrary eligible trees.

## Exact bounded check: `T_22` at `p=34`

The replay uses the pinned constructor `inputs/ordinary_tree_checked.py`: root `0` has the path arm `0-1-2` and 22 branches, each a center adjacent to `0` and to three leaves. This is an ordinary tree on 91 vertices. Exact forest-DP coefficients give `alpha=68`, first strict descent `x=32`, so `x+2=34<=p` and `3p=102<137=2 alpha+1`. The fixed selector contains 67 leaves: the marked arm leaf and all 66 three-leaf-branch leaves. These checks use the zero-extended polynomial evaluator in the pinned source.

The marked-arm summand is `+212336130412243110`; each of the 66 other selected leaf summands is `-7560098737536570631`. Their complete sum is `S=-498754180547001418536`.

For the same fixed selector, the exact grouped counts are:

| Tag type | Count | `q(k)` per tag | `q(k+1)` per tag | `C` per tag | `D` per tag | Leaf summand per tag |
|---|---:|---:|---:|---:|---:|---:|
| Marked arm | 1 | 7007092303604022630 | 7219428434016265740 | 0 | 238241138322536769420 | +212336130412243110 |
| Three-leaf branch | 66 | 106440385316477033626 | 98880286578940462995 | 38161650407870393271 | 3936735094007532614462 | -7560098737536570631 |

Aggregating gives `Q=7032072523191088241946`, `U=6533318342644086823410`, `C=2518668926919445955886`, and `D=260062757342819689323912`. Here `2 alpha+1-3p=35`, and `D+C` exceeds `35Q` by `16458887958051046811688`; correspondingly `33S=-16458887958051046811688`. `e_v(A)` totals are recovered exactly from `k q_v(k+1)+C_v` by the incidence identity, rather than by enumerating the marked sets individually. The replay checks the summed leaf terms and the incidence identity.

The positive arm tag is not a counterexample: the 66 other tags more than compensate in this instance. This single result neither proves a general compensation bound nor implies one from a family of examples.

## Source scope and limitations

I checked the listed source-map paths for the fixed-selector coordinates, the literal deletion-plus-two-for-one relation, the T-family graph recipe, and the direct-set flow recipe. These provide concrete graph and relation definitions. The three saved orbit flows are finite diagnostics and require a separate orbit-lifting proof; I do not use them as a universal result. The direct-set flow source is likewise a bounded check. No source-availability gap is asserted.

The new calculation is bounded to one `T_22` tree and one rank. No public-literature result is imported. I did not prove or refute the full lower-region aggregate, establish a uniform estimate for `sum(D+C)`, verify a universal matching transport, or extend the T-family flow to arbitrary trees. Those are mathematical gaps, not failures of a review of a specific external source.

Replay command:

```sh
/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 replay_t22.py
```

It writes its JSON to stdout. The captured exact output is `evidence_t22.json`.
