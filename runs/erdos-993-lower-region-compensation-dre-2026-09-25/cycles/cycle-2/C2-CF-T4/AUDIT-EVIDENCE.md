# Audit evidence

The fixed-selector identity was independently checked from the definitions. For each `v`, the summand is

`Delta_(p-1)(H_v)-Delta_(p-1)(R_v)=q_v(p)-q_v(p-1)`.

For independent `B` in `T`, the tag `v` contributes to `w_F(B)` exactly when `v in B` and some other neighbor of its original support is in `B`. Removing `v` gives an independent set of `H_v` meeting `W_v`; adding `v` is the inverse. Thus `Q(j)=sum_(|B|=j+1) w_F(B)`, with `F(T,p)` held fixed, and `S=Q(p)-Q(p-1)`. The route’s rank indices are correct.

For `P_m`, `i_j(P_m)=binom(m-j+1,j)` on the support, with zero extension. On the positive ratio domain,

`i_(j+1)(P_m)/i_j(P_m)=((m-2j+1)(m-2j))/((j+1)(m-j+1))`.

The ratio decreases in `j` by cross multiplication. At fixed `j`, it increases with `m` because the quotient of consecutive-order ratios is

`(m-2j+2)(m-j+1)/((m-2j)(m-j+2)) > 1`.

These facts justify the first-descent comparison and later-descent implication used for the two endpoint selector values. The recurrence `I(P_m;z)=I(P_(m-1);z)+zI(P_(m-2);z)` gives the endpoint tag profile `q_v(j)=i_(j-1)(P_(n-4))`, so the complete two-tag sum has the formula reported.

`replay_path.py` reconstructs the route’s claimed finite check with exact integers and no random seed. Result: 449 eligible rows at 117 distinct path orders, minimum `-140598451215242502192647212080`, maximum `-38896`. This is a bounded arithmetic check, not a generation of arbitrary trees.
