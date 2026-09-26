# C3-U1 route report — weighted Hall identity audit

## Scope

This route audits the proposed lower-region two-for-one weighted Hall mechanism on ordinary finite trees. Let i_j(G) be the zero-extended independent-set count, Delta_j=i_(j+1)-i_j, x(T)=min{j>=0:Delta_j(T)<0}, and a=alpha(T). Assume x(T)+2<=p and 3p<2a+1. Fix F={original leaves v:Delta_p(T-v)<0}. For v in F let s_v be its original support and W_v=N_T(s_v)\{v}. Set w_F(B)=#{v in F intersect B:(B\{v}) intersects W_v}.

The weighted clone graph has w_F(B) upper clones over each independent (p+1)-set B and w_F(D) lower clones over each independent p-set D. Join every clone pair over B,D if either D=B\{q} for q in B, or there is s not in B with exactly two neighbors of s in B and D=(B\(N_T(s) intersect B)) union {s}. The proposed mechanism is that a matching saturates every upper clone. This implies S(T,p)<=0 because the total upper clone count minus the total lower clone count is S(T,p). The converse is not established; Hall is a sufficient and stronger mechanism.

## Clone projection and strict enlargement

For v in F let H_v=T-{v,s_v} and C_r(v)={A in Ind_r(H_v): A intersects W_v}. The map (v,A) -> (B=A union {v}, clone v) is a bijection from tagged active occurrences at rank p to upper clones: s_v is absent from A, so adding the leaf preserves independence, and the weight condition on B is exactly A intersect W_v nonempty. The identical argument at rank p-1 gives the lower-clone bijection. Thus
sum_{|B|=p+1} w_F(B)-sum_{|D|=p} w_F(D)
=sum_{v in F}(|C_p(v)|-|C_(p-1)(v)|)=S(T,p),
using |C_r(v)|=i_r(H_v)-i_r(T-N[s_v]). Distinct leaves remain distinct tags even at a shared support.

Every old literal edge projects to a deletion of the underlying independent set. Old Delete retains its tag and deletes a vertex. For old Retag from v to u in A intersect F, the source clone set is A union {v} and target clone set is A, again a deletion (of v). The new graph includes every clone combination over a deletion set-pair, so it relaxes the old tag compatibility.

A strict fiber example in the pinned audit has upper clone tag 8 over B={1,3,5,8,9,10,11} and lower clone tag 9 over D={3,5,8,9,10,11}=B minus {1}. Old Delete retaining tag 8 does not reach this tag-9 clone; old Retag to 9 reaches B minus {8}={1,3,5,9,10,11}, not D. The new complete clone fiber supplies this pair.

A second strict enlargement is a non-deletion switch on an order-14 tree at p=6. The upper set {1,3,5,8,9,10,11} has weight 3; inserting vertex 0 after removing its exactly two occupied neighbors {1,11} gives lower set {0,3,5,8,9,10}, also of weight 3. This row has alpha=9, x=4 and favorable leaves {6,8,9,10,12,13}, so both lower-region guards hold. The pinned exact replay independently checked the arc.

## Relationship to inherited refutations

The pinned set of 92 inherited refutations includes the following relevant old-mechanism results:

- E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL: old relation refuted at T22, order 91, p=34; its old center-free cut has deficit 14226520737620288370. The complete aggregate on that row is -498754180547001418536, so this is not an aggregate counterexample.
- E993-R23-LITERAL-DELETE-ONLY-HALL: refuted by the same old witness.
- E993-R23-TAG-CLOSED-CUT-HALL: old relation and specified cut class refuted on CB(8,92), order 1567, p=492.
- E993-R23-HOT-TAG-SINGLETON-HALL and E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG: refuted at their exact old tagged-mechanism scopes.
- E993-C3-COMPLETE-TAG-DEFICIENCY-EQUALS-CONTRIBUTION: a distinct old single-tag equality shortcut, refuted.

Those statuses remain intact and do not refute this changed graph. The governed E993-R19-FIXED-GAMMA-HALL stays separate; the ordinary-to-governed transfer is unresolved. Refutations of universal tree log-concavity or real-rootedness in the inherited set are not assumptions here.

## Which known cuts are repaired; what remains open

The pinned orbit-flow results compare deletion-only and expanded graphs on three specified T_m trees. Each deletion-only instrument has a positive cut deficit, while the expanded two-for-one graph has flow equal to the full upper supply and residual cut deficit zero:

| Tree, p | Deletion-only deficit | Expanded upper supply and flow | Expanded cut deficit |
|---|---:|---:|---:|
| T22, 34 | 14226520737620288370 | 6533318342644086823410 | 0 |
| T60, 90 | 2484429454702439631214528481545445496575478415088191800 | 18218546853926351167830731257168063662695945613618170468520 | 0 |
| T66, 98 | 9792891083754740157383733153470112445673000768114042172774060 | 10621175131261862108643497325635134690753959446180514839346249972 | 0 |
The expanded transport orbit arc counts are 8,907 / 152,406 / 202,870, versus 7,135 / 124,057 / 165,317 deletion arcs. The source reports exact weighted-layer totals and per-case primal/cut validation. The 241 eligible p6 cases are reported saturated in a separate supplied audit; this route did not rerun those flows.

For these T_m instruments the symmetry lift is justified as follows. The automorphism group preserves the arm, selector, clone weights and allowed moves, and is transitive within each reported orbit. Hence each orbit-pair bipartite edge block is biregular. Spreading the orbit flow uniformly over each block gives a feasible fractional flow at the individual clone level; integrality of a finite network-flow polytope with integer capacities then gives an integral flow. This validates the orbit-to-clone lift for those enumerated instruments, conditional on their orbit and edge generation, not for arbitrary trees.

The added edge type that repairs these supplied deletion cuts is exactly support insertion after removal of the two occupied neighbors, with all clone pairs over the output pair. These audits show the combined edge family clears the listed cuts; they do not prove a minimum-cardinality set of switch edges for any cut, characterize all minimal repairs, or show that every cut in the universal graph is cleared. For additional cut-level detail, I reconstructed each old min-cut source side’s old deletion neighborhood from the pinned deletion transitions. In the expanded successful primals, flow from that source side to lower orbit states outside its old deletion neighborhood (therefore using switch-only set-pairs) is T22: 61,297,708,604,376,458,907 across 67 positive orbit pairs; T60: 8,054,454,585,769,672,795,041,594,646,481,808,494,975,786,664,767,781,920 across 227 pairs; T66: 37,019,788,735,569,186,669,835,028,448,098,972,947,432,654,455,462,444,111,963,840 across 287 pairs. Each amount exceeds its old cut deficit, as required; the cut deficit is a lower bound on switch-only flow needed to clear that cut. These primal amounts are not a minimum number of added edges. The old cuts are still counterexamples only to the old graph. CB(8,92) remains undecided for the expanded relation: its supplied capacity envelope is inconclusive, with no exact expanded flow or cut. The 92 old refutations cannot be promoted to a new-graph counterexample, and no supplied row has positive full aggregate.

## Proposed conclusion

The clone correspondence, aggregate identity, and projection of every old edge are established at the stated ordinary-tree definitions. Strict enlargement is shown by an extra clone-fiber edge and an actual support-insertion switch. The listed T_m cases are bounded successful flows, not a universal proof. Universal weighted Hall remains open, and even if proved it would be a sufficient mechanism rather than an equivalent reformulation of the complete aggregate.
