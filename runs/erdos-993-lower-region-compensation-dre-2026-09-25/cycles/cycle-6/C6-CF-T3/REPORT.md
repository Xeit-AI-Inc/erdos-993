# C6-CF-T3 critique

## Disposition

**Retained** the exact C6-T3 family claim at its stated scope: for the path-plus-private-star trees with every branch arity in `2..12`, at least `100,000,000` branches, and every eligible strict-lower-region rank, the complete original favorable-leaf sum is strictly negative. I found no mathematical defect in the proof route or its scope. This is a proposed worker disposition only; the proof is informal and does not provide a family Lean certificate.

The source claim is exactly `E993-ORDINARY-PATH-STAR-ARITY-2-12-M100000000-LOWER-REGION-AGGREGATE`. The eligible set remains the original fixed selector `F(T,p)={v original leaf: Delta_p(T-v)<0}`. The claim keeps every private tip as a distinct tag, including tips sharing a center; it does not assert an arbitrary-tree result or cover the finite prefix below the branch cutoff.

## Audit of graph, tags, and rank guards

For `N=sum_i r_i` and `L=1+z`, the root split at vertex 0 gives

`P=(1+2z)Q+zL^(N+1)`, where `Q=prod_i B_(r_i)` and `B_r=L^r+z`.

The same split after deleting endpoint 2 or a private tip gives the route's `A_0` and `A_i` polynomials. For a tip on branch `i`, subtracting the closed-neighborhood deletion polynomial from the support-and-tip deletion polynomial gives

`q_v=z[(1+2z)F_(r_i)H_i+L^N]`,

where `H_i=prod_(h!=i) B_(r_h)` and `F_r=(L^(r-1)-1)/z`. Endpoint 2 contributes `zL^N`. Summing all original tags therefore gives `zR`, with

`R=sum_i r_i Z_i`, `Z_i=(1+2z)F_(r_i)H_i+((N+1)/N)L^N`.

This counts each tip separately and the endpoint once. The graph has `n=N+m+3`, `alpha=N+2`, and original leaves precisely endpoint 2 and the `N` private tips. Splitting on whether the root belongs to an independent set verifies `alpha`: including the root allows all tips and endpoint 2, while excluding it allows at most the tips and one of path vertices 1 and 2.

The guards are propagated correctly. The pinned forest bound gives `n<=4x` at the first strict descent, hence `x>N/4` since `n>N`. The strict alpha guard gives `p<=floor((2N+4)/3)`, and eligibility gives `x<=p-2`. Thus the crossing and propagation ranks used in the candidate lie in its claimed central interval. Strict descent at `x` transfers through the correctly oriented mixed minor (the ratio of a deletion or marked polynomial to `P` is nonincreasing); central log-concavity then carries strict descent through the eligible target rank. This establishes the full selector rather than only a favorable subcollection: endpoint deletion and every individual tip deletion are favorable, and every term in the stated aggregate is included.

## Factor, cutoff, and theorem checks

I copied the sealed replay into this worker directory and ran it with the specified Python 3.11 executable. It reconstructed the 121 `F_r B_s` coefficient sequences, checked every normalized finite-ULC inequality at its recorded order, and reproduced the route evidence digest. The maximum recorded order, 962 for `(r,s)=(12,2)`, exceeds the product degree; Gurvits’s definition permits this. The primary paper defines ULC order `d` for sequence degree at most `d` and Theorem 1.1 proves convolution closure with the orders added. Its Remark 1.2 covers the positive-sequence case used here. See [Gurvits, Theorem 1.1 and Remark 1.2](https://arxiv.org/pdf/0804.1181).

The separate exact cutoff replay gives `C=2,384,960,530,636` and `9mC epsilon = 0.013328111998270626... < 1` at `m=100,000,000`. The displayed bound improves for larger `m`: `m/(m-17)^17` decreases and both `A` and `B` increase. The power exponents, falling-factorial comparison, and use of the lower profile bound `N>=2m` are consistent with the stated range. The resulting margin controls both the central log-concavity adverse terms and the mixed-minor perturbation terms. The finite factor table is being used only for those 121 bounded factors; the infinite-profile conclusion comes from the uniform cutoff inequality, not from a finite profile census.

For the second imported ingredient, the exact pinned R27 declaration assumes finiteness, acyclicity, and `Delta_k<0`, and concludes `Nat.card X<=4k`. The candidate applies it to the finite tree at `k=x`; the conversion to `x>N/4` is valid. No no-recovery conclusion is inferred from that order bound.

## Evidence grade and limitations

`independent_replay.py` is the route replay copied into this worker directory; `EVIDENCE.json` is its generated output. `AUDIT.json` records the pin and replay checks. All 4 case pins and all 237 common pins matched.

The proof remains an informal mathematical proof with an external convolution theorem and a pinned formal forest-order theorem in its dependency chain. No kernel certificate for the family theorem was checked or claimed. The result covers only the stated path-plus-private-star family, arities `2..12`, `m>=100,000,000`, and eligible ranks. It leaves the prefix below the cutoff and the arbitrary-tree primary untouched. This is not a mathematical defect in the exact restricted claim.
