# C6-CU-F3 independent critique

## Disposition

**retained_narrowed** for `E993-ORDINARY-PATH-STAR-ARITY-2-12-M100000000-LOWER-REGION-AGGREGATE`. The record supports the exact 121 grouped-factor ULC checks, the stated cutoff scalar, and the displayed graph-to-leaf identities in the two small profiles enumerated here. It does not support the complete infinite-family conclusion on this review record. The claim remains `proposed_open`; this is not a refutation of the underlying family inequality.

## Scope and controls

The assigned statement is exactly the path (0-1-2) with (m\ge 10^8) centers adjacent to (0), branch sizes (r_i\in\{2,\ldots,12\}), and (r_i) private leaves at center (i). It concerns every eligible lower-region rank, the strict selector on original leaves, and the complete sum over the endpoint leaf and all private tips. The source return addresses this identity and cutoff. The construction is a finite ordinary tree for every finite profile, so the family is realizable; it is a useful restricted family result if proved. It gives no arbitrary-tree conclusion and leaves the arity-12 prefix below (10^8) outside scope.

The case packet's four source hashes and the common packet's 237 listed source hashes all matched. I read the required contract, policy, handoff, reconciliation, search allocation and protocol, the C6 critic brief, the current source map, the registered claim identity, and the source-map-listed arity-12 candidate, primary ULC bridge, and wide-arity preparation audit. The cited primary theorem is Gurvits, Theorem 1.1, Definition (2), and Remark 1.2, [arXiv:0804.1181](https://arxiv.org/pdf/0804.1181): it permits ULC order (d\) at least the degree and gives convolution closure with orders added. This bridge is applicable to positive consecutive-support factors once each factor's finite-order inequalities hold; it does not provide the coefficient perturbation estimates or selector transfer.

## Checks completed

I copied the sealed `REPLAY.py` into this scratch directory and ran that copy with the prescribed Python 3.11 executable. It passed all 121 exact grouped products (F_rB_s), (2\le r,s\le12), including the normalized finite-ULC inequalities and the reported least orders. The largest is 962 for ((r,s)=(12,2)), which exceeds the product degree 12 but is permitted by the cited order definition. The replay also reproduces (C=2{,}384{,}960{,}530{,}636) and the exact rational cutoff check (9mC\epsilon<1) at (m=100{,}000{,}000); its decimal value is (0.013328111998270626). This is an endpoint arithmetic check, not by itself the proof that the ratio bounds hold uniformly for every larger (m) and every rank.

I independently constructed the trees for profiles ((2)) and ((2,3)) and enumerated every vertex subset (6 and 10 vertices, respectively). The resulting independence polynomials agree with (P=(1+2z)Q+zL^{N+1}); endpoint deletion agrees with (A_0=LQ+zL^N); the endpoint marked difference agrees with (zL^N); and every distinct private tip's marked difference agrees with its displayed (z[(1+2z)F_{r_i}H_i+L^N]). The checks preserve the (N+1) original leaf tags, including multiple tips at a shared support. These finite checks confirm the formulas on those profiles only.

The candidate's rank and selector route is coherent at the stated symbolic level: α is (N+2); the strict guard gives (p\le\lfloor(2N+4)/3\rfloor); and eligibility gives (x\le p-2). If the claimed first-descent lower bound (x>N/4), central curvature, and positive mixed minors are established for each deletion polynomial and each (Z_i), then descent propagates to (p) for the deletion selector and to (p-2) for each (Z_i). With every original leaf selected, (R=\sum_i r_iZ_i) preserves all tags and the full sum is (\sum_i r_i\Delta_{p-2}(Z_i)). I found no scope mismatch in this chain, but the conditional “if” contains the central proof burden.

## Remaining proof gap

The C6-F3 report itself says it did not independently certify every coefficientwise envelope and shifted-index bound in the global mixed-minor perturbation estimate, and did not formalize the convolution-minor expansion from scratch. The candidate supplies proposed bounds, but this review did not derive all of their coefficientwise dominations and endpoint/index conditions afresh across all profiles, ranks, and (m\ge10^8). Nor did the bounded replay exercise the graph/selector bridge at the enormous cutoff. These are uncompleted checks, not mathematical counterexamples; I found no specific false inequality in them. Since positivity of each central mixed minor and the resulting selector transfer are essential to making every tag favorable and proving the strict full sum, the family theorem cannot be retained as proved on this evidence.

The exact claim therefore remains open at this worker grade. The retained narrower facts and their finite boundaries are in `EVIDENCE.json`, `replay-output.json`, and `graph-formula-check.json`.
