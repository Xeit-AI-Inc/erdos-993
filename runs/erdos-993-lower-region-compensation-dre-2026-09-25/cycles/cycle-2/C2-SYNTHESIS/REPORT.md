# C2-SYNTHESIS — neutral Cycle 2 synthesis

**Authority:** proposed worker conclusions for controller review only. This synthesis uses the three sealed adjudicator outputs C2-AT, C2-AF and C2-AU, including the case-listed append-only C2-AU repair, and permitted common controls. Both packet inventories matched their SHA-256 pins: 13 case files and 27 common files. The 17 required IDs equal the union of the three adjudicator returns. No route, critic, inventory, controller research note or raw history was reopened.

## Exact target and a proved order region

For an ordinary tree (T), let (i_j(T)) be the zero-extended independent-set counts, (Delta_j=i_{j+1}-i_j), (a=alpha(T)), and (x(T)) the first strict descent, scanning through (Delta_a=-i_a). For natural (p) with (x(T)+2\le p) and the **strict** (3p<2a+1), fix the original-leaf selector

\[
F(T,p)=\{v:\deg_T(v)=1,\ \Delta_p(T-v)<0\}.
\]

For each distinct original leaf tag (v), use its original support (s_v), (H_v=T-\{v,s_v\}), (W_v=N_T(s_v)\setminus\{v\}), and (R_v=T-N_T[s_v]=H_v-W_v). Put (q_v(j)=i_j(H_v)-i_j(R_v)). Then the registered primary sum is exactly

\[
S(T,p)=\sum_{v\in F(T,p)}[q_v(p)-q_v(p-1)].
\]

Equal-support leaves remain distinct terms. For a nontrivial eligible tree, (Delta_0(T)=|T|-1>0), so (p\ge3) and (k=p-1\ge2). The one-vertex tree has no degree-one leaf and gives the empty sum.

The two order-band claims have complete **informal** counting proofs at their registered scopes. Let (G) be any finite simple graph of order (m\le2k+1), (k\ge2), and (W) contain every isolate. Let (q_j) count independent (j)-sets meeting (W). For each marked independent (k)-set (A), (b(A)=|N_G(A)|) and its *actual* addable-vertex count is (m-k-b(A)). Set (B=\sum_A b(A)), and let (C) count each independent ((k+1))-set with at least two marks once. An upper set with one mark has exactly (k) mark-preserving deletions; one with multiple marks has (k+1). Hence

\[
k(q_{k+1}-q_k)=(m-2k)q_k-B-C.
\]

For (m\le2k) this is nonpositive. At (m=2k+1), (B) pays at least one for each marked lower set with a neighbor. A lower set with no neighbor consists of isolates. If a nonisolated vertex (y) exists, adjoining fixed (y) injects these all-isolate (k)-sets into multiply marked upper sets counted by (C), since (k\ge2). If (G) is edgeless, (W=V(G)) and complementation bijects the two layers. Thus (q_{k+1}\le q_k). This argument does not require a tree, bipartiteness, a selector or an alpha guard; its (k\ge2), isolate coverage and order bound must be kept.

For an original leaf (v), every isolated vertex of (H_v) lies in (W_v): connectivity gives it a neighbor in the original tree, which must be (s_v). If (|T|\le2p+1), then (|H_v|\le2(p-1)+1). The graph result therefore gives (q_v(p)\le q_v(p-1)) **for every original leaf**, with no favorability, (x), or alpha premise. In particular every eligible complete selected sum is nonpositive throughout (|T|\le2p+1). This does not touch the next order (|T|=2p+2). The generic and leaf claims merit controller review as informal proofs at exactly their registered scopes; no formal award is claimed here.

## Reconciliation at the first shell

At (|T|=2p+2), (H_v) has (2k+2) vertices. Its components each have one mark in (W_v). For any ordering (w_1,\ldots,w_t) of those marks, the first-mark partition uses **only the current mark's closed neighborhood**:

\[
J_i=H_v-\bigl(N_{H_v}[w_i]\cup\{w_1,\ldots,w_{i-1}\}\bigr),\qquad
q_v(k+1)-q_v(k)=\sum_i\bigl(i_k(J_i)-i_{k-1}(J_i)\bigr).
\]

Earlier marks' neighbors stay unless the current mark's closed neighborhood also deletes them. The C2-AU repair correctly reverses its original adjudication's first-root-only boundary claim. Place a nonisolated component root (w_1) first and an isolated mark (w_2) second if one exists. An edgeless (H_v) would make (T) a star with (x=p+1), contrary to eligibility. The first residual has order (2k) only if (deg_{H_v}(w_1)=1). The second has order **exactly (2k)** if (w_2) is isolated: its deleted set is ({w_1,w_2}). Every other residual has at most (2k-1) vertices. The elementary deletion/extension incidence bound gives (i_k(J)\le i_{k-1}(J)) at order at most (2k-1), including zero-extended cases. At order (2k), the positive part of (i_k-i_{k-1}) is at most (i_{k-1}/k).

Define (L_{\rm root}(v)=i_{k-1}(J_1)) when the first root has degree one, otherwise zero; define (L_{\rm iso}(v)=i_{k-1}(J_2)) when an isolated mark is second, otherwise zero. Let (B_v) contain precisely those boundary indices, and for the others put (d_{v,i}=i_{k-1}(J_i)-i_k(J_i)\ge0). The valid selected-sum bound is

\[
S(T,p)\le {1\over k}\sum_{v\in F}(L_{\rm root}(v)+L_{\rm iso}(v))
 -\sum_{v\in F}\sum_{i\notin B_v}d_{v,i}.
\]

Thus the **additional** fixed-selector budget (k\sum_{v\in F}\sum_{i\notin B_v}d_{v,i}\ge\sum_{v\in F}(L_{\rm root}+L_{\rm iso})) would prove the complete shell sum. Neither eligibility nor strict leaf favorability has been shown to imply it. The repaired fixture is an eligible 18-vertex tree at (p=8,k=7,a=12,x=6); for selected leaf 6, its isolated second mark leaves (|J_2|=14=2k), and its actual residual difference is (-229). All 12 selected terms total (-4256). This refutes the *residual-order classification* in the original C2-AU report, not its first-root-only numerical estimate, the budget itself, or the shell assertion. The repair is append-only; the original adjudicator return remains a source claim that is disposed here with the correction.

C2-AT's T1 ordered-root sufficient subclass remains sound: if for each selected tag the first root has degree at least two and a second root, when present, has degree at least one, every residual has order at most (2k-1). Its T3 no-isolate/root-degree subclass implies that condition. Neither condition follows from eligibility. The registered first-wide graph classification can further restrict a **positive** order-(2k) residual to a graph with at most one edge, applying it at rank (r=k-1\ge1); that fact does not pay for all such residuals. C2-AT's own text correctly allows the isolated second boundary, in agreement with the repair.

The first-shell census at ((|T|,p)=(14,6)) covers 3,159 free-tree classes, 240 eligible, with (-404\le S\le-222); at ((16,7)) it covers 19,320 classes, 1,696 eligible, with (-1759\le S\le-906). These are bounded, generator-dependent findings with exact subset replays in the adjudicated evidence. The (p=6) convex-hull LP maximum (-222) is just the maximum of those 240 columns. C2-AF correctly found that F3's purported shell graphs actually have order (2p+1), not (2p+2): its rooted child branches total (2p-1), and its construction adds two vertices. Its negative maxima at actual ((13,6)) and ((15,7)) are a separate filtered rooted-family computation, not extra shell census rows. No finite result covers all shell ranks or supplies a positive eligible full sum.

## Primary scope and other carried claims

The fixed-selector weighted coordinate is exact. For an independent set (B\subseteq V(T)), let (w_F(B)) count selected leaves (v\in B) for which (B\setminus\{v\}) meets (W_v). Adjoining (v) bijects the marked sets in (H_v) with those (B), separately for each leaf tag. Consequently

\[
S(T,p)=\sum_{|B|=p+1}w_F(B)-\sum_{|B|=p}w_F(B).
\]

This keeps (F(T,p)) fixed across ranks. An integral flow on one-vertex deletions that saturates upper weights would certify the sign. Its exact Hall-type cuts compare each upper family only to its **extendable lower neighbors**. Even the full-upper cut need not equal the scalar (S\le0) comparison because nonextendable lower sets can have positive weight. No universal cut inequality follows from the cases. C2-AT's relative-chain identity is another exact restatement: with (b_r) boundary ranks and (β_r) Betti dimensions of the direct sum over fixed selected tags, (S=b_{k+1}-b_{k-1}+β_k-β_{k-1}). The needed rank/Betti inequality is absent, and that differential does not cross tags.

The selected path class is proved by the binomial independent-set formula and adjacent-ratio comparison, including both endpoint tags and zero extension. The uneven two-hub family with one light-side leaf and (v\ge8) heavy-side leaves is another proved restricted class at every eligible rank. The rooted pendant-(P_2) and one-leaf extension recurrences are exact polynomial identities, but neither transports (x), all old strict selectors, or all old original-deletion terms automatically. The concrete 18-to-19-vertex extension changes the full sum from (-4256) to (-6267) while both rows remain eligible and negative. The specified root-leaf attachment to the order-91 (T_{22}) likewise leaves eleven eligible ranks with negative complete sums; an unpadded positive local term does not refute the primary. The fixed-(p) shell state records enough polynomials to evaluate one instance, and the shell cover bound (τ(T)\le\lfloor p/2\rfloor+2) is necessary arithmetic. Neither gives a uniform sign theorem.

The **unrestricted primary remains unresolved on these sources** for trees with (|T|\ge2p+2), and the first shell remains unresolved. A proof must compare the complete fixed-selector sum across distinct original leaf tags; pointwise local signs, a failed sufficient flow cut, or a negative bounded census do not settle it. A refutation requires an eligible ordinary tree with terminally verified (x), strict (F), every original-support summand, and positive complete (S). None is supplied.

## Disposition of every required source ID

| Claim ID | Disposition and exact carry |
| --- | --- |
| `C2-AF-F3-CORRECTED-ORDER-BAND` | **retained** as filtered rooted-family bounded computation at actual order (2p+1); not a shell census. |
| `C2-F5-P6-SHELL-LP` | **retained** as the order-14, (p=6), 240-eligible-row finite maximum (-222); no variable-rank dual. |
| `C2-F6.ROOT-PENDANT-T22-OBSTRUCTION` | **retained** for one specified root-leaf attachment and its eleven eligible ranks; no padding-family conclusion. |
| `C2-T1-SHELL-ORDERED-ROOT-SUBCLASS` | **retained** as a sufficient complete-sum shell subclass under the stated per-selected-tag root degrees. |
| `C2-T3-shell-root-shadow` | **retained** as the stronger no-isolate subclass and its exact cover coordinate; no unrestricted shell sign. |
| `C2-T4-PATH-OCCUPANCY` | **retained** for every eligible path of order at least four, with both endpoint tags. |
| `C2-T5-PENDANT-P2-RECURRENCE` | **retained** as polynomial, alpha, new-leaf selector and summand identities; no selector transfer. |
| `C2-T6.relative-chain-rank-reduction` | **retained** as exact tagged relative-chain identity; the rank/Betti comparison is open. |
| `C2-U3-ORDERED-SHELL-BOUND` | **retained_narrowed** to the repair's two-boundary classification and ((L_{\rm root}+L_{\rm iso})/k) bound; original C2-AU first-root-only derivation is rejected. |
| `C2-U6.primary-shell-open` | **retained** as a statement of the U6 route's limitation, not an award. |
| `C2-U6.shell-state-framework` | **retained** for exact fixed-(p) evaluation data only. |
| `C2-U6.shell-vertex-cover-bound` | **retained** as (τ(T)\le\lfloor p/2\rfloor+2) under shell order and strict alpha guard only. |
| `E993-MARKED-ISOLATE-ORDER-BAND` | **retained** as a complete informal proof at (k\ge2,m\le2k+1), isolate-containing marks. |
| `E993-ORDINARY-LEAF-ORDER-BAND` | **retained** as a complete informal proof at (p\ge3,|T|\le2p+1), without selector guards. |
| `E993-LOWER-REGION-FIRST-ORDER-SHELL` | **retained_narrowed** to subclasses, two finite shell slices and a conditional two-boundary budget; universal shell remains proposed open. |
| `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | **retained_narrowed** to the proved lower order band and restricted classes, exact reductions and bounded negative rows; universal target remains proposed open. |
| `U5-pendant-extension-tagged-sum-change` | **retained_narrowed** to its exact one-pair non-invariance result and corrected recurrence cases; neither sum is positive. |

## Proposed controller review and next mathematical steps

1. Review the two order-band informal proofs at their **exact registered** scopes; they give the new universal lower-order region (|T|\le2p+1) of the primary. Formal checking, if later authorized, can use either the generic marked-isolate proof or the tree-root first-mark proof, retaining the (p\ge3) registration guard.
2. Treat the C2-AU repair as the effective correction for `C2-U3-ORDERED-SHELL-BOUND` and the shell budget. The first-root-only residual-order sentence in the original return must not become a premise. At the shell, test whether the strict original selector and (x+2\le p) force the **two-boundary** Comp inequality, or construct an exact eligible positive complete sum. The registered first-wide classification can limit positive boundary shapes but cannot replace the global compensation step.
3. Keep all finite censuses at their generation boundaries. A further order-18, (p=8) shell census would be a bounded diagnostic only; record class completeness, independent coefficient replay, terminal (x), every strict selector and complete original-tag sum. A larger example or failed flow cut is not itself a universal verdict.

**Limits.** The graph and tree order-band proofs here are informal, not Lean-certified. The finite censuses depend on their pinned generators and replays; this seat did not rerun them. The repair fixture was structurally checked from its pinned edge list and summands, but not re-enumerated from scratch. No public theorem is imported, no positive complete-sum witness is present, and neither universal shell nor primary inequality receives a proof or refutation here.
