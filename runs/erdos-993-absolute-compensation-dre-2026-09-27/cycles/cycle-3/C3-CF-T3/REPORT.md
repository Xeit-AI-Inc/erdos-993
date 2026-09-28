# C3-CF-T3 critique — Jensen exponent and finite scalar band

## Integrity and scope

All 86 common-dispatch members, all 3 transport-clarification members, all 3 critique-transport members, and all 8 packet case inputs match their recorded SHA-256 hashes (`manifest_audit.json`). I read the shared-source clarification and critique reconciliation. The v4 CLI/queue runner files match the critique-transport manifest; I inspected their run/admit behavior but did not invoke them or any controller operation. Producer evaluators were copied into this scratch before replay. No Lean build or source edit was made.

This review covers the four required IDs in `RETURN.json`. The target remains the actual ordinary path-star family: least strict zero-extended parent descent (including terminal degree), all three eligible-rank guards, strict flags evaluated at current `p`, and original endpoint/tip tag multiplicities. The scalar band is a relaxed coefficient domain, not a family census.

## Adjacent-arity exponent minimum

For `M>=10`, `M/3<=k<=M`, and `r=2,3,4`, define

`g_r = (2r/(2r+1)) binom(M-r,k-1)/binom(M,k)`.

At `k=M`, all terms vanish. For `k<M`, set `u=M-k-1` and `v=3k-M`. Cancellation gives

`g2-2g3+g4 = 4k(M-k) f / (315 M(M-1)(M-2)(M-3))`,

where `f=63(M-2)(M-3)-135u(M-3)+70u(u-1)`, and direct substitution gives

`9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v^2`.

The prefactor is positive and the displayed sum is positive for `M>=10`, `v>=0`. Thus the sequence over arities is discretely convex. If both `a2,a4>0`, replacing one 2-block and one 4-block by two 3-blocks changes `E=sum a_r g_r` by `2g3-g2-g4<=0`, preserving block count and `M`. Iterating reaches `a2=0` or `a4=0`, giving exactly the two adjacent endpoint formulas in the source claim. This proves a minimum of the *Jensen exponent* among feasible integer count profiles. It says nothing by itself about actual cofactor coefficients, modes, first descents, strict selection, MASS, or payment. The registered candidate remains unawarded pending the controller's review.

## Independent scalar certificate replay

I wrote `independent_audit.py` independently using exact `Fraction`, `math.comb`, and integer Taylor numerators. For each `m=70..119`, it scans every `N=2m..4m`, each `r=2,3,4`, feasible cofactor tip total `M=N-r`, and each integer `j` with `5j>2N-1`, `2j<=N-2`. It checks every actual `GF_r` shift `k=j-s` satisfies `M>=10` and `3k>=M`; no state was excluded. It forms the adjacent-arity exponent with `m-1` cofactor blocks, floors `1000E` downward, evaluates `sum_(h=0)^12 t^h/h!` with exact common denominator `1000^12*12!`, and checks the strict scalar inequality in the protocol.

The rank-to-shift implication used to justify the scan is valid: `5j>2N-1` gives `3j>3(2N-1)/5`; when `N>=10r-12`, `3(2N-1)/5 >= N+2r-3`, so `3(j-s)>N-r` for every `s<=r-1`. Here `N>=2m>=140`, so the condition holds for all three arities. The other cofactor feasibility guard is explicitly scanned. In the actual application, `j>=x` follows from `p>=x+2`; the relaxed scan includes every rank satisfying the stronger rank band whether or not it is an actual first-descent row.

Flooring preserves a lower bound because `floor(1000E)/1000<=E`; the Taylor polynomial has nonnegative terms and is at most `exp(t)` for `t>=0`. The convolution uses `GF_2=(1,2)`, `GF_3=(2,5,2)`, `GF_4=(3,9,7,2)`. The scan checked the strict scalar target equivalent to

`sum_s [z^s]GF_r * binom(M,j-s)/binom(N,j) * Taylor(floor(1000 E_{j-s})/1000) > 3 delta D_j/(2 binom(N,j))`,

since `delta D_j/binom(N,j)=(N+1-j)(N-2j-1)/(j+1)`.

The independent result is 799,895 states, zero exclusions. It matches all 50 per-`m` rows, exact minimum ratios, and minimizers from both the copied producer replay and shared certificate. The lowest ratio is at `(m,N,r,j)=(70,278,2,112)` and is strictly greater than one. Replay commands from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 manifest_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 producer_copy.py > producer_replay.log
PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py > independent_audit.json
```

`comparison_audit.json` records rowwise equality with the copied producer output and shared certificate. This is exact bounded scalar evidence only. It is not itself an occupancy-to-coefficient proof, an actual-profile census, or a universal payment theorem.

## Composition audit and exact remaining scope

The known spread-quotient and empty/singleton-truncation obstructions target ordering of actual normalized quotients and a dropped-layer coefficient floor, respectively; neither refutes this Jensen-exponent lower bound, which retains the full GF convolution. The finite band is mathematically consistent with a selected-MASS composition: combine a separately established coefficient lower bound for `m=1..69`, this scalar band for `70..119`, and the proposed branchwise local coefficient theorem for `m>=120`. The accepted full lower-half selection composition is an independent dependency and does not use the accepted aggregate sign. If full selection and a valid branchwise bound `T_i[j] >= (3/2) delta D_j` both hold, then `w=sum_i r_i e_i=N>=2`, `b=N+1`, and `A >= (3/2)N delta D_j >= (N+1)delta D_j`; this gives selected MASS. Empty selection is trivial. Full selection is essential to remove endpoint-only debt in this inference.

For the composition, the occupancy identity writes `H_i[k]/binom(M,k)=E_prod prod_l(1+X_l/r_l)` for a uniform fixed-size subset of the cofactor tips, where `X_l` marks singleton occupancy; finite Jensen and `log(1+1/r)>=2/(2r+1)` give `H_i[k]/binom(M,k)>=exp(sum_l g_{r_l}(M,k))`. The balancing lemma lowers this exponent to the adjacent-arity value, and the scan applies its positive Taylor lower bound at every `GF_r` shift. Using this independently reviewed bridge and the accepted full lower-half selection composition, the exact finite certificate therefore establishes a restricted consequence for `70<=m<=119`: each represented branch satisfies `T_i[j] > (3/2) delta D_j`; hence `A > (3/2)N delta D_j >= (N+1)delta D_j=b delta D_j`, so selected MASS holds. Because `0<t<1` and `delta>1`, the exact-ratio factor `1-t+t/delta >=1/delta`, and the same restricted rows satisfy payment. This is a source-dependent computer-assisted/informal composition, not a Lean award. The `m=1..69` profile instrument and the `m>=120` local-mass argument are shared, unaccepted candidates and were not independently certified in this case. Therefore their composition cannot promote the all-`m` MASS claim. A valid all-`m` MASS result would imply the primary payment: with `t=C[j+1]/C[j]` and `delta>1`, `1-t+t/delta >= 1/delta`; multiplying MASS by this factor gives the exact-ratio predicate. The registry's separately reviewed `m>=238` MASS composition supports only that restricted tail. Thus both all-`m` identities remain open here. Nothing in this review changes the full-selection evidence grade, the aggregate status, or any formal-verification status.

## Dispositions

- `E993-PATH-STAR-COFACTOR-JENSEN-EXPONENT-ADJACENT-ARITY-BALANCING`: retain the exact rational exponent-minimization statement at its registered scope, at informal proof grade only.
- `C3-T3-FINITE-BALANCED-SCALAR-REPLAY`: retain as exact bounded evidence for the stated relaxed domain and protocol; no exclusions or arithmetic failures found.
- `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-MARK-MASS-COMPENSATION`: remains open at all `m`; this review supports the restricted `70<=m<=119` interval after the stated neutral dependencies, while neither adjoining interval is closed here.
- `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-EXACT-RATIO-PAYMENT`: remains open at all `m`; this review supports the restricted `70<=m<=119` interval through MASS and the exact-ratio factor. The independently reviewed `m>=238` tail remains a separate restricted result.

No counterexample to the required predicates, Lean result, or broader census claim is asserted.
