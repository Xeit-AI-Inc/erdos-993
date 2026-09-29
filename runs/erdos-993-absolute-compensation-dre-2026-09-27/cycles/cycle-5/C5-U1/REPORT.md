# C5-U1 search report: eligible-rank root-mixture bridge

## Result

Let the ordinary profile have (m\ge1), (r_i\in\{2,3,4\}), (N=\sum_i r_i), (q=N+1), (\alpha=N+2), and use the contract polynomials (C=G\prod_i B_{r_i}), (d=zL^q), (P=C+d). Let (x=\min\{k\in\mathbb N:\Delta_kP<0\}), with zero-extended coefficients. For every actual eligible lower-half (p), including all three guards

\[
 x+2\le p,\qquad 3p<2\alpha+1,\qquad 2p\le\alpha,
\]

put (j=p-2). Then

\[
 d[j+1]C[j]-d[j]C[j+1]>0.
\]

Equivalently, the root-state odds (d[j]/C[j]), and hence its mixture probability (d[j]/(C[j]+d[j])), strictly increase from rank (j) to (j+1) throughout the actual eligible interval. This is an all-profile informal proof, not a payment or deletion theorem.

**Proof.** From (2p\le N+2) and (j=p-2), (j\le(N-2)/2); also (x\le j). Since (d[k]=\binom{N+1}{k-1}) with zero extension, 
\[
\Delta_kd=\binom{N+1}{k}-\binom{N+1}{k-1}>0
\]
for every (0\le k\le(N-2)/2). In particular (Delta_xd>0). The actual first strict descent gives (Delta_xP<0), so (Delta_xC=\Delta_xP-\Delta_xd<0).

Each factor (G,B_2,B_3,B_4) has positive interval support and is log-concave; convolution preserves these properties. Thus (C) has positive interval support and decreasing adjacent coefficient ratios. From (Delta_xC<0), its adjacent ratios are below one at (x) and remain below one for every (k\ge x) in the support. Consequently (Delta_jC<0). Finally,
\[
 d[j+1]C[j]-d[j]C[j+1]
 = (\Delta_jd)C[j]-d[j]\Delta_jC>0,
\]
using (C[j]>0), (d[j]\ge0), (Delta_jd>0), and (Delta_jC<0). The map (u\mapsto u/(1+u)) is strictly increasing for (u\ge0), proving the probability formulation. The strict (3p<2\alpha+1) guard is retained in the theorem statement but is not needed in this proof.

## Obstruction and exact replay

The shortcut “root mixture weight is increasing at every rank” is false. An independently implemented exact polynomial replay for ((a_2,a_3,a_4)=(10,0,0)) has (N=20,n=33,\alpha=22,x=11). At (k=4),

\[
(d[k],d[k+1],C[k],C[k+1])=(1330,5985,27315,125586),
\]

so the signed minor (d[k+1]C[k]-d[k]C[k+1]=-3{,}549{,}105). The corresponding (p=k+2=6) satisfies (3p<2\alpha+1) and (2p\le\alpha), but fails the actual descent guard (x+2\le p) (13\(\nleq\)6). Its current-(p) strict selectors are (e_0=0) and (e_i=0) for every arity-2 branch ((\Delta_pA_0=577440), (\Delta_pA_i=567414)). Thus this is only an obstruction to unrestricted mixture monotonicity; it is not a guarded witness.

A separate exact replay at ((a_2,a_3,a_4)=(0,12,10)) gives (N=76,n=101,\alpha=78,x=37). Its eligible rank (p=39) has (j=37), satisfies (x+2=39\le p), (3p=117<157=2\alpha+1), (2p=78\le\alpha), and the root-mixture minor is (213545270520198687231356881755419118232819740>0). This is illustrative bounded replay; the preceding argument supplies the universal result.

Replay commands (run from this worker directory):

```sh
PYTHONDONTWRITEBYTECODE=1 python3 root_mixture_probe.py 10 0 0
PYTHONDONTWRITEBYTECODE=1 python3 root_mixture_probe.py 0 12 10
```

Outputs are retained in `root_mixture_r2m10.json` and `root_mixture_actual_rank.json`. The script computes integer polynomials by convolution and evaluates the first strict descent, the exact mixture minors, actual-rank guards, and strict selectors at the off-window comparison rank.

## Scope and status boundary

Targeted registry lookup found distinct OPEN lower-half individual and original-multiplicity weighted-tip-deck shifted-(C) comparisons, and the shared root-mixture negative control. This report proposes the additional conditional root-mixture lemma under a worker-local key; it does not dispose of any existing identity. The lemma concerns only the decomposition (P=C+d) at ranks admitted by the actual first descent and rank guards. It gives no sign for (A_0) or (A_i), does not modify the current-(p) strict selectors, and makes no conclusion about original tag multiplicities, selected (S), MASS, or the exact-ratio payment. The primary and stronger MASS identities retain their sealed status/scope.

The exact polynomial examples are finite evidence only. The universal statement above is an informal proof from the displayed binomial, first-descent, and log-concavity arguments; there is no Lean award or governed verification in this search report.
