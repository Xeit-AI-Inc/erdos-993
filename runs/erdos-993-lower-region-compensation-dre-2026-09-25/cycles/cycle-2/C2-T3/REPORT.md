# C2-T3 report — first-order shell, vertex-cover slack and selector

## Claim and scope

This is a proposed partial result for the registered key `E993-LOWER-REGION-FIRST-ORDER-SHELL`. The complete primary assertion remains open. Fix an eligible ordinary tree $T$ at the first shell $n=2p+2$, and keep the strict selector
$$F=\{v\text{ original leaf of }T:\Delta_p(T-v)<0\}$$
fixed throughout. Put $a=\alpha(T)$ and $k=p-1$. For each original leaf $v$, let $s_v$ be its original support, $H_v=T-\{v,s_v\}$, $W_v=N_T(s_v)\setminus\{v\}$, and $R_v=T-N_T[s_v]$. Then $H_v$ is a forest on $2p=2k+2$ vertices, and every component of $H_v$ contains exactly one vertex of $W_v$. For $j\ge1$, let $q_v(j)=i_j(H_v)-i_j(R_v)$, the number of independent $j$-sets of $H_v$ meeting $W_v$. The selected summand is $q_v(p)-q_v(p-1)$, so
$$S(T,p)=\sum_{v\in F}\bigl(q_v(k+1)-q_v(k)\bigr),$$
with repeated leaves at one support retained as separate summands.

## Vertex-cover slack on this shell

Write $\tau(G)$ for minimum vertex-cover size. For each leaf deletion, $\alpha(H_v)=a-1$ and
$$\tau(H_v)=2p-(a-1)=\tau(T)-1.$$
Define the independence slack $\delta=a-p$, equivalently $\tau(H_v)=p+1-\delta$. The strict eligibility inequality $3p<2a+1$, with integer $a$, implies
$$\delta\ge\lceil p/2\rceil,\qquad \tau(H_v)\le\lfloor p/2\rfloor+1.$$
Thus shell deletion forests have small vertex-cover number relative to their $2p$ vertices. This is a classification coordinate, not by itself a layer comparison: it gives no inequality between $q_v(k+1)$ and $q_v(k)$. Since $T$ and $H_v$ are bipartite, König's theorem also identifies these cover numbers with matching numbers, but that equality alone supplies no rank-layer capacity.

## Proved shell subclass

For every selected leaf $v\in F$, suppose $H_v$ has no isolated vertices and at least one marked root in $W_v$ has degree at least two in $H_v$. Then $S(T,p)\le0$ (also trivially if $F$ is empty). Under eligibility, a selected tag cannot have edgeless $H_v$: that would make $T$ a star on $2p+2$ vertices, whose independence polynomial is $(1+z)^{2p+1}+z$, so $x(T)=p+1$, contrary to $x(T)+2\le p$.

For any finite graph $J$ of order $N$, count pairs consisting of an independent $k$-set and one of its deletions. Each independent $k$-set has $k$ deletions; each independent $(k-1)$-set has at most $N-k+1$ extensions. Hence
$$k i_k(J)\le (N-k+1)i_{k-1}(J).$$
In particular $i_k(J)\le i_{k-1}(J)$ when $N\le2k-1$; if $k-1>N$, both layers are zero.

Order the marks $W_v=\{w_1,\ldots,w_t\}$, and define
$$J_i=H_v-\bigl(N_{H_v}[w_i]\cup\{w_1,\ldots,w_{i-1}\}\bigr).$$
Partitioning an independent set by its first mark gives the exact identities $q_v(j)=\sum_i i_{j-1}(J_i)$ for $j\ge1$. In the non-edgeless subclass choose first a marked root of degree at least two. It removes at least three vertices, so $|J_1|\le2k-1$. Each later mark is in a different component, is non-isolated, and its closed neighborhood (at least two vertices) is disjoint from $w_1$; removing that neighborhood and $w_1$ removes at least three vertices. Thus every $|J_i|\le2k-1$, and the shadow inequality term by term yields $q_v(k+1)\le q_v(k)$. Summing the non-edgeless inequalities over exactly the original fixed $F$ proves the subclass claim. No selector is recomputed at another rank. Each leaf in F is counted once, including repeated support tags; such repeats create an isolate and lie in the residual case outside this subclass.

In tree language, $H_v$ has an isolate precisely when another original leaf shares $s_v$. Its marked roots are the neighbors of $s_v$, one per component. The non-edgeless sufficient condition therefore requires that the selected support have no other leaf neighbor and that at least one branch-neighbor have degree at least three in $T$. This is restrictive but directly checkable against the selector.

## Residual structural case

For a selected $v$, eligibility excludes edgeless $H_v$. The forests not covered by the proof therefore are: (i) $H_v$ has an isolate and at least one edge component; or (ii) $H_v$ has no isolates but every marked root has degree one. In (i), order a non-isolated root first and order a second nontrivial-component root before isolated roots when one is available. In (ii), every possible first marked root has degree one. These choices localize the boundary terms. In the ordered decomposition above, any $J_i$ with at least three deleted vertices has order at most $2k-1$ and satisfies the proved shadow bound. A boundary term can occur only when exactly two vertices are deleted: at the first root when it has degree one, or at the first isolated root placed second after the sole earlier mark. For such a $J_i$, order $2k$ can occur, and the elementary shadow bound gives only
$$i_k(J_i)\le\frac{k+1}{k}i_{k-1}(J_i).$$
The excess is at most $i_{k-1}(J_i)/k$. The proof above has no charge for this excess. This is the residual selector-conditioned compensation obligation across all selected supports; it cannot be discarded termwise.

## What the matching/cover coordinate does and does not establish

The exact relation $\tau(H_v)=\tau(T)-1\le\lfloor p/2\rfloor+1$ places every shell forest in a low-cover regime. A minimum matching certifies $\tau(H_v)$ disjoint edges, but no inequality has been established that converts these matching resources into capacity for the boundary excesses above. The shell subclass proof uses component roots and a rank shadow count, not a matching budget. In particular it does not claim the refuted universal within-tag Hall statement, nor does it infer a full-sum sign from $\tau$ alone. The exact remaining theorem needed would bound the sum of the order-$2k$ excesses, over every fixed selected leaf tag, by the available negative shadow differences from the other $J_i$'s and/or other original supports.

## Hypothesis checks and limitations

The result is limited to shell order $n=2p+2$ and the stated per-selected-tag forest structure, under the original eligibility guards $x(T)+2\le p$ and $3p<2a+1$. It preserves the original support, closed neighborhood, fixed strict favorable selector, and same-support multiplicities. The proof does not use the $x$-guard or selector to bound the residual excess; they remain necessary hypotheses for the target and potential compensation theorem. It supplies no complete proof or counterexample for the shell, much less the unrestricted lower-region aggregate.

The common-source proof candidate `control/C2-ROOTED-MARK-ALTERNATIVE.md` provides the ordered-root identity and ordinary shadow count in the order band. The derivation above is the direct extension needed at shell order $2k+2$, with the boundary terms left explicit. No external theorem or computation is used.
