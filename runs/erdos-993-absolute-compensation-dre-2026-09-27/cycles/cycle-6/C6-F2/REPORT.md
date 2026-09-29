# C6-F2 finite-prefix audit

## Result

The requested profile and rank coverage is correct. I independently enumerated each composition layer `m=1..99`, counted each represented arity once per profile, and counted every rank `1 <= k <= floor((N+2)/2)`. Direct enumeration matches the closed form at every `m`: 171,699 profiles and 56,245,000 represented-type/rank rows total; the first 20 layers contain 109,175 rows. This is coverage arithmetic only. I did not evaluate surplus signs or run the finite census.

The profile space is exactly the nonnegative triples `(a2,a3,a4)` with sum `m`; each distinct represented arity is tested once because its marked polynomial depends only on that arity and the profile. No actual descent, eligibility, selector, or positivity filter appears. The rank interval is the exact integer form of `1 <= k` and `2k <= N+2`. It includes both endpoints for even `N`, and the floor endpoint for odd `N`; parity is determined by `a3`.

For each layer set `s=1[a2>0]+1[a3>0]+1[a4>0]` and `S_m=sum s=3*binom(m+1,2)`. Permuting the three coordinates permutes the composition set and preserves `s`, so `sum(s*a2)=sum(s*a3)=sum(s*a4)=m*S_m/3`. Hence `sum(s*N)=3m*S_m`. Put `O_m=sum_{a3 odd}s`. With `a3=j` and `a2+a4=m-j=t`, the sum of `s` over splits is `3t+1`; summing over odd `j` gives `O_(2u)=3u^2+u` and `O_(2u+1)=(u+1)(3u+1)`. Since `2 floor((N+2)/2)=N+2-1[N odd]`, the layer row count is `((3m+2)S_m-O_m)/2`. The script checks this formula against the direct per-profile loop for every layer.

## Target and rank audit

The registered finite target is the exact `ULC-EXACT-RATIO-TIP-SURPLUS` inequality from `control/C6-REGISTERED-CLAIM-IDENTITY.json`, with `h=1+2a2+4a3+7a4`, `C=GQ`, `E=zL^N`, and `U_i=G B_(r_i-1) H_i`. The protocol tests

`(h+1) U_i[k] C[k] + (k+1)(h-k+1)(E[k]C[k]-E[k+1]C[k-1]) >= 0`.

For `r_i` represented, one test per type suffices for this profile-level predicate: equal-arity branches have identical `U_i`, and the expression does not include branch multiplicity. The original multiplicity `r_i` returns later in the weighted sum/bridge; it must not be substituted into this per-type count. The endpoint tag is outside this tip-only predicate. The protocol's no-filter instruction is important: this surplus predicate quantifies over every guarded `k`, not just actual first-descent ranks. The known n=91 E-only failure with positive full-tip margin is therefore a control against confusing a failed summand/lower bound with failure of the full target. The n=122 full-tip failure at `k=77` is outside this target guard (`N=80`, so `k<=41`) and should remain an out-of-guard control, not a tested-row counterexample. The required `m=1,r=2,k=1` control lies in the covered rows.

In the tested range the scalar multipliers are positive: `h+1>0`, `k+1>0`, and

`2(h-k+1) >= 2h-N = 2+2a2+5a3+10a4 > 0`.

All coefficients are nonnegative integer polynomial coefficients except the signed difference `M_k(E)`; zero extension and its exact indices must therefore be retained. Replacing `B_(r_i-1)` by a power of `L` would be incorrect at `r_i=2`: `B_1=L+z=G`.

## Independent radix bound

If Instrument B uses direct Kronecker evaluation at base `b=2^w`, the following no-carry bound is sufficient. For each factor, `||B_r||_1=2^r+1 < 2^(r+1)`. Thus `||Q||_1 < 2^(N+m)`, `||C||_1=3||Q||_1 < 3*2^(N+m) < 2^(N+m+2)`. For represented `r>=2`, `||B_(r-1)||_1=2^(r-1)+1 <= 2^r`; multiplying by `G` and the `m-1` other factors gives `||U_i||_1 < 3*2^(N+m-1) < 2^(N+m+1)`. Also `||E||_1=2^N`. Every coefficient is bounded by its polynomial's coefficient sum, so width `w=N+m+2` gives each coefficient strictly below `b` for all encoded positive polynomials. The `E` binomials can also be computed directly. Digit extraction is exact if products are evaluated as nonnegative integers, coefficients are extracted at all positions through the known degree, and no signed expression is encoded before extraction. This bound is conservative and independent of the surplus sign.

An alternative recurrence follows from `D Q'=R Q`, where `D=B2 B3 B4` and `R=sum_r a_r B'_r product_(s!=r)B_s`. At coefficient `z^n`, the coefficient of `Q[n+1]` on the left is `(n+1)D[0]=(n+1)`; all other terms use lower `Q` coefficients. The resulting numerator must divide by `n+1` exactly. A recurrence implementation should assert zero remainder at every step and check support/degree endpoints. Direct construction of each marked `U_i` from its factors is structurally independent of Instrument A's constant-one cofactor division. These are method checks, not executed instruments.

## Freeze, transport, and protocol notes

The common manifest hashes matched the actual bytes for the protocol, expected-count table, coverage derivation/check, instrument options, runner, C5 close, neutral handoff, allocation, status clarification, registered identity, and predecessor structural/margin sources read for this audit. The packet has no additional source files and no packet member hashes. The report's independent count artifacts are `cycles/cycle-6/C6-F2/coverage_audit.py` and `cycles/cycle-6/C6-F2/coverage_audit.json`; replay with `PYTHONDONTWRITEBYTECODE=1 python3 coverage_audit.py`.

The shared transport runner snapshots and hashes the original/frozen source before execution, checks both source copies afterward, bounds each invocation at 1,800 seconds, and records runner/interpreter metadata. It does not itself enforce the 3,600-second cumulative budget across shards, compare protocol hashes across shards, or validate census coverage/results; the final reviewer must sum invocation durations and compare the same frozen source and sealed protocol hashes across all shards. The protocol hash is `a17ba0bcd412765b7dc1a91b283df816f41ad5173047067c94661d6991aff4ba` and the runner hash is `f188a54eeca2e0b1c0b487c665a82cb6a97ca05e44b2638e36393017c17a8bd7`.

There is a record-format conflict to resolve at dispatch: the general worker protocol says not to put wall-clock fields in artifacts, while the C6 prefix protocol requires per-`m` elapsed time and the runner emits `started_at_utc` and `elapsed_seconds`. I have included no wall-clock field in this report or return. Instrument returns should either use an explicit C6 exception for required execution telemetry or store it in a clearly non-governed transport receipt, while keeping it out of the schema-governed worker return.

## Scope limits

No polynomial signs, coefficients, or actual tree deletion polynomials were independently recomputed here. The expected-count JSON and coverage formula do not certify a surplus row, the `m=1,r=2,k=1` coefficient control, either high-order obstruction control, the m>=100 tail, any actual selected comparison, the selected payment, or the stronger MASS claim. A complete two-instrument prefix and the reviewed tail would still be computer-assisted evidence under their exact scopes, not a formal award or an arbitrary-tree result.
