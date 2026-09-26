# C1-CT-U3 cross-orientation critique (T)

## Scope and source integrity

I audited all three claims in the pinned C1-U3 case against the contract, neutral handoff, protocol, execution policy, and the permitted C1 critic brief. Every SHA-256 listed in both seat packets matched before source review. The claim scope is the strict lower-region ordinary-tree aggregate with the fixed selector \(F(T,p)=\{v:\Delta_p(T-v)<0\}\), original supports and neighborhoods, and distinct tags for leaves sharing supports.

## Claim dispositions

### C1-U3-1 — retained

For each selected original leaf, put \(H_v=T-\{v,s_v\}\), \(R_v=T-N_T[s_v]\), \(W_v=N_T(s_v)\setminus\{v\}\), \(k=p-1\), and \(q_v(j)=i_j(H_v)-i_j(R_v)\). Since \(R_v=H_v-W_v\), \(q_v(j)\) counts exactly the independent \(j\)-sets of \(H_v\) meeting \(W_v\). Expanding the two differences gives

\[
\Delta_k(H_v)-\Delta_k(R_v)=q_v(k+1)-q_v(k).
\]

Summing over the unchanged selector set, with one row for each original leaf tag, proves the asserted exact reformulation. Eligibility gives \(p\ge x+2\ge2\), hence \(k\ge1\). This is an identity only: it establishes no sign for the global sum.

### C1-U3-2 — retained

In the stated tagged bipartite graph, a feasible unit flow saturating every upper-layer node and using each lower-layer node at most once implies \(|U|\le |L|\), which is the desired aggregate inequality. The graph is finite and bipartite, so the unit-capacity matching polytope is integral; Hall's condition (equivalently, absence of a subset \(X\subseteq U\) with \(|N(X)|<|X|\)) is exactly the feasibility criterion. A deficient set blocks this certificate only; it does not imply \(|U|>|L|\) globally.

The certificate is too strong to hold universally in the proposed no-cross-tag graph. The supplied eligible controls have a tagged row with positive size difference, so that row's component fails Hall immediately, despite a negative complete sum. Replay from local copies in `evidence/replay_controls.py` confirms:

- Order-91 \(T_{22}\): \((a,x,p)=(68,32,34)\), both guards hold, 67 selector values are negative, one row is \(+212336130412243110\), and the complete sum over the 67 rows is \(-498754180547001418536\).
- Order-243 \(T_{60}\): \((a,x,p)=(182,87,90)\), both guards hold, 181 selector values are negative, one row is \(+2935177632783649903488454322226807645411570590073000\), and the complete sum over the 181 rows is \(-1058142362147652597702654588268394677176033202323316960380\).

For either positive row, its entire upper side has more nodes than its lower side, so no unit flow can saturate that row. This demonstrates the missing global compensation: the tagged LP cannot pass the standing positive-row controls because it forbids transport between tags. Its soundness as a conditional certificate remains valid.

### C1-U3-3 — retained

The source correctly limits its conclusion. It proves neither universal tagged Hall feasibility nor the primary inequality by another route, and does not supply a positive full-sum witness. Failure of the stronger transport certificate, including on the controls above, is not a refutation of the primary. The primary remains unresolved by this case.

## Replay and limits

`evidence/t22-order91.json` and `evidence/t60-order243.json` are byte copies of the packet-listed standing controls. `evidence/replay_controls.py` sums all recorded row values, checks each supplied selector value is strictly negative, and checks both eligibility inequalities against the recorded \((a,x,p)\). Exact replay output is in `evidence/replay_controls_result.json`. The replay verifies these finite controls only; it does not independently regenerate their trees or coefficient vectors. No proof or eligible refutation of the universal lower-region aggregate is established here.
