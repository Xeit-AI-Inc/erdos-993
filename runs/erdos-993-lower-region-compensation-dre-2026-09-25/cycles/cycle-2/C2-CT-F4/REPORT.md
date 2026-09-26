# C2-CT-F4 critique of C2-F4

## Disposition

**retained_narrowed.** The route establishes the complete aggregate inequality on its stated uneven two-hub family, for every eligible rank. Its statement is a valid restricted consequence of the registered primary, not a proof for arbitrary ordinary trees. The source claim's assigned ID is covered exactly once below; no universal status is proposed.

## Independent audit

Write the two hubs as A,B, with one pendant leaf at A and v pendant leaves at B. The tree is connected and acyclic, has v+3 vertices, and has independence polynomial

`I(T_v;z)=(1+z)^v(1+2z)+z+z^2`.

The first term accounts for sets omitting both hubs, the `z(1+z)^v` part for sets using A, and `z(1+z)` for sets using B. Thus alpha is v+1, attained by all pendant leaves; no set using a hub is larger. With zero-extended binomial coefficients, `c_j=C(v,j)+2C(v,j-1)+1_{j=1}+1_{j=2}`. The terminal coefficient is `c_(v+1)=2`, followed by zero, so a strict descent exists.

For j>=3 through the nonzero range, `g_j=C(v,j)+2C(v,j-1)` and

`(g_(j+1)/g_j)-1 = ((v+1)^2-j(2j+v+3))/((j+1)(v+j+1))`.

The numerator decreases with j. It is positive at `j=ceil(v/2)-2`: it equals `13m-1` for v=2m and `10m+6` for v=2m+1. The exceptional early difference at j=2 is `v(v^2-13)/6-1>0` for v>=8; at j=0,1 the coefficient differences are also positive. Consequently no strict descent occurs below `ceil(v/2)-1`, hence eligibility implies `p>=ceil(v/2)+1` and `k=p-1>=ceil(v/2)`.

For completeness, eligibility is nonempty for every v>=16: at `j=floor(3v/5)` the same numerator is negative, so `x<=j`; therefore p=x+2 satisfies `3p<=3 floor(3v/5)+6<2v+3=2alpha+1` when v>=16. The source's strict and weak inequalities are used consistently.

Deleting the unique A-leaf gives the star with v+1 leaves, polynomial `(1+z)^(v+1)+z`. At eligible p its difference is `C(v+1,p+1)-C(v+1,p)<0`, since `2p>v+1`. Deleting any one B-leaf gives the same hub family with v-1 B-leaves; at p>=5 the exceptional `z+z^2` terms do not affect the difference. Its difference has the sign of `v^2-p(2p+v+2)`, which is negative at p>=ceil(v/2)+1. Also the upper guard gives p<(2v+3)/3<v for v>=8, so the displayed ratio is within its stated positive-coefficient range. Thus every original leaf is selected by the strict fixed selector. The v B-leaves remain v separate tags despite equal supports.

For the A-leaf, the original deletions give `H=K_(1,v)` and R=v isolates, so `q(z)=I(H)-I(R)=z` and its summand at k>=4 is zero. For each B-leaf, `H=K_2` plus v-1 isolates and R=one isolate, hence

`q(z)=(1+2z)(1+z)^(v-1)-(1+z)`.

For k>=ceil(v/2), `q_(k+1)-q_k` has sign given by `v^2-k(v+2)-2k^2`, negative at the first possible k and strictly decreasing thereafter while k<v. At k>=v, zero extension gives a nonpositive difference (including `q_v=2`, `q_(v+1)=0`). Therefore the full selected sum is `0+v(q_p-q_(p-1))<=0`, with original supports and multiplicities respected. The upper eligibility guard is not needed for this final coefficient sign but is needed above for the deleted-leaf selector and is not dropped.

I independently replayed the v=11,p=8 row using exact integer binomial coefficients. It has alpha=12, x=6 including the terminal difference, strict guards `8=6+2` and `24<25`, selector differences -275 and -185, and complete sum -2805. Details are in EVIDENCE.md. No generation boundary or census is claimed: this is a symbolic family proof plus one exact instance, not an exhaustive tree search.

## Scope and limitations

The source report's two-hub recipe is realizable for every v>=8. The nonvacuity calculation only asserts an eligible p for v>=16; it does not incorrectly imply one for each smaller v. The family proof does not extend to other pendant-leaf multiplicities, additional hubs, or arbitrary trees. It supplies no primary-wide deficit budget and imports no theorem. I found no arithmetic, selector, original-deletion, terminal-rank, realizability, or multiplicity defect in the stated family argument. The registered primary remains open on the evidence reviewed here.
