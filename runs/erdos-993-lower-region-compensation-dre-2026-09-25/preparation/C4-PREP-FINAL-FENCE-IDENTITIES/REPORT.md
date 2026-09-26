# C4 final fence: two exact mechanism identities

**Disposition:** two proposed REFUTED identities in `CLAIMS-DRAFT.json`, with exact independent replay in `REPLAY.py` and `EVIDENCE.json`. This is a bounded scratchpad review. The canonical registry remains at its prior 426 claims; no registry or remote write, build, or agent delegation occurred. Neither witness refutes the primary lower-region aggregate, which remains OPEN. No minimality, novelty, or census claim is made.

## Contract and identity check

An eligible instance is a finite simple connected acyclic ordinary tree `T`, with integer zero-extended independence counts `i_j(T)`, first strict descent `x(T)`, `a=alpha(T)`, and natural `p` satisfying `x(T)+2<=p` and `3p<2a+1`. Its **fixed** favorable set is `F={v: v is an original leaf and Delta_p(T-v)<0}`. Every original leaf is a separate tag even when supports coincide. For each `v in F`, its support `s_v`, `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, and `R_v=T-N_T[s_v]=H_v-W_v` all come from the original tree. In this review `q_v(j)=i_j(H_v)-i_j(R_v)` and `S=sum_F(q_v(p)-q_v(p-1))`.

The pinned `control/C4-REGISTERED-CLAIM-IDENTITY.json` has **426** claims. The replay compares both proposed keys and the normalized full statements against every registered key, statement, and exact alias; there are zero collisions. Semantic comparison identifies the closest records:

| Registered identity | Status | Distinction from these drafts |
|---|---|---|
| `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` | REFUTED | Unsigned deletion within one selected leaf tag; the new T4 identity is a rational alternating-sign map with a specified cross-tag retagging rule. |
| `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-R23-LITERAL-DELETE-ONLY-HALL` | REFUTED | Hall assertions for combinatorial relations, rather than injectivity of this signed linear operator. |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | OPEN | Capacitated flow on weighted independent sets with different edges and demands. |
| `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` | REFUTED | A global weighted comparison using `e_T(B)` on independent `p`-sets of `T`; the new covariance identity is local to one `H_v`, at rank `k=p-1`, under its uniform measure. |
| `E993-R19-U2-UNIVERSAL-FACES`, `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` | OPEN, REFUTED | Governed orbit/support-mean covariance faces and a pointwise full-G1 residual bound, respectively; neither specifies the uniform rank-`k` marked-indicator covariance on a selected `H_v`. |
| `E993-LOWER-REGION-EARLY-MARKED-OCCUPANCY-TRANSFER` | OPEN | The `CT_x` aggregate budget uses first-descent coefficients and all selected tags; this local positive covariance does not refute it. |
| `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | OPEN | Scalar complete selected sum; both witness trees have negative complete sums. |

The exact registry statements and scopes for these nearby identities are copied into `EVIDENCE.json` for inspection. There is no registered exact identity for either proposed statement. The historical source states shown in worker reports have no authority to change these 426 canonical rows.

## 1. Exact C4-T4 signed map

Use the rational coefficient field `Q`. Let `K_j` have basis all pairs `(v,A)` with `v in F`, `A` an independent `j`-set of `H_v`, and `A∩W_v` nonempty. Choose a total order on original vertices and a total order on `F`. Define `L:K_p -> K_(p-1)` on a basis element `(v,A)` as follows. List `A=(u_1<...<u_p)`. For each `i`, put `B=A\{u_i}` and coefficient `(-1)^(i-1)`. If `(v,B)` is a destination basis pair, use tag `v`. Otherwise use the **least** `w in F` for which `(w,B)` is a destination basis pair. If no such tag exists, omit the term. Sum the resulting signed terms, combining equal basis pairs in `Q`. This is the whole map; it has no insertion edges or extra coefficients.

For `T=K_(1,12)`, take vertices `0,1,...,12`, edges `(0,i)` for `1<=i<=12`, vertex order `0<1<...<12`, and tag order `1<...<12`. Direct recurrence gives `alpha=12`, `x=6`, `p=8`, so `x+2=p` and `24<25`. All twelve original leaves have support `0` and selector difference `Delta_8(T-i)=-110`, hence `F={1,...,12}`. For tag `1`, `H_1` is eleven isolated vertices `{2,...,12}`, `W_1={2,...,12}`, and `R_1` is empty. Thus `q_1(7)=C(11,7)=330`, `q_1(8)=C(11,8)=165`; `dim K_7=3960`, `dim K_8=1980`, and the **complete** selected sum is `S=12(165-330)=-1980`.

Set `C={2,3,4,5,6,7,8,9,10}` in increasing order and

`z=sum_(i=1)^9 (-1)^(i-1) (1,C\{c_i})`.

The nine basis pairs are distinct, so `z!=0`. Each eight-set face of `C` remains marked at tag `1`, and every seven-set produced by `L` also remains marked at tag `1`; the fallback retagging branch is never reached for these 72 deletions. Each of the `C(9,2)=36` distinct seven-set faces is produced along two paths with opposite signs. Exact replay records 36 image basis pairs, all coefficients zero. Hence `Lz=0` and the universal injectivity identity is false even though this star's complete aggregate is negative. The conclusion concerns this **specified signed face-only map**; it gives no verdict on other map designs.

## 2. Local marked/addability covariance

For a selected leaf `v`, put `k=p-1` and require `i_k(H_v)>0`. Let `A` be uniformly distributed over **all independent `k`-sets of `H_v`**. Define `M_v(A)=1[A∩W_v!=empty]`, and let `e_v(A)` be the number of actual vertices in `H_v` that can be added to `A` while preserving independence. If `E_v=sum_{A: M_v(A)=1} e_v(A)`, then double counting all addability incidences gives

`Cov(M_v,e_v)=(E_v*i_k(H_v)-q_v(k)*(k+1)*i_(k+1)(H_v))/i_k(H_v)^2`.

The order-24 witness uses the vertex set `{0,...,23}` and the exact 23-edge list in `EVIDENCE.json:order24.edges`. The independent replay checks connectedness and `|E|=23`, so it is a tree. Its independent-count vector is `(1,24,253,1553,6202,17052,33321,47118,48648,36729,20148,7898,2146,384,41,2)`, giving `alpha=15` and first strict descent `x=8`. With `p=10`, `k=9`, the guards are `x+2=p` and `30<31`. The complete original leaf list is `(0,3,5,6,12,14,15,20,21,22,23)`. Every leaf is favorable; their selector differences and all selected summands are reproduced in `EVIDENCE.json:order24.leaf_rows`. The complete selected sum is `S=-51095` (`Q=97144`, `U=46049`). Shared-support leaves remain separate tags.

For selected leaf `v=0`, its original support is `1`, `W_0={7,9,21,22}`, and direct independent rank-9 subset enumeration in `H_0` gives `i_9(H_0)=13677`, `q_0(9)=13232`, and literal marked addability `E_0=58429`. An independent deletion recurrence gives `i_10(H_0)=6026`. Therefore the covariance is exactly

`(58429*13677-13232*10*6026)/13677^2 = 1773113/187060329 > 0`.

This refutes the universal **nonpositive local** covariance claim. It does not refute `CT_x`, any global compensation, or the primary selected aggregate.

## Reproducibility and limits

Run `python3 REPLAY.py` in this scratchpad to regenerate `EVIDENCE.json`. The script uses exact integer polynomial deletion recurrence, direct rank-9 subset enumeration and addable-vertex counts, and an explicit sparse signed-map action over integer coefficients (embedded in `Q`). It reads only the allowed sources named in the assignment plus its own draft, checks every case packet SHA-256 pin it reads, and records the SHA-256 of **every source file read** under `EVIDENCE.json:source_sha256` (28 files). The optional `cycles/cycle-4/C4-AT/EVIDENCE.json` does not exist and was not read. No universality follows from bounded arithmetic except refutation of the two universal mechanism statements by their exact witnesses. No claim of minimality or novelty is made.
