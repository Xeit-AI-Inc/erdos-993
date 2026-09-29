# C5-CU-T3 critique: ULC exact-ratio tip surplus

## Disposition

The required claim `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS` remains **open** at this review. Its formulation is a valid sufficient condition for the guarded full tip comparison when combined with the already established enlarged-order ULC curvature bound and main-product likelihood-ratio comparison. I found no guarded counterexample, but the universal exact-ratio compensation is not proved by the supplied argument or finite evidence.

## Claim and implication checked

For every ordinary profile with (m\ge1), (r_i\in\{2,3,4\}), define (N=\sum_i r_i), (a_r=\#\{i:r_i=r\}), (h=1+2a_2+4a_3+7a_4), (C=(1+2z)\prod_i B_{r_i}), (E=z(1+z)^N), and (U_i=(1+2z)B_{r_i-1}\prod_{\ell\ne i}B_{r_\ell}), with (B_r=(1+z)^r+z). For every represented tip branch (i) and integer-zero-extended coefficients, the disputed universal assertion is

\[
 (h+1)U_i[k]C[k]+(k+1)(h-k+1)\big(E[k]C[k]-E[k+1]C[k-1]\big)\ge0
\]

for all natural (k\) satisfying (1\le k\) and (2k\le N+2). It has no actual-eligibility premise. This does not include the endpoint deletion (A_0), nor does it itself assert the full selected payment.

The sufficiency reduction checks out, conditional on its stated inputs. Write (M_U=U_i[k]C[k]-U_i[k+1]C[k-1]), (M_E=E[k]C[k]-E[k+1]C[k-1]), and (D=(k+1)(h-k+1)). The established main-product LR gives (U_i[k+1]/C[k+1]\le U_i[k]/C[k]); ULC of (C) of order (h) gives

\[
\frac{C[k-1]C[k+1]}{C[k]^2}\le\frac{k(h-k)}{(k+1)(h-k+1)}.
\]

Thus (M_U\ge \frac{h+1}{D}U_i[k]C[k]). Here (h\ge N+1\), (k\ge1\), and (2k\le N+2\), so (D>0) and all divisions preserve order. Since the full tip minor is (M_U+M_E), the disputed inequality is exactly a sufficient lower bound for (D(M_U+M_E)\ge0). This argument preserves the full guarded band, rather than silently adding actual eligibility.

The missing step is a proof that the displayed exact-ratio expression is nonnegative for every profile, represented tip, and guarded rank. The known criterion (217(j+1)\epsilon<1) in `sources/predecessor/hybrid-family-proof.md` is a distinct tail certificate: it controls deletion and endpoint perturbations in its large-(m\) band. No implication from that criterion to this exact-ratio inequality is established. A universal proof of the new inequality would give a tip comparison across its full guarded band, but would still need separate endpoint treatment and the existing selector/first-descent bridge before it could yield a selected payment.

## Exact checks and controls

I verified all 237 common-dispatch member bytes and all eight packet-source bytes against their SHA-256 manifests; there were no mismatches. I copied the two producer scripts into this scratch before executing them, with bytecode generation disabled. Replay commands, from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_surplus.py
PYTHONDONTWRITEBYTECODE=1 python3 producer_controls.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_check.py
```

The producer replays reproduce 1,770 profiles / 109,175 guarded tip-rank tests through (m=20), with no exact-ratio failures, and 49 specified larger profiles / 15,024 tests through 300 branches, also with no failures. Those are bounded diagnostics, not universal evidence. `independent_check.py` rebuilds (C,U_i,E) from their (z)-basis integer factors and independently recomputes the signed margins at selected boundary/interior ranks; it does not infer the result from coefficients in powers of (L=1+z).

The exact spots include:

* One arity-4 branch, (N=4,h=8): all guarded ranks (k=1,2,3) have positive exact surplus (426, 2046, 1776). The actual first descent is (x=3), so these are guard checks, not eligible selector ranks.
* Counts ((a_2,a_3,a_4)=(0,0,4)), (N=16,h=29,k=8): (U_i[k]=26280), (E[k]=11440), (C[k]=47158), (C[k-1]=38700), and the exact surplus is (45{,}380{,}234{,}160>0). The crude (C[k]/C[k-1]\ge 2(N+2-k)/(3k)) substitution instead gives (-87{,}840). Its failure is a failure of that coarse sufficient test, not of the exact inequality. The (k=9) coarse test also fails, (-3{,}976{,}560).
* Counts ((0,22,0)), (N=66,h=89,k=27): (M_E=-518620474811633289768751398606375936<0), but the exact surplus is (783047390962129386096766512578362723639296>0). This confirms that positivity of the isolated (E) minor cannot be assumed; it does not refute the full surplus.
* Counts ((0,0,24)), (N=96,h=169), the independently calculated first strict parent descent is (x=47), (n=123), and (k=49) satisfies all actual rank guards (x+2\le k), (3k<2(N+2)+1), (2k\le N+2). The crude margin is (-1134884788104385426929377214036680), while the exact surplus is positive. This does not assert any strict deletion selector: selectors are computed from each actual deletion polynomial at current (p), and are outside this surplus claim.

For the coarse substitution, (R=2(N+2-k)/(3k)>0) on the guard, and (C[k]\ge R C[k-1]). Both terms in the exact expression have positive multipliers (h+1) and (D), so replacing each occurrence of (C[k]) by its lower bound yields a valid lower bound; after multiplication by (3k>0) this is the stated coarse margin. A negative coarse margin therefore only makes that lower bound inconclusive. Reversing this implication would be invalid.

All factors (D), (h+1), and (3k) used above are positive on the claimed band. No negative-factor order reversal is used. The checked isolated (M_E<0) case is retained as a warning against dropping the compensating main-product term.

## Evidence and limitations

The deterministic result files from the producer replay and the independent spot checks are in this worker's admitted directory: `producer_surplus.json`, `producer_controls.json`, and `independent_check.json`. The independent code is `independent_check.py`. Source-dependent ULC/Gurvits arguments remain informal as scoped in the predecessor proof; this critique builds on them only for the conditional sufficiency derivation above. No universal proof, counterexample, formal award, or primary payment conclusion is provided. The original profile, guarded ranks, zero extension, and represented-branch meaning of (U_i) are retained; no branch multiplicity is introduced into this individual-tip claim.
