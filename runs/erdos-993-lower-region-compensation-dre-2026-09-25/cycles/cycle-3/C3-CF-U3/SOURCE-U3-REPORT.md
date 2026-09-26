# C3-U3 search report — marked first-shell dependency audit

## Scope and result

This route audits the supplied first-shell pointwise candidate for ordinary trees at order \(|V(T)|=2p+2\), with \(p\ge3\) and \(x(T)+2\le p\). It develops a Lean-ready dependency DAG for the marked-cover argument and cover-three early-descent contradiction, compares a direct two-part marked-set split with the ordered first-mark partition, and checks each imported theorem against the registered identity file. It does not build Lean and makes no formal award.

The resulting informal chain proves the supplied first-shell candidate, assuming the two registered graph/arithmetic theorems identified below. This only settles the first parent-order shell. It does not prove the complete lower-region aggregate at other orders.

## Minimal dependency DAG

For a finite graph \(G\), marked vertex set \(W\), and rank \(j\), define \(q_j(G,W)\) as the number of independent \(j\)-sets meeting \(W\), with integer zero extension. For \(y\in W\), the exact disjoint split is

\[
q_j(G,W)=i_{j-1}(G-N[y])+q_j(G-y,W\setminus\{y\}).
\]

The first term consists of sets containing \(y\); these meet \(W\) automatically. The second consists of sets omitting \(y\) and meeting the remaining marks. This uses the original graph neighborhood and removes only \(y\) from the mark set.

**Marked-cover route (preferred compact Lean route).** At target rank \(k+1\):

1. **A — marked shadow.** If \(|V(G)|\le2k\), count incidences between marked independent \((k+1)\)-sets and marked independent \(k\)-subsets. Each upper set has at least \(k\) mark-preserving deletions; each lower set has at most \(|V(G)|-k\le k\) extensions. Thus \(kq_{k+1}\le(|V(G)|-k)q_k\le kq_k\), so \(q_{k+1}\le q_k\). If either rank is outside the possible cardinalities, zero extension gives the same inequality directly.
2. **B — one wider order, arbitrary marks.** Let \(|V(G)|\le2k+1\), \(k\ge2\), and \(|E(G)|\ge2\). If \(W=\varnothing\), the assertion is trivial. Otherwise choose any \(w\in W\), apply the split above, and apply A to the second term. For the first term put \(J=G-N[w]\). If \(|V(J)|\le2k-1\), the ordinary unmarked shadow gives \(i_k(J)\le i_{k-1}(J)\). If \(|V(J)|=2k\), necessarily \(|V(G)|=2k+1\) and \(w\) is isolated; then \(J=G-w\) has at least two edges and the registered first-wide classification at parameter \(k-1\) gives the same inequality. These exhaust the order cases.
3. **C — marked cover at order \(2k+2\).** Suppose \(|V(G)|=2k+2\), \(\tau(G)\ge3\), and \(W\) contains a non-isolated \(w\). Split at \(w\). The unmarked first term has order at most \(2k\); if it has order exactly \(2k\), the deleted pair is \(\{w,z\}\), every edge outside the residual graph meets \(z\), and at most one residual edge would give a cover of size at most two. Hence the residual graph has at least two edges and the first-wide classification applies. For smaller order use the ordinary shadow. The second term is covered by B on \(G-w\): if \(G-w\) had at most one edge, \(w\) and one endpoint of that edge would cover \(G\), contradicting \(\tau(G)\ge3\). Adding the two inequalities proves \(q_{k+1}(G,W)\le q_k(G,W)\).
4. **Tree cover bridge.** With \(|V(T)|=2p+2\), a cover of size at most three can be extended to a three-element cover \(C\). Write \(U=V(T)\setminus C\), so \(|U|=2p-1\) and \(U\) is independent. For each independent \(X\subseteq C\), let \(b_X\) be the number of vertices of \(U\) nonadjacent to every vertex of \(X\). Then
   \[
   I(T,z)=\sum_{X\subseteq C,\ X\text{ independent}}z^{|X|}(1+z)^{b_X}.
   \]
   At rank \(r\), the empty-\(X\) term contributes \(E(2p-1,r)=\binom{2p-1}{r+1}-\binom{2p-1}{r}\). A term with \(|X|=a>0\) contributes \(E(b_X,r-a)\ge-\mathrm{Cat}_{r-a}\), including the stated negative-index zero-extension cases. There are at most \(\binom3a\) such \(X\). For \(0\le r\le p-2\), monotonicity gives \(E(2p-1,r)\ge E(2r+3,r)\), and hence
   \[
   \Delta_r(T)\ge E(2r+3,r)-3\mathrm{Cat}_{r-1}-3\mathrm{Cat}_{r-2}-\mathrm{Cat}_{r-3}>0.
   \]
   Positivity is elementary: at \(r=0,1\) the margins are respectively 2 and 2. For \(r\ge2\), \(E(2r+3,r)=\frac{2(2r+3)}{r+3}\mathrm{Cat}_{r+1}\ge2\mathrm{Cat}_{r+1}\), and the Catalan ratio gives \(\mathrm{Cat}_{r+1}\ge4\mathrm{Cat}_{r-1}\); the subtracted terms are at most \(7\mathrm{Cat}_{r-1}\), leaving a positive margin. Thus \(\Delta_r(T)>0\) for every \(r\le p-2\), forcing \(x(T)>p-2\). This contradicts \(x(T)+2\le p\). Therefore \(\tau(T)\ge4\).
5. **Leaf bridge and selector.** For an original leaf \(v\) with support \(s\), put \(H=T-\{v,s\}\) and \(W=N_T(s)\setminus\{v\}\). Replacing \(s\) by \(v\) in an independent set proves \(\alpha(H)=\alpha(T)-1\). Thus \(\tau(H)=\tau(T)-1\ge3\). Each component of \(H\) contains its root-neighbor in \(W\); since \(\tau(H)\ge3\), some component has an edge, so \(W\) contains a non-isolated vertex. Apply C with \(k=p-1\), since \(|V(H)|=2p=2k+2\). As \(H-W=T-N_T[s]\), the difference \(q_p(H,W)-q_{p-1}(H,W)\) is exactly the original leaf summand. It is nonpositive for every original leaf. Restricting to the fixed favorable set preserves this sign; repeated supports remain distinct leaf summands. The result is the complete first-shell sum.

**Ordered first-mark alternative.** Order \(W\) with a non-isolated mark first and partition every marked independent set by its first mark \(w_i\). Its residual graph is \(J_i=G-(N[w_i]\cup\{w_1,\ldots,w_{i-1}\})\), giving \(q_j(G,W)=\sum_i i_{j-1}(J_i)\). The deleted union always has at least two distinct vertices, so \(|J_i|\le2k\) for \(|G|=2k+2\). If \(|J_i|=2k\), the deleted pair is \(\{w_i,z\}\); all edges outside \(J_i\) meet \(z\), and \(\tau(G)\ge3\) forces at least two edges in \(J_i\). The first-wide theorem then gives the termwise rank inequality; smaller residuals use the ordinary shadow. This is one lemma shorter at the graph-theorem level than A/B/C, but its Lean proof needs a finite ordered partition and explicit bookkeeping for arbitrary earlier marks. The two-part A/B/C route avoids the ordered list and arbitrary-earlier-mark bookkeeping, at the cost of the intermediate order-\(2k+1\) lemma B. Both are mathematically sound with the stated conventions; the split identity should be formalized once and reused.

## Registered theorem and scope audit

- `E993-GRAPH-FIRST-WIDE-SHARP-CLASSIFICATION` is **VERIFIED** for every finite simple graph of exact order \(2r+2\), \(r\ge1\): \(\Delta_r>0\) iff the graph has at most one edge. Every invocation here has exact order \(2k\), parameter \(r=k-1\ge1\), and at least two edges, so it yields \(\Delta_{k-1}\le0\). No larger-order claim is imported.
- `E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR` is **VERIFIED** for all natural binomial parameters and natural rank, with the registry's explicit integer values at rank \(-1\) and ranks \(\le-2\). The cover proof uses precisely this floor and treats these out-of-range ranks; it does not assume a graph shadow outside its stated order range.
- `E993-R25-GAMMA-RESIDUE-SLACK-THRESHOLD` is **VERIFIED** for \(\tau=1,\ldots,7\), not for arbitrary cover size. The route's optional Gamma shorthand is only its \((\tau,s)=(3,1)\) cell, where the registered residue is empty. The explicit Catalan-ratio derivation above is included, so the cover contradiction can be checked without extending the registry theorem. No \(\tau\ge8\) or unregistered closed-form threshold is used.
- `E993-FIRST-ORDER-SHELL-POINTWISE-EARLY-DESCENT` is **OPEN**. This report supplies an informal proof sketch for its exact stated order and early-descent scope, contingent on the two verified results above; it does not change the registered status or assert kernel checking.
- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` remains **OPEN**. The shell argument gives no extension to \(|V(T)|\ge2p+3\), does not settle the infinite lower-region target, and does not establish any RTree bridge.
- The refuted universal tree log-concavity and real-rootedness identities in the registry are not premises. The argument proves positivity only up to \(p-2\) under the shell's cover-three assumption, then derives a contradiction from the assumed first strict descent. It makes no universal log-concavity, no-recovery, or recovery claim.

## Limits

No Lean build, imported outside-literature theorem, or new exact computation was used. The proof is informal and its mathematical correctness remains for controller review. The source case has no allocated claim IDs, so this search return proposes two narrowly scoped auxiliary claims and covers no pre-existing source claims. This route does not resolve the primary beyond the first shell.
