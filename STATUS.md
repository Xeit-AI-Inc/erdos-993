# Research Status

Last updated: 2026-08-30

## Headline Problems

| Target | Status | Resolution needed |
|---|---|---|
| Every finite tree has a weakly unimodal independent-set sequence | Open | Universal proof or one independently verified finite counterexample |
| Every finite forest has a weakly unimodal independent-set sequence | Open | Universal proof or one independently verified disconnected counterexample |
| A noncircular convolution-closed transfer class carries the tree result to forests | Open | A realizability-aware class satisfying all required closure and implication properties |

No formal-independence candidate has been identified.

## Verified Progress

- The decreasing terminal band for finite forests is formalized in the included
  Lean dependency chain.
- A non-unimodal independence vector can be localized to a plateau-safe
  internal bottom with a positive residual witness in the larger governed
  corpus.
- For every finite nonempty simple tree of order at least 27,
  `i_4(T)^2 > i_3(T) i_5(T)` is Lean-verified and included here.
- The minimum-order first-recovery capacity gap has been reduced exactly to
  the neighborhood-shadow inequality `a|X| <= b|N(X)|` at the selected
  threshold. That inequality remains open.
- Two auxiliary interface theorems are Lean-verified and included here; neither
  is a tree or forest theorem.
- The marked-extension one-mark, unordered two-mark, and aggregate charge
  identities are Lean-verified for the explicitly defined residual `R_spec`.
- An independently audited informal theorem confines any
  `Delta_4<0<Delta_5` tree of order at least 12 to orders 13 through 32.
- No descent-recovery witness was found among all 522,959 nonisomorphic trees
  through order 19.
- Complete, independently checked certificates find no recovery among all
  823,065 trees of order 20 or all 2,144,505 trees of order 21.
- No non-unimodal witness was found among all 310,782 disconnected forest
  isomorphism types through order 18.

## Claim Boundary

The following do not count as a solution:

- finite searches with no counterexample;
- auxiliary identities or inequalities;
- a theorem restricted to one coefficient rank;
- log-concavity or unimodality of a proper family;
- generic sequence-convolution arguments that ignore graph realizability;
- an LLM-generated proof without independent mathematical and formal review.
- a conditional formal theorem whose load-bearing inequality is a hypothesis.
- an exact aggregate charge identity without a bridge to the run residual or
  a theorem controlling the sign of its local charges.

The public status must be updated before any claim is described as current.
