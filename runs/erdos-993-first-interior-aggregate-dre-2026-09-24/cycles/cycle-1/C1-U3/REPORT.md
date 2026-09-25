# C1-U3 — exact count form and unresolved bridge

**Disposition:** no proof or eligible counterexample for `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`. `novelty_claimed: false`.

## Exact count identity

For an original leaf `v` with support `s`, put `W_v=N_T(s)\\{v}`. In the contract, `H_v=T-{v,s}` and `R_v=T-N_T[s]`; hence `R_v=H_v-W_v`. Write `I_G(z)=sum_k i_k(G)z^k`. The induced-subgraph coefficient difference has the literal set interpretation

`Q_v(z)=I_{H_v}(z)-I_{R_v}(z)=sum_{J independent in H_v, J∩W_v≠empty} z^{|J|}`.

This works because the independent sets of `H_v` absent from the induced graph `R_v` are exactly those meeting `W_v`. Consequently the summand in the frozen contract is

`Delta_(p-1)(H_v)-Delta_(p-1)(R_v) = [z^p]Q_v-[z^(p-1)]Q_v`.

Keeping leaf tags, define `A_k(T,p)=sum_{v in F_p(T)} #{J subset V(H_v): J independent, |J|=k, J∩W_v nonempty}`. Then the complete aggregate, with repeated leaves at one support counted separately, is exactly `S(T,p)=A_p(T,p)-A_(p-1)(T,p)`.

There is also an exact decomposition `I_(T-v)(z)=I_(H_v)(z)+z I_(R_v)(z)`: after deleting `v`, independent sets either omit `s` or include it. Thus the favorable selector says

`i_(p+1)(T-v)-i_p(T-v) = ([z^(p+1)]I_H-[z^p]I_H)+([z^p]I_R-[z^(p-1)]I_R) < 0`.

The unresolved bridge is now precise: this strict inequality compares a forward difference of `I_H` with a forward difference of `I_R`, while the required aggregate compares their **previous-rank difference in the opposite direction**, summed over leaves selected by that strict inequality. The identity itself supplies no sign implication. Establishing a global inequality `A_p<=A_(p-1)` under the shared-tree selector and `x(T)+2<=p=alpha-2`, or producing a positive complete sum, remains necessary. No residual assumption has been introduced.

## Inherited obstruction checks

The capsule coverage and rejected-mechanism registry are the admitted sources for this check. `E993-BETA-TARGET` is refuted by its order-243 witness at `p=90`, and `E993-BETA-AGG-SUPPORT` by T22 at `p=34`; each blocks deriving the target from pointwise or support-fibre signs. Their listed ranks are not `alpha-2` for the target, so they do not refute this target. The r23 fixed-`Gamma` Hall refutation uses T22/order 91 at `p=34`; the universal tag-closed-cut Hall refutation uses CB(8,92)/order 1567 at `p=492`. These kill a blanket Hall proof of the count identity, while neither is a positive aggregate counterexample (the recorded complete aggregates are negative). Raw edge-difference monotonicity and arbitrary unimodal-convolution arguments are also registered fences; this derivation invokes neither, and eligibility only specifies the first strict descent, not later coefficient shape. The `N2<=M` refutation is confined to an eligible **top-rank residual** mechanism; it is not used here, and the primary interior target has no residual hypothesis. The r26 top-rank residual sign proof therefore gives no conclusion at this rank.

## Fresh larger falsification check

As a family-scale check of whether the interior endpoint immediately exposes a positive aggregate, I evaluated the existing `T_m` family for `m=75,100,150` (orders 303, 403, 603) at the required `p=alpha-2`. The runner uses exact integer tree-DP polynomials and independently fixes the known terminal-rank issue by scanning `Delta_k` through `k=alpha` for `x`. All three rows are eligible; complete sums are respectively `-5,744,925`, `-13,588,650`, and `-45,762,975`. At `m=100`, for example, `alpha=302`, `x=145`, `p=300`, all 301 original leaves are favorable, and the complete sum is `-13,588,650` (individual summands range from `-45,147` to `-44,550`). This is a bounded falsification attempt only; it neither proves the family formula nor supports a universal conclusion. The family was not searched as a proof route in the inherited terminal `r24` evidence; its report explicitly called the lower interior window unsearched, which motivates this endpoint check.

Replay from the run root:

`python3 scratchpad/C1-U3/fresh_family.py`

The runner imports only the byte-for-byte copied admitted evaluator `scratchpad/C1-U3/ordinary_tree_copy.py`. Exact output is preserved in `scratchpad/C1-U3/fresh_family_results.json`.

## Scope and limits

This is an exact representation and obstacle, not a proof, a counterexample, a residual-subclass theorem, or a formal result. No full census, Lean build, external source, or sibling output was used. The one owned evaluation process completed and no owned jobs remain. Source documents used: `WORKER-PROTOCOL.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `packets/C1-COMMON-NEUTRAL.md`, `control/CAPSULE-COVERAGE.md`, `control/REJECTED-MECHANISMS.json`, `sources/public/experiments/r24-direct-favorable-leaf-aggregate.md`, `sources/public/experiments/r25-uniform-residual-no-recovery.md`, `sources/public/experiments/r26-top-rank-residual-sign.md`, and `sources/standing-controls/ordinary_tree.py`.
