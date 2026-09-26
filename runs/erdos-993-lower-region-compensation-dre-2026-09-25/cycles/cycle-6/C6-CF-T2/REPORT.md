# C6-T2 independent critique (orientation F)

## Disposition

**Retained** — `E993-ORDINARY-PATH-STAR-ARITY-2-4-M2000-LOWER-REGION-AGGREGATE`. The route's exact restricted-family theorem is supported. This review does not extend it to the omitted prefix, other arities, or arbitrary ordinary trees.

## Audit

The path-rooted graph formulas check directly by splitting independent sets according to whether the root is selected. With `N=sum r_i`, the root-excluded polynomial is `(1+2z) prod B_(r_i)` and root inclusion contributes `z L^(N+1)`. The stated alpha is `N+2`; the endpoint deletion and each private-tip deletion give the displayed `A_0,A_i`. Deleting a tip and its support, then subtracting the closed-support-neighborhood deletion, gives `q_v=z((1+2z)F_(r_i)H_i+L^N)` for each private-tip tag; the endpoint tag gives `zL^N`. Summing all distinct tags yields `zR`, with `R=sum_i r_i Z_i`. Thus when all original leaf deletions are in the strict selector, the complete aggregate is `R_(p-1)-R_(p-2)`, with no lost or merged tag.

The finite ULC inputs and their stated orders check: `B_2` order 2, `B_3` order 4, `B_4` order 7, `F_2` order 0, `F_3` order 1, `F_4` order 3, and `L,1+2z` order 1. Gurvits, Theorem 1.1, states closure under convolution with orders added, and the definition permits order at least the sequence degree. The route's primary-source hypothesis bridge therefore applies to these positive-interval factors. Its coefficient derivative inequalities imply the stated adjacent-ratio controls; the degree and rank margins in the indicated central interval are positive for `N>=4000`.

The perturbation estimate uses `H_i >= binom(m-1,29) z^29 L^(N-120)`. The two falling-factorial quotient formulas and their monotonicity give the claimed epsilon bound. I copied and ran the sealed replay using the specified Python 3.11 executable; the generated JSON is byte-identical to the route's pinned arithmetic output. The exact controlling fraction is below 1 at `m=2000`; the stated monotonicity of its factors extends the cutoff. This replay checks the rational cutoff only, not the structural proof.

The selector transfer is valid: the direct derivative bound gives `x(T)>N/4`; the strict alpha guard bounds `p` by `floor((2N+4)/3)`; eligibility gives `x<=p-2`. Thus `x` and every rank used by the curvature and mixed-minor arguments lie in the central range. At `x`, the first descent of `P` and the nonnegative mixed minors force strict descent of each `A_0,A_i,Z_i`; their strict central log-concavity propagates descent to deletion rank `p` and marked-factor rank `p-1`. This certifies every original leaf is selected and makes the complete weighted sum strictly negative.

## Correction noted

There is a harmless undercount in the marked mixed-minor constant. Since `t=(N+1)/N>1`, the first marked adverse product contributes at most `700t epsilon H_j^2`, not `700 epsilon H_j^2`. With `N>=4000`, `700t+6569*8 <= 53252.175`; after division by the marked main-minor factor 3 this is below `26776`. The claimed common sufficient condition `26776(j+1)epsilon<1` still dominates the corrected bound, so the theorem and cutoff are unaffected. The deletion constant `26776` is unchanged.

## Scope and limitations

This is an analytic audit of the one route claim, with exact replay of its rational cutoff. I did not run an exhaustive graph/profile census. The result remains limited to the specified path-with-private-stars family, `m>=2000`, and `r_i in {2,3,4}`. The Gurvits convolution theorem is imported, not formalized here. No primary universal-tree budget follows.
