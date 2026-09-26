# C2-CF-U1 cross-orientation critique

**Authority and scope.** This is an informal critique of the single claim in C2-U1, from orientation F. The packet-listed source hashes matched. I checked the route report and return against the common contract, protocol, handoff, and permitted cycle-2 controls. The result below is a proposed worker disposition only.

## Disposition: retained

The route's exact claim is retained: for every finite ordinary tree (T), original leaf (v) with support (s), and integer (p\ge3) with |V(T)|\le2p+1, the pointwise quantity

\[
\Delta_{p-1}(T-\{v,s\})-\Delta_{p-1}(T-N_T[s])\le0
\]

holds with integer zero-extended independent-set counts and original-tree neighborhoods. No alpha, (x(T)), favorable-selector, or lower-region guard is needed for this auxiliary claim. The proof is informal; this does not establish a formal award or a claim outside the registered order band.

## Independent proof audit

Put (H=T-\{v,s\}), (W=N_T(s)\setminus\{v\}), (R=T-N_T[s]=H-W), and (k=p-1\ge2). Let (q_j) count the independent (j)-sets of (H) meeting (W). Because the sets not meeting (W) are exactly the independent sets of (R), (q_j=i_j(H)-i_j(R)). Thus the claimed difference is (q_{k+1}-q_k), with no shift error.

Deleting (s) from the tree separates its branches. The branch of (v) is the singleton (\{v\}); each other branch meets (H) in one component rooted at the unique neighbor (w\in W) of (s). Uniqueness follows from acyclicity. Hence every component of (H) has exactly one marked root. If (H) has an edge, at least one of those roots is nonisolated in (H). If (H) is edgeless, every component is a singleton and (W=V(H)). This includes the possible empty (H) case separately; for (T=K_2), (H=W=\varnothing), and both positive-rank counts vanish.

For an arbitrary ordering (W=(w_1,\ldots,w_t)), define

\[
J_i=H-\bigl(N_H[w_i]\cup\{w_1,\ldots,w_{i-1}\}\bigr).
\]

Every independent set meeting (W) has a unique first marked vertex (w_i). Removing it gives an independent set in (J_i); conversely, adjoining (w_i) to a set in (J_i) gives a set whose first mark is (w_i). Later marks are correctly left available. Therefore (q_j=\sum_i i_{j-1}(J_i)) for (j\ge1).

When (H) has an edge, order a nonisolated marked root first. Its closed neighborhood removes at least two vertices, so 
\(|J_1|\le |H|-2\). For (i>1), the deleted union contains the two distinct marked vertices (w_1,w_i), so 
\(|J_i|\le |H|-2\) as well. Since

\[
|H|=|T|-2\le2p-1=2k+1,
\]
all (J_i) have order at most (2k-1).

For any finite graph (J) on (N\) vertices, count incidences of an independent ((k-1))-set and an addable vertex. Each independent (k)-set gives exactly (k) incidences, and each lower set has at most (N-k+1) extensions. Thus, when (N\ge k-1),

\[
k i_k(J)\le (N-k+1)i_{k-1}(J).
\]

If (N\le2k-1), the coefficient is at most (k), giving (i_k(J)\le i_{k-1}(J)). For (N<k-1), both ranks exceed the order and both counts are zero; this handles the natural-number boundary without using a negative extension count. Applying this to each (J_i) and summing the ordered partition proves (q_{k+1}\le q_k).

If (H) is edgeless, (W=V(H)), so (q_j=\binom{|H|}{j}) with zero extension. For (m=|H|\le2k+1), \binom{m}{k+1}\le\binom{m}{k}: when (m<k) both are zero, and otherwise the adjacent-layer ratio is ((m-k)/(k+1)\le1). Hence the same conclusion holds. The (H=\varnothing) and out-of-range cases are consistent with zero extension.

## Scope and control checks

- The numerical hypotheses are used precisely: (p\ge3) gives (k\ge2), and (|T|\le2p+1) gives (|H|\le2k+1). The proof does not silently cover (p=2) or the first uncovered order (|T|=2p+2).
- The selector is irrelevant to this pointwise theorem. Summing the pointwise inequality over any fixed selected subset is valid only when each leaf instance lies in the same order band; this does not prove the primary unrestricted lower-region aggregate.
- The order-91 and order-243 standing trees have ((n,p)=(91,34)) and ((243,90)), respectively, so (n\le2p+1) fails in both. The fresh order-252 shell row has (p=125), also outside the band. These controls therefore do not refute or verify this pointwise claim. Their negative full sums are not substitutes for an order-band proof.
- The claim is neither universal tree log-concavity nor a universal sign for all ranks/support fibres. The imported refutation fences on those broader statements do not apply to this restricted adjacent marked-shadow inequality. No broadening or use of edge-addition monotonicity occurs.
- There is no computational witness or bounded census in the route claim to replay. The component-root argument uses ordinary-tree acyclicity; it is not inferred from a generic isolate-coverage assertion.

## Limitations

- Informal derivation only; no Lean file, kernel check, or formal award was produced.
- The exact (p\ge3), (|T|\le2p+1) pointwise scope is retained. No claim is made for (|T|=2p+2), outside the order band, or for the primary complete selected sum there.
- No computation or public-literature result is needed or claimed.
