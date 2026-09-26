# C4-U3 search report: low-cover third-shell skeletons

## Result

For the third-shell rows `n=2p+4`, `p=10,11,12,13` (so `n=24,26,28,30`), every ordinary tree admitting a vertex cover of size at most six has a complete six-cover skeleton representation with at most five outside connector vertices. Once the skeleton is fixed, the only unbounded-looking data are six pendant-leaf multiplicities; at each of these four fixed orders they lie in an explicit finite composition set. An exact core-state formula (at most 2^(6+t) core subsets, or at most 64 cover states with connector choices summed separately) gives rank polynomials and preserves original-leaf multiplicity and selector membership.

This is a representation and reproducible census plan, not a completed sign census. It does not establish the third-shell pointwise sign or the primary aggregate.

## Completeness lemma

Let `T` be a finite ordinary tree of order `n>6` with a vertex cover `C` of size six. (If a cover has size less than six, pad it to size six; since `n>6`, this is possible and a superset remains a cover.) Put `O=V(T)\\C`, and let `D` be the vertices of `O` with degree at least two in `T`. Since `C` is a vertex cover, `O` is independent. Every vertex in `O\\D` therefore has degree one and is adjacent to a vertex of `C`.

Let `K=T[C union D]`, let `t=|D|`, let `e_C` be the number of edges of `T` with both endpoints in `C`, and for `u in D` put `d_u=deg_T(u)`. Removing the degree-one vertices in `O\\D` from a tree leaves a connected tree containing all six vertices of `C`; hence `K` is a tree. Also each `u in D` has all its neighbors in `C` and `2<=d_u<=6`. Counting edges, with `L=|O\\D|`, gives

`n-1 = e_C + sum_(u in D) d_u + L`, while `n=6+t+L`.

Subtracting yields the exact budget

`e_C + sum_(u in D)(d_u-1) = 5`.

In particular `t<=5-e_C<=5`. Each remaining vertex is a pendant leaf attached to one of the six cover vertices. If `m_c` denotes the number attached to `c`, then `sum_(c in C)m_c = n-6-t`.

Conversely, take a tree `K` on six designated cover vertices `C` and `t` connector vertices `D`, with no connector-connector edges, every connector degree at least two, all its neighbors in `C`, and `e_C+sum_D(deg_K(u)-1)=5`. Attach nonnegative numbers `m_c` of new leaves to the vertices `c in C`, with sum `n-6-t`. The result is a tree of order `n` and `C` is a vertex cover of size six. Thus the representation is both necessary and sufficient. Vertices of `C` may themselves be original leaves: their original degree is `deg_K(c)+m_c`, and the census must include such a vertex exactly when this equals one.

This parametrizes trees with cover number at most six, not only trees with cover number exactly six: any smaller cover can be padded. Representations may duplicate a tree; duplicates do not omit a candidate and are harmless for a universal finite check.

## Bounded reproducible census plan

For each `n` in `{24,26,28,30}`:

1. Label the six cover vertices `0..5`. Enumerate `e_C`-edge subsets of the 15 possible cover-cover edges for `0<=e_C<=5`; enumerate `t=0..5-e_C` connector vertices. For each connector, choose a subset of `{0..5}` of size at least two, requiring the sum of its neighborhood sizes minus one, plus `e_C`, to equal five. To avoid permutation duplicates, order connector neighborhoods lexicographically. Retain precisely those resulting cores that are connected. The budget fixes the edge count at `5+t`, so connectedness makes each retained core a tree. This finite construction enumerates all skeletons in the lemma.
2. For each retained skeleton enumerate all weak compositions `(m_0,...,m_5)` of `n-6-t`; there are exactly `binom(n-t-2,5)` vectors. Across the allowed `n,t`, this is a fixed finite domain; the largest single composition count is `binom(29,5)=118755` (at `n=30,t=0`). No asymptotic or open-ended search is involved. An implementation may quotient by cover permutations, but must retain one representative for every skeleton/multiplicity orbit and verify that quotient action preserves the graph-derived selector.
3. Compute the polynomial and each deletion polynomial by the exact core-state formula below, or direct subset recurrence. Reconstruct the full original leaf set from graph degrees, including cover vertices of degree one. Compute `alpha`, scan zero-extended differences through the terminal descent to obtain `x`, and test both guards `x+2<=p` and `3p<2alpha+1` before recording a row. For every eligible row compute `F` using the strict test `Delta_p(T-v)<0`, and sum every original leaf tag separately. Record empty/proper/full selector status, support multiplicities, all selected terms, and the full exact integer sum.

The graph-generation boundary is the four specified orders and all six-cover trees at those orders. A result from this plan would be a bounded census only; it would not prove a universal shell theorem.

## Exact polynomial and selector handling

For a fixed core `K` and multiplicities `m_c`, an independent core state `I` contributes

`z^|I| product_(c in C, c not in the closed neighborhood N_K[I]) (1+z)^m_c`.

Summing this over the independent core states gives `P_T(z)`; there are at most `2^(6+t)<=2048` subsets to check. Alternatively, condition first on the six cover bits (at most 64 states), then sum over the at most `2^t<=32` connector subsets compatible with that cover state. The formula counts every independent set once because its intersection with the core is unique and its pendant-leaf choices are then free exactly at cover vertices outside the closed core neighborhood of that state.

For a leaf bundle at `c`, all its members have the same support `c` and are interchanged by automorphisms fixing the rest of the tree. Their `T-v`, `T-{v,c}`, and `T-N[c]` rank polynomials are therefore identical within the bundle. The aggregate can be computed as `m_c` times that term only after checking the common strict selector predicate for that bundle. Original leaves in `C` are separate singleton tags and must be tested and added as well. Deletion polynomials can be computed by applying the same state sum to each explicitly deleted graph; this avoids any implicit assumption that selector membership is stable under a different deletion.

The independent-control six-cover example in the assigned common material is consistent with this boundary: it disproves the attempted `cover>=7` shortcut at `(n,p)=(24,10)`, but has all 17 original leaves favorable and full aggregate `-122805`. It is not a counterexample to the target. I did not use it as evidence for either sign direction.

## Unresolved bridge

The finite representation makes an exact low-cover census possible, but neither the provided degree-budget minima nor the one cover-six example settles the four low-cover cells universally. I have not enumerated the skeletons and multiplicities, and no symbolic inequality controlling their selector-weighted sums has been proved here. High-cover trees and the complete primary lower-region aggregate are also outside this result. Status remains proposed/open for the sign obligation.
