# C3-T5 search report: the (T_m) coefficient family

## Scope and input checks

I followed the T5 coefficient-mixture route for the primary lower-region aggregate. The common packet contained 115 pinned source paths; all 115 SHA-256 values matched. The case packet listed no additional source files. I used the assigned common coefficient direction for the exact (T_m) polynomials and independently computed the guards and complete sums from those formulas. The computation and its full finite boundary are in `COMPUTE.py`; machine-readable totals and one exact compensation row are in `EVIDENCE.json`.

Write (L=1+z), (B=1+4z+3z^2+z^3=L^3+z). The assigned family formulas give

\[
P=(1+2z)B^m+zL^{3m+1},\quad
D_a=(1+z)B^m+zL^{3m},
\]
\[
D_c=(1+2z)(1+3z+z^2)B^{m-1}+zL^{3m},
\]
\[
q_a=zL^{3m},\qquad q_c=z(2+5z+2z^2)B^{m-1}+zL^{3m}.
\]
Here (D_a,D_c) are the independence polynomials after deleting a leaf in the arm and claw orbits, and (q) is the difference of the two deletion polynomials in that leaf's summand. Thus its summand at rank (p) is exactly
\[
\Delta_{p-1}(H)-\Delta_{p-1}(R)=q_p-q_{p-1}.
\]
This uses the original tagged leaf orbits separately; the all-leaf expression below applies only if the relevant orbit leaves pass the strict selector.

## Exact family reduction

For the arm and claw orbit multiplicities (1) and (3m), respectively, the all-leaf polynomial is
\[
Q_{\rm all}=(3m+1)zL^{3m}+3mz(2+5z+2z^2)B^{m-1}.
\]
When both orbits are favorable, the full selected sum is the exact coefficient difference
\[
S(T_m,p)=[z^p]Q_{\rm all}-[z^{p-1}]Q_{\rm all}.
\]
The degree gives \(\alpha(T_m)=3m+2\); hence the strict lower-region guard reduces to \(p\le2m+1\). The remaining rank window is \(x(T_m)+2\le p\le2m+1\), with \(x(T_m)\) the first strict negative adjacent difference of (P), including the zero-extended terminal check.

The algebraic difference between the two leaf-deletion polynomials is
\[
D_a-D_c=z^3(2+z)B^{m-1}.
\]
This is a useful exact comparison, but taking adjacent differences does not have a fixed sign across all ranks. It therefore does not by itself show that the two orbit selectors agree.

Expanding \(B^{m-1}=\sum_{t=0}^{m-1}\binom{m-1}{t}z^tL^{3(m-1-t)}\), the claw contribution to (Q_{\rm all}) is a positive mixture whose component centers vary with (t). This expansion gives an explicit coefficient target, but no monotonicity or likelihood-ratio conclusion follows just from the component form.

## Bounded exact check

`COMPUTE.py` uses polynomial multiplication and arbitrary-precision integer arithmetic. For each (m=1,\ldots,50), it constructs (P,D_a,D_c,q_a,q_c), calculates (x) from the first negative \(\Delta_j(P)\), and checks every integer (p) obeying both guards. The rank comparisons use zero extension. It independently checks the displayed difference identity for (D_a-D_c).

There were 674 eligible ((m,p)) rows. Both orbits were selected on all 674; all 674 complete sums were strictly negative. For (m=1,2) there are no eligible ranks. These finite checks say nothing about (m>50).

The computation exhibits actual compensation, not just a negative total. At \((m,p)=(22,34)\), \(\alpha=68\), \(x=32\), and \(3p=102<137=2\alpha+1\). Both orbits pass the selector. The arm summand is the positive integer \(212336130412243110\), while each of the 66 claw summands is \(-7560098737536570631\). Consequently the complete sum is \(-498754180547001418536\). This illustrates why a per-leaf sign assertion is unnecessary and why the claw multiplicity matters.

## Exact remaining obligation

This route does not prove the infinite (T_m) theorem. A proof must first classify the arm and claw selector conditions throughout \(x(T_m)+2\le p\le2m+1\), without assuming their finite-horizon coincidence. It must then prove the selected coefficient inequality. In the both-selected case the needed explicit inequality is
\[
(3m+1)\!\left(\binom{3m}{p-1}-\binom{3m}{p-2}\right)
+3m\!\left([z^p]z(2+5z+2z^2)B^{m-1}-[z^{p-1}]z(2+5z+2z^2)B^{m-1}\right)\le0.
\]
If only one orbit is favorable, its own multiplicity-weighted term must instead be evaluated; the both-selected inequality cannot be substituted. No general coefficient inequality or selector theorem is established here, so the primary lower-region claim remains open.
