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

## 2026-08-31 r6/r7 Update

The completed Code r6 NR-foundation experiment is represented here as a
provenance-backed computation-grade record only. Its terminal controller
record says that its Lean-gated corpus is not `formally_verified` under the
r6 rubric. Accordingly, this release publishes no r6 theorem package and
does not use r6 to upgrade any formal claim.

The completed r7 joint-shadow-incidence experiment contributes twelve exact
kernel-checked, axiom-checked, fidelity-reviewed declarations. Every one is
auxiliary or conditional, and none is a headline theorem. The reproducible
packages establish:

- no plateau-safe first recovery beginning at rank one in a finite nonempty
  labelled tree;
- first-recovery exclusion for the proper labelled families `D_(1,m)` and
  `D_(2,m)`;
- exact rooted attachment transitions and coefficient formulas through degree
  five;
- a conditional endpoint-sign implication and a conditional finite-coupling
  diagonal consequence;
- conditional common-freshening and contextual congruence infrastructure, and
  an explicit pair of rooted trees with equal degree-five signature but
  unequal `i_6`;
- exact two-leaf four-class, containment/stub, component-boundary, and
  fixed-component selector identities.

The endpoint and coupling declarations retain their displayed antecedents.
The selector characterization does not prove a nonempty common selector, and
the structural identities do not establish a strict same-leaf inequality.
The complete package list, declarations, source hashes, and scope boundaries
are in the [r7 provenance record](../evidence/verification-2026-08-31-r6-r7.md).

## 2026-09-01 r8 Extension-Profile And Same-Leaf Update

The terminal r8 experiment contributes eight governed formally verified
auxiliary declarations in seven public packages. Their exact scopes are:

- an extension-set cardinality bridge under labelled graph disjoint union;
- recovery of independent-set coefficients by evaluating an encoded
  extension-profile variable at one;
- a fixed five-label obstruction to a universal decoder for the exact
  `R_bag` state;
- closure of an abstract universal-preserver predicate under convolution;
- endpoint-deletion isomorphism, coefficient equality, and difference
  equality for an exact two-leaf tree;
- a positive-rank and carrier-bound legality consequence of the displayed
  minimum-first-recovery hypothesis; and
- a route-local `TRS2` characterization by adjacent log-concavity and a
  closure theorem for abstract finitely supported sequences.

No result establishes a strict common-leaf inequality, proves that a tree
independence sequence belongs to `SCP` or `TRS2`, provides a realizable
transfer class, or changes any headline status. The two Cycle 12 nominees are
blocked future work and are not published as verified Lean theorems.

See the [r8 experiment summary](../experiments/r8-extension-profile-same-leaf.md)
and [verification record](../evidence/verification-2026-09-01-r8.md).

## Bounded Exclusions

- All 522,959 nonisomorphic trees through order 19 were checked with no
  descent-recovery witness.
- All 310,782 disconnected forest isomorphism types through order 18 were
  checked with no non-unimodal witness.
- An actual-factor replay checked 2,555,012 states and 10,394,520 order-14
  products, plus the stated hub-spider products, with no recovery.
- Complete center-code certificates cover all 823,065 nonisomorphic trees of
  order 20 and all 2,144,505 of order 21. Both contain zero recovery rows, and
  an independent implementation regenerated the carriers and checked every
  row. The sources and exact hashes are published under
  [`evidence/order-20-21-search`](../evidence/order-20-21-search/README.md).

These computations exclude finite ranges and tested mechanisms only.

## Proof-Gap Completion Update

Write `Delta_r(T)=i_(r+1)(T)-i_r(T)` in `Int`. The completed twelve-cycle
experiment established the following restricted results.

### Audited informal order band

If a finite tree has order at least 12 and satisfies

```text
Delta_4(T) < 0 < Delta_5(T),
```

then its order lies between 13 and 32. More precisely, if `mu(T)` is the
minimum cardinality of a maximal independent set, then `2<=mu(T)<=8` and the
surviving order is below the corresponding threshold

```text
N_2=17, N_3=20, N_4=23, N_5=26,
N_6=28, N_7=31, N_8=34.
```

This is an independently audited informal theorem, not a Lean theorem. It
does not exclude the remaining orders 13 through 32.

The terminal DRE synthesis also accepted at internal informal scope that
`i_4(T)>i_3(T)` for every tree of order at least 12, excluding the associated
`q=5,p=3` branch. Its final formalization audit did not reify the order-eight
base and leaf-restoration sublemmas, so this repository does not present it as
a formally verified theorem.

### Verified marked-extension identity

For an independent `(r-1)`-set `X`, let `e_X` count its available extension
vertices and let `m_X` count the edges in the induced extension residual
`R_spec(T,X)`. The included Lean theorem proves

```text
sum_X e_X = r i_r(T),
sum_X (choose(e_X,2)-m_X) = choose(r+1,2)i_(r+1)(T),
sum_X [e_X(e_X-r-2)-2m_X] = r(r+1)Delta_r(T).
```

At a positive `Delta_r`, the aggregate charge is positive. Therefore at least
one specified residual has positive charge. The theorem does not identify a
different operational residual, control each local sign, or supply the missing
descent to a smaller recovery tree.

### Refuted mechanisms

Two attractive routes fail exactly:

- the proposed actual-factor moment threshold is a positive multiple of the
  next coefficient difference and therefore reverses direction at a strict
  recovery; and
- universal nonpositive terminal residual charge is incompatible with the
  positive aggregate at every instantiated specified recovery carrier.

These are refutations of proof mechanisms, not counterexamples to Erdős #993.

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
