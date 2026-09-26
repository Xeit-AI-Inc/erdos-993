# C4-CT-U3 critique report

## Assignment and result

Stage: critique. Orientation: T. The two required source claims are `C4-U3.LOW-COVER-SIGN` and `C4-U3.LOW-COVER-SKELETON`.

- `C4-U3.LOW-COVER-SKELETON`: **retained_narrowed**. The six-cover representation, converse, budget, and exhaustive finite enumeration recipe are sound for the stated orders. Correct the composition count in census step 2 from `binom(n-t-2,5)` to `binom(n-t-1,5)`. The claim does not depend on the erroneous count sentence; the explicit recipe still enumerates the whole finite domain.
- `C4-U3.LOW-COVER-SIGN`: **retained** as an evidence-scope report that this route leaves the sign unresolved. No census was executed and no sign inequality is proved.

No mathematical sign verdict is proposed.

## Independent structural check

For an ordinary tree `T` on `n in {24,26,28,30}`, take a vertex cover of size at most six and pad it to a designated six-set `C`. This is possible since `n>6`; a superset of a cover remains a cover. Then `O=V(T)\\C` is independent. Each vertex of `O` has all its neighbors in `C`, and those with degree one are precisely the outside pendant leaves. Let `D` be the other outside vertices. Deleting all outside pendant leaves leaves the connected subtree `K=T[C union D]`, which contains all six vertices of `C`; each vertex in `D` has degree at least two and at most six.

Writing `t=|D|`, `L=|O\\D|`, and `e_C=|E(T[C])|`, the full tree has `n=6+t+L` vertices and `n-1=e_C+sum_{u in D}deg_T(u)+L` edges. Subtraction gives `e_C+sum_{u in D}(deg_T(u)-1)=5`, hence `t<=5`. Every deleted outside vertex is a leaf attached to one of the six cover vertices. Conversely, a connected core tree with the stated cover/connector partition and budget, after attaching the prescribed leaves, remains a tree and has `C` as a vertex cover. The argument permits cover vertices themselves to be original leaves; the source correctly calls for recovering them from full-graph degrees.

The stated enumeration recipe is exhaustive: it ranges over every possible cover-edge subset, connector count and connector neighborhood multiset compatible with the budget, filters to connected cores, then ranges over every weak composition of `n-6-t`. Its ordering of connector neighborhoods may retain duplicates but does not omit a graph. The count of these compositions is `binom((n-6-t)+5,5)=binom(n-t-1,5)`, not `binom(n-t-2,5)`. At `(n,t)=(30,0)` this is `binom(29,5)=118755`, matching the source's stated maximum. For example, at `(24,0)` the count is `binom(23,5)=33649`, rather than `binom(22,5)`.

The independent-set formula also checks: for a fixed independent core state `I`, a pendant leaf is freely selectable exactly when its cover neighbor lies outside `N_K[I]`. Thus
`P_T(z)=sum_I z^|I| product_{c in C\\N_K[I]}(1+z)^m_c`
counts every independent set once. The formula is an evaluation method, not a bound on the selector-weighted sign.

## Exact scope and unresolved work

The scope is the low-cover subcase of the four third-shell orders `n=2p+4`, `p=10..13`. It does not cover trees with cover number at least seven, and it supplies neither an executed skeleton/multiplicity census nor a universal sign proof. Selectors would still need to be recomputed from each full graph, with zero-extended descent, both eligibility guards, strict favorable-leaf tests, and separate tags for all original leaves sharing a support. The source's proposed procedure expressly requires these checks. No source evidence justifies promoting this to the complete ordinary lower-region aggregate.

## Limitations

- I checked the combinatorial representation, converse, edge count, composition arithmetic, and core-state generating-function identity by direct derivation; I did not enumerate all skeletons or multiplicities.
- No graph-level selector replay or full aggregate computation was performed because the assigned evidence is a parametrization and census plan, not a specific graph census.
- The corrected finite enumeration domain remains bounded evidence if run; it would not establish the universal low-cover sign without a proof or an explicitly bounded result.
