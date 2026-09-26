# Critique of C4-U1: covariance decomposition

## Scope and disposition

**Disposition: retained.** The sole case-listed claim, `C4-U1-COVARIANCE-DECOMPOSITION`, correctly states exact identities for the fixed original favorable-leaf selector in the eligible ordinary-tree scope. No inequality or resolution of the primary aggregate follows from these identities.

## Independent check

Fix an eligible ordinary tree (T), rank (p), and a tag (v\in F(T,p)), with support (s_v). Write (H_v=T-\{v,s_v\}), (W_v=N_T(s_v)\setminus\{v\}). Every independent ((p-1))-set (A\subseteq H_v) meeting (W_v) maps to (B=A\cup\{v\}), an independent (p)-set. This is a bijection tag by tag: its inverse is (A=B\setminus\{v\}), and the condition that (B\setminus\{v\}) meets (W_v) is exactly the condition on (A). Distinct leaves sharing (s_v) remain distinct because the map retains (v) as a tag.

The addability comparison is exact. In (T), (v\in B), so (v) cannot be added; and because (A) meets (W_v), some member of (B) is adjacent to (s_v), so (s_v) cannot be added. All remaining vertices are in (H_v) and have the same conflicts with (A) in both graphs. Hence (e_{H_v}(A)=e_T(B)). Summing over tags gives (Q=\sum_B w(B)) and (E=\sum_B w(B)e(B)), with multiplicity exactly once for each leaf tag.

For the uniform distribution on the (N=i_p(T)) independent (p)-sets, double count extension pairs ((B,u)) where (u) is addable to (B). Each independent ((p+1))-set contributes exactly (p+1) such pairs, so
\[
\mathbb E_p[e]=(p+1)i_{p+1}(T)/i_p(T)=\mu_p.
\]
Also ​\(\mathbb E_p[w]=Q/N\) and \(\mathbb E_p[we]=E/N\). Thus, for (Q>0),
\[
E/Q=\mathbb E_p[we]/\mathbb E_p[w]
=\mu_p+\operatorname{Cov}_p(w,e)/\mathbb E_p[w].
\]

For each vertex (u), (I_u(B)=1) precisely when (B\cap N_T[u]=\varnothing). Therefore (e=\sum_u I_u), and the independent (p)-sets with (I_u=1) are exactly those counted by (i_p(T-N_T[u])). Expanding covariance by linearity yields exactly the report's neighborhood expression. At (u=s_v), the (v)-tag gives no contribution to (wI_u), since its sets contain (v\in N_T[s_v]); its covariance term is nonpositive. This fact does not sign the other terms or their total.

The divisions are legitimate under the guards: (p\ge x+2\ge2), and (3p<2a+1) forces (a\ge3) and (p<a), hence (i_p(T)>0). If (Q=0), then (E=0), so the undivided CT_x inequality is (0\le0). Also ​\(\Delta_x<0\) implies ​\(\mu_x<x+1\) when (i_x>0), but this does not compare ​\(\mu_p\) with ​\(\mu_x\) or bound the selector-addability covariance.

## Usefulness and limits

The identities give an exact reformulation of the CT_x transfer as a covariance budget, with a vertex-neighborhood expansion that may help isolate terms. The route does not establish that budget, a global compensation inequality, or a counterexample. A local nonpositive support term cannot control the remaining neighborhood terms. No imported theorem or computational result is needed for this algebraic check.

## Source integrity

The case packet's three listed source hashes and all 179 common packet source hashes were checked against their packet digests before review; all 182 matched. The review used the assigned route files, common read-first files, and the specifically authorized C4 critic brief.
