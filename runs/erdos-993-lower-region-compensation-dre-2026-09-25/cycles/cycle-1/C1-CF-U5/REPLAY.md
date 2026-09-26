# Independent arithmetic replay

For `K_(1,m)`, use `i_j=binom(m,j)+1_{j=1}` for `0<=j<=m+1`, with zero extension. For `m=12`, this gives `x=6`. At `p=8`, `Delta_8(K_(1,11))=i_9-i_8=binom(11,9)-binom(11,8)=55-165=-110`, so every leaf is selected. The two local deletion graphs are `E_11` and the empty graph; their `Delta_7` difference is `binom(11,8)-binom(11,7)=165-330=-165`. Counting the 12 original tags separately gives `S=-1980`.

Reproduction used a small independent Python calculation in the assigned scratch root, based only on `math.comb` and the displayed star polynomial. It asserted the eligibility inequalities and selection value, and checked first descent for `m=6,...,15`. That finite check is only an arithmetic replay; the all-star proof is the symbolic binomial argument in `REPORT.md`.
