# C2-U6 search report — first-order shell state reduction

## Scope and result

The assigned target is the complete first-order shell case of the lower-region favorable-leaf aggregate. I derive a shell-specific rank/vertex-cover bound and give an exact finite-state certificate representation for each fixed shell rank. The representation retains the original strict selector, all original leaf tags (including repeated supports), the full independence polynomials, and the complete cross-support sum. It is an exact finite enumeration scheme for each fixed `p`, not a uniform finite kernel or a proof that positive witnesses do not exist. The primary claim therefore remains open.

## Shell order/rank boundary

Let `n=|T|=2p+2`, `a=alpha(T)`, and `tau(T)=n-a`, the minimum vertex-cover number. The lower-region guard gives `3p<2a+1`, equivalently

`a >= floor((3p+1)/2)`.

For both parities this yields

`tau(T) <= floor(p/2)+2`.

The other guard is `x(T)<=p-2`. Since `x` is the first `j` with `Delta_j<0`, testing it exactly requires the full coefficient sequence `i_0,...,i_a` and the terminal zero-extended difference `Delta_a=-i_a<0`. Thus a valid shell state must retain coefficients through degree `a`; truncating at `p` is not sound for the selector/guard. Also retain `i_{a+1}=0` for the terminal difference.

This is a necessary structural/rank boundary, not a bounded-order theorem: `p` and hence the vertex-cover bound still grow. It does not by itself reduce all shell witnesses to a fixed finite list.

## Exact state and transitions

For a rooted tree branch `Q` with root `r`, the standard two messages are

- `A_Q(z)`: independent-set polynomial of `Q-r`;
- `B_Q(z)`: polynomial for independent sets of `Q` containing `r`.

If the child branches are `Q_1,...,Q_d`, then

`B_Q(z)=z * product_i A_(Q_i)(z)`,

`A_Q(z)=product_i (A_(Q_i)(z)+B_(Q_i)(z))`, and `I_Q=A_Q+B_Q`.

The shell certificate state augments these messages with the following exact data for the *whole original tree* (equivalently computed by directed-edge rerooting messages and products over the components after a deletion):

1. `I_T(z)` and its coefficient vector through its actual degree `a`, with a terminal zero coefficient;
2. the root and directed-edge `A,B` polynomials needed to reconstruct induced-subtree polynomials after local vertex-set deletions;
3. for every original leaf tag `v`, its original support `s_v`, `P_v(z)=I_(T-v)(z)`, `H_v(z)=I_(T-{v,s_v})(z)`, and `R_v(z)=I_(T-N[s_v])(z)`;
4. the full original leaf-tag list, not a set of support vertices; and
5. derived `a`, the first strict descent `x` found by scanning `Delta_j=[z^(j+1)]I_T-[z^j]I_T` through `j=a`, each selector bit `1[Delta_p(T-v)<0]` read from `P_v`, and

`S = sum_v 1[Delta_p(T-v)<0] * (Delta_(p-1)(H_v)-Delta_(p-1)(R_v))`.

These are integer polynomial/vector states; no real approximation or monotonicity assumption enters. Products of directed messages compute the deletion polynomials because deleting a vertex set in a tree separates the remaining induced forest into components, whose independence polynomials multiply. The local messages around each deleted set identify those components. Keeping tags as a list makes two leaves with a common support contribute twice, as required.

For fixed `p`, `n=2p+2` is fixed. Every coefficient is an integer between `0` and `2^n`, every polynomial has degree at most `n`, and there are at most `n` original leaf tags. Consequently the set of possible augmented states is finite, and any exhaustive tree generator with a proved unlabeled-tree boundary can memoize by this state without losing the shell guards, selector, or `S`. The raw bound is very large and is not an efficiency claim. The above recurrence is a replayable exact evaluator/state definition; it does not rely on a census or assert that a state class contains a positive witness.

## Conditional compression statement

A genuinely smaller shell kernel would follow from the additional premise that there is a computable equivalence on rooted branch states which (i) is a congruence for the two message products above and for all three deletion-polynomial contexts `P_v,H_v,R_v`, (ii) preserves the branch order contribution, and (iii) preserves the multiset of original leaf tags and supports under every context attachment. Under that premise, replacing a branch by its canonical representative preserves `I_T`, every `P_v,H_v,R_v`, hence `a,x`, every strict selector bit, and the full `S`; a finite set of representatives at each fixed `p` would then be a sound shell kernel. No such nontrivial bounded equivalence or cross-support cancellation theorem is established here. In particular, equality of only `A,B` (or only of `I_Q`) is insufficient to preserve leaf-deletion polynomials for tags inside the branch.

## Status and limitations

Established here: the parity-uniform vertex-cover bound; the exact rooted recurrences; and the sufficiency of the augmented polynomial/tag state to evaluate the full shell guards and complete sum. Missing: a size bound independent of `p`, a useful reduced set of representatives, a selector-preserving compression operation, and either a proof that every state has `S<=0` or a realizable shell tree with `S>0`. No tree census, literature theorem, or counterexample is claimed. Thus this work supplies a fixed-rank exact state framework and explicit kernel obligation only; the primary first-order shell assertion remains unresolved.
