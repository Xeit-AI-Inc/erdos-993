# C4-U2 — marked-shell reduction and its cutoff

## Result

I obtain a reusable **conditional pointwise shell reduction**. Let `T` be an ordinary tree with `n(T)=2p+s`, `p>=3`, and let `v` be any original leaf with support `u`. Put `H=T-{v,u}`, `W=N_T(u)\{v}`, `R=H-W`, and `k=p-1`. If

`tau(T) >= ceil(3s/2)+1`, with `s>=2`, and with the residual rank condition `p-2>=K(d)` for every first-mark block having `d>=3`,

then the selected leaf contribution is nonpositive:

`Delta_k(H)-Delta_k(R) <= 0`.

Thus on this shell, whenever the cover threshold holds for `T`, it proves the desired sum for **any** fixed subset of original leaves, including the favorable selector (same-support leaves remain separate). It does not prove that threshold for every eligible tree and therefore does not settle the registered aggregate.

## Marked-shadow lemma

For a forest `H` with marked set `W` meeting every component, assume at least one marked vertex is non-isolated. For `j>=1`, let `q_j` count independent `j`-sets meeting `W`. Order the non-isolated marks first, then the other marks. Assign each counted set to its first mark `w_i`. Its remaining `j-1` vertices form an independent set in

`J_i = H - (N_H[w_i] union {earlier marks})`.

This is a disjoint partition, so `q_j = sum_i i_(j-1)(J_i)`. Write `ell_i` for the number of deleted vertices. The first block has `ell_i>=2` because `w_i` has a neighbor. Every later block deletes the closed neighborhood of its mark and contains at least one earlier mark, so also `ell_i>=2`. The non-isolated marks ensure that the first block exists before any isolated marked singleton blocks.

Every edge of `H` outside `J_i` has an endpoint in the deleted set other than `w_i`. Adding those at most `ell_i-1` deleted vertices to a vertex cover of `J_i` covers `H`; hence

`tau(J_i) >= tau(H) - (ell_i-1)`.

Because `J_i` is a forest, `tau(J_i)=nu(J_i)`. If each residual graph has `Delta_(j-1)(J_i)<=0`, summing the block inequalities gives `q_j<=q_(j-1)`. Take `j=k+1=p` to obtain `q(k+1)<=q(k)`. Since `q(t)=i_t(H)-i_t(R)`, this is exactly

`Delta_k(H)-Delta_k(R)=q(k+1)-q(k)<=0`.

For the leaf specialization, `alpha(H)=alpha(T)-1`, equivalently `tau(H)=tau(T)-1`; the latter also follows directly by swapping a leaf in a cover for its support. Thus the assumed parent bound gives `tau(H)>=c`, where `c=ceil(3s/2)`. As `c>=3` for `s>=2`, `H` has an edge and the tree structure ensures `W` contains a non-isolated mark and meets every component: each component of `H` attaches to the removed support through a vertex of `W`.

## Residual matching thresholds and exact boundary cases

Here `|H|=2k+s`. A block deleting `ell>=2` vertices has

`|J|=2r+d`, `r=k-1=p-2`, `d=s+2-ell`.

The parent cover budget `tau(H)>=c` pays for every residual large-rank matching requirement. For `d>=2`, put `m(d)=ceil(3d/2)-1`. The cover-loss inequality gives

`tau(J) >= c-(ell-1) >= m(d)`,

because with `t=ell-2`, `ell-1+m(d)=t+ceil(3(s-t)/2)<=ceil(3s/2)=c`. This uses the forest identity `tau(J)=nu(J)` and the already admitted r25 matching result: a matching of size at least `m(d)` forces `Delta_r(J)<=0` when `r>=K(d)=2m(d)-d`.

The residual cases are exact:

- `d<=1`: `|J|<=2r+1`; the ordinary independent-set shadow double count gives `i_(r+1)(J)<=i_r(J)` without a matching hypothesis. Each upper independent set has `r+1` lower subsets, and each lower set has at most `|J|-r<=r+1` extensions.
- `d=2`: `m=2`, `K=2`; the exact two-edge first-wide result supplies the boundary, including `r=1` where the generic `r>=K` hypothesis would not apply. For `r>=2`, the generic theorem also applies.
- `d>=3`: use the r25 matching theorem with both conditions `nu(J)>=m(d)` and `r>=K(d)`. The cover-loss calculation supplies the first; the second is an explicit rank condition, not a consequence of cover loss. On the intended tree shell `r=p-2`; where it fails, this reduction has a genuine residual rank case.

The shell-specific prepared applications through `s=4` meet the rank conditions in their stated ranges: `s=2` has parent threshold `4`, `s=3` threshold `6`, and `s=4` threshold `7`. For `s=4`, the generic cover-exclusion path does not cover every rank: the audited high-rank result begins at `p>=14`; `p=6..9` has separate finite-degree bounds, while `p=10..13` is the exact low-cover residual window. A six-cover tree exists there, so raising the cover threshold uniformly is false. The supplied order-24 witness has `p=10`, `x=8`, `alpha=18`, `tau=6`, and full favorable sum `-122805`; it defeats only the proposed `tau>=7` cover exclusion, not the shell inequality or primary aggregate.

## Why this does not extend automatically to `s=5`

The standard cover-Catalan estimate for a tree of order `2p+s` with a cover of size `c` is

`Delta_q(T) >= binom(N,q+1)-binom(N,q) - sum_(a=1)^min(c,q) binom(c,a) Cat_(q-a)`,

where `N=2p+s-c` is the independent complement of an extended `c`-cover. This follows by partitioning independent sets by their intersection `X` with the cover. The empty fiber contributes the displayed binomial difference; every nonempty fiber is a shifted binomial sequence whose rank difference is at least `-Cat_(q-|X|)` (with zero extension at out-of-range ranks).

To exclude `tau(T)<=c`, the argument needs this lower bound positive at every `q<=p-2`, contradicting `x(T)<=p-2`. For `s=5`, `c=ceil(15/2)=8` and at the terminal rank `q=p-2`, the outside size is `N=2p-3=2q+1`. Therefore the empty-fiber binomial difference is **exactly zero**, while the `a=1` Catalan floor is `-8 Cat_(q-1)<0` for `q>=1`. The bound is negative already at that first subtraction and cannot establish cover exclusion. This is an obstruction to this estimate, not evidence that the shell claim fails. It explains why automatic shell extension stops at `s=5`; additional tree-skeleton or aggregate information is needed.

## Evidence grade and gaps

The marked partition and cover-loss argument above are direct proofs. The matching implications are applications of the exact r25 theorem and the exact `d=2` first-wide result identified in the admitted matching-threshold/source notes; they are only used at the displayed hypotheses. The shell thresholds and rank windows for `s=2..4` are inherited scoped preparations, not a proof of the cover-exclusion step in every rank by this report. No bound is proved here for all eligible trees of shell `s>=5`, and no conclusion about the global lower-region aggregate follows when the cover threshold fails. The `s=4`, `p=10..13` low-cover window remains the concrete next finite residual; an exhaustive census would need the six-cover skeleton completeness argument specified in the common low-cover note before any enumeration.

## Authorized sources consulted

`SOLUTION-CONTRACT.md`, `WORKER-PROTOCOL.md`, `EXECUTION-POLICY.md`, `control/C4-NEUTRAL-HANDOFF.md`, `control/C4-INTAKE-RECONCILIATION.md`, `control/C4-SEARCH-ALLOCATION.json`, `control/C4-GENERAL-SHELL-MATCHING-THRESHOLD.md`, `control/C4-THIRD-SHELL-LOW-COVER-REDIRECTION.md`, `control/C4-THIRD-SHELL-SMALL-RANK-FOLLOWUP.md`, `control/C4-FIRST-SHELL-REGISTRATION-ORDER-ADDENDUM.md`, `control/C3-FIRST-SHELL-CANDIDATE.md`, `control/C3-RANK7-COMPOSITION.md`, `inputs/C4-prior-theorem-intake/r25-MATCHING-LARGE-RANK-SECOND-READ.md`, and the listed r25 source pin, prior verification, and frozen Lean source. The source packet hashes were verified before use.
