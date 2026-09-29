# C6-T2 bounded-prefix result

## Scope

This is an exact finite check of the C6 tip-surplus predicate

\[
S_r(k)=(h+1)U_r[k]C[k]+(k+1)(h-k+1)\big(E[k]C[k]-E[k+1]C[k-1]\big)\ge 0,
\]

for every count triple \((a_2,a_3,a_4)\) with \(1\le m=a_2+a_3+a_4\le99\), every represented \(r\in\{2,3,4\}\), and every integer \(1\le k\le\lfloor(N+2)/2\rfloor\). Here \(N=2a_2+3a_3+4a_4\), \(h=1+2a_2+4a_3+7a_4\), \(B_r=(1+z)^r+z\), \(Q=\prod B_r^{a_r}\), \(C=(1+2z)Q\), \(E=z(1+z)^N\), and \(U_r=(1+2z)B_{r-1}Q/B_r\). Coefficients are integer and zero-extended. There is no actual-descent or deletion-eligibility filter.

## Method and frozen inputs

Instrument A uses explicit monomial integer arrays for products. For each represented arity it computes the cofactor by the exact recurrence

\[
H[0]=Q[0],\qquad H[k]=Q[k]-\sum_{j=1}^{r} [z^j]B_r\,H[k-j],
\]

then reconstructs \(B_rH=Q\) coefficient by coefficient. It forms \(U_r=(1+2z)B_{r-1}H\), and evaluates the displayed signed integer directly. The literal factor \(B_1=1+2z\) is retained. No floating-point arithmetic or profile exclusion is used.

The final source was frozen before the full run. Source SHA-256 is `4af03154bc71bbfbdd6e638e1570b3cc512ddcb8934d23bca9efb5de2b8d8842`; the copied shared runner hash is `f188a54eeca2e0b1c0b487c665a82cb6a97ca05e44b2638e36393017c17a8bd7`. The protocol hash is `a17ba0bcd412765b7dc1a91b283df816f41ad5173047067c94661d6991aff4ba`, and the expected-count table hash is `e5de145a9c6872352a2a2b51d92a82a7d70745b2adf18a09e2dde66f4729ab6f`. All 275 members of `manifests/C6-COMMON-DISPATCH.json` were present and matched their manifest hashes; the packet listed no additional case sources.

The small source-development run on \(m=1\ldots3\) is retained in `cycles/cycle-6/C6-T2/dev-small.json` and `cycles/cycle-6/C6-T2/dev-small-checkpoints/`; it is separate from the final run. Replay the complete frozen computation from the repository root with a fresh output directory using:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-T2/C6-PREFIX-RUNNER.py cycles/cycle-6/C6-T2/prefix_A.py cycles/cycle-6/C6-T2/run-replay --min-m 1 --max-m 99 --timeout 1800
```

The retained invocation used Python 3.11.2 on macOS arm64 and completed in 695.6 seconds. Its receipt records exit code 0, no timeout, unchanged original/frozen source hashes, and the result hash. Atomic per-\(m\) checkpoints are retained beside the aggregate result. The three control cases are replayed independently by direct literal factor products (without the instrument's cofactor division) via:

```sh
cd cycles/cycle-6/C6-T2 && PYTHONDONTWRITEBYTECODE=1 python3 control_replay.py
```

## Coverage and result

Every per-\(m\) profile and represented-tip/rank count matched the sealed expected-count table. The complete totals are 171,699 profiles and 56,245,000 represented-tip/rank rows. There were no negative rows. The minimum signed surplus over the entire bounded domain is 98, attained at \((a_2,a_3,a_4)=(1,0,0)\), \(N=2,h=3,r=2,k=1\). Its exact coefficients are

\[
U_2[1]=4,\quad U_2[2]=4,\quad C[1]=5,\quad C[0]=1,\quad E[1]=1,\quad E[2]=2,
\]

so \(S_2(1)=4\cdot4\cdot5+2\cdot3\cdot(1\cdot5-2\cdot1)=98\). The corresponding full tip minor is \((U_2[1]+E[1])C[1]-(U_2[2]+E[2])C[0]=19\). This is the complete attaining coefficient witness; it is also stored in the \(m=1\) row of `cycles/cycle-6/C6-T2/run-full/RESULT.json`.

The required controls reproduce as follows:

| Control | Exact result | Scope note |
|---|---:|---|
| \(n=91\), counts \((0,22,0)\), \(r=3,k=27\) | Isolated \(E\) minor \(-518620474811633289768751398606375936\); full tip minor \(+777419068009671422357461955841645743808\) | An \(E\)-only failure is not a full-tip failure. |
| \(n=122\), counts \((38,0,1)\), \(r=4,k=77\) | Full tip minor \(-49239834336\) | The guarded maximum is 41, so this rank is outside the protocol domain. |
| \(m=1\), counts \((1,0,0)\), \(r=2,k=1\) | Surplus \(+98\) | Required small positive control and global bounded minimum. |

The exact control coefficient values are in `cycles/cycle-6/C6-T2/controls.json`. The full aggregate and every per-\(m\) minimum witness are in `cycles/cycle-6/C6-T2/run-full/RESULT.json` and `cycles/cycle-6/C6-T2/run-full/RESULT-checkpoints/`.

## Evidence grade and limits

This is bounded exact computation on \(m=1\ldots99\). It independently fills the finite prefix for this stronger tip-surplus predicate, with full profile/rank coverage and exact arithmetic. It does not establish any \(m\ge100\) result, the all-\(m\) surplus theorem, the endpoint comparison, the registered all-\(m\) individual or weighted comparisons, selected MASS, the exact-ratio payment, the primary aggregate, or any arbitrary-tree statement. In particular, finite success is not a universal proof or a Lean award. The C6 tail and its analytic dependencies were not certified by this finite computation.
