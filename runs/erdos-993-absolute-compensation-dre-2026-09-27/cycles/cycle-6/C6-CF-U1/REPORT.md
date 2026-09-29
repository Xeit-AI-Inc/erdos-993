# C6-CF-U1 critique report

## Disposition

**C6-U1-ARITY2-MIDPOINT-E-MINOR — proposed retained at the stated component/rank scope.** I found no algebraic or sign error in the claim. The proof below is universal in (m\ge1); the accompanying script is only an independent finite arithmetic cross-check.

## Proof audit

Let (Q(z)=(1+3z+z^2)^m=\sum Q_s z^s), (C=(1+2z)Q), and (E=z(1+z)^{2m}). At (k=m+1),

\[
E[k]=\binom{2m}{m},\qquad E[k+1]=\binom{2m}{m+1}=\frac m{m+1}\binom{2m}{m}.
\]

Because (Q) is palindromic of degree (2m), (Q_{m+1}=Q_{m-1}). Coefficient multiplication by (1+2z) gives (C[m+1]=Q[m-1]+2Q[m]) and (C[m]=Q[m]+2Q[m-1]). Therefore direct substitution yields

\[
\frac{E[m+1]C[m+1]-E[m+2]C[m]}{\binom{2m}{m}}
=\frac{(m+2)Q[m]-(m-1)Q[m-1]}{m+1}.
\]

Each factor (1+3z+z^2) has positive interval support and is log-concave ((3^2\ge1\cdot1)); convolution preserves these properties, so (Q) is positive and log-concave. For a positive log-concave sequence its successive ratios decrease. Palindromy gives (Q[m+1]/Q[m]=Q[m-1]/Q[m]), so the decreasing-ratio property across the center implies (Q[m]/Q[m-1]\ge1). Thus (Q[m]\ge Q[m-1]>0), and the numerator can be written

\[
3Q[m]+(m-1)(Q[m]-Q[m-1])>0.
\]

The denominator (m+1) and the binomial normalizer are positive, so the sign is preserved. The rank is the outer guarded boundary: (2k=2m+2=N+2). This proves strict positivity at this rank for every (m\ge1).

## Independent exact check

`midpoint_check.py` builds monomial-(z) coefficient arrays from integer convolution (not coefficients in powers of (L=1+z)) and cross-multiplies the displayed rational identity against the direct minor. Replay with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 midpoint_check.py
```

It reports (M_{m+1}(E)=9,76,825,10332,141582,2062104,31380921,493621700) for (m=1,\ldots,8), respectively. This is a bounded check, not the universal proof.

## Scope and limits

The result concerns only the (E)-component (E[k]C[k]-E[k+1]C[k-1]), for homogeneous arity-2 profiles and rank (k=m+1). It uses no actual first descent (x), eligibility guards (x+2\le p,\ 3p<2\alpha+1,\ 2p\le\alpha), or current-(p) strict selectors (e_0,e_i); it retains no original-tag multiplicities (r_i) in a selected sum. Consequently it proves neither the other guarded ranks nor mixed profiles nor the exact-ratio selected payment, selected MASS, or aggregate. The known E-only negative control lies outside this claim's profile/rank scope. The optional broader low-rank extension in the structural-base draft is not needed for this disposition and is not promoted here.

## Input integrity and grade

I verified SHA-256 bytes for all 275 members of `manifests/C6-COMMON-DISPATCH.json` and both packet-authorized files (`cycles/cycle-6/C6-U1/REPORT.md` and `RETURN.json`); every listed hash matched. No producer script, census, Lean build, or source edit was used. The universal component lemma has an informal proof; script outputs are bounded exact evidence only. The primary and MASS remain outside this disposition and this worker has no status authority.
