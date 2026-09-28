# C3-T2 — selector structure search

## Scope and result

I targeted the independent, census-free selector argument requested for ordinary arity-2,3,4 path-stars. I found an exact reduction of endpoint-only exclusion to a cofactor-slope threshold, but did not prove that threshold universally. This work does not use the accepted selected-aggregate sign. It neither proves nor refutes the primary exact-ratio payment.

## Exact selector reduction

For each represented branch (i), write (H_i=Q/B_{r_i}) and (d_i(k)=\Delta_k(F_{r_i}H_i)). The polynomial identity

\[
L B_r-G B_{r-1}=z^3F_r
\]

follows by expanding (B_r=L^r+z), (G=1+2z), and (F_r=1+L+\cdots+L^{r-2}). Multiplying by (H_i) gives

\[
A_0-A_i=z^3F_{r_i}H_i,
\qquad \Delta_pA_0-\Delta_pA_i=d_i(p-3).
\]

Thus, at a current rank (p), tip-branch (i) is strictly selected exactly when

\[
d_i(p-3)>\Delta_p A_0.
\]

If the endpoint is selected and every tip branch is unselected, then necessarily

\[
\Delta_pA_0<0,\qquad d_i(p-3)\leq\Delta_pA_0\quad\text{for every represented }i.
\]

Consequently, a census-free proof excluding endpoint-only selection would suffice to establish that some represented branch crosses this threshold at every eligible endpoint-selected row. This equivalence preserves strict flags: equality (d_i=\Delta_pA_0) means the branch is unselected. It does not itself establish the crossing.

## Adversarial check against a simpler route

I independently recomputed the fixed profile ((a_2,a_3,a_4)=(0,12,10)) using exact integer polynomial convolution in [selector_row.py](cycles/cycle-3/C3-T2/selector_row.py). Replay with `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-3/C3-T2/selector_row.py` produces [selector_row.json](cycles/cycle-3/C3-T2/selector_row.json).

The profile has (m=22,N=76,q=77,\alpha=78); its actual least strict zero-extended parent descent is (x=37). At (p=39), (j=37), the guards hold: (x+2=p), (3p=117<157=2\alpha+1), and (2p=78=\alpha). Exact differences are

- \(\Delta_{39}A_0=-11319302108154726892710\);
- for represented arity 3, \(\Delta_{39}A_i=-10424062636794201349994\) and \(d_i(36)=-895239471360525542716\);
- for represented arity 4, \(\Delta_{39}A_i=-10078464575583477845814\) and \(d_i(36)=-1240837532571249046896\).

The endpoint and all 76 original private-tip tags are strictly selected. Both cofactor slopes are negative, so the shortcut “some (d_i\geq0)” is false at an actual eligible rank. Yet each (d_i>\Delta_{39}A_0), as required by the exact threshold. This is a bounded exact obstruction to that shortcut, not a counterexample to endpoint-only exclusion or to payment. The script recomputes (P,A_0,A_i,F_iH_i) directly, searches all zero-extended parent differences for the first strict descent, and checks the rank guards; it does not use producer code.

## Status boundary

The neutral dispatch records literal full selection as computer-assisted VERIFIED, established independently of aggregate sign. That is not the census-free structural proof sought here and I did not use it as a premise. Endpoint-only exclusion remains an unproved method obligation for this route. Universal exact-ratio payment, selected MASS, and a governed Lean award are outside what this search established; the primary remains OPEN at this evidence grade. The dispatch's known empty/singleton-truncation failures concern payment truncations, not this threshold identity, so they do not supply a test of the identity or a selector counterexample.
