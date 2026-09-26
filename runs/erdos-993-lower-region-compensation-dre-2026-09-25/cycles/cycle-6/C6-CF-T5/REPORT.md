# C6-CF-T5 critique (orientation F)

## Disposition

**C6-T5.ORBIT-QUOTIENT-LIFT: retained.** The finite-group lifting argument is valid under the stated hypotheses. The wreath-product state description and transitions match the T_m graph for every m >= 1. The independently replayed finite applications are valid for the three specified (m,p) rows only. This does not imply quotient feasibility at other parameters or resolve the arbitrary-tree aggregate.

## Audit of the lifting argument

Let R be the invariant bipartite relation, with nonnegative integer supplies and capacities invariant on vertex orbits. The quotient has one node per orbit, orbit-summed supply/capacity, and an uncapacitated relation arc exactly when some edge joins the orbit pair. For a union X of source orbits, its original neighborhood is exactly the union of target orbits adjacent in the quotient: invariance and transitivity within each orbit turn one edge into coverage of the entire target orbit. A quotient flow saturating source supply therefore gives f(X) <= 0 for every invariant X, where f(X)=s(X)-c(N(X)).

The neighborhood-capacity function c(N(X)) is submodular: N(X union Y)=N(X) union N(Y), and N(X intersect Y) is contained in N(X) intersect N(Y); nonnegative capacities give the required inequality. Thus f is supermodular. If f(X)>0 for any X, a global maximizer of f is positive. The union and intersection of two maximizers are again maximizers by supermodularity and maximality. Intersecting the finitely many group translates of a maximizing set gives an invariant positive maximizer, contradicting the quotient inequalities. Hence every original subset satisfies the capacitated Hall condition. Integral max-flow/min-cut then supplies an integral saturating flow in the original finite relation. This argument does not require a free action or one edge orbit per quotient arc.

## T_m orbit and relation audit

The designated root, special length-two arm, and m root-adjacent claws are preserved by (S3)^m semidirect S_m. A claw's independent configurations are empty, center-only, one leaf, two leaves, and three leaves. The five configuration counts sum to m; the root excludes centers and the special support. Arm permutations and within-claw leaf permutations act transitively on configurations with each recorded state, and the multiplicity m!/(e!c!u!v!w!)*3^(u+v) counts them. The distinguished arm is fixed. These states partition all independent sets, without needing the group to be the full automorphism group.

Every deletion is one of root, special-arm, center, or leaf-occupancy reductions. For a two-for-one move, the inserted vertex must have exactly two occupied neighbors. The only possibilities are a claw center (two leaves, or root plus one leaf), the special support (root plus marked leaf), or the root (exactly two occupied neighbors among claw centers and the special support). Each listed state transition is realizable and these neighborhoods exhaust the graph, so the quotient adjacency is exact. The T_m leaf-tag weight is invariant: each tag is counted precisely when its leaf and at least one witness neighbor in N(s_v)\\{v} are selected. All tags are selected in the three tested rows, as independently checked by the fixed selector.

## Finite replay and exact scope

I replayed the case verifier on scratch copies of the pinned verifier, ordinary-tree evaluator, and three primal-flow files. The full common packet pins were separately verified (237/237); all four case-file pins also matched. The replay checked the forest polynomial, first descent through the terminal zero-extended rank, strict eligibility guards, all original leaf selector values, full tagged supply/capacity arithmetic, every positive arc's literal adjacency, each weighted orbit capacity, and total source saturation. Exact replay output is in `ORBIT-AUDIT.json`.

| m,p | n, alpha, x | favorable leaves | source supply | target capacity | complete S |
|---|---|---:|---:|---:|---:|
| 22,34 | 91,68,32 | 67 | 6533318342644086823410 | 7032072523191088241946 | -498754180547001418536 |
| 60,90 | 243,182,87 | 181 | 18218546853926351167830731257168063662695945613618170468520 | 19276689216074003765533385845436458339871978815941487428900 | -1058142362147652597702654588268394677176033202323316960380 |
| 66,98 | 267,200,96 | 199 | 10621175131261862108643497325635134690753959446180514839346249972 | 11019681101975788488398165437175461028091620945562562333982657340 | -398505970713926379754668111540326337337661499382047494636407368 |

The m=60 target-capacity value in the table is transcribed from the replay record; the difference from supply is the magnitude of the displayed S. The proof establishes a general lift theorem and a uniform state/adjacency description, but the actual saturated quotient flows are only these three finite rows. No all-m flow construction or primary arbitrary-tree proof follows.

## Limits

- The finite flow check is bounded to (22,34), (60,90), and (66,98); it is not evidence of feasibility at any untested row.
- The route's structural proof is specific to the designated T_m family and its stated relation and invariant weights.
- No theorem or counterexample for the full lower-region ordinary-tree aggregate is established here.
