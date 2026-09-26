# C1-CF-T6 critique report

## Reviewed claim

`C1-T6-1` is retained as a narrow information-loss diagnosis. Its concrete arithmetic is correct: for edgeless `H_m`, `i_j(H_m)=binom(m,j)`, giving `Delta_7(H_10)=45-120=-75` and `Delta_7(H_11)=165-330=-165`; both independence complexes are full simplices and contractible. The source's statement of forest homotopy type is consistent with Ehrenborg–Hetyei, Corollary 6.1. The relative chain-group description also checks: degree `j-1` has basis independent `j`-sets meeting `W_v`, so its dimension is `q_v(j)`.

The graphs are locally realizable as `H_v` from stars, but this does not supply a target instance satisfying the selector and lower-region guards at `p=8`. C1-T6-1 does not claim otherwise. The claim establishes only that forgetting graded face data loses this statistic; it does not prove that homotopy type is the only potentially useful topological information, nor establish any sign bound for `S(T,p)`.

The route does not analyze `x`, selector values, or the full selected sum and gives no inequality controlling `sum_F(D_v+C_v)`. The handoff controls are consistent: `K_(1,12)` has all 12 leaves selected and `S=-1980`; the pinned `T_22` and `T_60` rows each pair a positive marked term with a negative full sum. As the route proposes no transport mechanism, those controls do not refute its narrow diagnosis and cannot extend it to the target. I inspected the pinned control rows but did not replay their graph computations.

The full independent audit, including exact scope, local realizability caveat, source check, and limitations, is in `AUDIT.md`.
