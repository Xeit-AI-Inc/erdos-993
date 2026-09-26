# C1-T1 search return

## Scoped result: the primary aggregate holds for stars

Let `T=K_{1,m}` with `m>=4` pendant leaves, and let `p` satisfy the registered eligibility conditions `x(T)+2<=p` and `3p<2 alpha(T)+1`. Then every original leaf is favorable and the complete aggregate is

`S(T,p) = m * (binom(m-1,p) - binom(m-1,p-1)) < 0`.

This is a proof for the star subfamily only. It does not resolve the registered assertion for general ordinary trees.

## Proof

The star has independence polynomial

`I(T,z)=(1+z)^m+z`,

because an independent set either consists only of leaves or is the singleton center. Its independence number is `a=m`. For ranks `j>=2`, `i_j(T)=binom(m,j)`. Also `Delta_0(T)=m>0`, and `Delta_1(T)=binom(m,2)-(m+1)>0` for `m>=4`. The binomial differences then show that the first strict descent is `x(T)=ceil(m/2)`: ranks below `ceil(m/2)` have nonnegative differences (the middle difference is zero when `m` is odd), and the difference at `ceil(m/2)` is negative. This explicitly checks the terminal zero-extension rank as well; the first descent occurs before it.

Eligibility gives `p>=ceil(m/2)+2`. The strict lower-region guard implies `p<m`, since `3p<2m+1` and `p` is integral. Thus `2<=p<=m-1`. Deleting any original leaf gives `T-v=K_{1,m-1}`. At rank `p>=2`, its difference is

`Delta_p(T-v)=binom(m-1,p+1)-binom(m-1,p)<0`,

including `p=m-1` under zero extension. Hence the fixed favorable set is all `m` leaves.

For each such leaf with center support `s`, the graph `T-{v,s}` consists of `m-1` isolated vertices, while `T-N_T[s]` is empty. With `k=p-1>=ceil(m/2)+1`, the summand is

`Delta_k((1+z)^(m-1)) - Delta_k(1)`
`= binom(m-1,k+1)-binom(m-1,k) < 0`.

Here `Delta_k(1)=0` because `k>=1`, and the displayed binomial difference is negative since `k>(m-1)/2`; zero extension covers the endpoint. There are exactly `m` distinct original-leaf tags, all with this same summand, proving the formula and strict sign.

No imported theorem, literature result, or computation is used. This is an exact symbolic argument on the stated family.

## Primary-target gap

The proof uses the star polynomial and the fact that every leaf has the same center support; it supplies no compensation argument across distinct supports or for general trees. The registered global lower-region aggregate therefore remains unresolved here. The auxiliary tagged-incidence identity and its required global deficit budget are also not established by this route.
