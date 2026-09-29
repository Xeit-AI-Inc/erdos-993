# C6-CT-U3 critique

## Integrity and scope

The packet-listed C6-U3 report and return match their packet SHA-256 values. All 275 common-dispatch members and both packet-listed additional source files were independently hash-checked: 277 files checked, zero mismatches. Replay with `PYTHONDONTWRITEBYTECODE=1 python3 audit.py`; exact digest results are in `audit-evidence.json`.

I reviewed the two required conditional implications. Their scope remains the ordinary path-star family with `m>=1`, `r_i in {2,3,4}`, `N=sum r_i`, `q=N+1`, `alpha=N+2`, integer zero extension, the actual first strict descent `x`, all three guards `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`, and strict selectors evaluated at that current `p`. The endpoint has multiplicity one; each original private tip retains multiplicity `r_i`. No arbitrary-tree or Erdős 993 conclusion follows.
For each eligible row, write `e0=1[Delta_p A0<0]`, `ei=1[Delta_p Ai<0]`, `b=e0+sum_i r_i ei`, `j=p-2`, `delta=q-j`, `D_j=binom(N,j+1)-binom(N,j)`, `A=sum_i r_i ei T_i[j]`, and `W=sum_i r_i Ai`; these are the current-`p` strict flags and original-tag weights.

## `C6-U3-WEIGHTED-TIP-DECK-TO-MASS` — retain, conditional

Let `R=zL^q`, so `P=C+R`. The guards imply `x <= p-2 <= (N-2)/2 < (q+1)/2`. Therefore

`Delta_x R = binom(q,x)-binom(q,x-1) > 0`.

Since `Delta_x P<0`, it follows that `Delta_x C<0`, hence `C[x+1]/C[x]<1`. The factors `G` and `B_(r_i)` have positive interval support and log-concave coefficients, so their convolution `C` does too; its adjacent ratios are nonincreasing. As `p-1>=x+1`,

`0 < C[p]/C[p-1] <= C[x+1]/C[x] < 1`.

The division needed next is valid: `p>=2`; `p<= (N+2)/2 <= N+1`; and every `A_i` contains the positive coefficient sequence `zL^N`, so `A_i[p]>0`. Thus `W[p]=sum_i r_i A_i[p]>0`; also `C[p-1]>0`. Dividing the assumed, correctly oriented inequality

`W[p+1] C[p-1] <= W[p] C[p]`

gives `W[p+1]/W[p] <= C[p]/C[p-1] < 1`, or `Delta_p W<0`. Since `Delta_p W=sum_i r_i Delta_p A_i` with positive weights, at least one actual strict tip selector is active. Put `B=sum_i r_i e_i`; then `B>=2`.

Use the established actual-eligible branchwise bound `2T_i[j] >= 3 delta D_j` for each selected tip. Summing with the original multiplicities gives `A >= (3/2) B delta D_j`. If `e0=0`, this pays `b=B`; if `e0=1`, then `(3/2)B >= B+1=b` because `B>=2`. Thus `A>=b delta D_j`, including the empty-selection case vacuously. Endpoint selection is not needed.

This is a valid conditional proof of MASS from the weighted-deck comparison. It does not prove that comparison for any profile. A useful proof repair to the source report is to spell out the support/positivity and binomial-rise facts above before dividing; without them, strictness and division are not justified solely by the weighted inequality. Exact checks in `audit-evidence.json` cover the sharp multiplicity boundary `B=2,e0=1` and several interior multiplicities.

## `C6-U3-RELATIVE-MARGIN-TO-AGGREGATE` — retain

The formally established relative margin is

`(delta-1) T_i[j] C[j+1] >= delta T_i[j+1] C[j]`.

On the stated guard, `j=p-2` is in the theorem range, `delta=q-j>0`, and `C[j]>0`. Dividing by the positive `delta*C[j]` preserves the inequality and gives

`Delta_j T_i <= -(1-t+t/delta) T_i[j]`, where `t=C[j+1]/C[j]`.

Here `0<t<1`: `C` has positive support at these ranks, and the first-descent/log-concavity argument above propagates the strict ratio drop from `x` to `j>=x`. Summing with the nonnegative weights `r_i e_i`, not changing selectors or multiplicities, yields

`S = bD_j + sum_i r_i e_i Delta_j T_i <= bD_j-kappa A`, with `kappa=1-t+t/delta`.

The payment `kappa A>=bD_j` therefore implies `S<=0`. Also `kappa*delta=1+(delta-1)(1-t)>=1`; the factors are nonnegative and `delta>0`, so `A>=b delta D_j` implies the exact-ratio payment. The inequality direction survives substitution; equality is attained in the exact scalar checks for an interior `(delta,t)=(4,1/3)` and the algebraic boundary `delta=1`. Actual eligible rows have the stronger strict regime `delta>1` and `0<t<1`.

This proves only the sufficient implication. From `S<=0` one cannot reverse the displayed upper bound to infer either payment. The already accepted computer-assisted sign of `S`, selected MASS, exact-ratio payment, and the still-open weighted-deck premise remain distinct claims and grades.

## Counterexample controls and limits

The known E-only negative term, negative homogeneous activity coefficient, and outside-guard shifted-deletion witness do not refute either conditional proof: none is a negative full weighted-deck LR instance within the actual eligible guard, nor a failure of the accepted relative margin. I found no error in either implication and produced no full-family counterexample. No new census or formal verification was run. The primary path-star payment retains its recorded computer-assisted/nonformal status; neither implication supplies an arbitrary-tree residual-aggregate bridge or resolves Erdős 993.
