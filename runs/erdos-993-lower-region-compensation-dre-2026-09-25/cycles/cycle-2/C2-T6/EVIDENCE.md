# C2-T6 evidence — relative chain rank identity

For each `v` in the fixed favorable set `F(T,p)`, the relative simplicial chain group `C_{j-1}(Ind(H_v), Ind(R_v); Q)` has a basis indexed by independent `j`-sets meeting `W_v`; therefore its dimension is `q_v(j)`. Direct sum over `v in F` preserves the leaf tags and gives `dim C_{j-1}(F)=Q_j=sum_F q_v(j)`.

For any finite chain complex, if `b_r=rank(d_r)` and `beta_r=dim H_r`, then `dim C_r=b_r+b_(r+1)+beta_r`. Subtracting the equations at degrees `k` and `k-1` gives

`Q_(k+1)-Q_k=b_(k+1)-b_(k-1)+beta_k-beta_(k-1)`.

Independently, with `k=p-1`, subtracting `Delta_k(R_v)` from `Delta_k(H_v)` gives `q_v(k+1)-q_v(k)`, so summing over the original fixed `F` identifies the left side with the contract's `S(T,p)`. Hence `S<=0` is equivalent to `b_(k+1)+beta_k<=b_(k-1)+beta_(k-1)` for this tagged relative complex. No proof of that last inequality follows from the construction or from favorable selection in this work.
