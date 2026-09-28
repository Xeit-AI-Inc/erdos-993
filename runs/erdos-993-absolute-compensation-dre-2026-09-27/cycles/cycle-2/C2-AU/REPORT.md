# C2-AU independent adjudication (orientation N)

## Scope and integrity

I reviewed exactly C2-U1/U2/U3 and C2-CT-U1/U2/U3 plus C2-CF-U1/U2/U3, the packet's nine same-origin cases. All 45 permitted case files match their packet SHA-256 digests; all 55 shared dispatch members match `manifests/C2-COMMON-DISPATCH.json`. Targeted lookup in the registered identity confirms the primary exact-ratio payment and all-`m` MASS are separately OPEN. The relative main-mark margin is formally verified; the family aggregate is computer-assisted. Neither certifies the stronger payment. No Lean build was run.

Throughout, `x` is the *least* natural strict descent of the zero-extended `P=C+zL^(N+1)` (including terminal), `p` satisfies `x+2<=p`, `3p<2(N+2)+1`, `2p<=N+2`, `j=p-2`, `delta=N+1-j`, and `D=binom(N,j+1)-binom(N,j)`. Flags are the actual strict `Delta_p A0<0` and `Delta_p Ai<0`; `w=sum_i r_i ei`, `b=e0+w`, `A=sum_i r_i ei T_i[j]`. Original branch tips retain multiplicity `r_i`. Empty selection is included.

## Dispositions and dependencies

| Claim ID | Disposition; grade | Dependency and precise finding |
|---|---|---|
| `C2-U1-FIXED-SUBSET-COFACTOR-BOUND` | Retained; informal proof | Depends on fixed-size subset identity, finite Jensen, `log(1+1/s)>=2/(2s+1)`, and positive degree-4 exponential Taylor floor. Valid for `0<=k<=M`, including empty cofactor. It does not pay a selected row automatically. |
| `C2-U1-LOCAL-SELECTED-MASS-SUFFICIENCY` | Retained; informal conditional proof | Depends on each selected `T_i[j]>=3 delta D/2` and `w>0`. Then `w>=2`, `A>=3w delta D/2>=b delta D`; MASS implies exact-ratio payment since `1-t+t/delta>=1/delta`, `0<t<1`. Endpoint-only is outside its premise. |
| `C2-U1-EXACT-TARGETED-OBSTRUCTION-CONTROLS` | Retained narrowly; bounded exact evidence | Eight producer profiles and listed eligible rows only, with key controls independently replayed by both critics. The negative cofactor slopes at `(0,12,10)`, decreasing spread quotient at `(0,10,13)->(1,8,14)`, and `m=173` floor failure each refute only their auxiliary shortcut. All tested full payment and MASS margins are positive. |
| `C2-U2-DISJOINT-BLOCK-OCCUPANCY-IDENTITY` | Retained; informal proof | Exact occupancy-vector count for arbitrary disjoint positive blocks and `0<=u<=M`; no independence of block occupancies. |
| `C2-U2-RATIONAL-POWER-AMGM-AND-ELEMENTARY-FLOOR` | Retained; informal proof | Depends on the identity. Finite AM-GM applies to `B=binom(M,u)>0` subset weights; the additive floor follows from `prod(1+x_i)>=1+sum x_i`. The additive inequality zero-extends for natural `u>M`; the AM-GM power form is stated only for `u<=M`. |
| `C2-U2-OCCUPANCY-TO-TI-COEFFICIENT-BRIDGE` | Retained; informal proof | Nonnegative convolution of the additive cofactor floor with `G F_r`; valid coefficientwise with zero extension. No eligibility or selector statement. |
| `C2-U2-ELEMENTARY-FLOOR-PAYS-SELECTED-PAYMENT` | Rejected; exact finite counterexample to this certificate | At all-arity-4 `m=173`, actual `x=336,p=338`, all flags on, the integer payment margin with `A_lower=692 U_4[336]` is negative. The true `A` yields positive payment and MASS margins. The floor fails to certify, not the primary. Full integers are in `independent_check.json`. |
| `C2-CT-U2-ALL-INTERACTION-OCCUPANCY-EXPANSION` | Retained; informal proof | Expand `prod_i(L^{r_i}+z)` by the factors choosing `z`: `Q[u]=sum_{J} binom(M-sum_{i in J}r_i,u-|J|)`. Exact at all natural indices with zero extension. This is the complete interaction expansion already implicit in the neutral center-choice identity; no payment follows. |
| `C2-U3-LOCAL-MASS-CUTOFF-238` | Retained narrowly; informal all-parameter coefficient proof | Correct the displayed singleton probability product numerator from `M-j-1-a` to `M-j-a`. The subsequent smaller-factor lower bound remains valid. The rank-band theorem is for `m>=238`, `5j>2N-1`, `2j<=N-2`; transfer to actual eligible rows depends on the first-descent bracket proved below. It gives every represented `T_i[j]>3 delta D/2`, independent of flags and aggregate. |
| `C2-U3-BRANCH-SELECTION-CONDITIONAL-MASS` | Retained; informal conditional proof | Depends on the repaired local coefficient theorem. For `m>=238`, `w>0` gives strict MASS; `w=e0=0` gives equality. Endpoint-only `e0=1,w=0` remains unpaid. Full branch saturation is unnecessary for this implication. |
| `C2-U3-ENDPOINT-ONLY-EXCLUSION-OPEN` | Retained as OPEN; missing independent selector lemma | No supplied selector-only proof establishes `e0=1 => w>0` on actual eligible rows. The accepted aggregate cannot serve as a proof of the stronger payment mechanism. |
| `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-EXACT-RATIO-PAYMENT` | Retained as OPEN; universal predicate unproved | Exact target `(delta C[j]-(delta-1)C[j+1])A >= b delta D C[j]`. The relative margin and aggregate do not imply it; finite positive cases do not settle it. No eligible negative full-payment witness appears in these cases. |
| `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-MARK-MASS-COMPENSATION` | Retained as OPEN; stronger universal predicate unproved | Exact target `A>=b delta D`, with the same actual descent, guards, selectors, zero extension and original multiplicities. The `m>=238` result is conditional; the separate registered `m>=266` source-dependent informal theorem is not a proof of all-`m` MASS. |

## Proof audit of the cutoff

For each local factor `f=G,B2,B3,B4` of degree `d`, direct inspection gives `3(k+1)f[k+1]>=2(d-k)f[k]` for every `0<=k<d`. Multiplying by the other nonnegative factors and summing product derivatives gives `3(j+1)C[j+1]>=2(N+1-j)C[j]`. Hence `Delta_j C>=0` when `5j<=2N-1`. The `zL^(N+1)` summand is strictly rising there, so `Delta_j P>0`. By the actual *first* descent, `5x>2N-1`. Since eligible `j=p-2>=x` and `2p<=N+2`, the rank band `5j>2N-1`, `2j<=N-2` follows without parent log-concavity or no-recovery.

For a branch `i`, put `M=N-r_i`; for any other block of size `s`, its correct singleton probability is

`p_s=s*(j/M)*prod_(a=0)^(s-2) (M-j-a)/(M-1-a)`.

The source's displayed equality with numerator `M-j-1-a` is false (e.g. `M=10,j=4,s=2` gives `8/15` versus `4/9`). The correct factors dominate the source's smaller factors. For `m>=238`, `N>=476`; the rank band yields `j/M>39/100`, each smaller factor `>48/100`, and thus `p_s>17/100` for `s=2,3,4`. Jensen and `log(1+1/s)>=2/(2s+1)>=2/9` give `H_i[j]/binom(M,j)>exp(17(m-1)/450)`. Also `binom(M,j)/binom(N,j)>(49/100)^4>1/18`, and `T_i[j]>=H_i[j]`. The exact degree-20 Taylor sum at `m=238` exceeds `(162/5)*238`; `exp(17(m-1)/450)/m` increases thereafter. As `N<=4m`, this gives `T_i[j]>(9/20)N binom(N,j)`.

Finally `delta D/binom(N,j)=(N+1-j)(N-2j-1)/(j+1)<3(N-3)/10<3N/10` on the same rank band. Thus `T_i[j]>3 delta D/2`. These are universal informal inequalities; the script checks only the local factor arithmetic and exact cutoff constant. The tail conclusion still needs an independent endpoint-only exclusion. If that selector lemma is proved, this route would prove unconditional MASS and payment for `m>=238`, leaving the finite prefix `m<=237` for an all-`m` proof.

## Independent finite replay

`independent_check.py` builds integer polynomials afresh for the all-arity-4 `m=173` ordinary path-star, scans the zero-extended parent for the least strict descent, computes both deletion differences at the actual `p`, and calculates the true and additive-floor payment margins. `independent_check.json` records profile, `n,N,alpha,x,p,j,delta`, all guards and flags, exact `C[j],C[j+1],D,U_4[j],T_4[j]`, and signed integer margins. It also checks the cutoff's rational Taylor and local factor constants. Replay from the admitted run root:

```sh
cd cycles/cycle-2/C2-AU
PYTHONDONTWRITEBYTECODE=1 python3 independent_check.py
```

The all-arity-4 row has `N=692,n=868,alpha=694,x=336,p=338,j=336,delta=357`, `e0=ei=1`, `b=693`. The floor margin is strictly negative; the true payment and MASS margins are strictly positive. This is a bounded adversarial check, distinct from the universal proofs and from formal verification.

## Remaining obligations

An independent proof of endpoint-only exclusion is the tail's exact selector gap. For `m<=237`, either sharpen the occupancy/Jensen bound with enough `GF_r` shifts and actual flags, or give a compact exact certificate; the existing selected aggregate census cannot be substituted for payment. No new formal award is claimed.
