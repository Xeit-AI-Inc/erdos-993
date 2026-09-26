# C1-CU-F5 critique of C1-F5-1

## Disposition: retained

The source claim is accurate at its stated limited scope. Its integer point checks the scalar relaxation: with `h=5`, `k=2`, `q_k=1`, `q_(k+1)=3`, and `D=C=0`, both sides of `k*q_(k+1)+C=2(h-k)q_k-D` equal 6. The displayed local relation then gives `k*g=(2h-3k)q_k-D-C=4`, so `g=2`. This verifies that nonnegativity of `D,C` plus the scalar identity does not alone force a nonpositive local contribution. It does not verify a bipartite graph or tree realization.

The tree constraints in the report are also valid. For a leaf `v` supported at `s`, deleting `v,s` leaves a forest `H`. Each component contains exactly one neighbor of `s`: it has at least one by connectedness of the original tree, and two would form a cycle through `s`. Those roots are exactly `W=N_T(s)\\{v}`. With rooted components `H_i` at `w_i`, independent sets either omit `w_i` or include it, yielding `A_i=I(H_i)=B_i+zI(H_i-N[w_i])` where `B_i=I(H_i-w_i)`. Therefore `I(H)=product A_i`, while `R=H-W` gives `I(R)=product B_i`.

In `T-v`, independent sets either omit `s`, contributing `I(H)`, or include `s` and omit every root in `W`, contributing `zI(R)`. Since `q=I(H)-I(R)` and `r_j=[z^j]I(R)`, this gives `I(T-v)=q+(1+z)I(R)` and

`Delta_p(T-v)=q_(p+1)-q_p+r_p-r_(p-1)`.

Thus favorability is a constraint on the same rooted product profile; it cannot be assigned independently of those coefficients. For leaves sharing a support, the graphs `T-v` are isomorphic by swapping the two leaf vertices, and the local deletion graphs `T-{v,s}` and `T-N[s]` are isomorphic across those leaves. Consequently the selector is all-or-none on that support and the complete sum counts the selected tags with their multiplicity.

## Scope and unresolved issue

These are necessary constraints on tree-derived profiles and a diagnosis of the scalar relaxation, not a sufficient condition for the claimed global inequality. The example does not meet the burden for an ordinary-tree counterexample, since it has no certified graph realization, selector values, or full sum. No proof of `sum_F(D_v+C_v) >= (2a+1-3p)sum_F q_v(p-1)` follows from the nonnegativity facts alone, and no alternative aggregate bound is established here. The lower-region primary target remains unresolved by this route.

The common handoff's `K_(1,12)`, `T_22`, and `T_60` controls are consistent with this assessment: local positive terms can occur while the full selected sum is negative, so neither a relaxed positive term nor a support contribution can decide the global claim. I did not recompute those shared controls; they are contextual checks, not evidence for or against the source's structural identities.

No source script or external theorem was needed. Independent arithmetic and derivations are summarized in `evidence/AUDIT.json`.
