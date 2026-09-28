# C3-CU-T2 critique

## Scope and source integrity

Reviewed both required claims from C3-T2. Actual bytes match all 86 entries of `C3-COMMON-DISPATCH.json`, all four C3-CU-T2 dispatch entries, and all three entries in each transport clarification manifest. The packet authorizes the producer's `REPORT.md`, `RETURN.json`, `selector_row.py`, and `selector_row.json`; these matched its packet hashes. The shared-source clarification and critique reconciliation were read. No sibling case or scratch was accessed.

The contract keeps strict zero-extended first descent, all three eligibility guards, strict current-p deletion flags, and original tip multiplicities. I also checked the neutral selector reduction and the boundary it states: the accepted computer-assisted aggregate already excludes endpoint-only selection as a literal predicate, while an independent census-free argument remains a method goal. Neither the aggregate nor the formal relative margin proves the primary exact-ratio payment.

## Claim dispositions

**C3-T2-S1 — proposed_retained.** The polynomial identity is exact. For each (r=2,3,4),
\[
LB_r-GB_{r-1}=L(L^r+z)-(1+2z)(L^{r-1}+z)
=z^2(L^{r-1}-1)=z^3\sum_{h=0}^{r-2}L^h=z^3F_r.
\]
Multiplication by (H_i) gives (A_0-A_i=z^3F_{r_i}H_i), since their (zL^N) terms cancel. Zero-extended coefficients preserve the shift identity at every integer rank:
\[
\Delta_p A_0-\Delta_p A_i=\Delta_{p-3}(F_{r_i}H_i).
\]
Thus ε_i=1 exactly when (d_i(p-3)>\Delta_p A_0); equality is correctly unselected. This is only a selector identity and gives no universal selection or payment result. My independent coefficient check verified all three local identities; see `independent_selector_check.py` and its exact output.

**C3-T2-S2 — proposed_retained_narrowed.** As a conditional statement, it is valid: when the endpoint is strictly selected, failure of every branch threshold (d_i>\Delta_pA_0) is exactly endpoint-only selection. Therefore a universal proof of at least one such crossing on endpoint-selected eligible rows would exclude that case. The producer explicitly obtained no such universal proof, and the fixed row below is not a counterexample to crossing. Moreover, the literal endpoint-only predicate is already excluded by the accepted computer-assisted aggregate at its stated grade; the independent crossing argument remains a census-free method objective. Keep this claim scoped as a proposed proof route, not as a new established selector theorem or evidence for the primary payment.

## Exact adversarial row

I copied the producer script to `producer_selector_row.py` before running it with `PYTHONDONTWRITEBYTECODE=1`; `producer_replay.json` records the replay. A separately written convolution evaluator in `independent_selector_check.py` gives the same exact row for profile ((a_2,a_3,a_4)=(0,12,10)): (m=22,N=76,q=77,\alpha=78,x=37,p=39,j=37). Its search includes every zero-extended parent difference, so (x) is the actual first strict descent. All guards hold: (x+2=p), (3p=117<157=2\alpha+1), and (2p=78=\alpha).

The endpoint difference is −11319302108154726892710. For arity 3, ΔpAi=−10424062636794201349994 and (d_i(p-3)=−895239471360525542716). For arity 4, these are −10078464575583477845814 and −1240837532571249046896. Thus both cofactor slopes are negative, refuting the tempting stronger shortcut “some (d_i\ge0).” Yet both exceed ΔpA0, so both branch types are strictly selected. With multiplicities, all 76 original private-tip tags and the endpoint are selected. This is bounded evidence against the slope-sign shortcut only; it is neither endpoint-only selection nor a primary counterexample.

Replay commands from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_selector_row.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_selector_check.py
```

## Limits

No census-free universal crossing proof was found or attempted by extrapolation from the row. The single exact profile is not universal evidence. No Lean build or primary payment argument was performed. All dispositions are worker proposals only.
