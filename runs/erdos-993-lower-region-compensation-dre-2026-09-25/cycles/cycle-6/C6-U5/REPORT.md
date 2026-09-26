# C6-U5 — CB mixed insertion/deletion cut

## Scope

This is a bounded structural analysis of the distinguished root-plus-arm sector in the admitted graph CB(8,92), at the eligible primary row p=492. It addresses the deletion boundary and the minimum mass that the additional two-for-one switch boundary would have to supply for the full sector. It does not establish the mixed Hall inequality for arbitrary source subsets, nor the ordinary-tree aggregate.

## Exact deletion-sector calculation

In the CB(8,92) root-plus-arm sector, after fixing the hub and distinguished arm leaf, the remaining branch choices are independent sets in 736 disjoint support-leaf pairs. Let R_s be the family of size-s choices, with at most one endpoint chosen in each pair. Every pair has one selected leaf tag. Thus

|R_s| = 2^s binom(736,s), and the total selected-tag weight of R_s, counting the fixed arm tag, is

W_s = sum_{B in R_s}(1 + number of selected branch leaves in B)
    = |R_s|(1+s/2).

The second equality follows by pair symmetry: among the s occupied pairs, each chosen endpoint is the selected leaf in exactly half of all choices. Ordinary deletion from rank 491 lands in rank 490. The exact rank ratios are

|R_491|/|R_490| = 2(736-490)/491 = 492/491,

W_491/W_490 = (492/491) * ((1+491/2)/(1+490/2)) = 493/491.

Consequently the full rank-491 sector cannot be routed using only its rank-490 deletion targets at unit target capacity: the unweighted deficit is |R_490|/491. Under the selected-tag weighting above, deletion targets likewise fall short by 2 W_490/491. This is a quantified obstruction to a deletion-only proof. It is not a counterexample to the mixed graph relation: two-for-one targets outside rank 490 may cover the deficit.

For the full-sector cut, any valid mixed capacity argument using this weighting must therefore exhibit at least 2 W_490/491 additional usable capacity from switch targets, after accounting for overlaps and competing source demand. This is only a necessary mass threshold for this particular whole-sector cut; it says nothing by itself about arbitrary proper subfamilies, where the colored lower-shadow boundary and switch neighborhood must be treated jointly.

## Concrete CB(8,92) context

The pinned graph replay gives order 1567, alpha=829, x=490, p=492, hence x+2=p and 3p=1476<1659=2alpha+1. It reports 737 favorable original leaves and the complete selected aggregate is a large negative integer (see EVIDENCE.json for its exact value). This is not an obstruction to the target.

The admitted prospective switch-cut test uses the cut “hub and arm leaf present; no choke selected; every branch has support count unequal to one.” Its conservative neighbor-weight upper bound exceeds the tested upper weight: the resulting lower bound on deficit is negative. The source explicitly grades this as inconclusive, not a feasible flow or a deficient cut. I independently reran its deterministic CB(8,92), p=492 calculation with the assigned Python 3.11 interpreter and obtained the same guards, complete aggregate, favorable count, and cut values.

## Missing bridge

The calculation above only quantifies the global-sector deficit for the deletion-only boundary. To prove a mixed Hall result one still needs, for every relevant source subfamily A, a capacity bound on the union of its actual deletion and two-for-one neighbors, with the fixed selected-tag weights. In particular, one must control overlap between the two boundaries, shared target capacity, and the full selector-dependent weights. An unweighted colored-shadow theorem for the deletion boundary does not provide that switch-capacity estimate. The available CB(8,92) conservative envelope does not close it, and the bounded replay cannot imply a universal tree statement.
