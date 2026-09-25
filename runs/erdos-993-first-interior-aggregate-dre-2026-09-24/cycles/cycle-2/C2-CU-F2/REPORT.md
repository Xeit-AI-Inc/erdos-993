# C2-CU-F2 — U critique of C2-F2

**Proposed worker dispositions only.** I retain both incoming claims at their exact stated scopes. The small-alpha proof is mathematically complete given the pinned r27 forest descent bound. An independent deletion-neighborhood polynomial computation confirms the order-nine graph, its original-tag selectors, and its complete sum. The source report contains one unrelated boundary-example coefficient error, corrected below. Neither claim proves the primary aggregate sign.

## Authority and meaning

The three C2-F2 source files match the SHA-256 values in `packets/C2-CU-F2.json`. I used only those files, the frozen contracts and review protocol, and common historical authority allowed through `packets/C2-T1-v2.json`. In particular, r27's `forest_descent_linear_bound` is stated for a finite simple graph `G` with `G.IsAcyclic`, natural `k`, and strict `Erdos993G1.delta G (k : ℤ) < 0`, concluding `Nat.card X ≤ 4*k` (`proposals/cycle2/latest-code/packages/r27-c1-la4-descent-order-bounds/source/LeanProof/Main.lean`, lines 1458–1460). Its `indepCount` counts `IsNIndepSet k` finsets, `coeff` zero-extends at negative integer indices, and `delta` is `coeff(k+1)-coeff(k)` (same file, lines 14–35). Finite cardinality makes coefficients above the vertex count zero as well. The common verification receipt `proposals/cycle2/code-canonical-receipts/runs/lean-2026-09-25-c1-la4-descent-order-bounds/VERIFICATION-REPORT.json` reports `formally_verified` with kernel and fidelity checks passed. This is inherited r27 authority, not a Lean build or new award by this critique.

For an ordinary tree, `G.IsAcyclic` holds, and the semantic `x` is the least natural strict negative difference, so `Delta_x<0`. The r27 lemma applies directly at `k=x`; its proof requires no first-descent minimality or residual hypothesis. The target's `p=alpha-2` is an integer: eligibility `x+2≤p` is exactly `x+4≤alpha`. It first gives `alpha≥4`, so no natural truncated subtraction is being silently used. The distinction between strict descent and a flat difference is preserved.

## C2-F2-ELIGIBILITY-ALPHA-GE-SEVEN — proposed_retained

Let `a=alpha(T)≤6`, `n=|V(T)|`, and assume eligibility. Then `a≥4`. The connected tree contains an edge, so its whole vertex set is not independent and `a+1≤n`. The r27 bound gives `n≤4x`; eligibility gives `x≤a-4`. Consequently `a+1≤4(a-4)`, or `17≤3a`. With `a≤6`, this forces `a=6`. Then `x≤2` and `7≤n≤4x`, so `x=2` and `n∈{7,8}`. This is also a proof that an eligible `a≤6` counterexample cannot occur at order greater than 243: it could only have order 7 or 8, before the final contradiction.

For a tree, `i_2=C(n,2)-(n-1)=C(n-1,2)`. Inclusion-exclusion on the `n-1` edges gives `i_3=C(n,3)-(n-1)(n-2)+Σ_u C(deg(u),2)`. Two forbidden edges in one triple must meet at a vertex, and three would form a triangle; hence this correction is exact. Subtracting yields

`Delta_2=(n-1)(n-2)(n-9)/6+Σ_u C(deg(u),2)`.

At `n=7`, the complement of an independent six-set is one vertex covering every edge. Its degree is six, and `Delta_2≥-10+C(6,2)=5`. At `n=8`, the two-vertex complement `{u,w}` covers all seven edges, so `deg(u)+deg(w)≥7`; if their edge exists it is counted twice, which does not weaken this inequality. For nonnegative integers with sum at least seven, `C(d,2)+C(e,2)≥9`: at sum seven the minimum is the split `3+4`, and increasing either argument cannot decrease the expression. Thus `Delta_2≥-7+9=2`. Both contradict `Delta_x=Delta_2<0`. The argument uses existence of a maximum independent set, not any residual property or uniqueness of that set.

This retains only the eligible ordinary-tree guard `alpha≥7`. It does not establish the proposed tagged-shadow or high-tail pointwise inequality, and it does not settle the complete favorable-leaf sum. The canonical status is unchanged by this proposed disposition.

## C2-F2-FRESH-ELIGIBLE-ORDER-NINE-REPLAY — proposed_retained

The specified tree has edges `(0,2),(1,2),(3,2),(5,4),(7,4),(4,6),(6,2),(2,8)`. I copied the source enumerator to my scratch before running it. I also wrote `independent_dp.py`, which obtains each induced graph's independence polynomial by `I(G)=I(G-v)+z I(G-N[v])`, independently of subset enumeration. It checks eight edges and connectivity. Both checks give

`I(T)=(1,9,28,42,39,22,7,1)`, `alpha=7`, `x=3`, `p=5`, and `x+2=p`.

All original leaves are `0,1,3,5,7,8`. The following table uses the original support for each leaf, the unshifted selector `Delta_5(T-v)`, and the term `Delta_4(H_v)-Delta_4(R_v)`. The DP retains the original leaf tag for repeated support 2 or 4.

| leaf | support | selector | `Delta_4(H_v)` | `Delta_4(R_v)` | term |
|---:|---:|---:|---:|---:|---:|
| 0 | 2 | -5 | -10 | 0 | -10 |
| 1 | 2 | -5 | -10 | 0 | -10 |
| 3 | 2 | -5 | -10 | 0 | -10 |
| 5 | 4 | -6 | -9 | -1 | -8 |
| 7 | 4 | -6 | -9 | -1 | -8 |
| 8 | 2 | -5 | -10 | 0 | -10 |

Every selector is strictly negative. The complete original-tag sum is `4*(-10)+2*(-8)=-56`; zero extension and the terminal `Delta_7=-1` are included in the first-descent computation. This is one exact example, not evidence of a universal sign. It neither refutes nor proves the primary target.

## Boundary correction and obstruction scope

The C2-F2 report says `K_{1,6}` has `i_k=C(6,k)` for all `k≥1`. At `k=1` the center is an additional independent singleton, so the correct sequence is `(1,7,15,20,15,6,1)`, not `(1,6,15,20,15,6,1)`. `star_boundary.py` records the correction. The first negative difference is still at `x=3`; `alpha=6`, `p=4`, and `x+2=5>4`. Therefore its use as an ineligible boundary check survives. This error does not enter either retained claim's proof or replay.

The inherited T22 and T60 positive local margins lie outside the proposed high-tail rank guard, as the pinned `control/C2-SCOPE-AUDIT.md` explains. They neither test this small-alpha eligibility claim nor turn a positive local term into a positive complete target sum. The order-nine replay is larger than the only possible orders 7 and 8 for a hypothetical `alpha≤6` eligible failure. No independent greater-than-243 instance is relevant to this finite-size exclusion: the assumption itself entails `n≤8`. I propose no new unbounded mechanism. No census was claimed or run.

## Replay and limits

From the run root after admission, run `python3 cycles/cycle-2/C2-CU-F2/replay_target_copy.py`, `python3 cycles/cycle-2/C2-CU-F2/independent_dp.py`, and `python3 cycles/cycle-2/C2-CU-F2/star_boundary.py`. The DP checks exactly the named order-nine tree and its induced deletion graphs; the star script checks exactly the named boundary star. There was no Lean build. No background jobs were started, all owned commands have terminated, and all writes are complete.
