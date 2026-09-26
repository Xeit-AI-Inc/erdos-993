# Controller-admitted solution contract — lower-region ordinary favorable-leaf aggregate

Controller-admitted contract. Both identities are registered OPEN in the 409-claim authority snapshot. This document awards no mathematical verdict.

## Primary target

Registered key: `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. Initial controller status: OPEN.

Let `T` be a finite ordinary tree (finite, simple, connected, acyclic). Write `i_j(T)` for its number of independent `j`-sets, with integer zero extension outside `0<=j<=alpha(T)`, and `Delta_j(T)=i_(j+1)(T)-i_j(T)`. Let `x(T)` be the first nonnegative integer `j` with `Delta_j(T)<0`, and `a=alpha(T)`. An original leaf `v` has its original support `s_v`. For natural `p` with `x(T)+2<=p` and the **strict** inequality `3p<2a+1`, select the fixed set `F(T,p)={v original leaf of T: Delta_p(T-v)<0}`. Define

`S(T,p)=sum_(v in F(T,p)) [Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v])]`.

The assertion is `S(T,p)<=0`. Each original leaf is a distinct summand, including leaves sharing one support. Deletions, supports, and closed neighborhoods are those of the original `T`. The empty sum is zero. There is no residual assumption and no governed `RTree` interpretation. Eligibility ensures `p>=2`, so `p-1` is an ordinary integer rank.

This is a proper region restriction of OPEN `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, not the VERIFIED first-interior `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`, top-rank residual `E993-R26-TOP-RANK-RESIDUAL-SIGN`, or governed `E993-BETA-AGG`. The high-tail region `3p>=2a+1` is separately OPEN as an extraction/certificate obligation owned by code; it is not inferred from this contract or silently joined to it.

## Optional exact auxiliary

Registered distinct key: `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY`. Initial controller status: OPEN; the controller registers this optional analytical auxiliary. For a finite bipartite graph `H`, arbitrary marked vertex set `W`, integer `h>=alpha(H)`, and `1<=k<=h`, let `q_j` count independent `j`-sets meeting `W`. For each marked independent `k`-set `A`, let `e(A)` count **actual** addable vertices of `H`; put `D=sum_A(2(h-k)-e(A))`. Let `C` count independent `(k+1)`-sets meeting `W` in at least two vertices, once per set. The proposed identity is

`k*q_(k+1)+C=2(h-k)*q_k-D`, with `D>=0` and `C>=0`.

This exact marked identity is distinct from the inequality-only OPEN `E993-BIPARTITE-TAGGED-SHADOW-BOUND` and from unmarked or root-corrected R27 counts. Its algebra has been checked as a candidate handoff: bipartite color classes of the addable graph each have at most `h-k` vertices, while each singly marked extension has `k` tag-preserving deletions and each multiply marked extension has `k+1`. It is not a proved budget for the primary target and receives no proof award from this preparation.

For each original leaf `v`, set `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\\{v}`, `R_v=T-N_T[s_v]=H_v-W_v`, `h=a-1=alpha(H_v)`, `k=p-1`, and `q_v(j)=i_j(H_v)-i_j(R_v)`. Use the **same fixed `F(T,p)`** throughout. Then the checked candidate specialization is

`k*S(T,p)=(2a+1-3p)*sum_(v in F) q_v(k)-sum_(v in F)(D_v+C_v)`.

The positive coefficient in the strict lower region leaves a real open obligation: `sum_F(D_v+C_v)>=(2a+1-3p)*sum_F q_v(k)`. Nonnegativity of `D_v,C_v` alone does not prove this. Pointwise or support-fibre versions are stronger and cannot replace the selected global assertion.

## What counts as a resolution

A proof must establish the complete selected sum under exactly the displayed hypotheses, checking all graph/rank domains and every use of the selector. A refutation must give a reproducible ordinary tree, exact original-tree encoding, `a,x,p`, the independence-count vectors needed for every `Delta`, the complete favorable set, every selected summand, and an exact positive full `S`; a positive local term or support fibre alone is insufficient. A theorem imported from primary literature needs its exact hypotheses, a citation, and a proved application to this scope. Bounded computation must give a generation boundary, exact counts, and replayable arithmetic, and is a bounded result only. A conditional reduction must state every missing premise explicitly. Open gaps remain OPEN regardless of votes or suggestive data.

Controller additions: use inputs/ordinary_tree_checked.py for new computation; its one-line terminal-descent correction is recorded in control/EVALUATOR-ERRATUM.md. All 92 imported refuted records remain authoritative at their exact scopes; use inputs/TRANSITIVE-REFUTED-CLAIMS.json for relevant identity checks. The final source paths are logical admission paths, not permission to write outside your scratch root. Do not read other workers, control-proposals, or previous-cycle raw outputs unless your packet explicitly names them.
