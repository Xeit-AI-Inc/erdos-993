# C3-CT-U4 cross-orientation critique (T)

## Scope and source integrity

This review covers exactly the three claims in the sealed C3-U4 route return. The packet hash check matched all 115 common-source entries and all three case entries. I read the common read-first files, the C3 critic brief, and only the case-listed C3-U4 evidence, report, and return. No computation was replayed, so no sealed-source copies were needed. No shell theorem, census, or primary aggregate proof is claimed by this transport-focused route; shell-specific challenges in the critic brief therefore do not apply to its three claims.

## Claim-by-claim dispositions

### C3-U4.CUT-DUAL — retained

For finite upper states U and lower states L, nonnegative supplies u and capacities c, and an uncapacitated allowed relation, a flow saturating all supplies exists iff for every X subset U, u(X) <= c(N(X)). This is the source/sink cut criterion for the network with a source arc of capacity u(b), a sink arc of capacity c(d), and allowed middle arcs of capacity at least total supply. If total supply is zero, the same inequalities and the zero flow give the result. Integer capacities also give an integral saturating flow when one exists.

The function X -> c(N(X)) is submodular: N(X union Y)=N(X) union N(Y), N(X intersect Y) is contained in N(X) intersect N(Y), and c is nonnegative and additive. Subtracting modular u preserves submodularity. Global minimizers of a submodular function are closed under union and intersection. The claim is correctly bounded as a criterion; it does not show the tree-derived cuts pass. In particular, the aggregate comparison is only the X=U cut and does not imply all cut inequalities.

### C3-U4.ORBIT-COMPRESSION — retained

For a finite group action preserving the two vertex sides, supplies, capacities, and allowed relation, each nonempty relation between a source orbit and a target orbit is biregular: transitivity forces a constant degree on each side. Aggregating any literal feasible flow gives a feasible quotient flow. Conversely, spread a quotient flow f_ij uniformly over the allowed edges between each orbit pair. Biregularity makes each vertex in source orbit i send f_ij/|U_i| and each vertex in target orbit j receive f_ij/|L_j|. Summing over neighboring orbits respects per-vertex bounds because orbit supplies and capacities are invariant. This proves real-flow feasibility in both directions; integrality of the literal network then supplies an integral flow where required.

For an ordinary fixed tree instance, automorphisms preserve original leaves, supports, deletion counts, the fixed selector, and the stated deletion/switch relation, so the required invariance holds. This validates compression only for that instance. The route properly disclaims any uniform cut proof or small quotient guarantee. It is essential to retain legal adjacency between orbits; total mass matching alone is not the proposition.

### C3-U4.COLORED-SHADOW-SCOPE — retained_narrowed

Retained in the following scope: the unweighted one-step subset-shadow result as described in the route report does not, without an additional proved bridge, establish these selector-weighted cut inequalities with two-for-one switch moves. A switch inserts a vertex absent from its upper state, so its output is not a subset-shadow element of that state; moreover, selector-dependent weights are not unweighted family cardinalities. Thus the claimed non-implication is valid at the level stated. I did not independently verify the bibliographic proposition or the report's assertion that a particular candidate residual family is not downward closed. No conclusion follows here about refinements that may handle switch arcs, weights, or residual structure.

## Overall boundary

The three claims survive at their stated or narrowed scopes. The cut and orbit results are exact finite-network reductions, not a proof that all eligible ordinary-tree cuts satisfy Hall inequalities. A failed cut for this sufficient transport mechanism would also not by itself refute the scalar complete-sum assertion. No graph instance, selector row, terminal descent, or complete sum was recomputed in this review; the primary aggregate and its universal status remain unresolved by this route case.

## Limitations

- No universal tree-derived cut inequalities or full-sum proof/refutation was established.
- No flow instance or source computation was replayed; the critique is a proof audit of the general propositions and scope statements.
- The exact primary-paper hypotheses and the route's residual-family observation were not independently checked beyond the case report's description.
- Shell, first-wide, and census evidence is not among this route's claims and was not used to enlarge their scope.
