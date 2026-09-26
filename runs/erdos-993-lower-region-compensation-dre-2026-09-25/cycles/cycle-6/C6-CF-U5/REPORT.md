# C6-CF-U5 critique — CB sector deficit

## Disposition: retained_narrowed

**Claim:** `C6-U5-CB-sector-deficit`

The exact pair-choice arithmetic is correct. With 736 disjoint support–leaf pairs, the residual rank-s family has `R_s = 2^s binom(736,s)` members. Pair symmetry gives total selected-tag weight `W_s = R_s(1+s/2)`, including the fixed arm tag. Therefore `R_491/R_490 = 492/491`, while `W_491/W_490 = 493/491`; deletion-only capacity at rank 490 is short by `R_490/491` unweighted and `2W_490/491` under this weight. The identities were checked exactly with integer arithmetic.

The rank labels are residual ranks after fixing the hub and arm leaf. The corresponding whole-graph set sizes are 493 and 492. Making this convention explicit avoids confusing the sector ranks with the parameter `p=492`.

The result is a necessary whole-sector threshold only. To use it in a mixed-capacity proof, switch targets must contribute at least `2W_490/491` **usable additional capacity** after overlaps with deletion targets and competing source demand are accounted for. This does not prove that the switch boundary supplies that amount, that any arbitrary source subfamily satisfies Hall, or that the primary tree aggregate holds. Thus the source status remains appropriately `proposed_open`.

## Replay and scope controls

The packet-pinned CB replay was copied into this seat’s scratch and run with the designated Python 3.11 interpreter. Its order, `alpha=829`, first strict descent `x=490`, eligibility at `p=492` (`x+2=p` and `3p=1476<2alpha+1=1659`), 737 favorable original leaves, complete selected aggregate, and conservative cut values match the pinned results. The conservative switch-cut lower bound is negative, so that test is inconclusive; it is neither a deficient cut nor a flow certificate.

I inspected the exact source-map references `control/C3-CB-EXPORT-DIRECTION.md` and `control/C4-CB-COLORED-SHADOW-RESEARCH-DIRECTION.md`, along with the pinned CB protocol, recipe, results, and `inputs/ordinary_tree_checked.py`. The available colored-shadow direction concerns an unweighted deletion shadow and explicitly leaves the mixed weighted switch-capacity bridge open. I did not import a theorem or claim a literature audit. The exact arithmetic and replay are recorded in `EVIDENCE.json`.

## Limitations

- This review validates the sector count and its narrow necessary-threshold interpretation, not arbitrary-subfamily weighted Hall.
- The replay is bounded to CB(8,92); its complete negative aggregate is contextual evidence, not a universal proof.
- The conservative switch-cut envelope does not establish either feasibility or obstruction.
