# C2-T3 evidence

The complete report is [REPORT.md](REPORT.md). The checkable core is:

For $n=2p+2$ and $k=p-1$, each leaf forest $H_v$ has $2k+2$ vertices and
$$q_v(j)=i_j(H_v)-i_j(R_v),\qquad q_v(k+1)-q_v(k)=\Delta_k(H_v)-\Delta_k(R_v).$$
Every component of $H_v$ contains exactly one mark in $W_v$. Ordering these marks and assigning each independent set to its first mark gives
$$q_v(j)=\sum_i i_{j-1}\!\left(H_v-(N[w_i]\cup\{w_1,\ldots,w_{i-1}\})\right).$$
The finite-graph deletion shadow bound is $k i_k(J)\le(|V(J)|-k+1)i_{k-1}(J)$. Thus every ordered part with at least three deleted vertices contributes a nonpositive difference $i_k(J)-i_{k-1}(J)$ because its remaining order is at most $2k-1$.

An eligible tree cannot have a selected tag with edgeless $H_v$: then $T$ is the star with independence polynomial $(1+z)^{2p+1}+z$ and $x(T)=p+1$, contradicting $x(T)+2\le p$. If $H_v$ has no isolates and some marked root has degree at least two, place that root first; it and every later distinct-component nonisolated root delete at least three vertices. Hence $q_v(k+1)-q_v(k)\le0$. Summing retains every leaf tag in the fixed selector.

Eligibility on the shell yields
$$\tau(H_v)=\tau(T)-1=p+1-(\alpha(T)-p),\qquad
\alpha(T)-p\ge\lceil p/2\rceil,$$
so $\tau(H_v)\le\lfloor p/2\rfloor+1$. This count alone does not bound the order-$2k$ excess.

Residual parts with exactly two deletions may have order $2k$. Their general shadow estimate is $i_k(J)\le(1+1/k)i_{k-1}(J)$; uncompensated excess is at most $i_{k-1}(J)/k$. The report identifies when these parts arise and leaves a global selector-conditioned compensation inequality open. No finite census, claim award, or full target resolution is asserted.
