# C1-T6 evidence: homotopy type does not encode the required rank count

## Primary source and pinpoint

Richard Ehrenborg and Gábor Hetyei, “The topology of the independence complex,” European Journal of Combinatorics 27 (2006), 906–923, DOI https://doi.org/10.1016/j.ejc.2005.04.010. In the primary paper, Corollary 6.1 (p. 916) states: if F is a forest, its independence complex is constrictive and thus simple-homotopy equivalent to a single vertex or a sphere. Immediately before the corollary the authors identify graph edges as size-two blocks and observe that forests induce branching block systems, which supplies the corollary's route hypothesis. In this task both T and its induced subgraphs H_v,R_v are forests, so the scope applies. It does not state a face-number inequality.

## Chain groups retain the grading, ordinary homotopy type does not

For induced R_v=H_v-W_v, the relative simplicial chains C_(j-1)(Ind(H_v),Ind(R_v)) have as basis the independent j-sets not contained in R_v, equivalently those meeting W_v. Their dimension is therefore q_v(j)=i_j(H_v)-i_j(R_v). Homology is computed as ker(boundary)/im(boundary) and does not retain each chain-group dimension; Euler characteristic retains only the alternating sum. This gives an exact rank-graded representation, but not a map with the sign/budget required by the aggregate.

## Hand-checkable counterexample to homotopy-type sufficiency

For the edgeless forest H_m, Ind(H_m) is the full simplex and is contractible for every m. Yet i_j(H_m)=binom(m,j). In particular:

- H_10: i_7=120, i_8=45, so Delta_7=-75.
- H_11: i_7=330, i_8=165, so Delta_7=-165.

The homotopy type is the same and the rank-seven difference changes. This proves only that the homotopy type does not determine this local coefficient statistic. It does not address whether another topological construction with extra grading or selector data yields the target inequality.
