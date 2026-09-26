# C3-CT-F3 cross-orientation critique (orientation T)

## Disposition

**retained_narrowed** for `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, as an exact bounded computational result on the five specified trees and ranks only. The universal weighted-flow statement is not proved or refuted. The revised bounded claim, full graph recipes, rank data, selector leaves, summands, capacities, and replay counts are in `evidence.json`.

## Independent replay

I verified all 122 listed hashes (seven case files and 115 common files) against the packet inventories before reading the permitted contents. I copied the case scripts, evidence, flow output, and the listed ordinary-tree evaluator into this worker's `replay/` scratch copy. I ran the copied `search.py` and `audit_evidence.py` there. The audit rebuilt each tree from its listed edge set, recomputed the independence vector through its terminal zero extension, first strict descent, fixed original selector, every selected leaf summand, and complete aggregate. The five replayed rows agree with the source evidence:

| n | alpha | x | p | selected leaves | S = supply - capacity | upper supply | lower capacity | max flow |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 16 | 11 | 5 | 7 | 10 | -1,577 | 2,241 | 3,818 | 2,241 |
| 17 | 12 | 6 | 8 | 10 | -2,566 | 2,276 | 4,842 | 2,276 |
| 18 | 12 | 6 | 8 | 10 | -3,641 | 3,597 | 7,238 | 3,597 |
| 22 | 15 | 7 | 9 | 13 | -30,552 | 61,967 | 92,519 | 61,967 |
| 23 | 15 | 8 | 10 | 13 | -52,336 | 59,277 | 111,613 | 59,277 |

For every row, `x+2<=p` and `3p<2alpha+1`. The independent-set states were enumerated literally, with no orbit quotient. The network includes every one-vertex deletion and every absent-vertex move with exactly two neighbors in the upper set, replacing those two neighbors by that vertex. Each output is independent and has rank p. The source and sink capacities are the computed integer weights `w_F`; each allowed set-pair arc has capacity greater than total supply, so it imposes no artificial bottleneck. Dinic returned integral flows equal to all five upper supplies, with zero residual cut deficit. Thus the finite transport calculations are internally consistent and certify `S<=0` on these rows.

All original leaves in these five trees belong to the fixed favorable set. Leaves sharing a support are separately included in `F` and in the aggregate. The code's initial temporary assignment to `F` is immediately overwritten by the exact per-leaf deletion calculation and has no effect on the enumeration. I found no mismatch in the replayed arithmetic or move rule.

## Scope and mathematical assessment

The source's statement is a universal existence claim for an integral saturating flow. Its evidence is five hand-selected trees, only at `p=x+2`, not a complete generation boundary over trees or eligible ranks. The replay confirms those finite instances, not the universal quantifier. This is therefore narrowed to those five cases and remains `proposed_open` as a universal claim.

A saturated flow implies `sum_upper w_F <= sum_lower w_F`, hence the scalar aggregate inequality. The converse does not follow from that implication: aggregate sign alone does not establish this stronger route-specific transport mechanism. Likewise, a deficient cut in this network would only disprove this certificate, not refute the aggregate without a positive full selected sum. The changed two-for-one arcs are correctly distinct from the older deletion-only relation; no old cut or inherited refutation transfers automatically. The allowed CB export note itself labels its local export a subfamily and leaves competing demand unresolved. No CB adversary, selector-loss case, or rank beyond `x+2` was replayed here.

## Limitations

- Exactly five listed trees were replayed; this is not an exhaustive tree census or a universal proof.
- All leaves were favorable in these examples, so loss of favorable leaves and its effects on tag weights remain untested.
- Only the first eligible rank `p=x+2` was used in each case.
- The flow claim is stronger than the target scalar aggregate; neither these successes nor any future flow failure alone settles the target.
- No claim is made here about the separate first-shell candidate or any other route not listed in this sealed case.
