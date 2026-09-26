# C3-CT-F5 critique of C3-F5

## Disposition

**Retained** as a finite computational claim, with its bounded scope unchanged. The route claim ID is `C3-F5-FINITE-WEIGHTED-HALL`. The claim makes no universal assertion and explicitly leaves the primary lower-region aggregate unresolved.

## Audit and replay

The assigned packet and common-source listed hashes matched. The route report, return, evidence, and search script were reviewed. I copied the script into this scratch directory, changed only its output path to `REPLAY-EVIDENCE.json`, and ran that copy. The replay completed with 633 generated branch-multiset recipes, 138 eligible rows (all with nonempty favorable selector), zero deficient-cut rows, zero positive full sums, and `S_min=-9828`, `S_max=-224`. The exact replay output and script are included as evidence.

The generation code matches the stated family: 2–5 unordered branches, branch types `P1`–`P4` or `C2`–`C4`, and total order at most 18. Its integer rank checks use zero-extended coefficients; `x` is found by the first negative successive difference, and the integer upper bound for `3p<2alpha+1` is implemented consistently. The selector is evaluated at each original terminal leaf using `Delta_p(T-v)<0`. Every such leaf is retained as its own tag, including multiple leaves sharing a claw-center support. For each eligible row, the code directly computes every selected summand from the original tree and checks equality with upper minus lower weight. It also adds every legal deletion and every absent-vertex replacement with exactly two neighbors in the upper independent set. Such a replacement is independent and has size `p`; the finite network uses exact integer capacities, and saturation of all upper supply is sufficient to rule out a deficient source-side Hall cut in that row.

The representative `P2,C3,C4` row in the sealed evidence has `alpha=9`, `x=4`, `p=6`, satisfies `x+2<=p` and `3p=18<19=2alpha+1`, includes eight favorable original leaves (including four leaves sharing one support), and has direct summands totaling `-275`. The route’s upper supply `259` and lower capacity `534` agree with that full-sum difference, and its flow saturates the upper supply.

## Limits and usefulness

This replay confirms the result of the submitted implementation; it is not a separately implemented enumeration. The evidence establishes only the stated finite family and horizon. It supplies no argument for arbitrary ordinary trees, no universal weighted Hall theorem, and no full-scope proof or counterexample for `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. In particular, the finite family does not include all ordinary trees or the larger controls noted in the common handoff. It is useful as a bounded mechanism diagnostic and does not change the primary claim’s open status.
