# A pointwise birth-drift obstruction at an eligible lower-half rank

Evidence grade: exact rational counterexample, independently replayed with a literal ordinary-tree dynamic program. This refutes a proposed pointwise proof mechanism. The aggregate at the same rank is negative.

Use the ordinary path-star with a path of length two and 24 additional branch centers attached to its initial vertex, each with four private leaves. It has 123 vertices, 122 edges, $N=96$, $q=97$, and independence number $98$. Put $L=1+z$, $G=1+2z$, $B_4=L^4+z$, and $C=GB_4^{24}$. The parent is $P=C+zL^{97}$.

Its first strict forward descent is $x=47$. The rank $p=49$ is eligible: $x+2=p$, $3p<2\alpha+1$, and $2p=\alpha$. Thus the aggregate uses $j=p-2=47$. Every one of the 97 original leaves has a strictly negative current-rank deletion difference and is selected.

On the product coefficient space for $C$, take root-factor state zero and branch occupancies consisting of seven ones, eleven twos, and six threes. Their sum is 47 and their product weight is $116095057920000000>0$. For the all-selected mark function write
\[
W=M+B,\qquad M=\sum_i 4F_4(X_i)/B_4(X_i),\qquad
B=97\,1_{X_0=0}\prod_i {4\choose X_i}/B_4(X_i),
\]
where each fraction denotes a ratio of coefficients, not evaluation of the polynomial. Here $F_4=3+3z+z^2$.

At the displayed state, $M=362/15$ and $B=97(4/5)^7=1589248/78125$. The pure-birth rates are 2 at the root, $12/5$ at branch occupation 1, 2 at occupation 2, and 1 at occupation 3. Direct summation gives
\[
\mathcal GW=7\frac{12}{5}\left(-\frac{26}{15}+\frac B4\right)
+11\cdot2\left(-\frac23\right)-2B
=-\frac{3284}{75}+\frac{11}{5}B
=\frac{1132684}{1171875}>0.
\]
Thus pointwise nonpositive full-mark birth drift fails even at an actual eligible lower-half rank with all flags selected. A proof through the generator must retain conditional averaging and its covariance term.

For comparison, the literal-tree aggregate is
\[
131327898242169365477991900
+96(-1943296457365071071025671106)
=-186425132008804653452986434276<0.
\]
The selected MASS slack is $2584152890704633700366386091400>0$. Neither the aggregate nor MASS is refuted by this example. No unrestricted minimality is claimed.

## The sign of the auxiliary binomial-slope expression

On every actual eligible lower-half row of the arity-2–4 family, $x\le j\le\lfloor N/2\rfloor-1$. The binomial parent summand is strictly increasing at $x$, so $\Delta_xP<0$ implies $C[x+1]<C[x]$. Positive-interval log-concavity of $C$ propagates the strict inequality to $j$. Consequently
\[
K_j=(j+1)C[j+1]-(N-j)C[j]
<(2j+1-N)C[j]\le-C[j]<0.
\]
A shortcut requiring $K_j\ge0$ therefore applies to none of the target rows. This sign fact is compatible with a successful averaged covariance argument and with the already verified restricted-family aggregate.
