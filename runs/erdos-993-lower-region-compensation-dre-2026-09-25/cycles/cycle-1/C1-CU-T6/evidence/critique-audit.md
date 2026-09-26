# C1-CU-T6 critique evidence: topology versus fixed-rank data

## Disposition

**C1-T6-1 — retained.** The claim is correct at its stated diagnostic scope: ordinary homotopy type alone does not determine the specified rank-seven coefficient difference for the two induced-forest examples. This is not a proof or refutation of the selected aggregate.

## Independent arithmetic replay

For the edgeless graph H_m on m vertices, every vertex subset is independent, so i_j(H_m)=binom(m,j), and Ind(H_m) is the full simplex on m vertices. For m=10,

- i_7=binom(10,7)=120;
- i_8=binom(10,8)=45;
- Delta_7=i_8-i_7=-75.

For m=11,

- i_7=binom(11,7)=330;
- i_8=binom(11,8)=165;
- Delta_7=i_8-i_7=-165.

Both complexes are nonempty simplices and hence contractible. Thus the pair has the same ordinary homotopy type but different Delta_7. This establishes the stated information-loss diagnosis. These are legitimate H_v examples: take T=K_(1,11) or K_(1,12), respectively, and remove an original leaf v together with its support (the center); the remaining induced graph is edgeless on 10 or 11 vertices. This observation does not make either graph a full target witness.

The relative-chain identification is also correct: in the pair (Ind(H_v), Ind(R_v)), a relative chain basis in degree j-1 consists of independent j-sets of H_v not belonging to Ind(R_v), exactly those meeting W_v=V(H_v)\\V(R_v). Its dimension is i_j(H_v)-i_j(R_v)=q_v(j). This records rank data; it gives no sign or comparison by itself.

## Citation and bridge audit

Ehrenborg and Hetyei, *The topology of the independence complex*, European Journal of Combinatorics 27 (2006), Corollary 6.1, state that the independence complex of a forest is constrictive and simple-homotopy equivalent to a point or a sphere. The paper's preceding discussion identifies a graph's edges as size-two blocks and says a forest gives a branching block system, so the cited forest hypothesis applies to T and its induced forests H_v and R_v. The source does not assert fixed-rank face-number constraints or the selector condition. The route correctly disclaims that bridge. Primary copy: https://www.ms.uky.edu/~jrge/Papers/Independence.pdf (Corollary 6.1, p. 916); DOI: https://doi.org/10.1016/j.ejc.2005.04.010.

## Target-scope checks and limits

The source route makes no eligible counterexample or proof claim. Its H_10/H_11 comparison is a local diagnostic, not a computation of F(T,p) and S(T,p). The handoff's K_(1,12) check remains consistent: x=6, a=12, p=8, so x+2<=p and 3p=24<25=2a+1; each of its 12 leaves is selected since Delta_8(T-v)=binom(11,9)-binom(11,8)=55-165=-110, and each corresponding local term is Delta_7(H_11)=-165, giving S=-1980. This full example is negative and does not follow from homotopy type. The supplied T_22 and T_60 controls also have positive marked terms but negative complete S, consistent with requiring full-sum arithmetic for any proposed transport. The route proposes no transport inequality for those controls to test.

No implication for the complete lower-region aggregate follows from this retained claim. In particular, it supplies no bound on the selected sum of D_v+C_v, no control of all selected leaves for general T, and no treatment of the strict lower-region selector. Status remains proposed only.
