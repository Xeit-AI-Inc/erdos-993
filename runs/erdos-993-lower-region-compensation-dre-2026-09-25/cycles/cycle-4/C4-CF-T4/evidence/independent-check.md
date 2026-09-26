# Independent critique evidence: C4-T4

## Pin and scope check

The case packet pins `cycles/cycle-4/C4-T4/{EVIDENCE.json,REPORT.md,RETURN.json}` to SHA-256 values `b978359a6ff18f0e61e10041034ccbdbe6f6a843c1a2f502feafe1ba7e720534`, `9391023bbde03fffcc9e74fc1e91b9d586bb52a5f270604bcc3510fd2c785f02`, and `e921ea09e1390bb50dd37613992592ad85235e776b9e65c4c2b83de6d50dedc2`; all matched. All 179 common packet source hashes also matched. This audit used the exact case and common read-first/control files only; sealed route files were copied verbatim into `evidence/source-copies/` before inspection.

The target domain is an ordinary finite tree, fixed strict selector `F(T,p)`, `x(T)+2<=p`, and `3p<2a+1`. Each original favorable leaf remains a separate tag, even when support vertices coincide. Set `k=p-1`; then `k>=x+1>=1`, and the target rank is valid under integer zero extension.

## C4-T4-RELATIVE-CHAIN-IDENTITY

**Disposition: retained.** For each fixed tag `v`, `R_v=H_v-W_v` is the induced subgraph obtained by deleting `W_v`. Thus independent `j`-sets of `H_v` not meeting `W_v` are exactly independent `j`-sets of `R_v`. The relative face basis is therefore in bijection with the independent `j`-sets of `H_v` meeting `W_v`, and its dimension is `q_v(j)=i_j(H_v)-i_j(R_v)`. The disjoint tagged direct sum has dimension `sum_{v in F}q_v(j)`; this remains correct if `F` is empty or tags share a support.

For each original leaf, expand the contract summand:

`Delta_k(H_v)-Delta_k(R_v) = [i_{k+1}(H_v)-i_k(H_v)]-[i_{k+1}(R_v)-i_k(R_v)] = q_v(k+1)-q_v(k)`.

Summing over the unchanged fixed selector gives `S=dim(K_{k+1})-dim(K_k)=dim(K_p)-dim(K_{p-1})`. No selector is recomputed, and no overlap correction is needed because tags are distinct summands. This is an exact identity, not a sign proof.

## C4-T4-CROSS-TAG-INJECTIVITY-BRIDGE

**Disposition: retained_narrowed.** The stated universal injectivity is not established. What is established is that the displayed rule defines a rational linear map `L:K_p -> K_{p-1}`: for each deletion `B`, either it retains `v` when `B` meets `W_v`, transfers to the least eligible tag among the finite set `F`, or omits the term. Any emitted pair satisfies the destination basis conditions by the rule. The fixed order makes the output unambiguous. Since `k>=1`, the domain rank is well formed. The rank-difference identity means injectivity would suffice for `S<=0`, but is strictly stronger than the target.

The route explicitly reports no proof of `rank_Q(L)=dim(K_p)` and no counterexample. Its acknowledgment that different columns may collide does not decide injectivity: collisions can cancel or be offset by other columns, and noninjectivity alone would not imply a positive dimension difference. No matching certificate, full-rank minor, or global compensation argument is supplied. Accordingly this audit does not assert that universal injectivity is false; it narrows the retained content to well-definedness and the conditional implication, leaving universal injectivity open.

## Checks and limitations

Checked from the pinned route files: the map uses the fixed original-leaf selector; it preserves each original leaf as a separate tag when its mark remains and uses only tags in `F` on transfer; its outputs lie in the specified codomain. The algebraic identity was derived independently above. No graph enumeration, numeric example, or external theorem was needed or claimed. This critique does not replay the candidate operator on examples and does not resolve its universal rank. The primary aggregate therefore remains unresolved by this route.
