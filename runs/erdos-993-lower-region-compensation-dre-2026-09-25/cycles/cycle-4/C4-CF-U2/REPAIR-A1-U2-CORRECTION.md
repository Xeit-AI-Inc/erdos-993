# C4-U2 correction proposal: marked index and the second-shell boundary

The exact first-mark partition is `q_j=sum_i i_(j-1)(J_i)`. Consequently

`q_j-q_(j-1)=sum_i [i_(j-1)(J_i)-i_(j-2)(J_i)]=sum_i Delta_(j-2)(J_i)`.

The C4-U2 sentence asserting that `Delta_(j-1)(J_i)<=0` for all blocks implies `q_j<=q_(j-1)` is false. The right residual index is `j-2`. The report's later specialization sets `j=k+1=p` and uses `r=k-1=p-2`, which **is** the right index for `Delta_k(H)-Delta_k(R)=q_(k+1)-q_k`. The main conditional theorem's proof therefore survives this prose error with that correction.

The false generic sentence has a small exact counterexample. Take `H` with edge `0-1` and isolated vertices `2,3`; mark `W={0,2,3}` in that order. The first mark is nonisolated and `W` meets every component. The three residual graphs are two isolated vertices, two isolated vertices, and one isolated vertex, so their `Delta_1` values are `-1,-1,-1`. Yet `q_1=3` and `q_2=5`. Their `Delta_0` values are `1,1,0`, summing to the true increase `q_2-q_1=2`. This is a counterexample to the stated intermediary implication, not to the leaf theorem.

There is a distinct rank-boundary issue in the surrounding application prose. For second shell `s=3`, `p=6`, an `ell=2` first-mark block has `d=3`, `r=p-2=4`, `m(3)=4`, and generic `K(3)=5`. Thus the r25 matching-large-rank theorem **does not apply** merely from a four-edge matching there. The C4-U2 conditional statement explicitly requires `r>=K(d)` for every `d>=3` block; it excludes this configuration and remains valid as a conditional theorem. A statement that the generic hypotheses alone cover all prepared `s=3,p=6` applications is too broad.

The pinned second-shell all-ranks audit supplies a separate stronger odd-order forest injection: on `2k+1` vertices with four disjoint edges, `i_k<=i_(k-1)` for `k>=4`. Here the residual has `2r+3=11=2(5)+1` vertices and the desired sign is `i_5<=i_4`, so that result fills this particular boundary. Under the parent cover threshold `tau(T)>=6`, the deletion estimate gives `tau(J)>=4` for `ell=2`; forest matching-cover equality gives the four edges. This special application depends on that separately audited result, not on the generic r25 rank gate. No independent rebuild of its full injection or Lean artifact was performed in this correction audit.

The cover-loss argument, `d<=1` shadow case, `d=2` first-wide dependency, conditional parent-cover hypothesis, and `s=5` Catalan-method cutoff survive at their stated scopes. They do not establish the parent cover condition for every eligible tree or settle the selected aggregate.
