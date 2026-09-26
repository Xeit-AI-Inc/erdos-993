# C2-F4 search report

## Result

I prove the primary aggregate on the following infinite family of uneven two-hub trees. Let (T_v), (v\ge 8), have adjacent hubs (A,B), one pendant leaf at (A), and (v) pendant leaves at (B). Then α(T_v)=v+1. For every integer (p) satisfying the primary guards (x(T_v)+2\le p) and (3p<2\alpha(T_v)+1), all (v+1) original leaves are strictly favorable, and every selected summand is nonpositive. Thus (S(T_v,p)\le0). The family has eligible instances for every (v\ge16), as shown below.

This proves only a named subfamily case of `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`; it does not resolve that claim for arbitrary ordinary trees.

## Exact polynomials and the x guard

Use – as usual – (\binom{r}{j}=0) outside (0\le j\le r). Splitting independent sets by whether they use either hub gives

\[
 I(T_v;z)=(1+z)^v(1+2z)+z+z^2,
 \qquad c_j=i_j(T_v)=g_j+\mathbf1_{j=1}+\mathbf1_{j=2},
 \quad g_j=\binom vj+2\binom v{j-1}.
\]

Here (i_{v+1}(T_v)=2), (i_{v+2}(T_v)=0), so the terminal zero-extended difference is \(\Delta_{v+1}(T_v)=-2\); in particular the first strict descent (x(T_v)) exists. For (v\ge8), (c_0,c_1,c_2,c_3) have nonnegative consecutive differences. For (j\ge3), (c_j=g_j>0) while in the relevant range, and

\[
 \frac{g_{j+1}}{g_j}-1=
 \frac{(v+1)^2-j(2j+v+3)}{(j+1)(v+j+1)}.
\]

The numerator is decreasing in (j\ge0). At (j=\lceil v/2\rceil-2) it is (13m-1>0) when (v=2m), and (10m+6>0) when (v=2m+1). The exceptional difference at (j=2) is (c_3-c_2=v(v^2-13)/6-1>0). Thus there is no strict descent before rank \(\lceil v/2\rceil-1\), and

\[
 x(T_v)\ge\lceil v/2\rceil-1,\qquad p\ge x(T_v)+2\Longrightarrow k:=p-1\ge\lceil v/2\rceil.
\]

For nonvacuity at arbitrarily large orders, the displayed ratio numerator is negative at (j=\lfloor3v/5\rfloor\) for every (v\ge16): using (j\ge3v/5-1), its subtracted product is at least \(33v^2/25-14v/5-1>(v+1)^2\). Hence \(x(T_v)\le\lfloor3v/5\rfloor\), and (p=x(T_v)+2) obeys (3p<2v+3=2\alpha(T_v)+1) for every (v\ge16). This supplies an eligible (p) for each such (v).

## The strict selector on every original leaf

Deleting the unique (A)-leaf leaves a star with (v+1) leaves, with polynomial \((1+z)^{v+1}+z\). Since eligible (p\ge\lceil v/2\rceil+1\ge5), its selector difference is

\[
 \Delta_p(T_v-a)=\binom{v+1}{p+1}-\binom{v+1}{p}<0,
\]

because (2p>v).

Deleting any one of the (v) leaves at (B) leaves the same family with (v-1) leaves at (B), whose polynomial is \((1+z)^{v-1}(1+2z)+z+z^2\). At ranks (p,p+1\ge3), its coefficients are (g^{(v-1)}_j=\binom{v-1}{j}+2\binom{v-1}{j-1}). For (p<v),

\[
 \Delta_p(T_v-b)=g^{(v-1)}_{p+1}-g^{(v-1)}_p
 =\frac{v^2-p(2p+v+2)}{(p+1)(v+p)}\,g^{(v-1)}_p<0.
\]

The upper guard implies (p<(2v+3)/3<v) for (v\ge8). The lower bound (p\ge\lceil v/2\rceil+1) makes the numerator negative: for (v=2m), the product (p(2p+v+2)\ge4(m+1)^2>v^2); for (v=2m+1), it is at least ((m+2)(4m+7)>(2m+1)^2). Therefore the strict favorable set is exactly all (v+1) original leaves, counting each of the (v) equal-support-class leaves separately.

## Complete selected sum

For a leaf with original support (s), its summand is (q_{k+1}-q_k), where (q_j=i_j(T_v-\{leaf,s\})-i_j(T_v-N[s])). This is the required difference of the two original-tree deletions, with (k=p-1).

For the (A)-leaf, the two forests are the (v)-leaf star and (v) isolates, so (q(z)=z). Since (k\ge\lceil v/2\rceil\ge4), its summand is zero.

For any (B)-leaf, the two forests are (K_2\sqcup(v-1)K_1) and (K_1). Thus

\[
 q(z)=(1+2z)(1+z)^{v-1}-(1+z),\qquad q_j=\binom{v-1}{j}+2\binom{v-1}{j-1}\quad(j\ge2).
\]

For \(\lceil v/2\rceil\le k<v\),

\[
 \frac{q_{k+1}}{q_k}-1=
 \frac{v^2-k(v+2)-2k^2}{(k+1)(v+k)}<0.
\]

At (k=\lceil v/2\rceil), the numerator is (-2m) for (v=2m), and (-5m-4) for (v=2m+1); it decreases thereafter. For (k\ge v), zero extension gives (q_{k+1}-q_k\le0) as well. Each of the (v) repeated (B)-leaf tags therefore contributes the same nonpositive amount. Since all leaves are in the fixed strict selector, the entire sum is

\[
 S(T_v,p)=0+v(q_{p}-q_{p-1})\le0.
\]

This also explains the full support multiplicity and does not rely on a local term standing in for the aggregate.

## Exact eligible check

For (v=11), the tree has (n=14), \(\alpha=12\), and its complete vector \((i_0,\ldots,i_{12})\) is

\[
 (1,14,78,275,660,1122,1386,1254,825,385,121,23,2).
\]

Its zero-extended differences through rank \(\alpha\) are

\[
 (13,64,197,385,462,264,-132,-429,-440,-264,-98,-21,-2),
\]

so (x=6), including the terminal difference \(\Delta_{12}=-2\). The choice (p=8) is eligible: (x+2=p) and (3p=24<25=2\alpha+1). The deleted-tree selector differences are (-275) for the unique (A)-leaf and (-185) for each of the eleven (B)-leaves, so (F) is the full leaf set. At (k=7), the support differences are (0) for the (A)-leaf and (q_8-q_7=285-540=-255) for each (B)-leaf. Hence the exact complete sum is

\[
 S(T_{11},8)=0+11(-255)=-2805.
\]

The formulas and exact row are replayable using binomial coefficients alone; no enumeration or external theorem is used.

## Limitations

The sign argument uses the two-hub shape with one leaf at the light hub and a single repeated leaf class at the heavy hub. It does not establish a sign theorem for arbitrary uneven hub multiplicities, for trees with three or more hubs, or for the full primary claim. The favorable set was proved exactly only within this stated family. The primary claim remains open outside this subfamily.
