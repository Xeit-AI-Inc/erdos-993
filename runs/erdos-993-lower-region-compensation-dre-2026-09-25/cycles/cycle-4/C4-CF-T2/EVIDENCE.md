# Independent audit evidence — C4-T2 neighborhood reduction

## Source integrity

The case packet listed `cycles/cycle-4/C4-T2/REPORT.md` and `RETURN.json`; both SHA-256 values matched. All 179 entries in the common packet's `allowed_source_files` also matched their listed SHA-256 values. The case contains exactly one claim: `C4-T2-NEIGHBORHOOD-REDUCTION`.

## Algebra checked

Fix one selected leaf tag `v`; `H_v` has `n-2` vertices, and `R_v=H_v-W_v`. For each independent `k`-set `A` meeting `W_v`, the addable vertices are the vertices of `H_v` outside `A union N_H(A)`. Since `A` is independent, these are disjoint, so

`e(A)=(n-2)-k-|N_H(A)|`.

Summing over all tagged marked `k`-sets gives `E=((n-2)-k)Q-M`.

For each tagged independent `(k+1)`-set meeting `W_v`, delete one vertex to form a marked `k`-set and count the deleted vertex as its addable extension. If the upper set meets `W_v` once, exactly `k` deletions preserve the mark; if it meets `W_v` at least twice, all `k+1` deletions do. With the report's once-per-tag definition of `C`, this proves `E=kU+C`, including when distinct tags share a support. Also `S=U-Q`, because `q_v(j)=i_j(H_v)-i_j(R_v)` and `k=p-1`. Therefore

`kS=E-C-kQ=((n-2)-2k)Q-M-C=(n-2p)Q-M-C`.

The domains are sound: eligibility gives `p>=2`, hence `k>=1`; `H_v` and `R_v` are finite ordinary induced subgraphs, and all counts are nonnegative integers. The argument applies to the one fixed selector `F`; it does not replace it by a rank-dependent selector. If `n<=2p`, then `Q,M,C>=0` makes `kS<=0`, and division by positive `k` gives `S<=0`.

## Nonvacuity check for the stated order subcase

Let `T=K_{1,20}`. Its independence counts are `i_0=1`, `i_1=21`, and `i_j=binom(20,j)` for `j>=2`. The differences through rank 9 are positive; `Delta_10=binom(20,11)-binom(20,10)<0`, so `x=10`. Set `p=12`: then `x+2<=p` and `3p=36<41=2alpha+1`. For each of its 20 original leaves, deleting that leaf gives `K_{1,19}`, with `Delta_12=binom(19,13)-binom(19,12)<0`; thus all 20 leaves belong to the fixed favorable set. Here `n=21<=24=2p`. The subcase is therefore realizable, including multiple selected leaf tags with the same support.

## Grade and limits

This independently verifies the exact identity and its `n<=2p` consequence. It is not a proof of the contract for `n>2p`, since the identity there still requires `M+C >= (n-2p)Q`. No computation, external theorem, or formal proof was used.
