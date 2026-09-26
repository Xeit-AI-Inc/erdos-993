# C5-CT-F6 critique of C5-F6

Orientation T; stage critique. The source pins in `packets/C5-COMMON.json` (237 files) and `packets/C5-CT-F6.json` (4 files) all match their listed SHA-256 digests. I read the required common read-first files, the protocol, the additional C5 critic brief, and exactly the four case-listed worker files. I replayed the case script from `REPLAY.py` in this scratch directory.

## F6.low_cover_tau_ge_7 — retained

The claim is a realizable counterexample to the proposed universal sufficient shortcut `tau(T) >= 7` in the eligible third-shell region. The labeled graph in the pinned evidence is the tree with one root, six centers adjacent to it, and respectively 2, 3, 3, 3, 3, 3 pendant leaves on those centers. It has 24 vertices and 23 edges; the replay and independent graph check verify connectedness and acyclicity.

The independent-set vector from ranks 0 through alpha is `(1,24,253,1566,6400,18419,38970,62650,78593,78515,63348,41582,22199,9548,3240,836,154,18,1)`. Zero extension gives `Delta_8=-78`, so `x=8`; with `p=10`, `x+2=10<=p` and `3p=30<37=2alpha+1`. The generic induced-subgraph recurrence independently recomputes this vector and all 17 original-leaf selector values: deleting any pendant leaf gives `Delta_10(T-v)=-13234` on the two-leaf arm and `-12357` on each three-leaf arm. Thus the full original leaf set is selected, with no support multiplicity dropped.

The six centers form a vertex cover. One pendant edge per center gives six pairwise vertex-disjoint edges, hence every vertex cover has at least six vertices. Therefore `tau(T)=6` exactly. The selected local terms are `-4875` twice and `-7537` fifteen times, giving full `S=-122805`. This witness refutes the cover-threshold shortcut only; it neither violates the pointwise sign nor refutes the primary aggregate. The source claim is retained with that exact scope.

## F6.six_arm_bounded_census — retained

The source replay enumerates sorted nonnegative six-tuples of sum `2p-3`, which are exactly the arm profiles in its specified root-plus-six-centers family up to arm permutation. Its exact counts are 163, 235, 331, and 454 at `p=10,11,12,13`. An independent enumeration using `combinations_with_replacement`, paired with the generic induced-subgraph recurrence rather than the producer's polynomial product, reproduces these counts and the eligibility decisions: only `(2,3,3,3,3,3)` at `p=10` is eligible. Its every selected local term is negative, with maximum `-4875`; its complete sum is `-122805`.

The statement is retained strictly as this finite family census. It is not exhaustive over all ordinary trees of those orders or all trees with `tau<=6`, and it gives no universal pointwise-sign or aggregate result.

## Evidence and limitations

`REPLAY.py` is the pinned producer computation copied into this worker's scratch; `EVIDENCE.json` is its exact output. `AUDIT.py` and `INDEPENDENT-CHECK.json` independently check the labeled witness, original leaves and supports, all selector values, local terms, guards, and cover/matching certificate using a generic graph recurrence. The same file also performs the independent finite profile enumeration; `CENSUS-CHECK.json` records its results.

No primary-literature theorem is used. The scope is the stated six-arm family and one exact witness. The general third-shell pointwise sign, any low-cover replacement inequality, and the selected primary aggregate remain unresolved by this case. All dispositions and statuses here are proposals only.
