# C6-CT-F1 — critique of the T_m cutoff-400 audit

## Disposition

**C6-F1.Tm-cutoff400-audit — retained.** The route claim is deliberately limited to its replayed finite checks, endpoint arithmetic, small graph cross-checks, and citation check. I found no defect in that limited claim. It explicitly withholds confirmation of the complete all-m family theorem and makes no arbitrary-tree inference.

## Independent checks

I verified every packet hash before reading the permitted inputs: all four case pins and all 237 common pins matched. I replayed copies of the route script and pinned ordinary-tree evaluator inside this scratch directory, redirecting the copied script to the copied evaluator. The generated evidence JSON matched the sealed JSON byte-for-byte. This reproduces 242,964 LC margins and 242,964 mixed margins for 3 <= m < 400 and m <= j <= 2m+2, the stated digests, and the minima 1210 at (3,Astar,8) and 1243 at (3,Astar,8). The exact rational checks at m=400 put each of the four stated cutoff quantities below one; R is largest. The route’s finite base and endpoint arithmetic are therefore supported. The executable used was `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3`; no default Python shim was used.

The small-tree checks are appropriately scoped as polynomial identity checks for T_m at m=1,2,3. They are not a graph census and do not establish selector propagation. The report identifies that m=1,2 have no eligible p; these edge cases do not extend the finite central-margin scan.

The citation bridge also checks out at the stated level: Gurvits, Definition (2) and Theorem 1.1, permits a ULC order parameter at least the sequence degree and adds orders under convolution; Saumard–Wellner, Theorem 4.1(b), states closure of ultra-log-concave distributions under convolution. [Gurvits, *A short proof, based on the mixed volume, of Liggett’s theorem on the convolution of ultra-logconcave sequences*](https://arxiv.org/pdf/0804.1181); [Saumard and Wellner, *Log-concavity and strong log-concavity: a review*](https://projecteuclid.org/journals/statistics-surveys/volume-8/issue-none/Log-concavity-and-strong-log-concavity-A-review/10.1214/14-SS107.pdf). This validates the order-parameter objection addressed by the route, not all factor hypotheses or the full application.

## Limits of this disposition

The route does not establish the uniform analytic tail from m=400 onward merely by replaying endpoint fractions. The monotonicity and uniform inequalities in the candidate still require the full written argument. Nor did I independently rederive all large-m mixed-minor neighbor-ratio bounds or the propagation from the central minors through each strict selector to the signed complete family sum. Those are unreviewed proof obligations here, not mathematical counterexamples. The source map identifies the relevant candidate and primary references; no graph, theorem, or relation is being called unavailable.

The known positive T22 local term remains a fence against pointwise nonpositivity, but this source claim does not assert that shortcut. No result in this packet establishes the arbitrary ordinary-tree aggregate or changes its open status.

See [CT-EVIDENCE.json](CT-EVIDENCE.json) for replay figures and exact scope.
