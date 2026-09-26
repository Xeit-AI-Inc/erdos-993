# C2-SYNTHESIS evidence and source audit

## Pinned source checks

The packets were read first. A SHA-256 pass over their explicit `allowed_source_files` found 13/13 matching case files and 27/27 matching common files, with no missing or mismatched path. This pass did not treat hash-only file contents as premises. The permitted common `read_first` files were then read, followed by only the case-listed C2-AT, C2-AF and C2-AU adjudicator files. The case-listed C2-AU `REPAIR-A1-*` addendum is part of the effective U adjudication; it corrects, without rewriting, the sealed C2-AU return. No other worker files were opened.

Parsing the three adjudicator `RETURN.json` claim arrays gives respectively 7, 5 and 9 entries. Their unique union has 17 IDs and equals the packet's 17 `required_covered_claim_ids` exactly. The registered first-shell and primary IDs each occur in all three returns; every other required ID has one adjudicator source. The final `RETURN.json` has one disposition claim for each of these 17 IDs.

## Independent exact shell-order check

The append-only repair supplies the 18-vertex tree with center path edges `(0,1),(1,2),(2,3),(3,4),(4,5)` and leaf edges `(i,6+2i),(i,7+2i)` for `i=0,...,5`. At `p=8`, its pinned polynomial is

`[1,18,136,574,1519,2672,3216,2672,1519,574,136,18,1]`.

Its consecutive differences through the terminal rank are

`[17,118,438,945,1153,544,-544,-1153,-945,-438,-118,-17,-1]`.

Thus `alpha=12`, `x=6`, `x+2=8<=p`, `3p=24<25=2alpha+1`, and `|T|=18=2p+2`. For original leaf `v=6`, support `s=0`, `H=T-{0,6}` has 16 vertices and marks `w1=1,w2=7`. The literal definition is `J_i=H-(N_H[w_i] union earlier marks)`. From the edge list, `N_H[7]={7}`, so `J2=H-{1,7}` has 14 vertices, exactly `2k` for `k=p-1=7`. In particular vertices `2,8,9`, all neighbors of earlier mark 1 in H, survive in `J2`. This directly contradicts the original C2-AU assertion `|J_i|<=2k-1` for all later indices. It agrees with the repair's `i_6(J2)=479`, `i_7(J2)=250`, difference `-229`; the example has no positive `J2` difference.

A separate local script reconstructed the adjacency map from the pinned edge list and checked `|J1|=12`, `|J2|=14`, `H-J2={1,7}`, surviving earlier-root neighbors `{2,8,9}`, and the repair's twelve selected summands add to `-4256`. The script also checked the two numerical eligibility guards from the pinned `a,x,p`. This is a structural and arithmetic cross-check of one fixture, not a new full independent-set enumeration or a census.

## Exact proof dependencies and limits

- The graph marked-isolate order-band proof in `REPORT.md` uses actual addability, not an alpha proxy. Its count of (C) is once per multiply marked upper set. The integer boundary injection requires (k\ge2). The leaf corollary uses only the original support/neighborhood and the fact that each isolate of the deletion forest neighbors that support in the original tree.
- The shell residual correction follows from the literal `J_i` set deletion. The elementary shadow inequality is applied only for residual order at most (2k-1), with zero-extension handled when the layers are absent. The two possible order-(2k) residuals must both be budgeted. The first-wide classification, when mentioned, is the exact registered graph theorem at `r=k-1`; it supplies no full-sum inequality.
- The C2-AF F3 generator correction is an order count: a rooted type of total weight (2p) has child branches of total weight (2p-1), and `make_tree` adds support and distinguished leaf. Therefore its output order is (2p+1). Its eligible-row maxima do not conflict with the actual first-shell censuses.
- The C2-AF order-14 and order-16 complete-tree results remain dependent on the adjudicated centroid generators and finite subset replays. The synthesis did not rerun those generators. The negative order-91/order-92/order-239/order-262, extension-pair, and fresh larger controls are finite examples only. A positive local selected summand in such a row cannot refute a negative complete sum.
- The global weighted-rank, flow/cut, relative-chain, pendant recurrence and fixed-(p) state identities are exact reductions or evaluation devices. None supplies the missing selector-conditioned compensation inequality. The primary and first-shell universal statuses are proposed open.
