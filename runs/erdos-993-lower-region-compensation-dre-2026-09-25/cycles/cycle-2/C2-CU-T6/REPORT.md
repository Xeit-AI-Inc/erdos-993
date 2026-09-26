# C2-CU-T6 critique — relative chain rank reduction

## Review scope and disposition

The case contains one route claim: `C2-T6.relative-chain-rank-reduction`. I retain its exact algebraic identity for the fixed favorable set and original leaf tags. This does not prove the primary aggregate's sign, and it does not refute it.

## Independent derivation

Fix an eligible ordinary tree `T`, a natural `p`, and `k=p-1`. The contract's guards give `p>=x(T)+2>=2`, hence `k>=1`; the strict lower-region guard remains part of the application scope. For each original selected leaf `v`, use the case's `H_v`, `W_v`, and `R_v=H_v-W_v`. In the relative simplicial chain complex of `(Ind(H_v),Ind(R_v))`, a basis in degree `j-1` consists of faces of `Ind(H_v)` not in `Ind(R_v)`. These are exactly the independent `j`-sets meeting `W_v`, so the degree dimension is `q_v(j)=i_j(H_v)-i_j(R_v)`. The relative boundary is well-defined because `Ind(R_v)` is a subcomplex.

Take the direct sum over the single fixed set `F(T,p)`, retaining one summand per original leaf. Thus its degree-`j-1` dimension is `Q_j=sum_{v in F}q_v(j)`, including multiplicity when leaves share a support. Since `Delta_k(G)=i_{k+1}(G)-i_k(G)`, each contract summand is

`Delta_k(H_v)-Delta_k(R_v)=q_v(k+1)-q_v(k)`.

Therefore `S(T,p)=Q_{k+1}-Q_k`. For `b_r=rank(d_r:C_r->C_{r-1})` and `beta_r=dim H_r`, rank-nullity gives `dim C_r=b_r+b_{r+1}+beta_r`. Applying this at degrees `k` and `k-1` yields

`S(T,p)=b_(k+1)-b_(k-1)+beta_k-beta_(k-1)`.

This holds also for an empty favorable set, when all direct-sum groups and terms vanish. With `k>=1`, the displayed degree indices do not require an augmented degree `-1` convention. Zero extension of the independence counts is compatible with the dimension difference; outside the primary application the same algebraic identity remains valid wherever the relative groups are defined.

## Scope checks and missing bridge

The construction uses the original `F(T,p)` once; it does not recompute eligibility or select a different set at rank `k`. It retains each original leaf as a separate tag, including shared-support leaves. The formula is an algebraic identity for the tree instances in the contract (in fact, the dimension argument itself does not require the tree property).

The favorable condition `Delta_p(T-v)<0` does not by itself imply the needed rank/homology inequality. In particular, a count inequality at the selector rank is not a demonstrated bound on the boundary ranks or Betti numbers at degrees `k-1,k,k+1`. The route explicitly leaves that bridge unproved. No local sign, rank inequality, global sign, or full-sum counterexample follows from the identity. No tree-specific premise beyond those defining the tagged pairs has been smuggled into the derivation.

## Conclusion and limitations

Disposition: `retained`. Retain only the stated rank/homology reduction with the fixed selected tags and multiplicities. The primary claim remains unresolved on this evidence. No computation, external theorem, or source replay was needed; there is no generation boundary or computational conclusion to assess. The assigned route has one claim and it is covered in full.
