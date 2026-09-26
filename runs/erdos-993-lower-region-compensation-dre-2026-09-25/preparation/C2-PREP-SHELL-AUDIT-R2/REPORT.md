# C2-PREP-SHELL-AUDIT-R2: proposed proof-integrity result

**Authority:** proposed_worker_only. **Verdict:** PASS as an informal mathematical proof, conditional on the exact pinned first-wide graph theorem; no new formal verification or canonical award. The intended consequence is precisely the registered **E993-LOWER-REGION-FIRST-ORDER-SHELL**. The separately stated pointwise shell result below is stronger and has no registered status award here. The unrestricted lower-region aggregate remains outside this audit.

## Inputs and evidence boundary

All **20** brief-listed source files matched their SHA-256 pins; see `HASHES.json`. The saved Lean source and its source pin have matching hash. Its `Erdos993G1.firstWide_nonpos_of_two_edges` (lines 2513–2524) says: if a finite simple graph has (2r+2) vertices, (r\ge1), and at least two edges, then (\Delta_r\le0). The associated `firstWide_delta_pos_iff` (lines 2529–2539) says (\Delta_r>0\) exactly when there are at most one edge. These are exact cardinality and edge hypotheses; no first-descent or acyclicity hypothesis is attached. The pinned source was inspected, **not rebuilt**. `DEPENDENCY-RECORDS.json` calls this a prior formal award; this audit verifies the statement and hash, not the old kernel run.

For comparison, the supplied controller sanity result was not taken as proof. The independent scratch instrument `independent_check.py` has no project imports; its output is `INDEPENDENT-CHECK.json`. It exhausted 27,626 six-vertex graphs with cover number at least three and 1,738,095 admissible nonisolated-mark cases, checked the cover-three arithmetic for (0\le r\le500), and sampled 100 labeled Prüfer trees at each even order 8 through 20. No failure occurred. These checks have **bounded-computation** grade only. The listed order-91 and order-243 controls concern other orders, and the order-252 control is a single first-shell example; none proves a universal statement.

## Definitions and exact proposed scope

For a finite graph (G), let (i_j(G)) count independent (j)-sets, zero for out-of-range integer (j), and (\Delta_j(G)=i_{j+1}(G)-i_j(G)). For (W\subseteq V(G)), let (q_j(G,W)) count independent (j)-sets meeting (W). Let (\tau(G)) be its minimum vertex-cover size. A tree's first strict descent (x(T)) is the least nonnegative (j) with (\Delta_j(T)<0).

**Pointwise shell proposition (proposed, no new claim award).** If (T) is an ordinary tree, (p\ge3), (|V(T)|=2p+2), and (x(T)+2\le p), then for **every original leaf** (v) with original support (s),

\[
\Delta_{p-1}(T-\{v,s\})-\Delta_{p-1}(T-N_T[s])\le0.\tag{P}
\]

There is no need for the lower-region alpha guard or favorable-leaf selection in (P). The registered first-shell statement follows by summing (P) over its exact fixed selector, while retaining its guards (x(T)+2\le p), (3p<2\alpha(T)+1), and (|T|=2p+2). No statement for another order is inferred.

## Independent proof

### 1. Marked shadow lemma

Let (|G|=2k+2), (k\ge2), (\tau(G)\ge3), and let (W) contain a nonisolated vertex. Then

\[
q_{k+1}(G,W)\le q_k(G,W).\tag{1}
\]

Order the marks (w_1,\ldots,w_t) with a nonisolated mark first. A marked independent (j)-set has a unique first mark (w_i). Removing (w_i) leaves an independent ((j-1))-set in
\(J_i=G-[N_G[w_i]\cup\{w_1,\ldots,w_{i-1}\}]\), and this is a bijection. Thus
\(q_j(G,W)=\sum_i i_{j-1}(J_i)\).

The deletion set has at least two vertices: for (i=1), (w_1) has a neighbor; for (i>1), it contains (w_i) and an earlier distinct mark. Hence (|J_i|\le2k). If (|J_i|\le2k-1), count pairs (B\subset A) of independent ((k-1))- and (k)-sets in (J_i). Every (k)-set gives (k) pairs, while every ((k-1))-set has at most (|J_i|-k+1\le k) possible extensions. Therefore (i_k(J_i)\le i_{k-1}(J_i)), including empty and out-of-range strata.

If (|J_i|=2k), the deletion set is exactly ({w_i,z}). Every neighbor of (w_i) is (z), or (w_i) is isolated. Every edge of (G) omitted from (J_i) is consequently incident to (z): this includes the case that (z) is an earlier mark. Were (J_i) to have at most one edge, (z) together with one endpoint of that edge, if present, would cover all edges of (G). This contradicts (\tau(G)\ge3). Hence (J_i) has at least two edges. Apply the exact pinned first-wide theorem with (r=k-1\ge1) and (|J_i|=2r+2) to obtain (i_k(J_i)-i_{k-1}(J_i)=\Delta_r(J_i)\le0). Summing all first-mark fibres proves (1). The argument does not assume edge-addition monotonicity.

### 2. Cover-three obstruction at **every** earlier rank

Suppose (|T|=2p+2), (p\ge3), and (\tau(T)\le3). Extend a minimum cover to a cover (C) of **exactly** three vertices; (|T|\ge8) makes this possible. Its complement (U) is independent and has (N=2p-1) vertices. For each independent (X\subseteq C), set (b_X=|U\setminus N_T(X)|). The exact partition by (X=A\cap C) of each independent set (A) gives
\(I_T(z)=\sum_{X\subseteq C,\ X\text{ independent}}z^{|X|}(1+z)^{b_X}\).

Write (E(b,j)=\binom b{j+1}-\binom b j) with integer zero extension and (C_j=\frac1{j+1}\binom{2j}j) for (j\ge0), (C_j=0) for (j<0). For all (b\ge0,j\ge0), (E(b,j)\ge-C_j). Here is a direct derivation, so the registered floor is not silently substituted for the cover partition. For (j=0), (E(b,0)=b-1\ge-1). For (j\ge1), put (h(b)=\binom b j-\binom b{j+1}). Pascal gives (h(b+1)-h(b)=\binom b{j-1}-\binom b j). This is zero at (b\le j-2), positive for (j-1\le b\le2j-2), zero at (b=2j-1), and negative for (b\ge2j). Thus the maximum of (h) occurs at (b=2j-1,2j) and equals (C_j). At (j=-1), (E(b,-1)=1\ge0=-C_{-1}); at (j\le-2), both binomial terms are zero. Those negative-index cases matter when (|X|>r).

Taking the coefficient difference at any (0\le r\le p-2), the empty (X) term is (E(N,r)). There are at most (inom3a) nonempty independent (X) of size (a). Therefore

\[
\Delta_r(T)\ge E(2p-1,r)-3C_{r-1}-3C_{r-2}-C_{r-3}.\tag{2}
\]

Since (2p-1\ge2r+3), the first term is at least (E(2r+3,r)): Pascal gives (E(b+1,r)-E(b,r)=\binom b r-\binom b{r-1}>0) for (b\ge2r+2), with the (r=0) case immediate. The resulting lower bound is **strictly positive for every (r)**. At (r=0) it is (E(3,0)=2). At (r=1) it is (E(5,1)-3C_0=2). For (r\ge2),
\(E(2r+3,r)=\frac{2(2r+3)}{r+3}C_{r+1}\ge2C_{r+1}\).
The Catalan ratio (C_{j+1}/C_j=2(2j+1)/(j+2)\ge2) for (j\ge1), so (C_{r+1}\ge4C_{r-1}), while (3C_{r-1}+3C_{r-2}+C_{r-3}\le7C_{r-1}). The bound in (2) is at least (C_{r-1}>0). Thus (\Delta_r(T)>0) for **all** (0\le r\le p-2), whence (x(T)\ge p-1). In particular (x(T)+2\le p) rules out (\tau(T)\le3), so every eligible first-shell tree has (\tau(T)\ge4).

### 3. Leaf cover equality, component roots, and the exact term

Let (v) be any original leaf with support (s), and put (H=T-\{v,s\}), (W=N_T(s)\setminus\{v\}), (R=T-N_T[s]=H-W). A maximum independent set in (T) may be chosen to contain (v): if it contains (s), replace (s) by (v); otherwise add (v) if necessary. Conversely every independent set in (H) extends by (v). Hence (\alpha(T)=\alpha(H)+1), and the general identity (\tau(G)=|G|-\alpha(G)) gives (\tau(H)=\tau(T)-1\ge3). Equivalently, a cover of (H) extends by (s), while a minimum cover of (T) can be taken to contain (s) and omit (v).

Every component of (H) has a neighbor of (s): a path in connected (T) from that component to (s) must enter (s) directly, because (v) is a leaf. Acyclicity makes the attaching neighbor unique, though existence alone is enough. Since (\tau(H)\ge3), (H) has an edge. Its nontrivial component therefore has a root in (W) that is nonisolated in (H). The empty (H), empty (W), and all-isolate cases cannot occur under this cover bound.

Now (|H|=2p=2(p-1)+2) and (k=p-1\ge2), so (1) applies: (q_p(H,W)\le q_{p-1}(H,W)). As (R=H-W), (q_j(H,W)=i_j(H)-i_j(R)), including zero/out-of-range coefficients. Consequently
\[
\Delta_{p-1}(H)-\Delta_{p-1}(R)=q_p(H,W)-q_{p-1}(H,W)\le0,
\]
which proves (P).

For the registered consequence, (p\ge3) follows automatically: (|T|=2p+2\ge2) gives (\Delta_0(T)=|T|-1>0), hence (x(T)\ge1), and (x(T)+2\le p). Apply (P) to every original leaf in the fixed set (F(T,p)=\{v:\Delta_p(T-v)<0\}), then sum. An empty (F) gives zero; leaves sharing one support remain separate indexed summands. The strict alpha guard is retained but unused. This establishes only the registered **first-order shell** as a proposed informal consequence.

## Critic pass and limitations

I looked for an off-by-one in the first-mark deletion, an illicit use of the first-wide result at (2k-1), a loss of strictness in the cover bound, a negative Catalan-index error, a cover-number error after leaf deletion, and a component with no marked root. Each case is handled explicitly above; no counterexample or gap survived. The controller candidate can be clarified by spelling out the isolated-later-mark case and the (p\ge3) implication, but these are exposition repairs, not mathematical defects.

This is **not** a Lean build of the shell theorem. The pinned formal theorem is an imported exact dependency; all new reasoning is informal, with separate bounded falsification. No claim for (n\ge2p+3), the unrestricted lower-region target, RTree transport, no-recovery, or Erdős #993 follows. The independent computation is a same-family scratch check rather than a second model-family verification; a governed formalization or independent family review may be chosen later by the controller. The registered and canonical statuses remain unchanged by this worker report.
