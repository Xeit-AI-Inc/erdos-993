# C2-F4 route replay evidence

The source route is an algebraic family proof; no source program was run or copied. I independently recomputed its finite `v=11,p=8` row from the stated binomial coefficient formulas using exact integer arithmetic.

For `v=11`, the coefficients from ranks `0` through `12` are

`1, 14, 78, 275, 660, 1122, 1386, 1254, 825, 385, 121, 23, 2`.

The adjacent differences through rank `11`, followed by the terminal zero-extension difference, are

`13, 64, 197, 385, 462, 264, -132, -429, -440, -264, -98, -21, -2`.

Therefore `x=6`, `alpha=12`, and `p=8` meets `x+2<=p` and `3p=24<25=2alpha+1`. For the `A`-leaf deletion, `Delta_8=C(12,9)-C(12,8)=220-495=-275`. For each `B`-leaf deletion, the applicable coefficient sequence gives `Delta_8=100-285=-185`. Both are strictly negative, so all twelve distinct leaf tags are selected.

At `k=p-1=7`, the `A`-leaf support difference is zero. For each of the eleven `B`-leaf tags, `q_7=C(10,7)+2C(10,6)=120+420=540` and `q_8=C(10,8)+2C(10,7)=45+240=285`, giving `-255`. The complete sum is `11*(-255)=-2805`.

This exact row checks the stated arithmetic only. It is not evidence of exhaustive tree generation or a universal primary resolution.
