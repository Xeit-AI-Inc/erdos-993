# C3-CF-U4 critique of C3-U4 (orientation F)

## Scope and source integrity

I audited the three claims in the assigned C3-U4 return: `C3-U4.COLORED-SHADOW-SCOPE`, `C3-U4.CUT-DUAL`, and `C3-U4.ORBIT-COMPRESSION`. The case packet's three listed source files and all 115 common-packet listed files matched their pinned SHA-256 digests. I read the common read-first files and the explicitly allowed C3 critic brief. I did not replay any sealed computation or edit source evidence. The detailed disposition checks are in `EVIDENCE.json`.

The route does not claim a proof or refutation of the registered lower-region sum. Its flow statements are method-level claims, and the report repeatedly limits them to that role. None of the route's three claims is an eligible-tree counterexample or a positive aggregate result.

## Dispositions

### `C3-U4.CUT-DUAL` — retained

For a finite bipartite network with source supply `u`, target capacity `c`, and uncapacitated relation arcs, the exact capacitated Hall criterion is `u(X) <= c(N(X))` for every subset of upper states. This is equivalent to saturation of all supply. The route correctly distinguishes this stronger family of inequalities from the scalar comparison of total upper and lower weights; the scalar comparison alone does not imply saturation.

The deficit `g(X)=c(N(X))-u(X)` is submodular: weighted neighborhood coverage is submodular, while `u(X)` is modular. On a finite ground set, if two sets minimize `g`, submodularity and minimality force their union and intersection to minimize it too. These proofs support the claim in its stated general network scope. They do not show that every tree-derived cut passes, nor that a failed cut would refute the scalar target sum.

### `C3-U4.ORBIT-COMPRESSION` — retained

For an invariant relation between two transitive group orbits, each nonempty orbit-pair relation is biregular. If the quotient sends flow `f_ij` on that pair, spreading it evenly over its literal edges sends `f_ij/|U_i|` from each source vertex and delivers `f_ij/|L_j|` to each target vertex. Thus aggregate orbit supplies and capacities imply the literal per-vertex bounds. Conversely, aggregating any literal feasible flow gives a quotient flow. This establishes equivalence of saturation feasibility. With integer supplies and capacities, ordinary integral max flow gives an integral realization as well.

For a fixed tree, automorphisms preserve its original leaves and supports, all independence counts and selector signs, and the legal deletion and switch relation. Hence the proposition applies to the full automorphism action when the network uses the fixed original selector and its induced weights. Orbit compression can be large and gives no uniform cut bound; the route acknowledges this. No arithmetic or selector-index defect was found in this general reduction.

### `C3-U4.COLORED-SHADOW-SCOPE` — retained

The route makes only a negative application-scope claim: the cited colored one-step shadow theorem does not by itself prove these weighted cut inequalities. The stated mismatch is decisive for direct application: ordinary subset-shadow outputs are subsets of their source sets, whereas a legal two-for-one switch inserts an absent vertex; additionally, the present network uses selector-dependent weights. A separate argument handling those features and competing lower capacities would be needed. The route does not claim that no refinement or other theorem could help. I did not independently retrieve the cited paper, and do not rely on its precise theorem statement for a positive conclusion.

## Target checks and limits

The exact target still has its original fixed set `F(T,p)`, strict sign test `Delta_p(T-v)<0`, `x(T)+2<=p`, and `3p<2a+1`; the route supplies no value of `T`, `a`, `x`, or `p` and no selected summand. It therefore leaves terminal zero-extended descent, eligibility, same-support multiplicity, and the complete global sum undecided. The route's general reductions are mathematically realizable and potentially useful for finite cut analysis, but neither saturation nor colored-shadow scope establishes the primary aggregate. No standing-control identity or counterexample is displaced.

Proposed dispositions are limited to the three source claims listed above. No authoritative status is awarded.
