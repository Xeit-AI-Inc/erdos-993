# C3-CU-F2 critique (orientation U)

## Dispositions

All three source claims are retained at their stated bounded scopes. The replay supports exact conclusions for the two specified rows only; neither those negative sums nor the routing fragment decides the universal lower-region aggregate.

### C3-F2-CB-ELIGIBLE-REPLAY — retained

The pinned replay, rerun from local scratch copies, returns for CB(8,92) `(n,a,x,p)=(1567,829,490,492)` and for CB(8,93) `(1584,838,496,498)`. Both have `x+2=p`; the strict guards are `1476<1659` and `1494<1677`. The favorable set comprises all original leaves, respectively 737 and 745. Each tree has two selector orbits: for m=92 the multiplicities are 1 and 736, and for m=93 they are 1 and 744; every recorded `Delta_p(T-v)` is negative. Multiplicity-weighting the recorded local summands gives a strictly negative complete sum in each row. Both exact integer sums, all selector-orbit deltas and summands, and the weighted upper and lower totals are in `EVIDENCE.json`. For each row, the reported weighted upper supply minus weighted lower capacity equals the complete aggregate. The replay also checks the displayed independence-polynomial recurrence against the evaluator polynomial. These are exact calculations for two inputs, not a generation census or a universal inference.

### C3-F2-HUB-ARM-ARC-CLASSIFICATION — retained

For an independent size-`p+1` set containing `h,v`, both are present and every `c_i` and `s` is absent. The absent support `s` has exactly the two occupied neighbors `h,v`. An absent choke `c_i` has `h` plus its occupied supports as neighbors, so it is a target exactly when that branch has one occupied support. An absent support `u_ij` has no occupied choke neighbor while `h` is present, and can have at most its leaf as another occupied neighbor. An absent leaf has only its support as neighbor. The remaining vertices `h,v` are already present. This exhausts the legal two-neighbor targets. The coefficient counts in the evidence are consistent with these branch states and are bounded to these graphs and source family.

### C3-F2-QUALIFYING-CHOKE-ROUTING — retained

For each source in the stated subfamily, the chosen branch has one occupied support `u_ij`; inserting its absent choke `c_i` while deleting `h,u_ij` is legal and yields an independent size-`p` set. The fixed branch order selects one qualifying branch. In a given output, the inserted choke identifies that branch, and a predecessor can restore the removed support only on a branch pair whose leaf is absent. With `ell>=4` leaves present, there are at most `8-ell<=ell` such pairs. Those `ell` leaves remain present and are active favorable tags because `c_i` is present, so output capacity is at least the predecessor multiplicity. This establishes the claimed capacity-respecting routing for this subfamily. It does not cover the other upper sources, and does not prove saturation or the primary inequality. The old neighborhood envelope has a negative deficit lower bound in both rows and is not a deficient-cut certificate.

## Replay and evidence

`REPLAY.py` was executed using scratch copies of the pinned route replay, `cb-switch-cut/run.py`, and `ordinary_tree_checked.py`. The two copied helper sources are preserved alongside the replay; source hashes are recorded in `EVIDENCE.json`. No sealed source was edited. All artifacts here are in this worker's scratch root and map to the corresponding logical `C3-CU-F2` final paths.

## Limitations

- The replay covers only CB(8,92), p=492 and CB(8,93), p=498. It does not enumerate other eligible ordinary trees.
- The routing handles only the specified `h,v` sources with a qualifying branch. The reported uncovered supply remains positive; routing success on this subfamily is not a full-flow result.
- No universal proof or counterexample to the lower-region aggregate is established. All statuses are proposed worker dispositions only.
