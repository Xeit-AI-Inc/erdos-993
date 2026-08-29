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
