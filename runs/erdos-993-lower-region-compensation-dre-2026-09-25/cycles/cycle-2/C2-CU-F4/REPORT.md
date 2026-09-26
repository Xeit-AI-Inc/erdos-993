# C2-CU-F4 critique of C2-F4

## Disposition

**retained_narrowed.** The route establishes its stated two-hub family theorem, subject to the exact scope below. It does not establish the universal registered primary aggregate. I found no defect in its coefficient formulas, rank inequalities, selector, support deletions, or multiplicity accounting.

## Audited statement and scope

For each integer `v >= 8`, let `T_v` have adjacent hubs `A,B`, one pendant leaf at `A`, and `v` pendant leaves at `B`. For every integer `p` satisfying the primary guards `x(T_v)+2 <= p` and `3p < 2 alpha(T_v)+1`, the fixed selector is all `v+1` original leaves and their complete sum is nonpositive. This is an infinite, named subfamily result only; it leaves the registered claim for arbitrary ordinary trees open.

## Proof audit

The independence polynomial is correctly obtained by splitting on the hubs:

`I(T_v;z)=(1+z)^v(1+2z)+z+z^2`.

Thus `alpha=v+1`, `i_(v+1)=2`, and the zero-extended terminal difference is `Delta_(v+1)=-2`. The coefficient formula `g_j=binom(v,j)+2 binom(v,j-1)` with the two low-degree corrections is correct. The first three differences are nonnegative for `v>=8`; `c_3-c_2=v(v^2-13)/6-1>0`. For `j>=3`, the displayed ratio difference has numerator `(v+1)^2-j(2j+v+3)`, which decreases with `j`. At `j=ceil(v/2)-2`, it is `13m-1` for `v=2m` and `10m+6` for `v=2m+1`, both positive. Hence `x>=ceil(v/2)-1`, and eligibility gives `k=p-1>=ceil(v/2)`.

The asserted nonvacuity for every `v>=16` also follows: at `j=floor(3v/5)` the ratio numerator is negative under the given bound, so `x<=floor(3v/5)`. Taking `p=x+2` then gives `3p<=3 floor(3v/5)+6<2v+3=2alpha+1` for `v>=16`. This addresses existence of eligible parameters, not just a conditional family theorem.

For the unique `A`-leaf, deleting it gives the star with `v+1` leaves, with polynomial `(1+z)^(v+1)+z`. The eligible lower bound makes `2p>v`, while the strict upper guard gives `p<v`; therefore its selector difference is the negative binomial difference stated by the route. For each `B`-leaf, deletion gives the same two-hub family with `v-1` leaves at `B`. At the relevant ranks `p,p+1>=3`, the low-degree corrections vanish. Its difference has the sign of `v^2-p(2p+v+2)`, which is negative at `p>=ceil(v/2)+1` and remains negative. The upper guard ensures `p<v`, so these coefficient/rank formulas are in range. Thus the fixed strict selector contains every original leaf.

The original support deletions are correctly distinguished. For the `A`-leaf they give a `v`-leaf star versus `v` isolates, so `q(z)=z` and the `k>=4` summand is zero. For a `B`-leaf they give `K_2` plus `v-1` isolates versus one isolate, so `q(z)=(1+2z)(1+z)^(v-1)-(1+z)`. For `j>=2`, its coefficient is `binom(v-1,j)+2 binom(v-1,j-1)`. The adjacent-difference numerator is `v^2-k(v+2)-2k^2`; it is negative at `k=ceil(v/2)` (values `-2m` for `v=2m`, `-5m-4` for `v=2m+1`) and decreases thereafter. Zero extension handles `k>=v`. Every one of the `v` distinct `B`-leaf tags has this same summand, so the complete selected sum is `v(q_p-q_(p-1))<=0`; no support-fiber multiplicity is lost.

The `v=11,p=8` instance is eligible and exactly replays to `x=6`, `alpha=12`, selector differences `-275` and `-185` by leaf class, and full sum `0+11(-255)=-2805`. Exact arithmetic is recorded in `EVIDENCE.md`.

## Limitations

The proof depends on the special two-hub shape with leaf-class sizes `1` and `v`. It gives no argument for arbitrary hub multiplicities, trees with more hubs, or arbitrary ordinary trees. The exact finite row is a check of one instance; the family-wide conclusion comes from the displayed binomial inequalities, not finite enumeration. No imported theorem or standing control is needed for this subfamily proof. The primary aggregate remains unresolved outside this family.
