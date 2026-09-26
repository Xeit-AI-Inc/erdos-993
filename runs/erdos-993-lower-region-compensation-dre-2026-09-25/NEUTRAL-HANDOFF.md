# Controller-admitted common neutral mathematical handoff

This handoff is identical for all T/F/U routes and their critics. It describes the problem and fences without prescribing a proof strategy or announcing a verdict. All mathematical statuses remain controller-owned.

## Exact target and checked candidate

The primary registered OPEN target is `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: for every finite ordinary tree `T`, set `a=alpha(T)`, `i_j(T)` to the integer zero-extended independent-set counts, `Delta_j=i_(j+1)-i_j`, and `x(T)=min{j>=0:Delta_j(T)<0}`. For natural `p` satisfying `x(T)+2<=p` and **`3p<2a+1`**, let `F(T,p)` be the original leaves `v` with **`Delta_p(T-v)<0`**. With original support `s_v` and original closed neighborhood `N_T[s_v]`, show or refute

`S(T,p)=sum_(v in F(T,p)) [Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v])]<=0`.

Leaves are distinct tags even when their supports coincide. The empty sum is zero. There is no residual premise or `RTree` transfer. The primary is only a proper lower-region restriction of the all-rank ordinary R23 aggregate. The complementary high-tail condition `3p>=2a+1` is a separate OPEN certificate extraction owned by code; do not claim it here without its exact certificate.

The separately registered OPEN auxiliary `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY` says: for bipartite `H`, marked `W`, `h>=alpha(H)`, `1<=k<=h`, `q_j=#\{independent j-sets meeting W\}`, actual addable-vertex count `e(A)` for each marked independent `k`-set, `D=sum_A[2(h-k)-e(A)]`, and `C=#\{independent (k+1)-sets meeting W at least twice\}` counted once per set, `kq_(k+1)+C=2(h-k)q_k-D`, `D,C>=0`. This exact algebra is a candidate checked identity, distinct from the open inequality-only tagged-shadow bound. In the tree specialization, `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\\{v}`, `R_v=T-N_T[s_v]`, `alpha(H_v)=a-1`, `k=p-1`, `q_v(j)=i_j(H_v)-i_j(R_v)`, and the fixed selector gives

`kS=(2a+1-3p)sum_F q_v(k)-sum_F(D_v+C_v)`.

The displayed equality does **not** establish the needed global deficit budget `sum_F(D_v+C_v)>=(2a+1-3p)sum_F q_v(k)`. It is permissible to seek a different proof or a counterexample.

## Shared controls and fences

The lower region is nonempty: `K_(1,12)` has `a=12,x=6,p=8`, 12 favorable original leaves, and `S=-1980`. It is one finite check, not a proof.

The ordinary order-91 `T_22` has `(a,x,p)=(68,32,34)`, a positive marked term `+212336130412243110`, and complete `S=-498754180547001418536`. The ordinary order-243 `T_60` has `(182,87,90)`, positive marked term `+2935177632783649903488454322226807645411570590073000`, and complete `S=-1058142362147652597702654588268394677176033202323316960380`. Both are eligible lower-region controls showing that local positivity coexists with negative global sums. Neither refutes the primary.

Keep separate r28's **order-22** `T22`, which refutes universal `E993-R28-TREE-LEAF-SLOT-DOMINANCE` at `(k,t)=(12,18)`; universal Hall/SDR slot dominance is unavailable. The surviving branch-tree-degree-≤2 theorem has only that class scope. `E993-BETA-TARGET` is REFUTED on its governed pointwise scope, and `E993-BETA-AGG-SUPPORT` is REFUTED by an order-91 support with positive local margin; neither determines the full ordinary selected sum. The R27 optimized unmarked root inequality cannot simply be restricted to marked sets; its six-vertex positive `q_2-q_1` diagnostic is ineligible. The `M(6)=22` and `x<=6` K1-closure records are census-dependent bounded inputs.

The standing `ordinary_tree.py` helper's `first_strict_descent` omits the terminal zero-extension difference at rank `alpha`. Compute `x` through that rank independently before eligibility or witness claims. Preserve the strict selector, rank shift, original graph operations, and all same-support leaf tags in every calculation. No source search or prior failed route establishes novelty or a status.

## Return standard

State the exact theorem, counterexample, finite observation, or conditional result. Expose proof gaps, domain checks, and which steps rely on bounded computation. For a graph witness, provide a replayable tree encoding, exact integer coefficient vectors, `a,x,p`, every selector value, and full `S`. For a proof, give complete verifiable argument and precisely identify every imported theorem and hypothesis. Primary literature may be retrieved, but it is evidence to audit, not an automatic bridge. Every result is proposed until neutral adjudication and controller review.

Controller additions: use inputs/ordinary_tree_checked.py for new computation; its one-line terminal-descent correction is recorded in control/EVALUATOR-ERRATUM.md. All 92 imported refuted records remain authoritative at their exact scopes; use inputs/TRANSITIVE-REFUTED-CLAIMS.json for relevant identity checks. The final source paths are logical admission paths, not permission to write outside your scratch root. Do not read other workers, control-proposals, or previous-cycle raw outputs unless your packet explicitly names them.
