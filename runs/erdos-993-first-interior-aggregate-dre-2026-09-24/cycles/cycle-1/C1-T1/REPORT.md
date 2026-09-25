# C1-T1 — constructive search, Cycle 1

**Outcome:** the complete favorable-original-leaf aggregate at `p=alpha(T)-2` remains OPEN. I obtained and checked an exact local branch identity, but it does not control the sign of the selector-restricted sum. `novelty_claimed: false`.

## Proposed proved lemma

For any finite tree `T`, original leaf `v` with support `s`, and integer `k`, let `H=T-{v,s}` and `R=T-N_T[s]`. With independence-polynomial coefficients zero outside their support,

`P_{T-v}(z) = P_H(z) + z P_R(z)`,

so

`Delta_k(T-v) = Delta_k(H) + Delta_{k-1}(R)`.

Consequently, defining `A_v=Delta_p(H)`, `B_v=Delta_{p-1}(R)`, and `C_v=Delta_{p-1}(H)`, the exact favorable-leaf aggregate is

`S(T,p) = sum_{v: A_v+B_v<0} (C_v-B_v)`.

The proof partitions independent sets of `T-v` according as they omit or contain `s`. Sets omitting `s` are exactly independent sets of `H`; sets containing `s`, after deleting `s`, are exactly independent sets of `R`. Taking adjacent coefficient differences proves both equations. This handles repeated supports correctly: the formula is applied once per original leaf tag.

This is a general branch decomposition, not a sign proof. The selector constrains `A_v+B_v`, while the summand is `C_v-B_v`; there is no implication between these two linear forms without additional structure. In particular, the identity alone neither proves pointwise nonpositivity nor the complete sum inequality. The unresolved central step is a tree-wide bound for the sum of `C_v-B_v` over exactly those leaf tags with `A_v+B_v<0`, at the fixed rank `p=alpha-2` and without a residual assumption.

## Exact larger checks

I copied the admitted integer tree-DP evaluator to this scratch directory, then independently recomputed the target rank from `alpha`, the first strict descent, each favorable original leaf, each summand, and the full sum. `EXACT-REPLAYS.json` records the constructions and results; `evidence.py` is the replay command. Every leaf also passed the coefficient identity `Delta_p(T-v)=A_v+B_v` in `replay.py`.

- `P_60`, edges `(i,i+1)` for `0<=i<59`: `alpha=30`, `x=17`, `p=28`, eligible (`19<=28`); both leaves favorable, each summand `-165851`, complete sum `-331702`.
- `T_60`, the 243-vertex root/marked-arm/60-star-arm construction encoded in `ordinary_tree.py`: `alpha=182`, `x=87`, `p=180`, eligible (`89<=180`); 181 of 181 original leaves favorable, with one summand `-15930` and 180 summands `-16287`, complete sum `-2947590`.

These are exact integer calculations and finite checks only. The first is a fresh larger path target; the second applies the known T-family construction at the newly required `alpha-2` rank. Neither is universal evidence. The evaluator's `first_strict_descent` omits the terminal zero-extended difference, but both recorded descents occur strictly before `alpha`; thus that known limitation does not affect these rows.

Replay from the run root:

```sh
python3 scratchpad/C1-T1/evidence.py
python3 scratchpad/C1-T1/replay.py
```

## Fence review and limits

This identity uses only the independent-set partition at the original support. It assumes neither universal tree log-concavity/real-rootedness, first-descent-as-first-maximum, pointwise or support-fibre beta signs, nor any Hall/cut condition; those inherited refutations are therefore not revived. The exact checks report the complete favorable set and complete sum rather than treating a positive summand or an auxiliary failure as a target counterexample. The residual hypothesis is not used. I have not derived a global compensation inequality, proved the requested primary theorem, or found an eligible positive complete sum. No Lean gate was run, as required for this search stage.
