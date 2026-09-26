# C2-AT neutral adjudication (orientation N)

## Scope and result

I adjudicated the six C2-T routes and their twelve C2-CF/CU critics, using only the two pinned packets. All 27 listed common-source files and 49 listed case files matched their SHA-256 pins. The seven distinct claim IDs in the route returns are exactly the required covered set. Every one is disposed of below. All conclusions here are proposed worker conclusions, not controller awards.

The **registered primary** remains open on this case evidence. Let (T) be a finite ordinary tree, (a=\alpha(T)), (i_j(T)) its zero-extended independent-set counts, (\Delta_j=i_{j+1}-i_j), and (x(T)) the first (j\ge0) with (\Delta_j(T)<0), including the terminal descent. For natural (p) with (x(T)+2\le p) and **strict** (3p<2a+1), fix

\[
F(T,p)=\{v:\ v\text{ an original leaf of }T,\ \Delta_p(T-v)<0\}.
\]

With each original support (s_v) and original closed neighborhood (N_T[s_v]), the target is the **complete** sum

\[
S(T,p)=\sum_{v\in F(T,p)}[\Delta_{p-1}(T-\{v,s_v\})-\Delta_{p-1}(T-N_T[s_v])]\le0.
\]

Each leaf is a separate tag, even if several share a support; the empty sum is zero. The **registered first-order shell** is the same assertion with (|V(T)|=2p+2). Neither full assertion is proved or refuted by these routes. There is no eligible ordinary tree with a positive *complete* selected sum in this case. The proof gap is a selector-conditioned comparison across all selected tags at the first shell and, more generally, in the unrestricted lower region.

## Common exact accounting

For an original leaf (v), set (H_v=T-\{v,s_v\}), (W_v=N_T(s_v)\setminus\{v\}), and (R_v=T-N_T[s_v]=H_v-W_v). Put (q_v(j)=i_j(H_v)-i_j(R_v)), the count of independent (j)-sets of (H_v) meeting (W_v), and (k=p-1). Eligibility on a nonempty ordinary tree gives (x(T)\ge1), because (\Delta_0(T)=|T|-1\ge0); thus (p\ge3), (k\ge2). In particular, all displayed selected-rank chain groups and boundary-classification parameters are in domain. By subtraction,

\[
g_v=\Delta_k(H_v)-\Delta_k(R_v)=q_v(k+1)-q_v(k),\qquad S=\sum_{v\in F}g_v.
\]

This equality does not use favorability to infer a sign. The selector (F(T,p)) stays fixed while (j) varies. The forest (H_v) has exactly one marked root (w\in W_v) in each component: each branch beyond (s_v) has one attachment to it, and two attachments would create a cycle. The independent-set identity (I(T-v;z)=I(H_v;z)+zI(R_v;z)) also yields the exact selector formula

\[
\Delta_p(T-v)=q_v(p+1)-q_v(p)+i_{p+1}(R_v)-i_{p-1}(R_v).
\]

This shows why a sign for (g_v) cannot be read directly from the strict selector. It uses (i_{p-1}(R_v)), not (i_p(R_v)).

### First-mark shell accounting (T1 and T3)

At the first shell, (|H_v|=2p=2k+2). Order its component marks (w_1,\ldots,w_t) and define

\[
J_i=H_v-\bigl(N_{H_v}[w_i]\cup\{w_1,\ldots,w_{i-1}\}\bigr).
\]

Partition each marked independent set by its first included mark. The later marks need not be excluded. This gives, for (j\ge1),

\[
q_v(j)=\sum_i i_{j-1}(J_i),\qquad
g_v=\sum_i\bigl(i_k(J_i)-i_{k-1}(J_i)\bigr).
\]

For any graph (J) of order (N), count independent (k)-sets together with one of their (k) deletions. Each independent ((k-1))-set has at most (N-k+1) extensions, so (k i_k(J)\le(N-k+1)i_{k-1}(J)) when (k\le N). If (k>N), (i_k(J)=0) and the required comparison is immediate. Therefore (|J|\le2k-1) implies (i_k(J)\le i_{k-1}(J)), including zero extension. The T1 route wrote the incidence inequality too broadly for out-of-range (k); the CF-T1 critic supplied this case split. The claimed subclass conclusion survives it.

**T1 sufficient subclass.** Suppose each selected (v) admits an ordering with (\deg_{H_v}(w_1)\ge2) and, if (w_2) exists, (\deg_{H_v}(w_2)\ge1). The first closed neighborhood removes at least three vertices. For the second mark, the earlier (w_1), (w_2), and a neighbor of (w_2) are distinct because the marks lie in different components. Every later part removes at least three distinct marks. Hence every (|J_i|\le2k-1), every (g_v\le0), and the *complete fixed-selector* sum is nonpositive on exactly this subclass. Empty (F) is immediate. This condition has **not** been derived from favorability.

**T3 sufficient subclass.** The stronger condition that every selected (H_v) have no isolates and have some marked root of degree at least two implies T1's ordering condition, so the same proof establishes its full selected sum. This includes no assertion that every eligible shell tree satisfies the condition. A same-support second leaf becomes an isolated marked component in (H_v), and is outside the T3 structural condition. Also (\alpha(H_v)=a-1): a maximum independent set of (T) can include (v) by replacing (s_v), and deleting (v,s_v) removes exactly that one chosen vertex. Thus, with (\delta=a-p),

\[
\tau(H_v)=2p-(a-1)=p+1-\delta,
\quad 3p<2a+1\Longrightarrow\delta\ge\lceil p/2\rceil,
\quad\tau(H_v)\le\lfloor p/2\rfloor+1.
\]

This cover-number bound is exact but supplies no marked-layer comparison.

An edgeless (H_v) would make (T) a star on (2p+2) vertices. Its polynomial is ((1+z)^{2p+1}+z), with first strict descent (x=p+1), so such a shell tree cannot satisfy (x+2\le p). For a non-edgeless (H_v), place a nonisolated mark first. The only first-mark part not settled by the order bound can have (|J_1|=2k), when that mark has degree one. The only second-mark part can have (|J_2|=2k), when that mark is isolated. Parts from the third mark onward have order at most (2k-1). At (|J|=2k), if (B_J=\sum_{A\in\mathcal I_{k-1}(J)}|N_J(A)|) counts actual open-neighborhood sizes, extension incidence gives

\[
k\bigl(i_k(J)-i_{k-1}(J)\bigr)=i_{k-1}(J)-B_J.
\]

The registered `E993-GRAPH-FIRST-WIDE-SHARP-CLASSIFICATION` has exact statement: for a finite simple graph (G) on (2r+2) vertices and (r\ge1), (\Delta_r(G)>0) iff (G) has at most one edge. For an exceptional (J), take **(r=k-1)**: then (|J|=2r+2=2k) and (\Delta_r(J)=i_k(J)-i_{k-1}(J)). Thus positive exceptional parts must have at most one edge. CF-T3 incorrectly said that classification could not apply to the order-(2k) parts; CF-T1 and CU-T1 used the correct parameter. Its separate application to (H_v) with (r=k) classifies (\Delta_k(H_v)), but does not classify (g_v=\Delta_k(H_v)-\Delta_k(R_v)). Neither application proves global compensation. The order-(2k) identity above and the classification are exact scope statements; no claim is made for larger residual orders.

### Fixed-selector common-tree coordinates and path class (T2 and T4)

For an independent (B\subseteq V(T)), define

\[
w_F(B)=\#\{v\in F\cap B:\ N_T(s_v)\cap(B\setminus\{v\})\ne\varnothing\}.
\]

For each tag (v), adjoining (v) bijects independent (j)-sets of (H_v) meeting (W_v) with independent ((j+1))-sets of the original (T) counted by that tag. The inverse deletes (v); independence excludes (s_v). Summing tags, including equal-support multiplicity, gives

\[
\sum_{v\in F}q_v(j)=\sum_{\substack{B\text{ independent in }T\\|B|=j+1}}w_F(B),\quad
S=\sum_{|B|=p+1}w_F(B)-\sum_{|B|=p}w_F(B).
\]

T2's cross-tag token graph has upper tokens ((B,v)) counted by (w_F(B)) at rank (p+1) and lower tokens at rank (p). Its edge deletes one vertex from (B) and may change the tag to any selected (u) still counted below. A matching saturating every upper token, or a unit-capacity flow, would imply (S\le0). No Hall/capacity condition is proved from the selector and tree hypotheses; matching failure would refute only this sufficient certificate. The standing positive-local/negative-total controls defeat a universal within-tag matching premise, without deciding this cross-tag construction.

T4 proves a genuine path subcase. For (P_n), (n\ge4), the independent-set formula is (i_j(P_m)=\binom{m-j+1}{j}) on its support and zero elsewhere, with ratio

\[
\frac{i_{j+1}(P_m)}{i_j(P_m)}
=\frac{(m-2j+1)(m-2j)}{(j+1)(m-j+1)}.
\]

On its positive domain the ratio decreases with (j) and increases with (m), by direct adjacent-factor comparison. Thus (x(P_{n-1})\le x(P_n)); the guards put (p) below the relevant terminal support, so (\Delta_p(P_{n-1})<0) and **both** endpoint tags are in (F). Their supports are distinct. For either endpoint (H=P_{n-2}), (R=P_{n-3}), and the path recurrence gives (q(j)=i_{j-1}(P_{n-4})). Hence

\[
S(P_n,p)=2\bigl[i_{p-1}(P_{n-4})-i_{p-2}(P_{n-4})\bigr]\le0.
\]

Indeed (p-2\ge x(P_n)); at that rank the path-(n-4) ratio is no larger than the strictly subunit path-(n) ratio, and later ratios decrease. Zero extension handles ranks beyond support. No analogous weighted adjacent-rank inequality for branching trees is supplied. I independently replayed the finite path loop for (4\le n\le150): exactly 449 eligible ((n,p)) rows over 117 orders, all negative, minimum (-140598451215242502192647212080), maximum (-38896). The class proof, not this bounded replay, supports the path conclusion.

### Pendant attachment (T5)

For a finite tree (U) rooted at (r), add (r-s-v) with new vertices (s,v). Partition independent sets by whether (s) is selected. With (P(z)=I(U;z)) and (Q(z)=I(U-r;z)),

\[
I(T;z)=(1+z)P(z)+zQ(z),\quad \alpha(T)=\alpha(U)+1,
\quad I(T-v;z)=P(z)+zQ(z),
\quad g_v=\Delta_{p-1}(P-Q).
\]

The new leaf's selector is the strict rank-(p) difference of (P+zQ). These are exact for any finite rooted ordinary (U), independent of eligibility. Attachment raises order by two and alpha by one. At a shell step from (|U|=2p), the child alpha guard is (3p<2\alpha(U)+3), while the parent rank-(p-1) guard is (3p<2\alpha(U)+4); the converse loses the equality boundary. The (x)-guard and all retained-leaf selectors and summands do not follow from the whole-polynomial recurrence. As a diagnostic, (U=K_{1,4}) rooted at its center has (I(U)=1+5z+6z^2+4z^3+z^4), (x(U)=2), while attachment gives (I(T)=1+7z+15z^2+16z^3+9z^4+2z^5), (x(T)=3). This seven-vertex tree is ineligible at every (p); it is no shell counterexample. The shell proof gap remains complete selector and full-sum transfer, not the recurrence algebra.

### Relative-chain accounting (T6)

For each selected tag form the relative simplicial complex pair ((\operatorname{Ind}(H_v),\operatorname{Ind}(R_v))) over (\mathbb Q), then take their direct sum over the *fixed* (F(T,p)). In degree (j-1), its basis is precisely the independent (j)-sets of (H_v) meeting (W_v), so its dimension is (Q_j=\sum_F q_v(j)). If (b_r) is the rank of its degree-(r) boundary and (\beta_r) its homology dimension, rank-nullity gives (\dim C_r=b_r+b_{r+1}+\beta_r). Therefore

\[
S=Q_{k+1}-Q_k=b_{k+1}-b_{k-1}+\beta_k-\beta_{k-1}.
\]

The needed inequality is exactly (b_{k+1}+\beta_k\le b_{k-1}+\beta_{k-1}). No selector-conditioned rank or Betti bound establishes it. The direct sum preserves tags but its differential never transfers across them. This is an exact reduction only.

## Dispositions and synthesis boundary

| Covered claim ID | Disposition | Surviving conclusion |
|---|---|---|
| `C2-T1-SHELL-ORDERED-ROOT-SUBCLASS` | retained | Complete shell sum is nonpositive under its per-selected-tag ordered-root condition; use the zero-extension case split above. |
| `C2-T3-shell-root-shadow` | retained | Complete shell sum is nonpositive on the no-isolate/degree-at-least-two marked-root subclass; its cover coordinate is exact, not a sign bound. |
| `C2-T4-PATH-OCCUPANCY` | retained | Complete sum is nonpositive for every eligible path P_n with n>=4; both endpoints are selected. |
| `C2-T5-PENDANT-P2-RECURRENCE` | retained | Exact rooted attachment, alpha, new-leaf selector-polynomial and summand formulas; no shell transfer. |
| `C2-T6.relative-chain-rank-reduction` | retained | Exact direct-sum relative-chain dimension identity; needed rank/Betti inequality remains open. |
| `E993-LOWER-REGION-FIRST-ORDER-SHELL` | retained_narrowed | T1/T3 give sufficient subclasses and T5 a recurrence only. The unrestricted full-sum shell remains open. |
| `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | retained_narrowed | T2/T4 give exact weighted coordinates and a path subcase. The unrestricted complete lower-region sum remains open. |

The union of the twelve critics' claim IDs is this same seven-ID set, so the table disposes of their assertions as well as the route records. For T4 and the two registered universal IDs, one critic used `retained` for the correctly stated open obligation and the other used `retained_narrowed` for the evidence actually established. I use `retained_narrowed` for the universal IDs to prevent a conditional identity or subcase being read as a universal sign award. For T1, the CF critic's zero-extension repair changes the proof wording, not the sufficient theorem. For the first-wide classification dispute, the exact (r=k-1) substitution above decides applicability to boundary (J_i); it does not decide compensation. No vote is used to infer a sign.

The shell gap is an inequality that charges all positive order-(2k), at-most-one-edge residual differences (or excludes them using the original strict selector) against the negative ordered parts **over the complete fixed selected set**. The primary also needs an argument for larger orders. T2's Hall condition, T4's weighted rank inequality, and T6's boundary-rank/Betti inequality are equivalent or sufficient formulations without their required proof. A refutation would need one exact eligible ordinary tree, its terminally checked (x), alpha, strict (F), every tagged summand, and positive full (S). No such object is present.

## Source dependence and limits

The root-partition, path and recurrence arguments above are elementary informal proofs from the case's exact statements. The boundary sparsity refinement depends on the registered exact first-wide graph classification in the permitted common claim-identity file; it is *not* needed for either shell subclass. No nonempty eligible selector satisfying T3's structural condition was exhibited in this case, although its conditional proof covers any such instance. The bounded path replay checks only the stated path orders. The common p6 and order-252 controls are bounded negative complete-sum evidence and do not enter a universal proof here. No Lean build, external theorem retrieval, exhaustive ordinary-tree census, or new full-sum witness was performed. All source claims remain proposed worker dispositions pending controller review.
