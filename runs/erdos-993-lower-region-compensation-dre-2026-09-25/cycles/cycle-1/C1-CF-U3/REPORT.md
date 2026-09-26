# C1-CF-U3 critique of C1-U3

## Scope and audit result

I audited all three case claims against the registered lower-region contract and the listed common controls. The exact tagged-layer reformulation and the conditional matching certificate are correct. The matching certificate is strictly stronger than the target and fails on supplied eligible controls. The route does not prove universal flow feasibility or the target inequality, and it gives no counterexample to the target.

## Claim C1-U3-1 — retained

For a selected original leaf (v), the contract has (H_v=T-\{v,s_v\}), (W_v=N_T(s_v)\setminus\{v\}), and (R_v=T-N_T[s_v]). In the original tree, (H_v-W_v=R_v). Independent sets of (H_v) not meeting (W_v) are exactly the independent sets of (R_v), so

\[
q_v(j)=i_j(H_v)-i_j(R_v)
\]

counts exactly the independent (j)-sets of (H_v) meeting (W_v). With (k=p-1\), subtraction of the two first differences gives

\[
\Delta_k(H_v)-\Delta_k(R_v)=q_v(k+1)-q_v(k).
\]

The summand in the contract is this left side. Summing over the unchanged fixed selector (F(T,p)) proves the stated identity and equivalence with the aggregate tagged-layer inequality. The argument neither changes the selector nor merges leaves with a common support. Under the contract's eligibility, (p\ge x+2\ge2\), so (k\ge1\); the identity itself is valid at these integer ranks. This is a reformulation only and supplies no sign for the sum.

**Disposition: retained.**

## Claim C1-U3-2 — retained, with the scope of the certificate made explicit

For each selected tag (v), the proposed graph has (q_v(k+1)) upper nodes and (q_v(k)) lower nodes. A feasible unit-demand flow with unit lower capacities sends one unit out of each upper node, so summing the constraints yields

\[
\sum_{v\in F}q_v(k+1)\le\sum_{v\in F}q_v(k).
\]

Thus feasibility is a sound sufficient certificate. The finite bipartite max-flow/min-cut theorem, equivalently the bipartite matching theorem with unit capacities, says feasibility holds exactly when each subset of upper nodes has at least as many neighboring lower nodes. If such a subset is deficient, it disproves feasibility of this certificate, not the scalar aggregate inequality. Tagging correctly prevents unsupported cross-leaf transport.

The standing controls show that the stronger matching certificate is not universally available. In the order-91 T22 control, (a=68,x=32,p=34): (x+2=34\le p) and (3p=102<137=2a+1). The exact control has all 67 leaves selected, full aggregate \(-498754180547001418536\), and selected leaf 2 has local summand \(+212336130412243110\). By Claim 1's exact row identity, this local summand is (q_2(k+1)-q_2(k)>0). Hence in the tagged graph the upper nodes with tag 2 already outnumber all lower nodes with tag 2; since they have no neighbors with another tag, this is a Hall-deficient subset, and no proposed unit flow exists.

The same check holds for the order-243 T60 control: (a=182,x=87,p=90), so (x+2=89\le90) and (3p=270<365=2a+1). All 181 leaves are selected, the full aggregate is \(-1058142362147652597702654588268394677176033202323316960380\), while leaf 2 has local summand \(+2935177632783649903488454322226807645411570590073000\). The tag-2 row therefore also violates Hall. These exact control fields were inspected in the listed standing-control JSON files; I did not rebuild their tree coefficient vectors.

This does not contradict the route's conditional certificate statement, which makes no universal feasibility claim. It does rule out using this unweighted, within-tag unit-flow construction as a universal proof of the primary. The controls also confirm why a positive row or Hall obstruction cannot be promoted to a positive complete sum.

**Disposition: retained.**

## Claim C1-U3-3 — retained, narrowed by the supplied controls

The route's stated result is a report of what it establishes: it supplies neither a universal Hall proof nor an eligible positive full-sum ordinary-tree witness. That assessment is accurate. It can be sharpened: universal feasibility of the route's particular tagged unit-flow certificate is false, as the eligible T22 and T60 rows above furnish Hall obstructions, even though their complete sums are negative. This is a limitation of that proof method, not a refutation of the primary aggregate.

**Disposition: retained_narrowed.** Revised exact statement: “C1-U3 gives an exact layer reformulation and a conditional sufficient tagged-flow certificate but no resolution of the primary. The certificate is not feasible for every eligible instance: T22 and T60 each have a selected positive row and hence a tagged Hall obstruction, while their full selected sums remain negative. No eligible positive full-sum tree is supplied.”

## Overall conclusion and limitations

All three source claim IDs are covered. The primary lower-region aggregate remains unresolved by this route. The exact (D_v,C_v) identity in the common handoff is consistent with the reformulation, but the route proves no global deficit budget. No source search, outside theorem, finite census, or status award is used. Source hashes matched the hashes in the two assigned packets. The standing controls were read as pinned data and their guards, selected leaf, local term, and full aggregate were checked; their full coefficient vectors and tree encodings were not independently regenerated in this critique.
