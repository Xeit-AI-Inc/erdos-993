# C1-F5 — global budget relaxation and tree-realizability constraint

## Exact target

For an ordinary finite tree `T`, let `a=alpha(T)`, let `x` be the first strict descent of its zero-extended independence sequence, and choose `p` with `x+2<=p` and `3p<2a+1`. The fixed selected set is the original leaves `v` satisfying `Delta_p(T-v)<0`. The target is that the sum over those leaves of `Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N[s_v])` is nonpositive.

## What the scalar relaxation says

For an individual leaf, write `H=T-{v,s}`, `R=T-N[s]`, `W=N(s)\\{v}`, and `q_j=i_j(H)-i_j(R)`. With `h=a-1` and `k=p-1`, the admitted tagged-incidence identity gives

`k*g_v=(2h-3k)q_k-(D_v+C_v)`,

where `g_v` is that leaf's summand. The two terms `D_v,C_v` are nonnegative, but this alone permits positive summands in the strict lower region. The exact integer relaxation point `h=5,k=2,q_2=1,D=C=0,q_3=3` satisfies the incidence identity and has `g=2>0` (equivalently `k*g=4`). Its full arithmetic is in `evidence/LP-RELAXATION.json`.

This point is a diagnostic of the relaxation only. It supplies neither an independence polynomial nor a selector-valid tree, so it is not a counterexample.

## Tree-realizability constraint exposed

The local profile variables cannot be chosen independently. Deleting `s` from `T` leaves a forest `H` in which every component contains exactly one vertex of `W`, its root; deleting all of `W` gives `R`. If these rooted components are `H_i` with roots `w_i`, then

`I(H)=product_i A_i`, `I(R)=product_i B_i`, `q(z)=I(H)-I(R)`,

where `A_i=I(H_i)`, `B_i=I(H_i-w_i)`, and the rooted-tree recurrence is the exact identity `A_i=B_i+z I(H_i-N[w_i])`. Thus the `q` coefficients and the incidence deficits inherit a common rooted-product structure absent from the scalar LP.

There is a second exact coupling to the selected set. Put `r_j=i_j(R)`. Since `T-v` is obtained from `H` by adding `s` adjacent to all roots in `W`,

`I(T-v)=I(H)+z I(R)`,

and therefore

`Delta_p(T-v)=q_(p+1)-q_p+r_(p+1)-r_(p-1)`.

Favorable status is a strict inequality on this same product profile. An LP assigning `q_k,D,C` independently of `r` and the rooted factors can therefore manufacture selected positive mass without realizing any tree.

Finally, if a support has `m` original leaf neighbors, all `m` leaf deletions have the same independence polynomial and the same local rooted profile up to relabeling. The fixed selector consequently includes all `m` leaf tags at that support or none, and the support's contribution is multiplicity `m*g`. Treating these tags as independent LP choices is another unrealizable relaxation.

## Result and gap

The useful result is an exact set of necessary tree constraints for strengthening the global budget LP: rooted-component product factorization, selector coupling through the same `R` coefficients, and all-or-none support multiplicities. I have not shown that these constraints force the required aggregate deficit budget; nor have I realized the relaxed positive point by a tree. The lower-region target remains unresolved by this route.
