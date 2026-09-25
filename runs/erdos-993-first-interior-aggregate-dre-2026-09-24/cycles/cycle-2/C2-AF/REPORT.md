# C2-AF neutral adjudication of the F route

**Authority and outcome.** This is a proposed worker-only adjudication. I retain all thirteen assigned incoming IDs at the precise scopes below, with the finite claims remaining finite. The incidence bound, the small-alpha guard, and their composition give a complete **informal** proof of the unchanged ordinary-tree first-interior aggregate. No governed Lean build, fidelity gate, kernel check, registry award, or primary-success award occurred in this seat. Under `SOLUTION-CONTRACT.md`, the canonical primary claim remains OPEN pending its formal gate. I checked the SHA-256 hashes of all 40 files in `packets/C2-AF.json`; all matched. I used the three assigned F origins, their six assigned cross-orientation critiques, the frozen contracts, and the packet's admitted common historical authority. I did not use another current origin, adjudication, or controller mathematical note.

## Exact mathematical route

Let (H) be any finite simple bipartite graph, $W\subseteq V(H)$, $a=\alpha(H)$, and (q_j) the number of independent (j)-sets meeting (W). Counts are zero outside their possible ranks; in particular (q_0=0). For $1\le k\le a$, count pairs ((A,B)) of independent tagged sets with $A\subset B$, (|A|=k), and (|B|=k+1). Every tagged (B) has at least (k) tagged deletions. If it has one (W)-member, only deletion of that member loses the tag; if it has at least two, none does. Thus the incidence count is at least (kq_{k+1}).

For each tagged (A), its extension vertices form $X=V(H)\setminus N_H[A]$. Every independent set $I\subseteq X$ combines with (A), so $\alpha(H[X])\le a-k$. The induced (H[X]) is bipartite; its larger color class has at least (|X|/2) vertices and is independent. Therefore $|X|\le2\alpha(H[X])\le2(a-k)$. This bounds its tagged extensions, giving

\[
             kq_{k+1}\le 2(a-k)q_k. \tag{1}
\]

The argument covers disconnected (H), empty (W), and (k=a); at (k=a) the extension side is zero. If an incoming statement writes (1) for (k>a), it remains literally $0\le0$ by zero extension, but the extension proof and its nonnegative factor are invoked only for $1\le k\le a$. The $k\ge1$ guard matters: neither the deletion count nor later division is valid at (k=0). This is an aggregate layer count, not a claim that every individual independent set has a prescribed number of additions.

For a degree-one vertex (v) of finite bipartite (G), write (s) for its support, $H=G-\{v,s\}$, $W=N_G(s)\setminus\{v\}\subseteq V(H)$, and (R=G-N_G[s]=H-W). Every independent set of (H) extends by (v) in (G), hence $\alpha(H)\le b-1$ for $b=\alpha(G)$. Applying (1) at $1\le k\le\alpha(H)$ yields

\[
             kq_{k+1}\le 2(b-1-k)q_k. \tag{2}
\]

Here (q_j=i_j(H)-i_j(R)) exactly: an independent set of (H) is absent from (R=H-W) precisely when it meets (W). For every integer rank where differences are defined by zero extension,

\[
 \Delta_{p-1}(H)-\Delta_{p-1}(R)=q_p-q_{p-1}. \tag{3}
\]

Suppose $p\ge2$ and $3p\ge2b+1$. Set $k=p-1\ge1$. The guard rearranges to $k\ge2(b-1-k)$. If $k>\alpha(H)$, both (q_k,q_{k+1}) vanish. Otherwise the coefficient in (2) is nonnegative and $q_k\ge0$, so $kq_{k+1}\le2(b-1-k)q_k\le kq_k$. Dividing by positive (k) and using (3) proves the high-tail single-leaf sign. For (p=1), the guard forces $b\le1$, while edge (vs) forces $b\ge1$. Any vertex remaining in (H) would form an independent pair with (v); hence $H=R=\varnothing$ and the term is zero. This handles the base case without invoking (1) at (k=0), including disconnected (G). No favorable selector or residual premise is needed for the leafwise sign.

Now let (T) be an ordinary finite connected tree, $a=\alpha(T)$, (p=a-2) **as an integer**, and $x=\min\{j\ge0:\Delta_j(T)<0\}$. The terminal zero extension makes (x) exist. Eligibility $x+2\le p$ gives $x\le a-4$, so $a\ge4$ before any natural-number subtraction. Since $a\ge4$, the tree has an edge, order $n\ge a+1$, and $\Delta_0=n-1>0$. Its (n-1) edges forbid precisely those pairs, so $i_2=\binom{n-1}{2}$ and $\Delta_1=\binom{n-1}{2}-n>0$ for $n\ge6$. Thus (a=4) would require an impossible $x\le0$, and (a=5) an impossible $x\le1$.

For (a=6), eligibility would require $x\le2$, and $n\ge7$. Inclusion-exclusion over the (n-1) edges gives

\[
i_3=\binom n3-(n-1)(n-2)+\sum_u\binom{\deg(u)}2,
\qquad
\Delta_2=\frac{(n-1)(n-2)(n-9)}6+\sum_u\binom{\deg(u)}2. \tag{4}
\]

Each edge belongs to (n-2) triples. Two edges belong to one triple exactly when they meet; these pairs are counted by the degree sum. Three edges on three vertices would form a triangle, impossible in a tree. For $n\ge9$, both terms in (4) are nonnegative. For (n=7), the complement of a maximum independent six-set is one vertex covering all six edges; the connected tree is (K_{1,6}), and (4) gives (-10+15=5). For (n=8), the complementary two-vertex cover \(\{u,w\}\) meets every one of seven edges, so \(\deg(u)+\deg(w)\ge7\), even if edge (uw) is counted twice. The minimum of \(\binom d2+\binom e2\) over nonnegative integers with $d+e\ge7$ is $\binom32+\binom42=9$; (4)'s base term is (-7), so $\Delta_2\ge2$. In every case \(\Delta_0,\Delta_1,\Delta_2\ge0\), contradicting $x\le2$. Thus every eligible ordinary connected tree has **$a\ge7$**. This elementary proof closes the guard without the imported r27 forest-order bound used by C2-F2. That bound is a corroborating route, not a dependency of this adjudication.

At the primary rank (p=a-2), $a\ge7$ is exactly $3p\ge2a+1$, and $p\ge5$. A tree is bipartite, so the high-tail proof applies independently to every **original degree-one vertex** (v) with its original support (s_v). For that tag, $H_v=T-\{v,s_v\}$, $W_v=N_T(s_v)\setminus\{v\}$, and (R_v=T-N_T[s_v]=H_v-W_v). Equations (2)–(3) give \(\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)\le0\), whether or not (v) is favorable. The exact selector remains $\Delta_p(T-v)<0$, with no rank shift. It picks a subset of nonpositive terms; summing all selected **leaf tags** preserves repeated-support multiplicity and gives $S(T,p)\le0$. If the selector is empty, the sum is zero. No residual assumption is used. This proves the primary mathematical statement informally, with a closed DAG below; formal primary success still requires the governed Lean gate.

## Per-ID dispositions and objection reconciliation

| Incoming ID | Disposition | Exact scope and reason |
|---|---|---|
| `C2-F1-01` | `proposed_retained` | Equation (1) at finite bipartite (H), arbitrary (W), $1\le k\le\alpha(H)$, plus (2) on the leaf binding. Empty (W), disconnected (H), and endpoint $k=\alpha(H)$ are included. Both C2-CT-F1 and C2-CU-F1 checked the incidence sides. |
| `C2-F1-02` | `proposed_retained` | The exact finite bipartite leaf sign at integer $p\ge1$, $3p\ge2\alpha(G)+1$, including disconnected (G), above-degree zero cases and the separate (p=1) edge case. No selector premise. |
| `C2-F1-03` | `proposed_retained` | The strict-first-descent ordinary connected tree implication eligibility \(\Rightarrow\alpha\ge7\), proved by (4) and its (n=7,8) cover boundaries. It is not a forest statement. |
| `C2-F1-04` | `proposed_retained` | Exactly five path-with-arms instances (m=3,4,5,10,20), with selector and full sums; finite evidence only. C2-CT-F1 and C2-CU-F1 independently derive the generating polynomials. Positive terms at (m=3,4) are outside eligibility and the tail guard. |
| `C2-F2-ELIGIBILITY-ALPHA-GE-SEVEN` | `proposed_retained` | Same ordinary-tree small-alpha implication. C2-F2 and both critics use a pinned r27 $n\le4x$ bound to reduce to orders 7–8. The independent proof above also handles all $n\ge9$, so no imported theorem is essential. |
| `C2-F2-FRESH-ELIGIBLE-ORDER-NINE-REPLAY` | `proposed_retained` | Exactly the displayed order-nine graph, its six strict favorable original tags, and (S=-56). Both cross-orientation critiques checked it by independent polynomial recursion; it is no universal claim. |
| `C2-CT-F2-LARGE-245-CHECK` | `proposed_retained` | Exactly the critic's specified 245-vertex core-plus-pendant-path tree, with (a,p,x)=(125,123,69), six favorable original tags and complete S=-50595152. Its exact integer forest recursion is a bounded falsification check, not a universal sign argument. |
| `C2-F3-001` | `proposed_retained` | Same tagged inequality for all $k\ge1$: (1) is proved through $k=\alpha(H)$, and for larger (k) it is $0\le0$ by zero extension. The leaf refinement is (2) only while its factor is nonnegative; above $\alpha(H)$, zero extension handles the stated inequality. |
| `C2-F3-002` | `proposed_retained` | Same exact eligible-tree implication $a\ge7$, with an elementary proof independent of r27. |
| `C2-F3-003` | `proposed_retained` | The unchanged complete ordinary-tree first-interior claim is a closed **informal proof candidate** by (1)–(4), the guard comparison and the unshifted complete tag sum. It is not a formal or registry award. Both C2-CT-F3 and C2-CU-F3 checked selector, repeated supports, endpoints, and larger finite probes. |
| `C2-CT-F1-01` | `proposed_retained` | Constructive critic's new primary implication is the same informal composition. Its originality is the explicit assembly, not a separate mathematical theorem or formal success. |
| `C2-CU-F1-01` | `proposed_retained` | U critic's new primary implication is likewise the same closed informal composition, preserving all favorable original tags and no residual premise. |
| `C2-CU-F1-02` | `proposed_retained` | One exact eligible 244-vertex path-with-120-arms row with 121 favorable tags and negative full sum; finite only. Its two huge selector values and aggregate agree across independently derived exact polynomial computations. |

No objection changes a universal disposition. In particular, the rank (k=0) hazard is removed by the separate (p=1) argument; natural subtraction is guarded by $a\ge4$; (R=H-W) uses the **original** closed neighborhood; and the proof counts tagged sets once regardless of how many (W)-vertices they contain. Pointwise addability refutations attack a different quantified assertion. The C2-F3 all-(k) wording is retained with the explicit zero-extension case split, not by using a negative factor as an extension bound. The direct small-alpha proof removes a possible dependency on interpreting the imported r27 formal package. None of the critics identified a gap in the resulting informal composition.

## Numerical provenance, corrections, and fences

The F1 constructor is the tree (v-s-u-w) with (m) arms (w-a_j-b_j), order (4+2m), (a=m+2), and (p=m). Let (A=1+2z), (B=1+z). Conditioning on (w) gives \(I(T)=(1+3z+z^2)A^m+z(1+2z)B^m\). For designated (v), \(I(H_v)-I(R_v)=zA^m\); for each arm leaf, it is \(z(1+2z)B^{m-1}\). Thus the respective local terms at (p=m) are (m(5-m)2^{m-3}) and (-m^2+4m-2) for the checked $m\ge3$. The exact selector is still read from $\Delta_p(T-v)$ separately by tag. The source `cycles/cycle-2/C2-F1/checks.json` and independent `cycles/cycle-2/C2-CT-F1/independent_family.json` and `cycles/cycle-2/C2-CU-F1/family_check.json` give:

| (m) | ((n,a,p,x)) | Eligible? | selected designated term | selected term per arm | complete (S) |
|---:|---:|:---:|---:|---:|---:|
| 3 | (10,5,3,3) | no | 6 | 1 | 9 |
| 4 | (12,6,4,4) | no | 8 | -2 | 0 |
| 5 | (14,7,5,4) | no | 0 | -7 | -35 |
| 10 | (24,12,10,8) | yes | -6400 | -62 | -7020 |
| 20 | (44,22,20,14) | yes | -39321600 | -322 | -39328040 |
| 120 | (244,122,120,81) | yes | -2292918292728979880759067178983594393600 | -13922 | -2292918292728979880759067178983596064240 |

Every original leaf is strictly selected in these six checked rows. The (m=120) row belongs to the two critiques' fresh checks, not the five-instance scope of `C2-F1-04`. At (m=5), the tail guard is equality (3p=2a+1) and the designated term is zero, but eligibility fails since (x+2=6>5). At (m=4), the positive designated term is canceled by four arm terms; it is not a positive complete eligible sum. At (m=3), the positive complete sum is ineligible. The polynomial calculations and integer recursion are finite corroboration, never the source of the universal proof.

The order-nine tree of `C2-F2` has edges ((0,2),(1,2),(3,2),(5,4),(7,4),(4,6),(6,2),(2,8)). Its independence polynomial has coefficients ((1,9,28,42,39,22,7,1)), so ((a,x,p)=(7,3,5)) and (x+2=p). Tags (0,1,3,8) share support 2 and each has selector (-5), term (-10); tags (5,7) share support 4 and each has selector (-6), term (-8). All six are favorable, yielding (4(-10)+2(-8)=-56). `cycles/cycle-2/C2-CU-F2/REPORT.md` finds a separate prose error in the F2 boundary paragraph: for (K_{1,6}), (i_1=7), **not** \(\binom61=6\), because the center contributes a singleton. The corrected coefficient sequence is ((1,7,15,20,15,6,1)). Its first strict descent is still (x=3), with (a=6,p=4), hence ineligible; neither incoming F2 claim uses the erroneous singleton count.

The larger checks exercise different deletion geometries. `C2-F3/path1001_exact.json` gives (P_{1001}): ((a,p,x)=(501,499,277)), two favorable endpoint tags, term (-2593614875) each and full sum (-5187229750); it checked the tagged inequality for $k=1,\ldots,500$, including the endpoint. `C2-CT-F2/REPORT.md` independently computed an eligible order-245 origin-core-with-pendant-path tree with ((a,p,x)=(125,123,69)), six favorable tags and full sum (-50595152). `C2-CT-F3/broom253_exact.json` checks a path through 250 with two extra leaves at vertex 1: ((a,p,x)=(128,126,71)), four favorable tags, three sharing support 1, with full sum (3(-10342499)-9706627=-40734124); its shadow checks cover $k=1,\ldots,127$ per tag. `C2-CU-F3/branched_path302.json` checks a path through 300 plus a spur at 150: ((a,p,x)=(151,149,84)), three favorable tags, the spur having a two-vertex (W), and full sum (2(-7916017650)-8537866030=-24369901330); its checks cover $k=1,\ldots,150$ per tag. These are bounded exact instances, not an exhaustive sweep or independent proof of universality. The origin and critics provide their scripts at the correspondingly named pinned paths for replay; no source script was executed in place by this adjudicator.

The historical positive marked T22 and T60 controls have ((a,p)=(68,34)) and ((182,90)), so (3p=102<137=2a+1) and (270<365), respectively. Their marked ranks are also below their primary ranks (a-2=66,180). They remain valid obstructions to their broader all-window or governed scopes, but do not meet this proof's high-tail hypothesis or form a positive **complete primary** sum. The r26 result is at top rank (a-1) with residuality; neither its selector simplifications nor its status are imported. No KL log-concavity premise, (h)-index substitution, or ordinary-to-governed-`RTree` transport is used.

## Dependency DAG and limits

The exact informal DAG is: finite bipartite color-class bound and tagged deletion incidence \(\Rightarrow\) (1); original leaf extension (\alpha(H)\le\alpha(G)-1\) \(\Rightarrow\) (2); original-neighborhood deletion identity \(R=H-W\) \(\Rightarrow\) (3); positive-rank tail algebra plus separate (p=1) case \(\Rightarrow\) high-tail single-leaf sign. Independently, connected-tree pair/triple counts plus one-/two-vertex-cover boundaries \(\Rightarrow\) eligible (a\ge7). Then (p=a-2) makes (a\ge7\iff3p\ge2a+1); tree bipartiteness and the single-leaf sign apply to every original tag; the exact strict selector merely chooses a subset; integer summation \(\Rightarrow S(T,p)\le0\). The r27 order bound, finite computations, residual theory, and all governed beta scopes are outside this proof DAG.

The mathematical argument is complete at the informal level, but it has not passed a governed Lean gate. This adjudicator ran no Lean build and made no formal or registry claim. The only numerical checks attributed above are exactly the named source/critique finite instances and ranges; I did not conduct a new sweep. All owned commands have terminated; no owned background jobs remain.
