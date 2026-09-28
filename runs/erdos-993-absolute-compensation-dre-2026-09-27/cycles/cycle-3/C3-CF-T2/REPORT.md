# C3-CF-T2 critique: selector threshold

## Scope and evidence boundary

Reviewed both assigned claims against the sealed solution contract and the current registered identity for the exact-ratio payment and accepted all-m aggregate. The shared-source clarification authorizes the neutral `sources/cycle3` files; the packet’s four case files are the only additional worker-case inputs used. All 86 members of `C3-COMMON-DISPATCH.json`, all four packet files, and the members of `C3-TRANSPORT-CLARIFICATION.json` and `C3-CRITIQUE-TRANSPORT.json` matched their listed SHA-256 hashes. The latter manifests include the shared-source clarification and the v3/v4 seat runners. No sibling, scratch, experiment, or private transcript was read.

## C3-T2-S1 — exact selector identity

**Disposition: proposed_retained.** For `r in {2,3,4}`, expansion gives

`(1+z)B_r - (1+2z)B_(r-1) = z^3 F_r`.

Multiplying by `H_i` yields `A0-Ai=z^3 F_(r_i)H_i`; integer zero extension then gives

`Delta_p A0 - Delta_p Ai = Delta_(p-3)(F_(r_i)H_i)`.

Since the tip selector is exactly `Delta_p Ai<0`, it is equivalent to the strict threshold `Delta_(p-3)(F_(r_i)H_i)>Delta_p A0`. Equality is correctly unselected. This holds for every natural `p`, including out-of-support indices, and does not depend on tag multiplicity; multiplicities still matter when forming aggregate `b` and `A`.

The independent script verifies the three polynomial expansions and their preservation after multiplication by a sample cofactor. This is an informal algebraic proof, not a Lean award.

## C3-T2-S2 — endpoint-only reduction

**Disposition: proposed_retained_narrowed.** Under the actual lower-half guards, if `Delta_p A0<0` and every represented tip selector is false, then every cofactor slope is `<=Delta_p A0`. Conversely, one represented branch whose slope is strictly greater than `Delta_p A0` is strictly selected, so endpoint-only selection is excluded. This is a valid reduction with the first strict, zero-extended descent and current-`p` flags retained. It is not a proof that such a branch exists for every eligible profile and does not establish MASS or exact-ratio payment. The exact-ratio claim remains OPEN in the registry; the all-m aggregate has its separate computer-assisted grade and is not used here.

## Exact adversarial row

Independently recomputed profile `(a2,a3,a4)=(0,12,10)`, so `m=22`, `N=76`, `q=77`, `alpha=78`. Searching all 79 forward-difference indices, including the terminal zero-extended difference, gives the first strict descent `x=37`. At `p=39`, `j=37`, the guards are `x+2=p`, `3p=117<157=2alpha+1`, and `2p=78=alpha`. The endpoint is selected with `Delta_39 A0=-11319302108154726892710`. Every original tip is selected: for arity 3, `Delta_39 A_i=-10424062636794201349994` and slope `Delta_36(F_3H_i)=-895239471360525542716`; for arity 4, `Delta_39 A_i=-10078464575583477845814` and slope `Delta_36(F_4H_i)=-1240837532571249046896`. Both slopes are negative but strictly exceed `Delta_39 A0`; all 76 individual tip tags remain selected. This defeats the shortcut “some cofactor slope is nonnegative,” while satisfying the actual threshold. It is not an endpoint-only witness or a counterexample to either required claim or the primary payment.

The copied producer script replay and a separately written exact-integer evaluator agree. The latter also recomputes the parent first descent and all three guards. Evidence is finite and bounded to this row; it establishes no universal selector theorem.

## Replay

From the eventual admitted directory `cycles/cycle-3/C3-CF-T2/`:

- `PYTHONDONTWRITEBYTECODE=1 python3 selector_row_replay/producer_selector_row.py`
- `PYTHONDONTWRITEBYTECODE=1 python3 selector_row_replay/independent_selector_check.py`

The second command emits `selector_row_replay/independent_evidence.json`. The copied producer source and its replay output are retained alongside it. No Lean build or source/controller operation was performed.
