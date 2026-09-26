# C2-CU-T6 review evidence — rank identity

For each tag `v`, relative degree `j-1` has dimension `q_v(j)`: its basis faces are independent `j`-sets of `H_v` that are not faces of `Ind(R_v)`, equivalently those meeting `W_v`. The direct sum over the fixed `F(T,p)` therefore has degree `j-1` dimension `Q_j=sum_F q_v(j)`, preserving repeated leaf tags.

For `k=p-1`,

`Delta_k(H_v)-Delta_k(R_v) = [i_(k+1)(H_v)-i_k(H_v)]-[i_(k+1)(R_v)-i_k(R_v)] = q_v(k+1)-q_v(k)`.

Summing gives `S=dim C_k-dim C_(k-1)`. For `b_r=rank d_r` and `beta_r=dim H_r`, rank-nullity gives `dim C_r=b_r+b_(r+1)+beta_r`; subtraction gives `S=b_(k+1)-b_(k-1)+beta_k-beta_(k-1)`.

The conclusion is exact accounting only. The route supplies no proof that `b_(k+1)+beta_k <= b_(k-1)+beta_(k-1)` under the favorable selector, and no eligible full-sum witness of positive sign.
