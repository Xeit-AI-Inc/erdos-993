# C4-CT-U2 critique

## Source and scope

All 174 files in `manifests/C4-COMMON-DISPATCH.json` matched their SHA-256 entries; all seven files in `packets/C4-CT-U2.json` also matched. The packet's two required IDs are worker-case claims; targeted lookup found no exact IDs in the registered-identity snapshot. I review their statements at the case-supplied scope and do not promote their status.

I copied both allowed packet scripts into this scratch before replay. The literal-tree replay independently checks graph polynomials, the actual least strict descent, and endpoint/tip selector predicates. A separate direct-factor script cross-checks the coefficient arithmetic and basis.

## Exact audit

For the homogeneous r=4 profile, the replay gives `m=173`, `n=868`, `N=692`, `alpha=694`, `x=336`, `p=338`, `j=336`, `delta=357`. The guards hold: `x+2=p`, `3p=1014<1389=2alpha+1`, and `2p=676<=alpha`. With zero-extended coefficients, the endpoint and every private-tip tag satisfy the strict current-p selector, so original multiplicities give `b=693` and `A=692 T_i[j]`.

The exact polynomial check expands in monomial `z`: `B4=[1,5,6,4,1]` and `G F4=[3,9,7,2]`. In particular the latter is not an `L=1+z`-basis list. The layer identity

`T_i[j]=sum_(a=0)^(m-1) binom(m-1,a) sum_(s=0)^3 g_s binom(4(m-1-a),j-a-s)`, `g=(3,9,7,2)`,

is accumulated with exact integers and agrees with direct multiplication of `G F4 B4^(m-1)`.

For the payment comparison, set `K=delta*C[j]-(delta-1)*C[j+1]`. The independently checked coefficients have `C[j]>C[j+1]>0` and `D_j>0`; hence `K=C[j]+(delta-1)(C[j]-C[j+1])>0`. Thus multiplying by `K` preserves order, and dividing the exact inequality by positive `delta*C[j]` preserves order as well. The normalized multiplier is `kappa=1-(1-1/delta)t`, `t=C[j+1]/C[j]`; exact boundary/interior substitutions `t=0,1/2,1` give `1,179/357,1/357`, all positive. No inequality is multiplied or divided by a negative quantity.

## Claim dispositions

- **C4-U2-R4-M173-DEPTH1-OBSTRUCTION — retain as bounded exact evidence.** The floor retaining layers `a=0,1` has exact negative signed payment margin, while the full `T_i[j]` margin is positive. This refutes only that depth-one surrogate on this one eligible row. It does not refute full selected MASS or full exact-ratio payment.
- **C4-U2-R4-M173-DEPTH2-LOCAL-REPAIR — retain as bounded exact evidence.** Adding the `a=2` layer changes the surrogate margin to positive on the same row; the layer increments are nonnegative, and the packet's full prefix audit finds the first sufficient depth at 2. This is no uniform depth or tail estimate and does not prove a payment theorem.

Exact `C[j]`, `C[j+1]`, `D_j`, full `T_i[j]`, layer sums, and signed margins are retained in `independent_factor_check.json`, alongside the independent actual-selector replay in `truncation_literal_check_independent.json` and the packet layer audit in `depth_remainder_audit.json`. The signed depth-one, depth-two, and full margins respectively are negative, positive, and positive.

The valid local repair is the exact center-subset coefficient expansion with its `a=2` contribution at this witness. The invalid inference would be to use that one-row repair, or a fixed-depth truncation, as a universal bound. No universal layer-depth estimate, new selector implication, or all-parameter theorem follows. The existing computer-assisted all-m results and coefficient-only formal expansion remain at their separate scopes and grades.

## Replay

From this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 truncation_literal_check_independent.py
PYTHONDONTWRITEBYTECODE=1 python3 depth_remainder_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_factor_check.py
```

All arithmetic is exact integer arithmetic except no floating-point quantity is used in the independent check; the reported normalized boundary/interior values are exact rationals. No Lean build or background process was used.
