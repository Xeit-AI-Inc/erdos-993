# C5-CT-U1 critique: eligible root-mixture monotonicity

## Dispositions

**C5-U1-ELIGIBLE-ROOT-MIXTURE-MONOTONICITY — retain at the stated universal informal-proof scope.** The proof is valid. For an actual eligible (p), (j=p-2) satisfies (x\le j\le (N-2)/2). In monomial (z)-coefficients,

\[
d[k]=\binom{N+1}{k-1},\qquad \Delta_kd=\binom{N+1}{k}-\binom{N+1}{k-1}>0
\quad(0\le k\le (N-2)/2).
\]

Thus (\Delta_xd>0), and the actual first strict descent gives
\[
\Delta_xC=\Delta_xP-\Delta_xd<0.
\]
The factors have monomial coefficient lists (G=(1,2)), (B_2=(1,3,1)), (B_3=(1,4,3,1)), (B_4=(1,5,6,4,1)). Each is positive on an interval and log-concave (the interior log-concavity gaps are respectively (8), (13,5), and (19,16,10)); convolution preserves these properties. Hence (C[k]>0) on (0\ldots N+1), and its adjacent ratios (C[k+1]/C[k]) are nonincreasing. Since (x\le j\le N-2\), (x,x+1,j,j+1) lie in this support and
\[
\frac{C[j+1]}{C[j]}\le\frac{C[x+1]}{C[x]}<1,
\]
so (\Delta_jC<0). Substitution into the exact minor gives
\[
d[j+1]C[j]-d[j]C[j+1]
=C[j]\Delta_jd-d[j]\Delta_jC>0.
\]
Here (C[j]>0) preserves the positive sign of (\Delta_jd); (d[j]\ge0) and (\Delta_jC<0) make the subtracted term nonnegative (strictly so if (d[j]>0)). Also (C[j]C[j+1]>0), so division preserves the minor's sign and proves strict increase of (d/C). The map (u\mapsto u/(1+u)) is strictly increasing for (u\ge0), giving the claimed mixture-probability increase. No negative multiplier is used to preserve an inequality direction. The proof uses the actual strict first descent and the (2p\le\alpha) guard; the strict (3p<2\alpha+1) guard remains part of the theorem's stated scope but is unnecessary for this lemma. This establishes neither deletion monotonicity nor any selector-weighted payment.

**C5-U1-UNRESTRICTED-ROOT-MIXTURE-COUNTEREXAMPLE — retain as bounded evidence at exactly the unrestricted scope.** Independent integer convolution gives ((a_2,a_3,a_4)=(10,0,0)), (N=20,n=33,\alpha=22,x=11), and at (k=4),
\[
(d_4,d_5,C_4,C_5)=(1330,5985,27315,125586),\quad
d_5C_4-d_4C_5=-3{,}549{,}105<0.
\]
Since (C_4C_5>0), the odds and mixture probability decrease from rank 4 to 5. At (p=6), the current-p strict deletion selectors replay as (e_0=e_i=0) ((\Delta_6A_0=577440), (\Delta_6A_i=567414) for each arity-2 branch), but this rank fails the actual-descent guard: (x+2=13\nleq6). It refutes the all-rank shortcut only, not the guarded lemma or any payment. The independent replay also checks the ((0,12,10)) profile: (N=76,n=101,\alpha=78,x=37,p=39,j=37), with (p=x+2), (2p=\alpha), (3p=117<157), and positive minor
\[
213545270520198687231356881755419118232819740.
\]
This is an exact eligible boundary example, not a proof.

## Independent checks and limits

I verified all 242 common-dispatch and packet-listed member hashes before reading the case. The producer probe was copied into this scratch directory before execution. Independent implementation and saved exact output are [independent_audit.py](cycles/cycle-5/C5-CT-U1/independent_audit.py) and [independent_audit.json](cycles/cycle-5/C5-CT-U1/independent_audit.json). It reproduces both cited profiles, first strict descents, off-window selectors, and the eligible boundary row. In the ((0,0,24)) profile it additionally checks the minor identity at (j=0) (minor (=1)) and at interior (k=24) (minor (=824940404386578781399393693759588012364884500)); these are arithmetic spot checks, not universal evidence. Monomial coefficients were expanded explicitly; no (L=1+z) coefficient list was treated as a (z)-basis list.

Replay from this worker directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 producer_root_mixture_probe.py 10 0 0
PYTHONDONTWRITEBYTECODE=1 python3 producer_root_mixture_probe.py 0 12 10
```

The universal lemma is an informal proof, not a governed formal award. The finite replays are bounded arithmetic checks. The claims concern only the (P=C+z(1+z)^{N+1}) root mixture and the stated unrestricted counterexample; they do not establish a universal deletion LR, selected aggregate, MASS, or exact-ratio payment. Original first descent, strict selectors, and multiplicities are unchanged in the packet's separate payment target.
