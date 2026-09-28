# C3-CT-F3 — critique of C3-F3 composition

## Disposition

The reported composition is algebraically valid **conditionally**. It does not establish all-`m` MASS or exact-ratio payment because this review did not independently validate the `m<=69` prefix, `m=70..119` scalar certificate, or `m>=120` local coefficient argument. I found no interval gap or circular use of the accepted aggregate sign in the stated dependency chain.

The current registered full-selection result is an accepted computer-assisted/nonformal source composition: the finite selector clauses cover `m=1..265`, and the analytic clause covers `m>=266`; these establish the strict current-`p` flags before using any aggregate sign. The independent census-free selector proof remains a method goal. The inherited `m>=238` MASS result does not settle the missing lower range. No Lean award or primary verdict follows from this critique.

## Conditional proof check

Keep the contract's actual first strict descent `x`, including terminal zero extension, and all three guards `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`. Keep `e0,ei` as strict current-`p` deletion flags and retain the endpoint once and each branch's `r_i` original tip tags.

For `m>=70`, full strict selection gives `b=1+sum_i r_i=N+1`. If the proposed branchwise bound `2T_i[j]>=3 delta D_j` holds for every represented branch, then

`A=sum_i r_i T_i[j] >= (3/2)N delta D_j >= (N+1)delta D_j=b delta D_j`,

because `N>=2`. Thus the `m=70..119` scalar bound and the `m>=120` local argument would supply MASS there if independently validated. For `m<=69`, the proposed direct prefix check must establish the actual selected MASS (or payment) row by row. These intervals cover every `m>=1` without a gap. This proof does not use the aggregate sign.

For an actual eligible row, `j=p-2>=x`. Also `2x<=N-2`, by `x+2<=p` and `2p<=N+2`. The binomial perturbation `zL^(N+1)` has strictly positive forward difference at `x`; hence `Delta_x C=Delta_x P-Delta_x(zL^(N+1))<0`. Since `C` has positive interval support and is log-concave, its successive coefficient ratios are nonincreasing, so `0<t=C[j+1]/C[j]<1`. The guards give `C[j]>0`, `D_j>0`, and `delta=N+3-p>1` (the guard `3p<2alpha+1` remains part of the scope).

Dividing the exact cross-multiplied payment by positive `delta C[j]` gives the equivalent inequality `(1-t+t/delta)A>=bD_j`. Under MASS, `A>=b delta D_j`; and

`(1-t+t/delta)-1/delta=(1-t)(1-1/delta)>0`.

So MASS implies payment, including the empty-selection case `b=A=0`. This also shows why the reverse implication is not used.

## Evidence and limitations

The composition script was copied into this scratch before execution. Its exact-fraction/algebra checks passed, but its finite sample points are sanity checks, not a universal proof. The producer composition report likewise explicitly leaves the prefix, scalar certificate, and local-bound estimates unaudited. No fresh mathematical witness was found or claimed.

`transport_audit.py` checks every byte listed by the common dispatch manifest, both transport clarification manifests, and the packet's exact case sources: 97 entries, 97 unique paths, zero mismatches. This verifies the shared-source clarification and critique runner seals. The copied producer manifest audit additionally reports 86/0 common-dispatch and 3/0 original transport members.

Replay from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 transport_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 source_manifest_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 source_composition_check.py
```

## Scope conclusion

- Conditional composition claim: retained, narrowed to the stated implication pending its quantitative premises.
- All-`m` selected MASS: open in this review; the `m>=238` source restriction and conditional proposed chain do not prove the registered all-`m` predicate here.
- All-`m` exact-ratio payment: open in this review; the exact implication from MASS is proved above, but the required all-`m` MASS premise remains unvalidated.
