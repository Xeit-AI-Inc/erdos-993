# C3-CF-U6 critique report

## Scope and disposition

I audited both claims in the sealed C3-U6 case against the lower-region contract and the assigned F-orientation brief. The source hashes matched: all 115 common-packet entries and all three case-listed source entries. The source files were copied into this scratch directory before the arithmetic replay; the sealed files were not modified.

**C3-U6.star-subcase — retained.** The exact star counts give the stated first negative rank. For every eligible pair, deleting an original leaf gives `K_{1,m-1}` with negative `Delta_p`, so every original leaf is in the fixed selector. Each residual is the edgeless graph on the other `m-1` leaves, all marked, with empty `R_v`. Thus each selected term is `binom(m-1,p)-binom(m-1,p-1)`. Since `p-1 >= x+1 > (m-1)/2`, this is negative. The complete sum is the claimed `m`-fold multiple. The strict upper guard also keeps `p<=m-1`, so these binomial ranks are in range. Replay at `(m,p)=(20,12),(20,13)` returned `S=-503880,-465120`, respectively.

**C3-U6.marked-down-operator — retained, as a conditional criterion only.** The displayed spaces have dimensions `q_j`; if the map `d_p:M_p->M_{p-1}` is injective for every selected leaf, then `q_p<=q_{p-1}` for each, and the contract's summand is exactly `q_p-q_{p-1}`. Summing over the original fixed selector proves `S<=0` under that additional premise. This does not establish injectivity for arbitrary eligible trees. The given Boolean-lattice obstruction is valid: at the unselected rank in the `K_{1,20}` example the dimensions are `27132>11628`, ruling out injectivity there only. It has no bearing on the eligible claim.

## Full-scope checks and limits

The star computation counts every original leaf once and has no shared-support ambiguity because the star leaves share a support but remain distinct summands; multiplying the common summand by `m` is correct. Its selector is computed after each single leaf deletion using the original rank `p`. The zero-extended terminal difference is `Delta_m=-1`; the reported `x` is the first negative difference, not merely the first negative formula term. No arithmetic or scope defect was found in the two claims.

The sufficient operator condition is potentially useful as a target for a residual-specific rank proof, but the source provides no proof of that condition outside the star calculation. It gives no global lower-region conclusion, counterexample, imported theorem, or evidence about arbitrary tree realizability. Accordingly, the primary aggregate remains unresolved by this case.

## Replay

`REPLAY.py` runs only from this directory and reproduces the star guards, selector sign, two exact sums, and the dimension obstruction. `CRITIQUE-EVIDENCE.json` records the checks. `SOURCE-C3-U6-*` are copies of the three exact case-listed files.
