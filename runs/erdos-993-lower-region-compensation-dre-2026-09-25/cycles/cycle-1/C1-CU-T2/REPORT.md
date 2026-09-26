# C1-CU-T2 critique (orientation U)

## Disposition: C1-T2-1 — retained

The claim combines exact leaf-support polynomial identities with a bounded witness that the strict lower-region eligibility guard is not preserved by every pair pruning. Both parts check out at the stated scope. The star is a failure of a direct induction requiring this pruning to stay eligible; it neither refutes the primary aggregate nor rules out induction with a changed invariant or compensation argument.

Let `s` be the support of an original leaf `v`, let `H=T-{v,s}`, let `B=N_T(s)\\{v}`, and let `R=T-N_T[s]=H-B`. In an independent set of `T` that omits `s`, the leaf `v` is free, giving `(1+z)P_H`. If it contains `s`, it omits `v` and every vertex of `B`, leaving `R`, giving `zP_R`. In `T-v`, the two cases contribute `P_H` and `zP_R`. Thus

`P_T=(1+z)P_H+zP_R`, and `P_(T-v)=P_H+zP_R`.

Taking coefficient differences with integer zero extension gives, for every integer `p`,

`Delta_p(T-v)=Delta_p(H)+Delta_(p-1)(R)`,

and the target summand for this original leaf is

`Delta_(p-1)(H)-Delta_(p-1)(R)`.

So the original fixed selector is exactly the strict negativity of the first displayed sum. It cannot in general be recomputed on a pruned tree and identified with the original `F(T,p)` from these identities alone. All leaves remain separately indexed, including leaves sharing a support.

## Exact guard-loss replay

For `K_(1,12)`, `P_T=(1+z)^12+z`, `a=12`, and the first strict descent is `x=6` (`Delta_5=132`, `Delta_6=-132`). At `p=8`, `x+2<=p` and `3p=24<25=2a+1`. Each of the 12 original leaves is selected: `T-v=K_(1,11)` and `Delta_8(T-v)=C(11,9)-C(11,8)=-110`. Each summand is `Delta_7((1+z)^11)-Delta_7(1)=-165`, so the full original sum is `-1980`.

For any such leaf, pair pruning leaves 11 isolated vertices, with polynomial `(1+z)^11`, `a'=11`, and `x'=6` (`Delta_5=0`, `Delta_6=-132`). The rank guard still holds, but `3p=24<2a'+1=23` is false. The pruned graph is also a forest rather than a tree; thus a tree-only induction already leaves its graph class here, independently of the strict-guard failure. The stated numerical failure of lower-region eligibility remains a separate, exact obstruction.

## Standing-control checks and scope

I replayed `T_22` and `T_60` from their listed `t_family` recipes using the copied checked evaluator and recomputed first descent through the terminal rank (the copied helper's convenience first-descent function is not used). Their complete rows reproduce the supplied values: `T_22` has `(a,x,p)=(68,32,34)`, 67 selected leaves and sum `-498754180547001418536`; `T_60` has `(182,87,90)`, 181 selected leaves and sum `-1058142362147652597702654588268394677176033202323316960380`. Each has a positive first marked term, respectively `212336130412243110` and `2935177632783649903488454322226807645411570590073000`, but a negative complete sum. Pruning the marked leaf/support pair preserves both eligibility guards in these two controls. This is compatible with, and narrows the interpretation of, the star example: some individual prunings remain eligible; universal closure nevertheless fails.

The replay used the allowed `inputs/ordinary_tree_checked.py` copied to this worker directory, its tree-DP polynomial routine and `t_family` constructor, plus a local routine that checks `Delta_j` through `j=alpha` to include the terminal zero-extension difference. The exact bounded replay is in `replay.py` and `replay-output.json`. No enumeration or literature bridge is involved. These checks support only the exact identities and the exhibited guard failure. They establish no universal closure theorem, no compensation inequality, and no verdict on the complete lower-region aggregate.

## Limitations

- The pair-pruning example is one finite tree and gives no counterexample to the primary aggregate; its complete sum is negative.
- The two large controls are finite checks. Their guard preservation does not imply universal pruning closure.
- No minimal-positive-witness reduction, selector compensation argument, aggregate proof, or aggregate counterexample is established.
- The replay does not enumerate any class of trees; its computational scope is limited to the three explicit tree recipes.
