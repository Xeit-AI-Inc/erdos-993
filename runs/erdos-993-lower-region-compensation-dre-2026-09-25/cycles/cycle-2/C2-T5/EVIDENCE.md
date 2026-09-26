# Evidence: shell-zero pendant-path recurrence

## Exact transition

Let `U` be a finite ordinary tree with a distinguished vertex `r`. Form `T` by adjoining two new vertices `s,v` and exactly the new edges `rs,sv`. Thus `v` is a new original leaf with support `s`; the other original leaves of `U` remain leaves of `T`, except that `r` ceases to be a leaf if it was one. Write

- `P(z)=I(U;z)`,
- `Q(z)=I(U-r;z)`,
- `a=alpha(U)`.

Partition independent sets of `T` according to whether `s` is selected. When `s` is absent, `v` is free and the choices on `U` contribute `(1+z)P`. When `s` is present, `v` and `r` are absent, contributing `zQ`. Therefore

`I(T;z)=(1+z)P(z)+zQ(z)`.                                   (1)

This is an exact integer-polynomial recurrence. It yields `|T|=|U|+2` and `alpha(T)=a+1`: the first summand has degree `a+1` with positive leading coefficient, and `deg Q<=a`, so the second summand has degree at most `a+1`.

For the new leaf `v`, deleting `v` leaves the pendant vertex `s` on `r`, so

`I(T-v;z)=P(z)+zQ(z)`,

and the new leaf's exact selector test is

`Delta_p(T-v)=[z^(p+1)](P+zQ)-[z^p](P+zQ)<0`.             (2)

Its summand is also exact from the original deletions:

`H_v=U`, `R_v=U-r`, so `g_v=Delta_(p-1)(P-Q)`.            (3)

Equations (1)--(3) are a closure rule for the polynomial, alpha, new-leaf selector, and new-leaf summand under the shell attachment. Existing leaves need their own deletion contexts recalculated; (1) for the whole tree alone does not determine those selector values or summands.

## Exact shell transfer and its missing guard

If `|U|=2p`, then (1) gives `|T|=2p+2`, the first-order shell. Since `alpha(T)=alpha(U)+1`, the strict lower-region inequality for `T` implies the parent inequality at rank `p-1`, but the converse has a one-unit boundary gap:

`3p<2alpha(T)+1` is `3p<2alpha(U)+3`; the parent condition is `3(p-1)<2alpha(U)+1`, equivalently `3p<2alpha(U)+4`. Thus every eligible child gives an eligible parent, but a parent at equality `3p=2alpha(U)+3` need not give an eligible child. The coefficient `2alpha+1-3p` for `T` is one less than the parent coefficient at rank `p-1`.

The other eligibility condition does not follow from this recurrence. The required shell condition is `x(T)+2<=p`, whereas the corresponding lower-rank condition on `U` is `x(U)+2<=p-1`. The coefficient recurrence (1) does not imply either a fixed value of `x(T)-x(U)` or the needed two-way selector correspondence. The new selector (2) is at rank `p` in `P+zQ`; old-leaf selectors are tests on their own deleted-tree polynomials at rank `p`. Neither is the selector at rank `p-1` on `U`.

A small exact example shows why the descent index cannot simply be copied across this pruning. Take `U=K_(1,4)` rooted at its center. Then

`P=1+5z+6z^2+4z^3+z^4`, `Q=1+4z+6z^2+4z^3+z^4`,

so `x(U)=2`. The attached tree has

`I(T)=1+7z+15z^2+16z^3+9z^4+2z^5`,

whose first negative difference is at rank `3`; hence `x(T)=3`. This is a guard diagnostic, not a shell counterexample (the example's order does not set the shell rank). It proves that a recurrence proof must explicitly transport the terminally checked first-descent state rather than assume pruning preserves it.

## Consequence for a minimal-counterexample argument

Pendant-`P_2` pruning gives an exact reduction of order by two and alpha by one, matching the shell rank shift algebraically. It is not yet a minimal-counterexample reduction for the registered shell claim: to infer a claim at rank `p` from one at rank `p-1`, one must additionally prove (i) the first-descent guard for the parent and child in the required direction, (ii) the complete strict selector correspondence for every retained original leaf and the new leaf, including multiplicity, and (iii) an inequality relating the sum of all recalculated old-leaf terms plus (3) to the parent sum. None follows from (1) alone. In particular, no sign for the full sum is established here.

The T5 route therefore supplies a proved rooted-polynomial closure rule and a precise missing bridge, but no shell-zero sign theorem or eligible positive complete-sum witness.
