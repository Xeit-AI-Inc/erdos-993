# C4-CF-U5 critique — support polynomial reduction

## Disposition

**retained** — `C4-U5-SUPPORT-POLYNOMIAL-REDUCTION`. The displayed support products, selector, coefficient indices, same-support multiplicity, and fixed-rank truncation are exact for finite ordinary trees. This retains only the algebraic reduction and exact computation sufficiency stated by the route. It gives no sign for the complete selected aggregate.

## Independent audit

Cut each edge `uw` incident with a support `u` and write `C_w` for the component on the `w` side. In `T-v`, partition sets by the status of `u`: excluding `u` leaves every `C_w` unrestricted, while including `u` excludes each `w`. The resulting polynomial is `product J_w + z product A_w`. In `T-{u,v}`, the remaining branches are unrestricted; in `T-N[u]`, each `w` is deleted from its branch. Their polynomial difference is therefore `product J_w - product A_w`.

The selector is `[z^(p+1)]P-[z^p]P`. The target summand is `[z^p]Q-[z^(p-1)]Q`, with the signs and ranks matching the contract. If `u` has `m_u` original leaf neighbors, each tagged leaf removes one identical singleton branch (`J=1+z`, `A=1`); the products are invariant under exchanging which leaf is tagged. The factor `m_u` therefore counts all original leaf tags.

The rooted recurrence follows by partitioning according to whether the root is excluded or included. Since polynomial degrees are nonnegative, truncation modulo `z^(p+2)` preserves all coefficients needed through degree `p+1`; the alpha recurrence supplies the other strict guard. The test for `x(T)+2<=p` is existence of a negative difference among ranks `0,...,p-2`, which uses coefficients only through `p-1`.

As a sanity instance, for a star with center `u` and `m` leaves, every leaf gives `P=(1+z)^(m-1)+z` and `Q=(1+z)^(m-1)-1`, agreeing with direct deletion descriptions and retaining all `m` tags.

## Boundary

No gap was found in the exact reduction or stated fixed-rank coefficient sufficiency. The route itself correctly identifies the missing mathematical bridge: no global sign/compensation inequality or context-closed compressed induction state follows from these identities. I did not replay a producer program or run a census. The primary aggregate remains unresolved by this claim.
