# C4-CU-T4 independent critique of C4-T4

## Dispositions

- **C4-T4-RELATIVE-CHAIN-IDENTITY — retained.** The identity is correct on the stated finite ordinary-tree domain with the fixed favorable set. For each selected original leaf, the independent sets counted by `i_j(H_v)-i_j(R_v)` are exactly those meeting `W_v`. The summand is `Delta_k(H_v)-Delta_k(R_v)=q_v(k+1)-q_v(k)`, and summing over the same tags gives `S=dim K_(k+1)-dim K_k`, where `k=p-1` and `k+1=p`. This includes distinct leaves sharing a support. Eligibility gives `p>=2`, so these ranks are in the ordinary range; no selector is recomputed during the sum.

- **C4-T4-CROSS-TAG-INJECTIVITY-BRIDGE — retained_narrowed.** The displayed rule defines a linear map: retained terms stay valid in their source block, transferred terms are admitted only after checking the new tag's `H_w` and `W_w` conditions, and a fixed leaf order resolves multiple eligible destinations. If this map is injective, finite-dimensional linear algebra yields `dim K_p<=dim K_(p-1)` and proves the target. The universal injectivity assertion itself is unsupported. Deletions from different tagged faces may collide, and signs may cancel; a nonzero image for every basis vector is not enough. The route contains no full-rank minor, matching, kernel analysis, or other proof. Noninjectivity, if found, would only defeat this sufficient mechanism and would not refute the aggregate. The retained statement is therefore only the well-defined conditional bridge, not a proved universal property.

## Scope and controls

The review checks the exact selector `Delta_p(T-v)<0` over original leaves, original supports and neighborhoods, the strict guards `x(T)+2<=p` and `3p<2a+1`, and a fixed `F` across all ranks. `x` is defined using zero extension; the argument does not need any stronger claim about the shape of the difference sequence. The relative-chain calculation is algebraic and does not rely on a graph-specific counting approximation. No positive full sum, new counterexample, or bounded census is supplied. The earlier T22 local down-map obstruction concerns another map and is not evidence against this cross-tag operator.

## Evidence and limitations

The packet-listed source hashes were verified (3 case files; 179 common files; no mismatches). I independently expanded the summand identity and checked both branches of the tag rule. I did not replay the producer, perform an exhaustive rank computation, or use an imported theorem. The map's universal injectivity and the primary lower-region aggregate remain unresolved by this route.
