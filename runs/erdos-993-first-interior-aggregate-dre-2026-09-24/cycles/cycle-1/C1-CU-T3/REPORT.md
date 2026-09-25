# C1-CU-T3 independent U critique of C1-T3

**Proposed dispositions:** C1-T3-01 retained; C1-T3-02 unresolved. The primary complete aggregate at `p=alpha(T)-2` is neither proved nor refuted by this route. `novelty_claimed: false`.

I used only the assigned C1-T3 report, return, probe and evaluator, the frozen contracts, and the permitted common authority. The six C1-T3 evidence files match the SHA-256 values in `packets/C1-CU-T3.json`. I did not inspect sibling returns or critiques.

## C1-T3-01: retain the exact identity

For an original leaf `v` with original support `s`, every independent `k`-set of `T-v` either omits `s`, giving an independent `k`-set of `H_v=T-{v,s}`, or contains `s`, giving an independent `(k-1)`-set of `R_v=T-N_T[s]`. The latter uses the **original** closed neighborhood, which already contains `v`. The partition is bijective at every integer `k`, including out-of-range ranks under zero extension. Hence

```
i_k(T-v) = i_k(H_v) + i_(k-1)(R_v),
Delta_p(T-v) = Delta_p(H_v) + Delta_(p-1)(R_v).
```

The selector is exactly `Delta_p(H_v)+Delta_(p-1)(R_v)<0`. It must remain strict and at the original `p`. For two original leaves at one support, swapping the leaves is a graph automorphism, so their deletion polynomials, selector values and summands agree. Grouping their **distinct** tags gives the stated `m_s` multiplier. This also covers the small `K_2` case: each endpoint is an original leaf with its own support fibre. No residual assumption is needed. The result is an identity for pendant vertices and carries no sign implication.

The incoming report correctly identifies the unsigned step. Favorability restricts `Delta_p(H_s)+Delta_(p-1)(R_s)`, while the desired summand is `Delta_(p-1)(H_s)-Delta_(p-1)(R_s)`; these are at different ranks and with different signs. Eligibility only restricts the first descent of `T`. The report supplies no theorem transferring that restriction to either deletion graph or balancing support fibres. Consequently the regrouping is a valid reduction, but not a proof of the complete aggregate sign.

## C1-T3-02: leave unresolved

The frozen target requires all eligible ordinary trees at integer `p=alpha-2`, all favorable **original** leaf tags, and a positive complete sum to refute it (`SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`). C1-T3 gives no sign proof and no positive eligible complete sum. Its `T_22`, `T_60`, and `T_100` results are negative rows in one constructed family. The inherited r26 theorem is at `alpha-1` under the residual condition; its scope explicitly leaves interior ranks open ([r26 scope summary, lines 28-31](../../../sources/public/experiments/r26-top-rank-residual-sign.md)). The r24 terminal synthesis likewise records the broad literal interior aggregate as open and distinguishes positive local terms from complete sums ([r24 synthesis, lines 971-977](../../../sources/public/runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/C6-TERMINAL-SYNTHESIS.md)). Those inherited statuses are context, not a proof at this frozen rank.

The report correctly avoids the old pointwise, support-fibre, Hall, and sequence-shape mechanisms listed in the common neutral handoff ([common neutral, lines 4 and 10](../../../packets/C1-COMMON-NEUTRAL.md)). Its local observation of no positive summand at `p=alpha-2` on this family must not be promoted to a general pointwise sign: inherited r24 controls show positive local terms inside negative sums at other admitted ranks ([r24 synthesis, lines 224-228](../../../sources/public/runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/C6-TERMINAL-SYNTHESIS.md)). No old obstruction is contradicted by the retained identity or the family calculation.

## Independent replay and a bounded family formula

I copied C1-T3's `ordinary_tree.py` and `interior_probe.py` into my assigned scratch and ran `python3 scratchpad/C1-CU-T3/interior_probe.py > scratchpad/C1-CU-T3/replay.json` from the run root. `cmp` found byte-identical output to the pinned `cycles/cycle-1/C1-T3/interior_probe.json`. This checks the stated three rows but shares the original evaluator.

For a separate arithmetic check, `formula_check.py` uses only elementary dense-polynomial operations and the graph description of `T_m`, not the copied graph evaluator. Write `n=3m`, `B=1+4z+3z^2+z^3`, and `A=1+z`. Splitting on the root gives

```
I(T_m) = (1+2z) B^m + z(1+z) A^n.
```

The leading term is `z^(n+2)`, so `alpha(T_m)=n+2` and `p=n`. For the marked leaf, `H_m` and `R_m` have polynomials `B^m+z A^n` and `B^m`. For any of the `n` star leaves, put `Q=(1+2z)B^(m-1)`; its `H_s` and `R_s` have polynomials `Q A^2+z A^n` and `Q`. Direct extraction at `p=n` gives

```
Delta_p(T_m - marked leaf) = 1-2n,
Delta_p(T_m - star leaf) = -(n+1),
g_mark = n-C(n,2),
g_star = n-C(n,2)+3-2n.
```

Both selectors are strict for `m>=1`, so all `n+1` original leaves are favorable. The complete sum is

```
S(T_m,alpha(T_m)-2) = g_mark + n*g_star
                         = -n(n^2+2n-9)/2 < 0    (m>=1, n=3m).
```

This is a new exact family statement, C1-CU-T3-01, with no claim that every `T_m` satisfies the target's eligibility guard. For the three reported rows, the independent script computes `(m,p,x,S)=(22,66,32,-147807)`, `(60,180,87,-2947590)`, and `(100,300,145,-13588650)`, and reproduces the favorable tag counts `67,181,301`. In those three rows `x+2<=p` holds. The exact formula signs only this constructed family; it does not settle C1-T3-02. Replay with `python3 scratchpad/C1-CU-T3/formula_check.py` and compare `formula_check.json`.

## Limits

The copied evaluator's `first_strict_descent` omits the terminal zero-extension rank, but the route's probe and my independent formula check compute `x` through that rank. This makes no difference on the three reported rows, where a strict descent occurs earlier. I did not audit the inherited evaluator beyond the relevant definitions, and the replay is not a census of arbitrary trees. No Lean build was assigned or run. All owned commands completed; no background job remains active.
