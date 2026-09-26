# C4-F2 independent critique (orientation T)

## Disposition

**C4-F2-BOUNDED-BUDGET-SEARCH — retained** at the stated finite-search scope. This accepts the bounded computational observation only; it says nothing universal about the target aggregate or any of the three sufficient budgets.

## Replay and scope audit

I copied the pinned `SEARCH.py`, `PROFILE-SEARCH.py`, and `inputs/ordinary_tree_checked.py` into this seat’s scratch root, changed only the helper import root in the copied search scripts, and ran those copies in the foreground. The main replay completed with 24,067 generated tree instances, 339 eligible pairs with nonempty favorable selector, no proper-selector pairs, and no negative flat, current-rank, or target budget gap. The two-hub replay returned 287 eligible pairs and no proper-selector examples. The reported main finite generation consists of all labeled Prüfer trees through order 7, 400 seed-9930425 Prüfer sequences at each order 8–16, the stated broom and path-plus-two-leaf graft families at orders 8–16, and all spider arm partitions at orders 8–20. These boundaries are correctly finite and do not amount to exhaustive coverage of all ordinary trees. The two-hub profile is a selector stress only; it does not independently evaluate the three budgets.

The eligibility endpoint is correctly implemented for the strict guard: for integer `p`, `3p < 2a+1` is equivalent to `p <= floor(2a/3)`. The source also recomputes `F` through the original-tree leaf selector, and records separate per-leaf-tag counts. The replay uses the producer scripts and pinned helper, so it confirms reproducibility of that computation rather than providing an independent implementation of every corpus calculation.

## Independent exact row check

For the reported star `K1,19`, the independence polynomial is `(1+z)^19+z`: the leaf subsets contribute the binomial coefficients and the center contributes only the extra rank-one set. Its first strict descent is `x=10` (the rank-9 and rank-10 coefficients tie, then `i_11-i_10=75,582-92,378<0`). Here `a=19`, `p=12` gives `x+2=p` and `36<39`. Deleting any original leaf leaves `K1,18`; at rank 12 its next coefficient is `C(18,13)=8,568`, below `C(18,12)=18,564`, so all 19 original leaves are selected.

For each tag, deleting the selected leaf and its center leaves 18 isolated vertices, all in `W`; `R` is empty. Thus `q(11)=C(18,11)=31,824`, `q(12)=C(18,12)=18,564`, and each 11-set has seven actual addable vertices, giving `E_v=7*31,824=222,768`. Every upper 12-set is multiply marked, hence `C_v=18,564`. The tag summand is `Delta_11(H)-Delta_11(R)=18,564-31,824=-13,260`; summing 19 distinct tags gives `S=-251,940`. These exact values agree with the source record. This is a negative stress row, not evidence for a universal inequality.

## Limitations

The search establishes only the stated finite observation. Since no eligible proper favorable subset occurred, it does not probe the assigned route’s key adversarial cancellation regime. I did not independently regenerate the corpus by a second enumeration implementation; main-corpus confirmation is source replay, while the displayed star arithmetic is independently derived. No positive full aggregate, counterexample, universal budget proof, or literature bridge follows.
