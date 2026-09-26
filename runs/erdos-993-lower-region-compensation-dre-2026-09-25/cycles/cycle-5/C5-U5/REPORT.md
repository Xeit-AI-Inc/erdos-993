# C5-U5 search report

## Result: support-star sector

Let $T=K_{1,d}$ be an ordinary star with $d\ge 12$ leaves, and suppose $p$ satisfies the primary contract's eligibility conditions. For every original leaf $v$, its support is the center $s$. The graph $H_v=T-\{v,s\}$ is edgeless on $h=d-1$ vertices, and the marked set $W_v=N_T(s)\setminus\{v\}$ is all of $V(H_v)$. Thus $R_v=\varnothing$, and at every relevant positive rank $j\ge1$,

$$
q_v(j)=i_j(H_v)-i_j(R_v)=\binom{d-1}{j}.
$$

All leaf-deleted trees $T-v$ are isomorphic, so the strict selector chooses either every original leaf or none. If it chooses none, $S(T,p)=0$. If it chooses every leaf, the exact handoff identity

$$
kS(T,p)=\sum_{v\in F(T,p)}(q_v(k+1)-q_v(k)),\qquad k=p-1,
$$

applies with an identical summand for each leaf.

For $d\ge4$, the independence counts of $K_{1,d}$ are $i_0=1$, $i_1=d+1$, and $i_j=\binom d j$ for $2\le j\le d$, with zero extension thereafter. The first negative difference is

$$
x(T)=\left\lfloor\frac{d+1}{2}\right\rfloor.
$$

Indeed $\Delta_1=\binom d2-(d+1)>0$ for $d\ge4$; for $j\ge2$, the binomial ratio gives $\Delta_j<0$ first at $j=\lfloor(d+1)/2\rfloor$. Eligibility therefore implies

$$
k=p-1\ge x(T)+1=\left\lfloor\frac{d+1}{2}\right\rfloor+1.
$$

In particular $2k+2\ge d-1$, so

$$
\frac{q_v(k+1)}{q_v(k)}=\frac{d-1-k}{k+1}\le1
$$

when both binomial coefficients are nonzero; the conclusion is also immediate at the zero-extended ranks. Each selected leaf contributes a nonpositive amount. Hence $S(T,p)\le0$ throughout the eligible lower-region ranks for this star sector.

## Boundary-count interpretation

For a marked independent $k$-set $A\subseteq H_v$, the actual addable vertices are exactly the $h-k$ vertices outside $A$. Therefore $Q=\binom hk$, $E=(h-k)Q$, and every $(k+1)$-set meets $W_v=V(H_v)$ at least twice (since $k\ge1$), so $C=U=\binom h{k+1}$. The identity $E=kU+C$ is exact: its two sides both equal $(k+1)\binom h{k+1}$. This verifies the competing insertion/deletion exit counts in this sector using actual addability.

The proof is a restricted sector result only. It does not provide a compression or cut inequality for $H_v$ with edges, does not handle mixed marked/unmarked vertices in $H_v$, and does not settle the primary aggregate for general ordinary trees.

## Source and computation record

The definitions, eligibility conditions, and the identities $kS=E-C-kQ$ and $E=kU+C$ are taken from the pinned common solution contract and C5 neutral handoff. The binomial calculations above are derived explicitly. No external theorem, software computation, or census was used.
