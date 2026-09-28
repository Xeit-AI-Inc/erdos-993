# C3-F3 — dependency and grade audit

## Finding

I found no circularity or interval gap in the proposed composition. This is a conditional proof audit, not an independent validation of the prefix scan, the 799,895-state certificate, or the local coefficient estimates. Therefore it does not resolve either all-`m` MASS or the exact-ratio payment.

The source bytes match the supplied seals: all 86 entries of `C3-COMMON-DISPATCH.json` and all 3 entries of `C3-TRANSPORT-CLARIFICATION.json` verified with no mismatch. The clarification authorizes reading shared neutral sources; the packet's empty `allowed_source_files` restricts only additional worker-case inputs. The runner and clarification hashes match the transport clarification.

## Dependency chain and exact composition

The all-`m` selector clause has a noncircular source composition at the registered computer-assisted/informal, nonformal grade. The exact census covers `m=1..80`; the registered independently reimplemented lower-half base covers `42..265`; and the adjudicated analytic selector tail covers `m>=266`. Their union covers every `m>=1`. The latter two clauses establish strict deletion selection before their source's aggregate-sign conclusion. The aggregate sign is not needed here. For `m>=70`, the census/base/tail union gives `e0=ei=1` at the actual current `p`; it preserves the three eligibility guards and original tip multiplicities. The exact rank-to-shift bridge is: `5j>2N-1` and integrality give `j>(2N-1)/5`; for `s<=r_i-1`, `3(j-s)>(N-r_i)` whenever `N>=10r_i-12`. Also `j<=M=N-r_i` follows from `2j<=N-2` and `N>=2r_i-2`. Actual `m>=70` has `N>=140`, so these conditions hold for every arity and each `GF_(r_i)` shift. This is the guard needed to place the relaxed finite states in the Jensen range; it does not validate the scalar bound itself.

The proposed coefficient route partitions without gaps:

- `1<=m<=69`: the direct prefix instrument checks actual MASS and payment at each actual eligible row. This needs its independent replay and completeness audit.
- `70<=m<=119`: the relaxed scalar certificate is intended to establish the branchwise bound for each represented `i` and each actual GF shift. It depends on occupancy/Jensen, exponent balancing, Taylor flooring, convolution, and the rank-to-shift guard. The finite certificate itself and these bridges remain for independent validation.
- `m>=120`: the analytic local argument is intended to establish `2 T_i[j] >= 3 delta D_j` for each represented branch. Its rank and shift guards are compatible with this domain: `N>=2m`, `M=N-r_i`, and `N>=10r_i-12` for every `r_i in {2,3,4}`. This audit did not reprove its coefficient/Jensen estimates.

For `m>=70`, full strict selection gives `b=1+sum_i r_i=N+1` and `A=sum_i r_i T_i[j]`. If the proposed branchwise inequality holds, then

`A >= (3/2)N delta D_j >= (N+1)delta D_j = b delta D_j`,

because `N>=2`. This is MASS. For the prefix, MASS is checked directly rather than inferred from a branchwise bound. Thus, if the three coefficient/prefix components survive independent review, they compose with the selector clauses to prove all-`m` MASS without using aggregate sign.

MASS implies the exact-ratio payment at every stated row. Write `t=C[j+1]/C[j]` and `kappa=1-t+t/delta`. From `j=p-2>=x`, the established first-descent/log-concavity argument gives `0<t<1`; the guards give `D_j>0`, `delta>1`, and `C[j]>0`. Then

`kappa - 1/delta = (1-t)(1-1/delta)>0`.

So `A>=b delta D_j` implies `kappa A>=bD_j`, equivalently the contract's exact cross-multiplied payment. When `b=0`, both selected debts vanish. The contract's original first strict descent (including terminal zero extension), all three guards, current-`p` strict selectors, and individual original tip multiplicities remain in force. Although `3p<2alpha+1` follows from `2p<=alpha`, I retain it as a required guard.

The current `m>=238` selected-MASS restriction remains a separately registered source-dependent result. The proposed path above would fill `m<=237` only if its own pending finite/local pieces validate; it does not change the current OPEN all-`m` identities or satisfy the contract's governed-Lean stopping requirement.

## Adversarial checks and boundaries

I checked the junctions `m=69/70`, `119/120`, and `237/238`, the selector overlaps at `80/81`, `265/266`, and the lowest possible branch total `N=2` in the exact implication script. The domain algebra has no gap at these joins. The accepted corrected factor `kappa=1-t+t/delta` is used; the refuted `kappa>v+1/delta` shortcut is not. Exponent balancing is used only to lower the Jensen exponent, not to order actual coefficients or payment quotients. The known empty-plus-singleton truncation failure at all-r4 `m=172` does not apply to this composition, which retains full `T_i`; it remains a warning against substituting the truncated cofactor.

## Reproduction and evidence boundary

Run from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 manifest_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 composition_check.py
```

The manifest audit reports 86/0 and 3/0 members/mismatches. The arithmetic script checks interval junctions, full-selection multiplicity algebra, the MASS-to-payment factor, and the stated `m>=70` shift-guard thresholds. These checks verify the composition implications only. I did not execute producer scripts or independently replay the prefix/scalar certificate, and no bounded computation here is evidence for their universal claims.
