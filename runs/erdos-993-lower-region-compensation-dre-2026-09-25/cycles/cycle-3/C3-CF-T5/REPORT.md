# C3-CF-T5 critique report (orientation F)

## Integrity and scope

The case packet lists four C3-T5 files; all four listed hashes matched. The common packet's 115 listed source hashes also matched. I read the protocol's four `read_first` files, the assigned T5 coefficient-direction control, and the authorized critic brief. I copied `COMPUTE.py` into this scratch directory as `replay-C3-T5.py` and ran that copy; the sealed source was not modified.

The route has two claims, and both are addressed below. The primary statement is the lower-region ordinary-tree aggregate from the solution contract. The T5 identity concerns only the displayed family polynomials and the case when both original leaf orbits pass the fixed selector.

## Claim review

### `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — retained_narrowed

The route accurately states the registered target and correctly leaves it open. Its evidence supports only this narrower conclusion: for the displayed family `T_m`, `1 <= m <= 50`, every rank `p` with `x(T_m)+2 <= p` and `3p < 2 alpha(T_m)+1` has both the arm and claw leaf orbits selected and has a strictly negative complete selected sum. The local replay reports 674 eligible rows, 674 with each orbit selected, and zero nonnegative sums. The example `(m,p)=(22,34)` has a positive arm contribution and a negative full sum after all 66 claw leaves are counted. This is useful evidence of compensation and of the importance of original leaf multiplicities.

This does not establish the primary assertion for all `T_m`, much less arbitrary ordinary trees. The finite horizon gives no bound for `m>50`; the route supplies no proof that the selectors agree (or which orbit subsets are selected) for all eligible ranks; and it proves no selected coefficient inequality beyond the checked rows. Accordingly the exact universal claim remains open.

### `T5-TM-COEFFICIENT-IDENTITY` — retained

The polynomial identities are internally consistent with the assigned construction. Splitting on the distinguished root gives `(1+2z)B^m + zL^(3m+1)`: with the root absent the remaining path contributes `1+2z` and each claw contributes `B`; with it present the path neighbor and each claw center are excluded, leaving `3m+1` free vertices. Deleting the arm leaf gives `(1+z)B^m+zL^(3m)`. Deleting one claw leaf gives `(1+2z)(1+3z+z^2)B^(m-1)+zL^(3m)`. The marked differences are `q_arm=zL^(3m)` and `q_claw=z(2+5z+2z^2)B^(m-1) + zL^(3m)`, since `(2+z)(1+2z)=2+5z+2z^2`.

For a leaf with marked difference polynomial `q`, its rank-`p` summand is `[z^p]q-[z^(p-1)]q`. There is one arm leaf and `3m` separately counted claw leaves, so if both orbits are selected the complete sum is the adjacent coefficient difference of

`Q_all=(3m+1)zL^(3m)+3m z(2+5z+2z^2)B^(m-1)`.

This identity does not make `Q_all` the selected polynomial when one orbit is absent. Nor does the difference `D_arm-D_claw=z^3(2+z)B^(m-1)` imply agreement of their adjacent-difference selectors. The route correctly keeps these conditions separate. Its finite code checks the displayed deletion-polynomial difference through `m=50`; the symbolic identities follow from the explicit root-split formulas and the leaf multiplicities above.

## Replay and audit limits

`replay-output.txt` records the exact-integer replay from the local copy. It reports generation boundary `m=1..50`, scanning every integer rank satisfying the two guards and computing `x` with the zero-extended terminal rank. It confirms 674 rows, all selected in both orbits, with no positive or zero complete sums; the exact compensation row matches the route evidence. The replay is bounded evidence only. The route's assertions for `q_arm` and `q_claw` restate the constructed coefficient vectors, so those assertions alone are not independent checks of a graph encoding; the root-splitting derivation above supplies the algebraic bridge for the displayed family.

The route does not claim a counterexample, a theorem for all `T_m`, or a result for the general primary scope. No universal tree log-concavity, selector coincidence, or coefficient-mixture sign is used in this review.
