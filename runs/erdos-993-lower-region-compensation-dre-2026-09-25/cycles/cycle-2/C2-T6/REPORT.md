# C2-T6 search report — relative-chain rank accounting

## Scope and result

I investigated the allocated cross-tag algebraic-map route for the registered primary key `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. Let `k=p-1`. For every selected original leaf `v`, put `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, and `R_v=H_v-W_v`. The trees `H_v` are forests, and each component contains exactly one vertex of `W_v`: deleting the original support separates its other neighbor branches, each rooted at its corresponding neighbor. The desired sum has the exact form

`S(T,p) = sum_{v in F(T,p)} (q_v(k+1)-q_v(k))`,

where `q_v(j)=i_j(H_v)-i_j(R_v)` counts independent `j`-sets meeting `W_v`.

I give an explicit cross-tag graded chain space whose dimensions are these sums, and an exact rank-and-homology identity for the dimension difference. This is a reduction, not a resolution: I do not establish the needed rank/homology inequality under the strict selector. No counterexample to the full aggregate is obtained.

## Relative independence chain complex

Work over `Q` (any field gives the same dimension identity). For each selected tag `v`, take the relative simplicial chain complex of the pair

`(Ind(H_v), Ind(R_v))`.

Here `Ind(G)` is the simplicial complex whose faces are independent vertex sets of `G`. Since `R_v` is an induced subgraph, `Ind(R_v)` is a subcomplex. In degree `j-1`, the relative chain group has basis exactly the independent `j`-sets of `H_v` that meet `W_v`; faces wholly in `R_v` are zero in the quotient. Thus its dimension is `q_v(j)`. Form the direct sum over the *fixed* selected set `F(T,p)`, retaining separate summands for all original leaf tags, including tags with a shared support. Call this graded complex `C_*(F)`.

The differential is the simplicial boundary: delete each vertex with the usual alternating sign, with a deletion term set to zero if the resulting face lies wholly in `R_v`. It stays in the same tag summand. It is a concrete linear map from the selected marked upper layer to the selected marked lower layer, and also supplies all adjacent differentials in one chain complex. No selector is recomputed at a different rank.

Set `Q_j = sum_{v in F} q_v(j)`. Write `b_r=rank(d_r:C_r(F)->C_{r-1}(F))` and `beta_r=dim H_r(C_*(F))`; take out-of-range terms as zero. Rank-nullity gives `dim C_r=b_r+b_{r+1}+beta_r`. Consequently, for `k=p-1`,

`S(T,p)=Q_(k+1)-Q_k=b_(k+1)-b_(k-1)+beta_k-beta_(k-1)`.

This is an exact dimension identity for arbitrary finite graphs in the tagged relative construction, hence in particular for the forests induced by the tree hypotheses. Cross-tag summation is already present through the direct sum dimensions; repeated tags contribute with their required multiplicity.

## Exact missing condition

On this complex, the primary inequality is equivalent to

`b_(k+1)+beta_k <= b_(k-1)+beta_(k-1)`.

This identifies what a successful graded argument must supply: lower-rank boundary capacity and/or homology must dominate the upper-rank terms, in aggregate over the original selected tags. The ordinary simplicial boundary itself does not give that domination. It need not be injective, and the selector condition

`Delta_p(T-v)=q_v(p+1)-q_v(p)+i_(p+1)(R_v)-i_(p-1)(R_v)<0`

is an inequality on adjacent *dimensions*, not a rank or homology bound for this relative complex. I found no valid bridge from that condition to the displayed global budget. Homotopy type or a componentwise claim would not fill this gap.

## Checks and boundaries

The identity `Delta_k(H_v)-Delta_k(R_v)=q_v(k+1)-q_v(k)` follows by subtracting the two zero-extended independence-count differences. The ranks and Betti numbers in the dimension formula are for the direct sum over exactly `F(T,p)`; they are not for all leaves, a rank-dependent selector, or a set of supports with multiplicity removed. The equality provides no sign on its own and yields neither a proof nor a full-sum witness.

I performed no computation and imported no literature result. Packet and common-source hashes matched. The case packet listed no case-specific source files and no required review claim IDs.

## Limitation

The primary key remains open on this evidence. The crucial selector-conditioned rank/homology budget is unproved, and no eligible ordinary-tree counterexample has been produced. This report is a proposed algebraic reduction only.
