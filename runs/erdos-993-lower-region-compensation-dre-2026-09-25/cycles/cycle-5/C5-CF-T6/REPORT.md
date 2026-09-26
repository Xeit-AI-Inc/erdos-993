# C5-CF-T6 independent critique (orientation F)

## Disposition

**C5-T6-THIRDSHELL-COVER6-P10 — retained_narrowed.** The exact example is valid, including its strict lower-region eligibility, cover number six, selector, and negative full aggregate. Its conclusion is limited to a proposed proof or reduction that requires every eligible tree in this third-shell slice to satisfy `tau(T) >= 7`, or that omits the `tau(T) <= 6` cases on that basis. The example does not show that a theorem *restricted* to `tau(T) >= 7` is false, nor does it refute the primary inequality.

## Independent audit

All three case-source hashes and all 237 hashes listed in the common packet matched.

The encoded graph has 24 vertices and 23 edges and is connected, so it is an ordinary tree. Its six centers meet every edge. Conversely, each of the six disjoint pendant branches requires at least one vertex in any vertex cover (cover its center-to-leaf edges by the center or all pendant leaves); hence `tau(T)=6`.

I copied the pinned `inputs/ordinary_tree_checked.py` evaluator and the case evidence into this worker directory, then ran `REPLAY.py` against those copies. The replay checks the encoding's connectedness and edge count, recomputes the independence polynomial, tests every original leaf with the strict condition `Delta_10(T-v)<0`, and recomputes each term from the two induced forests. The replay output agrees exactly with the producer evidence. In particular, the polynomial is

`(1,24,253,1566,6400,18419,38970,62650,78593,78515,63348,41582,22199,9548,3240,836,154,18,1)`.

It has `alpha=18`; its successive differences are nonnegative through rank 7, with `Delta_8=-78`, so `x=8`. Thus `x+2=p=10`, `3p=30<37=2alpha+1`, and this is the third shell `24=2p+4`. The full-tree difference `Delta_10(T)=-21766` is consistent with the polynomial but is not used to select leaves.

All 17 original leaves are favorable. Fifteen leaves on the five 3-leaf branches have summand `-7537` each; the two leaves on the 2-leaf branch have summand `-4875` each. Thus `S=15(-7537)+2(-4875)=-122805`. Each leaf sharing a support is counted separately, and each selected status is evaluated on `T-v` at rank 10. These checks confirm the finite obstruction to an all-cases cover-threshold premise. Because this instance has negative `S`, it is not a refutation of the aggregate inequality.

The cited cover-state polynomial identity is a valid decomposition by the independent intersection with the cover; it provides no sign estimate for the selector-weighted sum. The case report correctly treats it as a compression identity only.

## Limitations

- The replay uses the same pinned evaluator implementation as the producer; I checked the graph, guard arithmetic, per-orbit summand multiplication, and full-sum arithmetic, but did not implement a second independent polynomial algorithm.
- One finite tree rules out only the universal cover-threshold premise described above. It supplies no theorem for other trees or ranks, and no counterexample to the primary inequality.
- No exhaustive low-cover classification or pointwise sign theorem follows from this case.
