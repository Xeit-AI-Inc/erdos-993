# C2-SYNTHESIS-PRIMARY-INFORMAL: exact first-interior theorem

**Status:** proposed complete informal proof; governed Lean fidelity and kernel gates have not run. The primary registry remains OPEN. This candidate is the unchanged `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`, with no residual hypothesis.

All graphs are finite simple graphs. For each integer (j), (i_j(G)) counts independent (j)-vertex subsets of (G), and is zero for (j<0) or (j>alpha(G)). Put (Delta_j(G)=i_{j+1}(G)-i_j(G)) in signed integers. For a finite connected acyclic graph (T), let (a=alpha(T)), let (p=a-2) **as an integer**, and let (x(T)=min{j>=0:Delta_j(T)<0}). This minimum exists: at (j=a), (Delta_a(T)=-i_a(T)<0). A zero difference is not a descent. Let (L(T)) be its original degree-one vertices. For each (v in L(T)), let (s_v) be its original unique neighbor, (H_v=T-{v,s_v}), and (R_v=T-N_T[s_v]), using the original closed neighborhood. Define (F_p(T)={v in L(T):Delta_p(T-v)<0}) at the **unshifted** original rank, and

\[
 S(T,p)=\sum_{v\in F_p(T)}\bigl(\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)\bigr).
\]

**Theorem.** If (x(T)+2<=p), then (S(T,p)<=0). The sum includes every favorable original leaf as a separate tag, even when several leaves have one support; the empty sum is zero.

**1. Eligibility forces (a>=7).** Since (x>=0) and (x+2<= a-2), we have (a>=4), (p>=2), and (x<=a-4) before using any natural-number subtraction. The tree has an edge, so (n=|V(T)|>=a+1). A tree has (n-1) edges. Therefore (i_0=1), (i_1=n), (i_2=\binom n2-(n-1)=\binom{n-1}2), and (Delta_0=n-1>0). This excludes (a=4), which would require (x=0). For (a>=5), (n>=6), and (Delta_1=\binom{n-1}2-n>0) (it is (4) at (n=6) and increases thereafter). This excludes (a=5), which would require (x<=1).

If (a=6), eligibility requires (x<=2) and (n>=7). Put (D=\sum_{u\in V(T)}\binom{\deg(u)}2). Counting independent triples by inclusion–exclusion over the edge-containing triples gives

\[
 i_3=\binom n3-(n-1)(n-2)+D,
 \qquad
 \Delta_2=\frac{(n-1)(n-2)(n-9)}6+D.
\]

Indeed, each of the (n-1) edges lies in (n-2) triples; two edges lie in one triple exactly when they meet, yielding (D); a triple cannot contain three tree edges. If (n>=9), both displayed terms in (Delta_2) are nonnegative. If (n=7), the complement of a maximum independent six-set is a one-vertex cover of all six edges, forcing a degree-six center; hence (D>=\binom62=15), and (Delta_2>=-10+15=5). If (n=8), the complementary two-vertex cover ({u,w}) meets all seven edges, so (deg(u)+deg(w)>=7). For nonnegative integer degrees of sum at least seven, (\binom{\deg(u)}2+\binom{\deg(w)}2>=\binom32+\binom42=9); thus (D>=9) and (Delta_2>=-7+9=2). Therefore (Delta_0,Delta_1,Delta_2>=0) whenever (a=6), contradicting strict (x<=2). Thus (a>=7). The argument uses no imported order bound or finite enumeration.

**2. Bipartite tagged-shadow bound.** Let (H) be any finite bipartite graph, possibly disconnected or empty, (W subseteq V(H)), (h=alpha(H)), and (q_j) count independent (j)-sets of (H) meeting (W), zero-extended at every integer rank (in particular (q_0=0)). For (1<= k<= h), count pairs ((A,B)) of tagged independent sets with (A subset B), (|A|=k), (|B|=k+1). Every (B) has at least (k) tagged deletions: at most its sole (W)-vertex, if it has one, is a tag-destroying deletion. So the incidence count is at least (kq_{k+1}). For a fixed tagged (A), possible additions lie in the induced bipartite graph (K=H-N_H[A]). Every independent set of (K) joins (A), hence (alpha(K)<= h-k). The larger color class of (K) has at least half its vertices and is independent, including isolates and disconnected components. Thus (|V(K)|<=2alpha(K)<=2(h-k)), giving at most that many additions per (A). It follows that

\[
 kq_{k+1}<=2(h-k)q_k \quad(1<= k<= h).
\]

There is no division by (q_k). Empty (W) gives zeros; at (k=h), both sides are zero; if (h=0), the quantified interval is empty. For (k>h), both (q_k) and (q_{k+1}) vanish by zero extension, so a parameterized inequality with a possibly negative right coefficient is true as (0<=0), without using the extension proof outside its range. No argument invokes (k=0).

**3. Exact original-leaf binding and sign.** Fix (v in L(T)) and write (s=s_v), (H=H_v), (W=N_T(s)\setminus\{v\}). Simplicity gives (W subseteq V(H)), and deletion of the original closed neighborhood gives (R_v=H-W). Independent sets of (H) avoiding (W) are exactly those of (R_v); hence for every integer (j), (q_j=i_j(H)-i_j(R_v)), and

\[
 \Delta_{p-1}(H)-\Delta_{p-1}(R_v)=q_p-q_{p-1}.
\]

The original leaf (v) can be added to every independent set of (H), so (h=alpha(H)<= a-1). Put (k=p-1=a-3). By step 1, (a>=7), so (k>=4>0). If (k>h), both (q_{p-1}) and (q_p) are zero. If (k<= h), the tagged-shadow bound and (h<= a-1) yield

\[
 kq_p<=2(h-k)q_{p-1}
 <=2((a-1)-(a-3))q_{p-1}
 =4q_{p-1}<= kq_{p-1}.
\]

Division by the positive integer (k) gives (q_p<= q_{p-1}). Thus every original leaf has a nonpositive summand, whether favorable or not. The strict selector (F_p(T)) simply chooses some of these tags. Summing once per selected **leaf vertex** proves (S(T,p)<=0), including shared-support multiplicity and an empty selector. No residuality or selector simplification appears.

**Broader endpoint check.** The same leaf argument for any finite bipartite (G) works at integer (p>=2) under (3p>=2alpha(G)+1): with (k=p-1), the guard gives (2(alpha(G)-1-k)<= k); if (k>alpha(H)), both tagged layers vanish. At (p=1), the guard forces (alpha(G)<=1); a degree-one edge gives (alpha(G)>=1), and (alpha(H)<=0), so (H) is empty and (q_0=q_1=0). This base case is separate from the shadow inequality. At the theorem's (p=a-2), the guard is (3p>=2a+1 iff a>=7); the theorem uses only (p>=5).

**Dependency DAG.** Elementary pair/triple tree counts plus maximum-set complement cover bounds => eligible (a>=7). Tagged deletion incidence plus bipartite color-class bound => tagged-shadow inequality. Original (R=H-W) and leaf extension => summand (q_p-q_{p-1}), (h<= a-1). These three nodes plus (k=a-3>=4) => every original-leaf summand (<=0). The unchanged strict selector and leaf-indexed integer sum => the exact primary theorem. This is a closed **informal** DAG, and is the proposed exact Lean candidate. The formal carriers, fidelity check, and kernel gate remain to be supplied by a governed Lean role.

Admitted sources: `cycles/cycle-2/C2-AT/REPORT.md`, `cycles/cycle-2/C2-AF/REPORT.md`, and `cycles/cycle-2/C2-AU/REPORT.md`, with their pinned returns; the first source's sealed audit is corroborative only. No raw origin or critique file was used for this synthesis.
