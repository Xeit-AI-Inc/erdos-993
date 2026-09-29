# C5-U3 independent search report

## Scope and source integrity

Reviewed the sealed protocol, solution contract, status clarification, neutral handoff, Cycle 5 allocation and packet. The packet assigns no required covered claim IDs and no additional case-specific sources. The 237 member byte hashes in `manifests/C5-COMMON-DISPATCH.json` all matched. Targeted registry lookup confirmed the all-guard individual deletion LR, weighted-tip-deck LR and ULC exact-ratio surplus are OPEN at their stated scopes; the primary selected payment is VERIFIED only at computer-assisted/nonformal grade. I read the authorized predecessor structural reduction and main-mark margin notes, plus the Cycle 5 marked-deletion and branch-addition recurrences, main-product LR proof and weighted-subset note. I did not inspect other workers' scratch or private transcripts.

## Independent algebra and obstruction

Write `C=GQ`, `E=zL^N`, and `U=sum_i r_i G B_(r_i-1)H_i`, so the multiplicity-preserving tip deck is `W=U+NE`. After adjoining a branch of arity `r`, direct multiplication gives

```
C' = B_r C
U' = B_r U + r B_(r-1) C
E' = L^r E
N' = N+r
W' = B_r W + r B_(r-1) C + (r L^r - N z) E.
```

The final identity follows by substituting `W=U+NE` and `W'=U'+(N+r)E'`; it retains all original tip multiplicities. It is an independent derivation of the already supplied recurrence, not a new claim.

The negative `-NzE` cannot be discarded coefficientwise, even on the new guarded band. The replay uses 150 old arity-2 branches (`N=300`) and appends an arity-2 branch (`N'=302`). At `k=4`, `2k=8<=304=N'+2`. The correction coefficient is

```
[z^4](2 L^2 - 300 z) z L^300
  = 2*binom(302,3) - 300*binom(300,2)
  = 9,090,200 - 13,455,000
  = -4,364,800.
```

Thus a proposed induction which requires this correction polynomial to have nonnegative coefficients fails inside the guarded band. This is only a mechanism obstruction: the complete new weighted minor at the same rank is `185586251584170562390 > 0`, so the example does not refute the weighted-deck LR target. It also has no actual first-descent or strict-selector premise; the registered shifted-LR target itself has only the guard `1<=k, 2k<=N+2`. No conclusion about the selected payment or the primary follows.

The handoff's boundary-strip caution remains: adjoining a branch expands the guard, so old guarded minors alone do not automatically control every term in a convolution expansion. I found no invariant that pays the signed correction and closes that strip. This search therefore supplies an exact obstruction to one positivity premise, not a universal proof or target counterexample.

## Evidence and replay

Exact integer polynomial arithmetic; no floating point. From the eventual admitted directory, replay with:

```
PYTHONDONTWRITEBYTECODE=1 python3 branch_recurrence_control.py
```

The script checks the complete polynomial recurrence by exact list equality, confirms the in-guard negative correction coefficient, and reports the full mixed minor separately. The 237/237 source-manifest hash check was performed directly against member bytes; that audit was read-only and is reported here rather than retained as a separate artifact.

## Limits

- No actual eligible rank, first descent, strict selector flags, or graph-level selection was evaluated for this recurrence control.
- The negative summand does not imply a negative full minor; the checked full minor is positive at the displayed rank.
- No census expansion, Lean build, source edit, installation, or controller operation was performed.
- The primary remains outside this worker's demonstrated result; bounded evidence here changes no canonical status.
