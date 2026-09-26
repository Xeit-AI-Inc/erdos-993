# C6-CF-T6 independent critique

## Scope and disposition

The packet hash audit matched all 12 case pins and all 237 common pins. The copied `ordinary_tree_checked.py` used in the replay also matches its common source pin.

**Disposition for `C6-T6-EQUAL-THREE-SPIDER-REDUCTION`: retained_narrowed.** The producer's formulas and bounded evidence are correct. The root-origin appendices, assessed separately from the producer return, supply a valid all-`m` proof for the equal-length-three spider family. The revised scope is exactly `S_m` with root `r` and `m >= 2` arms `r-a_i-b_i-c_i`; it does not cover arbitrary trees, unequal spiders, or a broader rooted-branch class. The universal spider result is elementary and does not depend on the producer's census.

The case requires coverage of only the producer ID `C6-T6-EQUAL-THREE-SPIDER-REDUCTION`. I preserve that ID and its disposition. The two root-origin identities below are additional derived claims; they do not alter `covered_claim_ids`.

## Root-origin candidate: elementary coefficient proof

Write `Q=1+3z+z^2`, `V=1+2z`, `L=1+z`, and let `C=1+z+z^2`. Graph conditioning gives

- `P_m=I(S_m)=Q^m+zV^m`,
- `A_m=I(S_m-c_i)=VQ^(m-1)+zLV^(m-1)`, and
- `I(H_i)-I(R_i)=zQ^(m-1)`, where `H_i=S_m-{b_i,c_i}` and `R_i=S_m-N[b_i]`.

The identities follow by splitting on whether the root is selected, and on whether the remaining `a_i` pendant vertex is selected after deleting `b_i,c_i`. The original leaves are exactly the `m` distinct vertices `c_i`; their original supports are `b_i`. Thus no leaf-tag collapse occurs.

The weak-unimodality induction for `C^d` works at every zero-extended integer rank `t<d`. For `t<=d-1`, expand `Delta_t(C^(d+1))` into the three shifted differences. At `t=d`, symmetry gives `Delta_d(C^d)=-Delta_(d-1)(C^d)`, so those two terms cancel and the remaining term is nonnegative. The base `d=0`, including negative ranks, is valid.

Using `Q=C+2z`, for `1<=j<m` all shifted differences in the binomial expansion of `Delta_j(Q^m)` are nonnegative. The term `s=j-1` contributes at least `binom(m,j-1)2^(j-1)`, exactly the coefficient `b_j` of `z^j` in `zV^m`. Hence `Delta_j(P_m)>=b_(j+1)>0`; at `j=0`, `Delta_0(P_m)=3m>0`. This proves no descent before `m`.

For `Q^d`, the same expansion has a strictly positive term at `s=j+1` for each `0<=j<d`, since `Delta_-1(C^k)=1`; all other terms are nonnegative. Symmetry therefore makes `Q^d` strictly decreasing on its upper supported half, including `Delta_(2d)<0` under zero extension. Taking `d=m`, the perturbation `zV^m` has nonpositive difference at `j=m`, negative difference at `j=m+1`, and zero difference thereafter. Thus `Delta_j(P_m)<0` for `m<=j<=2m`, and `x(S_m)=m` exactly. There is no omitted terminal rank or false assertion that `Delta_(2m+1)<0`; it is zero.

## Selector and full original sum

For `alpha(S_m)=2m`, the exact eligibility window is

`m+2 <= p <= floor(4m/3)`.

It is nonempty exactly when `m>=6`. Put `e=m-1`. Then `e < p-2 <= 2e-1`, so strict decrease of `Q^e` gives, for each original endpoint,

`Delta_(p-1)(zQ^e)= [z^(p-1)]Q^e - [z^(p-2)]Q^e < 0`.

The deletion perturbation `zLV^e` has degree `m+1<p`, so contributes zero to `Delta_p(A_m)`. Also

`Delta_p(VQ^e)=Delta_p(Q^e)+2Delta_(p-1)(Q^e)<0`.

When `p=2e+1`, the first term is the zero-extension value `0` and the second is `-1`; the sum remains strictly negative. (The eligible window here is in fact at most `2m-1`.) Thus all `m` original endpoints are selected, and the full selector sum is `m` times the negative per-leaf term. The fixed selector and distinct original tags are preserved. This proves a spider-family theorem, not the registered arbitrary-tree primary.

## Alternative disjoint rank injection

I separately checked the root-origin injection. A root-excluded independent set is uniquely a block of fixed b/c singleton labels plus states from `{empty,a_i,{a_i,c_i}}` on the other arms. These are ranked product states in `{0,1,2}^d`. The stated rectangle decomposition partitions each two-chain rectangle into symmetric chains; induction over coordinates gives a symmetric-chain partition of the product and a rank-successor injection below its center.

The only image collision with a root-included source can occur in a block with `s=j-1` fixed singleton labels and rank `t=1`. There are `d=m-j+1>=2` free arms. The root-included set maps to the reserved pair `{a_i0,c_i0}` on the least free arm. Root-excluded singleton states map either to `{a_i,c_i}` on another arm or, for `i0`, to `{a_i0,a_i1}`. These images are distinct and avoid the reserved pair. Fixed labels identify the block, so different blocks do not collide. Finally, a `(j+1)`-set consisting only of b/c singletons exists since `j+1<=m`; its `s=j+1` block cannot be an image of a rank-j root-excluded set, and it is not a root-included image, which has a double arm. This supplies strict surplus and proves `x>=m` for the same family. I found no remaining disjoint-image gap. The elementary coefficient proof independently proves the stronger `x=m`, so the injection is corroborative rather than necessary to the aggregate conclusion.

## Replays, errors, and literature scope

I reran the m=6 graph recipe with a copy of the pinned ordinary-tree evaluator in this scratch root. It gives order 19, alpha 12, x 6, `p=8`, all six original leaves selected, pointwise selector difference `-550`, each aggregate summand `-355`, and full `S=-2130`. The conditioned graph polynomials and each `H_i-R_i=zQ^5` also match. A separate literal injection replay checks all 20 rows with `2<=m<=6` and `0<=j<m`; this is finite corroboration only. Reproduction: run `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 REPLAY.py` and `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 REPLAY_INJECTION.py` from this worker directory.

No mathematical defect was found in the root coefficient proof, graph bridge, endpoint arithmetic, or alternative injection. The producer's original bounded conclusions remain bounded at `2<=m<=60`; that census itself is not a uniform proof. The root-origin appendix supersedes its stated open crossing/selector gaps only for the equal-length-three family. The lead's older injection gap is resolved by the separate reserved-image construction.

The pinned literature-provenance note reports that Kaixin Wang, *Unimodality of Independence Polynomials of Special Trees* (2022), Theorem 5, treats the same polynomial's unimodality and mode `m` for `m>100` ([paper PDF](https://nhsjs.com/wp-content/uploads/2022/08/Unimodality-of-Independence-Polynomials-of-Special-Trees.pdf)); that is an overlap for the mode statement, not a proof of the `m>=2` result or the selector aggregate. I did not independently retrieve or rely on that paper. The note also cites Lei Zhang and Jianhua Tu, *Stability of independence polynomials of spiders* (2026, v1; [arXiv record](https://arxiv.org/abs/2609.04694v1)), on abstract-only review; no stability-to-unimodality inference is used. No imported theorem is needed here. Accordingly, no novelty or priority claim is made.

## Limitations

- No result is established for arbitrary ordinary trees, unequal spiders, general rooted branches, or governed `RTree` interpretations.
- The producer's `m=2..60` census and the independent m=6 / injection replays are bounded checks, not the all-`m` proof.
- The cited literature provenance was not independently retrieved; all accepted mathematics is proved in the reviewed elementary arguments.
- No Lean proof or formal certificate was reviewed.
