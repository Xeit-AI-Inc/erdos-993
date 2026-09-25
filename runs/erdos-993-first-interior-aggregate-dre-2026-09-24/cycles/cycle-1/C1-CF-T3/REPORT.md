# C1-CF-T3 independent F critique of C1-T3

`novelty_claimed: false`. I reviewed the two incoming claims in the pinned [C1-T3 return](../C1-T3/RETURN.json) and [report](../C1-T3/REPORT.md). All six origin file hashes match `packets/C1-CF-T3.json`. My dispositions are **retain C1-T3-01** as an exact coefficient and regrouping identity, and **unresolved C1-T3-02** as the primary aggregate inequality. The origin neither claims nor supplies a proof of the latter. The finite `T_m` probe checks one family, and a closed formula below explains why that family's local summands cannot falsify a pointwise sign at this rank.

## C1-T3-01: retain, exact scope

Fix an original leaf `v`, its original support `s`, and any integer `k`. In `T-v`, an independent `k`-set avoiding `s` is exactly an independent `k`-set of `H_v=T-{v,s}`. One containing `s` is `{s}` plus an independent `(k-1)`-set of `R_v=T-N_T[s]`. These disjoint classes establish

`i_k(T-v)=i_k(H_v)+i_(k-1)(R_v)`.

Zero extension makes this valid also at negative and terminal ranks. Subtracting the equations at `k=p+1` and `k=p` gives `Delta_p(T-v)=Delta_p(H_v)+Delta_(p-1)(R_v)`. A permutation of leaves adjacent to the same `s` fixes the rest of `T`, so their deletion graphs and selector values are isomorphic. Thus each support fibre is selected in full or excluded in full, and the multiplicity-weighted expression in the [origin report](../C1-T3/REPORT.md) follows. This uses original leaves, the original rank, and the strict `<0` selector exactly as required by [SEMANTIC-CONTRACT.md](../../../SEMANTIC-CONTRACT.md). It gives no sign for a selected summand or for the complete sum.

## C1-T3-02: unresolved

The selector tests `Delta_p(H_s)+Delta_(p-1)(R_s)<0`, whereas the summand is `Delta_(p-1)(H_s)-Delta_(p-1)(R_s)`. Neither the identity nor the condition `x(T)+2<=p` bounds that difference. For example, even at the level of integer variables the first inequality allows either sign for the second; graph-realizability and the complete weighted sum require a separate argument. The origin expressly leaves this gap open ([C1-T3 report](../C1-T3/REPORT.md)). No eligible positive **complete** aggregate or universal proof is supplied. Under [SOLUTION-CONTRACT.md](../../../SOLUTION-CONTRACT.md), the primary claim remains open.

The inherited r24 controls show positive *individual* summands within negative complete aggregates ([r24 terminal synthesis, lines 215–228](../../../sources/public/runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/C6-TERMINAL-SYNTHESIS.md)); such values would not refute the primary claim. The r26 theorem covers only the top-rank residual face and explicitly leaves interior ranks outside its search ([r26 scope summary, lines 23–31](../../../sources/public/experiments/r26-top-rank-residual-sign.md)). Neither result signs this unrestricted interior sum.

## Adversarial check of the `T_m` probe

I copied the pinned origin `ordinary_tree.py` and `interior_probe.py` into this worker's scratch and ran `python3 scratchpad/C1-CF-T3/origin_probe_replay.py` from the run root. Its exact JSON equals the pinned `interior_probe.json` byte for byte. This is a reproducibility check of the implementation, not independent mathematical validation. I separately derived the following formulas from the graph construction and checked their integer coefficients with `python3 scratchpad/C1-CF-T3/independent_family_check.py`.

For `m>=1`, let `B(z)=1+4z+3z^2+z^3`, the independence polynomial of one `K_{1,3}` arm. Partitioning by root membership gives

`I(T_m;z)=(1+2z)B(z)^m+z(1+z)^(3m+1)`.

The top degree is `alpha=3m+2`, so `p=3m`. There is one marked leaf and `3m` star leaves. For the marked leaf, root partition after deletion yields `I(T_m-v)=(1+z)B^m+z(1+z)^(3m)`, hence `Delta_p(T_m-v)=1-6m<0`. For any star leaf, the changed arm has polynomial `1+3z+z^2`, giving `I(T_m-v)=(1+2z)(1+3z+z^2)B^(m-1)+z(1+z)^(3m)` and `Delta_p(T_m-v)=-3m-1<0`. Thus *all* `3m+1` original leaves are favorable, without changing the selector rank.

For the marked leaf, `H-R=z(1+z)^(3m)`, so its summand is `g_mark=3m-C(3m,2)`. For a star leaf,

`I(H)-I(R)=(2z+5z^2+2z^3)B^(m-1)+z(1+z)^(3m)`,

so `g_star=g_mark+3-6m`. Therefore

`S(T_m,3m)=g_mark+3m*g_star=-(9m/2)(3m^2+2m-3)<0` for every `m>=1`.

The exact first descents for the **checked** `m=22,60,100` are `32,87,145`; the corresponding `p` values are `66,180,300`, so all three satisfy eligibility. Their complete sums are `-147807,-2947590,-13588650`, matching the origin probe. The formula proves negativity of this family at `p=alpha-2` even without a general eligibility characterization. It also shows every local summand in this family is negative at this rank, so increasing `m` on the same construction cannot test the inherited pointwise-positive obstruction. This does not imply local negativity for arbitrary trees.

The common neutral packet fences universal tree log-concavity and real-rootedness, pointwise and support-fibre beta signs, all-cut/tag-closed Hall, raw edge-difference monotonicity, same-leaf extraction, cover-diagonal `d`, arbitrary unimodal convolution, and `N2<=M` ([common handoff, lines 8–10](../../../packets/C1-COMMON-NEUTRAL.md)). The retained identity invokes none of these. My family calculation proves only an exact negative family, not one of the fenced universal mechanisms. Its bounded first-descent computation does not become a universal eligibility assertion.

## Replay and limits

From the run root, run `python3 scratchpad/C1-CF-T3/origin_probe_replay.py > scratchpad/C1-CF-T3/replayed-again.json` and compare with `cycles/cycle-1/C1-T3/interior_probe.json`; or run `python3 scratchpad/C1-CF-T3/independent_family_check.py` to regenerate the independent family rows. The former uses an origin code copy; the latter uses only the displayed root decomposition, integer convolution and `math.comb`. Checked parameters are exactly `m=22,60,100`; I did not conduct a tree census or assert a universal result from computation. No Lean build or remote edit was run. All owned jobs have stopped.
