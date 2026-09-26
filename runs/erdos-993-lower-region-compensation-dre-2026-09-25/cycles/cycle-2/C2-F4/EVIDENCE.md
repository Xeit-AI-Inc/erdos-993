# C2-F4 evidence

This file records the exact algebra used by the route report. Set (T_v) to the tree with adjacent hubs (A,B), one (A)-leaf, and (v\ge8) (B)-leaves. All binomial coefficients are integer coefficients with zero extension. The report proves the family-wide subclaim; the numbers below give an independent finite check at (v=11,p=8).

## (v=11) exact row

Tree independence vector by rank (0\) through \(\alpha=12\):

`1, 14, 78, 275, 660, 1122, 1386, 1254, 825, 385, 121, 23, 2`

Zero-extended adjacent differences (\Delta_0\) through \(\Delta_{12}\) (including the terminal difference):

`13, 64, 197, 385, 462, 264, -132, -429, -440, -264, -98, -21, -2`

Thus \(x=6\), (\alpha=12), (p=8=x+2), and (3p=24<25=2\alpha+1).

Deletion polynomial/vectors at the ranks relevant to the selector:

- Unique (A)-leaf deletion: ((1+z)^{12}+z); ((i_8,i_9,\Delta_8)=(495,220,-275)).
- Any one (B)-leaf deletion: ((1+z)^{10}(1+2z)+z+z^2); ((i_8,i_9,\Delta_8)=(285,100,-185)).

Both strict selector inequalities hold. There is one tag at support (A), eleven distinct leaf tags at support (B). Their corresponding summands at (k=p-1=7) are:

- (A)-leaf: (q_8-q_7=0), since (q(z)=z).
- Each (B)-leaf: (q_7=540, q_8=285), so summand (-255).

Consequently the complete selected sum is (0+11(-255)=-2805).

## Replay identities

The full-tree coefficient formula is (i_j(T_v)=\binom vj+2\binom v{j-1}+\mathbf1_{j=1}+\mathbf1_{j=2}). The support-difference polynomials are (z) at (A), and ((1+2z)(1+z)^{v-1}-(1+z)) at (B). For (k=p-1\ge\lceil v/2\rceil), the latter coefficient difference has sign equal to

`v^2 - k*(v+2) - 2*k^2`,

which is negative at (k=\lceil v/2\rceil) and strictly decreases as (k) increases. These identities preserve original supports and the multiplicity of the (B)-leaf tags.
