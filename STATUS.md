# Research Status

Last updated: 2026-08-29

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
- No descent-recovery witness was found among all 522,959 nonisomorphic trees
  through order 19.
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

The public status must be updated before any claim is described as current.
