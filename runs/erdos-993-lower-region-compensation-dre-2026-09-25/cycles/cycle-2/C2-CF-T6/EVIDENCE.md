# Evidence: independent derivation of the relative-chain identity

Let `F=F(T,p)` be the original fixed selector. For each `v in F`, `R_v` is induced in `H_v`, so the simplicial relative chain complex of `(Ind(H_v),Ind(R_v))` is defined. Its basis in degree `j-1` is the set of independent `j`-sets of `H_v` that meet `W_v`; hence that degree has dimension `q_v(j)`.

For the direct sum over all selected leaf tags, write `Q_j=sum_F q_v(j)`, `C_r` for degree `r`, `b_r=rank(d_r)`, and `beta_r=dim H_r`. Then `dim C_r=Q_(r+1)=b_r+b_(r+1)+beta_r`. Subtracting the equations for `r=k` and `r=k-1` gives

`Q_(k+1)-Q_k=b_(k+1)-b_(k-1)+beta_k-beta_(k-1)`.

Also, for each tag, `Delta_k(H_v)-Delta_k(R_v)=q_v(k+1)-q_v(k)`. Summing over the unchanged `F` proves the worker's exact expression for `S` and shows that `S<=0` is equivalent to `b_(k+1)+beta_k<=b_(k-1)+beta_(k-1)`. The latter inequality is not established.

The selector expands independently from `I(T-v)=I(H_v)+zI(R_v)` as

`Delta_p(T-v)=q_v(p+1)-q_v(p)+i_(p+1)(R_v)-i_(p-1)(R_v)`.

This count condition supplies no rank or homology estimate in the submitted argument. Thus the formula is retained as an exact reduction only.
