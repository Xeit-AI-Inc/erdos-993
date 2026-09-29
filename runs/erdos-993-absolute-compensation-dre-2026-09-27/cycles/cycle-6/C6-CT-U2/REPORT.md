# C6-CT-U2 independent critique

## Scope and disposition

The audited case is C6-U2 (the finite prefix instrument B), against the exact registered identity `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`. The dispatch manifest and the packet's 124 allowed case-source hashes all match actual bytes (`hash-audit.json`). The registry target is still an all-nonempty-profile guarded tip-surplus statement. This case supplies only its bounded `m=1..99` prefix and an implementation lemma.

- **`C6-U2-prefix-surplus-1-99` — retain as bounded evidence at exactly its stated scope.** The protocol tests every triple `(a2,a3,a4)` with `1<=m<=99`, each represented type `r`, and each `1<=k<=floor((N+2)/2)`, without an actual-descent or eligibility filter. The target is
  `S_r(k)=(h+1)U_r[k]C[k]+(k+1)(h-k+1)(E[k]C[k]-E[k+1]C[k-1])`.
  The sealed result records 171,699 profiles and 56,245,000 type/rank rows, no negative row, and least reported margin 98. The independent coverage recount agrees at each `m`; direct monomial convolution reconstructs every one of the 99 reported per-`m` minimum witnesses. The direct replay also reproduces m=1,r=2,k=1 (`S=98`), the n=91 isolated E minor `-518620474811633289768751398606375936` alongside the full tip minor `777419068009671422357461955841645743808`, and n=122,r=4,k=77 full minor `-49239834336`; the latter has guard maximum 41 and is excluded. The copied producer convolution cross-check passed all 164 profiles through m=8; the producer result validator passed the counters, failure list, controls, and runner receipt. These checks support a finite computation only. I did not independently reevaluate every one of the 56,245,000 rows, so full-row positivity remains dependent on the frozen run's exact instrument and its complete enumeration.
- **`C6-U2-radix-carry-free-bound` — retain as an informal proof.** For every branch profile, all polynomial coefficients are nonnegative. At `z=1`,
  `C(1)=3 product_i(2^{r_i}+1) < 3*2^(N+m) < 2^(N+m+2) < beta`,
  with `beta=2^(N+m+4)`. The first strict inequality follows factorwise from `2^r+1<2^(r+1)`; all factors are positive, so multiplying preserves the strict order. The middle inequality is `3<4`; the final one is a strict comparison of powers of two. For a represented marked branch of arity `r`,
  `U_r(1)=3(2^(r-1)+1) product_(ell!=i)(2^{r_ell}+1) < 3*2^(N+m-1) < 2^(N+m+1) < beta`.
  Here `2^(r-1)+1<2^r` and each other `2^(r_ell)+1<2^(r_ell+1)`; again all factors are positive, so multiplication preserves order. For the endpoint/interior arities, the marked factor is respectively `3<4`, `5<8`, `9<16`, and the ordinary branch factors are `5<8`, `9<16`, `17<32`. Thus each individual coefficient is at most its polynomial's coefficient sum and is strictly below `beta`. Evaluating the monomial-in-`z` polynomial at positive integer `beta` therefore encodes its coefficients as base-`beta` digits with no carry. Nonnegative coefficients also rule out cancellation. This justifies the digit extraction. It proves coefficient recovery only, not signs of `S`, any all-`m` theorem, or selected-payment result.

## Independent replay

`audit_replay.py` uses direct integer monomial convolution, distinct from the producer's Kronecker evaluation. It recounts the 99 profile/type/rank coverage layers, reconstructs each stored per-layer minimum witness, and recomputes the exact controls. Its result is `independent-replay.json`. I also copied the permitted producer scripts into `input-copy/` before execution; the small convolution check and certificate validator replay commands and results were:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 input-copy/crosscheck_coeffs.py
PYTHONDONTWRITEBYTECODE=1 python3 input-copy/validate_results.py
PYTHONDONTWRITEBYTECODE=1 python3 audit_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 verify_hashes.py
```

The full run receipt records Python 3.11.2, exit 0, no timeout, unchanged frozen source hash `d29ebed0281db22daaa6c1780c69bb962f67b45cb61cc64102e44d5714094166`, and 1101.48 seconds. The receipt is transport evidence, not a mathematical proof. Expected counters alone are not sign evidence; the recorded exact run is the source of full prefix row outcomes. Producer and this critic use the same stated zero extension and guards.

## Scope limits

No conclusion here promotes the all-`m` tip surplus. A tail proof for `m>=100`, together with this finite prefix, would still be bounded-computation/nonformal evidence unless its universal tail argument and composition were separately accepted. The larger all-`m` surplus does not itself become a selected-payment theorem. This prefix has no actual first descent or strict selector; it preserves the registered guard `2k<=N+2` as `k<=floor((N+2)/2)`, and does not reweight represented types by original tip multiplicity. It establishes nothing by itself about individual/weighted comparison, endpoint transfer, selected MASS, exact-ratio primary payment, arbitrary trees, or Erdős993.

Artifacts and replay outputs are retained under `cycles/cycle-6/C6-CT-U2/` on admission.
