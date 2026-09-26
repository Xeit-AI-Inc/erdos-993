# C5-CT-U6 critique of C5-U6

## Dispositions

### C5-U6-MARKED-SHELL-REDUCTION — rejected

The unique-first-mark bijection is valid, but the two stated difference formulas have the wrong sign. For a fixed order on `W`, the sets counted by `q_j` partition by their unique first vertex `w`; removing `w` gives

`q_j = sum_w i_(j-1)(G_w)`.

Subtracting the formula at `j-1` yields

`q_j-q_(j-1) = sum_w (i_(j-1)(G_w)-i_(j-2)(G_w)) = sum_w Delta_(j-2)(G_w)`.

Consequently the target leaf summand is **`+sum_w Delta_(p-2)(G_w)`**, not the negative sum in the route. For the selector, the exact leaf-deletion identity gives

`Delta_p(T-v) = Delta_p(H)+Delta_(p-1)(R)`.

Since `q_(p+1)-q_p = Delta_p(H)-Delta_p(R)`, this becomes

`Delta_p(T-v) = sum_w Delta_(p-1)(G_w) + i_(p+1)(R)-i_(p-1)(R)`.

Again the shell sum has positive sign. A one-vertex check makes the sign error concrete: take `H=K1`, `W=V(H)`, `R=empty`, and `j=2`. Then `q_2-q_1=-1`, while the sole `G_w` is empty and `Delta_0(G_w)=-1`; the correct relation is equality with the positive sum. The route's negative-sum relation gives `+1`.

The algebraic rank and tag setup otherwise respects the stated definitions: `H=T-{v,s_v}`, `W=N_T(s_v)\\{v}`, `R=H-W`, and each leaf is handled separately. Correcting the signs does not itself prove or disprove the aggregate.

### C5-U6-STAR-LOWER-REGION — retained

For a star with `m>=4`, the independent-set counts are `i_0=1`, `i_1=m+1`, and `i_j=binom(m,j)` for `2<=j<=m`, followed by zero extension. Thus `Delta_0=m>0`; `Delta_1=binom(m,2)-(m+1)>0` for `m>=4`; and for `2<=j<=m`, `Delta_j=binom(m,j+1)-binom(m,j)`. The first strict negative difference is at `x=ceil(m/2)`, including the terminal `Delta_m=-1` and zero differences after the terminal rank.

The guards reduce exactly to `ceil(m/2)+2<=p` and `3p<2m+1`, equivalently `ceil(3p/2)<=m<=2p-4`. This interval is nonempty precisely for `p>=8`. In that interval, `m<=2p-4<2p+2`, so for each original leaf, `T-v=K_(1,m-1)` has

`Delta_p(T-v)=binom(m-1,p+1)-binom(m-1,p)<0`.

All `m` distinct original leaves are selected. For each, `T-{v,c}` is `(m-1)K1` and `T-N[c]` is empty, so its summand is

`binom(m-1,p)-binom(m-1,p-1)<0`,

because `m<=2p-4<2p`. The resulting complete sum is the route's displayed negative expression. The proof is exact and infinite over the stated star subfamily. Its claims about no eligible star at `p=6,7` are only family exclusions, not statements about general trees.

### C5-U6-PRIMARY-STATUS — retained

The route supplies no argument for arbitrary ordinary trees and no positive full-sum counterexample. The star subfamily cannot decide the universal lower-region statement. The sign error in the marked-shell reduction invalidates that claimed reduction as written, but it does not produce a counterexample to the primary assertion. The complete target therefore remains unresolved by this case.

## Scope, controls, and limitations

The independent review covered exactly the three claim IDs assigned to C5-U6. Hashes for all 237 common listed sources and all three case-listed worker files matched their packet pins. The required common controls and the permitted C5 critic brief were read. No source files were modified, no replay was needed, and no bounded computation or imported theorem was used.

The principal defect is an exact sign error in both marked-shell difference identities; any downstream use of those formulas must be re-derived with the positive sign. The star proof survives independently. No conclusions are drawn about the other cycle routes, prior-cycle raw outputs, or the truth of the complete primary statement.
