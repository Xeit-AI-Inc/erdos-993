# C2-CF-T3 critique — C2-T3-shell-root-shadow

## Disposition

**retained.** The source claim is a conditional first-shell result for a per-selected-leaf structural subclass, and the proof establishes that exact scope. It is not a proof of the full first-shell claim or of the primary aggregate. The source appropriately leaves the remaining shell cases and their possible boundary compensation open.

## Independent audit of the proof

Let (n=2p+2), (k=p-1), and take an original leaf (v) with original support (s_v). Primary eligibility implies (p\ge2), so (k\ge1). Deleting (v,s_v) leaves a forest (H_v) on (2p=2k+2) vertices. Each component is one branch beyond (s_v), and contains exactly one vertex of (W_v=N_T(s_v)\setminus\{v\}). Also (R_v=H_v-W_v), so (q_v(j)=i_j(H_v)-i_j(R_v)) counts the independent (j)-sets meeting (W_v). The original summand is exactly

\[
\Delta_k(H_v)-\Delta_k(R_v)=q_v(k+1)-q_v(k).
\]

This uses the original support and neighborhood, and (F(T,p)) is not recomputed at another rank. Repeated leaves at one support remain distinct tags; the argument applies separately to each selected (v).

For any finite graph (J) of order (N), counting a (k)-set together with one of its deletions gives

\[
k i_k(J)\le (N-k+1)i_{k-1}(J).
\]

Thus (i_k(J)\le i_{k-1}(J)) when (N\le2k-1); if (k-1>N), both layers are zero and the same conclusion holds. Order the marks (w_1,\ldots,w_t), and let

\[
J_i=H_v-\bigl(N_{H_v}[w_i]\cup\{w_1,\ldots,w_{i-1}\}\bigr).
\]

Every independent set meeting (W_v) has a unique first included mark. This proves (q_v(j)=\sum_i i_{j-1}(J_i)) for (j\ge1), including the possible zero-layer cases. If (H_v) has no isolates and some marked root has degree at least two, order that root first. Its closed neighborhood removes at least three vertices. Every later mark is in a different component, so its closed neighborhood (at least two vertices) and the earlier first mark remove at least three distinct vertices. Hence every (J_i) has order at most (2k-1), and the shadow estimate proves (q_v(k+1)\le q_v(k)). Summing over the unchanged selector proves the subclass result; an empty selector gives zero.

The eligibility exclusion of an edgeless (H_v) also checks out. If (H_v) is edgeless, every neighbor of (s_v) other than (v) is an original leaf, so (T) is a star on (2p+2) vertices. Its independence polynomial is ((1+z)^{2p+1}+z), whose first strict descent is (x=p+1) (the binomial difference at rank (p) is zero, and it is negative at (p+1)). This contradicts (x+2\le p). The argument does not depend on favorable status, so in particular is valid for each selected tag.

The cover-number calculation is exact: α\((H_v)=a-1), hence τ\((H_v)=2p-(a-1)=p+1-(a-p)). From integer (3p<2a+1), (a-p\ge\lceil p/2\rceil); therefore τ\((H_v)\le\lfloor p/2\rfloor+1). This is a valid structural coordinate only, as the source report says.

## Scope boundary and usefulness

Outside the proved subclass, an eligible selected tag has either an isolate and an edge component, or no isolates and all marked roots of degree one. The ordered-part argument leaves a possible order-(2k) part when exactly two vertices are removed. The stated general shadow estimate then gives at most (i_{k-1}(J)/k) excess; no bound in the source pays for that excess across the fixed selected tags. This is a real missing bridge, not a contradiction in the subclass proof. A local positive boundary contribution would not refute the complete selected sum, and the route supplies no such counterexample.

I checked the registered `E993-GRAPH-FIRST-WIDE-SHARP-CLASSIFICATION` identity. Its exact order-(2r+2) theorem applies to (H_v) with (r=k\ge1), but only classifies the sign of Δ\(_k(H_v)\) by its edge count. The needed quantity is Δ\(_k(H_v)-\Delta_k(R_v)\), or equivalently a marked-layer difference; the classification supplies no sign for Δ\(_k(R_v)\), and it does not apply to the order-(2k) boundary parts. It therefore does not fill the source's compensation gap. No G1 tuple result or larger-order consequence is used.

The conditional theorem is useful whenever all selected tags meet its forest-shape condition, because it proves the complete sum for that input without favorable-rank arithmetic beyond the selector definition. The packet contains no eligible example of a nonempty selector satisfying that condition, and I did not establish one in this audit; realizability of a nonvacuous instance is therefore unverified here. No generation census, external theorem, or replayed computation is offered. The proposed status stays open because the global shell and primary assertions remain unresolved.

## Limitations

- The retained result is restricted to (n=2p+2) and the stated per-selected-tag forest condition; it proves neither the unrestricted shell nor the primary target.
- The order-(2k) boundary excess has no selector-conditioned global compensation bound in the route or this critique.
- I did not exhibit a nonempty eligible selector satisfying the subclass condition, run a finite census, or perform source-code replay; the argument audited here is combinatorial and exact within its stated scope.
