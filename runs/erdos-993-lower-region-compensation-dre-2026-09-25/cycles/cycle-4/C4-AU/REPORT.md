# C4-AU neutral origin-U adjudication — proposal only

The seven required claim IDs from six U routes and twelve cross-orientation critics are disposed below. Both packet inventories were checked against SHA-256: all 179 common and all 67 case files matched. This is an independent evidence adjudication, not an authoritative verdict. In particular, none of these routes proves or refutes the primary lower-region assertion
\(S(T,p)\le0\) for every ordinary tree with \(x(T)+2\le p\) and \(3p<2\alpha(T)+1\). The selector is always the original strict set \(F(T,p)=\{v\text{ original leaf}:\Delta_p(T-v)<0\}\), and every selected original leaf contributes, including leaves sharing a support. No route gives an eligible ordinary tree with a positive **complete** selected sum. All seven dispositions below are proposed worker conclusions.

Write \(a=\alpha(T)\), \(k=p-1\), \(H_v=T-\{v,s_v\}\), \(W_v=N_T(s_v)\setminus\{v\}\), and \(R_v=T-N_T[s_v]=H_v-W_v\). If \(q_v(j)\) counts independent \(j\)-sets of \(H_v\) meeting \(W_v\), then \(q_v(j)=i_j(H_v)-i_j(R_v)\) and the original summand is exactly \(q_v(p)-q_v(p-1)\). These identities preserve the fixed selector and all leaf tags; a sign conclusion requires an additional argument.

## C4-U1-COVARIANCE-DECOMPOSITION — retained, proposed_verified for identities

For each independent \(p\)-set \(B\) of \(T\), let \(w(B)\) count selected leaves \(v\in B\) for which \(B\setminus\{v\}\) meets \(W_v\), and let \(e(B)\) be the actual number of vertices addable to \(B\). Put \(Q=\sum_Bw(B)\), \(E=\sum_Bw(B)e(B)\), \(N=i_p(T)\), and \(\mu_j=(j+1)i_{j+1}(T)/i_j(T)\). The tag map \((v,A)\mapsto(v,A\cup\{v\})\) bijects marked independent \(k\)-sets \(A\subseteq H_v\) with the tagged sets counted by \(w\). Since \(A\) meets \(W_v\), the support is blocked; addability in \(H_v\) equals addability of \(B\) in \(T\). Double counting extensions gives \(\mathbb E_p e=\mu_p\), whence, for \(Q>0\),

\[
 E/Q=\mu_p+\operatorname{Cov}_p(w,e)/\mathbb E_p w.
\]

The exact neighborhood expansion is \(\operatorname{Cov}_p(w,e)=\sum_u[\sum_Bw(B)I_u(B)/N-(Q/N)i_p(T-N_T[u])/N]\), where \(I_u(B)=1\) iff \(B\cap N_T[u]=\varnothing\). Eligibility ensures \(N>0\). Thus CT_x, \(i_x E\le(x+1)i_{x+1}Q\), is equivalent for \(Q>0\) to \(\operatorname{Cov}_p(w,e)/\mathbb E_p w\le\mu_x-\mu_p\); when \(Q=0\), \(E=0\) and CT_x is trivially true. The support-neighborhood contribution from its own tag is nonpositive, but other contributions have no controlled total sign. The route and both critics establish this algebra, not CT_x or a global compensation budget. The order-14 diagnostic mentioned by the route is not needed as a premise here.

## C4-U2-MARKED-SHELL-REDUCTION — retained_narrowed, proposed_open for the unrestricted problem

The precise conditional theorem survives **after correcting the index**. Let \(T\) be a tree with \(|T|=2p+s\), \(p\ge3\), \(s\ge2\), and \(v\) any original leaf. Suppose \(\tau(T)\ge\lceil3s/2\rceil+1\). Order the marks \(W_v\) with a nonisolated one first. For every first-mark block let \(J_i=H_v-(N_{H_v}[w_i]\cup\{\text{earlier marks}\})\), \(\ell_i=|H_v|-|J_i|\), \(r=p-2\), and \(d_i=s+2-\ell_i\). Require \(r\ge K(d_i)=2(\lceil3d_i/2\rceil-1)-d_i\) whenever \(d_i\ge3\). Under the inherited large-rank forest matching implication at those exact hypotheses and the exact two-edge first-wide boundary for \(d_i=2,r=1\), the conclusion is

\[
\Delta_{p-1}(T-\{v,s_v\})-\Delta_{p-1}(T-N_T[s_v])\le0.
\]

The proof partitions marked \(j\)-sets by their first mark: \(q_j=\sum_i i_{j-1}(J_i)\). Every \(\ell_i\ge2\), and adjoining all deleted vertices except the first mark to a cover of \(J_i\) proves \(\tau(J_i)\ge\tau(H_v)-(\ell_i-1)\). Here \(\tau(H_v)=\tau(T)-1\), so \(\tau(J_i)\ge\lceil3s/2\rceil-(\ell_i-1)\ge m(d_i)=\lceil3d_i/2\rceil-1\) for \(d_i\ge2\). Forest cover equals matching number. If \(d_i\le1\), \(|J_i|\le2r+1\) and ordinary extension double counting gives \(i_{r+1}(J_i)\le i_r(J_i)\). For \(d_i\ge2\), the matching and rank hypotheses invoke the inherited results. Crucially,

\[
q_j-q_{j-1}=\sum_i\Delta_{j-2}(J_i),
\]

**not** \(\sum_i\Delta_{j-1}(J_i)\). The route's generic sentence with \(j-1\) is false. The append-only repair gives a four-vertex counterexample: an edge \(0-1\), isolates \(2,3\), ordered marks \(0,2,3\), residual \(\Delta_1=-1\) in all three blocks, yet \(q_1=3<q_2=5\). The specialization \(j=p\) uses \(r=p-2=j-2\), so the conditional theorem remains valid. Its pointwise result sums over **any fixed subset** of original leaves, including \(F(T,p)\), with multiplicities intact.

The parent cover threshold and residual rank gate are hypotheses, not consequences of the target's eligibility. At second shell \(s=3,p=6,\ell=2\), one has \(d=3,r=4,m=4,K=5\): the generic matching theorem does not apply. A separately audited odd-order four-matching result gives \(i_5\le i_4\) on the 11-vertex residual if cover loss supplies four matching edges; this is an inherited boundary dependency, not part of the generic gate. At \(s=5\), the stated cover-Catalan estimate with \(c=8\) and terminal \(q=p-2\) has outside size \(N=2q+1\), zero empty-fiber binomial difference, and already a negative first subtraction \(-8\mathrm{Cat}_{q-1}\). This only shows that estimate cannot force the cover threshold. The order-24 six-cover example has \(p=10,x=8,a=18\), all 17 leaves favorable, and \(S=-122805\); it defeats a uniform seven-cover shortcut, not the aggregate. No universal shell sign or complete target follows.

## C4-U3.LOW-COVER-SKELETON — retained_narrowed, proposed_verified for corrected structure

For each \(n\in\{24,26,28,30\}\), every ordinary tree of order \(n\) with cover number at most six has a designated six-vertex cover \(C\) (pad a smaller cover), at most five outside connector vertices \(D\) of degree at least two, and pendant outside leaves attached to \(C\). Deleting the latter leaves a tree \(K=T[C\cup D]\). If \(t=|D|\), \(e_C=|E(T[C])|\), and \(m_c\) is the number of outside leaves at \(c\in C\), then

\[
e_C+\sum_{u\in D}(\deg_K(u)-1)=5,\qquad t\le5,\qquad\sum_{c\in C}m_c=n-6-t.
\]

This follows by subtracting \(n=6+t+L\) from \(n-1=e_C+\sum_D\deg_K(u)+L\). Conversely, every connected core satisfying these conditions, with nonnegative pendant multiplicities, yields a tree covered by \(C\). Enumerating cover edges, connector neighborhoods, connected cores, and **all** weak compositions is exhaustive (duplicates are harmless). The number of six-part weak compositions at fixed \((n,t)\) is \(\binom{n-t-1}{5}\), not the route's printed \(\binom{n-t-2}{5}\); the maximum \(\binom{29}{5}=118755\) at \((30,0)\) was numerically right. Cover vertices that have full-tree degree one are original leaves and need separate selector tests.

The route's and both critics' printed core-state polynomial is **false**. A core set \(I\) blocks a pendant leaf at \(c\) precisely when \(c\in I\), not whenever \(c\in N_K[I]\). The correct exact polynomial is

\[
P_T(z)=\sum_{I\subseteq V(K),\ I\text{ independent}}z^{|I|}\prod_{c\in C\setminus I}(1+z)^{m_c}.
\]

For the in-scope core with one connector adjacent to six centers and multiplicities \((2,3,3,3,3,3)\), the corrected polynomial is \(\prod_{i=1}^6((1+z)^{m_i}+z)+z(1+z)^{17}\); the submitted formula has only \(+z\), omitting \(z((1+z)^{17}-1)\) and 17 rank-two sets (correct coefficient 253 versus 236). The append-only repair independently checks this eligible \(n=24,p=10,a=18,x=8\) witness, all 17 favorable leaves, and \(S=-122805\). This is one finite diagnostic, not a census or a positive full sum. The structural representation and exhaustive *domain* survive with the corrected evaluator; no sign conclusion does.

## C4-U3.LOW-COVER-SIGN — retained_narrowed, proposed_open

No executed census or symbolic inequality establishes the selector-weighted sign for every six-cover tree in the four low-cover third-shell cells \(n=2p+4,p=10,11,12,13\). The structural parameterization above makes a finite check possible but supplies no result from that check. Any future evaluation must use the corrected core polynomial, reconstruct **all** original leaves by full-tree degrees, compute the first negative rank through terminal zero extension, enforce both guards, apply each strict \(\Delta_p(T-v)<0\) test, and sum all selected terms separately. The one corrected 24-vertex example has a negative full sum. High-cover cells and the full lower-region problem remain outside this sign claim. The disposition is narrowed because the original route called its incorrect polynomial an exact evaluation formula.

## C4-U4-COLORED-SHADOW-MIXED-BOUNDARY — retained_narrowed, proposed_open

The matching sector of \(n\) disjoint edges corresponds to degree-\(k\) monomials in \(\mathbb K[x_1,y_1,\ldots,x_n,y_n]/\sum_i(x_i,y_i)^2\): each monomial chooses at most one endpoint per edge. The route cites Chong, *Hilbert functions of colored quotient rings and a generalization of the Clements-Lindström theorem*, arXiv:1403.3158v2, Theorems 1.2(i) and 2.1(iii), for revlex minimization of the **ordinary lower shadow** in this type \((1,\ldots,1)\), composition \((2,\ldots,2)\) quotient. It cites West–Harper–Daykin, *Some Remarks on Normalized Matching* (1983), p. 303, for normalized matching in products of the \((1,2)\)-rank factors. The application bridge is exact for the unweighted matching-sector inclusion poset, conditional on those cited theorem statements; this adjudication did not independently retrieve the papers. Neither statement encodes a fixed selected leaf tag, an external hub-insertion arc, or capacity at a hub-present target.

The direct toy calculation needs no imported theorem. In the three-vertex tree with edges \(ab,ah\), treat \(\{a,b\}\) as the color pair. The singleton family \(\{\{b\}\}\) and its specified compression to \(\{\{a\}\}\) both have lower shadow \(\{\varnothing\}\), but their addable sets are respectively \(\{h\}\) and \(\varnothing\). Thus this auxiliary insertion count is not automatically preserved by the described ordinary compression. This does **not** rule out a more informed compression or prove a CB mixed-boundary failure; no full CB edge/selector encoding or arbitrary-source Hall cut was provided. The CB mixed inequality and primary aggregate remain open.

## C4-U5-SUPPORT-POLYNOMIAL-REDUCTION — retained, proposed_verified for identities

For a support \(u\), let \(L(u)\) be its original leaf neighbors, \(m_u=|L(u)|\). Fix \(v\in L(u)\). For each other neighbor \(w\) of \(u\), let \(C_w\) be the component beyond \(uw\), \(J_w=I(C_w;z)\), and \(A_w=I(C_w-w;z)\). Then

\[
P_{u,v}=\prod_wJ_w+z\prod_wA_w=I(T-v;z),\qquad
Q_{u,v}=\prod_wJ_w-\prod_wA_w=I(T-\{u,v\};z)-I(T-N_T[u];z).
\]

The first identity separates independent sets according to whether they include \(u\); the second compares deletion of \(u,v\) with deletion of its original closed neighborhood. Define \(d_p(P)=[z^{p+1}]P-[z^p]P\), \(c_p(Q)=[z^p]Q-[z^{p-1}]Q\). All leaves sharing \(u\) have the same two polynomials, so the **complete** selected sum is

\[
S(T,p)=\sum_{u:m_u>0}m_u\,\mathbf1\{d_p(P_{u,v})<0\}\,c_p(Q_{u,v}).
\]

This remains valid for the two-vertex tree, where each vertex is separately an original leaf/support; the one-vertex tree contributes no leaf. Rooted messages \(E_r=\prod_c(E_c+O_c)\), \(O_r=z\prod_cE_c\), with directed-edge rerooting, compute the branch polynomials. Truncation through degree \(p+1\) plus an exact \(\alpha(T)\) coordinate suffices at fixed \(p\): \(x(T)+2\le p\) is equivalent to some \(\Delta_j(T)<0\) for \(j\le p-2\), while \(3p<2\alpha(T)+1\) uses \(\alpha\). This is an exact computational reduction, not a fixed-size uniform induction or a sign proof. The unresolved issue is controlling the context-sensitive strict selector after branches are attached.

## C4-U6-first-shell-bridge — retained_narrowed, proposed_open for scale-up

The frozen first-shell `BASE.lean` and theorem contract are in the permitted **common** packet. The F critic's claim that these underlying files were outside the read boundary is inaccurate; its narrower statement describes what that critic actually inspected. The controller's append-only source-access clarification confirms this, and I inspected the pinned definitions and informal report. On an original leaf, `support_spec` gives its unique original neighbor; `H` and `R` are the two original deletion sets; avoided-set counts use the original vertex type; forward differences cast counts to integers; `IsFavorableAt` uses the strict single-vertex deletion difference; and `aggregate` filters the original leaf inventory, retaining same-support tags. `leaf_count_split` gives \(q_j=i_j(H_v)-i_j(R_v)\), hence the summand \(q_p-q_{p-1}\). This is a definition and finite-partition bridge, not a new kernel award.

The admitted informal first-shell audit proves, at informal grade, a pointwise nonpositive term when \(|V(T)|=2p+2\), \(p\ge3\), and \(x(T)+2\le p\). Its cover-three argument forces \(\tau(T)\ge4\) using positivity at **every** earlier rank through \(p-2\); after removing \(v,s_v\), the retained graph has exactly \(2p=2(p-1)+2\) vertices and cover at least three, so its sharp first-wide marked-shadow step applies. The strict alpha guard is retained in the terminal aggregate statement but not needed by this informal pointwise proof. General eligible trees have no such order equation, and the alpha guard does not supply it. The frozen preflight reports a previous successful base compilation with warnings; it is not a kernel/fidelity receipt for the terminal assembly. No live producer or post-freeze award is used. Thus the first-shell interface and informal scope survive, while the arbitrary-order/global compensation bridge remains missing.

## Carried limits for synthesis

U1 and U5 are exact algebraic identities. U2 is a conditional pointwise theorem with an explicit parent-cover hypothesis, residual rank gates, and inherited matching dependencies; its false generic index statement and second-shell boundary are corrected above. U3 gives a complete four-order six-cover representation and a corrected evaluator, not an executed sign census. U4's literature-backed ordinary shadow is source-dependent and cannot presently transport the endpoint-sensitive mixed boundary. U6's first-shell proof remains informal and order-specific, with no terminal formal award in the frozen record. None supplies a universal bound \(E-C\le kQ\), the lower-region selected sum, a positive eligible full sum, or an ordinary/governed bridge. Prior registered verdicts and historical finite horizons are unchanged.
