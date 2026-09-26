# C4-T6 independent critique (orientation U)

## Dispositions

- **C4-T6-ROOTED-MESSAGE-REDUCTION — retained.** The four polynomial identities are correct for finite ordinary trees, with the stated zero-extension convention for coefficient differences. Their proof is the independent-set partition at a root and multiplication across disjoint branches. For a rooted component, deleting the root leaves each child component intact, while deleting its closed neighborhood leaves each child component with its child root deleted. For a leaf tag `v` at support `s`, partitioning `T-v` according to whether `s` is chosen gives `prod J_u + z prod A_u`; deleting `{v,s}` gives the first product alone. Deleting `N[s]` leaves `C_u-u` in each non-leaf branch and nothing in pendant-leaf branches, yielding the final product. Empty products cover support degree one. Repeated leaves at `s` remain distinct tags: each has its own deletion selector and summand, and excluding the particular `v` from the product is the correct operation for that tag.
- **C4-T6-PRIMARY-GLOBAL-BOUND — retained, narrowed to this route.** The recurrence is an exact evaluator and supplies no comparison controlling the sum after the two selectors are applied. Thus this route proves neither the claimed nonpositive sum nor an eligible positive full-sum counterexample. This is not evidence that the contract's assertion is false, and the route alone does not settle the status of the primary claim across other evidence.

## Independent checks

I checked the recurrence algebra directly rather than relying on the producer's evidence representation. As a small hand calculation of all branches and coefficients, take the three-leaf star and one of its leaf tags. The rooted formula gives `I(T-v)=(1+z)^2+z=1+3z+z^2`, matching the independent sets of the two-leaf star. It gives `I(T-{v,s})=(1+z)^2` and `I(T-N[s])=1`; at `k=1`, the tagged difference is `(1-2)-(0-1)=-1`, exactly `Delta_1` of those two deletion graphs. This example checks the formula and integer subtraction only; it is not eligible for the primary target and is not offered as a target test.

Selector placement is also consistent: the favorable test is `d_p(I(T-v))<0` for each original leaf separately, whereas the term is `d_{p-1}` on the two other deletion polynomials. The first descent uses `d_j(I(T))` from `j=0` through zero extension; the report does not conflate it with a comparison at a different rank. The arithmetic `k=p-1` is correct. No case in this route has a claimed `a,x,p` or aggregate sum to recalculate.

The identities are realizable: all products arise from the actual components obtained by deleting the support or its closed neighborhood in the given finite tree. Same-support multiplicity is preserved. There is no claimed counterexample or imported theorem, so the standing counterexample controls and a citation-hypothesis bridge are not implicated. No source replay or exhaustive computation was needed or performed.

## Usefulness and limitations

The recurrence is useful as an exact finite-input evaluation scheme, including the full fixed-selector step when all coefficient vectors are retained. The report correctly stops short of a compositional sign invariant: componentwise polynomial multiplication alone does not establish the global compensation inequality. No uniform bound, census, positive full sum, or resolution of the target follows. The recurrence is not shown impossible to augment with a useful finite state; that remains untested.
