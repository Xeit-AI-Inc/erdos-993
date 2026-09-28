# C4-AU independent adjudication (orientation N)

All 53 packet-listed files and all 174 common-dispatch members matched their SHA-256 entries. I read the three U-origin cases and six assigned cross critics, with targeted registry lookup for the guarded shifted-C keys and payment context. Source cases are evidence, not authority. No Lean build or graph census expansion was used. Replay from this top-level directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 C4-AU-U1-producer-copy.py > C4-AU-U1-producer-replay.txt
PYTHONDONTWRITEBYTECODE=1 python3 C4-AU-U3-producer-copy.py > C4-AU-U3-producer-replay.txt
mv shifted_audit.json C4-AU-U3-producer-replay.json
PYTHONDONTWRITEBYTECODE=1 python3 C4-AU-independent-audit.py
```

The producer scripts were copied before execution. The independent script reconstructs integer polynomials from `L=[1,1]`, `G=[1,2]`, and `B_r=L^r+z`; it recomputes first strict descent, exact guards, current-rank deletion selectors, payment margins, and guarded cross products. Its full integer evidence is `cycles/cycle-4/C4-AU/C4-AU-independent-evidence.json`. All output files are top-level. The scripts do not write bytecode when replayed as shown.

## Dispositions and dependency grades

| Required claim | Disposition | Exact scope and dependency |
|---|---|---|
| `C4-U1-DESCENT-BINOMIAL-OCCUPANCY-DRIFT` | retained; universal informal proof | Exact ordinary path-star, actual least strict parent descent and all three eligible-p guards. Depends on the coefficient identity and positive interval log-concavity of `C`, independently checked below. No selector/payment conclusion. CT-U1 and CF-U1 correctly retain it. |
| `C4-U1-CONDITIONED-DRIFT-BOUNDED-HORIZON` | retained; bounded exact evidence | 4,308 eligible count profiles with `m<=40` have `E_x D<=E_1 D`, replayed from the copied producer; CT-U1 and CF-U1 correctly limit this to `x` and this horizon. It is no universal conditional-mean theorem. |
| `C4-U2-R4-M173-DEPTH1-OBSTRUCTION` | retained; one-row exact obstruction | At the actual eligible homogeneous r4 row, the `a<=1` floor has negative payment margin and the full mass has positive margin. CT-U2 and CF-U2 correctly limit the refutation to the floor. |
| `C4-U2-R4-M173-DEPTH2-LOCAL-REPAIR` | retained; one-row exact repair | Adding `a=2` makes the surrogate margin positive. CT-U2 and CF-U2 correctly reject any uniform-depth inference. |
| `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` | retained OPEN; bounded evidence | Exact registered guard `1<=k`, `2k<=N+2`, every original deletion including `A0`. U3's 406,977 checks, repeated by CT-U3, cover only `Ai`; my separate 27,954 endpoint checks repair that finite coverage. CF-U3's targeted endpoint checks are valid but are not the full scan. Neither proof nor guarded counterexample exists here. |
| `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR` | retained OPEN; bounded evidence | `W=sum_i r_i Ai` with original multiplicities and the same rank guard. The 27,954 checked cross products through `m<=18` are finite only. All three U3 reports correctly leave the universal premise open. |
| `C4-U3-WEIGHTED-SHIFTED-LR-IMPLIES-STRICT-TIP-SELECTION` | retained; conditional universal informal proof | At an actual eligible `p`, the *assumed* weighted cross product, positive coefficients, log-concavity and actual descent imply at least one strict current-p tip selector. CT-U3 and CF-U3 check the same valid direction. The coefficient/descent hypotheses are automatic in this family, as shown below; the weighted premise remains open. |

The U1 illustrative row labels `n=78`; that is `alpha=N+2`, not the graph order. For `(a2,a3,a4)=(0,12,10)`, the ordinary tree has `3+m+N=101` vertices. This annotation error does not affect either U1 claim, which uses `N=76`, `q=77`, and `alpha=78` correctly.

## Universal arguments and inequality directions

Set `Q=prod_i B_(r_i)`, `H_i=Q/B_(r_i)`, `C=GQ`, `q=N+1`, and condition the product coefficient model on total degree `k`. The root has weights `(1,2)` and branch `i` has weights `[z^t]B_(r_i)`. For

`D=1[X0=0]+sum_i(1[Xi=0]-(r_i-1)/(r_i+1) 1[Xi=1])`,

the weighted numerator polynomial is `Q+G sum_i(1-(r_i-1)z)H_i`. Direct differentiation gives this exactly as `(1+z)C'-qC`: `(1+z)G'-G=1`, and `(1+z)B_r'-rB_r=1-(r-1)z`. The negative state-one weight belongs to this **equality** and is not used to multiply an inequality. Coefficient extraction and division by `C[k]>0` give

`E_k D=(k+1)C[k+1]/C[k]-(q-k)`.

At an actual eligible `p`, `j=p-2>=x` and `2j<=N-2`. Thus `beta_x=binom(q,x)-binom(q,x-1)>0`; the lower binomial argument is signed before zero extension, including `x=0`. Actual strict descent of `P=C+zL^q` gives `Delta_x C+beta_x=Delta_x P<0`, hence `C[x+1]/C[x]<1-beta_x/C[x]` after division by **positive** `C[x]`. The coefficient vectors `G=(1,2)`, `B2=(1,3,1)`, `B3=(1,4,3,1)`, `B4=(1,5,6,4,1)` are positive interval log-concave. For a finite positive interval sequence, its Toeplitz convolution matrix has nonnegative 2-by-2 minors exactly when its adjacent ratios decrease; Cauchy-Binet makes products of these matrices retain nonnegative minors. Thus convolution preserves this property, and `C` has nonincreasing adjacent ratios. Since `x<=j`, multiplication by positive `j+1` preserves the order and proves

`E_j D<2j-N-(j+1)beta_x/C[x]<2j-N`.

The independent boundary substitution `(0,12,10), x=j=37, p=39` gives `beta_x=1261276298816540508040`, `Delta_x C=-1279008918526705742334`, `C[x]=157478041951335331301454`, and `E_j D=-60593070467780913468600/26246340325222555216909 < -181442291628849600954214/78739020975667665650727 < -2`. The interior substitution `(0,10,28), x=69, j=70, p=72` gives `C[j+1]/C[j] <= C[x+1]/C[x]` by exact rational cross multiplication; both strict corrected bounds are recorded in the independent JSON. These checks audit signs; the log-concavity argument supplies the universal step. The finite `E_xD<=E_1D` probe cannot replace the conditional expectation by its fugacity-one value in this proof or in a selected-mass argument.

For the weighted selector bridge, eligibility gives `p>=x+2`, so `C[p]/C[p-1]<=C[x+1]/C[x]<1`. Each `Ai[p]` contains the positive `zL^N` coefficient on this guarded rank, hence `W[p]>0`; `C[p-1]>0` too. Dividing `W[p+1]C[p-1]<=W[p]C[p]` by the positive `W[p]C[p-1]` preserves order and yields `W[p+1]/W[p]<1`. Therefore `Delta_p W=sum_i r_i Delta_p Ai<0`. Since every original `r_i>0`, at least one `Delta_p Ai<0`. The individual LR premise at `p` would likewise make **every** `Ai` and `A0` strictly descend; summing its tip inequalities with positive `r_i` also implies weighted LR. These are conditional consequences, not proofs of either LR premise. The registered all-rank obstruction `(38,0,1), N=80, k=77` has exact r4-tip margin `-49239834336`, but `2k=154>N+2=82`; it is not a guarded counterexample.

## Exact layer witness and valid local repair

For `m=173` arity-4 branches, `N=692`, graph order `n=868`, `q=693`, `alpha=694`, the independent product gives the actual least strict descent `x=336` and `p=338`, `j=336`, `delta=357`. The guards are `x+2=p`, `3p=1014<1389=2alpha+1`, `2p=676<=694`; endpoint and all 692 original private-tip tags are strictly selected, so `b=693`, `A=692 T_i[j]`. The independent JSON records the exact `C[j]`, `C[j+1]`, `D_j`, `K`, each layer, and all three **signed integer** margins.

The polynomial basis check is explicit: `F4=1+L+L^2=(3,3,1)` in monomial `z`, and `G F4=(3,9,7,2)`. Thus

`T_i[j]=sum_(a=0)^172 binom(172,a) sum_(s=0)^3 g_s binom(4(172-a),j-a-s)`, `g=(3,9,7,2)`.

Exact accumulation agrees with direct multiplication of `G F4 B4^172`. Write `K=delta*C[j]-(delta-1)*C[j+1]=C[j]+(delta-1)(C[j]-C[j+1])>0` and `M_d=K*(692 sum_(a<=d) layer_a)-693*delta*D_j*C[j]`. The independent signed margins have `M_1<0<M_2<=M_172`, with full equality `M_172=K*A-b*delta*D_j*C[j]`; their full decimal integers are in the JSON. Adding a nonnegative layer increases `M_d` because **K and 692 are positive**. Subtracting the debt from both sides preserves order; multiplying that inequality by `-1` would reverse it. The normalized multiplier `1-(1-1/delta)t` for `t=C[j+1]/C[j]` equals `1`, `179/357`, `1/357` at `t=0,1/2,1`, respectively, and is positive throughout. This local repair does not establish a uniform layer-depth or tail bound.

For a fixed positive layer term, cancellation gives the claimed adjacent ratio with `n=4(172-a)` and `k=j-a-s`. My independent exact checks yield `2471040/219611>1` at `(a,s)=(0,0)` and `15269464/661871655<1` at `(80,2)`. All canceled factors are positive where both terms are positive; at zero-term boundaries division is unavailable. These opposite interior directions rule out a uniform one-direction layer-ratio bound from the identity alone.

## Bounded shifted-C audit correction

The copied U3 scan checks 1,329 profiles through `m=18`, 406,977 `Ai` comparisons, and 27,954 weighted comparisons, with no negative margin. Its loop is `for A in As`; it never tests `A0`. CT-U3's statement that these 406,977 comparisons cover every original deletion is therefore an invalid evidence argument, even though its universal OPEN disposition is sound. I separately built `A0=LQ+zL^N` from exact monomial coefficients and tested all 27,954 guarded `(profile,k)` cases: no negative margin; the minimum was `19` at `(a2,a3,a4)=(1,0,0), N=2, k=1`. This repairs bounded coverage only. At the actual `(0,22,0)` row, `x=32`, `p=34`, `N=66`, `alpha=68`, the independent weighted cross-product margin is `232296700581653155847056681562532686593824>0`, while `Delta_p W=-1487457400844219699268<0`; all 22 branch flags are strict. The endpoint margin is positive at that row as well. No sample upgrades either all-parameter LR claim.

The prior all-m selected MASS and exact-ratio payment remain at their registered computer-assisted/nonformal grade. None of these seven dispositions is a governed formal award or a new primary proof. The new drift bound still lacks a selector-weighted mass estimate; the local depth repair lacks a uniform remainder mechanism; the guarded LR premises remain open.
