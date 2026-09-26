# C2-T2 search report — cross-support token transport

## Target and result

I investigated the registered claim `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: for an ordinary finite tree (T), with (a=\alpha(T)), first strict descent (x(T)) computed using zero extension through the terminal difference, and (x(T)+2\le p), (3p<2a+1), the complete sum over the fixed original-leaf selector

\[
F=\{v:\ v\text{ is an original leaf and }\Delta_p(T-v)<0\}
\]

is nonpositive. Supports and closed neighborhoods below are those in the original tree, and leaves sharing a support remain distinct tags. This route did not prove or refute the target.

## Exact weighted-rank reformulation

For each original leaf (v\in F), let (s_v) be its support, (H_v=T-\{v,s_v\}), (R_v=T-N_T[s_v]), and (q_v(j)=i_j(H_v)-i_j(R_v)). Set (k=p-1). By the decomposition of independent sets according to whether they meet (N_T(s_v)\setminus\{v\}),

\[
\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)=q_v(k+1)-q_v(k),
\]

so the target sum is exactly

\[
S(T,p)=\sum_{v\in F}(q_v(k+1)-q_v(k)).
\]

There is a direct common-ground interpretation that keeps the selector fixed. For an independent set (B\subseteq V(T)), define

\[
w_F(B)=\#\{v\in F\cap B: N_T(s_v)\cap(B\setminus\{v\})\ne\varnothing\}.
\]

For every (j\), the map (A\mapsto A\cup\{v\}) bijects independent (j)-sets of (H_v) meeting (N_T(s_v)\setminus\{v\}) with the sets counted by tag (v) in (w_F), of size (j+1). Therefore

\[
\sum_{v\in F}q_v(j)=\sum_{|B|=j+1,\ B\text{ independent in }T}w_F(B),
\qquad
S(T,p)=\sum_{|B|=p+1}w_F(B)-\sum_{|B|=p}w_F(B).
\]

This establishes the coordinate identity, not the sign. It uses the same (F(T,p)) at both ranks.

## Cross-tag transport certificate and missing step

Define unit token sets

\[
U_r=\{(B,v): B\text{ independent in }T,\ |B|=r,\ v\in F\cap B,\ N_T(s_v)\cap(B\setminus\{v\})\ne\varnothing\}.
\]

Thus \(|U_{p+1}|- |U_p|=S(T,p)\), with multiplicity from every selected leaf tag. Form a bipartite graph from (U_{p+1}) to (U_p): connect ((B,v)\) to ((A,u)\) exactly when (A=B\setminus\{z\}) for some (z\in B), and (u\) is a selected tag counted in (w_F(A)). Tags may differ, so this construction permits transfer across original supports. A matching saturating (U_{p+1}) would prove (S\le0). More generally, a fractional flow with unit source and sink capacities and all source tokens routed into lower-token capacity would give the same conclusion. Hall's condition on this explicit graph is the exact capacity obligation for the matching version.

I do not establish this capacity condition for trees with the strict favorable selector. The deletion graph by itself offers no reason a source token has a reachable sink, and a global Hall proof would need to use both tree structure and the inequalities \(\Delta_p(T-v)<0\) for every selected tag. In particular, the supplied (w_F) identity and the pointwise bound on (w_F(B)) do not compare its adjacent rank totals. The standing controls also rule out replacing this open step by a universal within-tag Hall argument. Thus this is a concrete conditional certificate framework, not evidence that its proposed matching always exists.

## Guard and scope audit

The derivation applies at the contract ranks (k=p-1\), (p\), and (p+1\), with (p\ge x(T)+2\), hence (p\ge2\). The selector used throughout is exactly (F(T,p)\), based on strict \(\Delta_p(T-v)<0\); it is not recomputed at another rank. All sets are in the original tree, and every leaf is a distinct token tag, even when support vertices coincide. No residual/no-recovery premise, pointwise summand sign, census inference, or imported theorem is used. No complete selector list or total is supplied for a particular tree, so this report makes no finite-instance or universal sign claim.

## Limitation

The missing result is a tree-specific Hall inequality (or fractional-capacity inequality) for the cross-tag graph above under the fixed-selector hypothesis. Without it, the transport reformulation does not imply (S(T,p)\le0\). No counterexample to the certificate or to the target was constructed, and failure of this particular proposed certificate, if later found, would not itself refute the aggregate.
