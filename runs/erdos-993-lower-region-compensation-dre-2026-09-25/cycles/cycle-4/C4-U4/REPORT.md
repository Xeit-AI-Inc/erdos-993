# C4-U4 search report: colored matching sector and the mixed boundary

## Scope

This route audits the colored matching sector identified in the C4 CB direction. With the central root and arm leaf fixed and stripped, a source in that sector is a rank-`k=p-1` independent set in `d m` disjoint support-leaf edges: at most one endpoint from each pair. The question here is what colored-shadow or normalized-matching results control, and whether their compressions also control the extra hub-insertion part of the mixed boundary.

This is not an audit of a particular CB tree's complete selector or a proof of the primary lower-region aggregate. The available CB direction supplies the sector interface, not a full edge encoding and all branch-block target incidences.

## Exact colored-shadow theorem and application

Let

`R = K[x_1,y_1,...,x_n,y_n] / ((x_1,y_1)^2 + ... + (x_n,y_n)^2)`.

Its monomial basis consists of squarefree monomials using at most one of `x_i,y_i` for each `i`. Thus degree-`k` basis monomials are exactly the independent `k`-sets of an `n`-edge matching, with the two endpoints as a color class. This is the colored quotient ring of type `(1,...,1)` and composition `(2,...,2)`.

Chong, *Hilbert functions of colored quotient rings and a generalization of the Clements-Lindström theorem*, arXiv:1403.3158v2, Theorem 1.2, condition (i), says every colored quotient ring of type `(1,...,1)` and arbitrary finite composition is Macaulay-Lex. By Theorem 2.1(iii), this is equivalent to the revlex lower-shadow containment for every degree space. Consequently, for any rank-`k` matching-sector family `A`, its revlex initial segment `A_rev` has `|∂A_rev| <= |∂A|` in the matching-sector face poset. This is the exact usable ordinary-shadow conclusion; it compares cardinalities and gives no distinguished tag or external-target count.

There is also a normalized-matching statement for the *unweighted full face poset* of the matching sector. Each pair contributes the three-element ranked poset with rank sizes `(1,2)`, whose normalized matching property is immediate; products preserve the property when the factors' rank-size sequences are log-concave. This product theorem is stated by West, Harper and Daykin (1983), p. 303, lines 77-89 of the accessible paper. It yields uniform fractional transport between adjacent ranks of the product face poset. It does not provide a transport respecting a fixed selected tag, branch blocks, or the extra hub-insertion edges.

For a `d m`-pair sector, set `n=d m` in the quotient-ring application. The mapping is exact for the sector after stripping the two fixed vertices. It does not identify the entire tree's marked complex with this ring: other branches, the original favorable selector, and target vertices outside the sector remain additional data.

## Concrete compression obstruction for an added boundary

The colored quotient records only the pair conflict, whereas an extra insertion target can be adjacent to one endpoint and not the other. The following exact small graph shows that ordinary revlex compression can change the extra-boundary count even when the ordinary lower shadow is unchanged.

Take the graph `H` on `{a,b,h}` with edges `ab` and `ah`; regard `{a,b}` as one color pair. In rank one let `A={{b}}`. Order the two singleton monomials so that `{a}` is the first revlex singleton. Compression sends `A` to `A_rev={{a}}`. Both ordinary lower shadows are `{∅}`, hence both have size one. But the addability counts in `H` differ:

| family | ordinary lower shadow | addable vertices for its sole set | count |
|---|---|---|---:|
| `{{b}}` | `{∅}` | `{h}` | 1 |
| `{{a}}` | `{∅}` | `∅` | 0 |

Indeed, `a` is blocked by edge `ab` for `{b}`, and `h` is nonadjacent to `b`; for `{a}`, both `b` and `h` are blocked. So compression preserves the ordinary shadow inequality but does not preserve even this simplest auxiliary insertion count when external adjacency distinguishes the two endpoints.

This is a concrete obstruction to using colored revlex compression as an automatic mixed-boundary-preserving operation. It is a three-vertex model of the data loss, not a counterexample to the exact CB(8,92) mixed inequality: the route input does not pin a concrete CB edge list in which to identify this toy `h` with a particular hub target. In the actual CB sector, any proposed compression must explicitly transport each hub-insertion arc and account for collisions/competing demand at hub-present targets. The quotient-ring theorem alone proves none of that.

## Route conclusion

The exact theorem usable here is Chong Theorem 1.2 + Theorem 2.1(iii), with the matching-sector ring/type bridge above. West-Harper-Daykin normalized matching supplies an unweighted adjacent-rank fractional flow on that same product poset. Neither theorem includes the mixed boundary. A compression that remembers only colored rank families can lose endpoint-specific hub incidences, as the explicit `H` calculation demonstrates. I found no verified argument that repairs this loss for the CB mixed boundary, no exact weighted-Hall certificate for arbitrary source subsets, and no CB counterexample to that inequality.

The primary lower-region aggregate and the CB mixed-boundary route therefore remain open. In particular, the report proves no tree-wide selector statement and no universal compensation budget.

## References

- K. F. E. Chong, “Hilbert functions of colored quotient rings and a generalization of the Clements-Lindström theorem,” arXiv:1403.3158v2 (2014), Theorems 1.2 and 2.1(iii): https://arxiv.org/abs/1403.3158
- P. Frankl, Z. Füredi and G. Kalai, “Shadows of colored complexes,” *Mathematica Scandinavica* 63 (1988), 169–178, Theorem 1.2: https://doi.org/10.7146/math.scand.a-12231 . Chong's theorem above was the retrievable theorem statement used for the quotient-ring bridge.
- D. B. West, L. H. Harper and D. E. Daykin, “Some Remarks on Normalized Matching,” *Journal of Combinatorial Theory, Series A* 35 (1983), 301–308, product theorem discussion p. 303: https://dwest.web.illinois.edu/pubs/normatch.pdf
