# C5-CF-T2 critique — heterogeneous star bounded census

## Disposition

**Retained**, at the source claim's exact finite scope and evidence grade. The claim is that the canonical family census has 285 profiles and 913 eligible profile-rank rows, with every original leaf selected and each exact full aggregate negative. It is a bounded computational result, not evidence for arbitrary branch counts or a heterogeneous analytic extension.

## Independent checks

The pinned source hashes match. I copied the pinned replay program into this worker directory and ran it here; its generated census is byte-identical to the pinned `PROFILE-CENSUS.json`. It reports 285 canonical nondecreasing profiles, 913 eligible rows, no empty or proper selectors, no positive sums, maximum `S=-275`, and minimum `S=-3351112008120`.

I also recalculated the census by branch-factor formulas rather than the producer's tree traversal dynamic program. For a branch with `r` tips its factor is `B_r(z)=(1+z)^r+z`. Writing `N=sum r_i`, the full polynomial is

`I_T=(1+2z) product_i B_{r_i} + z(1+z)^(N+1)`.

The endpoint-2 deletion polynomial is `(1+z) product_i B_{r_i}+z(1+z)^N`. For a tip on branch `i`, the deletion polynomial is `(1+2z) B_{r_i-1} product_(h!=i) B_{r_h}+z(1+z)^N`. These independently reproduce every recorded leaf-selector difference. For the summands, deleting endpoint 2 and its original support 1 leaves polynomial `product_i B_{r_i}+z(1+z)^N`, while deleting `N[1]` leaves `product_i B_{r_i}`. For a tip with support center `c_i`, deleting the tip and `c_i` leaves

`(1+z)^(r_i-1) ((1+2z) product_(h!=i) B_{r_h} + z(1+z)^(N-r_i+1))`,

and deleting `N[c_i]` leaves `(1+2z) product_(h!=i) B_{r_h}`. The resulting selector sets and all 24,786 selected `(leaf,support,term)` records agree exactly with the source census.

The finite boundary count is `sum_(m=1)^10 binom(m+2,2)=285`: sorting branch arities removes only branch permutations, which give isomorphic trees. The rank loop is exact: for integer `p`, `3p<2a+1` is equivalent to `p<=floor(2a/3)`. The descent scan includes `j=a`, where zero extension gives `Delta_a=-i_a<0`, and its preceding ranks, so it locates the required first negative difference. The tree construction includes the path endpoint as a separate original leaf and retains each tip as a separate tag when tips share a support.

## Scope and limitations

The evidence supports only this canonical finite family with 1 through 10 branches of arity 2, 3, or 4. All-leaf selection is observed only in its 913 eligible rows; it is not proved for larger profiles or other trees. The output is exact-integer, reproducible computation, but neither the replay nor this independent formula check is a kernel-checked proof. No sufficiently-many-branches bound, infinite heterogeneous subfamily theorem, central-curvature or mixed-minor inequality, or proof of the registered lower-region aggregate follows. The original claim's bounded status is therefore appropriate.
