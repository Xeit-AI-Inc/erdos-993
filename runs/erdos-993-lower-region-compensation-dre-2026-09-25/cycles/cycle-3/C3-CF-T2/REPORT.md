# C3-CF-T2 critique (orientation F)

## Disposition

**Retained** the single source claim `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` for its exact structural statement: the independent-set state partition, the fixed-weight decomposition, and the description of switches crossing the root boundary. Its status remains `proposed_open`. The route explicitly does not claim a universal Hall theorem or a proof of the primary sum.

## Independent audit

Fix a root (r), and let (u_i) be its neighbors with (T_i) the components below them in (T-r). An independent set omitting (r) is exactly a tuple of independent (A_i\subseteq V(T_i)); one containing (r) is (\{r\}\cup\bigcup_i A_i), with each (A_i) independent in (T_i-u_i). The two rank formulas follow by counting the disjoint branch vertices and, in the second slice, (r). This remains valid for zero branches and empty branch states.

For a selected leaf (v\in A_i) whose support is not (r), all vertices of (W_v=N_T(s_v)\setminus\{v\}) lie in branch (i), except for (r) when (s_v=u_i). Thus its contribution is local to (A_i), with precisely the reported root-occupancy correction. When (s_v=r), (v) is active exactly when its branch root is occupied and another neighbor of (r) is occupied. This yields the stated (J)-term and confirms that the only cross-branch dependence in the weight formula is from selected leaves supported at (r).

A legal switch centered at (r) starts with (r\notin B) and exactly two occupied neighbors; it removes exactly those two branch roots and inserts (r). A switch centered elsewhere can cross the root boundary only at a branch root (u_i), using (r) and one child as its two occupied neighbors. Switches not meeting these cases stay within a branch. These checks confirm the stated boundary description.

## Exact boundary of the result

This is a valid structural reduction, not a Hall proof. Arbitrary cuts can select interior states unevenly across branch products, and the shared capacities, root-supported tags, and switches between slices are not resolved by the product partition. In particular, a componentwise Hall argument is not supplied. Even if the proposed flow were shown infeasible, that would refute the certificate, not by itself give a positive full selected sum. Conversely, Hall feasibility would be sufficient but stronger than the scalar inequality.

The full target remains the fixed original selector
\(F(T,p)=\{v\text{ original leaf}:\Delta_p(T-v)<0\}\), with the sum over every selected original leaf including repeated supports, under (x(T)+2\le p) and (3p<2\alpha(T)+1). The route does not evaluate that complete sum, establish selector eligibility in a new family, or give an eligible positive-sum tree. No computation or imported result was used. Source hashes matched: all 115 common pins and all 3 case pins.

## Evidence

The independent checks and limitations are recorded in `EVIDENCE.json`.
