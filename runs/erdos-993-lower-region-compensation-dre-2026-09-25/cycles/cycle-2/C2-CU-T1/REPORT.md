# C2-CU-T1 critique of C2-T1

## Dispositions

- `C2-T1-SHELL-ORDERED-ROOT-SUBCLASS` — **retained**. The claimed conditional full-sum result follows from the exact first-mark partition and the independent-set shadow bound. The selector is kept fixed; the argument only applies its structural hypothesis to each selected original leaf.
- `E993-LOWER-REGION-FIRST-ORDER-SHELL` — **retained** as the exact registered open obligation, not as an established theorem. The route correctly leaves its global boundary compensation unproved. Its unresolved local boundary can be sharpened using the registered exact-cardinality classification below, but that does not close the full shell.

## Independent audit

Put `k=p-1`. For each original leaf tag `v`, `H_v=T-{v,s_v}` is a forest, and each of its components has exactly one vertex in `W_v=N_T(s_v)\\{v}`: connectivity supplies an attachment to `s_v`, and two attachments from one component would create a cycle. For an ordering `w_1,...,w_t` of these marks, define

`J_i = H_v - (N_{H_v}[w_i] union {w_1,...,w_(i-1)})`.

A marked independent set has a unique first selected mark `w_i`. Removing that mark leaves an independent `(j-1)`-set of `J_i`; conversely every such set reconstructs a marked independent `j`-set whose first mark is `w_i`. Thus, with zero-extended counts,

`q_v(j)=i_j(H_v)-i_j(H_v-W_v)=sum_i i_(j-1)(J_i)`.

This is a disjoint partition, and summing it separately for each original leaf retains multiplicity when leaves share a support. Since `g_v=Delta_(p-1)(H_v)-Delta_(p-1)(R_v)=q_v(k+1)-q_v(k)`, the reported expression for each summand has the correct rank shift and sign.

For any graph `J` of order `N`, double-count incidences between independent `k`-sets and their one-vertex deletions/extensions. Each independent `k`-set has `k` deletions; each independent `(k-1)`-set has at most `N-k+1` extensions. Hence `k i_k(J) <= (N-k+1)i_(k-1)(J)`. For `N<=2k-1`, this yields `i_k(J)<=i_(k-1)(J)`; zero-extended ranks cause no exception.

In the shell, `|H_v|=2p=2k+2`. An edgeless `H_v` would make `T` a star. Such a star has `x(T)=p+1` (the leaf-layer counts are `binom(2p+1,j)` from rank two onward), and is ineligible. More generally `Delta_0(T)=|T|-1>0`, so `x(T)>=1` and an eligible shell has `p>=3`, hence `k>=2`.

Order a non-isolated component mark first. Its closed neighborhood removes at least two vertices, so `|J_1|<=2k`; equality occurs for a degree-one first mark. For `i>=2`, the deletion includes the distinct vertices `w_i,w_1`, so `|J_i|<=2k`. If `i>=3`, it includes three distinct marks, so `|J_i|<=2k-1`. For `i=2`, a non-isolated `w_2` has a neighbor in its distinct component, giving at least three deleted vertices; equality `|J_2|=2k` is possible when `w_2` is isolated. Therefore the route's two exceptional root positions and the conditional degree hypothesis are correct. Under that hypothesis all `J_i` have order at most `2k-1`, proving `g_v<=0` for every selected tag and thus the complete selected sum is nonpositive (including the empty-selector case).

At either exceptional position, the route's identity is also correct: when `|J|=2k`, counting extensions from independent `(k-1)`-sets gives

`k*(i_k(J)-i_(k-1)(J)) = i_(k-1)(J) - B_J`,

where `B_J=sum_A |N_J(A)|`. The registered `E993-GRAPH-FIRST-WIDE-SHARP-CLASSIFICATION` applies exactly here: take `r=k-1`, so `|J|=2r+2` and `Delta_r(J)=i_k(J)-i_(k-1)(J)`. Since `k>=2`, it says this boundary difference is positive iff `J` has at most one edge. This refines the route's boundary localization: not every exceptional residual can be positive. It does not establish that eligible selected leaves avoid the at-most-one-edge residuals, nor that any positive terms are compensated across roots or tags.

## Full-shell gap and scope

No selector-conditioned bound on those exceptional residuals, no cross-root or cross-support compensation, and no complete-sum counterexample is given. A local positive term would not refute the global assertion. Accordingly the registered first-order shell and the wider lower-region primary remain unresolved. The sufficient subclass does not show that favorability forces its root-degree hypothesis. The source provides no computation or external theorem application; none was needed to audit its informal counting proof. No source replay was necessary.

The review covers exactly the two source claim IDs. The source hashes were verified against the assigned packet. All evidence for this review is this report.
