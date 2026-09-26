# C3-F2 search: CB switch exports and a larger perturbation

## Result

I replayed the supplied choked broom `CB(8,92)` at `(a,x,p)=(829,490,492)` and the one-branch larger tree `CB(8,93)` at `(838,496,498)`. Both satisfy `x+2=p` and the strict lower-region guard: respectively `1476 < 1659` and `1494 < 1677`. The selector is the full set of original leaves in both cases: 737 leaves for `m=92`, 745 for `m=93`. Both exact complete sums are negative. Their decimal values, every selector-orbit delta and summand, and the exact weighted upper/lower totals are in `EVIDENCE.json`; `REPLAY.py` reproduces them from the pinned CB evaluator and independently checks the displayed CB independence-polynomial recurrence.

The larger test changes the fixed-rank row as well as the tree: keeping `p=492` after adding a branch would not be the eligible favorable row. The first descent becomes 496, so I used `p=498`.

## Switch graph and exact subfamily routing

Write the path as `h-s-v`. For each `i=1,...,m`, attach a branch with edges `h-c_i` and `c_i-u_ij-l_ij` for `j=1,...,8`. In the fixed-selector weight, the arm leaf `v` is active when `h` is present; a branch leaf `l_ij` is active when its choke `c_i` is present. This agrees with the exact favorable set above.

For an upper independent set containing `h` and `v`, the weight is exactly one. The full list of legal two-for-one targets from such a set is short and exact:

- `s` is always a target: its two occupied neighbors are `h` and `v`.
- `c_i` is a target exactly when branch `i` has one occupied support, since its neighbors are `h` and the eight supports `u_ij`.
- `h` cannot be a target because it is already present; a support `u_ij` cannot be a target because `c_i` is absent; a leaf has degree one.

Thus this source family exposes both the arm export and every one-support choke export. The exact number of arm exports and the exact total number of one-support choke arcs are recorded per tree in `EVIDENCE.json`. They are counted with the branch polynomials `A(z)=(1+2z)^8` and `Q_1(z)=8z(1+z)^7`, respectively.

Here is a capacity-respecting routing for a selected portion of these sources. Fix a branch order. For each upper set containing `h,v` with at least one branch having exactly one occupied support and `ell>=4` occupied leaves among the other seven pairs, choose the first such branch `i`, delete `h` and its occupied support, and insert `c_i`. The choke is absent before the move and has exactly those two occupied neighbors, so this is an allowed two-for-one move and produces an independent set one rank lower. The output identifies `i` by its unique choke. If the output has `ell` leaves in branch `i`, it has at most `8-ell` preimages, since the removed support could have been on only a pair whose leaf is absent. Its lower capacity is at least `ell`, from the `ell` selected leaf tags activated by `c_i`. Since `8-ell<=ell`, all routed units fit. A fixed branch order makes the assignment single-valued even when multiple branches qualify.

For even `d=8`, the local qualifying-branch polynomial is

`Q(z)=8 sum_{ell=4}^7 binom(7,ell) z^(ell+1)`.

The routed supply is exactly `[z^(p-1)](A(z)^m-(A(z)-Q(z))^m)`, because `h,v` use two vertices and branch states use the remaining `p-1` vertices. The replay gives this exact routed amount for each row. It also gives the full upper supply minus this amount, so the remaining demand is quantified, not hidden. The total lower capacity remaining after routing one unit per selected source is a lower bound because the routed destinations may have unused capacity beyond their incoming units.

## Cut test and scope

The pre-existing CB(8,92) neighborhood envelope is still inconclusive: its computed lower bound on the proposed cut deficit is negative, not positive. The same envelope applied to `CB(8,93),p=498` is also inconclusive. These numbers are in `EVIDENCE.json`. The two-for-one graph has additional arcs described above, so the old tag-closed deletion cut is not a cut certificate for the enlarged graph.

This work proves a bounded subfamily routing for two specified trees and reports exact full sums. It does not route the upper sets outside the `h,v` family or the `h,v` sources with no qualifying branch, does not establish a full weighted flow on either tree, and does not prove the aggregate for other trees. The exact negative sums support the primary inequality only on these two inputs; they do not settle it universally.
