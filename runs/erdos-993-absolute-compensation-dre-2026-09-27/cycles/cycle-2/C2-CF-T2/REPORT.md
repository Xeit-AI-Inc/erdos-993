# C2-CF-T2 critique

## Dispositions

- `C2-T2-SELECTOR-THRESHOLD-IDENTITY` — **retain**. Since `A0-Ai=z^3 F_(r_i)H_i`, zero-extended forward differences give `Delta_p Ai = Delta_p A0 - d_i`; hence `ei=1` iff `d_i>u`. In particular equality is excluded by the strict selector. This is universal algebra and uses no sign assumption on `d_i`.
- `C2-T2-ENDPOINT-ONLY-FINITE-EXCLUSION-SCAN` — **retain at the stated finite scope**. Replaying the copied exact-integer producer script yielded the same JSON data: 91,880 profiles, 133,194 eligible rows through `m=80`, and zero endpoint-only rows. The five direct-product controls also reproduce, including all ten current-p rows at `(0,0,173)`. This does not imply universal exclusion.
- `C2-T2-NEGATIVE-COFACTOR-SLOPE-SELECTED-CONTROL` — **retain**. A separate direct-factor calculation reproduces `x=37,p=39,j=37,delta=40`; `u=-11319302108154726892710`, `d3=-895239471360525542716`, and `d4=-1240837532571249046896`. Both slopes are negative but strictly exceed `u`, so both branch selectors are on. A nonnegative cofactor-slope criterion is therefore not necessary for selection.
- `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-EXACT-RATIO-PAYMENT` — **open**. No universal proof or eligible counterexample follows from this critique. The targeted identity record also lists the primary as OPEN.

## Exact endpoint obstruction

If a row has endpoint selected and every branch selector off, then `A=0` and `b=1`. The left side minus right side of the exact payment is

`-delta * D_j * C[j] < 0`.

Indeed the guards imply `j=p-2 < N/2`, so `D_j=binom(N,j+1)-binom(N,j)>0`; also `delta=q-j>0` and the product `C=GQ` has positive coefficients throughout its support, including `j`. Thus endpoint-only selection is impossible **if** the primary payment holds. This implication cannot be reversed into an independent endpoint-exclusion proof.

## Independent exact checks and boundaries

The copied producer script was run from this scratch with its output directed beside the copy. Hash-only verification matched all 55/55 shared dispatch members and all 4/4 packet source files. Its full bounded scan output `selector-audit-replay.json` matches the assigned `selector-audit.json` as parsed JSON. Separately, `independent_checks.py` constructs the named profiles by direct multiplication of individual branch factors, finds the first strict descent using zero-extended differences, and computes actual-p flags, slopes, original-multiplicity `A,b`, and signed payment margins. For `(0,12,10)` the exact payment margin is `841657089276596927110510442162384388444656818560` (positive). For the homogeneous `(0,0,173)` control all ten flags-at-current-rank rows have positive payment margins; the smallest is recorded with every row in `independent-checks.json`. These are controls, not universal evidence.

Replay from the run root:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 scratchpad/C2-CF-T2/selector_audit_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 scratchpad/C2-CF-T2/independent_checks.py
```

The first command writes `scratchpad/C2-CF-T2/selector-audit-replay.json`; the second writes `scratchpad/C2-CF-T2/independent-checks.json`. No Lean build, external theorem, aggregate conclusion, or census expansion was used. Scope retains the actual first strict descent, all three rank guards, current-p strict selectors, and original `r_i` tip multiplicities. Finite scans and direct controls do not prove endpoint exclusion or the primary for all parameters.
