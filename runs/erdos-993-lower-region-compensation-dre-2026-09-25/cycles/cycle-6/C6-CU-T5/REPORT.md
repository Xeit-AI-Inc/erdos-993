# C6-CU-T5 critique — C6-T5.ORBIT-QUOTIENT-LIFT

## Disposition: retained

The quotient-lifting theorem is valid under the stated hypotheses. Let `N(X)` be the relation-neighborhood of a source subset and set `f(X)=s(X)-c(N(X))`. Quotient saturation implies `f(X) <= 0` for every union of source orbits. Since `N(X union Y)=N(X) union N(Y)` and `N(X intersection Y)` is contained in `N(X) intersection N(Y)`, nonnegative target capacities make the neighborhood-capacity function submodular; hence `f` is supermodular. If any subset had positive `f`, a positive maximizer would remain a maximizer under every group translate and under finite intersections of translates. Their intersection is invariant, hence a union of source orbits, contradicting quotient Hall. Thus every original subset satisfies capacitated Hall, and integral max-flow/min-cut gives an integral saturating flow. No free-action or simple-orbit-edge assumption is needed.

For `T_m`, the root, marked support and marked leaf are fixed; the `m` claws can be permuted and leaves within each claw can be permuted. Independent sets are classified by the root bit, marked-arm state and counts of empty, center-only, one-leaf, two-leaf and three-leaf claws. These data determine the orbit, with multiplicity `m!/(e!c!u!v!w!)*3^(u+v)`. The transition audit is exhaustive: delete one selected vertex, or insert an absent vertex after removing its two occupied neighbors. The possible inserted vertices are a claw center, marked support or root. The state transitions encode these graph-neighborhood cases. The supplied weights count distinct activated original leaf tags, including multiple leaves in one claw.

## Frozen flow checks

I replayed the listed verifier from scratch-local copies of the pinned graph evaluator and three primal-flow artifacts. All 4 case-source pins and 237 common-source pins matched. The replay reconstructed orbit layers and weights; checked the graph polynomial, first strict descent, fixed favorable selector, every positive arc, per-orbit weighted capacities and total flow.

| `(m,p)` | `(n, alpha, x)` | favorable leaves | upper tag supply | lower tag capacity | full `S(T,p)` |
|---|---:|---:|---:|---:|---:|
| `(22,34)` | `(91,68,32)` | 67 | `6533318342644086823410` | `7032072523191088241946` | `-498754180547001418536` |
| `(60,90)` | `(243,182,87)` | 181 | `18218546853926351167830731257168063662695945613618170468520` | `19276689216074003765533385845436458339871978815941487428900` | `-1058142362147652597702654588268394677176033202323316960380` |
| `(66,98)` | `(267,200,96)` | 199 | `10621175131261862108643497325635134690753959446180514839346249972` | `11019681101975788488398165437175461028091620945562562333982657340` | `-398505970713926379754668111540326337337661499382047494636407368` |

Every row satisfies `x+2 <= p` and `3p < 2 alpha+1`; every original leaf is selected. The quotient primal flow saturates all upper tag supply, each positive arc is a literal relation edge, and all per-orbit weighted capacities are respected. The lower capacity minus upper supply equals `-S(T,p)` exactly.

## Scope and limitations

The quotient-lifting implication and the structural `T_m` orbit/adjacency description hold for their stated finite-group and all-`m` scopes. Numeric flow applications are only the three frozen `(m,p)` cases above. They establish no feasibility for other ranks or `m`, no all-`m` flow family and no resolution of the arbitrary-tree lower-region aggregate. I found no mathematical defect in the assigned claim. This is bounded evidence, not an award on the primary claim.
