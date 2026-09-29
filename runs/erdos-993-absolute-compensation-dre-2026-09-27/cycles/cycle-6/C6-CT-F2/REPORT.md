# C6-CT-F2 independent critique

## Dispatch and scope

All 275 members of `manifests/C6-COMMON-DISPATCH.json` matched their recorded SHA-256 values. The four packet-authorized `C6-F2` members also matched their packet hashes. The cycle-6 identity was searched only for the exact `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS` entry and related scope; its status is OPEN. I reviewed the packet's three claims, the frozen prefix protocol and its expected-count table, and the common C6 handoff/allocation. I did not inspect either current instrument.

This is a review of finite coverage arithmetic, a coefficient-encoding bound, and artifact format. It computes no surplus signs, does not verify the m>=100 tail, and does not establish an actual deletion comparison or the selected payment. The prefix target tests every represented arity and every integer `1 <= k <= floor((N+2)/2)` without first-descent or eligibility filtering. It is a stronger auxiliary predicate on a different guard than the actual payment, whose statement retains the actual first strict descent, eligible `p`, current-p strict selectors, original tag multiplicities, and rank guards. Neither finite coverage counts nor the radix bound prove that predicate.

## C6-F2-PREFIX-COVERAGE-CLOSED-FORM — retained

For a profile `(a2,a3,a4)` at fixed `m`, let `s` be the number of positive coordinates. The profile contributes `s floor((N+2)/2)` rows: one for each represented arity, with each guarded rank counted once. The number of profiles is `choose(m+2,2)`. Summing `s` gives `S_m=3 choose(m+1,2)`, since each of the three coordinates is positive in `choose(m+1,2)` compositions. Coordinate symmetry gives `sum(s*N)=3m S_m`. Since `N` is odd exactly when `a3` is odd, and `2 floor((N+2)/2)=N+2-1[N odd]`, twice the row count is `(3m+2)S_m-O_m`, where `O_m=sum_{a3 odd} s`.

For fixed odd `a3=j`, put `t=m-j`. Across the `t+1` splits `a2+a4=t`, the sum of `s=1+1[a2>0]+1[a4>0]` is `(t+1)+2t=3t+1`, including `t=0`. Summing gives `O_(2u)=3u^2+u` and `O_(2u+1)=(u+1)(3u+1)`. Thus the formula counts both endpoints correctly for either parity. Independent exact evaluation of all 99 layers matches the shared per-m table; totals are 171,699 profiles, 56,245,000 represented-type/rank rows, and 109,175 rows through `m=20`. The `m=1` profiles contribute 7 rows, including the required `(m,r,k)=(1,2,1)` row (and `k=2`); at the upper endpoint, homogeneous `m=99,r=4` has `N=396` and includes `k=199`.

Replay: `PYTHONDONTWRITEBYTECODE=1 python3 independent_checks.py`. Evidence is `independent_checks.py` and `independent_checks.json`. This is exact coverage arithmetic, not coefficient or sign evidence.

## C6-F2-KRONECKER-NO-CARRY-BOUND — retained, proof repaired

For `B_r=(1+z)^r+z`, its coefficient sum is `2^r+1`. Hence for `Q=product B_ri`, `||Q||_1 < 2^(N+m)`, and `||C||_1=3||Q||_1 < 3*2^(N+m) < 2^(N+m+2)`. Also `||E||_1=2^N < 2^(N+m+2)`. Every coefficient is nonnegative, so each coefficient is bounded by its coefficient sum.

There is a strictness error in the source proof's displayed `||U_i||_1 < 3*2^(N+m-1)` intermediate: when `m=1`, `H_i` is the empty product and has norm exactly 1, so its asserted strict product bound is equality. The corrected uniform estimate is `||H_i||_1 <= 2^(N-r_i+m-1)` (strict when `m>1`), while `||B_(r_i-1)||_1=2^(r_i-1)+1 <= 2^r_i`. Since coefficient sums are nonnegative and multiply under polynomial products, multiplying these bounds by the positive `||G||_1=3` preserves their direction; thus `||U_i||_1 <= 3*2^(N+m-1) < 2^(N+m+1) < 2^(N+m+2)`. All scalar comparisons here use positive factors (including division by 2 in the coverage formula); no negative factor is used to preserve an inequality direction. This repairs the argument without changing the claimed digit bound. In particular `B_1=L+z=G`; the `r_i=2` endpoint is retained.

With radix `b=2^(N+m+2)`, all coefficients of `Q,C,U_i,E` are nonnegative integers strictly below `b`. Evaluating each positive-factor polynomial at `b` therefore gives its base-`b` digits as its monomial `z` coefficients, without carry, provided all degree positions are extracted. Do not encode a signed surplus before extracting coefficients. The replay constructs monomial-`z` coefficient arrays explicitly using binomial coefficients for `(1+z)^r`; these are not coefficient lists in powers of `L=1+z`. Exact boundary checks for `m=1,r=2,3,4` confirm the literal digits, including `B_1`; they test the encoding implementation only, not the surplus inequality.

## C6-F2-PREFIX-TELEMETRY-FORMAT-CONFLICT — retained, narrowed

There is a literal overlap: the general protocol bars wall-clock fields in artifacts, while the C6 prefix protocol mandates per-`m` elapsed times and the runner emits start/elapsed telemetry. The C6 instruction is the specific execution record requirement; the worker `RETURN.json` and narrative report can remain free of wall-clock fields while required timing stays in per-`m` records and the separate transport receipt. This is a format-boundary clarification, not a mathematical or coverage defect. The producer's suggested separation is adequate; a controller exception is not needed if this specific-over-general reading is applied.

## Evidence limits

No polynomial surplus row, exact target margin, known E-only/full-tip controls, or `m>=100` tail value was recomputed here. The finite prefix protocol requires two independently authored instruments, frozen sources, exact controls, complete per-`m` attaining witnesses and bounded runtime. Coverage closure alone cannot certify those requirements or promote an all-parameter claim. Even a completed successful prefix plus a valid tail would remain computer-assisted evidence under the stated scope; it would not award the selected payment, MASS, arbitrary-tree993, or formal verification.
