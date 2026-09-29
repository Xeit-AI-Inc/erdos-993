# C6-CF-U3 independent critique

## Scope and integrity

I reviewed the two required C6-U3 claims against the exact contract, status clarification, C6 handoff/allocation, targeted identity entries, and the shared predecessor margin and structural-reductions sources. Packet `C6-CF-U3.json` hashes to `fad89aac903f69a2be8301126efbeaae649f5aea715faa2e2b036911ac839430`. Both allowed C6-U3 source files match their packet SHA-256 values. All 275 members of `manifests/C6-COMMON-DISPATCH.json` were present and matched byte-for-byte (zero mismatches); details are in `cycles/cycle-6/C6-CF-U3/integrity.json`.

The packet's two claims are conditional implications. I retain both at exactly their stated path-star scope. The weighted-deck LR premise remains open; the second claim depends on the already formally verified main-mark margin. The branchwise `2 T_i[j] >= 3 delta D_j` payment lemma used by the first implication is separately recorded as universal informal proof with exact finite support, not as a formal award. Neither implication proves its own premise, upgrades selected MASS/payment status, or extends to arbitrary trees.

## Claim 1: weighted-tip deck comparison implies selected MASS

Fix an actual eligible `p`, with the contract's actual first strict descent `x`, all three guards, current-`p` strict selectors, and original tag multiplicities. Write `N=sum r_i`, `alpha=N+2`, `C=GQ`, and `W=sum_i r_i A_i`. The guard `2p<=N+2` and `N>=2` give `p<=N`. Each `A_i` has positive coefficients throughout degrees `0..N`: its factor `G B_(r_i-1) H_i` has positive interval support `[0,N]`. Thus `W[p]>0`; also `C[p-1]>0`.

The summand `z L^q` of `P=C+zL^q` has forward difference `binom(q,x)-binom(q,x-1)>0` at `x`: `x<=p-2<(q+1)/2` by the actual descent/rank guards. Since `Delta_x P<0`, this gives `Delta_x C<0`. The sequence `C` has positive interval support and is log-concave, so its adjacent ratios decrease. As `p-1>=x+1`,

`0 < C[p]/C[p-1] <= C[x+1]/C[x] < 1`.

All divisions here are by positive coefficients. If the assumed weighted comparison holds,

`W[p+1] C[p-1] <= W[p] C[p] < W[p] C[p-1]`,

where the strict step uses `W[p]>0` and `C[p]<C[p-1]`. Dividing by positive `C[p-1]` preserves direction and gives `W[p+1]<W[p]`. Since `Delta_p W=sum_i r_i Delta_p A_i`, at least one actual strict tip selector `e_i=1` is active. Put `B=sum_i r_i e_i`; then `B>=2`, preserving original multiplicity.

Use the separate branchwise bound `T_i[j]>=3 delta D_j/2` for each selected tip. With `A=sum_i r_i e_i T_i[j]`, this gives `A>=3B delta D_j/2`. If `e_0=0`, this pays `b=B`; if `e_0=1`, `B>=2` gives `3B/2>=B+1=b`. Here `delta,D_j>0`, so multiplication preserves order. Therefore `A>=b delta D_j` (selected MASS), and no endpoint selection is needed. This is a valid conditional proof; it does not establish the weighted-deck LR premise.

## Claim 2: relative margin implies the selected aggregate sign

For the contract's `j=p-2`, set `t=C[j+1]/C[j]` and `kappa=1-t+t/delta`. The actual guards and first descent give `0<t<1`; `delta>1`. The formally verified margin, after division by positive `delta C[j]`, reads

`T_i[j+1] <= ((delta-1)/delta) t T_i[j]`,

so subtraction yields `Delta_j T_i <= -kappa T_i[j]`. No inequality is reversed: the divisor is positive, and this rearrangement adds the nonnegative `T_i[j]` term to the other side. Weighting by the nonnegative integers `r_i e_i` and summing gives

`S=bD_j+sum_i r_i e_i Delta_j T_i <= bD_j-kappa A`.

Because `kappa>0` and `kappa*delta=1+(delta-1)(1-t)>=1`, selected MASS `A>=b delta D_j` implies the weaker exact-ratio payment `kappa A>=bD_j`, which in turn implies `S<=0`. Equivalently, dividing the registered payment by positive `delta C[j]` gives exactly `kappa A>=bD_j`. The accepted sign `S<=0` does not reverse this upper-bound argument and does not imply either payment inequality.

## Independent bounded replay

`cycles/cycle-6/C6-CF-U3/audit.py` constructs the polynomials directly in monomial `z` coefficients with Python integers, computes the first strict descent including zero extension, and checks guarded rows, selectors, the relative-margin cross-products, the branchwise payment inequality, the weighted-deck conditional implication, and MASS-to-payment cross-products. Run with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-CF-U3/audit.py
```

It checked 171 deliberately limited profiles (all profiles through `m=4`, plus homogeneous arities through `m=20` and homogeneous `m=100`) and 10 guarded rows, all from the homogeneous `m=100` controls. In the `r=3,m=100` case, `N=300`, `alpha=302`, `x=145`; `p=147` is the `x+2` boundary and `p=151` lies at `2p=alpha`. All 100 tip flags and the endpoint flag are selected in these rows. The exact coefficient checks passed, including strict `C[p]<C[p-1]`, the relative margin, and the 3/2 branch bound. The full arithmetic output is retained in `audit-output.txt`. These bounded checks are controls for direction and indexing only, not universal evidence.

## Dispositions and limitations

- `C6-U3-WEIGHTED-TIP-DECK-TO-MASS`: retain as the stated conditional universal implication. The actual first descent supplies the strict `C` ratio drop; positive support of `W[p]` is an explicit necessary link in the proof. Weighted-tip LR remains an unproved premise.
- `C6-U3-RELATIVE-MARGIN-TO-AGGREGATE`: retain. Its one-way direction and the MASS-to-payment strengthening follow by positive-factor division and `kappa*delta>=1`.

No counterexample, new universal premise, census result, or Lean award is claimed. The primary, MASS, exact-ratio payment, selected aggregate, and Erdős 993 remain distinct predicates and grades.
