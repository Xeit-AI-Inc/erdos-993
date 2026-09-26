# Audit evidence: C1-U6-1

## Source integrity and scope

The two assigned packet files were read first. SHA-256 values were checked against every source entry in both packets; all listed digests matched. The source claim under review is `C1-U6-1`, the sole `required_covered_claim_id`.

## Direct verification

Let the color classes of a finite ordinary tree `T` be `A,B`. Both are independent, so `|A|,|B| <= a=alpha(T)` and `|V(T)| <= 2a`. At fixed `a`, the candidate orders are bounded, and only finitely many simple graph isomorphism classes exist. Filtering to trees with independence number exactly `a` preserves finiteness. This conclusion has no uniform bound because `a` is unrestricted in the primary target.

If original leaves `v,w` share support `s`, their transposition fixing all remaining vertices preserves adjacency, so it is a graph automorphism. It gives isomorphisms `T-v ~= T-w` and `T-{v,s} ~= T-{w,s}`. The deleted graph `T-N_T[s]` is identical for the two tags. All relevant independent-set coefficients and differences therefore agree. In particular, the strict predicate `Delta_p(T-v)<0` has the same truth value for every leaf at `s`; if true, the compressed profile must be weighted by the full number of such leaves.

For `alpha(T)=a`, zero extension gives `i_(a+1)(T)=0`. Thus coefficients through rank `a+1` suffice to compute `Delta_j` through terminal rank `j=a`; a finite search must use these exact counts and check both eligibility inequalities and every selected leaf. This validates the route's profile sufficiency statement without certifying any executed search.

## Standing-control check

The common handoff gives `K_(1,12)` with 12 favorable leaves at a shared support and `S=-1980`; the supplied `T_22` and `T_60` each contain a positive selected local term while their full selected sums are negative. These controls illustrate that tag multiplicity is material and that profile compression itself gives no sign conclusion. They are not new computations or proof of the target.

## Audit conclusion

Disposition: `retained`. Evidence grade: elementary exact reduction, no computation. No citation or external theorem is used. No source replay was necessary because the route asserts no computed result. The universal target remains unresolved.
