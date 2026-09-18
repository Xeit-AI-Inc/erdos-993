# C4-LA1 Informal Proof

## Status and scope

This is the formalizer's source-bound proof preparation for the awarded
auxiliary theorem `C4-LA1`. It is not an independent proof-integrity audit, a
fidelity attestation, or workflow closeout.

The theorem is only about finite literal ordinary trees. It does not assert the
top-rank aggregate sign, the residual inequality `(RC)`, a finite residual
classification, the full interior-window headline, semantic transport,
governed `RTree`, `E993-BETA-AGG`, or Erdos #993.

## Exact definitions

Let `T` be a finite simple graph on a finite vertex type `V`.

- `alpha(T)` is the maximum cardinality of an independent vertex set. In Lean
  this is `SimpleGraph.indepNum`.
- A vertex `v` is a leaf when there exists exactly one vertex `u` adjacent to
  `v`. The unique `u` is the support of `v`.
- `i_k(T-v)` is the number of independent `k`-subsets of `V` that avoid `v`.
  This is exactly the independent-set coefficient of vertex deletion, with no
  isolated placeholder vertex counted.
- `Delta i_(T-v)(p) = i_(p+1)(T-v) - i_p(T-v)`, evaluated in the integers.
- `v` is favorable at rank `p` exactly when
  `Delta i_(T-v)(p) < 0`.

## Exact awarded theorem

For every finite vertex type `V`, every finite simple graph `T` on `V`, every
decidable adjacency relation, and every vertex `v`, if:

1. `T` is a tree;
2. `2 <= alpha(T)`; and
3. `v` is a leaf of `T`;

then `v` is favorable at `p = alpha(T)-1`. Equivalently,

```text
i_alpha(T)(T-v) < i_(alpha(T)-1)(T-v).
```

Since `v` is arbitrary, every leaf is strictly favorable at the top interior
rank.

## Quantifiers and hypotheses

- Universal: finite type `V`.
- Universal: simple graph `T : SimpleGraph V`.
- Universal: vertex `v : V`.
- Typeclass data: `Fintype V`, `DecidableEq V`, and decidable adjacency.
- Mathematical hypotheses: `T.IsTree`, `2 <= T.indepNum`, and the unique-neighbor
  leaf predicate at `v`.
- Conclusion: `IsFavorableAt T v (T.indepNum - 1)`.

No domain is narrowed to a named tree family. No extra graph hypothesis is
introduced. The tree hypothesis is retained in the declaration even though the
local proof uses only the unique-neighbor leaf property.

## Awarded dependency DAG

The admitted evidence states the following closed semantic DAG:

```text
finite tree + independent-set coefficients + zero extension
  -> unique leaf support and vertex-deletion recurrence
  -> maximum-independent-set exchange containing the leaf
  -> alpha(T-{u,v}) = alpha(T)-1
  -> induced-subgraph coefficient monotonicity
  -> downward closure of independent sets
  -> strict negativity of Delta i_(T-v)(alpha(T)-1)
  -> top-rank selector collapse
```

The Lean proof realizes the same counting content through a direct finite-set
injection. This avoids introducing a separate polynomial library while keeping
the exact coefficient semantics:

```text
unique leaf support
  -> any maximum independent set avoiding v contains its support u
  -> exchange u for v to obtain a maximum independent set containing v
  -> erase u injects alpha(T)-sets of T-v into (alpha(T)-1)-sets of T-v
  -> construct a lower-layer independent set outside that image
  -> strict cardinal inequality
  -> negative forward difference
```

The direct injection is a proof implementation of the awarded recurrence and
downward-closure argument, not a different theorem.

## Proof

Fix a leaf `v` and let `u` be its unique neighbor. Write `a = alpha(T)`.

First, any maximum independent set `S` that avoids `v` must contain `u`. If it
did not, then `S union {v}` would remain independent because `u` is the only
neighbor of `v`; it would have size `a+1`, contradicting maximal cardinality.
Consequently, starting from any maximum independent set, either it already
contains `v`, or replacing `u` by `v` produces a maximum independent set `M`
that contains `v`.

Let `A` be the family of independent `a`-subsets of `T-v`, and let `B` be the
family of independent `(a-1)`-subsets of `T-v`. Every member of `A` contains
`u`, so

```text
S |-> S \ {u}
```

is an injection from `A` into `B`.

It remains to prove that the injection is not surjective. Put
`H = M \ {v}`. Then `H` is an independent member of `B`, avoids both `u` and
`v`, and is nonempty because `a >= 2`.

If `H` is not in the image, it is the required missing member. Otherwise the
unique possible preimage is `H union {u}`, which is independent. Choose
`w in H` and set

```text
K = (H \ {w}) union {u}.
```

Then `K` is an independent `(a-1)`-subset avoiding `v`, so `K` belongs to `B`.
But every image set omits `u`, while `K` contains `u`; hence `K` is not in the
image. Thus `|A| < |B|`.

By the definitions of `A` and `B`, this is

```text
i_a(T-v) < i_(a-1)(T-v),
```

so `Delta i_(T-v)(a-1) < 0`. Therefore `v` is favorable at the top rank.

## Remaining gates

The formalizer may prepare and kernel-check the exact declaration. Independent
informal review, independent fidelity review, and workflow closeout remain
unperformed by instruction.
