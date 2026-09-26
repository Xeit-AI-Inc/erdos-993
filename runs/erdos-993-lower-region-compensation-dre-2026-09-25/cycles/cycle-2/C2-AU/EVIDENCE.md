# C2-AU evidence and replay notes

All 49 files in `packets/C2-AU.json` and all 27 files in `packets/C2-COMMON.json` matched their listed SHA-256 digests before substantive review. Only those exact listed files were used as premises; the two packet files supplied the inventory. The nine source claim IDs are the unique union of claims in the 18 listed route/critic returns.

## Independent exact replay of the pendant pair

Use the SHA-256-pinned common evaluator `inputs/ordinary_tree_checked.py` (`a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d`). Construct the tree on `range(18)` from center edges `(i,i+1)` for `i=0,...,4` and leaf edges `(i,6+2*i)`, `(i,7+2*i)` for `i=0,...,5`. For the second tree, add vertex 18 and `(10,18)`. Set `p=8`.

For each tree, compute its `forest_independence_polynomial`; scan `delta(poly,j)` for `j=0,...,degree(poly)` to include the terminal zero-extended difference. For **each** current leaf v, evaluate `delta(I(T-v),8)` and retain it only if strictly negative. For each retained v, get its original support s and compute `delta(I(T-{v,s}),7)-delta(I(T-N_T[s]),7)`. Sum every selected tag, including leaves sharing a support. This is an exact pair replay, with no random seed and no enumeration claim.

The resulting base/extension `(n,alpha,x,number of selected leaves,S)` rows are `(18,12,6,12,-4256)` and `(19,12,6,12,-6267)`. The complete coefficient vectors, terminal differences, strict selector values, support lists, individual summands, and guards are in `REPORT.md` section 6. The fresh evaluation agreed with the route and both critics. The example is a witness to **change** of tags and aggregate, while both sums remain nonpositive.

## Decisive local checks in disputed proof text

1. In the marked extension count, an upper independent `(k+1)`-set with exactly one mark has `k` marked-preserving deletions. The single deletion of its marked vertex loses the mark. Hence `k*q_(k+1)+C=(m-k)*q_k-B` is correct despite reversed explanatory prose in parts of C2-U2/C2-CF-U2.
2. In the U3 first-mark partition, `J_2=H-(N_H[w_2]∪{w_1})`. If `w_2` is isolated and w1 is nonisolated, this removes `w_2`, `w_1`, and at least one neighbor of w1. Thus `|J_2|<=|H|-3=2k-1`, not `2k`; an isolated second mark cannot give the claimed second positive boundary. The corrected `L_root/k` bound and sufficient global Comp-root inequality are in `REPORT.md` sections 3–4.
3. In U4, the cut for the entire upper layer has right side `sum_(A∈N_-(I_(p+1)))w_F(A)`. The scalar S inequality uses `sum_(A∈I_p)w_F(A)`. Equality of these right sides needs a separate zero-weight claim for nonextendable lower sets, which none of the sources proves. The flow/cut equivalence and sufficiency survive.
4. For U5's residual graph after extending leaf u by w, if u is deleted as a neighbor of old support s, w survives as an isolate. If u=s, the new closed neighborhood deletes w too. These are the corrected recurrence cases carried in `REPORT.md` section 6.
