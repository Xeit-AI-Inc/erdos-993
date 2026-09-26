# C5-CF-U1 independent critique (orientation F)

## Scope and source integrity

I audited both claims in the sealed C5-U1 return against the exact contract and the assigned case. The case pins for `COMPUTE.py`, `EVIDENCE.json`, `REPORT.md`, and `RETURN.json` all matched. Every listed common-source hash also matched. The route makes two claims only: a coefficient-window identity and a finite computation on one explicitly described tree family.

## C5-U1.coefficient-window — retained_narrowed

Let (g(z)=sum_j g_jz^j) be a finite integer-coefficient polynomial, let (G(z)=sum_{r=0}^d c_rz^r), and let (e(z)) be another finite integer-coefficient polynomial. With coefficients extended by zero, convolution gives

\[
\Delta_p(Gg+e)=\sum_{r=0}^d c_r\Delta_{p-r}(g)+\Delta_p(e).
\]

Thus if the weighted window (M=\sum_r c_r\Delta_{p-r}(g)<0) and \(|\Delta_p(e)|<-M\), then \(\Delta_p(Gg+e)<0\). This follows directly by subtracting the two adjacent convolution coefficients. I narrow the notation in the route statement because it uses (g) both for the polynomial and for the coefficients of (G); writing the latter as (c_r) removes that ambiguity. The argument is an exact algebraic transfer test. It supplies no signs for the window from central log-concavity or first descent, and it proves no tree-family or primary assertion by itself.

## C5-U1.Tm-bounded — retained

The route’s family is the ordinary tree consisting of path (0-1-2) and (m) disjoint three-tip claws, each claw center joined to (0). Its original leaves are the (3m) claw tips, each supported by its claw center, and vertex (2), supported by (1). The route’s polynomial formulas agree with a direct tree decomposition. I independently replayed the supplied recurrence from a copy in this scratch directory and then checked it using a generic tree dynamic program on explicitly constructed adjacency graphs, recomputing independence polynomials after each relevant deletion.

For every (m=1,\ldots,40), the independent check found (\alpha=\deg I(T_m)), scanned zero-extended differences through the terminal rank to obtain (x), and considered each (p\) with (x+2\le p\le\alpha) and (3p<2\alpha+1). It checked all 427 eligible ((m,p)) rows. For each row it independently recomputed every tip and endpoint deletion selector, the corresponding (H_v) and (R_v) coefficients at rank (p-1), all selected per-leaf summands with their multiplicities, and the complete global (S). All selectors, summands, and totals agree with the supplied evidence; all 427 totals are strictly negative. The two smallest values (m=1,2) have no eligible ranks.

This supports exactly the bounded finite claim for (m\le40). It is not a proof for (m>40), nor for arbitrary ordinary trees. It does not validate the separate all-(m) analytic candidate, any imported convolution theorem, or a central-log-concavity-to-shifted-window bridge. No positive local term, missing selector, or arithmetic discrepancy was found in the bounded evidence. No general status follows from these checks.

## Proposed dispositions and limitations

The coefficient identity is retained with the notation refinement and with its sign hypotheses stated explicitly. The (T_m) computation is retained at the stated finite boundary as independently replayed exact computational evidence. Both remain proposed worker dispositions only. The primary ordinary-tree aggregate and the infinite-family analytic argument remain unresolved by these claims.

