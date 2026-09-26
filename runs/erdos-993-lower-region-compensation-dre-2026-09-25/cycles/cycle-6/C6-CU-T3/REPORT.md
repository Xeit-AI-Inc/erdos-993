# C6-CU-T3 independent critique — C6-T3

## Disposition

**Retained, narrowed to the pooled-tag argument; proposed status: open.** The one assigned claim is
`E993-ORDINARY-PATH-STAR-ARITY-2-12-M100000000-LOWER-REGION-AGGREGATE`.

The stated path-plus-private-stars result has no counterexample in this review. The graph is a finite ordinary tree with the claimed vertex count and independence number. The complete selected aggregate is correctly represented by the weighted sum of the `Z_i` sequences, provided the endpoint tag is spread across the private-tip tags only after summing. The route's *individual* tip identity as written is false: for a tip on branch `i`, direct deletion gives

`q_tip(z) = z[(1+2z) F_(r_i) H_i + L^N]`,

not `z Z_i` with `Z_i=(1+2z)F_(r_i)H_i+((N+1)/N)L^N`. The endpoint tag is `q_2(z)=zL^N`. Their pooled sum is nevertheless exactly

`sum_v q_v(z) = z[sum_i r_i (1+2z)F_(r_i)H_i + (N+1)L^N] = z sum_i r_i Z_i(z)`.

Thus this correction does not change the claimed full-sum identity or the proposed negativity argument: proving `Z_i(p-1)-Z_i(p-2)<0` for each branch implies negativity of the pooled weighted sum. The selector itself is checked using the deletion polynomials `A_0,A_i`, not the misattributed per-tip `q_v` identity. Direct exact enumeration on profiles `(2,3)` and `(4,2,2)` confirms the graph polynomial, endpoint deletion, every tip's corrected tag polynomial, and the pooled identity; see `DIRECT-GRAPH-CHECKS.json` and its replay script.

## Proof and scope audit

- **Graph and domain.** For the displayed construction, there are `N+m+3` vertices and `N+m+2` edges. It is connected and acyclic by construction. Splitting on whether vertex 0 is selected gives `P=(1+2z)Q+zL^(N+1)` and `alpha=N+2`; deleting endpoint 2 gives `A_0=LQ+zL^N`, and deleting any tip on branch `i` gives `A_i=(1+2z)B_(r_i-1)H_i+zL^N`. The small exact enumerations independently match these identities. The family and `m>=100000000` restriction are carried without extension to the finite prefix or arbitrary trees.
- **Ranks and selector.** The imported forest bound applies to a finite acyclic graph at a rank with negative first difference and yields `n<=4x`; here this gives `x>N/4`. The strict guard gives `3p<=2N+4`, and eligibility gives `x<=p-2`. Those inequalities place the crossing and target ranks in the claimed central interval. The argument then needs the claimed positive mixed minors to transfer the strict descent at `x` to each deletion and each `Z_i`, and central log-concavity to carry it to `p` or `p-2`. I found no rank-index or selector mismatch in that chain.
- **Arithmetic.** Replaying the sealed script from a scratch copy reproduced all 121 `(r,s)` finite ULC checks, the row digest, the derivative and coefficient-ratio checks, and the cutoff scalar `9mC epsilon = 0.013328111998270626... < 1` at the cutoff. The monotonicity direction for larger `m` is consistent with the displayed factors. This is an exact replay of those checks, not a profile or graph census.
- **Imported results.** The pinned ULC bridge states Gurvits Definition (2), Theorem 1.1 and Remark 1.2, including order at least degree and convolution closure; the candidate uses factors with positive consecutive support. The pinned `forest_descent_linear_bound` contract has finite type, acyclicity, and negative-difference hypotheses, matching this tree at `x`. Neither import supplies the family's coefficient estimates.
- **Remaining review limit.** I did not independently rederive every inequality in the uniform perturbation and mixed-minor estimates (in particular the complete envelope-to-constant bound `C=2384960530636` across every central rank/profile). The route's script verifies its finite factor table and cutoff scalar but not those entire symbolic bridges. Accordingly this critique does not certify the large-family theorem as proved. This is an incomplete proof audit, not a mathematical counterexample.

## Evidence and limitations

Evidence is local to this worker directory: `EVIDENCE.json` is the result of replaying a copy of C6-T3's replay script; `DIRECT-GRAPH-CHECKS.json` records the two independent small-tree checks. No sealed source was modified. Hashes for all 241 source files listed in the case and common packets matched before review. No Lean build or background process was run.

The conclusion is limited to the proposed family claim and the checks above. The central mixed-minor and perturbation estimates remain incompletely audited here; the status is proposed open. No arbitrary-tree conclusion, counterexample, or authority award is made.
