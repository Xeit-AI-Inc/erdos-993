# C1-CF-T6 independent critique of C1-T6-1

## Disposition: retained

**Reviewed statement.** The independence complexes of the edgeless forests on 10 and 11 vertices are both contractible, but their rank-seven differences are respectively -75 and -165. Hence ordinary homotopy type, by itself, does not determine this fixed-rank statistic. Scope is an information-loss diagnostic only; it is not a proof or counterexample for the lower-region aggregate.

## Arithmetic and realizability

For the edgeless graph on m vertices, `i_j=binom(m,j)`. Thus

- `Delta_7(H_10)=i_8-i_7=binom(10,8)-binom(10,7)=45-120=-75`;
- `Delta_7(H_11)=i_8-i_7=binom(11,8)-binom(11,7)=165-330=-165`.

Each independence complex is the full simplex on its vertex set, so each is contractible. The contrast is exact. These graphs are realizable as the local induced forest `H_v=T-{v,s_v}`: use a star with 11 or 12 leaves and let `v` be any leaf. The `H_10` realization via `K_(1,11)` is not eligible at `p=8` under `3p<2a+1`; `H_11` occurs locally in the eligible `K_(1,12)` example. But comparing the two local complexes is not itself a complete eligible target instance, and C1-T6-1 makes no such claim.

For a pair of simplicial complexes `Ind(R_v) subset Ind(H_v)`, the relative simplicial chain group in degree `j-1` has basis the independent `j`-sets of `H_v` not in `R_v`, precisely the sets meeting `W_v=V(H_v)\\V(R_v)`. Its dimension is `i_j(H_v)-i_j(R_v)=q_v(j)`. This degree/basis assertion is valid (including the usual empty-face convention, which contributes no set meeting `W_v`). It preserves the grading when using the chain groups, but does not provide a sign or an inequality for their dimensions.

## Literature scope

Ehrenborg and Hetyei, “The topology of the independence complex,” *European Journal of Combinatorics* 27 (2006), Corollary 6.1, state that a forest's independence complex is simple-homotopy equivalent to a point or a sphere; immediately beforehand they identify graph edges with size-two blocks and forests with branching block systems. The source is available at [the authors' PDF](https://www.ms.uky.edu/~jrge/Papers/Independence.pdf) and [the DOI page](https://doi.org/10.1016/j.ejc.2005.04.010). This applies to the forest graphs discussed in the route. It says nothing about a prescribed face number or `Delta_7`; the route's concrete full-simplex argument independently establishes contractibility for `H_10,H_11`. No theorem-to-primary-target bridge is asserted.

## Exact target and controls

The route gives no values for `x(T)`, the fixed selector `Delta_p(T-v)<0`, or the complete `S(T,p)` for a claimed witness, and offers no map/budget establishing the needed aggregate sign. It is therefore not an answer to the target. Its topological diagnosis is compatible with the handoff's `K_(1,12)` example: there `a=12,x=6,p=8` is eligible, all 12 leaves are selected, each local term is `Delta_7(H_11)=-165`, and `S=-1980`. This illustrates that the rank data itself is available despite the contractible complex; it does not follow from contractibility.

The supplied standing controls further warn against reading local signs as aggregate signs: `T_22` has a positive marked term `212336130412243110` but full aggregate `-498754180547001418536` at `(a,x,p)=(68,32,34)`; `T_60` has positive marked term `2935177632783649903488454322226807645411570590073000` but full aggregate `-1058142362147652597702654588268394677176033202323316960380` at `(182,87,90)`. I inspected their pinned control rows; I did not replay their graph computations. These are context checks, not evidence for or against the homotopy diagnostic. The route proposes no transport inequality, so there is no transport mechanism to test against these controls.

## Conclusion and limitations

Retain C1-T6-1 at precisely its stated diagnostic scope. The arithmetic is directly checked; the general forest homotopy fact is supported by the cited primary source; no finite enumeration or source computation is relied on for this conclusion. The primary lower-region aggregate remains unresolved. The route establishes neither a necessary/useful substitute for graded counts nor any selected-sum bound, and its conclusion must not be elevated to a primary claim.
