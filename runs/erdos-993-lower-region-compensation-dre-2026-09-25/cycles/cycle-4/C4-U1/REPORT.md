# C4-U1 search report: same-tree covariance for CT_x

## Scope and result

This route investigates the early-to-current marked occupancy transfer CT_x in the fixed lower-region scope of the common contract. It establishes an exact covariance decomposition and a vertex-by-vertex neighborhood form for its error term. These are algebraic identities, not a proof of CT_x or of the primary aggregate.

Fix an eligible ordinary tree (T), rank (p), and the original favorable-leaf selector (F=\{v:\Delta_p(T-v)<0\}\). For each independent (p)-set (B\) of (T), define

\[
w(B)=\#\{v\in F:v\in B\text{ and }B\setminus\{v\}\text{ meets }W_v\},
\quad W_v=N_T(s_v)\setminus\{v\},
\]

and let (e(B)) be the number of vertices addable to (B). Put (Q=\sum_Bw(B)), (E=\sum_Bw(B)e(B)), and (N=i_p(T)>0). Count each leaf tag separately. The map ((v,A)\mapsto(v,A\cup\{v\})), for marked independent ((p-1))-sets (A\) of (H_v=T-\{v,s_v\}), is a bijection onto the tagged objects counted by (w). Since a marked set meets (W_v), the support (s_v) is already blocked, so the number of vertices addable in (H_v) to (A) equals (e(B)) in (T). Thus these (Q,E) are exactly the registered marked counts.

Under the uniform distribution on independent (p)-sets, write (μ_j=(j+1)i_{j+1}(T)/i_j(T)). The deletion double count gives \(\mathbb E_p[e]=\mu_p\), and \(\mathbb E_p[w]=Q/N\), \(\mathbb E_p[we]=E/N\). If (Q>0),

\[
\frac EQ=\mu_p+\frac{\operatorname{Cov}_p(w,e)}{\mathbb E_p[w]}.
\]

Consequently CT_x is equivalent (when (Q>0)) to the quantitative budget

\[
\frac{\operatorname{Cov}_p(w,e)}{\mathbb E_p[w]}\le\mu_x-\mu_p.
\]

Equivalently, without division, (i_x E\le(x+1)i_{x+1}Q\). For (Q=0), CT_x is the trivial (0\le0).

There is a more local exact expression. For each vertex (u\), let (I_u(B)=1) when (u) is addable to (B), equivalently (B\cap N_T[u]=\varnothing). Then (e(B)=\sum_u I_u(B)), and

\[
\operatorname{Cov}_p(w,e)=\sum_{u\in V(T)}\left(
\frac{\sum_{B\in\mathcal I_p(T)}w(B)I_u(B)}{i_p(T)}
-\frac{Q}{i_p(T)}\frac{i_p(T-N_T[u])}{i_p(T)}\right).
\]

Here (i_p(T-N_T[u])) counts exactly the independent (p)-sets avoiding the closed neighborhood of (u). For a tag (v), its contribution to (w(B)) requires (v\in B); hence at (u=s_v) that tag is always zero in (w(B)I_u(B)), while its covariance with (I_{s_v}) contributes a nonpositive term. Other vertices can contribute with either sign, and shared supports retain all separate tags. This identifies a concrete possible source of compensation without asserting that it dominates the remaining terms.

The first strict descent gives (i_{x+1}<i_x), hence \(\mu_x<x+1\). Eligibility also gives (p\ge x+2\), so the comparison asks for control across at least one intervening rank. Neither fact proves \(\mu_p\le\mu_x\), nor bounds the covariance tilt. In particular, a proof cannot silently assume ratio monotonicity or nonpositive same-rank covariance. The common covariance reformulation records an eligible order-14 example with positive weighted same-rank bias while CT_x itself holds; that example is only a bounded diagnostic, not a universal theorem.

## Disposition

The covariance decomposition and its neighborhood expansion are proved identities in the stated finite scope. The needed universal covariance budget is unproved. No counterexample to CT_x or the primary aggregate is supplied, and no universal status is proposed for either. This route therefore leaves both registered targets open.

## Limitations

- The identities reduce CT_x to a covariance budget but do not establish that budget for all eligible trees.
- The sign of each neighborhood covariance is not controlled globally; support-neighborhood terms alone do not settle the sum.
- No new finite census or universal coefficient-ratio result is claimed.
- The common source example is cited only at its bounded scope; no graph-specific replay was part of this route.
