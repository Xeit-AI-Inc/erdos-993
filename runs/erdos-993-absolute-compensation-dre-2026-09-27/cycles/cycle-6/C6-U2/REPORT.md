# C6-U2 independent finite-prefix instrument

## Result and scope

Instrument B completed the exact m=1,...,99 prefix specified by the shared C6 protocol. It checked all 171,699 profiles and all 56,245,000 represented-arity/rank rows. Every tested surplus was strictly positive; the minimum was 98. Per-m profile and row totals agree with the reviewed expected-count table. This is bounded computation for the registered surplus predicate, not a universal proof or a result about selected payment.

For a profile (a2,a3,a4), the instrument tested every represented r in {2,3,4} and every 1<=k<=floor((N+2)/2), where N=2a2+3a3+4a4, h=1+2a2+4a3+7a4, C=G product_r B_r^a_r, E=zL^N, and U_r=G B_(r-1) B_r^(a_r-1) product_(s!=r) B_s^a_s. It checked the exact integer

    S_r(k)=(h+1)U_r[k]C[k]+(k+1)(h-k+1)(E[k]C[k]-E[k+1]C[k-1]) >= 0,

with zero extension. There was no first-descent or eligibility filter; these are all ranks of the stronger unselected surplus test. The run did not alter the actual-first-descent definition, current-p strict selectors, original tag multiplicities, or any rank guard in the primary selected-payment statement. It makes no inference from this surplus test to the primary payment.

## Independent construction and exactness

`census_b.py` uses Kronecker digit extraction, not polynomial-array products or coefficient cofactor division. For each profile and marked arity, it directly evaluates the defining factors at beta=2^w, with w=N+m+4. If c_j are the coefficients of C, then

    sum_j c_j = C(1) = 3 product_i(2^r_i+1) < 3*2^(N+m) < 2^(N+m+2) < beta.

Thus every c_j<beta, so the base-beta digits of C(beta) are exactly its monomial coefficients. Similarly,

    U_r(1)=3(2^(r-1)+1) product_(s!=r)(2^s+1)^a_s
          < 3*2^(N+m-1) < 2^(N+m+1) < beta,

so each digit of U_r(beta) is also carry-free. Coefficients are nonnegative, so these coefficient-sum bounds rule out both carries and cancellation. The implementation extracts the required digits with integer masks and shifts; E[j]=binom(N,j) is computed with exact integer binomial coefficients. Literal B_1=L+z=G is used for r=2.

As a small independent implementation check, `crosscheck_coeffs.py` constructs polynomials by ordinary integer convolution and compared every coefficient of C and every represented U_r against the packed digits on all 164 profiles with m<=8. It passed. This is a method check, not an additional certificate for the remaining profiles.

## Attainer and required controls

The smallest surplus over the complete bounded prefix is attained at (a2,a3,a4)=(1,0,0), N=2,h=3,r=2,k=1. The exact coefficients are C[0]=1,C[1]=5,U_2[1]=4,E[1]=1,E[2]=2, giving

    S_2(1)=4*4*5+6*(1*5-2*1)=98.

All required controls passed:

- m=1,r=2,k=1: S=98>0.
- Profile (0,22,0), N=66,h=89,k=27 (the n=91 control): the isolated E minor E[k]C[k]-E[k+1]C[k-1] is -518620474811633289768751398606375936, while the full tip minor is 777419068009671422357461955841645743808>0.
- Profile (38,0,1), N=80,h=84,k=77 (the n=122 control): the full tip minor is -49239834336, but k=77 is outside the guard k<=41; it was checked only as a control and was not included among certificate rows.

## Reproduction and integrity

The common-dispatch manifest had 275 members; every listed member's actual bytes matched its manifest SHA-256. The packet had no additional allowed case sources. Its observed SHA-256 is `b3aa1ee307e4b5f9a3c42b9b3c1716ecf608e71e3eb04f94a25380b9805363e2`. The copied protocol, expected-count table, and runner match common hashes `a17ba0bcd412765b7dc1a91b283df816f41ad5173047067c94661d6991aff4ba`, `e5de145a9c6872352a2a2b51d92a82a7d70745b2adf18a09e2dde66f4729ab6f`, and `f188a54eeca2e0b1c0b487c665a82cb6a97ca05e44b2638e36393017c17a8bd7` respectively.

After the m<=5 development run and its control/coverage checks, the final source was frozen at SHA-256 `d29ebed0281db22daaa6c1780c69bb962f67b45cb61cc64102e44d5714094166`. The shared runner executed that unchanged source on Python 3.11.2 for m=1..99, exited 0 without timeout in 1101.48 seconds, and recorded matching original/frozen source hashes. Final result SHA-256: `251b74de0d21cd20e3d7cdb78c148f44ca99fd8c6d3bd3ffc331644d3b0e6730`. `validate_results.py` rechecks the scope, all 99 per-m counts against the shared expected-count table, zero failures, the controls, source integrity and runtime cap.

Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 prefix_runner.py census_b.py final-run-1-99 --min-m 1 --max-m 99 --timeout 1800
PYTHONDONTWRITEBYTECODE=1 python3 validate_results.py
PYTHONDONTWRITEBYTECODE=1 python3 crosscheck_coeffs.py
```

Artifacts are intended to be admitted under `cycles/cycle-6/C6-U2/`: `census_b.py`, `crosscheck_coeffs.py`, `validate_results.py`, copied neutral protocol/count-table/runner, the development run, and `final-run-1-99/` with its frozen source, per-m checkpoints, aggregate result and transport receipt.

## Identity and limitations

The targeted registry lookup found `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`, still OPEN at dispatch. The bounded prefix supports only its m<=99 restriction at bounded-computation grade. The separately proposed m>=100 tail and endpoint bridge were not part of this computation. There is no universal all-m award, no Lean result, and no promotion of the all-m surplus, guarded comparison, weighted comparison, selected MASS, exact-ratio payment, or Erdős993. The finite prefix includes homogeneous arity 2 and every required represented type and guard rank; it does not use source-worker scripts or results.
