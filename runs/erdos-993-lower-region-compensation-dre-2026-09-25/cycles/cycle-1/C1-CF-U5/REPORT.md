# C1-CF-U5 critique report

## Disposition

**C1-U5-1 — retained.** The exact support-core polynomial and rooted two-state branch recurrence are valid as stated for ordinary trees of order at least three, and the strict-negativity theorem is valid for every eligible star. This is a representation and a sufficient-class result; it does not establish or refute the registered lower-region aggregate on general trees.

## Audit

Write `C` for the induced graph left after deleting all original leaves and `m_u` for the number of original leaf tags supported at `u`. For an independent core set `X`, the attached leaves at `u` are free precisely if `u` is absent, giving

`I_T(z) = sum_X z^|X| product_(u notin X) (1+z)^m_u`.

For a tag at `s`, deleting that tag changes `m_s` to `m_s-1`, so its selector value is identical to that of every other tag at `s`. If favorable, all `m_s` distinct tags contribute and the total support contribution is `m_s d_s`. When both the tag and `s` are deleted, the other `m_s-1` pendant vertices become isolated, which accounts for `(1+z)^(m_s-1)` in the claimed formula. Deleting `N_T[s]` removes those pendant vertices and every core neighbor of `s`, leaving the neighbor branches with their roots deleted. Thus both local deletion-polynomial formulas respect the original graph operations.

For an oriented decorated branch rooted at `u`, excluding `u` leaves its pendant leaves and each child branch free, so `A^0_(u|s)=(1+z)^m_u product_w A_(w|u)`. Including `u` contributes `z` and excludes its pendant leaves and each child root, giving `A_(u|s)=A^0_(u|s)+z product_w A^0_(w|u)`. These are exact independent-set partitions. Replacing `m_s` by `m_s-1` in the full core formula also evaluates the selector on `T-v`. The recurrence is useful for exact finite evaluation and preserves same-support multiplicity; it supplies no comparison between the selected rank-`p` coefficient on `T-v` and the local rank-`p-1` coefficient difference. Core size and multiplicities remain unbounded, so it is not a finite obstruction reduction or a global sign proof.

## Star theorem and arithmetic replay

For `K_(1,m)`, `I(z)=(1+z)^m+z`. Its zero-extended differences satisfy `Delta_0=m`, `Delta_1=binom(m,2)-(m+1)`, and `Delta_j=binom(m,j+1)-binom(m,j)` for `j>=2`. For `m>=6`, the first two differences are nonnegative; the binomial differences first become negative at `j=m/2` for even `m`, and at `j=(m+1)/2` for odd `m` (the odd middle difference is zero). For `m<=5`, direct coefficient checks leave no rank meeting both guards. The trivial one-vertex star, if included, also has no eligible rank.

Hence every eligible star has `p>=x+2>m/2`. Then `T-v=K_(1,m-1)` has `Delta_p=binom(m-1,p+1)-binom(m-1,p)<0`, so all `m` tags are selected. The two local graphs are respectively `m-1` isolated vertices and the empty graph, hence each summand is `binom(m-1,p)-binom(m-1,p-1)<0`. This proves `S<0` on the eligible star subfamily.

I independently replayed the stated `K_(1,12)` values with exact binomial arithmetic: `a=12`, `x=6`, `p=8`, `3p=24<25=2a+1`; `Delta_8(K_(1,11))=55-165=-110`; each of the twelve distinct leaf tags contributes `binom(11,8)-binom(11,7)=165-330=-165`; therefore `S=12(-165)=-1980`. A direct coefficient loop also matches the displayed first-descent formula for `m=6..15`. This bounded check corroborates the formula; the all-star conclusion follows from the binomial-ratio argument above, not from that finite loop.

## Controls and exact scope

The permitted order-91 `T_22` control has `(a,x,p)=(68,32,34)`, 67 selected leaves, complete sum `-498754180547001418536`, and a positive local summand `+212336130412243110`. The order-243 `T_60` control has `(a,x,p)=(182,87,90)`, 181 selected leaves, complete sum `-1058142362147652597702654588268394677176033202323316960380`, and a positive local summand `+2935177632783649903488454322226807645411570590073000`. Both meet the strict lower-region guard and illustrate that local positivity is compatible with the complete-sum claim. The route proposes no transport or local-sign principle that would conflict with these controls. Its support grouping is an exact identity, not a collapse of distinct tags.

The proof does not use a residual premise, a governed `RTree`, or a theorem about the complementary high-tail region. It does not make a claim about nonsingleton branching cores. No counterexample, exhaustive search, or universal proof is supplied. The registered primary remains open on the evidence audited here.
