# C6-CF-T1 independent critique (orientation F)

## Dispositions

### C6-T1-TM-CUTOFF400 — retained_narrowed

The family conclusion is supported for the explicitly defined ordinary trees (T_m), (m\ge1), and exactly the stated selector and strict lower-region eligibility conditions. This review makes no inference for arbitrary ordinary trees. The result needs two local corrections in the route write-up: with (q_v(j)=[z^j](I(H_v)-I(R_v))), the contract summand is (q_v(p)-q_v(p-1)), not (q_v(p-1)-q_v(p-2)); and the reported final sum is nevertheless correctly (R_{p-1}-R_{p-2}), since \(\sum_v q_v=zR\). The summand line should be corrected before admission. This is an indexing error in the explanation, not a counterexample.

The graph bridge checks out. The graph has order (4m+3), independence polynomial
\[
P=(1+2z)B^m+z(1+z)^{3m+1},\quad B=1+4z+3z^2+z^3,\quad \alpha=3m+2.
\]
Deleting the endpoint leaf gives (A_0=(1+z)B^m+z(1+z)^{3m}); deleting any fixed private leaf gives (A_*=(1+2z)(1+3z+z^2)B^{m-1}+z(1+z)^{3m}). Each private leaf remains a separate tag. The tagged differences sum to (zR), where
\[
R=3m(2+5z+2z^2)B^{m-1}+(3m+1)(1+z)^{3m}.
\]
The endpoint support and private-center closed neighborhoods give these formulas with the original tree neighborhoods. My tree-DP replay for (3\le m\le6) recomputed every tag and every eligible row; all selectors contained all (3m+1) original leaves, and each direct aggregate equaled (R_{p-1}-R_{p-2}). This bounded check is corroboration only.

The direct descent estimate is valid after correcting a displayed coefficient vector. For (G=1+2z), (G'=2\) and \((2/3)(G-zG')=2/3\), whose coefficient vector is \((2/3,0)\), not the route's \((2/3,2/3)\). The coefficientwise inequality and product-rule estimate still hold with the corrected vector. Together with the separate root-included binomial term, this proves \(\Delta_j(T_m)>0\) for (0\le j\le m\), (m\ge2\), hence (x\ge m+1\). The exact (m=1,2) rows have no eligible (p).

For (m\ge400), the route's central estimates have the correct ranges and signs: factorwise derivative inequalities give the stated neighbor caps; the (h=17) term in (B^{m-1}=( (1+z)^3+z)^{m-1}) supplies the coefficient lower bound on (m\le j\le2m+2); the falling-factorial ratio decreases across that interval; and the endpoint estimate gives (E(m)). The normalized factors in (E(m)=K(m)/m^{17}) make the cutoff expression decrease for (m\ge400). The four recorded strict cutoff ratios are below one; the largest is (0.14122160715426396\). The Poisson-ULC minor lower bound, the three perturbation constants, and the mixed-minor orientation then provide strict central log-concavity and strict mixed minors for (A_0,A_*,R). The exact finite replay independently reproduces all 242,964 checks of each kind for (3\le m<400\), with minima 1210 and 1243 and matching hashes in [CUTOFF400-REPLAY.json](CUTOFF400-REPLAY.json).

The ULC import is accurately scoped. Gurvits, [“A short, based on the mixed volume, proof of Liggett's theorem on the convolution of ultra-logconcave sequences”](https://arxiv.org/abs/0804.1181), Definition (2), Theorem 1.1, and Remark 1.2, permits normalization order at least the degree and adds orders under convolution. The factors used here have positive interval support and strict interior Poisson inequalities; choosing sufficiently large finite orders and taking the coefficientwise limit supplies the claimed Poisson-ULC closure. This is an informal mathematical bridge, not a Lean or kernel certificate.

At an eligible (p), (p\le2m+1), while (m+1\le x\le p-2\). The mixed minors at (j=x) transfer the strict first descent of (P) to (A_0,A_*,R). Central log-concavity propagates the (A_0,A_*) descent through rank (p), so every original leaf is in the fixed selector. For (R), it propagates through rank (p-2), giving (R_{p-1}<R_{p-2}). With the corrected summand identity, the full selected sum is therefore strictly negative.

### C6-T1-TM-DIRECT-FIRST-DESCENT — retained_narrowed

Retain the exact statement (x(T_m)\ge m+1) for (m\ge2), independently of R27; (m=1) remains the separately computed ineligible case. The one vector typo described above must be corrected in the derivation. The corrected coefficientwise inequalities imply
\[
(j+1)M_{j+1}\ge \tfrac23(3m+1-j)M_j,\quad M=(1+2z)B^m,
\]
whose ratio exceeds one for (0\le j\le m\), (m\ge2\). The other summand (z(1+z)^{3m+1}) increases across the same indices, so the sum does too.

## Evidence and limits

- All 241 hashes listed by the case and common packets matched before review.
- [cutoff400_audit.py](cutoff400_audit.py) is a scratch copy of the case replay; [CUTOFF400-REPLAY.json](CUTOFF400-REPLAY.json) is its reproduced exact output.
- [small_graph_replay.py](small_graph_replay.py) uses a scratch copy of the authorized checked tree evaluator; [SMALL-GRAPH-EVIDENCE.json](SMALL-GRAPH-EVIDENCE.json) records its bounded graph checks.
- The finite base is exact computation with the stated generation boundary, not kernel checked. The ULC convolution and limit argument is informal. The result concerns only this (T_m) family and does not resolve the arbitrary-tree lower-region aggregate.

The two identified write-up errors are correctable and do not refute either family claim. This review proposes the corrected, family-only statements above; the controller retains status authority.
