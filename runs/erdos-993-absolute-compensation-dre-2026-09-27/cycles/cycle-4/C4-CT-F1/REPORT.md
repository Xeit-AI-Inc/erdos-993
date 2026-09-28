# C4-CT-F1 critique

## Integrity and scope

The packet assigns the all-rank shifted-C/deletion comparison and its two guarded candidates: the individual-deletion and original-multiplicity weighted tip-deck comparisons. I verified SHA-256 for all 178 entries in `manifests/C4-COMMON-DISPATCH.json` and the packet's four additional inputs; all matched. The C4-F1 report, result JSON and producer audit script were read only from the packet-authorized source case. I copied its script to this scratch directory before replaying it.

The all-rank claim is refuted at its exact scope. For counts `(a2,a3,a4)=(38,0,1)`, `N=80`, `n=122`, the arity-4 tip and `k=77` give `C[76]=319721589`, `C[77]=14606561`, `A4[77]=2091375`, `A4[78]=95699`. For the claimed inequality `A4[k+1] C[k-1] <= A4[k] C[k]`, the left-minus-right margin is `+49239834336`, so the inequality fails. The retained witness JSON records `-49239834336`, which is the opposite (right-minus-left) orientation; its negative sign also indicates failure. This sign convention should be stated explicitly when reusing that field.

This witness is outside the lower-half guard: `2k=154>N+2=82`. Direct polynomial replay gives the actual least strict parent descent `x=41`, including the terminal coefficient difference `-1`. Eligibility would require `p>=x+2=43`, whereas the lower-half guard requires `2p<=82`, or `p<=41`; hence this profile has no actual eligible lower-half `p`. It refutes neither guarded comparison nor an eligible selector/payment statement.

## Guarded comparisons

I found no guarded counterexample. The copied C4-F1 exact audit reports no positive margins over its 12 targeted profiles (including guard endpoints, the outside-guard control, 500-branch homogeneous profiles and rare-arity profiles). It cross-checks `P`, endpoint deletion and an arity-4 tip deletion against a literal tree dynamic program for the `(38,0,1)` control. My separate factor-by-factor convolution replay checks exact boundary/interior ranks for that control and `(1,1,1)`, and checks an eligible `p=x+2` plus the selector deltas for the 500-branch all-arity-4 profile. All tested guarded margins are nonpositive. These are bounded exact computations and do not prove either universal guarded statement.

The conditional selector implications are sound with the registered guards and accepted coefficient facts. At current `p`, the selectors remain the strict predicates `e0=1[Delta_p A0<0]` and `ei=1[Delta_p Ai<0]`; they are evaluated on that actual profile and are not inferred from a weak inequality without the strict final ratio bound. Original leaf tags and their arity multiplicities `r_i` remain attached to the original tree throughout. For a guarded comparison at actual eligible `p`, divide
`A[p+1] C[p-1] <= A[p] C[p]`
by the positive `A[p] C[p-1]`; the direction is preserved, giving
`A[p+1]/A[p] <= C[p]/C[p-1]`. The coefficients `A[p]` and `C[p-1]` are positive in the eligible domain (in particular, the `zL^N` term gives `A[p]>=binom(N,p-1)>0`); `C[p-1]` is positive as a product of positive-interval factors. Since `p>=x+2` and `C` is log-concave, its adjacent ratios are nonincreasing, so `C[p]/C[p-1] <= C[x+1]/C[x] < 1`. Thus the strict current-p selector is true, `Delta_p A<0`. The positive denominator and factors are essential; no inequality reversal occurs here. Multiplying either side by a negative number would reverse the order, and no such multiplication is used. The endpoint's `A0` or a branch's `Ai` is separately covered by the individual candidate.

For the weighted candidate, the same positive-factor division gives `W[p+1]/W[p] <= C[p]/C[p-1] < 1`, hence `Delta_p W<0`. Since `W=sum_i r_i Ai` retains each original tip multiplicity `r_i>0`, not all `Delta_p Ai` can be nonnegative; at least one strict current-p selector `ei` is 1 (all equal-arity original tags share the same coefficient polynomial). This implication does not give selection of every tip or the endpoint, and it does not establish its shifted-comparison premise. It uses actual first descent `x`, not a later descent or a no-recovery assumption.

The all-rank witness does not permit extrapolation to guarded ranks. Likewise, the finite guarded checks do not establish either universal comparison, selected MASS/payment, or the primary aggregate. No new theorem is proposed.

## Replay

From the eventual admitted directory, run:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_shifted_audit_copy.py > producer_shifted_audit_copy.json
PYTHONDONTWRITEBYTECODE=1 python3 shifted_review.py > shifted_review.json
```

`shifted_review.py` independently constructs each branch factor and deletion by omitting that factor, uses exact integer convolution, and records signed margins. The full copied audit's 500-branch JSON is large; the report states only its tested scopes and nonviolations, not a universal conclusion.
