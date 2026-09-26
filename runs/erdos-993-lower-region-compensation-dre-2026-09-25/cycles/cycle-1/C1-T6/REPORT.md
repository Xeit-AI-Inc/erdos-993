# C1-T6 search report: graded topology versus the selected coefficient

## Exact scope

The target remains the complete lower-region aggregate from the common handoff: for an ordinary tree T, a=alpha(T), x computed through the terminal zero-extension rank, and a natural p with x+2<=p and 3p<2a+1, the fixed selector is F(T,p)={v original leaf: Delta_p(T-v)<0}. The required conclusion is S(T,p)<=0, where each selected original leaf contributes

    Delta_(p-1)(T-{v,s_v}) - Delta_(p-1)(T-N_T[s_v]).

No proof or eligible counterexample was obtained in this route.

## Literature result and checked scope

Ehrenborg and Hetyei, “The topology of the independence complex,” European Journal of Combinatorics 27 (2006), 906–923, DOI: https://doi.org/10.1016/j.ejc.2005.04.010, Corollary 6.1, state that for a forest F, its independence complex is constrictive and hence simple-homotopy equivalent to a point or a sphere. The paper identifies an ordinary graph as a block system with edge blocks and notes that a forest gives a branching block system immediately before the corollary. Thus this theorem applies to the tree T and to each induced forest H_v=T-{v,s_v}, R_v=T-N_T[s_v]. It gives a topological type, but no inequality between their individual face numbers at a specified rank and no information about the selector Delta_p(T-v)<0. The hypotheses therefore do not bridge to the target aggregate.

## Exact rank data as relative chain-group dimensions

For each selected leaf define H_v=T-{v,s_v}, R_v=T-N_T[s_v] subseteq H_v, and W_v=V(H_v)\\V(R_v)=N_T(s_v)\\{v}, as in the handoff. The simplicial pair (Ind(H_v),Ind(R_v)) has relative simplicial chain group in degree j-1 with a basis precisely the independent j-sets of H_v that meet W_v. Consequently

    q_v(j)=i_j(H_v)-i_j(R_v)=dim C_(j-1)(Ind(H_v),Ind(R_v)).

This is an exact graded linear-algebra interpretation of the rank-specific quantity. However, homology records kernels modulo images of boundary maps, not these chain-group dimensions. Euler characteristic retains only the alternating sum over all degrees. The relative chain-group identity supplies no sign comparison between the prescribed j=p-1 dimensions, and the selector is still an additional condition on another graph T-v. No injective/surjective map or chain-map inequality giving the needed sum of D_v+C_v was found.

## Concrete loss of rank information under homotopy type

Let H_m be the edgeless graph on m>=1 vertices. It is a forest, and Ind(H_m) is the full simplex on those vertices, hence contractible for every m. Its exact independent-set counts are i_j(H_m)=binom(m,j) for 0<=j<=m. At rank k=7, compare H_10 and H_11:

    Delta_7(H_10)=binom(10,8)-binom(10,7)=45-120=-75,
    Delta_7(H_11)=binom(11,8)-binom(11,7)=165-330=-165.

Thus identical (indeed contractible) homotopy types do not determine the rank-seven coefficient difference used in a summand. Both graphs are permissible induced forests in the local algebraic setting, but this comparison is only a diagnostic of information loss; it is not an eligible pair of complete primary-target instances or a counterexample to S<=0.

For orientation, in the handoff's eligible example T=K_(1,12), p=8, each selected leaf has H_v=H_11 and R_v empty, so its local summand is exactly Delta_7(H_11)=-165; the complete aggregate is -1980. This is a direct face-count computation, not a consequence of contractibility. It merely illustrates that recovering the needed local integer requires graded face data beyond homotopy type.

## Conclusion and gap

The forest independence-complex theorem cannot by itself prove the lower-region aggregate, because its invariant identifies spaces with different required rank counts. A graded chain-level model preserves those counts exactly, but the existence of such a model is not a compensating inequality. The exact fixed selector and complete sum remain untreated; in particular, no pointwise or support-fibre claim is made. The primary claim remains unresolved on this route.

## Evidence file

evidence/topology-rank-data.md contains the source pinpoint, the relative-chain identification, and the integer calculation in compact replayable form.
