# C4-CT-F6 critique (orientation T)

## Disposition

**C4-F6-LOW-COVER-SHELL-FAMILY-CHECK — retained.** The exact bounded statement in the source return is reproduced. The result is specific to the stated root-with-positive-pendant-arms family and does not resolve a universal tree statement.

## Independent audit

All 185 unique hashes listed across the case and common packets matched. I read the required common scope files, the C4 critic brief, and the six case-listed files only.

I derived the branch polynomial directly. For arm sizes `m_1,...,m_c` and `L=sum m_i`, put `A_m(z)=(1+z)^m+z`. The root-excluded term is `prod_i A_{m_i}`; the root-included term is `z(1+z)^L`. Thus

`P_T(z)=prod_i A_{m_i}(z)+z(1+z)^L`.

For deletion of one pendant leaf on arm `j`, replace `A_{m_j}` by `A_{m_j-1}` in the root-excluded product and use `z(1+z)^(L-1)` for the root-included term. For `H=T-{v,s_v}`, the other arms retain their `A` factors, the `m_j-1` remaining leaves on arm `j` are isolated, and the root-included term is `z(1+z)^(L-1)`. For `R=T-N[s_v]`, only the other rooted arms remain, giving the product of their `A` factors. These formulas use integer polynomial arithmetic and zero-extended differences.

I enumerated all sorted positive partitions in the stated boundary and reconstructed the graph degrees. The partition counts are 199, 279, 384, and 517 for `p=10,11,12,13`; the strict lower-region guard holds for every candidate. The `x+2<=p` guard holds exactly once, at `p=10` and profile `(2,3,3,3,3,3)`. That graph has 24 vertices, 23 edges, is connected by construction, and is a tree. Its independent-set polynomial has degree `alpha=18`; differences through terminal rank 19 give first strict descent `x=8`, with `Delta_8=-78`. Hence `x+2=10` and `3p=30<37=2alpha+1`.

The selected set consists of all 17 original degree-one vertices. Each of the 15 pendant leaves on the five size-three arms contributes `-9409-(-1872)=-7537`. The two leaves on the size-two arm each contribute `-8532-(-3657)=-4875`. Therefore the full selected sum is `15(-7537)+2(-4875)=-122805`. Same-support leaves were counted as separate tagged summands. No selected local term is positive.

I also replayed the supplied family and six-center scripts from scratch copies; the latter's evaluator dependency was copied into scratch and its path changed only to that local copy. Both generated outputs agree exactly with their sealed source JSON. The six-center replay's p=10 balanced check and obstruction check are the same profile, so they are one distinct row cross-check, not two. My separate branch-product derivation independently reproduces the full sorted-family census and selected row.

One scope detail: in the family with `c=1`, the root itself has original degree one. The supplied family script iterates pendant leaves only. I included that root in my degree-one reconstruction and selector check; no `c=1` candidate meets the eligibility guards, so this omission does not affect the claim's sole eligible row or its complete sum. It would matter if the source's per-tree selector values for ineligible rows were used for another purpose.

## Scope and limitations

This finite result concerns only sorted positive arm partitions with `1<=c<=6`, `sum m_i=2p+3-c`, and `p=10..13`. It does not classify all trees with vertex-cover number at most six, establish the low-cover singleton budget, prove a pointwise shell sign, or prove/refute the primary aggregate. No literature theorem was imported. The source's six-center replay has finite generation boundaries and does not enlarge the claim's scope.
