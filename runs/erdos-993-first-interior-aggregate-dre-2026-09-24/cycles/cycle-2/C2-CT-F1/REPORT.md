# C2-CT-F1 constructive critique of C2-F1

## Verdict and source boundary

I propose retaining all four incoming claims at their exact stated scopes. The two counting claims and the small-alpha eligibility claim have complete informal proofs. Together they also yield a new, explicitly proposed **informal proof of the primary first-interior aggregate**. This is not a governed Lean award or a registry change. Source evidence is the pinned `cycles/cycle-2/C2-F1/{REPORT.md,RETURN.json,checks.py,checks.json}` (all four hashes match `packets/C2-CT-F1.json`), the local semantic and solution contracts, and the historical `control/C2-CAPSULE-AND-COUNTEREXAMPLE-GATE.md` and `control/C2-REGISTERED-CLAIM-IDENTITY.json` allowed by `packets/C2-T1-v2.json`. I have read no sibling return or current controller note. The source worker's checker was not executed in place; `independent_family.py` below is my separate exact check.

## C2-F1-01: retain tagged shadow and its leaf application

Let \(H\) be finite simple bipartite, \(a=\alpha(H)\), \(W\subseteq V(H)\), and \(1\le k\le a\). Let \(q_j\) count independent \(j\)-sets intersecting \(W\), with zero extension. Count pairs \(A\subset B\) of independent tagged sets of respective sizes \(k,k+1\). For each tagged \(A\), the possible new vertices lie in \(X=H-N_H[A]\). Every independent \(I\subseteq X\) combines with \(A\), so \(\alpha(X)\le a-k\). The larger bipartition class of \(X\) has at least half its vertices and is independent, giving \(|X|\le2\alpha(X)\le2(a-k)\). Thus the incidence count is at most \(2(a-k)q_k\). For each tagged \(B\), at most one deletion loses its only tag; hence at least \(k\) deletions preserve tagging. The same count is at least \(kq_{k+1}\). This includes \(W=\varnothing\) and \(k=a\). The \(k\ge1\) guard is essential for the deletion count and later division.

For a degree-one \(v\) with support \(s\) in bipartite \(G\), put \(H=G-\{v,s\}\) and \(W=N_G(s)\setminus\{v\}\). Every independent set of \(H\) extends with \(v\) in \(G\), so \(\alpha(H)\le b-1\) for \(b=\alpha(G)\). The same incidence proof, using \(|X|\le2(b-1-k)\), gives the stronger application for \(1\le k\le\alpha(H)\). This statement is about layer counts; it does not assert pointwise addability for each independent set.

## C2-F1-02: retain high-tail leaf sign

The induced graph \(R=G-N_G[s]\) equals \(H-W\), including disconnected \(G\). Thus \(q_j=i_j(H)-i_j(R)\) and the claimed signed difference is \(q_p-q_{p-1}\). If \(p\ge2\), set \(k=p-1\). The guard \(3p\ge2b+1\) is exactly \(3k\ge2(b-1)\), equivalently \(k\ge2(b-1-k)\). If \(k>\alpha(H)\), both counts vanish. Otherwise, \(b-1-k\ge0\), and C2-F1-01 gives \(kq_{k+1}\le2(b-1-k)q_k\le kq_k\); division by positive \(k\) proves the sign. At \(p=1\), the guard forces \(b\le1\). The edge \(vs\) gives \(b\ge1\). Any vertex in \(H\) would be independent from \(v\), contradicting \(b=1\). Hence \(H=R=\varnothing\), and the signed difference is zero. This separate base case is necessary; using the shadow bound at \(k=0\) would be invalid.

## C2-F1-03: retain the small-alpha exclusion

Eligibility at integer \(p=\alpha(T)-2\) implies \(\alpha\ge4\), so the rank is defined. A connected tree of order \(n\) with \(\alpha\ge4\) has \(n\ge\alpha+1\). It has \(i_0=1\), \(i_1=n\), and \(i_2=\binom{n-1}{2}\). Thus \(\Delta_0=n-1>0\) and \(\Delta_1=\binom{n-1}{2}-n>0\) for \(n\ge6\). If \(\alpha=4\), eligibility demands \(x\le0\); if \(\alpha=5\), it demands \(x\le1\); both contradict these differences.

For \(\alpha=6\), eligibility demands \(x\le2\). In a tree, inclusion-exclusion over the \(n-1\) edges counts independent triples exactly:

\[
i_3=\binom n3-(n-1)(n-2)+\sum_u\binom{\deg(u)}2,
\quad
\Delta_2=\frac{(n-1)(n-2)(n-9)}6+\sum_u\binom{\deg(u)}2.
\]

The first term is nonnegative for \(n\ge9\). At \(n=7\), the complement of an independent six-set is one vertex meeting all edges, so connectedness makes \(T=K_{1,6}\), with \(\Delta_2=20-15=5\). At \(n=8\), the complementary two-set is a vertex cover. Its two degrees sum to at least the seven edges, giving degree-binomial sum at least \(\binom32+\binom42=9\); the first term is \(-7\), so \(\Delta_2\ge2\). Hence \(x>2\). No eligible tree has \(\alpha\le6\). This handles all boundary orders without importing a mismatched forest theorem.

## C2-F1-04: retain the finite rows; fresh larger test

For the source family, vertices are \(v-s-u-w\), with \(m\) arms \(w-a_j-b_j\). It is a tree of order \(4+2m\), original leaves \(v,b_0,\dots,b_{m-1}\), and independence number \(m+2\). Write \(A=1+2z\), \(B=1+z\). Conditioning on \(w\) gives the exact integer polynomials

\[
I(T)=(1+3z+z^2)A^m+z(1+2z)B^m,
\]

\[
I(T-v)=(1+2z)A^m+z(1+z)B^m,
\]

\[
I(T-b_j)=(1+4z+4z^2+z^3)A^{m-1}+z(1+2z)B^{m-1}.
\]

For \(v\), \(I(H_v)-I(R_v)=zA^m\); for each \(b_j\), \(I(H_{b_j})-I(R_{b_j})=z(1+2z)B^{m-1}\). At the unshifted rank \(p=m\), the local terms are therefore \(m(5-m)2^{m-3}\) and \(-m^2+4m-2\), respectively, for \(m\ge3\). The second expression preserves multiplicity: there are \(m\) distinct arm leaves.

`independent_family.py` expands these closed polynomials in exact integers, scans all \(0\le j\le\alpha\) for the first **strict** negative difference, applies each of the two selector-orbit predicates at the original \(p\), and sums selected terms with multiplicity. It reproduces all five source rows \(m=3,4,5,10,20\), including their \(x\), marked term and complete sum. The new target \(m=120\) has 244 vertices, beyond the inherited order-243 fixture. It yields \((\alpha,p,x)=(122,120,81)\), so \(x+2=83\le120\) and \(3p=360\ge245=2\alpha+1\). Both selector orbits are true: \(\Delta_p(T-v)=-158178131498404988875553040173361011683\), and each \(\Delta_p(T-b_j)=-1285197318424540534613868451408558162157\). The 121 selected leaves have local terms \(-2292918292728979880759067178983594393600\) and \(-13922\) for each arm leaf, giving the complete sum \(-2292918292728979880759067178983596064240\). The script records \(\Delta_{80}>0\) and \(\Delta_{81}<0\) as well as scanning all earlier ranks. Replay: `python3 scratchpad/C2-CT-F1/independent_family.py`; its output is `scratchpad/C2-CT-F1/independent_family.json`. This is a finite check, not the proof of the universal statements.

The inherited positive marked T22 and T60 controls at \((\alpha,p)=(68,34),(182,90)\) fail the tail guard, since \(102<137\) and \(270<365\). Their governed all-window beta refutations remain in force. The order-243 standing control and r26 top-rank residual theorem have different ranks or hypotheses. No ordinary-tree/governed-`RTree` transport is used. In particular, no positive local or incomplete-selector row is being promoted to a primary counterexample.

## New proposed implication: the primary aggregate

For any eligible ordinary connected tree, C2-F1-03 gives \(a=\alpha(T)\ge7\). At \(p=a-2\), \(3p\ge2a+1\) is exactly \(a\ge7\). Apply C2-F1-02 separately to every **original** degree-one vertex \(v\). Each integer summand \(\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)\le0\), regardless of favorability. The selector \(F_p(T)\) merely chooses a subset of these nonpositive terms. Summing all its leaf tags, including distinct leaves with one support, gives \(S(T,p)\le0\); an empty selector gives zero. No residual assumption enters. This is the full primary statement as an informal proof, conditional only on retaining the three proofs audited above, with no outstanding mathematical subcase identified. The solution contract still requires the governed Lean gate for primary success, which this critique does not run.

There was no broad search, Lean build, remote/master edit, subagent, or background job. No owned job remains. All physical outputs are in this assigned scratch directory.
