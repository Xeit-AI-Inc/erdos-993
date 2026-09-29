# C5-CT-U3 critique report

## Scope and integrity

I reviewed the assigned C5-U3 case, the neutral shared inputs, and the required predecessor structural-reduction and main-mark-margin notes. Every one of the 237 members in `manifests/C5-COMMON-DISPATCH.json` matched its declared SHA-256; the three packet-specific files also matched. The targeted registry lookup confirms the weighted-tip-deck shifted comparison is OPEN at its stated scope. The assigned recurrence-coefficient claim is not a registry theorem and makes no claim to settle that comparison.

I copied the producer's script into this scratch directory before replay. Both it and my separate direct-deck implementation run with exact integer polynomial arithmetic. No source was executed in place, and no other worker material was read.

## Required claim: C5-U3-BRANCH-RECURRENCE-COEFFICIENT-OBSTRUCTION

**Disposition: retain as bounded evidence, at exactly the stated mechanism scope.** For `W=U+NE`, the update equations imply

```
W' = B_r W + r B_(r-1) C + (r L^r - N z) E.
```

This follows by substituting `U'=B_r U+rB_(r-1)C`, `E'=L^rE`, and `N'=N+r`; it preserves the original `N` old tags and adds `r` new tags. The recurrence itself passes an independent check that constructs the entire weighted deletion deck directly, including each tag multiplicity.

For 150 old arity-2 branches, `N=300`; append `r=2`. In the monomial basis in `z`, `E=zL^300` and the correction coefficient is

```
[z^4](2L^2-300z)zL^300
 = 2*binom(302,3) - 300*binom(300,2)
 = 9,090,200 - 13,455,000
 = -4,364,800.
```

Both subtracted quantities are positive; subtraction reverses their comparison, and the second is larger. The rank satisfies the new guard: `1<=4` and `2*4=8<=N'+2=304`. I also checked the guard endpoint `k=152`: the correction is negative there too; at `k=1` it is `+2`. These checks use monomial `z` coefficients, not coefficients in powers of `L`.

This refutes coefficientwise nonnegativity of the signed correction, including within the guarded band. It does **not** refute the full guarded weighted-deck minor. A direct exact computation gives that minor at `k=4` as `185586251584170562390 > 0`; thus the correction's negative sign cannot be transferred to the full expression. This recurrence control has no actual first descent, current-`p` strict selector flags, or selected-payment premise. No inference to the primary, MASS, or actual selection is justified.

## Replay

From the eventual admitted directory:

```
PYTHONDONTWRITEBYTECODE=1 python3 branch_recurrence_control_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_recurrence_check.py
```

The first is the producer script copied before execution. The second independently constructs the full deck and checks the recurrence by polynomial equality, the in-guard signed coefficient, guard endpoint/interior values, and the full minor. All comparisons are exact integers; no sampling or floating point is used.

## Limitations

- This is an exact finite obstruction to one proposed positivity premise, not a failure of the weighted-deck LR target.
- No all-parameter invariant compensating the signed correction is established.
- No actual descent, selector, graph-level payment, or universal theorem is established here.
