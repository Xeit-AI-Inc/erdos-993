# C1-CT-F4 critique of C1-F4

## Disposition

**C1-F4-1: retained.** The route's exact finite-census claim is supported by an independent replay. Its scope remains only the stated 80-tree symmetric family box and 151 eligible parameter rows. This gives no verdict on the registered universal lower-region aggregate.

## Audit

All common packet pins and all four C1-F4 source pins matched their listed SHA-256 values. I read the four common read-first files, the permitted critic brief, and the exact listed source files. For replay, I copied the pinned evaluator and route script into this seat's `evidence/` directory and changed only the copied script's helper lookup to use that local copy; no sealed source was edited or executed. Running `python3 evidence/source_replay.py > evidence/replay.json` from the scratch root regenerated JSON exactly equal to the route's pinned `census.json`.

The generator has three nested ranges of sizes 5, 4, and 4, giving 80 triples. For each triple it builds one root, `m` adjacent hubs, and `d` paths of `L` edges from each hub. Each newly added path vertex is distinct, so this is a finite simple connected acyclic graph with order `1+m(1+dL)`. The path length convention matches the report: `L` edges and `L` new vertices per hub arm. The family polynomial described in the report is consistent with conditioning on the hub and then the central root; the replay instead uses the permitted exact forest DP.

For each graph the evaluator sets `alpha` to the degree of its nonzero independence polynomial and checks `Delta_j` for every `j=0,...,alpha`, with coefficient zero extension. Thus the terminal rank is included when it computes `x`. The `p` loop starts at `x+2`, checks through `alpha`, and retains precisely rows with `3p < 2alpha+1`. For each row, the evaluator's selector tests each original degree-one vertex separately using `Delta_p(T-v)<0`. Its summand subtracts the `p-1` differences on the original-graph deletions `T-{v,s_v}` and `T-N_T[s_v]`; the helper retains one entry for every favorable leaf, including distinct leaves with a shared support. Summing those entries is the complete selected aggregate.

The independent replay yields 80 configurations, 151 eligible rows, 151 negative aggregates, zero zero aggregates, and zero positive aggregates, matching the pinned census exactly. This independently verifies the finite arithmetic and stated boundary. It does not verify or imply a sign for other family parameters or other trees.

No transport mechanism or universal implication is proposed by this route claim. The supplied local-positive/full-negative controls therefore do not contradict this bounded census; they do preclude treating local sign data as a substitute for a complete selected sum. The route likewise makes no claim to refute or prove the primary aggregate.

## Limitations

- The conclusion is computational and bounded to `2<=m<=6`, `1<=d<=4`, and `2<=L<=5` for this equal-branch/equal-path family.
- Replay uses the permitted ordinary-tree evaluator; although the source and replay agree exactly, this is not a formal proof of a universal theorem.
- Mixed branch degrees, mixed path lengths, parameter values outside the box, and trees outside the family are not covered.
- The primary registered lower-region assertion remains unresolved by this claim.
