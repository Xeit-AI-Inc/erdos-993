# C3-CU-T6 critique of C3-T6

## Disposition

**retained** — `C3-T6-T4-PENDANT-GRAFT-SELECTOR-CLOSURE`, exactly at the source's two-tree, fixed-rank scope. The finite computation is valid. It does not imply a general pendant-graft selector-closure rule or prove the primary aggregate for arbitrary ordinary trees.

## Independent scope and graph audit

The source recipe has vertices `0,1,2` on the path `0-1-2`; for each of four branches it adds a distinct center adjacent to `0` and three new leaves adjacent to that center. It optionally adds a new leaf adjacent to `0`. These constructions are connected and have respectively 18 and 19 edges on 19 and 20 vertices, so each is an ordinary tree. The original leaves and supports are the twelve vertices `(4,3),(5,3),(6,3),(8,7),(9,7),(10,7),(12,11),(13,11),(14,11),(16,15),(17,15),(18,15)`. The grafted tree adds tagged leaf `(19,0)`. Repeated supports are correctly counted once per distinct leaf.

The exact mask recurrence in the copied source computes `I(G;z)=I(G-v;z)+z I(G-N[v];z)` using integer coefficients. Replaying the copied source produced byte-identical JSON to the sealed evidence; see `REPLAY-EVIDENCE.json`. Inspecting the vectors and recomputing the listed differences gives:

- For `T4`, `alpha=14`; `Delta_0,...,Delta_14` first becomes negative at `x=7`. `p=9` satisfies `x+2=9` and `3p=27 < 29=2alpha+1`.
- For `T4` plus the root leaf, `alpha=14`; the listed differences again first become negative at `x=7`, with the same two eligibility checks.
- In `T4`, each of the twelve listed leaves has `Delta_9(T-v)=-652`, so all and only these leaves are selected. The coefficient differences are `q_v(8)=1728`, `q_v(9)=912`; hence the summand `Delta_8(H_v)-Delta_8(R_v)=q_v(9)-q_v(8)=-816` and `S=-9792`.
- After the graft, each of the twelve old leaves has `Delta_9(T^+-v)=-1395`; the new leaf has `Delta_9(T^+-19)=-1536`. Thus the complete selector is all thirteen leaves. For each old leaf the coefficient differences give `q_v(8)=3192`, `q_v(9)=1848`, and summand `-1344`. For the new leaf they give `q_{19}(8)=1686`, `q_{19}(9)=831`, and summand `-855`. The full tagged sum is `12(-1344)-855=-16983`.

Here `H_v=T-{v,s_v}` and `R_v=T-N[s_v]` use the original tree's support and closed neighborhood. For old leaves the support fiber multiplicity is three at each of `3,7,11,15`; the new leaf's support is `0`. The rows in the replay evidence list both `H_v` and `R_v` coefficient vectors for every selected tag. The summand is the rank difference `Delta_8(H_v)-Delta_8(R_v)=q_v(9)-q_v(8)`, consistent with the sign convention in the contract.

## What this establishes and remaining gap

The selector update follows from `I(G^+;z)=I(G;z)+zI(G-r;z)`: deleting an old leaf changes its selector difference by `Delta_8(G-{v,r})`; here the computed change is `-743` (`-1395-(-652)`). Deleting the new leaf recovers `T4`, giving its selector value `Delta_9(T4)=-1536`. These identities and the checked rows establish the specified single graft instance.

No induction over `m`, rank, or branch shapes is supplied. In particular, the finite recurrence does not show that old leaves remain favorable after an arbitrary graft, does not provide a general criterion for whether the new leaf is favorable, and does not establish the required global budget for all eligible trees. The two negative sums are bounded examples, not a universal proof or counterexample. I found no defect in the stated finite claim; no external theorem or broader census was used.

## Replay and evidence

`REPLAY-COMPUTE.py` is an exact copy of the source program. Run `python3 REPLAY-COMPUTE.py > REPLAY-EVIDENCE.json` from this directory. Its output matches the source `EVIDENCE.json` byte-for-byte. The replay is deterministic and bounded to these two 19/20-vertex trees; it is not an exhaustive generation claim.
