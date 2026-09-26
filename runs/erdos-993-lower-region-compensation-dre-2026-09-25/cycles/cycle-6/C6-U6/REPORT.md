# C6-U6 search report: marked-rank transport

## Result

For the original fixed selector (F=F(T,p)), define

\[
H_v=T-\{v,s_v\},\qquad W_v=N_T(s_v)\setminus\{v\},\qquad
R_v=H_v-W_v,
\]
\[
q_v(j)=i_j(H_v)-i_j(R_v),\qquad Q_j=\sum_{v\in F}q_v(j).
\]
An independent set of (H_v) counted by (q_v(j)) is exactly a (j)-set meeting (W_v). The map (A\mapsto A\cup\{v\}) identifies it with an independent ((j+1))-set of (T) containing the original tagged leaf (v). The tags remain distinct, including leaves with the same support. Therefore the target sum satisfies the exact identity

\[
S(T,p)=Q_p-Q_{p-1}.
\]
Thus the lower-region assertion is precisely a nonincrease of this **fixed** marked measure across ranks (p-1,p). Changing to (F(T,p+1)) would not be this statement.

## Tree recurrence and the gap

For a fixed leaf (v), each component (C_i) of (H_v) contains exactly one vertex (w_i\in W_v). Otherwise connectivity of (T) would fail, or two distinct (s_v)-to-component paths would create a cycle. Put

\[
A_i(z)=I(C_i;z),\qquad B_i(z)=I(C_i-w_i;z).
\]
The rooted deletion recurrence is

\[
A_i=B_i+zI(C_i-N_{C_i}[w_i]),\qquad
q_v(z)=I(H_v;z)-I(R_v;z)=\prod_i A_i-\prod_i B_i.
\]
For any fixed ordering of these components this gives the exact positive-polynomial expansion

\[
q_v(z)=\sum_i (A_i-B_i)\prod_{r<i}A_r\prod_{r>i}B_r.
\]
Also the two choices for the original support give

\[
I(T-v;z)=I(H_v;z)+zI(R_v;z),\quad
I(T;z)=(1+z)I(H_v;z)+zI(R_v;z).
\]
Writing (H_{v,j}=i_j(H_v)), the selector value
\(\delta_v=\Delta_p(T-v)<0\) and marked increment obey

\[
\delta_v=H_{v,p+1}-H_{v,p}+i_p(R_v)-i_{p-1}(R_v),
\]
\[
q_v(p)-q_v(p-1)=H_{v,p+1}-H_{v,p-1}-\delta_v.
\]
Consequently a sufficient (and directly checkable) aggregate bridge is

\[
\sum_{v\in F}\bigl(H_{v,p-1}-H_{v,p+1}\bigr)
\ \ge\ \sum_{v\in F}(-\delta_v).
\]
When (F
earnothing), the strict selector makes the right side positive; when (F=arnothing), (S=0) trivially. In the nonempty case, strict favorability does not itself establish this two-rank drop in the (H_v) forests. Nor does the nonnegative component expansion imply that (q_v)'s coefficients decrease after the first descent of (I(T)). I found no proof of this bridge from the first-descent condition.

## Exact bounded work

I used the pinned `inputs/ordinary_tree_checked.py` forest recurrence and Prüfer decoder.

- All labeled trees of orders 1 through 8 were enumerated (280,393 trees total). The exact eligibility guards produced zero ((T,p)) rows in this range. Thus this part contributes no eligible sign evidence; it is not an exhaustive result for larger orders.
- For its explicit (T_m) family, (m=1,\ldots,8), every eligible rank was checked, giving 13 rows (none at (m=1,2)). The exact fixed-selector (Q_{p-1},Q_p,S) values and every selected original leaf/summand are in `t_family_transport.json`; all 13 sums were negative, from (-1{,}167) through (-58{,}083{,}912). For example (m=3) has ((|T|,\alpha,x,p)=(15,11,5,7)), ten favorable leaf tags, (Q_6=2{,}601), (Q_7=1{,}434), and (S=-1{,}167). These are bounded instances only.
- For the all-labeled-tree enumeration the script records the exact Prüfer generation boundary and per-order counts. It also verifies (S=Q_p-Q_{p-1}) for every eligible row (vacuously here), and independently cross-checks coefficient DP against subset enumeration for all trees through order 6 and the first Prüfer tree at orders 7 and 8. `transport_census.json` contains the replay summary.

Replay with `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 transport_census.py` and `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 t_family_transport.py` from this worker directory. Both scripts use integer arithmetic only.

## Disposition and limitations

This search establishes recurrence identities and an exact reduction of the selected aggregate to a fixed marked-rank comparison. It neither proves the comparison for arbitrary trees nor supplies an eligible positive-sum counterexample. The small all-tree census has no eligible rows, and the (T_m) calculations are bounded. No literature theorem is imported. The primary claim therefore remains open at this worker's evidence grade; the missing mathematical step is the aggregate marked-rank transport under the first-descent and strict-selector hypotheses.
