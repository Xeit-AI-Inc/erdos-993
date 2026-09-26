# C3-CT-U6 critique of C3-U6 (orientation T)

## Scope and disposition

I audited exactly the two claims in the sealed C3-U6 case. Both claims are retained at their stated scopes. The star calculation is a valid exact subcase; the marked-down operator statement is a valid conditional reduction. Neither establishes or refutes the complete lower-region assertion for arbitrary ordinary trees.

## C3-U6.star-subcase — retained

For `T=K_{1,m}`, the independent-set counts are as stated: `i_0=1`, `i_1=m+1`, `i_j=C(m,j)` for `2<=j<=m`, and zero above `m`. For `2<=j<m`,

`Delta_j = C(m,j)*(m-2j-1)/(j+1)`.

Also `Delta_0=m`, `Delta_1=C(m,2)-(m+1)>=0` for `m>=4`, and `Delta_m=-1`. The first negative difference is therefore `x=floor((m-1)/2)+1`, including both parities and the zero case when `m` is odd. This is the first-descent index using the contract's zero extension.

Deleting an original leaf gives `K_{1,m-1}`. Under the asserted guards, the route's selector check is valid: `p>=x(T)+2` puts `p` strictly beyond the first negative-difference index for `K_{1,m-1}`, and `3p<2m+1` keeps `p` in its nonzero binomial range. Thus each of the `m` original leaf tags is selected. For each tag, `H_v` is the edgeless graph on the other `m-1` leaves, `W_v=V(H_v)`, and `R_v` is empty. The original summand is

`Delta_{p-1}(H_v)-Delta_{p-1}(R_v)=C(m-1,p)-C(m-1,p-1)`.

Since `k=p-1>=x+1>(m-1)/2`, the binomial sequence is strictly decreasing from rank `k` to `k+1`, so the displayed summand is strictly negative. Summing once for each original leaf (even though all share the same support) gives exactly `S=m*(C(m-1,p)-C(m-1,p-1))<0`. The route's examples `m=20,p=12,13` also recalculate correctly: respectively `-503880` and `-465120`.

The formula applies only when a `p` satisfies both guards; some small `m` have no such `p`, in which case that family instance is vacuous. It is not evidence for arbitrary trees.

## C3-U6.marked-down-operator — retained

For an eligible selected leaf, put `H=H_v`, `W=W_v`, and `R=H-W`. The basis of `M_j(H,W)` is exactly the independent `j`-sets of `H` meeting `W`, so its dimension is `q_v(j)=i_j(H)-i_j(R)`. The proposed map sends a marked `(j+1)`-set to the sum of those one-vertex deletions that still meet `W`; every output is a basis vector of `M_j`, so it is a well-defined linear map. If `d_{k+1}:M_{k+1}->M_k` is injective, finite-dimensional rank gives `q_v(k+1)<=q_v(k)`. Direct expansion of the original summand gives

`Delta_k(H)-Delta_k(R)=q_v(k+1)-q_v(k)`.

Consequently, injectivity for every selected leaf implies every selected summand is nonpositive and hence the complete fixed-selector sum is nonpositive. This uses no replacement selector and preserves separate tags for leaves with a common support. The implication is sound, but the general-tree injectivity premise is explicitly unproved.

For the star residual with 19 marked isolated vertices, the cited out-of-range map `d_6:M_6->M_5` has dimensions `C(19,6)=27132` and `C(19,5)=11628`; it cannot be injective. That is a correct obstruction to an unrestricted all-rank injectivity assertion, but it is outside the selector-eligible ranks and does not contradict the conditional claim or the primary target.

## Evidence limits

No general-tree rank theorem, aggregate budget, imported theorem, executable replay, or eligible full-sum counterexample is supplied by these claims. The topology observation about the star independence complex is correct but does not carry a proof for other tree complexes. Accordingly both dispositions retain only what the route actually establishes, and the primary aggregate remains open.
