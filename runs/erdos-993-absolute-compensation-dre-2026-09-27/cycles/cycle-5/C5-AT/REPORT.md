# C5-AT neutral adjudication, orientation N

## Inputs and evidence boundary

I inspected exactly C5-T1/T2/T3 and C5-CF-T1/CU-T1/CF-T2/CU-T2/CF-T3/CU-T3, the authorized neutral sources, and targeted registered identities. `C5_AT_hash_audit.py` finds **0 mismatches** among 237 common-dispatch members and 57 packet-listed case members. The original case scripts were read as evidence; none was executed in a producer directory. `C5_AT_independent_audit.py` independently constructs the displayed polynomials in monomial powers of `z`, with integer convolution, zero extension, original tip multiplicities, actual first-descent scanning, and strict current-`p` flags. Both scripts and their JSON outputs are top-level artifacts.

These are proposed adjudication dispositions, not registry updates. The three registered universal claims below remain **OPEN**. Their finite positive rows are bounded exact evidence, while the algebraic implications are informal proofs conditional on their stated inputs. No governed Lean award is claimed.

## Origin and critic cases

| Case | Disposition at submitted scope | Specific audit finding |
|---|---|---|
| C5-T1 | Retain the exact branch-addition identities and guard-strip obstruction; retain weighted LR only as OPEN. | The signed correction and every new guard strip are real. Four independent recurrence replays match. No invariant controlling the minors is supplied. |
| C5-CF-T1 | Retain, narrowed to an open-predicate critique and finite checks. | Its E-only negative example and positive weighted minor agree with independent reconstruction. |
| C5-CU-T1 | Retain, narrowed to an open-predicate critique and finite checks. | Its positive-sum and signed-correction directions are valid; its scan is bounded. |
| C5-T2 | Retain the activity obstruction narrowly; retain individual, weighted, and surplus predicates as OPEN. Reject the **printed** large-profile full-tip integer at `k=27`. | The report prints `777419068009671422357461153834912453824`; its JSON, both critics, registry witness, and my direct computation give `777419068009671422357461955841645743808`. Both are positive, so the conclusion about this example survives the correction. |
| C5-CF-T2 | Retain, narrowed to exact finite obstruction and conditional implications. | Independent activity and corrected tip calculations agree. No universal switching proof is present. |
| C5-CU-T2 | Retain, narrowed to exact finite obstruction and conditional implications. | It correctly identifies the transcription error and the one-way individual-to-weighted implication. |
| C5-T3 | Retain the conditional ULC/LR reduction and exact diagnostics; surplus stays OPEN. | The lower bound has the correct direction; the required universal E-deficit compensation is absent. |
| C5-CF-T3 | Retain, narrowed to a conditional reduction and bounded checks. | Its coarse-floor failure and positive exact surplus agree at the checked ranks. |
| C5-CU-T3 | Retain, narrowed to a conditional reduction and bounded checks. | Its caution about the floor and old tail criterion is correct. |

No critic adds a distinct new claim ID beyond the four required IDs; their conclusions are adjudicated in those rows. Agreement among cases is not used as proof.

## Exact algebra, directions, and tested ranks

Set `E=zL^N`, `U=sum_i r_i G B_(r_i-1)H_i`, `W=U+N E`, and `M_k(V)=V[k]C[k]-V[k+1]C[k-1]`. Appending an arity-`r` branch gives `C'=B_r C`, `U'=B_r U+rB_(r-1)C`, `E'=L^r E`, and

`W'=B_rW+rB_(r-1)C+(rL^r-Nz)E`.

Expansion of the last residual gives `((N+r)L^r-N(L^r+z))E`; its `z` coefficient before multiplication by E is `r^2-N`, which is `-57` for 22 arity-3 branches followed by another arity-3 branch. A nonnegative coefficient recurrence therefore does not follow, and polynomial coefficient signs alone would not prove the shifted minor anyway. The old guard ends at `g(N)=floor((N+2)/2)`; addition admits 1 new rank for `r=2`, 1 or 2 for `r=3` according to parity, and 2 for `r=4`. The unproved induction obligation includes those strips. This is an exact algebraic obstruction to the proposed recurrence proof, not a guarded counterexample.

For the T2 obstruction, with `(a2,a3,a4)=(0,0,3)`, `N=12`, `n=18`, `C_t=GB4(L^4+tz)^2`, `A_{i,t}=GB3(L^4+tz)^2+zL^12`, and guarded `k=7`, direct bivariate expansion gives the minor's `t` coefficients `(1898616,171542,6175,-66,0)`. The evaluated `t=1` minor is `2076267>0`. Boundary/interior `k=1,4` layers are `(126,40,3,0,0)` and `(326220,164806,33688,3290,127)`, respectively. The actual parent first strict descent is `x=7`; `p>=x+2=9` conflicts with `2p<=alpha=14`. Thus the negative layer refutes coefficientwise positivity of this particular certificate and nothing stronger. The basis check is explicit: `B2=(1,3,1)`, `B3=(1,4,3,1)`, `B4=(1,5,6,4,1)` in `z`; `F4` has **L-basis** coefficients `(1,1,1)` and **z-basis** coefficients `(3,3,1)`, giving `GF4=(3,9,7,2)` in `z`. Treating an L-basis list as a z-basis list is rejected.

For the T3 conditional reduction, let `h=1+2a2+4a3+7a4` and `d=(k+1)(h-k+1)`. On `1<=k`, `2k<=N+2`, one has `h>=N+1`, `d>0`, and `C[k],C[k+1]>0`. The sourced main-product ratio inequality `U_i[k+1] C[k]<=U_i[k] C[k+1]`, multiplied by nonnegative `C[k-1]/C[k]`, and the sourced order-`h` ULC curvature bound imply

`M_k(U_i)>=((h+1)/d) U_i[k]C[k]`.

Consequently `(h+1)U_i[k]C[k]+d M_k(E)>=0` implies `M_k(A_i)>=0` because `A_i=U_i+E`. Multiplication or division by positive `d`, `C[k]`, and `3k` preserves order. If a negative `M_k(E)` is multiplied by an inequality, the inequality direction **reverses**; therefore no proof may replace that deficit by zero or assume it positive. Likewise the original multiplicities `r_i>0` preserve order when summing `M_k(A_i)>=0` to obtain `M_k(W)>=0`; the reverse implication is not justified. The old `217(j+1)epsilon<1` tail certificate does not supply this all-guard exact-ratio premise. The endpoint `A0` is separate.

The coarse substitution `C[k]/C[k-1]>=2(N+2-k)/(3k)` has the correct lower-bound direction: after substitution and multiplication by positive `3k`, the proposed sufficient margin is `2(N+2-k)(h+1)U_i[k]-E[k](N-k-1)d`. It is `-87840` at `(0,0,4), k=8`, while the exact surplus is `45380234160>0`. More pointedly, at `(0,0,24)`, `N=96`, `n=123`, `x=47`, `p=k=49`, the guards are `x+2=49<=p`, `3p=147<197=2alpha+1`, and `2p=98=alpha`; the current strict flags are `e0=ei=1`, with original selected tag count `b=1+24*4=97`. The coarse margin is `-1134884788104385426929377214036680`, while the exact surplus is `416966184785614418980331915462512401919889476953795417377960>0`. A negative *lower bound* is inconclusive for a positive target. Inferring failure of the exact surplus from it reverses the logical implication and is rejected.

The standing E-only control is also independently reproduced: at `(0,22,0)`, `N=66`, `n=91`, `x=32`, guarded `k=27`, `M_k(E)=-518620474811633289768751398606375936`, but corrected `M_k(A_i)=777419068009671422357461955841645743808>0` and `M_k(W)=51309658488638313875592489085548619091328>0`. Here actual eligible `p=34` has `x+2=p`, `3p=102<137`, `2p=68=alpha`, and current flags `e0=ei=1`, `b=1+22*3=67`; the guarded example at `k=27` is **not** the actual eligible rank. At the actual `j=p-2=32`, the full tip minor is `4379201511889896286434389991529125770579>0`. The independent JSON also records boundary `k=1`, interior `k=27,32`, and upper guard `k=34`, including the ULC and main-ratio cross-product margins. All are sample checks, not universal certificates.

## Proposed claim dispositions and dependencies

| Required claim | Proposed disposition | Evidence grade and remaining dependency |
|---|---|---|
| `C5-T2-ACTIVITY-BASIS-NEGATIVE-LAYER` | **retained_narrowed** | Exact finite integer refutation of coefficientwise nonnegativity for the displayed `t` expansion at `(0,0,3),k=7`; no actual eligible `p`. |
| `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` | **retained** as OPEN | Exact guarded predicate for every original endpoint/tip deletion. The tip sufficient condition remains OPEN and endpoint needs its own proof. Finite positive examples are bounded evidence. |
| `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR` | **retained** as OPEN | Original-multiplicity `W=sum_i r_i A_i`; recurrence and positive-sum implications are informal algebra. A uniform signed-E compensation and new-strip proof are missing. |
| `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS` | **retained** as OPEN | Sufficient for each tip minor only conditional on sourced main-product LR and enlarged-order ULC; its own universal nonnegative margin has neither proof nor guarded counterexample. |

The registered guarded predicates have no actual-eligibility premise. Applying any eventual comparison to the selected payment must separately preserve `x` as the first strict descent (including terminal degree), `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`, current-`p` strict selectors, and original tag multiplicities. The existing computer-assisted selected result and formal relative margin do not award these proposed structural claims.

## Replay

From `cycles/cycle-5/C5-AT/` (or this scratch directory):

```sh
PYTHONDONTWRITEBYTECODE=1 python3 C5_AT_hash_audit.py > C5_AT_hash_audit.json
PYTHONDONTWRITEBYTECODE=1 python3 C5_AT_independent_audit.py > C5_AT_independent_audit.json
```

No background process remains. No Lean build, source edit, installation, or controller operation was used.
