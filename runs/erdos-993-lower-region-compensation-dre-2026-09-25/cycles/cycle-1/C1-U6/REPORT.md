# C1-U6 search report

## Result

I established an exact parameterwise finite reduction. For fixed `a=alpha(T)`, every candidate tree has order at most `2a`, since each side of a bipartition is independent and has size at most `a`. Thus a finite isomorphism-class enumeration at that fixed `a` can decide the target for each eligible `p`, provided it computes the registered quantities directly.

There is also an exact compression of the leaf tags at each original support. Leaves with common support are exchanged by a tree automorphism. Their strict selector values agree, their two deletion graphs have identical independence counts, and therefore their selected contributions are equal. The full contribution is the common contribution multiplied by the number of such leaves, preserving multiplicity. The exact argument and profile description are in `evidence/fixed-alpha-kernel.md`.

## Status boundary

This is a parameterwise search reduction, not a proof, counterexample, or uniform finite-state kernel. The bound depends on unbounded `a`; the profile contributions can have either sign, and the reduction gives no global budget across supports. No census or computed tree is asserted. The primary target remains unresolved.

## Claim

`C1-U6-1` is submitted as `proposed_partial`: fixed-alpha finite-domain reduction and same-support tagged-profile compression, with the limitations stated above.
