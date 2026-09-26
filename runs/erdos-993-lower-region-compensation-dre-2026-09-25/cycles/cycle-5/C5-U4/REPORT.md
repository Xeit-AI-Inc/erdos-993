# C5-U4 search: original-selector interface

## Result

For a fixed original leaf `v` with support `s`, independent-set deletion gives the exact identity

`I_T(z) = I_(T-v)(z) + z I_(T-{v,s})(z)`.

Therefore, for every integer rank `j`, with the contract's zero extension,

`Delta_j(T) = Delta_j(T-v) + Delta_(j-1)(T-{v,s})`.

At `j=x(T)`, where `Delta_x(T)<0`, this proves the following restricted interface lemma: **for each original leaf `v`, either `Delta_x(T-v)<0` or `Delta_(x-1)(T-{v,s})<0` (or both).** This keeps each original leaf as its own tag, including leaves with common support. It is a one-rank alternative and does not give a sign for a later coefficient of `T-v`.

## Why the selector transfer remains open

The selector in the contract asks for `Delta_p(T-v)<0` with `p>=x+2`. The recurrence at `x` contains `Delta_x(T-v)` and `Delta_(x-1)(T-{v,s})`; it contains no coefficient at `p`. The same recurrence at `p` relates `Delta_p(T)` to the two rank-`p` deletion terms but supplies no sign relation between rank `x` and rank `p`. A cross-rank monotonicity, no-recovery statement, or other coefficient estimate would be an additional theorem. I have not established one for arbitrary trees or under the strict lower-region guards.

A small exact example rules out the unguarded closure `Delta_x(T)<0 => Delta_(x+2)(T-v)<0`: for `T=K_(1,3)`, the independence vector is `(1,4,3,1)`, so `x=1`; deleting any leaf gives `(1,3,1)`, whose zero-extended `Delta_3` is `0`. This example is deliberately limited: `p=3`, `alpha(T)=3`, so `3p=9` is not less than `2alpha+1=7`, and `p>alpha(T-v)`. It is not a counterexample in the assigned eligible region and says nothing against the aggregate.

## Literature check and scope

Bencs, *On trees with real rooted independence polynomial*, arXiv:1703.05409 (2017), Propositions 3.3 and 3.4, proves real-rootedness for the specifically defined centipede and caterpillar families. Those hypotheses do not cover arbitrary ordinary trees, and those propositions do not state the needed leaf-deletion cross-rank implication. I use no literature theorem as a premise for the primary selector. [Primary paper](https://arxiv.org/abs/1703.05409).

The route establishes one exact rank-local lemma and one out-of-scope counterexample to an unguarded proposed closure. It does not prove or refute the lower-region favorable-leaf aggregate. In particular, it does not establish an eligible proper-selector witness, a global sum sign, forest unimodality, or no-recovery.

## Reproduction

The vector for `K_(1,3)` is counted directly: size-0 has one set; size-1 has the center or any of three leaves; size-2 has any two leaves; size-3 has all three leaves. Removing one leaf gives `K_(1,2)`, with vector `(1,3,1)` and zero extension beyond rank 2. The recurrence follows by partitioning independent sets by membership of the chosen leaf.
