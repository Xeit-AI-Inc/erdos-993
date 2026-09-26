# C2-U3 search report

## Route and disposition

This route addresses the registered first-order shell `E993-LOWER-REGION-FIRST-ORDER-SHELL`: ordinary trees with `|T|=2p+2`, `x(T)+2<=p`, and `3p<2 alpha(T)+1`, with the complete fixed favorable-leaf sum. The calculation below gives an exact ordered-root decomposition and bounds every possible positive excess for a single selected leaf. It leaves a selector-conditioned compensation inequality across selected tags, so it does not prove the registered shell claim or the primary aggregate.

## Exact decomposition for one original leaf

Fix an original leaf `v` with original support `s`. Put

`H=T-{v,s}`, `R=T-N_T[s]`, `W=N_T(s)\\{v}`, `k=p-1`.

On the shell, `|H|=2p=2k+2`. Deleting `s` from a tree separates its neighbor branches. After deleting `v` as well, each component of `H` has exactly one vertex in `W`; singleton components are precisely the isolated vertices of `H`, and are marked. Also `H-W=R`. Thus

`q_j := i_j(H)-i_j(R)`

counts independent `j`-sets of `H` meeting `W`.

Order the marks as `w_1,...,w_t` by putting a mark from a nontrivial component first, then (if present) an isolated mark second, and the remaining component marks arbitrarily. Define

`J_i = H - (N_H[w_i] union {w_1,...,w_(i-1)} )`.

Partitioning each independent set meeting `W` by its first mark gives, for every integer `j`,

`q_j = sum_(i=1)^t i_(j-1)(J_i)`,

and hence the exact leaf-term decomposition

`Delta_k(H)-Delta_k(R) = q_(k+1)-q_k = sum_i (i_k(J_i)-i_(k-1)(J_i))`.

This partition counts each marked set once, including separate marks in different components; no tag or repeated-support leaf is collapsed.

## Boundary classification and excess bound

For any graph `J` of order `N`, count deletions from independent `k`-sets and extensions of independent `(k-1)`-sets. This gives

`k i_k(J) <= (N-k+1)i_(k-1)(J)`.

Consequently `i_k(J)-i_(k-1)(J)<=0` when `N<=2k-1`; when `N=2k`,

`[i_k(J)-i_(k-1)(J)]_+ <= i_(k-1)(J)/k`.

Here `[z]_+=max(z,0)`. The ordered sets `J_i` have order at most `2k+2`. Their only possible order-`2k` cases are:

1. `i=1` and the first non-isolated mark `w_1` has degree one in `H`. Then `J_1=H-N_H[w_1]` and `|J_1|=2k`. Call its lower count `L_root=i_(k-1)(J_1)`; set `L_root=0` if this case does not occur.
2. `i=2` and `w_2` is the first isolated mark. Then `J_2=H-{w_1,w_2}` and `|J_2|=2k`. Call its lower count `L_iso=i_(k-1)(J_2)`; set `L_iso=0` if `H` has no isolates.

All remaining cases remove at least three distinct vertices from `H`: a first mark of degree at least two removes itself and two neighbors; a later non-isolated component root removes itself, a neighbor in its component, and the earlier root in a different component; an isolated second mark is the case already listed; and for `i>=3`, the current mark and at least two distinct earlier marks are removed. Thus every remaining `J_i` has order at most `2k-1`. In particular, no unlisted term can be positive. Therefore the sum of positive parts in this ordered decomposition obeys the quantitative bound

`sum_i [i_k(J_i)-i_(k-1)(J_i)]_+ <= (L_root+L_iso)/k`.

If `H` were edgeless, connectedness of `T` would force `T` to be a star centered at `s`. At this shell its independence polynomial is `(1+z)^(2p+1)+z`, so for `p>=3` its first strict descent is `x(T)=p+1`; it violates `x(T)+2<=p`. Thus every eligible shell tree has a nontrivial `H` for each leaf, as assumed in choosing `w_1`.

## Explicit missing global inequality

For each `v` in the unchanged strict selector `F(T,p)={v:Delta_p(T-v)<0}`, make the ordering above for its own `H_v`. Write `B_v` for the one or two listed boundary indices that occur, and use `L_root(v),L_iso(v)` for their lower counts. The local bound and exact decomposition show that the following selector-conditioned inequality would suffice for the full shell:

`k * sum_(v in F) sum_(i notin B_v) (i_(k-1)(J_(v,i))-i_k(J_(v,i))) >= sum_(v in F) (L_root(v)+L_iso(v)).`  (Comp)

Every term on the left is nonnegative by the order bound. Indeed, for each selected leaf, its exact summand is at most `(L_root(v)+L_iso(v))/k` minus its left-hand slack divided by `k`; summing gives `S(T,p)<=0` from (Comp). This is an explicit global compensation obligation across the fixed selected tags, not a pointwise claim and not a changed selector. A sharper inequality could credit negative boundary terms too, but is not needed for this sufficient reduction.

The established facts do not prove (Comp): the guards `x(T)+2<=p`, `3p<2a+1` and the strict tests `Delta_p(T-v)<0` have not been connected to a lower bound on these first-root/first-isolate counts or on the nonboundary slack. No complete-sum theorem or counterexample follows from the local bound.

## Evidence grade and limitations

The decomposition, order classification, and shadow estimates are elementary exact counting arguments. They apply separately to each original leaf and preserve same-support multiplicity. The route supplies a proved-informal reduction for the exact shell scope, not a result on the unrestricted lower-region aggregate. The necessary selector-conditioned compensation (Comp) remains open. No census, imported theorem, or universal status award is claimed.
