# C2-CU-T5 cross-orientation critique

## Scope

I audited the two claims from C2-T5 against the exact first-order shell contract and cycle-2 handoff. The primary is the complete sum over the fixed set of original leaves satisfying the strict selector, with original supports and neighborhoods and multiplicity for each leaf. All eligibility conditions remain in force: `x(T)+2<=p`, `3p<2alpha(T)+1`, and `|T|=2p+2`.

## Dispositions

- `C2-T5-PENDANT-P2-RECURRENCE` — **retained**. The split according to whether the new support is selected gives `I(T)=(1+z)I(U)+zI(U-r)`. Degree and positivity give `alpha(T)=alpha(U)+1`; deleting the new leaf gives `I(T-v)=I(U)+zI(U-r)`. Its original support is `s`, so the two original deletions are exactly `U` and `U-r`, and its contribution is `Delta_(p-1)(I(U)-I(U-r))`. The strict selector is the rank-`p` difference of `I(U)+zI(U-r)`. These are exact polynomial identities with integer zero-extended coefficients.
- `E993-LOWER-REGION-FIRST-ORDER-SHELL` — **retained_narrowed**. The evidence supports only the method-specific statement that this pendant-`P2` recurrence, by itself, has not supplied a reduction proving the complete shell sum. The shell/order and alpha transfer are correct, including the one-unit reverse-boundary gap. The exact `K_(1,4)` example establishes that `x` can change from 2 to 3 under attachment, so a proof cannot assume preservation of the descent guard. It is a guard diagnostic, not an eligible shell counterexample. Existing leaves require their own selector recalculations and original-tagged summands; the recurrence proves no correspondence or global sum inequality. Nothing here refutes the shell claim.

Detailed calculations and the guard checks are in [EVIDENCE.md](EVIDENCE.md).

## Limitations

- No universal shell proof or eligible positive complete-sum counterexample is established.
- The `K_(1,4)` calculation is outside the shell and only checks descent-index instability.
- Retained-leaf selectors, contribution changes, and the complete fixed-selector sum are not controlled by the recurrence for `I(T)`.
- I did not perform a tree census, invoke external literature, or use Lean; no finite or formal result is claimed.
