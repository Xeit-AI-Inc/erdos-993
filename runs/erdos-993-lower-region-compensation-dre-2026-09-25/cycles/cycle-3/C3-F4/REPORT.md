# C3-F4 search report

## Route and result

F4 attacks the first-order shell pointwise argument at its marked-cover threshold, deletion of two vertices, Catalan floor, and leaf-cover bridge, and then tests the next parent order `n=2p+3`. I found no defect in the displayed elementary steps of the supplied first-shell candidate. I did not independently establish its imported first-wide graph classification or Catalan-floor premises, so I make no claim that the complete shell proof is verified.

The next-order checks produced an exact sharpness example, not an eligible counterexample. The tree on vertices `0..10` with edges

`01, 02, 03, 04, 05, 06, 07, 08, 19, 9-10`

has `n=11=2p+3`, `p=4`, independence polynomial `[1,11,45,105,161,161,105,43,10,1]`, `alpha=9`, and terminal first descent `x=5`. Its favorable set at rank 4 is `{2,3,4,5,6,7,8,10}`. The seven leaves supported at 0 contribute `+19` each; leaf 10, supported at 9, contributes `+14`. Thus its exact full selected sum is `S=147`. But `x+2=7>4`, so the example violates the required early-descent guard and does not refute the target. It demonstrates why dropping that guard from a next-order pointwise or sum claim is unsafe.

The candidate's marked-shadow cover threshold is also sharp as a lemma premise: on `K1,7` with one marked leaf and `k=3`, the graph has order `2k+2`, `tau=1`, and the marked independent-set counts are `q_k=15`, `q_(k+1)=20`. Hence `q_(k+1)<=q_k` fails when `tau>=3` is omitted. This is a graph lemma control, not a tree-target counterexample.

For the very small next-order ranks, early descent is impossible for every tree. At `p=3,n=9`, `i_2-i_1=28-9=19>0`, so `x>=2` while eligibility would require `x<=1`. At `p=4,n=11`, every tree has `i_2=45` and

`i_3 = C(11,3) - 10*9 + sum_v C(d(v),2)`,

so `Delta_2=30+sum_v C(d(v),2)>0`; also `Delta_0,Delta_1>0`. Thus `x>=3`, while eligibility requires `x<=2`. These calculations eliminate `p=3,4` from an early-descent search at this parent order.

## Bounded exact search

I sampled 12,000 independent uniform labeled Prüfer sequences at each `p=6,7,8,9,10`, with `n=2p+3` and seed `20260925`. The exact evaluator reconstructed each tree and computed its full independence polynomial, first descent, fixed favorable selector, and every selected leaf term. The sample contained respectively `355, 10727, 11951, 11998, 12000` early-descent rows; no row had a positive favorable local term. This is a bounded seeded sample, not exhaustive enumeration and not evidence of a universal theorem.

`COMPUTE.py` replays the marked-star control, the exact positive but ineligible tree, and this sample using the listed `inputs/ordinary_tree_checked.py`. Exact inputs and outputs are summarized in `EVIDENCE.json`.

## Disposition and limitations

The assigned work leaves the primary ordinary favorable-leaf aggregate OPEN. I found neither an eligible positive local term at `n=2p+3` nor a proof that such terms cannot occur. The random search does not establish a generation-complete result. The cover-threshold example only falsifies the relaxed marked-shadow lemma; the positive full sum violates early descent. I did not infer any universal conclusion from either example or the sampled trees.
