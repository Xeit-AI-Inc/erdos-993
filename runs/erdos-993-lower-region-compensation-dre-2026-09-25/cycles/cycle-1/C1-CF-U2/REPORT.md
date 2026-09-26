# C1-CF-U2 critique of C1-U2

## Disposition: retained

The route's sole claim, `C1-U2-1`, is correct as stated: for every eligible ordinary-tree pair `(T,p)`, positivity of the exact selected sum forces some marked independent `(p-1)`-set in an original selected leaf's `H_v` to have at least `p` actual addable vertices. The corresponding uniform addability bound implies `S(T,p)<=0`. The conclusion is a conditional obstruction, not a resolution of the primary target.

The derivation is independently checked in [EVIDENCE.md](EVIDENCE.md). The graph domain, `alpha(H_v)=a-1`, `p-1>=1`, positivity of `2a+1-3p`, actual extension incidence count, multiplicity of original leaf tags, and exact algebra from the selected summand to `(p-1)S=cQ-E` all check. In the positivity direction, `Q>0` follows from `E<cQ` and nonnegativity; at least one deficit must then be strictly below `c`, yielding `e_v(A)>=p` by integer arithmetic. The converse stated in the route also follows because every deficit is then at least `c`.

The selector is used only as the fixed set `F(T,p)` from the contract; no favorable-leaf value is inferred or modified. The exact selector hypotheses, original support/neighborhood deletions, and same-support tag multiplicities are preserved. There are no external theorem citations or computational claims to audit. The provided K1, T22, and T60 controls have negative complete sums, so they do not test the positive-sum antecedent; their positive local terms do not conflict with this conditional statement.

The result leaves open whether any eligible tree has a positive complete sum, whether such an incidence pattern is realizable subject to all favorable-leaf constraints, and whether global deficits always dominate `cQ`. Accordingly, no primary status is recommended from this claim alone.

## Limitations

- This proof supplies only a necessary incidence condition for positivity and a sufficient condition for nonpositivity; it does not establish the condition for all eligible trees.
- It gives no positive witness and no counterexample to the primary aggregate.
- Standing controls with negative full sums cannot validate the positive-sum implication empirically; they only remain consistent with it.
