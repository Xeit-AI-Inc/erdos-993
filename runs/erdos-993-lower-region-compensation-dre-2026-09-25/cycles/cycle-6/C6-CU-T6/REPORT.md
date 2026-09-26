# C6-CU-T6 independent critique (orientation U)

## Packet and scope

The case and common packet hashes verified against all listed files: 12/12 case entries and 237/237 common entries. I reviewed the only required producer claim, `C6-T6-EQUAL-THREE-SPIDER-REDUCTION`, and the two separately attributed root-origin candidates listed in the appendix index. Those root appendices were added after the producer intake; none is attributed to C6-T6.

## Producer claim disposition: retained

The exact graph formulas are correct for the equal-arm length-three spider `S_m` (`m>=2`). Root exclusion/inclusion gives

`P_m=Q^m+zV^m`, where `Q=1+3z+z^2` is the independence polynomial of a three-vertex path and `V=1+2z` is that of an edge. The order is `3m+1`, and `alpha=2m`: root-excluded arms can each contribute two vertices, while root inclusion permits only `1+m<2m` vertices for `m>=2`.

Deleting a tip gives `A_m=VQ^(m-1)+z(1+z)V^(m-1)`. For its original support `b_i`, `H_i=S_m-{b_i,c_i}` has polynomial `(1+z)Q^(m-1)+zV^(m-1)` and `R_i=S_m-N[b_i]` has `Q^(m-1)+zV^(m-1)`. Thus `I(H_i)-I(R_i)=zQ^(m-1)`, so the original tagged summand at rank `p` is `Delta_(p-2)(Q^(m-1))`. Summing over any selected endpoints multiplies this same term by the selected endpoint count; if all `m` are selected it is exactly the producer's formula.

I reran copies of the producer replay and the authorized tree evaluator from this scratch directory. The integer replay covers `m=2,...,60` (59 profiles, 532 eligible `(m,p)` rows), and the literal tree-DP cross-check covers `m=2,...,8`. The `m=6,p=8` witness satisfies `alpha=12`, `x=6`, `p=x+2`, and `24<25`; all six original leaves are favorable, each term is `-355`, and the complete sum is `-2130`. The injection replay checked 7,851 lower-rank sets for `m=2,...,6`, `0<=j<m`. These are finite checks only. The producer explicitly leaves the uniform crossing and selector inequalities unproved, so its claim remains `proposed_open`; no family theorem or arbitrary-tree conclusion is carried from the bounded range.

## Derived root-origin claim: `C6-ROOT-SPIDER-EXACT-MODE` — retained

The elementary coefficient proof establishes the exact mode for every `m>=2`, with strict increase through rank `m` and strict decrease from rank `m` through the terminal nonzero coefficient at `2m`.

First, `C^d=(1+z+z^2)^d` is symmetric and weakly increasing through its center. With zero extension, the induction identity

`Delta_t(C^(d+1))=Delta_t(C^d)+Delta_(t-1)(C^d)+Delta_(t-2)(C^d)`

proves nonnegativity for `t<d`; at `t=d`, symmetry cancels the first two terms and leaves `Delta_(d-2)(C^d)>=0`. This includes `d=0` and negative indices.

Since `Q=C+2z`, expand `Q^m=sum_s binom(m,s)2^s z^s C^(m-s)`. For `1<=j<m`, every term in `Delta_j(Q^m)` is nonnegative. The `s=j-1` term contributes at least `b_j=2^(j-1)binom(m,j-1)`, because `Delta_1(C^(m-j+1))=binom(m-j+1,2)>=1`. Writing `b_j=[z^j](zV^m)`, this gives `Delta_j(P_m)>=b_(j+1)>0`; also `Delta_0(P_m)=3m+1>0`. Hence `x(P_m)>=m`.

The same expansion shows `Q^e` strictly increases for `0<=j<e`: the `s=j+1` term contributes positively through `Delta_(-1)(C^(e-j-1))=1`. By symmetry it strictly decreases for `e<=j<2e`, including `j=e`, and `Delta_(2e)=-1`. Apply this with `e=m`: for every `m<=j<=2m`, `Delta_j(Q^m)<0`. The perturbation `zV^m` has nonpositive differences at `j=m` (equal to `2^(m-1)(2-m)`), `j=m+1` (equal to `-2^m`), and zero thereafter. Therefore `Delta_j(P_m)<0` for `m<=j<=2m`. Together the signs prove a unique mode at `m`, not just weak unimodality. This proof uses no imported convolution or real-rootedness result.

## Derived root-origin claim: `C6-ROOT-SPIDER-LOWER-REGION-AGGREGATE` — retained

Here `x=m` and `alpha=2m`, so eligibility is exactly `m+2<=p<=floor(4m/3)`. This interval is empty for `m<=5` and nonempty for `m>=6`. For an eligible rank, let `e=m-1`. Then `p-2>=m>e`, and both ranks `p-2,p-1` lie in the strictly decreasing supported tail of `Q^e`; consequently each original leaf summand

`[z^(p-1)]Q^e-[z^(p-2)]Q^e`

is strictly negative.

All original leaves are selected. The extra term `z(1+z)V^e` in `A_m` has degree `m+1<p`; therefore `Delta_p(A_m)=Delta_p(VQ^e)=Delta_p(Q^e)+2Delta_(p-1)(Q^e)<0`. Both differences are negative throughout the eligible interval (indeed `p<=floor(4m/3)<=2m-1`, and the `Q^e` support ends at `2m-2`). There are exactly `m` original leaves `c_i`, each tagged by its own original support `b_i`; none is omitted or merged. The full fixed-selector sum is therefore exactly `m Delta_(p-2)(Q^e)<0`.

The alternative product-chain injection also passes review as an independent proof of the weaker crossing bound `x>=m`. Each root-excluded rank-`j` set is in a block labeled by its singleton `b_i/c_i` arms; its remaining arm states form `{0,1,2}^d`. The rectangular chain decomposition gives a symmetric-chain decomposition of this product, hence an injective successor below its center. In the exceptional block with `j-1` fixed labels and rank one, the `d>=2` singleton states map to distinct pairs and avoid the reserved pair used by the root-included map. Root-included sets map injectively to that reserved pair in the same fixed-label block. Images from distinct fixed-label blocks cannot collide. Finally, a root-excluded set of `j+1` distinct `b/c` singletons exists for every `j<m` and is outside every image, proving strict coefficient growth. The finite injection replay is corroboration, not the all-`m` proof.

## Literature scope and limits

Kaixin Wang, [*Unimodality of Independence Polynomials of Special Trees*](https://nhsjs.com/wp-content/uploads/2022/08/Unimodality-of-Independence-Polynomials-of-Special-Trees.pdf) (NHSJS, 2022), Proposition 1 gives the same root-conditioned spider-polynomial form. Theorem 2(i) treats spiders with `m` length-three legs and `k` length-two legs when `k<=m`; at `k=0` it already states unimodality and mode `m` for this all-length-three family at every positive `m`. Theorem 5 separately gives a special-case proof for `m>100`, but is not the paper’s full scope for the mode claim. Thus the root exact-mode conclusion is known in this literature; the self-contained coefficient argument here is an independent derivation, not a novelty claim. Neither result establishes the selected aggregate. Lei Zhang and Jianhua Tu, [*Stability of independence polynomials of spiders*](https://arxiv.org/abs/2609.04694) (arXiv:2609.04694, submitted 4 September 2026), concerns root location for arbitrary spiders; stability supplies no coefficient-mode or selector bridge used here. Neither paper is imported as a premise. The elementary arguments above are self-contained and make no novelty or priority claim.

The two derived claims concern only this equal-length-three spider family. They do not prove the registered lower-region aggregate for arbitrary ordinary trees, establish a general rooted-branch result, or supply an ordinary-to-governed bridge. No Lean or external theorem import was used. I found no mathematical defect in the reviewed candidate proofs; unreviewed scopes are not treated as refuted.
