# T4 occupancy evidence

## Fixed-selector weighted rank identity

Fix an ordinary tree `T`, a natural `p`, and the original strict selector
`F=F(T,p)={v original leaf: Delta_p(T-v)<0}`. For every independent set `B`
of `T`, define

`w_F(B)=|{v in F intersect B : N_T(s_v) intersect (B minus {v}) is nonempty}|`.

For each fixed `v in F`, put `H_v=T-{v,s_v}`, `W_v=N_T(s_v) minus {v}`,
and `R_v=H_v-W_v`. Then `q_v(j)=i_j(H_v)-i_j(R_v)` counts the independent
`j`-sets of `H_v` meeting `W_v`. The map `A -> A union {v}` is a bijection
from those sets to the independent `(j+1)`-sets `B` of `T` counted by the
`v`-term in `w_F`: support `s_v` is absent, and at least one other support
neighbor belongs to `A`. Its inverse deletes `v`. This preserves the original
selector throughout. Thus, writing

`Q(j)=sum_(v in F) q_v(j)` and `N_r= i_r(T)`,

`Q(j)=sum_(B independent, |B|=j+1) w_F(B)`.

Since each selected summand in `S` is `q_v(p)-q_v(p-1)`, for `p>=2`:

`S=Q(p-1)-Q(p-2)` would be a rank shift error; the correct expression is
`S=Q(p)-Q(p-1)=sum_(|B|=p+1)w_F(B)-sum_(|B|=p)w_F(B)`.

Here the first equality uses `q_v(p)-q_v(p-1)` directly. Let `mu_r` be the
uniform probability measure on independent `r`-sets of `T`, with expectation
`E_r[w_F]` (take the product `N_r E_r[w_F]` to be zero if `N_r=0`). Then the
exact occupancy form is

`S = N_(p+1) E_(p+1)[w_F] - N_p E_p[w_F]`.

Consequently, the primary inequality is equivalent to the exact aggregate
conditional-expectation comparison

`N_(p+1) E_(p+1)[w_F] <= N_p E_p[w_F]`.

When both ranks have positive counts, this says
`E_(p+1)[w_F]/E_p[w_F] <= N_p/N_(p+1)` if `E_p[w_F]>0`.
It is an aggregate comparison across tags; it does not assert a pointwise
summand sign or a generic negative-association property.

## Proof on the multi-support path class

Let `T=P_n`, `n>=4`, and assume the primary eligibility conditions
`x(P_n)+2<=p` and `3p<2 alpha(P_n)+1`. There are exactly two original leaves,
with distinct supports when `n>=4`. Their deleted-tree profiles agree by
reflection, so the strict selector contains both or neither.

For a path, `i_j(P_m)=binom(m-j+1,j)` on its support and zero outside. The
rank ratio, whenever its denominator is nonzero, is

`i_(j+1)(P_m)/i_j(P_m) = ((m-2j+1)(m-2j))/((j+1)(m-j+1))`.

This ratio decreases with `j` on its positive-rank domain (direct
cross-multiplication), and increases with `m` at fixed `j`: the quotient of
the displayed ratio at `m+1` and `m` is
`(m-2j+2)(m-j+1)/((m-2j)(m-j+2)) > 1` whenever defined. Therefore the first
strict descent index `x(P_m)` is nondecreasing in `m`, and all differences
from that index onward are strictly negative until zero extension makes the
terminal descent and then the zero tail.

The lower-region guard gives `p<alpha(P_n)` and `p<=alpha(P_(n-1))` (if any
eligible `p` exists). Since `p>=x(P_n)+2` and `x(P_(n-1))<=x(P_n)`, it
follows that `Delta_p(P_(n-1))<0`; hence both endpoints belong to the fixed
selector `F`.

For the left endpoint, `H_v=P_(n-2)` and `R_v=P_(n-3)`. The path recurrence
`I(P_m;z)=I(P_(m-1);z)+z I(P_(m-2);z)` gives
`q_v(j)=i_(j-1)(P_(n-4))`. The right endpoint has the same profile. Put
`k=p-1`; then

`S(P_n,p)=2*(i_k(P_(n-4))-i_(k-1)(P_(n-4)))`.

As `p>=x(P_n)+2`, we have `k>=x(P_n)+1`. The ratio at rank `x(P_n)` for
`P_(n-4)` is strictly below one whenever that rank is in range, since the
fixed-rank ratio increases with the path order and
`x(P_n)` is a strict descent rank for `P_n`. The ratio decreases with rank,
so `i_k(P_(n-4))<=i_(k-1)(P_(n-4))` for all such `k`; if `k` lies beyond the
support, the same inequality follows from zero extension (including the
terminal rank). Thus `S(P_n,p)<=0`. Equivalently, this proves the exact
weighted occupancy comparison above on every eligible path, retaining both
selected tags and their distinct supports.

No external theorem is used. The formula and ratio argument are exact. As a
bounded arithmetic cross-check of that formula, the following deterministic
loop covers the path orders `4..150`, using the recipe `P_n` (the simple path
on n vertices), with no random seed. It reports 449 eligible `(n,p)` rows at
117 distinct orders; the minimum and maximum full sums are respectively
`-140598451215242502192647212080` and `-38896`. This finite check is not the
proof and says nothing about branching trees. Replay:

```python
from math import comb
def i(m,j):
    return comb(m-j+1,j) if 0 <= j <= (m+1)//2 else 0
def x(n):
    return next(j for j in range(n+1) if i(n,j+1)-i(n,j)<0)
rows=[]
for n in range(4,151):
    a=(n+1)//2
    for p in range(x(n)+2,a+1):
        if 3*p < 2*a+1:
            k=p-1
            rows.append((n,p,2*(i(n-4,k)-i(n-4,k-1))))
assert len(rows)==449
assert len({n for n,p,s in rows})==117
assert min(s for n,p,s in rows)==-140598451215242502192647212080
assert max(s for n,p,s in rows)==-38896
```

This is a nontrivial multi-support class result, not a proof for branching
trees.
