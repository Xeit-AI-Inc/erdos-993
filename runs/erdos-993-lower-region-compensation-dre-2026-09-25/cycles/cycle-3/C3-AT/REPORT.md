# C3-AT neutral adjudication — six T routes and twelve critics

## Authority, target, and evidence boundary

This is a proposed worker adjudication, not a controller award. I checked all 66 exact C3-AT case-file hashes and all 115 common-file hashes against their packets; there were no mismatches. I reviewed each of C3-T1 through C3-T6 and both corresponding C3-CF and C3-CU critiques. The eight distinct source claim IDs are all disposed in `RETURN.json`. `EVIDENCE.json` carries the finite vectors and row records into this worker directory; `REPLAY-TM.py`, `REPLAY-T67.py`, and `REPLAY-GRAFT.py` give foreground exact-integer replays. `REPLAY-TM.py` and `REPLAY-GRAFT.py` copy the sealed exact-integer computations; `REPLAY-T67.py` independently expands the family polynomials at m=67. No Lean build or external theorem is invoked.

The primary assertion remains: for a finite ordinary tree (T), (i_j(T)) is the independent-set count with zero extension, (Delta_j=i_{j+1}-i_j), (x) is the first (j\ge0) with (Delta_j(T)<0), and (a=\alpha(T)). For natural (p) with (x+2\le p) and **(3p<2a+1)**, fix the complete set (F=\{v\text{ original leaf}:\Delta_p(T-v)<0\}). With each leaf's original support (s_v), let (H_v=T-\{v,s_v\}), (W_v=N_T(s_v)\setminus\{v\}), (R_v=T-N_T[s_v]=H_v-W_v). The claim is

\[
S(T,p)=\sum_{v\in F}\bigl(\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)\bigr)\le0.
\]

Every selected leaf, including leaves sharing a support, is one summand. Put (k=p-1\ge1) and (q_v(j)=i_j(H_v)-i_j(R_v)). The exact leaf summand is (q_v(k+1)-q_v(k)). No source proves the universal selected inequality or supplies an eligible positive *complete* sum. Its proposed status stays open. The weighted Hall mechanism is a separate stronger sufficient certificate, also open at its universal scope.

## Disposition ledger and critic reconciliation

| Source claim | Disposition | Exact surviving grade |
|---|---|---|
| `C3-T1.COVER-BUDGET-AND-FIRST-MARK-SUBCLASS` | `retained_narrowed` | First-mark structural sufficient condition only; cover lower bound rejected. |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | `retained_narrowed` | T2's corrected rooted-state identities and T3's star subcase; universal Hall saturation open. |
| `C3-T3-STAR-SYMMETRIC-CHAIN-SUBCASE` | `retained` | Informal proof for stars and stated rank range. |
| `C3-T3-T67-EXACT-BOUNDED-ROW` | `retained` | One exact eligible negative-sum row; no flow certificate. |
| `C3-T4-ODD-SHELL-REDUCTION` | `retained_narrowed` | First-mark identity, shadow bound, corrected boundary cases, matching-plus-isolate formula. |
| `T5-TM-COEFFICIENT-IDENTITY` | `retained` | Exact conditional identity for the explicit family. |
| `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | `retained_narrowed` | T5's 674 bounded negative rows only; universal assertion open. |
| `C3-T6-T4-PENDANT-GRAFT-SELECTOR-CLOSURE` | `retained` | Exact two-tree calculation at (p=9), no general graft theorem. |

For T1, both critics independently found the same sign error in the cover bound and retained the first-mark condition. For T2, the F critic retained and the U critic narrowed the branch formula; both overlooked a selected root leaf, corrected below. For T3, both critics retain the star injection and single T67 calculation while refusing to turn a negative scalar sum into a flow certificate. For T4, the U critic's explicit eligible tree defeats the F critic's proposed ordering repair: ordering a nonisolated mark first still leaves a second isolated mark of order (2k+1). The corrected classification below follows the exact deletion cardinality. For T5, both critics reproduced the finite count and conditional algebra, while correctly separating it from a universal selector theorem. For T6, both critics reproduced the finite graft arithmetic and limited it to the two encoded trees. These decisions use the arguments and row data, not a tally of dispositions.

## T1 — first-mark criterion survives; cover budget does not

For an ordering (w_1,\ldots,w_t) of (W_v), the independent (j)-sets of (H_v) meeting (W_v) partition by their first included mark. The residual graph is exactly

\[
J_i=H_v-\bigl(N_{H_v}[w_i]\cup\{w_1,\ldots,w_{i-1}\}\bigr),\qquad
q_v(j)=\sum_i i_{j-1}(J_i).
\]

Only earlier **mark vertices**, not their neighborhoods, are removed. Consequently the leaf summand is \(\sum_i(i_k(J_i)-i_{k-1}(J_i))\). Counting incidences between independent (k)-sets and their ((k-1))-subsets gives (k i_k(J)\le(|V(J)|-k+1)i_{k-1}(J)). Thus each residual of order at most (2k-1) contributes at most zero. If (n=|V(T)|=2p+2+d), (d\ge1), then (|H_v|=2k+2+d). An ordering for which every deletion union above has at least (d+3) vertices makes the leaf term nonpositive. If this holds separately for every member of the *fixed* (F(T,p)), summing proves the complete inequality on that structural subclass. It is not derived from eligibility, the alpha guard, or favorability; its nonempty eligible reach was not shown.

The source also wrote the exact cover decomposition (I_T(z)=\sum_{X\subseteq C,\ X\text{ independent}}z^{|X|}(1+z)^{b_X}), valid for any vertex cover (C). Its proposed lower bound replaces the positive (a=r+1) contribution by \(\binom{|C|}{r+1}\), an *upper* bound on the number of independent sets of that size. With (T=K_2), (C=V(T)), (N=0), (r=1), its formula gives (L=-1), whereas \(\Delta_1(T)=0-2=-2\). The F critic's (K_{1,3}), again with full cover and (r=1), gives (L=2) versus actual \(\Delta_1=-1\). Hence the displayed inequality and its claimed necessary early-descent consequence are rejected. The exact decomposition itself remains true; a repaired lower bound was not needed or established here.

## T2 and T3 — transport structure, star saturation, one large row

For an independent set `B`, define `w_F(B)` as the number of selected leaves `v` in `B` for which `B-{v}` meets `W_v`. Upper sets have size `p+1`, lower sets size `p`, with these weights as supply and capacity. Edges include every one-vertex deletion and the legal switch `B -> (B-(N_T(s) intersect B)) union {s}` for `s` absent from `B` with exactly two occupied neighbors. A saturated weighted clone flow would imply `S<=0` because the upper-minus-lower total is `S`. The converse is not established; a deficient cut for this relation alone would not refute the scalar primary claim.

T2’s root split is exact: with root `r`, branch roots `u_i`, branches `T_i`, and `T_i^- = T_i-u_i`, root-absent sets are tuples of independent `A_i` in `T_i`, rank `sum |A_i|`; root-present sets are `{r} union (union A_i)` with independent `A_i` in `T_i^-`, rank `1+sum |A_i|`. For leaves `v` in a branch whose support is not `r`, their weight contribution is local to that branch except that `r` lies in `W_v` when `s_v=u_i`. For selected leaves `u_i` supported at `r`, put `z_i=1_{u_i in A_i}` and `J={i:u_i is an original leaf in F}`; their cross-branch contribution is `1_{r absent from B} sum_{i in J} z_i 1_{sum_{ell != i} z_ell>0}`. Root-centered switches use two occupied branch roots; a switch at branch root `u_i` can cross slices when it removes `r` and one child. These are exact boundary descriptions, but arbitrary rank-constrained Hall cuts do not factor over branches.

There is one additional root case omitted by the route and both critics. If (r) itself is a selected original leaf, its contribution is

\[
1_{r\in B}\,1_{(B-\{r\})\cap W_r\ne\varnothing}.
\]

It must be added to T2's displayed formula. For example, root (K_{1,3}) at a leaf (r), choose (F=\{r\}), and take (B=\{r,\text{another leaf}\}). Actual (w_F(B)=1); the source branch terms and root-supported (J)-term both give zero. Thus the source formula is retained for roots outside (F) (in particular any nonleaf root) and corrected as above for arbitrary roots. This local repair does not supply the missing selector-preserving Hall inequalities for every cut.

T3 proves a genuine restricted Hall result. Let (T=K_{1,m}), choose any fixed subset (F) of leaf tags, and assume (2\le p\le m-1) and (p>(m-1)/2). At tag (v), an upper clone is ((v,A)) with (A) a (p)-subset of the other (m-1) leaves; a lower clone is ((v,C)), (|C|=p-1). A symmetric-chain decomposition of their Boolean lattice puts every rank-(p) (A) immediately above a rank-(p-1) (C\subset A): if the chain starts at rank (i), then (i\le m-1-p\le p-1). The deletion of the unique member of (A-C) retains tag (v) and a nonempty witness set. Chain uniqueness makes the map injective within each tag; retaining the tag makes different tag images distinct. This saturates upper clones using deletion edges for this star range. It needs neither the favorable selector nor lower-region eligibility and supplies no general-tree routing.

The T67 row is a separate bounded computation. Construct (T_{67}) on vertices (0,1,2) with path (0-1-2); for (j=0,\ldots,66), attach center (3+4j) to 0 and its three leaves (4+4j,5+4j,6+4j). It has 271 vertices and 270 edges, so is an ordinary tree. Put (L=1+z), (B=1+4z+3z^2+z^3). Root splitting gives

\[
P=I(T_m)=(1+2z)B^m+zL^{3m+1},\quad
D_a=(1+z)B^m+zL^{3m},\quad
D_c=(1+2z)(1+3z+z^2)B^{m-1}+zL^{3m}.
\]

Here (D_a,D_c) are the two leaf-deletion polynomials. Direct exact coefficient expansion at (m=67) gives \(a=203\), \(x=97\): all differences before 97 are nonnegative, \(\Delta_{96}=27850223073233615390386635378702683857613564681805988219749734\), \(\Delta_{97}=-4108496959172258211404501517132939367370653640353500251158030\), and the zero-extended terminal difference is \(\Delta_{203}=-1\). At (p=99=x+2), (297<407=2a+1). The deletion deltas are

\[
\Delta_{99}(D_a)=-46307882270971223168279775544476121972958992659348067340111884,\quad
\Delta_{99}(D_c)=-43025667614277398177002291197033161905044822810755185245961066.
\]

Thus all 202 original leaves are selected: one arm leaf with original support 1 and 201 claw leaves with their respective centers as supports. Their (q(99)-q(98)) summands are respectively (9796517609248850465985369472611545317259503273458850354500) and (-13234166380529838122666159928849625141442673759254128694948346) per claw leaf. The exact *complete* sum is

\[
S(T_{67},99)=-2660057645968888213805432160329302041884660166106806408834263046.
\]

`EVIDENCE.json` includes the full coefficient and delta vectors; `REPLAY-T67.py` expands the polynomial formulas independently of the route's tree evaluator, scans every rank including the terminal zero extension, and checks both selector orbits and the full sum. This is one negative-sum tree, not a census or a set-level Hall certificate. The positive arm term is not a refutation.

## T4 — corrected odd-shell residual inventory

At parent order (n=2p+3), \(|H_v|=2k+3\). The marks (W_v) are pairwise nonadjacent because two adjacent neighbors of the same support would form a triangle. Hence every earlier mark lies outside (N_{H_v}[w_i]), and the **exact** removed size is \(\deg_{H_v}(w_i)+i\). Thus

\[
|J_i|=2k+3-\deg_{H_v}(w_i)-i.
\]

The original route asserted that all residuals have size at most `2k+1` and classified the sizes `2k+1,2k` using only positive marked degrees. That is false for isolated marks. In general, size `2k+2` occurs at `(i,degree)=(1,0)`; size `2k+1` at `(1,1)` or `(2,0)`; size `2k` at `(1,2)`, `(2,1)`, or `(3,0)`. If `W_v` contains a nonisolated mark, putting it first removes the `2k+2` case, but not the omitted second- or third-mark isolated cases. If all marks are isolated, the original tree is a star: deleting the support leaves only isolated components, and each mark is an isolated singleton. At this shell `T-v` is a star with `2p+1` leaves, so its adjacent binomial coefficients at ranks `p,p+1` are equal and `Delta_p(T-v)=0`; such a leaf is not selected. This selector exclusion does not validate the source’s universal residual classification.

The U critic supplied an eligible countercheck to the boundary inventory. Take vertices (0,\ldots,22), edges (0-1,1-2,1-3,0-4), and for (j=0,\ldots,5), edges (4-(5+3j),(5+3j)-(6+3j),(5+3j)-(7+3j)). It is a 23-vertex tree with \(a=15,x=7,p=10\), so (x+2=9\le10) and (30<31). The full parent independence vector is in `EVIDENCE.json`; its first descent includes the terminal scan. The strict selector consists of leaves (2,3) and the twelve two-leaf claw tags. For selected leaf (v=2), (s_v=1), \(\Delta_{10}(T-v)=-3434\), (H_v) has 21 vertices, (W_v=\{0,3\}), and their degrees in (H_v) are 1 and 0. Ordering (0,3), both residuals have order 19 (=2k+1), with differences (-2628,-1437). The second is the omitted ((i,\deg)=(2,0)) case. Ordering 3 first gives a first residual of order 20 (=2k+2). The selected leaf term is (-4065). The *complete* sum is (2(-4065)+12(-3010)=-44250), so the example corrects the classification but does not refute the primary claim.

For every residual of order at most (2k-1), the incidence bound from T1 proves (i_k-i_{k-1}\le0). If (J) is exactly (k) disjoint edges plus one isolated vertex, then (I_J(z)=(1+2z)^k(1+z)) and

\[
i_k(J)-i_{k-1}(J)=2^{k-2}\bigl(4-\binom{k}{2}\bigr),
\]

interpreted as the corresponding integer at (k=1). It is positive for (k=1,2,3) and negative for (k\ge4). This is a graph-subclass calculation; no guarded tree lift or universal sign for the (2k,2k+1) boundaries is proved. A proof at this shell still needs boundary signs or quantitative compensation across all selected tags.

## T5 — conditional coefficient identity and finite compensation

For the explicit (T_m) family above, root splitting yields \(q_a=zL^{3m}\) and \(q_c=z(2+5z+2z^2)B^{m-1}+zL^{3m}\), where (q_v(z)=I(H_v;z)-I(R_v;z)). The arm and claw original-leaf multiplicities are (1) and (3m). Consequently, **when both orbits pass the original strict selector**, the exact all-selected marked polynomial is

\[
Q_{\rm all}=(3m+1)zL^{3m}+3m z(2+5z+2z^2)B^{m-1},\qquad
S(T_m,p)=[z^p]Q_{\rm all}-[z^{p-1}]Q_{\rm all}.
\]

The proof is coefficient subtraction (q_v(p)-q_v(p-1)) for each original leaf, followed by its actual multiplicity. It does not assert both selectors agree at every (m,p), and (Q_{\rm all}) cannot replace the selected polynomial if an orbit fails. The related identity \(D_a-D_c=z^3(2+z)B^{m-1}\) compares deletion polynomials but not their adjacent differences' signs. The exact alpha is (3m+2), making the strict guard (p\le2m+1); first descent (x) must still be computed from (P) with terminal zero extension.

The sealed exact-integer coefficient computation checked (m=1,\ldots,50), every integer p with x+2<=p and 3p<2a+1, and each selector orbit separately. There are 674 eligible rows, none at (m=1,2); both orbits are selected in all 674, and every full selected sum is strictly negative. `REPLAY-TM.py` reconstructs the polynomials by integer multiplication, scans through the zero-extended terminal rank, and checks the row count and selector outcomes. One complete compensation row is \((m,p)=(22,34)\), a=68, x=32, and 102<137: the arm term is 212336130412243110>0, each of 66 claw terms is -7560098737536570631, and S=-498754180547001418536. These exact finite observations establish neither selector coincidence nor the selected coefficient inequality for (m>50), and a family theorem alone would not prove the arbitrary-tree primary claim.

## T6 — one pendant graft, exact selector and sums

Let (T_4) be the path (0-1-2) with four root-adjacent three-leaf claws, whose centers are (3,7,11,15). Let (T_4^+) add leaf 19 adjacent to root 0. The tree orders are 19 and 20. For any graph (G), attaching a leaf at (r) gives (I(G^+;z)=I(G;z)+zI(G-r;z)). For an old leaf (v\ne r), \(\Delta_p(G^+-v)=\Delta_p(G-v)+\Delta_{p-1}(G-\{v,r\})\). This is an exact selector update, but has no general sign.

At (p=9), the parent independence vectors are respectively

`[1,19,153,698,2028,4011,5665,5924,4689,2833,1297,438,103,15,1]` and

`[1,20,171,838,2648,5753,8961,10302,8897,5806,2843,1020,255,40,3]`.

Both have `a=14,x=7`: differences before rank 7 are nonnegative, rank-7 differences are `-1235,-1405`, and terminal differences at rank 14 are `-1,-3`. Thus `p=x+2=9` and `27<29`. Before graft, all twelve original claw leaves are favorable, each with `Delta_9(T_4-v)=-652`, `q_v(8)=1728`, `q_v(9)=912`, summand `-816`, and `S(T_4,9)=12(-816)=-9792`. After graft, all twelve old tags remain favorable with selector delta `-1395`, `q_v(8)=3192`, `q_v(9)=1848`, summand `-1344`. New leaf 19, support 0, has selector delta `-1536`, `q_19(8)=1686`, `q_19(9)=831`, summand `-855`. Hence the complete selected sum is `12(-1344)-855=-16983`. The four old support fibers each retain their three separate tags. `EVIDENCE.json` includes every `H_v,R_v` vector; `REPLAY-GRAFT.py` regenerates them by exact independent-set recursion. The result concerns these two trees at this one rank only. No induction, arbitrary graft selector closure, or universal potential inequality is established.

## Remaining obligations for synthesis

The complete lower-region ordinary aggregate remains open. T1's sufficient deletion-size condition is not forced by the guards. T4's odd-shell boundary residuals need a valid sign or compensation bound that includes isolated marked vertices. T5 has neither an infinite selector classification nor a uniform selected coefficient inequality. T2/T3 lack a universal selector-preserving weighted Hall cut proof; T67's negative sum does not address flow. T6's graft recurrence has no general sign or induction. None of the finite rows is a positive complete-sum counterexample. These are proposed conclusions with the exact scopes above; they do not change controller claim authority.
