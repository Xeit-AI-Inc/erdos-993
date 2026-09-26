# Controller candidate: length-three spider via a disjoint rank injection

Discovered during Cycle6 search, after its common packet was frozen. This file is NOT a permitted search premise, not an award, and not a claim by a worker. It resolves the disjoint-image gap in the earlier nonstar lead if the proof below survives independent review. Preserve the search packet and producer outputs; admit any use only as an explicitly attributed controller appendix before the relevant critiques, with independent review and full origin adjudication/synthesis. Otherwise retain as unawarded final lead. No seventh cycle is authorized.

Let S_m have a root r and m disjoint arms r-a_i-b_i-c_i, m>=2. Original leaves are exactly c_i. Set Q=1+3z+z^2, V=1+2z, L=1+z. Root exclusion/inclusion gives P=Q^m+zV^m, n=3m+1 and alpha=2m. A leaf deletion gives A=VQ^(m-1)+zLV^(m-1). For each original leaf, direct support/neighborhood subtraction gives q_i=zQ^(m-1). These formulas require independent graph checks.

## Elementary product-chain fact

The product {0,1,2}^d, ranked by coordinate sum, has a symmetric chain decomposition about rank d. Here is an inductive construction, so no external SCD theorem is needed. A rectangular product of chains of lengths a,b, assume a>=b, partitions into chains indexed t=0,...,b:
(0,t),(1,t),...,(a-t,t),(a-t,t+1),...,(a-t,b).
Each starts at rank t and ends at a+b-t. The rows remaining after removing the first bottom-and-right boundary form the next smaller rectangle, proving disjoint coverage. Swap coordinates when a<b. Inductively multiply each symmetric chain by {0,1,2}; the rank offset preserves the common midpoint. Thus at every rank t<d, going to the next element in its symmetric chain injects rank t into rank t+1.

## Inject all independent j-sets into (j+1)-sets for0<=j<=m-1

For a root-excluded independent set, each arm is one of empty,a_i,b_i,c_i,{a_i,c_i}. Fix exactly which arms carry the singleton b_i or singleton c_i, including those labels. Let their number be s. On the remaining d=m-s arms, the states empty<a_i<{a_i,c_i} form {0,1,2}^d. A total j-set has rank t=j-s<d because j<m. Use the product-chain injection within this block, except in the special blocks s=j-1,t=1, treated below. The block labels (fixed b/c arms) are preserved, so images from different blocks cannot collide.

A root-included j-set, j>=1, has r and j-1 distinct b/c singletons, with all remaining arms empty. In its fixed b/c block d=m-j+1>=2. Let i0 be the least empty arm. Delete r and add {a_i0,c_i0}. This produces a root-excluded(j+1)-set with exactly one double arm and the same fixed b/c singletons. This map is injective: the unique double arm and the fixed b/c labels recover the preimage.

Reserve precisely that image in the matching root-excluded block s=j-1,t=1. Let i1 be the second empty arm. Instead of the generic chain injection, send singleton a_i to pair {a_i,c_i} for i!=i0, and send singleton a_i0 to {a_i0,a_i1}. These d images are distinct, valid independent sets, and all avoid the reserved pair {a_i0,c_i0}. Both maps are injective inside the block, and their images are disjoint. All other blocks use the generic chain map. At j=0 there is no root-included source and no exceptional block.

Moreover, root-excluded(j+1)-sets consisting only of b/c singletons are outside every image: their block has s=j+1, which no root-excluded j-source has; root-included images have s=j-1 and a double arm. Such sets exist because j+1<=m. Therefore i_(j+1)(S_m)>i_j(S_m) for every0<=j<=m-1. Hence x(S_m)>=m, without the general forest bound.

## Complete eligible sum

If x+2<=p and3p<2alpha+1=4m+1, then p>=m+2 and p<=floor(4m/3). Thus m>=6 for any eligible rank. For e=m-1, the product of e independent P3 branches has the same blockwise symmetric chain decomposition about rank e. Its rank counts are the coefficients of Q^e. For each0<=j<e there is a chain starting at rank j+1: fix exactly j+1 singleton b/c arms and take the full chain starting at the minimum in the remaining product {0,1,2}^(e-j-1). Thus the number of chains starting at j+1 is positive; symmetry of all chains gives [z^(j+1)]Q^e>[z^j]Q^e. Consequently Q^e is symmetric and strictly unimodal, hence strictly decreasing beyond its center e=m-1. This uses the same elementary product-chain construction, with no ULC, real-rootedness or external convolution theorem. All relevant ranks p-2,p-1 are in the supported decreasing tail. Therefore each original leaf term equals [z^(p-1)]Q^(m-1)-[z^(p-2)]Q^(m-1)<0. This alone proves S<=0 for any strict-selector subset.

In fact all original leaves are selected. The perturbation zLV^(m-1) has degree m+1, so contributes zero at p and p+1. For p>=m+2, Delta_p(VQ^(m-1))=Delta_p Q^(m-1)+2 Delta_(p-1)Q^(m-1)<0 throughout p<=floor(4m/3)<=2m-1, including any terminal zero extension. Thus S(S_m,p)=m([z^(p-1)]Q^(m-1)-[z^(p-2)]Q^(m-1))<0 at every eligible rank. Check endpoint inequalities and strictness independently.

A root polynomial check at m6 gives n19,alpha12,x6,p8, every selector delta-550, every term-355, fullS=-2130. See C6-NONSTAR-SPIDER-INJECTION-FIXTURE.json. This lies beyond the already formal n<=2p+2 band (19>18), so the family is not merely a restatement of that band. The check is not an independent graph enumeration. Scope is length3 equal-arm spiders m>=2 only, no arbitrary rooted branches, all trees, or governed bridge. No Lean certificate or novelty claim.
