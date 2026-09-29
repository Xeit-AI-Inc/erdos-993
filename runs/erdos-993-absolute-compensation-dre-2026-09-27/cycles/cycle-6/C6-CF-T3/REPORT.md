# C6-CF-T3 independent critique

## Dispositions

- `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`: **open**. No proof or counterexample to the universal all-profile/all-guard premise was found. The bridge below cannot establish it.
- `C6-T3-CONDITIONAL-ALL-LEAF-SHIFTED-C-COMPARISON`: **retain with a proof repair**. The conditional endpoint/tip result follows, but one displayed local pair and the accompanying finite check do not match the defined tip polynomial.
- `C6-T3-CONDITIONAL-SAME-C-WEIGHTED-TIP-DECK`: **retain with the same proof repair**. It follows by linearity and the original positive multiplicities once the individual tip comparison is repaired.

These are proposed critic dispositions, not registry changes. They concern only ordinary path-stars and the stated lower-half guard. They do not change the OPEN primary selected payment/MASS statuses or imply an arbitrary-tree or Erdős993 result.

## Exact bridge review

Use `U_i=G B_{r_i-1}H_i`, `U_0=LQ`, `E=zL^N`, and `A_v=U_v+E`. Set
\[
M_k(X)=X[k]C[k]-X[k+1]C[k-1],\qquad
\lambda_k=\frac{h+1}{(k+1)(h-k+1)}.
\]
The surplus premise, after division by the positive integer `(k+1)(h-k+1)`, is exactly
\[
M_k(E)+\lambda_k U_i[k]C[k]\ge0.
\]
All divisions in this step are by positive factors: `k>=1`, `2k<=N+2`, and `h>=N+1` give `h-k+1>0`.

The ULC rearrangement in the source is correct. With
\[
R=\frac{(k+1)(h-k+1)}{k(h-k)}>0,
\]
ULC says `C[k+1]C[k-1]/C[k] <= C[k]/R`. Thus
\[
C[k]-\frac{C[k+1]C[k-1]}{C[k]}
\ge (1-1/R)C[k]
=\lambda_k C[k].
\]
Here `1-1/R` has the displayed positive value because the numerator difference is `(k+1)(h-k+1)-k(h-k)=h+1`; no inequality is reversed. The main-product LR inequality `U[k+1]C[k] <= U[k]C[k+1]`, divided by `C[k]>0`, then gives
\[
M_k(U)\ge U[k]\left(C[k]-\frac{C[k+1]C[k-1]}{C[k]}\right)
\ge\lambda_k U[k]C[k].
\]
Adding the E premise proves `M_k(A_i)>=0`.

For the endpoint, the exact identity
\[
U_0-U_i=(LB_{r_i}-GB_{r_i-1})H_i
=z^2(L^{r_i-1}-1)H_i\ge0
\]
is coefficientwise, including `r_i=2` where the factor is `z^3`. Since `lambda_k C[k]>0`, multiplying this coefficient comparison preserves its direction. Therefore the tip premise implies the corresponding endpoint curvature premise. The endpoint main-product LR inequality gives `M_k(U_0)>=lambda_k U_0[k]C[k]`; adding `M_k(E)` proves `M_k(A_0)>=0`. This uses a separate endpoint LR argument; coefficientwise dominance alone would not justify a shifted-minor comparison.

Finally, `M_k` is linear in its first argument, so `M_k(sum_i r_i A_i)=sum_i r_i M_k(A_i)>=0`; every multiplier `r_i` is positive and is the original tip multiplicity. This proves the conditional weighted claim without changing tags or selectors. The larger all-guard conditional statements need no actual-descent filter. Applying them at a selected current rank still requires the stated actual first descent `x`, all three eligibility guards, and strict flags evaluated at that same `p`; none can be replaced by a nearby-rank flag. The bridge does not itself prove the universal surplus premise or the actual-descent facts used by that application.

## Proof defect and exact repair

The source defines `U_i=G B_(r_i-1)H_i` and `C=G B_(r_i)H_i`, but its tip main-product LR paragraph says the local pair is `(F_(r_i),B_(r_i))`. That is a different polynomial: `F_r=sum_{s=0}^{r-2}L^s` belongs to the marked polynomial `T_i`, not to `U_i`. Its `bridge_checks.py` also checks `(F_r,B_r)` and never checks the required `(B_(r-1),B_r)` pair. The displayed argument and its script therefore do not verify the stated tip LR step.

There is a finite exact repair for the three allowed arities: use `(B_(r-1),B_r)`. Their coefficient arrays and all zero-extended ordered minors `a_u b_v-a_v b_u` are:

- `r=2`: `[1,2]`, `[1,3,1]`; minors `(0,1,1),(0,2,1),(1,2,2)`.
- `r=3`: `[1,3,1]`, `[1,4,3,1]`; minors `(0,1,1),(0,2,2),(0,3,1),(1,2,5),(1,3,3),(2,3,1)`.
- `r=4`: `[1,4,3,1]`, `[1,5,6,4,1]`; minors `(0,1,1),(0,2,3),(0,3,3),(0,4,1),(1,2,9),(1,3,11),(1,4,4),(2,3,6),(2,4,3),(3,4,1)`.

All are nonnegative. The common factor `GH_i` has positive interval support and is log-concave; its Toeplitz matrix is TP2, so convolution preserves these ordered minors (by Cauchy–Binet). This supplies the missing tip LR step. For the endpoint the local pair remains `(L,G)` with common factor `Q`; its sole nonzero ordered minor is `1`, and `Q` is positive-interval log-concave. The separate endpoint argument is sound.

The script's reported `(F_r,B_r)` minors are themselves nonnegative but are irrelevant to this particular ratio. I explicitly reject that displayed local-pair argument as written; the replacement above repairs its conclusion at the exact scope. The fixed-factor ULC orders `1,2,4,7`, their convolution to order `h`, and the support bounds used in the curvature argument are consistent with the definitions. In the guarded band, `k<=N`, `C[k]>0`, `U_i[k]>0`, and `h-k>0`; zero extension handles the remaining endpoints.

## Independent exact checks

I copied the producer script into this scratch before execution and ran it with `PYTHONDONTWRITEBYTECODE=1`; it completed its stated local checks. Because its tip pair is mismatched, I separately wrote `local_audit.py`, which checks the actual three `(B_(r-1),B_r)` pairs above, the exact ULC curvature rearrangement, and literal bridge quantities using integer coefficients/Fraction arithmetic.

Boundary profile `r=(2)`, `N=2`, `h=3`, `k=1` gives `C[0:3]=[1,5,7]`, `lambda=2/3`, curvature `18/5`, tip main minor `16`, and surplus left side `98`. Interior profile `r=(2,3,4)`, `N=9`, `h=14` was checked at guarded ranks `k=1,2,4,5`; for example at `k=4`, `C[3:6]=[254,481,588]`, `lambda=3/11`, curvature `82009/481`, all tip main minors are positive, and the endpoint difference `U_0[4]-U_i[4]=9`. These are checks of arithmetic and boundary handling only, not evidence for the universal surplus theorem. No branchwise inference is drawn from an aggregate, and no numerical check is promoted to a universal result.

Replay from this scratch directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 local_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 producer_bridge_checks_copy.py
```

The producer's exact conditionals additionally rely on the general convolution/TP2 argument; the script is not a formal proof. No Lean build was run.

## Integrity and limitations

All 275 members of `manifests/C6-COMMON-DISPATCH.json` matched their listed SHA-256 digests; the three packet case files also matched. The exact surplus and registered weighted-deck identities are still OPEN at dispatch. The status fence distinguishes computer-assisted selected aggregate evidence from the stronger universal tip premise. I found no realizable guarded counterexample to the repaired conditional bridge, no exact counterexample to the surplus, and no basis for changing the primary or stronger MASS claims.
