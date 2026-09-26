# C3-CU-F6 critique of C3-F6

## Disposition

**Retained** the single route claim, at its stated bounded-computation scope. Its claim is that a specified computation found no positive complete selected-leaf sum in 985 eligible parameter/rank rows. It does not assert the universal lower-region inequality. The sealed route return correctly leaves the primary status proposed open.

## Source and replay audit

All hashes listed in the case and common packets matched. I read the required contract, protocol, execution policy, neutral handoff, critic brief, and the four exact case files. I copied the route's compute script and result file into this worker's scratch root before replay. Running the copied script regenerated a result JSON byte-for-byte identical to the copied sealed JSON.

The replay gives 254 eligible root-graft rows, 254 support/claw-center-graft rows, and 477 two-core-gluing rows, totaling 985. Each row's recorded polynomial has degree equal to its reported alpha; recomputing the first negative difference across ranks through the terminal zero extension recovers its reported x. Every row passes both strict eligibility guards. In every row the recorded selected summands add to the reported S; the three families have respectively 0/254, 0/254, and 0/477 positive sums. The minimum and maximum sums in those families are respectively [-23636871585,-334], [-2816606200,-242], and [-6208530780984,-4740].

I also independently counted independent sets by direct subset enumeration for the fully displayed 13-vertex example. This gives vector (1,13,66,174,265,248,149,56,12,1), alpha=9, x=4, p=6, and confirms both guards. Direct enumeration of each leaf-deleted graph gives exactly the eight favorable leaves {2,4,5,6,8,9,10,12}; the separate tags at shared supports 3 and 7 are retained as separate leaves. Recomputing the original-support terms gives -14,-51,-51,-51,-51,-51,-51,-14 and total S=-334. The check is preserved in INDEPENDENT_CHECK.json.

## Mathematical and computational scope

The construction recipes produce ordinary trees: the base T_m is a path 0-1-2 with m root-adjacent three-leaf stars; grafts attach a path at the named vertex, and the gluing family connects two such trees with a path. The recurrence in the copied compute script is the standard rooted-tree include/exclude recurrence. It evaluates the original graph and each original-leaf deletion, support deletion, and original closed-support-neighborhood deletion separately. The selector is tested from Delta_p(T-v); the term is Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N[s_v]). The code iterates distinct original leaves, so it does not collapse leaves with a common support. The explicit independent check confirms those details on the displayed row.

No mathematical proof gap invalidates the bounded claim. Its 985-row boundary is finite and parameterized; it omits all other ordinary trees and parameters outside the specified ranges. The replay uses the source computation itself for the full sweep, so it checks reproducibility rather than independently implementing every row. Only the displayed row received an independent subset-enumeration check. Therefore the evidence neither proves an unbounded family statement nor resolves the registered universal inequality, and no status beyond proposed open is warranted.

## Exact disposition

- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: **retained** as the exact finite computation claim in C3-F6/RETURN.json. The number of rows and family boundaries are accurate, and the result is reproducible. The evidence is useful as bounded negative-witness search data only.
