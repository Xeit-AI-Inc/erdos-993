# C5-CF-U3 critique report

## Disposition

**C5-U3-BRANCH-RECURRENCE-COEFFICIENT-OBSTRUCTION — retained at its stated bounded, mechanism-only scope.** The exact recurrence is valid and its correction term has a negative coefficient inside the new guarded band. This refutes coefficientwise nonnegativity as an induction premise. It does **not** refute the full guarded weighted-deck minor: at the displayed rank that minor is positive.

For `W=U+NE`, where `U=sum_i r_i G B_(r_i-1) H_i`, adjoining arity `r` gives

```
C' = B_r C
U' = B_r U + r B_(r-1) C
E' = L^r E
N' = N+r
W' = B_r W + r B_(r-1) C + (r L^r-Nz)E.
```

Indeed, the new branch contributes `r G B_(r-1)Q = r B_(r-1)C` to `U'`; every old tip deletion acquires the common factor `B_r`. Substituting `W=U+NE` into `W'=U'+(N+r)E'` gives the last identity. The `-NzE` term is necessary in this identity.

For 150 old arity-2 branches, append `r=2`: `N=300`, `N'=302`. The correction is `(2L^2-300z)zL^300`. Its coefficient at `k=4` is

```
2*binom(302,3) - 300*binom(300,2)
= 9,090,200 - 13,455,000
= -4,364,800.
```

The new comparison guard holds: `1<=4` and `2*4=8<=N'+2=304`. The negative coefficient disproves only a proof step demanding that the correction polynomial be coefficientwise nonnegative. The exact full weighted minor `W'[4]C'[4]-W'[5]C'[3]` is `185586251584170562390 > 0`.

Boundary checks on the same profile find correction coefficients `+2` at `k=1`, `+304` at `k=2`, and a negative coefficient at the upper guarded endpoint `k=152`. The full weighted minor is positive at `k=1,4,152`. Thus the sign defect of the recurrence correction must not be conflated with a failure of the full guarded comparison. These are direct exact checks, not a universal proof.

## Scope limits

The example keeps all 300 original tip tags through the multiplicity `N` and satisfies the shifted comparison guard `1<=k, 2k<=N'+2`. That guarded target does not require actual first-descent eligibility. No first descent `x`, actual rank `p`, strict selector flags, or graph-level selection is evaluated here. No conclusion follows for selected compensation or the primary predicate. No all-parameter invariant controlling the signed correction is supplied.

## Integrity and replay

Independent SHA-256 verification matched all 237 members of `manifests/C5-COMMON-DISPATCH.json` and all three packet source hashes. Exact integer polynomial replay and these hash results are retained in `independent_check.json`.

From the eventual admitted directory, replay with:

```
PYTHONDONTWRITEBYTECODE=1 python3 independent_check.py
```

The producer's `branch_recurrence_control.py` was reviewed as source but not executed; the retained check was independently written from the recurrence and profile formulas. No Lean build, source edit, installation, census expansion, or controller operation was performed.
