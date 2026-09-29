# C6-CF-U2 — independent critique of the bounded-prefix certificate

## Dispositions

- **C6-U2-prefix-surplus-1-99 — retained as bounded evidence.** The exact m=1..99 finite statement is supported by the source, retained results and my checks below. Its scope is 171,699 profiles and 56,245,000 represented-arity/rank rows, testing every represented r and every 1<=k<=floor((N+2)/2), with no actual-descent or eligibility filter. The reported minimum is 98. This is not evidence for m>=100, the guarded shifted comparisons, or selected payment.
- **C6-U2-radix-carry-free-bound — retained as an informal proof.** The coefficient bounds and digit extraction are valid as stated for every finite nonempty profile.
- **C6-CF-U2-validator-strictness — retained.** `validate_results.py` checks row minima with `>=0`, although the finite claim/report says every tested S is strictly positive. That validator condition alone does not check strict positivity. Repair it to `>0` (and assert the aggregate minimum is positive). This is a validation-strength issue, not a counterexample: the frozen result has minimum 98 and my independent pass checks all 99 row minima are >0.

## Exactness and coverage audit

I checked actual bytes against the dispatch manifest for all 275 common members and against all 124 packet entries; there were no hash mismatches. The frozen instrument source has SHA-256 `d29ebed0281db22daaa6c1780c69bb962f67b45cb61cc64102e44d5714094166`; its result has SHA-256 `251b74de0d21cd20e3d7cdb78c148f44ca99fd8c6d3bd3ffc331644d3b0e6730`. The retained receipt records Python 3.11.2, an unchanged source snapshot, exit 0, no timeout, and 1101.48 seconds, below the 1800-second invocation cap.

The loop enumerates each composition `(a2,a3,a4)` of m exactly once, skips only unrepresented arities, and tests all integer k from 1 through `(N+2)//2`. The coefficient arrays decoded for C have indices 0..N+1 (degree N+1); those for U_r have indices 0..N (degree N), and the added zeros give the required zero extension. E is built as `[0, binom(N,0),...,binom(N,N),0]`, which is exactly z(1+z)^N. The marked factor is literally `(1+z)^(r-1)+z`; at r=2 this is `1+2z`, so the small-arity boundary is handled correctly. The formula for S matches the protocol, including `E[k+1]*C[k-1]`.

I independently enumerated profile and guarded-row counts for each m=1..99, comparing both the expected-count table and the retained per-m records. Totals agree exactly: 171,699 profiles and 56,245,000 rows. I ran the copied validator successfully and ran the supplied convolution cross-check successfully on its 164 profiles through m=8. A separate direct-convolution audit (replay below) confirms the count table and all per-m minima are strictly positive; it also recomputes the required control minors. This is a review replay and spot check, not a second full polynomial implementation for every sign row. The protocol's two-method requirement for an all-m computer-assisted promotion therefore remains unmet by this case alone.

## Radix bound and sign checks

For beta=`2^(N+m+4)`, coefficients are nonnegative. Thus each coefficient is at most the sum of coefficients, the value at z=1. For C,

`C(1)=3 product_i(2^ri+1) < 3*2^(N+m) < 2^(N+m+2) < beta`.

For a marked U_i,

`U_i(1)=3(2^(ri-1)+1) product_(l!=i)(2^rl+1) < 3*2^(N+m-1) < 2^(N+m+1) < beta`.

Every base-beta digit is therefore an actual coefficient, with no carry; nonnegative factors also rule out cancellation. The implementation's product at beta uses exactly G, all unmarked B_r factors with original exponents, and one marked B_(r-1), then masks and shifts those digits. The support-tail assertion checks that no higher digit remains. The strict inequalities remain true at the smallest allowed profile `(m,N)=(1,2)`; beta exceeds both coefficient sums there as well.

The surplus is evaluated in its displayed form. On the guard, `h=N+1+a3+3a4 >= N+1`, so `h+1>0`, `k+1>0`, and `h-k+1>0`; multiplying by these factors preserves inequality direction. No division by a possibly signed coefficient or replacement of the E minor by a nonnegative quantity is made. The E minor can be negative: the exact n=91 control has E-only minor `-518620474811633289768751398606375936`, while its full tip minor is `777419068009671422357461955841645743808 > 0`. The n=122 full tip minor is `-49239834336` at k=77, but the guard is k<=41, so that row is correctly excluded from the tested predicate.

Boundary and interior direct-convolution checks include:

- `(a2,a3,a4)=(1,0,0), r=2, N=2, h=3, k=1`: `C[k]=5`, `C[k-1]=1`, `U[k]=4`, `E[k]=1`, `E[k+1]=2`, hence `S=4*4*5 + 6*(1*5-2*1)=98`.
- `(0,1,0), r=3, N=3, h=5, k=1`: `S=210`.
- Heterogeneous interior `(2,1,1), r=2, N=11, h=16, k=3`: `C[k]=511`, `C[k-1]=124`, `U[k]=416`, E minor `7645`, and `S=4,041,912`.
- Same profile at the upper guarded rank k=6, r=3: `C[k]=2730`, `C[k-1]=2285`, `U[k]=1552`, E minor `205590`, and `S=87,858,750`.

## Limits and replay

The certificate establishes only the finite restriction of `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`. It does not prove its all-m version, because the m>=100 analytic tail is separate. The surplus has no first-descent or strict-selector premise, and no implication from this finite restriction to the exact-ratio selected payment is claimed. No universal theorem, formal verification, or result for arbitrary trees or Erdős993 follows here. Actual first descent, strict current-p selectors, original multiplicities and rank guards in the primary contract remain unchanged.

Replay from this scratch directory (all producer Python scripts were copied here before execution):

```sh
PYTHONDONTWRITEBYTECODE=1 python3 review_case/validate_results.py
PYTHONDONTWRITEBYTECODE=1 python3 review_case/crosscheck_coeffs.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py
```

The copied cross-check imports only the copied `review_case/census_b.py`. The independent audit uses direct coefficient convolution and writes `independent_audit.json`.
