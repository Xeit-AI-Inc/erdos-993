# C1-T3 report: support-fibre recurrence at p = alpha - 2

**Disposition.** The primary inequality remains unresolved. I derive an exact support-fibre formula which preserves the strict selector and leaf multiplicity, but I do not obtain a sign for its selected weighted sum. No residual hypothesis is introduced. `novelty_claimed: false`.

I checked every allowed-source-file digest in `packets/C1-T3.json` against the frozen files before using them; all matched the packet manifest.

## Exact reduction

Use the frozen ordinary-tree conventions in `SEMANTIC-CONTRACT.md`: for an original leaf `v` with support `s`, let `H_v = T - {v,s}`, `R_v = T - N_T[s]`, and let `Delta_k(G)=i_{k+1}(G)-i_k(G)` with zero extension. In `T-v`, partition independent sets by whether they contain `s`. Those avoiding `s` are counted by `H_v`; those containing `s` correspond to independent sets of `R_v` with `s` added. Thus, at every integer rank `k`,

```
i_k(T-v) = i_k(H_v) + i_(k-1)(R_v).
```

Taking the adjacent difference at the *original* selector rank `p` gives

```
Delta_p(T-v) = Delta_p(H_v) + Delta_(p-1)(R_v).
```

Therefore the strict favorable condition is exactly `Delta_p(H_v)+Delta_(p-1)(R_v)<0`; it is not a condition on the sign of the aggregate summand. The summand remains

```
g_v = Delta_(p-1)(H_v) - Delta_(p-1)(R_v).
```

For leaves sharing support `s`, deleting any one of the leaf tags gives isomorphic `H_v` and the same `R_v`; `T-v` also has the same independence polynomial. Hence either the whole support fibre is favorable or none of it is. If `m_s` is the number of original leaves at `s`, and `H_s,R_s` denote the corresponding deletion graphs, the exact aggregate is

```
S(T,p) = sum over supports s with m_s>0 of
         m_s * 1[Delta_p(H_s)+Delta_(p-1)(R_s)<0]
             * (Delta_(p-1)(H_s)-Delta_(p-1)(R_s)).
```

This is a regrouping identity, not a sign proof. It retains all original leaf tags through the coefficient `m_s`, uses the original integer `p`, and keeps the strict `<0` selector.

## Central gap and scope

The identity turns the target into a selected weighted sum of *differences* of adjacent differences. The favorable condition constrains the corresponding *sum* `Delta_p(H_s)+Delta_(p-1)(R_s)`. I have no valid implication from that sum inequality to the sign of the difference, nor a cancellation or transport argument that signs the weighted total. Eligibility `x(T)+2<=p` concerns the first strict descent of `T`; I found no proved bridge from it to those selected `H_s,R_s` terms. No log-concavity, real-rootedness, unimodality, residual condition, or unverified sequence monotonicity is assumed.

This is precisely inside the interior-rank region that the r26 summary says was not searched; r26 closes only the top-rank residual face, so none of that sign conclusion transfers here ([r26 scope summary, lines 28–31](../../../sources/public/experiments/r26-top-rank-residual-sign.md)). The broader literal interior aggregate was also recorded as still open, with no universal proof ([r24 terminal synthesis, lines 973–977](../../../sources/public/runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/C6-TERMINAL-SYNTHESIS.md)).

## Fresh falsification check and exact replay

I copied the admitted evaluator to this scratch directory and added `interior_probe.py`. It independently computes the contract's first strict descent through the terminal zero extension, evaluates the fresh constructed `T_100` row at `p=alpha-2`, and checks the deletion recurrence on every original leaf. The source constructor is the admitted `t_family(m)` in the copied `ordinary_tree.py`: a root has one marked two-edge arm and `m` root-adjacent `K_{1,3}` arms.

For `m=100`, the constructed tree has order `403`, `alpha=302`, `p=300`, and `x=145`, so it is eligible. The evaluator finds `301` favorable leaf tags, aggregate `-13,588,650`, and no positive summand (largest summand `-44,550`). The recurrence has zero mismatches and no support fibre is partially selected. The analogous checks at `m=22,60` also passed. This fresh larger target does **not** falsify the tempting pointwise strengthening on this family; it is only a finite family check and is no evidence for a universal local sign. Replay from the run root:

```
python3 scratchpad/C1-T3/interior_probe.py
```

Output is preserved in `scratchpad/C1-T3/interior_probe.json`. The output records the target-rank tuples and the recurrence/fibre mismatch counts. A failed exploratory attempt to use NetworkX for a nonisomorphic-tree census is not part of the evidence; NetworkX is unavailable in the active Python environment, so no such census is claimed.

## Inherited obstruction fences

The common-neutral packet lists the standing obstructions: universal tree log-concavity/real-rootedness, pointwise and support-fibre beta signs, all-cut/tag-closed Hall, raw edge-difference monotonicity, same-leaf extraction from marginals, cover-diagonal `d`, arbitrary unimodal convolution, and `N2<=M` ([common-neutral packet, lines 8–10](../../../packets/C1-COMMON-NEUTRAL.md)). This report uses none of those mechanisms. In particular, the recurrence above is a coefficient identity, not a monotonicity claim, Hall payment, or same-leaf extraction. The pointwise local sign is explicitly *not* asserted: inherited r24 controls exhibit positive local summands inside a negative complete aggregate, and the registered pointwise/support-fibre beta claims are refuted ([r24 synthesis, lines 226–228 and 829–839](../../../sources/public/runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/C6-TERMINAL-SYNTHESIS.md); see also the scoped rejected-mechanism registry in `control/REJECTED-MECHANISMS.json`). A failed local sign would not itself refute the complete aggregate. The residual top-rank counting mechanism and its `N2` bound are not imported.

The inherited bounded counts remain finite evidence only. This worker's new T-family probe is likewise finite. No complete eligible positive aggregate, universal proof, or counterexample is proposed. No Lean build was assigned or run, and no background job remains active.
