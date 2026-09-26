# C1-CT-F3 critique (orientation T)

## Disposition

**C1-F3-1: retained** as an exact bounded observation. The claim does not resolve the universal lower-region aggregate, and the route correctly states that limitation.

## Independent audit

I verified the packet and common-file SHA-256 pins; every listed hash matched. I inspected the single assigned route and its evidence, and replayed from copies kept under this worker's scratch root. The replay imports a copied `ordinary_tree_checked.py`; it does not run or modify the route's script or sealed evidence. The graph is reconstructed from `t_family(22)` and the added edges `(4,91),(91,92),(92,93)`. The replay independently checks connectivity and `|E|=|V|-1`, recomputes the full independence vector, computes every `Delta_j(T)` through `j=alpha` (including the zero-extended terminal difference), all original-leaf `Delta_35(T-v)`, and all selected summands. `replay_result.json` records equality checks for every field in the route's pair evidence; all checks pass.

The exact guard arithmetic is:

- Base: `(order,alpha,x,p)=(91,68,32,35)`, `x+2=34<=35`, and `3p=105<137=2alpha+1`.
- Grafted: `(94,69,33,35)`, `x+2=35<=35`, and `105<139`.

Both encodings are connected acyclic graphs. The base has 67 original leaves and all 67 are favorable. Grafting makes old vertex 4 non-leaf and introduces leaf 93; the other 66 old leaves remain favorable, and 93 is favorable, so the recomputed selector still has 67 tags. The full sums replay exactly as `-838171658290934690688` and `-2341400510849661617965`.

The shared favorable tag 2 changes from summand `-212336130412243110` to `+424672260824486220`. In the grafted tree it is the sole positive selected summand; the other 66 selected summands are negative, and their full sum with this term is still negative. Thus this pair disproves a proposed universal termwise rule that grafting of this kind always makes retained selected summands no larger (or keeps them nonpositive), while showing no positive full aggregate. Recomputing `F` is essential: the removed leaf 4 and new leaf 93 are not the same tag.

The supplied standing T22 and T60 controls also have a positive marked term and a negative complete sum. They reinforce that local positivity does not decide the global sum. Their ranks (34 and 90) and trees differ from this fixed-35 graft pair, so I use them only as controls against inferring the aggregate sign from one term, not as extra replay of this claim.

## Scope and limitations

The result is one exact pair of ordinary trees at `p=35`. It establishes selector and summand instability under this graft and checks the route's finite arithmetic. It supplies no general graft transformation lemma, global deficit budget, proof, or eligible positive full-sum witness. The route's additional family searches are explicitly finite exploratory runs whose complete enumeration output was not retained; they support no exhaustive claim and are not used in this disposition. Nothing here decides the separately registered incidence identity.

## Replay evidence

- `cycles/cycle-1/C1-CT-F3/evidence/replay.py` reconstructs the pair from the copied evaluator and reruns the checks.
- `cycles/cycle-1/C1-CT-F3/evidence/replay_result.json` records per-field equality with the copied source evidence and the exact summary.
- `cycles/cycle-1/C1-CT-F3/evidence/ordinary_tree_checked_copy.py` and `source_graft_pair_copy.json` are the replay inputs copied into this worker's evidence directory.
