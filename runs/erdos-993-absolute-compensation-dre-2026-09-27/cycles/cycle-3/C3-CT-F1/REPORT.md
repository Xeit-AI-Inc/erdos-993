# C3-CT-F1 independent critique

## Integrity, scope, and replay

Verified all 86 members of `manifests/C3-COMMON-DISPATCH.json` against their SHA-256 values (zero mismatches). The C3-CT-F1 dispatch manifest, C3-F1 dispatch manifest, C3 transport clarification, and critique-transport clarification also matched their listed member hashes. The two clarification seals authorize these common neutral cycle3 sources; the packet's `allowed_source_files` remains the additional case-specific list. The allowed C3-F1 report and return matched the packet hashes.

The first C3-F1 critique had declined the scalar review because its packet had no additional source files. The sealed reconciliation specifically corrects that reading and assigns this independent audit. The producer scalar script was copied into this scratch directory before any run; it was not executed. I wrote and ran a separate evaluator:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_scalar_audit.py > independent_scalar_evidence.json
```

The evaluator uses `math.comb` and `fractions.Fraction`, traverses the stated domain directly, and asserts the total state count, zero exclusions, and strict positivity in every state. It did not run a tree census, construct a parent polynomial, or calculate a selector.

## Required claim: adjacent-arity Jensen exponent

**Proposed disposition: retained at the registered exponent-only scope.** Fix `M>=10`, `0<=k<=M`, and `3k>=M`. When `k=M`, all three zero-extended binomial terms vanish. Otherwise put `y=M-k`,

\[
K=\binom{M-2}{k-1}/\binom Mk>0,\quad u=(y-1)/(M-2),\quad v=(y-2)/(M-3).
\]

Cancellation of factorials gives
\[
g_2=\tfrac45K,\quad g_3=\tfrac67Ku,\quad g_4=\tfrac89Kuv.
\]
Here `1<=y<=2M/3`, so `0<=u<=5/7`; also
\[
u-v=(M-y-1)/((M-2)(M-3))\ge0.
\]
For `y=1`, `uv=0`; for `y>=2`, `0<=v<=u`, hence `uv<=u^2`. Therefore
\[
g_2-2g_3+g_4\ge K(4/5-12u/7+8u^2/9)\ge K(64/2205)>0.
\]
The quadratic decreases on `[0,5/7]` because its derivative is `-12/7+16u/9<0` there.

At fixed `m'` and `M`, replacing one arity-2 and one arity-4 block by two arity-3 blocks preserves both constraints and changes `E` by `-(g2-2g3+g4)<=0`. Repeating leaves no simultaneous arity-2 and arity-4 blocks; the remaining counts are exactly the adjacent-arity mixture bracketing `M/m'`. Solving the two linear constraints gives the registered formulas on `[2m',3m']` and `[3m',4m']`. The argument controls only this rational exponent. It gives no ordering of actual cofactor coefficients by itself and no conclusion about descent, flags, MASS, or payment.

## Independent scalar-certificate audit, m=70..119

I independently checked the entire relaxed finite domain in `C3-balanced-finite-protocol.md`: `m=70..119`; `2m<=N<=4m`; `r=2,3,4`; `M=N-r` feasible for `m-1` cofactor branches (`2(m-1)<=M<=4(m-1)`); and every integer `j` with strict `5j>2N-1` and `2j<=N-2`. For each nonzero coefficient `c_s` of `GF_r`, I checked the shift `k=j-s`, including `M>=10` and `3k>=M`. Every such shift passed; no state or shift was excluded. The evaluator found exactly **799,895** states, matching the protocol's count.

For each shift it computed the adjacent-arity minimum exponent directly from the binomial definition of `g_r`; it did not use the producer's falling-factorial closed form. If `l=floor(1000E)`, then `l/1000<=E`, and for nonnegative `E`,
\[
\sum_{h=0}^{12}(l/1000)^h/h!\le e^{l/1000}\le e^E.
\]
All comparisons used exact rational arithmetic. The Taylor terms have denominators `1000^h h!`; equivalently the common denominator is `1000^12 12!`, as in the protocol. The GF coefficient vectors used were `(1,2)`, `(2,5,2)`, `(3,9,7,2)` for arities 2, 3, 4, respectively. Each tested scalar left side was
\[
\sum_s c_s\,\frac{\binom{N-r}{j-s}}{\binom Nj}
   \sum_{h=0}^{12}\frac{(l_s/1000)^h}{h!},
\]
and it was strictly greater than `3(N+1-j)(N-2j-1)/(2(j+1))`. The smallest exact *absolute* margin was positive and occurred at `(m,N,r,j)=(70,278,2,127)`; its numerator and denominator are retained in `independent_scalar_evidence.json`. Per-m counts and margins are retained there too.

The exponent lower bound used here is connected to the coefficient by the shared occupancy identity: expanding `product_i(1+X_i/r_i)` over a uniform `k`-subset of the `M` tips reproduces the coefficient ratio of `product_i((1+z)^{r_i}+z)`. Finite Jensen gives its expectation at least `exp(sum_i Pr(X_i=1) log(1+1/r_i))`; `log(1+1/r_i)>=2/(2r_i+1)` gives the exponent `sum_i g_{r_i}`. The adjacent-arity inequality lowers that exponent, and the positive Taylor sum then gives the exact scalar bound above. This supports the finite local coefficient bridge only on the audited states.

For transfer to an actual eligible lower-half rank, retain the contract's actual first strict descent `x`: `x+2<=p` means `j=p-2>=x`; the neutral predecessor comparison gives `5x>2N-1`, hence `5j>2N-1`. The other rank condition `2p<=alpha=N+2` gives `2j<=N-2`. This audit neither recomputes `x` nor weakens its strict definition. The remaining lower-half condition `3p<2alpha+1` is not used by this coefficient-only scalar check and remains part of the actual payment problem.

The state space is complete for cofactor arity counts: with `m-1` blocks of sizes 2, 3, or 4, every integer `M` in `[2(m-1),4(m-1)]` is representable (start with all 2s and distribute at most 2 increments per block). The computation is still bounded in `m`; it does not prove the corresponding inequality outside 70..119. It does not evaluate current-`p` strict selectors `e0,ei`, endpoint selection, original tag flags, or the weighted selected sum `A=sum_i r_i e_i T_i[j]`. Original private-tip tag multiplicities and the endpoint's unit tag are preserved as required in any subsequent payment application; they are not inferred from this relaxed scalar instrument. Thus this evidence does not settle selected MASS or the exact-ratio primary.

## Files and limitations

- `independent_scalar_audit.py`: independent exact evaluator.
- `independent_scalar_evidence.json`: exact state totals, per-m counts, and minimum margins.
- `producer_C3-balanced-finite-check.py`: byte copy of the producer script, not executed.

No Lean build or formal award was attempted. The exponent proof is informal algebra. The finite scalar result is exact bounded evidence conditional on the stated occupancy/Jensen coefficient bridge; no universal payment or status change is proposed.
