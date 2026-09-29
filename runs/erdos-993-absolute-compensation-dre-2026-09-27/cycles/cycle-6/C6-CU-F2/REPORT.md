# C6-CU-F2 independent critique of C6-F2

## Scope and source integrity

I reviewed the three required C6-F2 claims as finite-prefix protocol/combinatorics claims. I did not run or infer any prefix surplus census. The common dispatch manifest (`manifests/C6-COMMON-DISPATCH.json`) has 275/275 member hashes matching actual bytes; all four packet-allowed C6-F2 files match their packet SHA-256 values. Replay: `PYTHONDONTWRITEBYTECODE=1 python3 source_hash_audit.py`.

## Claim dispositions

### `C6-F2-PREFIX-COVERAGE-CLOSED-FORM` — retain

For a profile let `s` be its number of represented arities and `N=2a2+3a3+4a4`. It contributes `s floor((N+2)/2)` type/rank rows. In the layer `a2+a3+a4=m`, `S_m=sum s=3*binom(m+1,2)`. Coordinate symmetry gives `sum(s*a2)=sum(s*a3)=sum(s*a4)=m*S_m/3`, so `sum(s*N)=3mS_m`. Since `N` is odd exactly when `a3` is odd, write `O_m=sum_{a3 odd}s`. For fixed odd `a3=j`, with `t=m-j`, summing over `a2+a4=t` gives `3t+1`; summing these terms yields `O_(2u)=3u^2+u` and `O_(2u+1)=(u+1)(3u+1)`. Therefore

`rows_m=((3m+2)S_m-O_m)/2`.

The profile count is `binom(m+2,2)`. A second exact implementation enumerated each layer and compared it to this formula for all 99 values: 171,699 profiles, 56,245,000 represented-type/rank rows, and 109,175 rows through `m=20`. No selector, first-descent, or eligibility filter is present. Equal-arity tips have the same marked polynomial, so this count tests one type per represented arity; it does not multiply by the original number `a_r` of branches. That distinction is correct for this per-type predicate, while the separate weighted bridge must keep original tip multiplicities.

The guard endpoint is handled correctly: for every profile, `floor((N+2)/2)` is exactly the number of integer ranks `1<=k` and `2k<=N+2`; odd `N` loses one rank relative to `(N+2)/2`, and even `N` does not. At `m=1,(a2,a3,a4)=(1,0,0)`, this includes both ranks `k=1,2` (7 total layer rows across all profiles). The direct counts and formula agree also at `m=99` (5,050 profiles, 2,216,375 rows). This is exact coverage evidence only, not a sign result.

### `C6-F2-KRONECKER-NO-CARRY-BOUND` — retain

All arrays here are monomial coefficients in `z`; for `B_r=(1+z)^r+z`, the special case is `B_1=(1,2)=G`, while `B_2=(1,3,1)`. For nonnegative coefficient arrays write `||f||_1=sum_k f[k]`. Then `||B_r||_1=2^r+1<2^(r+1)`, so

- `||Q||_1 < 2^(N+m)` and `||C||_1=3||Q||_1 < 3*2^(N+m) < 2^(N+m+2)`;
- for represented `r>=2`, `||B_(r-1)||_1=2^(r-1)+1<2^r`, while each of the other `m-1` factors has norm `<2^(r_h+1)`. Thus `||U_i||_1 < 3*2^(N+m-1) < 2^(N+m+1)` (also when `m=1`, with empty cofactor product);
- `||E||_1=2^N < 2^(N+m+2)` for `m>=1`.

Each coefficient is nonnegative and at most the corresponding norm. Hence every coefficient of `Q,C,U_i,E` is strictly below `b=2^(N+m+2)`. Evaluation at `b` is consequently an exact base-`b` encoding with no carry, provided only positive polynomials are encoded and coefficient positions through the known degree are extracted. A signed surplus must be formed after digit extraction; directly encoding a signed sum would not inherit the bound. The exact small checks include `m=1,r=2`: `Q=(1,3,1)`, `C=(1,5,7,2)`, `U=(1,4,4)`, `E=(0,1,2,1)`, radix 32, and target surplus 98 at `k=1` and 166 at the upper guarded rank `k=2`. Additional radix examples are retained in `independent_audit.json`.

Every multiplier in the cleared target, `(h+1)`, `(k+1)`, and `(h-k+1)`, is strictly positive on the protocol domain: `2(h-k+1)>=2h-N=2+2a2+5a3+10a4>0`. Multiplication/division by these positive quantities preserves inequality direction; clearing a negative denominator would reverse direction and is not used here. The checked exact coefficients and radix examples use `z`-basis arrays, not coefficient lists in powers of `L`.

### `C6-F2-PREFIX-TELEMETRY-FORMAT-CONFLICT` — retain, narrowed

There is a real artifact-boundary ambiguity, but the claim groups two different kinds of timing data. C6 requires per-`m` `elapsed time`, and the runner emits `elapsed_seconds`; these are durations, not absolute wall-clock timestamps. The runner also emits `started_at_utc`, which is plainly an absolute wall-clock field and conflicts with the general artifact ban if its transport files count as worker artifacts. The protocol's suggestion to put transport evidence in a separate receipt is a plausible repair only if that receipt is explicitly outside the worker-artifact ban (or timestamps are stripped). No conflict exists for a duration field unless “wall-clock fields” is intended to prohibit elapsed durations too. The dispatch should distinguish required duration telemetry from absolute timestamps and define whether runner receipts are governed artifacts.

## Evidence grade and limitations

Replay the independent recount, boundary coefficients, and sample digit extraction with `PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py`; it writes `independent_audit.json`. `coverage_audit_producer_copy.py` is the packet producer script copied before execution, as required; it is not used as the independent recount. These are finite arithmetic and protocol checks, not a prefix census, universal surplus proof, or selected-payment/MASS result. No status here is authoritative.
