# C3-U4 search report: exact cut dual and lossless orbit compression

## Scope and result

Intake check: all 115 source files pinned by the common packet matched their listed SHA-256 digests; the case packet lists no additional source files.


This route studies the deletion-plus-two-for-one transport associated with the fixed original favorable selector `F(T,p)`. Write `U=I_{p+1}(T)` and `L=I_p(T)`. For an independent set `B`, its integer weight is

`w_F(B) = #{v in F intersect B : (B - {v}) meets W_v}`,

with `W_v=N_T(s_v)\\{v}` as in the neutral handoff. A legal arc from `B in U` to `D in L` is either a deletion `D=B-{b}` or a switch `D=(B-(N_T(s) intersect B)) union {s}`, where `s` is absent from `B` and has exactly two neighbors in `B`. The switch output is independent and has size `p`: its two occupied neighbors are removed before inserting `s`.

The route establishes two general exact reductions for this transport: the capacitated Hall cut dual, and a lossless quotient under selector-preserving automorphisms. It also establishes submodularity of the cut-deficit function and the resulting lattice property of minimum cuts. These are mathematical reductions, not a proof that every cut is nonpositive on every eligible tree. No target verdict is proposed.

## Exact capacitated cut dual

Give each `B in U` supply `u(B)=w_F(B)`, each `D in L` capacity `c(D)=w_F(D)`, and put an arc for each legal move, with no effective arc bottleneck (equivalently, capacity equal to total supply). The max-flow/min-cut theorem gives an exact criterion for routing all upper supply:

`for every X subset U: sum_{B in X} u(B) <= sum_{D in N(X)} c(D)`,

where `N(X)` is the set of lower states reached by at least one legal move from a member of `X`. Necessity follows by summing conservation over `X`; sufficiency is the capacitated Hall theorem, or the source/sink cut formula. All capacities are nonnegative integers, so if the real-valued criterion holds, an integral saturating flow exists as well.

The scalar aggregate is only the special comparison `sum_U u <= sum_L c`; it is necessary for a saturating flow but does not imply the inequalities for all `X`. Conversely, saturation of this network would imply the scalar comparison. This route supplies no proof that all cuts pass.

For `g(X)=c(N(X))-u(X)`, one has `N(X union Y)=N(X) union N(Y)` and `N(X intersect Y) subset N(X) intersect N(Y)`. Since `c` is nonnegative and additive on vertices, its weighted coverage function is submodular; `u` is modular. Thus

`g(X)+g(Y) >= g(X union Y)+g(X intersect Y)`.

If the transport is feasible, every `g(X)>=0`; consequently the sets with `g(X)=0` are closed under union and intersection. More generally, sets minimizing `g` are closed under both operations. This gives a canonical minimum-cut family to inspect, but does not make that family small or product-shaped.

## Lossless automorphism quotient

**Proposition.** Let a finite group `G` act on finite sets `U,L`, preserve nonnegative supplies `u`, capacities `c`, and the allowed bipartite relation `E subset U x L`. Form orbit nodes `U_i` and `L_j`, put total supply `u_i=sum_{x in U_i}u(x)` and total capacity `c_j=sum_{y in L_j}c(y)`, and join `U_i` to `L_j` exactly when `E` contains at least one such pair. Then the orbit network has a saturating flow if and only if the literal network does.

**Proof.** Any literal flow aggregates over vertex orbits to a feasible orbit flow. In the other direction, fix an orbit pair `(U_i,L_j)` with at least one allowed edge. Group invariance and transitivity on each vertex orbit imply every vertex in `U_i` has the same number of allowed neighbors in `L_j`, and every vertex in `L_j` has the same number in `U_i`. In particular the nonempty relation is biregular. If an orbit flow sends amount `f_ij` across this pair, distribute `f_ij` equally over its allowed literal edges. Each source vertex then sends exactly `f_ij/|U_i|`, and each target vertex receives exactly `f_ij/|L_j|`. Summing over orbit pairs gives every vertex in an orbit the same fraction of its orbit's total load. Orbit supply and capacity bounds therefore give all literal vertex bounds. This lifts an orbit flow to a real literal flow. Since the literal network has integer supplies/capacities and integral arc capacities may be set to total supply, the integral max-flow theorem then gives an integral saturating flow. Hence the two feasibility questions are equivalent. No assumption of edge transitivity is needed.

For the present tree problem, `Aut(T)` preserves the fixed selector: automorphisms preserve original leaves, supports, deletion polynomials, and therefore the sign test `Delta_p(T-v)<0`. It also preserves `w_F`, ordinary deletions, and the exact two-neighbor switch rule. Thus quotienting independent sets into full automorphism orbits is lossless for each fixed eligible `(T,p)`. In a branch-symmetric family such as `T_m`, product permutations of identical branches produce the count-state quotient used by the supplied orbit-flow instrument. The quotient must retain legal adjacency between state orbits; merely matching total upper and lower mass is insufficient.

This proposition validates a route to compress a particular finite tree's literal cut problem. It does not prove a cut inequality uniformly over trees. A tree with few automorphisms may have essentially no state compression, and even the product-symmetric quotient can have many count states. It also does not establish that the quotient cut minimizing `g` has a simple coordinatewise description.

## Colored-shadow literature check and limit

Frankl, Füredi, and Kalai, “Shadows of colored complexes,” *Mathematica Scandinavica* 63 (1988), 169–178, DOI [10.7146/math.scand.a-12231](https://doi.org/10.7146/math.scand.a-12231), determine the minimum cardinality of the one-step subset shadow of a family of fixed-size sets under the hypothesis that the family is `r`-colored (each set uses at most one vertex of each color). Their shadow consists of the `(k-1)`-subsets contained in a member of a `k`-set family.

That theorem does not directly give the cut inequality above. A legal two-for-one switch replaces two occupied vertices by a vertex absent from the upper set, so its output is not a subset of that upper set. The network is weighted by selected leaf tags at both ranks, not by cardinality of an ordinary unweighted shadow. In the choked-broom lead, the supplied control note further says that the residual qualifying source family is not downward closed: a deletion can move into the qualifying pattern. Therefore a colored-shadow theorem would need a new decomposition that identifies the actual residual source family, handles switch exports, and respects competition for the weighted lower capacities. None is proved here.

## Exact source dependence and open gap

The common handoff fixes the move semantics and records that the all-rank two-for-one orbit instrument saturates for only three specified `T_m` instances; those are finite computations, not a universal theorem. The `C3-CB-EXPORT-DIRECTION.md` note describes a routable qualifying subfamily for one choked-broom shape and explicitly leaves remaining demands unresolved. Neither finite success nor that subfamily proves all cut inequalities. No new graph was generated in this route, so there is no new census horizon or witness to report.

The concrete remaining obligation is to prove, for every eligible ordinary tree and its original fixed selector, `u(X)<=c(N(X))` for every upper-state set `X`, or to find a violating cut / complete positive aggregate. This route does not establish either. In particular, the exact aggregate `S(T,p)<=0` remains open here; a failure of this stronger transport mechanism alone would not refute the aggregate.
