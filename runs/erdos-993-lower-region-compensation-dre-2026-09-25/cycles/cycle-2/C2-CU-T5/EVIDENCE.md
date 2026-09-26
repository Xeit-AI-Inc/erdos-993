# C2-CU-T5 critique evidence

## Inputs and scope

The packet hashes matched for all 27 common listed sources and all 3 C2-T5 case sources. This critique covers exactly `C2-T5-PENDANT-P2-RECURRENCE` and `E993-LOWER-REGION-FIRST-ORDER-SHELL`. The target is the ordinary-tree shell `|T|=2p+2`, with `x(T)+2<=p`, strict `3p<2alpha(T)+1`, fixed original-leaf selector `Delta_p(T-v)<0`, original supports and closed neighborhoods, and one summand per original leaf tag. A local positive summand would not refute the complete-sum target.

## Independent recurrence check

For `T=U plus r-s-v`, split independent sets by membership of `s`. With `s` absent, the choices are an independent set of `U` and either choice of `v`, contributing `(1+z)P`; with `s` present, `r,v` are excluded, contributing `zQ`, where `P=I(U)` and `Q=I(U-r)`. Thus `I(T)=(1+z)P+zQ`. Since `deg(P)=alpha(U)=a` with positive leading coefficient and `deg(Q)<=a`, the first summand has degree `a+1` and its leading coefficient cannot cancel against the second, whose degree is at most `a+1`; hence `alpha(T)=a+1`.

Deleting new leaf `v` leaves `U` with pendant `s` at `r`, so `I(T-v)=P+zQ`. For this original leaf its support is `s`, and deleting `{v,s}` gives `U`; deleting `N_T[s]={r,s,v}` gives `U-r`. Thus `g_v=Delta_(p-1)(P-Q)`. This verifies the recurrence and summand at integer ranks with ordinary zero-extended coefficients. The new selector is precisely `Delta_p(P+zQ)<0`; it is not a rank-`p-1` selector on `U`.

## Shell arithmetic and guard audit

On the first shell `|T|=2p+2`, the parent has `|U|=2p`. The child alpha condition is `3p<2(a+1)+1`, i.e. `3p<2a+3`; the parent condition at rank `p-1` is `3(p-1)<2a+1`, i.e. `3p<2a+4`. The child condition implies the parent condition. The reverse implication does not hold at the integer boundary `3p=2a+3`. This transfer says nothing about the separate first-descent and leaf-selector guards.

The exact `K_(1,4)` diagnostic is internally consistent. Its polynomial is `P=1+5z+6z^2+4z^3+z^4`; rooted at the center, `Q=1+4z+6z^2+4z^3+z^4`. The recurrence gives `I(T)=1+7z+15z^2+16z^3+9z^4+2z^5`. Consecutive differences of `P`, checked with zero extension through the terminal rank, are `4,1,-2,-3,-1`, so `x(U)=2`. Those of `I(T)` are `6,8,1,-7,-7,-2`, so `x(T)=3`. This proves that attachment need not preserve `x`. The example is not an eligible shell instance and is used only to reject an unproved descent-index preservation step.

## Full-sum and proof boundary

The case evidence properly says that the whole-tree recurrence alone supplies no selector correspondence for retained original leaves and no comparison of their recalculated terms with the parent aggregate. Each old leaf has its own deleted-tree polynomial and must be rechecked. The route does not claim that the recurrence proves the aggregate or that a positive local term refutes it. I find no arithmetic, domain, multiplicity, or original-support error in the exact new-leaf formulas. The shell nonclosure conclusion is retained only as a limitation of this proposed recurrence/pruning method; it is not evidence that the registered shell inequality is false.
