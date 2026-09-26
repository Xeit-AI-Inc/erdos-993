# C3-CT-F4 critique (orientation T)

## Scope and disposition

I audited the single C3-F4 claim `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. **Disposition: retained.** Its proposed-open conclusion and its bounded investigation are supported. The claim does not assert a proof or refutation of the registered aggregate.

## Independent checks

All 4 case-listed source hashes and all 115 listed common-source hashes match their packet pins. I copied the route's `COMPUTE.py` and the listed exact tree evaluator into this worker directory, changed only the evaluator path in the local copy, and ran that copy to completion. `EVIDENCE.json` records the exact outputs; `replay.py` and `ordinary_tree_checked.py` are the replay materials.

The marked control is correct: in `K1,7` with one marked leaf and `k=3`, the marked independent-set counts are `q_3=C(6,2)=15` and `q_4=C(6,3)=20`, while the cover number is 1. Thus the claimed `q_(k+1)<=q_k` control fails when its `tau>=3` premise is dropped. This only limits that lemma and says nothing directly against the tree aggregate.

For the 11-vertex tree, the encoded edge list gives a tree with `p=4`, `alpha=9`, and independence polynomial `[1,11,45,105,161,161,105,43,10,1]`. With zero extension, the first negative difference occurs at `x=5` (`Delta_4=0`, `Delta_5=-56`). The exact fixed favorable-leaf set is `{2,3,4,5,6,7,8,10}`. Its seven leaves supported at 0 each contribute `19`; leaf 10, supported at 9, contributes `14`, so the full selected sum is `147`. Since `x+2=7>4`, this is not an eligible target row. It is a valid warning against removing the early-descent guard from the next-order example, not a counterexample to the primary claim.

The universal small-rank exclusions at `n=2p+3` for `p=3,4` also check out. For `p=3`, `Delta_1=19>0`, so `x<=1` is impossible. For `p=4`, `Delta_2=30+sum_v binom(d(v),2)>0` and the lower differences are positive, so `x<=2` is impossible.

Finally, the replayed seeded Prüfer sample agrees with the stated 12,000 draws at each `p=6,...,10`, including early-descent row counts `355, 10727, 11951, 11998, 12000` and no positive favorable local term. Sampling gives no generation-complete conclusion.

## Proof gaps and limits

The route's primary conclusion remains open. The `n=2p+3` check found neither an eligible positive local term nor a proof of pointwise or aggregate nonpositivity. The report expressly does not audit the imported first-wide classification or Catalan-floor premises of the separate first-shell candidate; those remain outside this route claim's established evidence here. No full lower-region proof, eligible positive full-sum counterexample, or citation bridge is supplied. The complete original selector and global sum are not resolved by these local controls or samples.
