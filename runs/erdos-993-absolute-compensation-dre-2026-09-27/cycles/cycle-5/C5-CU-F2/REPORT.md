# C5-CU-F2 independent critique

## Scope and verification

I reviewed both required C5-F2 claims, the shared path-star conventions and main-mark margin, and every packet-listed source. All 237 common-dispatch members and all 8 packet sources matched their recorded SHA-256 values (245 entries, 0 mismatches). I copied the two producer scripts and the producer's closure-audit script into this scratch directory before running them with `PYTHONDONTWRITEBYTECODE=1`. I also wrote and ran an independent integer replay, `independent_review.py`; its data are in `independent_review.json`.

## Claim: different-denominator sum obstruction

Retain `C5-F2-DIFFERENT-DENOMINATOR-SUM-OBSTRUCTION` at its stated abstract two-rank scope. With minor convention

`M(A,C)=A[1]C[0]-A[0]C[1]`,

the two input minors are `90*1-1*100=-10` and `0*100-80*1=-80`. Each is nonpositive, so each positive-denominator ratio is nonincreasing across the two ranks. After componentwise addition, `A=(81,90)` and `C=(101,101)`, giving `M=90*101-81*101=909>0`; the sum ratio rises from `81/101` to `90/101`. Denominators stay positive and numerators nonnegative, including the zero endpoint in `A2[1]`. The example refutes arbitrary different-denominator pair-sum closure; it is not a path-star witness.

The valid repair is the fixed-common-denominator lemma: for fixed `w_i>=0`,

`M(sum_i w_i X_i,C) = sum_i w_i M(X_i,C)`.

Thus if every summand minor is `<=0`, their weighted sum minor is `<=0`. This cross-multiplied statement needs no division; interpreting it as a ratio comparison additionally requires positive `C` coefficients at both ranks. It applies to the fixed selected weights at one rank when the individual comparisons use the same `C`. It does not prove those individual comparisons. The source RETURN marks this true obstruction `proposed_rejected`, although its statement and arithmetic assert it; my disposition is `proposed_retained` for the stated obstruction. Read `proposed_rejected` there as an apparent label error, not a mathematical counterargument.

## Claim: root-mixture all-rank monotonicity obstruction

Retain `C5-F2-ROOT-MIXTURE-ALL-RANK-MONOTONICITY-OBSTRUCTION` only as an all-rank shortcut obstruction. For the homogeneous profile `(a2,a3,a4)=(10,0,0)`, `m=10`, `N=20`, `n=33`, `alpha=22`, `C=(1+2z)B_2^10`, and `d=z(1+z)^21`, the replay gives

`d[4]=1330`, `d[5]=5985`, `C[4]=27315`, `C[5]=125586`,

so `d[5]C[4]-d[4]C[5]=-3,549,105`. Since `C[4]C[5]>0`, dividing by this positive product preserves the sign and shows `d/C` decreases at this step. Also `d[4],d[5]>=0`; the map `u -> u/(1+u)` is increasing on `u>=0`, since its difference across `u,v` is `(v-u)/((1+u)(1+v))` with positive denominator. Therefore `d/(C+d)` decreases as well.

This rank has the simple guards `1<=4` and `2*4<=22`, but not actual eligibility. Directly rebuilding `P=C+d` with zero extension gives first strict descent `x=11`; hence actual eligibility would require `p>=x+2=13`, while `2p<=alpha=22` requires `p<=11`. No `p` in this profile satisfies both, irrespective of the remaining lower-half guard `3p<2alpha+1`. This is not a guarded actual-eligibility counterexample, deletion comparison, selector or primary-payment witness. The source RETURN again says `proposed_rejected` despite reporting a negative minor that verifies its obstruction statement; the appropriate disposition of that statement is `proposed_retained` at the narrow scope above.

## Additional bounded diagnostic and limitations

The copied ULC instrument replayed its declared `m<=20` diagnostic: 1,770 profiles and 109,175 simple-guarded tip/rank checks, with no negative exact-ratio surplus condition and failures of the cruder sufficient margin beginning at `(a2,a3,a4)=(0,0,4)`, `r=4`, `N=16`, `h=29`, `k=8` (margin `-87,840`). This is bounded evidence only. The crude-margin failure is not a failure of the exact-ratio condition, an individual/full deletion comparison, or an actual-eligibility claim; its rank is not filtered by the actual first descent. I make no universal ULC or selected-payment claim.

No calculation here alters original tip multiplicities, strict selectors, first descent, or any payment claim: the abstract closure example has no graph interpretation, and the root-mixture rank fails the actual guard. All findings are worker proposals, not authoritative verdicts.

## Replay

From this scratch directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_review.py
PYTHONDONTWRITEBYTECODE=1 python3 root_mixture_producer_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 ulc_surplus_producer_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_closure_audit.py
```

The second through fourth commands replay copied producer instruments; the first is the independent exact-integer verification supporting the dispositions and the common-denominator repair.
