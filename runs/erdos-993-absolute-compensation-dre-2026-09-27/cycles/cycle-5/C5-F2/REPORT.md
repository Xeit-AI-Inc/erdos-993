# C5-F2 search report

## Scope and provenance

Reviewed the exact path-star conventions and margin context in `sources/predecessor/structural-reductions.md`, `main-mark-margin-proof.md`, and `hybrid-family-proof.md`, plus the C5 neutral handoff and the authorized C5 root-mixture and ULC-surplus instruments. My packet has `allowed_source_files: []` and no required covered-claim IDs. No other worker case or private experiment was opened.

I checked all 237 entries in `manifests/C5-COMMON-DISPATCH.json`: every listed file existed and its SHA-256 matched. The packet bytes hash to `a18bb176050d9f514ce6320a2e5c5200b44667debb1e0faab3de8d7b38328ce0`; the packet and common manifest provide no expected packet digest for a second comparison. Producer scripts were copied into this scratch directory before execution; Python bytecode writing was disabled.

## Closure findings

**Same denominator, fixed nonnegative weights.** If each `X_i[k+1] C[k-1] <= X_i[k] C[k]`, then for any weights `w_i >= 0` fixed at this rank, summing gives `(sum_i w_i X_i[k+1]) C[k-1] <= (sum_i w_i X_i[k]) C[k]`. This is exact cross-multiplication and remains valid with zero-extended `X_i`. In the registered guarded path-star band, `C=GQ` has positive coefficients at `k-1,k`, so the ratio statement is also defined. At a particular actual `p`, strict-selector weights `r_i e_i` are fixed numbers in `{0,2,3,4}`; they are not reselected between ranks. Thus individual same-`C` inequalities imply their selected weighted sum at that `p`. This does not prove any individual inequality or the primary payment.

**Different denominators do not have this closure.** The exact two-rank example in `independent_closure_audit.py` has positive denominators `C1=(1,100), C2=(100,1)` and nonnegative numerators `A1=(1,90), A2=(80,0)`. Both component minors `A_i[1]C_i[0]-A_i[0]C_i[1]` are `-10,-80`, but the summed pair has numerator `(81,90)`, denominator `(101,101)`, and minor `909 > 0`. Therefore TP2/ratio order for each separately normalized pair does not license adding numerator and denominator pairs. This abstract example is not a path-star witness.

**Common convolution is a valid, narrower TP2 closure.** The shared main-mark proof supplies the finite Cauchy-Binet identity for the adjacent minor of `(a*h,b*h)`. When `a[u]b[v]-a[v]b[u] >= 0` for `u<v`, and `h` has positive interval support and log-concave coefficients, each summand's second factor `h[k-u]h[k+1-v]-h[k-v]h[k+1-u]` is nonnegative; zero-extended boundary terms are included. Hence common convolution preserves the ordered-pair minors used there. This is the source's established mechanism, not a new general claim that arbitrary sums of TP2 pairs are TP2.

## Root-mixture obstruction and scope

For the authorized homogeneous profile `a2=10,a3=a4=0`, `N=20,m=10,n=33,alpha=22`, let `C=(1+2z)B_2^10`, `d=z(1+z)^21`. At coefficient step `k=4`, exact coefficients are `d[4]=1330, d[5]=5985, C[4]=27315, C[5]=125586`, so `d[5]C[4]-d[4]C[5]=-3,549,105 < 0`. Thus `d[k]/C[k]`, and equivalently `d[k]/(C[k]+d[k])`, decreases across this step. The rank obeys `1<=k` and `2k<=N+2`, so it refutes an all-rank root-mixture monotonicity shortcut even on that simple guarded band.

However, the actual parent has first strict descent `x=11`. Taking `p=k=4` fails `x+2<=p`; the guards `p>=13` and `2p<=22` cannot both hold. There is no actual eligible rank for this profile in that band. This is not a full deletion, selector, payment, or primary counterexample.

The copied root-mixture producer reproduces the same coefficients; my independently written exact-integer replay also computes `x`, checks the rank guard separately from actual eligibility, and asserts the signed minor. Its output is retained in `independent_closure_audit.json`.

## Bounded ULC diagnostic

I replayed the copied exact-integer ULC-surplus instrument over its stated `m<=20` profile range: 1,770 profiles and 109,175 guarded tip/rank checks. The exact-ratio surplus condition had no negative values in that bounded run. The cruder ratio-floor sufficient margin fails at counts `(0,0,4)`, represented arity `4`, `N=16,h=29,k=8`, with signed margin `-87,840`. These are bounded diagnostic facts only; failure of that crude lower bound is not failure of the exact-ratio condition or any full deletion comparison. Actual first-descent eligibility was not checked for that rank.

## Replay

From this directory, run:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 root_mixture_producer_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 ulc_surplus_producer_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_closure_audit.py
```

The first two are scratch copies of authorized producer instruments. The third is my independent literal coefficient and closure check. All arithmetic is integer arithmetic. No broad census was run, and no universal selected-payment proof or full-target counterexample is proposed.
