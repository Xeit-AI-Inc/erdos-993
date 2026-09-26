# C5-F1 independent critique (orientation T)

## Disposition: retained_narrowed

Claim `C5-F1-TM-CENTRAL-SURVIVAL` is retained only as a bounded exact result for the displayed family with `1 <= m <= 999` and every eligible rank. The producer's all-`m` family conclusion is not independently established here. This disposition does not affect the general lower-region aggregate, which remains outside the claim's scope and OPEN.

## Independent checks

I verified the case and common packet pins: all 241 listed files matched their SHA-256 values. I copied the exact case-listed `CHECK.py` into this worker directory and ran only that copy. The replay reproduced 1,507,464 strict log-concavity checks and 1,507,464 strict mixed-minor checks for `3 <= m <= 999`, with the source digests and minima reproduced exactly. The same replay checked 276,938 eligible rows for `1 <= m <= 999`; both original-leaf orbit selectors and the full tagged sum passed with zero failures. For `m=1,2` there are no eligible rows. Exact replay output is in `REPLAY-OUTPUT.txt`.

The graph-to-polynomial split is consistent with the stated tree. Put `B=1+4z+3z^2+z^3` and `L=1+z`. Splitting on the path root `r` gives

- `I(T_m)=(1+2z)B^m+zL^(3m+1)`;
- deleting path leaf `a` gives `LB^m+zL^(3m)`;
- deleting a private leaf gives `(1+2z)(1+3z+z^2)B^(m-1)+zL^(3m)`.

The path-leaf tag contributes `zL^(3m)` to the sum of `q_v`. For each of the `3m` private-leaf tags, deleting that leaf and its center, then subtracting deletion of the center's closed neighborhood, gives `z(2+5z+2z^2)B^(m-1)+zL^(3m)`. Thus the stated sum of tagged differences is

`zR(z)`, where `R=3m(2+5z+2z^2)B^(m-1)+(3m+1)L^(3m)`.

When the orbit selectors are favorable, the complete primary sum is `S(T_m,p)=R_(p-1)-R_(p-2)`; the replay checks the strict selector values and this complete sum, not just an individual tag.

## Why the scope is narrowed

The case report states an analytic proof for all `m >= 1000` based on factor ULC, derivative coefficient bounds, perturbation estimates, mixed-minor expansions and rational cutoffs. The return evidence gives selected endpoint ratios and the finite-base digests, but I did not independently rederive every uniform-in-`m,j` estimate or the claimed monotonicity from those ingredients. The selector transfer also invokes a forest descent bound `n <= 4x`; the route names this as registered but does not supply its proof or a precise primary citation and hypothesis bridge in the case files. The pinned handoff signals that result, but a signal in the handoff is not an independent proof audit. Accordingly, I do not carry the conclusion to `m >= 1000` or all `m`.

This is an evidence-grade limitation, not a counterexample to the large-`m` argument. The finite computation is exact integer arithmetic outside a proof kernel. No conclusion follows for arbitrary ordinary trees, for the general primary aggregate, or for the optional auxiliary identity. Existing refutation fences are not changed.
