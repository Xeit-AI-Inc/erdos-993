# C2-AF neutral adjudication (orientation N)

## Scope and verdict boundary

This review covers the six F-origin routes C2-F1 through C2-F6 and both sealed cross-orientation critics for each route, C2-CT-F1..F6 and C2-CU-F1..F6. The case packet's 87 worker files and the common packet's 27 files all matched their listed SHA-256 hashes. The required covered-claim set is exactly the four IDs in `RETURN.json`. All conclusions below are proposed worker conclusions.

Write (i_j(G)) for the independent-set count, zero outside its degree, and (Delta_j=i_{j+1}-i_j). In the two universal registered assertions, (T) is an ordinary tree, (a=\alpha(T)), (x) is the first strict descent including the terminal comparison with zero, (p\ge x+2), and (3p<2a+1). The fixed selector is (F=\{v\text{ original leaf}:\Delta_p(T-v)<0\}). With the **original** support (s_v), (H_v=T-\{v,s_v\}), and (R_v=T-N_T[s_v]), the complete assertion is

\[
S(T,p)=\sum_{v\in F}\left[\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)\right]\le0.
\]

Each leaf remains a separate summand when supports coincide. The first-order shell adds \(|T|=2p+2\). Neither universal assertion is proved or refuted by these six routes.

## The material conflict: F3 is one vertex below the shell

F1 reports that all 1,696 eligible trees of order 16 at (p=7) have (S\le-906). F3 reports an eligible (p=7) row with (S=-844), supposedly of order 16. The two numbers would be incompatible if F3 were in the shell. Its generator shows why it is not.

`types_of_size(2*p)` constructs a rooted type (t) of weight (2p), where `weight(t)=1+sum(weight(child))`. The loop calls the child tuple itself `f`. Thus the attached branches in `f` have total weight (2p-1). `make_tree(f)` adds support 0 and its distinguished leaf 1, so **every F3 graph has (2p+1) vertices and (2p) edges**. The output field `n=2*p+2` is hard-coded and is not a check of `len(T.vertices)`. Both critics replayed the same generator and repeated this order error; their exact replay agreement cannot certify the asserted shell scope.

For the reported maxima, independent enumeration of vertex subsets from the source edge lists confirms the actual graph counts and arithmetic:

| (p) | reported order | actual order | (a) | (x) | selected tags | full (S) |
|---:|---:|---:|---:|---:|---:|---:|
| 6 | 14 | 13 | 9 | 4 | 6 | -212 |
| 7 | 16 | 15 | 11 | 5 | 8 | -844 |

For (p=6), the selected leaf/support/summand triples are ((1,0,-36),(2,0,-36),(5,4,-34),(8,7,-34),(11,10,-36),(12,10,-36)). For (p=7), they are ((1,0,-118),(2,0,-118),(5,4,-93),(6,4,-93),(9,8,-118),(10,8,-118),(13,12,-93),(14,12,-93)). In both rows all displayed leaves pass the strict selector; the subset count checks (x+2\le p), the strict lower-region guard, and the terminal difference. The edge lists, full independent-set vectors, all selector values, and both original-deletion differences are in this worker's `EVIDENCE.json`.

**Disposition of the F3 source claim as a first-shell claim: rejected.** A separate corrected bounded observation survives: the filtered rooted family actually has orders (2p+1=7,9,11,13,15) for (p=3,4,5,6,7). Its generated row counts are (10,66,430,2923,20486), with eligible row counts (0,0,0,418,1221). The replays report zero positive selected terms and zero positive sums in all 1,639 eligible rows, with ranges ([-387,-212]) at (p=6) and ([-1495,-844]) at (p=7). The filter requires at least two child branches and at least two distinct rooted child types. Counts are of rooted representatives and can repeat unrooted trees. The critics' replay evidence supports arithmetic on these **actual** graphs, subject to the shared generator and evaluator; it does not enlarge either shell census. This correction is recorded as derived claim `C2-AF-F3-CORRECTED-ORDER-BAND`.

## Route dispositions and critic reconciliation

| Route and source claim | Route disposition | Two critic claims and adjudication |
|---|---|---|
| F1, `E993-LOWER-REGION-FIRST-ORDER-SHELL` | `retained_narrowed`: exact bounded (n=16,p=7) census; universal shell remains open. | CT-F1 and CU-F1 both retained the bounded result. Their replay conclusions are retained at that finite scope. |
| F2, `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | `retained`: two exact eligible negative rows, including one positive selected local term; no universal result. | CT-F2 and CU-F2 retained those two rows. Their bounded conclusion is retained. |
| F3, `E993-LOWER-REGION-FIRST-ORDER-SHELL` | `rejected` at the claimed shell order; the corrected order-band computation is a derived bounded claim. | CT-F3 and CU-F3 retained an (n=2p+2) claim after replaying the same generator. That order assertion is rejected; their selector and sum arithmetic is retained only for (n=2p+1). |
| F4, `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | `retained_narrowed`: a proved infinite two-hub subfamily, no universal ordinary-tree conclusion. | CT-F4 and CU-F4 audited the coefficient proof; their family result is retained. Their proposed grades differ (`proposed_open` versus `proposed_verified`) only in how to label the registered universal key; the family theorem is supported, the universal key remains open. |
| F5, `C2-F5-P6-SHELL-LP` | `retained`: exact bounded (n=14,p=6) census and finite convex-hull optimum. | CT-F5 and CU-F5 retained the same bounded result. The LP supplies no variable-rank inequality. |
| F6, `C2-F6.ROOT-PENDANT-T22-OBSTRUCTION` | `retained`: one exact root-leaf attachment and all its eligible ranks. | CT-F6 and CU-F6 retained the finite operation result; neither supports a padding-family theorem. |

The repeated registered IDs in F1/F3 and F2/F4 require one JSON review entry per ID. The table gives a disposition for each occurrence, including all twelve critic claims. The F3 order correction is the only substantive disagreement with the critics.

## Exact retained statements and proof sketches

### F1: first shell at (p=7)

The centroid generator emits 19,320 distinct free-tree codes of order 16, using rooted component multisets at one center and unordered rooted half-trees at two centers. The source checks code uniqueness and tree order. It computes exact tree-DP polynomials, scans the first strict descent through the terminal zero-extended rank, and selects each original leaf by \(\Delta_7(T-v)<0\). For each eligible tree, an independent subset pass over all (2^{16}) vertex masks recomputes the full polynomial, every leaf selector, each original (H_v/R_v) term at rank 6, and the complete sum. Both critics reran the pinned code and matched all recorded rows. Exactly 1,696 classes pass both guards; every one has (a=11,x=5), so (x+2=7) and (21<23). Their sums range from (-1759) to (-906), with no nonnegative row. The maximum row has seven selected original leaves and summands (-139) six times plus (-72), totaling (-906). This is the full (n=16,p=7) shell slice only. The class-completeness premise is the pinned recursive centroid construction and its checked 19,320-class boundary, not a formal generator proof.

### F2: two perturbations of positive-local controls

In the first tree, take path (0-1-2) and attach 59 identical root-adjacent (K_{1,3}) arms. This is the one-arm deletion of the 60-arm shape: (n=239,p=90,a=179,x=86), so (88\le90) and (270<359). The strict selector contains the distinguished path leaf and all 177 arm leaves. Its distinguished summand is zero; every arm-leaf summand is (-967598047698738457682281452059074396558996699664118837). Hence

\[
S=-171264854442676707009763817014456168190942415840549034149.
\]

In the second tree, take path (0-1-2), one root-adjacent center with two leaves, and 64 root-adjacent centers with three leaves each. This ordinary tree has (n=262,p=96,a=196,x=94), so (x+2=96) and (288<393). All 195 original leaves are strictly selected: one path leaf, two leaves on the 2-leaf arm, and 192 leaves on the 3-leaf arms. Their respective per-tag summands are (+68936685941554851752273316418217317715692442678170969440), (-67150687626637070873560705941144119543366469364879833171712), and (-120267598545376401819906434809614564165711622909828362611506). Thus

\[
S=-23225611359279601736317404622011866341585648844974127116783136.
\]

Automorphisms permuting equal arms and leaves within an arm justify representative selector calculations; the evidence expands each class into distinct tags. Each (H_v), (R_v), support, and neighborhood belongs to the original tree. Both critics regenerated the exact JSON and checked the full zero-extended coefficient vectors, selectors, and sums. The positive selected term in the second tree is genuinely compensated in the complete sum. These are two instances, not a family-wide inequality.

### F4: infinite uneven two-hub subfamily

For integer (v\ge8), let (T_v) have adjacent hubs (A,B), one pendant leaf at (A), and (v) pendant leaves at (B). Splitting independent sets by hub occupancy gives

\[
I(T_v;z)=(1+z)^v(1+2z)+z+z^2,\qquad a=v+1.
\]

With zero-extended binomials, set (g_j=\binom vj+2\binom v{j-1}); the full coefficient is (g_j+\mathbf1_{j=1}+\mathbf1_{j=2}). The terminal difference is (-2). For (j\ge3), the sign of (g_{j+1}-g_j) is that of ((v+1)^2-j(2j+v+3)), positive through (j=\lceil v/2\rceil-2); the low-rank corrected differences are also nonnegative for (v\ge8). Hence (x\ge\lceil v/2\rceil-1), and every eligible (p) has (k=p-1\ge\lceil v/2\rceil). The strict upper guard ensures (p<v). Deleting the unique (A)-leaf gives \((1+z)^{v+1}+z\) and a negative selector difference at eligible (p). Deleting any (B)-leaf gives the same two-hub family with (v-1) heavy leaves; its selector-difference sign is that of (v^2-p(2p+v+2)<0). Thus **all (v+1) leaves are selected**.

For the (A)-leaf, (I(H)-I(R)=z), giving summand zero at (k\ge4). For each (B)-leaf, (H=K_2\sqcup(v-1)K_1), (R=K_1), so

\[
q(z)=I(H)-I(R)=(1+2z)(1+z)^{v-1}-(1+z).
\]

At (k\ge\lceil v/2\rceil), (q_{k+1}-q_k\le0): for (k<v) its sign is that of (v^2-k(v+2)-2k^2<0), and zero extension covers (k\ge v). Therefore (S(T_v,p)=v(q_p-q_{p-1})\le0), retaining all (v) heavy-leaf tags. Eligible ranks exist for every (v\ge16), since the full-polynomial ratio has turned negative by (j=\lfloor3v/5\rfloor), and (p=x+2) then satisfies the strict upper guard. The exact (v=11,p=8) check has (n=14,a=12,x=6), selector differences (-275) and (-185), and (S=11(-255)=-2805). This proof is confined to the stated uneven two-hub family; it supplies no universal cross-support compensation rule.

### F5: first shell at (p=6)

The pinned center-based instrument enumerates 3,159 distinct free-tree codes of order 14. Exactly 240 meet (x+2\le6) and (18<2a+1), all with (a=9,x=4). The instrument independently subset-replayed every eligible row, including every strict \(\Delta_6(T-v)<0\) decision and every original-deletion rank-5 summand. Both critics reran its order-14 slice and matched all 240 rows. Their (S) values range from (-404) to (-222), with no nonnegative value. An attaining tree has code `U:(((((()))()))((((()))()))())`, five selected leaf summands (-30,-53,-30,-53,-56), and (S=-222).

The claimed LP has one nonnegative weight \(\lambda_T\) for each of these 240 actual eligible trees, with \(\sum_T\lambda_T=1\), and maximizes \(\sum_T\lambda_T S(T,6)\). Its optimum is exactly (-222): every column is at most (-222), the constant dual bound is feasible, and the displayed tree attains it. This restates the finite maximum; it gives no structural dual inequality for variable (p). Completeness at order 14 depends on the pinned recursive centroid enumeration, code uniqueness, the 3,159-class boundary, and exact subset replay, as described in the instrument protocol.

### F6: one root pendant attachment

Let (T_{22}) have root 0, path (0-1-2) with marked leaf 2, and 22 claws: for (j=0,\ldots,21), center (3+4j) is adjacent to 0 and to leaves (4+4j,5+4j,6+4j). Add leaf 91 adjacent to 0 to obtain (T_{22}^{+}). With (B(z)=1+4z+3z^2+z^3), conditioning on root 0 gives

\[
I(T_{22};z)=(1+2z)B(z)^{22}+z(1+z)^{67},\quad
I(T_{22}^{+};z)=(1+z)(1+2z)B(z)^{22}+z(1+z)^{67}.
\]

The base has (n=91,a=68,x=32), eligible ranks 34 through 45. Its (p=34) marked summand is (+212336130412243110), but its complete sum is (-498754180547001418536). The padded tree has (n=92,a=68,x=33), terminal difference (-1), and exactly eligible ranks (p=35,\ldots,45), since (3p<137). At every padded eligible rank all 68 original leaves (67 old plus new leaf 91) are strictly selected, including marked leaf 2. In increasing (p), its marked summands are

`-212336130412243110, -600607911737487654, -889789498870352080, -1043699033810088656, -1059393756123022320, -962810849581892080, -796507157381383448, -605225888816998680, -424618798185894312, -275915087740492200, -166341153374650800`.

The corresponding **complete** sums are

`-1385054486733687214684, -1900020604270788101575, -2115717975797519395049, -2053526405105798701837, -1789338575833081467601, -1420918152592968682631, -1037249829990671310013, -699754627589654663246, -437750405299345896868, -254483218709044259680, -137658965005642503754`.

The source and both critics checked exact DP polynomials, the strict selector for every original leaf, original supports and closed neighborhoods, distinct same-support tags, each term, and every full sum. This is an exact bounded obstruction to **this one** proposed root-leaf padding of **this one** control. It says nothing about longer paths, other attachments, or all trees.

## Dependencies and remaining obligations

The finite enumerations depend on listed, hash-verified Python generators/evaluators and their sealed exact-result files. F1 and F5 include exhaustive subset replays within their stated finite boundaries; their critics repeated those checks with the same generator. F3's corrected maximum rows were additionally counted here from vertex subsets without the tree DP. F4 is an elementary symbolic binomial proof. F2 and F6 are exact finite DP evaluations with two independent critic replays but no universal extrapolation. No imported literature theorem or Lean result is invoked.

The first-shell assertion remains open at all unenumerated shell orders and ranks. The primary remains open outside the proved F4 family and the checked finite trees. In particular, the positive selected F2 term and the unpadded F6 positive term do not refute a full-sum assertion. No route supplies the required universal cross-tag or cross-support deficit budget, and no route supplies a positive eligible complete sum. The common marked-incidence identity leaves precisely such a positive-coefficient deficit budget unproved; its nonnegative deficit terms alone cannot close the lower-region claim.
