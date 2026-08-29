# Current Results

## Included Formal Result

For every finite nonempty simple tree `T` with `|V(T)| >= 27`,

```text
i_4(T)^2 > i_3(T) * i_5(T).
```

The included proof composes two inequalities:

```text
(|V(T)| - 5) * i_3(T) < 5 * i_4(T)
5 * i_5(T) <= (|V(T)| - 5) * i_4(T).
```

The corresponding Lean declarations are:

- `Erdos993GapBridge.tree_e3_large_order`
- `Erdos993GapBridge.five_ind_five_le`
- `Erdos993GapBridge.tree_plc4_of_card_ge_27`

## Rooted Residual-Profile Experiment

The completed eight-cycle experiment established the exact occurrence count

```text
sum_(S in N(X_(t_*))) m_(t_*)(S) = q|X_(t_*)|.
```

For positive `q`, the open first-recovery capacity inequality is therefore
equivalent to

```text
a|X_(t_*)| <= b|N(X_(t_*))|.
```

This is a reduction of the remaining proof gap, not a proof of the inequality.
It must still be derived from minimum-order first-recovery history, including
the `t_*=0` boundary case, without assuming the desired recovery sign.

The accompanying Lean package verifies:

- `LeanProof.positiveLogConcave_descent_persists`; and
- `Erdos993C8U1.tail_contradiction_from_occurrence_interface`.

The second theorem takes the load-bearing capacity inequality as `hMult`; it
proves only the downstream contradiction once that hypothesis is supplied.

## Bounded Exclusions

- All 522,959 nonisomorphic trees through order 19 were checked with no
  descent-recovery witness.
- All 310,782 disconnected forest isomorphism types through order 18 were
  checked with no non-unimodal witness.
- An actual-factor replay checked 2,555,012 states and 10,394,520 order-14
  products, plus the stated hub-spider products, with no recovery.

These computations exclude finite ranges and tested mechanisms only.

## Other Governed Progress In The Research Line

- A decreasing terminal band for every finite forest.
- Positive log-concave convolution closure results.
- Plateau-safe extraction of an internal bottom from a non-unimodal finite
  sequence.
- An exact residual-surplus identity for independent sets.
- Conditional extraction of a positive residual witness from non-unimodality.
- Algebraic transport identities for component subproducts.

Not every governed declaration is included in this initial public package.

## Negative Knowledge

The research also eliminated broad classes of tempting approaches, including:

- universal log-concavity for tree independence sequences;
- arbitrary unimodal convolution;
- several fixed scalar transfer classes;
- multiple rooted monotonicity and covariance-sign proposals;
- circular classes defined by the target property itself.

These failures narrow the useful frontier toward tree-specific early-rank
structure and realizability-aware forest convolution.
