# C4-CT-U4 critique of C4-U4

## Decision

**Disposition: retained_narrowed.** Proposed status: `proposed_open`.

The exact matching-sector translation and ordinary-shadow consequence are supported, and the three-vertex calculation is correct. The critique narrows the claim's negative conclusion: the cited ordinary-shadow and unweighted normalized-matching results provide no established estimate for the added endpoint-sensitive insertion boundary, while the toy graph demonstrates failure of preservation for its particular addability statistic under the stated compression. This is not evidence that every compression fails, nor that a CB mixed inequality is false.

## Independent checks

The quotient by the squares of each endpoint pair has basis monomials containing at most one variable from each pair. Its degree-k monomials correspond exactly to rank-k independent sets of the matching, with ordinary monomial shadow corresponding to deleting one selected endpoint. The type `(1,...,1)` and composition `(2,...,2)` lie in the cited colored quotient-ring case. The ordinary revlex shadow assertion is therefore properly scoped to the matching-sector face poset.

The cited normalized-matching product result concerns ordinary adjacent-rank cover relations. The matching-sector poset is a product of two-rank factors of sizes `(1,2)`, so this gives an unweighted flow on those ordinary cover edges. It adds no incidence relation for a hub target, no selected-tag constraint, and no capacity accounting for competing hub-present targets. The report is right to leave those as missing bridges.

For the toy graph with edges `ab` and `ah`, the rank-one family `{{b}}` has lower shadow `{∅}` and addable set `{h}`. The compressed family `{{a}}` has the same lower shadow `{∅}` and empty addable set because both `b` and `h` neighbor `a`. Thus the ordinary shadow cardinality is 1 on each side, and the extra addability counts are respectively 1 and 0. This is a valid obstruction to inferring preservation of that extra statistic from ordinary-shadow minimization alone.

## Scope, standing controls, and usefulness

The source case does not pin a full CB tree edge list or map `h` to a particular hub target. It does not make a claim about the global favorable selector, original leaves and supports, eligibility guards, or the complete sum `S(T,p)`. No tree encoding, all-leaves reconstruction, rank-vector arithmetic, or primary-target counterexample is therefore asserted or needed to support this narrowly stated compression observation. This work neither displaces existing ordinary-tree counterexample controls nor establishes a CB-specific failure.

The route is useful as a precise warning for any future compression argument: a proof must carry or bound the added boundary, not only its ordinary lower shadow. A CB mixed inequality still needs a concrete encoding and a tag-sensitive transport or cut argument, including target collisions/demand. No such proof, refutation, or complete selector audit appears in this case.

## Literature check

Chong, *Hilbert functions of colored quotient rings and a generalization of the Clements-Lindström theorem*, arXiv:1403.3158v2, Theorems 1.2(i) and 2.1(iii), supports the ordinary-shadow bridge for type `(1,...,1)`. West, Harper and Daykin, “Some Remarks on Normalized Matching,” *JCTA* 35 (1983), pp. 302-303, supports the product normalized-matching statement for the unweighted poset. Neither citation supplies the missing mixed-boundary application. See the route's references and the independent scope checks in `EVIDENCE.json`.

## Limitations

- The source contains no full CB graph instance, so the toy is not a CB-tree witness.
- The exact relation between the modeled addability count and every hub-insertion term in a concrete CB encoding remains unverified.
- The cited results and this critique establish no universal mixed-boundary inequality, primary aggregate theorem, or refutation.
