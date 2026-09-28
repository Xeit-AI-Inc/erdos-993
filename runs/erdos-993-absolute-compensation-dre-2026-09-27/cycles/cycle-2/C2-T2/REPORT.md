# C2-T2 — strict selector threshold and endpoint-only search

## Scope and result

The registered exact-ratio payment remains **OPEN** from this search. I found no endpoint-only selection row in an exact fresh scan of every arity-count profile with `1 <= m <= 80` and every actual eligible lower-half rank. The scan gives bounded evidence for endpoint exclusion and full selection only; it does not prove either for all parameters. I also found no endpoint-only row in five exact controls, including the fresh homogeneous arity-4 profile `m=173`.

The exact selector geometry is useful and proved below. Write

`u = Delta_p A0`, `d_i = Delta_(p-3)(F_(r_i) H_i)`.

At the actual current rank `p`,

`e0=1 iff u<0`, and `ei=1 iff d_i>u`.

Thus endpoint-only selection is exactly `u<0` and `d_i<=u` for every present arity class. Endpoint selection alone does not imply that any `d_i` is nonnegative. In the `(a2,a3,a4)=(0,12,10)` control, both cofactor slopes are negative, yet each exceeds `u`, so both branch classes are strictly selected.

## Exact selector theorem

For each branch of arity `r`, `A0-Ai=z^3 F_r H_i`. Forward differences commute with coefficient shifts, hence

`Delta_p A0 - Delta_p Ai = Delta_p(z^3 F_r H_i) = Delta_(p-3)(F_r H_i) = d_i`.

Therefore `Delta_p Ai=u-d_i`, and the strict selector `ei=1[Delta_p Ai<0]` is equivalent to `d_i>u`. This handles equality correctly: when `d_i=u`, `Delta_p Ai=0` and the strict selector is off. All branches of the same arity have the same selector because their cofactor polynomials agree. No sign restriction on `d_i` is used.

For an endpoint-only row, `A=0`, `b=1`. Under the eligible lower-half guards, `D_j=binom(N,j+1)-binom(N,j)>0`, `delta>0`, and `C[j]>0`. The exact integer payment margin is consequently

`M=(delta*C[j]-(delta-1)*C[j+1])*A-b*delta*D_j*C[j] = -delta*D_j*C[j] < 0`.

So the registered payment implies endpoint-only exclusion. This implication does not independently establish endpoint-only exclusion: proving the payment is the unresolved problem. I did not use the accepted selected-aggregate conclusion to infer the exclusion.

The first-descent bracket also remains available without a parent no-recovery assumption. Let `beta_k=binom(q,k)-binom(q,k-1)`, with zero extension. Minimality of `x` gives `Delta_(x-1) C >= -beta_(x-1)` and `Delta_x C < -beta_x`. The guards imply `x <= N/2-1`, so `beta_x>0` and `Delta_x C<0`. Since `C=G product B_(r_i)` is positive-interval log-concave, its adjacent coefficient ratios decrease. As `j>=x`, this proves `0<C[j+1]/C[j]<1`. The same argument supplies no sign for `Delta_p A0` or `Delta_p Ai` at later ranks, so it does not by itself exclude endpoint-only selection.

## Exact fresh tests

The own-scratch evaluator uses Python integer arithmetic, computes the first strict descent with zero-extended forward differences, and checks the three guards at each row: `x+2<=p`, `3p<2alpha+1`, and `2p<=alpha`. It constructs the profile product both by the differential recurrence and, for named controls, by direct multiplication. It checks the two first-descent inequalities and the full polynomial identity `A0-Ai=z^3 F_r H_i` on the controls. The scan covers 91,880 profiles and 133,194 eligible rows for `1<=m<=80`; endpoint-selected rows: 133,194; endpoint-only rows: 0; rows with endpoint and every present arity class selected: 133,194.

The following controls are freshly replayed with direct product construction and actual strict flags:

| `(a2,a3,a4)` | `m,N,alpha,x` | eligible `p` | endpoint-only | endpoint plus all branch classes |
|---|---:|---:|---:|---:|
| `(0,12,10)` | `22,76,78,37` | `39` | none | `39` |
| `(0,12,11)` | `23,80,82,39` | `41` | none | `41` |
| `(0,10,13)` | `23,82,84,40` | `42` | none | `42` |
| `(1,8,14)` | `23,82,84,40` | `42` | none | `42` |
| `(0,0,173)` | `173,692,694,336` | `338..347` | none | all ten ranks |

For `(0,12,10)` at `p=39`, `j=37`, `delta=40`, both guards hold with equality only in `2p=alpha`. The endpoint slope is `u=-11319302108154726892710`. The arity-3 values are `d_3=-895239471360525542716` and `Delta_p A_3=-10424062636794201349994`; the arity-4 values are `d_4=-1240837532571249046896` and `Delta_p A_4=-10078464575583477845814`. Thus `u<0`, `d_3,d_4<0`, but `d_3,d_4>u`, and `e0=e3=e4=1`. This is a fresh check of why a nonnegative-cofactor-slope shortcut cannot prove full selection.

These tests do not support a universal endpoint-exclusion theorem or full-selection theorem. In particular, strict selector status is evaluated at each displayed `p`, and the scan's profile/rank horizon is finite.

## Replay and evidence

From the run root:

`PYTHONDONTWRITEBYTECODE=1 python3 scratchpad/C2-T2/selector_audit.py`

The deterministic result is `scratchpad/C2-T2/selector-audit.json`. The common dispatch seal checked 55/55 members and the C2-T2 dispatch seal checked 4/4; no unrelated inventory contents were displayed. A preliminary direct-convolution scan was stopped when its runtime became excessive; it produced no result used here. The optimized exact scan and the separate direct-multiplication controls above completed. No background process remains.

No external result or accepted aggregate statement is used in the selector theorem or the payment-implication calculation. The registered all-parameter primary, endpoint-only exclusion, and full selection at all actual eligible lower-half ranks remain open.
