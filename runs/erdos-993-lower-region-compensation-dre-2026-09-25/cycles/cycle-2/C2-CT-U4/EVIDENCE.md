# C2-CT-U4 evidence: independent derivation of retained reduction

Fix an ordinary tree `T` and its original selected leaf set `F=F(T,p)`. For each `v in F`, let `s=s_v`, `H=T-{v,s}`, `W=N_T(s)\{v}`, and `R=T-N_T[s]=H-W`. For all integer `j`, zero-extended counts satisfy

`q_v(j)=i_j(H)-i_j(R)=|{A in I_j(H): A intersect W != empty}|`.

Since `s` is not a vertex of `H`, every such `A` can be enlarged by the original leaf `v`. The inverse on its image deletes `v`. Thus, for the fixed weight

`w_F(B)=|{v in F: v in B and (B\{v}) intersect W_v != empty}|`,

counting tagged pairs gives `sum_(v in F)q_v(j)=sum_(B in I_(j+1)(T))w_F(B)`. In particular,

`S=sum_F(q_v(p)-q_v(p-1))=sum_(I_(p+1))w_F-sum_(I_p)w_F`.

For the finite deletion graph between these two layers, set upper supply `u(B)=w_F(B)` and lower capacity `c(A)=w_F(A)`. Let `M=sum_B u(B)+sum_A c(A)+1`. In the source/upper/lower/sink network, use capacities `u`, `M` on each inclusion-deletion arc, and `c`. Any cut crossing an inclusion-deletion arc costs at least `M`, which exceeds the total source supply. For any other cut, if its source-side upper set is `X`, its source-side lower vertices must include `N_-(X)`; the least cut capacity with that `X` is

`sum_(B notin X)u(B)+sum_(A in N_-(X))c(A)`.

It is at least total supply exactly when `u(X)<=c(N_-(X))`. Max-flow/min-cut therefore proves that all these weighted Hall inequalities are equivalent to a saturating flow. Integrality follows from integer capacities; zero total supply is covered by the zero flow. The choice `X=I_(p+1)(T)` is the scalar inequality `S<=0` itself. Hence the characterization is correct, but the route proves no cut and does not prove the primary universally.
