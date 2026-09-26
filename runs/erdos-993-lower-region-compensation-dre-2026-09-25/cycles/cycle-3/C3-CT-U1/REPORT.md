# C3-CT-U1 critique of C3-U1 (opposing orientation T)

## Dispositions

### E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL — retained

The route states a coherent, stronger-than-target sufficient mechanism: a matching saturating all upper clones in the specified fixed-selector graph. Its quantifiers and move rule are identifiable, and the route itself leaves the universal assertion open. The clone-count difference equals the target sum under the stated definitions, so saturation would imply the desired nonpositive sum. The reverse implication does not follow: Hall is a stronger all-subsets condition than the scalar comparison of total clone counts. No universal proof or counterexample is supplied, and no verdict on the primary sum follows.

The exact selector is properly fixed at the original T,p; the clone weights count each selected leaf tag separately, including shared supports. The relation permits all clone pairs over a deletion set-pair and a support insertion after removing exactly two occupied neighbors. A two-for-one move lowers rank by one and preserves independence when its literal neighborhood condition holds. This is a mathematically useful formulation of a sufficient route, but its universal matching claim remains open.

The route's three T_m summaries agree with the copied common instrument summary: for (22,34), (60,90), and (66,98), the state/arc counts, upper supplies, lower capacities, reported flows, saturation flags, and zero cut deficits match. The instrument explicitly grades these as bounded computation. This critique did not replay them: the case packet contains no per-case primal/cut files, and the source report's flow totals alone do not let me independently validate every arc capacity, cut neighborhood, or clone-level primal. The supplied orbit-lifting explanation is plausible for the enumerated symmetry orbits (with biregular orbit-pair blocks and integral flow), but the reported summary alone cannot audit its instance-specific premises. The separate 241-row p6 claim was not rerun. These limits do not affect the status of the universal assertion, which remains open.

The old-cut examples do not transfer automatically to this enlarged graph: a two-for-one arc can leave an old deletion neighborhood, so cuts must be recomputed. The route correctly says the old refutations do not refute the changed graph, the CB(8,92) envelope is inconclusive, and the T_m flows do not establish universal saturation. The full selected-sum identity makes saturation sufficient; it does not make Hall necessary. Thus failure of the proposed mechanism would not by itself refute the primary claim.

### E993-U1-CLONE-PROJECTION — retained_narrowed

Retain the clone bijection, rankwise count identity, and conditional projection statement. For each fixed v, H_v=T-{v,s_v}, W_v=N(s_v)\\{v}, and R_v=H_v-W_v. An independent r-set A in H_v meeting W_v maps to A union {v}, a size r+1 independent set of T tagged by v. Conversely, a clone tagged v has v in its set, so independence excludes s_v; deleting v leaves a set in H_v, and the clone-weight condition says it meets W_v. Therefore the number of tagged clones at size r+1 is i_r(H_v)-i_r(R_v). Applying this for r=p and p-1 and summing over the fixed F gives exactly S(T,p). Tags are per original leaf, so leaves with a common support are not merged.

Given the source report's stated old operations, an old Delete projects to deleting one vertex, and an old Retag that deletes the prior tagged leaf also projects to a one-vertex deletion. The new graph includes every clone pair over such a deletion pair. This conditional statement is sound at the stated set level.

Narrow the claimed strict ordinary-tree examples: EVIDENCE.json lists clone labels and set contents for one fiber pair, and the numerical guards for the reported switch row check (x+2=6 and 3p=18<19). It does not supply the underlying tree's edge list, original leaf supports, independent-set verification, or exact graph encoding. I therefore cannot independently verify that those displayed vertices are active clones of a realizable ordinary tree, or that the order-14 switch is an edge of the stated graph. The abstract descriptions illustrate how strictness could occur, but do not establish the claimed ordinary-tree witnesses. No claim about a minimum repair set or universal sufficiency is supported.

## Scope, arithmetic, standing controls, and usefulness

The route works with ordinary finite trees and the lower-region guards; it does not invoke an RTree transfer. The only displayed eligibility arithmetic for a concrete switch is internally correct, but the missing tree encoding prevents realizing that row. No complete favorable-set or positive aggregate counterexample is claimed. The strict favorable selector remains fixed; nothing in the audit relaxes its strict `Delta_p(T-v)<0` condition or changes `p-1`.

The mechanism is useful as a candidate proof certificate and as a bounded diagnostic for repairing particular deletion-only cuts. Its reach is limited: even a universal proof would be a sufficient proof of the aggregate, while a failed flow would leave the aggregate undecided. The finite results and absent CB(8,92) exact flow/cut leave the universal question unresolved.

## Limitations

- The matching claim has no universal proof or counterexample in the reviewed source case.
- The three T_m results were compared to the copied common summary but not independently replayed; per-case primal/cut files were not in the sealed case inputs.
- The 241 eligible p6 flows were reported but not rerun.
- The supplied numeric switch and clone-fiber examples lack an exact ordinary-tree encoding, so their realizability is unverified.
- The expanded CB(8,92) graph has no exact flow or cut here.
- Matching saturation is stronger than the scalar aggregate; neither direction of equivalence is established.
