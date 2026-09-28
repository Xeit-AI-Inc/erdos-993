# C3-CT-U2 — independent critique

## Coverage and dispositions

This review covers exactly `E993-PATH-STAR-ARITY-2-4-OCCUPANCY-JENSEN-COFACTOR` and `C3-U2-BALANCED-FINITE-COFACTOR-CERTIFICATE` from the C3-U2 case. The first is retained at the registered informal universal scope; the second is retained only as exact bounded evidence on its stated relaxed scalar domain. Neither claim proves a selector clause, actual first descent, selected MASS, or the primary exact-ratio payment.

The occupancy argument uses arbitrary finite disjoint blocks of positive sizes (s_i), (M=\sum_i s_i), and (0\le k\le M). For each (k)-subset (S\subseteq V), let (X_i(S)=1[|S\cap V_i|=1]). Expanding the finite sum over marked block sets (I\), the number of sets with (X_i=1) for all (i\in I) is

\[
\left(\prod_{i\in I}s_i\right)\binom{M-\sum_{i\in I}s_i}{k-|I|}.
\]

The weight \(\prod_{i\in I}1/s_i\) cancels the first factor. Summing over (I\) gives exactly the center-choice expansion of \(H=\prod_i((1+z)^{s_i}+z)\), with out-of-range binomials zero. Hence

\[
H[k]/\binom Mk=\mathbb E_{|S|=k}\prod_i(1+X_i(S)/s_i).
\]

Finite AM–GM on these positive rational weights gives the integer-power inequality

\[
(H[k]/\binom Mk)^{\binom Mk}\ge\prod_i(1+1/s_i)^{s_i\binom{M-s_i}{k-1}}.
\]

Taking logs is optional; when used, \(\log(1+u)\ge 2u/(2+u)\) follows by differentiating, since the derivative of the difference is \(u^2/((1+u)(2+u)^2)\ge0\). Thus the exponent lower bound is

\[
y_k=\sum_i\frac{2s_i}{2s_i+1}\frac{\binom{M-s_i}{k-1}}{\binom Mk}.
\]

For \(y_k\ge0\), \(e^{y_k}\ge\sum_{h=0}^d y_k^h/h!\), so the stated coefficient bound follows. The empty block family is valid at \(M=k=0\); no zero denominator occurs. Nonnegative convolution preserves the bound, with the three exact rows \(GF_2=(1,2), GF_3=(2,5,2), GF_4=(3,9,7,2)\). This closes the mathematical dependency chain informally and supports the registered occupancy claim; the small exhaustive script is only corroboration.

## Balanced exponent and bounded scalar table

Write
\[
g_r(M,k)=\frac{2r}{2r+1}\frac{\binom{M-r}{k-1}}{\binom Mk}.
\]
For \(M\ge10\) and \(M/3\le k\le M-1\), direct factorial cancellation gives
\[
g_2-2g_3+g_4=\frac{4k(M-k)}{315M(M-1)(M-2)(M-3)}f,
\]
where, with \(v=3k-M\),
\[
9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v^2>0.
\]
All terms on the right are nonnegative and the constant is positive. At \(k=M\), all three \(g_r\) vanish. Thus replacing a size-2 and a size-4 block by two size-3 blocks cannot increase the Jensen exponent; iterating leaves adjacent arities. The adjacent-profile formulas in the candidate follow by solving the two linear constraints on branch count and tip count. This minimizes only the Jensen exponent, not an actual cofactor coefficient, parent descent, or selection.

The copied producer evaluator was replayed after copying into this scratch directory. It reports 799,895 states and zero exclusions on \(70\le m\le119\), \(2m\le N\le4m\), \(r\in\{2,3,4\}\), \(2(m-1)\le N-r\le4(m-1)\), and integer \(j\) with \(5j>2N-1\), \(2j\le N-2\). For every shift \(s\) in the relevant \(GF_r\) row it checks \(M=N-r\ge10\) and \(3(j-s)\ge M\). Its exponent floor is downward (floor of (1000E)); its degree-12 Taylor numerator has common positive denominator \(1000^{12}12!\); and its comparison cross-multiplies the exact equivalent of
\[
\sum_s [z^s]GF_r\;\frac{\binom{N-r}{j-s}}{\binom Nj}E_{12}(y_{j-s})>\frac32(N+1-j)\frac{N-2j-1}{j+1}.
\]
This is a relaxed coefficient scalar inequality. These \((N,j)\) values are not asserted to arise from an actual least strict descent or actual profile selectors. No inference is made about actual \(x\), any strict current-\(p\) flag, original tag multiplicities, or the payment inequality.

An independently written exact evaluator using direct `math.comb` ratios and `Fraction` arithmetic is included and run over the same tuple domain; it independently gives 799,895 states, zero exclusions, and exact minimum comparison ratio 112684538106937462073347997540188623037695726373663717/81619490325542400000000000000000000000000000000000000 at (m,N,r,j)=(70,278,2,112). This cross-check supports the finite computation, not the analytic proof or a universal payment result. The producer’s finite table is therefore retained strictly at bounded-evidence grade.

## Lean-ready closure and limits

A clean formal target is the finite-block identity in integer-power form, followed by the coefficient-floor theorem
\[
H[k]\ge\binom Mk E_d(y_k)\quad(0\le k\le M),
\]
with an explicit zero extension and a separate nonnegative-convolution lemma for the listed \(GF_r\). The finite-set bridge is a finite sum over subsets, a count of joint singleton events, and cancellation of \(\prod_{i\in I}s_i\); it needs no probability type or independence assertion. The analytic layer can be split into a log lower bound and the nonnegative exponential Taylor remainder, or the rational-power identity can be formalized first to avoid real powers. The balanced scalar table is a separate exact finite certificate whose iterator/domain equivalence should itself be proved if formalized. No Lean build was run here.

Nothing in this review alters the strict selector definition or the actual least strict descent, and it does not prove payment. Specifically, a cofactor lower bound alone does not cover the exact factor \(1-t+t/\delta\), all three eligible-rank guards, empty selection, or original endpoint/tip multiplicities in the primary claim. The registered occupancy claim remains at informal universal grade; no formal award is proposed.

## Integrity and replay

`integrity_audit.py` checked all 86 common-dispatch member bytes, 3 members in each transport clarification, all 4 C3-CT-U2 dispatch members, the packet hash, and all 8 packet-listed source-file hashes: all matched. This verifies access authority and byte identity, not mathematical correctness.

The producer scripts were copied before execution. From this directory, replay with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 integrity_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 occupancy_identity_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 balanced_finite_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_scalar_check.py
```

The occupancy replay covers 8 profiles, 4,860 subsets, and 56 ranks. No Lean build, source edit, installation, or controller operation was performed.
