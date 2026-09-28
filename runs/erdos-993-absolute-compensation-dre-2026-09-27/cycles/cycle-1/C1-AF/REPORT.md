# C1-AF neutral adjudication — F-origin cases

## Result and exact scope

The registered exact-ratio selected payment remains **OPEN** for all arity-2/3/4 ordinary path-stars. There is a useful, source-dependent **informal proof** of the stronger selected MASS inequality for every actual eligible lower-half row with `m>=266`. This is a consequence of intermediate estimates in `sources/predecessor/hybrid-family-proof.md`, not of its accepted aggregate conclusion. Its 86-layer scalar certificate and the final MASS arithmetic survive the independent checks below. The predecessor's perturbed mixed-minor and log-concavity estimates, which supply current-rank strict selection, retain their stated informal grade here. No all-`m` or formal award follows.

Use the contract's exact definitions: `N=sum_i r_i`, `q=N+1`, `alpha=N+2`, `P=C+zL^q`, `C=GQ`, `T_i=GF_(r_i)H_i`, `A0=LQ+zL^N`, `Ai=G B_(r_i-1)H_i+zL^N`, and `x=min{k natural: Delta_k P<0}` with zero extension. At each `p` satisfying **all three guards** `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`, set `j=p-2`, `delta=q-j`, `D_j=binom(N,j+1)-binom(N,j)`, `e0=1[Delta_p A0<0]`, `ei=1[Delta_p Ai<0]`, `b=e0+sum_i r_i ei`, and `A=sum_i r_i ei T_i[j]`. The target is `(delta*C[j]-(delta-1)*C[j+1])*A >= b*delta*D_j*C[j]`. The original `r_i` tip-tag multiplicities and current-`p` strict tests are essential. In this domain `C[j]>0`, `delta,D_j>0`, and `0<C[j+1]/C[j]<1`.

The common dispatch manifest's 39 members, own manifest's four members, and all 53 packet-listed source members matched their SHA-256 seals. No inventory metadata was consulted for the mathematical decisions. Only the nine packet-authorized F cases and critics, the neutral contract, and named predecessor sources were read. The scripts below are independent code in this worker's output directory.

## Dispositions (each origin and new critic claim)

| Claim ID | Disposition and grade | Dependency and usefulness |
|---|---|---|
| `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-EXACT-RATIO-PAYMENT` | **Open universally.** Retain F1/F3 positive bounded evidence only. F1's exact retained `m<=40` census has 12,340 profiles and 4,422 eligible rows; F3 has 2,924 profiles/67 rows for `m<=24`, plus 91 profiles/708 rows in its `m=150` relabel ring. No negative payment margin was found in those scopes. | F1, F3, CT-F1, CU-F1, CT-F3 and CU-F3. These computations narrow a practical finite task but do not prove the universal predicate. The accepted selected aggregate and formal relative mark margin cannot certify absolute payment. |
| `C1-F2-ALL-SELECTED-INTERIOR-ASYMPTOTIC-PAYMENT` | **Retained**, conditional informal asymptotic proof. It assumes actual eligible `p`, `j/N in [epsilon,1/2]`, and every branch's current-`p` flag `ei=1`; its ratio grows at least `c_epsilon exp(c'_epsilon m)/N`. | F2, CT-F2, CU-F2. Retain the `h=0` summand of `F_r` (coefficient one), rather than referring to a unique constant term. Useful after a separate rank and selector theorem; it alone gives no explicit cutoff. |
| `C1-F2-EXACT-NEAR-DESCENT-MIXTURE-PROBES` | **Retained as bounded evidence.** Six stated profiles were checked; the homogeneous `r=2,m=150` profile has no eligible row. The other five have 8, 8, 8, 5, and 7 eligible rows, all positive, with all represented branch and endpoint flags on at their first eligible row. | F2 and two independent critic replays, CT-F2/CU-F2. These are not a universal selector rule. |
| `C1-CT-F2-TAIL-DISCHARGES-ASYMPTOTIC-PREMISES` | **Retained at source-dependent informal grade**, with its stronger MASS component separated below. For `m>=266`, the predecessor gives `5x>2N-1` and full strict selection at actual eligible lower-half rows, so `j/N in [1/3,1/2]` and every `ei=1`. | Depends on the predecessor's analytic intermediate rank, perturbed mixed-minor, and deletion log-concavity arguments. It legitimately removes both assumptions of the F2 entropy lemma without using aggregate `S<=0`. |
| `C1-CT-F2-TAIL-EXPLICIT-MASS-CUTOFF` | **Retained at source-dependent informal grade:** `A>=b delta D_j` for every actual eligible row with `m>=266`; hence exact-ratio payment there. The 86-layer base arithmetic and propagation were independently checked; strict selector saturation uses the predecessor's informal intermediate proof. | Strongest useful new consequence. It is not an all-`m` MASS result or a formal award. The precise proof and dependency audit follow. |
| `C1-CU-F2-EVENTUAL-EXACT-RATIO-PAYMENT-TAIL` | **Retained and sharpened:** its existential unspecified `M` follows from the conditional F2 entropy proof and predecessor rank/selection facts; the CT-F2 argument supplies the explicit informal cutoff `M=266` and even MASS. | Source-dependent. It contributes an independent route to an eventual tail, but no finite-prefix payment proof by itself. |
| `C1-F3-COFACTOR-NONNEGATIVITY-SHORTCUT` | **Retained in its source's negative polarity:** the claim says the universal nonnegative-cofactor shortcut has a counterexample. Exact eligible witness `(a2,a3,a4)=(0,12,10)`, `x=37`, `p=39`, all flags on, has `d3,d4<0`. | F3 and CU-F3, with independent replay below. CT-F3's `proposed_rejected` applies to the *positive* shortcut it reformulated; it does not reject F3's true negative counterexample statement. |
| `C1-CU-F3-UNIVERSAL-COFACTOR-SIGN-SHORTCUT` | **Rejected by exact counterexample.** The positive statement `ei=1 => Delta_(p-3)(F_(r_i)H_i)>=0` fails for both represented arities in that witness. | This blocks a sign-based selector proof route only. It does not refute the exact payment, MASS, or aggregate. |

## Independent audit of the explicit tail

The rank use is exact. The source's `5x>2N-1`, together with `j=p-2>=x`, gives `j/N>(2N-1)/(5N)>1/3` for `N>=532`. The lower-half guard gives `2j<=N-2`, hence `j/N<1/2`. The `3p` guard is retained. At the actual parent descent, the binomial parent summand is rising because `x<=j<=N/2-1`; thus `Delta_x P<0` also implies `Delta_x C<0`. The predecessor's positive perturbed deletion/parent mixed minors force each deletion polynomial to descend strictly at `x`. Its perturbed ordinary log-concavity for those deletion polynomials propagates that strict descent through the eligible `p`. This yields `e0=ei=1` at the **current** rank, not a profile-independent flag. The source proves these intermediate inequalities before it concludes its aggregate sign; neither this adjudication nor CT-F2 infers selection or MASS from the final aggregate.

Here is a direct audit of the numerical cofactor estimate. Put `h_i=G H_i` and `J=floor(N/2)+3`. In the product expansion of `H_i`, choose the `z` term in exactly `k` of the other `m-1` branches, and the `L^r` term elsewhere. For `1<=k<=86`, `r_i,r_h<=4` and coefficientwise monotonicity of binomial powers give

`h_i[j] >= sum_(k=1)^86 binom(m-1,k) binom(N-4k-4,j-k)`.

The summands are nonnegative and in support for `m>=266`, `N>=2m`, and `x<=j<=J`. For `s=0,1`, the ratio of the `k`th binomial in this sum to `binom(N,j-s)` decreases as `j` rises in this band. Cross multiplication leaves the positive denominator-minus-numerator

`(4k+4)j-(k-s)N+(3k+4+s)(1-s)-(k-s)s`.

For `s=0`, `j>(2N-1)/5` bounds this from below by `((3k+8)N+11k+16)/5>0`; for `s=1`, it bounds it below by `((3k+13)N-9k+1)/5>0` for `N>=532`, `k<=86`. Thus the worst rank is `J`. Since `J` lies above the binomial center, both `binom(N,J)` and `binom(N,J-1)` are at most `binom(N,J-1)`. Define `f_N(k)=binom(N-4k-4,J-k)/binom(N,J-1)`. Direct factorial cancellation gives the predecessor's two formulas for `f_(2n+1)(k)/f_(2n)(k)` and `f_(2n+2)(k)/f_(2n)(k)`; both exceed one for `n>=3k+7`. In the even step the numerator-minus-denominator at `n=t+3` is

`(4k^2+36k+80)t^2+(38k^2+348k+670)t+24k^2+672k+1320>0`.

Hence `f_N(k)>=f_(2m)(k)>=f_532(k)` for `N>=2m`, `m>=266`. Also `binom(m-1,k)/(2m+4)` increases with `m`: the adjacent comparison reduces exactly to `k(m+3)>=m`. The base scalar, checked by exact integers in `audit_tail.py`, is

`217*536*binom(532,268) < sum_(k=1)^86 binom(265,k) binom(528-4k,269-k)`.

Its left/right ratio is `0.963187007205...`. Because `j+1<=J+1<=2m+4`, these inequalities yield `h_i[j]>217(j+1)binom(N,j-s)` for both `s=0,1`, uniformly in every branch and profile. The source's error thresholds for the perturbed deletion and mark mixed minors and ordinary log-concavity are `217,208,150,80` times `epsilon*h_j^2`; its common curvature reserve is `h_j^2/(j+1)`. The bound just proved supplies `217(j+1)epsilon<1`, so it is on the correct strict side for all four stated thresholds. The local minor, ultra-log-concavity and small-factor estimates producing those constants remain source-proved informal inputs; this adjudication independently checks their scalar application, not a new formal certificate for them.

Now `F_(r_i)` contains the nonnegative `h=0` summand 1, so `T_i[j]>=h_i[j]`. Full branch selection gives `A=sum_i r_i T_i[j]>217N(j+1)binom(N,j)>(217/3)N^2 binom(N,j)`. Since `b=N+e0<=N+1`, `delta<=N+1`, and `j/N>1/3` implies `D_j<3binom(N,j)`, we have `b delta D_j<3(N+1)^2binom(N,j)<(217/3)N^2binom(N,j)<A` for `N>=532`. This is strict MASS. With `t=C[j+1]/C[j]` in `(0,1)`, `1-t+t/delta>=1/delta`, so MASS implies the registered exact-ratio payment. No selected aggregate inequality enters this deduction.

The independent `audit_tail.py` recomputes the exact 86-layer scalar and the stated parity identities at all `k=1..86`, and checks rank-ratio positivity over representative extreme arities and parities. The algebra above, not those sampled checks, supplies the all-parameter monotonicity. This is an **informal analytic tail** dependent on the predecessor's intermediate selection proof, even though its scalar base is exact integer arithmetic. It is not a governed Lean result and cannot change the universal MASS identity from OPEN.

## Independent control and finite horizons

`audit_control.py` directly reconstructs the polynomials at `(0,12,10)`. It finds `N=76`, `alpha=78`, `x=37`, `p=39`, `j=37`, `delta=40`; all guards hold (`39=x+2`, `117<157`, `78=alpha`). Current flags are `e0=e3=e4=1`, so `b=77`. It obtains `A=4472325726243360080460672`, `D_j=176733862787006701400`, `C[j]=157478041951335331301454`, `C[j+1]=156199033032808625559120`, and positive payment margin `841657089276596927110510442162384388444656818560`. The identity `A0-Ai=z^3F_(r_i)H_i` gives `d_i=Delta_p A0-Delta_p Ai`; exact slopes are `d3=-895239471360525542716` and `d4=-1240837532571249046896`. The F3 and CU-F3 literal graph-DP controls agree with this coefficient interpretation. The witness rejects only the universal cofactor sign shortcut.

`audit_horizons.py` parses retained F1 records without regenerating its census. The exhaustive `m<=40` file has 12,340 profiles/4,422 eligible rows. Its 250-profile targeted file has 203 rows, maximum `m=301` and maximum `N=1200`, at different profiles. Its separate 33-profile large-mix file has 238 rows, maximum `m=394` at `(189,171,34)` and maximum `N=1246` at `(105,32,235)`. Thus F1's wording “through `m=301,N=1200`” is accurate for the targeted file but understates the separate large-mix horizons; one must not combine the two maxima into one tested profile. The F3 relabel comparisons show newly represented selected classes and changing original tip counts, not loss of selection among unchanged tips.

The exact remaining finite-prefix obligation, **if** the predecessor-dependent `m>=266` tail is accepted and F1's bounded exact census is used, is the registered integer payment for **every** arity-count triple with `41<=m<=265` and every actual `p` passing all three guards, with fresh current-`p` strict flags and original tip multiplicities. There are `binom(268,3)-binom(43,3)=3,159,975` such count triples before filtering eligible rows. The predecessor's aggregate census over this interval is not a payment census and cannot discharge it. If a standalone proof independent of F1's retained computation is required, the finite obligation begins at `m=1`. No current finite minimum ratio or all-selected sample licenses extrapolation across the gap.

## Replay

From the experiment root, after admission:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-1/C1-AF/audit_tail.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-1/C1-AF/audit_control.py
PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-1/C1-AF/audit_horizons.py
```

The scripts write `tail-check.json`, `control-check.json`, and `horizon-check.json` beside themselves, so the replay paths work after admission. During this worker run they wrote only the assigned scratch directory. All computations use exact Python integers/rationals; decimals only summarize a strictly checked integer inequality. No background job remains.
