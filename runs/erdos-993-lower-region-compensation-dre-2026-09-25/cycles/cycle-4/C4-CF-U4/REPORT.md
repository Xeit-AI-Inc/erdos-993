# C4-CF-U4 independent critique

## Disposition

**C4-U4-COLORED-SHADOW-MIXED-BOUNDARY — retained_narrowed.** The claim is correct as an audit of what the cited unweighted tools establish and of the stated toy obstruction. I narrow its boundary conclusion: Chong's shadow comparison and normalized matching on the matching-sector face poset, by themselves, contain no endpoint-specific hub-incidence data and therefore do not establish preservation or a bound for the CB mixed boundary. This leaves open whether extra structure of a particular CB instance can yield such a bound.

## Checks performed

1. Verified the packet-pinned SHA-256 values for all three case files and all 179 common files; there were no mismatches. Read the required contract, protocol, execution policy, neutral handoff, intake reconciliation, critic brief, the assigned route files, and the pinned `control/C4-CB-COLORED-SHADOW-RESEARCH-DIRECTION.md` interface.
2. Independently checked the quotient-ring bridge. In Chong's definition, type `(1,...,1)` with color composition `(2,...,2)` gives the quotient by the sum of the degree-two ideals on each variable pair. Its monomial basis has at most one variable from each pair, so degree-`k` monomials are exactly rank-`k` independent sets of a disjoint-edge matching. Theorem 1.2(i) applies, and Theorem 2.1(iii)/(iv)(a) yields the revlex lower-shadow comparison for this ambient poset. This is an ordinary lower-shadow statement only.
3. Independently checked the normalized-matching claim for the same poset. Each pair factor has one rank-zero element and two rank-one elements; the product theorem applies to these log-concave factors. It gives adjacent-rank normalized transport in the matching-sector inclusion poset. Its edges are ordinary deletion/inclusion covers; it does not encode the extra hub-insertion relation or a selected-tag Hall cut.
4. Recomputed the three-vertex obstruction. In `H` with edges `ab, ah`, regard `{a,b}` as the colored pair and rank-one family `{b}`. Its colored lower shadow is `{∅}` and its addable set in `H` is `{h}`. Under the stated singleton order, compression to `{a}` leaves the lower shadow `{∅}` but gives no addable vertex, since both `b` and `h` are adjacent to `a`. Thus the extra count changes from 1 to 0 while ordinary shadow size remains 1. The example is a tree and a valid one-pair matching sector with an external insertion vertex, but it is only a toy interface: it is not an encoding of the full CB tree, fixed selector, or all mixed-boundary target incidences.
5. Checked the handoff controls: the route does not establish a tree-wide selector statement, a weighted-Hall certificate, or a full aggregate result. A missing bridge remains for arbitrary CB source subsets, including target collisions/competing demand. No global target claim is resolved here.

## Literature scope

The source attribution and theorem numbers are exact: Kai Fong Ernest Chong, *Hilbert functions of colored quotient rings and a generalization of the Clements-Lindström theorem*, arXiv:1403.3158v2, Theorems 1.2(i) and 2.1(iii). The order is the matching-sector face poset with two choices in each pair. The conclusion is cardinality minimization of its ordinary lower shadow under revlex compression. West, Harper and Daykin, *Some Remarks on Normalized Matching*, JCTA 35 (1983), 301–308, p. 303, gives the cited product theorem; the rank sizes of each pair factor are `(1,2)`. Neither result retains an external endpoint-specific incidence relation.

## Limitations

- The three-vertex example refutes automatic preservation of this auxiliary count by the described compression, not a pinned CB mixed inequality.
- No complete CB edge encoding or full selector audit was supplied to this route, and none is inferred from the toy example.
- No counterexample to the CB mixed-boundary inequality, proof of that inequality, or proof/refutation of the primary lower-region aggregate is established.
