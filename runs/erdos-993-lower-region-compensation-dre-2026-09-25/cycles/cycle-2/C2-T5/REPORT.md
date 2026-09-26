# C2-T5 search report

## Route and scope

This route investigates the registered `E993-LOWER-REGION-FIRST-ORDER-SHELL` claim at the exact shell `|T|=2p+2`. The target remains the complete original-favorable-leaf sum with the strict selector, original supports, and one summand per original leaf. No positive local summand is treated as a counterexample.

## Result

I derived an exact rooted recurrence for adding a pendant path of length two to a rooted tree `U`: `I(T)=(1+z)I(U)+zI(U-r)`. It proves `alpha(T)=alpha(U)+1`, and gives exact formulas for the new leaf's selector polynomial and summand. Thus attachment raises order by two and alpha by one, matching the shell and rank shift `p -> p-1`; the child strict alpha inequality implies the parent one, with a one-unit boundary gap in the reverse direction.

The recurrence does not close the shell claim. The first-descent condition and all favorable-leaf selector values must also transfer. An exact `K_(1,4)` calculation shows that `x` changes from 2 to 3 under the attachment, so a pruning argument cannot silently preserve the descent guard. At the added leaf, the strict selector is a rank-`p` test on `I(U)+zI(U-r)`, not the rank-`p-1` test on `I(U)`. Existing leaves require their own deletion contexts and complete recalculation. No correspondence between the two complete sums is proved.

The transition and its guard audit are in [EVIDENCE.md](EVIDENCE.md). This is a partial recurrence result; it neither proves the shell aggregate nor gives an eligible tree with positive complete sum.

## Limitations

- No universal shell sign or eligible refutation is established.
- The `K_(1,4)` example diagnoses descent-index instability only; it is not shell-eligible at the displayed rank.
- The selector and contribution changes for retained leaves are not bounded by the recurrence for the whole-tree polynomial.
- No tree census, external theorem, Lean build, or unbounded minimal-counterexample reduction was used.
