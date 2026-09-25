# C1-F3 — falsification search, cycle 1

**Disposition:** no exact counterexample to the frozen aggregate was found. The search produced finite exact negative evidence and an eligible non-residual example that blocks a direct transfer of the r26 result. The primary claim remains open. `novelty_claimed: false`.

The target is the literal ordinary-tree statement from `SOLUTION-CONTRACT.md`: with integer `p=alpha(T)-2`, `x(T)+2<=p`, and `F(T,p)` selected by the strict test `Delta_p(T-v)<0` on original degree-one vertices, compute the complete tagged sum

```text
S(T,p) = sum_{v in F(T,p)} (Delta_(p-1)(T-{v,s_v}) - Delta_(p-1)(T-N[s_v])).
```

I used zero-extended coefficients and strict integer differences, including the terminal zero extension, as required by `SEMANTIC-CONTRACT.md`. Distinct original leaf labels are retained. I checked the assigned packet and listed inputs against `manifests/C1-PREDISPATCH-STAGES1-2.json`; the hashes of the opened source files match the seal.

## Exact target-rank checks

I copied the admitted ordinary-tree evaluator into this worker's scratchpad and ran `falsify.py` on the admitted T-family and non-log-concave fixtures at `p=alpha-2`. The inherited exact records are `sources/standing-controls/t22-order91.json`, `t60-order243.json`, and `kl-non-lc-fixtures.json`; their common control receipt is `sources/standing-controls/summary.json`. The larger T-family cases were `T_22` (91 vertices, `alpha=68`, `x=32`, `p=66`, 67/67 leaves favorable, `S=-147807`), `T_60` (243 vertices, `alpha=182`, `x=87`, `p=180`, 181/181 favorable, `S=-2947590`), and the fresh larger `T_100` (403 vertices, `alpha=302`, `x=145`, `p=300`, 301/301 favorable, `S=-13588650`). In `T_100`, all selected summands are negative, between `-45147` and `-44550`. `C1-F3-fresh-examples.json` records each complete edge list, independence polynomial, strict-descent index, every original leaf, every selected leaf and its exact `Delta_p(T-v)`, both `H_v` and `R_v` differences, and the complete sum.

The five admitted non-log-concave fixtures and two larger variants, all evaluated at their own `alpha-2` target rank, were eligible and had negative complete sums. Their orders range from 26 to 46; `x` ranges from 8 to 15. Their exact rows and all leaf summands are in the same JSON. This check does not assume log-concavity.

I independently recomputed all ten structured rows from their explicit edges with a separately written rooted polynomial recurrence in `independent_verify.py`. It matched each polynomial-derived eligibility decision, favorable-leaf list, and complete aggregate. This is a cross-check of those finite rows, not a proof for all trees.

I then sampled 300 independent uniform Prüfer words at each order `16, 20, 24, 30, 40` with seed `9932401`. Of 1,500 sampled labeled trees, 1,466 passed the exact eligibility guard. At `p=alpha-2`, none had positive complete sum; the maximum was `-210`, and no selected summand was positive (the maximum selected summand was zero). Per-order counts and extrema are in `C1-F3-random-summary.json`. The replay command is `python3 random_search.py` from this scratchpad. Sampling is not exhaustive evidence.

## Residual-transfer obstruction

The r26 result is at `p=alpha-1` and assumes every original leaf belongs to every maximum independent set; this is explicit in `sources/public/proofs/lean/r26-c1-la1-top-rank-residual-sign/THEOREM-CONTRACT.md` and in its proof input `INFORMAL-PROOF.md`. The latter uses that assumption in `max_indep_no_support`, `forced_neighbour`, and the family count, so it cannot simply be dropped while moving the rank down by one.

Here is a small exact target-eligible ordinary tree showing that the missing residual condition is realized in the primary domain. Its edges are

```text
01, 13, 14, 18, 24, 25, 27, 29, 69.
```

Its independence polynomial is `(1,10,36,62,61,37,13,2)`, so `alpha=7`; the first strict descent is `x=3`; `p=5=alpha-2`; and `x+2=5`, hence it is eligible. Its original leaves are `{0,3,5,6,7,8}`, all six are favorable, and their summands in that order are `(-15,-15,-13,-1,-13,-15)`, giving the complete sum `-72`. Yet `{0,3,4,5,7,8,9}` is a maximum independent set of size 7 containing support 9 and omitting its original leaf 6. Thus `Residual(T)` fails. All exact coefficients and selector values are in `nonresidual_target.json`.

This is a scope obstruction to using the inherited residual theorem as a direct proof of the full interior claim; it is not a counterexample to `S<=0`.

## Fences checked and limits

The inherited T22/T60 positive-summand records occur at ranks 34 and 90 in `sources/standing-controls/t22-order91.json` and `t60-order243.json`, not at the target ranks 66 and 180. They refute their recorded pointwise/support-fibre shortcuts at those scopes, but do not refute this primary aggregate. At the target ranks, the exact T22/T60 summands in this search are negative. I did not promote any failed Hall or Delete/Retag condition, scalar marginal separation, raw edge-difference monotonicity, cover-diagonal bound, arbitrary unimodal-convolution claim, or `N2<=M` shortcut into a target counterexample. These are distinct fenced mechanisms listed in `packets/C1-COMMON-NEUTRAL.md` and `control/REJECTED-MECHANISMS.json`; the latter also records `N2<=M` as false and the r26 proof's valid replacement `N2<=k2*M` in `sources/public/proofs/lean/r26-c1-la1-top-rank-residual-sign/INFORMAL-PROOF.md`.

No Lean build was run: there is no proposed universal theorem or exact counterexample for a governed gate. No external sources were needed. All calculations use exact integer recurrences. The finite examples, random sample, and transfer obstruction do not establish the universal aggregate. I stopped all owned work before return; no background job remains.

## Evidence and replay

- `python3 falsify.py` — structured exact target-rank rows, with complete per-leaf data in `C1-F3-fresh-examples.json`.
- `python3 independent_verify.py` — separate recurrence cross-check; result in `C1-F3-independent-checks.json`.
- `python3 random_search.py` — bounded random Prüfer sample; summary in `C1-F3-random-summary.json`.
- `nonresidual_target.json` — exact eligible non-residual tree and complete aggregate.
- `ordinary_tree.py` — byte-for-byte copy of the listed standing-control evaluator used for the first calculation.
